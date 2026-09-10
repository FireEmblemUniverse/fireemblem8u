#!/usr/bin/env python3
"""Verify the note/wait command guards, including exact subtraction flags."""
import argparse, hashlib, itertools, json, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
DATA=0x02000000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 if a.production:assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 reports={}
 for name,entry,target,bound,mode,taken,fall in [
  ('note',0x080cfc3a,0x080cfc50,207,'lt','MPlayMainNonNoteCommand','MPlayMainNoteSetup'),
  ('wait',0x080cfc50,0x080cfc72,176,'le','MPlayMainWaitCommand','MPlayMainCommandSetup')]:
  out=ROOT/('.deps/soundmain-packed/command-guard/'+name);out.mkdir(parents=True,exist_ok=True)
  source=(ROOT/('research/audio/mplay_'+name+'_guard.c')).read_text()
  flags=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination='+taken,'-fplugin-arg-tail_transfer-destination='+fall,'-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination='+fall,'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),'-fplugin-arg-thumb_direct_tails-destination='+taken,'-fplugin-arg-thumb_direct_tails-expected-transfers=1','-fplugin-arg-thumb_direct_tails-unsigned-immediate='+mode]
  def compile(label,text=source,options=flags):
   path=out/(label+'.c');obj=out/(label+'.o');path.write_text(text)
   result=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+options,capture_output=True,text=True)
   return result,obj
  result,obj=compile('candidate');assert not result.returncode,result.stderr
  script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } '+taken+' = '+hex(target)+'; '+fall+' = '+hex(entry+4)+'; }')
  elf=out/'candidate.elf';binary=out/'candidate.bin';subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==4 and code==rom[entry-0x08000000:entry-0x08000000+4],code.hex()
  invalid=[('signed',source.replace('if (guardCommand','if ((s32)guardCommand'),flags),('missing_unsigned_mode',source,flags[:-1]),('large_bound',source.replace(str(bound),'65536'),flags),('missing_private',source.replace('matching_tail_transfer, ',''),flags),('instruction_barrier',source.replace('        '+taken+'();','        asm("nop");\n        '+taken+'();'),flags),('wrong_target',source,[x.replace('thumb_direct_tails-destination='+taken,'thumb_direct_tails-destination=Other') for x in flags]),('invalid_mode',source,flags[:-1]+['-fplugin-arg-thumb_direct_tails-unsigned-immediate=eq']),('duplicate_mode',source,flags+[flags[-1]]),('multiple_expected',source,[x.replace('expected-transfers=1','expected-transfers=2') for x in flags]),('mixed_mask_order',source,flags+['-fplugin-arg-thumb_direct_tails-descending-mask-operands'])]
  for label,text,options in invalid:
   result,_=compile('reject_'+label,text,options);assert result.returncode,(label,result.stderr)
  plain=source.replace(', matching_thumb_direct_tails','');result,obj=compile('plain',plain,[x for x in flags if 'thumb_direct_tails' not in x]);assert not result.returncode,result.stderr;before=obj.read_bytes()
  result,obj=compile('plain',plain);assert not result.returncode and obj.read_bytes()==before,result.stderr
  machines=[]
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
   if candidate:uc.mem_write(entry,code)
   trace=[]
   def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value))
   def stop(u,address,size,user):
    if address in (entry+4,target):u.emu_stop()
   uc.hook_add(UC_HOOK_CODE,stop);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
  rng=random.Random(0xfe8c0de);values=list(range(256))+[0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(128)]
  cases=0;outcomes=dict(taken=0,fallthrough=0)
  for command,nz,sp in itertools.product(values,range(16),(DATA+0x1000,DATA+0x1800,DATA+0x2000,DATA+0x2800)):
   regs=[rng.getrandbits(32) for _ in range(13)];regs[1]=command;memory=bytes([0xa5])*0x4000;result=(command-bound)&0xffffffff
   overflow=bool(((command^bound)&(command^result))&0x80000000)
   expected_flags=(result>>31)<<3|((result==0)<<2)|((command>=bound)<<1)|overflow
   take=command<bound if mode=='lt' else command<=bound;dest=target if take else entry+4
   for uc,trace in machines:
    uc.mem_write(DATA,memory);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
    for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
    uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,0,count=4)
    assert uc.reg_read(r.UC_ARM_REG_PC)==dest
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==regs
    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|expected_flags<<28
    assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
    assert bytes(uc.mem_read(DATA,0x4000))==memory and not trace
   cases+=1;outcomes['taken' if take else 'fallthrough']+=1
  reports[name]=dict(cases=cases,outcomes=outcomes,matching_instruction_bytes=4,rejected_contracts=len(invalid),unannotated_unchanged=True,production_integrated=a.production)
 report=dict(guards=reports,scope='Original and matching candidate execute each guard against an independent unsigned comparison and CMP flag model; byte values, full-width boundaries/bit/random values, all NZCV, four stacks, all registers and no memory accesses.',limitations='Does not execute continuation bodies or complete MPlayMain.')
 (ROOT/'.deps/soundmain-packed/command-guard/report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
