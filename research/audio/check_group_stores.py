#!/usr/bin/env python3
"""Check grouped-store opt-in and rejection boundaries on the actual C candidate."""
import argparse
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--plugin', type=Path, required=True)
    a = p.parse_args()
    out = ROOT/'.deps/audio-clear-match/guards'
    out.mkdir(parents=True, exist_ok=True)
    source = (ROOT/'research/audio/clear_block.c').read_text()
    flags = ['-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
             '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing',
             '-fno-schedule-insns', '-fno-schedule-insns2',
             '-I'+str(ROOT/'tools/agbcc/include'), '-iquote', str(ROOT/'include')]
    plugin = '-fplugin='+str(a.plugin.resolve())
    def compile_case(name, text, extra):
        path = out/(name+'.c')
        path.write_text(text)
        dest = out/(name+'.s')
        result = subprocess.run([a.compiler,*flags,*extra,str(path),'-o',str(dest)], capture_output=True,text=True)
        return result, dest
    cases = {
        'volatile': source.replace('u32 *clearOutput', 'volatile u32 *clearOutput'),
        'wrong_step': source.replace('clearOutput += 4', 'clearOutput += 5'),
        'reversed_registers': source.replace('clearOutput[0] = zero1', 'clearOutput[0] = zero2').replace('clearOutput[1] = zero2', 'clearOutput[1] = zero1'),
        'duplicate_register': source.replace('clearOutput[1] = zero2', 'clearOutput[1] = zero1'),
        'noncontiguous': source.replace('clearOutput[3] = clearR4', 'clearOutput[4] = clearR4'),
        'memory_barrier': source.replace('clearOutput[1] = zero2;', 'asm("" ::: "memory"); clearOutput[1] = zero2;'),
    }
    for name, text in cases.items():
        result, _ = compile_case(name, text, [plugin])
        assert result.returncode and 'group stores found no eligible sequence' in result.stderr, (name, result.stderr)
    plain = source.replace('__attribute__((matching_group_stores))', '')
    result, base = compile_case('unannotated', plain, [])
    assert not result.returncode, result.stderr
    before = base.read_bytes()
    result, after = compile_case('unannotated', plain, [plugin])
    assert not result.returncode and before == after.read_bytes(), result.stderr
    result, accepted = compile_case('accepted', source, [plugin])
    assert not result.returncode, result.stderr
    assert accepted.read_text().count('\tstmia\t') == 4
    print('Six unsupported sequences rejected; unannotated output unchanged; four STM groups accepted.')

if __name__ == '__main__':
    main()
