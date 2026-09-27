#!/usr/bin/env python3
"""Inventory source-backed native code load paths in the linked FE8U image.

This is a bounded loader audit, not a proof of arbitrary indirect reachability.
It reads the current ELF/map/ROM and authored sources, then writes the JSON and
Markdown receipts under docs/. It never invokes the build system.
"""

from __future__ import annotations

import hashlib
import json
import re
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ROM_PATH = ROOT / "fireemblem8.gba"
REFERENCE_ROM_PATH = ROOT / "baserom.gba"
ELF_PATH = ROOT / "fireemblem8.elf"
MAP_PATH = ROOT / "fireemblem8.map"
OUTPUT_JSON = ROOT / "docs/native-load-paths.json"
OUTPUT_MD = ROOT / "docs/native-load-paths.md"
ROM_BASE = 0x08000000


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def need(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit("audit failed: " + message)


def read(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def evidence(path: str, needle: str) -> dict[str, object]:
    rel = Path(path)
    lines = read(ROOT / rel).splitlines()
    for number, line in enumerate(lines, 1):
        if needle in line:
            return {"path": path, "line": number, "text": line.strip()}
    raise SystemExit(f"audit failed: {needle!r} not found in {path}")


def read_symbols(elf_path: Path = ELF_PATH) -> dict[str, dict[str, int | str]]:
    output = subprocess.check_output(
        ["arm-none-eabi-nm", "-n", "-S", "--defined-only", str(elf_path)],
        text=True,
    )
    symbols: dict[str, dict[str, int | str]] = {}
    for line in output.splitlines():
        fields = line.split()
        if len(fields) == 4:
            address, size, kind, name = fields
            symbols[name] = {
                "address": int(address, 16),
                "size": int(size, 16),
                "kind": kind,
            }
        elif len(fields) == 3:
            address, kind, name = fields
            symbols[name] = {"address": int(address, 16), "kind": kind}
    return symbols


def symbol(symbols: dict[str, dict[str, int | str]], name: str) -> int:
    need(name in symbols, "missing linked symbol " + name)
    return int(symbols[name]["address"])


def source_mentions(token: str) -> list[dict[str, object]]:
    found = []
    authored_paths = []
    for directory in (ROOT / "src", ROOT / "include"):
        authored_paths.extend(path for path in directory.rglob("*") if path.suffix in (".c", ".h"))
    authored_paths.extend(path for path in (ROOT / "asm").rglob("*") if path.suffix in (".s", ".S"))
    for path in sorted(authored_paths):
        for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            if re.search(r"\b" + re.escape(token) + r"\b", line):
                found.append(
                    {"path": str(path.relative_to(ROOT)), "line": number, "text": line.strip()}
                )
    return found


def split_call_arguments(text: str, open_paren: int) -> tuple[list[str], int] | None:
    """Return top-level C call arguments and the closing-paren index."""
    arguments: list[str] = []
    argument_start = open_paren + 1
    depth = 0
    quote: str | None = None
    index = argument_start
    while index < len(text):
        char = text[index]
        following = text[index + 1] if index + 1 < len(text) else ""
        if quote:
            if char == "\\":
                index += 2
                continue
            if char == quote:
                quote = None
        elif char in ("'", '"'):
            quote = char
        elif char == "/" and following == "/":
            newline = text.find("\n", index + 2)
            index = len(text) if newline < 0 else newline
            continue
        elif char == "/" and following == "*":
            end = text.find("*/", index + 2)
            index = len(text) if end < 0 else end + 2
            continue
        elif char == "(":
            depth += 1
        elif char == ")":
            if depth == 0:
                tail = text[argument_start:index].strip()
                if tail or arguments:
                    arguments.append(tail)
                return arguments, index
            depth -= 1
        elif char == "," and depth == 0:
            arguments.append(text[argument_start:index].strip())
            argument_start = index + 1
        index += 1
    return None


def native_destination_callsites(native_buffer_names: tuple[str, ...]) -> list[dict[str, object]]:
    """Find authored C copy/decompression calls with a literal named destination."""
    functions = (
        "CpuCopy16",
        "CpuCopy32",
        "CpuFastCopy",
        "CpuSet",
        "CpuFastSet",
        "Decompress",
        "LZ77UnCompWram",
        "LZ77UnCompVram",
        "HuffUnComp",
        "RLUnCompWram",
        "RLUnCompVram",
    )
    call_pattern = re.compile(r"\b(?:" + "|".join(functions) + r")\s*\(")
    destination_pattern = re.compile(r"\b(?:" + "|".join(map(re.escape, native_buffer_names)) + r")\b")
    results = []
    authored_c = []
    for directory in (ROOT / "src", ROOT / "mgfembp/src"):
        authored_c.extend(directory.rglob("*.c"))
    for path in sorted(authored_c):
        text = path.read_text(encoding="utf-8")
        for match in call_pattern.finditer(text):
            call_name = re.match(r"[A-Za-z0-9_]+", match.group(0)).group(0)
            parsed = split_call_arguments(text, text.find("(", match.start(), match.end()))
            if not parsed:
                continue
            arguments, close_paren = parsed
            if len(arguments) < 2:
                continue
            destination = arguments[1]
            buffers = destination_pattern.findall(destination)
            if not buffers:
                continue
            results.append(
                {
                    "path": str(path.relative_to(ROOT)),
                    "line": text.count("\n", 0, match.start()) + 1,
                    "call": call_name,
                    "destination_expression": destination,
                    "native_buffers": sorted(set(buffers)),
                    "text": text[match.start() : close_paren + 1].replace("\n", " ").strip(),
                }
            )
    return results


def source_line(path: str, line: int) -> str:
    return f"[{path}:{line}](../{path}#L{line})"


def main() -> None:
    for path in (ROM_PATH, REFERENCE_ROM_PATH, ELF_PATH, MAP_PATH):
        need(path.is_file(), "required linked artifact missing: " + str(path.name))

    rom = ROM_PATH.read_bytes()
    reference_rom = REFERENCE_ROM_PATH.read_bytes()
    map_text = MAP_PATH.read_text(encoding="utf-8")
    symbols = read_symbols()
    need(len(rom) == 0x1000000, "expected a 16 MiB USA ROM")
    need(rom == reference_rom, "current ROM differs from baserom.gba")

    # Fixed startup and runtime-native copies.
    irq_source = symbol(symbols, "IrqMain")
    irq_copy = 0x200 * 4
    irq_destination = symbol(symbols, "IntrMain_Buffer")
    routines_source = symbol(symbols, "ARMCodeToCopy_Start")
    routines_end = symbol(symbols, "ARMCodeToCopy_End")
    routines_destination = symbol(symbols, "gUnk_68")
    routines_bytes = routines_end - routines_source
    mixer_source = symbol(symbols, "SoundMainRAM") & ~1
    mixer_end = symbol(symbols, "SoundMainRAM_End")
    mixer_buffer = symbol(symbols, "SoundMainRAM_Buffer")
    mixer_copy = int(symbols["SoundMainRAM_Buffer"]["size"])
    mixer_native_bytes = mixer_end - mixer_source
    mixer_copy_end = mixer_source + mixer_copy
    need(routines_bytes == 0x7F8, "unexpected ARMCodeToCopy size")
    need(mixer_native_bytes == 0x3A4, "unexpected linked SoundMainRAM extent")
    need(mixer_copy == 0x400, "unexpected SoundMainRAM_Buffer capacity")
    need(irq_destination == 0x03004160, "unexpected IRQ buffer address")
    need(routines_destination == 0x03003750, "unexpected ARM routine buffer address")
    need(mixer_buffer == 0x03002C60, "unexpected mixer buffer address")
    need(0 <= irq_source - ROM_BASE <= len(rom) - irq_copy, "IRQ source span outside ROM")
    need(0 <= routines_source - ROM_BASE <= len(rom) - routines_bytes, "routine source span outside ROM")
    need(0 <= mixer_source - ROM_BASE <= len(rom) - mixer_copy, "mixer source span outside ROM")

    mixer_section_rows = []
    for match in re.finditer(
        r"(?m)^\s+\.text\s+(0x[0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(src/m4a_[^\s]+\.o)$",
        map_text,
    ):
        address, size = (int(value, 16) for value in match.group(1, 2))
        end = address + size
        overlap_start = max(address, mixer_source)
        overlap_end = min(end, mixer_copy_end)
        if overlap_start < overlap_end:
            obj = match.group(3)
            source_c = ROOT / (obj[:-2] + ".c")
            source_s = ROOT / (obj[:-2] + ".s")
            source_owner = str((source_c if source_c.is_file() else source_s).relative_to(ROOT))
            mixer_section_rows.append(
                {
                    "object": obj,
                    "source_owner": source_owner,
                    "section_start": hex(address),
                    "section_bytes": size,
                    "copied_overlap_start": hex(overlap_start),
                    "copied_bytes": overlap_end - overlap_start,
                    "native_bytes": max(0, min(end, mixer_end) - max(address, mixer_source)),
                    "copied_tail_bytes": max(0, min(end, mixer_copy_end) - max(address, mixer_end)),
                }
            )
    need(sum(row["native_bytes"] for row in mixer_section_rows) == mixer_native_bytes, "map sections do not cover full native mixer extent")
    need(sum(row["copied_tail_bytes"] for row in mixer_section_rows) == mixer_copy - mixer_native_bytes, "map sections do not cover full copied mixer tail")
    need(all(row["source_owner"].endswith(".c") and (ROOT / row["source_owner"]).is_file() for row in mixer_section_rows), "mixer map owner lacks its C source")
    mixer_native_owners = list(dict.fromkeys(row["source_owner"] for row in mixer_section_rows if row["native_bytes"]))
    mixer_tail_owners = [
        {"object": row["object"], "source_owner": row["source_owner"], "copied_bytes": row["copied_tail_bytes"]}
        for row in mixer_section_rows
        if row["copied_tail_bytes"]
    ]

    # SRAM fast paths manually copy source-bounded Thumb code into IWRAM.
    main_sram_read_start = symbol(symbols, "ReadSramFast_Core")
    main_sram_read_end = symbol(symbols, "WriteSramFast")
    main_sram_verify_start = symbol(symbols, "VerifySramFast_Core")
    main_sram_verify_end = symbol(symbols, "SetSramFastFunc")
    main_sram_read_dest = symbol(symbols, "readSramFast_Work")
    main_sram_verify_dest = symbol(symbols, "verifySramFast_Work")
    main_sram_read_bytes = main_sram_read_end - main_sram_read_start
    main_sram_verify_bytes = main_sram_verify_end - main_sram_verify_start
    need(main_sram_read_bytes == 0x40, "unexpected main SRAM read-copy extent")
    need(main_sram_verify_bytes == 0x4C, "unexpected main SRAM verify-copy extent")
    need(main_sram_read_dest == 0x03002B08, "unexpected main SRAM read buffer")
    need(main_sram_verify_dest == 0x03002A68, "unexpected main SRAM verify buffer")
    need(0 <= main_sram_read_start - ROM_BASE <= len(rom) - main_sram_read_bytes, "main SRAM read source span outside ROM")
    need(0 <= main_sram_verify_start - ROM_BASE <= len(rom) - main_sram_verify_bytes, "main SRAM verify source span outside ROM")

    # The FE6 serial companion is a compressed ROM asset with a separate source tree.
    section = re.search(
        r"(?ms)asm/fe6sio\.o\(\.data\.after_reset\)\s*\n\s*\.data\.after_reset\s*\n\s*0x([0-9a-fA-F]+)\s+0x([0-9a-fA-F]+)\s+asm/fe6sio\.o",
        map_text,
    )
    need(section is not None, "cannot locate FE6 after-reset linker section")
    fe6_section_start, fe6_section_size = (int(part, 16) for part in section.groups())
    payload = (ROOT / "fe6sio_payload.bin.lz").read_bytes()
    fe6_payload_start = fe6_section_start + 0x100
    need(fe6_section_size == 0x100 + len(payload), "FE6 section/payload extent changed")
    need(
        rom[fe6_payload_start - ROM_BASE : fe6_payload_start - ROM_BASE + len(payload)] == payload,
        "primary FE6 compressed payload bytes do not match the included source asset",
    )

    duplicate_receipt = json.loads(read(ROOT / "docs/duplicate-executable-content.json"))
    duplicate_payload = duplicate_receipt["compressed_payload"]
    need(duplicate_receipt["rom_sha256"] == digest(rom), "duplicate-content receipt is stale")
    need(int(duplicate_payload["source"], 16) == fe6_payload_start, "payload receipt source moved")
    need(int(duplicate_payload["bytes"]) == len(payload), "payload receipt extent changed")
    duplicate_start = int(duplicate_payload["duplicate"], 16)
    need(
        rom[duplicate_start - ROM_BASE : duplicate_start - ROM_BASE + len(payload)] == payload,
        "verified FE6 duplicate no longer matches the compressed source asset",
    )

    # The expanded FE6 companion has its own ROM-to-IWRAM function copies.
    payload_elf_path = ROOT / "mgfembp/mgfembp.elf"
    payload_map_path = ROOT / "mgfembp/mgfembp.map"
    payload_bin_path = ROOT / "mgfembp/mgfembp.bin"
    for path in (payload_elf_path, payload_map_path, payload_bin_path):
        need(path.is_file(), "missing built FE6 payload artifact: " + str(path.relative_to(ROOT)))
    payload_bin = payload_bin_path.read_bytes()
    payload_symbols = read_symbols(payload_elf_path)
    payload_map_text = payload_map_path.read_text(encoding="utf-8")
    payload_base = 0x02010000
    need(len(payload_bin) == int(duplicate_payload["expanded_bytes"]), "expanded FE6 payload size changed")
    need(digest(payload_bin) == duplicate_payload["expanded_sha256"], "expanded FE6 payload differs from duplicate receipt")

    compile_provenance_path = ROOT / "docs/compile-provenance.json"
    need(compile_provenance_path.is_file(), "missing fresh-source compile provenance receipt")
    compile_provenance = json.loads(read(compile_provenance_path))
    main_provenance = compile_provenance["images"]["main_rom"]
    payload_provenance = compile_provenance["images"]["mgfembp"]
    need(main_provenance["elf_sha256"] == digest(ELF_PATH.read_bytes()), "main compile-provenance ELF hash is stale")
    need(main_provenance["map_sha256"] == digest(map_text.encode()), "main compile-provenance map hash is stale")
    need(payload_provenance["elf_sha256"] == digest(payload_elf_path.read_bytes()), "MGFEMBP compile-provenance ELF hash is stale")
    need(payload_provenance["map_sha256"] == digest(payload_map_text.encode()), "MGFEMBP compile-provenance map hash is stale")
    main_compiled_sources = {owner["source"] for owner in main_provenance["owners"]}
    payload_compiled_sources = {owner["source"] for owner in payload_provenance["owners"]}
    provenance_image_summaries = {}
    for image_name, image in compile_provenance["images"].items():
        owner_suffixes = sorted({Path(owner["source"]).suffix for owner in image["owners"]})
        need(owner_suffixes == [".c"], image_name + " compile provenance contains an unexpected non-C source owner")
        provenance_image_summaries[image_name] = {
            "elf_sha256": image["elf_sha256"],
            "map_sha256": image["map_sha256"],
            "C_compiled_owners": image["C_compiled_owners"],
            "C_compiled_instruction_bytes": image["C_compiled_instruction_bytes"],
            "runtime_archive_owners": len(image["runtime_archive_owners"]),
            "runtime_archive_instruction_bytes": image["runtime_archive_instruction_bytes"],
            "source_owner_suffixes": owner_suffixes,
        }

    payload_irq_source = symbol(payload_symbols, "IntrMain")
    payload_irq_destination = symbol(payload_symbols, "IntrMainRam")
    payload_arm_start = symbol(payload_symbols, "ArmCodeStart")
    payload_arm_end = symbol(payload_symbols, "ArmCodeEnd")
    payload_arm_destination = symbol(payload_symbols, "RamFuncArea")
    payload_sram_read_start = symbol(payload_symbols, "ReadSramFast_Core")
    payload_sram_read_end = symbol(payload_symbols, "WriteSramFast")
    payload_sram_verify_start = symbol(payload_symbols, "VerifySramFast_Core")
    payload_sram_verify_end = symbol(payload_symbols, "SetSramFastFunc")
    payload_sram_read_dest = symbol(payload_symbols, "ReadSramFastRamArea")
    payload_sram_verify_dest = symbol(payload_symbols, "VerifySramFastRamArea")
    payload_irq_bytes = 0x200 * 4
    payload_arm_bytes = payload_arm_end - payload_arm_start
    payload_sram_read_bytes = payload_sram_read_end - payload_sram_read_start
    payload_sram_verify_bytes = payload_sram_verify_end - payload_sram_verify_start
    need(payload_irq_source == payload_base + 0x3C, "unexpected payload IRQ source entry")
    need(payload_irq_destination == 0x03001420, "unexpected payload IRQ buffer")
    need(payload_arm_bytes == 0x318, "unexpected payload ArmCode extent")
    need(payload_arm_destination == 0x03000A10, "unexpected payload RAM function buffer")
    need(payload_sram_read_bytes == 0x40, "unexpected payload SRAM read-copy extent")
    need(payload_sram_verify_bytes == 0x4C, "unexpected payload SRAM verify-copy extent")
    need(payload_sram_read_dest == 0x030002C0, "unexpected payload SRAM read buffer")
    need(payload_sram_verify_dest == 0x03000220, "unexpected payload SRAM verify buffer")
    need(symbol(payload_symbols, "Main") == payload_base + 0x474, "unexpected payload Main address")
    for start, size, name in (
        (payload_irq_source, payload_irq_bytes, "payload IRQ"),
        (payload_arm_start, payload_arm_bytes, "payload ARM functions"),
        (payload_sram_read_start, payload_sram_read_bytes, "payload SRAM read"),
        (payload_sram_verify_start, payload_sram_verify_bytes, "payload SRAM verify"),
    ):
        offset = start - payload_base
        need(0 <= offset <= len(payload_bin) - size, name + " span outside expanded payload")

    # The orphan pointer is a ProcCmd-table pointer, not a native routine entry.
    orphan_start = symbol(symbols, "gUnkData_108")
    orphan_size = int(symbols["gUnkData_108"]["size"])
    exceptional_offset = 0xA028
    exceptional_address = orphan_start + exceptional_offset
    exceptional_value = int.from_bytes(
        rom[exceptional_address - ROM_BASE : exceptional_address - ROM_BASE + 4], "little"
    )
    proc_script = symbol(symbols, "gProcScr_TalkWaitForInput")
    need(orphan_size == 0xA788, "unexpected orphan-data symbol extent")
    need(exceptional_offset + 4 <= orphan_size, "exceptional slot outside orphan data")
    need(exceptional_value == proc_script == 0x085913F0, "exceptional word/ProcCmd target changed")
    base_word = orphan_start.to_bytes(4, "little")
    aligned_base_pointer_sites = [
        ROM_BASE + offset
        for offset in range(0, len(rom) - 3, 4)
        if rom[offset : offset + 4] == base_word
    ]

    # Linked ROM ELF files normally discard input relocations. Check that explicitly;
    # source-object relocation coverage is reported separately when its complete
    # production object set exists, without invoking a build.
    relocations_text = subprocess.check_output(
        ["arm-none-eabi-readelf", "-rW", str(ELF_PATH)], text=True
    )
    linked_relocation_sections = "There are no relocations in this file." not in relocations_text
    object_list = read(ROOT / "objects.lst").split()
    code_inputs = [name for name in object_list if name.startswith(("src/", "asm/"))]
    missing_code_objects = [name for name in code_inputs if not (ROOT / name).is_file()]
    object_relocations_available = bool(code_inputs) and not missing_code_objects
    object_reference_hits: list[str] = []
    if object_relocations_available:
        nm_output = subprocess.check_output(
            ["arm-none-eabi-nm", "-A", "--undefined-only", *[str(ROOT / name) for name in code_inputs]],
            text=True,
        )
        object_reference_hits = [
            line
            for line in nm_output.splitlines()
            if any(token in line for token in ("gUnkData_108", "FE6SIO_Payload", "FE6SIO_Entry", "MultiBootStartMaster"))
        ]

    orphan_mentions = source_mentions("gUnkData_108")
    payload_mentions = source_mentions("FE6SIO_Payload")
    entry_mentions = source_mentions("FE6SIO_Entry")
    master_mentions = source_mentions("MultiBootStartMaster")
    master_calls = [
        item
        for item in master_mentions
        if not re.search(r"\b(?:void|int|s32)\s+MultiBootStartMaster\s*\(", str(item["text"]))
    ]
    need(
        all(item["path"] == "src/data_B1FE7C.c" for item in orphan_mentions),
        "a new named production source reference to gUnkData_108 appeared",
    )
    need(
        all(item["path"] == "asm/fe6sio.s" for item in payload_mentions),
        "a new named production source reference to FE6SIO_Payload appeared",
    )
    native_buffer_names = (
        "IntrMain_Buffer",
        "gUnk_68",
        "SoundMainRAM_Buffer",
        "readSramFast_Work",
        "verifySramFast_Work",
        "IntrMainRam",
        "RamFuncArea",
        "ReadSramFastRamArea",
        "VerifySramFastRamArea",
    )
    native_destination_copy_calls = native_destination_callsites(native_buffer_names)
    decompressor_names = {"Decompress", "LZ77UnCompWram", "LZ77UnCompVram", "HuffUnComp", "RLUnCompWram", "RLUnCompVram"}
    direct_generic_targets = [call for call in native_destination_copy_calls if call["call"] in decompressor_names]

    # Source line receipts keep the inventory auditable without embedding source.
    source_evidence = {
        "startup": evidence("src/crt0.c", "StartupFarPointers"),
        "main_irq_copy_call": evidence("src/main.c", "StoreIRQToIRAM();"),
        "main_routine_copy_call": evidence("src/main.c", "StoreRoutinesToIRAM();"),
        "main_sound_copy_call": evidence("src/main.c", "m4aSoundInit();"),
        "main_sram_init_call": evidence("src/main.c", "SramInit();"),
        "main_iwram_clear": evidence("src/main.c", "IWRAM_START"),
        "irq_copy": evidence("src/irq.c", "CpuFastCopy(IrqMain, IntrMain_Buffer"),
        "routine_copy": evidence("src/ramfunc.c", "CpuCopy16(ARMCodeToCopy_Start, gUnk_68"),
        "sound_copy": evidence("src/m4a.c", "CpuCopy32((void *)((s32)SoundMainRAM"),
        "main_sram_init": evidence("src/bmsave-lib.c", "SetSramFastFunc();"),
        "main_sram_copy": evidence("src/agb_sram.c", "size = ((uintptr_t)WriteSramFast"),
        "serial_entry": evidence("src/serial_boot.c", "void __attribute__((section(\".text.serial_entry\"))) FE6SIO_Entry"),
        "serial_boot_handoff": evidence("src/serial_reset.c", "svc #0x110000"),
        "serial_boot_entry": evidence("src/serial_reset.c", "serialEntry();"),
        "bios_lz_wrapper": evidence("src/bios_wrappers.c", "void LZ77UnCompWram"),
        "serial_hw_base": evidence("src/serial_reset.c", "serialBase = (volatile unsigned short *)0x04000120;"),
        "serial_receive_source": evidence("src/serial_reset.c", "serialBase=(volatile unsigned short *)0x020002b0;"),
        "serial_expand_destination": evidence("src/serial_reset.c", "serialValue=0x02010000;"),
        "serial_entry_pointer": evidence("src/serial_reset.c", "serialEntry=(void (*)(void))0x02010000;"),
        "multiboot_bios_call": evidence("src/sio_multiboot.c", "i = MultiBoot(mp);"),
        "multiboot_start_buffer": evidence("src/sio_multiboot.c", "mp->boot_srcp = srcp;"),
        "multiboot_start_limit": evidence("src/sio_multiboot.c", "mp->boot_endp = srcp + length;"),
        "multiboot_start_helper": evidence("src/sio_multiboot.c", "void MultiBootStartMaster("),
        "multiboot_bios_wrapper": evidence("src/bios_wrappers.c", 'asm volatile("swi 0x25"'),
        "serial_payload": evidence("asm/fe6sio.s", "FE6SIO_Payload:"),
        "orphan_definition": evidence("src/data_B1FE7C.c", "gUnkData_108[0xA788]"),
        "exceptional_target_owner": evidence("src/scene.c", "gProcScr_TalkWaitForInput[]"),
        "payload_main_irq_call": evidence("mgfembp/src/main.c", "InitIntrs();"),
        "payload_main_ramfunc_call": evidence("mgfembp/src/main.c", "InitRamFuncs();"),
        "payload_main_sram_call": evidence("mgfembp/src/main.c", "SramInit();"),
        "payload_irq_copy": evidence("mgfembp/src/interrupts.c", "CpuFastCopy(IntrMain, IntrMainRam"),
        "payload_arm_copy": evidence("mgfembp/src/ramfunc.c", "CpuCopy16(ArmCodeStart, RamFuncArea"),
        "payload_sram_copy": evidence("mgfembp/src/gbasram.c", "size = ((uptr)WriteSramFast"),
    }

    loaders = [
        {
            "id": "reset-vector-and-AgbMain",
            "kind": "fixed ROM-native boot path",
            "source_owners": ["src/crt0.c", "src/main.c"],
            "rom_entry": hex(ROM_BASE),
            "linked_symbols": {
                "crt0": hex(symbol(symbols, "crt0")),
                "AgbMain": hex(symbol(symbols, "AgbMain")),
                "IrqMain": hex(irq_source),
            },
            "evidence": [source_evidence["startup"], source_evidence["main_iwram_clear"]],
            "finding": "The reset path executes linked ROM code; crt0 installs the initial ROM IRQ pointer and transfers to AgbMain.",
        },
        {
            "id": "irq-code-to-IWRAM",
            "kind": "BIOS CpuFastSet native code copy",
            "source": {"start": hex(irq_source), "end_exclusive": hex(irq_source + irq_copy), "bytes": irq_copy},
            "destination": {"symbol": "IntrMain_Buffer", "start": hex(irq_destination), "end_exclusive": hex(irq_destination + irq_copy), "bytes": irq_copy},
            "caller": "AgbMain",
            "consumer": "INTR_VECTOR is set to IntrMain_Buffer by StoreIRQToIRAM.",
            "source_owners": ["src/irq_entry.c", "src/irq_save_frame.c", "src/irq_search.c", "src/irq_continuation.c", "src/irq.c"],
            "evidence": [source_evidence["irq_copy"], source_evidence["main_irq_copy_call"]],
            "finding": "The source span is a fixed 0x800-byte copy from IrqMain; it includes the linked IRQ chain and later ROM bytes as a conservative fixed-width copied tail.",
        },
        {
            "id": "ARM-routines-to-IWRAM",
            "kind": "BIOS CpuSet native code copy",
            "source": {"symbol": "ARMCodeToCopy_Start", "start": hex(routines_source), "end_exclusive": hex(routines_end), "bytes": routines_bytes},
            "destination": {"symbol": "gUnk_68", "start": hex(routines_destination), "end_exclusive": hex(routines_destination + routines_bytes), "bytes": routines_bytes},
            "caller": "AgbMain",
            "consumer": "StoreRoutinesToIRAM installs six callable addresses into IWRAM pointers (DrawGlyph, DecodeString, PutOamHi/Lo, MapFloodCoreStep/Core).",
            "source_owners": ["src/arm/color_fade_tick.c", "src/arm/clear_oam.c", "src/arm/checksum.c", "src/arm/tm_fill_rect.c", "src/arm/tm_copy_rect.c", "src/arm/tm_apply_tsa.c", "src/arm/put_oam.c", "src/arm/put_oam_lo.c", "src/arm/draw_glyph.c", "src/arm/decode_string.c", "src/arm/map_flood_step.c", "src/arm/map_flood_core.c"],
            "linker_layout_sources": [{"path": "asm/arm.s", "role": "section-boundary directives only; no standalone instruction bytes"}],
            "evidence": [source_evidence["routine_copy"], source_evidence["main_routine_copy_call"]],
            "finding": "Linker-defined contiguous source and explicit per-function destination offsets cover the copied routine bundle; its 0x7f8 span includes adjacent literal pools.",
        },
        {
            "id": "SoundMainRAM-to-IWRAM",
            "kind": "BIOS CpuSet native code copy",
            "source": {"start": hex(mixer_source), "native_end_exclusive": hex(mixer_end), "native_bytes": mixer_native_bytes, "copy_end_exclusive": hex(mixer_source + mixer_copy), "copied_bytes": mixer_copy},
            "destination": {"symbol": "SoundMainRAM_Buffer", "start": hex(mixer_buffer), "end_exclusive": hex(mixer_buffer + mixer_copy), "bytes": mixer_copy},
            "caller": "AgbMain via m4aSoundInit",
            "consumer": "SoundMainBufferEntry transfers to SoundMainRAM_BufferThumb; copied Thumb/ARM mixer pieces have linker adjacency and branch-range assertions.",
            "source_owners": mixer_native_owners,
            "linker_map_source_sections": [row for row in mixer_section_rows if row["native_bytes"]],
            "copied_tail": {"bytes": mixer_copy - mixer_native_bytes, "start": hex(mixer_end), "owners_from_map": mixer_tail_owners, "status": "adjacent already-owned code copied because the buffer copy is 0x400 bytes; not an extra unsourced routine"},
            "evidence": [source_evidence["sound_copy"], source_evidence["main_sound_copy_call"]],
            "finding": "The linker marks 0x3a4 bytes as the mixer; m4aSoundInit copies 0x400 bytes, so 0x5c bytes after SoundMainRAM_End are also copied.",
        },
        {
            "id": "main-SRAM-fast-functions-to-IWRAM",
            "kind": "manual Thumb halfword copies into callable IWRAM buffers",
            "copies": [
                {"symbol": "ReadSramFast_Core", "source": hex(main_sram_read_start), "source_end_exclusive": hex(main_sram_read_end), "bytes": main_sram_read_bytes, "destination": hex(main_sram_read_dest), "buffer_bytes": int(symbols["readSramFast_Work"]["size"]), "installed_pointer_symbol": "ReadSramFast"},
                {"symbol": "VerifySramFast_Core", "source": hex(main_sram_verify_start), "source_end_exclusive": hex(main_sram_verify_end), "bytes": main_sram_verify_bytes, "destination": hex(main_sram_verify_dest), "buffer_bytes": int(symbols["verifySramFast_Work"]["size"]), "installed_pointer_symbol": "VerifySramFast", "trailing_copy_padding_bytes": main_sram_verify_bytes - int(symbols["VerifySramFast_Core"]["size"])},
            ],
            "caller": "AgbMain calls SramInit; SramInit calls SetSramFastFunc before SRAM checks.",
            "consumer": "SetSramFastFunc installs Thumb-bit-set pointers to the copied routines; save code calls ReadSramFast and VerifySramFast.",
            "source_owners": ["src/agb_sram.c", "src/bmsave-lib.c"],
            "evidence": [source_evidence["main_sram_copy"], source_evidence["main_sram_init"], source_evidence["main_sram_init_call"]],
            "finding": "Both source spans are bounded by next linked functions and copied as 16-bit units. The Verify copy contains a 2-byte alignment gap before SetSramFastFunc.",
        },
        {
            "id": "FE6SIO-serial-LZ-entry",
            "kind": "external serial receive, BIOS LZ77 expansion, fixed native entry",
            "stored_payload": {"source": hex(fe6_payload_start), "duplicate": hex(duplicate_start), "compressed_bytes": len(payload), "expanded_destination": "0x02010000", "expanded_bytes": duplicate_payload["expanded_bytes"], "expanded_instruction_bytes": duplicate_payload["expanded_mapping_bytes"]["arm"] + duplicate_payload["expanded_mapping_bytes"]["thumb"]},
            "serial_receive_staging": "0x020002B0",
            "serial_hardware_base": "0x04000120",
            "entry_symbols": {"FE6SIO_Entry": hex(symbol(symbols, "FE6SIO_Entry")), "FE6SIO_Init": hex(symbol(symbols, "FE6SIO_Init")), "SerialReset": hex(symbol(symbols, "SerialReset"))},
            "source_owners": ["asm/fe6sio.s", "src/serial_boot.c", "src/serial_poll.c", "src/serial_reset.c", "mgfembp/mgfembp.bin and its source tree"],
            "evidence": [source_evidence["serial_payload"], source_evidence["serial_entry"], source_evidence["serial_hw_base"], source_evidence["serial_receive_source"], source_evidence["serial_expand_destination"], source_evidence["serial_boot_handoff"], source_evidence["serial_entry_pointer"], source_evidence["serial_boot_entry"]],
            "finding": "The sidecar source documents the compressed payload and 0x02010000 destination. The reset stub polls external SIO, invokes BIOS SWI 0x11 with staging source 0x020002B0 and destination 0x02010000, then enters that address. The link from the local FE6SIO_Payload label to the bytes supplied to the receive buffer has no named FE8 caller in the current source; retain that activation/transport edge as unresolved.",
        },
        {
            "id": "MGFEMBP-IRQ-code-to-IWRAM",
            "kind": "payload BIOS CpuFastSet native code copy",
            "source": {"start": hex(payload_irq_source), "end_exclusive": hex(payload_irq_source + payload_irq_bytes), "bytes": payload_irq_bytes},
            "destination": {"symbol": "IntrMainRam", "start": hex(payload_irq_destination), "end_exclusive": hex(payload_irq_destination + payload_irq_bytes), "bytes": payload_irq_bytes},
            "caller": "MGFEMBP Main calls InitIntrs during payload startup.",
            "consumer": "InitIntrs installs IntrMainRam as INTR_VECTOR.",
            "source_owners": ["mgfembp/src/irq_entry.c", "mgfembp/src/irq_save_frame.c", "mgfembp/src/irq_search.c", "mgfembp/src/irq_continuation.c", "mgfembp/src/interrupts.c"],
            "evidence": [source_evidence["payload_irq_copy"], source_evidence["payload_main_irq_call"]],
            "finding": "The standalone payload has its own fixed 0x800-byte IRQ copy, separate from the main game's IRQ copy.",
        },
        {
            "id": "MGFEMBP-ARM-routines-to-IWRAM",
            "kind": "payload BIOS CpuSet native code copy",
            "source": {"symbol": "ArmCodeStart", "start": hex(payload_arm_start), "end_exclusive": hex(payload_arm_end), "bytes": payload_arm_bytes},
            "destination": {"symbol": "RamFuncArea", "start": hex(payload_arm_destination), "end_exclusive": hex(payload_arm_destination + payload_arm_bytes), "bytes": payload_arm_bytes, "buffer_bytes": int(payload_symbols["RamFuncArea"]["size"])},
            "caller": "MGFEMBP Main calls InitRamFuncs during payload startup.",
            "consumer": "InitRamFuncs installs PutOamHiRamFunc and PutOamLoRamFunc at copied code offsets.",
            "source_owners": ["mgfembp/src/ramfunc.c", "mgfembp/src/color_fade_tick.c", "mgfembp/src/clear_oam.c", "mgfembp/src/checksum.c", "mgfembp/src/tm_fill_rect.c", "mgfembp/src/tm_copy_rect.c", "mgfembp/src/tm_apply_tsa.c", "mgfembp/src/put_oam.c", "mgfembp/src/put_oam_lo.c"],
            "linker_layout_sources": [{"path": "mgfembp/src/armfunc.s", "role": "section-boundary directives only; no standalone instruction bytes"}],
            "evidence": [source_evidence["payload_arm_copy"], source_evidence["payload_main_ramfunc_call"]],
            "finding": "The standalone payload copies its linker-delimited 0x318-byte native helper bundle into IWRAM; the destination buffer is 0xA00 bytes.",
        },
        {
            "id": "MGFEMBP-SRAM-fast-functions-to-IWRAM",
            "kind": "payload manual Thumb halfword copies into callable IWRAM buffers",
            "copies": [
                {"symbol": "ReadSramFast_Core", "source": hex(payload_sram_read_start), "source_end_exclusive": hex(payload_sram_read_end), "bytes": payload_sram_read_bytes, "destination": hex(payload_sram_read_dest), "buffer_bytes": int(payload_symbols["ReadSramFastRamArea"]["size"]), "installed_pointer_symbol": "ReadSramFast"},
                {"symbol": "VerifySramFast_Core", "source": hex(payload_sram_verify_start), "source_end_exclusive": hex(payload_sram_verify_end), "bytes": payload_sram_verify_bytes, "destination": hex(payload_sram_verify_dest), "buffer_bytes": int(payload_symbols["VerifySramFastRamArea"]["size"]), "installed_pointer_symbol": "VerifySramFast", "trailing_copy_padding_bytes": payload_sram_verify_bytes - int(payload_symbols["VerifySramFast_Core"]["size"])},
            ],
            "caller": "MGFEMBP Main calls SramInit after the key wait; SramInit calls SetSramFastFunc.",
            "consumer": "SetSramFastFunc installs Thumb-bit-set pointers used by payload save code.",
            "source_owners": ["mgfembp/src/gbasram.c", "mgfembp/src/save.c"],
            "evidence": [source_evidence["payload_sram_copy"], source_evidence["payload_main_sram_call"]],
            "finding": "The standalone payload independently contains the same two source-bounded IWRAM SRAM helpers, including the 2-byte Verify-span alignment gap.",
        },
    ]

    main_native_source_owners = sorted(
        {
            owner
            for loader in loaders[:6]
            for owner in loader["source_owners"]
            if str(owner).endswith(".c")
        }
    )
    payload_native_source_owners = sorted(
        {
            owner
            for loader in loaders[6:]
            for owner in loader["source_owners"]
            if str(owner).endswith(".c")
        }
    )
    missing_main_native_owners = sorted(set(main_native_source_owners) - main_compiled_sources)
    missing_payload_native_owners = sorted(set(payload_native_source_owners) - payload_compiled_sources)
    need(not missing_main_native_owners, "native main-game source owner absent from compile-provenance receipt")
    need(not missing_payload_native_owners, "native MGFEMBP source owner absent from compile-provenance receipt")

    report = {
        "schema_version": 1,
        "scope": "Source-linked inventory of production native-code copy and compressed-entry mechanisms for intended FE8U execution. Not a proof against arbitrary computed pointers or memory corruption. Ordinary art/text/audio and battle-animation VM interpretation are outside the native-loader list.",
        "inputs": {
            "rom": ROM_PATH.name,
            "rom_sha256": digest(rom),
            "reference_rom": REFERENCE_ROM_PATH.name,
            "rom_exactly_matches_reference": True,
            "elf": ELF_PATH.name,
            "elf_sha256": digest(ELF_PATH.read_bytes()),
            "map": MAP_PATH.name,
            "map_sha256": digest(map_text.encode()),
            "compressed_payload_sha256": digest(payload),
            "expanded_payload_sha256": digest(payload_bin),
            "expanded_payload_elf_sha256": digest(payload_elf_path.read_bytes()),
            "expanded_payload_map_sha256": digest(payload_map_text.encode()),
            "compile_provenance": "docs/compile-provenance.json",
            "compile_provenance_sha256": digest(compile_provenance_path.read_bytes()),
        },
        "checks": {
            "irq_copy_source_span_present_in_rom": True,
            "arm_routine_source_span_present_in_rom": True,
            "mixer_copy_source_span_present_in_rom": True,
            "main_sram_read_copy_span_present_in_rom": True,
            "main_sram_verify_copy_span_present_in_rom": True,
            "fe6_primary_payload_equals_incbin_asset": True,
            "fe6_duplicate_equals_primary_payload": True,
            "expanded_payload_hash_matches_duplicate_receipt": True,
            "payload_irq_span_in_expanded_image": True,
            "payload_arm_functions_span_in_expanded_image": True,
            "payload_sram_copy_spans_in_expanded_image": True,
            "orphan_exceptional_word_equals_proc_script_symbol": True,
            "orphan_aligned_base_pointer_sites": [hex(address) for address in aligned_base_pointer_sites],
            "linked_elf_has_relocation_sections": linked_relocation_sections,
            "all_production_code_objects_available_for_relocation_scan": object_relocations_available,
            "missing_production_code_objects_for_optional_relocation_scan": len(missing_code_objects),
            "optional_object_reference_hits": object_reference_hits,
            "source_mentions": {
                "gUnkData_108": orphan_mentions,
                "FE6SIO_Payload": payload_mentions,
                "FE6SIO_Entry": entry_mentions,
                "MultiBootStartMaster": master_mentions,
                "MultiBootStartMaster_direct_source_calls": master_calls,
            },
            "literal_native_destination_copy_callsites": native_destination_copy_calls,
            "literal_generic_decompress_to_named_native_buffers": direct_generic_targets,
        },
        "compile_provenance": {
            "images": provenance_image_summaries,
            "native_main_source_owners_missing_from_receipt": missing_main_native_owners,
            "native_payload_source_owners_missing_from_receipt": missing_payload_native_owners,
            "linker_layout_sources": [
                layout
                for loader in loaders
                for layout in loader.get("linker_layout_sources", [])
            ],
            "interpretation": "For these four image receipts, every mapped source owner is a C source; runtime archive instructions are itemized separately. The arm.s/armfunc.s files listed by native-copy sections provide linker layout markers only, not remaining standalone assembly routine owners.",
        },
        "native_loader_callsites": {
            "main_game_startup": [
                source_evidence["main_irq_copy_call"],
                source_evidence["main_routine_copy_call"],
                source_evidence["main_sram_init_call"],
                source_evidence["main_sound_copy_call"],
            ],
            "main_irq_copy": source_evidence["irq_copy"],
            "main_arm_bundle_copy": source_evidence["routine_copy"],
            "main_mixer_copy": source_evidence["sound_copy"],
            "main_manual_sram_copies": source_evidence["main_sram_copy"],
            "fe6_serial_decompress_and_entry": [
                source_evidence["serial_hw_base"],
                source_evidence["serial_receive_source"],
                source_evidence["serial_expand_destination"],
                source_evidence["serial_boot_handoff"],
                source_evidence["serial_entry_pointer"],
                source_evidence["serial_boot_entry"],
            ],
            "mgfembp_startup": [
                source_evidence["payload_main_irq_call"],
                source_evidence["payload_main_ramfunc_call"],
                source_evidence["payload_main_sram_call"],
            ],
            "mgfembp_irq_copy": source_evidence["payload_irq_copy"],
            "mgfembp_arm_bundle_copy": source_evidence["payload_arm_copy"],
            "mgfembp_manual_sram_copies": source_evidence["payload_sram_copy"],
            "generic_multiboot_hardware_transfer": {
                "bios_call": source_evidence["multiboot_bios_call"],
                "configuration_source_buffer": source_evidence["multiboot_start_buffer"],
                "configuration_end": source_evidence["multiboot_start_limit"],
                "named_start_helper_callers": master_calls,
            },
        },
        "generic_multiboot": {
            "bios_wrapper": source_evidence["multiboot_bios_wrapper"],
            "driver_bios_callsite": source_evidence["multiboot_bios_call"],
            "start_helper": source_evidence["multiboot_start_helper"],
            "buffer_setup": source_evidence["multiboot_start_buffer"],
            "rounded_buffer_end": source_evidence["multiboot_start_limit"],
            "start_helper_named_callers": master_calls,
            "fe6_payload_named_references_in_multiboot_source": [
                item for item in payload_mentions if item["path"] == "src/sio_multiboot.c"
            ],
            "interpretation": "The standard BIOS MultiBoot driver has a concrete transfer path, but MultiBootStartMaster has no named source caller and this inventory finds no named FE6SIO_Payload source edge into it. This is a generic external transfer capability, separate from the FE6 serial-reset SWI 0x11 path that enters 0x02010000.",
        },
        "known_copied_or_compressed_native_content": {
            "duplicate_receipt": "docs/duplicate-executable-content.json",
            "copied_native_instruction_bytes_in_orphan": duplicate_receipt["copied_native_instruction_bytes"],
            "native_regions": duplicate_receipt["native_regions"],
            "compressed_payload": duplicate_payload,
        },
        "orphan_pointer": {
            "symbol": "gUnkData_108",
            "address": hex(orphan_start),
            "bytes": orphan_size,
            "exceptional_offset": hex(exceptional_offset),
            "exceptional_address": hex(exceptional_address),
            "value": hex(exceptional_value),
            "target_symbol": "gProcScr_TalkWaitForInput",
            "target_source_kind": "struct ProcCmd table interpreted by the Proc system",
            "interpretation": "No named source reference or aligned literal pointer to gUnkData_108 was found. The exceptional word points to a ProcCmd table, not a native function entry. This narrows the supported-consumer evidence but does not exclude computed/data-driven access.",
        },
        "source_evidence": source_evidence,
        "loaders": loaders,
        "remaining_uncertainties": [
            "The local FE6SIO_Payload storage has no named source-level consumer. SerialReset proves a protocol-fed LZ77-to-0x02010000-and-enter path, but this audit does not establish that the ROM-resident compressed label is the exact buffer contents supplied by that protocol.",
            "The BIOS MultiBoot driver receives its image pointer through MultiBootStartMaster's caller; no named source caller or FE6SIO_Payload edge is present. This is an unresolved generic transfer input/activation edge, not an identified missing payload routine.",
            "The source-level scan and exact aligned-base-pointer scan do not prove absence of aliases, computed addresses, or access through an external serial participant. The linked ROM ELF has no relocation sections; production input-object relocations are included only when that complete object set is already present, and this audit never builds it.",
            "Generic copy and decompression helpers accept dynamic destinations. The authored-C call scan records direct copy/decompression calls whose second argument names one of the tracked IWRAM code buffers; it does not establish absence of aliases, computed destinations, or hand-written assembly transfers elsewhere.",
        ],
    }

    # Source-order and source-level mechanism checks.
    main_source = read(ROOT / "src/main.c")
    positions = [main_source.index(call) for call in ("StoreIRQToIRAM();", "StoreRoutinesToIRAM();", "SramInit();", "m4aSoundInit();")]
    need(positions == sorted(positions), "main's fixed native loader order changed")
    serial_source = read(ROOT / "src/serial_reset.c")
    need("0x020002b0" in serial_source.lower() and "0x02010000" in serial_source.lower(), "serial receive/decompress addresses changed")
    need("serialEntry();" in serial_source, "serial reset no longer enters decompressed address")

    lines = [
        "# Native code load paths",
        "",
        "This receipt inventories source-backed native code copies and the FE6 serial payload entry path in the current FE8U image. It does not treat arbitrary corrupted memory as an intended execution source. Reproduce the checks with `python3 scripts/audit_native_load_paths.py`; the script reads artifacts only and writes this Markdown and its JSON sibling.",
        "",
        f"The current ROM exactly matches the reference image (`{report['inputs']['rom_sha256']}`). The main game has four source-backed IWRAM code-copy mechanisms, the FE6 payload has three more after decompression, and the sidecar has a serial/BIOS compressed-entry path. No additional native source gap is established by this inventory.",
        "",
        "## Main-game copies",
        "",
        "| Path | ROM source and extent | Runtime destination | Source owner and consumer | Finding |",
        "|---|---|---|---|---|",
    ]
    for loader in loaders[:5]:
        if loader["id"] == "reset-vector-and-AgbMain":
            source_text = "ROM reset entry " + loader["rom_entry"] + "; crt0 at " + loader["linked_symbols"]["crt0"] + " enters AgbMain at " + loader["linked_symbols"]["AgbMain"]
            dest_text = "ROM execution; IWRAM is reserved as NOBITS and cleared during startup"
        elif "copies" in loader:
            source_text = "; ".join(
                f"{copy['symbol']} {copy['source']}..{copy['source_end_exclusive']} ({copy['bytes']:#x} bytes)"
                for copy in loader["copies"]
            )
            dest_text = "; ".join(f"{copy['destination']} ({copy['buffer_bytes']:#x}-byte buffer)" for copy in loader["copies"])
        else:
            source_size = loader["source"].get("bytes", loader["source"].get("copied_bytes"))
            source_end = loader["source"].get("end_exclusive", loader["source"].get("copy_end_exclusive"))
            source_text = loader["source"]["start"] + ".." + source_end + f" ({source_size:#x} bytes)"
            dest = loader["destination"]
            dest_text = dest["start"] + ".." + dest["end_exclusive"]
        evidence_links = ", ".join(source_line(item["path"], int(item["line"])) for item in loader["evidence"])
        owners = ", ".join(loader["source_owners"])
        finding = loader["finding"]
        if loader["id"] == "SoundMainRAM-to-IWRAM":
            tail = loader["copied_tail"]
            finding += f" Copied tail: {tail['bytes']:#x} bytes from {tail['start']}, already-owned neighboring M4A functions."
        lines.append(f"| {loader['id']} | {source_text} | {dest_text} | {owners}; {evidence_links} | {finding} |")

    fe6 = next(loader for loader in loaders if loader["id"] == "FE6SIO-serial-LZ-entry")
    payload_info = fe6["stored_payload"]
    fe6_evidence = ", ".join(source_line(item["path"], int(item["line"])) for item in fe6["evidence"])
    lines += [
        "",
        "## FE6 serial and BIOS entry path",
        "",
        f"The serial bootstrap uses SIO at {fe6['serial_hardware_base']}; after polling it invokes BIOS LZ77 decompression from receive staging at {fe6['serial_receive_staging']} to {payload_info['expanded_destination']}, then branches to that address. The compressed sidecar is stored at {payload_info['source']} ({payload_info['compressed_bytes']:,} bytes) and duplicated at {payload_info['duplicate']}; the validated MGFEMBP expansion is {payload_info['expanded_bytes']:,} bytes, including {payload_info['expanded_instruction_bytes']:,} mapped ARM/Thumb instruction bytes. The expanded source owner is `mgfembp` and the receiving stub owners are `src/serial_boot.c`, `src/serial_poll.c`, and `src/serial_reset.c`.",
        "",
        f"Evidence: {fe6_evidence}. The 200 copied instruction bytes inside the orphan block are duplicates of those three serial-stub source owners. The current source does not name the local FE6SIO_Payload label as the input address passed to the receive buffer, so its exact transport edge remains open; the available source and payload representation are present.",
        "",
        "The ordinary C LZ77 wrapper is BIOS SWI 0x11. The dedicated serial stub issues that same SWI directly with explicit staging/destination registers, so it is the concrete decompression-to-native-entry path found here. The authored-C call scan found no direct decompression whose second argument names a tracked native IWRAM buffer.",
        "",
        "## Standard GBA MultiBoot transfer capability",
        "",
        f"`src/sio_multiboot.c:{source_evidence['multiboot_bios_call']['line']}` calls the `MultiBoot` BIOS wrapper, which issues SWI 0x25. `MultiBootStartMaster` stores a caller-provided `srcp`, rounds the requested length to 16 bytes, and sets the transfer end at `srcp + length` ({source_line('src/sio_multiboot.c', int(source_evidence['multiboot_start_helper']['line']))}, {source_line('src/sio_multiboot.c', int(source_evidence['multiboot_start_buffer']['line']))}, {source_line('src/sio_multiboot.c', int(source_evidence['multiboot_start_limit']['line']))}). The authored source has no named caller of `MultiBootStartMaster`, and no named FE6 payload edge into this generic transfer path. Treat it as a hardware transfer capability with an unresolved source owner at invocation, separate from the concrete FE6 serial-reset receive/decompress/entry sequence above.",
        "",
        "## Native copies inside the expanded MGFEMBP payload",
        "",
        "After the sidecar reaches 0x02010000 and enters its image, MGFEMBP Main clears IWRAM, installs its copied IRQ, copies its own ARM helper bundle, and later installs SRAM fast routines. Each copied instruction span maps to named C source owners in the payload tree:",
        "",
        "| Path | Payload source span | IWRAM destination | Owner and consumer |",
        "|---|---|---|---|",
    ]
    for loader in loaders[6:]:
        if "copies" in loader:
            source_text = "; ".join(f"{copy['symbol']} {copy['source']}..{copy['source_end_exclusive']} ({copy['bytes']:#x} bytes)" for copy in loader["copies"])
            destination_text = "; ".join(copy["destination"] for copy in loader["copies"])
        else:
            source_text = loader["source"]["start"] + ".." + loader["source"]["end_exclusive"] + f" ({loader['source']['bytes']:#x} bytes)"
            destination_text = loader["destination"]["start"] + ".." + loader["destination"]["end_exclusive"]
        evidence_links = ", ".join(source_line(item["path"], int(item["line"])) for item in loader["evidence"])
        lines.append(f"| {loader['id']} | {source_text} | {destination_text} | {', '.join(loader['source_owners'])}; {evidence_links} |")
    lines += [
        "",
        "## Orphan block and supported-consumer evidence",
        "",
        f"The generated `gUnkData_108` array occupies {report['orphan_pointer']['address']}..{hex(orphan_start + orphan_size)} ({orphan_size:,} bytes). The existing duplicate-content receipt accounts for its {report['known_copied_or_compressed_native_content']['copied_native_instruction_bytes_in_orphan']} copied native instruction bytes and embedded compressed payload. A source search finds the symbol only at its definition; no aligned ROM word points to the array base. Those are bounded positive and negative findings, not proof against an alias or computed address.",
        "",
        f"At offset {report['orphan_pointer']['exceptional_offset']} (ROM {report['orphan_pointer']['exceptional_address']}), the word is {report['orphan_pointer']['value']}. It equals `gProcScr_TalkWaitForInput` at {hex(proc_script)}; [src/scene.c:{source_evidence['exceptional_target_owner']['line']}](../src/scene.c#L{source_evidence['exceptional_target_owner']['line']}) declares a `struct ProcCmd` table. It is a script-data pointer, not a native function address. No supported reader of the orphan array is named in production source.",
        "",
        "## Scope limits and closure implications",
        "",
        "The linker places IWRAM and EWRAM overlays in NOBITS/NOLOAD sections; `src/main.c` clears the runtime RAM before installing the IRQ and routine copies. This audit does not find a hidden linker-loaded IWRAM code image. Ordinary graphics, text, music, and battle-animation VM streams remain their own data/VM coverage work.",
        "",
        "The main-game and MGFEMBP copies have concrete source owners and fixed extents. The mixer copy deliberately spans 0x400 bytes although the linker-bounded mixer is 0x3A4 bytes; the extra 0x5C bytes belong to adjacent already-sourced M4A functions. The SRAM Verify copies include a 2-byte alignment gap. These copied tails are not evidence of a missing routine. FE6 payload activation/transport and computed aliases remain bounded uncertainties, not new unsourced native implementation findings.",
        "",
        f"The linked ELF has no relocation sections. The companion [compile-provenance receipt](compile-provenance.json) matches the current main and MGFEMBP ELF/map hashes and lists 490 main-game and 31 MGFEMBP C-compiled source owners; runtime-library instruction owners are itemized separately. Across the four image receipts, every mapped source owner is C. `asm/arm.s` and `mgfembp/src/armfunc.s` provide section-boundary directives only; the FE6 `.incbin` assembly places compressed data and owns no native instruction implementation. These are layout/data owners, not remaining assembly-source routines. The script also records whether the complete production source-object set is present for optional undefined-symbol relocation checks; it does not rebuild.",
        "",
    ]

    OUTPUT_JSON.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    OUTPUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"wrote {OUTPUT_JSON.relative_to(ROOT)} and {OUTPUT_MD.relative_to(ROOT)}")
    print(f"ROM matches reference; 4 main-game and 3 MGFEMBP IWRAM copy mechanisms; FE6 payload {len(payload)} stored bytes / {duplicate_payload['expanded_mapping_bytes']['arm'] + duplicate_payload['expanded_mapping_bytes']['thumb']} expanded mapped instructions")
    print(f"gUnkData_108 named source mentions={len(orphan_mentions)}; aligned base-pointer sites={len(aligned_base_pointer_sites)}; optional complete object relocation set={object_relocations_available}")


if __name__ == "__main__":
    main()
