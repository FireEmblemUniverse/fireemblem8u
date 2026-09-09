#!/usr/bin/env python3
"""
Fix PNG widths for dump/ graphics files.
Strategy:
1. For each PNG in dump/, determine its 4bpp tile count
2. Find all valid widths (divisors of tile_count) 
3. For each valid width, test if roundtrip produces identical binary
4. Among valid widths, pick the best one based on heuristics:
   a. If a TSA references this graphic, derive width from TSA
   b. If code references suggest a width, use that
   c. Otherwise pick the largest valid width that roundtrips correctly
5. Only update if the chosen width differs from current
"""
import os
import subprocess
import hashlib
import struct
import re
import sys
from glob import glob
from collections import defaultdict

GBAGFX = "./tools/gbagfx/gbagfx"
DUMP_DIR = "dump"
DATA_DIRS = ["data", "asm", "src"]

def get_sha1(filepath):
    h = hashlib.sha1()
    with open(filepath, 'rb') as f:
        h.update(f.read())
    return h.hexdigest()

def get_file_size(filepath):
    return os.path.getsize(filepath)

def get_tile_count(fourpp_size):
    """Each 4bpp tile is 8x8 pixels = 32 bytes"""
    return fourpp_size // 32

def get_current_png_width(png_file):
    """Get current width of PNG in tiles (width_pixels / 8)"""
    try:
        # Read PNG IHDR chunk to get width
        with open(png_file, 'rb') as f:
            sig = f.read(8)
            # First chunk is IHDR
            length = struct.unpack('>I', f.read(4))[0]
            chunk_type = f.read(4)
            if chunk_type == b'IHDR':
                width = struct.unpack('>I', f.read(4))[0]
                return width // 8  # convert pixels to tiles
    except:
        pass
    return None

def find_tsa_pairs():
    """
    Scan .s files to find graphics that are paired with TSA data.
    TSA entries are 2 bytes each, with tile index in lower 10 bits.
    The max tile index in a TSA tells us the minimum number of tiles wide.
    
    More importantly, TSA dimensions tell us the tilemap size:
    - A 30x20 TSA means 240x160 pixels (full screen)
    - Width of the graphic = number of unique tiles arranged in columns
    """
    # For now, let's just find symbol associations
    tsa_pairs = {}  # graphic_symbol -> tsa_file
    
    for data_dir in DATA_DIRS:
        for s_file in glob(f"{data_dir}/**/*.s", recursive=True):
            try:
                with open(s_file, 'r') as f:
                    content = f.read()
            except:
                continue
            
            # Look for patterns where Img/Gfx and Tsa are defined near each other
            lines = content.split('\n')
            for i, line in enumerate(lines):
                # Check for .incbin with dump/ files
                m = re.search(r'\.incbin\s+"(dump/[^"]+\.(?:4bpp\.lz|4bpp))"', line)
                if m:
                    gfx_file = m.group(1)
                    # Look nearby (within 20 lines) for a TSA reference
                    context = '\n'.join(lines[max(0,i-10):min(len(lines),i+20)])
                    tsa_m = re.search(r'\.incbin\s+"(dump/[^"]+\.(?:tsa\.lz|tsa|bin))"', context)
                    if tsa_m:
                        tsa_file = tsa_m.group(1)
                        if 'tsa' in tsa_file.lower() or 'Tsa' in context[context.find(tsa_m.group(0))-50:context.find(tsa_m.group(0))]:
                            tsa_pairs[gfx_file] = tsa_file
    
    return tsa_pairs

