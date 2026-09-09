#!/usr/bin/env python3
"""Check the decoder candidate against original ARM on synthetic valid Huffman trees."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_WRITE
from unicorn import arm_const as regs
from build_color_fade import FLAGS

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/decode-match'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plugin',type=Path,required=True)
    args=parser.parse_args()
    rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    root_address, table_address=struct.unpack_from('<II',rom,0x6dc)
    source=Path(__file__).with_name('decode_string.c')
    flags=FLAGS+['-ffixed-r14','-fno-strict-aliasing','-fplugin='+str(args.plugin.resolve()),'-fplugin-arg-zero_test-prefix-pool=gMsgHuffmanTableRoot,gMsgHuffmanTable']
    OUT.mkdir(parents=True,exist_ok=True)
    subprocess.run(['arm-none-eabi-gcc','-S',*flags,str(source),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    (OUT/'candidate.ld').write_text('SECTIONS { . = 0x080006dc; .text : { *(.text) } /DISCARD/ : { *(.ARM.attributes) *(.comment) } }\ngMsgHuffmanTableRoot = '+hex(root_address)+';\ngMsgHuffmanTable = '+hex(table_address)+';\n')
    subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'candidate.ld'),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    code=(OUT/'candidate.bin').read_bytes()
    assert len(code)<=0x770-0x6dc
    input_address, output_address, stack=0x02002000,0x02003000,0x03007000
    output_length=0
    def write_check(machine,access,address,size,value,data):
        assert (stack-16<=address and address+size<=stack) or (output_address<=address and address+size<=output_address+output_length),(hex(address),size)
    machines=[]
    for candidate in (False,True):
        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM)
        uc.mem_map(0x08000000,0x1000000)
        uc.mem_write(0x08000000,rom)
        if candidate:uc.mem_write(0x080006dc,code)
        uc.mem_map(0x02000000,0x40000)
        uc.mem_map(0x03000000,0x8000)
        uc.hook_add(UC_HOOK_MEM_WRITE,write_check)
        machines.append(uc)
    trees=[(0,0x41),((0,0xff),(0x4243,0x8000)),(0x41,(0x42,(0x4243,(0x8000,0)))),((0x41,(0x4243,0)),((0x8000,0xff),(0x7f,0x0100)))]
    randomizer=random.Random(0x6e4)
    cases=0
    flag_differences=0
    for tree in trees:
        nodes=[]
        paths={}
        def add(node,path):
            index=len(nodes);nodes.append(0)
            if isinstance(node,int):
                nodes[index]=0x80000000|node;paths[node]=path
            else:
                left=add(node[0],path+[0]);right=add(node[1],path+[1]);nodes[index]=left|(right<<16)
            return index
        add(tree,[])
        nonzero=[x for x in paths if x]
        for length in [0,1,2,7,8,9,15,16,31,63]:
            leaves=[randomizer.choice(nonzero) for _ in range(length)]+[0]
            bits=[b for leaf in leaves for b in paths[leaf]]
            stream=bytearray(randomizer.randbytes((len(bits)+7)//8+8))
            for i,bit in enumerate(bits):stream[i//8]=(stream[i//8]&~(1<<(i%8)))|(bit<<(i%8))
            expected=bytearray()
            for leaf in leaves:
                expected.append(leaf&255)
                if leaf&0xff00:expected.append((leaf>>8)&255)
            output_length=len(expected)
            for nzcv in range(16):
                outputs=[];flag_values=[]
                for uc in machines:
                    uc.mem_write(table_address,struct.pack('<'+str(len(nodes))+'I',*nodes))
                    uc.mem_write(root_address,struct.pack('<I',table_address))
                    uc.mem_write(input_address,bytes(stream))
                    uc.mem_write(output_address,b'\xa5'*512)
                    uc.reg_write(regs.UC_ARM_REG_CPSR,0x13|(nzcv<<28))
                    for r in range(13):uc.reg_write(getattr(regs,'UC_ARM_REG_R'+str(r)),0x12340000+r)
                    uc.reg_write(regs.UC_ARM_REG_R0,input_address);uc.reg_write(regs.UC_ARM_REG_R1,output_address)
                    uc.reg_write(regs.UC_ARM_REG_SP,stack);uc.reg_write(regs.UC_ARM_REG_LR,0x08000F00)
                    uc.emu_start(0x080006e4,0x08000F00,count=100000)
                    assert uc.reg_read(regs.UC_ARM_REG_PC)==0x08000F00
                    assert uc.reg_read(regs.UC_ARM_REG_SP)==stack
                    for r in range(4,13):assert uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r)))==0x12340000+r
                    assert bytes(uc.mem_read(output_address,512))==expected+b'\xa5'*(512-output_length)
                    assert bytes(uc.mem_read(input_address,len(stream)))==stream
                    assert uc.reg_read(regs.UC_ARM_REG_R0)==input_address+(len(bits)+7)//8
                    assert uc.reg_read(regs.UC_ARM_REG_R1)==output_address+output_length-1
                    outputs.append(tuple(uc.reg_read(getattr(regs,'UC_ARM_REG_R'+str(r))) for r in range(13)))
                    flag_values.append(uc.reg_read(regs.UC_ARM_REG_CPSR)&0xf0000000)
                assert outputs[0]==outputs[1]
                flag_differences+=flag_values[0]!=flag_values[1]
                cases+=1
    wanted=rom[0x6dc:0x770]
    differences=[{'address':hex(0x080006dc+i),'candidate':code[i:i+4].hex(),'original':wanted[i:i+4].hex()} for i in range(0,len(wanted),4) if code[i:i+4]!=wanted[i:i+4]]
    report={'cases':cases,'return_nzcv_difference_cases':flag_differences,'section_bytes':len(code),'complete_section_match':code==wanted,'differing_words':differences,'compiler_flags':flags,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(code).hexdigest(),'compiler_version':subprocess.check_output(['arm-none-eabi-gcc','-dumpfullversion'],text=True).strip(),'plugin_sha256':hashlib.sha256(args.plugin.read_bytes()).hexdigest()}
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'{cases} valid-tree cases pass for output, consumed input, registers and write bounds; {flag_differences} return-NZCV differences.')
    print(f'{len(differences)} differing words in the {len(wanted)}-byte pointer/function region.')


if __name__=='__main__':main()
