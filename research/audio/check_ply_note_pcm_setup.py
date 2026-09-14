#!/usr/bin/env python3
"""Compile PCM setup and exercise it within the original selection loop."""
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
    parser.add_argument('--production', action='store_true')
    args = parser.parse_args()
    out = ROOT / '.deps/soundmain-packed/ply-note'
    out.mkdir(parents=True, exist_ok=True)
    source = (ROOT / 'research/audio/ply_note_pcm_setup.c').read_text()
    plugins = ROOT / '.deps/flood-core-new-backend'
    tail = ['-fplugin=' + str(plugins / 'tail_transfer.so'),
            '-fplugin-arg-tail_transfer-private-frame64',
            '-fplugin-arg-tail_transfer-destination=PlyNotePcmLoop',
            '-fplugin-arg-tail_transfer-adjacent-destination=PlyNotePcmLoop']
    copy = ['-fplugin=' + str(plugins / 'copy_add_zero.so'),
            '-fplugin-arg-copy_add_zero-preserve-thumb-high-copies']

    def compile(name, text, options):
        path, obj = out / (name + '.c'), out / (name + '.o')
        path.write_text(text)
        result = subprocess.run([
            args.compiler, '-c', '-std=gnu89', '-O1', '-mthumb',
            '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding',
            '-Werror=attributes', '-I', str(ROOT / 'tools/agbcc/include'),
            '-iquote', str(ROOT / 'include'), str(path), '-o', str(obj),
        ] + options, capture_output=True, text=True)
        (out / (name + '.log')).write_text(result.stdout + result.stderr)
        return result, obj

    result, obj = compile('pcm-setup-candidate', source, tail + copy)
    assert result.returncode == 0, result.stderr
    binary = out / 'pcm-setup-candidate.bin'
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text',
                    str(obj), str(binary)], check=True)
    rom = (ROOT / 'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert binary.read_bytes() == rom[0xcff30:0xcff3e]
    if args.production:
        assert (ROOT / 'src/m4a_ply_note_pcm_setup.c').read_text() == source.replace(
            'PlyNotePcmSetupCandidate', 'PlyNotePcmSetup')
        assert (ROOT / 'fireemblem8.gba').read_bytes() == rom
        production = out / 'pcm-setup-production.bin'
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text',
                        str(ROOT / 'src/m4a_ply_note_pcm_setup.o'), str(production)], check=True)
        assert production.read_bytes() == binary.read_bytes()
    invalid = [
        ('missing_frame', source, tail[:1] + tail[2:] + copy),
        ('wrong_destination', source.replace('PlyNotePcmLoop();', 'Other();'), tail + copy),
        ('post_call_work', source.replace('PlyNotePcmLoop();', 'PlyNotePcmLoop(); pcmR2 = 9;'), tail + copy),
        ('stack_write', source.replace('pcmR4 += 80;', 'pcmSP += 4;'), tail + copy),
        ('unbounded_frame', source.replace('pcmSP + 16', 'pcmSP + 64'), tail + copy),
        ('high_copy_without_contract', source, tail + copy[:1]),
    ]
    for name, text, options in invalid:
        result, _ = compile('reject-pcm-setup-' + name, text, options)
        assert result.returncode != 0, name
    plain = source.replace(', matching_thumb_copy_add_zero', '')
    result, obj = compile('pcm-setup-plain', plain, tail)
    assert result.returncode == 0, result.stderr
    before = obj.read_bytes()
    result, obj = compile('pcm-setup-plain', plain, tail + copy)
    assert result.returncode == 0 and before == obj.read_bytes(), result.stderr

    # Only the setup is generated C; retain the original 70-byte loop in this
    # isolated execution probe. Do not count the composite as C ownership.
    composite = out / 'pcm-setup-with-original-loop.bin'
    composite.write_bytes(binary.read_bytes() + rom[0xcff3e:0xcff84])
    subprocess.run([sys.executable, str(ROOT / 'research/audio/check_ply_note_pcm_model.py'),
                    '--candidate-bin', str(composite)], check=True)
    report = dict(exact_c_candidate_bytes=14, original_loop_bytes=70,
                  production_integrated=args.production, invalid_contracts=len(invalid),
                  unannotated_unchanged=True,
                  source_sha256=hashlib.sha256(source.encode()).hexdigest(),
                  model=json.loads((out / 'pcm-candidate-model.json').read_text()))
    (out / 'pcm-setup-report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
