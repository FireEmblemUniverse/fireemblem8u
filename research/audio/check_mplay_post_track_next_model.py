#!/usr/bin/env python3
"""Verify an independent model of the original post-track advance block."""
import hashlib,itertools,json,random
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cfda6;EXIT=0x080cfdb0;LOOP=0x080cfd0c;DATA=0x02000000;SP=DATA+0x1000

def signed(x):return x if x<0x80000000 else x-0x100000000

def main():
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000);memory=bytes([0xa5])*0x4000;uc.mem_write(DATA,memory);accesses=[]
 def access(u,kind,address,size,value,user):accesses.append((kind,address,size,value))
 def stop(u,address,size,user):
  if address in (EXIT,LOOP):u.emu_stop()
 uc.hook_add(UC_HOOK_CODE,stop);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access)
 rng=random.Random(0xfe8ad70);counts=list(range(256))+[0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(64)]
 tracks=[0,1,0x7fffffaf,0x7fffffb0,0x7fffffff,0x80000000,0xffffffaf,0xffffffb0,0xffffffb1,0xffffffff];outcomes=dict(count_exit=0,pointer_exit=0,loop=0)
 for count,track,nz in itertools.product(counts,tracks,range(16)):
  regs=[rng.getrandbits(32) for _ in range(13)];regs[2]=count;regs[5]=track;expected=regs.copy();dec=(count-1)&0xffffffff;expected[2]=dec
  flags=((dec>>31)<<3)|((dec==0)<<2)|((count>=1)<<1)|(count==0x80000000)
  target=EXIT;outcome='count_exit'
  if signed(count)>1:
   total=track+80;result=total&0xffffffff;expected[0]=80;expected[5]=result
   overflow=bool((~(track^80)&(track^result))&0x80000000)
   flags=((result>>31)<<3)|((result==0)<<2)|((total>>32)<<1)|overflow
   take=signed(track)+80>0
   assert take==(signed(track)>-80)
   assert take==((flags&4)==0 and bool(flags&8)==bool(flags&1))
   target=LOOP if take else EXIT;outcome='loop' if take else 'pointer_exit'
  uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
  for k,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(k)),v)
  uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);accesses.clear();uc.emu_start(ENTRY|1,0,count=8)
  assert uc.reg_read(r.UC_ARM_REG_PC)==target
  assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(k))) for k in range(13)]==expected
  assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
  assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
  assert not accesses and bytes(uc.mem_read(DATA,0x4000))==memory
  outcomes[outcome]+=1
 report=dict(cases=sum(outcomes.values()),outcomes=outcomes,original_instruction_bytes=10,candidate_matching=False,scope='Original-only independent model: all byte counts, full-width boundaries/random counts, ten pointer boundary values, every NZCV; full registers/CPSR/SP/LR and no memory accesses. Signed pre-overflow pointer sum tested across both wrap boundaries.',limitations='Does not prove a matching C candidate or complete traversal.')
 out=ROOT/'.deps/soundmain-packed/mplay-post-track-next';out.mkdir(parents=True,exist_ok=True);(out/'original-model.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
