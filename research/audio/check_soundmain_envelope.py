#!/usr/bin/env python3
"""Check envelope C decisions and ordered accesses against original and an independent model."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf604;VOLUME=0x080cf6a4;SKIP=0x080cf8cc;DATA=0x02000000;CHANNEL=DATA+0x400

def expected(initial,channel,wave):
 m=bytearray(initial);trace=[]
 def read(a,n=1):trace.append((16,a,n,None));return int.from_bytes(m[a-DATA:a-DATA+n],'little')
 def write(a,v,n=1):v&=(1<<(8*n))-1;trace.append((17,a,n,v));m[a-DATA:a-DATA+n]=v.to_bytes(n,'little')
 status=read(channel)
 if not status&0xc7:return False,m,trace
 if status&0x80:
  if status&0x40:write(channel,0);return False,m,trace
  status=3;write(channel,status);write(channel+40,wave+16,4);write(channel+24,read(wave+12,4),4)
  level=0;write(channel+9,0);write(channel+28,0,4)
  if read(wave+3)&0xc0:status|=16;write(channel,status)
  mode='attack'
 else:
  level=read(channel+9)
  if status&4:
   length=read(channel+13);write(channel+13,length-1)
   if length<=1:write(channel,0);return False,m,trace
   return True,m,trace
  if status&0x40:
   level=(level*read(channel+7))>>8
   if level>read(channel+12):return True,m,trace
   mode='echo'
  elif status&3==2:
   level=(level*read(channel+5))>>8;sustain=read(channel+6)
   if level>sustain:return True,m,trace
   level=sustain
   if level:write(channel,status-1);return True,m,trace
   mode='echo'
  else:mode='attack' if status&3==3 else 'volume'
 if mode=='echo':
  level=read(channel+12)
  if not level:write(channel,0);return False,m,trace
  write(channel,status|4)
 elif mode=='attack':
  level+=read(channel+4)
  if level>=255:write(channel,status-1)
 return True,m,trace

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/envelope';out.mkdir(exist_ok=True);obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 flags=['-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
 plugin=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_EnvelopeVolume','-fplugin-arg-tail_transfer-destination=SoundMainRAM_EnvelopeSkip','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_shared_literal.so'),'-fplugin-arg-thumb_shared_literal-byte-counter-carry']
 source=ROOT/'research/audio/soundmain_envelope.c'
 subprocess.run([a.compiler,'-c']+flags+plugin+[str(source),'-o',str(obj)],check=True)
 subprocess.run(['arm-none-eabi-ld','-Ttext=0x08001000','--entry=SoundMainRAM_EnvelopeCandidate','--defsym=SoundMainRAM_EnvelopeVolume=0x08001800','--defsym=SoundMainRAM_EnvelopeSkip=0x08001802',str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 machines=[]
 for copied in (False,True):
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(0x03000000,0x8000);uc.mem_map(DATA,0x4000)
   delta=0x03002c60-0x080cf54c if copied else 0;start=(0x03002000 if copied else 0x08001000) if candidate else ENTRY+delta
   uc.mem_write(start,code if candidate else rom[ENTRY-0x08000000:VOLUME-0x08000000]);trace=[]
   def hook(u,kind,address,size,value,user):user.append((kind,address,size,(value&((1<<(8*size))-1)) if kind==17 else None))
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,hook,trace,DATA,DATA+0x3fff)
   machines.append((uc,start,delta,candidate,trace))
 rng=random.Random(0xe17e10);cases=0;regdiff={};flagdiff=0;paths={'skip':0,'volume':0}
 for status in range(256):
  for level in (0,1,127,255):
   for parameter in (0,1,128,255):
    for wave in (DATA+0x2000,CHANNEL-12,CHANNEL):
     for flags_in in range(16):
      m=bytearray([0xa5])*0x4000
      for off in (4,5,6,7,12,13):m[CHANNEL-DATA+off]=parameter
      m[CHANNEL-DATA]=status;m[CHANNEL-DATA+9]=level
      initial=bytes(m);volume,memory,trace_expected=expected(initial,CHANNEL,wave);paths['volume' if volume else 'skip']+=1
      regs=[rng.getrandbits(32) for _ in range(13)];regs[3]=wave;regs[4]=CHANNEL;observed=[]
      for uc,start,delta,candidate,trace in machines:
       uc.mem_write(DATA,initial);trace.clear()
       for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
       uc.reg_write(r.UC_ARM_REG_SP,DATA+0x3000);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags_in<<28)
       end=start+(0x800 if volume else 0x802) if candidate else (VOLUME if volume else SKIP)+delta
       try:uc.emu_start(start|1,end,count=150)
       except Exception as error:raise AssertionError((status,level,parameter,hex(wave),candidate,hex(start),hex(end),hex(uc.reg_read(r.UC_ARM_REG_PC)),trace)) from error
       actual=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)];nzcv=uc.reg_read(r.UC_ARM_REG_CPSR)>>28
       assert uc.reg_read(r.UC_ARM_REG_PC)==end and uc.reg_read(r.UC_ARM_REG_SP)==DATA+0x3000 and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef,(status,level,parameter,wave,candidate,'control')
       assert bytes(uc.mem_read(DATA,0x4000))==memory,(status,level,parameter,wave,candidate,'memory')
       assert trace==trace_expected,(status,level,parameter,wave,candidate,trace,trace_expected)
       for i in (3,4,7,8,9,10,11,12):assert actual[i]==regs[i]
       observed.append((actual,nzcv))
      assert observed[0]==observed[2] and observed[1]==observed[3]
      for i,(x,y) in enumerate(zip(observed[0][0],observed[1][0])):
       if x!=y:regdiff[str(i)]=regdiff.get(str(i),0)+1
      flagdiff+=observed[0][1]!=observed[1][1];cases+=1
 report=dict(cases=cases,machines_per_case=4,paths=paths,original_instruction_bytes=VOLUME-ENTRY,candidate_section_bytes=len(code),register_mismatch_cases=regdiff,flag_mismatch_cases=flagdiff,production_integrated=False,scope='Every status byte, four envelope levels and parameter settings, all NZCV, three wave/channel aliases; independent decisions, complete data memory, ordered accesses and preserved private state.',limitations=['Scratch-register and flag differences are measured, not accepted as matching.','Four representative parameter settings are tested, not every independent envelope-parameter combination. Cycle timing is not modeled.'])
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
 text=source.read_text()
 tests=[('no_frame',text,[x for x in plugin if not x.endswith('-private-frame64')]),('unopted_backwards',text,[x for x in plugin if not x.endswith('-acyclic-branches')]),('loop',text.replace('    envelopeStatus = envelopeChannel->status;','    while (envelopeValue) envelopeValue--;\n    envelopeStatus = envelopeChannel->status;'),plugin),('post_call',text.replace('    SoundMainRAM_EnvelopeSkip();','    SoundMainRAM_EnvelopeSkip(); envelopeValue++;'),plugin),('bare_return',text.replace('    SoundMainRAM_EnvelopeSkip();','    return;'),plugin)]
 for name,text,selected in tests:
  src=out/(name+'.c');src.write_text(text);result=subprocess.run([a.compiler,'-c']+flags+selected+[str(src),'-o',str(src.with_suffix('.o'))],capture_output=True,text=True)
  assert result.returncode and ('tail' in result.stderr or 'plugin' in result.stderr),(name,result.stderr)
 print(f'{len(tests)} invalid acyclic-transfer configurations reject.')
if __name__=='__main__':main()
