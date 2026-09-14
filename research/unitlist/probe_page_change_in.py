#!/usr/bin/env python3
"""Measure original-location agbcc candidates without touching production."""
import argparse,hashlib,itertools,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/unitlist-page-in'
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--search',action='store_true');p.add_argument('--clobbers',action='store_true');p.add_argument('--lifetimes',action='store_true');p.add_argument('--row-live',action='store_true');p.add_argument('--row-pointer',action='store_true');a=p.parse_args();OUT.mkdir(exist_ok=True)
 source=(ROOT/'research/unitlist/page_change_in.c').read_text();rom=(ROOT/'baserom.gba').read_bytes();original=rom[0x91f10:0x920c4]
 symbols={v.split()[-1]:int(v.split()[1],16) for v in subprocess.check_output(['arm-none-eabi-readelf','-sW',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(v.split())>=8 and v.split()[0].rstrip(':').isdigit()}
 for name in ('BG_EnableSyncByMask','Proc_Break'):symbols[name]|=1
 targets=('BG_EnableSyncByMask','Proc_Break','gBG0TilemapBuffer','gBG2TilemapBuffer','gUnitlistscreen_0','gUnitlistscreen_1','gUnitlistscreen_11')
 stub=OUT/'thumb-symbols.s';stub.write_text(''.join('.global '+n+'\n.type '+n+', %function\n.thumb_set '+n+', '+hex(symbols[n])+'\n' for n in ('BG_EnableSyncByMask','Proc_Break')))
 stubobj=OUT/'thumb-symbols.o';subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(stub),'-o',str(stubobj)],check=True)
 script=OUT/'probe.ld';script.write_text('SECTIONS { .text 0x08091f10 : { *(.text) } '+ ' '.join(k+' = '+hex(symbols[k])+';' for k in targets[2:])+' }')
 variants=[('baseline',source)]
 if a.search:
  expressions=['r4 & 0x1f','({ int row = r4 & 0x1f; asm("" : "+r"(row)); row; })','({ int row = r4 & 0x1f; asm("" : "+r"(row) :: "r1"); row; })','({ register int row asm("r3") = r4 & 0x1f; asm("" : "+r"(row)); row; })']
  for first,second in itertools.product(range(4),range(len(expressions))):
   text=source
   if first==1:text=text.replace('int temp = r4 & 0x1f;','register int temp asm("r3") = r4 & 0x1f;')
   if first==2:text=text.replace('asm("" ::: "r1");\n                    temp;', 'asm("" : "+r"(temp) :: "r1");\n                    temp;')
   if first==3:text=text.replace('int temp = r4 & 0x1f;','register int temp asm("r3") = r4 & 0x1f;').replace('asm("" ::: "r1");\n                    temp;', 'asm("" : "+r"(temp) :: "r1");\n                    temp;')
   text=text.replace('= gUnitlistscreen_0[r4 & 0x1f][({r5', '= gUnitlistscreen_0['+expressions[second]+'][({r5')
   variants.append((f'variant-{first}-{second}',text))
  for reg in ('r0','r1','r2','r3','r6'):
   for barrier in (False,True):
    text=source.replace('        {\n            for (r4 = proc->unk_3e / 8;', '        {\n            register int column asm("'+reg+'") = r5 + 8;\n'+('            asm("" : "+r"(column));\n' if barrier else '')+'            for (r4 = proc->unk_3e / 8;',1).replace('[r5 + 8]', '[column]',1)
    variants.append(('column-'+reg+('-tie' if barrier else ''),text))
  for tie in ('', 'asm("" : "+r"(pointer));'):
   for reg in ('r0','r2','r3'):
    text=source.replace('gUnitlistscreen_0[r4 & 0x1f][r5 + 8]', '*({ register u16 *pointer asm("'+reg+'") = &gUnitlistscreen_0[r4 & 0x1f][r5 + 8]; '+tie+' pointer; })',1)
    variants.append(('pointer-'+reg+('-tie' if tie else ''),text))
  for tie in ('asm("" :: "r"(row));','asm("" : "+r"(row));','asm("" ::: "r3");'):
   text=source.replace('gUnitlistscreen_0[r4 & 0x1f][({r5 + 0x1c;}) - proc->unk_38]', '*(u16 *)((u8 *)gUnitlistscreen_0 + ({ int row = r4 & 31; int offset = row * 64; '+tie+' offset; }) + ((r5 + 28) - proc->unk_38) * 2)')
   variants.append(('offset-'+str(len(variants)),text))
  for flag in ('-fno-regmove','-fno-schedule-insns','-fno-schedule-insns2','-fno-caller-saves','-fno-strength-reduce'):
   variants.append(('flag'+flag,source))
  variants.append(('old-compiler',source))
 if a.clobbers:
  pieces=source.split('asm("" ::: "r1");');assert len(pieces)==3
  for left,right in itertools.product(range(16),repeat=2):
   def barrier(mask):
    regs=[f'"r{n}"' for n in range(4) if mask&(1<<n)]
    return 'asm(""'+(' ::: '+', '.join(regs) if regs else '')+');'
   variants.append((f'clobber-{left}-{right}',pieces[0]+barrier(left)+pieces[1]+barrier(right)+pieces[2]))
 if a.lifetimes:
  for constraint in ('+r','+&r'):
   for reg in ('','r0','r1','r2','r3'):
    for operand in ('row','r4'):
     decl=('register int offset asm("'+reg+'")' if reg else 'int offset')
     expr='({ int row = r4 & 31; '+decl+' = row * 64; asm("" : "'+constraint+'"(offset) : "r"('+operand+')); offset; })'
     text=source.replace('gUnitlistscreen_0[r4 & 0x1f][r5 + 8]', '*(u16 *)((u8 *)gUnitlistscreen_0 + '+expr+' + (r5 + 8) * 2)').replace('gUnitlistscreen_0[r4 & 0x1f][({r5 + 0x1c;}) - proc->unk_38]', '*(u16 *)((u8 *)gUnitlistscreen_0 + '+expr+' + (r5 + 28 - proc->unk_38) * 2)')
     variants.append(('lifetime-'+str(len(variants)),text))
 if a.row_live:
  needle='gBG0TilemapBuffer[off + r5] = gUnitlistscreen_0[r4 & 0x1f][({r5 + 0x1c;}) - proc->unk_38];'
  for expr in ('r4 & 31','r4','(r4 & 31) * 64'):
   for constraint in ('r','l','g'):
    text=source.replace(needle,needle+' asm("" :: "'+constraint+'"('+expr+'));')
    variants.append(('row-live-'+str(len(variants)),text))
 if a.row_pointer:
  for side in ('forward','reverse'):
   old='gUnitlistscreen_0[r4 & 0x1f]'+('[r5 + 8]' if side=='forward' else '[({r5 + 0x1c;}) - proc->unk_38]')
   col='r5 + 8' if side=='forward' else 'r5 + 28 - proc->unk_38'
   for reg in ('','r0','r1','r2','r3'):
    for constraint in ('+r','+&r'):
     for kind in ('row','address','offset'):
      ty='int' if kind=='offset' else 'u16 *'
      init='(r4 & 31) * 64' if kind=='offset' else ('gUnitlistscreen_0[r4 & 31]' if kind=='row' else '&gUnitlistscreen_0[r4 & 31]['+col+']')
      decl=('register '+ty+' value asm("'+reg+'")' if reg else ty+' value')
      expr='({ '+decl+' = '+init+'; asm("" : "'+constraint+'"(value)); value; })'
      new=expr+'['+col+']' if kind=='row' else ('*'+expr if kind=='address' else '*(u16 *)((u8 *)gUnitlistscreen_0 + '+expr+' + ('+col+') * 2)')
      variants.append(('row-pointer-'+side+'-'+str(len(variants)),source.replace(old,new)))
 reports=[]
 for name,text in variants:
  src=OUT/(name+'.c');src.write_text(text);pp=OUT/(name+'.i');asm=OUT/(name+'.s');obj=OUT/(name+'.o');elf=OUT/(name+'.elf');binary=OUT/(name+'.bin')
  with pp.open('w') as f:subprocess.run(['arm-none-eabi-cpp','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-iquote',str(ROOT),'-nostdinc','-undef',str(src)],stdout=f,check=True)
  run=subprocess.run([str(ROOT/('tools/agbcc/bin/old_agbcc' if name=='old-compiler' else 'tools/agbcc/bin/agbcc')),'-mthumb-interwork','-Wimplicit','-Wparentheses','-Werror','-O2','-fhex-asm','-ffix-debug-line',str(pp),'-o',str(asm)]+([name[4:]] if name.startswith('flag-') else []),capture_output=True,text=True)
  if run.returncode:reports.append(dict(name=name,error=run.stderr));continue
  subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-mthumb-interwork','-I',str(ROOT/'include'),str(asm),'-o',str(obj)],check=True)
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),str(stubobj),'-o',str(elf)],check=True)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();diff=[i for i in range(min(len(code),len(original))) if code[i]!=original[i]]
  reports.append(dict(name=name,size=len(code),matching_bytes=sum(x==y for x,y in zip(code,original)),different_offsets=diff,exact=code==original,source_sha256=hashlib.sha256(text.encode()).hexdigest()))
 (OUT/'probe-report.json').write_text(json.dumps(reports,indent=2)+'\n');print(json.dumps(reports,indent=2))
if __name__=='__main__':main()
