
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

#include "scene.h"

struct TalkState
{
    /* 00 */ const char* str;
    /* 04 */ const char* strBackup;
    /* 08 */ u8 printColor;
    /* 09 */ u8 lineActive;
    /* 0A */ u8 lines;
    /* 0B */ u8 topTextNum;
    /* 0C */ u8 xText;
    /* 0D */ u8 yText;
    /* 0E */ u8 activeWidth;
    /* 0F */ s8 speakingFaceSlot;
    /* 10 */ u8 speakingWidth;
    /* 11 */ u8 activeFaceSlot;
    /* 12 */ s8 instantScroll;
    /* 13 */ s8 printDelay;
    /* 14 */ s8 printClock;
    /* 15 */ u8 putLines;
    /* 16 */ u8 unk16;
    /* 17 */ u8 unk17;
    /* 18 */ struct FaceProc* faces[8];
    /* 38 */ void(*unk38)(ProcPtr proc);
    /* 3C */ u32 userNumber;
    /* 40 */ char userNumberString[0x20];
    /* 60 */ char userString[0x20];
    /* 80 */ u16 config;
    /* 82 */ u8 unk82;
    /* 83 */ u8 unk83;
};

struct TalkDebugProc {
    PROC_HEADER;

    u8 pad[0x4c-0x29];
    int unk_4c;
    int unk_50;
    int unk_54;
    int unk_58;
    int unk_5c;
    int unk_60;
    s16 unk_64;
};

struct ChoiceEntryInfo
{
    /* 00 */ u16 msgid;
    /* 04 */ void(*onSwitchIn)(void);
};

struct TalkChoiceProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ s16 selectedChoice;
    /* 2C */ s16 xDisp;
    /* 2E */ s16 yDisp;
    /* 30 */ int pad;
    /* 34 */ const struct ChoiceEntryInfo* choices;
};

// various bits of the box opening animation
extern u8 CONST_DATA gUnknown_089E8484[];
extern u8 CONST_DATA gUnknown_089E8434[];
extern u8 CONST_DATA gUnknown_089E83E0[];
extern u8 CONST_DATA gUnknown_089E8384[];
extern u8 CONST_DATA gUnknown_089E82E0[];
extern u8 CONST_DATA gUnknown_089E8238[];

// funcs
void TalkSkipListener_OnIdle(ProcPtr);
void Talk_OnEnd(void);
void Talk_OnInit(void);
void Talk_OnIdle(ProcPtr);
void TalkFaceMove_OnInit(struct Proc*);
void TalkFaceMove_OnIdle(struct Proc*);
void TalkPause_OnIdle(struct Proc*);
void TalkWaitForInput_OnIdle(struct Proc*);
void TalkShiftClearAll_OnInit(struct Proc*);
void TalkShiftClearAll_OnIdle(struct Proc*);
void sub_80B42E8(void);
void sub_80B4308(void);
void TalkChoice_OnIdle(struct TalkChoiceProc*);
void TalkShiftClear_OnInit(struct Proc*);
void TalkShiftClear_OnIdle(struct Proc*);
void sub_80080D0(ProcPtr);
void sub_8008108(void);
void TalkBubbleOpen_OnIdle(struct Proc*);
void TalkPutSpriteText_OnEnd(void);
void TalkPutSpriteText_OnIdle(struct Proc*);
void sub_8008F54(void);
s8 sub_8008F3C(void);
void sub_8008FAC(struct TalkDebugProc*);
void sub_8008FB4(ProcPtr);
void sub_800903C(ProcPtr);
void sub_800904C(ProcPtr);
void sub_8009100(ProcPtr);
void sub_8009250(ProcPtr);
void sub_8009198(ProcPtr);
void sub_8009200(ProcPtr);

// rearrange!!!

