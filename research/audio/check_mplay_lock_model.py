#!/usr/bin/env python3
"""Independent model of MPlayMain's lock and initial PUSH, including stack aliases."""
import argparse
import hashlib
import itertools
import json
import random
from pathlib import Path

from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r

ROOT = Path(__file__).resolve().parents[2]
ENTRY, END, LITERAL = 0x080cfb68, 0x080cfb78, 0x080cfdcc
DATA, ID = 0x02000000, 0x68736d53


def sub_flags(a, b):
    result = (a - b) & 0xffffffff
    return ((result >> 31) << 3 | (result == 0) << 2 | (a >= b) << 1
            | bool((a ^ b) & (a ^ result) & 0x80000000))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate-bin', type=Path,
                        help='Linked 16-byte candidate at the original entry address')
    args = parser.parse_args()
    rom = (ROOT / 'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    original = rom[ENTRY - 0x08000000:END - 0x08000000]
    code = args.candidate_bin.read_bytes() if args.candidate_bin else original
    assert len(code) == 16
    uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
    uc.mem_map(0x08000000, 0x1000000)
    uc.mem_write(0x08000000, rom)
    uc.mem_write(ENTRY, code)
    uc.mem_map(DATA, 0x4000)
    state = {}

    def on_code(u, address, size, user):
        if address in (END, state['return'] & ~1):
            u.emu_stop()
            return
        assert ENTRY <= address < END, hex(address)
        assert u.reg_read(r.UC_ARM_REG_SP) == state['sp'], hex(address)

    def on_memory(u, kind, address, size, value, user):
        state['accesses'].append((kind, address, size, value if kind == 17 else None))

    uc.hook_add(UC_HOOK_CODE, on_code)
    uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, on_memory)
    rng = random.Random(0xfe810c)
    # Include signed-overflow boundaries and both neighbors of the lock value.
    identifiers = (ID, ID-1, ID+1, 0, 1, 0x7fffffff, 0x80000000,
                   0xffffffff, 0xe8736d53, 0xe8736d54, 0x68730000, 0x00006d53)
    stacks = (DATA+0x100, DATA+0x1000, DATA+0x2000, DATA+0x3fc0)
    returns = (0x08000201, 0x08000280)
    cases = accepted = 0
    overlap_cases = {'saved_player': 0, 'saved_return': 0, 'callback_field': 0}
    for ident, offset, nzcv, sp, ret in itertools.product(
            identifiers, range(-80, 1, 4), range(16), stacks, returns):
        player = sp + offset
        memory = bytearray([0xa5]) * 0x4000
        address = player + 52
        memory[address-DATA:address-DATA+4] = ident.to_bytes(4, 'little')
        wanted = memory.copy()
        regs = [rng.getrandbits(32) for _ in range(13)]
        regs[0] = player
        expected = regs.copy()
        expected[2:4] = [ID, ident]
        accesses = [(16, LITERAL, 4, None), (16, address, 4, None)]
        if ident == ID:
            accepted += 1
            expected[3] = ID + 1
            # The lock store precedes BOTH stack writes, even when they alias.
            for dest, value in ((address, ID+1), (sp-8, player), (sp-4, ret)):
                wanted[dest-DATA:dest-DATA+4] = value.to_bytes(4, 'little')
                accesses.append((17, dest, 4, value))
            expected_sp, expected_pc = sp-8, END
            # ADDS(ID,1): N=0, Z=0, C=0, V=0. STR/PUSH preserve flags.
            expected_cpsr = 0x33
            overlap_cases['saved_player'] += address == sp-8
            overlap_cases['saved_return'] += address == sp-4
            overlap_cases['callback_field'] += player+56 in (sp-8, sp-4)
        else:
            expected_sp, expected_pc = sp, ret & ~1
            expected_cpsr = (0x33 if ret & 1 else 0x13) | sub_flags(ID, ident) << 28
        uc.mem_write(DATA, bytes(memory))
        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv << 28)
        for n, value in enumerate(regs):
            uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), value)
        uc.reg_write(r.UC_ARM_REG_SP, sp)
        uc.reg_write(r.UC_ARM_REG_LR, ret)
        state.update(sp=sp, accesses=[], **{'return': ret})
        uc.emu_start(ENTRY | 1, 0, count=10)
        assert uc.reg_read(r.UC_ARM_REG_PC) == expected_pc
        assert uc.reg_read(r.UC_ARM_REG_SP) == expected_sp
        assert uc.reg_read(r.UC_ARM_REG_LR) == ret
        assert uc.reg_read(r.UC_ARM_REG_CPSR) == expected_cpsr
        assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)] == expected
        assert bytes(uc.mem_read(DATA, 0x4000)) == wanted
        assert state['accesses'] == accesses, (state['accesses'], accesses)
        cases += 1
    report = dict(cases=cases, accepted=accepted, rejected=cases-accepted,
                  overlap_cases=overlap_cases, instruction_bytes=16,
                  candidate=str(args.candidate_bin) if args.candidate_bin else None,
                  exact_original_bytes=code == original,
                  code_sha256=hashlib.sha256(code).hexdigest(),
                  scope='Lock only: 12 identifiers, 21 player/stack placements, all 16 NZCV inputs, '
                        'four stacks, ARM/Thumb rejection returns. Checks all registers, CPSR, '
                        'SP before every instruction, all RAM, and ordered memory accesses. '
                        'Includes lock stores aliasing each saved word and saved words overwriting callback fields.',
                  limitations='Stops before callback setup. Candidate mode verifies a supplied binary; '
                               'it does not establish source/compiler provenance or full MPlayMain behavior.')
    out = ROOT / '.deps/soundmain-packed/mplay-lock'
    out.mkdir(parents=True, exist_ok=True)
    name = 'candidate-model.json' if args.candidate_bin else 'original-model.json'
    (out / name).write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
