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

struct SioProc085AA06C
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Text unk_2c[4];
};

struct SioProc85AA0F0
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33;
    /* 34 */ int unk_34;
    /* 38 */ u32 unk_38;
    /* 3C */ u32 unk_3c;
    /* 40 */ s8 unk_40;
    /* 41 */ STRUCT_PAD(0x41, 0x44);
    /* 44 */ int unk_44;
    /* 48 */ struct Text unk_48;
};

struct SioProc85AA130
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ STRUCT_PAD(0x34, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x54);
    /* 54 */ const char * unk_54;
};

extern u8 gUnknown_085AD80C[];
extern u16 gUnknown_085ADDA8[];

extern int gUnknown_085AA084[];
extern s16 gUnknown_085AA0A4[];
extern s16 gUnknown_085AA0CA[];

extern u8 gUnknown_080D9F28[][4];
extern u8 gUnknown_080D9F38[][4];

extern u8 gUnknown_080D9F98[];

extern struct Text gUnk_Sio_02000C78[];

extern u16 gUnknown_085A9F98[];

//! FE8U = 0x08048864
void sub_8048864(void)
{
    PutSprite(4, 0x38, 4, gUnknown_085A9F98, 0);
    return;
}

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
            buf[i].points = gUnk_Sio_0203DD90.unk_14[gUnk_Sio_0203DD90.unk_0F[i]];
        }
    }
    else
    {
        for (i = 0; i < r3; i++)
        {
            buf[i].playerId = i;
            buf[i].points = gUnk_Sio_0203DD90.unk_14[i];
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
void sub_8048934(struct Text * th, int x, int y, int var, int number)
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
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, x + 4, y + 1), 2, number);

    return;
}

//! FE8U = 0x08048988
void sub_8048988(struct SioProc085AA06C * proc)
{
    int i;
    int oam2;

    Decompress(gUnknown_085AD80C, (void *)(0x06002800));
    CopyToPaletteBuffer(Pal_TacticianSelObj, 0x40, 0x80);

    SetTextFont(NULL);
    ResetTextFont();

    for (i = 0; i < 4; i++)
    {
        int playerId = gUnknown_080D9F28[gSioSt->selfId][i];

        if (sub_8042194(playerId) != 0)
        {
            if (gUnk_Sio_0203DD90.unk_0A[playerId] == 0)
            {
                CopyToPaletteBuffer(gUnknown_085ADDA8, (playerId + 2) * 0x20, 0x20);
            }

            oam2 = 0x140 + (((playerId + 2) & 0xf) << 12);

            InitTextDb(&proc->unk_2c[i], 4);
            sub_8048934(
                &proc->unk_2c[i], gUnknown_080D9F98[i * 2 + 0], gUnknown_080D9F98[i * 2 + 1], oam2,
                gUnk_Sio_0203DD90.unk_14[playerId]);
        }
    }

    BG_EnableSyncByMask(3);

    return;
}

//! FE8U = 0x08048A68
void nullsub_43(void)
{
    return;
}

extern struct ProcCmd gUnknown_085AA06C[];

//! FE8U = 0x08048A6C
void sub_8048A6C(void)
{
    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    Proc_Start(gUnknown_085AA06C, PROC_TREE_3);

    return;
}

//! FE8U = 0x08048A94
void sub_8048A94(void)
{
    Proc_EndEach(gUnknown_085AA06C);
    ClearBg0Bg1();

    return;
}

//! FE8U = 0x08048AA8
void sub_8048AA8(struct SioProc85AA0F0 * proc)
{
    struct Unit * unit = GetUnit(proc->unk_33);

    int idx = gUnknown_080D9F38[gSioSt->selfId][proc->unk_32];

    if (proc->unk_40 != 0)
    {
        if (unit->xPos == 8)
        {
            proc->unk_2a = unit->xPos * 16 - 16;
        }
        else
        {
            proc->unk_2a = unit->xPos * 16 - 16;
        }

        proc->unk_2c = unit->yPos * 16;
    }
    else
    {
        proc->unk_2a = unit->xPos * 0x10 + gUnknown_085AA084[idx * 2 + 0] - 12;
        proc->unk_2c = unit->yPos * 0x10 + gUnknown_085AA084[idx * 2 + 1];
    }

    proc->unk_2e = gUnknown_080D9F98[idx * 2 + 0] * 8 + 8;
    proc->unk_30 = gUnknown_080D9F98[idx * 2 + 1] * 8 + 8;

    SetTextFont(&Font_Sio_02000C60);
    SioDrawNumber(&gUnk_Sio_02000C78[0], proc->unk_32 * 0x20 + 0x18, 2, proc->unk_34);

    proc->unk_3c = 0;

    return;
}

