#!/usr/bin/env python3
"""Verify the exact C Thumb/ARM multiply entry and complete multiplication state."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf4b8;ARM=ENTRY+4;RETURN=0x080f0000;DATA=0x02000000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/audio-interwork-match/exact';out.mkdir(parents=True,exist_ok=True)
 source=(ROOT/'research/audio/multiply_entry_exact.c').read_text()
 opts=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_pc_handoff.so'),'-fplugin-arg-thumb_pc_handoff-symbol=multiply_high_arm','-fplugin-arg-thumb_pc_handoff-site=0','-fplugin-arg-thumb_pc_handoff-offset=0','-fplugin-arg-thumb_pc_handoff-r2-entry']
 def compile(label,text=source,options=opts):
  path,asm,obj=[out/(label+ext) for ext in ('.c','.s','.o')];path.write_text(text)
  run=subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(asm)]+options,capture_output=True,text=True)
  (out/(label+'.log')).write_text(run.stdout+run.stderr)
  if not run.returncode:run=subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(asm),'-o',str(obj)],capture_output=True,text=True)
  return run,obj
 def extract(obj,label):
  binary=out/(label+'.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True);return binary.read_bytes()
 run,obj=compile('candidate');assert not run.returncode,run.stderr;code=extract(obj,'candidate')
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==rom[ENTRY-0x08000000:ARM-0x08000000],code.hex()
 if a.production:
  assert (ROOT/'src/m4a_multiply_entry.c').read_text()==source.replace('Candidate','Body')
  assert extract(ROOT/'src/m4a_multiply_entry.o','production')==code and (ROOT/'fireemblem8.gba').read_bytes()==rom
 invalid=[('debug',source,opts+['-g']),('unwind',source,opts+['-funwind-tables']),('argument',source.replace('Candidate(void)','Candidate(u32 arg)'),opts),('wrong_register',source.replace('asm("r2")','asm("r3")'),opts),('missing_mode',source,opts[:-1]),('duplicate_mode',source,opts+[opts[-1]]),('valued_mode',source,opts[:-1]+[opts[-1]+'=1']),('wrong_offset',source,[x.replace('offset=0','offset=4') for x in opts]),('wrong_site',source,[x.replace('site=0','site=2') for x in opts]),('wrong_symbol',source,[x.replace('symbol=multiply_high_arm','symbol=Other') for x in opts]),('extra_work',source.replace('    multiplyTarget =','    *(volatile u32 *)0x02000000 = multiplyTarget;\n    multiplyTarget ='),opts)]
 for label,text,options in invalid:
  run,_=compile('reject-'+label,text,options);assert run.returncode,label
 plain=source.replace('__attribute__((matching_thumb_pc_handoff))','');run,obj=compile('plain',plain,[]);assert not run.returncode,run.stderr;before=obj.read_bytes();run,obj=compile('plain',plain);assert not run.returncode and before==obj.read_bytes()
 machines=[]
 for base,candidate in itertools.product((ENTRY,0x03001000),(False,True)):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,len(rom));uc.mem_write(0x08000000,rom);uc.mem_map(0x03000000,0x8000);uc.mem_map(DATA,0x4000)
  uc.mem_write(base,(code if candidate else rom[ENTRY-0x08000000:ARM-0x08000000])+rom[ARM-0x08000000:ARM-0x08000000+12]);trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,base,trace))
 rng=random.Random(0x3232);bounds=(0,1,2,0xffff,0x10000,0x10001,0x7fffffff,0x80000000,0xfffffffe,0xffffffff,0x55555555,0xaaaaaaaa)
 pairs=list(itertools.product(bounds,bounds))+[(rng.getrandbits(32),rng.getrandbits(32)) for _ in range(128)];counts={'entry':0,'complete_multiply':0}
 for complete,(left,right),nz,thumb,sp in itertools.product((False,True),pairs,range(16),(False,True),(DATA,DATA+0x1000,DATA+0x2000,DATA+0x4000)):
  regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=left;regs[1]=right;memory=bytes([0xa5])*0x4000;lr=RETURN|thumb
  for uc,base,trace in machines:
   expected=regs.copy();expected[2]=base+4;target=base+4;mode=0x13
   if complete:
    product=left*right;expected[:4]=[product>>32,right,product&0xffffffff,product>>32];target=RETURN;mode=0x33 if thumb else 0x13
   uc.mem_write(DATA,memory);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
   for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,lr);trace.clear();uc.emu_start(base|1,target,count=8)
   assert uc.reg_read(r.UC_ARM_REG_PC)==target and uc.reg_read(r.UC_ARM_REG_CPSR)==mode|nz<<28
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==lr and bytes(uc.mem_read(DATA,0x4000))==memory and not trace
  counts['complete_multiply' if complete else 'entry']+=1
 report=dict(cases=sum(counts.values()),outcomes=counts,machines_per_case=4,instruction_bytes=4,rejected_contracts=len(invalid),unannotated_unchanged=True,production_integrated=a.production,scope='Original/C in ROM/copied RAM; entry-only and complete multiply, boundary/seeded 32-bit operands, every NZCV, both return modes, four SP values. Exact r0-r12/SP/LR/CPSR, unchanged data RAM and zero data accesses.',limitations='Sampled operands; no cycle timing or asynchronous observation model.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
