#!/usr/bin/env python3
"""Check the candidate's C arithmetic; this does not verify ARM byte matching."""
import ctypes
from pathlib import Path
import re
import subprocess
import tempfile


def main():
    source = Path(__file__).with_name('color_fade_tick.c').read_text()
    # Remove only empty register constraints for a native execution of the same C.
    source = re.sub(r' asm\("r[0-9]+"\)', '', source)
    source = re.sub(r'asm\(""[^;]*\);', '', source)
    assert 'asm(' not in source
    source += '\nu16 gPaletteBuffer[512];\ns8 gFadeComponents[1536];\ns8 gFadeComponentStep[32];\n'
    with tempfile.TemporaryDirectory(prefix='color-fade-check-') as temporary:
        root = Path(temporary)
        (root / 'candidate.c').write_text(source)
        subprocess.run(['cc', '-shared', '-fPIC', '-O2', str(root / 'candidate.c'),
                        '-o', str(root / 'candidate.so')], check=True)
        library = ctypes.CDLL(str(root / 'candidate.so'))
        palette = (ctypes.c_uint16 * 512).in_dll(library, 'gPaletteBuffer')
        components = (ctypes.c_uint8 * 1536).in_dll(library, 'gFadeComponents')
        steps = (ctypes.c_int8 * 32).in_dll(library, 'gFadeComponentStep')
        seen = set()
        for group in range(8):
            for batch in range(6):
                expected_components = []
                expected_palette = []
                for pal in range(32):
                    step = group * 32 + pal - 128
                    steps[pal] = step
                    for color in range(16):
                        packed = 0
                        palette[pal * 16 + color] = 0xA55A
                        for component in range(3):
                            value = (batch * 48 + color * 3 + component) & 255
                            index = pal * 48 + color * 3 + component
                            components[index] = value
                            seen.add((value, step))
                            if step == 0:
                                expected_components.append(value)
                            else:
                                total = value + step
                                expected_components.append(total & 255)
                                packed |= min(31, max(0, total - 32)) << (component * 5)
                        expected_palette.append(packed if step else 0xA55A)
                library.ColorFadeTick()
                assert list(components) == expected_components, (group, batch, 'components')
                assert list(palette) == expected_palette, (group, batch, 'palette')
        assert len(seen) == 65536
    print('All 65,536 byte/signed-step pairs pass; zero-step palettes remain unchanged.')


if __name__ == '__main__':
    main()
