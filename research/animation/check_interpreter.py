#!/usr/bin/env python3
"""Execute every recovered motion record against an independent state model."""
import hashlib,json,random,struct,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
sha=lambda b:hashlib.sha256(b).hexdigest()
rom=(ROOT/'fireemblem8.gba').read_bytes();original=(ROOT/'baserom.gba').read_bytes()
symbol=next(x.split() for x in subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if x.split()[-1]=='AnimInterpret')
entry,size=int(symbol[0],16),int(symbol[1],16)
assert rom[entry-0x8000000:entry-0x8000000+size]==original[entry-0x8000000:entry-0x8000000+size]
receipt=json.loads((ROOT/'docs/banim-command-classification.json').read_text())
u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x08000000,0x1000000);u.mem_write(0x08000000,rom)
u.mem_map(0x02000000,0x40000);u.mem_map(0x03000000,0x8000)
anim=0x02000000;script=0x02001000;stack=0x03007000;stop=0x08000000
writes=[]
u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,address,size,value,d:writes.append((address,size)))
rng=random.Random(0x5040);cases=0;tags={};waits={1,2,3,4,5,0x13,0x18,0x2d,0x39,0x52}
for row in receipt['streams_detail']:
 data=(ROOT/row['path'][:-3]).read_bytes();assert sha(data)==row['motion_sha256'];offset=0
 while offset<len(data):
  word=struct.unpack_from('<I',data,offset)[0];tag=word>>24;length=12 if tag==0x86 else 4
  assert tag in (0x80,0x85,0x86)
  state=bytearray(rng.randbytes(0x48));count=cases%7;state[0x14]=count
  struct.pack_into('<I',state,0x20,script);struct.pack_into('<I',state,0x30,0x02020000)
  expected=state.copy();state2=struct.unpack_from('<H',state,12)[0]&0xfff
  cursor=script+length
  if tag==0x80:
   cursor=script;struct.pack_into('<H',expected,6,1);state2|=0x4000
  elif tag==0x85:
   command=word&255;expected[0x15+count]=command;expected[0x14]=count+1
   struct.pack_into('<H',expected,6,1);state2|=0x1000
   if command in waits:cursor=script
  else:
   sheet,oam=struct.unpack_from('<II',data,offset+4)
   struct.pack_into('<H',expected,6,word&65535);expected[0x13]=(word>>16)&255
   struct.pack_into('<I',expected,0x28,sheet);struct.pack_into('<I',expected,0x3c,(0x02020000+oam)&0xffffffff);state2|=0x2000
  struct.pack_into('<H',expected,12,state2);struct.pack_into('<I',expected,0x20,cursor)
  u.mem_write(anim,bytes(state));u.mem_write(script,data[offset:offset+length])
  saved=[rng.getrandbits(32) for _ in range(8)]
  u.reg_write(r.UC_ARM_REG_CPSR,((cases%16)<<28)|0x3f)
  for n,value in enumerate(saved,4):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
  u.reg_write(r.UC_ARM_REG_R0,anim);u.reg_write(r.UC_ARM_REG_SP,stack);u.reg_write(r.UC_ARM_REG_LR,stop|1)
  writes.clear();u.emu_start(entry|1,stop,count=200)
  assert u.reg_read(r.UC_ARM_REG_PC)==stop,(row['path'],offset,'did not return')
  assert bytes(u.mem_read(anim,0x48))==expected,(row['path'],offset,hex(word))
  assert u.reg_read(r.UC_ARM_REG_R0)==0 and u.reg_read(r.UC_ARM_REG_SP)==stack
  assert [u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(4,12)]==saved
  assert all(anim<=a and a+s<=anim+0x48 or stack-64<=a and a+s<=stack for a,s in writes),writes
  cases+=1;tags[hex(tag)]=tags.get(hex(tag),0)+1;offset+=length
report=dict(cases=cases,records_by_tag=tags,streams=len(receipt['streams_detail']),entry=hex(entry),instruction_region_bytes=size,rom_sha256=sha(rom),interpreter_source_sha256=sha((ROOT/'src/animedrv.c').read_bytes()),scope='Every recovered motion record executed independently with randomized Anim fields, rotating valid initial queue sizes 0..6 and flag profiles. Full Anim output, return, callee-saved registers, stack restoration and write bounds checked. Interpreter region matches original ROM. Does not prove scheduling, queue-drain frequency, wait release, handler effects or execution of pointer opcodes absent from these streams.')
(ROOT/'docs/animation-interpreter-execution.json').write_text(json.dumps(report,indent=2)+'\n');print(cases,'motion-record executions passed')
