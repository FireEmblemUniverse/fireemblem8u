#!/usr/bin/env python3
"""Verify exact IRQ register setup before the retained SPSR/frame operations."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/irq-search'
flags=['-O2','-fno-shrink-wrap','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-fplugin='+str(OUT/'arm_noreturn_frame.so'),'-fplugin-arg-arm_noreturn_frame-callee=IrqSaveFrame','-fplugin-arg-arm_noreturn_frame-adjacent=IrqSaveFrame']
subprocess.run(['arm-none-eabi-gcc','-c',*flags,str(ROOT/'research/irq/entry.c'),'-o',str(OUT/'entry.o')],check=True,capture_output=True)
(OUT/'entry.ld').write_text('SECTIONS { .text 0x080000fc : { *(.text) } IrqSaveFrame = 0x08000110; ASSERT(IrqEntry + SIZEOF(.text) == IrqSaveFrame, "IRQ entry adjacency changed") }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'entry.ld'),str(OUT/'entry.o'),'-o',str(OUT/'entry.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'entry.elf'),str(OUT/'entry.bin')],check=True)
code=(OUT/'entry.bin').read_bytes();assert code==(ROOT/'baserom.gba').read_bytes()[0xfc:0x110]
bad=OUT/'entry-displaced.ld'
bad.write_text((OUT/'entry.ld').read_text().replace('IrqSaveFrame = 0x08000110','IrqSaveFrame = 0x08000114'))
result=subprocess.run(['arm-none-eabi-ld','-T',str(bad),str(OUT/'entry.o'),'-o',str(OUT/'entry-displaced.elf')],capture_output=True,text=True)
assert result.returncode and 'IRQ entry adjacency changed' in result.stderr
print(json.dumps(dict(displaced_link_rejected=True,instruction_bytes=len(code),matching_words=5,source_sha256=hashlib.sha256((ROOT/'research/irq/entry.c').read_bytes()).hexdigest(),code_sha256=hashlib.sha256(code).hexdigest(),production_integrated=False,scope='Exact ordinary register setup before SPSR capture/frame save, with isolated linker adjacency check. The production startup section split is not yet changed.'),indent=2))
