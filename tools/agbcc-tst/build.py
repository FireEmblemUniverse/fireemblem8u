#!/usr/bin/env python3
"""Build the pinned agbcc variant that supports equality-only Thumb bit tests and empty constraints."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
REVISION = 'da598c1d918402c42c0c0d7128ba14567f3175e9'
UPSTREAM = 'https://github.com/pret/agbcc.git'
PATCH = Path(__file__).with_name('empty-asm-length.patch')
PATCHED_FINAL_SHA256 = '0bd51768fc0b1dcf02342126ff84c283e02682e140390edae4041fd5c740e77c'


def run(args, **kwargs):
    subprocess.run(args, check=True, **kwargs)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, help='local agbcc git checkout containing the pinned revision')
    parser.add_argument('--output', type=Path, default=Path(__file__).with_name('agbcc' + ('.exe' if os.name == 'nt' else '')))
    args = parser.parse_args()
    source = args.source or ROOT / '.deps/agbcc'
    available = source.is_dir() and subprocess.run(
        ['git', '-C', str(source), 'cat-file', '-e', REVISION + '^{commit}'],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    ).returncode == 0
    if args.source and not available:
        parser.error('the supplied source does not contain the pinned revision')
    cache = ROOT / '.deps'
    cache.mkdir(exist_ok=True)
    build = Path(tempfile.mkdtemp(prefix='agbcc-tst-build-', dir=cache))
    # Clone only committed sources; local compiler experiments are not copied.
    run(['git', 'clone', '--quiet', '--no-checkout', '--no-hardlinks', str(source.resolve()) if available else UPSTREAM, str(build)])
    run(['git', 'config', 'core.autocrlf', 'false'], cwd=build)
    run(['git', 'checkout', '--quiet', '--detach', REVISION], cwd=build)
    run(['git', 'apply', '--unidiff-zero', '--check', str(PATCH)], cwd=build)
    run(['git', 'apply', '--unidiff-zero', str(PATCH)], cwd=build)
    if hashlib.sha256((build / 'gcc/final.c').read_bytes()).hexdigest() != PATCHED_FINAL_SHA256:
        raise ValueError('patched compiler source hash mismatch; refusing to build')
    bit_patch = Path(__file__).with_name('equality-bit-test.patch')
    run(['git', 'apply', '--unidiff-zero', '--check', str(bit_patch)], cwd=build)
    run(['git', 'apply', '--unidiff-zero', str(bit_patch)], cwd=build)
    if hashlib.sha256((build / 'gcc/thumb.md').read_bytes()).hexdigest() != '5163ba23328dddde3d5c681163dd0c179c51f1fbd382aea807f3255e1a938d4d':
        raise ValueError('patched Thumb backend hash mismatch')
    live_patch = Path(__file__).with_name('live-and-zero.patch')
    run(['git', 'apply', '--check', str(live_patch)], cwd=build)
    run(['git', 'apply', str(live_patch)], cwd=build)
    if hashlib.sha256((build / 'gcc/thumb.md').read_bytes()).hexdigest() != 'b3afe0e40f92a70683208c7daede41f33ebc5d4d27f53f0443b58a64e08ed49e':
        raise ValueError('live AND backend hash mismatch')
    # The upstream generator dependencies require a serial clean build.
    print('Compiler build log: ' + str(build / 'build.log'), flush=True)
    with (build / 'build.log').open('w') as log:
        run(['make', '-C', str(build / 'gcc'), '-j1', 'normal'], stdout=log, stderr=subprocess.STDOUT)
    compiler = build / 'gcc' / ('agbcc.exe' if os.name == 'nt' else 'agbcc')
    run([sys.executable, str(Path(__file__).with_name('check.py')), '--compiler', str(compiler)])
    output = args.output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    temporary = output.with_name(output.name + '.tmp')
    shutil.copy2(compiler, temporary)
    os.replace(temporary, output)
    provenance = {
        'upstream': UPSTREAM, 'revision': REVISION,
        'patch_sha256': hashlib.sha256(PATCH.read_bytes()).hexdigest(),
        'bit_test_patch_sha256': hashlib.sha256(bit_patch.read_bytes()).hexdigest(),
        'live_and_patch_sha256': hashlib.sha256(live_patch.read_bytes()).hexdigest(),
        'compiler_sha256': hashlib.sha256(output.read_bytes()).hexdigest(),
        'build_directory': str(build), 'output': str(output),
    }
    (build / 'build-info.json').write_text(json.dumps(provenance, indent=2) + '\n')
    print(json.dumps(provenance, indent=2))


if __name__ == '__main__':
    main()
