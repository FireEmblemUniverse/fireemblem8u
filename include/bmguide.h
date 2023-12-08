#ifndef BMGUIDE_H
#define BMGUIDE_H

#include "global.h"
#include "proc.h"
#include "fontgrp.h"

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
    /* 29 */ s8 categoryIdx;
    /* 2A */ s8 unk_2a;
    /* 2B */ s8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ s8 detailLinesScrolled;
    /* 2F */ u8 state;
    /* 30 */ u8 sortMode;
    /* 31 */ STRUCT_PAD(0x31, 0x3c);
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 numDetailLines;
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

enum
{
    GUIDE_STATE_0 = 0,
    GUIDE_STATE_1 = 1,
    GUIDE_STATE_2 = 2,
};

enum
{
    GUIDE_SORT_MODE_TOPIC    = 0,
    GUIDE_SORT_MODE_CHAPTER  = 1,
};

enum
{
    GUIDE_ACTION_NONE = 0,
    GUIDE_ACTION_1 = 1,
    GUIDE_ACTION_A_PRESS = 2,
    GUIDE_ACTION_CANCEL = 3,
    GUIDE_ACTION_SORT = 4,
    GUIDE_ACTION_ADVANCE_TEXT = 5,
    GUIDE_ACTION_REVERSE_TEXT = 6,
};

enum
{
    GUIDE_DETAILS_STAY = 0,
    GUIDE_DETAILS_ADVANCE = 1,
    GUIDE_DETAILS_REVERSE = 2,
};

bool IsGuideLocked(void);
// ??? GuideSpriteDraw_Init(???);
// ??? GuideSpriteDraw_Loop(???);
// ??? PutGuideBottomBarText(???);
// ??? sub_80CE1C0(???);
// ??? sub_80CE248(???);
// ??? sub_80CE28C(???);
// ??? GuideMenuRefresh_SyncBg1(???);
// ??? GuideMenuRefresh_SyncBg0Bg1(???);
// ??? GuideEntry_RedrawUp(???);
// ??? GuideEntry_RedrawDown(???);
// ??? sub_80CE414(???);
// ??? GuideEntry_DrawInitial(???);
// ??? GetStringNextLine(???);
// ??? MoveGuideDetailText(???);
// ??? sub_80CE750(???);
// ??? sub_80CE858(???);
// ??? GuideDetailsRedraw_Init(???);
// ??? GuideDetailsRedraw_Loop(???);
// ??? sub_80CEAE8(???);
// ??? sub_80CEBA4(???);
// ??? sub_80CEC68(???);
// ??? Guide_Init(???);
// ??? Guide_SetBlend(???);
// ??? GetGuideAction(???);
// ??? Guide_MainLoop(???);
// ??? Guide_OnEnd(???);
void BmGuideTextSetAllGreen(void);
bool BmGuideTextShowGreenOrNormal(void);

extern struct GuideEnt gGuideTable[];

#endif /* BMGUIDE_H */
