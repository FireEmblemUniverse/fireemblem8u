#!/usr/bin/python3

# Resolve raw pointers in ddump format to symbols, changing the input file inline

import sys

from dump_proc_cmds import resolve_pointer

if __name__ == "__main__":
    filename = sys.argv[1]
    with open(filename) as f:
        contents = f.read()
    table = {}
    for word in contents.split():
        if word.startswith("0x"):
            if word.endswith(","):
                word = word[:-1]
            value = int(word, base=16)
            pointer = resolve_pointer(value)
            if pointer is not None:
                table[word] = pointer
    for key in table:
        contents = contents.replace(key, table[key])
    with open(filename, "w") as f:
        f.write(contents)
