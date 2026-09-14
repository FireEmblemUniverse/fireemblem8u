#!/usr/bin/env python3
"""Check channel initialization bytes, private ABI contracts and alias behavior."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
ROOT=Path(__file__).resolve().parents[2]

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler',required=True)
    p.add_argument('--production',action='store_true')
    a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/ply-note'
    source=(ROOT/'research/audio/ply_note_channel_init.c').read_text()
    tail=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),
          '-fplugin-arg-tail_transfer-private-frame64',
          '-fplugin-arg-tail_transfer-destination=PlyNoteVolumeInvoke',
          '-fplugin-arg-tail_transfer-adjacent-destination=PlyNoteVolumeInvoke']
    def compile(name,text=source,options=tail):
        path,obj=out/(name+'.c'),out/(name+'.o')
        path.write_text(text)
        run=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks',
            '-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes',
            '-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+options,
            capture_output=True,text=True)
        (out/(name+'.log')).write_text(run.stdout+run.stderr)
        return run,obj
    run,obj=compile('channel-init-candidate')
    assert not run.returncode,run.stderr
    binary=out/'channel-init-candidate.bin'
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
    rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert binary.read_bytes()==rom[0xcffb2:0xcffd4]
    if a.production:
        assert (ROOT/'src/m4a_ply_note_channel_init.c').read_text()==source.replace('PlyNoteChannelInitCandidate','PlyNoteChannelInitBody')
        assert (ROOT/'fireemblem8.gba').read_bytes()==rom
        prodbin=out/'channel-init-production.bin'
        subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(ROOT/'src/m4a_ply_note_channel_init.o'),str(prodbin)],check=True)
        assert prodbin.read_bytes()==binary.read_bytes()
    invalid=[
        ('missing_frame',source,tail[:1]+tail[2:]),
        ('wrong_destination',source.replace('PlyNoteVolumeInvoke();','Other();'),tail),
        ('post_call_work',source.replace('PlyNoteVolumeInvoke();','PlyNoteVolumeInvoke(); initR0=2;'),tail),
        ('instruction_template',source.replace('    initR6 = initR9;', '    asm("nop"); initR6 = initR9;'),tail),
        ('frame_out_of_bounds',source.replace('initSP + 16','initSP + 64'),tail),
        ('stack_mutation',source.replace('    initR6 = initR9;', '    initSP += 4; initR6 = initR9;'),tail),
        ('unknown_option',source,tail+['-fplugin-arg-tail_transfer-unknown']),
    ]
    for name,text,options in invalid:
        run,_=compile('reject-channel-init-'+name,text,options)
        assert run.returncode,name
    plain=source.replace('__attribute__((matching_tail_transfer))','')
    run,obj=compile('channel-init-plain',plain,[])
    assert not run.returncode,run.stderr
    before=obj.read_bytes()
    run,obj=compile('channel-init-plain',plain,tail)
    assert not run.returncode and before==obj.read_bytes(),run.stderr
    subprocess.run([sys.executable,str(ROOT/'research/audio/check_ply_note_channel_init_model.py'),'--candidate-bin',str(binary)],check=True)
    report=dict(exact_candidate_bytes=34,invalid_contracts=len(invalid),unannotated_unchanged=True,
                source_sha256=hashlib.sha256(source.encode()).hexdigest(),production_integrated=a.production,
                model=json.loads((out/'channel-init-model.json').read_text()))
    (out/'channel-init-report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))

if __name__=='__main__':
    main()
