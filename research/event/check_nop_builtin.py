#!/usr/bin/env python3
"""Compare full event object using a pinned experimental NOP builtin compiler."""
import hashlib,json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/event-nop'
compiler=json.loads((OUT/'compiler.json').read_text())['compiler']
source=ROOT/'src/eventinfo.c';text=source.read_text();assert text.count('asm("nop");')==2
candidate=OUT/'eventinfo.c';candidate.write_text(text.replace('asm("nop");','__builtin_matching_nop();'))
flags=['-mthumb-interwork','-Wimplicit','-Wparentheses','-Werror','-O2','-fhex-asm','-ffix-debug-line','-g']
for name,path,cc in [('builtin',candidate,compiler),('control',source,compiler),('reference',source,str(ROOT/'tools/agbcc/bin/agbcc'))]:
 cpp=subprocess.check_output(['arm-none-eabi-cpp','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-iquote',str(ROOT),'-nostdinc','-undef',str(path)])
 preprocessed=cpp.decode().encode('cp932')
 subprocess.run([cc,*flags,'-o',str(OUT/(name+'.s'))],input=preprocessed,check=True)
 subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-mthumb-interwork','-I',str(ROOT/'include'),str(OUT/(name+'.s')),'-o',str(OUT/(name+'.o'))],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/(name+'.o')),str(OUT/(name+'.bin'))],check=True)
reference=(OUT/'reference.bin').read_bytes();control=(OUT/'control.bin').read_bytes();actual=(OUT/'builtin.bin').read_bytes()
report=dict(reference_bytes=len(reference),candidate_bytes=len(actual),unmodified_control_exact=control==reference,candidate_exact=actual==reference,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),candidate_source_sha256=hashlib.sha256(candidate.read_bytes()).hexdigest(),compiler=json.loads((OUT/'compiler.json').read_text()),production_integrated=False)
if actual!=reference: report['first_difference']=next((i for i,(a,b) in enumerate(zip(actual,reference)) if a!=b),min(len(actual),len(reference)))
(ROOT/'docs/event-nop-builtin-research.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