def get_width_from_tsa(tsa_file):
    """
    Parse a TSA file to determine the tilemap width.
    TSA files contain 2-byte entries. The total entries = width * height.
    Common screen sizes: 30x20 (240x160), 32x32, etc.
    
    We can try to read the TSA and find the dimensions from the data pattern.
    """
    if not os.path.exists(tsa_file):
        return None
    
    # If it's compressed, decompress first
    if tsa_file.endswith('.lz'):
        temp_tsa = "temp_tsa_analysis.tsa"
        try:
            subprocess.run([GBAGFX, tsa_file, temp_tsa], capture_output=True, check=True)
            size = os.path.getsize(temp_tsa)
            os.remove(temp_tsa)
        except:
            return None
    else:
        size = os.path.getsize(tsa_file)
    
    # Each TSA entry is 2 bytes
    num_entries = size // 2
    
    # Common tilemap dimensions
    # 30x20 = 600 entries (GBA screen)
    # 32x32 = 1024 entries
    # 32x20 = 640 entries  
    # 30x10 = 300 entries
    common_widths = {
        600: 30,    # 30x20 full screen
        1024: 32,   # 32x32
        640: 32,    # 32x20
        300: 30,    # 30x10
        320: 32,    # 32x10
        960: 32,    # 32x30
        480: 30,    # 30x16
        1200: 30,   # 30x40
    }
    
    if num_entries in common_widths:
        return common_widths[num_entries]
    
    # Try to find a reasonable width
    # Prefer 30 or 32 for screen-sized tilemaps
    if num_entries % 30 == 0 and (num_entries // 30) <= 64:
        return 30
    if num_entries % 32 == 0 and (num_entries // 32) <= 64:
        return 32
    
    return None

def find_width_from_code(gfx_basename):
    """Search C/ASM source for width hints related to this graphic"""
    # Look for patterns like:
    # CopyDataWithPossibleUncomp(gfx, vram, 0x...size)
    # LZ77UnCompVram(gfx, BG_CHAR_ADDR(n))
    # BG screen size hints
    
    # For now return None - we'll use heuristic widths
    return None

def test_roundtrip(source_bin, is_lz, width):
    """Test if a specific width produces a valid roundtrip"""
    temp_4bpp = "temp_rt_test.4bpp"
    temp_png = "temp_rt_test.png"
    temp_out_4bpp = "temp_rt_test_out.4bpp"
    temp_out_lz = "temp_rt_test_out.4bpp.lz"
    
    try:
        original_sha1 = get_sha1(source_bin)
        
        if is_lz:
            subprocess.run([GBAGFX, source_bin, temp_4bpp], capture_output=True, check=True)
        else:
            subprocess.run(["cp", source_bin, temp_4bpp], check=True)
        
        subprocess.run([GBAGFX, temp_4bpp, temp_png, "-width", str(width)], 
                      capture_output=True, check=True)
        subprocess.run([GBAGFX, temp_png, temp_out_4bpp], capture_output=True, check=True)
        
        if is_lz:
            subprocess.run([GBAGFX, temp_out_4bpp, temp_out_lz], capture_output=True, check=True)
            new_sha1 = get_sha1(temp_out_lz)
        else:
            new_sha1 = get_sha1(temp_out_4bpp)
        
        return new_sha1 == original_sha1
    except:
        return False
    finally:
        for f in [temp_4bpp, temp_png, temp_out_4bpp, temp_out_lz]:
            if os.path.exists(f):
                os.remove(f)

def apply_width(source_bin, is_lz, width, png_file):
    """Apply the width by regenerating the PNG"""
    temp_4bpp = "temp_apply.4bpp"
    
    try:
        if is_lz:
            subprocess.run([GBAGFX, source_bin, temp_4bpp], capture_output=True, check=True)
        else:
            subprocess.run(["cp", source_bin, temp_4bpp], check=True)
        
        subprocess.run([GBAGFX, temp_4bpp, png_file, "-width", str(width)], 
                      capture_output=True, check=True)
        return True
    except:
        return False
    finally:
        if os.path.exists(temp_4bpp):
            os.remove(temp_4bpp)

def main():
    png_files = sorted(glob(f"{DUMP_DIR}/*.png"))
    print(f"Found {len(png_files)} PNG files to check")
    
    # Find TSA pairs
    print("Scanning for TSA associations...")
    tsa_pairs = find_tsa_pairs()
    print(f"Found {len(tsa_pairs)} graphics with TSA associations")
    
    updated = 0
    skipped = 0
    failed = 0
    width_report = []
    
    for png_file in png_files:
        base_name = os.path.basename(png_file).replace('.png', '')
        
        lz_path = os.path.join(DUMP_DIR, base_name + ".4bpp.lz")
        uncomp_path = os.path.join(DUMP_DIR, base_name + ".4bpp")
        
        if os.path.exists(lz_path):
            source_bin = lz_path
            is_lz = True
            gfx_ref = f"dump/{base_name}.4bpp.lz"
        elif os.path.exists(uncomp_path):
            source_bin = uncomp_path
            is_lz = False
            gfx_ref = f"dump/{base_name}.4bpp"
        else:
            skipped += 1
            continue
        
        # Get tile count
        if is_lz:
            temp = "temp_tiles.4bpp"
            try:
                subprocess.run([GBAGFX, source_bin, temp], capture_output=True, check=True)
                tile_count = get_tile_count(os.path.getsize(temp))
            except:
                skipped += 1
                continue
            finally:
                if os.path.exists(temp):
                    os.remove(temp)
        else:
            tile_count = get_tile_count(os.path.getsize(source_bin))
        
        if tile_count == 0:
            skipped += 1
            continue
        
        current_width = get_current_png_width(png_file)
        
        # Determine target width
        target_width = None
        width_source = ""
        
        # 1. Check TSA association
        if gfx_ref in tsa_pairs:
            tsa_w = get_width_from_tsa(tsa_pairs[gfx_ref])
            if tsa_w and tile_count % tsa_w == 0:
                target_width = tsa_w
                width_source = f"TSA({tsa_pairs[gfx_ref]})"
        
        # 2. Check code references
        if target_width is None:
            code_w = find_width_from_code(base_name)
            if code_w and tile_count % code_w == 0:
                target_width = code_w
                width_source = "code"
        
        # 3. Heuristic: pick largest valid width
        if target_width is None:
            # Common GBA sprite sheet widths in tiles: 32, 16, 8, 4
            # For BG graphics: 30, 32
            preferred_widths = [32, 30, 16, 8, 4, 2]
            for w in preferred_widths:
                if tile_count >= w and tile_count % w == 0:
                    target_width = w
                    width_source = "heuristic"
                    break
            
            if target_width is None:
                # Fall back to largest divisor <= 32
                for w in range(min(32, tile_count), 0, -1):
                    if tile_count % w == 0:
                        target_width = w
                        width_source = "fallback"
                        break
        
        if target_width is None or target_width == current_width:
            skipped += 1
            continue
        
        # Test roundtrip with target width
        if test_roundtrip(source_bin, is_lz, target_width):
            if apply_width(source_bin, is_lz, target_width, png_file):
                updated += 1
                if current_width != target_width:
                    width_report.append(f"{base_name}: {current_width} -> {target_width} ({width_source}, {tile_count} tiles)")
            else:
                failed += 1
        else:
            # Target width doesn't roundtrip, try to find one that does
            found = False
            preferred_widths = [32, 30, 16, 8, 4, 2, 1]
            for w in preferred_widths:
                if w == current_width:
                    continue
                if tile_count >= w and tile_count % w == 0:
                    if test_roundtrip(source_bin, is_lz, w):
                        if apply_width(source_bin, is_lz, w, png_file):
                            updated += 1
                            width_report.append(f"{base_name}: {current_width} -> {w} (fallback-rt, {tile_count} tiles)")
                            found = True
                            break
            if not found:
                skipped += 1
    
    print(f"\nResults: {updated} updated, {skipped} skipped, {failed} failed")
    print(f"\nWidth changes:")
    for line in width_report:
        print(f"  {line}")
    
    return updated

if __name__ == "__main__":
    count = main()
    sys.exit(0 if count >= 0 else 1)
