#!/usr/bin/env python3
"""Confirm the assembler/linker reject out-of-range Thumb terminal branches."""
import subprocess
import tempfile
from pathlib import Path


def main():
    accepted = rejected = 0
    with tempfile.TemporaryDirectory() as temp:
        root = Path(temp)
        for displacement in (-2050, -2048, -2, 0, 2046, 2048):
            target = (0x08010004+displacement)|1
            (root/'probe.s').write_text(f'.syntax unified\n.thumb\n.global probe,helper\n.thumb_func\nprobe:\n b #helper\n.thumb_set helper,{target:#x}\n')
            result = subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(root/'probe.s'), '-o', str(root/'probe.o')], capture_output=True)
            if result.returncode == 0:
                result = subprocess.run(['arm-none-eabi-ld', '-Ttext=0x08010000', str(root/'probe.o'), '-o', str(root/'probe.elf')], capture_output=True)
            if -2048 <= displacement <= 2046:
                assert result.returncode == 0, result.stderr
                subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(root/'probe.elf'), str(root/'probe.bin')], check=True)
                word = int.from_bytes((root/'probe.bin').read_bytes(), 'little')
                assert word == 0xe000 | ((displacement//2)&0x7ff), (displacement, hex(word))
                accepted += 1
            else:
                assert result.returncode != 0, displacement
                rejected += 1
    print(f'{accepted} in-range branch encodings exact; {rejected} out-of-range branches rejected.')


if __name__ == '__main__':
    main()
