#ifndef BMGUIDE_H
#define BMGUIDE_H

struct GuideEnt
{
    /* 00 */ u8 title;
    /* 01 */ u8 chapterTitle;
    /* 02 */ u16 itemName;
    /* 04 */ u16 details;
    /* 06 */ u16 displayFlag;
    /* 08 */ u16 readFlag;
};

struct GuideSt
{
    /* 00 */ STRUCT_PAD(0x00, 0x29);
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2B */ s8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ s8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ STRUCT_PAD(0x31, 0x3c);
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ u8 unk_40[5];

    /* 45 */ STRUCT_PAD(0x45, 0x54);

    /* 54 */ u8 unk_54[5]; // size unknown

    /* 59 */ STRUCT_PAD(0x59, 0x68);

    /* 68 */ u8 unk_68[5];

    /* 6D */ STRUCT_PAD(0x6d, 0x7c);

    /* 7C */ struct Text unk_7c[6];
    /* AC */ struct Text unk_ac;
    /* B4 */ struct Text unk_b4[6];
    /* E4 */ struct Text unk_e4;
    /* EC */ struct Text unk_ec;
};

struct GuideProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 3C */ int unk_3c;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
};

bool sub_80CDF4C(void); // IsGuideLocked
// ??? sub_80CDF78(???);
// ??? sub_80CDF88(???);
// ??? sub_80CE148(???);
// ??? sub_80CE1C0(???);
// ??? sub_80CE248(???);
// ??? sub_80CE28C(???);
// ??? sub_80CE2E4(???);
// ??? sub_80CE2F0(???);
// ??? sub_80CE2FC(???);
// ??? sub_80CE388(???);
// ??? sub_80CE414(???);
// ??? sub_80CE588(???);
// ??? sub_80CE5BC(???);
// ??? sub_80CE5F0(???);
// ??? sub_80CE750(???);
// ??? sub_80CE858(???);
// ??? sub_80CE95C(???);
// ??? sub_80CE9E8(???);
// ??? sub_80CEAE8(???);
// ??? sub_80CEBA4(???);
// ??? sub_80CEC68(???);
// ??? sub_80CECB0(???);
// ??? sub_80CEF10(???);
// ??? sub_80CEF48(???);
// ??? sub_80CEFD4(???);
// ??? sub_80CF448(???);
// ??? sub_80CF460(???);
bool sub_80CF480(void);

extern struct GuideEnt gUnknown_08B19E0C[];

#endif /* BMGUIDE_H */
