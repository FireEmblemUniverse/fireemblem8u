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

## Legacy backend experiment

The pinned legacy backend (`gcc/thumb.md`) has no bitwise TST pattern. Its
`tstsi` pattern is a single-register zero comparison and emits CMP, so changing
C expressions alone cannot request the missing instruction through that pattern.
An isolated compiler experiment added a general recognition pattern for
`(set (cc0) (compare (and:SI reg reg) (const_int 0)))`. Changing the candidate
condition to `mask & status` then generated all original 46 function bytes,
including the two ADD-zero copies. The output section also had two trailing
alignment bytes; those are outside the function's 46-byte extent.

**That compiler experiment is not safe to integrate.** Without a condition on
flag use, it also changes signed comparisons of `(a & b)` into TST followed by
BLT/BGE/BLE/BGT. TST preserves V, whereas CMP against zero clears V, so those
branches can differ when incoming V is set. Explicit EQ, NE, LT, LE, GT and GE
probe functions exposed this issue. No experimental compiler is selected by
the production Makefile.

An attempted guard using `next_cc0_user(insn)` plus an EQ/NE conditional-jump
check prevented the rewrite for every probe, including EQ/NE and `ply_fine`.
A safe backend implementation therefore still needs either a proven check on
condition-code consumers during combine or a combined test-and-equality-branch
pattern with correct branch-length accounting. An unrestricted TST rule is
not an acceptable matching solution. Experiment sources and logs remain in
`.deps/agbcc-tst-gcc` and `.deps/audio-match`.
