# Unmatched audio C candidates

`ply_fine.c` is excluded from the production build. With GNU ARM GCC 16.2.0
and the flags below, its linked body is 46 bytes at `0x080CF928`. All but two
bytes match the canonical USA ROM:

| Address | Original | Candidate |
| --- | --- | --- |
| `0x080CF92A` | `adds r5, r1, #0` (`1c0d`) | `movs r5, r1` (`000d`) |
| `0x080CF940` | `adds r0, r4, #0` (`1c20`) | `movs r0, r4` (`0020`) |

These differ in encoding and condition-flag effects. The candidate is not
counted as a completed conversion. All other instructions, including the
relocated call to `RealClearChain`, match. The handler releases active channels,
unlinks each channel, follows its retained next pointer, and clears track flags.
Empty constraints preserve the original registers and keep constants inside
the loop; no instruction templates are embedded.

Compile from the repository root:

```sh
arm-none-eabi-gcc -S research/audio/ply_fine.c -I tools/agbcc/include -iquote include -iquote . -nostdinc -std=gnu89 -O1 -mthumb -mcpu=arm7tdmi -mabi=apcs-gnu -ffreestanding -fno-builtin -fno-strict-aliasing -fomit-frame-pointer -fno-schedule-insns -fno-schedule-insns2 -fno-if-conversion -fno-if-conversion2 -fno-reorder-blocks -o .deps/audio-match/fine-modern.s
```

Assemble with GNU ARM `as -mcpu=arm7tdmi`. Link `.text` at `0x080CF928`
with a Thumb alias `.thumb_set RealClearChain, 0x080CF909`; using an untyped
absolute symbol can introduce an unwanted interworking veneer. Compare the
resulting 46-byte `.text` with ROM offsets `0xCF928..0xCF956`.

The straightforward C implementation under legacy agbcc instead emits AND/CMP
rather than TST and uses r0 rather than r1 for the status OR/store. Modern GCC's
`-mno-asm-syntax-unified` does not change the two remaining copy encodings.
The next matching problem is selecting ADD-zero copies without adding
instructions or changing the current register allocation.
