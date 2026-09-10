#!/usr/bin/env python3
"""Verify the exact private post-tick channel type and volume-update decision."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,GATE,POST,END=0x080cfd3a,0x080cfd58,0x080cfd48,0x080cfd48
DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-post-volume-guard';out.mkdir(parents=True,exist_ok=True)
 source=ROOT/'research/audio/mplay_post_volume_guard.c';obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 options=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),
          '-fplugin-arg-tail_transfer-destination=MPlayMainPostPitchGuard','-fplugin-arg-tail_transfer-destination=MPlayMainPostVolumeInvoke',
          '-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches',
          '-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostVolumeInvoke',
          '-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_direct_tails.so'),
          '-fplugin-arg-thumb_direct_tails-destination=MPlayMainPostPitchGuard','-fplugin-arg-thumb_direct_tails-expected-transfers=1']
 command=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include')]
 subprocess.run(command+[str(source),'-o',str(obj)]+options,check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainPostPitchGuard = '+hex(GATE)+'; MPlayMainPostVolumeInvoke = '+hex(POST)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==14 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
  assert code==production[ENTRY-0x08000000:END-0x08000000]
 text=source.read_text();probe=out/'guard.c';probe_obj=out/'guard.o'
 def guard_compile(content,flags=options):
  probe.write_text(content)
  result=subprocess.run(command+[str(probe),'-o',str(probe_obj)]+flags,capture_output=True,text=True)
  return result,probe_obj.read_bytes() if not result.returncode else None
 invalid=[text.replace('volumeMask & volumeFlags', 'volumeMask > volumeFlags'),
          text.replace('MPlayMainPostPitchGuard();', 'MPlayMainPostPitchGuard(); volumeMask = 0;'),
          text.replace('matching_tail_transfer, ', '')]
 for bad in invalid:
  result,_=guard_compile(bad);assert result.returncode and 'tail' in result.stderr,result.stderr
 plain=text.replace(', matching_thumb_direct_tails', '')
 without_direct=[option for option in options if 'thumb_direct_tails' not in option]
 result,baseline=guard_compile(plain,without_direct);assert not result.returncode,result.stderr
 result,loaded=guard_compile(plain);assert not result.returncode and loaded==baseline,result.stderr
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  def stop(u,address,size,data):
   if address in (GATE,POST):u.emu_stop()
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);uc.hook_add(UC_HOOK_CODE,stop)
  machines.append((uc,trace))
 rng=random.Random(0xfe8c701)
 counts=dict(pitch=0,volume=0)
 aliases=[(DATA+0x400,DATA+0x800),(SP,DATA+0x800),(DATA+0x400,SP),(SP-1,SP)]
 inputs=((typ,flags,alias,(typ+flags+alias)%16) for typ in range(256) for flags in range(256) for alias in range(4))
 boundaries=((typ,flags,alias,initial) for typ in (0,1,7,8,255) for flags in (0,1,2,3,128,255) for alias in range(4) for initial in range(16))
 import itertools
 for typ,value,alias,initial in itertools.chain(inputs,boundaries):
    channel,track=aliases[alias]
    regs=[rng.getrandbits(32) for _ in range(13)];regs[4]=channel;regs[5]=track;expected=regs.copy()
    memory=bytearray([0xa5])*0x4000;memory[channel+1-DATA]=typ;memory[track-DATA]=value
    expected[0]=3;expected[3]=value;expected[6]=memory[channel+1-DATA]&7
    ready=bool(value&3);target=POST if ready else GATE;flags=((not ready)<<2)|(initial&3)
    for uc,trace in machines:
     uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
     for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
     uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear()
     uc.emu_start(ENTRY|1,0,count=12)
     assert uc.reg_read(r.UC_ARM_REG_PC)==target
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
     assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
     assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
     assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==[(16,channel+1,1,None),(16,track,1,None)]
    counts['volume' if ready else 'pitch']+=1
 report=dict(rejected_source_forms=len(invalid),unannotated_unchanged=True,cases=sum(counts.values()),outcomes=counts,matching_instruction_bytes=14,production_integrated=a.production,
             candidate_sha256=hashlib.sha256(code).hexdigest(),source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
             scope='All type/flag byte pairs over four aliases with cycling NZCV, plus 30 boundary pairs over four aliases and all 16 NZCV; exact r0-r12, SP/LR, flags, complete RAM and ordered reads. The shared-byte alias models its final stored value.',
             limitations='Stops before volume invocation or pitch guard; no ChnVolSetAsm or full MPlayMain execution.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
