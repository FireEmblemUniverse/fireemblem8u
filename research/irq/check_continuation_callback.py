#!/usr/bin/env python3
"""Compare through callback return and IRQ-mode reentry, before frame restore."""
from pathlib import Path
import argparse,hashlib,json,subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/irq-search'
parser=argparse.ArgumentParser()
parser.add_argument('--source',type=Path,default=ROOT/'research/irq/continuation.c')
args=parser.parse_args()
subprocess.run(['arm-none-eabi-gcc','-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',str(args.source),'-o',str(OUT/'continuation.o')],check=True,capture_output=True)
(OUT/'continuation.ld').write_text('SECTIONS { .text 0x080f0000 : { *(.text) } gIRQHandlers = 0x030030f0; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'continuation.ld'),str(OUT/'continuation.o'),'-o',str(OUT/'continuation.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'continuation.elf'),str(OUT/'continuation.bin')],check=True)
code=(OUT/'continuation.bin').read_bytes();rom=(ROOT/'baserom.gba').read_bytes();words=[int.from_bytes(code[i:i+4],'little') for i in range(0,len(code),4)]
switches=[i for i,x in enumerate(words) if x==0xe129f003];assert len(switches)==2
call=words.index(0xe12fff10);assert words[call-1]==0xe1a0e00f
candidate_return=0x080f0000+4*(call+1);candidate_end=0x080f0000+4*(switches[1]+1)
cases=0
for flags in range(16):
 for slot in range(14):
  for thumb in (False,True):
   snapshots=[];mask=1<<slot if slot<13 else 0
   for candidate in (False,True):
    u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom);u.mem_map(0x02000000,0x40000);u.mem_map(0x03000000,0x8000);u.mem_map(0x04000000,0x1000)
    if candidate:u.mem_write(0x080f0000,code)
    u.mem_write(0x02020000,bytes.fromhex('1eff2fe1'));u.mem_write(0x02021000,bytes.fromhex('7047'))
    target=0x02021001 if thumb else 0x02020000
    u.mem_write(0x030030f0,b''.join(target.to_bytes(4,'little') for _ in range(14)))
    u.reg_write(r.UC_ARM_REG_CPSR,0x1f);u.reg_write(r.UC_ARM_REG_SP,0x03007000);u.reg_write(r.UC_ARM_REG_LR,0x03006000)
    u.reg_write(r.UC_ARM_REG_CPSR,0x92|(flags<<28));u.reg_write(r.UC_ARM_REG_SP,0x03007df0);u.reg_write(r.UC_ARM_REG_LR,0x080ff000)
    for n in range(13):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),n*0x12345)
    u.reg_write(r.UC_ARM_REG_R0,mask);u.reg_write(r.UC_ARM_REG_R1,mask);u.reg_write(r.UC_ARM_REG_R2,slot*4);u.reg_write(r.UC_ARM_REG_R3,0x04000200)
    state={'calls':0}
    def hook(u,address,size,state):
     if address not in (0x02020000,0x02021000):return
     state['calls']+=1
     assert u.reg_read(r.UC_ARM_REG_CPSR)&0xff==(0x3f if thumb else 0x1f)
     assert u.reg_read(r.UC_ARM_REG_SP)==0x03006ffc
     assert u.reg_read(r.UC_ARM_REG_LR)==(candidate_return if candidate else 0x080001f8)
     assert u.reg_read(r.UC_ARM_REG_R1)==0x030030f0+4*slot
     assert int.from_bytes(u.mem_read(0x03006ffc,4),'little')==0x03006000
     for n in (0,1,2,3):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),(n+1)*0x345678)
     # Deliberately preserve r12 to detect the removed scratch-SP copy.
     u.reg_write(r.UC_ARM_REG_CPSR,(u.reg_read(r.UC_ARM_REG_CPSR)&0x0fffffff)|((15-flags)<<28))
    u.hook_add(UC_HOOK_CODE,hook,state)
    u.emu_start(0x080f0000 if candidate else 0x080001cc,candidate_end if candidate else 0x0800020c,count=100)
    assert state['calls']==1
    assert int.from_bytes(u.mem_read(0x04000202,2),'little')==mask
    assert u.reg_read(r.UC_ARM_REG_CPSR)==0x92|((15-flags)<<28)
    assert u.reg_read(r.UC_ARM_REG_SP)==0x03007df0-(4 if candidate else 0)
    snapshots.append([u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(13)]+[u.reg_read(r.UC_ARM_REG_LR),u.reg_read(r.UC_ARM_REG_CPSR)])
    u.reg_write(r.UC_ARM_REG_CPSR,0x1f)
    assert u.reg_read(r.UC_ARM_REG_SP)==0x03007000 and u.reg_read(r.UC_ARM_REG_LR)==0x03006000
   assert snapshots[0]==snapshots[1],('state mismatch',flags,slot,thumb,[(n,hex(a),hex(b)) for n,(a,b) in enumerate(zip(*snapshots)) if a!=b])
   cases+=1
print(json.dumps(dict(cases=cases,arm_cases=cases//2,thumb_cases=cases//2,candidate_bytes=len(code),candidate_sha256=hashlib.sha256(code).hexdigest(),extra_irq_stack_bytes=4,production_integrated=False,scope='Synthetic handlers cover all fourteen table slots and sixteen flag patterns in ARM and Thumb. Acknowledgement, handler lookup, saved/restored System SP/LR, r0-r12 and IRQ LR/CPSR agree through IRQ-mode reentry. Handler-return addresses differ as expected for relocated code; IRQ SP remains four bytes too low. Stops before saved-frame restoration; final return and byte matching remain unverified.'),indent=2))