//! FE8U = 0x08048B78
void sub_8048B78(struct SioProc85AA0F0 * proc)
{
    struct Unit * unit = GetUnit(proc->unk_33);

    if (proc->unk_3c <= 0x10)
    {
        int scale = Interpolate(1, 0x10, 0x100, proc->unk_3c, 0x10);

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

    if (proc->unk_40 != 0 && proc->unk_3c > 3 && proc->unk_3c < 0x17)
    {
        int idx = proc->unk_3c - 4;

        if (unit->xPos == 8)
        {
            proc->unk_2a = proc->unk_2a + gUnknown_085AA0A4[idx];
        }
        else
        {
            proc->unk_2a = proc->unk_2a - gUnknown_085AA0A4[idx];
        }

        proc->unk_2c = proc->unk_2c - gUnknown_085AA0CA[idx];
    }

    CallARM_PushToSecondaryOAM(proc->unk_2a, proc->unk_2c + 0x100, gObject_32x16, 0x00009340 + proc->unk_32 * 4);

    proc->unk_3c++;

    if (proc->unk_3c > 0x40)
    {
        proc->unk_3c = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048CB8
void sub_8048CB8(struct SioProc85AA0F0 * proc)
{
    int x = Interpolate(5, proc->unk_2a, proc->unk_2e, proc->unk_3c, 0x30);
    int y = Interpolate(5, proc->unk_2c, proc->unk_30, proc->unk_3c, 0x30);

    CallARM_PushToSecondaryOAM(x, y, gObject_32x16, 0x00009340 + proc->unk_32 * 4);

    proc->unk_3c++;

    if (proc->unk_3c > 0x20)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048D1C
void sub_8048D1C(struct Text * th, int x, int y, int number)
{
    ClearText(th);
    SioDrawNumber(th, 0x18, 2, number);
    PutText(th, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, y + 1));
    BG_EnableSyncByMask(1);
    return;
}

//! FE8U = 0x08048D64
void sub_8048D64(struct SioProc85AA0F0 * proc)
{
    int idx = gUnknown_080D9F38[gSioSt->selfId][proc->unk_32];

    proc->unk_2a = gUnknown_080D9F98[idx * 2 + 0];
    proc->unk_2c = gUnknown_080D9F98[idx * 2 + 1];

    SetTextFont(NULL);

    sub_8048D1C(&proc->unk_48, proc->unk_2a, proc->unk_2c, proc->unk_38 - proc->unk_34);

    proc->unk_3c = 0;
    proc->unk_44 = proc->unk_38 - proc->unk_34;

    return;
}

//! FE8U = 0x08048DD0
void sub_8048DD0(struct SioProc85AA0F0 * proc)
{
    int number = Interpolate(0, proc->unk_38 - proc->unk_34, proc->unk_38, proc->unk_3c, 10);

    SetTextFont(NULL);

    sub_8048D1C(&proc->unk_48, proc->unk_2a, proc->unk_2c, number);

    if ((proc->unk_44 != number) && (proc->unk_32 == gSioSt->selfId))
    {
        PlaySoundEffect(0x80);
    }

    proc->unk_44 = number;

    proc->unk_3c++;

    if (proc->unk_3c > 10)
    {
        proc->unk_3c = 0;
        gUnk_Sio_0203DD90.unk_14[proc->unk_32] = proc->unk_38;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048E6C
void sub_8048E6C(struct SioProc85AA0F0 * proc)
{
    proc->unk_3c++;

    if (proc->unk_3c > 20)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048E84
void sub_8048E84(struct SioProc85AA130 * proc)
{
    int pos;
    SetTextFont(&Font_Sio_02000C60);

    pos = GetStringTextCenteredPos(0x50, proc->unk_54);
    Text_InsertDrawString(gUnk_Sio_02000C78, pos + 0x80, 0, proc->unk_54);
    proc->unk_4c = 0;

    return;
}

//! FE8U = 0x08048EB8
void sub_8048EB8(struct SioProc85AA130 * proc)
{
    int scale;

    if (proc->unk_4c <= 0x10)
    {
        scale = Interpolate(1, 0x10, 0x100, proc->unk_4c, 0x10);

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

    CallARM_PushToSecondaryOAM(proc->unk_2c + 0x200, proc->unk_30 + 0x100, gObject_32x16, 0x00009350);
    CallARM_PushToSecondaryOAM(proc->unk_2c + 0x220, proc->unk_30 + 0x100, gObject_32x16, 0x00009354);
    CallARM_PushToSecondaryOAM(proc->unk_2c + 0x240, proc->unk_30 + 0x100, gObject_16x16, 0x00009358);

    proc->unk_4c++;

    if (proc->unk_4c > 0x40)
    {
        proc->unk_4c = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08048FD4
void sub_8048FD4(struct SioProc85AA130 * proc)
{
    int scale;

    if (proc->unk_4c <= 0x10)
    {
        scale = Interpolate(4, 0x100, 0x10, proc->unk_4c, 0x10);

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

    CallARM_PushToSecondaryOAM(proc->unk_2c + 0x200, proc->unk_30 + 0x100, gObject_32x16, 0x00009350);
    CallARM_PushToSecondaryOAM(proc->unk_2c + 0x220, proc->unk_30 + 0x100, gObject_32x16, 0x00009354);
    CallARM_PushToSecondaryOAM(proc->unk_2c + 0x240, proc->unk_30 + 0x100, gObject_16x16, 0x00009358);

    proc->unk_4c++;

    if (proc->unk_4c > 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085AA0F0[];
extern struct ProcCmd gUnknown_085AA130[];

//! FE8U = 0x080490EC
s8 sub_80490EC(int x, int y, const char * str, u8 flag, ProcPtr parent)
{
    int i;
    struct Text text;

    int count = 0;

    CopyToPaletteBuffer(Pal_Text, 0x320, 0x20);

    InitSpriteTextFont(&Font_Sio_02000C60, (void *)(0x06016800), 3);

    SetTextFontGlyphs(0);
    ResetTextFont();

    InitSpriteText(gUnk_Sio_02000C78);
    SpriteText_DrawBackgroundExt(gUnk_Sio_02000C78, 0);

    SetTextFont(0);

    for (i = 0; i < 4; i++)
    {
        int playerId = gUnknown_080D9F38[gSioSt->selfId][i];

        if (sub_8042194(playerId) != 0)
        {
            if (gUnk_Sio_0203DD90.unk_2c[playerId].unk_04 != 0)
            {
                struct SioProc85AA0F0 * proc = Proc_StartBlocking(gUnknown_085AA0F0, parent);
                proc->unk_32 = playerId;
                proc->unk_33 = gUnk_Sio_0203DD90.unk_2c[playerId].unk_00;
                proc->unk_38 = gUnk_Sio_0203DD90.unk_14[playerId] + gUnk_Sio_0203DD90.unk_2c[playerId].unk_04;

                if (proc->unk_38 > 9999)
                {
                    proc->unk_38 = 9999;
                }

                proc->unk_34 = proc->unk_38 - gUnk_Sio_0203DD90.unk_14[playerId];
                proc->unk_40 = flag;

                InitTextDb(&proc->unk_48, 4);

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
            struct SioProc85AA130 * proc = Proc_StartBlocking(gUnknown_085AA130, parent);
            proc->unk_2c = x;
            proc->unk_30 = y;
            proc->unk_54 = str;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x08049238
void sub_8049238(ProcPtr proc)
{
    sub_8048A6C();

    if (!sub_80490EC(0x58, 0x3c, GetStringFromIndex(0x00000771), 1, proc))
    {
        sub_8048A94();
    }

    return;
}

//! FE8U = 0x0804926C
void sub_804926C(ProcPtr param_1)
{
    sub_8048A6C();
    sub_80490EC(0x58, 0x3c, GetStringFromIndex(0x00000771), 0, param_1);
    return;
}
