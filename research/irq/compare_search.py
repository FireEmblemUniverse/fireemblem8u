#!/usr/bin/env python3
"""Compare the 180-byte IRQ search window without modifying compiler output."""
from pathlib import Path
import argparse,json,subprocess,hashlib
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/irq-search'
parser=argparse.ArgumentParser()
parser.add_argument('--fold-halts',action='store_true')
parser.add_argument('--adjacent',action='store_true')
args=parser.parse_args()
extra=[]
if args.fold_halts:extra.append('-fplugin-arg-arm_noreturn_frame-fold-halts=2')
if args.adjacent:extra.append('-fplugin-arg-arm_noreturn_frame-adjacent=IrqSelected')
flags=['-O2','-fno-cse-follow-jumps','-fno-shrink-wrap','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-DIRQ_PRIVATE_FRAME','-fplugin='+str(OUT/'arm_noreturn_frame.so'),'-fplugin-arg-arm_noreturn_frame-callee=IrqSelected']
subprocess.run(['arm-none-eabi-gcc','-c',*flags,*extra,str(ROOT/'research/irq/search_constrained.c'),'-o',str(OUT/'aligned.o')],check=True,capture_output=True)
(OUT/'aligned.ld').write_text('SECTIONS { .text 0x08000118 : { *(.text) } IrqSelected = 0x080001cc; }')
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'aligned.ld'),str(OUT/'aligned.o'),'-o',str(OUT/'aligned.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'aligned.elf'),str(OUT/'aligned.bin')],check=True)
code=(OUT/'aligned.bin').read_bytes();original=(ROOT/'baserom.gba').read_bytes()[0x118:0x1cc]
assert len(original)==180 and len(code)==192-(8 if args.fold_halts else 0)-(4 if args.adjacent else 0)
if args.adjacent:assert 0x08000118+len(code)==0x080001cc and code==original
mismatches=[dict(address=hex(0x08000118+i),original=original[i:i+4].hex(),candidate=code[i:i+4].hex()) for i in range(0,180,4) if original[i:i+4]!=code[i:i+4]]
print(json.dumps(dict(fold_halts=args.fold_halts,adjacent=args.adjacent,compared_instruction_words=45,matching_instruction_words=45-len(mismatches),candidate_total_bytes=len(code),mismatches=mismatches,production_integrated=False,scope='Original 180-byte search window. Adjacent mode additionally requires section end equal the original IrqSelected address and exact complete bytes. Otherwise extra handoff/loop code remains outside the comparison.'),indent=2))
