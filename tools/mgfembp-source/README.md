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
