#!/usr/bin/env python3
"""Model payload wrapper boundaries with synthetic BIOS responses, not BIOS internals."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_INTR,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];out=ROOT/'.deps/payload-bios'
parser=argparse.ArgumentParser();parser.add_argument('--byte-receipt',type=Path,default=ROOT/'docs/payload-bios-byte-research.json');parser.add_argument('--json',type=Path,default=ROOT/'docs/payload-bios-model-research.json');args=parser.parse_args()
services={'SwiCpuFastSet':12,'SwiCpuSet':11,'SwiHuffUnCompReadNormal':19,'SwiLZ77UnCompReadNormalWrite16bit':18,'SwiLZ77UnCompReadNormalWrite8bit':17,'SwiRLUnCompReadNormalWrite16bit':21,'SwiRLUnCompReadNormalWrite8bit':20,'SwiSoundBiasReset':25,'SwiSoundBiasSet':25,'SwiVBlankIntrWait':5}
regs=[getattr(r,f'UC_ARM_REG_R{n}') for n in range(15)];rng=random.Random(0xb105);cases=0;reset_cases=0
for image in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 symbols={p[-1]:int(p[0],16) for line in subprocess.check_output(['arm-none-eabi-nm','-g',str(out/(image+'.elf'))],text=True).splitlines() if len(p:=line.split())==3}
 code=(out/(image+'.bin')).read_bytes();start=symbols['SwiCpuFastSet']
 def machine():
  u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x02010000,0x10000);u.mem_write(start,code);u.mem_map(0x03000000,0x8000);u.mem_map(0x04000000,0x1000);return u
 for name,service in services.items():
  for flags in range(16):
   for thumb_return in (0,1):
    for seed in range(2):
     initial=[rng.getrandbits(32) for _ in regs];initial[13]=0x03004000;initial[14]=0x0201f000|thumb_return
     response=[rng.getrandbits(32) for _ in range(4)];response_flags=rng.randrange(16)<<28
     u=machine();u.reg_write(r.UC_ARM_REG_CPSR,0x3f|(flags<<28))
     for reg,value in zip(regs,initial):u.reg_write(reg,value)
     calls=[];returned=[];writes=[]
     def bios(u,number,data):
      assert number==2 and bytes(u.mem_read(u.reg_read(r.UC_ARM_REG_PC)-2,2))==bytes([service,0xdf])
      expected=initial.copy()
      if name=='SwiSoundBiasReset':expected[0]=0
      if name=='SwiSoundBiasSet':expected[0]=1
      if name=='SwiVBlankIntrWait':expected[2]=0
      assert [u.reg_read(reg) for reg in regs]==expected
      calls.append(service)
      for reg,value in zip(regs,response):u.reg_write(reg,value)
      u.reg_write(r.UC_ARM_REG_CPSR,0x3f|response_flags)
     def stop(u,address,size,data):
      if address==0x0201f000:returned.append(True);u.emu_stop()
     u.hook_add(UC_HOOK_INTR,bios);u.hook_add(UC_HOOK_CODE,stop);u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,size,value,data:writes.append((addr,size,value)))
     u.emu_start(symbols[name]|1,0,count=6)
     assert calls==[service] and returned and not writes
     assert [u.reg_read(reg) for reg in regs]==response+initial[4:]
     assert u.reg_read(r.UC_ARM_REG_CPSR)==(0x1f|response_flags|(0x20 if thumb_return else 0))
     cases+=1
 for flags in range(16):
  for seed in range(2):
   u=machine();initial=[rng.getrandbits(32) for _ in regs];initial[13]=0x03004000
   u.reg_write(r.UC_ARM_REG_CPSR,0x3f|(flags<<28))
   for reg,value in zip(regs,initial):u.reg_write(reg,value)
   u.mem_write(0x04000208,b'\xff');calls=[];writes=[]
   def reset(u,number,data):
    assert number==2
    service=int.from_bytes(u.mem_read(u.reg_read(r.UC_ARM_REG_PC)-2,2),'little')&255
    calls.append(service);assert u.reg_read(regs[13])==0x03007f00
    if service==1:
     assert u.reg_read(regs[0])==initial[0] and u.mem_read(0x04000208,1)==b'\0'
     for reg in regs[:4]:u.reg_write(reg,rng.getrandbits(32))
    else:assert service==0;u.emu_stop()
   u.hook_add(UC_HOOK_INTR,reset);u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,size,value,data:writes.append((addr,size,value)))
   u.emu_start(symbols['SwiSoftReset']|1,0,count=10)
   assert calls==[1,0] and writes==[(0x04000208,1,0)]
   assert [u.reg_read(reg) for reg in regs[4:13]]==initial[4:13]
   assert u.reg_read(regs[14])==initial[14];reset_cases+=1
report=dict(returning_wrapper_cases=cases,reset_cases=reset_cases,total_cases=cases+reset_cases,byte_receipt_sha256=hashlib.sha256(args.byte_receipt.read_bytes()).hexdigest(),scope='Synthetic BIOS boundary behavior only. Checks argument setup, service number, return mode, registers/flags and reset stack/MMIO sequence. Stops at reset SWI 0; does not implement BIOS services.')
args.json.write_text(json.dumps(report,indent=2)+'\n');print(report)
