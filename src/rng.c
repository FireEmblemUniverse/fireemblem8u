#include "global.h"
#include "rng.h"

static u16 gRNSeeds[3];
static int gLCGRNValue;

s32 NextRN(void) 
{
    u16 rng = (gRNSeeds[1] << 0xB) + (gRNSeeds[0] >> 5);
    gRNSeeds[2] *= 2;
    if(gRNSeeds[1] & 0x8000)
        gRNSeeds[2]++;
    rng ^= gRNSeeds[2];
    gRNSeeds[2] = gRNSeeds[1];
    gRNSeeds[1] = gRNSeeds[0];
    gRNSeeds[0] = rng;
    return rng;
}

void InitRN(int seed)
{
    int mod;
    u16 initRN[8] = 
    {
        0xA36E,
        0x924E,
        0xB784,
        0x4F67,
        0x8092,
        0x592D,
        0x8E70,
        0xA794
    };

    mod = seed % 7;
    gRNSeeds[0] = initRN[(mod++ & 7)];
    gRNSeeds[1] = initRN[(mod++ & 7)];
    gRNSeeds[2] = initRN[(mod & 7)];

    if((seed % 23) > 0)
        for(mod = seed % 23; mod != 0; mod--)
            NextRN();
}

void LoadRNState(u16 *seeds)
{
    gRNSeeds[0] = *seeds++;
    gRNSeeds[1] = *seeds++;
    gRNSeeds[2] = *seeds++;
}

void StoreRNState(u16 *seeds)
{
    *seeds++ = gRNSeeds[0];
    *seeds++ = gRNSeeds[1];
    *seeds++ = gRNSeeds[2];
}

s32 NextRN_100(void)
{
    s32 RN = 100 * NextRN();

    if (RN < 0)
        RN += 0xFFFF;
    return RN >> 16;
}

s32 NextRN_N(s32 Max)
{
    s32 RN = Max * NextRN();

    if (RN < 0)
        RN += 0xFFFF;
    return RN >> 16;
}

s32 Roll1RN(s32 Threshold)
{
    return (Threshold > NextRN_100());
}

s32 Roll2RN(s32 Threshold)
{
    s32 RNs = (NextRN_100() + NextRN_100()) / 2;

    return (Threshold > RNs);
}

// the second implementation of RN is an LCG (Linear Congruental Generator) where gLCGRNValue is set to a seed and then advanced and retrieved on demand.
void SetLCGRNValue(s32 Seed)
{
    gLCGRNValue = Seed;
}

// The LCGRN state is advanced and retrieved here.
unsigned AdvanceGetLCGRNValue(void)
{
    u32 rn = (gLCGRNValue * 4 + 2);
    rn *= (gLCGRNValue * 4 + 3);
    gLCGRNValue = rn >> 2;
    return gLCGRNValue;
}
