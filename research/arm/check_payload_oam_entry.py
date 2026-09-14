#!/usr/bin/env python3
"""Verify payload low-OAM entry frame and branch in all three linked versions."""
import hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_ARM
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
regs=[getattr(r,f'UC_ARM_REG_R{n}') for n in range(15)]
rng=random.Random(0x10468);rows=[]
expected={line.split()[1]:line.split()[0] for line in (ROOT/'mgfembp/mgfembp.sha1').read_text().splitlines()}
for name in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
    binary=(ROOT/f'mgfembp/{name}.bin').read_bytes();assert hashlib.sha1(binary).hexdigest()==expected[name+'.bin']
    symbols={p[-1]:int(p[0],16) for line in subprocess.check_output(['arm-none-eabi-nm','-g','-S',str(ROOT/f'mgfembp/{name}.elf')],text=True).splitlines() if len(p:=line.split()) in (3,4)}
    entry=symbols['PutOamLo'];pool=symbols['PutOamLoCursorPointer'];target=symbols['PutOamSharedBody']
    assert entry==pool+4 and symbols['ArmCodeEnd']==entry+12 and target==symbols['PutOamHi']+8
    assert int.from_bytes(binary[pool-0x02010000:entry-0x02010000],'little')==symbols['gOamLoPutIt']
    cases=0
    for flags in range(16):
        for seed in range(8):
            initial=[rng.getrandbits(32) for _ in regs];initial[13]=0x03004000+seed*32
            u=Uc(UC_ARCH_ARM,UC_MODE_ARM);u.mem_map(0x02010000,0x10000);u.mem_write(0x02010000,binary);u.mem_map(0x03000000,0x8000)
            cpsr=0x1f|(flags<<28);u.reg_write(r.UC_ARM_REG_CPSR,cpsr)
            for reg,value in zip(regs,initial):u.reg_write(reg,value)
            u.emu_start(entry,0,count=3)
            expected_regs=initial.copy();expected_regs[13]-=16;expected_regs[7]=symbols['gOamLoPutIt']
            assert [u.reg_read(reg) for reg in regs]==expected_regs
            assert bytes(u.mem_read(expected_regs[13],16))==b''.join(v.to_bytes(4,'little') for v in initial[4:8])
            assert u.reg_read(r.UC_ARM_REG_PC)==target and u.reg_read(r.UC_ARM_REG_CPSR)==cpsr
            cases+=1
    rows.append(dict(image=name,sha1=hashlib.sha1(binary).hexdigest(),entry=hex(entry),cases=cases,c_instruction_bytes=12,c_pointer_bytes=4))
report=dict(images=rows,cases=sum(x['cases'] for x in rows),scope='Three-instruction low-entry boundary only; validates saved r4-r7 frame, cursor, SP, flags, preserved registers and shared-body destination. Entire image checksums match references.',source_sha256=hashlib.sha256((ROOT/'mgfembp/src/put_oam_lo.c').read_bytes()).hexdigest())
(ROOT/'docs/payload-oam-entry.json').write_text(json.dumps(report,indent=2)+'\n');print(report['cases'],'payload entry cases pass')
