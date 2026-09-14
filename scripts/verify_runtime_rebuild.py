#!/usr/bin/env python3
"""Rebuild pinned runtime libraries in isolation and relink all shipped images."""
import argparse
import hashlib
import io
import json
import os
from pathlib import Path
import subprocess
import tarfile
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PIN = 'da598c1d918402c42c0c0d7128ba14567f3175e9'
ROM_SHA1 = 'c25b145e37456171ada4b0d440bf88a19f4d509f'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source', type=Path, default=ROOT / '.deps/agbcc')
    p.add_argument('--json', type=Path, required=True)
    p.add_argument('--udiv-member', type=Path, help='Research C member replacing _udivsi3.o in the fresh archive')
    a = p.parse_args()
    parent = ROOT / '.deps/runtime-rebuild'
    parent.mkdir(exist_ok=True)
    out = Path(tempfile.mkdtemp(prefix='verified-', dir=parent))
    env = os.environ.copy()
    for key in ('C_INCLUDE_PATH', 'CPATH', 'CPLUS_INCLUDE_PATH', 'DEVKITARM', 'MAKEFLAGS'):
        env.pop(key, None)

    def run(command, cwd, log):
        with (out / log).open('a') as f:
            subprocess.run(command, cwd=cwd, env=env, stdout=f, stderr=subprocess.STDOUT, check=True)

    # Every library source, header and Makefile comes from the pin, including
    # generated floating-point variants. No reused .o/.i files enter this build.
    blob = subprocess.check_output(['git', '-C', str(a.source), 'archive', PIN,
                                    'libc', 'libgcc', 'ginclude'])
    with tarfile.open(fileobj=io.BytesIO(blob)) as archive:
        archive.extractall(out, filter='data')
    compiler = ROOT / 'tools/agbcc/bin/old_agbcc'
    (out / 'old_agbcc').symlink_to(compiler)
    for library in ('libgcc', 'libc'):
        run(['make', 'CPP=arm-none-eabi-cpp', '-j1'], out / library, library + '-build.log')
    if not a.udiv_member:
        run(['python3', str(ROOT / 'scripts/build_runtime_udiv.py'), '--output-dir', str(out / 'runtime-c')], ROOT, 'udiv-build.log')
        a.udiv_member = out / 'runtime-c/_udivsi3.o'
    if a.udiv_member:
        member = a.udiv_member.resolve()
        assert member.name == '_udivsi3.o'
        run(['arm-none-eabi-ar', 'r', str(out / 'libgcc/libgcc.a'), str(member)], ROOT, 'udiv-replacement.log')
    library_args = ['-L' + str(out / 'libc'), '-L' + str(out / 'libgcc')]
    images = {}

    def check_image(name, original, command, cwd, pad=False):
        elf = out / (name + '.elf')
        mapfile = out / (name + '.map')
        run(command + ['-Map', str(mapfile), *library_args, '-o', str(elf), '-lc', '-lgcc'], cwd, name + '-link.log')
        run(['arm-none-eabi-strip', '-N', '.gcc2_compiled.', str(elf)], cwd, name + '-link.log')
        binary = out / (name + original.suffix)
        args = ['arm-none-eabi-objcopy', '--strip-debug', '-O', 'binary']
        if pad:
            args += ['--pad-to', '0x9000000', '--gap-fill=0xff']
        run(args + [str(elf), str(binary)], cwd, name + '-link.log')
        assert binary.read_bytes() == original.read_bytes(), ('image mismatch', name, out)
        # Compare exported addresses/sizes as well: the ROM checksum alone
        # does not establish unchanged BSS allocation or absolute symbols.
        def symbols(path):
            return sorted(subprocess.check_output(['arm-none-eabi-nm', '-g', '-S',
                          '--defined-only', str(path)], text=True).splitlines())
        assert symbols(elf) == symbols(original.with_suffix('.elf')), ('symbol mismatch', name, out)
        text = mapfile.read_text()
        for library in ('libc', 'libgcc'):
            assert 'LOAD ' + str(out / library / (library + '.a')) in text
        assert 'LOAD tools/agbcc/lib/' not in text and 'LOAD ../../tools/agbcc/lib/' not in text
        images[name] = dict(bytes=binary.stat().st_size, sha1=hashlib.sha1(binary.read_bytes()).hexdigest(),
                            original_elf_sha256=sha(original.with_suffix('.elf')),
                            original_map_sha256=sha(original.with_suffix('.map')),
                            rebuilt_elf_sha256=sha(elf), global_symbols_match=True)
        print(name + ': exact image and exported symbols', flush=True)

    check_image('main_rom', ROOT / 'fireemblem8.gba',
                ['arm-none-eabi-ld', '-T', 'ldscript.txt', '@objects.lst',
                 '-R', 'banim/data_banim.o.sym.o'], ROOT, pad=True)
    assert images['main_rom']['sha1'] == ROM_SHA1
    for name in ('mgfembp', 'mgfembp_20030206', 'mgfembp_20030219'):
        original = ROOT / 'mgfembp' / (name + '.bin')
        cwd = ROOT / 'mgfembp/build' / name
        # LOAD records retain the exact current input-object order. Archives
        # are deliberately excluded and replaced with the fresh builds.
        objects = [line[5:] for line in original.with_suffix('.map').read_text().splitlines()
                   if line.startswith('LOAD ') and line.endswith('.o')]
        assert objects and all((cwd / x).is_file() for x in objects)
        check_image(name, original, ['arm-none-eabi-ld', '-T', '../../mgfembp.lds', *objects], cwd)
    report = dict(derived_archive_sha256=sha(ROOT / '.deps/runtime-c/libgcc.a'), runtime_c_sources={path.name:sha(path) for path in (ROOT/'runtime').glob('*.c')}, udiv_replacement_sha256=sha(a.udiv_member) if a.udiv_member else None, source_commit=PIN, source_archive_sha256=hashlib.sha256(blob).hexdigest(),
                  compiler_sha256=sha(compiler), build_directory=str(out),
                  tool_versions={name: subprocess.check_output([name, '--version'], text=True).splitlines()[0]
                                 for name in ('arm-none-eabi-cpp', 'arm-none-eabi-as', 'arm-none-eabi-ld')},
                  installed_archive_sha256={name: sha(ROOT / 'tools/agbcc/lib' / (name + '.a'))
                                            for name in ('libc', 'libgcc')},
                  rebuilt_archive_sha256={name: sha(out / name / (name + '.a')) for name in ('libc', 'libgcc')},
                  images=images,
                  limitations=['Matching source rebuild does not make assembly helpers or inline syscall assembly C-only.',
                               'The installed old_agbcc compiler is fingerprinted and reused, not bootstrapped by this check.',
                               'Non-runtime project objects are reused from the current production builds.'])
    a.json.write_text(json.dumps(report, indent=2) + '\n')


if __name__ == '__main__':
    main()
