#!/usr/bin/env python3
"""Model C move cores across a synthetic monitor response; no BIOS claim."""
import json,random,re,hashlib
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_INTR,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
receipt=ROOT/'docs/runtime-syscall-core-probe.json';probe=json.loads(receipt.read_text())
sites=json.loads((ROOT/'docs/runtime-syscall-inline.json').read_text())['sites']
regs=[getattr(r,f'UC_ARM_REG_R{n}') for n in range(15)]
rng=random.Random(171);cases=0
for row,site in zip(probe['sites'],sites):
    code=bytes.fromhex(row['text_hex']);assert row['core_offset']==0 and code[:8]==bytes.fromhex(site['hex'])
    a,b,d=re.fullmatch(r'mov r0, (\w+); mov r1, (\w+); swi 171; mov (\w+), r0',site['assembly']).groups()
    a=int(a[1:]);b=13 if b=='sp' else int(b[1:]);d=int(d[1:])
    for flags in range(16):
        for value in (0,1,0x7fffffff,0x80000000,0xffffffff,rng.getrandbits(32),rng.getrandbits(32),rng.getrandbits(32)):
            initial=[rng.getrandbits(32) for _ in regs];initial[13]=0x03004000
            cpsr=(flags<<28)|0x3f;returned_r1=rng.getrandbits(32);returned_lr=rng.getrandbits(32)
            service_flags=rng.randrange(16)<<28
            u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x08000000,0x1000);u.mem_write(0x08000000,code)
            u.reg_write(r.UC_ARM_REG_CPSR,cpsr)
            for reg,v in zip(regs,initial):u.reg_write(reg,v)
            writes=[];calls=[]
            u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,size,v,data:writes.append((addr,size,v)))
            def service(u,number,data):
                assert number==2
                assert u.reg_read(regs[0])==initial[a] and u.reg_read(regs[1])==initial[b]
                last=initial[a] if b==13 else initial[b]
                assert u.reg_read(r.UC_ARM_REG_CPSR)==(0x3f|(last&0x80000000)|(0x40000000 if last==0 else 0))
                calls.append(True)
                u.reg_write(regs[0],value);u.reg_write(regs[1],returned_r1);u.reg_write(regs[14],returned_lr)
                u.reg_write(r.UC_ARM_REG_CPSR,0x3f|service_flags)
            u.hook_add(UC_HOOK_INTR,service)
            u.emu_start(0x08000001,0,count=4)
            expected=initial.copy();expected[0]=value;expected[1]=returned_r1;expected[14]=returned_lr;expected[d]=value
            expected_flags=service_flags if d>=8 else (value&0x80000000)|(0x40000000 if value==0 else 0)
            assert calls==[True] and not writes
            assert [u.reg_read(reg) for reg in regs]==expected
            assert u.reg_read(r.UC_ARM_REG_CPSR)==0x3f|expected_flags
            cases+=1
report=dict(cases=cases,probe_sha256=hashlib.sha256(receipt.read_bytes()).hexdigest(),all_registers_and_flags_match_model=True,no_memory_writes=True,scope='Four-instruction core only; synthetic monitor changes r0/r1/LR/NZCV. Does not execute wrapper return or model real monitor behavior.')
(ROOT/'docs/runtime-syscall-core-model.json').write_text(json.dumps(report,indent=2)+'\n');print(cases,'core-model cases passed')
