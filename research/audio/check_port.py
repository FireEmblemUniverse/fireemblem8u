#!/usr/bin/env python3
"""Research oracle for port writes; reports byte differences without claiming a match."""
import argparse
import json
from pathlib import Path
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/port-match'
ENTRY, TRACK, COMMAND, RETURN = 0x080cfb04, 0x02000000, 0x02000200, 0x080e0000


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--plugin', type=Path, required=True)
    p.add_argument('--production', action='store_true')
    p.add_argument('--require-match', action='store_true')
    args = p.parse_args()
    OUT.mkdir(exist_ok=True)
    flags = ['-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
             '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing', '-fno-schedule-insns',
             '-fno-schedule-insns2', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables']
    if args.plugin:
        flags += ['-DPORT_PRIVATE_RETURN', '-Werror=attributes', '-fplugin='+str(args.plugin.resolve()), '-fplugin-arg-ip_return-preserves-ip=_081DD64A']
    subprocess.run([args.compiler, *flags, '-I', str(ROOT/'tools/agbcc/include'), '-iquote',
                    str(ROOT/'include'), str(ROOT/'src/m4a_port.c'), '-o', str(OUT/'baseline.s')], check=True)
    with (OUT/'baseline.s').open('a') as f:
        f.write('\n.global _081DD64A\n.thumb_set _081DD64A,0x080cf98f\n')
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'baseline.s'), '-o', str(OUT/'baseline.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext='+hex(ENTRY), str(OUT/'baseline.o'), '-o', str(OUT/'baseline.elf')], check=True, capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'baseline.elf'), str(OUT/'baseline.bin')], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    original = rom[ENTRY-0x08000000:ENTRY-0x08000000+24]
    candidate = (OUT/'baseline.bin').read_bytes()
    if args.require_match:
        assert candidate == original, (candidate.hex(), original.hex())
    if args.production:
        assert candidate == (ROOT/'fireemblem8.gba').read_bytes()[ENTRY-0x08000000:ENTRY-0x08000000+24]
    machines = []
    for code in (original, candidate):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for address, size in ((0, 0x1000), (TRACK, 0x4000), (0x03000000, 0x8000), (0x04000000, 0x1000), (0x08000000, 0x1000000)):
            uc.mem_map(address, size)
        uc.mem_write(0x08000000, rom)
        uc.mem_write(ENTRY, code)
        writes = []
        uc.hook_add(UC_HOOK_MEM_WRITE, lambda u, access, address, size, value, log: log.append((address, size, value)), writes, 0x04000000, 0x04000fff)
        machines.append((uc, writes))
    cases = 0
    differing_registers = set()
    scenarios = ((command, offset, value) for command in (COMMAND, 0x200, TRACK+63, TRACK+64, TRACK+65, TRACK+66, TRACK+67)
                 for offset in (range(256) if command in (COMMAND, 0x200) else (0,))
                 for value in range(256))
    for command, offset, value in scenarios:
        states = []
        for uc, writes in machines:
            writes.clear()
            track = bytearray([0xa5]*256)
            track[64:68] = command.to_bytes(4, 'little')
            if TRACK <= command < TRACK+256:
                # Pointer bytes retain their actual value; other aliased bytes vary.
                for address, byte in ((command, offset), (command+1, value)):
                    if not TRACK+64 <= address < TRACK+68:
                        track[address-TRACK] = byte
            actual_offset = track[command-TRACK] if TRACK <= command < TRACK+256 else offset
            expected = track.copy()
            expected[64:68] = (command+2).to_bytes(4, 'little')
            actual_value = expected[command+1-TRACK] if TRACK <= command+1 < TRACK+256 else value
            if command+1 < 0x02000000:
                actual_value = 0
            uc.mem_write(TRACK, bytes(track))
            if command in (COMMAND, 0x200):
                uc.mem_write(command, bytes([offset, value]))
            uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | ((offset&15)<<28))
            for n in range(13):
                uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), 0x12340000+n)
            uc.reg_write(r.UC_ARM_REG_R0, TRACK+0x1000)
            uc.reg_write(r.UC_ARM_REG_R1, TRACK)
            uc.reg_write(r.UC_ARM_REG_LR, RETURN|1)
            uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
            uc.emu_start(ENTRY|1, RETURN, count=100)
            assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
            assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
            assert writes == [(0x04000060+actual_offset, 1, actual_value)]
            assert bytes(uc.mem_read(TRACK, 256)) == expected
            regs = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)]
            assert regs[4:12] == [0x12340000+n for n in range(4, 12)]
            states.append((regs, uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
        assert states[0][1] == states[1][1]
        differing_registers.update(n for n in range(13) if states[0][0][n] != states[1][0][n])
        cases += 1
    if args.require_match:
        assert not differing_registers, differing_registers
    report = dict(cases=cases, production=args.production, original_bytes=len(original), candidate_bytes=len(candidate),
                  complete_match=original==candidate, differing_registers=sorted(differing_registers),
                  scope='All offset/value pairs in accepted/rejected RAM plus five pointer aliases; ordered byte MMIO write, track RAM, flags, stack, return PC and preserved registers. CPU accesses only; no sound hardware timing.')
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(report)


if __name__ == '__main__':
    main()
