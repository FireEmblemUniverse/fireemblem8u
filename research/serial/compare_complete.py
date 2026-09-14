#!/usr/bin/env python3
"""Build and compare the complete reset instructions and literal pool."""
from pathlib import Path
import json,subprocess,hashlib
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/serial-reset'
flags=['-O2','-fno-cse-follow-jumps','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-DSERIAL_LR_TRANSFER','-fplugin='+str(OUT/'arm_lr_transfer.so'),'-fplugin-arg-arm_lr_transfer-callee=sio_polling']
subprocess.run(['arm-none-eabi-gcc','-c',*flags,str(ROOT/'research/serial/reset_complete.c'),'-o',str(OUT/'complete.o')],check=True,capture_output=True)
(OUT/'complete.ld').write_text('SECTIONS { .text 0x08b1a1c4 : { *(.text) } sio_polling = 0x08b1a198; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'complete.ld'),str(OUT/'complete.o'),'-o',str(OUT/'complete.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'complete.elf'),str(OUT/'complete.bin')],check=True)
code=(OUT/'complete.bin').read_bytes();original=(ROOT/'baserom.gba').read_bytes()[0xb1a1c4:0xb1a268]
assert code==original,(len(code),len(original))
print(json.dumps(dict(region_bytes=len(code),instruction_bytes=148,c_generated_instruction_bytes=144,retained_svc_assembly_bytes=4,literal_bytes=16,region_sha256=hashlib.sha256(code).hexdigest(),production_integrated=False),indent=2))
