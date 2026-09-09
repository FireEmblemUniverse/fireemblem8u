#!/usr/bin/env python3
"""Build an isolated C-only GCC with explicit matching ARM RTL operations."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import urllib.request
ROOT=Path(__file__).resolve().parents[3]
OUT=ROOT/'.deps/gcc16-matching'
SHA='e6738e29597f733270731aa90600f37ffdc045079dfc27ec7e8192cc81085c3e'
URL='https://ftp.gnu.org/gnu/gcc/gcc-16.2.0/gcc-16.2.0.tar.xz'

def main():
    OUT.mkdir(exist_ok=True)
    archive=OUT/'gcc-16.2.0.tar.xz'
    if not archive.exists():
        temporary=archive.with_suffix('.download')
        urllib.request.urlretrieve(URL,temporary)
        temporary.replace(archive)
    assert hashlib.sha256(archive.read_bytes()).hexdigest()==SHA,'GCC source hash mismatch'
    source=OUT/'gcc-16.2.0'
    stamp=OUT/'source-extracted'
    if not stamp.exists():
        if source.exists():raise SystemExit('Existing source needs extraction completion verified before creating source-extracted stamp.')
        subprocess.run(['tar','-xf',str(archive),'-C',str(OUT)],check=True)
        stamp.write_text(SHA+'\n')
    assert stamp.read_text().strip()==SHA
    extension=Path(__file__).with_name('matching.md')
    destination=source/'gcc/config/arm/matching.md'
    if not destination.exists() or destination.read_bytes()!=extension.read_bytes():shutil.copyfile(extension,destination)
    md=source/'gcc/config/arm/arm.md'
    include='\n;; Explicit matching operations; see research/arm/compiler/matching.md.\n(include "matching.md")\n'
    text=md.read_text()
    original=text.removesuffix(include)
    assert hashlib.sha256(original.encode()).hexdigest()=='18263badc08b5d6dba7de2cfc1fbfeac918509b60fdc12d58503505961d22585','Unexpected ARM backend source changes'
    if '(include "matching.md")' not in text:md.write_text(text+include)
    build=OUT/'build';build.mkdir(exist_ok=True)
    env=os.environ.copy()
    for key in ('C_INCLUDE_PATH','CPLUS_INCLUDE_PATH','MAKEFLAGS'):env.pop(key,None)
    env.update(CC='clang',CXX='clang++',CFLAGS='-O2 -g0',CXXFLAGS='-O2 -g0')
    configure=[str(source/'configure'),'--target=arm-none-eabi','--prefix='+str(OUT/'install'),
               '--disable-nls','--without-headers','--enable-languages=c','--disable-bootstrap',
               '--disable-multilib','--disable-libsanitizer','--disable-libssp','--disable-libquadmath',
               '--enable-plugin','--with-gmp=/opt/homebrew/opt/gmp','--with-mpfr=/opt/homebrew/opt/mpfr',
               '--with-mpc=/opt/homebrew/opt/libmpc','--with-isl=/opt/homebrew/opt/isl',
               '--with-as=/opt/homebrew/bin/arm-none-eabi-as','--with-ld=/opt/homebrew/bin/arm-none-eabi-ld']
    if not (build/'Makefile').exists():subprocess.run(configure,cwd=build,env=env,check=True)
    subprocess.run(['make','-j4','all-gcc'],cwd=build,env=env,check=True)
    report={'source_url':URL,'source_sha256':SHA,'extension_sha256':hashlib.sha256(extension.read_bytes()).hexdigest(),
            'configure':configure,'target':'all-gcc','compiler':str(build/'gcc/xgcc'),
            'cc1_sha256':hashlib.sha256((build/'gcc/cc1').read_bytes()).hexdigest()}
    (OUT/'build-info.json').write_text(json.dumps(report,indent=2)+'\n')
    print(build/'gcc/xgcc')
if __name__=='__main__':main()
