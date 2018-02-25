#include "global.h"

extern u16 gUnknown_080D74F4[8];
extern u16 gUnknown_03000000[];
extern s32 gUnknown_03000008[];

s32 NextRN() 
{
	u16 rng = (gUnknown_03000000[1] << 0xB) + (gUnknown_03000000[0] >> 5);
	gUnknown_03000000[2] = gUnknown_03000000[2] * 2;
	if((gUnknown_03000000[1] & 0x8000) != 0)
	{
		gUnknown_03000000[2]++;
	}
	rng = rng ^ gUnknown_03000000[2];
	gUnknown_03000000[2] = gUnknown_03000000[1];
	gUnknown_03000000[1] = gUnknown_03000000[0];
	gUnknown_03000000[0] = rng;
	return rng;
}

void sub_8000BC8(s32 unk1)
{
    u16 unk2[8];
    s32 unk3;
    u32 unk4;
    memcpy(&unk2, &gUnknown_080D74F4, sizeof unk2);
    unk3 = unk1 % 7;
    gUnknown_03000000[0] = unk2[(unk3 & 7)];
    unk3++;
    gUnknown_03000000[1] = unk2[(unk3 & 7)];
    unk3++;
    gUnknown_03000000[2] = unk2[(unk3 & 7)];
    if((unk1 % 0x17) > 0)
    {
        for(unk3 = unk1 % 0x17; unk3 != 0; unk3--)
            NextRN();
    }
}

void LoadRNState(u16 unk1[])
{
	gUnknown_03000000[0] = unk1[0];
	unk1++; //Okay then
	gUnknown_03000000[1] = unk1[0];
	gUnknown_03000000[2] = unk1[1];
}

void StoreRNState(u16 unk1[])
{
	unk1[0] = gUnknown_03000000[0];
	unk1++; //Okay then
	unk1[0] = gUnknown_03000000[1];
	unk1[1] = gUnknown_03000000[2];
}

s32 NextRN_100()
{
	s32 RN = 100 * NextRN();
	if (RN < 0)
	{
		RN = RN + 0x0000FFFF;
	}
	return RN >> 16;
}

s32 NextRN_N(s32 Max)
{
	s32 RN = Max * NextRN();
	if (RN < 0)
	{
		RN = RN + 0x0000FFFF;
	}
	return RN >> 16;
}

s32 Roll1RN(s32 Threshold)
{
    s32 retVal;
    if(Threshold  > NextRN_100()) retVal = 1;
    else retVal = 0;
    return retVal;
}

s32 Roll2RN(s32 Threshold)
{
    u32 retVal;
    u32 RNs = NextRN_100() + NextRN_100();
    RNs = ((RNs >> 0x1F) + RNs);
    if(Threshold > (s32)RNs >> 1) retVal = 1;
    else retVal = 0;
    return retVal;
}

void SetOtherRNState(s32 Seed)
{
	gUnknown_03000008[0] = Seed;
}

s32 GetOtherRN()
{
    u32 foo = gUnknown_03000008[0] * 4;
    u32 foo1 = (foo + 2);
    u32 foo2 = (foo + 3);
    foo1 *= foo2;
    gUnknown_03000008[0] = foo1 >> 2;
    return gUnknown_03000008[0];
}