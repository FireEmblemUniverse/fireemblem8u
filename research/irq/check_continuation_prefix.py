#!/usr/bin/env python3
"""Check the first mode switch; explicitly diagnoses the draft's extra IRQ save."""
from pathlib import Path
import hashlib,json,subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/irq-search'
subprocess.run(['arm-none-eabi-gcc','-c','-O2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',str(ROOT/'research/irq/continuation.c'),'-o',str(OUT/'continuation.o')],check=True,capture_output=True)
(OUT/'continuation.ld').write_text('SECTIONS { .text 0x080f0000 : { *(.text) } gIRQHandlers = 0x030030f0; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'continuation.ld'),str(OUT/'continuation.o'),'-o',str(OUT/'continuation.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'continuation.elf'),str(OUT/'continuation.bin')],check=True)
code=(OUT/'continuation.bin').read_bytes();rom=(ROOT/'baserom.gba').read_bytes()
words=[int.from_bytes(code[i:i+4],'little') for i in range(0,len(code),4)]
mode_write=words.index(0xe129f003);cases=0
for flags in range(16):
 for bit in range(16):
  mask=1<<bit;initial=0x92|(flags<<28);snapshots=[]
  for candidate in (False,True):
   u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom);u.mem_map(0x03000000,0x8000);u.mem_map(0x04000000,0x1000)
   if candidate:u.mem_write(0x080f0000,code)
   u.reg_write(r.UC_ARM_REG_CPSR,0x1f);u.reg_write(r.UC_ARM_REG_SP,0x03007000);u.reg_write(r.UC_ARM_REG_LR,0x03006000)
   u.reg_write(r.UC_ARM_REG_CPSR,initial);u.reg_write(r.UC_ARM_REG_SP,0x03007df0);u.reg_write(r.UC_ARM_REG_LR,0x080ff000)
   for n in range(13):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),n*0x12345)
   u.reg_write(r.UC_ARM_REG_R0,mask);u.reg_write(r.UC_ARM_REG_R1,mask);u.reg_write(r.UC_ARM_REG_R2,bit*4);u.reg_write(r.UC_ARM_REG_R3,0x04000200)
   writes=[]
   def write(u,access,address,size,value,writes):writes.append((address,size,value))
   u.hook_add(UC_HOOK_MEM_WRITE,write,writes,0x04000000,0x04000fff)
   u.emu_start(0x080f0000 if candidate else 0x080001cc,0x080f0000+4*(mode_write+1) if candidate else 0x080001e0,count=40)
   assert writes==[(0x04000202,2,mask)]
   assert u.reg_read(r.UC_ARM_REG_CPSR)==(initial&~0xdf)|0x1f
   snapshots.append([u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(13)]+[u.reg_read(r.UC_ARM_REG_SP),u.reg_read(r.UC_ARM_REG_LR),u.reg_read(r.UC_ARM_REG_CPSR)])
   assert u.reg_read(r.UC_ARM_REG_SP)==0x03007000 and u.reg_read(r.UC_ARM_REG_LR)==0x03006000
   u.reg_write(r.UC_ARM_REG_CPSR,0x92)
   assert u.reg_read(r.UC_ARM_REG_SP)==0x03007df0-(4 if candidate else 0)
  assert snapshots[0]==snapshots[1],[(n,hex(a),hex(b)) for n,(a,b) in enumerate(zip(*snapshots)) if a!=b]
  cases+=1
print(json.dumps(dict(cases=cases,candidate_bytes=len(code),candidate_sha256=hashlib.sha256(code).hexdigest(),first_mode_write_offset=mode_write*4,extra_irq_stack_bytes=4,production_integrated=False,scope='Original and mixed C/assembly draft match acknowledgement writes and visible registers/CPSR through the first System-mode switch. The draft leaves IRQ SP four bytes too low. Callback transfer, IRQ restoration, final return and overall byte equality are not validated; synthetic masks include high bits solely to test the store.'),indent=2))
