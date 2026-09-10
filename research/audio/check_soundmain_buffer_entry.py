#!/usr/bin/env python3
"""Verify post-callback buffer state and optionally execute its private transfer into mixer RAM."""
import argparse,hashlib,json,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];ENTRY=0x080cf510;END=0x080cf530;DATA=0x02000000;SP=DATA+0x1000;MASK=0xffffffff

def flags(a,b,subtract):
 value=(a-b if subtract else a+b)&MASK;carry=a>=b if subtract else a+b>MASK
 overflow=((a^b)&(a^value)) if subtract else (~(a^b)&(a^value))
 return (value>>31)<<3|((value==0)<<2)|(carry<<1)|((overflow>>31)&1)
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--literals',action='store_true');p.add_argument('--transfer',action='store_true');a=p.parse_args()
 if a.transfer and not a.literals:p.error('--transfer requires --literals')
 out=ROOT/'.deps/soundmain-packed/buffer-entry';out.mkdir(exist_ok=True);obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
 source=ROOT/'research/audio/soundmain_buffer_entry.c';extra=[]
 if a.literals:
  replacement=out/'literals.c';replacement.write_text(source.read_text().replace('void SoundMainBufferEntryCandidate', '__attribute__((matching_thumb_literal_constants))\nvoid SoundMainBufferEntryCandidate'));source=replacement
  extra=['-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_literal_constants.so'),'-fplugin-arg-thumb_literal_constants-value=848','-fplugin-arg-thumb_literal_constants-value=1584']
 if a.transfer:
  replacement=out/'transfer.c';replacement.write_text(source.read_text().replace('matching_thumb_literal_constants)', 'matching_thumb_literal_constants, matching_tail_transfer)').replace('    bufferValue = (u32)SoundMainRAM_Buffer + 1;', '    bufferValue = (u32)SoundMainRAM_Buffer + 1;\n    asm("" : "+r"(bufferValue));\n    ((void (*)(void))bufferValue)();'));source=replacement
  extra+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-indirect-register=3']
 subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(source),'-o',str(obj)]+extra,check=True)
 subprocess.run(['arm-none-eabi-ld','-Ttext=0x08001000','--entry=SoundMainBufferEntryCandidate','--defsym=SoundMainRAM_Buffer=0x03002c60',str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();assert len(code)==(48 if a.literals else 44) and code[(34 if a.literals else 38):(36 if a.literals else 40)]==bytes.fromhex('1847' if a.transfer else '7047')
 rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f';machines=[]
 for candidate in (False,True):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(DATA,0x4000);uc.mem_map(0x03000000,0x8000)
  if candidate:uc.mem_write(0x08001000,code)
  trace=[]
  def access(u,kind,address,size,value,log):log.append((kind,address,size,value if kind==17 else None))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,DATA,DATA+0x3fff);machines.append((uc,trace,candidate))
 rng=random.Random(0xb0ffe2);cases=0;flag_differences=0
 for counter in range(256):
  for period in (0,1,255):
   for samples in (0,1,0x7fffffff,MASK):
    for info in (DATA+0x400,SP-8):
     for initial_flags in range(16):
      memory=bytearray([0xa5])*0x4000
      for address,value in ((SP+24,info),(info+16,samples)):memory[address-DATA:address-DATA+4]=value.to_bytes(4,'little')
      memory[info+4-DATA]=counter;memory[info+11-DATA]=period
      regs=[rng.getrandbits(32) for _ in range(13)];wanted=regs.copy();wanted[0]=info;wanted[3]=0x03002c61;wanted[4]=counter;wanted[6]=1584;wanted[7]=(counter-1)&MASK;wanted[8]=samples;address=info+848
      expected_trace=[(16,SP+24,4,None),(16,info+16,4,None),(16,info+4,1,None)]
      final_flags=flags(counter,1,True)
      if counter>1:
       wanted[1]=(period-wanted[7])&MASK;wanted[2]=(samples*wanted[1])&MASK;final_flags=flags(address,wanted[2],False);address=(address+wanted[2])&MASK;expected_trace.append((16,info+11,1,None))
      wanted[5]=address;expected=memory.copy();expected[SP+8-DATA:SP+12-DATA]=address.to_bytes(4,'little');expected_trace.append((17,SP+8,4,address))
      for uc,trace,candidate in machines:
       uc.mem_write(DATA,bytes(memory));trace.clear()
       for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
       uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial_flags<<28)
       start=0x08001000 if candidate else ENTRY;end=start+(34 if a.literals else 38) if candidate else END;end=0x03002c60 if a.transfer else end;uc.emu_start(start|1,end,count=30)
       assert uc.reg_read(r.UC_ARM_REG_PC)==end
       assert uc.reg_read(r.UC_ARM_REG_CPSR)&0x20
       assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==wanted,(counter,period,samples,candidate)
       assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
       assert uc.reg_read(r.UC_ARM_REG_CPSR)>>28==(final_flags&1 if candidate and not a.literals else final_flags)
       assert bytes(uc.mem_read(DATA,0x4000))==expected and trace==expected_trace
      cases+=1;flag_differences+=not a.literals and final_flags!=(final_flags&1)
 report=dict(cases=cases,register_or_memory_mismatch_cases=0,final_flag_mismatch_cases=flag_differences,candidate_section_bytes=len(code),candidate_instruction_bytes_before_return=34 if a.literals else 38,original_instruction_bytes_before_transfer=32,production_integrated=False,final_transfer_verified=a.transfer,scope='All DMA counter bytes, three periods, four full-width sample counts, two aliases and every initial NZCV; exact registers, stack, memory and ordered accesses; with --transfer, execution reaches the copied mixer entry in Thumb mode.',limitations=[('' if a.literals else 'Candidate width synthesis clears N/Z/C; this mismatch is not accepted for integration. ')+('' if a.transfer else 'Candidate still returns via LR instead of transferring via r3. ')+'Branch encoding, ADD operand order and shared pool placement are not matched.'])
 (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
