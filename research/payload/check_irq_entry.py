#!/usr/bin/env python3
"""Check C payload IRQ register setup against bytes and an independent model."""
import hashlib
import json
import random
import subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/payload-irq-entry'
OUT.mkdir(exist_ok=True)
source = ROOT / 'research/payload/irq_entry.c'
subprocess.run(['python3', str(ROOT / 'tools/arm-dispatch/build_arm_noreturn_frame.py'),
                '--output-dir', str(OUT)], check=True)
flags = ['-O2', '-fno-shrink-wrap', '-fno-schedule-insns2', '-marm',
         '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding',
         '-fno-unwind-tables', '-fno-asynchronous-unwind-tables', '-Werror=attributes',
         '-fplugin=' + str(OUT / 'arm_noreturn_frame.so'),
         '-fplugin-arg-arm_noreturn_frame-callee=PayloadIrqSaveFrame',
         '-fplugin-arg-arm_noreturn_frame-adjacent=PayloadIrqSaveFrame']
subprocess.run(['arm-none-eabi-gcc', '-c', *flags, str(source), '-o', str(OUT / 'entry.o')], check=True)
layout = 'SECTIONS { .text 0x0201003c : { *(.text) } PayloadIrqSaveFrame = 0x02010050; ASSERT(IntrMain + SIZEOF(.text) == PayloadIrqSaveFrame, "IRQ entry adjacency changed") }'
(OUT / 'entry.ld').write_text(layout)
subprocess.run(['arm-none-eabi-ld', '-T', str(OUT / 'entry.ld'), str(OUT / 'entry.o'), '-o', str(OUT / 'entry.elf')], check=True)
subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', str(OUT / 'entry.elf'), str(OUT / 'entry.bin')], check=True)
code = (OUT / 'entry.bin').read_bytes()
images = ['mgfembp', 'mgfembp_20030206', 'mgfembp_20030219']
for name in images:
    assert code == (ROOT / f'mgfembp/{name}.bin').read_bytes()[0x3c:0x50]
(OUT / 'displaced.ld').write_text(layout.replace('= 0x02010050', '= 0x02010054'))
bad = subprocess.run(['arm-none-eabi-ld', '-T', str(OUT / 'displaced.ld'), str(OUT / 'entry.o'), '-o', str(OUT / 'displaced.elf')], capture_output=True, text=True)
assert bad.returncode and 'IRQ entry adjacency changed' in bad.stderr
rng = random.Random(0x1003c)
regs = [getattr(r, f'UC_ARM_REG_R{n}') for n in range(15)]
for case in range(512):
    word = rng.getrandbits(32)
    initial = [rng.getrandbits(32) for _ in regs]
    initial[13] = 0x03004000
    cpsr = 0x92 | ((case % 16) << 28)
    u = Uc(UC_ARCH_ARM, UC_MODE_ARM)
    u.mem_map(0x02010000, 0x1000)
    u.mem_map(0x04000000, 0x1000)
    u.mem_write(0x0201003c, code)
    u.mem_write(0x04000200, word.to_bytes(4, 'little'))
    u.reg_write(r.UC_ARM_REG_CPSR, cpsr)
    for reg, value in zip(regs, initial):
        u.reg_write(reg, value)
    writes = []
    u.hook_add(UC_HOOK_MEM_WRITE, lambda u, a, addr, size, value, data: writes.append((addr, size, value)))
    u.emu_start(0x0201003c, 0x02010050, count=5)
    expected = initial.copy()
    expected[1:4] = [word & 0xffff, word, 0x04000200]
    assert [u.reg_read(reg) for reg in regs] == expected
    assert u.reg_read(r.UC_ARM_REG_CPSR) == cpsr
    assert u.reg_read(r.UC_ARM_REG_PC) == 0x02010050 and not writes
report = dict(exact_images=images, exact_code_bytes=len(code), model_cases=512,
              displaced_layout_rejected=True, production_integrated=False,
              source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
              code_sha256=hashlib.sha256(code).hexdigest(),
              scope='IRQ register setup only; all condition flags and random IE/IF words, registers and no writes. Excludes SPSR capture, saved frame, startup ADR and dispatch.')
(ROOT / 'docs/payload-irq-entry-research.json').write_text(json.dumps(report, indent=2) + '\n')
print('20 bytes match three payloads; 512 register/flag cases and displaced-layout rejection pass')
