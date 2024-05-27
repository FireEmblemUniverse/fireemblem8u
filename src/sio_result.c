#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "sio.h"

struct SioResultProcUnk2C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x30);
    /* 30 */ int unk_30;
};

struct SioResultProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioResultProcUnk2C * unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ u16 unk_36;
    /* 38 */ s8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
};

extern struct MultiArenaRankingEnt gUnk_Sio_0203DC44[];

//! FE8U = 0x08046E5C
void sub_8046E5C(u16 * tm, u32 base)
{
    u16 ref = base * 3 + 0x6078;

    tm[TILEMAP_INDEX(0, 0)] = ref + 8;
    tm[TILEMAP_INDEX(1, 0)] = ref + 9;
    tm[TILEMAP_INDEX(2, 0)] = ref + 10;
    tm[TILEMAP_INDEX(0, 1)] = ref + 0x28;
    tm[TILEMAP_INDEX(1, 1)] = ref + 0x29;
    tm[TILEMAP_INDEX(2, 1)] = ref + 0x2a;

    return;
}

//! FE8U = 0x08046E94
void sub_8046E94(u16 * tm, u32 base)
{
    u16 ref = base * 4 + 0x6078;

    tm[TILEMAP_INDEX(0, 0)] = ref;
    tm[TILEMAP_INDEX(1, 0)] = ref + 1;
    tm[TILEMAP_INDEX(0, 1)] = ref + 2;
    tm[TILEMAP_INDEX(1, 1)] = ref + 3;

    return;
}

//! FE8U = 0x08046EB8
void sub_8046EB8(struct Text * th, char * nameStr, u8 rank, u16 points, u8 playerCount)
{
    // clang-format off
    u16 gUnknown_080D9E9C[] =
    {
        0,
        0x0782, // TODO: msgid "1st"
        0x0783, // TODO: msgid "2nd"
        0x0784, // TODO: msgid "3rd"
        0x0785, // TODO: msgid "4th"
    };

    u16 gUnknown_080D9EA6[] =
    {
        0,
        0x0786, // TODO: msgid "P1"
        0x0787, // TODO: msgid "P2"
        0x0788, // TODO: msgid "P3"
        0x0789, // TODO: msgid "P4"
        0x078A, // TODO: msgid "P5"
    };
    // clang-format on

    Text_InsertDrawString(th, 4, 0, nameStr);

    SioDrawNumber(th, 84, 2, points);

    Text_InsertDrawString(th, 93, 0, GetStringFromIndex(0x77F));
    Text_InsertDrawString(th, 128, 2, GetStringFromIndex(gUnknown_080D9E9C[rank & 0xff]));
    Text_InsertDrawString(th, 154, 0, GetStringFromIndex(gUnknown_080D9EA6[playerCount & 0xff]));

    return;
}

//! FE8U = 0x08046F68
void sub_8046F68(void)
{
    int i;

    for (i = 0; i < 10; i++)
    {
        ClearText(&Texts_0203DB14[i]);
        sub_8046EB8(
            &Texts_0203DB14[i], gUnk_Sio_0203DC44[i].name, gUnk_Sio_0203DC44[i].ranking + 1,
            gUnk_Sio_0203DC44[i].points, gUnk_Sio_0203DC44[i].player_count + 1);
        sub_8046E5C(TILEMAP_LOCATED(gBG1TilemapBuffer, 3, i * 2), i);
        PutText(&Texts_0203DB14[i], TILEMAP_LOCATED(gBG1TilemapBuffer, 6, i * 2));
        sub_8046E94(TILEMAP_LOCATED(gBG1TilemapBuffer, 20, i * 2), gUnk_Sio_0203DC44[i].mode);
    }

    return;
}

