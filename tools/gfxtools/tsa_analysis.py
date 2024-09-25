#!/bin/python3

import sys, struct
from collections import Counter
import lzss_lib

def count_and_sort_numbers(numbers):
    counts = Counter(numbers)
    sorted_counts = sorted(counts.items())
    return sorted_counts

def main(args):
    try:
        offset = eval(args[1])
        width  = eval(args[2])
        height = eval(args[3])

    except IndexError:
        sys.exit(f"Usage: {args[0]} <offset> <width> <height>")

    decomped_data = lzss_lib.lz77_decomp_data(offset)
    numbers = [(struct.unpack('<H', decomped_data[i:i+2])[0]) for i in range(0, len(decomped_data), 2)]


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
