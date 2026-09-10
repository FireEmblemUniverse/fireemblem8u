#!/usr/bin/env python3
"""Compare the C channel gate candidate with MPlayMain's original private entry.

This is a behavioral research gate, not a claim of matching production bytes.
It stops before ClearChain or the next-channel load, neither of which is covered.
"""
import argparse
import hashlib
import itertools
import json
import random
import subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
ENTRY, CLEAR, NEXT = 0x080cfbd6, 0x080cfbf2, 0x080cfbf8
CANDIDATE, DATA, SP = 0x08100000, 0x02000000, 0x02001000

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    args = parser.parse_args()
    out = ROOT / '.deps/soundmain-packed/mplay-channel-gate'
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'research/audio/mplay_channel_gate.c'
    obj, elf, binary = (out / name for name in ('candidate.o', 'candidate.elf', 'candidate.bin'))
    subprocess.run([args.compiler, '-c', '-std=gnu89', '-O1', '-fno-reorder-blocks', '-mthumb',
                    '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding', '-Werror=attributes',
                    '-I', str(ROOT / 'tools/agbcc/include'), '-iquote', str(ROOT / 'include'),
                    str(source), '-o', str(obj),
                    '-fplugin=' + str(ROOT / '.deps/flood-core-new-backend/tail_transfer.so'),
                    '-fplugin-arg-tail_transfer-destination=MPlayMainChannelClear',
                    '-fplugin-arg-tail_transfer-destination=MPlayMainChannelNext',
                    '-fplugin-arg-tail_transfer-private-frame64',
                    '-fplugin-arg-tail_transfer-acyclic-branches'], check=True)
    # Destinations are nearby to preserve short Thumb branches. Compare their roles,
    # translating only candidate entry/exit PCs; all data addresses remain identical.
    cclear, cnext = CANDIDATE + 0x100, CANDIDATE + 0x102
    script = out / 'candidate.ld'
    script.write_text('SECTIONS { .text ' + hex(CANDIDATE) + ' : { *(.text) } '
                      'MPlayMainChannelClear = ' + hex(cclear) + '; '
                      'MPlayMainChannelNext = ' + hex(cnext) + '; }')
    subprocess.run(['arm-none-eabi-ld', '-T', str(script), str(obj), '-o', str(elf)], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', str(elf), str(binary)], check=True)
    code = binary.read_bytes()
    rom = (ROOT / 'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    machines = []
    for candidate in (False, True):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        uc.mem_map(0x08000000, 0x1000000)
        uc.mem_write(0x08000000, rom)
        if candidate:
            uc.mem_write(CANDIDATE, code)
        uc.mem_map(DATA, 0x4000)
        trace = []
        def access(u, kind, address, size, value, trace):
            trace.append((kind, address, size, value if kind == 17 else None))
        uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, access, trace, DATA, DATA + 0x3fff)
        exits = (cclear, cnext) if candidate else (CLEAR, NEXT)
        def stop(u, address, size, exits):
            if address in exits:
                u.emu_stop()
        uc.hook_add(UC_HOOK_CODE, stop, exits)
        machines.append((uc, trace, exits, CANDIDATE if candidate else ENTRY))
    rng = random.Random(0xfe8ca7e)
    counts = dict(clear=0, disabled=0, counting=0, release=0)
    for status, gate, flags in itertools.product(range(256), range(256), range(16)):
        channel = SP - 16 if flags & 1 else DATA + 0x400
        memory = bytearray([0xa5]) * 0x4000
        memory[channel - DATA] = status
        memory[channel + 16 - DATA] = gate
        expected_memory = memory.copy()
        regs = [rng.getrandbits(32) for _ in range(13)]
        regs[4] = channel
        expected = regs.copy()
        expected[0], expected[1] = 199, status
        trace_expected = [(16, channel, 1, None)]
        role = 'clear'
        if status & 199:
            role = 'disabled' if not gate else ('release' if gate == 1 else 'counting')
            expected[0] = gate
            trace_expected.append((16, channel + 16, 1, None))
            if gate:
                expected[0] = gate - 1
                expected_memory[channel + 16 - DATA] = gate - 1
                trace_expected.append((17, channel + 16, 1, gate - 1))
                if gate == 1:
                    expected[0], expected[1] = 64, status | 64
                    expected_memory[channel - DATA] = status | 64
                    trace_expected.append((17, channel, 1, status | 64))
        results = []
        for uc, trace, exits, entry in machines:
            uc.mem_write(DATA, bytes(memory))
            uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | flags << 28)
            for n, value in enumerate(regs):
                uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), value)
            uc.reg_write(r.UC_ARM_REG_SP, SP)
            uc.reg_write(r.UC_ARM_REG_LR, 0x12345679)
            trace.clear()
            uc.emu_start(entry | 1, 0, count=30)
            pc = uc.reg_read(r.UC_ARM_REG_PC)
            assert pc == exits[role != 'clear'], (status, gate, flags, hex(pc))
            assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) for n in range(13)] == expected
            assert uc.reg_read(r.UC_ARM_REG_SP) == SP and uc.reg_read(r.UC_ARM_REG_LR) == 0x12345679
            assert bytes(uc.mem_read(DATA, 0x4000)) == expected_memory
            assert trace == trace_expected, (status, gate, trace, trace_expected)
            results.append(uc.reg_read(r.UC_ARM_REG_CPSR))
        assert results[0] == results[1], (status, gate, flags, results)
        counts[role] += 1
    report = dict(cases=sum(counts.values()), outcomes=counts, original_bytes=CLEAR - ENTRY,
                  candidate_bytes=len(code), candidate_sha256=hashlib.sha256(code).hexdigest(),
                  source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(), production_integrated=False,
                  scope='All 256 status bytes, 256 gate bytes and 16 initial NZCV states; normal and frame-overlap channel addresses; all registers, SP/LR, flags, complete RAM and ordered accesses.',
                  limitations='Candidate has different instruction encoding/layout. Excludes ClearChain, next-channel traversal, and full MPlayMain execution.')
    (out / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))

if __name__ == '__main__':
    main()
