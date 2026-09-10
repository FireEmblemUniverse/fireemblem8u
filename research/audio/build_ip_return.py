#!/usr/bin/env python3
"""Build isolated private-return research support without installing the compiler."""
from pathlib import Path
import hashlib
import json
import shlex
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT/'.deps/gcc16-matching'
OUT = ROOT/'.deps/audio-command-setters'


def main():
    canonical = (ROOT/'tools/arm-dispatch/matching.md').read_bytes()
    extension = Path(__file__).with_name('ip_return.md').read_bytes()
    desired = canonical+b'\n'+extension
    target = BASE/'gcc-16.2.0/gcc/config/arm/matching.md'
    if target.read_bytes() not in (canonical, desired):
        raise SystemExit('Unexpected experimental backend; inspect before replacing.')
    if target.read_bytes() != desired:
        target.write_bytes(desired)
    subprocess.run(['make', '-C', str(BASE/'build'), '-j4', 'all-gcc'], check=True)
    OUT.mkdir(exist_ok=True)
    headers = OUT/'plugin-headers'
    shutil.copytree(BASE/'install/lib/gcc/arm-none-eabi/16.2.0/plugin/include', headers, dirs_exist_ok=True)
    for source in (BASE/'build/gcc').glob('insn-*.h'):
        if (headers/source.name).exists():
            shutil.copy2(source, headers/source.name)
    source = Path(__file__).with_name('ip_return.cc')
    binary = OUT/'ip_return.so'
    temporary = binary.with_suffix('.so.tmp')
    command = ['c++', '-std=gnu++17', '-fno-rtti', '-fPIC', '-shared', '-undefined', 'dynamic_lookup',
               '-Wno-deprecated-declarations', '-I', str(headers), '-I', '/opt/homebrew/include',
               str(source), '-o', str(temporary)]
    subprocess.run(command, check=True)
    temporary.replace(binary)
    compiler = BASE/'build/gcc/xgcc'
    driver = OUT/'gcc'
    driver.write_text('#!/bin/sh\nexec '+shlex.quote(str(compiler))+' '+shlex.quote('-B'+str(compiler.parent)+'/')+' "$@"\n')
    driver.chmod(0o755)
    report = {'extension_sha256': hashlib.sha256(desired).hexdigest(),
              'plugin_source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
              'plugin_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
              'cc1_sha256': hashlib.sha256((compiler.parent/'cc1').read_bytes()).hexdigest(),
              'command': command, 'scope': 'Build-tree experiment; installed compiler unchanged.'}
    (OUT/'build-info.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report))


if __name__ == '__main__':
    main()
