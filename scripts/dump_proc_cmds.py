#!/usr/bin/python3

import struct
import subprocess
import sys

PROC_OPCODES = {
    "PROC_END": 0x00,
    "PROC_NAME": 0x01,
    "PROC_CALL": 0x02,
    "PROC_REPEAT": 0x03,
    "PROC_SET_END_CB": 0x04,
    "PROC_START_CHILD": 0x05,
    "PROC_START_CHILD_BLOCKING": 0x06,
    "PROC_START_MAIN_BUGGED": 0x07,
    "PROC_WHILE_EXISTS": 0x08,
    "PROC_END_EACH": 0x09,
    "PROC_BREAK_EACH": 0x0A,
    "PROC_LABEL": 0x0B,
    "PROC_GOTO": 0x0C,
    "PROC_JUMP": 0x0D,
    "PROC_SLEEP": 0x0E,
    "PROC_MARK": 0x0F,
    "PROC_BLOCK": 0x10,
    "PROC_END_IF_DUPLICATE": 0x11,
    "PROC_SET_BIT4": 0x12,
    "PROC_13": 0x13,
    "PROC_WHILE": 0x14,
    "PROC_15": 0x15,
    "PROC_CALL_2": 0x16,
    "PROC_END_DUPLICATES": 0x17,
    "PROC_CALL_ARG": 0x18,
    "PROC_19": 0x19,
    "PROC_YIELD": 0x0E,
}


def make_simple_proc(name, dataImm, dataPtr):
    if dataImm != 0 or dataPtr != 0:
        return None
    return (name, None, None)


def make_pointer_proc(name, dataImm, expImm, dataPtr):
    if dataImm != expImm:
        return None
    return (name, None, dataPtr)


def make_label_proc(name, dataImm, dataPtr):
    if dataPtr != 0:
        return None
    return (name, dataImm, None)


def decode_proc_cmd(cmd):
    opcode, dataImm, dataPtr = struct.unpack("<hhl", cmd)
    if opcode == 0:
        return make_simple_proc("PROC_END", dataImm, dataPtr)
    if opcode == 1:
        return make_pointer_proc("PROC_NAME", dataImm, 0, dataPtr)
    if opcode == 2:
        return make_pointer_proc("PROC_CALL", dataImm, 0, dataPtr)
    if opcode == 3:
        return make_pointer_proc("PROC_REPEAT", dataImm, 0, dataPtr)
    if opcode == 4:
        return make_pointer_proc("PROC_SET_END_CB", dataImm, 0, dataPtr)
    if opcode == 5:
        return make_pointer_proc("PROC_START_CHILD", dataImm, 0, dataPtr)
    if opcode == 6:
        return make_pointer_proc("PROC_START_CHILD_BLOCKING", dataImm, 1, dataPtr)
    if opcode == 7:
        return make_pointer_proc("PROC_START_MAIN_BUGGED", dataImm, 0, dataPtr)
    if opcode == 8:
        return make_pointer_proc("PROC_WHILE_EXISTS", dataImm, 0, dataPtr)
    if opcode == 9:
        return make_pointer_proc("PROC_END_EACH", dataImm, 0, dataPtr)
    if opcode == 0xA:
        return make_pointer_proc("PROC_BREAK_EACH", dataImm, 0, dataPtr)
    if opcode == 0xB:
        return make_label_proc("PROC_LABEL", dataImm, dataPtr)
    if opcode == 0xC:
        return make_label_proc("PROC_GOTO", dataImm, dataPtr)
    if opcode == 0xD:
        return make_pointer_proc("PROC_JUMP", dataImm, 0, dataPtr)
    if opcode == 0xE:
        if dataImm == 0 and dataPtr == 0:
            return ("PROC_YIELD", None, None)
        return make_label_proc("PROC_SLEEP", dataImm, dataPtr)
    if opcode == 0xF:
        return make_label_proc("PROC_MARK", dataImm, dataPtr)
    if opcode == 0x10:
        return make_simple_proc("PROC_BLOCK", dataImm, dataPtr)
    if opcode == 0x11:
        return make_simple_proc("PROC_END_IF_DUPLICATE", dataImm, dataPtr)
    if opcode == 0x12:
        return make_simple_proc("PROC_SET_BIT4", dataImm, dataPtr)
    if opcode == 0x13:
        return make_simple_proc("PROC_13", dataImm, dataPtr)
    if opcode == 0x14:
        return make_pointer_proc("PROC_WHILE", dataImm, 0, dataPtr)
    if opcode == 0x15:
        return make_simple_proc("PROC_15", dataImm, dataPtr)
    if opcode == 0x16:
        return make_pointer_proc("PROC_CALL_2", dataImm, 0, dataPtr)
    if opcode == 0x17:
        return make_simple_proc("PROC_END_DUPLICATES", dataImm, dataPtr)
    if opcode == 0x18:
        return ("PROC_CALL_ARG", dataImm, dataPtr)
    if opcode == 0x19:
        return make_simple_proc("PROC_19", dataImm, dataPtr)
    return None


