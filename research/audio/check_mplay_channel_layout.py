#!/usr/bin/env python3
"""Reject altered production channel-gate extents and unsafe short-tail targets."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 out=ROOT/'.deps/soundmain-packed/mplay-channel-gate-direct/layout';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'ldscript.txt').read_text()
 def link(name,text):
  script=out/(name+'.ld');script.write_text(text)
  result=subprocess.run(['arm-none-eabi-ld','-T',str(script),'@objects.lst','-R','banim/data_banim.o.sym.o','-L','tools/agbcc/lib','-o',str(out/(name+'.elf')),'-lc','-lgcc'],cwd=ROOT,capture_output=True,text=True)
  (out/(name+'.log')).write_text(result.stdout+result.stderr)
  return result
 r=link('valid',source);assert not r.returncode,r.stderr
 cases=[('extent',source.replace('        __mplay_channel_gate_end = .;', '        . += 2;\n        __mplay_channel_gate_end = .;'),'extent or continuation'),
        ('continuation',source.replace('        src/m4a_1.o(.text.after_mplay_channel_gate);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_channel_gate);'),'extent or continuation')]
 first=source.index('        ASSERT((MPlayMainChannelGate & ~1)')
 second=source.index('        ASSERT(MPlayMainChannelClear >=',first)
 range_only=source[:first]+source[second:]
 for name,expression in [('far','__mplay_channel_gate_start + 512'),('backward','__mplay_channel_gate_start - 512'),('odd','__mplay_channel_gate_start + 35')]:
  target='__mplay_channel_next_start' if name=='odd' else 'MPlayMainChannelNext'
  text=range_only.replace('        ASSERT(MPlayMainChannelClear >=','        '+target+' = '+expression+';\n        ASSERT(MPlayMainChannelClear >=',1)
  cases.append((name,text,'conditional tail out of range'))
 cases += [('next_extent',source.replace('        __mplay_channel_next_end = .;','        . += 2;\n        __mplay_channel_next_end = .;'),'channel next extent or continuation'),
           ('track_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_channel_next);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_channel_next);'),'channel next extent or continuation'),
           ('next_far_gate',source.replace('        ASSERT((MPlayMainChannelGate & ~1) + 256 >=','        MPlayMainChannelGate = __mplay_channel_next_start + 264;\n        ASSERT((MPlayMainChannelGate & ~1) + 256 >=',1),'channel next conditional tail out of range')]
 cases += [('track_guard_extent',source.replace('        __mplay_track_init_guard_end = .;','        . += 2;\n        __mplay_track_init_guard_end = .;'),'track init guard extent'),
           ('track_defaults_extent',source.replace('        __mplay_track_init_defaults_end = .;','        . += 2;\n        __mplay_track_init_defaults_end = .;'),'track defaults extent'),
           ('track_dispatch_continuation',source.replace('        src/m4a_1.o(.text.after_mplay_track_init_defaults);','        . += 2;\n        src/m4a_1.o(.text.after_mplay_track_init_defaults);'),'track defaults extent')]
 for name,expression in [('track_wait_far','__mplay_track_init_guard_start + 512'),('track_wait_odd','__mplay_track_init_guard_start + 127')]:
  text=source.replace('        ASSERT(MPlayMainTrackWait >=','        MPlayMainTrackWait = '+expression+';\n        ASSERT(MPlayMainTrackWait >=',1)
  cases.append((name,text,'track init transfer out of range'))
 for name,text,message in cases:
  r=link(name,text);assert r.returncode and message in r.stderr,(name,r.stderr)
 report=dict(valid_layouts=1,rejected_layouts=len(cases),scope='Full production link; altered fragment size/continuation and isolated forward/backward/odd conditional-target constraints.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
