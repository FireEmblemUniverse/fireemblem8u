# Git hooks

Local commit gates that mirror CI, so a red build never reaches `main`.

## Install (once per clone)

```sh
./githooks/install.sh      # sets core.hooksPath=githooks
```

or manually: `git config core.hooksPath githooks`.

## What the pre-commit hook does

On any commit that touches build inputs (`src/`, `asm/`, `layout/`,
`graphics/`, `sound/`, `data/`, `banim/`, `Makefile`, `*.c/.h/.s/.inc/.tsv/.mk`,
etc.) it runs, in order:

1. **`make compare`** — the byte-match / self-containment oracle
   (`fireemblem8.gba: OK`). Incremental, so it is fast (~1–2 min) once the tree
   is built; a fresh tree's first run is a full ~5 min build.
2. **`make shiftcheck`** — the blocking shiftability gate (fails on
   `[A] HIGH` un-relocated data pointers). ~13 s once the ELF is built.

These are exactly the two gates CI enforces (CI is a ~5.5 min clean build), so
catching them locally avoids the slow CI round-trip and keeps `main` green.

## Bypass (use sparingly)

```sh
git commit --no-verify          # skip all hooks
FE8J_SKIP_HOOK=1 git commit     # skip just this build gate
```

The hook also auto-skips for doc-only commits and during
rebase/merge/cherry-pick, and skips gracefully (with a warning) if the
`arm-none-eabi` toolchain or `tools/agbcc` is absent.
