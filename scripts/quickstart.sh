#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./scripts/quickstart.sh [--rom /path/to/baserom.gba] [--refresh-agbcc]

Options:
  --rom PATH        Copy the ROM from PATH to baserom.gba if it is missing.
                    Optional: the build is byte-verified against checksum.sha1,
                    so baserom.gba is NOT required to build. It is only used by
                    asmdiff.sh for disassembly comparison.
  --refresh-agbcc   Force re-clone/rebuild of agbcc even if one exists in tools/agbcc.

You can also set FIREEMBLEM8U_ROM to point to the ROM.
EOF
}

FORCE_AGBCC_UPDATE=0
ROM_SOURCE="${FIREEMBLEM8U_ROM:-}"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --rom)
      ROM_SOURCE="$2"
      shift 2
      ;;
    --rom=*)
      ROM_SOURCE="${1#*=}"
      shift 1
      ;;
    --refresh-agbcc)
      FORCE_AGBCC_UPDATE=1
      shift 1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
AGBCC_SRC_DIR="${PROJECT_DIR}/.deps/agbcc"
AGBCC_INSTALL_DIR="${PROJECT_DIR}/tools/agbcc"
AGBCC_BIN="${AGBCC_INSTALL_DIR}/bin/agbcc"
BASEROM_PATH="${PROJECT_DIR}/baserom.gba"

# baserom.gba is OPTIONAL: the build is verified against checksum.sha1, not the
# original ROM. It is only used by asmdiff.sh for disassembly comparison, so a
# missing ROM is a note, not a failure.
ensure_baserom() {
  if [[ -f "${BASEROM_PATH}" ]]; then
    return
  fi

  if [[ -n "${ROM_SOURCE}" ]]; then
    echo "[+] Copying ROM from ${ROM_SOURCE}"
    cp "${ROM_SOURCE}" "${BASEROM_PATH}"
    return
  fi

  cat <<'EOF'
[=] No baserom.gba found -- continuing (it is optional and not needed to build).
    Provide one with --rom /path/to/rom.gba (or FIREEMBLEM8U_ROM=...) only if you
    want to use asmdiff.sh for disassembly comparison.
EOF
}

have_cmd() {
  command -v "$1" >/dev/null 2>&1
}

install_python_modules() {
  if have_cmd pip3; then
    pip3 install --user --upgrade numpy pillow >/dev/null
  fi
}

install_deps() {
  local pkg_mgr=""
  if have_cmd apt-get; then
    pkg_mgr="apt"
  elif have_cmd pacman; then
    pkg_mgr="pacman"
  elif have_cmd brew; then
    pkg_mgr="brew"
  else
    echo "[!] No supported package manager detected (apt, pacman, brew)." >&2
    echo "    Install the prerequisites manually: binutils arm-none-eabi toolchain, pkg-config, libpng, python3, pip, numpy, pillow." >&2
    return
  fi

  local need_toolchain=0
  if ! have_cmd arm-none-eabi-as; then
    need_toolchain=1
  fi

  case "${pkg_mgr}" in
    apt)
      local sudo_cmd=""
      if (( EUID != 0 )); then
        if have_cmd sudo; then
          sudo_cmd="sudo"
        else
          echo "[!] Need root privileges to install packages via apt, but sudo is unavailable." >&2
          echo "    Install the prerequisites manually and rerun the script." >&2
          return
        fi
      fi
      echo "[+] Updating apt package index..."
      ${sudo_cmd} apt-get update -y >/dev/null
      local packages=(pkg-config libpng-dev python3-pip python3-numpy python3-pil)
      if (( need_toolchain )); then
        packages=(binutils-arm-none-eabi "${packages[@]}")
      fi
      if [[ ${#packages[@]} -gt 0 ]]; then
        echo "[+] Installing packages via apt: ${packages[*]}"
        ${sudo_cmd} apt-get install -y "${packages[@]}" >/dev/null
      fi
      ;;
    pacman)
      local sudo_cmd=""
      if (( EUID != 0 )); then
        if have_cmd sudo; then
          sudo_cmd="sudo"
        else
          echo "[!] Need root privileges to install packages via pacman, but sudo is unavailable." >&2
          echo "    Install the prerequisites manually and rerun the script." >&2
          return
        fi
      fi
      local packages=(pkgconf libpng python-pip python-numpy python-pillow)
      if (( need_toolchain )); then
        packages=(arm-none-eabi-binutils "${packages[@]}")
      fi
      echo "[+] Installing packages via pacman: ${packages[*]}"
      ${sudo_cmd} pacman -Sy --needed --noconfirm "${packages[@]}"
      ;;
    brew)
      local packages=(pkg-config libpng)
      if (( need_toolchain )); then
        packages=(arm-none-eabi-gcc "${packages[@]}")
      fi
      echo "[+] Installing packages via Homebrew: ${packages[*]}"
      brew update >/dev/null
      brew install "${packages[@]}"
      echo "[+] Ensuring Python modules (numpy, pillow) via pip3"
      install_python_modules
      return
      ;;
  esac
}

prepare_agbcc() {
  if [[ -x "${AGBCC_BIN}" && ${FORCE_AGBCC_UPDATE} -eq 0 ]]; then
    echo "[=] Using existing agbcc at ${AGBCC_INSTALL_DIR}"
    return
  fi

  mkdir -p "${PROJECT_DIR}/.deps"
  if [[ ! -d "${AGBCC_SRC_DIR}/.git" ]]; then
    echo "[+] Cloning agbcc into ${AGBCC_SRC_DIR}"
    rm -rf "${AGBCC_SRC_DIR}"
    git clone https://github.com/pret/agbcc.git "${AGBCC_SRC_DIR}"
  fi

  pushd "${AGBCC_SRC_DIR}" >/dev/null
    echo "[+] Updating agbcc source"
    git fetch origin >/dev/null
    git reset --hard origin/master >/dev/null
    echo "[+] Building agbcc"
    ./build.sh
    echo "[+] Installing agbcc into project"
    ./install.sh "${PROJECT_DIR}"
  popd >/dev/null
}

build_project() {
  pushd "${PROJECT_DIR}" >/dev/null
    echo "[+] Fetching submodules (mgfembp FE6 SIO payload sub-build)"
    git submodule update --init --recursive
    echo "[+] Building project-specific tools"
    ./build_tools.sh
    echo "[+] Building fireemblem8u (this can take several minutes)"
    echo "    (first build also fetches/builds the mgfembp agbcc variant for the FE6 SIO payload)"
    make -j"$(nproc)"
    echo "[+] Verifying ROM checksum"
    sha1sum -c checksum.sha1
    echo "[✓] Build complete: ${PROJECT_DIR}/fireemblem8.gba"
  popd >/dev/null
}

ensure_baserom
install_deps
prepare_agbcc
build_project
