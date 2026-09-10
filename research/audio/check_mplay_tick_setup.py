#!/usr/bin/env python3
"""Verify track-loop initialization and its ordered memory reads."""
import argparse, hashlib, itertools, json, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cfbb8;END=0x080cfbc0;DATA=0x02000000;SP=DATA+0x1000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/tick-setup';out.mkdir(parents=True,exist_ok=True);obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_tick_setup.c'),'-o',str(obj),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainTrackLoop','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainTrackLoop'],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainTrackLoop = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';code=binary.read_bytes();assert len(code)==8 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
 rng=random.Random(0xfe871c);cases=0
 players=[DATA+0x100,SP-44,SP,DATA+0x4000-48];tracks=[0,1,0x7fffffff,0x80000000,0xffffffff,DATA,SP,0x12345678]
 for count,player,track,nz in itertools.product(range(256),players,tracks,range(16)):
  memory=bytearray([0xa5])*0x4000;memory[player+8-DATA]=count;memory[player+44-DATA:player+48-DATA]=track.to_bytes(4,'little')
  regs=[rng.getrandbits(32) for _ in range(13)];regs[7]=player;expected=regs.copy();expected[3]=1;expected[4]=0;expected[5]=track;expected[6]=count
  flags=4|(nz&3)
  for uc,trace in machines:
   uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
   for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=5)
   assert uc.reg_read(r.UC_ARM_REG_PC)==END
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
   assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(DATA,0x4000))==memory
   assert trace==[(16,player+8,1,None),(16,player+44,4,None)]
  cases+=1
 report=dict(cases=cases,matching_instruction_bytes=8,production_integrated=a.production,scope='Original and candidate against independent register/read/flag expectations; all byte track counts, four aligned player locations including stack aliases and end of mapped RAM, eight track words, all NZCV, ordered reads and complete RAM/register/SP/LR state.',limitations='Stops at track-loop dispatch; does not dereference track pointers or execute complete MPlayMain.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
