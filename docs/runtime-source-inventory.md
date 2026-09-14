# Runtime source inventory

Local source pin: `da598c1d918402c42c0c0d7128ba14567f3175e9`. Installed archives and selected source files are fingerprinted in [the JSON report](runtime-source-inventory.json).

| Image | Reproduced assembly instructions | Matching C source rebuild | C source located; rebuild unverified |
|---|---:|---:|---:|
| main_rom | 60 | 21,732 | 0 |
| mgfembp | 60 | 760 | 0 |

Fresh pinned libc/libgcc builds with the recovered C division and modulus members reproduce the entire 16 MiB main ROM and all three embedded payload binaries. Exported symbol addresses/sizes also match, including RAM symbols. [Rebuild evidence](runtime-rebuild.json) fingerprints the source snapshot, compiler, tools, archives and original images. Reproduce with `python3 scripts/verify_runtime_rebuild.py --json docs/runtime-rebuild.json`, then rerun this inventory.

The C-source total includes 1,014 main-ROM instruction bytes in syscalls.o, which contains inline assembly. That is the whole object size, not a count of its assembly instructions.

## Reproduced assembly members

| Member | Mapped instruction bytes per image | Reproduced text bytes including padding |
|---|---:|---:|
| `.deps/runtime-c/libgcc.a(_call_via_rX.o)` | 60 | 60 |

## Remaining verification

One assembly member remains: the indirect-call veneers. syscalls.c needs instruction-level inline assembly review and recovery. Fresh builds cover allocator and floating-point macro variants and their pinned headers when rebuild evidence is present; source location alone receives no rebuild credit.

- Matching C source rebuild does not prove no inline assembly; syscalls.c explicitly contains assembly and its object size is not the inline instruction count.
- Assembly text reproduction includes local padding/literals; reported instruction totals come from linked ARM/Thumb mappings.
- The installed compiler is fingerprinted and reused; this audit does not bootstrap it or claim complete decompilation.
