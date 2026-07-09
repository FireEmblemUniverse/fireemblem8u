#!/usr/bin/env python3
"""Convert calcrom progress.txt into an objdiff `report.json` for decomp.dev.

decomp.dev (https://decomp.dev) ingests an objdiff-format report uploaded as a
workflow artifact named `<version>_report` (see build.yml). It needs only the
`measures` block; we derive it from the `scripts/calcrom.sh` output:

    <N> total bytes of code
    <N> bytes of code in src (<P>%)
    <N> total symbols
    <N> symbols documented (<P>%)
    <N> symbols partially documented (<P>%)
    <M> of <N> bytes of data extracted (<P>%)
    <N> functions in total, <M> functions (<P>%) have been decompiled.

matched_code = bytes of code in src (this decomp builds byte-identical, so code in
src is matched code); the asm/ remainder is the only unmatched code. matched_data =
bytes of data extracted out of the raw blobs (src + banim + sound = 100%).
matched_functions = functions decompiled into src.

Per the objdiff report.proto, uint64 measures (total_code/matched_code/total_data/
matched_data) serialize as JSON strings, uint32 measures (total_functions/
matched_functions) as JSON numbers, and *_percent as JSON numbers.

Usage: gen-report.py <progress.txt> <report.json>
"""

import json
import re
import sys


def parse_and_convert(input_text):
    total_code_match = re.search(r"(\d+)\s+total bytes of code", input_text)
    src_code_match = re.search(r"(\d+)\s+bytes of code in src \(([\d.]+)%\)", input_text)

    total_symbols_match = re.search(r"(\d+)\s+total symbols", input_text)
    documented_symbols_match = re.search(
        r"(\d+)\s+symbols documented \(([\d.]+)%\)", input_text
    )
    partially_documented_symbols_match = re.search(
        r"(\d+)\s+symbols partially documented \(([\d.]+)%\)", input_text
    )

    if not (
        total_code_match
        and src_code_match
        and total_symbols_match
        and documented_symbols_match
        and partially_documented_symbols_match
    ):
        raise ValueError("Input text is missing expected calcrom patterns.")

    total_code = int(total_code_match.group(1))
    src_code = int(src_code_match.group(1))
    src_percent = float(src_code_match.group(2))

    measures = {
        # protobuf-JSON: uint64 byte counts are strings, percents are numbers.
        "total_code": str(total_code),
        "matched_code": str(src_code),
        "matched_code_percent": src_percent,
    }

    # Data: 100% extracted = all data pulled out of raw blobs (src + banim + sound).
    data_match = re.search(
        r"(\d+)\s+of\s+(\d+)\s+bytes of data extracted \(([\d.]+)%\)", input_text
    )
    if data_match:
        measures["total_data"] = str(int(data_match.group(2)))
        measures["matched_data"] = str(int(data_match.group(1)))
        measures["matched_data_percent"] = float(data_match.group(3))

    # Functions decompiled into src. uint32 -> JSON numbers.
    fn_match = re.search(
        r"(\d+)\s+functions in total,\s+(\d+)\s+functions\s+\(([\d.]+)%\)\s+have been decompiled",
        input_text,
    )
    if fn_match:
        measures["total_functions"] = int(fn_match.group(1))
        measures["matched_functions"] = int(fn_match.group(2))
        measures["matched_functions_percent"] = float(fn_match.group(3))

    return {"measures": measures}


def main():
    if len(sys.argv) != 3:
        print("Usage: gen-report.py <input_file> <output_file>")
        sys.exit(1)

    with open(sys.argv[1], "r") as f:
        input_text = f.read()

    try:
        output_data = parse_and_convert(input_text)
    except ValueError as e:
        print(f"Error: {e}")
        sys.exit(1)

    with open(sys.argv[2], "w") as f:
        json.dump(output_data, f, indent=2)


if __name__ == "__main__":
    main()
