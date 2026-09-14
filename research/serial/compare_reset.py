#!/usr/bin/env python3
"""Compare aligned handshake instructions without modifying compiler output."""
from pathlib import Path
import json,subprocess
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/serial-reset'
OUT.mkdir(exist_ok=True)
subprocess.run(['arm-none-eabi-gcc','-c','-O2','-fno-cse-follow-jumps','-std=gnu89','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',str(ROOT/'research/serial/reset_constrained.c'),'-o',str(OUT/'aligned.o')],check=True,capture_output=True)
# Position the candidate's extra entry push before the original reset entry.
# Thus common instructions and direct poll calls have identical addresses.
(OUT/'aligned.ld').write_text('SECTIONS { .text 0x08b1a1c0 : { *(.text) } sio_polling = 0x08b1a198; SerialDecompressAndJump = 0x080ff000; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'aligned.ld'),str(OUT/'aligned.o'),'-o',str(OUT/'aligned.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'aligned.elf'),str(OUT/'aligned.bin')],check=True)
a=(ROOT/'baserom.gba').read_bytes()[0xb1a1c4:0xb1a244];b=(OUT/'aligned.bin').read_bytes()[4:132]
assert len(a)==len(b)==128
mismatches=[]
for i in range(0,128,4):
 if a[i:i+4]!=b[i:i+4]:mismatches.append(dict(address=hex(0x08b1a1c4+i),original=a[i:i+4].hex(),candidate=b[i:i+4].hex()))
report=dict(compared_instruction_words=32,exact_words=32-len(mismatches),mismatches=mismatches,scope='Aligned 128-byte pre-BIOS handshake only. Extra entry stack save, missing BIOS suffix, literal pool prevent full matching. No output bytes are patched.')
print(json.dumps(report,indent=2))
