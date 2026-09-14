#!/usr/bin/env python3
"""Compare handoff ABI with a synthetic BIOS return, not a BIOS implementation."""
from pathlib import Path
import argparse,json,subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_CODE,UC_HOOK_INTR
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/serial-reset'
parser=argparse.ArgumentParser()
parser.add_argument('--lr-transfer',action='store_true')
args=parser.parse_args()
extra=['-DSERIAL_LR_TRANSFER','-fplugin='+str(OUT/'arm_lr_transfer.so')] if args.lr_transfer else []
subprocess.run(['arm-none-eabi-gcc','-c','-O2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',*extra,str(ROOT/'research/serial/handoff.c'),'-o',str(OUT/'handoff.o')],check=True,capture_output=True)
(OUT/'handoff.ld').write_text('SECTIONS { .text 0x080f0000 : { *(.text) } }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'handoff.ld'),str(OUT/'handoff.o'),'-o',str(OUT/'handoff.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'handoff.elf'),str(OUT/'handoff.bin')],check=True)
rom=(ROOT/'baserom.gba').read_bytes();code=(OUT/'handoff.bin').read_bytes();differences=set()
for seed in range(32):
 results=[]
 for candidate in (False,True):
  u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom);u.mem_map(0x02000000,0x40000);u.mem_map(0x03000000,0x8000)
  if candidate:u.mem_write(0x080f0000,code)
  u.reg_write(r.UC_ARM_REG_CPSR,0x13)
  for n in range(13):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),(0x13579bdf*(seed+n+1))&0xffffffff)
  u.reg_write(r.UC_ARM_REG_SP,0x03007000);u.reg_write(r.UC_ARM_REG_LR,0x08b1a230)
  state={'bios':0,'entry':False}
  def intr(u,number,state):
   pc=u.reg_read(r.UC_ARM_REG_PC);opcode=int.from_bytes(u.mem_read(pc-4,4),'little')
   assert number==2 and opcode==0xef110000,(number,hex(opcode))
   assert u.reg_read(r.UC_ARM_REG_R0)==0x020002b0
   assert u.reg_read(r.UC_ARM_REG_R1)==0x02010000
   state['bios']+=1
   # Deliberately vary synthetic BIOS scratch results; no actual BIOS is emulated.
   for n in (0,1,2,3,12):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),(0x7654321*(seed+n+1))&0xffffffff)
   u.reg_write(r.UC_ARM_REG_CPSR,0x13|((seed%16)<<28))
  def hook(u,address,size,state):
   if address==0x02010000:state['entry']=True;u.emu_stop()
  u.hook_add(UC_HOOK_INTR,intr,state);u.hook_add(UC_HOOK_CODE,hook,state)
  u.emu_start(0x080f0000 if candidate else 0x08b1a244,0,count=100)
  assert state=={'bios':1,'entry':True},state
  regs={f'r{n}':u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(13)}
  regs.update(sp=u.reg_read(r.UC_ARM_REG_SP),lr=u.reg_read(r.UC_ARM_REG_LR),cpsr=u.reg_read(r.UC_ARM_REG_CPSR))
  results.append(regs)
 assert results[0]['lr']==0x02010000 and results[0]['sp']==0x03007000
 mismatch={key for key in results[0] if results[0][key]!=results[1][key]}
 assert mismatch==(set() if args.lr_transfer else {'r12','sp','lr'}),mismatch
 differences.update(mismatch)
print(json.dumps(dict(lr_transfer=args.lr_transfer,cases=32,bios_number='0x11',input='0x020002b0',output_and_entry='0x02010000',candidate_bytes=len(code),candidate_mismatches=sorted(differences),production_integrated=False,scope='Both invoke the correct ARM SVC with correct input/output and reach the ARM entry under synthetic BIOS scratch results. SVC remains assembly-owned; candidate mismatches are listed explicitly. Literal pool placement is not checked. No decompression or actual BIOS behavior is emulated.'),indent=2))
