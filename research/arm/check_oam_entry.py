#!/usr/bin/env python3
"""Validate matching low OAM entry, shared-frame model and backend rejects."""
from pathlib import Path
import hashlib,json,subprocess,sys
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/oam-entry-backend'
subprocess.run([sys.executable,str(ROOT/'tools/arm-dispatch/build_oam_entry.py')],check=True,capture_output=True)
source=(ROOT/'research/arm/put_oam_lo.c').read_text();compiler=str(ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc')
flags=[compiler,'-c','-O2','-fno-schedule-insns2','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables']
plugin=['-fplugin='+str(OUT/'oam_entry.so')]
def compile(name,text,extra):
 p=OUT/(name+'.c');p.write_text(text)
 return subprocess.run(flags+extra+[str(p),'-o',str(OUT/(name+'.o'))],capture_output=True,text=True)
r=compile('candidate',source,plugin+['-DRESEARCH_OAM_ENTRY']);assert r.returncode==0,r.stderr
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(line.split())==3}
layout=('SECTIONS { .pool 0x08000530 : { *(.rodata.oam_lo_cursor) } .text 0x08000534 : { *(.text) } '
        'gOamLoPutIt = %d; PutOamSharedBody = %d; PutOamHi = %d; '
        'ASSERT(PutOamSharedBody == PutOamHi + 8, "OAM shared frame entry moved") '
        'ASSERT(PutOamLo == PutOamLoCursorPointer + 4, "OAM cursor pool moved") '
        'ASSERT(SIZEOF(.text) == 12, "OAM low code size changed") }')%(symbols['gOamLoPutIt'],symbols['PutOamSharedBody'],symbols['PutOamHi'])
(OUT/'candidate.ld').write_text(layout)
subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'candidate.ld'),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True)
subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text','-j','.pool',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
code=(OUT/'candidate.bin').read_bytes();assert code==(ROOT/'baserom.gba').read_bytes()[0x530:0x540]
mutants=[('size',source.replace('entryStack -= 4','entryStack -= 5'),[]),('saved_register',source.replace('entryStack[1] = saved5','entryStack[1] = saved6'),['-fno-late-combine-instructions']),('cursor_symbol',source.replace('gOamLoPutIt','OtherCursor'),[]),('shared_body',source.replace('PutOamSharedBody','OtherBody'),[]),('argument_count',source.replace(', unsigned attr)',')'),[]),('debug',source,['-g']),('unwind',source,['-funwind-tables']),('thumb',source,['-mthumb'])]
for name,text,extra in mutants:
 r=compile(name,text,plugin+['-DRESEARCH_OAM_ENTRY']+extra)
 assert r.returncode!=0 and 'OAM entry' in r.stderr,(name,r.stderr)
for name,extra in [('plain',[]),('unannotated',plugin)]:
 r=compile(name,source,extra);assert r.returncode==0,r.stderr
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/(name+'.o')),str(OUT/(name+'.bin'))],check=True)
assert (OUT/'plain.bin').read_bytes()==(OUT/'unannotated.bin').read_bytes()
for name,old,new in [('pool','.pool 0x08000530','.pool 0x0800052c'),('body','PutOamSharedBody = %d'%symbols['PutOamSharedBody'],'PutOamSharedBody = %d'%(symbols['PutOamSharedBody']+4))]:
 (OUT/(name+'.ld')).write_text(layout.replace(old,new))
 r=subprocess.run(['arm-none-eabi-ld','-T',str(OUT/(name+'.ld')),str(OUT/'candidate.o'),'-o',str(OUT/(name+'.elf'))],capture_output=True,text=True)
 assert r.returncode!=0 and 'OAM' in r.stderr
with (OUT/'execution.log').open('w') as log:
 subprocess.run([sys.executable,str(ROOT/'research/arm/check_put_oam.py'),'--plugin',str(ROOT/'.deps/arm-matching-plugin/zero_test.so'),'--low','--low-candidate',str(OUT/'candidate.bin')],stdout=log,stderr=subprocess.STDOUT,check=True)
execution=json.loads((ROOT/'.deps/put-oam-match/execution-low-report.json').read_text())
print(json.dumps(dict(bytes=16,instruction_bytes=12,c_pointer_bytes=4,sha256=hashlib.sha256(code).hexdigest(),source_sha256=hashlib.sha256(source.encode()).hexdigest(),backend_sha256=hashlib.sha256((ROOT/'tools/arm-dispatch/oam_entry.cc').read_bytes()).hexdigest(),rejected=[m[0] for m in mutants],displaced_layouts_rejected=['pool','body'],unannotated_control_unchanged=True,execution=execution,production_integrated=False),indent=2))
