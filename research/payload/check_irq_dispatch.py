#!/usr/bin/env python3
"""Check original IRQ entry/search/exit using synthetic ARM and Thumb handlers."""
from pathlib import Path
import argparse,hashlib,json,random,subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
parser=argparse.ArgumentParser()
parser.add_argument('--image',choices=['mgfembp','mgfembp_20030206','mgfembp_20030219'],default='mgfembp')
args=parser.parse_args()
rom=(ROOT/f'mgfembp/{args.image}.bin').read_bytes()
candidate=(ROOT/f'.deps/payload-irq-continuation/{args.image}.bin').read_bytes()
assert len(candidate)==92 and candidate==rom[0x100:0x15c]
callback_return=0x0201012c
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/f'mgfembp/{args.image}.elf')],text=True).splitlines() if len(line.split())==3}
u=Uc(UC_ARCH_ARM,UC_MODE_ARM)
u.mem_map(0x02000000,0x40000);u.mem_map(0x03000000,0x8000);u.mem_map(0x04000000,0x1000)
u.mem_write(0x02010000,rom);u.mem_write(0x02010100,candidate)
u.mem_write(0x02020000,bytes.fromhex('1eff2fe1'));u.mem_write(0x02021000,bytes.fromhex('7047'))
state={}
def code(u,address,size,state):
 if address==0x0203f000:state['returned']=True;u.emu_stop();return
 if address in (0x02020000,0x02021000):
  state['handlers']+=1
  cpsr=u.reg_read(r.UC_ARM_REG_CPSR)
  assert cpsr&0xff==(0x3f if state['thumb'] else 0x1f),hex(cpsr)
  assert u.reg_read(r.UC_ARM_REG_R1)==symbols['gIrqFuncTable']+4*state['slot']
  assert u.reg_read(r.UC_ARM_REG_SP)==0x03006ffc
  assert u.reg_read(r.UC_ARM_REG_LR)==callback_return
  assert int.from_bytes(u.mem_read(0x03006ffc,4),'little')==0x03006000
  frame=[int.from_bytes(u.mem_read(0x03007df0+4*n,4),'little') for n in range(4)]
  assert frame==[state['spsr'],state['ie'],0x04000200,0x0203f000],frame
  for n in (0,1,2,3,12):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),state['scratch'][n])
  u.reg_write(r.UC_ARM_REG_CPSR,(cpsr&0x0fffffff)|state['handler_flags'])
  u.mem_write(0x04000200,b'\x55\xaa')
 state['repeats']=state['repeats']+1 if address==state['last'] else 0;state['last']=address
 if state['repeats']>4:state['halted']=True;u.emu_stop()
def write(u,access,address,size,value,state):
 if 0x04000000<=address<0x04001000:state['mmio'].append((address,size,value))
