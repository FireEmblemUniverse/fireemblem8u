# Payload source revisions

The payload submodule now includes local matching-C work. These commits have
not been published to its upstream repository. `decomp-completion.bundle`
contains the exact additional Git objects and commit, using upstream revision
`c87e74dcd6c8878b809e013cd8ff0c52baa75332` as its prerequisite. It contains source
changes only, with no ROM or generated game binaries.

After cloning this parent repository, restore its pinned payload with:

```sh
python3 tools/mgfembp-source/restore.py
```

The helper initializes/clones the configured upstream source when needed,
fetches the bundled commit if absent, and checks out the parent's indexed
submodule revision. Existing uncommitted changes are preserved: the helper
stops instead of checking out a different revision over them. Normal builds
invoke this helper when the payload Makefile is missing.

The bundled changes replace embedded ClearOam (92 bytes), TmApplyTsa
(84 bytes), and Checksum32 (72 bytes) with matching ARM C. All three payload versions pass their existing
reference checksums.
When adding further payload commits, regenerate this incremental bundle against
the same upstream base so a fresh checkout can restore the complete local chain.

The bundle also pins and repairs the embedded compiler installer. It serializes
legacy generator builds, stops on errors, and stages installation; a fresh
toolchain and fresh object builds of all three payload variants were verified.

Embedded ColorFadeTick is also matching C: 208 instruction bytes plus its
12-byte pointer pool. The bundle includes the complete ARM plugin sources and
helpers so standalone payload builds do not depend on files in the parent repo.
All three payload reference checksums remain exact.

Embedded TmCopyRect is matching C as well (92 bytes). The bundled compiler
source includes the guarded zero/sign branch-pair rule; all three payload
reference checksums still pass.

Embedded TmFillRect is now matching C (56 bytes), using the bundled compiler's
optional scalar-copy encoding rule. All three payload checksums still match.

The bundled compiler sources remain synchronized with the main game's optional
same-section pool-sharing support and its garbage-collection stress checks.
Payload translation units do not enable sharing; their checksums are unchanged.

Embedded PutOamLo now uses the parent repository's checked matching compiler
and OAM-entry pass. Its 12 instruction bytes and four-byte cursor pointer
match all payload versions. The payload Makefile can request the compiler
from the parent build when it is absent.

The two embedded interworking veneers now use explicit C Thumb handoffs and
ARM tail-call wrappers, replacing fake_glue.s. Parent compiler dependencies
and linker adjacency assertions are part of the bundled payload build.

Payload BIOS wrappers now use ordinary C setup/returns and explicit inline
SWIs, including the stack-changing reset sequence. All three complete BIOS
regions remain byte-identical; linker ordering preserves their entry points.

The payload IRQ priority search is now checked C with its original grouped
0xC0 first priority. Cross-section startup literal distances and search
entry/continuation placement are enforced by the linker.

The payload IRQ register setup now builds from checked C. Startup ADR and
entry/saved-frame/search fallthrough distances are enforced by linker
assertions; all three payload images remain exact.

The payload IRQ saved frame now uses C stores and an explicit SPSR read,
compiled with the parent matching compiler and IRQ frame pass. The payload
Makefile builds the pass on demand and retains the checked search adjacency.
