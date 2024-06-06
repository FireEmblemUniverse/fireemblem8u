#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"

#include "sio_core.h"
#include "sio.h"

struct LAPointsBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Text text[4];
};

struct PointsNumberMoverProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 x;
    /* 2C */ s16 y;
    /* 2E */ s16 xTarget;
    /* 30 */ s16 yTarget;
    /* 32 */ u8 playerId;
    /* 33 */ u8 unitId;
    /* 34 */ int difference;
    /* 38 */ u32 newScore;
    /* 3C */ u32 timer;
    /* 40 */ s8 unk_40;
    /* 41 */ STRUCT_PAD(0x41, 0x44);
    /* 44 */ int unk_44; // used for showing the "rolling" number while accumulating points
    /* 48 */ struct Text text;
};

struct PointsSpriteTextProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x4C);
    /* 4C */ s16 timer;
    /* 4E */ STRUCT_PAD(0x4E, 0x54);
    /* 54 */ const char * str;
};

extern u8 gUnknown_085AD80C[];
extern u16 gUnknown_085ADDA8[];

// clang-format off

const u8 gUnknown_080D9F28[][4] =
{
    0, 2, 1, 3,
    1, 3, 0, 2,
    2, 1, 3, 0,
    3, 0, 2, 1,
};

const u8 gUnknown_080D9F38[][4] =
{
    0, 2, 1, 3,
    2, 0, 3, 1,
    3, 1, 0, 2,
    1, 3, 2, 0,
};

const u16 gUnknown_080D9F48[] =
{
    0x5, 0x9, 0x6, 0x9, 0x7, 0x9, 0x8, 0x9,
    0x9, 0x9, 0xC, 0x7, 0xC, 0x6, 0xC, 0x5,
    0xC, 0x4, 0xC, 0x3, 0x9, 0x1, 0x8, 0x1,
    0x7, 0x1, 0x6, 0x1, 0x5, 0x1, 0x2, 0x3,
    0x2, 0x4, 0x2, 0x5, 0x2, 0x6, 0x2, 0x7,
};

const u8 gUnknown_080D9F98[] =
{
     1, 16,
    23, 16,
    23,  1,
     1,  1,
};

// clang-format on

extern struct Text gUnk_Sio_02000C78[];

// clang-format off

u16 CONST_DATA Sprite_085A9F98[] =
{
    1,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x200) + OAM2_PAL(3),
};

// clang-format on

//! FE8U = 0x08048864
void sub_8048864(void)
{
    PutSprite(4, 56, 4, Sprite_085A9F98, 0);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_085A9FA0[] =
{
    PROC_REPEAT(sub_8048864),
    PROC_END,
};

u16 CONST_DATA gUnknown_085A9FB0[] =
{
    0x014C, 0x014D, 0x014E, 0x014F, 0x0150, 0x0151,
    0x0152, 0x0153, 0x0154, 0x0155, 0x00CC, 0x0000,
    0x00D6, 0x0002, 0x00D7, 0x0004, 0x00D8, 0x0006,
    0x00D9, 0x0008, 0x00DA, 0x000A, 0x00DB, 0x000C,
    0x00DC, 0x000E, 0x00DD, 0x0010, 0x00DE, 0x0012,
    0x00DF, 0x0014, 0x00E0, 0x0016, 0x00E1, 0x0018,
    0x00E2, 0x001A, 0x00E3, 0x001C, 0x00E4, 0x001E,
    0x00E5, 0x0020, 0x00E6, 0x0022, 0x00E7, 0x0024,
    0x00E8, 0x0026, 0x00E9, 0x0028, 0x00EA, 0x002A,
    0x00EB, 0x002C, 0x00EC, 0x002E, 0x00ED, 0x0030,
    0x00EE, 0x0032, 0x00EF, 0x0014, 0x00F0, 0x0016,
    0x00F1, 0x0022, 0x00F2, 0x0024, 0x00F3, 0x0026,
    0x00F4, 0x0028, 0x00F5, 0x0011, 0x00F6, 0x0019,
    0x00F7, 0x001D, 0x00F8, 0x0021, 0x00F9, 0x0029,
    0x00FA, 0x0029, 0x00FB, 0x002B, 0x00D6, 0x0000,
    0x00D6, 0x0000, 0x00D6, 0x0000,
};

// clang-format on

//! FE8U = 0x08048884
void sub_8048884(struct SioProc85A971C_Unk44 * buf)
{
    int i;
    int j;

    int r3 = gLinkArenaSt.unk_A0;

    if (gLinkArenaSt.unk_ec.unk_0_1 != 0) // TODO: Survival mode?
    {
        for (i = 0; i < r3; i++)
        {
            buf[i].playerId = gUnk_Sio_0203DD90.unk_0F[i];
            buf[i].points = gUnk_Sio_0203DD90.currentScore[gUnk_Sio_0203DD90.unk_0F[i]];
        }
    }
    else
    {
        for (i = 0; i < r3; i++)
        {
            buf[i].playerId = i;
            buf[i].points = gUnk_Sio_0203DD90.currentScore[i];
        }

        for (i = 0; i <= r3 - 2; i++)
        {
            for (j = r3 - 2; j >= i; j--)
            {
                if (buf[j].points < buf[j + 1].points)
                {
                    int tmpPlayerId;
                    int tmpPoints;

                    tmpPlayerId = buf[j].playerId;
                    buf[j].playerId = buf[j + 1].playerId;
                    buf[j + 1].playerId = tmpPlayerId;

                    tmpPoints = buf[j].points;
                    buf[j].points = buf[j + 1].points;
                    buf[j + 1].points = tmpPoints;
                }
            }
        }
    }

    return;
}

//! FE8U = 0x08048934
void DrawLinkArenaPointsBox(struct Text * th, int x, int y, int var, int number)
{
    int ix;
    int iy;

    u16 * tm = gBG1TilemapBuffer + TILEMAP_INDEX(x, y);

    for (iy = 0; iy < 4; iy++)
    {
        for (ix = 0; ix < 6; ix++)
        {
            *tm = var;

            tm++;
            var++;
        }

        tm += 0x1A;
    }

    ClearText(th);
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, x + 4, y + 1), TEXT_COLOR_SYSTEM_BLUE, number);

    return;
}

