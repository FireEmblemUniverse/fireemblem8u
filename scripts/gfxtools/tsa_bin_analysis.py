#!/bin/python3

import sys, struct
from collections import Counter

def read_bin_file(filename):
    with open(filename, 'rb') as f:
        data = f.read()
        numbers = [(struct.unpack('<H', data[i:i+2])[0] & 0x3FF) for i in range(0, len(data), 2)]
    return numbers

def main(args):
    try:
        filename = args[1]
        width    = eval(args[2])
        height   = eval(args[3])

    except IndexError:
        sys.exit(f"Usage: {args[0]} <offset> <width> <height>")

    numbers = read_bin_file(filename)

    n_cols = width // 8

    for col in range(n_cols):
        x_start = 8 * col
        x_end   = 8 * col + 8
        print(f"[col: {col}]")

        for y in range(height):
            for x in range(x_start, x_end):
                idx = y * width + x
                # print(f"[{x}, {y}] = ", end="")
                tile   = numbers[idx]
                tile_0 = numbers[0]
                if tile == tile_0:
                    # print("       ", end="")
                    print(f"  {numbers[idx]:04X}", end=" ")
                else:
                    print(f"0x{numbers[idx]:04X}", end=" ")

            print("")

if __name__ == '__main__':
    main(sys.argv)
