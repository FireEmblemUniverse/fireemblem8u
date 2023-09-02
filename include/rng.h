#ifndef GUARD_RNG_H
#define GUARD_RNG_H

// rng.c
int NextRN(void);
void InitRN(s32 unk1);
void StoreRNState(u16* seeds);
void LoadRNState(const u16* seeds);
int NextRN_100(void);
int NextRN_N(int max);
s8 Roll1RN(int threshold);
s8 Roll2RN(int threshold);
void SetLCGRNValue(s32 Seed);
unsigned AdvanceGetLCGRNValue(void);

#endif
