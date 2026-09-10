#!/usr/bin/env python3
"""Verify exact signed key adjustment and wrapped add/sign rule."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY,END=0x080cfd60,0x080cfd6c;DATA,SP=0x02000000,0x02001000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/mplay-post-key-adjust';out.mkdir(parents=True,exist_ok=True)
 obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 command=[a.compiler,'-c','-std=gnu89','-O1','-fno-if-conversion','-fno-if-conversion2','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/mplay_post_key_adjust.c'),'-o',str(obj),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainPostFrequencySelect','-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination=MPlayMainPostFrequencySelect','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_add_sign_branch.so')]
 subprocess.run(command,check=True)
 script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(ENTRY)+' : { *(.text) } MPlayMainPostFrequencySelect = '+hex(END)+'; }')
 subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==12 and code==rom[ENTRY-0x08000000:END-0x08000000],code.hex()
 if a.production:
  production=(ROOT/'fireemblem8.gba').read_bytes();assert hashlib.sha1(production).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';assert code==production[ENTRY-0x08000000:END-0x08000000]
 source=ROOT/'research/audio/mplay_post_key_adjust.c';text=source.read_text();probe=out/'guard.c';probe_obj=out/'guard.o'
 def compile_guard(content,flags=command):
  probe.write_text(content);cmd=[str(probe) if x==str(source) else str(probe_obj) if x==str(obj) else x for x in flags]
  result=subprocess.run(cmd,capture_output=True,text=True)
  return result,probe_obj.read_bytes() if not result.returncode else None
 invalid=[text.replace('matching_tail_transfer, ',''),text.replace('channelKey + keyOffset','channelKey - keyOffset'),text.replace('adjustedKey < 0','adjustedKey == 0'),text.replace('    if (adjustedKey < 0)','    asm("" : "+r"(adjustedKey));\n    if (adjustedKey < 0)')]
 for content in invalid:
  result,_=compile_guard(content);assert result.returncode and ('sign' in result.stderr or 'tail' in result.stderr),result.stderr
 plain=text.replace(', matching_thumb_add_sign_branch','');result,baseline=compile_guard(plain,[x for x in command if 'thumb_add_sign_branch.so' not in x]);assert not result.returncode,result.stderr
 result,loaded=compile_guard(plain);assert not result.returncode and loaded==baseline,result.stderr
 machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
  if candidate:uc.mem_write(ENTRY,code)
  trace=[]
  def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace))
 rng=random.Random(0xfe8ce7);counts=dict(load=0,arithmetic=0,clamped=0)
 aliases=[(DATA+0x400,DATA+0x800),(SP-8,DATA+0x800),(DATA+0x400,SP-8),(SP-8,SP-8)]
 import itertools
 bytecases=((False,key,shift,alias,(key+shift+alias)%16) for key in range(256) for shift in range(256) for alias in range(4))
 bounds=[0,1,127,128,255,0x7fffffff,0x80000000,0xffffffff]
 arithmetic=[(True,x,y,0,flags) for x,y,flags in itertools.product(bounds,bounds,range(16))]
 arithmetic += [(True,rng.getrandbits(32),rng.getrandbits(32),0,flags) for _ in range(256) for flags in range(16)]
 for raw,key,shift,alias,initial in itertools.chain(bytecases,arithmetic):
    channel,track=aliases[alias];regs=[rng.getrandbits(32) for _ in range(13)];regs[4]=channel;regs[5]=track
    memory=bytearray([0xa5])*0x4000
    if raw:
     regs[1]=key;regs[0]=shift;entry=ENTRY+6;accesses=[]
    else:
     memory[channel+8-DATA]=key;memory[track+8-DATA]=shift;key=memory[channel+8-DATA];shift=memory[track+8-DATA];shift=shift if shift<128 else shift-256;shift &= 0xffffffff
     entry=ENTRY;accesses=[(16,channel+8,1,None),(16,track+8,1,None)]
    total=key+shift;value=total&0xffffffff;negative=bool(value&0x80000000)
    carry=total>>32;overflow=int(bool((~(key^shift)&(key^value))&0x80000000))
    flags=((1 if negative else int(value==0))<<2)|(carry<<1)|overflow
    expected=regs.copy();expected[0]=shift;expected[1]=key;expected[2]=0 if negative else value
    for uc,trace in machines:
     uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
     for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
     uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,END,count=10)
     assert uc.reg_read(r.UC_ARM_REG_PC)==END
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
     assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,(raw,key,shift,initial,hex(uc.reg_read(r.UC_ARM_REG_CPSR)),flags)
     assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
     assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==accesses
    counts['arithmetic' if raw else 'load']+=1;counts['clamped']+=negative
 report=dict(rejected_source_forms=len(invalid),unannotated_unchanged=True,cases=counts['load']+counts['arithmetic'],outcomes=counts,matching_instruction_bytes=12,production_integrated=a.production,
             scope='All unsigned-key/signed-shift byte pairs across four storage aliases and cycling NZCV; arithmetic-only entry covers full-width boundary pairs and random values at all NZCV, including signed overflow; exact registers/flags/RAM and ordered reads.',
             limitations='Arithmetic-only cases enter after the byte loads; no frequency conversion or complete MPlayMain execution.')
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
