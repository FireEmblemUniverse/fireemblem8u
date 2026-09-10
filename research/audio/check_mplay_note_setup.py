#!/usr/bin/env python3
"""Verify exact note-callback setup without executing the callback."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,END=0x080cfc3e,0x080cfc4a;DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-note-setup';out.mkdir(parents=True,exist_ok=True)
 obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_note_setup.c'),'-o',str(obj),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainNoteInvoke','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainNoteInvoke','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so'),'-fplugin-arg-copy_add_zero-preserve-thumb-high-copies'],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainNoteInvoke = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==12 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace))
 rng=random.Random(0xfe8a07e);commands=list(range(256))+[256,65535,0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(128)];cases=0
 for command in commands:
  for info in (DATA+0x400,SP-56,DATA+0x3fc4):
   for player,track in ((0,0),(0xffffffff,0x80000000),(0x80000000,0xffffffff),(DATA+0x400,DATA+0x800)):
    for initial in range(16):
     target=rng.getrandbits(32);memory=bytearray([0xa5])*0x4000;memory[info+56-DATA:info+60-DATA]=target.to_bytes(4,'little')
     regs=[rng.getrandbits(32) for _ in range(13)];regs[1]=command;regs[5]=track;regs[7]=player;regs[8]=info;expected=regs.copy();expected[:4]=[(command-207)&0xffffffff,player,track,target]
     flags=(track>>31)<<3|((track==0)<<2)
     for uc,trace in machines:
      uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
      for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
      uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=10)
      assert uc.reg_read(r.UC_ARM_REG_PC)==END
      assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
      assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
      assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
      assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==[(16,info+56,4,None)]
     cases+=1
 report=dict(cases=cases,matching_instruction_bytes=12,production_integrated=a.production,
             scope='All command bytes plus full-width boundaries/random words; all NZCV; three info aliases, including callback field at SP and final RAM word; zero/high/full-width argument words; exact r0-r12, SP/LR, flags, full RAM and one ordered callback-pointer read.',
             limitations='Stops before BL/callback execution; note-command guard and callback behavior are outside this setup fragment.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
