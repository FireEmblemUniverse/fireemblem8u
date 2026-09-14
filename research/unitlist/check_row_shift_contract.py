from pathlib import Path
import argparse,subprocess,json,hashlib
parser=argparse.ArgumentParser(description='Check the research row-shift allocator contract; run probe --row-pointer first.')
parser.add_argument('--compiler',default='.deps/unitlist-page-in/agbcc-row-contract')
args=parser.parse_args()
out=Path('.deps/unitlist-page-in');cc=args.compiler;source=Path('research/unitlist/page_change_in_contract.c').read_text();reports=[]
for name,text,opt in [('exact',source,'-O2'),('renamed',source.replace('UnitList_PageChangeIn_Loop','RenamedRowCopy'),'-O2'),('mask',source.replace('0x1f','0xf'),'-O2'),('stride',source.replace('0x20','0x10'),'-O2'),('no-opt',source,'-O0'),('opt3',source,'-O3'),('opt1',source,'-O1'),('wide-mask',source.replace('0x1f','0x3f'),'-O2'),('one-pair',source.replace('if (proc->pageTarget > proc->unk_37)','if (0)'),'-O2'),('attribute-args',source.replace('thumb_row_shift_alloc)', 'thumb_row_shift_alloc(1))'),'-O2')]:
 p=out/('contract-'+name);Path(str(p)+'.c').write_text(text)
 with open(str(p)+'.i','w') as f:subprocess.run(['arm-none-eabi-cpp','-I','tools/agbcc/include','-iquote','include','-iquote','.','-nostdinc','-undef',str(p)+'.c'],stdout=f,check=True)
 r=subprocess.run([cc,'-mthumb-interwork','-Werror',opt,'-fhex-asm','-ffix-debug-line',str(p)+'.i','-o',str(p)+'.s'],capture_output=True,text=True)
 assert (r.returncode==0)==(name in ('exact','renamed')),(name,r.stderr)
 if r.returncode==0:
  subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-mthumb-interwork','-I','include',str(p)+'.s','-o',str(p)+'.o'],check=True)
  subprocess.run(['arm-none-eabi-ld','-T',str(out/'probe.ld'),str(p)+'.o',str(out/'thumb-symbols.o'),'-o',str(p)+'.elf'],check=True)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(p)+'.elf',str(p)+'.bin'],check=True)
  assert Path(str(p)+'.bin').read_bytes()==Path('baserom.gba').read_bytes()[0x91f10:0x920c4],name
 reports.append(dict(name=name,returncode=r.returncode,diagnostic=r.stderr))
controls=[]
for pp in [out/'baseline.i']+sorted(out.glob('row-pointer-*.i')):
 stem=out/('control-'+pp.stem)
 subprocess.run([cc,'-mthumb-interwork','-Wimplicit','-Wparentheses','-Werror','-O2','-fhex-asm','-ffix-debug-line',str(pp),'-o',str(stem)+'.s'],check=True)
 assert Path(str(stem)+'.s').read_bytes()==pp.with_suffix('.s').read_bytes(),pp
 controls.append(pp.name)
assert len(controls)==61, 'Run probe_page_change_in.py --row-pointer before this check'
a=Path('baserom.gba').read_bytes()[0x91f10:0x920c4];b=(out/'contract-exact.bin').read_bytes();assert a==b
report=dict(exact_bytes=len(b),binary_sha256=hashlib.sha256(b).hexdigest(),contracts=reports,unannotated_unchanged=len(controls),controls=controls,production_integrated=False)
(out/'structural-contract-report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
