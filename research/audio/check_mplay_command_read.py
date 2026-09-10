#!/usr/bin/env python3
"""Verify command/running-status selection with alias-sensitive pointer updates."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,END=0x080cfc24,0x080cfc3a;DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-command-read';out.mkdir(parents=True,exist_ok=True)
 obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_command_read.c'),'-o',str(obj),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainCommandDecode','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainCommandDecode','-fplugin-arg-tail_transfer-raise-unsigned-bound','-fplugin-arg-tail_transfer-raise-unsigned-le-bound'],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainCommandDecode = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==22 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace))
 rng=random.Random(0xfe8c04d);counts=dict(running=0,new_transient=0,new_running=0);aliases=[(DATA+0x400,DATA+0x800),(DATA+0x400,DATA+0x407),(DATA+0x400,DATA+0x440),(SP-64,DATA+0x800),(DATA+0x400,DATA+0x3fff)]
 def check(command,status,initial,track,stream):
  memory=bytearray([status])*0x4000;memory[track+7-DATA]=status;memory[track+64-DATA:track+68-DATA]=stream.to_bytes(4,'little');memory[stream-DATA]=command
  # Self-alias fixtures can change the pointer itself. Derive the effective
  # initial state after construction instead of assuming independent fields.
  pointer=int.from_bytes(memory[track+64-DATA:track+68-DATA],'little');assert DATA<=pointer<DATA+0x4000
  byte=memory[pointer-DATA];running=memory[track+7-DATA];wanted=memory.copy()
  regs=[rng.getrandbits(32) for _ in range(13)];regs[5]=track;expected=regs.copy();expected[2]=pointer
  trace_wanted=[(16,track+64,4,None),(16,pointer,1,None)]
  if byte<128:
   expected[1]=running;flags=8;trace_wanted.append((16,track+7,1,None));role='running'
  else:
   expected[1]=byte;expected[2]=pointer+1;wanted[track+64-DATA:track+68-DATA]=(pointer+1).to_bytes(4,'little');trace_wanted.append((17,track+64,4,pointer+1))
   flags=8 if byte<189 else (6 if byte==189 else 2);role='new_transient' if byte<189 else 'new_running'
   if byte>=189:wanted[track+7-DATA]=byte;trace_wanted.append((17,track+7,1,byte))
  for uc,trace in machines:
   uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
   for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=20)
   assert uc.reg_read(r.UC_ARM_REG_PC)==END
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
   assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(DATA,0x4000))==wanted and trace==trace_wanted
  counts[role]+=1
 for command in range(256):
  for status in range(256):
   for track,stream in aliases:check(command,status,(command+status)&15,track,stream)
 for command in (0,127,128,188,189,255):
  for status in (0,255):
   for initial in range(16):
    for track,stream in aliases:check(command,status,initial,track,stream)
 report=dict(cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=22,production_integrated=a.production,
             scope='Every constructed command/status byte pair across five fixtures, cycling initial flags, plus all-NZCV threshold sweeps. Includes stream/status alias, stream/pointer-field alias, pointer field at SP and final-RAM-byte stream; exact registers, flags, complete RAM and ordered accesses.',
             limitations='Alias fixtures have dependent effective pointer/command/status values, derived after construction. Stops before command decoding or callbacks; not full MPlayMain execution.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
