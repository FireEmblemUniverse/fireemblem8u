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

The bundled changes replace embedded ClearOam (92 bytes) and TmApplyTsa
(84 bytes) with matching ARM C. All three payload versions pass their existing
reference checksums.
When adding further payload commits, regenerate this incremental bundle against
the same upstream base so a fresh checkout can restore the complete local chain.
