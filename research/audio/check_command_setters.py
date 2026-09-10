#!/usr/bin/env python3
"""Compare small audio setters with the ROM's actual checked byte reader."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/audio-command-setters'
TRACK = 0x02000000
RETURN = 0x080e0000
SPECS = {'ply_prio': (0x080cfa18, 29), 'ply_lfodl': (0x080cfacc, 27)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', default='arm-none-eabi-gcc')
    parser.add_argument("--plugin", type=Path)
    parser.add_argument("--require-match", action="store_true")
    args = parser.parse_args()
    extra = (["-DMATCH_IP_RETURN", "-Werror=attributes", "-fno-unwind-tables", "-fno-asynchronous-unwind-tables",
              "-fplugin="+str(args.plugin.resolve()), "-fplugin-arg-ip_return-preserves-ip=ld_r3_tp_adr_i"] if args.plugin else [])
    OUT.mkdir(exist_ok=True)
    subprocess.run([args.compiler, '-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi',
                    '-mabi=apcs-gnu', '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing',
                    '-ffunction-sections', '-fno-if-conversion', '-fno-if-conversion2',
                    '-fno-reorder-blocks', '-I', str(ROOT/'tools/agbcc/include'), '-iquote',
                    str(ROOT/'include'), str(ROOT/'research/audio/command_setters.c'),
                    '-o', str(OUT/'candidate.s'), *extra], check=True)
    assembly = (OUT/'candidate.s').read_text()
    (OUT/'linked.s').write_text(assembly+'\n.global ld_r3_tp_adr_i\n.thumb_set ld_r3_tp_adr_i, 0x080cf98d\n')
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'linked.s'), '-o', str(OUT/'candidate.o')], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    report = {}
    for name, (entry, field) in SPECS.items():
        (OUT/'link.ld').write_text(f'SECTIONS {{ . = {entry:#x}; .text : {{ *(.text.{name}) }} /DISCARD/ : {{ *(*) }} }}\n')
        subprocess.run(['arm-none-eabi-ld', '-T', str(OUT/'link.ld'), str(OUT/'candidate.o'), '-o', str(OUT/'candidate.elf')], check=True)
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'candidate.elf'), str(OUT/(name+'.bin'))], check=True)
        candidate = (OUT/(name+'.bin')).read_bytes()
        original = rom[entry-0x08000000:entry-0x08000000+10]
        machines = []
        for code in (original, candidate):
            uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
            for address, size in ((0, 0x1000), (TRACK, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
                uc.mem_map(address, size)
            uc.mem_write(0x08000000, rom)
            uc.mem_write(entry, code)
            machines.append(uc)
        cases = flags_differ = registers_differ = 0
        differing_registers = set()
        for command in (TRACK+0x200, 0x200, TRACK+64, TRACK+65, TRACK+66, TRACK+67):
            for value in (range(256) if command in (TRACK+0x200, 0x200) else (0,)):
                initial = bytearray([0xa5]*0x100)
                struct.pack_into('<I', initial, 64, command)
                expected = initial.copy()
                struct.pack_into('<I', expected, 64, command+1)
                byte = expected[command-TRACK] if TRACK <= command < TRACK+0x100 else value
                expected[field] = byte if command >= 0x02000000 else 0
                for nzcv in (0, 5, 10, 15):
                    states = []
                    for uc in machines:
                        uc.mem_write(command, bytes([value]))
                        uc.mem_write(TRACK, bytes(initial))
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv << 28)
                        for reg in range(13):
                            uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(reg)), 0x12340000+reg)
                        uc.reg_write(r.UC_ARM_REG_R0, TRACK+0x1000)
                        uc.reg_write(r.UC_ARM_REG_R1, TRACK)
                        uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                        uc.reg_write(r.UC_ARM_REG_LR, RETURN|1)
                        uc.emu_start(entry|1, RETURN, count=100)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                        assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                        assert bytes(uc.mem_read(TRACK, 0x100)) == expected, (name, command, value)
                        for reg in range(4, 12):
                            assert uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(reg))) == 0x12340000+reg
                        states.append(([uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(reg))) for reg in range(13)], uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                    differing_registers.update(reg for reg in range(13) if states[0][0][reg] != states[1][0][reg])
                    registers_differ += states[0][0] != states[1][0]
                    flags_differ += states[0][1] != states[1][1]
                    cases += 1
        report[name] = {'cases': cases, 'original_bytes': len(original), 'candidate_bytes': len(candidate),
                        'complete_match': candidate == original, 'register_difference_cases': registers_differ,
                        'flag_difference_cases': flags_differ, 'differing_registers': sorted(differing_registers)}
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report))
    if args.require_match:
        assert all(item['complete_match'] and not item['register_difference_cases'] and not item['flag_difference_cases'] for item in report.values()), report


if __name__ == '__main__':
    main()
