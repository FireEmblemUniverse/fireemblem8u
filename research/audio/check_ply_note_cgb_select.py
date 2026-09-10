#!/usr/bin/env python3
"""Verify matching CGB selection and strict shared-tail compiler options."""
import argparse,hashlib,json,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/ply-note';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'research/audio/ply_note_cgb_select.c').read_text()
 tail=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=PlyNoteChannelAttach','-fplugin-arg-tail_transfer-destination=PlyNoteExit','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches']
 plugin=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_shared_tails.so'),'-fplugin-arg-thumb_shared_tails-destination=PlyNoteChannelAttach','-fplugin-arg-thumb_shared_tails-expected-transfers=4']
 def compile(name,text=source,opts=tail+plugin):
  path=out/(name+'.c');obj=out/(name+'.o');path.write_text(text)
  run=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-fno-crossjumping','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+opts,capture_output=True,text=True)
  (out/(name+'.log')).write_text(run.stdout+run.stderr);return run,obj
 run,obj=compile('cgb_select-candidate');assert run.returncode==0,run.stderr
 script=out/'cgb_select-candidate.ld';script.write_text('SECTIONS { .text 0x080cfefe : { *(.text) } PlyNoteChannelAttach = 0x080cff84; PlyNoteExit = 0x080d002a; }')
 elf=out/'cgb_select-candidate.elf';binary=out/'cgb_select-candidate.bin'
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert binary.read_bytes()==rom[0xcfefe:0xcff30],binary.read_bytes().hex()
 if a.production:
  assert (ROOT/'fireemblem8.gba').read_bytes()==rom
  assert (ROOT/'src/m4a_ply_note_cgb_select.c').read_text()==source.replace('PlyNoteCgbSelectCandidate','PlyNoteCgbSelect')
 invalid=[
  ('signed_compare',source.replace('if (cgbR1 < cgbR0)', 'if ((s32)cgbR1 < (s32)cgbR0)'),tail+plugin),
  ('unsupported_compare',source.replace('if (cgbR0 >= cgbR5)', 'if (cgbR0 > cgbR5)'),tail+plugin),
  ('changed_edge',source.replace('if (cgbR0 >= cgbR5) goto accept;', 'if (cgbR0 >= cgbR5) { PlyNoteExit(); return; }'),tail+plugin),
  ('high_register',source.replace('asm("r1")','asm("r8")'),tail+plugin),
  ('zero_guard_edge',source.replace('if (!cgbR4) { PlyNoteExit(); return; }', 'if (!cgbR4) goto accept;'),tail+plugin),
  ('fallthrough_stub',source.replace('    PlyNoteExit();\n    return;\naccept:', '    asm("" : "+r"(cgbR0));\naccept:'),tail+plugin),
  ('missing_private',source.replace('matching_tail_transfer, ',''),plugin),
  ('wrong_destination',source,tail+[plugin[0],'-fplugin-arg-thumb_shared_tails-destination=Other',plugin[2]]),
  ('missing_destination',source,tail+[plugin[0],plugin[2]]),
  ('duplicate_destination',source,tail+plugin+[plugin[1]]),
  ('missing_count',source,tail+plugin[:2]),
  ('wrong_count',source,tail+plugin[:2]+['-fplugin-arg-thumb_shared_tails-expected-transfers=3']),
  ('duplicate_count',source,tail+plugin+[plugin[2]]),
  ('unknown',source,tail+plugin+['-fplugin-arg-thumb_shared_tails-unknown'])]

 for name,text,opts in invalid:
  run,_=compile('reject_cgb_select_'+name,text,opts);assert run.returncode,name
 plain=source.replace(', matching_thumb_shared_tails','')
 run,obj=compile('cgb_select-plain',plain,tail);assert not run.returncode,run.stderr;before=obj.read_bytes()
 run,obj=compile('cgb_select-plain',plain,tail+plugin);assert not run.returncode and obj.read_bytes()==before,run.stderr
 subprocess.run([sys.executable,str(ROOT/'research/audio/check_ply_note_cgb_model.py'),'--candidate-bin',str(binary)],check=True)
 report=dict(exact_instruction_bytes=50,invalid_contracts=len(invalid),unannotated_unchanged=True,
             source_sha256=hashlib.sha256(source.encode()).hexdigest(),production_integrated=a.production,
             model=json.loads((out/'cgb-candidate-model.json').read_text()))
 (out/'cgb_select-report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
