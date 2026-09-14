#!/usr/bin/env python3
"""Compare recovered unsigned division against the ROM and an integer oracle."""
import argparse,difflib,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/runtime-division';OUT.mkdir(exist_ok=True)
source=ROOT/'research/runtime/udiv.c'
parser=argparse.ArgumentParser();parser.add_argument('--require-state-match',action='store_true');parser.add_argument('--division-needed',action='store_true');parser.add_argument('--operation',choices=['division','modulus'],default='division');parser.add_argument('--assembled-helper',type=Path);parser.add_argument('--require-exact-helper',action='store_true');parser.add_argument('--compiler-flag',action='append',default=[]);parser.add_argument('--require-exact-core',action='store_true');parser.add_argument('--nonzero-only',action='store_true');parser.add_argument('--extra-plugin',type=Path,action='append',default=[]);parser.add_argument('--compiler',default='arm-none-eabi-gcc');parser.add_argument('--plugin',type=Path);parser.add_argument('--source',type=Path,default=source);parser.add_argument('--optimization',choices=['O1','O2','Os'],default='O2');args=parser.parse_args();source=args.source
helper_symbol='__umodsi3' if args.operation=='modulus' else '__udivsi3'
helper_size=192 if args.operation=='modulus' else 120
if not args.assembled_helper:
 subprocess.run([args.compiler,*(['-fplugin='+str(args.plugin.resolve()),'-DMATCHING_COPY_ADD_ZERO','-Werror=attributes'] if args.plugin else []),*['-fplugin='+str(p.resolve()) for p in args.extra_plugin],*args.compiler_flag,'-S','-'+args.optimization,'-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-unwind-tables','-fno-asynchronous-unwind-tables',str(source),'-o',str(OUT/'udiv.s')],check=True)
 subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'udiv.s'),'-o',str(OUT/'udiv.o')],check=True)
symbols={x.split()[-1]:int(x.split()[0],16) for x in subprocess.check_output(['arm-none-eabi-nm',str(ROOT/'fireemblem8.elf')],text=True).splitlines() if len(x.split())==3}
if args.assembled_helper:
 code=args.assembled_helper.read_bytes()
 candidate_address=symbols[helper_symbol]
else:
 (OUT/'udiv.ld').write_text('SECTIONS { .text 0x080f0000 : { *(.text) } }\n')
 subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'udiv.ld'),str(OUT/'udiv.o'),'-R',str(ROOT/'fireemblem8.elf'),'-o',str(OUT/'udiv.elf')],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(OUT/'udiv.elf'),str(OUT/'udiv.bin')],check=True)
 code=(OUT/'udiv.bin').read_bytes()
 candidate_address=0x080f0000
