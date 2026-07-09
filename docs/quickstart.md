# Fire Emblem 8U Quick Start

Get a working build of this decompilation with a single command using the bundled `scripts/quickstart.sh` helper. (If you prefer manual setup or run on another distro/package manager, see the README section below.)

## Prerequisites

- _(Optional)_ A legally obtained copy of **Fire Emblem: The Sacred Stones (USA)**. The build does **not** need it — the result is verified against `checksum.sha1` — so it is only used by `asmdiff.sh` for disassembly comparison. If you have one, place it at the repo root as `baserom.gba`, or pass `--rom /path/to/rom.gba` (or `FIREEMBLEM8U_ROM=/path/to/rom.gba`).
- Ubuntu/WSL (apt), Arch Linux/pacman, or macOS/Homebrew with sudo/admin access. The script only auto-installs dependencies for these package managers; other environments can still run manually.
- ~2.5 GB of free disk space and up to 15 minutes for the first full build.

## One-command setup

From the repo root, run:

```bash
./scripts/quickstart.sh [--rom /path/to/baserom.gba] [--refresh-agbcc]
```

What the script now does:

1. Copies `baserom.gba` from the `--rom` path (or `FIREEMBLEM8U_ROM`) if you provided one. A missing ROM is fine — it is optional and not required to build.
2. Detects your package manager (`apt`, `pacman`, or `brew`) and installs the prerequisites only when they’re not already available:
   - Toolchain (`arm-none-eabi-binutils`/`arm-none-eabi-gcc`)
   - `pkg-config` / `pkgconf`
   - `libpng`
   - `python3`, `pip3`, `numpy`, `pillow`
3. Checks whether `tools/agbcc/bin/agbcc` already exists. If it does, the script reuses it; otherwise it clones and builds [`pret/agbcc`](https://github.com/pret/agbcc) inside `.deps/agbcc` (ignored by git), installs it into `tools/agbcc`, and you can force a refresh any time with `--refresh-agbcc`.
4. Fetches submodules (`git submodule update --init --recursive`). The FE6 SIO link payload is built from source via the [mgfembp](https://github.com/StanHash/mgfembp) submodule rather than a committed blob.
5. Builds helper tools via `./build_tools.sh`.
6. Runs `make -j$(nproc)` to produce `fireemblem8.gba`. The first build also fetches/builds mgfembp's own agbcc variant (`010110-ThumbPatch`) for the payload sub-build.
7. Verifies the ROM hash with `sha1sum -c checksum.sha1`.

On success you’ll see:

```
fireemblem8.gba: OK
[✓] Build complete: /path/to/fireemblem8u/fireemblem8.gba
```

## Troubleshooting

- **No ROM** – `baserom.gba` is optional; the build works and self-verifies without it. Provide `--rom /path/to/rom.gba` (or `FIREEMBLEM8U_ROM=/path/to/rom.gba`) only if you want to use `asmdiff.sh`.
- **No sudo/root** – apt/pacman installs require elevated privileges. If you run the script without sudo, it will skip the package install step and remind you to install the prerequisites manually before re-running. Homebrew installs keep working without sudo.
- **Unsupported distro** – Install the prerequisites manually (arm-none-eabi toolchain, pkg-config, libpng, python3, pip, numpy, pillow) then rerun the script; it’ll skip package installs once the tools are on your PATH.
- **Already-installed toolchain** – The script detects `arm-none-eabi-*` binaries and skips reinstalling them. Existing `tools/agbcc` installs are reused too; run `./scripts/quickstart.sh --refresh-agbcc` if you need a fresh copy.
- **Slower rebuilds** – Subsequent `make` runs are faster. For incremental work, run `make -j$(nproc)` manually.

After the script finishes, launch your preferred emulator with `fireemblem8.gba` or start modifying the source.
