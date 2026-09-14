#!/usr/bin/env python3
"""Check the narrowly scoped BIOS return compiler contract and opt-in behavior."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/bios-wrappers/u16-controls'
OUT.mkdir(parents=True, exist_ok=True)
CC = ROOT / '.deps/gcc16-matching/install/bin/arm-none-eabi-gcc'
parser = argparse.ArgumentParser()
parser.add_argument('--source', type=Path, default=ROOT / 'research/bios/u16_return.c')
parser.add_argument('--plugin', type=Path, default=ROOT / '.deps/bios-wrappers/bios_u16_return.so')
args = parser.parse_args()
PLUGIN = args.plugin.resolve()
source = args.source.read_text()
attribute = '__attribute__((matching_bios_u16_return))\n'

def compile_case(name, text, mode='-mthumb', plugin=True):
    path = OUT / (name + '.c')
    path.write_text(text)
    obj = OUT / (name + '.o')
    args = [str(CC), '-c', '-O2', '-falign-functions=2', mode,
            '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding',
            '-fno-unwind-tables', '-fno-asynchronous-unwind-tables',
            '-ffunction-sections', '-Werror=attributes', '-I', str(ROOT / 'include')]
    if plugin:
        args += ['-fplugin=' + str(PLUGIN)]
    result = subprocess.run(args + [str(path), '-o', str(obj)], capture_output=True, text=True)
    (OUT / (name + '.log')).write_text(result.stdout + result.stderr)
    return result, obj

result, obj = compile_case('accepted', source)
assert result.returncode == 0, result.stderr
for name, expected in [('ArcTan2', '0adf7047'), ('Sqrt', '08df7047')]:
    path = OUT / (name + '.bin')
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text.' + name, str(obj), str(path)], check=True)
    assert path.read_bytes() == bytes.fromhex(expected)

variants = {
    'arm-mode': (source, '-marm'),
    'wrong-service': (source.replace('swi 8', 'swi 7'), '-mthumb'),
    'extra-instruction': (source.replace('swi 8', 'swi 8; nop'), '-mthumb'),
    'signed-return': (source.replace('#include "gba/syscall.h"', '').replace('u16 Sqrt', 's16 Sqrt'), '-mthumb'),
    'wide-return': (source.replace('#include "gba/syscall.h"', '').replace('u16 Sqrt', 'u32 Sqrt'), '-mthumb'),
    'different-mask': (source.replace('return r0;', 'return r0 & 255;'), '-mthumb'),
    'missing-cc': (source.replace(', "cc"', ''), '-mthumb'),
    'extra-clobber': (source.replace('"r3", "cc"', '"r3", "r4", "cc"'), '-mthumb'),
    'nonvolatile': (source.replace('asm volatile', 'asm'), '-mthumb'),
    'extra-store': (source.replace('return r0;', '*(volatile u32 *)0x03001000 = r0; return r0;'), '-mthumb'),
}
for name, (text, mode) in variants.items():
    result, _ = compile_case(name, text, mode)
    assert result.returncode and 'BIOS u16 return requires' in result.stderr, (name, result.stderr)

plain = source.replace(attribute, '')
a, left = compile_case('unannotated-plugin', plain)
b, right = compile_case('unannotated-control', plain, plugin=False)
assert a.returncode == b.returncode == 0
# Compare relevant code sections; source-file symbols legitimately differ.
for name in ('ArcTan2', 'Sqrt'):
    chunks = []
    for obj in (left, right):
        path = obj.with_suffix('.' + name + '.bin')
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text.' + name, str(obj), str(path)], check=True)
        chunks.append(path.read_bytes())
    assert chunks[0] == chunks[1] and len(chunks[0]) == 8
print(json.dumps(dict(accepted_wrappers=2, rejected_cases=list(variants),
    unannotated_unchanged=True, plugin_source_sha256=hashlib.sha256((ROOT / 'tools/arm-dispatch/bios_u16_return.cc').read_bytes()).hexdigest(),
    plugin_sha256=hashlib.sha256(PLUGIN.read_bytes()).hexdigest()), indent=2))
