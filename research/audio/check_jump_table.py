#!/usr/bin/env python3
"""Research oracle for filtered jump-table copying."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/jump-table-match'
ENTRY, TRACK, PLAYER, RETURN = 0x080cf958, 0x02000000, 0x02001000, 0x080e0000


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--source', type=Path, default=ROOT/'research/audio/jump_table.c')
    p.add_argument('--require-match', action='store_true')
    p.add_argument('--plugin', type=Path)
    args = p.parse_args()
    OUT.mkdir(exist_ok=True)
    flags = ['-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
             '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing', '-fno-schedule-insns',
             '-fno-schedule-insns2', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables']
    if args.plugin:
        flags += ['-DTABLE_PRIVATE_RETURN', '-Werror=attributes', '-fno-reorder-blocks', '-fplugin='+str(args.plugin.resolve()),
                  '-fplugin-arg-ip_return-preserves-ip=chk_adr_r2', '-fplugin-arg-ip_return-body-branches']
    subprocess.run([args.compiler, *flags, '-I', str(ROOT/'tools/agbcc/include'), '-iquote',
                    str(ROOT/'include'), str(args.source), '-o', str(OUT/'candidate.s')], check=True)
    with (OUT/'candidate.s').open('a') as f:
        f.write('\n.align 2,0\n.global chk_adr_r2\n.thumb_set chk_adr_r2,0x080cf973\n.global gMPlayJumpTableTemplate\n.set gMPlayJumpTableTemplate,0x08207190\n')
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'candidate.s'), '-o', str(OUT/'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext='+hex(ENTRY), str(OUT/'candidate.o'), '-o', str(OUT/'candidate.elf')], check=True, capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'candidate.elf'), str(OUT/'candidate.bin')], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    original = rom[ENTRY-0x08000000:ENTRY-0x08000000+24]
    candidate = (OUT/'candidate.bin').read_bytes()
    if args.require_match:
        assert candidate == original
    # The oversized research body would overwrite the adjacent filter at its
    # original location. Relink execution separately while retaining original-address bytes.
    execution_entry = 0x080e1000
    subprocess.run(['arm-none-eabi-ld', '-Ttext='+hex(execution_entry), str(OUT/'candidate.o'), '-o', str(OUT/'execution.elf')], check=True, capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'execution.elf'), str(OUT/'execution.bin')], check=True)
    machines = []
    for code, entry in ((original, ENTRY), ((OUT/'execution.bin').read_bytes(), execution_entry)):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for address, size in ((0, 0x1000), (TRACK, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
            uc.mem_map(address, size)
        uc.mem_write(0x08000000, rom)
        uc.mem_write(entry, code)
        machines.append((uc, entry))
    count = 0
    differing_regs = set()
    flag_differences = 0
    source = 0x08207190
    for destination in (TRACK, TRACK+4, TRACK+64, TRACK+0x100, 0x03000100, 0x03000104):
        for seed in range(16):
            words = [((0x9e3779b9*(n+seed*36)) ^ (0x12345678*seed)) & 0xffffffff for n in range(36)]
            payload = struct.pack('<36I', *words) if seed else rom[source-0x08000000:source-0x08000000+144]
            for nzcv in range(16):
                for thumb_return in (False, True):
                    states = []
                    for uc, entry in machines:
                        uc.mem_write(source, payload)
                        uc.mem_write(destination-4 if destination>TRACK else destination, bytes([0xa5])*152)
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv<<28)
                        for n in range(13):
                            uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), 0x12340000+n)
                        uc.reg_write(r.UC_ARM_REG_R0, destination)
                        uc.reg_write(r.UC_ARM_REG_LR, RETURN|thumb_return)
                        uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                        uc.emu_start(entry|1, RETURN, count=1500)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                        assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                        assert bytes(uc.mem_read(destination,144)) == payload
                        assert bytes(uc.mem_read(destination+144,4)) == bytes([0xa5])*4
                        if destination>TRACK:
                            assert bytes(uc.mem_read(destination-4,4)) == bytes([0xa5])*4
                        regs = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)]
                        assert regs[4:12] == [0x12340000+n for n in range(4,12)]
                        assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32) == thumb_return
                        states.append((regs, uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                    differing_regs.update(n for n in range(13) if states[0][0][n] != states[1][0][n])
                    flag_differences += states[0][1] != states[1][1]
                    count += 1
    report = dict(cases=count, original_bytes=24, candidate_bytes=len(candidate), complete_match=candidate==original,
                  differing_registers=sorted(differing_regs), flag_difference_cases=flag_differences,
                  scope='36-word copy with original and synthetic templates, six RAM destinations, canaries, all NZCV combinations, ARM/Thumb returns and actual address filter. Final r0-r12 differences reported.')
    if args.require_match:
        assert candidate == original and not differing_regs and not flag_differences, report
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(report)


if __name__ == '__main__':
    main()
