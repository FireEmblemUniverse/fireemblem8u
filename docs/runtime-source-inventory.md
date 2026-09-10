# Runtime source inventory

Local source pin: `da598c1d918402c42c0c0d7128ba14567f3175e9`. Installed archives and selected source files are fingerprinted in [the JSON report](runtime-source-inventory.json).

| Image | Reproduced assembly instructions | Matching C source rebuild | C source located; rebuild unverified |
|---|---:|---:|---:|
| main_rom | 726 | 21,066 | 0 |
| mgfembp | 726 | 94 | 0 |

Fresh pinned libc/libgcc builds reproduce the entire 16 MiB main ROM and all three embedded payload binaries. Exported symbol addresses/sizes also match, including RAM symbols. [Rebuild evidence](runtime-rebuild.json) fingerprints the source snapshot, compiler, tools, archives and original images. Reproduce with `python3 scripts/verify_runtime_rebuild.py --json docs/runtime-rebuild.json`, then rerun this inventory.

The C-source total includes 1,014 main-ROM instruction bytes in syscalls.o, which contains inline assembly. That is the whole object size, not a count of its assembly instructions.

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

Six assembly helpers remain assembly. syscalls.c needs instruction-level inline assembly review and recovery. Fresh builds cover allocator and floating-point macro variants and their pinned headers when rebuild evidence is present; source location alone receives no rebuild credit.

- Matching C source rebuild does not prove no inline assembly; syscalls.c explicitly contains assembly and its object size is not the inline instruction count.
- Assembly text reproduction includes local padding/literals; reported instruction totals come from linked ARM/Thumb mappings.
- The installed compiler is fingerprinted and reused; this audit does not bootstrap it or claim complete decompilation.