rom=(ROOT/'baserom.gba').read_bytes()
rng=random.Random(0xd1a);edge=[0,1,2,3,7,15,16,17,0x0fffffff,0x10000000,0x7fffffff,0x80000000,0xfffffffe,0xffffffff]
cases=[(x,y,f) for x in edge for y in edge for f in (0,15)]
cases += [(rng.getrandbits(32),rng.getrandbits(32),f) for f in range(16) for _ in range(64)]
cases += [(x,0,f) for x in edge for f in range(16)]
# Force every normalization boundary and near-exact quotient with every flag profile.
cases += [(x,y,f) for f in range(16) for bit in range(32) for y in [1<<bit] for x in [y-1,y,min(0xffffffff,y+1)]]
if args.division_needed:cases=[case for case in cases if case[1] and case[0]>=case[1]]
if args.nonzero_only:cases=[case for case in cases if case[1]!=0]
flagdiffs=0;callerdiffs=0;zero_cases=0;zero_flagdiffs=0;nonzero_flagdiffs=0
register_diffs={str(n):0 for n in range(15)};stack_diffs=0
for numerator,denominator,flags in cases:
 initial=[numerator,denominator]+[rng.getrandbits(32) for _ in range(11)]
 snapshots=[];write_records=[]
 for draft in (False,True):
  u=Uc(UC_ARCH_ARM,UC_MODE_THUMB);u.mem_map(0x08000000,len(rom));u.mem_write(0x08000000,rom);u.mem_map(0x03000000,0x8000)
  if draft:u.mem_write(candidate_address,code)
  for n,value in enumerate(initial):u.reg_write(getattr(r,f'UC_ARM_REG_R{n}'),value)
  u.reg_write(r.UC_ARM_REG_CPSR,0x3f|(flags<<28));u.reg_write(r.UC_ARM_REG_SP,0x03007000);u.reg_write(r.UC_ARM_REG_LR,0x080ff001)
  state={'returned':False,'div0':0,'writes':[]}
  def hook(u,address,size,state):
   if address==symbols['__div0']:state['div0']+=1
   if address==0x080ff000:state['returned']=True;u.emu_stop()
  def write(u,access,address,size,value,state):state['writes'].append((address,size,value))
  u.hook_add(UC_HOOK_MEM_WRITE,write,state)
  u.hook_add(UC_HOOK_CODE,hook,state)
  u.emu_start((candidate_address if draft else symbols[helper_symbol])|1,0,count=2000)
  assert state['returned'] and state['div0']==int(denominator==0),(numerator,denominator,draft,state)
  snapshot=[u.reg_read(getattr(r,f'UC_ARM_REG_R{n}')) for n in range(15)]+[u.reg_read(r.UC_ARM_REG_CPSR)]
  assert snapshot[0]==((numerator%denominator if args.operation=='modulus' else numerator//denominator) if denominator else 0),(numerator,denominator,draft,snapshot[0])
  assert snapshot[4:12]==initial[4:12] and snapshot[13]==0x03007000
  snapshots.append(snapshot);write_records.append(state['writes'])
 for n in range(15):register_diffs[str(n)]+=snapshots[0][n]!=snapshots[1][n]
 stack_diffs+=write_records[0]!=write_records[1]
 different_flags=snapshots[0][-1]!=snapshots[1][-1]
 flagdiffs+=different_flags
 zero_flagdiffs+=different_flags and denominator==0
 nonzero_flagdiffs+=different_flags and denominator!=0
 callerdiffs+=any(snapshots[0][n]!=snapshots[1][n] for n in (1,2,3,12,14))
 zero_cases+=denominator==0

if args.require_state_match:assert not flagdiffs and not stack_diffs and not any(register_diffs.values())
core_exact=args.operation=='division' and code==rom[symbols[helper_symbol]-0x08000000+4:symbols[helper_symbol]-0x08000000+0x6e]
if args.require_exact_core:assert args.nonzero_only and core_exact and not flagdiffs and not callerdiffs and not stack_diffs and not any(register_diffs.values())
original=rom[symbols[helper_symbol]-0x08000000:symbols[helper_symbol]-0x08000000+helper_size]
helper_exact=code==original
if args.require_exact_helper:assert args.assembled_helper and not args.nonzero_only and helper_exact and not flagdiffs and not callerdiffs and not stack_diffs and not any(register_diffs.values())
a=[original[i:i+2] for i in range(0,len(original),2)];b=[code[i:i+2] for i in range(0,len(code),2)]
spans=[dict(original_offset=m.a*2,candidate_offset=m.b*2,bytes=m.size*2) for m in difflib.SequenceMatcher(None,a,b,autojunk=False).get_matching_blocks() if m.size>=4]
print(json.dumps(dict(exact_nonzero_core=core_exact,compiler_extra_flags=args.compiler_flag,nonzero_only=args.nonzero_only,extra_plugin_sha256=[hashlib.sha256(p.read_bytes()).hexdigest() for p in args.extra_plugin],zero_divisor_flag_difference_cases=zero_flagdiffs,nonzero_divisor_flag_difference_cases=nonzero_flagdiffs,compiler=args.compiler,plugin_sha256=hashlib.sha256(args.plugin.read_bytes()).hexdigest() if args.plugin else None,register_difference_cases=register_diffs,stack_write_difference_cases=stack_diffs,matching_halfword_spans_at_least_eight_bytes=spans,optimization=args.optimization,source_sha256=None if args.assembled_helper else hashlib.sha256(source.read_bytes()).hexdigest(),assembled_helper_sha256=hashlib.sha256(code).hexdigest(),cases=len(cases),divide_by_zero_cases=zero_cases,division_needed=args.division_needed,operation=args.operation,original_instruction_bytes=helper_size,candidate_section_bytes=len(code),result_and_preserved_registers_match=True,flag_difference_cases=flagdiffs,caller_register_difference_cases=callerdiffs,bytes_exact=helper_exact,production_integrated=False,scope=('Full helper at original address: exact bytes, quotient, all r0-r14, CPSR and stack writes; actual __div0, Thumb caller only. Research, not integrated.' if args.assembled_helper else 'Checks arithmetic result against original ROM and Python integer arithmetic, actual returning __div0 hook, callee-saved registers and restored SP. Caller registers/flags are observed and may differ; stack write differences and matching halfword spans are measured; exact layout is not matched. No production replacement.')),indent=2))
