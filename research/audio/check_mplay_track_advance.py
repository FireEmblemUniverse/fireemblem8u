#!/usr/bin/env python3
"""Verify saved track state, signed countdown and track advancement entries."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,ADVANCE,END,LOOP=0x080cfcd8,0x080cfcdc,0x080cfce8,0x080cfbc0;DATA,SP=0x02000000,0x02001000;MASK=0xffffffff

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-track-advance';out.mkdir(parents=True,exist_ok=True)
 command=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
 tail=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64']
 for name,options in [('finish',tail+['-fplugin-arg-tail_transfer-destination=MPlayMainTrackAdvance','-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainTrackAdvance']),('advance',tail+['-fplugin-arg-tail_transfer-destination=MPlayMainTrackLoop','-fplugin-arg-tail_transfer-destination=MPlayMainClockUpdate','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainClockUpdate','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_fork_decrement.so')])]:
  subprocess.run(command+[str(ROOT/('research/audio/mplay_track_'+name+'.c')),'-o',str(out/(name+'.o'))]+options,check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { '+str(out/'finish.o')+'(.text) '+str(out/'advance.o')+'(.text) } MPlayMainTrackAdvance = '+hex(ADVANCE)+'; MPlayMainClockUpdate = '+hex(END)+'; MPlayMainTrackLoop = '+hex(LOOP)+'; }')
 elf=out/'candidate.elf';binary=out/'candidate.bin';subprocess.run(['arm-none-eabi-ld','-T',str(script),str(out/'finish.o'),str(out/'advance.o'),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==16 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  state=dict(trace=[],finish_only=False)
  def access(u,kind,address,size,value,state):state['trace'].append((kind,address,size,value))
  def stop(u,address,size,state):
   if address in (LOOP,END) or (state['finish_only'] and address==ADVANCE):u.emu_stop()
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,state);uc.hook_add(UC_HOOK_CODE,stop,state);machines.append((uc,state))
 rng=random.Random(0xfe8ad0);counts=dict(finish_only=0,loop=0,clock=0)
 values=list(range(256))+[256,65535,0x7fffffff,0x80000000,0x80000001,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(64)]
 memory=bytes([0xa5])*0x4000
 for count in values:
  for track in (0,0xffffffb0,0xffffffb1,0x7fffffb0):
   for mask in (0,1,0x80000000,0xffffffff):
    for initial in range(16):
     for mode in ('finish_only','finish_advance','advance_only'):
      regs=[rng.getrandbits(32) for _ in range(13)];regs[5]=track;regs[6]=count;regs[10]=mask
      if mode=='advance_only':regs[3]=mask
      expected=regs.copy()
      if mode!='advance_only':expected[3]=regs[10];expected[4]=regs[11]
      if mode=='finish_only':target=ADVANCE;flags=initial;outcome='finish_only'
      else:
       result=(count-1)&MASK;expected[6]=result
       if 1<count<0x80000000:
        expected[0]=80;expected[5]=(track+80)&MASK;expected[3]=(mask<<1)&MASK
        overflow=int(bool((~(track^80)&(track^expected[5]))&0x80000000));flags=(expected[3]>>31)<<3|((expected[3]==0)<<2)|((mask>>31)<<1)|overflow;target=LOOP;outcome='loop'
       else:
        flags=(result>>31)<<3|((result==0)<<2)|((count>=1)<<1)|int(count==0x80000000);target=END;outcome='clock'
      for uc,state in machines:
       uc.mem_write(DATA,memory);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
       for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
       uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);state['trace'].clear();state['finish_only']=mode=='finish_only';uc.emu_start((ADVANCE if mode=='advance_only' else ENTRY)|1,0,count=12)
       assert uc.reg_read(r.UC_ARM_REG_PC)==target
       assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected,(count,track,mask,mode)
       assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,(count,track,mask,mode,flags,uc.reg_read(r.UC_ARM_REG_CPSR))
       assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
       assert bytes(uc.mem_read(DATA,0x4000))==memory and not state['trace']
      counts[outcome]+=1
 report=dict(cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=16,production_integrated=a.production,candidate_sha256=hashlib.sha256(code).hexdigest(),source_sha256={n:hashlib.sha256((ROOT/('research/audio/mplay_track_'+n+'.c')).read_bytes()).hexdigest() for n in ('finish','advance')},scope='All count bytes, signed/full-width boundary and random counts, pointer and shift overflows, every NZCV; restore-only, combined and shared advance entry; all registers/flags, unchanged RAM and no memory accesses.',limitations='Stops at next track or clock update; complete track iteration and MPlayMain remain outside this fragment.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
