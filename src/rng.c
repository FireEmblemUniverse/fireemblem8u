#include "global.h"
#include "rng.h"

static u16 gRNSeeds[3];
static int gLCGRNValue;

int NextRN(void) {
    // This generates a pseudorandom string of 16 bits
    // In other words, a pseudorandom integer that can range from 0 to 65535

    u16 rn = (gRNSeeds[1] << 11) + (gRNSeeds[0] >> 5);

    // Shift state[2] one bit
    gRNSeeds[2] *= 2;

    // "carry" the top bit of state[1] to state[2]
    if (gRNSeeds[1] & 0x8000)
        gRNSeeds[2]++;

    rn ^= gRNSeeds[2];

    // Shifting the whole state 16 bits
    gRNSeeds[2] = gRNSeeds[1];
    gRNSeeds[1] = gRNSeeds[0];
    gRNSeeds[0] = rn;

    return rn;
}

void InitRN(int seed) {
    // This table is a collection of 8 possible initial rn state
    // 3 entries will be picked based of which "seed" was given

    u16 initTable[8] = {
        0xA36E,
        0x924E,
        0xB784,
        0x4F67,
        0x8092,
        0x592D,
        0x8E70,
        0xA794
    };

    int mod = seed % 7;

    gRNSeeds[0] = initTable[(mod++ & 7)];
    gRNSeeds[1] = initTable[(mod++ & 7)];
    gRNSeeds[2] = initTable[(mod & 7)];

    if ((seed % 23) > 0)
        for (mod = seed % 23; mod != 0; mod--)
            NextRN();
}

void LoadRNState(const u16* seeds) {
    gRNSeeds[0] = *seeds++;
    gRNSeeds[1] = *seeds++;
    gRNSeeds[2] = *seeds++;
}

void StoreRNState(u16* seeds) {
    *seeds++ = gRNSeeds[0];
    *seeds++ = gRNSeeds[1];
    *seeds++ = gRNSeeds[2];
}

int NextRN_100(void) {
    // take the next rn (range 0-0xFFFF) and convert it to a range 0-99 value
    return NextRN() * 100 / 0x10000;

    /*

    fun fact! FE6 does (NextRN() / (0x10000 / 100)) instead of the above, resulting
    in a very slight chance of getting a 100 roll because of integer division rounding.

    */
}

int NextRN_N(int max) {
    // take the next rn (range 0-0xFFFF) and convert it to a range 0-(max-1) value
    return NextRN() * max / 0x10000;
}

s8 Roll1RN(int threshold) {
    return (threshold > NextRN_100());
}

s8 Roll2RN(int threshold) {
    int average = (NextRN_100() + NextRN_100()) / 2;

    return (threshold > average);
}

// the second implementation of RN is an LCG (Linear Congruental Generator),
// where gLCGRNValue is set to a seed and then advanced and retrieved on demand.

void SetLCGRNValue(int seed) {
    gLCGRNValue = seed;
}

// The LCGRN state is advanced and retrieved here.
unsigned AdvanceGetLCGRNValue(void) {
    u32 rn = (gLCGRNValue * 4 + 2);
    rn *= (gLCGRNValue * 4 + 3);
    gLCGRNValue = rn >> 2;
    return gLCGRNValue;
}