def proc_contains_valid_pointer(proc):
    for _, _, dataPtr in proc:
        if dataPtr is not None and 0x8000000 <= dataPtr <= 0x9000000:
            return True
    return False


def assert_eq(a, b):
    assert a == b, f"{a} != {b}"


def test_decode():
    assert_eq(
        decode_proc_cmd(b"\x00\x00\x00\x00\x00\x00\x00\x00"), ("PROC_END", None, None)
    )
    assert_eq(decode_proc_cmd(b"\x00\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(decode_proc_cmd(b"\x00\x00\x00\x00\x00\x00\x01\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x01\x00\x00\x00\x00\x00\x00\x01"),
        ("PROC_NAME", None, 0x1000000),
    )
    assert_eq(decode_proc_cmd(b"\x01\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x02\x00\x00\x00\x12\x34\x56\x78"),
        ("PROC_CALL", None, 0x78563412),
    )
    assert_eq(decode_proc_cmd(b"\x02\x00\x01\x00\x12\x34\x56\x78"), None)
    assert_eq(
        decode_proc_cmd(b"\x03\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_REPEAT", None, 0x12),
    )
    assert_eq(
        decode_proc_cmd(b"\x04\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_SET_END_CB", None, 0x12),
    )
    assert_eq(
        decode_proc_cmd(b"\x05\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_START_CHILD", None, 0x12),
    )
    assert_eq(
        decode_proc_cmd(b"\x06\x00\x01\x00\x12\x00\x00\x00"),
        ("PROC_START_CHILD_BLOCKING", None, 0x12),
    )
    assert_eq(decode_proc_cmd(b"\x06\x00\x00\x00\x12\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x07\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_START_MAIN_BUGGED", None, 0x12),
    )
    assert_eq(
        decode_proc_cmd(b"\x08\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_WHILE_EXISTS", None, 0x12),
    )
    assert_eq(
        decode_proc_cmd(b"\x09\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_END_EACH", None, 0x12),
    )
    assert_eq(
        decode_proc_cmd(b"\x0a\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_BREAK_EACH", None, 0x12),
    )
    assert_eq(decode_proc_cmd(b"\x0b\x00\x00\x00\x12\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x0b\x00\x10\x00\x00\x00\x00\x00"), ("PROC_LABEL", 0x10, None)
    )
    assert_eq(
        decode_proc_cmd(b"\x0c\x00\x10\x00\x00\x00\x00\x00"), ("PROC_GOTO", 0x10, None)
    )
    assert_eq(decode_proc_cmd(b"\x0d\x00\x10\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x0d\x00\x00\x00\x00\x10\x00\x00"),
        ("PROC_JUMP", None, 0x1000),
    )
    assert_eq(decode_proc_cmd(b"\x0e\x00\x00\x00\x12\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x0e\x00\x10\x00\x00\x00\x00\x00"), ("PROC_SLEEP", 0x10, None)
    )
    assert_eq(decode_proc_cmd(b"\x0f\x00\x00\x00\x12\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x0f\x00\x10\x00\x00\x00\x00\x00"), ("PROC_MARK", 0x10, None)
    )
    assert_eq(
        decode_proc_cmd(b"\x10\x00\x00\x00\x00\x00\x00\x00"), ("PROC_BLOCK", None, None)
    )
    assert_eq(decode_proc_cmd(b"\x10\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x11\x00\x00\x00\x00\x00\x00\x00"),
        ("PROC_END_IF_DUPLICATE", None, None),
    )
    assert_eq(decode_proc_cmd(b"\x11\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x12\x00\x00\x00\x00\x00\x00\x00"),
        ("PROC_SET_BIT4", None, None),
    )
    assert_eq(decode_proc_cmd(b"\x12\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x13\x00\x00\x00\x00\x00\x00\x00"), ("PROC_13", None, None)
    )
    assert_eq(decode_proc_cmd(b"\x13\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x14\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_WHILE", None, 0x12),
    )
    assert_eq(
        decode_proc_cmd(b"\x15\x00\x00\x00\x00\x00\x00\x00"), ("PROC_15", None, None)
    )
    assert_eq(decode_proc_cmd(b"\x15\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x16\x00\x00\x00\x12\x00\x00\x00"),
        ("PROC_CALL_2", None, 0x12),
    )
    assert_eq(
        decode_proc_cmd(b"\x17\x00\x00\x00\x00\x00\x00\x00"),
        ("PROC_END_DUPLICATES", None, None),
    )
    assert_eq(decode_proc_cmd(b"\x17\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x18\x00\x00\x04\x12\x34\x00\x00"),
        ("PROC_CALL_ARG", 0x400, 0x3412),
    )
    assert_eq(
        decode_proc_cmd(b"\x19\x00\x00\x00\x00\x00\x00\x00"), ("PROC_19", None, None)
    )
    assert_eq(decode_proc_cmd(b"\x19\x00\x01\x00\x00\x00\x00\x00"), None)
    assert_eq(
        decode_proc_cmd(b"\x0e\x00\x00\x00\x00\x00\x00\x00"), ("PROC_YIELD", None, None)
    )


def test_valid_pointer():
    proc1 = [
        ("PROC_19", None, None),
        ("PROC_SLEEP", 10, None),
        ("PROC_CALL", None, 0x100),
        ("PROC_WHILE", None, 0x9000001),
    ]
    assert not proc_contains_valid_pointer(proc1), proc1
    proc2 = [
        ("PROC_19", None, None),
        ("PROC_NAME", None, 0x80301B9),
        ("PROC_END", None, None),
    ]
    assert proc_contains_valid_pointer(proc2), proc2


def resolve_pointer(dataPtr):
    ptr_string = hex(dataPtr)[2:]
    symbols = (
        subprocess.check_output(
            ["readelf", "-s", "--wide", "fireemblem8.elf"], stderr=subprocess.PIPE
        )
        .decode()
        .splitlines()
    )
    for line in symbols:
        if ptr_string in line:
            sym = line.split()[-1]
            if len(sym) > 2:

                return sym
    return None


def test_resolve_pointer():
    assert_eq(resolve_pointer(0x80311A9), "RefreshBMapGraphics")
    assert_eq(resolve_pointer(0x80311AA), None)
    assert_eq(resolve_pointer(0xB12C14), "gUnknown_08B12C14")
    assert_eq(resolve_pointer(0x591304), "gUnknown_08591304")
    # long names aren't complete in the elf. make sure to find the right one
    assert_eq(resolve_pointer(0x8014069), "ContinueUntilSomeTransistion6CExists")


def read_procs(f, start_off, end_off):
    procs_found = []
    length = end_off - start_off
    current_off = start_off
    current_script = []
    current_script_start = 0
    f.seek(start_off)
    while current_off <= end_off - 8:
        cmd = f.read(8)
        proc = decode_proc_cmd(cmd)
        if proc is None:
            current_script_start = 0
            current_script = []
        elif proc[0] != "PROC_END":
            if current_script_start == 0:
                current_script_start = current_off
            current_script.append(proc)
        else:
            assert proc[0] == "PROC_END"
            if current_script:
                current_script.append(proc)
                if proc_contains_valid_pointer(current_script):
                    procs_found.append((current_script_start, current_script[:]))
                current_script_start = 0
                current_script = []

        current_off += 8
    return procs_found


def smoketest():
    with open("baserom.gba", "rb") as f:
        procs = read_procs(f, 0xB12C14, 0xB12C6C)
        assert_eq(
            procs,
            [
                (
                    0xB12C14,
                    [
                        ("PROC_NAME", None, 136343888),
                        ("PROC_SLEEP", 1, None),
                        ("PROC_CALL", None, 135062409),
                        ("PROC_CALL", None, 135062245),
                        ("PROC_END", None, None),
                    ],
                ),
                (
                    0xB12C3C,
                    [
                        ("PROC_NAME", None, 136343912),
                        ("PROC_SLEEP", 1, None),
                        ("PROC_CALL", None, 135063901),
                        ("PROC_REPEAT", None, 135064041),
                        ("PROC_END", None, None),
                    ],
                ),
            ],
        )


def resolve_and_format_command(cmd):
    # Resolve pointers in command, and return it in a string format that can be pasted into .s files
    name, imm, ptr = cmd
    if imm is not None:
        imm_str = hex(imm)
    else:
        if name == "PROC_START_CHILD_BLOCKING":
            imm_str = "0x1"
        else:
            imm_str = "0x0"
    if ptr is None:
        ptr_string = "0x0"
    else:
        resolved = resolve_pointer(ptr)
        ptr_string = resolved or hex(ptr)
    code = PROC_OPCODES[name]
    return f"""\
        @ {name}
        .short {hex(code)}, {imm_str}
        .word {ptr_string}"""


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: either test or specify a data symbol to read as proc script")
        sys.exit(1)
    if sys.argv[1] == "test":
        test_decode()
        test_valid_pointer()
        test_resolve_pointer()
        smoketest()
        print("Ok")
    else:
        with open("baserom.gba", "rb") as f:
            start_off = int(sys.argv[1], base=16)
            end_off = int(sys.argv[2], base=16)
            procs = read_procs(f, start_off, end_off)
            for start, proc in procs:
                symbol = resolve_pointer(start)
                start_str = symbol or hex(start)
                print(f"Found script at {start_str}")
                for cmd in proc:
                    print(resolve_and_format_command(cmd))
