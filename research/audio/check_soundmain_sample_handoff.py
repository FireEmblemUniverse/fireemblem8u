#!/usr/bin/env python3
"""Verify state before sample handoff; candidate relocation and final BX remain open."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf6d8;TARGET=ENTRY+12;DATA=0x02000000;SP=DATA+0x1000

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/sample-handoff';out.mkdir(exist_ok=True);obj=out/'candidate.o'
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/soundmain_sample_handoff.c'),'-o',str(obj)],check=True)
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';original=rom[ENTRY-0x08000000:TARGET-0x08000000]
 machines=[];sizes=[]
 for copied in (False,True):
  delta=0x03002c60-0x080cf54c if copied else 0;target=TARGET+delta;base=0x03002000 if copied else 0x08001000
  elf=out/('ram.elf' if copied else 'rom.elf');binary=elf.with_suffix('.bin')
  subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(base),'--entry=SoundMainRAM_SampleHandoffCandidate','--defsym=SoundMainRAM_SampleEntry='+hex(target),str(obj),'-o',str(elf)],check=True)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==16 and code[:6]==original[:6] and code[8:10]==bytes.fromhex('7047');sizes.append(len(code))
  for candidate in (False,True):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_map(0x03000000,0x8000);uc.mem_map(DATA,0x4000)
   start=base if candidate else ENTRY+delta;uc.mem_write(start,code if candidate else original);trace=[]
   def access(u,kind,address,size,value,log):log.append((kind,address,size,value if kind==17 else None))
   uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,start,target,trace))
 rng=random.Random(0x4ad0ff);cases=0
 for _ in range(512):
  for channel in (DATA+0x400,SP-16,SP-32):
   for flags in range(16):
    memory=bytearray([0xa5])*0x4000
    for address in (SP+8,channel+24,channel+40):memory[address-DATA:address-DATA+4]=rng.getrandbits(32).to_bytes(4,'little')
    def word(address):return int.from_bytes(memory[address-DATA:address-DATA+4],'little')
    regs=[rng.getrandbits(32) for _ in range(13)];regs[4]=channel;wanted=regs.copy();wanted[5]=word(SP+8);wanted[2]=word(channel+24);wanted[3]=word(channel+40)
    for uc,start,target,trace in machines:
     uc.mem_write(DATA,bytes(memory));trace.clear();wanted[0]=target
     for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
     uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
     uc.emu_start(start|1,start+8,count=8)
     assert uc.reg_read(r.UC_ARM_REG_PC)==start+8
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==wanted
     assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
     assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
     assert bytes(uc.mem_read(DATA,0x4000))==memory and trace==[(16,SP+8,4,None),(16,channel+24,4,None),(16,channel+40,4,None)]
    cases+=1
 report=dict(cases=cases,machines_per_case=4,candidate_section_bytes=sizes,original_section_bytes=12,matching_load_bytes=6,production_integrated=False,scope='Pre-transfer registers, flags, full data memory and ordered frame/channel reads across three aliases and all NZCV; original ROM/copied RAM versus separately linked C candidates.',limitations=['Candidate uses an absolute pointer literal and is separately linked for each placement; it is not position-independent when copied unchanged. BX r0 is not yet generated. Word inputs are sampled and cycle timing is not modeled.'])
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
