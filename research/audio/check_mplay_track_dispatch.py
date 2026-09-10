#!/usr/bin/env python3
"""Verify the track activity/channel dispatch fragment against original and model."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cfbc0;END=0x080cfbd6;INIT=0x080cfbfe;ADVANCE=0x080cfcdc;DATA=0x02000000;SP=DATA+0x1000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/track-dispatch';out.mkdir(parents=True,exist_ok=True);source=(ROOT/'research/audio/mplay_track_dispatch.c').read_text()
 flags=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so')]+['-fplugin-arg-tail_transfer-destination='+x for x in ('MPlayMainTrackAdvance','MPlayMainTrackInit','MPlayMainChannelGate')]+['-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainChannelGate','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),'-fplugin-arg-thumb_direct_tails-destination=MPlayMainTrackInit','-fplugin-arg-thumb_direct_tails-expected-transfers=1','-fplugin-arg-thumb_direct_tails-descending-local-mask-operands']
 def compile(label,text=source,options=flags):
  path=out/(label+'.c');obj=out/(label+'.o');path.write_text(text)
  result=subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(path),'-o',str(obj)]+options,capture_output=True,text=True)
  return result,obj
 result,obj=compile('candidate');assert not result.returncode,result.stderr
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainTrackAdvance = '+hex(ADVANCE)+'; MPlayMainTrackInit = '+hex(INIT)+'; MPlayMainChannelGate = '+hex(END)+'; }')
 elf=out/'candidate.elf';binary=out/'candidate.bin';subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';code=binary.read_bytes();assert len(code)==22 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 invalid=[('xor',source.replace('dispatchBit & dispatchStatus','dispatchBit ^ dispatchStatus'),flags),('no_mask',source.replace('dispatchBit & dispatchStatus','dispatchStatus'),flags),('missing_private',source.replace('matching_tail_transfer, ',''),flags),('wrong_target',source,[x.replace('thumb_direct_tails-destination=MPlayMainTrackInit','thumb_direct_tails-destination=Other') for x in flags]),('duplicate_local',source,flags+[flags[-1]]),('valued_local',source,flags[:-1]+[flags[-1]+'=1']),('mixed_orders',source,flags+['-fplugin-arg-thumb_direct_tails-descending-mask-operands']),('mixed_unsigned',source,flags+['-fplugin-arg-thumb_direct_tails-unsigned-immediate=le']),('wrong_count',source,[x.replace('expected-transfers=1','expected-transfers=2') for x in flags])]
 for label,text,options in invalid:
  result,_=compile('reject_'+label,text,options);assert result.returncode,(label,result.stderr)
 plain=source.replace(', matching_thumb_direct_tails','');result,obj=compile('plain',plain,[x for x in flags if 'thumb_direct_tails' not in x]);assert not result.returncode,result.stderr;before=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and obj.read_bytes()==before,result.stderr
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  def stop(u,address,size,user):
   if address in (END,INIT,ADVANCE):u.emu_stop()
  uc.hook_add(UC_HOOK_CODE,stop);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
 rng=random.Random(0xfe8d15);cases=0;outcomes=dict(inactive=0,init=0,channel=0)
 for status,track,channel,mask,nz in itertools.product(range(256),(DATA+0x100,SP-32,SP,DATA+0x4000-36),(0,1,0x80000000,0xffffffff),(0,1,0x80000000,0xffffffff),range(16)):
  memory=bytearray([0xa5])*0x4000;memory[track-DATA]=status;memory[track+32-DATA:track+36-DATA]=channel.to_bytes(4,'little')
  regs=[rng.getrandbits(32) for _ in range(13)];regs[3]=mask;regs[5]=track;expected=regs.copy();expected[0]=status;expected[1]=128;reads=[(16,track,1,None)]
  if status&128:
   expected[10]=mask;expected[11]=regs[4]|mask;expected[4]=channel;reads.append((16,track+32,4,None));flags=(channel>>31)<<3|((channel==0)<<2)|2;dest=END if channel else INIT;outcome='channel' if channel else 'init'
  else:flags=4|(nz&3);dest=ADVANCE;outcome='inactive'
  for uc,trace in machines:
   uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
   for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
   uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(ENTRY|1,0,count=14)
   assert uc.reg_read(r.UC_ARM_REG_PC)==dest
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
   assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
   assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==reads
  cases+=1;outcomes[outcome]+=1
 report=dict(cases=cases,outcomes=outcomes,matching_instruction_bytes=22,rejected_contracts=len(invalid),unannotated_unchanged=True,production_integrated=a.production,scope='Original and candidate against independent register/read/flag model; all status bytes/NZCV, four track locations including stack aliases and RAM boundary, channel/mask boundaries, preserved high registers, complete RAM and ordered conditional reads.',limitations='Stops before continuation bodies; no complete MPlayMain execution.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
