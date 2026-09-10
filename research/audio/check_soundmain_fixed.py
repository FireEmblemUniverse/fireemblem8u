#!/usr/bin/env python3
"""Compare fixed-rate sample mixing with the original packed ARM implementation."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-fixed'
ENTRY, STOP, MODEL, RETURN = 0x080cf6e4, 0x080cf8cc, 0x080e1000, 0x080f0000
SOUND, CHANNEL, SOURCE, LOOP, OUTPUT, FRAME, SP = 0x02000000, 0x02000050, 0x02001000, 0x02001400, 0x02002000, 0x03006000, 0x03007000


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler', required=True); a = p.parse_args()
    OUT.mkdir(exist_ok=True)
    subprocess.run([a.compiler, '-c', '-std=gnu89', '-O1', '-marm', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                    '-ffreestanding', '-Werror', '-I' + str(ROOT / 'tools/agbcc/include'), '-iquote', str(ROOT / 'include'),
                    str(ROOT / 'research/audio/soundmain_fixed.c'), '-o', str(OUT / 'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext=' + hex(MODEL), '-e', 'SoundMainFixedModel', str(OUT / 'candidate.o'), '-o', str(OUT / 'candidate.elf')], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT / 'candidate.elf'), str(OUT / 'candidate.bin')], check=True)
    nm = subprocess.check_output(['arm-none-eabi-nm', str(OUT / 'candidate.elf')], text=True)
    model_entry = int(next(line.split()[0] for line in nm.splitlines() if line.endswith(' SoundMainFixedModel')), 16)
    rom = (ROOT / 'baserom.gba').read_bytes(); assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    machines = []
    for model in (False, True):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        for base, size in ((SOUND, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
            uc.mem_map(base, size)
        uc.mem_write(0x08000000, rom)
        if model: uc.mem_write(MODEL, (OUT / 'candidate.bin').read_bytes())
        machines.append(uc)
    rng = random.Random(0xfe8f)
    patterns = [bytes([x]) * 0x4000 for x in (0, 127, 128, 255)]
    patterns += [bytes(range(256)) * 64, rng.randbytes(0x4000)]
    cases = stopped = 0
    for samples in (4, 8, 16, 28, 32, 528):
        for count in (1, 2, 3, 4, 5, 7, 8, 9, 15, 16, 17, 31, 32, 33, 529):
            for loop in (0, 1, 2, 3, 4, 17, 256):
                for right in (0, 1, 128, 255):
                    for left in (0, 1, 128, 255):
                        raw = bytearray(patterns[cases % len(patterns)])
                        raw[0x50] = 0x13; raw[0x51] = 8; raw[0x5a] = right; raw[0x5b] = left
                        struct.pack_into('<I', raw, 0x50 + 24, count); struct.pack_into('<I', raw, 0x50 + 40, SOURCE)
                        frame = bytearray([0xa5]) * 64
                        struct.pack_into('<III', frame, 8, OUTPUT, LOOP, loop)
                        struct.pack_into('<I', frame, 24, SOUND)
                        snapshots = []
                        for model, uc in enumerate(machines):
                            uc.mem_write(SOUND, bytes(raw)); uc.mem_write(FRAME - 16, bytes([0xa5]) * 96)
                            uc.mem_write(FRAME, bytes(frame)); uc.mem_write(SP - 512, bytes([0xa5]) * 528)
                            uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | (cases % 16) << 28)
                            for n in range(13): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), 0x12340000 + n)
                            uc.reg_write(r.UC_ARM_REG_SP, SP if model else FRAME); uc.reg_write(r.UC_ARM_REG_LR, RETURN)
                            inputs = {0: FRAME, 1: CHANNEL, 2: samples} if model else {2: count, 3: SOURCE, 4: CHANNEL, 5: OUTPUT, 8: samples}
                            for n, value in inputs.items(): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), value)
                            uc.emu_start(model_entry if model else ENTRY, RETURN if model else STOP, count=50000)
                            assert uc.reg_read(r.UC_ARM_REG_PC) == (RETURN if model else STOP)
                            assert uc.reg_read(r.UC_ARM_REG_SP) == (SP if model else FRAME)
                            if model:
                                for n in range(4, 12): assert uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) == 0x12340000 + n
                                assert bytes(uc.mem_read(SP, 16)) == bytes([0xa5]) * 16
                            else:
                                assert uc.reg_read(r.UC_ARM_REG_R8) == samples
                                assert uc.reg_read(r.UC_ARM_REG_CPSR) & 32
                            snapshots.append((bytes(uc.mem_read(SOUND, len(raw))), bytes(uc.mem_read(FRAME - 16, 96))))
                        assert snapshots[0] == snapshots[1], (cases, samples, count, loop, right, left)
                        stopped += snapshots[0][0][0x50] == 0
                        cases += 1
    report = dict(cases=cases, stopped_channels=stopped, continuing_channels=cases-stopped,
                  scope='positive word-aligned output counts; short/end-of-word/end-of-buffer samples, zero/nonzero loop lengths, stereo volume and signed-byte boundaries, packed-word overflow; full sound memory and frame/canaries',
                  C_integration=False, limitations='Semantic model only; private registers, flags and access ordering not matched; source/output aliasing, resampling and full mixer return excluded.')
    (OUT / 'report.json').write_text(json.dumps(report, indent=2) + '\n'); print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
