#!/usr/bin/env python3
"""
Safe graphics conversion for FE8U dump files.
Only converts files where the FULL pipeline produces identical output:
  .bin (LZ) -> decompress -> .4bpp -> .png -> .4bpp -> .lz -> compare with original .bin

For uncompressed 4bpp: .bin -> .4bpp -> .png -> .4bpp -> compare

Files that pass get a .png source file, and the .s reference is updated
to use the proper extension (.4bpp.lz or .4bpp) so the Makefile pattern
rules handle the build.
"""
import os
import subprocess
import shutil
import hashlib
import tempfile

REPO = "/root/.openclaw/workspace-coding/projects/fireemblem8u"
GBAGFX = os.path.join(REPO, "tools/gbagfx/gbagfx")
REPORT = os.path.join(REPO, "reports/dump_incbin_resources.md")

def sha1(path):
    h = hashlib.sha1()
    with open(path, 'rb') as f:
        h.update(f.read())
    return h.hexdigest()

def is_lz(path):
    with open(path, 'rb') as f:
        b = f.read(1)
        return len(b) == 1 and b[0] == 0x10

def run(cmd):
    return subprocess.run(cmd, capture_output=True, check=True)

def try_lz_png_roundtrip(bin_path, tmp):
    """Full roundtrip: .bin(lz) -> .4bpp -> .png -> .4bpp -> .4bpp.lz, compare with original"""
    lz = os.path.join(tmp, "test.4bpp.lz")
    bpp = os.path.join(tmp, "test.4bpp")
    png = os.path.join(tmp, "test.png")
    rbpp = os.path.join(tmp, "recomp.4bpp")
    rlz = os.path.join(tmp, "recomp.4bpp.lz")
    
    shutil.copy(bin_path, lz)
    try:
        run([GBAGFX, lz, bpp])          # decompress
        run([GBAGFX, bpp, png])          # to png
        run([GBAGFX, png, rbpp])         # from png
        run([GBAGFX, rbpp, rlz])         # recompress
        if sha1(bin_path) == sha1(rlz):
            return png  # success
    except subprocess.CalledProcessError:
        pass
    return None

def try_4bpp_png_roundtrip(bin_path, tmp):
    """Roundtrip: .bin(4bpp) -> .png -> .4bpp, compare with original"""
    bpp = os.path.join(tmp, "test.4bpp")
    png = os.path.join(tmp, "test.png")
    rbpp = os.path.join(tmp, "recomp.4bpp")
    
    shutil.copy(bin_path, bpp)
    try:
        run([GBAGFX, bpp, png])
        run([GBAGFX, png, rbpp])
        if sha1(bin_path) == sha1(rbpp):
            return png
    except subprocess.CalledProcessError:
        pass
    return None

def update_source(src_ref, old_path, new_path):
    src_file, src_line = src_ref.split(':')
    src_file_path = os.path.join(REPO, src_file)
    with open(src_file_path, 'r') as f:
        lines = f.readlines()
    line_idx = int(src_line) - 1
    if line_idx < len(lines) and old_path in lines[line_idx]:
        lines[line_idx] = lines[line_idx].replace(old_path, new_path)
        with open(src_file_path, 'w') as f:
            f.writelines(lines)
        return True
    return False

def main():
    candidates = []
    with open(REPORT, 'r') as f:
        for line in f:
            line = line.strip()
            if not line.startswith("|") or "---" in line or "Offset" in line:
                continue
            parts = [p.strip() for p in line.split("|")]
            if len(parts) < 8:
                continue
            try:
                size = int(parts[3])
            except ValueError:
                continue
            rtype = parts[4]
            label = parts[5].replace("`", "")
            bin_path = parts[6].replace("`", "")
            src_ref = parts[7].replace("`", "")
            if rtype == "Palette" or "Pal_" in label:
                continue
            if not bin_path.endswith('.bin'):
                continue
            candidates.append({
                "size": size, "rtype": rtype, "label": label,
                "bin_path": bin_path, "src_ref": src_ref
            })
    
    print(f"Testing {len(candidates)} candidates for PNG roundtrip...")
    
    success = 0
    skipped = 0
    
    for cand in candidates:
        abs_bin = os.path.join(REPO, cand['bin_path'])
        if not os.path.exists(abs_bin):
            skipped += 1
            continue
        if os.path.getsize(abs_bin) != cand['size']:
            skipped += 1
            continue
        
        rel_bin = cand['bin_path']
        
        with tempfile.TemporaryDirectory() as tmp:
            if is_lz(abs_bin):
                png_result = try_lz_png_roundtrip(abs_bin, tmp)
                if png_result:
                    # Full pipeline works! Create .png, update .s to .4bpp.lz
                    target_ext = '.4bpp.lz'
                    new_rel = rel_bin.replace('.bin', target_ext)
                    png_dest = os.path.join(REPO, rel_bin.replace('.bin', '.png'))
                    
                    if update_source(cand['src_ref'], rel_bin, new_rel):
                        shutil.copy(png_result, png_dest)
                        os.remove(abs_bin)
                        print(f"OK: {rel_bin} -> .png + .4bpp.lz")
                        success += 1
                    else:
                        skipped += 1
                else:
                    skipped += 1
            else:
                png_result = try_4bpp_png_roundtrip(abs_bin, tmp)
                if png_result:
                    target_ext = '.4bpp'
                    new_rel = rel_bin.replace('.bin', target_ext)
                    png_dest = os.path.join(REPO, rel_bin.replace('.bin', '.png'))
                    
                    if update_source(cand['src_ref'], rel_bin, new_rel):
                        shutil.copy(png_result, png_dest)
                        os.remove(abs_bin)
                        print(f"OK: {rel_bin} -> .png + .4bpp")
                        success += 1
                    else:
                        skipped += 1
                else:
                    skipped += 1
    
    print(f"\nDone! Converted: {success}, Skipped: {skipped}")

if __name__ == "__main__":
    main()