//! FE8U = 0x08048988
void LAPointsBox_LoadBoxes(struct LAPointsBoxProc * proc)
{
    int i;
    int oam2;

    Decompress(gUnknown_085AD80C, (void *)(0x06002800));
    ApplyPalettes(Pal_TacticianSelObj, 2, 4);

    SetTextFont(NULL);
    ResetTextFont();

    for (i = 0; i < 4; i++)
    {
        int playerId = gUnknown_080D9F28[gSioSt->selfId][i];

        if (sub_8042194(playerId) != 0)
        {
            if (gUnk_Sio_0203DD90.unk_0A[playerId] == 0)
            {
                ApplyPalette(gUnknown_085ADDA8, playerId + 2);
            }

            oam2 = 0x140 + OAM2_PAL(playerId + 2);

            InitTextDb(&proc->text[i], 4);
            DrawLinkArenaPointsBox(
                &proc->text[i], gUnknown_080D9F98[i * 2 + 0], gUnknown_080D9F98[i * 2 + 1], oam2,
                gUnk_Sio_0203DD90.currentScore[playerId]);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x08048A68
void LAPointsBox_Dummy(void)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_LinkArenaPointsBox[] =
{
    PROC_CALL(LAPointsBox_LoadBoxes),
    PROC_CALL(LAPointsBox_Dummy),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08048A6C
void StartLinkArenaPointsBox(void)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);

    Proc_Start(ProcScr_LinkArenaPointsBox, PROC_TREE_3);

    return;
}

//! FE8U = 0x08048A94
void EndLinkArenaPointsBox(void)
{
    Proc_EndEach(ProcScr_LinkArenaPointsBox);
    ClearBg0Bg1();

    return;
}

// clang-format off

int CONST_DATA gUnknown_085AA084[] =
{
    + 0, -20,
    -16, + 0,
    + 0, +12,
    +16, + 0,
};

// clang-format on

//! FE8U = 0x08048AA8
void PointsNumberMover_Init(struct PointsNumberMoverProc * proc)
{
    struct Unit * unit = GetUnit(proc->unitId);

    int idx = gUnknown_080D9F38[gSioSt->selfId][proc->playerId];

    if (proc->unk_40 != 0)
    {
        if (unit->xPos == 8) // redundant?
        {
            proc->x = unit->xPos * 16 - 16;
        }
        else
        {
            proc->x = unit->xPos * 16 - 16;
        }

        proc->y = unit->yPos * 16;
    }
    else
    {
        proc->x = unit->xPos * 16 + gUnknown_085AA084[idx * 2 + 0] - 12;
        proc->y = unit->yPos * 16 + gUnknown_085AA084[idx * 2 + 1];
    }

    proc->xTarget = gUnknown_080D9F98[idx * 2 + 0] * 8 + 8;
    proc->yTarget = gUnknown_080D9F98[idx * 2 + 1] * 8 + 8;

    SetTextFont(&Font_Sio_02000C60);
    SioDrawNumber(&gUnk_Sio_02000C78[0], proc->playerId * 32 + 24, TEXT_COLOR_SYSTEM_BLUE, proc->difference);

    proc->timer = 0;

    return;
}

// clang-format off

s16 CONST_DATA gUnknown_085AA0A4[] =
{
    +0, +0,
    +1, +1,
    +1, +1,
    +1, +1,
    +2, +2,
    +2, +1,
    +1, +1,
    +1, +1,
    +1, +1,
    +0,
};

s16 CONST_DATA gUnknown_085AA0CA[] =
{
    +0, -1,
    +3, +3,
    +2, +2,
    +1, +0,
    +0, +0,
    +0, +0,
    -1, -2,
    -2, -3,
    -3, +1,
    +0,
};

// clang-format on

/**
 * Effect where the score numbers "emerge" from the unit
 */

//! FE8U = 0x08048B78
void PointsNumberMover_LoopNumberEmerge(struct PointsNumberMoverProc * proc)
{
    struct Unit * unit = GetUnit(proc->unitId);

    if (proc->timer <= 0x10)
    {
        int scale = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x100, proc->timer, 0x10);

        // clang-format off
        SetObjAffine(
            0,
            Div(+COS(0) * 16, 0x100),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on
    }

    if (proc->unk_40 != 0 && proc->timer > 3 && proc->timer < 23)
    {
        int idx = proc->timer - 4;

        if (unit->xPos == 8)
        {
            proc->x = proc->x + gUnknown_085AA0A4[idx];
        }
        else
        {
            proc->x = proc->x - gUnknown_085AA0A4[idx];
        }

        proc->y = proc->y - gUnknown_085AA0CA[idx];
    }

    CallARM_PushToSecondaryOAM(proc->x, proc->y + 0x100, gObject_32x16, 0x9340 + proc->playerId * 4);

    proc->timer++;

    if (proc->timer > 0x40)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048CB8
void PointsNumberMover_LoopMoveToPointsBox(struct PointsNumberMoverProc * proc)
{
    int x = Interpolate(INTERPOLATE_RCUBIC, proc->x, proc->xTarget, proc->timer, 0x30);
    int y = Interpolate(INTERPOLATE_RCUBIC, proc->y, proc->yTarget, proc->timer, 0x30);

    CallARM_PushToSecondaryOAM(x, y, gObject_32x16, 0x9340 + proc->playerId * 4);

    proc->timer++;

    if (proc->timer > 0x20)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048D1C
void DrawLinkArenaScoreNumber(struct Text * th, int x, int y, int number)
{
    ClearText(th);
    SioDrawNumber(th, 24, TEXT_COLOR_SYSTEM_BLUE, number);
    PutText(th, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, y + 1));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    return;
}

//! FE8U = 0x08048D64
void PointsNumberMover_InitScoreChange(struct PointsNumberMoverProc * proc)
{
    int idx = gUnknown_080D9F38[gSioSt->selfId][proc->playerId];

    proc->x = gUnknown_080D9F98[idx * 2 + 0];
    proc->y = gUnknown_080D9F98[idx * 2 + 1];

    SetTextFont(NULL);

    DrawLinkArenaScoreNumber(&proc->text, proc->x, proc->y, proc->newScore - proc->difference);

    proc->timer = 0;
    proc->unk_44 = proc->newScore - proc->difference;

    return;
}

//! FE8U = 0x08048DD0
void PointsNumberMover_TickScore(struct PointsNumberMoverProc * proc)
{
    int number = Interpolate(INTERPOLATE_LINEAR, proc->newScore - proc->difference, proc->newScore, proc->timer, 10);

    SetTextFont(NULL);

    DrawLinkArenaScoreNumber(&proc->text, proc->x, proc->y, number);

    if ((proc->unk_44 != number) && (proc->playerId == gSioSt->selfId))
    {
        PlaySoundEffect(0x80);
    }

    proc->unk_44 = number;

    proc->timer++;

    if (proc->timer > 10)
    {
        proc->timer = 0;
        gUnk_Sio_0203DD90.currentScore[proc->playerId] = proc->newScore;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048E6C
void PointsNumberMover_AwaitEnd(struct PointsNumberMoverProc * proc)
{
    proc->timer++;

    if (proc->timer > 20)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_LinkArena_PointsNumberMover[] =
{
    PROC_YIELD,
    PROC_CALL(PointsNumberMover_Init),

    PROC_REPEAT(PointsNumberMover_LoopNumberEmerge),
    PROC_REPEAT(PointsNumberMover_LoopMoveToPointsBox),

    PROC_CALL(PointsNumberMover_InitScoreChange),

    PROC_REPEAT(PointsNumberMover_TickScore),
    PROC_REPEAT(PointsNumberMover_AwaitEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08048E84
void PointsSpriteText_Init(struct PointsSpriteTextProc * proc)
{
    int pos;
    SetTextFont(&Font_Sio_02000C60);

    pos = GetStringTextCenteredPos(80, proc->str);
    Text_InsertDrawString(gUnk_Sio_02000C78, pos + 128, 0, proc->str);
    proc->timer = 0;

    return;
}

//! FE8U = 0x08048EB8
void PointsSpriteText_LoopIn(struct PointsSpriteTextProc * proc)
{
    if (proc->timer <= 0x10)
    {
        int scale = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x100, proc->timer, 0x10);

        // clang-format off
        SetObjAffine(
            1,
            Div(+COS(0) * 16, 0x100), 
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on
    }

    CallARM_PushToSecondaryOAM(proc->x + 0x200, proc->y + 0x100, gObject_32x16, 0x00009350);
    CallARM_PushToSecondaryOAM(proc->x + 0x220, proc->y + 0x100, gObject_32x16, 0x00009354);
    CallARM_PushToSecondaryOAM(proc->x + 0x240, proc->y + 0x100, gObject_16x16, 0x00009358);

    proc->timer++;

    if (proc->timer > 0x40)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048FD4
void PointsSpriteText_LoopOut(struct PointsSpriteTextProc * proc)
{
    int scale;

    if (proc->timer <= 0x10)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 0x100, 0x10, proc->timer, 0x10);

        // clang-format off
        SetObjAffine(
            1,
            Div(+COS(0) * 16, 0x100), 
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on
    }

    CallARM_PushToSecondaryOAM(proc->x + 0x200, proc->y + 0x100, gObject_32x16, 0x00009350);
    CallARM_PushToSecondaryOAM(proc->x + 0x220, proc->y + 0x100, gObject_32x16, 0x00009354);
    CallARM_PushToSecondaryOAM(proc->x + 0x240, proc->y + 0x100, gObject_16x16, 0x00009358);

    proc->timer++;

    if (proc->timer > 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

/**
 * Draws the sprite text for "Points" in the centre of the screen
 * after combat in the Link Arena.
*/

struct ProcCmd CONST_DATA ProcScr_LinkArena_PointsSpriteText[] =
{
    PROC_YIELD,
    PROC_CALL(PointsSpriteText_Init),

    PROC_REPEAT(PointsSpriteText_LoopIn),
    PROC_REPEAT(PointsSpriteText_LoopOut),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080490EC
s8 sub_80490EC(int x, int y, const char * str, u8 flag, ProcPtr parent)
{
    int i;
    struct Text text;

    int count = 0;

    ApplyPalette(Pal_Text, 0x19);

    InitSpriteTextFont(&Font_Sio_02000C60, (void *)(0x06016800), 3);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
    ResetTextFont();

    InitSpriteText(gUnk_Sio_02000C78);
    SpriteText_DrawBackgroundExt(gUnk_Sio_02000C78, 0);

    SetTextFont(NULL);

    for (i = 0; i < 4; i++)
    {
        int playerId = gUnknown_080D9F38[gSioSt->selfId][i];

        if (sub_8042194(playerId) != 0)
        {
            if (gUnk_Sio_0203DD90.unk_2c[playerId].newScore != 0)
            {
                struct PointsNumberMoverProc * proc = Proc_StartBlocking(ProcScr_LinkArena_PointsNumberMover, parent);
                proc->playerId = playerId;
                proc->unitId = gUnk_Sio_0203DD90.unk_2c[playerId].unitId;
                proc->newScore = gUnk_Sio_0203DD90.currentScore[playerId] + gUnk_Sio_0203DD90.unk_2c[playerId].newScore;

                if (proc->newScore > 9999)
                {
                    proc->newScore = 9999;
                }

                proc->difference = proc->newScore - gUnk_Sio_0203DD90.currentScore[playerId];
                proc->unk_40 = flag;

                InitTextDb(&proc->text, 4);

                count++;
            }
            else
            {
                InitTextDb(&text, 4);
            }
        }
    }

    if (count != 0)
    {
        if (flag != 0)
        {
            struct PointsSpriteTextProc * proc = Proc_StartBlocking(ProcScr_LinkArena_PointsSpriteText, parent);
            proc->x = x;
            proc->y = y;
            proc->str = str;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x08049238
void sub_8049238(ProcPtr proc)
{
    StartLinkArenaPointsBox();

    if (!sub_80490EC(88, 60, GetStringFromIndex(0x771), 1, proc)) // TODO: msgid "Points"
    {
        EndLinkArenaPointsBox();
    }

    return;
}

//! FE8U = 0x0804926C
void sub_804926C(ProcPtr proc)
{
    StartLinkArenaPointsBox();
    sub_80490EC(88, 60, GetStringFromIndex(0x771), 0, proc); // TODO: msgid "Points"
    return;
}
