#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "constants/msg.h"

#include "sio.h"

//! FE8U = 0x08046E5C
void DrawLinkArenaRankIcon(u16 * tm, u32 base)
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
void DrawLinkArenaModeIcon(u16 * tm, u32 base)
{
    u16 ref = base * 4 + 0x6078;

    tm[TILEMAP_INDEX(0, 0)] = ref;
    tm[TILEMAP_INDEX(1, 0)] = ref + 1;
    tm[TILEMAP_INDEX(0, 1)] = ref + 2;
    tm[TILEMAP_INDEX(1, 1)] = ref + 3;

    return;
}

//! FE8U = 0x08046EB8
void DrawLinkArenaRankingRow(struct Text * th, char * nameStr, u8 rank, u16 points, u8 playerCount)
{
    // clang-format off
    u16 rankMsgLut[] =
    {
        0,
        MSG_782, // "1st"
        MSG_783, // "2nd"
        MSG_784, // "3rd"
        MSG_785, // "4th"
    };

    u16 playerMsgLut[] =
    {
        0,
        MSG_786, // "P1"
        MSG_787, // "P2"
        MSG_788, // "P3"
        MSG_789, // "P4"
        MSG_78A, // "P5"
    };
    // clang-format on

    Text_InsertDrawString(th, 4, TEXT_COLOR_SYSTEM_WHITE, nameStr);

    SioDrawNumber(th, 84, 2, points);

    Text_InsertDrawString(th, 93, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_77F)); // "Pts."
    Text_InsertDrawString(th, 128, TEXT_COLOR_SYSTEM_BLUE, GetStringFromIndex(rankMsgLut[rank & 0xff]));
    Text_InsertDrawString(th, 154, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(playerMsgLut[playerCount & 0xff]));

    return;
}

//! FE8U = 0x08046F68
void DrawLinkArenaRankings(void)
{
    int i;

    for (i = 0; i < 10; i++)
    {
        ClearText(&Texts_1[i]);
        DrawLinkArenaRankingRow(
            &Texts_1[i], gSioResultRankings[i].name, gSioResultRankings[i].ranking + 1,
            gSioResultRankings[i].points, gSioResultRankings[i].player_count + 1);
        DrawLinkArenaRankIcon(TILEMAP_LOCATED(gBG1TilemapBuffer, 3, i * 2), i);
        PutText(&Texts_1[i], TILEMAP_LOCATED(gBG1TilemapBuffer, 6, i * 2));
        DrawLinkArenaModeIcon(TILEMAP_LOCATED(gBG1TilemapBuffer, 20, i * 2), gSioResultRankings[i].mode);
    }

    return;
}

