#!/usr/bin/python3

# Resolve raw pointers in ddump format to symbols, changing the input file inline

import sys

from dump_proc_cmds import resolve_pointer
from find_nearest_symbol import get_symbols_by_addr, get_nearest_match

if __name__ == "__main__":
    filename = sys.argv[1]
    resolve_nearest = "--nearest" in sys.argv
    symbols_by_addr = get_symbols_by_addr()
    with open(filename) as f:
        contents = f.read()
    table = {}
    i = 0
    for line in contents.split("\n"):
        i += 1
        if i % 1000 == 0:
            print(f"Considered {i} lines")
        if "4byte" not in line:
            continue
        for word in line.split():
            if word.startswith("0x"):
                if word.endswith(","):
                    word = word[:-1]
                value = int(word, base=16)
                if word in table:
                    continue
                pointer = resolve_pointer(value)
                if pointer is not None:
                    table[word] = pointer
                    continue
                # Just get the nearest match and add offset
                nearest, distance = get_nearest_match(symbols_by_addr, value)
                table[word] = f"{nearest} + {distance}"

    for key in table:
        contents = contents.replace(key, table[key])
    with open(filename, "w") as f:
        f.write(contents)
