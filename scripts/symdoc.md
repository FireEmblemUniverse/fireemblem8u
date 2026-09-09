# Symbol-documentation tooling

Reusable helpers used to rename the project's placeholder symbols
(`sub_XXXX`, `gUnknown_XXXX`, `*_<addr>`) to meaningful names. Symbol names are
not present in the GBA ROM, so every rename preserves the SHA-1 match — these
tools verify that with `make compare` after applying.

## Appliers

- **`apply_renames.sh <map.tsv>`** — the safe workhorse. Takes a TSV of
  `OLD<TAB>NEW`, checks for collisions/invalid identifiers/address-like names
  against the current ELF, applies across `src include asm sound ldscript.txt
  sym_iwram.txt` via `fast_apply.py`, restores any `INCBIN`/`.incbin` asset paths
  the rename would have corrupted, rebuilds, and **hard-fails on SHA mismatch**.
- **`fast_apply.py <map.tsv> <file...>`** — one compiled alternation regex per
  file (sed with 1000+ rules is pathologically slow) + INCBIN-path restoration.
- **`rename_symbol.sh OLD NEW`** — rename a single symbol everywhere (whole-word).
- **`symdoc_filectx.py <targets_file>`** — propose names for address-named data
  symbols from their defining-file context (preserves an existing context prefix,
  else `<Type>_<FileCtx>_<ordinal>`); strips `Unknown`/`sub_` so the result is not
  re-flagged by calcrom.

## Workflow patterns (multi-agent)

- **`func_re_workflow.js`** / **`func_re_hard.js`** — reverse-engineer `sub_XXXX`
  functions: per-module agent reads each body + call sites, proposes a name, then
  an adversarial verifier accepts/rejects. Run via the `Workflow` tool with `args`
  = path to a JSON array of `{file, funcs}`.
- **`func_verify_workflow.js`** — audit already-assigned function names: per-file
  agent checks each name vs its code, an adversarial pass confirms corrections.
  `args` = path to a JSON array of `{file, names}`.

See the `project_symbol_documentation` auto-memory for the full methodology and
the pitfalls these tools encode (stale-baseline collisions, INCBIN-path
corruption, linker-symbol locations, stale/corrupt `.o` masking failures).
