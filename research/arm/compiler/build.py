#!/usr/bin/env python3
"""Build the optional research plugin against the installed ARM GCC headers."""
import hashlib
import json
import os
from pathlib import Path
import shlex
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[3]


def main():
    source = Path(__file__).with_name('zero_test.cc')
    plugin = Path(subprocess.check_output(['arm-none-eabi-gcc','-print-file-name=plugin'],text=True).strip())
    headers = plugin / 'include'
    if not (headers / 'gcc-plugin.h').is_file():
        raise SystemExit('Installed ARM GCC does not provide plugin headers.')
    out = ROOT / '.deps/arm-matching-plugin'
    out.mkdir(parents=True,exist_ok=True)
    binary = out / 'zero_test.so'
    command = shlex.split(os.environ.get('CXX','c++'))
    command += ['-std=gnu++17','-fno-rtti','-fPIC','-shared','-Wno-deprecated-declarations',
                '-Wno-array-bounds','-I',str(headers)]
    command += shlex.split(os.environ.get('CPPFLAGS',''))
    for directory in ['/opt/homebrew/include','/usr/local/include']:
        if Path(directory,'gmp.h').is_file():
            command += ['-I',directory]
    if sys.platform == 'darwin':
        command += ['-undefined','dynamic_lookup']
    command += [str(source),'-o',str(binary)]
    subprocess.run(command,check=True)
    report = {'command':command, 'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
              'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),
              'compiler_version':subprocess.check_output(['arm-none-eabi-gcc','-dumpfullversion'],text=True).strip()}
    (out/'build-info.json').write_text(json.dumps(report,indent=2)+'\n')
    print(binary)


if __name__ == '__main__':
    main()
