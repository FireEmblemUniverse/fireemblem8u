#!/bin/python3

import os, json, argparse, sys

def revert_lines(in_f, height, width):
    lines_count = height + 1
    line_bytes_count = (width + 1) * 2
    lines = bytearray(lines_count * line_bytes_count)
    for y in range(lines_count):
        base_index = (height - y) * line_bytes_count
        line = in_f.read(line_bytes_count)
        for x in range(line_bytes_count):
            lines[base_index + x] = line[x]
    return lines

def tsa2tmap(tsa_f, tm_f, json_f, tm_file_name):
    width = tsa_f.read(1)[0]
    height = tsa_f.read(1)[0]
    tsa_struct = {
        "width": width,
        "height": height,
        "tilemap": os.path.basename(tm_file_name),
    }
    json_f.write(json.dumps(tsa_struct))
    tm_f.write(revert_lines(tsa_f, height, width))

def tmap2tsa(tsa_f, tm_f, height, width):
    tsa_f.write(bytes([width, height]))
    tsa_f.write(revert_lines(tm_f, height, width))

if __name__ == "__main__":
    usage = f"{sys.argv[0]} <tilemap file> <output file> --width x --height y"
    parser = argparse.ArgumentParser(usage=usage)
    parser.add_argument("tm_path", help="input file containing tilemap data")
    parser.add_argument("out_path", help="output file")
    parser.add_argument("--width", help="width of tilemap, zero-based", type=int, required=True)
    parser.add_argument("--height", help="height of tilemap, zero-based", type=int, required=True)
    try:
        args = parser.parse_args()
    except IndexError:
        sys.exit(parser.usage)

    with open(args.tm_path, "rb") as tm_f, open(args.out_path, "wb") as tsa_f:
        tmap2tsa(tsa_f, tm_f, args.height, args.width)