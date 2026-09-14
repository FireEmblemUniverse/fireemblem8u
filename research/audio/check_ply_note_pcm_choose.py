#!/usr/bin/env python3
"""Check exact PCM choice bytes, incoming-flag contracts and selection behavior."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    args = parser.parse_args()
    out = ROOT / '.deps/soundmain-packed/ply-note'
    out.mkdir(parents=True, exist_ok=True)
    source = (ROOT / 'research/audio/ply_note_pcm_choose.c').read_text()
    plugins = ROOT / '.deps/flood-core-new-backend'
    tail = ['-fplugin=' + str(plugins / 'tail_transfer.so'),
            '-fplugin-arg-tail_transfer-private-frame64',
            '-fplugin-arg-tail_transfer-acyclic-branches',
            '-fplugin-arg-tail_transfer-destination=PlyNoteChannelAttach',
            '-fplugin-arg-tail_transfer-destination=PlyNotePcmAdvance',
            '-fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNotePcmAdvance']
    direct = ['-fplugin=' + str(plugins / 'thumb_direct_tails.so'),
              '-fplugin-arg-thumb_direct_tails-destination=PlyNoteChannelAttach',
              '-fplugin-arg-thumb_direct_tails-expected-transfers=1']
    layout = ['-fplugin=' + str(plugins / 'thumb_block_layout.so'),
              '-fplugin-arg-thumb_block_layout-pcm-selection']
    def compile(name, text=source, options=tail+direct+layout):
        path, obj = out / (name + '.c'), out / (name + '.o')
        path.write_text(text)
        run = subprocess.run([args.compiler, '-c', '-std=gnu89', '-O1',
            '-fno-reorder-blocks', '-fno-crossjumping', '-fno-guess-branch-probability',
            '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding',
            '-Werror=attributes', '-I', str(ROOT / 'tools/agbcc/include'),
            '-iquote', str(ROOT / 'include'), str(path), '-o', str(obj)] + options,
            capture_output=True, text=True)
        (out / (name + '.log')).write_text(run.stdout + run.stderr)
        return run, obj
    run, obj = compile('pcm-choose-candidate')
    assert run.returncode == 0, run.stderr
    script = out / 'pcm-choose-candidate.ld'
    script.write_text('SECTIONS { .text 0x080cff3e : { *(.text) } PlyNoteChannelAttach = 0x080cff84; PlyNotePcmAdvance = 0x080cff78; }')
    elf, binary = out / 'pcm-choose-candidate.elf', out / 'pcm-choose-candidate.bin'
    subprocess.run(['arm-none-eabi-ld', '-T', str(script), str(obj), '-o', str(elf)], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', str(elf), str(binary)], check=True)
    rom = (ROOT / 'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert binary.read_bytes() == rom[0xcff3e:0xcff78], binary.read_bytes().hex()
    invalid = [
        ('missing_private', source, tail[:1]+tail[2:]+direct+layout),
        ('wrong_destination', source.replace('PlyNoteChannelAttach();', 'Other();'), tail+direct+layout),
        ('signed_compare', source.replace('pcmR0 >= pcmR6', '(s32)pcmR0 >= (s32)pcmR6'), tail+direct+layout),
        ('changed_owner_test', source.replace('pcmR0 <= pcmR7', 'pcmR0 < pcmR7'), tail+direct+layout),
        ('changed_release_mask', source.replace('pcmR0 = 0x40', 'pcmR0 = 0x20'), tail+direct+layout),
        ('high_compare', source.replace('asm("r6")', 'asm("r9")'), tail+direct+layout),
        ('intervening_write', source.replace('tie:\n', 'tie:\n    pcmR6++;\n    asm("" : "+r"(pcmR6));\n'), tail+direct+layout),
        ('intervening_flags', source.replace('owner_tie:\n', 'owner_tie:\n    pcmR1++;\n    asm("" : "+r"(pcmR1));\n'), tail+direct+layout),
        ('changed_compare_operand', source.replace('if (pcmR0 < pcmR7) goto next;', 'if (pcmR0 < pcmR6) goto next;'), tail+direct+layout),
        ('extra_incoming_path', source.replace('if (pcmR2) goto next;', 'if (pcmR2) goto owner_tie;', 1), tail+direct+layout),
        ('mixed_modes', source, tail+direct+layout+['-fplugin-arg-thumb_block_layout-tone-selection']),
        ('duplicate_mode', source, tail+direct+layout+[layout[-1]]),
        ('unknown_option', source, tail+direct+layout+['-fplugin-arg-thumb_block_layout-unknown']),
    ]
    for name, text, options in invalid:
        run, _ = compile('reject-pcm-choose-' + name, text, options)
        assert run.returncode != 0, name
    plain = source.replace(', matching_thumb_block_layout', '')
    run, obj = compile('pcm-choose-plain', plain, tail+direct)
    assert run.returncode == 0, run.stderr
    before = obj.read_bytes()
    run, obj = compile('pcm-choose-plain', plain, tail+direct+layout)
    assert run.returncode == 0 and before == obj.read_bytes(), run.stderr
    composite = out / 'pcm-choose-with-original-frame.bin'
    composite.write_bytes(rom[0xcff30:0xcff3e] + binary.read_bytes() + rom[0xcff78:0xcff84])
    subprocess.run([sys.executable, str(ROOT / 'research/audio/check_ply_note_pcm_model.py'),
                    '--candidate-bin', str(composite)], check=True)
    report = dict(exact_c_candidate_bytes=58, original_setup_and_advance_bytes=26,
                  production_integrated=False, invalid_contracts=len(invalid),
                  unannotated_unchanged=True,
                  source_sha256=hashlib.sha256(source.encode()).hexdigest(),
                  model=json.loads((out / 'pcm-candidate-model.json').read_text()))
    (out / 'pcm-choose-report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))

if __name__ == '__main__':
    main()
