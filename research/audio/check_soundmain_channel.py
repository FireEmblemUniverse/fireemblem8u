#!/usr/bin/env python3
"""Compare channel setup/envelope C against the original mixer boundaries."""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-channel'
ENTRY, MIX, SKIP, EXIT = 0x080cf5e4, 0x080cf6e4, 0x080cf8cc, 0x080cf8d6
MODEL, RETURN, SOUND, CHANNEL, WAVE, FRAME, SP = 0x080e1000, 0x080f0000, 0x02000000, 0x02000050, 0x02001000, 0x03006000, 0x03007000


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler', required=True); a = p.parse_args()
    OUT.mkdir(exist_ok=True)
    subprocess.run([a.compiler, '-c', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                    '-ffreestanding', '-Werror', '-I' + str(ROOT / 'tools/agbcc/include'), '-iquote', str(ROOT / 'include'),
                    str(ROOT / 'research/audio/soundmain_channel.c'), '-o', str(OUT / 'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext=' + hex(MODEL), '-e', 'SoundMainChannelModel', str(OUT / 'candidate.o'), '-o', str(OUT / 'candidate.elf')], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT / 'candidate.elf'), str(OUT / 'candidate.bin')], check=True)
    rom = (ROOT / 'baserom.gba').read_bytes(); assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    machines = []
    state = {}
    def boundary(uc, address, size, data):
        if address in (MIX, SKIP, EXIT):
            data['result'] = {MIX: 1, SKIP: 0, EXIT: 2}[address]
            uc.emu_stop()
    for model in (False, True):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for base, size in ((SOUND, 0x4000), (0x03000000, 0x8000), (0x04000000, 0x1000), (0x08000000, 0x1000000)):
            uc.mem_map(base, size)
        uc.mem_write(0x08000000, rom)
        if model: uc.mem_write(MODEL, (OUT / 'candidate.bin').read_bytes())
        else: uc.hook_add(UC_HOOK_CODE, boundary, state, begin=MIX, end=EXIT)
        machines.append(uc)
    rng = random.Random(0xfe8c)
    vectors = [(0, 0, 0, 0, 0, 0, 0, 0), (255, 255, 255, 255, 255, 1, 255, 255),
               (1, 1, 1, 1, 1, 2, 1, 1), (128, 128, 128, 128, 128, 255, 128, 128)]
    vectors += [tuple(rng.randrange(256) for _ in range(8)) for _ in range(4)]
    rows = []
    for status in range(256):
        for envelope in (0, 1, 63, 127, 128, 254, 255):
            for index, vector in enumerate(vectors):
                rows.append((status, envelope, vector, index, 0, 0))
    for vcount in range(256):
        for deadline in (0, 1, 159, 160, 227, 228, 255, 388, 483, 484, 0xffffffff):
            for status in (0, 3, 4, 0x40, 0x80, 0xc0):
                rows.append((status, 127, vectors[1], vcount % 8, deadline, vcount))
    results = Counter()
    for case_index, (status, envelope, vector, index, deadline, vcount) in enumerate(rows):
        attack, decay, sustain, release, echo, length, right, left = vector
        raw = bytearray([0x5a]) * 0x3000
        raw[7] = (0, 1, 15, 16, 127, 128, 254, 255)[index]
        channel = memoryview(raw)[0x50:0x90]
        channel[0] = status; channel[2] = right; channel[3] = left
        channel[4:8] = bytes((attack, decay, sustain, release))
        channel[9] = envelope; channel[12] = echo; channel[13] = length
        struct.pack_into('<I', channel, 36, WAVE)
        loop_start = (0, 1, 17, 255, 0xfffffffe, 0xffffffff, 512, 4)[index]
        wave_size = (0, 1, 16, 256, 0xffffffff, 0, 528, 3)[index]
        raw[0x1003] = (0, 0x40, 0x80, 0xc0, 0x3f, 0xff, 0, 0xc0)[index]
        struct.pack_into('<II', raw, 0x1008, loop_start, wave_size)
        frame = bytearray([0xa5]) * 64
        struct.pack_into('<I', frame, 8, SOUND + 0x2800)
        struct.pack_into('<II', frame, 20, deadline, SOUND)
        channels = (0, 1, 4, 12, 255, 0xffffffff, 2, 8)[index]
        snapshots = []
        for model, uc in enumerate(machines):
            state.clear(); uc.mem_write(SOUND, bytes(raw)); uc.mem_write(FRAME, bytes(frame))
            uc.mem_write(SP - 512, bytes([0xa5]) * 528); uc.mem_write(0x04000006, bytes([vcount]))
            uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | (case_index % 16) << 28)
            for n in range(13): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), 0x12340000 + n)
            uc.reg_write(r.UC_ARM_REG_LR, RETURN | 1)
            uc.reg_write(r.UC_ARM_REG_SP, SP if model else FRAME)
            inputs = {0: FRAME, 1: CHANNEL, 2: channels, 3: vcount} if model else {0: channels, 4: CHANNEL, 8: 528}
            for n, value in inputs.items(): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), value)
            uc.emu_start((MODEL if model else ENTRY) | 1, RETURN, count=500)
            if model:
                assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                result = uc.reg_read(r.UC_ARM_REG_R0)
                assert uc.reg_read(r.UC_ARM_REG_SP) == SP
                for n in range(4, 12): assert uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) == 0x12340000 + n
                assert bytes(uc.mem_read(SP, 16)) == bytes([0xa5]) * 16
            else:
                assert 'result' in state, case_index
                result = state['result']
                assert uc.reg_read(r.UC_ARM_REG_SP) == FRAME
            snapshots.append((result, bytes(uc.mem_read(SOUND, len(raw))), bytes(uc.mem_read(FRAME, 64))))
        assert snapshots[0] == snapshots[1], (case_index, status, envelope, vector, index, deadline, vcount, snapshots[0][0], snapshots[1][0])
        results[snapshots[0][0]] += 1
    report = dict(cases=len(rows), outcomes=dict(results), scope='all status bytes; envelope boundaries; attack/decay/release/echo and master-volume vectors; every VCOUNT byte and eleven deadlines; complete SoundInfo/channel/wave memory and private frame scratch effects',
                  C_integration=False, limitations='Semantic model only: no instruction/register/flag or memory-access-order match; sample mixing and mixer return are not executed.')
    (OUT / 'report.json').write_text(json.dumps(report, indent=2) + '\n'); print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
