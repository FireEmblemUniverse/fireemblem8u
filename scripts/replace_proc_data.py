#!/usr/bin/python3

import subprocess
import sys


def chunk_proc_scripts(f):
    scripts = []
    current_script = []
    current_script_loc = None

    for line in f:
        if line.startswith("Found script"):
            if current_script_loc is not None:
                scripts.append((current_script_loc, "".join(current_script)))
            current_script = []
            current_script_loc = line.split()[-1]
        else:
            current_script.append(line)

    scripts.append((current_script_loc, "".join(current_script)))

    return scripts


def record_unsuccessful_replace(location, script):
    with open("../reject_scripts", "a") as f:
        f.write(f"Found script at {location}\n")
        f.write(script)


if __name__ == "__main__":
    in_file = sys.argv[1]
    with open(in_file) as f:
        scripts = chunk_proc_scripts(f)
    for location, script in scripts:
        try:
            filename_to_replace = (
                subprocess.check_output(["rg", "-l", f"^{location}", "data/"])
                .decode()
                .splitlines()
            )
        except subprocess.CalledProcessError:
            print(f"unable to find {location} in any data file.")
            try:
                subprocess.check_output(
                    ["rg", "-l", f"struct ProcCmd .*{location}", "src/"]
                )
                print(f"found {location} in src.")
            except subprocess.CalledProcessError:
                record_unsuccessful_replace(location, script)
            continue

        if len(filename_to_replace) != 1:
            print(f"found {location} in multiple data files. {filename_to_replace}")
            record_unsuccessful_replace(location, script)
            continue
        with open(filename_to_replace[0]) as to_read:
            contents = to_read.readlines()
        incbin_lineno = None
        for i, line in enumerate(contents):
            if line.startswith(location):
                incbin_lineno = i + 1
        if incbin_lineno is None or "incbin" not in contents[incbin_lineno]:
            print(
                f"unable to find {location} incbin in data file {filename_to_replace[0]}"
            )
            # this usually means its already dumped, so ignore
            # record_unsuccessful_replace(location, script)
            continue
        expected_length = int(contents[incbin_lineno].split()[-1], base=16)
        script_length = script.count("PROC") * 8
        if expected_length != script_length:
            print(f"length mismatch for {location}")
            record_unsuccessful_replace(location, script)
            continue
        contents[incbin_lineno] = script + "\n"

        with open(filename_to_replace[0], "w") as to_write:
            to_write.write("".join(contents))
    print("Any unsuccessful script transplants go in ../reject_scripts")
