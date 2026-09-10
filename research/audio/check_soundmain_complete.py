#!/usr/bin/env python3
"""Compare complete SoundMain calls with composed C models and active channels."""
import argparse
from collections import Counter
import hashlib
import itertools
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-complete'
ENTRY, RAM, MODEL, RETURN, SOUND, SP = 0x080cf4c8, 0x03002c60, 0x080e1000, 0x080f0000, 0x02000000, 0x03007000
ID = 0x68736d53


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler', required=True); p.add_argument('--production', action='store_true'); a = p.parse_args()
    OUT.mkdir(exist_ok=True); objects = []
    for name in ('complete', 'setup', 'reverb', 'channel', 'fixed', 'resample'):
        obj = OUT / (name + '.o'); objects.append(str(obj))
        subprocess.run([a.compiler, '-c', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                        '-ffreestanding', '-Werror', '-I' + str(ROOT / 'tools/agbcc/include'), '-iquote', str(ROOT / 'include'),
                        str(ROOT / 'research/audio' / ('soundmain_' + name + '.c')), '-o', str(obj)], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext=' + hex(MODEL), '-e', 'SoundMainCompleteModel', *objects,
                    '-L' + str(ROOT / 'tools/agbcc/lib'), '-lgcc', '-o', str(OUT / 'candidate.elf')], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT / 'candidate.elf'), str(OUT / 'candidate.bin')], check=True)
    nm = subprocess.check_output(['arm-none-eabi-nm', str(OUT / 'candidate.elf')], text=True)
    model_entry = int(next(line.split()[0] for line in nm.splitlines() if line.endswith(' SoundMainCompleteModel')), 16)
    rom = (ROOT / 'baserom.gba').read_bytes(); assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    if a.production:
        production = (ROOT / 'fireemblem8.gba').read_bytes()
        assert production == rom, 'production ROM does not match original'
        rom = production
    machines = []
    def callback(uc, address, size, state):
        if address not in (0x080e0000, 0x080e0010, 0x080e0020): return
        state['callbacks'].append((address, uc.reg_read(r.UC_ARM_REG_R0), bytes(uc.mem_read(SOUND, 4)).hex()))
        optional = address == 0x080e0010
        if state['policy'] & (1 if optional else 2):
            uc.mem_write(SOUND + 4, bytes([2]))
            uc.mem_write(SOUND + 7, bytes([127 if optional else 255]))
            uc.mem_write(SOUND + 12, bytes([255]))
            uc.mem_write(SOUND + 16, struct.pack('<I', 20))
            uc.mem_write(SOUND + 0x50, bytes([0x80]))
            uc.mem_write(0x03007ff0, struct.pack('<I', SOUND + 0x2000))
            if optional: uc.mem_write(SOUND + 40, struct.pack('<I', 0x080e0021))
            else: uc.mem_write(SOUND, struct.pack('<I', 0xabcdef01))
    def vcount_read(uc, kind, address, size, value, state):
        assert size == 1
        index = len(state['vcounts']); scenario = state['scenario']
        if scenario == 0: current = 0
        elif scenario == 1: current = min(160 + index, 227)
        else: current = 227 if index == 0 else (index - 1) % 160
        state['vcounts'].append(current); uc.mem_write(address, bytes([current]))
    def deadline_exit(uc, address, size, state):
        state['deadline_exits'] += 1
    for model in (False, True):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for base, size in ((SOUND, 0x10000), (0x03000000, 0x8000), (0x04000000, 0x1000), (0x08000000, 0x1000000)):
            uc.mem_map(base, size)
        uc.mem_write(0x08000000, rom); uc.mem_write(RAM, rom[0xcf54c:0xcf54c + 0x400])
        for address in (0x080e0000, 0x080e0010, 0x080e0020): uc.mem_write(address, bytes.fromhex('7047'))
        if model: uc.mem_write(MODEL, (OUT / 'candidate.bin').read_bytes())
        state = {}
        uc.hook_add(UC_HOOK_CODE, callback, state, begin=0x080e0000, end=0x080e0020)
        uc.hook_add(UC_HOOK_MEM_READ, vcount_read, state, begin=0x04000006, end=0x04000006)
        if not model:
            uc.hook_add(UC_HOOK_CODE, deadline_exit, state, begin=RAM + 0xb0, end=RAM + 0xb0)
        machines.append((uc, state))
    rows = [(ID, *row) for row in itertools.product((16, 20, 28, 528), (0, 1, 4, 12), (0, 2, 3), (0, 127, 255), range(3), range(4), (False, True))]
    rows += [(ident, 16, 4, 2, 127, scenario, policy, optional) for ident, scenario, policy, optional in itertools.product((0, ID + 1, 0xffffffff), range(3), range(4), (False, True))]
    rng = random.Random(0xfe8a); seed = rng.randbytes(0x10000); outcomes = Counter()
    for case, (ident, samples, channels, counter, reverb, scenario, policy, optional) in enumerate(rows):
        raw = bytearray(seed)
        struct.pack_into('<I', raw, 0, ident); raw[4:8] = bytes((counter, reverb, channels, (1, 15, 255)[case % 3]))
        raw[11] = 3; raw[12] = (0, 1, 3)[scenario]
        struct.pack_into('<I', raw, 16, samples); struct.pack_into('<I', raw, 24, 3)
        struct.pack_into('<III', raw, 32, 0x080e0011 if optional else 0, 0x12345678, 0x080e0001)
        for n in range(12):
            offset = 0x50 + n * 64; wave = SOUND + 0x4000 + n * 0x200
            status = (0x80, 3, 2, 1, 0x40, 4, 0xc0, 0, 0x13, 0x12, 0x44, 0x10)[(n + case) % 12]
            raw[offset] = status; raw[offset + 1] = 8 if n % 2 == 0 else 0
            raw[offset + 2:offset + 8] = bytes((255, 128, 64, 240, 64, 128))
            raw[offset + 9] = (1, 127, 254)[n % 3]; raw[offset + 12] = 24; raw[offset + 13] = n % 3
            count = (1, 4, 17, 257)[n % 4]
            step = (0x400000, 0x800000, 0x1800000)[n % 3]
            frequency = (step * pow(3, -1, 1 << 32)) & 0xffffffff
            struct.pack_into('<IIIII', raw, offset + 24, count, 0x7fffff, frequency, wave, wave + 16)
            raw[wave - SOUND + 3] = 0xc0 if n % 3 else 0
            struct.pack_into('<II', raw, wave - SOUND + 8, 0, count)
        snapshots = []
        for model, (uc, state) in enumerate(machines):
            state.clear(); state.update(callbacks=[], vcounts=[], policy=policy, scenario=scenario, deadline_exits=0)
            uc.mem_write(SOUND, bytes(raw)); uc.mem_write(0x03007ff0, struct.pack('<I', SOUND))
            uc.mem_write(SP - 0x1000, bytes([0xa5]) * 0x1010)
            uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | (case % 16) << 28)
            initial = [0x12340000 + n for n in range(13)]
            for n, value in enumerate(initial): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), value)
            thumb_return = bool(case % 2)
            uc.reg_write(r.UC_ARM_REG_SP, SP); uc.reg_write(r.UC_ARM_REG_LR, RETURN | thumb_return)
            uc.emu_start((model_entry if model else ENTRY) | 1, RETURN, count=3000000)
            assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN, case
            assert uc.reg_read(r.UC_ARM_REG_SP) == SP, case
            assert bool(uc.reg_read(r.UC_ARM_REG_CPSR) & 32) == thumb_return, case
            for n in range(4, 12): assert uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) == initial[n], (case, model, n)
            assert bytes(uc.mem_read(SP, 16)) == bytes([0xa5]) * 16
            snapshots.append((bytes(uc.mem_read(SOUND, len(raw))), bytes(uc.mem_read(0x03007ff0, 4)), state['callbacks'].copy(), state['vcounts'].copy()))
        assert snapshots[0] == snapshots[1], (case, ident, samples, channels, counter, reverb, scenario, policy, optional)
        outcomes['valid' if ident == ID else 'invalid'] += 1
        outcomes['deadline_exits'] += machines[0][1]['deadline_exits']
    assert outcomes['deadline_exits'] > 0, 'deadline schedules did not trigger an exit'
    report = dict(cases=len(rows), outcomes=dict(outcomes), scope='complete original SoundMain and copied RAM mixer versus composed C; active fixed/resampled channels, reverb, mutable callbacks/global pointer, deterministic VCOUNT schedules, lock release, full sound memory, preserved registers/SP and ARM/Thumb returns',
                  C_integration=False, engine_under_test="production" if a.production else "original", limitations='Semantic composition only; exact private frame, scratch registers, flags, audio access order and cycle timing not matched. Positive sample counts >=16 divisible by four; valid mapped waves and loop geometry.')
    (OUT / ('production-report.json' if a.production else 'report.json')).write_text(json.dumps(report, indent=2) + '\n'); print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
