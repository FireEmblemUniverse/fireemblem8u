/* 
 * This file contains LUTs that convert glyph image data to the 4 bits per pixel
 * format that the GBA expects. Each glyph image is stored in a 2bpp format, with
 * each byte representing four 2-bit pixels. By indexing these arrays, the
 * source byte is converted to a 16-bit value representing four 4-bit pixels.
 */

#define GENERATE_LOOKUP_TABLE \
  X(0x00), X(0x01), X(0x02), X(0x03), X(0x04), X(0x05), X(0x06), X(0x07), \
  X(0x08), X(0x09), X(0x0A), X(0x0B), X(0x0C), X(0x0D), X(0x0E), X(0x0F), \
  X(0x10), X(0x11), X(0x12), X(0x13), X(0x14), X(0x15), X(0x16), X(0x17), \
  X(0x18), X(0x19), X(0x1A), X(0x1B), X(0x1C), X(0x1D), X(0x1E), X(0x1F), \
  X(0x20), X(0x21), X(0x22), X(0x23), X(0x24), X(0x25), X(0x26), X(0x27), \
  X(0x28), X(0x29), X(0x2A), X(0x2B), X(0x2C), X(0x2D), X(0x2E), X(0x2F), \
  X(0x30), X(0x31), X(0x32), X(0x33), X(0x34), X(0x35), X(0x36), X(0x37), \
  X(0x38), X(0x39), X(0x3A), X(0x3B), X(0x3C), X(0x3D), X(0x3E), X(0x3F), \
  X(0x40), X(0x41), X(0x42), X(0x43), X(0x44), X(0x45), X(0x46), X(0x47), \
  X(0x48), X(0x49), X(0x4A), X(0x4B), X(0x4C), X(0x4D), X(0x4E), X(0x4F), \
  X(0x50), X(0x51), X(0x52), X(0x53), X(0x54), X(0x55), X(0x56), X(0x57), \
  X(0x58), X(0x59), X(0x5A), X(0x5B), X(0x5C), X(0x5D), X(0x5E), X(0x5F), \
  X(0x60), X(0x61), X(0x62), X(0x63), X(0x64), X(0x65), X(0x66), X(0x67), \
  X(0x68), X(0x69), X(0x6A), X(0x6B), X(0x6C), X(0x6D), X(0x6E), X(0x6F), \
  X(0x70), X(0x71), X(0x72), X(0x73), X(0x74), X(0x75), X(0x76), X(0x77), \
  X(0x78), X(0x79), X(0x7A), X(0x7B), X(0x7C), X(0x7D), X(0x7E), X(0x7F), \
  X(0x80), X(0x81), X(0x82), X(0x83), X(0x84), X(0x85), X(0x86), X(0x87), \
  X(0x88), X(0x89), X(0x8A), X(0x8B), X(0x8C), X(0x8D), X(0x8E), X(0x8F), \
  X(0x90), X(0x91), X(0x92), X(0x93), X(0x94), X(0x95), X(0x96), X(0x97), \
  X(0x98), X(0x99), X(0x9A), X(0x9B), X(0x9C), X(0x9D), X(0x9E), X(0x9F), \
  X(0xA0), X(0xA1), X(0xA2), X(0xA3), X(0xA4), X(0xA5), X(0xA6), X(0xA7), \
  X(0xA8), X(0xA9), X(0xAA), X(0xAB), X(0xAC), X(0xAD), X(0xAE), X(0xAF), \
  X(0xB0), X(0xB1), X(0xB2), X(0xB3), X(0xB4), X(0xB5), X(0xB6), X(0xB7), \
  X(0xB8), X(0xB9), X(0xBA), X(0xBB), X(0xBC), X(0xBD), X(0xBE), X(0xBF), \
  X(0xC0), X(0xC1), X(0xC2), X(0xC3), X(0xC4), X(0xC5), X(0xC6), X(0xC7), \
  X(0xC8), X(0xC9), X(0xCA), X(0xCB), X(0xCC), X(0xCD), X(0xCE), X(0xCF), \
  X(0xD0), X(0xD1), X(0xD2), X(0xD3), X(0xD4), X(0xD5), X(0xD6), X(0xD7), \
  X(0xD8), X(0xD9), X(0xDA), X(0xDB), X(0xDC), X(0xDD), X(0xDE), X(0xDF), \
  X(0xE0), X(0xE1), X(0xE2), X(0xE3), X(0xE4), X(0xE5), X(0xE6), X(0xE7), \
  X(0xE8), X(0xE9), X(0xEA), X(0xEB), X(0xEC), X(0xED), X(0xEE), X(0xEF), \
  X(0xF0), X(0xF1), X(0xF2), X(0xF3), X(0xF4), X(0xF5), X(0xF6), X(0xF7), \
  X(0xF8), X(0xF9), X(0xFA), X(0xFB), X(0xFC), X(0xFD), X(0xFE), X(0xFF)

