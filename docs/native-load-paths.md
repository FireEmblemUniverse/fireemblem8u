# Native code load paths

This receipt inventories source-backed native code copies and the FE6 serial payload entry path in the current FE8U image. It does not treat arbitrary corrupted memory as an intended execution source. Reproduce the checks with `python3 scripts/audit_native_load_paths.py`; the script reads artifacts only and writes this Markdown and its JSON sibling.

The current ROM exactly matches the reference image (`638cda9d9b72657220fbf7e7a500cd3b64d9686c36e8a56fca69d26d13886f2f`). The main game has four source-backed IWRAM code-copy mechanisms, the FE6 payload has three more after decompression, and the sidecar has a serial/BIOS compressed-entry path. No additional native source gap is established by this inventory.

## Main-game copies

| Path | ROM source and extent | Runtime destination | Source owner and consumer | Finding |
|---|---|---|---|---|
| reset-vector-and-AgbMain | ROM reset entry 0x8000000; crt0 at 0x80000c0 enters AgbMain at 0x8000a20 | ROM execution; IWRAM is reserved as NOBITS and cleared during startup | src/crt0.c, src/main.c; [src/crt0.c:9](../src/crt0.c#L9), [src/main.c:27](../src/main.c#L27) | The reset path executes linked ROM code; crt0 installs the initial ROM IRQ pointer and transfers to AgbMain. |
| irq-code-to-IWRAM | 0x80000fc..0x80008fc (0x800 bytes) | 0x3004160..0x3004960 | src/irq_entry.c, src/irq_save_frame.c, src/irq_search.c, src/irq_continuation.c, src/irq.c; [src/irq.c:17](../src/irq.c#L17), [src/main.c:20](../src/main.c#L20) | The source span is a fixed 0x800-byte copy from IrqMain; it includes the linked IRQ chain and later ROM bytes as a conservative fixed-width copied tail. |
| ARM-routines-to-IWRAM | 0x8000228..0x8000a20 (0x7f8 bytes) | 0x3003750..0x3003f48 | src/arm/color_fade_tick.c, src/arm/clear_oam.c, src/arm/checksum.c, src/arm/tm_fill_rect.c, src/arm/tm_copy_rect.c, src/arm/tm_apply_tsa.c, src/arm/put_oam.c, src/arm/put_oam_lo.c, src/arm/draw_glyph.c, src/arm/decode_string.c, src/arm/map_flood_step.c, src/arm/map_flood_core.c; [src/ramfunc.c:28](../src/ramfunc.c#L28), [src/main.c:54](../src/main.c#L54) | Linker-defined contiguous source and explicit per-function destination offsets cover the copied routine bundle; its 0x7f8 span includes adjacent literal pools. |
| SoundMainRAM-to-IWRAM | 0x80cf54c..0x80cf94c (0x400 bytes) | 0x3002c60..0x3003060 | src/m4a_mixer_entry.c, src/m4a_reverb.c, src/m4a_no_reverb.c, src/m4a_channel_setup.c, src/m4a_deadline.c, src/m4a_envelope.c, src/m4a_volume.c, src/m4a_sample_handoff.c, src/m4a_sample_entry.c, src/m4a_fixed_setup.c, src/m4a_packed.c, src/m4a_short.c, src/m4a_fixed_lane.c, src/m4a_fixed_word_finish.c, src/m4a_resample_loop.c, src/m4a_wrap.c, src/m4a_stop.c, src/m4a_loop.c, src/m4a_partial.c, src/m4a_resample_setup.c, src/m4a_resample.c, src/m4a_advance.c, src/m4a_resample_lane.c, src/m4a_word_finish.c, src/m4a_resample_finish.c, src/m4a_save_channel.c, src/m4a_channel_advance.c, src/m4a_exit_info.c, src/m4a_exit_restore.c; [src/m4a.c:69](../src/m4a.c#L69), [src/main.c:66](../src/main.c#L66) | The linker marks 0x3a4 bytes as the mixer; m4aSoundInit copies 0x400 bytes, so 0x5c bytes after SoundMainRAM_End are also copied. Copied tail: 0x5c bytes from 0x80cf8f0, already-owned neighboring M4A functions. |
| main-SRAM-fast-functions-to-IWRAM | ReadSramFast_Core 0x80d16e4..0x80d1724 (0x40 bytes); VerifySramFast_Core 0x80d1764..0x80d17b0 (0x4c bytes) | 0x3002b08 (0x80-byte buffer); 0x3002a68 (0xa0-byte buffer) | src/agb_sram.c, src/bmsave-lib.c; [src/agb_sram.c:48](../src/agb_sram.c#L48), [src/bmsave-lib.c:67](../src/bmsave-lib.c#L67), [src/main.c:55](../src/main.c#L55) | Both source spans are bounded by next linked functions and copied as 16-bit units. The Verify copy contains a 2-byte alignment gap before SetSramFastFunc. |

## FE6 serial and BIOS entry path

The serial bootstrap uses SIO at 0x04000120; after polling it invokes BIOS LZ77 decompression from receive staging at 0x020002B0 to 0x02010000, then branches to that address. The compressed sidecar is stored at 0x8b1a368 (21,452 bytes) and duplicated at 0x8b24aa4; the validated MGFEMBP expansion is 34,956 bytes, including 25,714 mapped ARM/Thumb instruction bytes. The expanded source owner is `mgfembp` and the receiving stub owners are `src/serial_boot.c`, `src/serial_poll.c`, and `src/serial_reset.c`.

Evidence: [asm/fe6sio.s:34](../asm/fe6sio.s#L34), [src/serial_boot.c:7](../src/serial_boot.c#L7), [src/serial_reset.c:18](../src/serial_reset.c#L18), [src/serial_reset.c:58](../src/serial_reset.c#L58), [src/serial_reset.c:59](../src/serial_reset.c#L59), [src/serial_reset.c:60](../src/serial_reset.c#L60), [src/serial_reset.c:62](../src/serial_reset.c#L62), [src/serial_reset.c:64](../src/serial_reset.c#L64). The 200 copied instruction bytes inside the orphan block are duplicates of those three serial-stub source owners. The current source does not name the local FE6SIO_Payload label as the input address passed to the receive buffer, so its exact transport edge remains open; the available source and payload representation are present.

The ordinary C LZ77 wrapper is BIOS SWI 0x11. The dedicated serial stub issues that same SWI directly with explicit staging/destination registers, so it is the concrete decompression-to-native-entry path found here. The authored-C call scan found no direct decompression whose second argument names a tracked native IWRAM buffer.

## Standard GBA MultiBoot transfer capability

`src/sio_multiboot.c:234` calls the `MultiBoot` BIOS wrapper, which issues SWI 0x25. `MultiBootStartMaster` stores a caller-provided `srcp`, rounds the requested length to 16 bytes, and sets the transfer end at `srcp + length` ([src/sio_multiboot.c:327](../src/sio_multiboot.c#L327), [src/sio_multiboot.c:337](../src/sio_multiboot.c#L337), [src/sio_multiboot.c:345](../src/sio_multiboot.c#L345)). The authored source has no named caller of `MultiBootStartMaster`, and no named FE6 payload edge into this generic transfer path. Treat it as a hardware transfer capability with an unresolved source owner at invocation, separate from the concrete FE6 serial-reset receive/decompress/entry sequence above.

## Native copies inside the expanded MGFEMBP payload

After the sidecar reaches 0x02010000 and enters its image, MGFEMBP Main clears IWRAM, installs its copied IRQ, copies its own ARM helper bundle, and later installs SRAM fast routines. Each copied instruction span maps to named C source owners in the payload tree:

| Path | Payload source span | IWRAM destination | Owner and consumer |
|---|---|---|---|
| MGFEMBP-IRQ-code-to-IWRAM | 0x201003c..0x201083c (0x800 bytes) | 0x3001420..0x3001c20 | mgfembp/src/irq_entry.c, mgfembp/src/irq_save_frame.c, mgfembp/src/irq_search.c, mgfembp/src/irq_continuation.c, mgfembp/src/interrupts.c; [mgfembp/src/interrupts.c:21](../mgfembp/src/interrupts.c#L21), [mgfembp/src/main.c:23](../mgfembp/src/main.c#L23) |
| MGFEMBP-ARM-routines-to-IWRAM | 0x201015c..0x2010474 (0x318 bytes) | 0x3000a10..0x3000d28 | mgfembp/src/ramfunc.c, mgfembp/src/color_fade_tick.c, mgfembp/src/clear_oam.c, mgfembp/src/checksum.c, mgfembp/src/tm_fill_rect.c, mgfembp/src/tm_copy_rect.c, mgfembp/src/tm_apply_tsa.c, mgfembp/src/put_oam.c, mgfembp/src/put_oam_lo.c; [mgfembp/src/ramfunc.c:21](../mgfembp/src/ramfunc.c#L21), [mgfembp/src/main.c:32](../mgfembp/src/main.c#L32) |
| MGFEMBP-SRAM-fast-functions-to-IWRAM | ReadSramFast_Core 0x2016ae8..0x2016b28 (0x40 bytes); VerifySramFast_Core 0x2016b68..0x2016bb4 (0x4c bytes) | 0x30002c0; 0x3000220 | mgfembp/src/gbasram.c, mgfembp/src/save.c; [mgfembp/src/gbasram.c:52](../mgfembp/src/gbasram.c#L52), [mgfembp/src/main.c:42](../mgfembp/src/main.c#L42) |

## Orphan block and supported-consumer evidence

The generated `gUnkData_108` array occupies 0x8b1fe7c..0x8b2a604 (42,888 bytes). The existing duplicate-content receipt accounts for its 200 copied native instruction bytes and embedded compressed payload. A source search finds the symbol only at its definition; no aligned ROM word points to the array base. Those are bounded positive and negative findings, not proof against an alias or computed address.

At offset 0xa028 (ROM 0x8b29ea4), the word is 0x85913f0. It equals `gProcScr_TalkWaitForInput` at 0x85913f0; [src/scene.c:111](../src/scene.c#L111) declares a `struct ProcCmd` table. It is a script-data pointer, not a native function address. No supported reader of the orphan array is named in production source.

## Scope limits and closure implications

The linker places IWRAM and EWRAM overlays in NOBITS/NOLOAD sections; `src/main.c` clears the runtime RAM before installing the IRQ and routine copies. This audit does not find a hidden linker-loaded IWRAM code image. Ordinary graphics, text, music, and battle-animation VM streams remain their own data/VM coverage work.

The main-game and MGFEMBP copies have concrete source owners and fixed extents. The mixer copy deliberately spans 0x400 bytes although the linker-bounded mixer is 0x3A4 bytes; the extra 0x5C bytes belong to adjacent already-sourced M4A functions. The SRAM Verify copies include a 2-byte alignment gap. These copied tails are not evidence of a missing routine. FE6 payload activation/transport and computed aliases remain bounded uncertainties, not new unsourced native implementation findings.

The linked ELF has no relocation sections. The companion [compile-provenance receipt](compile-provenance.json) matches the current main and MGFEMBP ELF/map hashes and lists 490 main-game and 31 MGFEMBP C-compiled source owners; runtime-library instruction owners are itemized separately. Across the four image receipts, every mapped source owner is C. `asm/arm.s` and `mgfembp/src/armfunc.s` provide section-boundary directives only; the FE6 `.incbin` assembly places compressed data and owns no native instruction implementation. These are layout/data owners, not remaining assembly-source routines. The script also records whether the complete production source-object set is present for optional undefined-symbol relocation checks; it does not rebuild.
