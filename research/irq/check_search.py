#!/usr/bin/env python3
"""Exhaust the IRQ priority masks; excludes IRQ entry/exit and handler execution."""
from pathlib import Path
import argparse,hashlib,json,random,subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/irq-search'
parser=argparse.ArgumentParser()
parser.add_argument('--source',type=Path,default=ROOT/'research/irq/search.c')
parser.add_argument('--handoff-offset',type=int)
parser.add_argument('--check-selected-lr',action='store_true')
parser.add_argument('--cflag',action='append',default=[])
parser.add_argument('--stack-delta',type=int,default=-4)
parser.add_argument('--check-halt-state',action='store_true')
parser.add_argument('--check-state',action='store_true')
args=parser.parse_args()
OUT.mkdir(exist_ok=True)
subprocess.run(['arm-none-eabi-gcc','-c','-O2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',*args.cflag,str(args.source),'-o',str(OUT/'search.o')],check=True,capture_output=True)
(OUT/'search.ld').write_text('SECTIONS { .text 0x080f0000 : { *(.text) } IrqSelected = 0x080ff000; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'search.ld'),str(OUT/'search.o'),'-o',str(OUT/'search.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'search.elf'),str(OUT/'search.bin')],check=True)
rom=(ROOT/'baserom.gba').read_bytes();code=(OUT/'search.bin').read_bytes()
def model(word):
 pending=(word&0xffff)&(word>>16)
 if pending&0x2000:return ('halt',)
 recognized=pending&0x1fff
 mask=recognized&-recognized
 index=mask.bit_length()-1 if mask else 13
 return 'selected',mask,pending,index*4
machines=[]
for candidate in (False,True):
 u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom);u.mem_map(0x03000000,0x8000)
 if candidate:u.mem_write(0x080f0000,code)
 state={}
 def hook(u,address,size,state):
  if address==state['end']:
   state['result']=('selected',u.reg_read(r.UC_ARM_REG_R0),u.reg_read(r.UC_ARM_REG_R1),u.reg_read(r.UC_ARM_REG_R2));u.emu_stop();return
  state['repeats']=state['repeats']+1 if address==state['last'] else 0;state['last']=address
  if state['repeats']>4:state['result']=('halt',);u.emu_stop()
 u.hook_add(UC_HOOK_CODE,hook,state);machines.append((u,state,candidate))
rng=random.Random(0xFE8)
words=[(pending<<16)|0xffff for pending in range(65536)]+[rng.getrandbits(32) for _ in range(4096)]
outcomes={'selected':0,'halt':0};zero=0
for index,word in enumerate(words):
 expected=model(word);states=[]
 for u,state,candidate in machines:
  state.clear();state.update(end=(0x080f0000+args.handoff_offset if args.handoff_offset is not None else 0x080ff000) if candidate else 0x080001cc,last=None,repeats=0,result=None)
  u.reg_write(r.UC_ARM_REG_CPSR,0x13|((index%16)<<28));u.reg_write(r.UC_ARM_REG_SP,0x03007000)
  for n in range(13):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),(0x13579bdf*(index+n+1))&0xffffffff)
  u.reg_write(r.UC_ARM_REG_R2,word);u.reg_write(r.UC_ARM_REG_LR,0x03006000)
  u.emu_start(0x080f0000 if candidate else 0x08000118,0,count=200)
  assert state['result']==expected,(index,hex(word),candidate,state,expected)
  states.append(([u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(13)],u.reg_read(r.UC_ARM_REG_CPSR),u.reg_read(r.UC_ARM_REG_SP),u.reg_read(r.UC_ARM_REG_LR)))
 if args.check_state and expected[0]=='selected':
  assert states[0][:2]==states[1][:2],(index,states)
  assert states[1][2]==states[0][2]+args.stack_delta,(index,states)
 if args.check_selected_lr and expected[0]=='selected':
  assert states[0][3]==states[1][3],(index,states)
 if args.check_halt_state and expected[0]=='halt':
  assert states[0]==states[1],(index,states)
 outcomes[expected[0]]+=1
 if expected[0]=='selected' and expected[1]==0:zero+=1
report=dict(handoff_offset=args.handoff_offset,selected_lr_check=args.check_selected_lr,compiler_flags=args.cflag,expected_stack_delta=args.stack_delta,halt_state_check=args.check_halt_state,source=str(args.source.resolve().relative_to(ROOT)),selected_state_check=args.check_state,cases=len(words),exhaustive_pending_masks=65536,seeded_ie_if_words=4096,outcomes=outcomes,zero_mask_dispatches=zero,candidate_bytes=len(code),candidate_sha256=hashlib.sha256(code).hexdigest(),production_integrated=False,scope='Original and C draft agree with independent lowest-set-bit model on Game Pak halt or acknowledgement mask, pending word and handler-table offset. No recognized pending bit selects offset 52 with mask zero. Optional selected-state checks cover r0-r12/CPSR and the specified candidate stack delta. Optional halt-state checks additionally compare LR and SP. IRQ mode transitions and actual handler execution are not checked; byte matching is checked separately.')
(OUT/'model.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
