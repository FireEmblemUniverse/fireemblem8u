#!/usr/bin/env python3
"""Check complete queue draining for mini-animation commands including the real round-end helper."""
import hashlib,json,random,struct,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_WRITE,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
rom=(ROOT/'fireemblem8.gba').read_bytes();original=(ROOT/'baserom.gba').read_bytes()
fields=next(x.split() for x in subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if x.split()[-1]=='EkrUnitMainMini_UpdateAnim')
entry,size=int(fields[0],16),int(fields[1],16);assert rom[entry-0x8000000:entry-0x8000000+size]==original[entry-0x8000000:entry-0x8000000+size]
helper,helper_size=0x0805a580,0x28
assert rom[helper-0x8000000:helper-0x8000000+helper_size]==original[helper-0x8000000:helper-0x8000000+helper_size]
u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x08000000,0x1000000);u.mem_write(0x08000000,rom);u.mem_map(0x02000000,0x40000);u.mem_map(0x03000000,0x8000)
anim=0x02000000;stack=0x03007000;stop=0x08000000;writes=[]
u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,address,size,value,d:writes.append((address,size)))
def check_pc(u,address,instruction_size,data):
 assert entry<=address<entry+size or helper<=address<helper+helper_size,hex(address)
u.hook_add(UC_HOOK_CODE,check_pc)
rng=random.Random(0x5a3dc);excluded={5,13,14};cases=0
scenarios=[]
for command in sorted(set(range(256))-excluded):
 for count in range(8):
  for stopped in (False,True):
   for hit in (False,True):
    scenarios.append(([command]*count,stopped,hit))
for _ in range(512):
 scenarios.append(([rng.choice([0,1,2,3,4,24,0x53,0xff]) for _ in range(rng.randrange(8))],bool(rng.getrandbits(1)),bool(rng.getrandbits(1))))
for queue,stopped,hit in scenarios:
   count=len(queue)
   state=bytearray(rng.randbytes(0x48));state[20]=count;state[21:21+count]=bytes(queue)
   state3=(rng.getrandbits(16)&~8)|(8 if hit else 0);struct.pack_into('<H',state,16,state3)
   state2=0x1000|(0x4000 if stopped else 0)|(rng.getrandbits(12))
   struct.pack_into('<H',state,12,state2);struct.pack_into('<I',state,32,0x02001000)
   expected=state.copy();expected[20]=0;struct.pack_into('<H',expected,12,state2&0xe700)
   cursor=0x02001000
   for command in reversed(queue):
    if command in (3,4):cursor+=4
    if command in (1,2,24):
     struct.pack_into('<H',expected,14,0xfffe)
     if hit:
      struct.pack_into('<H',expected,16,8);struct.pack_into('<H',expected,14,0);cursor+=4
   struct.pack_into('<I',expected,32,cursor)
   if stopped:struct.pack_into('<H',expected,14,0xffff)
   u.mem_write(anim,bytes(state));saved=[rng.getrandbits(32) for _ in range(8)]
   u.reg_write(r.UC_ARM_REG_CPSR,((cases%16)<<28)|0x3f)
   for n,value in enumerate(saved,4):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
   u.reg_write(r.UC_ARM_REG_R0,0x02002000);u.reg_write(r.UC_ARM_REG_R1,anim);u.reg_write(r.UC_ARM_REG_SP,stack);u.reg_write(r.UC_ARM_REG_LR,stop|1)
   writes.clear();u.emu_start(entry|1,stop,count=1000)
   assert u.reg_read(r.UC_ARM_REG_PC)==stop,(queue,count)
   assert bytes(u.mem_read(anim,0x48))==expected,(queue,count,stopped)
   assert u.reg_read(r.UC_ARM_REG_SP)==stack
   assert [u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(4,12)]==saved
   assert all(anim<=a and a+s<=anim+0x48 or stack-64<=a and a+s<=stack for a,s in writes),writes
   cases+=1
report=dict(cases=cases,command_ids=253,mixed_queue_cases=512,helper_entry=hex(helper),helper_bytes=helper_size,queue_sizes=list(range(8)),excluded_helper_commands=sorted(excluded),entry=hex(entry),region_bytes=size,rom_sha256=hashlib.sha256(rom).hexdigest(),source_sha256=hashlib.sha256((ROOT/'src/banim-ekrmainmini.c').read_bytes()).hexdigest(),scope='Entire mini-handler plus original round-end helper executed for 253 byte-valued command IDs, queue sizes 0..7, both hit-effect states and command-only/command-plus-stop states, plus 512 mixed queues. Full Anim result, callee-saved registers, stack and write bounds checked; execution confined to these two functions. Includes unused default IDs. Excludes spell/graphics helpers for commands 5,13,14, frame processing and scheduling.')
(ROOT/'docs/mini-animation-queue-execution.json').write_text(json.dumps(report,indent=2)+'\n');print(cases,'mini queue executions passed')
