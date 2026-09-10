#!/usr/bin/env python3
"""Compare VSync C reconstruction with ROM CPU behavior and ordered MMIO accesses."""
from pathlib import Path
import subprocess,struct,json
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE,UC_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/sound-vsync-match';ENTRY=0x080cfb1c;INFO=0x02000000;IO=0x04000000;IDENT=0x68736d53

def main():
    OUT.mkdir(exist_ok=True)
    flags=['-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-builtin','-fno-strict-aliasing','-fno-if-conversion','-fno-if-conversion2','-fno-schedule-insns','-fno-schedule-insns2','-fno-reorder-blocks']
    subprocess.run(['arm-none-eabi-gcc','-S',*flags,'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/sound_vsync.c'),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.o'),str(OUT/'candidate.bin')],check=True)
    candidate=(OUT/'candidate.bin').read_bytes();rom=(ROOT/'baserom.gba').read_bytes();original=rom[0xcfb1c:0xcfb68];count=0;flag_differences=0;register_differences=0
    for ident in (0,IDENT-1,IDENT,IDENT+1,IDENT+2,0xffffffff):
        for counter in (0,1,2,127,128,255):
            for period in (0,1,7,255):
                for repeats in range(4):
                    initial=bytearray([0xa5]*0x100);struct.pack_into('<I',initial,0,ident);initial[4]=counter;initial[11]=period
                    io=bytearray([0x5a]*0x1000);controls=[0x80001234|((repeats&1)<<25),0x04004321|(((repeats>>1)&1)<<25)]
                    for offset,control in zip((0xc4,0xd0),controls):struct.pack_into('<I',io,offset,control)
                    expected=initial.copy();expected_io=io.copy();trace=[]
                    if ((ident-IDENT)&0xffffffff)<=1:
                        expected[4]=(counter-1)&255
                        trace.append(("w",INFO+4,1,expected[4]))
                        if counter<=1:
                            expected[4]=period
                            trace.append(("w",INFO+4,1,period))
                            for offset,control in zip((0xc4,0xd0),controls):
                                trace.append(('r',IO+offset,4))
                                if control&(1<<25):trace.append(('w',IO+offset,4,0x84400004));struct.pack_into('<I',expected_io,offset,0x84400004)
                            for value in (0x400,0xb600):
                                for offset in (0xc6,0xd2):trace.append(('w',IO+offset,2,value));struct.pack_into('<H',expected_io,offset,value)
                    for nzcv in (0,5,10,15):
                        results=[]
                        for code in (original,candidate):
                            uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x080cf000,0x2000);uc.mem_map(INFO,0x1000);uc.mem_map(IO,0x1000);uc.mem_map(0x03000000,0x8000)
                            uc.mem_write(0x080cf000,rom[0xcf000:0xd1000]);uc.mem_write(ENTRY,code);uc.mem_write(INFO,bytes(initial));uc.mem_write(IO,bytes(io));uc.mem_write(0x03007ff0,struct.pack('<I',INFO))
                            actual=[]
                            def access(machine,kind,address,size,value,data):actual.append(('w',address,size,value&((1<<(size*8))-1)) if kind==UC_MEM_WRITE else ('r',address,size))
                            uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,begin=IO,end=IO+0xfff)
                            uc.hook_add(UC_HOOK_MEM_WRITE,access,begin=INFO+4,end=INFO+4)
                            uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nzcv<<28)
                            for reg in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(reg)),0x12340000+reg)
                            uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,0x080d0001)
                            uc.emu_start(ENTRY|1,0x080d0000,count=150)
                            assert uc.reg_read(r.UC_ARM_REG_PC)==0x080d0000
                            assert bytes(uc.mem_read(INFO,0x100))==expected
                            assert bytes(uc.mem_read(IO,0x1000))==expected_io
                            assert actual==trace,(ident,counter,period,repeats,actual,trace)
                            assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                            for reg in range(4,12):assert uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(reg)))==0x12340000+reg
                            results.append((uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000,[uc.reg_read(getattr(r,"UC_ARM_REG_R"+str(reg))) for reg in range(13)]))
                        flag_differences+=results[0][0]!=results[1][0];register_differences+=results[0][1]!=results[1][1];count+=1
    report={'cases':count,'candidate_bytes':len(candidate),'original_bytes':len(original),'return_flag_difference_cases':flag_differences,'r0_r12_difference_cases':register_differences,'complete_match':candidate==original,'scope':'CPU memory and ordered MMIO accesses; DMA hardware transfer execution/timing not modeled.'}
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
if __name__=='__main__':main()
