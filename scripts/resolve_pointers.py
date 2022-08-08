#!/usr/bin/python3

# Resolve raw pointers in ddump format to symbols, changing the input file inline

import json
import subprocess
import sys

from dump_proc_cmds import resolve_pointer
from find_nearest_symbol import get_symbols_by_addr, get_nearest_match


class SymChecker:
    def __init__(self):
        self.cache = {}

    def is_good_symbol(self, sym):
        if sym.startswith("$"):
            return False
        if sym.startswith("_"):
            return False
        if sym in self.cache:
            return self.cache[sym]
        ret = sym_in_dir(sym, "include") or sym_is_global(sym)
        self.cache[sym] = ret
        return ret


def sym_in_dir(sym, path):
    return subprocess.run(["rg", sym, path], stdout=subprocess.PIPE).returncode == 0


def sym_is_global(sym):
    return (
        subprocess.run(["rg", f"\.global.*{sym}"], stdout=subprocess.PIPE).returncode
        == 0
    )


if __name__ == "__main__":
    filename = sys.argv[1]
    careful = "--careful" in sys.argv
    exact = "--exact" in sys.argv
    symbols_by_addr = get_symbols_by_addr()
    symbols_map = {}
    symbol_checker = SymChecker()
    for addr, symbol, _ in symbols_by_addr:
        symbols_map[addr] = symbol
    with open("../symbol_map.json", "w") as f:
        json.dump(symbols_map, f)
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
                if value == 0:
                    continue
                if careful and (value < 0x8000000 or value > 0x9000000):
                    continue
                if word in table:
                    continue
                if value in symbols_map:
                    if symbol_checker.is_good_symbol(symbols_map[value]):
                        table[word] = symbols_map[value]
                    continue
                if exact:
                    continue
                # not exact - just get the nearest match and add offset
                match = get_nearest_match(symbols_by_addr, value)
                if match is not None:
                    nearest, distance = match
                    if symbol_checker.is_good_symbol(nearest):
                        table[word] = f"{nearest} + {distance}"

    with open("../replacements.json", "w") as f:
        json.dump(table, f)
    for key in table:
        contents = contents.replace(key, table[key])
    with open(filename, "w") as f:
        f.write(contents)
