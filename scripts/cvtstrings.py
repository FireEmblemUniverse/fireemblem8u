import sys, re
from datetime import date

def read_sjis_string(f):
    array = bytearray(b'')

    while True:
        byte = f.read(1)[0]

        if byte == 0:
            break

        array.append(byte)

    return array

def parse_string_locations(f):
    names = {}
    overwrites = {}

    for line in f.readlines():
        line = line[:line.find("#")]
        line = line.strip()

        if len(line) == 0:
            continue

        if True:
            # look for overwrite

            m = re.match(r"(?P<addr>\w{8})\s+(?P<name>[a-zA-Z0-9_]+)\s+\"(?P<overwrite>.*)\"", line)

            if m:
                addr = int(m.group('addr'), base = 16)
                name = m.group('name')
                overwrite = m.group('overwrite')
                names[addr] = f"UString_{name}"
                overwrites[addr] = overwrite

                continue

        m = re.match(r"(?P<addr>\w{8})\s+(?P<name>[a-zA-Z0-9_]+)", line)

        if m:
            addr = int(m.group('addr'), base = 16)
            name = m.group('name')
            names[addr] = f"UString_{name}"

    return (names, overwrites)

def main(args):
    try:
        rom_gba = args[1]
        str_txt = args[2]

    except IndexError:
        sys.exit(f"Usage: {args[0]} fe8.gba str.txt")

    with open(str_txt, 'r') as f:
        string_locations, string_overwrites = parse_string_locations(f)

    print(f"    .section .rodata")
    print(f"")

    with open(rom_gba, 'rb') as f:
        for str_addr in string_locations:
            str_name = string_locations[str_addr]

            f.seek(str_addr & 0x1FFFFFF)
            orig_string = read_sjis_string(f).decode('cp932')

            string = string_overwrites[str_addr] if str_addr in string_overwrites else orig_string

            print(f"    .global {str_name}")
            print(f"    .type {str_name}, object")
            print(f"{str_name}: @ '{orig_string}'")
            print(f"    .asciz \"{string}\"")
            print(f"")

    print(f"    .global DateCvtStringsBuilt")
    print(f"    .type DateCvtStringsBuilt, object")
    print(f"DateCvtStringsBuilt:")
    print(f"    .asciz \"{date.today()}\"")
    print(f"")

if __name__ == '__main__':
    main(sys.argv)