//! FE8U = 0x08047008
void sub_8047008(struct SioResultProc * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(gUnknown_085AC9DC, (void *)(0x06000F00 + GetBackgroundTileDataOffset(1)));
    ApplyPalette(gUnknown_085ADCC8, 6);

    Decompress(Img_TacticianSelObj, (void *)(0x06014800));
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    CallARM_FillTileRect(gBG2TilemapBuffer + 0x81, gUnknown_085AE464, 0x1000);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    proc->unk_36 = 200;
    proc->unk_39 = 0;
    proc->unk_38 = 0;
    proc->unk_34 = 0;

    BG_SetPosition(1, 0, proc->unk_36);

    for (i = 0; i < 10; i++)
    {
        InitText(&Texts_0203DB14[i], 0x16);
    }

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    ClearText(&gSioTexts[0]);

    Text_InsertDrawString(&gSioTexts[0], 12, 0, GetStringFromIndex(0x772));
    Text_InsertDrawString(&gSioTexts[0], 84, 0, GetStringFromIndex(0x773));
    Text_InsertDrawString(&gSioTexts[0], 120, 0, GetStringFromIndex(0x774));
    Text_InsertDrawString(&gSioTexts[0], 150, 0, GetStringFromIndex(0x775));

    PutText(&gSioTexts[0], gBG0TilemapBuffer + 0xa5);

    sub_8043100(0x744, 1);

    ReadMultiArenaSaveRankings(gUnk_Sio_0203DC44);
    sub_8046F68();

    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 58, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);

    SetWOutLayers(1, 0, 1, 1, 1);

    sub_804D1E0(217, 57, 10, 5, proc->unk_36 + 56, proc);
    NewProc085AA980(proc, 5, 0);
    sub_804C558();
    sub_804C2EC(0xc0, 0x10, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x0804720C
void sub_804720C(struct SioResultProc * proc)
{
    if (proc->unk_38 >= 1)
    {
        proc->unk_36 -= 4;
        proc->unk_38--;

        BG_SetPosition(1, 0, proc->unk_36);
        sub_804D24C(10, proc->unk_36 + 56);

        return;
    }

    if (proc->unk_38 < 0)
    {
        proc->unk_36 += 4;
        proc->unk_38++;

        BG_SetPosition(1, 0, proc->unk_36);
        sub_804D24C(10, proc->unk_36 + 56);

        return;
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) && (proc->unk_34 != '\0'))
    {
        SioPlaySoundEffect(3);

        proc->unk_36 -= 4;
        proc->unk_34--;

        proc->unk_38 = 3;

        BG_SetPosition(1, 0, proc->unk_36);
        sub_804D24C(10, proc->unk_36 + 56);
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) && (proc->unk_34 + 5 < 10))
    {
        SioPlaySoundEffect(3);

        proc->unk_36 += 4;
        proc->unk_34++;

        proc->unk_38 = -3;

        BG_SetPosition(1, 0, proc->unk_36);
        sub_804D24C(10, proc->unk_36 + 56);
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08047308
u8 sub_8047308(int var)
{
    int i;

    if (var > 6)
    {
        return 5;
    }

    i = var - 2;

    if (i < 0)
    {
        i = 0;
    }

    return i;
}

//! FE8U = 0x08047324
void sub_8047324(struct SioResultProc * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0, 0, 0);

    Decompress(gUnknown_085AC9DC, (void *)(0x06000F00 + GetBackgroundTileDataOffset(1)));
    ApplyPalette(gUnknown_085ADCC8, 6);

    Decompress(Img_TacticianSelObj, (void *)(0x06014800));
    Decompress(gUnknown_085ACEFC, (void *)(0x06016000));
    ApplyPalette(gUnknown_085ADE08, 0x13);

    CallARM_FillTileRect(gBG2TilemapBuffer + 0x81, gUnknown_085AE464, 0x1000);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    proc->unk_34 = 5;
    proc->unk_36 = 280;
    proc->unk_39 = 0;
    proc->unk_38 = 0;
    proc->unk_35 = sub_8047308(proc->unk_3c);
    proc->unk_40 = 0;

    BG_SetPosition(1, 0, proc->unk_36);

    for (i = 0; i < 10; i++)
    {
        InitText(&Texts_0203DB14[i], 24);
    }

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    ClearText(&gSioTexts[0]);

    Text_InsertDrawString(&gSioTexts[0], 0xc, 0, GetStringFromIndex(0x772));
    Text_InsertDrawString(&gSioTexts[0], 0x54, 0, GetStringFromIndex(0x773));
    Text_InsertDrawString(&gSioTexts[0], 0x78, 0, GetStringFromIndex(0x774));
    Text_InsertDrawString(&gSioTexts[0], 0x96, 0, GetStringFromIndex(0x775));

    PutText(&gSioTexts[0], gBG0TilemapBuffer + 0xa5);

    ReadMultiArenaSaveRankings(gUnk_Sio_0203DC44);
    sub_8046F68();

    SetWinEnable(1, 1, 0);

    SetWin0Box(0, 58, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);

    SetWin1Box(0, 24, DISPLAY_WIDTH, 56);
    SetWin1Layers(1, 0, 1, 1, 0);

    SetWOutLayers(1, 0, 1, 1, 1);

    sub_804C558();

    proc->unk_2c = sub_804D7DC(14, proc->unk_3c * 16 - 24, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08047570
void sub_8047570(struct SioResultProc * proc)
{
    struct SioResultProcUnk2C * otherProc = proc->unk_2c;

    proc->unk_40++;

    if (proc->unk_40 < 60)
    {
        return;
    }

    if (proc->unk_35 == 5)
    {
        Proc_Break(proc);
    }

    if (proc->unk_38 >= 1)
    {
        proc->unk_36 -= 2;
        proc->unk_38--;

        BG_SetPosition(1, 0, proc->unk_36);
        sub_804D24C(10, proc->unk_36 + 56);

        otherProc->unk_30 += 2;
    }
    else
    {
        if (proc->unk_35 != proc->unk_34)
        {
            proc->unk_36 -= 2;
            proc->unk_34--;

            proc->unk_38 = 7;

            BG_SetPosition(1, 0, proc->unk_36);
            sub_804D24C(10, proc->unk_36 + 56);

            otherProc->unk_30 += 2;
        }

        if ((proc->unk_38 == 0) && (proc->unk_34 == proc->unk_35))
        {
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x0804762C
void sub_804762C(ProcPtr proc)
{
    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        Sound_FadeOutBGM(0);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SIORESULT[] =
{
    PROC_NAME("SIORESULT"),
    PROC_YIELD,

    PROC_CALL(sub_8047008),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_0203DDDC),

    PROC_REPEAT(sub_804720C),

    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(EndMuralBackground),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_085A9D98[] =
{
    PROC_YIELD,

    PROC_CALL(sub_8047324),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_0203DDDC),

    PROC_REPEAT(sub_8047570),
    PROC_REPEAT(sub_804762C),

    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(EndMuralBackground),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08047654
void sub_8047654(int value, ProcPtr parent)
{
    struct SioResultProc * proc = Proc_StartBlocking(gUnknown_085A9D98, parent);

    proc->unk_3c = value;

    return;
}
