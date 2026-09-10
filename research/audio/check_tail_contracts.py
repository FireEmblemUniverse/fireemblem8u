#!/usr/bin/env python3
"""Reject unsupported tail-transfer contracts and leave ordinary functions unchanged."""
import argparse
from pathlib import Path
import subprocess
import tempfile


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--plugin', type=Path, required=True)
    args = p.parse_args()
    flags = ['-S', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-fno-unwind-tables',
             '-fno-asynchronous-unwind-tables', '-fno-if-conversion', '-fno-if-conversion2', '-Werror=attributes']
    plugin = ['-fplugin='+str(args.plugin.resolve()), '-fplugin-arg-tail_transfer-destination=helper']
    decl = 'extern void helper(void); register volatile unsigned value asm("r0");\n'
    attr = '__attribute__((matching_tail_transfer)) '
    fixtures = [
        (decl+attr+'void probe(void) { helper(); }', [], plugin[:1], 'missing destination'),
        (decl+attr+'void probe(void) { helper(); value++; }', [], plugin, 'post-call work'),
        (decl+attr+'void probe(void) { if(value) helper(); }', [], plugin, 'bare return path'),
        (decl+attr+'void probe(void) { while(value) value--; helper(); }', [], plugin, 'backward loop'),
        (decl+attr+'void probe(void (*fn)(void)) { fn(); }', [], plugin, 'indirect call'),
        (decl+attr+'void probe(void) { volatile unsigned data[8]; data[0]=value; helper(); }', [], plugin, 'local frame'),
        (decl+attr+'unsigned probe(void) { helper(); return 3; }', [], plugin, 'nonvoid return'),
        (decl+attr+'void probe(void) { helper(); }', ['-g'], plugin, 'debug'),
        (decl+attr+'void probe(void) { helper(); }', ['-funwind-tables'], plugin, 'unwind'),
        (decl+attr+'void probe(void) { helper(); }', ['-marm'], plugin, 'ARM mode'),
        (decl+attr+'void probe(void) { asm volatile("nop"); helper(); }', [], plugin, 'executable asm'),
    ]
    with tempfile.TemporaryDirectory() as temp:
        root = Path(temp)
        cmd = [args.compiler, *flags, str(root/'probe.c'), '-o', str(root/'probe.s')]
        for source, extra, selected, label in fixtures:
            (root/'probe.c').write_text(source)
            result = subprocess.run(cmd+selected+extra, text=True, capture_output=True)
            assert result.returncode and 'internal compiler error' not in result.stderr, (label, result.stderr)
        (root/'probe.c').write_text(decl+'void probe(void) { helper(); }')
        subprocess.run(cmd, check=True)
        normal = (root/'probe.s').read_text()
        subprocess.run(cmd+plugin, check=True)
        assert (root/'probe.s').read_text() == normal
        (root/'probe.c').write_text(decl+attr+'void probe(void) { helper(); }')
        subprocess.run(cmd+plugin, check=True)
        result = (root/'probe.s').read_text()
        assert 'push' not in result and 'pop' not in result and '\tbl\t' not in result and ('\tb\thelper' in result or '\tb\t#helper' in result), result
    print(f'{len(fixtures)} unsupported contracts rejected; direct terminal transfer accepted; unannotated assembly unchanged.')


if __name__ == '__main__':
    main()
