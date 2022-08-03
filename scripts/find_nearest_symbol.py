#!/usr/bin/python3

import subprocess
import sys


def get_symbols_by_addr():
    symbols = (
        subprocess.check_output(
            ["readelf", "-s", "--wide", "fireemblem8.elf"], stderr=subprocess.PIPE
        )
        .decode()
        .splitlines()
    )
    symbols_by_addr = []
    for line in symbols[3:]:
        value = line.split()[1]
        if len(line.split()) == 8:
            name = line.split()[-1]
            symbols_by_addr.append((int(value, base=16), name))
    symbols_by_addr.sort(key=lambda t: t[0])
    return symbols_by_addr


def get_nearest_match(symbols_by_addr, search):
    if search < 0x1000000:  # ROM address
        search += 0x8000000
    for i, (addr, name) in enumerate(symbols_by_addr):
        if addr > search:
            found = symbols_by_addr[i - 1]
            break
    addr, name = found
    return name, hex(search - addr)


if __name__ == "__main__":
    symbols_by_addr = get_symbols_by_addr()

    search = int(sys.argv[1], base=16)
    if search < 0x1000000:  # ROM address
        search += 0x8000000
    name, distance = get_nearest_match(symbols_by_addr, search)
    print(f"closest symbol: {name}")
    print(f"distance: {distance}")
