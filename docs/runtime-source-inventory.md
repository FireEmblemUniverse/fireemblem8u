# Runtime source inventory

Local source pin: `da598c1d918402c42c0c0d7128ba14567f3175e9`. Installed archives and selected source files are fingerprinted in [the JSON report](runtime-source-inventory.json).

| Image | Reproduced assembly instructions | C source located; rebuild unverified |
|---|---:|---:|
| main_rom | 726 | 21,066 |
| mgfembp | 726 | 94 |

## Reproduced assembly members

| Member | Mapped instruction bytes per image | Reproduced text bytes including padding |
|---|---:|---:|
| `tools/agbcc/lib/libgcc.a(_modsi3.o)` | 206 | 208 |
| `tools/agbcc/lib/libgcc.a(_umodsi3.o)` | 192 | 192 |
| `tools/agbcc/lib/libgcc.a(_divsi3.o)` | 146 | 148 |
| `tools/agbcc/lib/libgcc.a(_udivsi3.o)` | 120 | 120 |
| `tools/agbcc/lib/libgcc.a(_call_via_rX.o)` | 60 | 60 |
| `tools/agbcc/lib/libgcc.a(_dvmd_tls.o)` | 2 | 4 |

## Remaining verification

The located C sources cover the other linked members, including allocator variants from mallocr.c and floating-point variants from fp-bit-base.c. This locates source; it does not prove an exact C rebuild. In particular, syscalls.c contains inline assembly and needs instruction-level review.

- C source location is not a verified matching rebuild or proof of no inline assembly; syscalls.c explicitly contains assembly.
- Assembly text reproduction includes local padding/literals; reported instruction totals come from linked ARM/Thumb mappings.
- Header dependencies and macro-selected C variants need build verification before crediting runtime C completion.
