#!/usr/bin/env python3
"""Measure mapped instruction ownership; deliberately not a C completion score."""
import argparse
from collections import Counter
import json
from pathlib import Path
import subprocess
import sys
ROOT=Path(__file__).resolve().parents[1]

def read_json(command):
    return json.loads(subprocess.check_output(command,cwd=ROOT,text=True))

def classify(linked,source,root):
    mixed={x['path'] for x in source['inline_assembly_classification']['sites'] if x['kind'] in ('instruction_template','unresolved')}
    for key in ('naked_function_markers','naked_function_attributes'):
        mixed.update(x['path'] for x in source['findings'].get(key,[]))
    totals=Counter();objects=[]
    for owner,kinds in linked['objects'].items():
        size=kinds.get('arm',0)+kinds.get('thumb',0)
        if not size:continue
        stem=owner.removesuffix('.o');c=stem+'.c'
        if '.a(' in owner:category='runtime_archive'
        elif (root/c).is_file():category='c_with_assembly' if c in mixed else 'c_owned'
        elif any((root/(stem+ext)).is_file() for ext in ('.s','.S')):category='assembly_source'
        else:category='unresolved_owner'
        totals[category]+=size
        objects.append(dict(object=owner,category=category,instruction_bytes=size))
    expected=linked['mapped_bytes'].get('arm',0)+linked['mapped_bytes'].get('thumb',0)
    assert sum(totals.values())==expected
    assert not linked['mappings_outside_input_sections']
    return dict(mapped_instruction_bytes=expected,categories=dict(totals),objects=sorted(objects,key=lambda x:(-x['instruction_bytes'],x['object'])),elf_sha256=linked['elf_sha256'],map_sha256=linked['map_sha256'],unmapped_input_bytes=linked['mapped_bytes'].get('unmapped',0),data_mapped_bytes=linked['mapped_bytes'].get('data',0),outside_input_bytes=linked['bytes_outside_input_sections'])

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--json',type=Path,required=True);p.add_argument('--markdown',type=Path,required=True);a=p.parse_args()
    source=read_json([sys.executable,'scripts/audit_decomp.py'])
    linked=read_json([sys.executable,'scripts/audit_linked_code.py'])
    images={'main_rom':classify(linked,source,ROOT)}
    for embedded in source['embedded_executables']:
        assert embedded['initialized'],'Initialize embedded source before measuring'
        base=ROOT/embedded['path']
        info=read_json([sys.executable,'scripts/audit_linked_code.py','--elf',str(base/'mgfembp.elf'),'--map',str(base/'mgfembp.map'),'--start',hex(embedded['load_address']),'--size',str(embedded['expanded_size'])])
        images[embedded['path']]=classify(info,embedded['source_inventory'],base)
    report=dict(scope='Current mapped ARM/Thumb instruction bytes by source ownership; not a decompilation percentage.',baseline_commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip(),images=images,limitations=[
        'C-owned does not prove assembly-free generated code, complete recovery or native engine compatibility.',
        'C-with-assembly counts the entire containing object; it is not all remaining assembly.',
        'Runtime archives require source provenance and instruction-level classification before inclusion in a completion score.',
        'Assembler mappings may include alignment and omit hidden code in data/unmapped areas.',
        'Main ROM and expanded payload are separate scopes; do not add their stored image sizes or count the compressed payload as instructions.',
        'Counts include inherited community work, not only changes made in this task.'])
    a.json.parent.mkdir(parents=True,exist_ok=True);a.json.write_text(json.dumps(report,indent=2)+'\n')
    labels={'c_owned':'C-owned objects','c_with_assembly':'C objects containing assembly','assembly_source':'Assembly-source objects','runtime_archive':'Runtime archive objects','unresolved_owner':'Unresolved ownership'}
    lines=['# Linked instruction ownership','',f"Build baseline: `{report['baseline_commit'][:8]}`. Regenerate with `python3 scripts/audit_code_ownership.py --json docs/code-ownership.json --markdown docs/code-ownership.md`.",'','**This is a size-weighted inventory, not an overall completion percentage.**','', '| Scope | Mapped instruction bytes |','|---|---:|']
    for name,img in images.items():lines.append(f"| {name} | {img['mapped_instruction_bytes']:,} |")
    for name,img in images.items():
        lines += ['',f'## {name}','', '| Ownership | Instruction bytes | Share of mapped instructions |','|---|---:|---:|']
        for key,label in labels.items():
            n=img['categories'].get(key,0);lines.append(f"| {label} | {n:,} | {100*n/img['mapped_instruction_bytes']:.2f}% |")
        lines += ['','Assembly-source objects, largest first:','', '| Object | Instruction bytes |','|---|---:|']
        for obj in img['objects']:
            if obj['category']=='assembly_source':lines.append(f"| `{obj['object']}` | {obj['instruction_bytes']:,} |")
        lines += ['', 'C objects needing assembly review (whole-object sizes, **not** remaining assembly bytes):','', '| Object | Instruction bytes |','|---|---:|']
        for obj in img['objects']:
            if obj['category']=='c_with_assembly':lines.append(f"| `{obj['object']}` | {obj['instruction_bytes']:,} |")
    lines += ['','## Interpretation','']+['- '+x for x in report['limitations']]
    a.markdown.write_text('\n'.join(lines)+'\n')
    print(json.dumps({name:dict(mapped_instruction_bytes=x['mapped_instruction_bytes'],categories=x['categories']) for name,x in images.items()},indent=2))
if __name__=='__main__':main()
