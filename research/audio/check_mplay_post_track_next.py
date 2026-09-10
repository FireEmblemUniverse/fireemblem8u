#!/usr/bin/env python3
"""Verify an independent model of the original post-track advance block."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cfda6;EXIT=0x080cfdb0;LOOP=0x080cfd0c;DATA=0x02000000;SP=DATA+0x1000

def signed(x):return x if x<0x80000000 else x-0x100000000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-post-track-next';out.mkdir(parents=True,exist_ok=True);obj=out/'candidate.o';binary=out/'candidate.bin';elf=out/'candidate.elf'
 command=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainExit','-fplugin-arg-tail_transfer-destination=MPlayMainPostTrackGuard','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainExit','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_fork_decrement.so'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_positive_advance.so'),'-fplugin-arg-thumb_positive_advance-destination=MPlayMainPostTrackGuard']
 subprocess.run(command+[str(ROOT/'research/audio/mplay_post_track_next.c'),'-o',str(obj)]+options,check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainExit = '+hex(EXIT)+'; MPlayMainPostTrackGuard = '+hex(LOOP)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes()
 source=(ROOT/'research/audio/mplay_post_track_next.c').read_text();probe=out/'guard.c';probe_obj=out/'guard.o'
 def guard(text,flags=options):
  probe.write_text(text);result=subprocess.run(command+[str(probe),'-o',str(probe_obj)]+flags,capture_output=True,text=True)
  return result,probe_obj.read_bytes() if not result.returncode else None
 invalid=[source.replace('nextSize = 80','nextSize = 0'),source.replace('nextSize = 80','nextSize = 256'),source.replace('nextTrack += nextSize','nextTrack -= nextSize',1),source.replace('matching_tail_transfer, ',''),source.replace('        asm("" : "+r"(nextSize));','        asm("nop");'),source.replace('nextTrack > (s32)','nextTrack < (s32)')]
 for text in invalid:
  result,_=guard(text);assert result.returncode,(text,result.stderr)
 plain=source.replace(', matching_thumb_positive_advance','');result,baseline=guard(plain,[x for x in options if 'thumb_positive_advance' not in x]);assert not result.returncode,result.stderr
 result,loaded=guard(plain);assert not result.returncode and loaded==baseline,result.stderr
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert code==rom[ENTRY-0x08000000:EXIT-0x08000000],code.hex()
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,code);uc.mem_map(DATA,0x4000);memory=bytes([0xa5])*0x4000;uc.mem_write(DATA,memory);accesses=[]
 def access(u,kind,address,size,value,user):accesses.append((kind,address,size,value))
 def stop(u,address,size,user):
  if address in (EXIT,LOOP):u.emu_stop()
 uc.hook_add(UC_HOOK_CODE,stop);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access)
 rng=random.Random(0xfe8ad70);counts=list(range(256))+[0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(64)]
 tracks=[0,1,0x7fffffaf,0x7fffffb0,0x7fffffff,0x80000000,0xffffffaf,0xffffffb0,0xffffffb1,0xffffffff];outcomes=dict(count_exit=0,pointer_exit=0,loop=0)
 for count,track,nz in itertools.product(counts,tracks,range(16)):
  regs=[rng.getrandbits(32) for _ in range(13)];regs[2]=count;regs[5]=track;expected=regs.copy();dec=(count-1)&0xffffffff;expected[2]=dec
  flags=((dec>>31)<<3)|((dec==0)<<2)|((count>=1)<<1)|(count==0x80000000)
  target=EXIT;outcome='count_exit'
  if signed(count)>1:
   total=track+80;result=total&0xffffffff;expected[0]=80;expected[5]=result
   overflow=bool((~(track^80)&(track^result))&0x80000000)
   flags=((result>>31)<<3)|((result==0)<<2)|((total>>32)<<1)|overflow
   take=signed(track)+80>0
   assert take==(signed(track)>-80)
   assert take==((flags&4)==0 and bool(flags&8)==bool(flags&1))
   target=LOOP if take else EXIT;outcome='loop' if take else 'pointer_exit'
  uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
  for k,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(k)),v)
  uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);accesses.clear();uc.emu_start(ENTRY|1,0,count=8)
  assert uc.reg_read(r.UC_ARM_REG_PC)==target
  assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(k))) for k in range(13)]==expected
  assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
  assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
  assert not accesses and bytes(uc.mem_read(DATA,0x4000))==memory
  outcomes[outcome]+=1
 report=dict(rejected_source_forms=len(invalid),unannotated_unchanged=True,cases=sum(outcomes.values()),outcomes=outcomes,original_instruction_bytes=10,candidate_matching=True,scope='Matching C candidate against independent original-verified model: all byte counts, full-width boundaries/random counts, ten pointer boundary values, every NZCV; full registers/CPSR/SP/LR and no memory accesses. Signed pre-overflow pointer sum tested across both wrap boundaries.',limitations='Does not execute complete traversal or full MPlayMain.')
 out=ROOT/'.deps/soundmain-packed/mplay-post-track-next';out.mkdir(parents=True,exist_ok=True);(out/'candidate-model.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
