#!/usr/bin/env python3
"""Restore the pinned payload source, including locally bundled decompilation."""
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
PAYLOAD = ROOT / 'mgfembp'
BUNDLE = Path(__file__).with_name('decomp-completion.bundle')


def run(args, cwd=ROOT):
    subprocess.run(args, cwd=cwd, check=True)


def output(args, cwd=ROOT):
    return subprocess.check_output(args, cwd=cwd, text=True).strip()


def main():
    wanted = output(['git', 'rev-parse', ':mgfembp'])
    run(['git', 'submodule', 'init', 'mgfembp'])
    if not (PAYLOAD / '.git').exists():
        url = output(['git', 'config', 'submodule.mgfembp.url'])
        run(['git', 'clone', url, str(PAYLOAD)])
    current = output(['git', 'rev-parse', 'HEAD'], PAYLOAD)
    if current == wanted:
        print('Payload already at pinned commit ' + wanted)
        return
    if output(['git', 'status', '--porcelain'], PAYLOAD):
        raise SystemExit('Payload has local changes; refusing to replace them.')
    available = subprocess.run(['git', 'cat-file', '-e', wanted + '^{commit}'],
                               cwd=PAYLOAD, stdout=subprocess.DEVNULL,
                               stderr=subprocess.DEVNULL).returncode == 0
    if not available:
        run(['git', 'fetch', str(BUNDLE), 'refs/heads/decomp-completion'], PAYLOAD)
        run(['git', 'cat-file', '-e', wanted + '^{commit}'], PAYLOAD)
    run(['git', 'checkout', '--detach', wanted], PAYLOAD)
    run(['git', 'submodule', 'absorbgitdirs', 'mgfembp'])
    print('Restored payload commit ' + wanted)


if __name__ == '__main__':
    main()
