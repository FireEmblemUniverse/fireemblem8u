#!/usr/bin/env python3
import os
import subprocess
import hashlib
from glob import glob

GBAGFX = "./tools/gbagfx/gbagfx"
DUMP_DIR = "dump"

def get_sha1(filepath):
    h = hashlib.sha1()
    with open(filepath, 'rb') as f:
        h.update(f.read())
    return h.hexdigest()

def update_asm_refs(old_bin, new_ext):
    base_name = os.path.basename(old_bin)
    new_name = base_name.replace('.bin', new_ext)
    
    # Files to check
    asm_files = glob("data/**/*.s", recursive=True) + glob("asm/**/*.s", recursive=True) + glob("src/**/*.s", recursive=True)
    
    replaced = 0
    for asm_file in asm_files:
        with open(asm_file, 'r') as f:
            content = f.read()
            
        if f'incbin "dump/{base_name}"' in content:
            new_content = content.replace(f'incbin "dump/{base_name}"', f'incbin "dump/{new_name}"')
            with open(asm_file, 'w') as f:
                f.write(new_content)
            replaced += 1
            
    return replaced

def test_lz_roundtrip(bin_file):
    base_name = os.path.basename(bin_file).replace('.bin', '')
    temp_lz = f"temp_{base_name}.bin.lz"
    temp_bin = f"temp_{base_name}.bin"
    temp_out_lz = f"temp_{base_name}_out.bin.lz"
    
    try:
        # We must name it .lz so gbagfx knows to decompress it
        subprocess.run(["cp", bin_file, temp_lz], check=True)
        
        res = subprocess.run([GBAGFX, temp_lz, temp_bin], capture_output=True)
        if res.returncode != 0:
            return False

        if os.path.getsize(temp_bin) % 2 != 0:
            return False # Uncompressed tsa should be a multiple of 2 bytes

        res = subprocess.run([GBAGFX, temp_bin, temp_out_lz], capture_output=True)
        if res.returncode != 0:
            return False

        if get_sha1(temp_lz) == get_sha1(temp_out_lz):
            return True
        return False
    except:
        return False
    finally:
        for f in [temp_lz, temp_bin, temp_out_lz]:
            if os.path.exists(f):
                os.remove(f)


lz_files = []
for f in glob(f"{DUMP_DIR}/*.bin"):
    with open(f, 'rb') as file:
        magic = file.read(1)
        if magic == b'\x10':
            lz_files.append(f)

print(f"Testing {len(lz_files)} LZ files for raw byte roundtrip via gbagfx...")

success_count = 0
for f in lz_files:
    if test_lz_roundtrip(f):
        print(f"Success: {f}")
        # The key difference: to avoid Makefile rule %.lz: % breaking the build,
        # we do NOT name it .tsa.lz unless there is a .tsa file. 
        # But wait! If we extract the .tsa file alongside it, Make WILL build it.
        # Let's actually generate the .tsa file and commit it, then Make will 
        # naturally compress it to .tsa.lz.
        
        base_name = os.path.basename(f).replace('.bin', '')
        tsa_path = os.path.join(DUMP_DIR, f"{base_name}.tsa")
        tsa_lz_path = os.path.join(DUMP_DIR, f"{base_name}.tsa.lz")
        
        # Decompress to .tsa
        # Copy to temp.lz to allow gbagfx to recognize compression
        subprocess.run(["cp", f, "temp_make.lz"], check=True)
        subprocess.run([GBAGFX, "temp_make.lz", tsa_path], check=True)
        os.remove("temp_make.lz")
        
        # Remove original bin
        os.remove(f)
        
        update_asm_refs(f, '.tsa.lz')
        success_count += 1

print(f"\nConverted {success_count} files to .tsa.lz")
