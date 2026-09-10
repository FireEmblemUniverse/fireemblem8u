#!/usr/bin/env python3
"""Verify matching track-start guard and defaults, excluding the intervening clear call."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];GUARD,CLEAR,DEFAULTS,END,WAIT=0x080cfbfe,0x080cfc06,0x080cfc0c,0x080cfc24,0x080cfc7c
DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-track-init';out.mkdir(parents=True,exist_ok=True)
 base=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainTrackWait','-fplugin-arg-tail_transfer-private-frame64']
 names={'guard':(GUARD,8),'defaults':(DEFAULTS,24)}
 for name in names:
  flags=['-fplugin-arg-tail_transfer-destination=MPlayMainTrackClear','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainTrackClear','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),'-fplugin-arg-thumb_direct_tails-destination=MPlayMainTrackWait','-fplugin-arg-thumb_direct_tails-expected-transfers=1'] if name=='guard' else []
  subprocess.run(base+flags+[str(ROOT/('research/audio/mplay_track_init_'+name+'.c')),'-o',str(out/(name+'.o'))],check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { '+''.join('.'+name+' '+hex(address)+' : { '+str(out/(name+'.o'))+'(.text) } ' for name,(address,_) in names.items())+'MPlayMainTrackClear = '+hex(CLEAR)+'; MPlayMainTrackWait = '+hex(WAIT)+'; }')
 elf=out/'candidate.elf';subprocess.run(['arm-none-eabi-ld','-T',str(script)]+[str(out/(name+'.o')) for name in names]+['-o',str(elf)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';codes={}
 production=(ROOT/'fireemblem8.gba').read_bytes() if a.production else None
 if production is not None:assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 for name,(address,size) in names.items():
  path=out/(name+'.bin');subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.'+name,str(elf),str(path)],check=True);code=path.read_bytes()
  assert len(code)==size and code==rom[address-0x08000000:address-0x08000000+size],(name,code.hex())
  if production is not None:assert code==production[address-0x08000000:address-0x08000000+size]
  codes[address]=code
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:
   for address,code in codes.items():uc.mem_write(address,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  def stop(u,address,size,data):
   if address in (CLEAR,WAIT):u.emu_stop()
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);uc.hook_add(UC_HOOK_CODE,stop);machines.append((uc,trace))
 rng=random.Random(0xfe81a17);counts=dict(guard=0,defaults=0);outcomes=dict(clear=0,wait=0)
 for name,(entry,size) in names.items():
  for pattern in range(256):
   for track in (DATA+0x400,SP-36,SP,DATA+0x3fdb):
    for initial in range(16):
     memory=bytearray([pattern])*0x4000;wanted=memory.copy();regs=[rng.getrandbits(32) for _ in range(13)];regs[5]=track;expected=regs.copy()
     if name=='guard':
      expected[0]=64;expected[3]=pattern;flags=((not (pattern&64))<<2)|(initial&3);target=CLEAR if pattern&64 else WAIT;trace_wanted=[(16,track,1,None)]
     else:
      expected[0]=1;expected[1]=track+6;flags=0;target=WAIT;trace_wanted=[]
      for offset,value in ((0,128),(15,2),(19,64),(25,22),(36,1)):
       wanted[track+offset-DATA]=value;trace_wanted.append((17,track+offset,1,value))
     for uc,trace in machines:
      uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
      for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
      uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,0,count=20)
      assert uc.reg_read(r.UC_ARM_REG_PC)==target
      assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
      assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,(name,pattern,initial)
      assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
      assert bytes(uc.mem_read(DATA,0x4000))==wanted and trace==trace_wanted
     counts[name]+=1;outcomes['clear' if target==CLEAR else 'wait']+=1
 report=dict(cases=counts,total_cases=sum(counts.values()),outcomes=outcomes,matching_instruction_bytes=32,production_integrated=a.production,
             scope='Every flags/memory-pattern byte and initial NZCV state, four track addresses including stack/last-byte aliases; all registers, SP/LR, flags, complete RAM and ordered reads/writes.',
             limitations='Guard and defaults are tested independently; the intervening Clear64byte call and full MPlayMain track execution are excluded.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
