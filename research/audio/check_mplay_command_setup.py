#!/usr/bin/env python3
"""Verify jump-table command setup and write-before-lookup alias semantics."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,END=0x080cfc54,0x080cfc66;DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-command-setup';out.mkdir(parents=True,exist_ok=True)
 obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_command_setup.c'),'-o',str(obj),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainCommandInvoke','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainCommandInvoke','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so'),'-fplugin-arg-copy_add_zero-preserve-thumb-high-copies'],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainCommandInvoke = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==18 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace))
 rng=random.Random(0xfe8cba5e);commands=[byte|(high<<30) for high in range(4) for byte in range(256)]+[0x7fffffff,0x80000000,0xfffffffe,0xffffffff]
 counts=dict(normal=0,table_at_sp=0,command_at_sp=0,entry_alias=0,table_pointer_alias=0)
 def word(memory,address):return int.from_bytes(memory[address-DATA:address-DATA+4],'little')
 for command in commands:
  index=(command-177)&0xffffffff;scaled=(index<<2)&0xffffffff
  for alias in counts:
   if alias=='table_pointer_alias' and index&3:continue
   info=SP-52 if alias=='table_at_sp' else DATA+0x400;table=DATA+0x2000;player=SP-10 if alias=='command_at_sp' else DATA+0x800
   if alias=='entry_alias':player=((table+scaled)&0xffffffff)-10
   if alias=='table_pointer_alias':player=info+42
   for track in (0,0x80000000,0xffffffff,DATA+0x600):
    for initial in range(16):
     memory=bytearray([0xa5])*0x4000;memory[info+52-DATA:info+56-DATA]=table.to_bytes(4,'little')
     anticipated=memory.copy();anticipated[player+10-DATA]=index&255;effective_table=word(anticipated,info+52);entry=(effective_table+scaled)&0xffffffff
     assert DATA<=entry<=DATA+0x3ffc and not entry&3
     memory[entry-DATA:entry-DATA+4]=rng.getrandbits(32).to_bytes(4,'little');wanted=memory.copy();wanted[player+10-DATA]=index&255
     assert word(wanted,info+52)==effective_table;target=word(wanted,entry)
     regs=[rng.getrandbits(32) for _ in range(13)];regs[1]=command;regs[5]=track;regs[7]=player;regs[8]=info;expected=regs.copy();expected[0]=player;expected[1]=track;expected[3]=target
     flags=(track>>31)<<3|((track==0)<<2);trace_wanted=[(17,player+10,1,index),(16,info+52,4,None),(16,entry,4,None)]
     for uc,trace in machines:
      uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
      for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
      uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=15)
      assert uc.reg_read(r.UC_ARM_REG_PC)==END
      assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected,(command,alias)
      assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
      assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
      assert bytes(uc.mem_read(DATA,0x4000))==wanted and trace==trace_wanted,(command,alias,trace,trace_wanted)
     counts[alias]+=1
 report=dict(cases=sum(counts.values()),fixtures=counts,matching_instruction_bytes=18,production_integrated=a.production,
             scope='Every command byte with all top-two-bit patterns, additional full-width boundaries, all NZCV and four track words; stack aliases plus command-store overlap with table entry or table pointer; exact registers, flags, full RAM and ordered write/read accesses.',
             limitations='Table-pointer overlap is limited to aligned resulting word loads. Stops before callback invocation; command guard, callback behavior and full MPlayMain remain outside this setup fragment.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
