#!/usr/bin/python3

import struct
import sys


def parse_int(string):
    return int(string.replace(")", "").replace("(", ""), base=16)


def evaluate_expression(expr):
    if expr.count("+") + expr.count("-") > 1:
        return None
    if expr.count("+") + expr.count("-") == 0:
        return parse_int(expr)
    a, op, b = expr.split()
    if op == "+":
        return parse_int(a) + parse_int(b)
    else:
        assert op == "-"
        return parse_int(a) - parse_int(b)


def incbin_to_words(incbin):
    if "," not in incbin and "0x" not in incbin:
        # Likely including a binary file
        return []
    start_expr = incbin.split(",")[1]
    length_expr = incbin.split(",")[2]
    start = evaluate_expression(start_expr)
    length = evaluate_expression(length_expr)
    if length % 4:
        return []
    with open("baserom.gba", "rb") as f:
        f.seek(start)
        buf = f.read(length)
        return [x for (x,) in struct.iter_unpack("<L", buf)]


def contains_pointers(words):
    return len([word for word in words if 0x8000000 <= word <= 0x9000000]) > 1


def string_for_words(words):
    return "\n".join([f"    .4byte {word:#0{10}x}" for word in words])


def test():
    real_words = incbin_to_words('\t.incbin "baserom.gba", 0xA1738C, 0x20')
    expected_words = [
        0x7FFF520E,
        0x2DF25F5D,
        0x7BFD00AA,
        0x739977DC,
        0x67126B56,
        0x59EC5E2D,
        0x4D6951AA,
        0x40E74928,
    ]
    assert real_words == expected_words, real_words

    expressions = incbin_to_words('.incbin "baserom.gba", 0xB126CC + 0x38, 0x50 - 0x38')
    assert len(expressions) == 6

    words_without_pointers = [
        0x7FFF520E,
        0x2DF25F5D,
        0x7BFD00AA,
        0x739977DC,
        0x08A5C900,
    ]
    assert not contains_pointers(words_without_pointers)

    words_with_pointers = [
        0x08F25F5D,
        0x08FD00AA,
        0x739977DC,
        0x08A5C900,
    ]
    assert contains_pointers(words_with_pointers)

    expected_string = """    .4byte 0x08f25f5d
    .4byte 0x08fd00aa
    .4byte 0x739977dc
    .4byte 0x08a5c900"""
    actual_string = string_for_words(words_with_pointers)
    assert expected_string == actual_string, actual_string


def replace_pointer_incbins(in_f, out_f):
    replacements = 0
    for line in in_f:
        if "incbin" in line and "eplacing" not in line:
            words = incbin_to_words(line)
            if contains_pointers(words):
                out_f.write(f"@ Replacing {line.strip()}\n")
                out_f.write(string_for_words(words))
                out_f.write("\n")
                replacements += 1
                continue
        out_f.write(line)
    print(f"Replaced {replacements} incbins")


if __name__ == "__main__":
    if "test" in sys.argv:
        test()
        print("Ok")
        sys.exit(0)
    in_filename = sys.argv[1]
    out_filename = sys.argv[2]
    with open(in_filename, "r") as in_f, open(out_filename, "w") as out_f:
        replace_pointer_incbins(in_f, out_f)
