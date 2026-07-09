#!/usr/bin/env bash
# Fetch the portable GBAHawk emulator + stage it for the TAS replay validation.
# GBAHawk is portable (no install). Run from WSL2; everything lands under a
# Windows-accessible working dir so the Windows GBAHawk.exe can read it.
#
# Usage: get_gbahawk.sh [version] [work_dir] [gba_bios_path]
#   version       default v2.1.1 (the version the vykan12 movie was recorded on;
#                 use the movie's emuVersion to avoid core-version desync)
#   work_dir      default /mnt/c/gbahawk_test  (= C:\gbahawk_test)
#   gba_bios_path optional path to a local gba_bios.bin (sha1 300c20df...). If
#                 omitted, the real GBA BIOS the movie requires is downloaded from
#                 the public retrobios collection and verified by sha1.
set -euo pipefail

VER="${1:-v2.1.1}"
# GBAHawk is a Windows binary driven from WSL2, so a Windows-visible path (/mnt/c) is
# the default; fall back to a user-local dir when not under WSL (pure Linux/macOS).
if [ -d /mnt/c ]; then WORK="${2:-/mnt/c/gbahawk_test}"; else WORK="${2:-$HOME/gbahawk_test}"; fi
BIOS="${3:-}"
BIOS_SHA1="300c20df6731a33952ded8c436f7f186d25d3492"
BIOS_URL="https://raw.githubusercontent.com/Abdess/retrobios/main/bios/Nintendo/Game%20Boy%20Advance/gba_bios.bin"

mkdir -p "$WORK"
zip="$WORK/GBAHawk.${VER}.zip"
url="https://github.com/alyosha-tas/GBAHawk/releases/download/${VER}/GBAHawk.${VER}.zip"
[ -f "$zip" ] || { echo "downloading $url"; curl -L -s -o "$zip" "$url"; }

dest="$WORK/GBAHawk_${VER}"
python3 -c "import zipfile,sys; zipfile.ZipFile(sys.argv[1]).extractall(sys.argv[2])" "$zip" "$dest"
exe="$(find "$dest" -maxdepth 2 -iname GBAHawk.exe | head -1)"
[ -n "$exe" ] || { echo "GBAHawk.exe not found after extract" >&2; exit 1; }
echo "extracted: $exe"

# The movie requires the real GBA BIOS (sha1 300c20df...). Use a local copy if
# given, else download it from the public retrobios collection; verify the sha1.
fw="$(dirname "$exe")/Firmware/gba_bios.bin"
if [ -z "$BIOS" ]; then
  BIOS="$WORK/gba_bios.bin"
  [ -f "$BIOS" ] || { echo "downloading GBA BIOS from $BIOS_URL"; curl -L -s -o "$BIOS" "$BIOS_URL"; }
fi
got="$(sha1sum "$BIOS" | cut -d' ' -f1)"
[ "$got" = "$BIOS_SHA1" ] || { echo "GBA BIOS sha1 $got != $BIOS_SHA1 (need the real BIOS)" >&2; exit 1; }
cp "$BIOS" "$fw"
echo "placed GBA BIOS in Firmware/ (sha1 ok)"
echo "GBAHAWK_EXE=$exe"
