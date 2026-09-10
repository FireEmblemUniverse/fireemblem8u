#!/usr/bin/env python3
"""Compare reverb C with the original ARM block, including ordered byte accesses."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_READ
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-reverb'
SOUND, MODEL, RETURN, SP = 0x02000000, 0x080e1000, 0x080f0000, 0x03007000
ENTRY, STOP = 0x080cf558, 0x080cf5da


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    parser.add_argument('--private', action='store_true', help='Check the private-register candidate before its ordinary return')
    parser.add_argument('--postincrement-plugin', type=Path)
    parser.add_argument('--subtract-plugin', type=Path)
    args = parser.parse_args()
    if args.subtract_plugin and not args.postincrement_plugin:
        parser.error('--subtract-plugin requires --postincrement-plugin')
    if args.postincrement_plugin and not args.private:
        parser.error('--postincrement-plugin requires --private')
    OUT.mkdir(exist_ok=True)
    stem = 'private-subtract' if args.subtract_plugin else 'private-postincrement' if args.postincrement_plugin else 'private' if args.private else 'candidate'
    source = 'soundmain_reverb_private.c' if args.private else 'soundmain_reverb.c'
    symbol = 'SoundMainReverbPrivate' if args.private else 'SoundMainReverbModel'
    subprocess.run([args.compiler, '-c', '-std=gnu89', '-O1', '-marm', '-mcpu=arm7tdmi',
                    '-mabi=apcs-gnu', '-ffreestanding',
                    *(['-DREVERB_SUBTRACT_COMPARE', '-fplugin=' + str(args.subtract_plugin.resolve())] if args.subtract_plugin else []),
                    *(['-DREVERB_POSTINCREMENT', '-fplugin=' + str(args.postincrement_plugin.resolve())] if args.postincrement_plugin else []), *([] if args.private else ['-Werror']),
                    '-I' + str(ROOT / 'tools/agbcc/include'), '-iquote', str(ROOT / 'include'),
                    str(ROOT / 'research/audio' / source), '-o', str(OUT / (stem + '.o'))], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext=' + hex(MODEL), '-e', symbol,
                    str(OUT / (stem + '.o')), '-o', str(OUT / (stem + '.elf'))], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text',
                    str(OUT / (stem + '.elf')), str(OUT / (stem + '.bin'))], check=True)
    rom = (ROOT / 'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    candidate = (OUT / (stem + '.bin')).read_bytes()
    original_stop = 0x080cf5a4 if args.private else STOP
    model_stop = MODEL + len(candidate) - 4 if args.private else RETURN
    if args.private:
        assert candidate[-4:] == bytes.fromhex('1eff2fe1'), 'expected terminal BX LR'
    if args.subtract_plugin:
        assert candidate[:76] == rom[ENTRY - 0x08000000:ENTRY - 0x08000000 + 76], 'calculation byte mismatch'
    machines, traces = [], [[], []]
    def access(uc, kind, address, size, value, trace):
        if kind == UC_MEM_READ:  # Capture actual byte value before access.
            value = int.from_bytes(uc.mem_read(address, size), 'little')
        # Unicorn exposes the whole source register for STRB; compare the
        # actual bus-width value, not the discarded upper register bits.
        trace.append((kind, address, size, value & ((1 << (8 * size)) - 1)))
    for model in (False, True):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        for base, size in ((SOUND, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
            uc.mem_map(base, size)
        uc.mem_write(0x08000000, rom)
        if model:
            uc.mem_write(MODEL, (OUT / (stem + '.bin')).read_bytes())
        uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, access, traces[int(model)],
                    begin=SOUND + 0x350, end=SOUND + 0x3fff)
        machines.append(uc)
    rng = random.Random(0xFE8)
    patterns = [bytes([x]) * 0x4000 for x in (0, 1, 63, 64, 127, 128, 129, 192, 254, 255)]
    patterns += [bytes(range(256)) * 64, rng.randbytes(0x4000)]
    # Counter 2 selects the base buffer; the others select output+samples.
    # Offset 1 and offset 1583 exercise repeated reads after previous writes.
    layouts = [(1, 0, 1), (2, 0, 1), (2, 1, 16), (2, 1583, 16),
               (0, 0, 16), (3, 32, 32), (255, 0, 528), (2, 528, 528)]
    cases = 0
    for strength in range(256):
        for pattern_index, pattern in enumerate(patterns):
            # Exhaust strengths/patterns on tiny loops, plus all layouts for
            # strengths surrounding rounding and signed-byte boundaries.
            selected = layouts if strength in (0, 1, 63, 64, 127, 128, 129, 254, 255) else layouts[:2]
            for counter, offset, samples in selected:
                raw = bytearray(pattern)
                raw[5] = strength
                output = SOUND + 0x350 + offset
                results = []
                registers = []
                for model, uc in enumerate(machines):
                    traces[model].clear()
                    uc.mem_write(SOUND, bytes(raw))
                    uc.mem_write(SP - 256, bytes([0xa5]) * 272)
                    uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | (strength & 15) << 28)
                    for n in range(13):
                        uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), 0x12340000 + n)
                    uc.reg_write(r.UC_ARM_REG_SP, SP)
                    uc.reg_write(r.UC_ARM_REG_LR, RETURN)
                    inputs = {0: SOUND, 1: output, 2: samples, 3: counter} if model and not args.private else {
                        0: SOUND, 3: strength, 4: counter, 5: output, 6: 1584, 8: samples}
                    for n, value in inputs.items():
                        uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), value)
                    uc.emu_start(MODEL if model else ENTRY, model_stop if model else original_stop, count=50000)
                    assert uc.reg_read(r.UC_ARM_REG_PC) == (model_stop if model else original_stop)
                    assert uc.reg_read(r.UC_ARM_REG_SP) == SP
                    assert bytes(uc.mem_read(SP, 16)) == bytes([0xa5]) * 16
                    if args.private:
                        assert bytes(uc.mem_read(SP - 256, 256)) == bytes([0xa5]) * 256
                    results.append(bytes(uc.mem_read(SOUND, 0x4000)))
                    registers.append(tuple(uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) for n in range(13)) +
                                     (uc.reg_read(r.UC_ARM_REG_LR), uc.reg_read(r.UC_ARM_REG_CPSR) & 0xf000003f))
                    if model and not args.private:
                        for n in range(4, 12):
                            assert uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) == 0x12340000 + n
                case = (strength, pattern_index, counter, offset, samples)
                assert results[0] == results[1], case
                assert traces[0] == traces[1], (case, traces[0][:12], traces[1][:12])
                if args.private:
                    assert registers[0] == registers[1], (case, registers)
                assert len(traces[0]) == samples * 6
                cases += 1
    report = dict(cases=cases, scope='positive sample counts; all 256 strengths; signed byte boundaries, seeded data, source/output overlap; exact buffer memory and ordered reads/writes',
                  original_sha1=hashlib.sha1(rom).hexdigest(), candidate_sha256=hashlib.sha256((OUT / (stem + '.bin')).read_bytes()).hexdigest(),
                  matching_C_integration=False, limitations='No full mixer, private register/frame ABI, final flags, or zero/negative sample count equivalence claimed.')
    if args.private:
        report.update(private_registers_and_flags_match=True, candidate_bytes=len(candidate),
                      original_calculation_bytes=original_stop-ENTRY,
                      limitations='Positive sample counts only; stopped before original ARM-to-Thumb transfer and C BX LR; not a complete byte-matching replacement or integrated.')
    if args.subtract_plugin:
        report['matching_calculation_bytes'] = 76
    (OUT / (stem + '-report.json' if args.private else 'report.json')).write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
