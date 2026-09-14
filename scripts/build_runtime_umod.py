#!/usr/bin/env python3
"""Package compiler-generated modulus fragments as a relocatable archive member."""
import argparse,hashlib,json,subprocess,re
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output-dir',type=Path,required=True);a=p.parse_args()
out=a.output_dir.resolve();out.mkdir(parents=True,exist_ok=True)
cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc';plugins=out/'plugins'
plugins.mkdir(exist_ok=True)
parts=[('umod_entry',['umod_entry'],[]),('umod_entry_state',['leaf_frame','leaf_r4_frame'],['-fplugin-arg-leaf_r4_frame-thumb-return','-fplugin-arg-leaf_r4_frame-zero-r2-return']),('divzero',['divzero_return'],[])]
for name in ('umod_entry','leaf_frame','leaf_r4_frame','divzero_return'):
 subprocess.run(['python3',str(ROOT/'tools/arm-dispatch'/f'build_{name}.py'),'--compiler',str(cc),'--output-dir',str(plugins)],check=True)
assembly=['.text\n.balign 4\n']
for name,passes,flags in parts:
 source=ROOT/'runtime'/f'{name}.c';target=out/f'{name}.s'
 subprocess.run([str(cc),'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes',*['-fplugin='+str(plugins/(x+'.so')) for x in passes],*flags,str(source),'-o',str(target)],check=True)
 assembly.append(re.sub(r'\.L([A-Za-z0-9_]+)',r'.L'+name+r'_\1',target.read_text()))
# Set the public function size across the compiler-generated fragments.
assembly.append('''
.text
.size runtime_mod_entry, .-runtime_mod_entry
.balign 4
''')
combined=out/'_umodsi3.s';combined.write_text('\n'.join(assembly))
obj=out/'_umodsi3.o'
subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(combined),'-o',str(obj)],check=True)
symbols={line.split()[-1]:int(line.split()[0],16) for line in subprocess.check_output(['arm-none-eabi-nm',str(obj)],text=True).splitlines() if len(line.split())==3}
assert symbols['runtime_mod_entry']==0 and symbols['runtime_umod']==12 and symbols['runtime_divzero']==182,symbols
sizes=subprocess.check_output(['arm-none-eabi-nm','-S',str(obj)],text=True)
assert any(line.split()[1]=='000000c0' and line.split()[-1]=='runtime_mod_entry' for line in sizes.splitlines())
subprocess.run(['arm-none-eabi-objcopy','--redefine-sym','runtime_mod_entry=__umodsi3','--localize-symbol','runtime_umod','--localize-symbol','runtime_divzero',str(obj)],check=True)
report=dict(member=str(obj),sha256=hashlib.sha256(obj.read_bytes()).hexdigest(),compiler_sha256=hashlib.sha256(cc.read_bytes()).hexdigest(),source_sha256={name:hashlib.sha256((ROOT/'runtime'/f'{name}.c').read_bytes()).hexdigest() for name,_,_ in parts},plugin_sha256={path.name:hashlib.sha256(path.read_bytes()).hexdigest() for path in plugins.glob('*.so')})
(out/'umod-build.json').write_text(json.dumps(report,indent=2)+'\n')
print(obj)
