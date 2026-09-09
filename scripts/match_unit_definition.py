#!/usr/bin/env python3
"""Compare the event-unit definition C candidate without touching the ROM build.

Run after a verified `make compare`. Optional --candidate-body accepts a full C
function definition to substitute for the current C implementation (or a legacy
NONMATCHING branch).
The production implementation must match before any candidate is scored.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
FUNCTION = 'GetUnitDefinitionFormEventScr'
COMPILER = 'tools/agbcc-empty-asm/agbcc'
START = 0x0800F914
SIZE = 516
SOURCE_FILE = 'src/eventscr.c'
FUNCTION_DECL = 'struct UnitDefinition * ' + FUNCTION + '('
BRANCH_MARKER = '#if NONMATCHING\n\n/* https://decomp.me/scratch/IyKOH */'
BRANCH_END = '\n#else // #if !NONMATCHING'
SHA1 = 'c25b145e37456171ada4b0d440bf88a19f4d509f'
FLAGS = ['-mthumb-interwork', '-Wimplicit', '-Wparentheses', '-Werror', '-O2',
         '-fhex-asm', '-ffix-debug-line', '-g']


def run(args, **kwargs):
    return subprocess.run(args, cwd=ROOT, check=True, capture_output=True, **kwargs).stdout


def compile_function(source, output, tag, symbols):
    preprocessed = run(['arm-none-eabi-cpp', '-I', 'tools/agbcc/include', '-iquote',
                        'include', '-iquote', '.', '-nostdinc', '-undef', '-'],
                       input=source.encode()).decode().encode('cp932')
    full_assembly = output / (tag + '.full.s')
    run([COMPILER, *FLAGS, '-o', str(full_assembly)], input=preprocessed)
    assembly = full_assembly.read_text()
    start = assembly.index(FUNCTION + ':\n')
    end = re.search(r'^\s*\.size\s+' + FUNCTION + r',.*$', assembly[start:], re.M)
    if not end:
        raise ValueError('compiler output has no function size directive')
    body = assembly[start:start + end.end()]
    # Labels used solely by the omitted DWARF sections are harmless here.
    function_assembly = output / (tag + '.s')
    header = '.text\n.syntax divided\n.code 16\n.thumb_func\n.global ' + FUNCTION + '\n'
    function_assembly.write_text(header + body + '\n')
    obj = output / (tag + '.o')
    run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(function_assembly), '-o', str(obj)])
    undefined = run(['arm-none-eabi-nm', '-u', str(obj)]).decode().splitlines()
    aliases = []
    assignments = []
    for line in undefined:
        name = line.split()[-1]
        address, kind = symbols[name]
        if kind == 'FUNC':
            if not address & 1:
                raise ValueError('unexpected ARM call target: ' + name)
            # Link-script integers alone lose STT_FUNC/Thumb information and
            # cause unwanted interworking veneers. Preserve the symbol type.
            aliases.append(f'.thumb_set {name}, 0x{address:08x}')
        else:
            assignments.append(f'{name} = 0x{address:08x};')
    function_assembly.write_text('\n'.join(aliases) + '\n' + header + body + '\n')
    run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(function_assembly), '-o', str(obj)])
    linker_script = output / (tag + '.ld')
    linker_script.write_text(f'SECTIONS {{ . = 0x{START:08x}; .text : {{ *(.text) }} }}\n'
                             + '\n'.join(assignments) + '\n')
    elf = output / (tag + '.elf')
    binary = output / (tag + '.bin')
    run(['arm-none-eabi-ld', '-T', str(linker_script), str(obj), '-o', str(elf)])
    run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', str(elf), str(binary)])
    (output / (tag + '.dump')).write_bytes(run(['arm-none-eabi-objdump', '-d', str(elf)]))
    return binary.read_bytes()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate-body', type=Path)
    parser.add_argument('--output-dir', type=Path, default=ROOT / '.deps/unit-definition-match')
    args = parser.parse_args()
    output = args.output_dir.resolve()
    output.mkdir(parents=True, exist_ok=True)
    rom = (ROOT / 'baserom.gba').read_bytes()
    if hashlib.sha1(rom).hexdigest() != SHA1 or (ROOT / 'fireemblem8.gba').read_bytes() != rom:
        raise ValueError('canonical baserom and byte-matching production build required')
    symbols = {}
    for line in run(['arm-none-eabi-readelf', '-sW', 'fireemblem8.elf']).decode().splitlines():
        fields = line.split()
        if len(fields) >= 8 and fields[0].endswith(':') and fields[0][:-1].isdigit():
            symbols[fields[-1]] = (int(fields[1], 16), fields[3])
    if symbols[FUNCTION] != (START | 1, 'FUNC'):
        raise ValueError('unexpected production function address or symbol type')
    source = (ROOT / SOURCE_FILE).read_text()
    reference = rom[START - 0x08000000:START - 0x08000000 + SIZE]
    baseline = compile_function(source, output, 'baseline', symbols)
    if baseline != reference:
        raise ValueError('isolated production implementation does not reproduce the ROM; refusing to score')
    marker = BRANCH_MARKER
    if source.count(marker) > 1:
        raise ValueError('candidate branch marker is ambiguous')
    # Retain support for older checkouts while also validating the graduated C.
    candidate = source.replace(marker, '#if 1\n\n/* isolated C candidate */')
    if args.candidate_body:
        branch = candidate.find('#if 1\n\n/* isolated C candidate */')
        start = candidate.index(FUNCTION_DECL, max(0, branch))
        if branch >= 0:
            end = candidate.index(BRANCH_END, start)
        else:
            # This source uses a column-zero closing brace for the definition.
            end = candidate.index('\n}', start) + 2
        candidate = candidate[:start] + args.candidate_body.read_text() + '\n' + candidate[end:]
    data = compile_function(candidate, output, 'candidate', symbols)
    differences = [START + i for i, (actual, expected) in enumerate(zip(data, reference)) if actual != expected]
    report = {
        'function': FUNCTION, 'baseline_verified': True,
        'reference_size': SIZE, 'candidate_size': len(data),
        'differing_shared_bytes': len(differences),
        'size_difference': len(data) - SIZE,
        'matching': data == reference,
        'differing_rom_addresses': [f'0x{address:08x}' for address in differences],
        'scope': 'Isolated function bytes only; a match still requires production integration and full ROM verification.',
    }
    (output / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({key: value for key, value in report.items() if key != 'differing_rom_addresses'}, indent=2))


if __name__ == '__main__':
    main()
