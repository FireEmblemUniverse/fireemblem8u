#ifndef GUARD_RNG_H
#define GUARD_RNG_H

// rng.c
// ??? NextRN(???);
void InitRN(s32 unk1);
// ??? LoadRNState(???);
// ??? StoreRNState(???);
int NextRN_100(void);
int NextRN_N(int max);
// ??? Roll1RN(???);
// ??? Roll2RN(???);
void SetLCGRNValue(s32 Seed);
unsigned AdvanceGetLCGRNValue(void);

#endif
