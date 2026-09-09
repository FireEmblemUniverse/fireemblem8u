#!/usr/bin/env python3
"""
Apply palettes to dump/ PNG files.
Strategy: For each .s file, scan for .incbin directives and pair
graphics (.4bpp/.4bpp.lz) with the nearest palette (.gbapal/.pal)
defined in the same file.
"""
import os
import re
import subprocess
import hashlib
import struct
from glob import glob

GBAGFX = "./tools/gbagfx/gbagfx"
DUMP_DIR = "dump"

def get_sha1(filepath):
    h = hashlib.sha1()
    with open(filepath, 'rb') as f:
        h.update(f.read())
    return h.hexdigest()

def get_png_width_tiles(png_file):
    try:
        with open(png_file, 'rb') as f:
            f.read(8)
            struct.unpack('>I', f.read(4))[0]
            chunk_type = f.read(4)
            if chunk_type == b'IHDR':
                return struct.unpack('>I', f.read(4))[0] // 8
    except:
        pass
    return None

def apply_palette(png_file, pal_file):
    base_name = os.path.basename(png_file).replace('.png', '')
    lz_path = os.path.join(DUMP_DIR, base_name + ".4bpp.lz")
    uncomp_path = os.path.join(DUMP_DIR, base_name + ".4bpp")

    if os.path.exists(lz_path):
        source_bin = lz_path
        is_lz = True
    elif os.path.exists(uncomp_path):
        source_bin = uncomp_path
        is_lz = False
    else:
        return False

    original_sha1 = get_sha1(source_bin)
    width = get_png_width_tiles(png_file)
    width_arg = ["-width", str(width)] if width else []

    temp_4bpp = "temp_pal.4bpp"
    temp_png = "temp_pal.png"
    temp_out_4bpp = "temp_pal_out.4bpp"
    temp_out_lz = "temp_pal_out.4bpp.lz"

    try:
        if is_lz:
            subprocess.run([GBAGFX, source_bin, temp_4bpp], capture_output=True, check=True)
        else:
            subprocess.run(["cp", source_bin, temp_4bpp], check=True)

        cmd = [GBAGFX, temp_4bpp, temp_png, "-palette", pal_file] + width_arg
        subprocess.run(cmd, capture_output=True, check=True)

        subprocess.run([GBAGFX, temp_png, temp_out_4bpp], capture_output=True, check=True)

        if is_lz:
            subprocess.run([GBAGFX, temp_out_4bpp, temp_out_lz], capture_output=True, check=True)
            new_sha1 = get_sha1(temp_out_lz)
        else:
            new_sha1 = get_sha1(temp_out_4bpp)

        if new_sha1 == original_sha1:
            subprocess.run(["cp", temp_png, png_file], check=True)
            return True
        return False
    except:
        return False
    finally:
        for f in [temp_4bpp, temp_png, temp_out_4bpp, temp_out_lz]:
            if os.path.exists(f):
                os.remove(f)

def main():
    pairs = {}  # png_path -> pal_path

    # Scan all .s files for incbin directives
    s_files = glob("data/**/*.s", recursive=True) + glob("asm/**/*.s", recursive=True) + glob("src/**/*.s", recursive=True)
    
    for s_file in s_files:
        try:
            with open(s_file, 'r') as f:
                lines = f.readlines()
        except:
            continue

        # Collect all incbin entries with line numbers
        gfx_entries = []  # (line_no, dump_path)
        pal_entries = []  # (line_no, dump_path)
        
        for i, line in enumerate(lines):
            m = re.search(r'\.incbin\s+"(dump/[^"]+)"', line)
            if not m:
                continue
            path = m.group(1)
            if path.endswith('.4bpp.lz') or path.endswith('.4bpp'):
                gfx_entries.append((i, path))
            elif path.endswith('.gbapal') or path.endswith('.pal'):
                pal_entries.append((i, path))

        # For each gfx, find the nearest palette
        for gfx_line, gfx_path in gfx_entries:
            png_path = gfx_path.replace('.4bpp.lz', '.png').replace('.4bpp', '.png')
            if not os.path.exists(png_path):
                continue

            best_pal = None
            best_dist = float('inf')
            for pal_line, pal_path in pal_entries:
                dist = abs(gfx_line - pal_line)
                if dist < best_dist:
                    best_dist = dist
                    best_pal = pal_path
                    
            if best_pal and os.path.exists(best_pal) and best_dist < 50:
                pairs[png_path] = best_pal

    print(f"Found {len(pairs)} GFX -> Palette pairs")

    success = 0
    for png_file, pal_file in sorted(pairs.items()):
        if apply_palette(png_file, pal_file):
            success += 1

    print(f"Successfully applied palettes to {success} PNG files")

if __name__ == "__main__":
    main()