int GetTalkFaceHPos(int);
void StartTalkFaceMove(int, int, s8);
void ClearPutTalkText(void);
void sub_8008F64(int, int, int, ProcPtr);
void PutTalkBubbleTm(int, int, int, int, int);
void PutTalkBubbleTail(int, int, int, int);
void InitTalkTextWin(int, int, int, int);
void StartOpenTalkBubble(void);
s8 TalkPrepNextChar(ProcPtr);
s8 TalkSpritePrepNextChar(ProcPtr);
int TalkInterpret(ProcPtr);
void SetTalkFaceLayer(int, int);
s8 IsTalkFaceMoving(void);
void ClearTalkBubble(void);
void StartTalkOpen(int, ProcPtr);
s8 TalkHasCorrectBubble(void);
void SetTalkFaceMouthMove(int);
void SetTalkFaceNoMouthMove(int);
int GetStrTalkLen(const char*, s8);
void TalkBgSync(int);
int GetTalkPauseCmdDuration(int);
void ClearTalkText(void);
void sub_800815C(void);
void ClearTalkBubble(void);
int SetActiveTalkFace(int);
void sub_8007854(ProcPtr);
void MoveTalkFace(int, int);
void StartTalkWaitForInput(ProcPtr parent, int x, int y);
void StartTalkChoice(const struct ChoiceEntryInfo* choices, struct TextHandle* text, u16* tm, int defaultChoice, int color, ProcPtr parent);


#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkState->topTextNum) % sTalkState->lines)

static struct TalkState sTalkStateCore;
struct TalkState* CONST_DATA sTalkState = &sTalkStateCore;
static struct TextHandle sTalkText[3];
static int sTalkChoiceResult;
static struct Font sTalkFont;

