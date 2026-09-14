#!/usr/bin/env python3
"""Package compiler-generated division fragments as a relocatable archive member."""
import argparse,hashlib,json,subprocess,re
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output-dir',type=Path,required=True);a=p.parse_args()
out=a.output_dir.resolve();out.mkdir(parents=True,exist_ok=True)
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc';plugins=out/'plugins'
plugins.mkdir(exist_ok=True)
parts=[('smod_entry',['smod_entry'],['-DMATCHING_ENTRY']),('smod_shared_flags',['leaf_frame','saved_sign_frame','thumb_sign_branches'],['-Druntime_smod=runtime_udiv','-fplugin-arg-thumb_sign_branches-incoming-r1-flags']),('divzero',['divzero_return'],[])]
for name in ('smod_entry','leaf_frame','saved_sign_frame','thumb_sign_branches','divzero_return'):
 subprocess.run(['python3',str(ROOT/'tools/arm-dispatch'/f'build_{name}.py'),'--compiler',str(cc),'--output-dir',str(plugins)],check=True)
assembly=['.text\n.balign 4,0\n']
for name,passes,flags in parts:
 source=ROOT/'research/runtime'/f'{name}.c';target=out/f'{name}.s'
 subprocess.run([str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes',*['-fplugin='+str(plugins/(x+'.so')) for x in passes],*flags,str(source),'-o',str(target)],check=True)
 assembly.append(re.sub(r'\.L([A-Za-z0-9_]+)',r'.L'+name+r'_\1',target.read_text()))
# Set the public function size across the compiler-generated fragments.
assembly.append('''
.text
.size runtime_entry, .-runtime_entry
.balign 4,0
''')
combined=out/'_modsi3.s';combined.write_text('\n'.join(assembly))
obj=out/'_modsi3.o'
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(combined),'-o',str(obj)],check=True)
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(obj)],text=True).splitlines() if len(line.split())==3}
assert symbols['runtime_entry']==0 and symbols['runtime_udiv']==6 and symbols['runtime_divzero']==196,symbols
sizes=subprocess.check_output(['arm-none-eabi-nm','-S',str(obj)],text=True)
assert any(line.split()[1]=='000000ce' and line.split()[-1]=='runtime_entry' for line in sizes.splitlines())
subprocess.run(['arm-none-eabi-objcopy','--redefine-sym','runtime_entry=__modsi3','--localize-symbol','runtime_udiv','--localize-symbol','runtime_divzero',str(obj)],check=True)
report=dict(member=str(obj),sha256=hashlib.sha256(obj.read_bytes()).hexdigest(),compiler_sha256=hashlib.sha256(cc.read_bytes()).hexdigest(),source_sha256={name:hashlib.sha256((ROOT/'research/runtime'/f'{name}.c').read_bytes()).hexdigest() for name,_,_ in parts},plugin_sha256={path.name:hashlib.sha256(path.read_bytes()).hexdigest() for path in plugins.glob('*.so')})
(out/'smod-build.json').write_text(json.dumps(report,indent=2)+'\n')
print(obj)
