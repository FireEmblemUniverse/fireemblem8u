#!/usr/bin/env python3
"""Validate Thumb external literal relocation addends, PC alignment and limits."""
from pathlib import Path
import subprocess,tempfile,struct
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r

def main():
    cases=0;rejected=0;unsafe=0
    with tempfile.TemporaryDirectory(prefix='thumb-shared-literal-') as tmp:
        root=Path(tmp)
        for origin in (0x08010000,0x08010800):
            for padding in (0,2):
                source='.syntax unified\n.thumb\n.text\n.align 2\n'+('.space 2\n' if padding else '')+'.global probe\n.thumb_func\nprobe:\n ldr r0, [pc, #1020]\n .reloc .-2, R_ARM_THM_PC8, Shared\n bx lr\n'
                (root/'probe.s').write_text(source)
                subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(root/'probe.s'),'-o',str(root/'probe.o')],check=True)
                for distance in (-4,0,4,8,256,1024,1028):
                    shared=origin+distance
                    (root/'link.ld').write_text(f'SECTIONS {{ . = {origin:#x}; .text : {{ *(.text) }} }} Shared = {shared:#x};\n')
                    result=subprocess.run(['arm-none-eabi-ld','-T',str(root/'link.ld'),str(root/'probe.o'),'-o',str(root/'probe.elf')],capture_output=True,text=True)
                    invalid=distance<4 or distance>1024
                    if result.returncode:
                        assert invalid,result.stderr
                        rejected+=1;continue
                    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(root/'probe.elf'),str(root/'probe.bin')],check=True)
                    code=(root/'probe.bin').read_bytes()
                    displacement=(struct.unpack_from('<H',code,padding)[0]&255)*4
                    loaded=((origin+padding+4)&~3)+displacement
                    if invalid:
                        assert loaded!=shared
                        unsafe+=1
                        (root/'link.ld').write_text((root/'link.ld').read_text()+'ASSERT(Shared >= ((probe & ~3) + 4) && Shared <= ((probe & ~3) + 1024), "Thumb literal outside forward range")\n')
                        guarded=subprocess.run(['arm-none-eabi-ld','-T',str(root/'link.ld'),str(root/'probe.o'),'-o',str(root/'guarded.elf')],capture_output=True,text=True)
                        assert guarded.returncode and 'outside forward range' in guarded.stderr,guarded.stderr
                        continue
                    assert loaded==shared
                    # Pool at origin+4 overlaps return for the two-byte entry offset;
                    # encoding was checked above, execute only non-overlapping pools.
                    if distance<8:continue
                    for nzcv in range(16):
                        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x0800f000,0x4000)
                        uc.mem_write(origin,code);uc.mem_write(shared,struct.pack('<I',0x12345678))
                        uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nzcv<<28);uc.reg_write(r.UC_ARM_REG_LR,0x08012001)
                        uc.emu_start((origin+padding)|1,0x08012000,count=4)
                        assert uc.reg_read(r.UC_ARM_REG_PC)==0x08012000
                        assert uc.reg_read(r.UC_ARM_REG_R0)==0x12345678
                        assert uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000==nzcv<<28
                        cases+=1
    print(f'{cases} relocated Thumb loads pass; aligned and halfword-offset PCs; {rejected} invalid links rejected by linker, {unsafe} silently wrapped, detected by address verification, and rejected by explicit link assertions.')
if __name__=='__main__':main()
