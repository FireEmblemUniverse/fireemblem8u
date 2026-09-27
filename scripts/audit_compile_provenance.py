#!/usr/bin/env python3
"""Bind mapped C instruction owners to the recorded fresh compiler pipelines."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import shlex
import shutil
import subprocess

from audit_linked_code import partition, read_contributions, read_mappings

ROOT = Path(__file__).resolve().parents[1]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def compiler_pipelines(path):
    rows = {}
    for number, line in enumerate(path.read_text().splitlines(), 1):
        # Compiler diagnostics and prose are not command evidence.
        if ' | iconv ' not in line:
            continue
        parts = [shlex.split(segment) for segment in line.split(' | ')]
        if len(parts) != 3 or '-o' not in parts[-1]:
            continue
        sources = [token for token in parts[0] if token.endswith('.c')]
        output = parts[-1][parts[-1].index('-o') + 1]
        if len(sources) != 1 or not output.endswith('.s'):
            continue
        assert output not in rows, ('multiple compiler commands', path, output)
        rows[output] = dict(input_source=sources[0], compiler=parts[-1][0], log_line=number,
                            command_sha256=hashlib.sha256(line.encode()).hexdigest())
    assert rows, path
    return rows


def main():
    main_log = ROOT / '.deps/main-forced-compare.log'
    payload_log = ROOT / '.deps/mgfembp-forced-compare.log'
    commands = {'main_rom': compiler_pipelines(main_log), 'payloads': compiler_pipelines(payload_log)}
    targets = [('main_rom', ROOT, 'fireemblem8', 0x08000000, '.gba')]
    targets += [(n, ROOT / 'mgfembp', n, 0x02010000, '.bin')
                for n in ('mgfembp', 'mgfembp_20030206', 'mgfembp_20030219')]
    runtime_receipt = ROOT / 'docs/runtime-source-inventory.json'
    runtime = json.loads(runtime_receipt.read_text())
    runtime_members = {row['object'].rsplit('/', 1)[-1]: row for row in runtime['images']['main_rom']['members']}
    images = {}
    for name, directory, stem, base, suffix in targets:
        elf, mapfile, binary = (directory / (stem + ext) for ext in ('.elf', '.map', suffix))
        mappings = read_mappings(subprocess.check_output(['arm-none-eabi-readelf', '-sW', str(elf)], text=True), base, base + binary.stat().st_size)
        regions = partition(read_contributions(mapfile.read_text(), base, base + binary.stat().st_size), mappings)
        owners = Counter()
        for row in regions:
            if row['kind'] in ('arm', 'thumb'):
                owners[row['object']] += row['size']
        proof, archives = [], {}
        for owner, size in sorted(owners.items()):
            if '.a(' in owner:
                member = runtime_members[owner.rsplit('/', 1)[-1]]
                assert member['instruction_bytes'] == size, (name, owner, size)
                assert member['status'] in ('C_source_rebuild_verified', 'C_with_inline_assembly_rebuild_verified'), member
                archives[owner] = size
                continue  # Independently covered by the fresh runtime receipt.
            source = owner.removesuffix('.o') + '.c'
            assembly = owner.removesuffix('.o') + '.s'
            object_path = directory / owner
            if name == 'main_rom':
                recorded = commands['main_rom']
            else:
                recorded = commands['payloads']
                assembly = f'build/{name}/' + assembly
                object_path = directory / 'build' / name / owner
            assert assembly in recorded, (name, owner, 'no fresh C compiler pipeline')
            command = recorded[assembly]
            assert command['input_source'] == source and (directory / source).is_file(), (name, owner, command)
            assert object_path.is_file(), object_path
            proof.append(dict(object=owner, instruction_bytes=size, source=str((directory / source).relative_to(ROOT)),
                              source_sha256=sha(directory / source), object_sha256=sha(object_path), **command))
        assert proof
        compiler_hashes = {}
        for compiler in sorted({row['compiler'] for row in proof}):
            assert Path(compiler).name in ('agbcc', 'old_agbcc', 'agbcc_arm', 'arm-none-eabi-gcc'), compiler
            path = directory / compiler if '/' in compiler else Path(shutil.which(compiler) or '')
            assert path.is_file(), compiler
            compiler_hashes[compiler] = sha(path)
        images[name] = dict(elf_sha256=sha(elf), map_sha256=sha(mapfile), compiler_sha256=compiler_hashes,
                            C_compiled_instruction_bytes=sum(x['instruction_bytes'] for x in proof),
                            C_compiled_owners=len(proof), runtime_archive_instruction_bytes=sum(archives.values()),
                            owners=proof, runtime_archive_owners=archives)
    report = dict(scope='Fresh command-log evidence that every mapped nonarchive instruction owner is built through a C compiler pipeline, not merely a same-named C file. Compiler-generated assembly is assembled by the recorded Makefile rules. Inline hardware remains counted separately; runtime archives have a separate source rebuild receipt. This does not establish whole-program reachability.',
                  script_sha256=sha(Path(__file__)),
                  log_sha256={str(p.relative_to(ROOT)): sha(p) for p in (main_log, payload_log)},
                  makefile_sha256={str(p.relative_to(ROOT)): sha(p) for p in (ROOT / 'Makefile', ROOT / 'mgfembp/Makefile')},
                  runtime_rebuild_receipt_sha256=sha(ROOT / 'docs/runtime-rebuild.json'),
                  runtime_source_receipt_sha256=sha(runtime_receipt), images=images)
    (ROOT / 'docs/compile-provenance.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({k:{field:value for field,value in row.items() if field not in ('owners','runtime_archive_owners')}for k,row in images.items()}, indent=2))


if __name__ == '__main__':
    main()
