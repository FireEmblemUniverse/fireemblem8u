#!/usr/bin/env python3
"""Ensure inserted gaps fail the payload IRQ cross-section layout contracts."""
import json,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];out=ROOT/'.deps/payload-irq-search';layout=(ROOT/'mgfembp/mgfembp.lds').read_text();results=[]
for image in ('mgfembp','mgfembp_20030206','mgfembp_20030219'):
 cwd=ROOT/'mgfembp/build'/image
 objects=[line.split()[1] for line in (ROOT/f'mgfembp/{image}.map').read_text().splitlines() if line.startswith('LOAD ') and line.endswith('.o')]
 assert objects and all((cwd/x).is_file() for x in objects)
 for name,needle in [('entry_gap','src/irq_entry.o(.text);'),('frame_gap','src/crt0.o(.text.irq_save_frame);'),('search_gap','src/irq_search.o(.text);'),('continuation_gap','src/crt0.o(.text.irq_selected);')]:
  assert layout.count(needle)==1
  script=out/(image+'-'+name+'.ld');script.write_text(layout.replace(needle,'. += 4; '+needle))
  result=subprocess.run(['arm-none-eabi-ld','-T',str(script),*objects,'-L'+str(ROOT/'.deps/runtime-c'),'-L'+str(ROOT/'tools/agbcc/lib'),'-lc','-lgcc','-o',str(out/(image+'-'+name+'.elf'))],cwd=cwd,capture_output=True,text=True)
  assert result.returncode and 'literal moved' in result.stderr and 'IRQ ' in result.stderr,result.stderr
  results.append(dict(image=image,mutation=name,rejected=True))
(ROOT/'docs/payload-irq-layout.json').write_text(json.dumps(dict(rejected=results),indent=2)+'\n');print(len(results), 'displaced IRQ layouts rejected')
