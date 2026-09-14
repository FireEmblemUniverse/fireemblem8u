#!/usr/bin/env python3
"""Compare aligned handshake instructions without modifying compiler output."""
from pathlib import Path
import argparse,json,subprocess
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/serial-reset'
parser=argparse.ArgumentParser()
parser.add_argument('--private-frame',action='store_true')
args=parser.parse_args()
extra=['-DSERIAL_PRIVATE_FRAME','-fplugin='+str(OUT/'arm_noreturn_frame.so'),'-fplugin-arg-arm_noreturn_frame-callee=sio_polling','-fplugin-arg-arm_noreturn_frame-callee=SerialDecompressAndJump'] if args.private_frame else []
entry=0x08b1a1c4 if args.private_frame else 0x08b1a1c0
skip=0 if args.private_frame else 4
OUT.mkdir(exist_ok=True)
subprocess.run(['arm-none-eabi-gcc','-c','-O2','-fno-cse-follow-jumps','-std=gnu89','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',*extra,str(ROOT/'research/serial/reset_constrained.c'),'-o',str(OUT/'aligned.o')],check=True,capture_output=True)
# Position the candidate's extra entry push before the original reset entry.
# Thus common instructions and direct poll calls have identical addresses.
(OUT/'aligned.ld').write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } sio_polling = 0x08b1a198; SerialDecompressAndJump = 0x080ff000; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'aligned.ld'),str(OUT/'aligned.o'),'-o',str(OUT/'aligned.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'aligned.elf'),str(OUT/'aligned.bin')],check=True)
a=(ROOT/'baserom.gba').read_bytes()[0xb1a1c4:0xb1a244];b=(OUT/'aligned.bin').read_bytes()[skip:skip+128]
assert len(a)==len(b)==128
mismatches=[]
for i in range(0,128,4):
 if a[i:i+4]!=b[i:i+4]:mismatches.append(dict(address=hex(0x08b1a1c4+i),original=a[i:i+4].hex(),candidate=b[i:i+4].hex()))
report=dict(private_frame=args.private_frame,compared_instruction_words=32,exact_words=32-len(mismatches),mismatches=mismatches,scope='Aligned 128-byte pre-BIOS handshake only. Missing BIOS suffix and literal pool prevent full matching; the ordinary build also has an extra entry save. No output bytes are patched.')
print(json.dumps(report,indent=2))
