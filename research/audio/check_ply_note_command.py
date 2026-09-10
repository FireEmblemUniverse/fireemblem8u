#!/usr/bin/env python3
"""Verify matching note argument decoding and strict unsigned-bound compiler options."""
import argparse,hashlib,json,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/ply-note';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'research/audio/ply_note_command.c').read_text()
 tail=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=PlyNoteToneSetup','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteToneSetup']
 plugin=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_unsigned_bounds.so'),'-fplugin-arg-thumb_unsigned_bounds-bound=128','-fplugin-arg-thumb_unsigned_bounds-expected=3']
 def compile(name,text=source,opts=tail+plugin):
  path=out/(name+'.c');obj=out/(name+'.o');path.write_text(text)
  run=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+opts,capture_output=True,text=True)
  (out/(name+'.log')).write_text(run.stdout+run.stderr);return run,obj
 run,obj=compile('command-candidate');assert run.returncode==0,run.stderr
 script=out/'command-candidate.ld';script.write_text('SECTIONS { .text 0x080cfe64 : { *(.text) } PlyNoteToneSetup = 0x080cfe8a; }')
 elf=out/'command-candidate.elf';binary=out/'command-candidate.bin'
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert binary.read_bytes()==rom[0xcfe64:0xcfe8a],binary.read_bytes().hex()
 if a.production:
  assert (ROOT/'fireemblem8.gba').read_bytes()==rom
  assert (ROOT/'src/m4a_ply_note_command.c').read_text()==source.replace('PlyNoteCommandCandidate','PlyNoteCommand')
 invalid=[('threshold',source.replace('>= 0x80','>= 0x81',1),tail+plugin),
          ('signed',source.replace('noteByte >= 0x80','(s32)noteByte >= 0x80',1),tail+plugin),
          ('missing_private',source.replace('matching_tail_transfer, ',''),plugin),
          ('wrong_count',source,tail+plugin[:2]+['-fplugin-arg-thumb_unsigned_bounds-expected=2']),
          ('missing_count',source,tail+plugin[:2]),
          ('missing_bound',source,tail+[plugin[0],plugin[2]]),
          ('duplicate_bound',source,tail+plugin+[plugin[1]]),
          ('duplicate_count',source,tail+plugin+[plugin[2]]),
          ('zero_bound',source,tail+[plugin[0],'-fplugin-arg-thumb_unsigned_bounds-bound=0',plugin[2]]),
          ('large_bound',source,tail+[plugin[0],'-fplugin-arg-thumb_unsigned_bounds-bound=256',plugin[2]]),
          ('unknown',source,tail+plugin+['-fplugin-arg-thumb_unsigned_bounds-unknown=1'])]
 for name,text,opts in invalid:
  run,_=compile('reject_command_'+name,text,opts);assert run.returncode,name
 plain=source.replace(', matching_thumb_unsigned_bounds','')
 run,obj=compile('command-plain',plain,tail);assert not run.returncode,run.stderr;before=obj.read_bytes()
 run,obj=compile('command-plain',plain,tail+plugin);assert not run.returncode and obj.read_bytes()==before,run.stderr
 subprocess.run([sys.executable,str(ROOT/'research/audio/check_ply_note_command_model.py'),'--candidate-bin',str(binary)],check=True)
 report=dict(exact_instruction_bytes=38,invalid_contracts=len(invalid),unannotated_unchanged=True,
             source_sha256=hashlib.sha256(source.encode()).hexdigest(),production_integrated=a.production,
             model=json.loads((out/'command-candidate-model.json').read_text()))
 (out/'command-report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
