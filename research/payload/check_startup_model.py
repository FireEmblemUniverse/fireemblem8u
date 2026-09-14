#!/usr/bin/env python3
"""Model startup initialization/restart and expose the draft's extra entry save."""
from pathlib import Path
import argparse,hashlib,json,random,subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
parser=argparse.ArgumentParser();parser.add_argument('--source',type=Path,default=ROOT/'research/payload/startup.c');parser.add_argument('--image',default='mgfembp',choices=['mgfembp','mgfembp_20030206','mgfembp_20030219']);args=parser.parse_args()
rom=(ROOT/f'mgfembp/{args.image}.bin').read_bytes()
original_candidate=(ROOT/f'.deps/payload-startup/{args.image}.bin').read_bytes()
assert original_candidate[:60]==rom[:60] and original_candidate[336:344]==rom[336:344]
source=args.source
symbols={'__sp_irq':0x03007fa0,'__sp_usr':0x03007e00}
rng=random.Random(0xc0fa);cases=0;hashes={}
candidate_base=0x02010000
for thumb in (False,True):
 target=0x02021001 if thumb else 0x02020000
 candidate=bytearray(original_candidate);candidate[340:344]=target.to_bytes(4,'little')
 candidate_return=0x02010030
 hashes['thumb' if thumb else 'arm']=hashlib.sha256(candidate).hexdigest()
 for mode in (0x12,0x13,0x1f):
  for flags in range(16):
   seeds=[rng.getrandbits(32) for _ in range(13)];snapshots=[]
   bank_sp={0x12:0x03006000,0x13:0x03006200,0x1f:0x03006400}
   bank_lr={0x12:0x08040000,0x13:0x08050000,0x1f:0x08060000}
   for draft in (False,True):
    u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x02000000,0x40000);u.mem_write(0x02010000,rom)
    u.mem_map(0x03000000,0x8000)
    u.mem_write(0x02020000,bytes.fromhex('1eff2fe1'));u.mem_write(0x02021000,bytes.fromhex('7047'))
    u.mem_write(0x02010154,target.to_bytes(4,'little'))
    if draft:u.mem_write(candidate_base,bytes(candidate))
    for m in bank_sp:
     u.reg_write(r.UC_ARM_REG_CPSR,m);u.reg_write(r.UC_ARM_REG_SP,bank_sp[m]);u.reg_write(r.UC_ARM_REG_LR,bank_lr[m])
     u.mem_write(bank_sp[m]-32,b'\xa5'*64)
    u.reg_write(r.UC_ARM_REG_CPSR,mode|(flags<<28))
    for n,value in enumerate(seeds):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
    state={'calls':0,'writes':[],'snapshots':[]}
    def write(u,access,address,size,value,state):state['writes'].append((address,size,value))
    def hook(u,address,size,state):
     if address!=(target&~1):return
     state['calls']+=1
     assert u.reg_read(r.UC_ARM_REG_CPSR)==(0x3f if thumb else 0x1f)
     assert u.reg_read(r.UC_ARM_REG_SP)==symbols['__sp_usr']
     assert u.reg_read(r.UC_ARM_REG_LR)==(candidate_return if draft else 0x02010030)
     assert int.from_bytes(u.mem_read(0x03007ffc,4),'little')==0x0201003c
     assert u.reg_read(r.UC_ARM_REG_R0)==0x0201003c and u.reg_read(r.UC_ARM_REG_R1)==target
     state['snapshots'].append([u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(13)])
     if state['calls']==2:u.emu_stop();return
     for n in (0,1,2,3,12):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),0xabcdef00+n)
     u.reg_write(r.UC_ARM_REG_CPSR,u.reg_read(r.UC_ARM_REG_CPSR)|(15-flags)<<28)
    u.hook_add(UC_HOOK_CODE,hook,state);u.hook_add(UC_HOOK_MEM_WRITE,write,state)
    u.emu_start(candidate_base,0,count=100)
    assert state['calls']==2
    expected_writes=[(0x03007ffc,4,0x0201003c)]*2
    assert state['writes']==expected_writes,(draft,state['writes'])
    for m in bank_sp:
     expected=bytearray(b'\xa5'*64)
     assert bytes(u.mem_read(bank_sp[m]-32,64))==expected
    u.reg_write(r.UC_ARM_REG_CPSR,0x12);assert u.reg_read(r.UC_ARM_REG_SP)==symbols['__sp_irq']
    u.reg_write(r.UC_ARM_REG_CPSR,0x13);assert u.reg_read(r.UC_ARM_REG_SP)==bank_sp[0x13]
    snapshots.append(state['snapshots'])
   assert snapshots[0]==snapshots[1], [(entry,n,hex(a),hex(b)) for entry,(left,right) in enumerate(zip(*snapshots)) for n,(a,b) in enumerate(zip(left,right)) if a!=b]
   cases+=1
report=dict(image=args.image,cases=cases,handoffs_per_case=2,initial_modes=['IRQ','Supervisor','System'],flag_profiles=16,handler_modes=['ARM','Thumb'],candidate_sha256=hashlib.sha256(original_candidate).hexdigest(),source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),production_integrated=source.resolve()==ROOT/'mgfembp/src/crt0.c',scope='Original payload and C candidate startup with synthetic ARM/Thumb main return and restart. Checks exact vector writes, register parity, flags, stack banks and untouched initial stack guards. Main target literal is patched for synthetic callbacks. No hardware reset/BIOS or real Main behavior claim.')
(ROOT/f'docs/payload-startup-model-{args.image}.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
