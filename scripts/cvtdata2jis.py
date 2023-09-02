import os, sys

# Translate Shift-JIS string in ROM

def read_sjis_string(f):
    array = bytearray(b'')

    while True:
        byte = f.read(1)[0]

        if byte == 0:
            break

        array.append(byte)

    return array


def parse_jis(f, addr):
    f.seek(addr & 0x1FFFFFF)
    return read_sjis_string(f).decode('cp932')


def main(args):
    try:
        rom = args[1]
        addr = args[2]
    
    except IndexError:
        sys.exit(f"Usage: {args[0]} fe8.gba $addr")
    
    with open(rom, 'rb') as f:
        string = parse_jis(f, eval(addr))

        print(string)

if __name__ == '__main__':
    main(sys.argv)
