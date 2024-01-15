#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys

def gen_tokens(string):
    pos = 0

    string = string.strip()

    while len(string) > 0:
        if string[0] == '"':
            pos = string.find('"', 1)

            if pos < 0:
                yield string[1:]
                break

            yield string[1:pos]
            string = string[(pos+2):]

        else:
            pos = string.find(' ', 1)

            if pos < 0:
                yield string[:]
                break

            yield string[0:pos]
            string = string[(pos+1):]

        string = string.strip()

def main(args):
    with open(args[1], 'r') as f:
        for line in f.readlines():
            line = line.strip()

            if (len(line) == 0):
                continue

            tokens = gen_tokens(line)

            name = next(tokens)
            nop = next(tokens)
            val = next(tokens)

            print(f'\t{val}: "{name}",')

if __name__ == '__main__':
    main(sys.argv)
