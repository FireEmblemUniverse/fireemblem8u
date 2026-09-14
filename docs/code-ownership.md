# Linked instruction ownership

Build baseline: `ff14412c`. Regenerate with `python3 scripts/audit_code_ownership.py --json docs/code-ownership.json --markdown docs/code-ownership.md`.

**This is a size-weighted inventory, not an overall completion percentage.**

| Scope | Mapped instruction bytes |
|---|---:|
| main_rom | 777,630 |
| mgfembp | 25,716 |

## main_rom

| Ownership | Instruction bytes | Share of mapped instructions |
|---|---:|---:|
| C-owned objects | 740,038 | 95.17% |
| C objects containing assembly | 15,800 | 2.03% |
| Assembly-source objects | 0 | 0.00% |
| Runtime archive objects | 21,792 | 2.80% |
| Unresolved ownership | 0 | 0.00% |

Assembly-source objects, largest first:

| Object | Instruction bytes |
|---|---:|

C objects needing assembly review (whole-object sizes, **not** remaining assembly bytes):

| Object | Instruction bytes |
|---|---:|
| `src/eventinfo.o` | 6,030 |
| `src/m4a.o` | 4,808 |
| `src/hardware.o` | 4,550 |
| `src/serial_reset.o` | 148 |
| `src/irq_continuation.o` | 80 |
| `src/bios_wrappers.o` | 72 |
| `src/crt0.o` | 52 |
| `src/sio_multiboot_wait.o` | 24 |
| `src/bios_soft_reset.o` | 14 |
| `src/bios_u16_return.o` | 8 |
| `src/irq_save_frame.o` | 8 |
| `src/bios_divrem.o` | 6 |

## mgfembp

| Ownership | Instruction bytes | Share of mapped instructions |
|---|---:|---:|
| C-owned objects | 18,148 | 70.57% |
| C objects containing assembly | 6,330 | 24.62% |
| Assembly-source objects | 418 | 1.63% |
| Runtime archive objects | 820 | 3.19% |
| Unresolved ownership | 0 | 0.00% |

Assembly-source objects, largest first:

| Object | Instruction bytes |
|---|---:|
| `src/crt0.o` | 328 |
| `src/gbasvc.o` | 62 |
| `src/fake_glue.o` | 16 |
| `src/armfunc.o` | 12 |

C objects needing assembly review (whole-object sizes, **not** remaining assembly bytes):

| Object | Instruction bytes |
|---|---:|
| `src/hardware.o` | 6,330 |

## Reviewed assembly inside C

| Scope | Inline instruction bytes | Assembly sources + reviewed inline |
|---|---:|---:|
| main_rom | 92 | 92 |
| mgfembp | 2 | 420 |

The main unit-list fallback contributes 396 instruction bytes plus 40 literal/alignment bytes. Other reviewed inline sites contribute 14 main-ROM bytes and two payload bytes. These totals exclude runtime archives and do not establish that mapped data contains no hidden code. Run `python3 scripts/audit_inline_regions.py` for checked source/symbol/byte locations.

## Interpretation

- C-owned does not prove assembly-free generated code, complete recovery or native engine compatibility.
- C-with-assembly counts the entire containing object; it is not all remaining assembly.
- Runtime archives require source provenance and instruction-level classification before inclusion in a completion score.
- Assembler mappings may include alignment and omit hidden code in data/unmapped areas.
- Main ROM and expanded payload are separate scopes; do not add their stored image sizes or count the compressed payload as instructions.
- Counts include inherited community work, not only changes made in this task.
