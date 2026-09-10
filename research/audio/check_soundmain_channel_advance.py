#!/usr/bin/env python3
"""Check channel-advance C semantics, including signed branch and wraparound flags."""
import argparse,json,random,subprocess,hashlib
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY=0x080cf8cc;EXIT=0x080cf8d6;LOOP=0x080cf5e4;DATA=0x02000000;SP=DATA+0x1000

def arithmetic_flags(a,b,subtract):
 value=(a-b if subtract else a+b)&0xffffffff
 carry=a>=b if subtract else a+b>0xffffffff
 overflow=((a^b)&(a^value)) if subtract else (~(a^b)&(a^value))
 return ((value>>31)<<3)|((value==0)<<2)|(carry<<1)|((overflow>>31)&1)

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/channel-advance';out.mkdir(exist_ok=True);obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 plugin=ROOT/'.deps/flood-core-new-backend/tail_transfer.so'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-fplugin='+str(plugin),'-fplugin-arg-tail_transfer-destination=SoundMainRAM_DeadlineExit','-fplugin-arg-tail_transfer-destination=SoundMainRAM_ChanLoop','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=SoundMainRAM_DeadlineExit',str(ROOT/'research/audio/soundmain_channel_advance.c'),'-o',str(obj)],check=True)
 subprocess.run(['arm-none-eabi-ld','-Ttext=0x08001000','--entry=SoundMainRAM_ChannelAdvanceCandidate','--defsym=SoundMainRAM_DeadlineExit=0x0800100e','--defsym=SoundMainRAM_ChanLoop=0x08000e00',str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();assert len(code)==14
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 machines=[]
 for copied in (False,True):
  for candidate in (False,True):
   delta=(0x03002000-0x08001000 if candidate else 0x03002c60-0x080cf54c) if copied else 0
   start=(0x08001000 if candidate else ENTRY)+delta
   exits=((0x0800100e if candidate else EXIT)+delta,(0x08000e00 if candidate else LOOP)+delta)
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_map(0x03000000,0x8000);uc.mem_map(DATA,0x4000)
   uc.mem_write(start,code if candidate else rom[ENTRY-0x08000000:EXIT-0x08000000]);trace=[]
   def stop(u,address,size,targets):
    if address in targets:u.emu_stop()
   def access(u,kind,address,size,value,log):log.append((kind,address,size,value if kind==17 else None))
   uc.hook_add(UC_HOOK_CODE,stop,exits);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff)
   machines.append((uc,start,exits,trace))
 rng=random.Random(0xc4ad);counts=[0,1,2,3,127,255,256,0x7ffffffe,0x7fffffff,0x80000000,0x80000001,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(512)]
 cases=0;paths=[0,0]
 for count in counts:
  for channel in (DATA+0x400,0xffffffc0,0x7fffffc0,rng.getrandbits(32)):
   for flags in range(16):
    memory=bytearray([0xa5])*0x4000;memory[SP+4-DATA:SP+8-DATA]=count.to_bytes(4,'little')
    regs=[rng.getrandbits(32) for _ in range(13)];regs[4]=channel;wanted=regs.copy();wanted[0]=(count-1)&0xffffffff
    advance=1<count<0x80000000;paths[advance]+=1
    if advance:wanted[4]=(channel+64)&0xffffffff
    final_flags=arithmetic_flags(channel,64,False) if advance else arithmetic_flags(count,1,True)
    for uc,start,exits,trace in machines:
     uc.mem_write(DATA,bytes(memory));trace.clear()
     for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
     uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
     uc.emu_start(start|1,0,count=20)
     assert uc.reg_read(r.UC_ARM_REG_PC)==exits[advance],(count,channel,'path')
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==wanted,(count,channel,'registers')
     assert uc.reg_read(r.UC_ARM_REG_CPSR)>>28==final_flags,(count,channel,'flags')
     assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
     assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==[(16,SP+4,4,None)]
    cases+=1
 report=dict(cases=cases,machines_per_case=4,exit_cases=paths[0],advance_cases=paths[1],candidate_bytes=len(code),original_bytes=10,production_integrated=False,scope='Full-width boundary/random counts, pointer addition overflow, every initial NZCV, exact register/flag state and ordered frame read in ROM/copied RAM.',limitations=['Random full-width values are sampled. Cycle timing is not modeled. Candidate is four bytes larger than original.'])
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
