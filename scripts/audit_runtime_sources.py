#!/usr/bin/env python3
"""Audit pinned runtime sources, assembly reproduction and fresh-link evidence."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
ROOT=Path(__file__).resolve().parents[1]
PIN='da598c1d918402c42c0c0d7128ba14567f3175e9'
ASM_NAMES={'_divsi3','_modsi3','_dvmd_tls','_call_via_rX'}
def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--source',type=Path,default=ROOT/'.deps/agbcc');p.add_argument('--markdown',type=Path);p.add_argument('--rebuild-report',type=Path,default=ROOT/'docs/runtime-rebuild.json');a=p.parse_args();source=a.source.resolve()
    assert subprocess.check_output(['git','-C',str(source),'rev-parse','HEAD'],text=True).strip()==PIN
    out=ROOT/'.deps/runtime-audit';out.mkdir(exist_ok=True)
    ownership=json.loads((ROOT/'docs/code-ownership.json').read_text())
    archives={name:ROOT/'tools/agbcc/lib'/name for name in ('libc.a','libgcc.a')}
    archives['libgcc.a']=ROOT/'.deps/runtime-c/libgcc.a'
    rebuild=None
    if a.rebuild_report.exists():
        rebuild=json.loads(a.rebuild_report.read_text())
        assert rebuild['source_commit']==PIN
        assert rebuild['compiler_sha256']==sha(ROOT/'tools/agbcc/bin/old_agbcc')
        for name,path in archives.items():
            assert (rebuild['derived_archive_sha256'] if name=='libgcc.a' else rebuild['installed_archive_sha256'][name[:-2]])==sha(path)
        for name,info in rebuild['images'].items():
            original=ROOT/('fireemblem8' if name=='main_rom' else 'mgfembp/'+name)
            assert info['original_elf_sha256']==sha(original.with_suffix('.elf')),'Rerun verify_runtime_rebuild.py after rebuilding'
            assert info['original_map_sha256']==sha(original.with_suffix('.map')),'Rerun verify_runtime_rebuild.py after rebuilding'
            assert info['global_symbols_match']
            binary=original.with_suffix('.gba' if name=='main_rom' else '.bin').read_bytes()
            assert info['sha1']==hashlib.sha1(binary).hexdigest() and info['bytes']==len(binary)
        assert set(rebuild['images'])=={'main_rom','mgfembp','mgfembp_20030206','mgfembp_20030219'}
    reproduced={}
    asm=source/'libgcc/lib1thumb.asm'
    for name in sorted(ASM_NAMES):
        code=subprocess.check_output(['arm-none-eabi-cpp','-undef','-nostdinc','-DL'+name,'-x','assembler-with-cpp',str(asm)],text=True)
        (out/(name+'.s')).write_text(code+'\n.text\n.align 2,0\n')
        subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi','-o',str(out/(name+'.o')),str(out/(name+'.s'))],check=True)
        (out/(name+'.original.o')).write_bytes(subprocess.check_output(['arm-none-eabi-ar','p',str(archives['libgcc.a']),name+'.o']))
        blobs=[]
        for suffix in ('.o','.original.o'):
            dest=out/(name+suffix+'.bin')
            subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(out/(name+suffix)),str(dest)],check=True)
            blobs.append(dest.read_bytes())
        assert blobs[0]==blobs[1],name
        reproduced[name]=dict(text_bytes=len(blobs[0]),text_sha256=hashlib.sha256(blobs[0]).hexdigest())
    images={}
    for image,info in ownership['images'].items():
        elf=ROOT/('fireemblem8.elf' if image=='main_rom' else 'mgfembp/mgfembp.elf')
        assert sha(elf)==info['elf_sha256'],'Regenerate ownership inventory after rebuilding'
        rows=[];assembly_bytes=located_bytes=rebuilt_bytes=mixed_bytes=0
        for obj in info['objects']:
            if obj['category']!='runtime_archive':continue
            match=re.search(r'(lib(?:c|gcc)\.a)\(([^)]+)\.o\)$',obj['object']);assert match,obj
            archive,name=match.groups()
            if archive=='libgcc.a' and name in ('_udivsi3','_umodsi3'):
                assert rebuild, 'Recovered runtime requires fresh rebuild evidence'
                sources={path.name:sha(path) for path in (ROOT/'runtime').glob('*.c')}
                assert sources==rebuild['runtime_c_sources']
                rebuilt_bytes+=obj['instruction_bytes']
                rows.append(dict(object=obj['object'],instruction_bytes=obj['instruction_bytes'],source='runtime/*.c',source_sha256=sources,status='C_source_rebuild_verified'))
                continue
            if archive=='libgcc.a' and name in ASM_NAMES:
                path=asm;status='assembly_reproduced';assembly_bytes+=obj['instruction_bytes']
            else:
                if rebuild:
                    status='C_source_rebuild_verified';rebuilt_bytes+=obj['instruction_bytes']
                    if archive=='libc.a' and name=='syscalls':
                        status='C_with_inline_assembly_rebuild_verified';mixed_bytes+=obj['instruction_bytes']
                else:
                    status='C_source_located_rebuild_unverified';located_bytes+=obj['instruction_bytes']
                if archive=='libgcc.a':path=source/'libgcc'/('fp-bit-base.c' if name in ('fp-bit','dp-bit') else 'libgcc2.c')
                elif name in ('freer','callocr'):path=source/'libc/stdlib/mallocr.c'
                else:
                    matches=list((source/'libc').rglob(name+'.c'));assert len(matches)==1,(name,matches)
                    path=matches[0]
            relative=str(path.relative_to(source))
            # Verify selected source is the content at the recorded pin, not a local edit.
            pinned=subprocess.check_output(['git','-C',str(source),'show',PIN+':'+relative])
            assert pinned==path.read_bytes(),relative
            row=dict(object=obj['object'],instruction_bytes=obj['instruction_bytes'],source=relative,source_sha256=sha(path),status=status)
            if status=='assembly_reproduced':row.update(reproduced[name])
            rows.append(row)
        assert assembly_bytes+located_bytes+rebuilt_bytes==info['categories']['runtime_archive']
        images[image]=dict(elf_sha256=info['elf_sha256'],assembly_instruction_bytes=assembly_bytes,C_source_located_instruction_bytes=located_bytes,C_source_rebuilt_instruction_bytes=rebuilt_bytes,rebuilt_syscalls_object_instruction_bytes=mixed_bytes,members=rows)
    report=dict(source_commit=PIN,archive_sha256={name:sha(path) for name,path in archives.items()},images=images,rebuild_report_sha256=sha(a.rebuild_report) if rebuild else None,limitations=['Matching C source rebuild does not prove no inline assembly; syscalls.c explicitly contains assembly and its object size is not the inline instruction count.','Assembly text reproduction includes local padding/literals; reported instruction totals come from linked ARM/Thumb mappings.','The installed compiler is fingerprinted and reused; this audit does not bootstrap it or claim complete decompilation.'])
    if a.markdown:
        lines=['# Runtime source inventory','',f'Local source pin: `{PIN}`. Installed archives and selected source files are fingerprinted in [the JSON report](runtime-source-inventory.json).','','| Image | Reproduced assembly instructions | Matching C source rebuild | C source located; rebuild unverified |','|---|---:|---:|---:|']
        for image,info in images.items():lines.append(f"| {image} | {info['assembly_instruction_bytes']:,} | {info['C_source_rebuilt_instruction_bytes']:,} | {info['C_source_located_instruction_bytes']:,} |")
        if rebuild:
            lines += ['', 'Fresh pinned libc/libgcc builds with the recovered C division and modulus members reproduce the entire 16 MiB main ROM and all three embedded payload binaries. Exported symbol addresses/sizes also match, including RAM symbols. [Rebuild evidence](runtime-rebuild.json) fingerprints the source snapshot, compiler, tools, archives and original images. Reproduce with `python3 scripts/verify_runtime_rebuild.py --json docs/runtime-rebuild.json`, then rerun this inventory.', '', 'The C-source total includes 1,014 main-ROM instruction bytes in syscalls.o, which contains inline assembly. That is the whole object size, not a count of its assembly instructions.']
        lines += ['', '## Reproduced assembly members','', '| Member | Mapped instruction bytes per image | Reproduced text bytes including padding |','|---|---:|---:|']
        for row in images['main_rom']['members']:
            if row['status']=='assembly_reproduced':lines.append(f"| `{row['object']}` | {row['instruction_bytes']} | {row['text_bytes']} |")
        lines += ['', '## Remaining verification','', 'Four assembly helpers remain assembly. syscalls.c needs instruction-level inline assembly review and recovery. Fresh builds cover allocator and floating-point macro variants and their pinned headers when rebuild evidence is present; source location alone receives no rebuild credit.','']+['- '+x for x in report['limitations']]
        a.markdown.write_text('\n'.join(lines)+'\n')
    print(json.dumps(report,indent=2))
if __name__=='__main__':main()