u.hook_add(UC_HOOK_CODE,code,state);u.hook_add(UC_HOOK_MEM_WRITE,write,state)
rng=random.Random(0x1f92)
words=[(1<<bit)<<16|0xffff for bit in range(16)]+[0,0xffff,0xc000ffff]+[rng.getrandbits(32) for _ in range(4096)]+[(mask<<16)|0xffff for mask in range(0x4000) for mode in range(2)]
outcomes={'returned':0,'halted':0};modes={'arm':0,'thumb':0}
for index,word in enumerate(words):
 ie=word&0xffff;pending=ie&(word>>16)
 priorities=[0xc0,1,2,4,8,0x10,0x20,0x100,0x200,0x400,0x800,0x1000]
 slot,priority=next(((i,m) for i,m in enumerate(priorities) if pending&m),(12,0))
 mask=pending&priority;thumb=bool(index&1)
 flags=((index*7)%16)<<28;spsr=(((index*11)%16)<<28)|(0x3f if index&2 else 0x1f)
 scratch={n:(0x2468ace1*(n+index+1))&0xffffffff for n in (0,1,2,3,12)}
 state.clear();state.update(ie=ie,spsr=spsr,slot=slot,thumb=thumb,scratch=scratch,handler_flags=flags,handlers=0,returned=False,halted=False,last=None,repeats=0,mmio=[])
 u.reg_write(r.UC_ARM_REG_CPSR,0x1f);u.reg_write(r.UC_ARM_REG_SP,0x03007000);u.reg_write(r.UC_ARM_REG_LR,0x03006000)
 u.reg_write(r.UC_ARM_REG_CPSR,0x92|((index%16)<<28));u.reg_write(r.UC_ARM_REG_SP,0x03007e00);u.reg_write(r.UC_ARM_REG_LR,0x0203f000);u.reg_write(r.UC_ARM_REG_SPSR,spsr)
 seeds={n:(0x13579bdf*(n+index+1))&0xffffffff for n in range(13)}
 for n,value in seeds.items():u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
 u.mem_write(0x04000200,word.to_bytes(4,'little'))
 table=[0x02021001 if (n==slot and thumb) else 0x02020000 for n in range(13)]
 u.mem_write(symbols['gIrqFuncTable'],b''.join(x.to_bytes(4,'little') for x in table))
 u.emu_start(0x0201003c,0,count=300)
 if pending&0x2000:
  assert state['halted'] and not state['returned'] and state['handlers']==0 and state['mmio']==[]
  assert u.reg_read(r.UC_ARM_REG_SP)==0x03007df0
  outcomes['halted']+=1;continue
 assert state['returned'] and not state['halted'] and state['handlers']==1
 assert state['mmio']==[(0x04000202,2,mask),(0x04000200,2,ie)],state
 assert int.from_bytes(u.mem_read(0x04000200,2),'little')==ie
 assert u.reg_read(r.UC_ARM_REG_CPSR)==0x92|flags
 assert u.reg_read(r.UC_ARM_REG_SPSR)==spsr
 assert u.reg_read(r.UC_ARM_REG_SP)==0x03007e00 and u.reg_read(r.UC_ARM_REG_LR)==0x0203f000
 expected={**seeds,0:spsr,1:ie,2:scratch[2],3:0x04000200,12:scratch[12]}
 assert all(u.reg_read(getattr(r,f'UC_ARM_REG_R{n}'))==v for n,v in expected.items())
 u.reg_write(r.UC_ARM_REG_CPSR,0x1f)
 assert u.reg_read(r.UC_ARM_REG_SP)==0x03007000 and u.reg_read(r.UC_ARM_REG_LR)==0x03006000
 outcomes['returned']+=1;modes['thumb' if thumb else 'arm']+=1
report=dict(rom_sha256=hashlib.sha256(rom).hexdigest(),cases=len(words),outcomes=outcomes,handler_modes=modes,original_block_sha256=hashlib.sha256(rom[0x3c:0x150]).hexdigest(),scope='Payload IRQ entry/search/exit with synthetic caller-saved handler effects: checks IE acknowledgement/restoration, IRQ/System banked stacks/LRs, saved SPSR restoration, ARM/Thumb handler entry and final registers/flags. Game Pak cases halt without acknowledgement or handler call. Does not emulate hardware interrupt entry, BIOS epilogue, nested interrupts, IF write-one-to-clear hardware or real handlers.')
if candidate is not None:
 report.update(candidate_sha256=hashlib.sha256(candidate).hexdigest(),candidate_bytes=len(candidate),production_integrated=False)
 report['scope']=report['scope'].replace('Payload IRQ entry/search/exit', 'Payload IRQ entry/search with candidate continuation at its original address')
report['image']=args.image
report['enumerated_pending_masks']=16384
report['enumerated_handler_modes_per_mask']=2
report['independent_ie_if_cases']=4096
report['directed_cases']=19
(ROOT/f'docs/payload-irq-dispatch-{args.image}.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
