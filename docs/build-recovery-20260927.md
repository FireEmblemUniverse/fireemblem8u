# Build recovery and fresh-source rebuild (2026-09-27)

This report records build reproducibility evidence only. It does not claim that the FE Sacred Stones decompilation is complete.

## Recovered build dependencies

At resume, `.deps` contained only `jev-coverage-review`; the installed compilers, main ELF/map, ROM, baserom, and payload binaries were preserved. The first `make -j4 compare` failed because the pinned agbcc source checkout under `.deps/agbcc` was missing (`.deps/make-compare-recovery.log`). I restored a clean detached checkout at commit `da598c1d918402c42c0c0d7128ba14567f3175e9` and kept the existing installed `tools/agbcc/bin` compiler intact.

I restored the matching GCC backend by running the project-pinned builder, `tools/arm-dispatch/build_backend.py`. It fetched and built GCC 16.2.0 under `.deps/gcc16-matching`; the build tree is 1.8 GiB. The builder pins the GCC archive SHA-256 to `e6738e29597f733270731aa90600f37ffdc045079dfc27ec7e8192cc81085c3e`. Its build record also pins the matching extension (`96bbef8658fc5bb5dd1fe41c8b6b69369c24f81c6700e989358722a6495373e0`), leaf-frame patch (`5e8f70466e7d5dfbbea133c61807c05cf5f1df11a72e1c5ce97a972206f57f09`), patched `arm.cc` (`c33816b724d0f27bb93e806e3e5eb6769301617d97148adecb01fa7e707cda2f`), and resulting `cc1` (`bc28458eb8554c081ad7bb784869221b84e3b60af35a8cbec24022957d70f7f2`). The compiler identifies as `arm-none-eabi-gcc (GCC) 16.2.0`.

With the missing checkout restored, `make -j4 compare` passed. Its incremental command accounting shows 149 of the 1,327 objects in `objects.lst` rebuilt and 1,178 reused. That check established a working build but was not treated as fresh-source evidence.

## Bounded fresh-source rebuild

Before removing any object files, I recorded their size and SHA-256 in `.deps/pre-forced-object-baseline.json` and preserved all 1,432 files in `.deps/pre-forced-object-cache.tar.gz`. The archive was checked against every manifest entry before removal. The six per-version `fake_glue.o` and `gbasvc.o` files are now explicitly classified in the manifest as stale cache entries: none has a matching `.c` or `.s` source, none is referenced by a payload-map `LOAD`, and none was recreated. They remain recoverable from the verified archive. The three payload maps each link 33 objects, for 99 current payload object targets total.

After removing only the manifest-listed cached `.o` outputs, I rebuilt the payload variants first with:

```sh
env -u C_INCLUDE_PATH -u CPATH -u CPLUS_INCLUDE_PATH make -j4 -C mgfembp compare
```

Then I forced the main build from its missing object outputs with:

```sh
make -j4 compare
```

Both completed successfully. The payload build regenerated all 99 map-linked objects across the three versions, and the main build regenerated all 1,327 objects listed in `objects.lst`. A post-build hash check found all 1,426 current production object outputs present and byte-identical to their saved pre-removal versions, with zero changed outputs. The six stale cache files remain absent. The main ROM checksum passed at SHA-1 `c25b145e37456171ada4b0d440bf88a19f4d509f` (16,777,216 bytes).

The output accounting artifacts distinguish the two checks: `.deps/make-compare-object-accounting.json` is the incremental 149/1,178 record, while the pre-removal manifest and archive plus successful rebuild logs document the fresh-source run. The fresh rebuild did not bootstrap the already-installed old agbcc compiler; the runtime verifier fingerprints and reuses that compiler.

## Runtime, orphan, and image verification

After the fresh object rebuild, `scripts/rebuild_orphan_from_objects.py --objects objects.lst --verify` passed. It rebuilt the 42,888-byte orphan object exactly and refreshed `docs/orphan-object-rebuild.json` with `reference_compared: true`.

`python3 scripts/verify_runtime_rebuild.py --json docs/runtime-rebuild.json` passed its isolated pinned-runtime rebuild and exported-symbol comparisons for all four images. Each image matched the expected image SHA-1 and each `global_symbols_match` value is true:

| Image | Bytes | SHA-1 |
| --- | ---: | --- |
| Main ROM | 16,777,216 | `c25b145e37456171ada4b0d440bf88a19f4d509f` |
| `mgfembp` | 34,956 | `8a81a47d88f6b0a3f91c49784b9f7b317382abac` |
| `mgfembp_20030206` | 34,788 | `6674fc5b5ee26433665c44b842cdb26bcf785051` |
| `mgfembp_20030219` | 34,196 | `ad3ffdb4fc50206f944972a0a7ad26bfa8b5ef74` |

The runtime receipt records source commit `da598c1d918402c42c0c0d7128ba14567f3175e9`, source archive hash, compiler hash, and rebuilt `libc`/`libgcc` hashes. Its scope limitation remains: non-runtime project objects in that isolated check are reused; the separate bounded rebuild above supplies fresh-source evidence for the main and payload object sets.

## Evidence files and hashes

SHA-256 hashes below identify the logs and receipts used for this report. All paths are relative to the repository root.

| Evidence | SHA-256 |
| --- | --- |
| `.deps/gcc16-build.log` | `e9a7452383634b5e6506d16cc3388002659e6c4c2c0e8295709f339a1322deef` |
| `.deps/make-compare-recovery.log` (initial missing-checkout failure) | `1af738fc2981e6a894a5823b90480f66480667f811b4bdcf7de1e0b3177ce159` |
| `.deps/make-compare-recovery-retry.log` | `94f6f95d3a92d8b92c671a1144410cdc2acf8a82d5939887273cf821de3a65f9` |
| `.deps/mgfembp-forced-compare.log` | `e0eb701da691d320bd1f6e52b89744ba20ef5d110506a8aaf9e9f006d4bbc8a0` |
| `.deps/main-forced-compare.log` | `17719fd5372a9fb8955117e75ca10b7af3986109c72df69b167dec0530541d4c` |
| `.deps/make-compare-object-accounting.json` | `cbcb2d4a2de644024f7153cbbb86f132a12f13d873629518ba55a8f8a892e5b2` |
| `.deps/pre-forced-object-baseline.json` (corrected stale-cache classification) | `cbf17a72a666c67ed4d1195480f82829202ac27521ea585bce6446078bb81187` |
| `.deps/pre-forced-object-cache.tar.gz` | `2b1d8b784ee4b9901f6426f1f8a90fe4019e7dcee954bc120aab6595019fe59b` |
| `.deps/orphan-rebuild-verify.log` | `6e43ed0b4039c35189672f86b8c53c0cb8271ec1404625f5ddf31dc5d75b6484` |
| `.deps/runtime-rebuild-verification.log` | `f08966f433472d17587f58ab48a77a70874c012db4f716e36d6e80ebd7b7c890` |
| `docs/runtime-rebuild.json` | `3e2c65c4a71553de6801a701900b9959abbc31e7a9e7ea90601a3473eaa1fbdb` |
| `docs/orphan-object-rebuild.json` | `a8e49d9ed09d780b10df91cac88044b07f70d5a8e0da7c164e2980dbeb2feaa3` |

No build or verifier process remains active. This work changed generated dependency/build artifacts and the authorized build/runtime/orphan evidence; it did not edit the Makefile or production source.
