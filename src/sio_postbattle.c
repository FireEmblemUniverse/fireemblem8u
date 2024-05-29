#include "global.h"

#include "face.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmio.h"

#include "sio_core.h"
#include "sio.h"

/**
 * Battle result screen for the Link Arena.
 * Not to be confused with "sio_result.c", which refers to the
 * "Battle Data" UI.
*/

struct SioProc85A971C_Unk44
{
    /* 00 */ u8 a;
    /* 01 */ STRUCT_PAD(0x01, 0x04);
    /* 04 */ int b;
};

struct SioProc85A971C
{
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr unk_2c[4];
    /* 3C */ STRUCT_PAD(0x3c, 0x40);
    /* 40 */ u8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ u8 unk_42;
    /* 43 */ u8 unk_43;
    /* 44 */ struct SioProc85A971C_Unk44 unk_44[4];
    /* 64 */ int unk_64;
};

struct SioProc85A96F4
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioProc85A971C * unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ u16 unk_40;
    /* 42 */ u8 unk_42;
    /* 43 */ u8 unk_43;
};

struct SioProc85A9774
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ int unk_58;
};

// clang-format off

u16 const * CONST_DATA gUnknown_085A96D4[] =
{
    Sprite_080D9D6E,
    Sprite_080D9D76,
    Sprite_080D9D7E,
    Sprite_080D9D86,
};

u16 const * CONST_DATA gUnknown_085A96E4[] =
{
    Sprite_080D9D8E,
    Sprite_080D9DA2,
    Sprite_080D9DC2,
    Sprite_080D9DD6,
};

s16 const gUnknown_080D9E1C[5][4] =
{
    { -1, -1, -1, -1, },

    { -1, -1, -1, -1, },

    { 7, 13, -1, -1, },

    { 5, 10, 15, -1, },

    { 2, 7, 12, 17, },
};

// clang-format on

extern char gUnk_Sio_0203DAC5[][15];

//! FE8U = 0x08045208
void sub_8045208(struct SioProc85A96F4 * proc)
{
    UnpackFaceChibiSprGraphics(proc->unk_40, proc->unk_42 * 8 + 0x180, proc->unk_42 + 10);
    proc->unk_3c = 0;
    proc->unk_34 = -0x26;
    return;
}

//! FE8U = 0x08045234
void sub_8045234(struct SioProc85A96F4 * proc)
{
    struct SioProc85A971C * unk2C = proc->unk_2c;

    if (unk2C->unk_64 == 0)
    {
        if (proc->unk_3c > 0x20)
        {
            Proc_Break(proc);
        }
    }

    if (unk2C->unk_64 != 0)
    {
        proc->unk_34++;
    }

    proc->unk_38--;

    if (proc->unk_38 < 0)
    {
        proc->unk_38 = 0;
    }

    if (proc->unk_38 == 0)
    {
        if (proc->unk_3c < 0x21)
        {
            proc->unk_30 = Interpolate(4, -0x50, 0, proc->unk_3c, 0x20);
        }

        proc->unk_3c++;

        PutSprite(4, proc->unk_30, proc->unk_34 - 0x10, gUnknown_085A96E4[proc->unk_43], 0);
        PutSprite(4, proc->unk_30 + 0x48, proc->unk_34 - 6, gUnknown_085A96D4[proc->unk_42], 0);
        PutSprite(4, proc->unk_30 + 0x60, proc->unk_34 + 8, gUnknown_080D9DE4, 0);
        PutSprite(4, proc->unk_30 + 0x40, proc->unk_34 + 8, gUnknown_080D9E06, proc->unk_43 * 4 + 0x50);
        PutSprite(4, -proc->unk_30 + 0x70, proc->unk_34 - 8, gUnknown_085AAA50, OAM2_PAL(proc->unk_42) + 0x400);
        PutSprite(
            4, -proc->unk_30 + 0x7c, proc->unk_34, gUnknown_080D9DF2, proc->unk_42 == 3 ? 0x40 : proc->unk_42 * 9);
        PutSprite(
            5, -proc->unk_30 + 0xd0, proc->unk_34 - 8, gUnknown_080D9E0E,
            OAM2_PAL(proc->unk_42 + 10) + 0x180 + (proc->unk_42 << 3));
    }

    return;
}