//! FE8U = 0x08047008
void SioResult_Init(struct SioResultProc * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_LinkArenaRankIcons, GetBackgroundTileDataOffset(BG_1) + BG_CHR_ADDR(0x78));
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, OBJ_CHR_ADDR(0x240));
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 1, 4), Tsa_SioResultRankings, TILEREF(0x0, 1));

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    proc->unk_36 = 200;
    proc->unk_39 = 0;
    proc->unk_38 = 0;
    proc->unk_34 = 0;

    BG_SetPosition(BG_1, 0, proc->unk_36);

    for (i = 0; i < 10; i++)
    {
        InitText(&Texts_1[i], 22);
    }

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    ClearText(&gSioTexts[0]);

    Text_InsertDrawString(&gSioTexts[0], 12, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_772)); // "Name"
    Text_InsertDrawString(&gSioTexts[0], 84, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_773)); // "Points"
    Text_InsertDrawString(&gSioTexts[0], 120, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_774)); // "Rank"
    Text_InsertDrawString(&gSioTexts[0], 150, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_775)); // "Players"

    PutText(&gSioTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 5));

    PutSioText(MSG_744, 1); // "+Control Pad: move/B Button: back."

    ReadMultiArenaSaveRankings(gSioResultRankings);
    DrawLinkArenaRankings();

    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 58, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);

    SetWOutLayers(1, 0, 1, 1, 1);

    StartLinkArenaMenuScrollBar(217, 57, 10, 5, proc->unk_36 + 56, proc);
    StartLinkArenaTitleBanner(proc, 5, 0);
    SetLinkArenaUiBlend();
    StartLinkArenaButtonSpriteDraw(192, 16, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x0804720C
void SioResult_Loop_Main(struct SioResultProc * proc)
{
    if (proc->unk_38 >= 1)
    {
        proc->unk_36 -= 4;
        proc->unk_38--;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        return;
    }

    if (proc->unk_38 < 0)
    {
        proc->unk_36 += 4;
        proc->unk_38++;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        return;
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) && (proc->unk_34 != 0))
    {
        SioPlaySoundEffect(3);

        proc->unk_36 -= 4;
        proc->unk_34--;

        proc->unk_38 = 3;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) && (proc->unk_34 + 5 < 10))
    {
        SioPlaySoundEffect(3);

        proc->unk_36 += 4;
        proc->unk_34++;

        proc->unk_38 = -3;

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08047308
u8 SioResult_GetNewHSScrollTarget(int var)
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
void SioResult_NewHS_Init(struct SioResultProc * proc)
{
    int i;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0, 0, 0);

    Decompress(Img_LinkArenaRankIcons, GetBackgroundTileDataOffset(BG_1) + BG_CHR_ADDR(0x78));
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, OBJ_CHR_ADDR(0x240));
    Decompress(Img_SioResultBanner, OBJ_CHR_ADDR(0x300));
    ApplyPalette(Pal_LinkArenaActiveBannerFx, 0x13);

    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 1, 4), Tsa_SioResultRankings, TILEREF(0x0, 1));

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    proc->unk_34 = 5;
    proc->unk_36 = 280;
    proc->unk_39 = 0;
    proc->unk_38 = 0;
    proc->unk_35 = SioResult_GetNewHSScrollTarget(proc->unk_3c);
    proc->unk_40 = 0;

    BG_SetPosition(BG_1, 0, proc->unk_36);

    for (i = 0; i < 10; i++)
    {
        InitText(&Texts_1[i], 24);
    }

    InitText(&gSioTexts[0], 24);
    InitText(&gSioTexts[1], 24);

    ClearText(&gSioTexts[0]);

    Text_InsertDrawString(&gSioTexts[0], 12, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_772)); // "Name"
    Text_InsertDrawString(&gSioTexts[0], 84, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_773)); // "Points"
    Text_InsertDrawString(&gSioTexts[0], 120, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_774)); // "Rank"
    Text_InsertDrawString(&gSioTexts[0], 150, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_775)); // "Players"

    PutText(&gSioTexts[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 5));

    ReadMultiArenaSaveRankings(gSioResultRankings);
    DrawLinkArenaRankings();

    SetWinEnable(1, 1, 0);

    SetWin0Box(0, 58, DISPLAY_WIDTH, 136);
    SetWin0Layers(1, 1, 1, 1, 1);

    SetWin1Box(0, 24, DISPLAY_WIDTH, 56);
    SetWin1Layers(1, 0, 1, 1, 0);

    SetWOutLayers(1, 0, 1, 1, 1);

    SetLinkArenaUiBlend();

    proc->unk_2c = StartLinkArenaResultBanner(14, proc->unk_3c * 16 - 24, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08047570
void SioResult_NewHS_LoopScroll(struct SioResultProc * proc)
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

        BG_SetPosition(BG_1, 0, proc->unk_36);
        UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

        otherProc->unk_30 += 2;
    }
    else
    {
        if (proc->unk_35 != proc->unk_34)
        {
            proc->unk_36 -= 2;
            proc->unk_34--;

            proc->unk_38 = 7;

            BG_SetPosition(BG_1, 0, proc->unk_36);
            UpdateLinkArenaMenuScrollBar(10, proc->unk_36 + 56);

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
void SioResult_NewHS_AwaitAPress(ProcPtr proc)
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

    PROC_CALL(SioResult_Init),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(ClearLinkArenaUiBlendWindow),

    PROC_REPEAT(SioResult_Loop_Main),

    PROC_CALL(SetLinkArenaUiBlendWindow),

    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_YIELD,

    PROC_CALL(EndMuralBackground),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_SIORESULT_NewHighScore[] =
{
    PROC_YIELD,

    PROC_CALL(SioResult_NewHS_Init),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(ClearLinkArenaUiBlendWindow),

    PROC_REPEAT(SioResult_NewHS_LoopScroll),
    PROC_REPEAT(SioResult_NewHS_AwaitAPress),

    PROC_CALL(SetLinkArenaUiBlendWindow),

    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_YIELD,

    PROC_CALL(EndMuralBackground),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08047654
void StartSioResultNewHighScore(int value, ProcPtr parent)
{
    struct SioResultProc * proc = Proc_StartBlocking(ProcScr_SIORESULT_NewHighScore, parent);

    proc->unk_3c = value;

    return;
}
