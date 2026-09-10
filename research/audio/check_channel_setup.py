#!/usr/bin/env python3
"""Verify exact Thumb channel setup, ordered frame/info reads and all state."""
import argparse, hashlib, json, random, subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/channel-setup';out.mkdir(exist_ok=True)
 src=ROOT/'src/m4a_channel_setup.c';obj=out/'candidate.o';binary=out/'candidate.bin'
 args=[a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_fallthrough.so')]
 subprocess.run(args+[str(src),'-o',str(obj)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
 code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
 assert len(code)==10 and code==rom[0xcf5da:0xcf5e4],code.hex()
 assert (ROOT/'fireemblem8.gba').read_bytes()==rom
 symbols=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
 assert any(line.split()==['080cf5da','0000000a','T','SoundMainRAM_ChanSetup'] for line in symbols.splitlines())
 machines=[]
 for base in (0x08001000,0x03002000):
  uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(base,0x1000);uc.mem_write(base,code);uc.mem_map(0x02000000,0x4000);trace=[]
  def hook(u,kind,address,size,value,user):user.append((kind,address,size))
  uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,hook,trace);machines.append((uc,base,trace))
 rng=random.Random(0x5e7);cases=0
 for channels in range(256):
  for info in (0x02000100,0x02001000,0x02001018):
   for flags in range(16):
    memory=bytearray([0xa5])*0x4000;sp=0x02001000;freq=rng.getrandbits(32)
    def write(address,value,size):memory[address-0x02000000:address-0x02000000+size]=value.to_bytes(size,'little')
    write(info+24,freq,4);write(info+6,channels,1);write(sp+24,info,4)
    # Frame aliases may overwrite frequency; derive the expectation from final memory.
    freq=int.from_bytes(memory[info+24-0x02000000:info+28-0x02000000],'little')
    regs=[rng.getrandbits(32) for _ in range(13)];wanted=regs.copy();wanted[0]=channels;wanted[4]=info+80;wanted[12]=freq
    for uc,base,trace in machines:
     uc.mem_write(0x02000000,bytes(memory));trace.clear()
     for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
     uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
     uc.emu_start(base|1,base+10,count=5)
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==wanted
     assert uc.reg_read(r.UC_ARM_REG_PC)==base+10 and uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
     assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33
     assert bytes(uc.mem_read(0x02000000,0x4000))==memory
     assert trace==[(16,sp+24,4),(16,info+24,4),(16,info+6,1)]
    cases+=1
 # Compiler restrictions, using the actual C entry as the starting contract.
 text=src.read_text()
 tests=[('arm',text,('-marm',)),('debug',text,('-g',)),('unwind',text,('-funwind-tables',)),
 ('args',text.replace('ChanSetup(void)','ChanSetup(unsigned input)'),()),
 ('call',text.replace('setupInfo = (volatile struct SoundInfo *)setupFrame->soundInfo;','extern void outside(void); outside();'),()),
 ('stack_write',text.replace('setupValue = setupInfo->maxChans;','setupFrame->deadline=setupValue;'),()),
 ('frame_bound',text.replace('setupFrame->soundInfo','((volatile u32 *)setupFrame)[16]'),()),
 ('frame_byte',text.replace('setupFrame->soundInfo','((volatile u8 *)setupFrame)[24]'),()),
 ('assembly',text.replace('setupFrequency = setupValue;','asm volatile("nop"); setupFrequency = setupValue;'),()),
 ('lr',text.replace('asm("r12")','asm("lr")'),()),
 ('local',text.replace('setupFrequency = setupValue;','volatile u32 local=setupValue; setupFrequency=local;'),()),
 ('branch',text.replace('setupFrequency = setupValue;','if (setupValue) setupFrequency=setupValue;'),())]
 for name,text,extra in tests:
  path=out/(name+'.c');path.write_text(text);result=subprocess.run(args+list(extra)+[str(path),'-o',str(out/(name+'.o'))],capture_output=True,text=True)
  assert result.returncode and 'Thumb fallthrough' in result.stderr,(name,result.stderr)
 plain=out/'plain.c';plain.write_text(src.read_text().replace('__attribute__((matching_thumb_fallthrough))',''));plainobj=out/'plain.o'
 subprocess.run(args+[str(plain),'-o',str(plainobj)],check=True,capture_output=True);baseline=plainobj.read_bytes()
 subprocess.run([x for x in args if not x.startswith('-fplugin=')]+[str(plain),'-o',str(plainobj)],check=True,capture_output=True)
 assert baseline==plainobj.read_bytes()
 print(json.dumps(dict(cases=cases,machines_per_case=2,exact_bytes=10,rejected_contracts=len(tests),production_integrated=True,scope='All channel-byte values, random frequency/registers, three frame alias placements, all NZCV, ordered reads and complete mapped memory; valid EWRAM info pointers.'),indent=2))
if __name__=='__main__':main()
