
#include "global.h"

#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"

// various bits of the box opening animation
extern u8 CONST_DATA Img_TalkBubbleOpening_A[];
extern u8 CONST_DATA Img_TalkBubbleOpening_B[];
extern u8 CONST_DATA Img_TalkBubbleOpening_C[];
extern u8 CONST_DATA Img_TalkBubbleOpening_D[];
extern u8 CONST_DATA Img_TalkBubbleOpening_E[];
extern u8 CONST_DATA Img_TalkBubble[];

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkState->topTextNum) % sTalkState->lines)

static struct TalkState sTalkStateCore;
struct TalkState* CONST_DATA sTalkState = &sTalkStateCore;
static struct Text sTalkText[3];
static int sTalkChoiceResult;
static struct Font sTalkFont;

struct ProcCmd CONST_DATA gProcScr_TalkSkipListener[] =
{
    PROC_MARK(PROC_MARK_TALK),
    PROC_REPEAT(TalkSkipListener_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_Talk[] =
{
    PROC_MARK(PROC_MARK_TALK),
    PROC_SET_END_CB(Talk_OnEnd),

    PROC_SLEEP(1),

    PROC_CALL(Talk_OnInit),
    PROC_REPEAT(Talk_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_TalkLock[] =
{
    PROC_BLOCK,
};

struct FaceVramEntry CONST_DATA FaceConfig_FightEvent[4] =
{
    [0] =
    {
        .tileOffset = 0x20 * 0x40,
        .paletteId  = 3,
    },

    [1] =
    {
        .tileOffset = 0x20 * 0x40,
        .paletteId  = 3,
    },

    [2] =
    {
        .tileOffset = 0x20 * 0x40,
        .paletteId  = 3,
    },

    [3] =
    {
        .tileOffset = 0x20 * 0x40,
        .paletteId  = 3,
    },
};

struct ProcCmd CONST_DATA gProcScr_TalkFaceMove[] =
{
    PROC_SLEEP(1),

    PROC_CALL(TalkFaceMove_OnInit),
    PROC_REPEAT(TalkFaceMove_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_TalkPause[] =
{
    PROC_MARK(PROC_MARK_TALK),
    PROC_SLEEP(1),

    PROC_REPEAT(TalkPause_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_TalkWaitForInput[] =
{
    PROC_MARK(PROC_MARK_TALK),
    PROC_SLEEP(8),

    PROC_REPEAT(TalkWaitForInput_OnIdle),
    PROC_SLEEP(1),

    PROC_END,
};

static u16 CONST_DATA sObj_PressKeyArrow0[] =
{
    1, OAM0_SHAPE_8x8 + OAM0_Y(0), OAM1_SIZE_8x8, OAM2_CHR(0),
};

static u16 CONST_DATA sObj_PressKeyArrow1[] =
{
    1, OAM0_SHAPE_8x8 + OAM0_Y(1), OAM1_SIZE_8x8, OAM2_CHR(0),
};

static u16 CONST_DATA sObj_PressKeyArrow2[] =
{
    1, OAM0_SHAPE_8x8 + OAM0_Y(2), OAM1_SIZE_8x8, OAM2_CHR(0),
};

const u16* CONST_DATA gPressKeyArrowSpriteLut[] =
{
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,

    sObj_PressKeyArrow1,

    sObj_PressKeyArrow2,
    sObj_PressKeyArrow2,
    sObj_PressKeyArrow2,
    sObj_PressKeyArrow2,

    sObj_PressKeyArrow1,
};

struct ProcCmd CONST_DATA gProcScr_TalkShiftClearAll[] =
{
    PROC_MARK(PROC_MARK_TALK),

    PROC_CALL(TalkShiftClearAll_OnInit),
    PROC_REPEAT(TalkShiftClearAll_OnIdle),

    PROC_END,
};

struct ChoiceEntryInfo CONST_DATA gYesNoTalkChoice[2] =
{
    { 0x843, NULL }, // Yes
    { 0x844, NULL }, // No
};

struct ChoiceEntryInfo CONST_DATA gBuySellTalkChoice[2] =
{
    { 0x845, TalkChoice_OnBuy }, // Buy
    { 0x846, TalkChoice_OnSell }, // Sell
};

struct ProcCmd CONST_DATA gProcScr_TalkChoice[] =
{
    PROC_SLEEP(8),
    PROC_REPEAT(TalkChoice_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_TalkShiftClear[] =
{
    PROC_MARK(PROC_MARK_TALK),

    PROC_CALL(TalkShiftClear_OnInit),
    PROC_REPEAT(TalkShiftClear_OnIdle),

    PROC_SLEEP(1),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_TalkSpriteShiftClear[] =
{
    PROC_MARK(PROC_MARK_TALK),

    PROC_CALL(sub_80080D0),
    PROC_SLEEP(0),

    PROC_CALL(sub_8008108),
    PROC_SLEEP(1),

    PROC_END,
};

int CONST_DATA gTalkPauseDurations[4] = { 8, 16, 32, 64 };

struct ProcCmd CONST_DATA gProcScr_TalkBubbleOpen[] =
{
    PROC_REPEAT(TalkBubbleOpen_OnIdle),
    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_TalkOpen[] =
{
    PROC_MARK(PROC_MARK_TALK),
    PROC_SET_END_CB(TalkOpen_OnEnd),

    PROC_CALL(TalkOpen_InitBlend),
    PROC_REPEAT(TalkOpen_PutTalkBubble),
    PROC_REPEAT(TalkOpen_OnIdle),

    PROC_END,
};

int CONST_DATA gTalkFaceHPosLut[8] = { 3, 6, 9, 21, 24, 27, -8, 38 };

u16 CONST_DATA gSprite_TalkTextFront[] =
{
    4,
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8),       OAM2_CHR(0x21),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8 + 64),  OAM2_CHR(0x29),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8 + 128), OAM2_CHR(0x31),
    OAM0_SHAPE_32x32 + OAM0_Y(8), OAM1_SIZE_32x32 + OAM0_Y(8 + 192), OAM2_CHR(0x39),
};

u16 CONST_DATA gSprite_TalkTextBack[] =
{
    12,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32,               OAM2_CHR(0x00),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(64),  OAM2_CHR(0x08),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(128), OAM2_CHR(0x10),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(192), OAM2_CHR(0x18),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16,               OAM2_CHR(0x80),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(32),  OAM2_CHR(0x84),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(64),  OAM2_CHR(0x88),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(96),  OAM2_CHR(0x8C),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(128), OAM2_CHR(0x90),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(160), OAM2_CHR(0x94),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(192), OAM2_CHR(0x98),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(224), OAM2_CHR(0x9C),
};

struct ProcCmd CONST_DATA gProcScr_TalkPutSpriteText_Unused[] =
{
    PROC_SET_END_CB(TalkPutSpriteText_OnEnd),
    PROC_REPEAT(TalkPutSpriteText_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_0859160C[] =
{
    PROC_SET_END_CB(sub_8008F54),
    PROC_WHILE(sub_8008F3C),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_08591624[] =
{
    PROC_CALL(sub_8008FAC),
    PROC_REPEAT(sub_8008FB4),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_0859163C[] =
{
    PROC_YIELD,

    PROC_CALL(sub_800903C),
    PROC_REPEAT(sub_800904C),
    PROC_REPEAT(sub_8009100),

    PROC_END,
};

//! FE8U = 0x080067E8
void ClearTalkFaceRefs(void) {
    int i;

    for (i = 0; i < 8; i++) {
        sTalkState->faces[i] = NULL;
    }

    return;
}

//! FE8U = 0x0800680C
void InitTalk(int chr, int lines, s8 unpackBubble) {
    int i;

    InitTextFont(&sTalkFont, (void*)(0x6000000 + GetBackgroundTileDataOffset(0) + (0x3FF & chr) * 0x20), chr, 2);
    SetInitTalkTextFont();

    sTalkState->lines = lines;

    for (i = 0; i < lines; i++) {
        InitText(sTalkText + i, 30);
        Text_SetColor(sTalkText + i, 1);
    }

    if (unpackBubble != 0) {
        Decompress(Img_TalkBubble, (void*)(GetBackgroundTileDataOffset(BG_1) + 0x06000200));
        ApplyPalette(Pal_TalkBubble, 3);
    }

    ClearTalkFaceRefs();

    return;
}

//! FE8U = 0x080068AC
void InitSpriteTalk(int chr, int lines, int palId) {
    int i;

    InitSpriteTextFont(&sTalkFont, (void*)(0x06010000 + (0x3FF & chr) * CHR_SIZE), palId);

    SetTextFont(&sTalkFont);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    ApplyPalette(gUnknown_0859EF20, palId + 0x10);

    PAL_OBJ_COLOR(palId, 4) = RGB(7, 18, 28);
    PAL_OBJ_COLOR(palId, 14) = RGB(14, 13, 12);
    PAL_OBJ_COLOR(palId, 15) = RGB(31, 31, 31);

    sTalkState->lines = lines;

    for (i = 0; i < lines; i++) {
        InitSpriteText(sTalkText + i);

        SpriteText_Clear(sTalkText + i);
        Text_SetColor(sTalkText + i, 0);
        Text_SetCursor(sTalkText + i, 4);
    }

    return;
}

//! FE8U = 0x08006964
void sub_8006964(void) {
    ApplyPalette(Pal_Text, 2);
    return;
}

//! FE8U = 0x08006978
void SetInitTalkTextFont(void) {
    SetTextFont(&sTalkFont);
    InitTalkTextFont();

    return;
}

//! FE8U = 0x0800698C
ProcPtr StartTalkExt(int x, int y, const char* str, ProcPtr parent) {
    sTalkState->xText = x;
    sTalkState->yText = y;

    sTalkState->str = str;
    sTalkState->strBackup = NULL;

    sTalkState->printColor = 1;
    sTalkState->lineActive = 0;
    sTalkState->unk82 = 0;
    sTalkState->topTextNum = 0;
    sTalkState->printDelay = GetTextDisplaySpeed();
    sTalkState->printClock = 0;

    SetActiveTalkFace(0xff);

    sTalkState->speakingFaceSlot = (s8)0xff;
    sTalkState->putLines = 0;
    sTalkState->instantScroll = 0;
    sTalkState->mouthMoveEnabled = 1;
    sTalkState->faceSmileEnabled = 0;

    sTalkState->config = 0;

    sTalkState->unk38 = NULL;
    sTalkState->invertedFlags = 0;

    sTalkState->activeWidth = Div(GetStrTalkLen(sTalkState->str, 0) + 7, 8) + 2;

    if (parent) {
        return Proc_StartBlocking(gProcScr_Talk, parent);
    } else {
        return Proc_Start(gProcScr_Talk, PROC_TREE_3);
    }
}

//! FE8U = 0x08006A30
ProcPtr StartTalkMsg(int x, int y, int msgId) {
    return StartTalkExt(x, y, GetStringFromIndex(msgId), NULL);
}

//! FE8U = 0x08006A50
ProcPtr StartTalkMsgExt(int x, int y, int msgId, ProcPtr parent) {
    return StartTalkExt(x, y, GetStringFromIndex(msgId), parent);
}

//! FE8U = 0x08006A70
ProcPtr StartTalk(int x, int y, const char* str) {
    return StartTalkExt(x, y, str, NULL);
}

//! FE8U = 0x08006A7C
void EndTalk(void) {
    Proc_EndEach(gProcScr_Talk);
    return;
}

//! FE8U = 0x08006A8C
void SetTalkLines(int lines) {
    sTalkState->lines = lines;
    return;
}

//! FE8U = 0x08006A98
void ClearAllTalkFlags(void) {
    sTalkState->config = 0;
    return;
}

//! FE8U = 0x08006AA8
void SetTalkFlag(int flag) {
    sTalkState->config |= flag;
    return;
}

//! FE8U = 0x08006ABC
void sub_8006ABC(void(*func)(ProcPtr)) {
    sTalkState->unk38 = func;
    return;
}

//! FE8U = 0x08006AC8
void ClearTalkFlag(int flag) {
    sTalkState->config &= ~flag;
    return;
}

//! FE8U = 0x08006ADC
int CheckTalkFlag(int flag) {
    return sTalkState->config & flag;
}

//! FE8U = 0x08006AF0
void SetTalkPrintDelay(int printDelay) {

    sTalkState->printDelay = printDelay;

    if (sTalkState->printDelay < 0) {
        sTalkState->printDelay = 0;
    }

    return;
}

//! FE8U = 0x08006B10
void SetTalkPrintColor(int color) {
    int i;

    sTalkState->printColor = color;

    for (i = 0; i < sTalkState->lines; i++) {
        Text_SetColor(sTalkText + i, sTalkState->printColor);
    }

    return;
}

//! FE8U = 0x08006B4C
void TalkSkipListener_OnIdle(ProcPtr proc) {

    if (Proc_Find(gProcScr_TalkShiftClearAll) != NULL) {
        return;
    }

    if (Proc_Find(gProcScr_TalkShiftClear) != NULL) {
        return;
    }

    if (!CheckTalkFlag(TALK_FLAG_NOSKIP) && (gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON))) {
        SetDialogueSkipEvBit();
        SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

        Proc_End(proc);
        EndTalk();

        BG_Fill(gBG0TilemapBuffer, 0);
        BG_Fill(gBG1TilemapBuffer, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

        return;
    }

    if (Proc_Find(gProcScr_TalkWaitForInput) != 0) {
        return;
    }

    if (!CheckTalkFlag(TALK_FLAG_NOFAST) && (gKeyStatusPtr->newKeys & (DPAD_ANY | A_BUTTON | B_BUTTON))) {
        sTalkState->instantScroll = 1;
    }

    return;
}

//! FE8U = 0x08006C00
void Talk_OnInit(void) {

    if (!CheckTalkFlag(TALK_FLAG_SPRITE)) {
        LoadObjUIGfx();

        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);
    }

    Proc_Start(gProcScr_TalkSkipListener, PROC_TREE_3);

    return;
}

//! FE8U = 0x08006C34
void Talk_OnIdle(ProcPtr proc) {

    if (IsTalkFaceMoving()) {
        return;
    }

    if (!sTalkState->instantScroll) {
        sTalkState->printClock++;

        if (sTalkState->printClock < sTalkState->printDelay) {
            return;
        }
    }

    sTalkState->printClock = 0;

    while (1) {
        SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

        switch (TalkInterpret(proc)) {
            case 0:
                Proc_Break(proc);
                return;

            case 1:
                goto _08006CD0;

            case 2:
                if (sTalkState->instantScroll || sTalkState->printDelay <= 0) {
                    break;
                    goto _08006CC2;
                }

                return;

            case 3:
        _08006CC2:
                sTalkState->printClock = sTalkState->printDelay;
                sTalkState->instantScroll = 0;

                return;

            default:
        _08006CD0:
                if (!(CheckTalkFlag(TALK_FLAG_SPRITE))) {
                    if (TalkPrepNextChar(proc) == 1) {
                        return;
                    }
                } else {
                    if (TalkSpritePrepNextChar(proc) == 1) {
                        return;
                    }
                }

                sTalkState->str = Text_DrawCharacter(TALK_TEXT_BY_LINE(sTalkState->lineActive), sTalkState->str);

                if (!CheckTalkFlag(TALK_FLAG_SILENT)) {
                    if (CheckTalkFlag(TALK_FLAG_7)) {
                        PlaySoundEffect(0x7a);
                    } else {
                        if ((GetTextDisplaySpeed() == 1) && !(GetGameClock() & 1)) {
                            break;
                        }

                        if (sTalkState->instantScroll && sTalkState->unk82) {
                            break;
                        }

                        sTalkState->unk82 = 1;
                        PlaySoundEffect(0x6e);
                    }
                }
        }


        if (!sTalkState->instantScroll && sTalkState->printDelay > 0) {
            return;
        }
    }

    return;
}

//! FE8U = 0x08006DA0
s8 TalkPrepNextChar(ProcPtr proc) {

    if (!TalkHasCorrectBubble() && sTalkState->activeFaceSlot != 0xFF && !CheckTalkFlag(TALK_FLAG_NOBUBBLE)) {

        if (sTalkState->strBackup == NULL) {
            sTalkState->activeWidth = 2 + Div(GetStrTalkLen(sTalkState->str, 0) + 7, 8);
        } else {
            sTalkState->activeWidth = 2 + Div(GetStrTalkLen(sTalkState->strBackup, 0) + 7, 8);
        }

        ClearTalkBubble();

        StartTalkOpen(sTalkState->activeFaceSlot, proc);
        SetTalkFaceLayer(sTalkState->activeFaceSlot, CheckTalkFlag(TALK_FLAG_4));

        return 1;
    }

    if (sTalkState->lineActive >= sTalkState->lines) {
        sTalkState->instantScroll = 0;
        Proc_StartBlocking(gProcScr_TalkShiftClear, proc);
        return 1;
    }

    if (!sTalkState->putLines) {
        PutText(
            TALK_TEXT_BY_LINE(sTalkState->lineActive),
            gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2)
        );

        TalkBgSync(1);

        sTalkState->putLines = 1;
    }

    if (sTalkState->mouthMoveEnabled != 0) {
        SetTalkFaceMouthMove(sTalkState->activeFaceSlot);
    }

    return 0;
}

//! FE8U = 0x08006E8C
s8 TalkSpritePrepNextChar(ProcPtr proc) {

    if (sTalkState->lineActive >= sTalkState->lines) {
        sTalkState->instantScroll = 0;
        Proc_StartBlocking(ProcScr_TalkSpriteShiftClear, proc);
        return 1;
    }

    if (sTalkState->putLines == 0) {
        sTalkState->putLines = 1;
    }

    return 0;
}

//! FE8U = 0x08006EC4
void LockTalk(ProcPtr proc) {
    Proc_StartBlocking(gProcScr_TalkLock, proc);
    return;
}

//! FE8U = 0x08006ED8
s8 IsTalkLocked(void) {
    return Proc_Find(gProcScr_TalkLock) != 0;
}

//! FE8U = 0x08006EF0
void ResumeTalk(void) {
    Proc_EndEach(gProcScr_TalkLock);
    return;
}

//! FE8U = 0x08006F00
void sub_8006F00(void) {
    int i;

    if (sTalkState->printColor == 1) {
        for (i = 0; i < sTalkState->lines; i++) {
            Text_SetColor(TALK_TEXT_BY_LINE(i), 4);
        }

        sTalkState->printColor = 4;
    } else {

        for (i = 0; i < sTalkState->lines; i++) {
            Text_SetColor(TALK_TEXT_BY_LINE(i), 1);
        }

        sTalkState->printColor = 1;
    }

    return;
}

//! FE8U = 0x08006F8C
void TalkToggleInvertedPalette(int flag) {
    if (flag != 0)
    {
        ApplyPalette(Pal_TalkBubble_Inverted, 3);
        ApplyPalette(Pal_Text_Inverted, 2);
    }
    else
    {
        ApplyPalette(Pal_TalkBubble, 3);
        ApplyPalette(Pal_Text, 2);
    }

    return;
}

//! FE8U = 0x08006FD0
int TalkInterpret(ProcPtr proc) {
    struct Proc* unkProc;
    int i;

    while (1) {
        switch (*sTalkState->str) {
            case CHFE_L_NormalPrint:
            case CHFE_L_FastPrint:
            case CHFE_L_CloseSpeechFast:
                sTalkState->str++;
                sTalkState->activeWidth = 2 + Div(GetStrTalkLen(sTalkState->str, TalkHasCorrectBubble()) + 7, 8);
                continue;
        }
        break;
    }

    switch (*sTalkState->str) {
        case 0x81:
            // _08007238
            if (sTalkState->str[1] == 0x40) {
                sTalkState->str += 2;

                Text_Skip(TALK_TEXT_BY_LINE(sTalkState->lineActive), 6);

                if (sTalkState->instantScroll || sTalkState->printDelay <= 0) {
                    return 2;
                }

                unkProc = Proc_StartBlocking(gProcScr_TalkPause, proc);
                unkProc->unk64 = GetTalkPauseCmdDuration(4);
                return 3;
            }

            return 1;

        case CHFE_L_X: // [X]
            // _08007298
            if (sTalkState->strBackup == 0) {
                return 0;
            }

            sTalkState->str = sTalkState->strBackup;
            sTalkState->str += 2;
            sTalkState->strBackup = NULL;

            return TalkInterpret(proc);

        case CHFE_L_NL: // [NL]
            // _080072AE
            if (sTalkState->putLines == 1 || sTalkState->lineActive == 1) {
                sTalkState->lineActive++;
            }

            sTalkState->putLines = 0;
            sTalkState->str++;
            return 2;

        case CHFE_L_2NL: // [2NL]
            // _080072CC
            if (CheckTalkFlag(TALK_FLAG_7)) {
                TalkFlushAllLine();
                sTalkState->str++;
            } else if (!CheckTalkFlag(TALK_FLAG_INSTANTSHIFT)) {
                Proc_StartBlocking(gProcScr_TalkShiftClearAll, proc);
            } else {
                ClearTalkText();
            }

            sTalkState->str++;
            return 3;

        case CHFE_L_A: // [A]
            // _08007314
            StartTalkWaitForInput(
                proc,
                sTalkState->xText * 8 + Text_GetCursor(TALK_TEXT_BY_LINE(sTalkState->lineActive)) + 4,
                sTalkState->yText * 8 + sTalkState->lineActive * 16 + 8
            );

            sTalkState->str++;

            return 3;

        case CHFE_L_Pause8: // [....]
        case CHFE_L_Pause16: // [.....]
        case CHFE_L_Pause32: // [......]
        case CHFE_L_Pause64: // [.......]
            // _08007350
            if (sTalkState->instantScroll) {
                sTalkState->str++;
                return 2;
            }

            unkProc = Proc_StartBlocking(gProcScr_TalkPause, proc);
            unkProc->unk64 = GetTalkPauseCmdDuration(*sTalkState->str);

            sTalkState->str++;
            return 3;

        case CHFE_L_CloseSpeechSlow: // [CloseSpeechSlow]
            // _08007384
            ClearTalkBubble();
            sTalkState->str++;
            return 3;

        case CHFE_L_ToggleMouthMove: // [ToggleMouthMove]
            // _08007394
            sTalkState->mouthMoveEnabled = 1 - sTalkState->mouthMoveEnabled;
            sTalkState->str++;
            return 3;

        case CHFE_L_ToggleSmile: // [ToggleSmile]
            // _080073A0
            sTalkState->faceSmileEnabled = 1 - sTalkState->faceSmileEnabled;
            sTalkState->str++;
            return 3;

        case CHFE_L_LoadFace: // [LoadFace]
            /**
             * Load face format:
             * BYTE position: \x8 ~ \xF
             * BYTE CHFE_L_LoadFace
             * SHORT face_id (0xFFFF is active unit)
             */
            while (1) {
                switch (*sTalkState->str) {
                    case CHFE_L_OpenFarLeft:
                    case CHFE_L_OpenMidLeft:
                    case CHFE_L_OpenLeft:
                    case CHFE_L_OpenRight:
                    case CHFE_L_OpenMidRight:
                    case CHFE_L_OpenFarRight:
                    case CHFE_L_OpenFarFarLeft:
                    case CHFE_L_OpenFarFarRight:
                        SetActiveTalkFace(*sTalkState->str - 8);
                        sTalkState->str++;
                        continue;

                    case CHFE_L_LoadFace:
                        sTalkState->str++;
                        TalkLoadFace(proc);
                        sTalkState->str++;
                        sTalkState->str++;
                        continue;
                }
                break;
            }

            return 3;

        case CHFE_L_ClearFace: // [ClearFace]
            // _080073EC
            if (TalkHasCorrectBubble()) {
                ClearTalkBubble();
            }

            StartFaceFadeOut(sTalkState->faces[sTalkState->activeFaceSlot]);
            sTalkState->faces[sTalkState->activeFaceSlot] = 0;
            sTalkState->str++;
            StartTemporaryLock(proc, 16);
            return 3;

        case CHFE_L_SendToBack: // [SendToBack]
            // _08007430
            SetTalkFlag(TALK_FLAG_4);
            sTalkState->str++;
            return 3;

        case CHFE_L_FastPrint2: // [FastPrint]
            // _08007440
            ClearTalkFlag(TALK_FLAG_4);
            sTalkState->str++;
            return 3;

        case CHFE_L_OpenFarLeft: // [OpenFarLeft]
        case CHFE_L_OpenMidLeft: // [OpenMidLeft]
        case CHFE_L_OpenLeft: // [OpenLeft]
        case CHFE_L_OpenRight: // [OpenRight]
        case CHFE_L_OpenMidRight: // [OpenMidRight]
        case CHFE_L_OpenFarRight: // [OpenFarRight]
        case CHFE_L_OpenFarFarLeft: // [OpenFarFarLeft]
        case CHFE_L_OpenFarFarRight: // [OpenFarFarRight]
            // _08007450
            SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

            SetActiveTalkFace(*sTalkState->str - 8);

            while (sTalkState->str++) {
                if (sTalkState->str == sTalkState->str)
                    break;
            }

            return 3;

        case CHFE_L_Yes: // [Yes]
            // _08007462
            StartTalkChoice(
                gYesNoTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                1,
                sTalkState->printColor,
                proc
            );

            sTalkState->str++;
            return 3;

        case CHFE_L_No: // [No]
            // _080074AC
            StartTalkChoice(
                gYesNoTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                2,
                sTalkState->printColor,
                proc
            );

            sTalkState->str++;
            return 3;

        case CHFE_L_BuySell: // [Buy/Sell]
            // _080074F8
            StartTalkChoice(
                gBuySellTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                1,
                sTalkState->printColor,
                proc
            );

            while (sTalkState->str++) {
                if (sTalkState->str == sTalkState->str)
                    break;
            }

            return 3;

        case CHFE_L_ShopContinue: // [ShopContinue]
            // _08007544
            StartTalkChoice(
                gBuySellTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                2,
                sTalkState->printColor,
                proc
            );

            while (sTalkState->str++) {
                if (sTalkState->str == sTalkState->str)
                    break;
            }

            return 3;

        case 0x80:
            // _08007590
            switch (*++sTalkState->str) {
                case 0x24:
                    // _08007648
                    if (sTalkState->unk38) {
                        sTalkState->unk38(proc);
                    }

                    sTalkState->str++;
                    return 3;

                case 0x21: // [ToggleRed]
                    // _08007658
                    sub_8006F00();
                    sTalkState->str++;
                    return TalkInterpret(proc);

                case 0x00:
                case 0x01:
                case 0x02:
                case 0x03:
                    // _0800766C
                    sTalkState->printColor = *++sTalkState->str;

                    for (i = 0; i < sTalkState->lines; i++) {
                        Text_SetColor(sTalkText + i, sTalkState->printColor);
                    }

                    sTalkState->str++;
                    return 3;
                case 0x25: // [ToggleColorInvert]
                    // _080076AC
                    sTalkState->invertedFlags = 3 - (sTalkState->invertedFlags & 1);
                    sTalkState->str++;
                    return 3;

                case 0x04: // [Events]
                    // _080076BE
                    LockTalk(proc);
                    sTalkState->str++;
                    return 3;

                case 0x05: // [G]
                    // _080076D0
                    NumberToStringAscii(sTalkState->userNumber, sTalkState->userNumberString);

                    sTalkState->str--;

                    sTalkState->strBackup = sTalkState->str;

                    sTalkState->str = sTalkState->userNumberString;

                    return TalkInterpret(proc);

                case 0x20: // [Tact]
                    // _080076F0

                    sTalkState->strBackup = sTalkState->str;
                    sTalkState->strBackup--;
                    sTalkState->str = GetTacticianName();

                    return TalkInterpret(proc);

                case 0x06:
                    // _08007708
                    sTalkState->str--;

                    sTalkState->strBackup = sTalkState->str;
                    sTalkState->str = sTalkState->userString;

                    return TalkInterpret(proc);
                case 0x0A: // [MoveFarLeft]
                case 0x0B: // [MoveMidLeft]
                case 0x0C: // [MoveLeft]
                case 0x0D: // [MoveRight]
                case 0x0E: // [MoveMidRight]
                case 0x0F: // [MoveFarRight]
                case 0x10: // [MoveFarFarLeft]
                case 0x11: // [MoveFarFarRight]
                    // _08007720
                    MoveTalkFace(sTalkState->activeFaceSlot, *sTalkState->str - 10);
                    SetActiveTalkFace(*sTalkState->str - 10);

                    sTalkState->str++;
                    return 3;

                case 0x07:
                case 0x08:
                    // _0800773A
                    sTalkState->str++;
                    return 3;

                case 0x16: // [EnableBlinking]
                    // _08007744
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 0);
                    return 3;

                case 0x17:
                    // _0800775A
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 1);
                    return 3;

                case 0x18: // [DelayBlinking]
                    // _08007770
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 3);
                    return 3;

                case 0x19: // [PauseBlinking]
                    // _08007786
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 2);
                    return 3;

                case 0x1A:
                    // _0800779C
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 4);
                    return 3;

                case 0x1B: // [DisableBlinking]
                    // _080077B2
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 5);
                    return 3;

                case 0x1C: // [OpenEyes]
                    // _080077CC
                    sTalkState->str++;
                    sub_80064D4(sTalkState->faces[sTalkState->activeFaceSlot], 0);
                    return 3;

                case 0x1D: // [CloseEyes]
                    // _080077E2
                    sTalkState->str++;
                    sub_80064D4(sTalkState->faces[sTalkState->activeFaceSlot], 2);
                    return 3;

                case 0x1E: // [HalfCloseEyes]
                    // _080077F8
                    sTalkState->str++;
                    sub_80064D4(sTalkState->faces[sTalkState->activeFaceSlot], 3);
                    return 3;

                case 0x1F: // [Wink]
                    // _0800780E
                    sTalkState->str++;
                    sub_80064D4(sTalkState->faces[sTalkState->activeFaceSlot], 4);
                    return 3;

                default:
                    return 0;
            }
    }

    return 1;
}

//! FE8U = 0x08007838
int SetActiveTalkFace(int slot) {
    sTalkState->activeFaceSlot = slot;
    return slot;
}

//! FE8U = 0x08007844
void SetupFaceGfxDataInBanim(void) {
    SetupFaceGfxData(FaceConfig_FightEvent);
    return;
}

//! FE8U = 0x08007854
void TalkLoadFace(ProcPtr proc) {
    int faceDisp = 0;
    int faceId;

    if (sTalkState->activeFaceSlot == 0xFF) {
        SetActiveTalkFace(1);
    }

    if ((s8)IsBattleDeamonActive()) {
        SetupFaceGfxDataInBanim();
    } else {
        faceDisp |= FACE_DISP_KIND(FACE_96x80);
    }

    if (GetTalkFaceHPos(sTalkState->activeFaceSlot) <= 14) {
        faceDisp |= FACE_DISP_FLIPPED;
    }

    faceId = sTalkState->str[0];
    faceId = (sTalkState->str[1] * 0x100) + faceId;

    if (faceId == 0xFFFF) {
        faceId = GetUnitPortraitId(gActiveUnit);
    } else {
        faceId = faceId - 0x100;
    }

    if (sTalkState->faces[sTalkState->activeFaceSlot] != NULL) {
        sub_80066E0(sTalkState->faces[sTalkState->activeFaceSlot], faceId);
        return;
    }

    sTalkState->faces[sTalkState->activeFaceSlot] = StartFaceAuto(faceId, GetTalkFaceHPos(sTalkState->activeFaceSlot) * 8, 80, faceDisp);

    StartFaceFadeIn(sTalkState->faces[sTalkState->activeFaceSlot]);

    SetTalkFaceLayer(sTalkState->activeFaceSlot, CheckTalkFlag(TALK_FLAG_4));
    StartTemporaryLock(proc, 8);

    return;
}

//! FE8U = 0x08007938
ProcPtr StartTalkFace(int faceId, int x, int y, int disp, int talkFace) {
    sTalkState->faces[talkFace] = StartFaceAuto(faceId, x, y, disp);

    return sTalkState->faces[talkFace];
}

//! FE8U = 0x08007958
int GetFaceIdByXPos(int x) {
    int i;

    for (i = 0; i < 4; i++) {
        if (gFaces[i] == NULL) {
            continue;
        }

        if (gFaces[i]->xPos == x) {
            return i;
        }
    }

    return -1;
}

//! FE8U = 0x0800798C
void SetTalkFaceLayer(int talkFace, int toBack) {
    int i;
    int iStart;
    int iEnd;
    int argLayer;
    int otherLayer;

    if (toBack != 0) {
        return;
    }

    argLayer = 5;
    otherLayer = 6;

    switch (talkFace) {
        case 0:
        case 1:
        case 2:
        default:
            iStart = 0;
            iEnd = 2;
            break;

        case 3:
        case 4:
        case 5:
            iStart = 3;
            iEnd = 5;
            break;
    }

    for (i = iStart; i <= iEnd; i++) {
        if (!sTalkState->faces[i]) {
            continue;
        }

        if (i == talkFace) {
            sTalkState->faces[i]->spriteLayer = argLayer;
        } else {
            sTalkState->faces[i]->spriteLayer = otherLayer;
        }
    }

    return;
}

//! FE8U = 0x080079E4
void MoveTalkFace(int talkFaceFrom, int talkFaceTo) {
    struct FaceProc* face;
    s8 isSwap = 0;

    if (sTalkState->faces[talkFaceTo] != 0) {
        isSwap = 1;
        StartTalkFaceMove(talkFaceTo, talkFaceFrom, 1);
    }

    StartTalkFaceMove(talkFaceFrom, talkFaceTo, isSwap);

    face = sTalkState->faces[talkFaceFrom];
    sTalkState->faces[talkFaceFrom] = sTalkState->faces[talkFaceTo];
    sTalkState->faces[talkFaceTo] = face;

    return;
}

//! FE8U = 0x08007A3C
s8 IsTalkFaceMoving(void) {
    if (Proc_Find(gProcScr_TalkFaceMove) != NULL) {
        return 1;
    }
    return 0;
}

//! FE8U = 0x08007A58
void StartTalkFaceMove(int talkFaceFrom, int talkFaceTo, s8 isSwap) {
    struct Proc* proc;

    int slot = GetFaceIdByXPos(GetTalkFaceHPos(talkFaceFrom) * 8);

    if (slot == -1) {
        return;
    }

    proc = Proc_Start(gProcScr_TalkFaceMove, gFaces[slot]);

    proc->unk64 = slot;
    proc->unk66 = talkFaceTo;
    proc->unk68 = gFaces[slot]->xPos;
    proc->unk6A = isSwap;

    return;
}

//! FE8U = 0x08007AB0
void TalkFaceMove_OnInit(struct Proc* proc) {

    proc->unk58 = 0;

    if (((proc->unk68 - GetTalkFaceHPos(proc->unk66) * 8) < 0)
        ? (GetTalkFaceHPos(proc->unk66) * 8 - proc->unk68) > 24
        : (proc->unk68 - GetTalkFaceHPos(proc->unk66) * 8)  > 24) {
        proc->unk5C = 32;
    } else {
        proc->unk5C = 16;
    }

    return;
}

//! FE8U = 0x08007B0C
void TalkFaceMove_OnIdle(struct Proc* proc) {
    if (proc->unk5C > 16) {
        if (proc->unk58 == proc->unk5C / 8) {
            gFaces[proc->unk64]->yPos++;
        }

        if (proc->unk58 == proc->unk5C / 2) {
            gFaces[proc->unk64]->yPos--;
        }

        if (proc->unk58 == proc->unk5C * 5 / 8) {
            gFaces[proc->unk64]->yPos++;
        }

    } else {
        if (proc->unk58 == proc->unk5C / 2) {
            gFaces[proc->unk64]->yPos++;
        }
    }

    if (proc->unk58 >= proc->unk5C) {
        gFaces[proc->unk64]->yPos--;
        Proc_Break(proc);
    } else {
        gFaces[proc->unk64]->xPos = Interpolate(
            INTERPOLATE_RSQUARE,
            proc->unk68,
            GetTalkFaceHPos(proc->unk66) * 8,
            proc->unk58++,
            proc->unk5C
        );
    }

    return;
}

//! FE8U = 0x08007C0C
void Talk_OnEnd(void) {
    Proc_EndEach(gProcScr_TalkSkipListener);
    Proc_EndEach(gProcScr_TalkShiftClearAll);
    return;
}

//! FE8U = 0x08007C28
void TalkPause_OnIdle(struct Proc* proc) {

    if (proc->unk64 == 0) {
        Proc_Break(proc);
        return;
    }

    proc->unk64--;

    return;
}

//! FE8U = 0x08007C4C
void TalkWaitForInput_OnIdle(struct Proc* proc) {
    int frame = (GetGameClock() / 2) & 0xf;

    if (!CheckTalkFlag(TALK_FLAG_7)) {
        PutSprite(2, proc->unk64, proc->unk66, gPressKeyArrowSpriteLut[frame], 4);
    } else {
        PutSprite(0, proc->unk64, proc->unk66, gPressKeyArrowSpriteLut[frame], 0x0000B2BF);
    }

    if (gKeyStatusPtr->newKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08007CD4
void sub_8007CD4(void) {
    return;
}

//! FE8U = 0x08007CD8
void StartTalkWaitForInput(ProcPtr parent, int x, int y) {
    struct Proc* proc = Proc_StartBlocking(gProcScr_TalkWaitForInput, parent);

    proc->unk64 = x;
    proc->unk66 = y;
    proc->unk68 = 0;

    return;
}

//! FE8U = 0x08007D04
void StartTalkWaitForInputUnk(ProcPtr parent, int x, int y, int unk) {
    struct Proc* proc = Proc_StartBlocking(gProcScr_TalkWaitForInput, parent);

    proc->unk64 = x;
    proc->unk66 = y;
    proc->unk68 = unk;

    return;
}

//! FE8U = 0x08007D38
void TalkShiftClearAll_OnInit(struct Proc* proc) {

    TileMap_FillRect(
        gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + 4),
        sTalkState->activeWidth - 2,
        sTalkState->lines * 2,
        0
    );

    TalkBgSync(1);

    proc->unk64 = 0;

    if (sTalkState->lineActive == 0) {
        proc->unk66 = 16;
    } else if (sTalkState->lineActive + 1 >= sTalkState->lines) {
        proc->unk66 = sTalkState->lines * 16;
    } else {
        proc->unk66 = (sTalkState->lineActive + 1) * 16;
    }

    return;
}

//! FE8U = 0x08007DA4
void TalkShiftClearAll_OnIdle(struct Proc* proc) {
    proc->unk64++;

    BG_SetPosition(0, 0, proc->unk64);

    if (proc->unk64 >= proc->unk66) {
        BG_SetPosition(0, 0, 0);
        ClearPutTalkText();

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08007DE8
void StartTalkChoice(const struct ChoiceEntryInfo* choices, struct Text* text, u16 * tm, int defaultChoice, int color, ProcPtr parent) {
    struct TalkChoiceProc* proc;

    int x = Text_GetCursor(text) + 16;

    Text_InsertDrawString(text, x, color, GetStringFromIndex(choices[0].msgid));

    Text_InsertDrawString(text, x + 40, color, GetStringFromIndex(choices[1].msgid));

    PutText(text, tm);

    TalkBgSync(1);

    proc = Proc_StartBlocking(gProcScr_TalkChoice, parent);

    proc->selectedChoice = defaultChoice;

    proc->xDisp = (((tm - gBG0TilemapBuffer) & 0x1f) * 8 - gLCDControlBuffer.bgoffset[0].x) + x;
    proc->yDisp = ((tm - gBG0TilemapBuffer) / 0x20) * 8 - gLCDControlBuffer.bgoffset[0].y;

    proc->choices = choices;

    if (proc->choices[defaultChoice - 1].onSwitchIn) {
        proc->choices[defaultChoice - 1].onSwitchIn();
    }

    return;
}

//! FE8U = 0x08007E9C
void TalkChoice_OnIdle(struct TalkChoiceProc* proc) {

    if (gKeyStatusPtr->newKeys & (B_BUTTON)) {
        PlaySoundEffect(0x6b);

        sTalkChoiceResult = 0;

        Proc_Break(proc);

        return;
    } else if (gKeyStatusPtr->newKeys & (A_BUTTON)) {
        PlaySoundEffect(0x6a);

        sTalkChoiceResult = proc->selectedChoice;

        Proc_Break(proc);

        return;
    }

    if ((gKeyStatusPtr->newKeys & (DPAD_LEFT)) && (proc->selectedChoice == 2)) {
        PlaySoundEffect(0x67);

        proc->selectedChoice = 1;

        if (proc->choices[0].onSwitchIn) {
            proc->choices[0].onSwitchIn();
        }
    }

    if ((gKeyStatusPtr->newKeys & (DPAD_RIGHT)) && (proc->selectedChoice == 1)) {
        PlaySoundEffect(0x67);

        proc->selectedChoice = 2;

        if (proc->choices[1].onSwitchIn) {
            proc->choices[1].onSwitchIn();
        }
    }

    DisplayUiHand(proc->xDisp + (proc->selectedChoice - 1) * 40 - 4, proc->yDisp);

    return;
}

//! FE8U = 0x08007F9C
void TalkShiftClear_OnInit(struct Proc* proc) {

    TileMap_FillRect(
        gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + 4),
        sTalkState->activeWidth - 2,
        sTalkState->lines * 2,
        0
    );

    TalkBgSync(1);

    proc->unk64 = 0;

    return;
}

//! FE8U = 0x08007FDC
void TalkShiftClear_OnIdle(struct Proc* proc) {
    int i;

    proc->unk64++;

    BG_SetPosition(0, 0, proc->unk64);

    if (proc->unk64 >= 16) {
        sTalkState->lineActive--;
        sTalkState->topTextNum++;

        BG_SetPosition(0, 0, 0);

        for (i = 0; i < sTalkState->lines - 1; i++) {
            PutText(
                TALK_TEXT_BY_LINE(i),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + 2 * i)
            );
        }

        TileMap_FillRect(
            gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + (sTalkState->lines - 1) * 2),
            sTalkState->activeWidth - 2,
            2,
            0
        );

        ClearText(TALK_TEXT_BY_LINE(sTalkState->lines - 1));
        Text_SetColor(
            TALK_TEXT_BY_LINE(sTalkState->lines - 1),
            sTalkState->printColor
        );

        TalkBgSync(1);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080080D0
void sub_80080D0(ProcPtr proc) {
    if (CheckTalkFlag(TALK_FLAG_7)) {
        sub_8008F64(0x200, 0x1c, 0, proc);
    } else {
        sub_8008F64(0x200, 0x19, 0x44444444, proc);
    }

    return;
}

//! FE8U = 0x08008108
void sub_8008108(void) {
    sTalkState->lineActive--;

    if (CheckTalkFlag(TALK_FLAG_7)) {
        SpriteText_Clear(sTalkText + 1);
        Text_SetColor(sTalkText + 1, 0);
    } else {
        SpriteText_DrawBackground(sTalkText + 1);
        Text_SetColor(sTalkText + 1, 6);
    }

    Text_SetCursor(sTalkText + 1, 4);

    return;
}

//! FE8U = 0x0800815C
void TalkFlushAllLine(void) {
    int i;

    sTalkState->lineActive = 0;

    for (i = 0; i < 2; i++) {
        SpriteText_Clear(sTalkText + i);
        Text_SetColor(sTalkText + i, 0);
        Text_SetCursor(sTalkText + i, 4);
    }

    return;
}

//! FE8U = 0x08008198
int GetTalkPauseCmdDuration(int cmd) {
    return gTalkPauseDurations[cmd - 4];
}

//! FE8U = 0x080081A8
void ClearTalkBubble(void) {
    sTalkState->speakingFaceSlot = (s8)0xff;

    BG_Fill(gBG1TilemapBuffer, 0);
    TalkBgSync(2);

    ClearPutTalkText();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    return;
}

//! FE8U = 0x080081EC
void ClearPutTalkText(void) {
    int i;

    BG_Fill(gBG0TilemapBuffer, 0);
    TalkBgSync(1);

    sTalkState->lineActive = 0;
    sTalkState->unk82 = 0;
    sTalkState->putLines = 0;
    sTalkState->topTextNum = 0;

    for (i = 0; i < sTalkState->lines; i++) {
        ClearText(sTalkText + i);
        Text_SetColor(sTalkText + i, sTalkState->printColor);
    }

    return;
}

void ClearTalkText(void) {
    int i;

    sTalkState->lineActive = 0;
    sTalkState->unk82 = 0;
    sTalkState->putLines = 0;
    sTalkState->topTextNum = 0;

    for (i = 0; i < sTalkState->lines; i++) {
        ClearText(sTalkText + i);
        Text_SetColor(sTalkText + i, sTalkState->printColor);
    }

    return;
}

//! FE8U = 0x080082A4
void PutTalkBubble(int xAnchor, int yAnchor, int width, int height) {
    int y;
    int kind;

    int xTail = 0;
    int x = 0;

    BG_Fill(gBG1TilemapBuffer, 0);

    if (xAnchor < 16) {
        kind = 0;
    } else {
        kind = 1;
    }

    if ((s8)IsBattleDeamonActive()) {
        kind += 2;
    }

    y = (yAnchor - height) + 1;

    switch (kind) {
        case 0:
            xTail = xAnchor + 3;

            x = xTail - width / 2;

            if (x < 1) {
                x = 1;
            }

            break;

        case 1:
            xTail = xAnchor - 5;

            if ((width + 1) / 2 + xTail >= 30) {
                x = 0x1d - width;

            } else {
                x = xTail - width / 2;
            }

            break;

        case 2:
            x = 9;
            y = 14;
            width = 20;
            xTail = 8;
            yAnchor = 16;

            break;

        case 3:
            x = 1;
            y = 14;
            width = 20;
            xTail = 20;
            yAnchor = 16;

            break;
    }

    sTalkState->xText = x + 1;
    sTalkState->yText = y + 1;

    PutTalkBubbleTm(BG_1, x, y, width, height);

    if (sTalkState->invertedFlags & 2) {
        TalkToggleInvertedPalette(sTalkState->invertedFlags & 1);
        sTalkState->invertedFlags ^= 2;
    }

    if (!(sTalkState->invertedFlags & 1)) {
        PutTalkBubbleTail(BG_1, xTail, yAnchor, kind);
    }

    InitTalkTextWin(x, y, width, height);

    StartOpenTalkBubble();

    TalkBgSync(2);

    return;
}

//! FE8U = 0x080083E0
void StartOpenTalkBubble(void) {
    struct Proc* proc = Proc_Start(gProcScr_TalkBubbleOpen, PROC_TREE_3);
    proc->unk64 = 0;

    return;
}

//! FE8U = 0x080083F8
void TalkBubbleOpen_OnIdle(struct Proc* proc) {
    const void * const imgList[] = {
        Img_TalkBubbleOpening_A,
        Img_TalkBubbleOpening_B,
        Img_TalkBubbleOpening_C,
        Img_TalkBubbleOpening_D,
        Img_TalkBubbleOpening_E,
        Img_TalkBubble,

        NULL,
    };

    if (proc->unk64++ & 1) {
        return;
    }

    Decompress(imgList[proc->unk64 >> 1], (void*)(GetBackgroundTileDataOffset(1) + 0x06000200));

    if (imgList[(proc->unk64 >> 1) + 1] == NULL) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08008464
void InitTalkTextWin(int x, int y, int width, int height) {
    SetWinEnable(1, 0, 0);

    SetWin0Box((x + 1) * 8, (y + 1) * 8, (x + width - 1) * 8, (y + height - 1) * 8);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);

    return;
}

// produces different results from existing TILEMAP_INDEX macro
#define TILEMAP_INDEX_UNK(x, y) ((x) + ((y) << 5))

//! FE8U = 0x080084E0
void PutTalkBubbleTail(int bg, int x, int y, int kind) {

    u16* buf = BG_GetMapBuffer(bg);

    switch (kind) {
        case 0:
            // _0800851C
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 4, 3);
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 4, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 6, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 5, 3) + 0x400;

            break;

        case 1:
            // _08008550
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 4, 3);
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 4, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 5, 3);
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 6, 3);

            break;

        case 2:
            // _08008588
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 8, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 9, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 7, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 7, 3) + 0x400 + 0x800;

            break;

        case 3:
            // _080085BC
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 7, 3);
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 7, 3) + 0x800;
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 8, 3);
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 9, 3);

            break;

        case 4:
            // _080085F4
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 9, 3) + 0x400 + 0x800;
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 8, 3) + 0x400 + 0x800;
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 7, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 7, 3) + 0x400 + 0x800;

            break;

        case 5:
            // _0800862C
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 7, 3);
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 7, 3) + 0x800;
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 9, 3) + 0x800;
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 8, 3) + 0x800;

            break;
    }

    return;
}

