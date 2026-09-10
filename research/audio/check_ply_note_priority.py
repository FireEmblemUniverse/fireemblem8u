#!/usr/bin/env python3
"""Verify matching note priority dispatch and strict AND/store compiler options."""
import argparse,hashlib,json,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/ply-note';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'research/audio/ply_note_priority.c').read_text()
 tail=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=PlyNoteCgbSelect','-fplugin-arg-tail_transfer-destination=PlyNotePcmSelect','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=PlyNoteCgbSelect']
 plugin=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_and_store_tail.so'),'-fplugin-arg-thumb_and_store_tail-destination=PlyNotePcmSelect']
 def compile(name,text=source,opts=tail+plugin):
  path=out/(name+'.c');obj=out/(name+'.o');path.write_text(text)
  run=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+opts,capture_output=True,text=True)
  (out/(name+'.log')).write_text(run.stdout+run.stderr);return run,obj
 run,obj=compile('priority-candidate');assert run.returncode==0,run.stderr
 script=out/'priority-candidate.ld';script.write_text('SECTIONS { .text 0x080cfee0 : { *(.text) } PlyNoteCgbSelect = 0x080cfefe; PlyNotePcmSelect = 0x080cff30; }')
 elf=out/'priority-candidate.elf';binary=out/'priority-candidate.bin'
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert binary.read_bytes()==rom[0xcfee0:0xcfefe],binary.read_bytes().hex()
 if a.production:
  assert (ROOT/'fireemblem8.gba').read_bytes()==rom
  assert (ROOT/'src/m4a_ply_note_priority.c').read_text()==source.replace('PlyNotePriorityCandidate','PlyNotePriority')
 invalid=[('wrong_operation',source.replace('priorityR6 &= priorityR0','priorityR6 |= priorityR0'),tail+plugin),
          ('wrong_store',source.replace('= priorityR6;', '= priorityR1;'),tail+plugin),
          ('unaligned_store',source.replace('prioritySP + 12','prioritySP + 13'),tail+plugin),
          ('outside_frame',source.replace('prioritySP + 12','prioritySP + 64'),tail+plugin),
          ('nonvolatile_store',source.replace('*(volatile u32 *)(prioritySP + 12)','*(u32 *)(prioritySP + 12)'),tail+plugin),
          ('reverse_condition',source.replace('if (!priorityR6)','if (priorityR6)'),tail+plugin),
          ('missing_private',source.replace('matching_tail_transfer, ',''),plugin),
          ('wrong_destination',source,tail+[plugin[0],'-fplugin-arg-thumb_and_store_tail-destination=Other']),
          ('missing_destination',source,tail+plugin[:1]),
          ('duplicate_destination',source,tail+plugin+[plugin[1]]),
          ('unknown',source,tail+plugin+['-fplugin-arg-thumb_and_store_tail-unknown']),
          ('intervening_flags',source.replace('    if (!priorityR6)', '    priorityR1++; asm("" : "+r"(priorityR1));\n    if (!priorityR6)'),tail+plugin)]

 for name,text,opts in invalid:
  run,_=compile('reject_priority_'+name,text,opts);assert run.returncode,name
 plain=source.replace(', matching_thumb_and_store_tail','')
 run,obj=compile('priority-plain',plain,tail);assert not run.returncode,run.stderr;before=obj.read_bytes()
 run,obj=compile('priority-plain',plain,tail+plugin);assert not run.returncode and obj.read_bytes()==before,run.stderr
 subprocess.run([sys.executable,str(ROOT/'research/audio/check_ply_note_priority_model.py'),'--candidate-bin',str(binary)],check=True)
 report=dict(exact_instruction_bytes=30,invalid_contracts=len(invalid),unannotated_unchanged=True,
             source_sha256=hashlib.sha256(source.encode()).hexdigest(),production_integrated=a.production,
             model=json.loads((out/'priority-candidate-model.json').read_text()))
 (out/'priority-report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
