#!/usr/bin/env python3
"""Build and verify the private MPlayMain lock-entry compiler contract."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--production', action='store_true')
    a = p.parse_args()
    out = ROOT / '.deps/soundmain-packed/mplay-lock'
    out.mkdir(parents=True, exist_ok=True)
    source = (ROOT / 'research/audio/mplay_lock.c').read_text()
    options = ['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_lock_frame.so'),
               '-fplugin-arg-thumb_lock_frame-id=0x68736d53,MPlayLockId',
               '-fplugin-arg-thumb_lock_frame-continuation=MPlayMainEntryCallbackSetup']

    def compile(label, text=source, flags=options):
        path, obj = out/(label+'.c'), out/(label+'.o')
        path.write_text(text)
        result = subprocess.run([a.compiler, '-c', '-std=gnu89', '-O1', '-fno-reorder-blocks',
                                 '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding',
                                 '-Werror=attributes', '-I', str(ROOT/'tools/agbcc/include'),
                                 '-iquote', str(ROOT/'include'), str(path), '-o', str(obj)]+flags,
                                capture_output=True, text=True)
        (out/(label+'.log')).write_text(result.stdout+result.stderr)
        return result, obj

    result, obj = compile('candidate')
    assert result.returncode == 0, result.stderr
    script = out/'candidate.ld'
    script.write_text('SECTIONS { .text 0x080cfb68 : { *(.text) } '
                      'MPlayLockId = 0x080cfdcc; MPlayMainEntryCallbackSetup = 0x080cfb78; }')
    elf, binary = out/'candidate.elf', out/'candidate.bin'
    subprocess.run(['arm-none-eabi-ld', '-T', str(script), str(obj), '-o', str(elf)], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', str(elf), str(binary)], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert binary.read_bytes() == rom[0xcfb68:0xcfb78], binary.read_bytes().hex()
    if a.production:
        assert (ROOT/'fireemblem8.gba').read_bytes() == rom
        assert (ROOT/'src/m4a_mplay_lock.c').read_text() == source.replace('MPlayLockCandidate', 'MPlayMain')
    invalid = [
        ('argument', source.replace('MPlayLockCandidate(void)', 'MPlayLockCandidate(u32 arg)'), options),
        ('return_type', source.replace('void MPlayLockCandidate', 'u32 MPlayLockCandidate'), options),
        ('wrong_load', source.replace(')->ident;', ')->status;', 1), options),
        ('wrong_increment', source.replace('lockR3 += 1', 'lockR3 += 2'), options),
        ('wrong_restore', source.replace('lockR3 = 0x68736d54', 'lockR3 = 0x68736d55'), options),
        ('wrong_delta', source.replace('lockSP -= 8', 'lockSP -= 12'), options),
        ('wrong_player', source.replace('= lockR0;', '= lockR1;'), options),
        ('wrong_return_slot', source.replace('lockSP + 4', 'lockSP + 0'), options),
        ('reordered_stack_stores', source.replace(
            '*(volatile u32 *)(lockSP + 0) = lockR0;\n    *(volatile u32 *)(lockSP + 4) = lockLR;',
            '*(volatile u32 *)(lockSP + 4) = lockLR;\n    *(volatile u32 *)(lockSP + 0) = lockR0;'), options),
        ('wrong_tie', source.replace('asm("" : "+r"(lockR2))', 'asm("" : "+r"(lockR1))'), options),
        ('wrong_comparison', source.replace('lockR2 != lockR3', 'lockR2 == lockR3'), options),
        ('instruction_asm', source.replace('lockSP -= 8;', 'asm("nop");\n    lockSP -= 8;'), options),
        ('missing_global', source.replace('register volatile u32 lockR8 asm("r8");', 'volatile u32 lockR8;'), options),
        ('debug', source, options+['-g']),
        ('unwind', source, options+['-funwind-tables']),
        ('wrong_continuation', source, options[:2]+['-fplugin-arg-thumb_lock_frame-continuation=Other']),
        ('duplicate_continuation', source, options+[options[2]]),
        ('missing_continuation', source, options[:2]),
        ('wrong_id', source, [options[0], '-fplugin-arg-thumb_lock_frame-id=0x68736d52,MPlayLockId', options[2]]),
        ('missing_id', source, [options[0], options[2]]),
        ('duplicate_id', source, options+[options[1]]),
        ('unknown_option', source, options+['-fplugin-arg-thumb_lock_frame-unknown=1']),
    ]
    for label, text, flags in invalid:
        result, _ = compile('reject_'+label, text, flags)
        assert result.returncode, label
    plain = source.replace('__attribute__((matching_thumb_lock_frame))', '')
    result, obj = compile('plain', plain, [])
    assert result.returncode == 0, result.stderr
    before = obj.read_bytes()
    result, obj = compile('plain', plain)
    assert result.returncode == 0 and obj.read_bytes() == before, result.stderr
    subprocess.run([sys.executable, str(ROOT/'research/audio/check_mplay_lock_model.py'),
                    '--candidate-bin', str(binary)], check=True)
    report = dict(exact_bytes=16, invalid_contracts=len(invalid), unannotated_unchanged=True,
                  source_sha256=hashlib.sha256(source.encode()).hexdigest(),
                  model=json.loads((out/'candidate-model.json').read_text()),
                  production_integrated=a.production)
    (out/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