//! FE8U = 0x08008668
void PutTalkBubbleTm(int bg, int x, int y, int width, int height) {
    int i;
    int j;

    u16* buf = BG_GetMapBuffer(bg);

    width = width - 1;
    height = height - 1;

    for (i = x; i < x + width; i++) {
        buf[TILEMAP_INDEX_UNK(i, y         )] = TILEREF(0x10 + 1, 3);
        buf[TILEMAP_INDEX_UNK(i, y + height)] = TILEREF(0x10 + 1, 3) + 0x800;
    }

    for (i = y; i < y + height; i++) {
        buf[TILEMAP_INDEX_UNK(x        , i)] = TILEREF(0x10 + 2, 3);
        buf[TILEMAP_INDEX_UNK(x + width, i)] = TILEREF(0x10 + 2, 3) + 0x400;
    }

    for (i = x + 1; i < x + width; i++) {
        for (j = y + 1; j < y + height; j++) {
            buf[TILEMAP_INDEX_UNK(i, j)] = TILEREF(0x10 + 3, 3);
        }
    }

    buf[TILEMAP_INDEX_UNK(x        , y         )] = TILEREF(0x10 + 0, 3);
    buf[TILEMAP_INDEX_UNK(x + width, y         )] = TILEREF(0x10 + 0, 3) + 0x400;
    buf[TILEMAP_INDEX_UNK(x        , y + height)] = TILEREF(0x10 + 0, 3) + 0x800;
    buf[TILEMAP_INDEX_UNK(x + width, y + height)] = TILEREF(0x10 + 0, 3) + 0x400 + 0x800;

    return;
}

