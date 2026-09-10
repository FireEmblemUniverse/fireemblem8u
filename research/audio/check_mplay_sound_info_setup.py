#!/usr/bin/env python3
"""Verify the shared sound-info literal, pointer load, high-register save and fade argument."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cfb9c;END=0x080cfba4;LITERAL=0x080cfdc8;POINTER=0x03007ff0;SP=0x03007000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-entry/info';out.mkdir(parents=True,exist_ok=True);obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_shared_literal.so'),'-fplugin-arg-thumb_shared_literal-literal=0x03007ff0,lt2_SOUND_INFO_PTR','-fplugin-arg-thumb_shared_literal-omit-pool-alignment','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-after-shared-literals','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-destination=MPlayMainFadeInvoke','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainFadeInvoke','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so'),'-fplugin-arg-copy_add_zero-preserve-thumb-high-copies']
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_sound_info_setup.c'),'-o',str(obj)]+options,check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainFadeInvoke = '+hex(END)+'; lt2_SOUND_INFO_PTR = '+hex(LITERAL)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';code=binary.read_bytes();assert len(code)==8 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(0x03000000,0x8000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
 rng=random.Random(0xfe81f0);values=list(range(256))+[0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(128)];cases=0
 for info,player,nz in itertools.product(values,(0,0x80000000,0xffffffff,SP),range(16)):
  memory=bytearray([0xa5])*0x8000;memory[POINTER-0x03000000:POINTER-0x03000000+4]=info.to_bytes(4,'little');regs=[rng.getrandbits(32) for _ in range(13)];regs[7]=player;expected=regs.copy();expected[0]=player;expected[8]=info;flags=(player>>31)<<3|((player==0)<<2)
  for uc,trace in machines:
   uc.mem_write(0x03000000,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
   for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=5)
   assert uc.reg_read(r.UC_ARM_REG_PC)==END
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
   assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(0x03000000,0x8000))==memory and trace==[(16,LITERAL,4,None),(16,POINTER,4,None)]
  cases+=1
 report=dict(cases=cases,matching_instruction_bytes=8,production_integrated=a.production,scope='Original and candidate against independent pointer/argument/register/flag expectations; byte/full-width boundary/bit/random sound-info words, four player words, all NZCV, exact shared literal and IWRAM reads, preserved registers/SP/LR and complete IWRAM.',limitations='Stops before FadeOutBody; does not dereference sound-info or player values or execute complete MPlayMain.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
