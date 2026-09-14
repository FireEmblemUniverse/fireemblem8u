#!/usr/bin/env python3
"""Verify matching pitch and frequency setup and its private compiler contracts."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
ROOT=Path(__file__).resolve().parents[2]

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/ply-note';source=(ROOT/'research/audio/ply_note_frequency_setup.c').read_text()
    plugins=ROOT/'.deps/flood-core-new-backend'
    tail=['-fplugin='+str(plugins/'tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches',
          '-fplugin-arg-tail_transfer-destination=PlyNotePcmFrequencySetup','-fplugin-arg-tail_transfer-destination=PlyNoteCgbFrequencyInvoke',
          '-fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteCgbFrequencyInvoke']
    add=['-fplugin='+str(plugins/'thumb_add_sign_branch.so')]
    copy=['-fplugin='+str(plugins/'copy_add_zero.so'),'-fplugin-arg-copy_add_zero-preserve-thumb-high-copies']
    direct=['-fplugin='+str(plugins/'thumb_direct_tails.so'),'-fplugin-arg-thumb_direct_tails-destination=PlyNotePcmFrequencySetup','-fplugin-arg-thumb_direct_tails-expected-transfers=1']
    options=tail+add+copy+direct
    def compile(name,text=source,opts=options):
        path,obj=out/(name+'.c'),out/(name+'.o');path.write_text(text)
        run=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-fno-if-conversion','-fno-if-conversion2',
            '-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),
            '-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+opts,capture_output=True,text=True)
        (out/(name+'.log')).write_text(run.stdout+run.stderr);return run,obj
    run,obj=compile('frequency-setup-candidate');assert not run.returncode,run.stderr
    script=out/'frequency-setup-candidate.ld';script.write_text('SECTIONS { .text 0x080cffd8 : { *(.text) } PlyNotePcmFrequencySetup = 0x080d0012; PlyNoteCgbFrequencyInvoke = 0x080d000c; }')
    elf,binary=out/'frequency-setup-candidate.elf',out/'frequency-setup-candidate.bin'
    subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
    rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert binary.read_bytes()==rom[0xcffd8:0xd000c],binary.read_bytes().hex()
    if a.production:
        assert (ROOT/'src/m4a_ply_note_frequency_setup.c').read_text()==source.replace('PlyNoteFrequencySetupCandidate','PlyNoteFrequencySetupBody')
        assert (ROOT/'fireemblem8.gba').read_bytes()==rom
        prodelf,prodbin=out/'frequency-setup-production.elf',out/'frequency-setup-production.bin'
        subprocess.run(['arm-none-eabi-ld','-T',str(script),str(ROOT/'src/m4a_ply_note_frequency_setup.o'),'-o',str(prodelf)],check=True)
        subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(prodelf),str(prodbin)],check=True)
        assert prodbin.read_bytes()==binary.read_bytes()
    invalid=[
        ('missing_frame',source,options[:1]+options[2:]),
        ('wrong_destination',source.replace('PlyNotePcmFrequencySetup();','Other();'),options),
        ('missing_tail_contract',source.replace('matching_tail_transfer, ',''),options),
        ('changed_clamp',source.replace('freqR3 < 0','freqR3 <= 0'),options),
        ('changed_sum',source.replace('freqR1 + freqR0','freqR1 - freqR0'),options),
        ('high_sum_operand',source.replace('asm("r1")','asm("r10")'),options),
        ('frame_out_of_bounds',source.replace('freqSP + 12','freqSP + 64'),options),
        ('stack_mutation',source.replace('freqR6 = freqR9;','freqSP += 4; freqR6 = freqR9;'),options),
        ('missing_high_copy',source,tail+add+copy[:1]+direct),
        ('wrong_transfer_count',source,[x.replace('expected-transfers=1','expected-transfers=2') for x in options]),
        ('branchless_clamp',source,options+['-fif-conversion','-fif-conversion2']),
        ('unknown_option',source,options+['-fplugin-arg-thumb_add_sign_branch-unknown']),
    ]
    for name,text,opts in invalid:
        run,_=compile('reject-frequency-'+name,text,opts);assert run.returncode,name
    plain=source.replace(', matching_thumb_direct_tails','')
    run,obj=compile('frequency-setup-plain',plain,tail+add+copy);assert not run.returncode,run.stderr;before=obj.read_bytes()
    run,obj=compile('frequency-setup-plain',plain,options);assert not run.returncode and obj.read_bytes()==before,run.stderr
    subprocess.run([sys.executable,str(ROOT/'research/audio/check_ply_note_frequency_model.py'),'--candidate-bin',str(binary)],check=True)
    report=dict(exact_candidate_bytes=52,invalid_contracts=len(invalid),unannotated_direct_output_unchanged=True,production_integrated=a.production,
                source_sha256=hashlib.sha256(source.encode()).hexdigest(),model=json.loads((out/'frequency-model.json').read_text()))
    (out/'frequency-setup-report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))

if __name__=='__main__':main()
