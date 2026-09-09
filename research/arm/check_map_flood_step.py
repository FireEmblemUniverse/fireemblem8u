#!/usr/bin/env python3
"""Compare the reconstructed helper with canonical ARM execution on edge cases."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_WRITE
from unicorn import arm_const as regs

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/map-flood-match'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin', type=Path, help='optional experimental GCC plugin')
    args = parser.parse_args()
    rom = (ROOT / 'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    addresses = struct.unpack_from('<5I', rom, 0x770)
    cost_table, state, working, terrain, units = addresses
    names = ['gWorkingTerrainMoveCosts', 'gMovMapFillState', 'gWorkingBmMap', 'gBmMapTerrain', 'gBmMapUnit']
    OUT.mkdir(parents=True, exist_ok=True)
    flags = ['-std=gnu89', '-O1', '-marm', '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding',
             '-fno-builtin', '-ffixed-r14', '-fomit-frame-pointer', '-fno-schedule-insns', '-fno-schedule-insns2',
             '-fno-auto-inc-dec', '-fno-ivopts', '-fno-if-conversion', '-fno-if-conversion2', '-fno-reorder-blocks']
    if args.plugin:
        flags += ['-fplugin=' + str(args.plugin.resolve())]
    subprocess.run(['arm-none-eabi-gcc', '-S', str(Path(__file__).with_name('map_flood_step.c')),
                    *flags, '-o', str(OUT / 'candidate.s')], check=True)
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', '-o', str(OUT / 'candidate.o'), str(OUT / 'candidate.s')], check=True)
    script = 'SECTIONS { . = 0x08000784; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\n'
    script += ''.join(n + ' = ' + hex(a) + ';\n' for n, a in zip(names, addresses))
    (OUT / 'candidate.ld').write_text(script)
    subprocess.run(['arm-none-eabi-ld', '-T', str(OUT / 'candidate.ld'), '-o', str(OUT / 'candidate.elf'), str(OUT / 'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT / 'candidate.elf'), str(OUT / 'candidate.bin')], check=True)
    code = (OUT / 'candidate.bin').read_bytes()
    assert len(code) < 0xB00 - 0x784
    machines = []
    for replacement in (None, code):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        uc.mem_map(0x08000000, 0x1000)
        uc.mem_write(0x08000000, rom[:0x1000])
        if replacement:
            uc.mem_write(0x08000784, replacement)
        uc.mem_map(0x02000000, 0x40000)
        uc.mem_map(0x03000000, 0x8000)
        machines.append(uc)
    # budget, old destination, source cost, terrain cost, unit-check flag,
    # moving unit, destination unit, expected queue insertion
    cases = [(10,9,3,6,0,1,0,False), (9,10,3,6,0,1,0,True),
             (8,10,3,6,0,1,0,False), (9,10,3,6,1,0x81,0x82,True),
             (9,10,3,6,1,1,0x81,False), (9,10,3,6,0,1,0x81,True),
             (9,10,3,6,1,0x81,0,True), (255,255,200,100,0,1,0,False),
             (0,0,0,0,0,1,0,False), (0,1,0,0,0,1,0,True)]
    count = 0
    flag_differences = 0
    flag_difference_masks = set()
    for coordinate in (16,129):
        for dx, dy in ((-1,0),(1,0),(0,-1),(0,1)):
            for budget, old, source_cost, terrain_cost, check, own, unit, accepted in cases:
                x, y = coordinate + dx, coordinate + dy
                expected_cost = source_cost + terrain_cost
                outputs = []
                flags_after = []
                for uc in machines:
                    for pointer, table, data, fill in [(terrain,0x02002000,0x02008000,2),
                                                       (units,0x02002400,0x02011000,0),
                                                       (working,0x02002800,0x0201A000,255)]:
                        uc.mem_write(pointer, struct.pack('<I',table))
                        uc.mem_write(table, struct.pack('<144I',*(data + row*256 for row in range(144))))
                        uc.mem_write(data, bytes([fill]) * (144*256))
                    target = 0x0201A000 + y*256 + x
                    uc.mem_write(target, bytes([old]))
                    uc.mem_write(0x0201A000 + coordinate*256 + coordinate, bytes([source_cost]))
                    uc.mem_write(0x02011000 + y*256 + x, bytes([unit]))
                    uc.mem_write(cost_table, bytes([terrain_cost]) * 256)
                    source, queue, stack = 0x02004000, 0x02004100, 0x03007000
                    uc.mem_write(source, bytes([coordinate,coordinate,5,source_cost]))
                    uc.mem_write(queue, b'\xA5'*16)
                    uc.mem_write(state, struct.pack('<IIBBBB',source,queue,check,budget,own,0x55))
                    allowed = [(state+4,state+8),(queue,queue+4),(target,target+1),(stack-28,stack)]
                    violations = []
                    def watch(machine, access, address, size, value, user_data):
                        if not any(a <= address and address+size <= b for a,b in allowed):
                            violations.append((address,size)); machine.emu_stop()
                    hook = uc.hook_add(UC_HOOK_MEM_WRITE,watch)
                    uc.reg_write(regs.UC_ARM_REG_CPSR,0x13 | ((count%16)<<28))
                    uc.reg_write(regs.UC_ARM_REG_R0,0x123)
                    uc.reg_write(regs.UC_ARM_REG_R1,dx & 0xFFFFFFFF)
                    uc.reg_write(regs.UC_ARM_REG_R2,dy & 0xFFFFFFFF)
                    for r in range(4,13): uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)),r*0x1010101)
                    uc.reg_write(regs.UC_ARM_REG_SP,stack)
                    uc.reg_write(regs.UC_ARM_REG_LR,0x08000B00)
                    uc.emu_start(0x08000784,0x08000B00,count=1000)
                    uc.hook_del(hook)
                    assert not violations, violations
                    assert uc.reg_read(regs.UC_ARM_REG_PC)==0x08000B00
                    assert uc.reg_read(regs.UC_ARM_REG_SP)==stack
                    for r in range(4,13): assert uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r)))==r*0x1010101
                    result = (bytes(uc.mem_read(state,12)),bytes(uc.mem_read(queue,16)),bytes(uc.mem_read(target,1)))
                    expected_state = struct.pack('<IIBBBB',source,queue+4*accepted,check,budget,own,0x55)
                    expected_queue = bytes([x,y,0x23,expected_cost])+b'\xA5'*12 if accepted else b'\xA5'*16
                    assert result == (expected_state,expected_queue,bytes([expected_cost if accepted else old])), (coordinate,dx,dy,cases.index((budget,old,source_cost,terrain_cost,check,own,unit,accepted)))
                    outputs.append(result)
                    flags_after.append(uc.reg_read(regs.UC_ARM_REG_CPSR) & 0xF0000000)
                assert outputs[0]==outputs[1]
                if flags_after[0] != flags_after[1]:
                    flag_difference_masks.add(hex(flags_after[0] ^ flags_after[1]))
                flag_differences += flags_after[0] != flags_after[1]
                count += 1
    original = rom[0x784:0x850]
    differences = [{'address': hex(0x08000784+i), 'original_bytes': original[i:i+4].hex(),
                    'candidate_bytes': code[i:i+4].hex()}
                   for i in range(0,204,4) if original[i:i+4] != code[i:i+4]]
    report = {'candidate_sha256': hashlib.sha256(code).hexdigest(),
              'source_sha256': hashlib.sha256(Path(__file__).with_name('map_flood_step.c').read_bytes()).hexdigest(),
              'compiler_version': subprocess.check_output(['arm-none-eabi-gcc','-dumpfullversion'],text=True).strip(),
              'plugin_sha256': hashlib.sha256(args.plugin.read_bytes()).hexdigest() if args.plugin else None,
              'compiler_flags': flags, 'cases': count, 'return_nzcv_difference_cases': flag_differences,
              'return_nzcv_difference_masks': sorted(flag_difference_masks),
              'original_instruction_bytes': 204, 'candidate_section_bytes': len(code),
              'differing_words': differences}
    (OUT / 'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(str(len(differences))+' differing original instruction words; '+str(flag_differences)+' return-NZCV differences.')
    print(str(count)+' cases agree between original ARM, compiled C, and expected queue/map effects.')
    print('Candidate section: '+str(len(code))+' bytes; original helper body: 204 bytes. Still nonmatching.')


if __name__ == '__main__':
    main()
