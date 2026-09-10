#!/usr/bin/env python3
"""Verify the lock gate, ordered private frame saves and ARM/Thumb rejection returns."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf4c8;END=ENTRY+32;DATA=0x02000000;SP=DATA+0x1000;PTR=0x03007ff0;ID=0x68736d53;RETURN=0x080f0000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/entry-frame';out.mkdir(exist_ok=True)
 source=(ROOT/'research/audio/soundmain_entry_frame.c').read_text().replace('void SoundMainEntryFrameCandidate','__attribute__((matching_thumb_entry_frame))\nvoid SoundMainEntryFrameCandidate')
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_entry_frame.so'),'-fplugin-arg-thumb_entry_frame-pointer=0x03007ff0,lt_SOUND_INFO_PTR','-fplugin-arg-thumb_entry_frame-id=0x68736d53,lt_ID_NUMBER']
 def compile(name,text=source,extra=options):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(text)
  result=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]+extra+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('matching');assert not result.returncode,result.stderr
 elf=out/'candidate.elf';binary=out/'candidate.bin';subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(ENTRY),'--entry=SoundMainEntryFrameCandidate','--defsym=lt_SOUND_INFO_PTR=0x080cf534','--defsym=lt_ID_NUMBER=0x080cf538',str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==32 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes()
  assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
  assert code==production[ENTRY-0x08000000:END-0x08000000]
  code=production[ENTRY-0x08000000:END-0x08000000]

 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000);uc.mem_map(0x03000000,0x8000)
  if candidate:uc.mem_write(ENTRY,code)
  state={}
  def access(u,kind,address,size,value,state):state['accesses'].append((kind,address,size,value if kind==17 else None))
  def instruction(u,address,size,state):state['sp'].append((address,u.reg_read(r.UC_ARM_REG_SP)))
  for base,size in ((DATA,0x4000),(0x03000000,0x8000)):uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,state,base,base+size-1)
  uc.hook_add(UC_HOOK_CODE,instruction,state,ENTRY,END-1);machines.append((uc,state))
 rng=random.Random(0xf4a6e);cases=0;valid_count=0
 ids=sorted({ID,ID-1,ID+1,0,0xffffffff,0x80000000,0x7fffffff}|{ID^(1<<n) for n in range(32)})
 for ident,info,seed,initial,thumb in itertools.product(ids,(DATA+0x400,SP-4,SP-20,SP-40,SP-64,SP,PTR,PTR+4),range(8),range(16),(False,True)):
  ram={DATA:bytearray([0xa5])*0x4000,0x03000000:bytearray([0x5a])*0x8000}
  def put(ram,address,value):
   base=DATA if address<0x03000000 else 0x03000000;ram[base][address-base:address-base+4]=value.to_bytes(4,'little')
  put(ram,info,ident);put(ram,PTR,info)
  actual=info if info==PTR else ident;valid=actual==ID;target=END if valid else RETURN
  regs=[rng.getrandbits(32) for _ in range(13)];lr=RETURN|thumb;expected=regs.copy();expected[0]=info;expected[2]=ID;expected[3]=actual
  wanted={base:memory.copy() for base,memory in ram.items()};accesses=[(16,PTR,4,None),(16,info,4,None)]
  if valid:
   writes=[(info,ID+1)]+[(SP-20+n*4,v) for n,v in enumerate(regs[4:8]+[lr])]+[(SP-40+n*4,v) for n,v in enumerate([info]+regs[8:12])]
   for address,value in writes:put(wanted,address,value);accesses.append((17,address,4,value))
   expected[1:5]=regs[8:12];flags=0;stack=SP-64
   pcs=[ENTRY+i for i in (0,2,4,6,8,10,14,16,18,20,22,24,26,28,30)]
   stack_trace=[(pc,SP if pc<ENTRY+20 else SP-20 if pc<ENTRY+30 else SP-40) for pc in pcs]
  else:
   value=(ID-actual)&0xffffffff;flags=(value>>31)<<3|((value==0)<<2)|((ID>=actual)<<1)|((((ID^actual)&(ID^value))>>31)&1);stack=SP
   stack_trace=[(ENTRY+i,SP) for i in (0,2,4,6,8,10,12)]
  for uc,state in machines:
   for base,memory in ram.items():uc.mem_write(base,bytes(memory))
   state.clear();state.update(accesses=[],sp=[])
   for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28);uc.emu_start(ENTRY|1,target,count=20)
   assert uc.reg_read(r.UC_ARM_REG_PC)==target and bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32)==(True if valid else thumb)
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_SP)==stack and uc.reg_read(r.UC_ARM_REG_LR)==lr and uc.reg_read(r.UC_ARM_REG_CPSR)>>28==flags
   assert state['accesses']==accesses and state['sp']==stack_trace,(valid,state['sp'],stack_trace)
   for base,memory in wanted.items():assert bytes(uc.mem_read(base,len(memory)))==memory
  cases+=1;valid_count+=valid
 negatives={
  'wrong_pointer':(source.replace('0x03007ff0','0x03007ff4'),options),
  'wrong_id':(source.replace('entryR2 = ID_NUMBER','entryR2 = ID_NUMBER + 1'),options),
  'wrong_guard':(source.replace('entryR2 != entryR3','entryR2 == entryR3'),options),
  'wrong_lock_increment':(source.replace('entryR3++;','entryR3 += 2;'),options),
  'wrong_bank':(source.replace('= entryR5;','= entryR6;'),options),
  'wrong_lr':(source.replace('= entryLR;','= entryR0;'),options),
  'wrong_high_copy':(source.replace('entryR1 = entryR8','entryR1 = entryR9'),options),
  'wrong_stack':(source.replace('entrySP -= 20','entrySP -= 16'),options),
  'wrong_scratch':(source.replace('entrySP -= 24','entrySP -= 20'),options),
  'nonempty_tie':(source.replace('asm(""','asm("nop"'),options),
  'missing_tie':(source.replace('    asm("" : "+r"(entryR0));\n',''),options),
  'missing_lr_binding':(source.replace('asm("lr")','asm("r12")'),options),
  'arm':(source,options+['-marm']),
  'debug':(source,options+['-g']),
  'missing_id_option':(source,options[:-1]),
  'bad_symbol':(source,[o.replace('lt_ID_NUMBER','invalid-symbol') for o in options]),
 }
 for name,(text,extra) in negatives.items():
  result,_=compile(name,text,extra);assert result.returncode,(name,result.stderr)
 plain=source.replace('__attribute__((matching_thumb_entry_frame))','');result,obj=compile('plain',plain,[]);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and original==obj.read_bytes(),result.stderr
 report=dict(cases=cases,valid_entries=valid_count,section_bytes=32,byte_exact=True,production_integrated=a.production,invalid_contracts_rejected=len(negatives),scope='Lock boundary/bit changes, eight info aliases, all NZCV, ARM/Thumb early returns, random register values; exact r0-r12/SP/LR, ordered memory accesses, complete RAM and instruction-by-instruction SP.',limitations='Valid entry requires adjacent deadline setup; shared literal placement and saved-register ABI must hold; no cycle-timing claim.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
