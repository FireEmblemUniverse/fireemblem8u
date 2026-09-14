#!/usr/bin/env python3
"""Measure reset draft compiler options without changing the production build."""
from pathlib import Path
import argparse,subprocess,json
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/serial-reset'
parser=argparse.ArgumentParser()
parser.add_argument('--source',type=Path,default=ROOT/'research/serial/reset.c')
args=parser.parse_args()
OUT.mkdir(exist_ok=True)
flags=['-fno-tree-dominator-opts','-fno-tree-vrp','-fno-tree-ccp','-fno-tree-forwprop','-fno-if-conversion','-fno-if-conversion2','-fno-crossjumping','-fno-schedule-insns','-fno-schedule-insns2']
sets=[[]]+[[f] for f in flags]+[['-fno-tree-dominator-opts','-fno-tree-vrp'],['-fno-tree-dominator-opts','-fno-tree-ccp','-fno-tree-vrp']]
reports=[]
for index,options in enumerate(sets):
 stem=OUT/('option-'+str(index));asm=stem.with_suffix('.s');obj=stem.with_suffix('.o');binary=stem.with_suffix('.bin')
 subprocess.run(['arm-none-eabi-gcc','-S','-O2','-std=gnu89','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',*options,str(args.source),'-o',str(asm)],check=True,capture_output=True)
 subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
 s=asm.read_text();reports.append(dict(options=options,bytes=binary.stat().st_size,predicate_moves=s.count('movne\t')+s.count('moveq\t'),assembly=str(asm.relative_to(ROOT))))
(OUT/'option-report.json').write_text(json.dumps(reports,indent=2)+'\n');print(json.dumps(reports,indent=2))
