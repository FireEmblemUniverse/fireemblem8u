# agbcc NOP builtin

The eventinfo translation unit uses this pinned compiler variant. The zero-argument
void `__builtin_matching_nop()` emits ARMv4T's canonical `mov r8, r8` through
compiler RTL. An internal instruction UID keeps explicit source calls distinct
during tail merging; it is not emitted into the binary. Other source retains
the baseline compiler behavior. The builder clones committed source at
`da598c1d918402c42c0c0d7128ba14567f3175e9` from `.deps/agbcc`, applies checked
source edits, builds serially and records source/compiler hashes. Output is
`.deps/event-nop/agbcc`; no ROM or generated compiler binary is committed.
