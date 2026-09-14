#!/usr/bin/env python3
"""Check note argument fragments against original bytes and register/memory models."""
import argparse, hashlib, itertools, json, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
BASE=0x08000000
DATA=0x02000000
PARTS={
 'clear_setup':('ClearSetup',0x080cff84,2,'PlyNoteClearInvoke'),
 'track_volume_setup':('TrackVolumeSetup',0x080cffaa,4,'PlyNoteTrackVolumeInvoke'),
 'pcm_frequency_setup':('PcmFrequencySetup',0x080d0012,6,'PlyNotePcmFrequencyInvoke'),
}

def check(part,a,rom):
 title,entry,size,dest=PARTS[part];end=entry+size
 out=ROOT/'.deps/soundmain-packed/ply-note/arguments'/part;out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/('research/audio/ply_note_'+part+'.c')).read_text();name='PlyNote'+title+'Candidate'
 opts=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-destination='+dest,'-fplugin-arg-tail_transfer-adjacent-destination='+dest,'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so')]
 def compile(label,text=source,options=opts):
  path,asm,obj=[out/(label+ext) for ext in ('.c','.s','.o')];path.write_text(text)
  run=subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(asm)]+options,capture_output=True,text=True)
  (out/(label+'.log')).write_text(run.stdout+run.stderr)
  if not run.returncode:run=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],capture_output=True,text=True)
  return run,obj
 def link(obj,label):
  script,elf,binary=[out/(label+ext) for ext in ('.ld','.elf','.bin')]
  script.write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } '+dest+' = '+hex(end)+'; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  return binary.read_bytes()
 run,obj=compile('candidate');assert not run.returncode,run.stderr
 code=link(obj,'candidate');assert code==rom[entry-BASE:end-BASE],(part,code.hex())
 if a.production:
  assert (ROOT/'fireemblem8.gba').read_bytes()==rom
  assert (ROOT/('src/m4a_ply_note_'+part+'.c')).read_text()==source.replace(name,name.replace('Candidate','Body'))
  assert link(ROOT/('src/m4a_ply_note_'+part+'.o'),'production')==code
 invalid=[('debug',source,opts+['-g']),('unwind',source,opts+['-funwind-tables']),('entry_argument',source.replace(name+'(void)',name+'(u32 arg)'),opts),('wrong_destination',source.replace(dest+'();','OtherDestination();'),opts),('no_destination',source.replace(dest+'();',''),opts),('post_tail_work',source.replace(dest+'();',dest+'(); argR0=1;'),opts)]
 for label,text,options in invalid:
  run,_=compile('reject-'+label,text,options);assert run.returncode,(part,label)
 plain=source.replace('__attribute__((matching_tail_transfer, matching_thumb_copy_add_zero))','')
 run,obj=compile('plain',plain,[]);assert not run.returncode,run.stderr;before=obj.read_bytes()
 run,obj=compile('plain',plain);assert not run.returncode and before==obj.read_bytes(),run.stderr
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(BASE,len(rom));uc.mem_write(BASE,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(entry,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace))
 rng=random.Random(entry);bounds=[0,1,0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[1<<n for n in range(32)]
 # Every incoming flag state, signed/unsigned boundaries, and each bit position.
 # PCM additionally exercises every pitch byte and aliases its read with the frame.
 if part=='pcm_frequency_setup':inputs=itertools.product(range(16),bounds,range(256),range(4))
 else:inputs=itertools.product(range(16),bounds+ [rng.getrandbits(32) for _ in range(256)],range(4),range(4))
 cases=0
 for nz,value,parameter,alias in inputs:
  sp=DATA+0x1000+alias*0x800;regs=[rng.getrandbits(32) for _ in range(13)];memory=bytearray([0xa5])*0x4000;accesses=[]
  if part=='clear_setup':regs[4]=value;expected=regs.copy();expected[0]=value;flagvalue=value
  elif part=='track_volume_setup':
   regs[5]=value;word=rng.getrandbits(32);memory[sp-DATA:sp-DATA+4]=word.to_bytes(4,'little')
   expected=regs.copy();expected[0]=word;expected[1]=value;flagvalue=value;accesses=[(16,sp,4,None)]
  else:
   track=(DATA+0x600,sp-9,sp-8,DATA+0x3fff-9)[alias]
   regs[5]=track;regs[7]=value;regs[3]=bounds[(parameter+alias)%len(bounds)];memory[track+9-DATA]=parameter
   expected=regs.copy();expected[0]=value;expected[1]=regs[3];expected[2]=parameter;flagvalue=value;accesses=[(16,track+9,1,None)]
  flags=((flagvalue>>31)<<3)|((flagvalue==0)<<2)
  for uc,trace in machines:
   uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
   for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
   uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,end,count=8)
   assert uc.reg_read(r.UC_ARM_REG_PC)==end and uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,(part,nz,value,parameter,alias)
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==accesses
  cases+=1
 report=dict(part=part,cases=cases,instruction_bytes=size,rejected_contracts=len(invalid),unannotated_unchanged=True,production_integrated=a.production,source_sha256=hashlib.sha256(source.encode()).hexdigest(),scope='Exact registers/SP/LR/NZCV, unchanged RAM and ordered reads. All incoming NZCV, signed/unsigned boundaries, walking bits and four frame positions; PCM covers every pitch and frame/end-of-RAM aliases.',limitations='Sampled full-width arguments. Stops before calls; no callee behavior or full ply_note validation.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');return report

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');p.add_argument('--part',choices=PARTS);a=p.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 reports=[check(part,a,rom) for part in ([a.part] if a.part else PARTS)]
 result=dict(instruction_bytes=sum(x['instruction_bytes'] for x in reports),cases=sum(x['cases'] for x in reports),parts=reports)
 (ROOT/'.deps/soundmain-packed/ply-note/arguments-report.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':main()