struct ProcCmd CONST_DATA gProcScr_TalkSkipListener[] =
{
    PROC_MARK(PROC_MARK_5),
    PROC_REPEAT(TalkSkipListener_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_Talk[] =
{
    PROC_MARK(PROC_MARK_5),
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

struct FaceVramEntry CONST_DATA gUnknown_08591390[4] =
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
    PROC_MARK(PROC_MARK_5),
    PROC_SLEEP(1),

    PROC_REPEAT(TalkPause_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_TalkWaitForInput[] =
{
    PROC_MARK(PROC_MARK_5),
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
    PROC_MARK(PROC_MARK_5),

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
    { 0x845, sub_80B42E8 }, // Buy
    { 0x846, sub_80B4308 }, // Sell
};

struct ProcCmd CONST_DATA gProcScr_TalkChoice[] =
{
    PROC_SLEEP(8),
    PROC_REPEAT(TalkChoice_OnIdle),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_TalkShiftClear[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_CALL(TalkShiftClear_OnInit),
    PROC_REPEAT(TalkShiftClear_OnIdle),

    PROC_SLEEP(1),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_085914F0[] =
{
    PROC_MARK(PROC_MARK_5),

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

void TalkOpen_OnEnd(void);
void TalkOpen_InitBlend(struct Proc*);
void TalkOpen_PutTalkBubble(struct Proc*);
void TalkOpen_OnIdle(struct Proc*);

struct ProcCmd CONST_DATA gProcScr_TalkOpen[] =
{
    PROC_MARK(PROC_MARK_5),
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

struct ProcCmd CONST_DATA gUnknown_0859160C[] =
{
    PROC_SET_END_CB(sub_8008F54),
    PROC_WHILE(sub_8008F3C),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_08591624[] =
{
    PROC_CALL(sub_8008FAC),
    PROC_REPEAT(sub_8008FB4),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_0859163C[] =
{
    PROC_SLEEP(0),

    PROC_CALL(sub_800903C),
    PROC_REPEAT(sub_800904C),
    PROC_REPEAT(sub_8009100),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnused_0859166C[] =
{
    PROC_SLEEP(0),

    PROC_SET_END_CB(sub_8009250),

    PROC_CALL(sub_8009198),
    PROC_REPEAT(sub_8009200),

    PROC_END,
};

extern u16 gUnknown_089E84D4[];

extern u16 gUnknown_080D77FC[];
extern u16 gUnknown_0859F000[];
extern u16 gUnknown_0859EFE0[];

//! FE8U = 0x08006738
void sub_8006738(u16* a, u16 b, s8 c) {
    int i;
    int j;
    const u16* src = gUnknown_080D77FC;
    u16* dst = a;

    if (c == 0) {
        for (i = 0; i < 10; i++) {
            const u16* nextSrc = src + 12;

            for (j = 0; j < 12; j++) {
                if (src[j] == 0xFFFF) {
                    dst[j] = 0;
                } else {
                    dst[j] = src[j] + b;
                }

            }

            src = nextSrc;
            dst += 0x20;
        }
    } else {
        for (i = 0; i < 10; i++) {
            for (j = 0; j < 12; j++) {
                if (src[11 - j] == 0xFFFF) {
                    dst[j] = 0;
                } else {
                    dst[j] = src[11 - j] + b + 0x400;
                }
            }

            src += 12;
            dst += 0x20;
        }
    }
}

//! FE8U = 0x080067E8
void sub_80067E8(void) {
    int i;

    for (i = 0; i < 8; i++) {
        sTalkState->faces[i] = NULL;
    }

    return;
}

//! FE8U = 0x0800680C
void InitTalk(int chr, int lines, s8 unpackBubble) {
    int i;

    Font_InitForUI(&sTalkFont, (void*)(0x6000000 + GetBackgroundTileDataOffset(0) + (0x3FF & chr) * 0x20), chr, 2);
    SetInitTalkTextFont();

    sTalkState->lines = lines;

    for (i = 0; i < lines; i++) {
        Text_Init(sTalkText + i, 0x1e);
        Text_SetColorId(sTalkText + i, 1);
    }

    if (unpackBubble != 0) {
        Decompress(gUnknown_089E8238, (void*)(GetBackgroundTileDataOffset(1) + 0x06000200));
        CopyToPaletteBuffer(gUnknown_089E84D4, 0x60, 0x20);
    }

    sub_80067E8();

    return;
}

//! FE8U = 0x080068AC
void InitSpriteTalk(int chr, int lines, int palId) {
    int i;

    InitSomeOtherGraphicsRelatedStruct(&sTalkFont, (void*)(0x06010000 + (0x3FF & chr) * 0x20), palId);

    SetFont(&sTalkFont);
    SetFontGlyphSet(1);

    CopyToPaletteBuffer(gUnknown_0859EF20, (palId + 0x10) * 0x20, 0x20);

    gPaletteBuffer[((palId + 0x10) * 0x10 + 4)] = 0x00007247;
    gPaletteBuffer[((palId + 0x10) * 0x10 + 0xe)] = 0x000031AE;
    gPaletteBuffer[((palId + 0x10) * 0x10 + 0xf)] = 0x00007FFF;

    sTalkState->lines = lines;

    for (i = 0; i < lines; i++) {
        Text_Init3(sTalkText + i);

        sub_800465C(sTalkText + i);
        Text_SetColorId(sTalkText + i, 0);
        Text_SetXCursor(sTalkText + i, 4);
    }

    return;
}

//! FE8U = 0x08006964
void sub_8006964(void) {
    CopyToPaletteBuffer(Pal_UIFont, 0x40, 0x20);
    return;
}

//! FE8U = 0x08006978
void SetInitTalkTextFont(void) {
    SetFont(&sTalkFont);
    Font_LoadForDialogue();

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
    sTalkState->unk16 = 1;
    sTalkState->unk17 = 0;

    sTalkState->config = 0;

    sTalkState->unk38 = 0;
    sTalkState->unk83 = 0;

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
        Text_SetColorId(sTalkText + i, sTalkState->printColor);
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
        sub_800D3E4();
        SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

        Proc_End(proc);
        EndTalk();

        BG_Fill(gBG0TilemapBuffer, 0);
        BG_Fill(gBG1TilemapBuffer, 0);
        BG_EnableSyncByMask(3);

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

        BG_SetPosition(0, 0, 0);
        BG_SetPosition(1, 0, 0);
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

                sTalkState->str = Text_AppendChar(TALK_TEXT_BY_LINE(sTalkState->lineActive), sTalkState->str);

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
        Text_Draw(
            TALK_TEXT_BY_LINE(sTalkState->lineActive),
            gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2)
        );

        TalkBgSync(1);

        sTalkState->putLines = 1;
    }

    if (sTalkState->unk16 != 0) {
        SetTalkFaceMouthMove(sTalkState->activeFaceSlot);
    }

    return 0;
}

//! FE8U = 0x08006E8C
s8 TalkSpritePrepNextChar(ProcPtr proc) {

    if (sTalkState->lineActive >= sTalkState->lines) {
        sTalkState->instantScroll = 0;
        Proc_StartBlocking(gProcScr_085914F0, proc);
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
            Text_SetColorId(TALK_TEXT_BY_LINE(i), 4);
        }

        sTalkState->printColor = 4;
    } else {

        for (i = 0; i < sTalkState->lines; i++) {
            Text_SetColorId(TALK_TEXT_BY_LINE(i), 1);
        }

        sTalkState->printColor = 1;
    }

    return;
}

//! FE8U = 0x08006F8C
void sub_8006F8C(int flag) {
    if (flag != 0) {
        CopyToPaletteBuffer(gUnknown_0859F000, 0x60, 0x20);
        CopyToPaletteBuffer(gUnknown_0859EFE0, 0x40, 0x20);
    } else {
        CopyToPaletteBuffer(gUnknown_089E84D4, 0x60, 0x20);
        CopyToPaletteBuffer(Pal_UIFont, 0x40, 0x20);
    }
    return;
}

//! FE8U = 0x08006FD0
int TalkInterpret(ProcPtr proc) {
    struct Proc* unkProc;
    int i;

    while (1) {
        switch (*sTalkState->str) {
            case 0x12:
            case 0x13:
            case 0x14:
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

                Text_Advance(TALK_TEXT_BY_LINE(sTalkState->lineActive), 6);

                if (sTalkState->instantScroll || sTalkState->printDelay <= 0) {
                    return 2;
                }

                unkProc = Proc_StartBlocking(gProcScr_TalkPause, proc);
                unkProc->unk64 = GetTalkPauseCmdDuration(4);
                return 3;
            }

            return 1;

        case 0x00: // [X]
            // _08007298
            if (sTalkState->strBackup == 0) {
                return 0;
            }

            sTalkState->str = sTalkState->strBackup;
            sTalkState->str += 2;
            sTalkState->strBackup = NULL;

            return TalkInterpret(proc);

        case 0x01: // [NL]
            // _080072AE
            if (sTalkState->putLines == 1 || sTalkState->lineActive == 1) {
                sTalkState->lineActive++;
            }

            sTalkState->putLines = 0;
            sTalkState->str++;
            return 2;

        case 0x02: // [2NL]
            // _080072CC
            if (CheckTalkFlag(TALK_FLAG_7)) {
                sub_800815C();
                sTalkState->str++;
            } else if (!CheckTalkFlag(TALK_FLAG_INSTANTSHIFT)) {
                Proc_StartBlocking(gProcScr_TalkShiftClearAll, proc);
            } else {
                ClearTalkText();
            }

            sTalkState->str++;
            return 3;

        case 0x03: // [A]
            // _08007314
            StartTalkWaitForInput(
                proc,
                sTalkState->xText * 8 + Text_GetXCursor(TALK_TEXT_BY_LINE(sTalkState->lineActive)) + 4,
                sTalkState->yText * 8 + sTalkState->lineActive * 16 + 8
            );

            sTalkState->str++;

            return 3;

        case 0x04: // [....]
        case 0x05: // [.....]
        case 0x06: // [......]
        case 0x07: // [.......]
            // _08007350
            if (sTalkState->instantScroll) {
                sTalkState->str++;
                return 2;
            }

            unkProc = Proc_StartBlocking(gProcScr_TalkPause, proc);
            unkProc->unk64 = GetTalkPauseCmdDuration(*sTalkState->str);

            sTalkState->str++;
            return 3;

        case 0x15: // [CloseSpeechSlow]
            // _08007384
            ClearTalkBubble();
            sTalkState->str++;
            return 3;

        case 0x16: // [ToggleMouthMove]
            // _08007394
            sTalkState->unk16 = 1 - sTalkState->unk16;
            sTalkState->str++;
            return 3;

        case 0x17: // [ToggleSmile]
            // _080073A0
            sTalkState->unk17 = 1 - sTalkState->unk17;
            sTalkState->str++;
            return 3;

        case 0x10: // [LoadFace]
            // _080073AC
            while (1) {
                switch (*sTalkState->str) {
                    case 0x08:
                    case 0x09:
                    case 0x0A:
                    case 0x0B:
                    case 0x0C:
                    case 0x0D:
                    case 0x0E:
                    case 0x0F:
                        SetActiveTalkFace(*sTalkState->str - 8);
                        sTalkState->str++;
                        continue;

                    case 0x10:
                        sTalkState->str++;

                        sub_8007854(proc);

                        sTalkState->str++;
                        sTalkState->str++;
                        continue;
                }

                break;
            }

            return 3;

        case 0x11: // [ClearFace]
            // _080073EC
            if (TalkHasCorrectBubble()) {
                ClearTalkBubble();
            }

            StartFaceFadeOut(sTalkState->faces[sTalkState->activeFaceSlot]);
            sTalkState->faces[sTalkState->activeFaceSlot] = 0;

            sTalkState->str++;

            NewBlockingTimer(proc, 16);

            return 3;

        case 0x1C: // [SendToBack]
            // _08007430
            SetTalkFlag(TALK_FLAG_4);
            sTalkState->str++;
            return 3;

        case 0x1D: // [FastPrint]
            // _08007440
            ClearTalkFlag(TALK_FLAG_4);
            sTalkState->str++;
            return 3;

        case 0x08: // [OpenFarLeft]
        case 0x09: // [OpenMidLeft]
        case 0x0A: // [OpenLeft]
        case 0x0B: // [OpenRight]
        case 0x0C: // [OpenMidRight]
        case 0x0D: // [OpenFarRight]
        case 0x0E: // [OpenFarFarLeft]
        case 0x0F: // [OpenFarFarRight]
            // _08007450
            SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

            SetActiveTalkFace(*sTalkState->str - 8);
            sTalkState->str++;
            return 3;

        case 0x18: // [Yes]
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

        case 0x19: // [No]
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

        case 0x1A: // [Buy/Sell]
            // _080074F8
            StartTalkChoice(
                gBuySellTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                1,
                sTalkState->printColor,
                proc
            );
            asm("");

            sTalkState->str++;
            return 3;

        case 0x1B: // [ShopContinue]
            // _08007544
            StartTalkChoice(
                gBuySellTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                2,
                sTalkState->printColor,
                proc
            );
            asm("");

            sTalkState->str++;
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
                        Text_SetColorId(sTalkText + i, sTalkState->printColor);
                    }

                    sTalkState->str++;
                    return 3;
                case 0x25: // [ToggleColorInvert]
                    // _080076AC
                    sTalkState->unk83 = 3 - (sTalkState->unk83 & 1);
                    sTalkState->str++;
                    return 3;

                case 0x04: // [Events]
                    // _080076BE
                    LockTalk(proc);
                    sTalkState->str++;
                    return 3;

                case 0x05: // [G]
                    // _080076D0
                    String_FromNumber(sTalkState->userNumber, sTalkState->userNumberString);

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
void sub_8007844(void) {
    SetupFaceGfxData(gUnknown_08591390);
    return;
}

//! FE8U = 0x08007854
void sub_8007854(ProcPtr proc) {
    int faceDisp = 0;
    int faceId;

    if (sTalkState->activeFaceSlot == 0xFF) {
        SetActiveTalkFace(1);
    }

    if ((s8)IsBattleDeamonActive()) {
        sub_8007844();
    } else {
        faceDisp |= 2;
    }

    if (GetTalkFaceHPos(sTalkState->activeFaceSlot) <= 14) {
        faceDisp |= 1;
    }

    faceId = sTalkState->str[0];
    faceId = (sTalkState->str[1] * 0x100) + faceId;

    if (faceId == 0xFFFF) {
        faceId = GetUnitPortraitId(gActiveUnit);
    } else {
        faceId = faceId - 0x100;
    }

    if (sTalkState->faces[sTalkState->activeFaceSlot] != 0) {
        sub_80066E0(sTalkState->faces[sTalkState->activeFaceSlot], faceId);
        return;
    }

    sTalkState->faces[sTalkState->activeFaceSlot] = StartFaceAuto(faceId, GetTalkFaceHPos(sTalkState->activeFaceSlot) * 8, 0x50, faceDisp);

    StartFaceFadeIn(sTalkState->faces[sTalkState->activeFaceSlot]);

    SetTalkFaceLayer(sTalkState->activeFaceSlot, CheckTalkFlag(TALK_FLAG_4));
    NewBlockingTimer(proc, 8);

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
        if (gFaces[i] == 0) {
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
            4,
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
void StartTalkChoice(const struct ChoiceEntryInfo* choices, struct TextHandle* text, u16* tm, int defaultChoice, int color, ProcPtr parent) {
    struct TalkChoiceProc* proc;

    int x = Text_GetXCursor(text) + 16;

    Text_InsertString(text, x, color, GetStringFromIndex(choices[0].msgid));

    Text_InsertString(text, x + 40, color, GetStringFromIndex(choices[1].msgid));

    Text_Draw(text, tm);

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
            Text_Draw(
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

        Text_Clear(TALK_TEXT_BY_LINE(sTalkState->lines - 1));
        Text_SetColorId(
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
        sub_800465C(sTalkText + 1);
        Text_SetColorId(sTalkText + 1, 0);
    } else {
        sub_80045FC(sTalkText + 1);
        Text_SetColorId(sTalkText + 1, 6);
    }

    Text_SetXCursor(sTalkText + 1, 4);

    return;
}

//! FE8U = 0x0800815C
void sub_800815C(void) {
    int i;

    sTalkState->lineActive = 0;

    for (i = 0; i < 2; i++) {
        sub_800465C(sTalkText + i);
        Text_SetColorId(sTalkText + i, 0);
        Text_SetXCursor(sTalkText + i, 4);
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
        Text_Clear(sTalkText + i);
        Text_SetColorId(sTalkText + i, sTalkState->printColor);
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
        Text_Clear(sTalkText + i);
        Text_SetColorId(sTalkText + i, sTalkState->printColor);
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

    PutTalkBubbleTm(1, x, y, width, height);

    if (sTalkState->unk83 & 2) {
        sub_8006F8C(sTalkState->unk83 & 1);
        sTalkState->unk83 ^= 2;
    }

    if (!(sTalkState->unk83 & 1)) {
        PutTalkBubbleTail(1, xTail, yAnchor, kind);
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
    const void* const gUnknown_080D78EC[] = {
        gUnknown_089E8484,
        gUnknown_089E8434,
        gUnknown_089E83E0,
        gUnknown_089E8384,
        gUnknown_089E82E0,
        gUnknown_089E8238,

        NULL,
    };

    if (proc->unk64++ & 1) {
        return;
    }

    Decompress(gUnknown_080D78EC[proc->unk64 >> 1], (void*)(GetBackgroundTileDataOffset(1) + 0x06000200));

    if (gUnknown_080D78EC[(proc->unk64 >> 1) + 1] == 0) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08008464
void InitTalkTextWin(int x, int y, int width, int height) {
    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = (x + 1) * 8;
    gLCDControlBuffer.win0_top = (y + 1) * 8;
    gLCDControlBuffer.win0_right = (x + width - 1) * 8;
    gLCDControlBuffer.win0_bottom = (y + height - 1) * 8;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

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

        sub_8001F64(1);

        gLCDControlBuffer.wincnt.win0_enableBlend = 1;
        gLCDControlBuffer.wincnt.wout_enableBlend = 1;

        SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
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

    var = Interpolate(4, -30, 0, proc->unk58, 12);

    BG_SetPosition(1, 0, var / 2);

    if (!CheckTalkFlag(TALK_FLAG_8)) {
        SetSpecialColorEffectsParameters(1, var / 2 + 0x10, 1 - var / 2, 0);
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

    const int gUnknown_080D7908[] = { 0, 8 };
    int disp;

    if (talkFace == 0xff) {
        return;
    }

    disp = GetFaceDisplayBits(sTalkState->faces[talkFace]);
    disp &= 0xffffffc7;

    SetFaceDisplayBits(sTalkState->faces[talkFace], disp | faceDisp | gUnknown_080D7908[sTalkState->unk17]);

    return;
}

//! FE8U = 0x080089B8
void SetTalkFaceMouthMove(int talkFace) {
    SetTalkFaceDisp(talkFace, 0x10);
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
    int result2 = result;
    ++result; --result;
    sTalkChoiceResult = result2;
    return result;
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

void PrintStringToTexts(struct TextHandle** texts, const char* str, u16* tm, int unk) {
    int uh;

    int line = 0;

    while (1) {
        uh = 0;

        switch (*str) {
            case 0:
                uh += 1;
                break;

            case 1:
                Text_Draw(texts[line], tm + line * 0x40);

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

        str = Text_AppendChar(texts[line], str);
        continue;
    }

    Text_Draw(texts[line], tm + line * 0x40);

    return;
}

//! FE8U = 0x08008AA8
void TalkPutSpriteText_OnIdle(struct Proc* proc) {

    PutSprite(
        3,
        proc->x,
        proc->y,
        gSprite_TalkTextBack,
        (0x3FF & proc->unk52) | ((proc->unk64 & 0xf) << 0xc)
    );

    PutSprite(
        3,
        proc->x,
        proc->y,
        gSprite_TalkTextFront,
        (0x3FF & proc->unk52) | ((sTalkFont.paletteNum & 0xf) << 0xc)
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
    SetupFutureCall2(ClearPrimaryHBlank, 1);
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
                        sub_8014270(sTalkState->userNumber, buf);
                        currentLineLen += GetStrTalkLen(buf, isBubbleOpen);

                        str++;
                        break;

                    case 0x20:
                        // _08008EA8
                        currentLineLen += GetStringTextWidth(GetTacticianName());

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

                str = GetCharTextWidth(str, &chrLen);

                currentLineLen += chrLen;
        }
    }

_08008F06:
    return maxLineLen;
}

//! FE8U = 0x08008F18
bool8 GetZero(void) {
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
s8 sub_8008F3C(void) {
    if (Proc_Find(gUnknown_08591624)) return 1;
    // TODO: FIXME: no return value when the proc is NULL
}

//! FE8U = 0x08008F54
void sub_8008F54(void) {
    Proc_EndEach(gUnknown_08591624);
    return;
}

//! FE8U = 0x08008F64
void sub_8008F64(int chr, int b, int c, ProcPtr parent) {
    struct TalkDebugProc* proc = Proc_Start(gUnknown_08591624, 0);

    proc->unk_4c = (0x3FF & chr) * 0x20 + 0x06010000;
    proc->unk_54 = b;
    proc->unk_58 = c;
    Proc_StartBlocking(gUnknown_0859160C, parent);

    return;
}

//! FE8U = 0x08008FAC
void sub_8008FAC(struct TalkDebugProc* proc) {
    proc->unk_64 = 0;
    return;
}
