#!/usr/bin/env python3
"""Exercise opt-in pointer ordering, relocation, execution, and rejection paths."""
import argparse
from pathlib import Path
import struct
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as regs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin', type=Path, required=True)
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix='arm-prefix-pool-') as temporary:
        root = Path(temporary)
        source = root / 'probe.c'
        source.write_text('extern volatile unsigned alpha, beta;\nunsigned probe(void) { return alpha + beta; }\n')
        command = ['arm-none-eabi-gcc', '-S', '-O1', '-mcpu=arm7tdmi',
                   '-fplugin=' + str(args.plugin.resolve()), str(source), '-o', str(root / 'probe.s')]
        cases = 0
        for order in ['alpha,beta', 'beta,alpha']:
            subprocess.run(command + ['-marm', '-fplugin-arg-zero_test-prefix-pool=' + order], check=True)
            (root / 'link.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\nalpha = 0x02000000; beta = 0x02000004;\n')
            subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(root/'probe.s'), '-o', str(root/'probe.o')], check=True)
            subprocess.run(['arm-none-eabi-ld', '-T', str(root/'link.ld'), str(root/'probe.o'), '-o', str(root/'probe.elf')], check=True)
            subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(root/'probe.elf'), str(root/'probe.bin')], check=True)
            binary = (root/'probe.bin').read_bytes()
            addresses = {'alpha':0x02000000, 'beta':0x02000004}
            assert struct.unpack('<II', binary[:8]) == tuple(addresses[name] for name in order.split(','))
            symbols = subprocess.check_output(['arm-none-eabi-nm', str(root/'probe.elf')], text=True)
            assert any(line.split() == ['08010008', 'T', 'probe'] for line in symbols.splitlines())
            for a, b in [(0,0), (1,2), (0xffffffff,1), (0x80000000,0x80000000), (0x12345678,0x87654321)]:
                machine = Uc(UC_ARCH_ARM, UC_MODE_ARM)
                machine.mem_map(0x08010000, 0x1000)
                machine.mem_map(0x02000000, 0x1000)
                machine.mem_write(0x08010000, binary)
                machine.mem_write(0x02000000, struct.pack('<II', a, b))
                machine.reg_write(regs.UC_ARM_REG_LR, 0x08010800)
                machine.emu_start(0x08010008, 0x08010800, count=100)
                assert machine.reg_read(regs.UC_ARM_REG_PC) == 0x08010800
                assert machine.reg_read(regs.UC_ARM_REG_R0) == (a+b) & 0xffffffff
                cases += 1
        for order in ['alpha', 'alpha,missing', 'alpha,alpha', 'alpha,beta,extra']:
            result = subprocess.run(command + ['-marm', '-fplugin-arg-zero_test-prefix-pool=' + order], capture_output=True, text=True)
            assert result.returncode and ('prefix pool' in result.stderr or 'manifest' in result.stderr), result.stderr
        result = subprocess.run(command + ['-mthumb', '-fplugin-arg-zero_test-prefix-pool=alpha,beta'], capture_output=True, text=True)
        assert result.returncode and 'requires ARM mode' in result.stderr
        source.write_text('extern volatile unsigned alpha, beta;\nunsigned probe(void) { return alpha + beta; }\nunsigned probe_second(void) { return beta - alpha; }\n')
        shared = ['-fplugin-arg-zero_test-share-prefix-pool', '--param=ggc-min-expand=0', '--param=ggc-min-heapsize=0']
        for order in ['alpha,beta', 'beta,alpha']:
            subprocess.run(command + ['-marm', '-fplugin-arg-zero_test-prefix-pool=' + order] + shared, check=True)
            assembly = (root/'probe.s').read_text()
            assert assembly.count('\t.word\talpha') == 1 and assembly.count('\t.word\tbeta') == 1
            subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(root/'probe.s'), '-o', str(root/'probe.o')], check=True)
            subprocess.run(['arm-none-eabi-ld', '-T', str(root/'link.ld'), str(root/'probe.o'), '-o', str(root/'probe.elf')], check=True)
            subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(root/'probe.elf'), str(root/'probe.bin')], check=True)
            binary = (root/'probe.bin').read_bytes()
            symbols = {line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(root/'probe.elf')],text=True).splitlines() if line.split()[-1] in ['probe','probe_second']}
            for a,b in [(0,0),(1,2),(0xffffffff,1),(0x80000000,0x80000000),(0x12345678,0x87654321)]:
                for function in ['probe','probe_second']:
                    machine = Uc(UC_ARCH_ARM, UC_MODE_ARM)
                    machine.mem_map(0x08010000, 0x1000)
                    machine.mem_map(0x02000000, 0x1000)
                    machine.mem_write(0x08010000, binary)
                    machine.mem_write(0x02000000, struct.pack('<II',a,b))
                    machine.reg_write(regs.UC_ARM_REG_LR,0x08010800)
                    machine.emu_start(symbols[function],0x08010800,count=100)
                    assert machine.reg_read(regs.UC_ARM_REG_PC)==0x08010800
                    assert machine.reg_read(regs.UC_ARM_REG_R0)==((a+b) if function=='probe' else (b-a))&0xffffffff
                    cases += 1
        result = subprocess.run(command + ['-marm','-ffunction-sections','-fplugin-arg-zero_test-prefix-pool=alpha,beta'] + shared, capture_output=True,text=True)
        assert result.returncode and 'requires the same section' in result.stderr
        result = subprocess.run(command + ['-marm','-fplugin-arg-zero_test-share-prefix-pool'],capture_output=True,text=True)
        assert result.returncode
        print(f'{cases} relocated prefix-pool executions pass in both pointer orders; invalid manifests, Thumb placement, cross-section sharing, and missing sharing manifest rejected.')


if __name__ == '__main__':
    main()
