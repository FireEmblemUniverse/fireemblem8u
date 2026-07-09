#!/usr/bin/env python3
import os
import sys
import subprocess
import shutil
import hashlib

def get_sha1(filepath):
    h = hashlib.sha1()
    try:
        with open(filepath, 'rb') as f:
            h.update(f.read())
        return h.hexdigest()
    except:
        return None

def main():
    repo_dir = "/root/.openclaw/workspace-coding/projects/fireemblem8u"
    report_file = os.path.join(repo_dir, "reports/dump_incbin_resources.md")
    
    if not os.path.exists(report_file):
        print("Report file not found.")
        return

    # Phase 1: Collect candidates
    candidates = []
    with open(report_file, 'r') as f:
        for line in f:
            line = line.strip()
            if not line.startswith("|") or "---" in line or "Offset" in line:
                continue
            
            parts = [p.strip() for p in line.split("|")]
            if len(parts) >= 8:
                try:
                    size = int(parts[3])
                except ValueError:
                    continue
                    
                rtype = parts[4]
                label = parts[5].replace("`", "")
                bin_path = parts[6].replace("`", "")
                src_ref = parts[7].replace("`", "")
                
                # Check heuristics: is it likely a palette?
                # Usually sizes are 32, 64, 128, 256, 512, etc. (must be a multiple of 2)
                # Labels usually contain "Pal" or rtype is "Palette".
                if size > 0 and size % 2 == 0 and ("Pal" in label or rtype == "Palette"):
                    candidates.append({
                        "size": size,
                        "label": label,
                        "bin_path": bin_path,
                        "src_ref": src_ref
                    })

    print(f"Found {len(candidates)} potential palette files to convert.")
    
    success_count = 0
    fail_count = 0
    
    # Phase 2: Convert and verify
    for cand in candidates:
        bin_path = os.path.join(repo_dir, cand['bin_path'])
        
        # Make sure the file exists and its size exactly matches the table
        if not os.path.exists(bin_path):
            continue
            
        actual_size = os.path.getsize(bin_path)
        if actual_size != cand['size']:
            print(f"Skip {bin_path}: size mismatch ({actual_size} vs {cand['size']}). Likely overlaps.")
            continue
            
        # Target paths
        base_name = os.path.splitext(bin_path)[0]
        pal_path = base_name + ".pal"
        gbapal_path = base_name + ".gbapal"
        
        rel_bin_path = cand['bin_path']
        rel_gbapal_path = rel_bin_path.replace('.bin', '.gbapal')
        
        # 1. Rename .bin to .gbapal 
        shutil.copy(bin_path, gbapal_path)
        
        # 2. Extract to .pal using gbagfx (gbapal -> pal)
        gbagfx_cmd = [os.path.join(repo_dir, "tools/gbagfx/gbagfx"), gbapal_path, pal_path]
        try:
            subprocess.run(gbagfx_cmd, check=True, capture_output=True)
        except subprocess.CalledProcessError:
            print(f"gbagfx failed for {gbapal_path}")
            os.remove(gbapal_path)
            continue
            
        # 3. Test compilation back (pal -> gbapal) to see if we get the exact same binary
        test_gbapal_path = base_name + "_test.gbapal"
        test_cmd = [os.path.join(repo_dir, "tools/gbagfx/gbagfx"), pal_path, test_gbapal_path]
        try:
            subprocess.run(test_cmd, check=True, capture_output=True)
        except subprocess.CalledProcessError:
            print(f"gbagfx recompilation failed for {pal_path}")
            os.remove(gbapal_path)
            if os.path.exists(pal_path): os.remove(pal_path)
            continue
            
        orig_sha1 = get_sha1(bin_path)
        new_sha1 = get_sha1(test_gbapal_path)
        
        if orig_sha1 != new_sha1:
            print(f"SHA1 mismatch for {bin_path}. Cannot safely convert.")
            os.remove(gbapal_path)
            os.remove(pal_path)
            os.remove(test_gbapal_path)
            continue
            
        # Success! The .pal faithfully represents the .bin
        # Now we can update the source code
        src_file, src_line = cand['src_ref'].split(':')
        src_file_path = os.path.join(repo_dir, src_file)
        
        # Replace the incbin in the source code
        with open(src_file_path, 'r') as f:
            lines = f.readlines()
            
        line_idx = int(src_line) - 1
        if line_idx < len(lines) and rel_bin_path in lines[line_idx]:
            # Replace .bin with .gbapal in the source file
            lines[line_idx] = lines[line_idx].replace(rel_bin_path, rel_gbapal_path)
            
            with open(src_file_path, 'w') as f:
                f.writelines(lines)
                
            # Remove the original .bin and our test file
            os.remove(bin_path)
            os.remove(test_gbapal_path)
            
            print(f"Successfully converted {rel_bin_path} -> .pal/.gbapal")
            success_count += 1
        else:
            print(f"Failed to find exact string {rel_bin_path} at {src_file}:{src_line}")
            # Revert
            os.remove(gbapal_path)
            os.remove(pal_path)
            os.remove(test_gbapal_path)
            fail_count += 1

    print(f"Done! Converted: {success_count}. Failed/Skipped: {fail_count}")

if __name__ == "__main__":
    main()
