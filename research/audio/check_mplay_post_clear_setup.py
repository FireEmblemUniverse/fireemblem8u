#!/usr/bin/env python3
"""Verify exact stopped-channel argument copy."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,END=0x080cfd32,0x080cfd34;DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-post-clear-setup';out.mkdir(parents=True,exist_ok=True)
 obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_post_clear_setup.c'),'-o',str(obj),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainPostClearInvoke','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostClearInvoke','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so')],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainPostClearInvoke = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==2 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace))
 rng=random.Random(0xfe8c1ea);values=list(range(256))+[0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(128)];cases=0
 for channel in values:
  for stack in (SP,SP+0x400,SP+0x800,SP+0x1000):
   for initial in range(16):
    regs=[rng.getrandbits(32) for _ in range(13)];regs[4]=channel;expected=regs.copy();expected[0]=channel;memory=bytes([0xa5])*0x4000;flags=(channel>>31)<<3|((channel==0)<<2)
    for uc,trace in machines:
     uc.mem_write(DATA,memory);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
     for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
     uc.reg_write(r.UC_ARM_REG_SP,stack);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,END,count=4)
     assert uc.reg_read(r.UC_ARM_REG_PC)==END
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
     assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
     assert uc.reg_read(r.UC_ARM_REG_SP)==stack and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
     assert bytes(uc.mem_read(DATA,0x4000))==memory and not trace
    cases+=1
 report=dict(cases=cases,matching_instruction_bytes=2,production_integrated=a.production,
             scope='Low-byte values, full-width boundaries/bit patterns/random channel words; all NZCV and four stack positions; exact registers/flags and no memory accesses.',
             limitations='Stops before ClearChain invocation; no complete channel cleanup or MPlayMain execution.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
