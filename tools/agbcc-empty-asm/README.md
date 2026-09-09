# agbcc with accurate empty-template lengths

This host compiler is used only for `src/eventscr.c`. The other translation
units keep their existing compilers.

Upstream: https://github.com/pret/agbcc.git

Pinned revision: `da598c1d918402c42c0c0d7128ba14567f3175e9`

In upstream `gcc/final.c`, `asm_insn_count` starts at one even when the template
is empty. Thumb's default instruction length is two bytes, so an empty compiler
constraint contributes two nonexistent bytes to branch-distance estimation.
The patch returns zero for an exactly empty template and otherwise leaves the
original estimator unchanged. It contains no game symbols, addresses, register
preferences or opcode substitutions.

This lets `Event1B_TEXTSHOW` express its constant load as C with an empty
read/write constraint while retaining its original short switch-dispatch
branch. The complete 340-byte function and the entire ROM match with this
compiler. Compiler estimates for nonempty templates remain unchanged.

`make` builds the variant automatically when needed. To build it explicitly:

```sh
python3 tools/agbcc-empty-asm/build.py
```

The builder uses the pinned commit from `.deps/agbcc` if it is available,
otherwise it clones upstream. `--source PATH` selects another local git
checkout containing that commit. Local working-tree changes are never copied.
The patched source must match an exact SHA-256 before compilation.
The generated checkout, build log and provenance hashes remain in a unique
ignored `.deps/agbcc-empty-asm-build-*` directory. The binary is copied
atomically to `tools/agbcc-empty-asm/agbcc` and is ignored by git. Builds are serial because
the upstream Makefile's generated-header dependencies are not parallel-safe.
The build requires Python 3, Git, Make and the host C compiler used for agbcc.

The patch modifies GNU GCC source under its upstream GNU General Public
License, version 2 or later. The upstream license is included in `COPYING`.
The compiler source is retrieved at the pinned revision, not vendored here.