//! FE8U = 0x0804538C
void sub_804538C(struct SioProc85A96F4 * proc)
{
    PutSprite(4, proc->unk_30, proc->unk_34 - 0x10, gUnknown_085A96E4[proc->unk_43], 0);
    PutSprite(4, proc->unk_30 + 0x48, proc->unk_34 - 6, gUnknown_085A96D4[proc->unk_42], 0);
    PutSprite(4, proc->unk_30 + 0x60, proc->unk_34 + 8, gUnknown_080D9DE4, 0);
    PutSprite(4, proc->unk_30 + 0x40, proc->unk_34 + 8, gUnknown_080D9E06, proc->unk_43 * 4 + 0x50);
    PutSprite(4, -proc->unk_30 + 0x70, proc->unk_34 - 8, gUnknown_085AAA50, OAM2_PAL(proc->unk_42) + 0x400);
    PutSprite(4, -proc->unk_30 + 0x7c, proc->unk_34, gUnknown_080D9DF2, proc->unk_42 == 3 ? 0x40 : proc->unk_42 * 9);
    PutSprite(
        5, -proc->unk_30 + 0xd0, proc->unk_34 - 8, gUnknown_080D9E0E,
        OAM2_PAL(proc->unk_42 + 10) + 0x180 + (proc->unk_42 << 3));

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085A96F4[] =
{
    PROC_YIELD,

    PROC_CALL(sub_8045208),

    PROC_REPEAT(sub_8045234),
    PROC_REPEAT(sub_804538C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08045494
ProcPtr sub_8045494(struct SioProc85A971C * parent, int delayMaybe, u16 fid, u8 oam2, u8 ranking)
{
    struct SioProc85A96F4 * proc = Proc_Start(gUnknown_085A96F4, parent);

    proc->unk_2c = parent;
    proc->unk_38 = delayMaybe;
    proc->unk_40 = fid;
    proc->unk_43 = ranking;
    proc->unk_42 = oam2;

    return proc;
}

//! FE8U = 0x080454E4
void sub_80454E4(struct SioProc85A971C * proc)
{
    int i;

    int unk_40 = proc->unk_40;
    u16 * tm = gBG2TilemapBuffer;

    if (proc->unk_42 == proc->unk_44[(proc->unk_41 - 1)].a)
    {
        CallARM_FillTileRect(
            tm + TILEMAP_INDEX(0, gUnknown_080D9E1C[unk_40][(proc->unk_41 - 1)]), gUnknown_085ADE88, 0x2078);
    }
    else
    {
        for (i = 0; i < 0x60; i++)
        {
            tm[TILEMAP_INDEX(i, gUnknown_080D9E1C[unk_40][(proc->unk_41 - 1)])] = 0x1034;
        }
    }

    return;
}

//! FE8U = 0x0804556C
void sub_804556C(struct SioProc85A971C * proc)
{
    int i;

    int unk_40 = proc->unk_40;
    SetTextFont(&gUnk_Sio_02000C60);

    for (i = 0; i < unk_40; i++)
    {
        char * str = gUnk_Sio_0203DAC5[i];

        int len = GetStringTextLen(str);
        len = (0x48 - len) / 2;

        if (i < 3)
        {
            Text_InsertDrawString(Texts_0203DB14, 0x48 * i + len, 0, str);
        }
        else
        {
            Text_InsertDrawString(gUnk_Sio_0203DB1C, len, 0, str);
        }

        SioDrawNumber(gUnk_Sio_0203DB1C, i * 0x20 + 0x98, 2, proc->unk_44[i].b);
    }

    return;
}

extern struct ProcCmd gUnknown_085A9774[];

//! FE8U = 0x08045610
ProcPtr sub_8045610(struct SioProc85A971C * parent)
{
    struct SioProc85A9774 * proc = Proc_Start(gUnknown_085A9774, parent);

    if (parent->unk_42 == parent->unk_44[0].a)
    {
        proc->unk_58 = 1;
    }
    else
    {
        proc->unk_58 = 0;
    }

    return proc;
}

//! FE8U = 0x08045640
void sub_8045640(struct SioProc85A971C * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    Decompress(Img_TacticianSelObj, (void *)(0x06014800));
    Decompress(gUnknown_085ADA38, (void *)(0x06016000));
    Decompress(gUnknown_085AD0CC, (void *)(0x06016800));

    CopyToPaletteBuffer(Pal_TacticianSelObj, 0x260, 0x80);
    CopyToPaletteBuffer(gUnknown_085ADDC8, 0x2e0, 0x20);

    Decompress(gUnknown_085ACD20, (void *)(0x06000F00));
    CopyToPaletteBuffer(gUnknown_085ADE08, 0x40, 0x20);

    Decompress(gUnknown_085AF170, (void *)(0x6000000 + GetBackgroundTileDataOffset(3)));
    CopyToPaletteBuffer(gUnknown_085B081C, 0x140, 0x80);
    Decompress(gUnknown_085B089C, gGenericBuffer);
    CallARM_FillTileRect(gBG3TilemapBuffer, gGenericBuffer, 0xa000);

    InitSpriteTextFont(&gUnk_Sio_02000C60, (void *)(0x06012000), 0xe);
    CopyToPaletteBuffer(Pal_Text, 0x3c0, 0x20);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
    ResetTextFont();

    for (i = 0; i < 2; i++)
    {
        InitSpriteText(&Texts_0203DB14[i]);
        SpriteText_DrawBackgroundExt(&Texts_0203DB14[i], 0);
    }

    proc->unk_40 = gSioSt->unk_007;
    proc->unk_41 = gSioSt->unk_007;
    proc->unk_42 = gSioSt->selfId;

    CpuFill16(0, proc->unk_44, sizeof(proc->unk_44));

    sub_8048884(proc->unk_44);
    sub_804556C(proc);

    proc->unk_64 = 0xb0;

    BG_SetPosition(2, 0, 0xb0);

    SetWinEnable(0, 0, 0);

    SetBlendConfig(1, 8, 8, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    sub_8045610(proc);

    BG_EnableSyncByMask(8);

    return;
}

//! FE8U = 0x080457F8
void sub_80457F8(struct SioProc85A971C * proc)
{
    int fid;

    int unk_40 = proc->unk_40;

    proc->unk_64--;
    BG_SetPosition(2, 0, proc->unk_64);

    sub_804D6D4();

    if (proc->unk_41 != 0)
    {
        if ((proc->unk_64 >> 3) == (gUnknown_080D9E1C[unk_40][(proc->unk_41 - 1)] + 4))
        {
            sub_80454E4(proc);
            BG_EnableSyncByMask(4);

            fid = gUnk_Sio_0203DD90.unk_24[proc->unk_44[(proc->unk_41 - 1)].a];
            proc->unk_2c[(proc->unk_41 - 1)] =
                sub_8045494(proc, 0x28, fid, proc->unk_44[(proc->unk_41 - 1)].a, (proc->unk_41 - 1));

            proc->unk_41--;
        }
    }

    if (proc->unk_64 == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0804589C
void sub_804589C(ProcPtr proc)
{
    sub_804D6D4();

    if ((gKeyStatusPtr->newKeys & 1) != 0)
    {
        m4aMPlayFadeOut(gMPlayTable[gSongTable[0x81].ms].info, 1);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085A971C[] =
{
    PROC_CALL(sub_8045640),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_0203DDDC),

    PROC_REPEAT(sub_80457F8),
    PROC_REPEAT(sub_804589C),

    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(BMapVSync_Start),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080458E8
void sub_80458E8(struct SioProc85A9774 * proc)
{
    if (proc->unk_58 != 0)
    {
        StartBgmExt(0x3a, 0, 0);
    }
    else
    {
        StartBgmExt(0x3b, 0, 0);
    }

    PlaySoundEffect(0x81);

    return;
}

//! FE8U = 0x08045920
void sub_8045920(void)
{
    StartBgmExt(0x3b, 0, 0);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085A9774[] =
{
    PROC_SLEEP(16),

    PROC_CALL(sub_80458E8),

    PROC_SLEEP(210),

    PROC_CALL(sub_8045920),

    PROC_END,
};

// clang-format on
