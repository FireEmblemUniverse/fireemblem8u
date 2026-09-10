#!/usr/bin/env python3
"""Verify post-tick channel list edges and track flag/count cleanup."""
import argparse,hashlib,json,random,subprocess,itertools
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];DATA,SP=0x02000000,0x02001000;GATE,FINISH,NEXT=0x080cfd2a,0x080cfd9c,0x080cfda6

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-post-traversal';out.mkdir(parents=True,exist_ok=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 if a.production:assert hashlib.sha1((ROOT/'fireemblem8.gba').read_bytes()).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 rng=random.Random(0xfe8b057);counts={}
 for name,entry,end in [('channel_load',0x080cfd24,GATE),('channel_next',0x080cfd96,FINISH),('track_finish',FINISH,NEXT)]:
  obj=out/(name+'.o');elf=out/(name+'.elf');binary=out/(name+'.bin')
  options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64']
  if name=='track_finish':options+=['-fplugin-arg-tail_transfer-destination=MPlayMainPostTrackNext','-fplugin-arg-tail_transfer-adjacent-destination=MPlayMainPostTrackNext']
  else:
   adjacent='MPlayMainPostChannelGate' if name=='channel_load' else 'MPlayMainPostTrackFinish';direct='MPlayMainPostTrackFinish' if name=='channel_load' else 'MPlayMainPostChannelGate'
   options+=['-fplugin-arg-tail_transfer-destination=MPlayMainPostTrackFinish','-fplugin-arg-tail_transfer-destination=MPlayMainPostChannelGate','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination='+adjacent,'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),'-fplugin-arg-thumb_direct_tails-destination='+direct,'-fplugin-arg-thumb_direct_tails-expected-transfers=1']
  subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/('research/audio/mplay_post_'+name+'.c')),'-o',str(obj)]+options,check=True)
  script=out/(name+'.ld');script.write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } MPlayMainPostChannelGate = '+hex(GATE)+'; MPlayMainPostTrackFinish = '+hex(FINISH)+'; MPlayMainPostTrackNext = '+hex(NEXT)+'; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==end-entry and code==rom[entry-0x08000000:end-0x08000000],code.hex()
  if a.production:assert code==(ROOT/'fireemblem8.gba').read_bytes()[entry-0x08000000:end-0x08000000]
  machines=[]
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
   if candidate:uc.mem_write(entry,code)
   trace=[]
   def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
   def stop(u,address,size,data):
    if address in ((NEXT,) if name=='track_finish' else (GATE,FINISH)):u.emu_stop()
   uc.hook_add(UC_HOOK_CODE,stop);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
  if name=='track_finish':fixtures=itertools.product(range(256),(DATA+0x400,SP,SP-1,DATA+0x3fff),(0,1,0x80000000,0xffffffff),range(16))
  else:
   offset=32 if name=='channel_load' else 52
   values=[0,1,2,0x7fffffff,0x80000000,0xffffffff]+[1<<n for n in range(32)]+[rng.getrandbits(32) for _ in range(128)]
   fixtures=itertools.product(values,(DATA+0x400,SP-offset,SP-offset-4,DATA+0x3ffc-offset),(0,),range(16))
  cases=0
  for value,base,saved,initial in fixtures:
   regs=[rng.getrandbits(32) for _ in range(13)];memory=bytearray([0xa5])*0x4000
   if name=='track_finish':
    regs[5]=base;regs[9]=saved;memory[base-DATA]=value;expected=regs.copy();expected[0]=value&240;expected[1]=240;expected[2]=saved;changed=memory.copy();changed[base-DATA]=value&240
    flags=((not value&240)<<2)|(initial&3);target=NEXT;accesses=[(16,base,1,None),(17,base,1,value&240)]
   else:
    regs[5 if name=='channel_load' else 4]=base;expected=regs.copy();expected[4]=value;memory[base+offset-DATA:base+offset+4-DATA]=value.to_bytes(4,'little');changed=memory.copy()
    flags=(value>>31)<<3|((value==0)<<2)|2;target=GATE if value else FINISH;accesses=[(16,base+offset,4,None)]
   for uc,trace in machines:
    uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
    for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
    uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,0,count=10)
    assert uc.reg_read(r.UC_ARM_REG_PC)==target
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
    assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
    assert bytes(uc.mem_read(DATA,0x4000))==changed and trace==accesses
   cases+=1
  counts[name]=cases
 report=dict(cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=22,production_integrated=a.production,scope='Full-width pointer boundaries/bit patterns/random words, all flag bytes, full-width saved count, all NZCV and stack/final-byte aliases; all registers, flags, RAM and ordered accesses.',limitations='Stops at channel gate, track finish or next-track entry; full traversal and channel updates remain outside this checker.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