// expands the 2-bits per pixel packed image into 4 bits per pixel and converts
// the pixel value with the COLOR_CONVERT function

#define X(byte) (COLOR_CONVERT(((byte >> 0) & 3)) <<  0) \
              | (COLOR_CONVERT(((byte >> 2) & 3)) <<  4) \
              | (COLOR_CONVERT(((byte >> 4) & 3)) <<  8) \
              | (COLOR_CONVERT(((byte >> 6) & 3)) << 12)

// use the source pixel value as-is
#define COLOR_CONVERT(pixel) (pixel)
u16 gUnknown_0858829C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

// add 3 to the source pixel, except when it is 0
#define COLOR_CONVERT(pixel) ((pixel == 0) ? 0 : (pixel + 3))
u16 gUnknown_0858849C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

// add 6 to the source pixel, except when it is 0
#define COLOR_CONVERT(pixel) ((pixel == 0) ? 0 : (pixel + 6))
u16 gUnknown_0858869C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

// add 9 to the source pixel, except when it is 0
#define COLOR_CONVERT(pixel) ((pixel == 0) ? 0 : (pixel + 9))
u16 gUnknown_0858889C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

// add 12 to the source pixel, except when it is 0
#define COLOR_CONVERT(pixel) ((pixel == 0) ? 0 : (pixel + 12))
u16 gUnknown_08588A9C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

#define COLOR_CONVERT(pixel) ((pixel == 2) ? 3 : 0)
u16 gUnknown_08588C9C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

#define COLOR_CONVERT(pixel) ((pixel == 0) ? 4 : (pixel + 12))
u16 gUnknown_08588E9C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

#define COLOR_CONVERT(pixel) ((pixel == 0) ?  4 : \
                              (pixel == 3) ? 15 : \
                              (pixel + 4))
u16 gUnknown_0858909C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

#define COLOR_CONVERT(pixel) ((pixel == 0) ?  4 : \
                              (pixel == 1) ?  7 : \
                              (pixel == 2) ? 12 : \
                              (pixel == 3) ? 15 : \
                              0)
u16 gUnknown_0858929C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

#define COLOR_CONVERT(pixel) ((pixel == 0) ? 15 : 0)
u16 gUnknown_0858949C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

#define COLOR_CONVERT(pixel) (pixel + 4)
u16 gUnknown_0858969C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

#undef X

// the zero byte is special in these last two for some reason.

#define X(byte) byte == 0 ? 0 : \
                (COLOR_CONVERT(((byte >> 0) & 3)) <<  0) \
              | (COLOR_CONVERT(((byte >> 2) & 3)) <<  4) \
              | (COLOR_CONVERT(((byte >> 4) & 3)) <<  8) \
              | (COLOR_CONVERT(((byte >> 6) & 3)) << 12)

#define COLOR_CONVERT(pixel) ((pixel == 0) ? 4 : (pixel + 12))
u16 gUnknown_0858989C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT

#define COLOR_CONVERT(pixel) ((pixel == 0) ? 4 : (pixel + 4))
u16 gUnknown_08589A9C[] = { GENERATE_LOOKUP_TABLE };
#undef COLOR_CONVERT


#undef X
#undef GENERATE_LOOKUP_TABLE
