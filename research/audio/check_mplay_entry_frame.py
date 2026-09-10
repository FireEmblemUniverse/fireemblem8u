#!/usr/bin/env python3
"""Verify exact POP/PUSH entry frame construction and reject unsupported compiler contracts."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cfb84;END=0x080cfb92;DATA=0x02000000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/entry-frame';out.mkdir(parents=True,exist_ok=True);source=(ROOT/'research/audio/mplay_entry_frame.c').read_text()
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_saved_entry_frame.so'),'-fplugin-arg-thumb_saved_entry_frame-continuation=MPlayMainEntryStatus']
 def compile(label,text=source,flags=options):
  path=out/(label+'.c');obj=out/(label+'.o');path.write_text(text)
  result=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+flags,capture_output=True,text=True)
  return result,obj
 result,obj=compile('candidate');assert not result.returncode,result.stderr
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainEntryStatus = '+hex(END)+'; }')
 elf=out/'candidate.elf';binary=out/'candidate.bin';subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';code=binary.read_bytes();assert len(code)==14 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 invalid=[('argument',source.replace('MPlayEntryFrameCandidate(void)','MPlayEntryFrameCandidate(u32 arg)'),options),('return_type',source.replace('void MPlayEntryFrameCandidate','u32 MPlayEntryFrameCandidate'),options),('wrong_load',source.replace('frameR0 = *(volatile u32 *)(frameSP + 0)','frameR0 = *(volatile u32 *)(frameSP + 4)'),options),('wrong_pop_delta',source.replace('frameSP += 4','frameSP += 8'),options),('wrong_push_delta',source.replace('frameSP -= 16','frameSP -= 20',1),options),('wrong_bank',source.replace('= frameR4;','= frameR5;',1),options),('wrong_high_copy',source.replace('frameR4 = frameR8','frameR4 = frameR9'),options),('swapped_stores',source.replace('*(volatile u32 *)(frameSP + 0) = frameR4;\n    *(volatile u32 *)(frameSP + 4) = frameR5;','*(volatile u32 *)(frameSP + 4) = frameR5;\n    *(volatile u32 *)(frameSP + 0) = frameR4;',1),options),('instruction_asm',source.replace('    frameR4 = frameR8;','    asm("nop");\n    frameR4 = frameR8;'),options),('debug',source,options+['-g']),('unwind',source,options+['-funwind-tables']),('wrong_continuation',source,options[:1]+['-fplugin-arg-thumb_saved_entry_frame-continuation=Other']),('duplicate_continuation',source,options+[options[1]]),('missing_continuation',source,options[:1]),('missing_global',source.replace('register volatile u32 frameR8 asm("r8");','volatile u32 frameR8;'),options)]
 for label,text,flags in invalid:
  result,_=compile('reject_'+label,text,flags);assert result.returncode,(label,result.stderr)
 plain=source.replace('__attribute__((matching_thumb_saved_entry_frame))','');result,obj=compile('plain',plain,[]);assert not result.returncode,result.stderr;before=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and obj.read_bytes()==before,result.stderr
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  state={}
  def access(u,kind,address,size,value,state):state['trace'].append((kind,address,size,value if kind==17 else None))
  def stack(u,address,size,state):
   expected=state['sp']+(0 if address==ENTRY else 4 if address==ENTRY+2 else -12)
   assert u.reg_read(r.UC_ARM_REG_SP)==expected,(hex(address),u.reg_read(r.UC_ARM_REG_SP),expected)
  uc.hook_add(UC_HOOK_CODE,stack,state,ENTRY,END-2);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,state);machines.append((uc,state))
 rng=random.Random(0xfe8f4a);values=list(range(256))+[0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(128)];cases=0
 for player,sp,nz in itertools.product(values,(DATA+28,DATA+0x1000,DATA+0x2000,DATA+0x4000-4),range(16)):
  memory=bytearray([0xa5])*0x4000;memory[sp-DATA:sp-DATA+4]=player.to_bytes(4,'little');wanted=memory.copy();regs=[rng.getrandbits(32) for _ in range(13)];expected=regs.copy();expected[0]=player;expected[4:8]=regs[8:12];trace=[(16,sp,4,None)]
  for base,first in ((sp-12,4),(sp-28,8)):
   for n in range(4):wanted[base+4*n-DATA:base+4*n-DATA+4]=regs[first+n].to_bytes(4,'little');trace.append((17,base+4*n,4,regs[first+n]))
  for uc,state in machines:
   uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
   for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
   uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);state.update(sp=sp,trace=[]);uc.emu_start(ENTRY|1,END,count=8)
   assert uc.reg_read(r.UC_ARM_REG_PC)==END
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|nz<<28
   assert uc.reg_read(r.UC_ARM_REG_SP)==sp-28 and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(DATA,0x4000))==wanted and state['trace']==trace
  cases+=1
 report=dict(cases=cases,matching_instruction_bytes=14,rejected_contracts=len(invalid),unannotated_unchanged=True,production_integrated=a.production,scope='Original and candidate against independent frame-memory/register expectations; saved-player byte/boundary/bit/random words, all NZCV, four stack boundaries/locations, exact SP at every instruction and ordered reads/writes. The first bank overwrites the popped player word only after it was read.',limitations='Stops at entry-status continuation; does not execute full MPlayMain.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
