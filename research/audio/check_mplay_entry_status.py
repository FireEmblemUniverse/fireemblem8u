#!/usr/bin/env python3
"""Verify both MPlayMain entry status gates, including signed flags and saved player."""
import argparse,hashlib,itertools,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];DATA=0x02000000;SP=DATA+0x1000;EXIT=0x080cfdb0

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--production',action='store_true');a=p.parse_args()
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 if a.production:assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 reports={}
 for name,entry,end,cont,copy in [('entry_status',0x080cfb92,0x080cfb9c,'MPlayMainSoundInfoSetup',True),('fade_status',0x080cfba8,0x080cfbb0,'MPlayMainTempoAccumulate',False)]:
  out=ROOT/('.deps/soundmain-packed/mplay-entry/'+name);out.mkdir(parents=True,exist_ok=True);obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
  flags=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-destination=MPlayMainExit','-fplugin-arg-tail_transfer-destination='+cont,'-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-terminal-adjacent-destination='+cont]
  if copy:flags+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/copy_add_zero.so')]
  subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/('research/audio/mplay_'+name+'.c')),'-o',str(obj)]+flags,check=True)
  script=out/'candidate.ld';script.write_text('SECTIONS { .text '+hex(entry)+' : { *(.text) } '+cont+' = '+hex(end)+'; MPlayMainExit = '+hex(EXIT)+'; }')
  subprocess.run(['arm-none-eabi-ld','-T',str(script),str(obj),'-o',str(elf)],check=True);subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==end-entry and code==rom[entry-0x08000000:end-0x08000000],code.hex()
  machines=[]
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000)
   if candidate:uc.mem_write(entry,code)
   trace=[]
   def access(u,kind,address,size,value,trace):trace.append((kind,address,size,value if kind==17 else None))
   def stop(u,address,size,user):
    if address in (end,EXIT):u.emu_stop()
   uc.hook_add(UC_HOOK_CODE,stop);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace);machines.append((uc,trace))
  rng=random.Random(0xfe85a7);values=list(range(256))+[0x80000000+n for n in range(256)]+[0x7fffffff,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(128)];cases=0;exits=0
  for status,player,nz in itertools.product(values,(DATA+0x100,SP-4,SP,DATA+0x4000-8),range(16)):
   memory=bytearray([0xa5])*0x4000;memory[player+4-DATA:player+8-DATA]=status.to_bytes(4,'little');regs=[rng.getrandbits(32) for _ in range(13)];regs[0 if copy else 7]=player;expected=regs.copy();expected[0]=status
   if copy:expected[7]=player
   flags=(status>>31)<<3|((status==0)<<2)|2;dest=EXIT if status&0x80000000 else end
   for uc,trace in machines:
    uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
    for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
    uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);trace.clear();uc.emu_start(entry|1,0,count=6)
    assert uc.reg_read(r.UC_ARM_REG_PC)==dest
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==expected
    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
    assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
    assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==[(16,player+4,4,None)]
   cases+=1;exits+=dest==EXIT
  reports[name]=dict(cases=cases,exit_cases=exits,matching_instruction_bytes=end-entry,production_integrated=a.production)
 report=dict(fragments=reports,scope='Original and candidate against independent signed-status, register, CMP-flag and read model; both sign halves of byte patterns, full-width boundaries/random words, all NZCV, four aligned player locations including frame aliases and RAM boundary.',limitations='Stops at continuation/exit entry; does not execute callback, fade body, frame restore or complete MPlayMain.')
 (ROOT/'.deps/soundmain-packed/mplay-entry/status-report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