//! FE8U = 0x080087A4
void TalkOpen_OnEnd(void) {
    return;
}

//! FE8U = 0x080087A8
void TalkOpen_InitBlend(struct Proc* proc) {

    proc->unk58 = 0;

    if (!CheckTalkFlag(TALK_FLAG_8)) {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);

        SetBlendBackdropB(1);

        gLCDControlBuffer.wincnt.win0_enableBlend = 1;
        gLCDControlBuffer.wincnt.wout_enableBlend = 1;

        SetBlendAlpha(0, 16);
    }

    return;
}

//! FE8U = 0x0800880C
void TalkOpen_PutTalkBubble(struct Proc* proc) {
    PutTalkBubble(proc->unk64, proc->unk66, proc->unk68, proc->unk6A);
    Proc_Break(proc);

    return;
}

//! FE8U = 0x08008840
void TalkOpen_OnIdle(struct Proc* proc) {
    int var;

    proc->unk58++;

    var = Interpolate(INTERPOLATE_RSQUARE, -30, 0, proc->unk58, 12);

    BG_SetPosition(BG_1, 0, var / 2);

    if (!CheckTalkFlag(TALK_FLAG_8)) {
        SetBlendAlpha(var / 2 + 16, 1 - var / 2);
    }

    if (proc->unk58 == 12) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080088A8
void StartTalkOpen(int talkFace, ProcPtr parent) {

    struct Proc* proc = Proc_StartBlocking(gProcScr_TalkOpen, parent);

    proc->unk64 = GetTalkFaceHPos(talkFace);
    proc->unk66 = 8;

    proc->unk68 = sTalkState->activeWidth;
    proc->unk6A = 6;

    if (proc->unk64 < 0) {
        proc->unk64 = 0;
    }
    if (proc->unk64 >= 30) {
        proc->unk64 = 30;
    }

    sTalkState->speakingFaceSlot = talkFace;
    sTalkState->speakingWidth = sTalkState->activeWidth;

    return;
}

//! FE8U = 0x0800890C
s8 TalkHasCorrectBubble(void) {

    if ((sTalkState->speakingFaceSlot == sTalkState->activeFaceSlot) && (sTalkState->speakingWidth == sTalkState->activeWidth)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08008934
int GetTalkFaceHPos(int talkFace) {

    if ((s8)IsBattleDeamonActive()) {
        if (talkFace < 3) {
            return 4;
        } else {
            return 26;
        }
    }

    return gTalkFaceHPosLut[talkFace];
}

//! FE8U = 0x08008960
void SetTalkFaceDisp(int talkFace, int faceDisp) {
    const int lut[] = { 0, FACE_DISP_SMILE };

    int disp;

    if (talkFace == 0xff) {
        return;
    }

    disp = GetFaceDisplayBits(sTalkState->faces[talkFace]);
    disp &= ~(FACE_DISP_SMILE | FACE_DISP_TALK_1 | FACE_DISP_TALK_2);

    SetFaceDisplayBits(sTalkState->faces[talkFace], disp | faceDisp | lut[sTalkState->faceSmileEnabled]);

    return;
}

//! FE8U = 0x080089B8
void SetTalkFaceMouthMove(int talkFace) {
    SetTalkFaceDisp(talkFace, FACE_DISP_TALK_1);
    return;
}

//! FE8U = 0x080089C4
void SetTalkFaceNoMouthMove(int talkFace) {
    SetTalkFaceDisp(talkFace, 0);
    return;
}

//! FE8U = 0x080089D0
s8 IsTalkActive(void) {
    return Proc_Find(gProcScr_Talk) ? 1 : 0;
}

//! FE8U = 0x080089E8
s8 FaceExists(void) {
    return Proc_Find(gProcScr_E_FACE) ? 1 : 0;
}

//! FE8U = 0x08008A00
int GetTalkChoiceResult(void) {
    return sTalkChoiceResult;
}

//! FE8U = 0x08008A0C
int SetTalkChoiceResult(int result) {
    sTalkChoiceResult = result;
    // return; // BUG
}

//! FE8U = 0x08008A18
void SetTalkNumber(int number) {
    sTalkState->userNumber = number;
    return;
}

//! FE8U = 0x08008A24
void SetTalkUnkStr(const char* str) {
    strcpy(sTalkState->userString, str);
    return;
}

void PrintStringToTexts(struct Text** texts, const char* str, u16 * tm, int unk) {
    int uh;

    int line = 0;

    while (1) {
        uh = 0;

        switch (*str) {
            case 0:
                uh += 1;
                break;

            case 1:
                PutText(texts[line], tm + line * 0x40);

                line++;
                str++;

                if (line >= unk) {
                    return;
                }

                break;
        }

        if (uh != 0) {
            break;
        }

        str = Text_DrawCharacter(texts[line], str);
        continue;
    }

    PutText(texts[line], tm + line * 0x40);

    return;
}

//! FE8U = 0x08008AA8
void TalkPutSpriteText_OnIdle(struct Proc* proc) {

    PutSprite(
        3,
        proc->x,
        proc->y,
        gSprite_TalkTextBack,
        OAM2_CHR(proc->unk52) | OAM2_PAL(proc->unk64)
    );

    PutSprite(
        3,
        proc->x,
        proc->y,
        gSprite_TalkTextFront,
        OAM2_CHR(proc->unk52) | OAM2_PAL(sTalkFont.palid)
    );

    return;
}

//! FE8U = 0x08008B24
void ClearPrimaryHBlank(void) {
    SetPrimaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x08008B30
void TalkPutSpriteText_OnEnd(void) {
    CallDelayed(ClearPrimaryHBlank, 1);
    return;
}

//! FE8U = 0x08008B44
int GetStrTalkLen(const char* str, s8 isBubbleOpen) {
    char buf[0x20];
    int chrLen;

    int speakFace = sTalkState->speakingFaceSlot;
    int activeFace = sTalkState->activeFaceSlot;

    int currentLineLen = 0;
    int maxLineLen = 24;

    while (1) {
        switch (*str) {
            case 0x00:
            case 0x15:
                // _08008D88

                if (currentLineLen > maxLineLen) {
                    maxLineLen = currentLineLen;
                }

                currentLineLen = 0;

                goto _08008F06;

            case 0x01:
            case 0x02:
                // _08008D92

                if (currentLineLen > maxLineLen) {
                    maxLineLen = currentLineLen;
                }

                currentLineLen = 0;

                str++;

                break;

            case 0x04:
            case 0x05:
            case 0x06:
            case 0x07:
            case 0x16:
            case 0x17:
            case 0x1C:
            case 0x1D:
                // _08008D9A
                str++;
                break;

            case 0x03:
                // _08008D9E
                currentLineLen += 12;
                str++;
                break;

            case 0x08:
            case 0x09:
            case 0x0A:
            case 0x0B:
            case 0x0C:
            case 0x0D:
            case 0x0E:
            case 0x0F:
                // _08008DA2
                activeFace = *str - 0x08;
                str++;
                break;

            case 0x10:
                // _08008DAA
                while (1) {
                    switch (*str) {
                        case 0x08:
                        case 0x09:
                        case 0x0A:
                        case 0x0B:
                        case 0x0C:
                        case 0x0D:
                        case 0x0E:
                        case 0x0F:
                            activeFace = *str - 0x08;
                            str++;

                            continue;

                        case 0x10:
                            str++;
                            str++;
                            str++;

                            continue;
                    }

                    break;
                }

                break;

            case 0x11:
                // _08008DC8
                if (activeFace == speakFace) {
                    if (currentLineLen > maxLineLen) {
                        maxLineLen = currentLineLen;
                    }

                    currentLineLen = 0;

                    goto _08008F06;
                }

                str++;

                break;

            case 0x12:
            case 0x13:
            case 0x14:
                // _08008DCE
                if (!isBubbleOpen) {
                    if (currentLineLen > maxLineLen) {
                        maxLineLen = currentLineLen;
                    }

                    currentLineLen = 0;

                    goto _08008F06;
                }

                str++;

                break;

            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
                // _08008DD6
                currentLineLen += 0x80;
                str++;
                break;

            case 0x80:
                // _08008DDA
                str++;

                switch (*str) {
                    case 0x00:
                    case 0x01:
                    case 0x02:
                    case 0x03:
                    case 0x04:
                    case 0x07:
                    case 0x08:
                    case 0x09:
                    case 0x16:
                    case 0x17:
                    case 0x18:
                    case 0x19:
                    case 0x1A:
                    case 0x1B:
                    case 0x1C:
                    case 0x1D:
                    case 0x1E:
                    case 0x1F:
                    case 0x21:
                    case 0x24:
                    case 0x25:
                        str++;
                        break;

                    case 0x05:
                        // _08008E8C
                        NumberToStringSJis(sTalkState->userNumber, buf);
                        currentLineLen += GetStrTalkLen(buf, isBubbleOpen);

                        str++;
                        break;

                    case 0x20:
                        // _08008EA8
                        currentLineLen += GetStringTextLen(GetTacticianName());

                        str++;
                        break;

                    case 0x06:
                        // _08008EB2
                        currentLineLen += GetStrTalkLen(sTalkState->userString, isBubbleOpen);

                        str++;
                        break;

                    case 0x0A:
                    case 0x0B:
                    case 0x0C:
                    case 0x0D:
                    case 0x0E:
                    case 0x0F:
                    case 0x10:
                    case 0x11:
                        // _08008ECC
                        activeFace = *str - 0x0A;
                        str++;

                        break;

                    default:
                        // _08008B66
                        break;

                }

                break;

            case 0x81:
                // _08008ED4

                if (str[1] == 0x40) {
                    str += 2;
                    currentLineLen += 6;
                    break;
                }

                // fallthrough

            default:
                if ((activeFace != speakFace) && (activeFace != 0xFF)) {
                    if (!isBubbleOpen) {
                        isBubbleOpen = 1;
                        speakFace = activeFace;
                    } else {
                        if (currentLineLen > maxLineLen) {
                            maxLineLen = currentLineLen;
                        }

                        currentLineLen = 0;

                        goto _08008F06;
                    }
                }

                str = GetCharTextLen(str, &chrLen);

                currentLineLen += chrLen;
        }
    }

_08008F06:
    return maxLineLen;
}

//! FE8U = 0x08008F18
bool GetZero(void) {
    // Maybe "IsTalkDebugActive" in FE6
    return 0;
}

//! FE8U = 0x08008F1C
void sub_8008F1C(void) {
    // Maybe "StartTalkDebug" in FE6
    return;
}

//! FE8U = 0x08008F20
void TalkBgSync(int bg) {
    if (!CheckTalkFlag(TALK_FLAG_SPRITE)) {
        BG_EnableSyncByMask(bg);
    }

    return;
}

//! FE8U = 0x08008F3C
bool sub_8008F3C(void) {
    if (Proc_Find(ProcScr_08591624))
        return true;

#if BUGFIX
    return false;
#endif
}

//! FE8U = 0x08008F54
void sub_8008F54(void)
{
    Proc_EndEach(ProcScr_08591624);
    return;
}

//! FE8U = 0x08008F64
void sub_8008F64(int chr, int b, int c, ProcPtr parent)
{
    struct TalkDebugProc * proc = Proc_Start(ProcScr_08591624, PROC_TREE_VSYNC);

    proc->unk_4c = (0x3FF & chr) * CHR_SIZE + 0x06010000;
    proc->unk_54 = b;
    proc->unk_58 = c;
    Proc_StartBlocking(ProcScr_0859160C, parent);

    return;
}

//! FE8U = 0x08008FAC
void sub_8008FAC(struct TalkDebugProc * proc)
{
    proc->unk_64 = 0;
    return;
}

//! FE8U = 0x08008FB4
void sub_8008FB4(struct TalkDebugProc * proc)
{
    int i;
    int j;

    u32 * vram = (void *)proc->unk_4c;

    for (i = 0; i < proc->unk_54 * 8; i += 8)
    {
        for (j = 0; j <= 0x300; j += 0x100)
        {
            (vram + i + j)[0] = (vram + i + j)[1];
            (vram + i + j)[1] = (vram + i + j)[2];
            (vram + i + j)[2] = (vram + i + j)[3];
            (vram + i + j)[3] = (vram + i + j)[4];
            (vram + i + j)[4] = (vram + i + j)[5];
            (vram + i + j)[5] = (vram + i + j)[6];
            (vram + i + j)[6] = (vram + i + j)[7];

            if (j < 0x300)
            {
                (vram + i + j)[7] = (vram + i + j)[0x100];
            }
            else
            {
                (vram + i + j)[7] = proc->unk_58;
            }
        }
    }

    proc->unk_64++;

    if (proc->unk_64 > 15)
    {
        Proc_Break(proc);
    }

    return;
}

// The functions below seem to be unrelated to the dialog system

//! FE8U = 0x08009038
void nullsub_15(ProcPtr proc, int label)
{
    // "EventGotoLabel" from FE6 (and possibly FE7)
    return;
}

//! FE8U = 0x0800903C
void sub_800903C(struct Proc0859163C * proc)
{
    proc->unk_3c = 0;
    ArchiveCurrentPalettes();
    return;
}

//! FE8U = 0x0800904C
void sub_800904C(struct Proc0859163C * proc)
{
    int r;
    int g;
    int b;

    proc->unk_3c += proc->unk_34;

    if (proc->unk_3c < 0x100)
    {
        r = (((0x100 - proc->unk_3c) * 0x100) + proc->unk_3c * proc->unk_40) / 0x100;
        g = (((0x100 - proc->unk_3c) * 0x100) + proc->unk_3c * proc->unk_48) / 0x100;
        b = (((0x100 - proc->unk_3c) * 0x100) + proc->unk_3c * proc->unk_44) / 0x100;
    }
    else
    {
        r = (proc->unk_40 * (0x200 - proc->unk_3c) + ((proc->unk_3c - 0x100) * 0x100)) / 0x100;
        g = (proc->unk_48 * (0x200 - proc->unk_3c) + ((proc->unk_3c - 0x100) * 0x100)) / 0x100;
        b = (proc->unk_44 * (0x200 - proc->unk_3c) + ((proc->unk_3c - 0x100) * 0x100)) / 0x100;
    }

    WriteFadedPaletteFromArchive(r, g, b, proc->unk_30);

    if (proc->unk_3c == 0x100)
    {
        proc->unk_2c--;

        if (proc->unk_2c < 1)
        {
            proc->unk_3c = 0;
            Proc_Break(proc);
        }
    }
    else if (proc->unk_3c == 0x200)
    {
        proc->unk_3c = 0;
    }

    return;
}

//! FE8U = 0x08009100
void sub_8009100(struct Proc0859163C * proc)
{
    proc->unk_3c += proc->unk_38;

    WriteFadedPaletteFromArchive(
        ((0x100 - proc->unk_3c) * proc->unk_40 + (proc->unk_3c * 0x100)) / 0x100,
        ((0x100 - proc->unk_3c) * proc->unk_48 + (proc->unk_3c * 0x100)) / 0x100,
        ((0x100 - proc->unk_3c) * proc->unk_44 + (proc->unk_3c * 0x100)) / 0x100,
        proc->unk_30
    );

    if (proc->unk_3c == 0x100)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0800915C
void sub_800915C(int a, int b, int c, int d, int e, int f, int g, ProcPtr parent)
{
    struct Proc0859163C * proc = Proc_StartBlocking(ProcScr_0859163C, parent);

    proc->unk_2c = b;
    proc->unk_30 = a;
    proc->unk_34 = c;
    proc->unk_38 = d;
    proc->unk_40 = e;
    proc->unk_48 = f;
    proc->unk_44 = g;

    return;
}
