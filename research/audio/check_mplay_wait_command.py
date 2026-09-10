#!/usr/bin/env python3
"""Verify private wait lookup, including shared literal and ordered aliases."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,POOL=0x080cfc72,0x080cfc7c,0x080cfdc4
DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-wait-command';out.mkdir(parents=True,exist_ok=True)
 source=ROOT/'research/audio/mplay_wait_command.c';obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_shared_literal.so'),'-fplugin-arg-thumb_shared_literal-symbol-literal=gClockTable,lt_gClockTable','-fplugin-arg-thumb_shared_literal-omit-pool-alignment','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-after-shared-literals','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-destination=MPlayMainTrackWait','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTrackWait']
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(source),'-o',str(obj)]+options,check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } lt_gClockTable = '+hex(POOL)+'; MPlayMainTrackWait = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==10 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
 rng=random.Random(0xfe8ca10);counts=dict(synthetic=0,original_table=0)
 def case(command,base,target,value,track,initial,synthetic):
  memory=bytearray([0xa5])*0x4000
  if synthetic:memory[target-DATA]=value
  expected_memory=memory.copy();expected_memory[track+1-DATA]=value
  regs=[rng.getrandbits(32) for _ in range(13)];regs[1]=command;regs[5]=track;expected=regs.copy();expected[0]=value;expected[1]=target
  index=(command-128)&0xffffffff;total=index+base
  flags=(target>>31)<<3|((target==0)<<2)|((total>0xffffffff)<<1)|int(bool((~(index^base)&(index^target))&0x80000000))
  for uc,trace in machines:
   uc.mem_write(POOL,base.to_bytes(4,'little'));uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
   for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=8)
   assert uc.reg_read(r.UC_ARM_REG_PC)==END
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,(command,base,target,flags,uc.reg_read(r.UC_ARM_REG_CPSR))
   assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(DATA,0x4000))==expected_memory
   assert trace==[(16,POOL,4,None),(16,target,1,None),(17,track+1,1,value)],trace
  counts['synthetic' if synthetic else 'original_table']+=1
 commands=list(range(256))+[256,65535,0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(128)]
 for command in commands:
  for target in (DATA+0x400,SP,SP-1,DATA+0x3fff):
   base=(target-((command-128)&0xffffffff))&0xffffffff
   for track in (DATA+0x800,SP-1,target-1):
    for initial in range(16):case(command,base,target,command&255,track,initial,True)
 base=int.from_bytes(rom[POOL-0x08000000:POOL-0x08000000+4],'little')
 for command in range(128,177):
  target=base+command-128;value=rom[target-0x08000000]
  for track in (DATA+0x800,SP-1,SP-2,DATA+0x3ffe):
   for initial in range(16):case(command,base,target,value,track,initial,False)
 report=dict(cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=10,production_integrated=a.production,
             scope='Original table for every wait command; synthetic shared pointers covering every command byte and full-width boundaries/random words, all NZCV, all result bytes, stack/boundary and read/write aliases; complete registers, RAM, final ADD flags and ordered literal/read/store trace.',
             limitations='Synthetic cases patch the shared pointer to keep full-width command lookups mapped. Stops before track-wait execution; command guards and full MPlayMain remain outside this fragment.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
