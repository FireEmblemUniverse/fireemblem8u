#!/usr/bin/env python3
"""Package compiler-generated division fragments as a relocatable archive member."""
import argparse,hashlib,json,subprocess,re
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output-dir',type=Path,required=True);a=p.parse_args()
out=a.output_dir.resolve();out.mkdir(parents=True,exist_ok=True)
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc';plugins=ROOT/'.deps/runtime-division'
parts=[('udiv_entry',['udiv_entry'],['-DMATCHING_ENTRY']),('udiv_layout',['copy_add_zero','leaf_frame','leaf_r4_frame'],['-DMATCHING_COPY_ADD_ZERO','-fplugin-arg-leaf_r4_frame-thumb-return']),('divzero',['divzero_return'],[])]
assembly=['.text\n.balign 4\n']
for name,passes,flags in parts:
 source=ROOT/'research/runtime'/f'{name}.c';target=out/f'{name}.s'
 subprocess.run([str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes',*['-fplugin='+str(plugins/(x+'.so')) for x in passes],*flags,str(source),'-o',str(target)],check=True)
 assembly.append(re.sub(r'\.L([A-Za-z0-9_]+)',r'.L'+name+r'_\1',target.read_text()))
# Set the public function size across the compiler-generated fragments.
assembly.append('''
.text
.size runtime_entry, .-runtime_entry
.balign 4
''')
combined=out/'_udivsi3.s';combined.write_text('\n'.join(assembly))
obj=out/'_udivsi3.o'
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(combined),'-o',str(obj)],check=True)
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(obj)],text=True).splitlines() if len(line.split())==3}
assert symbols['runtime_entry']==0 and symbols['runtime_udiv']==4 and symbols['runtime_divzero']==110,symbols
sizes=subprocess.check_output(['arm-none-eabi-nm','-S',str(obj)],text=True)
assert any(line.split()[1]=='00000078' and line.split()[-1]=='runtime_entry' for line in sizes.splitlines())
subprocess.run(['arm-none-eabi-objcopy','--redefine-sym','runtime_entry=__udivsi3','--localize-symbol','runtime_udiv','--localize-symbol','runtime_divzero',str(obj)],check=True)
print(json.dumps(dict(member=str(obj),sha256=hashlib.sha256(obj.read_bytes()).hexdigest(),production_integrated=False),indent=2))
