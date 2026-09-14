#!/usr/bin/env python3
"""Build a checked two-compiler syscall member from pinned sources, without research caches."""
import argparse,hashlib,io,json,os,re,subprocess,tarfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
PIN='da598c1d918402c42c0c0d7128ba14567f3175e9'
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output-dir',type=Path,required=True);a=p.parse_args()
out=a.output_dir.resolve();out.mkdir(parents=True,exist_ok=True)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
env=os.environ.copy()
for name in ('C_INCLUDE_PATH','CPATH','CPLUS_INCLUDE_PATH','DEVKITARM','MAKEFLAGS'):env.pop(name,None)
def run(args):return subprocess.run([str(x) for x in args],check=True,env=env,capture_output=True,text=True)
blob=subprocess.check_output(['git','-C',str(ROOT/'.deps/agbcc'),'archive',PIN,'libc','ginclude'])
with tarfile.open(fileobj=io.BytesIO(blob)) as archive:archive.extractall(out,filter='data')
legacy=ROOT/'tools/agbcc/bin/old_agbcc';cc=ROOT/'.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
for plugin in ('copy_add_zero','monitor_r8_core'):
    run(['python3',ROOT/f'tools/arm-dispatch/build_{plugin}.py','--compiler',cc,'--output-dir',out])
allocation=ROOT/'research/runtime/monitor_allocation.h';core_source=ROOT/'research/runtime/monitor_core.c'
source=out/'libc/arm/syscalls.c';text=source.read_text()
assert sha(source)=='ec0dd10f8608a507f7a822f78d0f7fb612214bbb16ef52e0c20446017e852a7f'
template='"mov r0, %1; mov r1, %2; swi %a3; mov %0, r0"';assert text.count(template)==1
source.write_text('#include "'+str(allocation)+'"\n'+text.replace(template,'MONITOR_ALLOCATION_TEMPLATE'))
preprocessed=out/'syscalls.i';marked=out/'marked.s'
run(['arm-none-eabi-cpp','-I',out/'ginclude','-I',out/'libc/include','-nostdinc','-undef','-DABORT_PROVIDED','-DHAVE_GETTIMEOFDAY','-D__thumb__','-DARM_RDI_MONITOR','-D__GNUC__','-DINTERNAL_NEWLIB','-D__USER_LABEL_PREFIX__=','-DMATCHING_MONITOR_BRIDGE',source,'-o',preprocessed])
run([legacy,'-O2','-fno-builtin',preprocessed,'-o',marked])
result=[];sites=[]
for line in marked.read_text().splitlines():
    if '@ recovered_monitor' not in line:result.append(line);continue
    m=re.fullmatch(r'\s*@ recovered_monitor (r[0-8]) (r[2-5]) (sp|r[3-5])',line);assert m,line
    d,reason,arg=m.groups()
    if d=='r8':assert (reason,arg)==('r2','r3')
    regs=sorted(set(['r0','r1',d,reason,arg]));folder=out/f'core-{len(sites)}';folder.mkdir(exist_ok=True)
    header='\n'.join(f'register unsigned v_{r} asm("{r}");' for r in regs)+'\n'
    header+=f'#define MONITOR_REASON v_{reason}\n#define MONITOR_ARGUMENT v_{arg}\n#define MONITOR_RESULT v_{d}\n'
    if d=='r8':header+='#define MONITOR_R8_RESULT\n'
    (folder/'monitor_registers.h').write_text(header)
    asm=folder/'core.s'
    run([cc,'-S','-Os','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables','-Werror=attributes','-I',folder,'-fplugin='+str(out/'copy_add_zero.so'),'-fplugin='+str(out/'monitor_r8_core.so'),'-fplugin-arg-copy_add_zero-preserve-thumb-high-copies','-fplugin-arg-copy_add_zero-preserve-thumb-sp-copies',core_source,'-o',asm])
    body=asm.read_text().split('core:\n',1)[1].split('\t.size\tcore,',1)[0]
    instructions=[];kept=[];returns=0
    for part in body.splitlines():
        value=part.strip()
        if not value or value.startswith('@'):continue
        if value=='bx\tlr':returns+=1;continue
        if not value.startswith('.'):instructions.append(value)
        kept.append(part)
    assert returns==1 and len(instructions)==4 and instructions[2]=='swi 171',instructions
    result+=['\t.syntax unified',*kept,'\t.syntax divided']
    sites.append(dict(result=d,reason=reason,argument=arg,configuration_sha256=sha(folder/'monitor_registers.h'),assembly_sha256=sha(asm)))
assert len(sites)==13
asm=out/'syscalls.s';asm.write_text('\n'.join(result)+'\n.text\n.align 2,0\n')
member=out/'syscalls.o';run(['arm-none-eabi-as','-mcpu=arm7tdmi',asm,'-o',member])
reference=out/'reference.o';reference.write_bytes(subprocess.check_output(['arm-none-eabi-ar','p',str(ROOT/'tools/agbcc/lib/libc.a'),'syscalls.o']))
for section in ('.text','.rodata','.data'):
    binaries=[]
    for name,obj in [('candidate',member),('reference',reference)]:
        dest=out/(name+section+'.bin');run(['arm-none-eabi-objcopy','-O','binary','-j',section,obj,dest]);binaries.append(dest.read_bytes())
    assert binaries[0]==binaries[1],section
assert run(['arm-none-eabi-nm','-S',member]).stdout==run(['arm-none-eabi-nm','-S',reference]).stdout
assert run(['arm-none-eabi-readelf','-r',member]).stdout==run(['arm-none-eabi-readelf','-r',reference]).stdout
report=dict(member_sha256=sha(member),source_archive_sha256=hashlib.sha256(blob).hexdigest(),source_pin=PIN,allocation_source_sha256=sha(allocation),core_source_sha256=sha(core_source),compiler_sha256=sha(legacy),matching_compiler_sha256=sha(cc),sites=sites,exact_text_bytes=len((out/'candidate.text.bin').read_bytes()),exact_rodata_and_data=True,exact_symbols_and_relocations=True,scope='Independent research build; not wired into production defaults.')
(out/'syscall-build.json').write_text(json.dumps(report,indent=2)+'\n');print(member)
