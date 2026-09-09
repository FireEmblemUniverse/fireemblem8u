#!/usr/bin/env python3
"""Build the matching ARM plugin against the installed ARM GCC headers."""
import hashlib
import json
import os
from pathlib import Path
import shlex
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]


def main():
    version = subprocess.check_output(['arm-none-eabi-gcc', '-dumpfullversion'], text=True).strip()
    if version != '16.2.0':
        raise SystemExit('Matching ARM plugin requires GCC 16.2.0; found ' + version)
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
    temporary = binary.with_suffix('.so.tmp')
    command += [str(source),'-o',str(temporary)]
    subprocess.run(command,check=True)
    os.replace(temporary, binary)
    report = {'command':command, 'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
              'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),
              'compiler_version':subprocess.check_output(['arm-none-eabi-gcc','-dumpfullversion'],text=True).strip()}
    (out/'build-info.json').write_text(json.dumps(report,indent=2)+'\n')
    print(binary)


if __name__ == '__main__':
    main()
