#!/usr/bin/env python3
"""Check generated BX handoffs against incoming-register semantics and original code."""
import hashlib,json,random
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/runtime-veneers'
original=(OUT/'original.bin').read_bytes()
registers=[getattr(r,f'UC_ARM_REG_R{n}') for n in range(15)]
rng=random.Random(0xca118)
rows=[]
for target in range(15):
    code=(OUT/f'r{target}.bin').read_bytes()
    assert code==original[target*4:target*4+2]
    cases=0
    for thumb in (False,True):
        for flags in range(16):
            for sample in range(8):
                initial=[rng.getrandbits(32) for _ in range(15)]
                initial[13]=0x03001000+sample*16
                initial[14]=0x080ff001
                destination=0x08002000+sample*4
                initial[target]=destination|int(thumb)
                cpsr=0x3f|(flags<<28)
                results=[]
                for blob in (code,original[target*4:target*4+4]):
                    u=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
                    u.mem_map(0x08000000,0x10000)
                    u.mem_write(0x08001000,blob)
                    u.reg_write(r.UC_ARM_REG_CPSR,cpsr)
                    for reg,value in zip(registers,initial):u.reg_write(reg,value)
                    writes=[]
                    u.hook_add(UC_HOOK_MEM_WRITE,lambda u,a,addr,size,value,data:writes.append((addr,size,value)))
                    u.emu_start(0x08001001,0,count=1)
                    actual=[u.reg_read(reg) for reg in registers]
                    actual_cpsr=u.reg_read(r.UC_ARM_REG_CPSR)
                    assert actual==initial and not writes
                    assert u.reg_read(r.UC_ARM_REG_PC)==destination
                    assert actual_cpsr==(cpsr if thumb else cpsr&~0x20)
                    results.append((actual,actual_cpsr))
                assert results[0]==results[1]
                cases+=1
    rows.append(dict(register=target,cases=cases,transfer_sha256=hashlib.sha256(code).hexdigest()))
report=dict(reference_sha256=hashlib.sha256(original).hexdigest(),probe_receipt_sha256=hashlib.sha256((ROOT/'docs/runtime-register-veneer-probe.json').read_bytes()).hexdigest(),cases=sum(x['cases'] for x in rows),registers=rows,all_r0_r14_preserved=True,no_memory_writes=True,nzcv_preserved=True,arm_and_thumb_destinations=True,scope='One-instruction terminal handoff, including SP/LR destinations. Stops before destination executes. Padding and archive integration are separate checks.')
(ROOT/'docs/runtime-register-veneer-model.json').write_text(json.dumps(report,indent=2)+'\n')
print(f"{report['cases']} incoming-register interworking cases passed")
