#!/usr/bin/env python3
"""Compare the 180-byte IRQ search window without modifying compiler output."""
from pathlib import Path
import json,subprocess,hashlib
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/irq-search'
flags=['-O2','-fno-cse-follow-jumps','-fno-shrink-wrap','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-DIRQ_PRIVATE_FRAME','-fplugin='+str(OUT/'arm_noreturn_frame.so'),'-fplugin-arg-arm_noreturn_frame-callee=IrqSelected']
subprocess.run(['arm-none-eabi-gcc','-c',*flags,str(ROOT/'research/irq/search_constrained.c'),'-o',str(OUT/'aligned.o')],check=True,capture_output=True)
(OUT/'aligned.ld').write_text('SECTIONS { .text 0x08000118 : { *(.text) } IrqSelected = 0x080001cc; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'aligned.ld'),str(OUT/'aligned.o'),'-o',str(OUT/'aligned.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'aligned.elf'),str(OUT/'aligned.bin')],check=True)
code=(OUT/'aligned.bin').read_bytes();original=(ROOT/'baserom.gba').read_bytes()[0x118:0x1cc]
assert len(original)==180 and len(code)==192
mismatches=[dict(address=hex(0x08000118+i),original=original[i:i+4].hex(),candidate=code[i:i+4].hex()) for i in range(0,180,4) if original[i:i+4]!=code[i:i+4]]
print(json.dumps(dict(compared_instruction_words=45,matching_instruction_words=45-len(mismatches),candidate_total_bytes=len(code),mismatches=mismatches,production_integrated=False,scope='Aligned original search window only. Extra terminal call and separate halt loops remain beyond that window; this is not an executable drop-in replacement.'),indent=2))
