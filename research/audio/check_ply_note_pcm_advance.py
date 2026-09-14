#!/usr/bin/env python3
"""Check the matching decrement-and-repeat candidate and private-tail contracts."""
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
    out = ROOT/'.deps/soundmain-packed/ply-note'
    source = (ROOT/'research/audio/ply_note_pcm_advance.c').read_text()
    plugins = ROOT/'.deps/flood-core-new-backend'
    tail = ['-fplugin='+str(plugins/'tail_transfer.so'),
            '-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches']
    tail += ['-fplugin-arg-tail_transfer-destination='+s for s in ('PlyNotePcmLoop','PlyNoteExit','PlyNoteChannelAttach')]
    tail += ['-fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteChannelAttach']
    fork = ['-fplugin='+str(plugins/'thumb_fork_decrement.so')]
    direct = ['-fplugin='+str(plugins/'thumb_direct_tails.so'),
              '-fplugin-arg-thumb_direct_tails-destination=PlyNotePcmLoop',
              '-fplugin-arg-thumb_direct_tails-destination=PlyNoteExit',
              '-fplugin-arg-thumb_direct_tails-expected-transfers=2',
              '-fplugin-arg-thumb_direct_tails-fork-decrement']
    def compile(name,text=source,options=tail+fork+direct):
        path,obj=out/(name+'.c'),out/(name+'.o')
        path.write_text(text)
        run=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks',
            '-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes',
            '-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+options,
            capture_output=True,text=True)
        (out/(name+'.log')).write_text(run.stdout+run.stderr)
        return run,obj
    run,obj=compile('pcm-advance-candidate')
    assert not run.returncode,run.stderr
    script=out/'pcm-advance-candidate.ld'
    script.write_text('SECTIONS { .text 0x080cff78 : { *(.text) } PlyNotePcmLoop = 0x080cff3e; PlyNoteExit = 0x080d002a; PlyNoteChannelAttach = 0x080cff84; }')
    elf,binary=out/'pcm-advance-candidate.elf',out/'pcm-advance-candidate.bin'
    subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
    rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert binary.read_bytes()==rom[0xcff78:0xcff84],binary.read_bytes().hex()
    if a.production:
        assert (ROOT/'src/m4a_ply_note_pcm_advance.c').read_text()==source.replace('PlyNotePcmAdvanceCandidate','PlyNotePcmAdvanceBody')
        assert (ROOT/'fireemblem8.gba').read_bytes()==rom
        prodelf,prodbin=out/'pcm-advance-production.elf',out/'pcm-advance-production.bin'
        subprocess.run(['arm-none-eabi-ld','-T',str(script),str(ROOT/'src/m4a_ply_note_pcm_advance.o'),'-o',str(prodelf)],check=True)
        subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(prodelf),str(prodbin)],check=True)
        assert prodbin.read_bytes()==binary.read_bytes()
    invalid=[
        ('missing_frame',source,tail[:1]+tail[2:]+fork+direct),
        ('unsigned_count',source.replace('(s32)pcmR3 > 1','pcmR3 > 1'),tail+fork+direct),
        ('changed_bound',source.replace('(s32)pcmR3 > 1','(s32)pcmR3 > 2'),tail+fork+direct),
        ('unequal_decrements',source.replace('pcmR3--;','pcmR3 -= 2;',1),tail+fork+direct),
        ('high_count',source.replace('asm("r3")','asm("r9")'),tail+fork+direct),
        ('intervening_work',source.replace('PlyNotePcmLoop();','pcmR4 += 4; PlyNotePcmLoop();'),tail+fork+direct),
        ('missing_fork_contract',source.replace(', matching_thumb_fork_decrement',''),tail+fork+direct),
        ('undeclared_loop',source,tail+fork+direct[:1]+direct[2:]),
        ('missing_direct_mode',source,tail+fork+direct[:-1]),
        ('wrong_count',source,tail+fork+[x.replace('expected-transfers=2','expected-transfers=1') for x in direct]),
        ('duplicate_mode',source,tail+fork+direct+[direct[-1]]),
        ('mixed_mode',source,tail+fork+direct+['-fplugin-arg-thumb_direct_tails-descending-mask-operands']),
    ]
    for name,text,options in invalid:
        run,_=compile('reject-pcm-advance-'+name,text,options)
        assert run.returncode,name
    plain=source.replace(', matching_thumb_direct_tails','')
    run,obj=compile('pcm-advance-plain',plain,tail+fork)
    assert not run.returncode,run.stderr
    before=obj.read_bytes()
    run,obj=compile('pcm-advance-plain',plain,tail+fork+direct)
    assert not run.returncode and before==obj.read_bytes(),run.stderr
    subprocess.run([sys.executable,str(ROOT/'research/audio/check_ply_note_pcm_advance_model.py'),'--candidate-bin',str(binary)],check=True)
    composite=out/'pcm-advance-with-original-selection.bin'
    composite.write_bytes(rom[0xcff30:0xcff78]+binary.read_bytes())
    subprocess.run([sys.executable,str(ROOT/'research/audio/check_ply_note_pcm_model.py'),'--candidate-bin',str(composite)],check=True)
    report=dict(exact_candidate_bytes=12,invalid_contracts=len(invalid),unannotated_unchanged=True,production_integrated=a.production,
                source_sha256=hashlib.sha256(source.encode()).hexdigest(),
                isolated_model=json.loads((out/'pcm-advance-model.json').read_text()),
                selection_model=json.loads((out/'pcm-candidate-model.json').read_text()))
    (out/'pcm-advance-report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))

if __name__=='__main__':
    main()
