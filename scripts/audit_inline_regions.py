#!/usr/bin/env python3
"""Verify reviewed inline-assembly sites against source, symbols and linked bytes."""
from collections import Counter
import json
from pathlib import Path
import subprocess
import sys
ROOT=Path(__file__).resolve().parents[1]
# Explicit reviewed locations; fail closed when implementation or placement changes.
SITES=[
 ('main_rom', 'src/bios_divrem.c', 'DivRem', 0x080D1684, '06df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'BgAffineSet', 135075440, '0edf', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'CpuFastSet', 135075444, '0cdf', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'CpuSet', 135075448, '0bdf', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'Div', 135075452, '06df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'DivArm', 135075456, '07df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'HuffUnComp', 135075468, '13df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'LZ77UnCompVram', 135075472, '12df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'LZ77UnCompWram', 135075476, '11df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'MultiBoot', 135075482, '25df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'ObjAffineSet', 135075488, '0fdf', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'RLUnCompVram', 135075492, '15df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'RLUnCompWram', 135075496, '14df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'RegisterRamReset', 135075500, '01df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'SoundBiasReset', 135075530, '19df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'SoundBiasSet', 135075538, '19df', 2, 'asm volatile('),
 ('main_rom', 'src/bios_wrappers.c', 'VBlankIntrWait', 135075550, '05df', 2, 'asm volatile('),

 ('main_rom','src/crt0.c','crt0',0x080000c4,'00f029e1',4,'asm volatile("msr cpsr_fc, %2"'),
 ('main_rom','src/crt0.c','crt0',0x080000d0,'00f029e1',4,'asm volatile("msr cpsr_fc, %2"'),
 ('main_rom','src/irq_save_frame.c','IrqSaveFrame',0x08000110,'00004fe1',4,'asm volatile("mrs %0, spsr"'),
 ('main_rom','src/irq_continuation.c','IrqSelected',0x080001d0,'00300fe1',4,'asm volatile("mrs %0, cpsr"'),
 ('main_rom','src/irq_continuation.c','IrqSelected',0x080001dc,'03f029e1',4,'asm volatile("msr cpsr_fc, %2"'),
 ('main_rom','src/irq_continuation.c','IrqSelected',0x080001fc,'00300fe1',4,'asm volatile("mrs %0, cpsr"'),
 ('main_rom','src/irq_continuation.c','IrqSelected',0x08000208,'03f029e1',4,'asm volatile("msr cpsr_fc, %2"'),
 ('main_rom','src/irq_continuation.c','IrqSelected',0x08000214,'00f069e1',4,'asm volatile("msr spsr_fc, %0"'),
 ('main_rom','src/serial_reset.c','SerialReset',0x08b1a24c,'000011ef',4,'asm volatile("svc #0x110000"'),
 ('main_rom','src/eventinfo.c','StartAvailableTileEvent',0x08084320,'c046',2,'asm("nop")'),
 ('main_rom','src/eventinfo.c','StartAvailableTileEvent',0x08084324,'c046',2,'asm("nop")'),
 ('main_rom','src/hardware.c','EnterSleepMode',0x08001ce2,'03df',2,'asm("swi 3")'),
 ('main_rom','src/m4a.c','MusicPlayerJumpTableCopy',0x080d054c,'2adf',2,'asm("swi 0x2A")'),
 ('main_rom','src/sio_multiboot_wait.c','MultiBootWaitCycles',0x0804e024,'7a46',2,'asm("mov %0, pc"'),
 ('main_rom','src/sio_multiboot_wait.c','MultiBootWaitCycles',0x0804e036,'401afddc',4,'1: subs %0, %0, %1'),
 ('mgfembp','src/hardware.c','func_02011F4C',0x02011fa4,'03df',2,'asm("swi 3")'),
]

def main():
    inventories={};symbols={};binaries={}
    for name,root,base,size,stem in [('main_rom',ROOT,0x08000000,0x1000000,'fireemblem8'),('mgfembp',ROOT/'mgfembp',0x02010000,34956,'mgfembp')]:
        elf=root/(stem+'.elf')
        data=json.loads(subprocess.check_output([sys.executable,str(ROOT/'scripts/audit_linked_code.py'),'--elf',str(elf),'--map',str(root/(stem+'.map')),'--start',hex(base),'--size',str(size)],text=True))
        inventories[name]=(root,data)
        symbols[name]={}
        for line in subprocess.check_output(['arm-none-eabi-nm','-S',str(elf)],text=True).splitlines():
            fields=line.split()
            if len(fields)==4:
                try: symbols[name][fields[3]]=(int(fields[0],16),int(fields[1],16))
                except ValueError: pass
        binaries[name]=(base,(root/(stem+('.gba' if name=='main_rom' else '.bin'))).read_bytes())
    source_audit=json.loads(subprocess.check_output([sys.executable,str(ROOT/'scripts/audit_decomp.py')],text=True))
    source_inventories={'main_rom':source_audit}
    source_inventories.update({x['path']:x['source_inventory'] for x in source_audit['embedded_executables']})
    for image,source_inventory in source_inventories.items():
        detected=Counter(x['path'] for x in source_inventory['inline_assembly_classification']['sites'] if x['kind']=='instruction_template')
        reviewed=Counter(x[1] for x in SITES if x[0]==image)
        assert detected==reviewed,('Review new or removed inline sites',image,detected,reviewed)
    records=[];totals={};seen=set()
    for name,source,function,address,expected,size,marker in SITES:
        root,linked=inventories[name];assert marker in (root/source).read_text(),source
        start,length=symbols[name][function];assert start<=address and address+size<=start+length,(function,start,length)
        if expected is None:assert address==start and size==length
        base,binary=binaries[name];actual=binary[address-base:address-base+size]
        assert len(actual)==size
        if expected:assert actual.hex()==expected,(source,hex(address),actual.hex())
        instructions=data_bytes=0
        for region in linked['regions']:
            lo=max(address,region['start']);hi=min(address+size,region['end'])
            if lo>=hi:continue
            assert region['object']==source.removesuffix('.c')+'.o',(source,region)
            for byte in range(lo,hi):
                assert (name,byte) not in seen,'overlapping reviewed regions';seen.add((name,byte))
            if region['kind'] in ('arm','thumb'):instructions+=hi-lo
            elif region['kind']=='data':data_bytes+=hi-lo
            else:raise AssertionError('Unmapped bytes in reviewed inline region')
        assert instructions+data_bytes==size
        if expected:assert instructions==size
        records.append(dict(image=name,source=source,function=function,address=hex(address),region_bytes=size,instruction_bytes=instructions,literal_alignment_bytes=data_bytes))
        totals[name]=totals.get(name,0)+instructions
    result=dict(scope='Reviewed instruction-bearing inline sites; mapped instruction sizes exclude literals/alignment. Not an overall completion percentage.',totals=totals,sites=records,images={name:{'elf_sha256':linked['elf_sha256'],'map_sha256':linked['map_sha256']} for name,(_,linked) in inventories.items()})
    print(json.dumps(result,indent=2))
if __name__=='__main__':main()
