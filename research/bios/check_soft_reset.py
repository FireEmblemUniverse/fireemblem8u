#!/usr/bin/env python3
"""Compare SoftReset setup and prescribed BIOS handoffs; no actual reset emulation."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/bios-wrappers'
p = argparse.ArgumentParser()
p.add_argument('--source', type=Path, default=ROOT / 'research/bios/soft_reset.c')
p.add_argument('--rom', type=Path, default=ROOT / 'baserom.gba')
a = p.parse_args()
flags = ['-O2', '-fno-schedule-insns', '-fno-schedule-insns2', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables']
subprocess.run(['arm-none-eabi-gcc', '-c', *flags, '-I', str(ROOT / 'include'), str(a.source), '-o', str(OUT / 'soft_reset.o')], check=True)
subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', str(OUT / 'soft_reset.o'), str(OUT / 'soft_reset.bin')], check=True)
code = (OUT / 'soft_reset.bin').read_bytes()
rom = a.rom.read_bytes()
assert len(code) == 24 and code == rom[0xd16b0:0xd16c8]
rng = random.Random(0x5f700)
cases = 0
for nzcv in range(16):
    for reset_flags in (0, 1, 0xff, 0xffffffff):
        for initial_sp in (0x03001000, 0x03007f00, 0x03007f80, 0x03008000):
            inputs = [rng.getrandbits(32) for _ in range(13)]
            inputs[0] = reset_flags
            results = {n: rng.getrandbits(32) for n in (0, 1, 2, 3, 12)}
            records = []
            for draft in (False, True):
                u = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
                u.mem_map(0x08000000, len(rom)); u.mem_write(0x08000000, rom)
                u.mem_map(0x03000000, 0x8000); u.mem_map(0x04000000, 0x1000)
                u.mem_write(0x04000208, bytes.fromhex('abcd'))
                if draft: u.mem_write(0x080f0000, code)
                u.reg_write(r.UC_ARM_REG_CPSR, 0x3f | (nzcv << 28))
                for n, value in enumerate(inputs): u.reg_write(getattr(r, f'UC_ARM_REG_R{n}'), value)
                u.reg_write(r.UC_ARM_REG_SP, initial_sp); u.reg_write(r.UC_ARM_REG_LR, 0x080ff001)
                state = {'services': [], 'writes': [], 'snapshots': []}
                def hook(u, address, size, state):
                    insn = int.from_bytes(u.mem_read(address, 2), 'little')
                    if insn & 0xff00 != 0xdf00: return
                    svc = insn & 255
                    state['services'].append(svc)
                    snapshot = [u.reg_read(getattr(r, f'UC_ARM_REG_R{n}')) for n in range(15)] + [u.reg_read(r.UC_ARM_REG_CPSR)]
                    state['snapshots'].append(snapshot)
                    assert snapshot[13] == 0x03007f00
                    assert bytes(u.mem_read(0x04000208, 2)) == bytes.fromhex('00cd')
                    if svc == 1:
                        assert snapshot[0] == reset_flags
                        assert snapshot[1:4] == [0x03007f00, 0, 0x04000208]
                        for n, value in results.items(): u.reg_write(getattr(r, f'UC_ARM_REG_R{n}'), value)
                        u.reg_write(r.UC_ARM_REG_CPSR, 0x3f | ((15-nzcv) << 28))
                        u.reg_write(r.UC_ARM_REG_PC, (address + 2) | 1)
                    else:
                        assert svc == 0
                        u.emu_stop()
                def write(u, access, address, size, value, state): state['writes'].append((address, size, value))
                u.hook_add(UC_HOOK_CODE, hook, state); u.hook_add(UC_HOOK_MEM_WRITE, write, state)
                u.emu_start((0x080f0000 if draft else 0x080d16b0) | 1, 0, count=20)
                assert state['services'] == [1, 0]
                assert state['writes'] == [(0x04000208, 1, 0)]
                records.append(state)
            assert records[0] == records[1]
            cases += 1
print(json.dumps(dict(source_sha256=hashlib.sha256(a.source.read_bytes()).hexdigest(), compiler_flags=flags,
    region_bytes=24, instruction_bytes=14, retained_swi_bytes=4, c_generated_instruction_bytes=10,
    zero_padding_bytes=2, literal_bytes=8, exact=True, cases=cases,
    scope='Checks exact setup, byte-wide IME write, stack switch and both synthetic BIOS handoffs. Service 1 supplies prescribed registers/flags; service 0 stops execution. Does not implement BIOS clearing/reset, interrupt effects or hardware restart.'), indent=2))
