
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

struct SceneState
{
    /* 00 */ const char* nextChar;
    /* 04 */ const char* unk04;
    /* 08 */ u8 defaultColor;
    /* 09 */ u8 unkLine09;
    /* 0A */ u8 unkLine0A;
    /* 0B */ u8 unkLine0B;
    /* 0C */ u8 unk0C;
    /* 0D */ u8 unk0D;
    /* 0E */ u8 unkWidth0E;
    /* 0F */ s8 speakingFaceSlot;
    /* 10 */ u8 unkFaceSlot10;
    /* 11 */ u8 selectedFaceSlot;
    /* 12 */ s8 instantScroll;
    /* 13 */ s8 charDisplayDelay;
    /* 14 */ s8 charDisplayClock;
    /* 15 */ u8 unk15;
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

struct UnkDialogueProc {
    /* 00 */ PROC_HEADER;

    u8 _pad[0x58-0x29];
    int unk_58;
    int unk_5c;
    u8 _pad2[0x64-0x60];
    s16 unk_64;
    s16 unk_66;
    s16 unk_68;
    s16 unk_6a;
};

struct BlockingTimerProc {
    PROC_HEADER;

    u8 pad[0x64-0x29];
    s16 unk_64;
    s16 unk_66;
    s16 unk_68;
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
void sub_8006B4C(ProcPtr);
void sub_8007C0C(void);
void sub_8006C00(void);
void sub_8006C34(ProcPtr);
void sub_8007AB0(struct UnkDialogueProc*);
void sub_8007B0C(struct UnkDialogueProc*);
void _Loop6CBlockingTimer(struct BlockingTimerProc*);
void sub_8007C4C(struct BlockingTimerProc*);
void sub_8007D38(struct Proc*);
void sub_8007DA4(struct Proc*);
void sub_80B42E8(void);
void sub_80B4308(void);
void sub_8007E9C(struct TalkChoiceProc*);
void sub_8007F9C(struct Proc*);
void sub_8007FDC(struct Proc*);
void sub_80080D0(ProcPtr);
void sub_8008108(void);
void sub_80083F8(struct Proc*);
void sub_8008B30(void);
void sub_8008AA8(struct Proc*);
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

extern int gUnknown_030000E8;

int sub_8008934(int);
void sub_8007A58(int, int, s8);

void sub_80081EC(void);


void sub_8008F64(int, int, int, ProcPtr);

void sub_8008668(int, int, int, int, int);
void sub_80084E0(int, int, int, int);
void sub_8008464(int, int, int, int);
void sub_80083E0(void);


s8 sub_8006DA0(ProcPtr);
s8 sub_8006E8C(ProcPtr);
int sub_8006FD0(ProcPtr);
void sub_800798C(int, int);
s8 sub_8007A3C(void);
void sub_80081A8(void);
void sub_80088A8(int, ProcPtr);
s8 sub_800890C(void);
void sub_80089B8(int);
void sub_80089C4(int);
int sub_8008B44(const char*, s8);
void sub_8008F20(int);

int sub_8008198(int);
void sub_8008250(void);
void sub_800815C(void);
void sub_80081A8(void);
int sub_8007838(int);
void sub_8007854(ProcPtr);

void NewBlockingTimer(ProcPtr p, u32 maybeTime);
void sub_80079E4(int, int);
void sub_8007CD8(ProcPtr parent, int x, int y);
void sub_8007DE8(const struct ChoiceEntryInfo* choices, struct TextHandle* text, u16* tm, int defaultChoice, int color, ProcPtr parent);





#define TALK_TEXT_BY_LINE(line) (gUnknown_030000D0 + ((line) + gUnknown_0859133C->unkLine0B) % gUnknown_0859133C->unkLine0A)

static struct SceneState sSceneStateCore;
struct SceneState* CONST_DATA gUnknown_0859133C = &sSceneStateCore;

struct ProcCmd CONST_DATA gUnknown_08591340[] =
{
    PROC_MARK(PROC_MARK_5),
    PROC_REPEAT(sub_8006B4C),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_08591358[] =
{
    PROC_MARK(PROC_MARK_5),
    PROC_SET_END_CB(sub_8007C0C),

    PROC_SLEEP(1),

    PROC_CALL(sub_8006C00),
    PROC_REPEAT(sub_8006C34),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_08591388[] =
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

struct ProcCmd CONST_DATA gUnknown_085913B0[] =
{
    PROC_SLEEP(1),

    PROC_CALL(sub_8007AB0),
    PROC_REPEAT(sub_8007B0C),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_085913D0[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_SLEEP(1),
    PROC_REPEAT(_Loop6CBlockingTimer),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_085913F0[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_SLEEP(8),
    PROC_REPEAT(sub_8007C4C),
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

const u16* CONST_DATA gUnknown_08591430[] =
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

struct ProcCmd CONST_DATA gUnknown_08591470[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_CALL(sub_8007D38),
    PROC_REPEAT(sub_8007DA4),

    PROC_END,
};

struct ChoiceEntryInfo CONST_DATA gUnknown_08591490[2] =
{
    { 0x843, NULL }, // Yes
    { 0x844, NULL }, // No
};

struct ChoiceEntryInfo CONST_DATA gUnknown_085914A0[2] =
{
    { 0x845, sub_80B42E8 }, // Buy
    { 0x846, sub_80B4308 }, // Sell
};

struct ProcCmd CONST_DATA gUnknown_085914B0[] =
{
    PROC_SLEEP(8),
    PROC_REPEAT(sub_8007E9C),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_085914C8[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_CALL(sub_8007F9C),
    PROC_REPEAT(sub_8007FDC),

    PROC_SLEEP(1),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_085914F0[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_CALL(sub_80080D0),
    PROC_SLEEP(0),
    PROC_CALL(sub_8008108),

    PROC_SLEEP(1),

    PROC_END,
};

int CONST_DATA gUnknown_08591520[4] = { 8, 16, 32, 64 };

struct ProcCmd CONST_DATA gUnknown_08591530[] =
{
    PROC_REPEAT(sub_80083F8),
    PROC_END,
};

void sub_80087A4(void);
void sub_80087A8(struct Proc*);
void sub_800880C(struct Proc*);
void sub_8008840(struct Proc*);

struct ProcCmd CONST_DATA gUnknown_08591540[] =
{
    PROC_MARK(PROC_MARK_5),
    PROC_SET_END_CB(sub_80087A4),

    PROC_CALL(sub_80087A8),
    PROC_REPEAT(sub_800880C),
    PROC_REPEAT(sub_8008840),

    PROC_END,
};

int CONST_DATA gUnknown_08591570[8] = { 3, 6, 9, 21, 24, 27, -8, 38 };

u16 CONST_DATA gUnknown_08591590[] =
{
    4,
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8),       OAM2_CHR(0x21),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8 + 64),  OAM2_CHR(0x29),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8 + 128), OAM2_CHR(0x31),
    OAM0_SHAPE_32x32 + OAM0_Y(8), OAM1_SIZE_32x32 + OAM0_Y(8 + 192), OAM2_CHR(0x39),
};

u16 CONST_DATA gUnknown_085915AA[] =
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

struct ProcCmd CONST_DATA gUnusued_085915F4[] =
{
    PROC_SET_END_CB(sub_8008B30),
    PROC_REPEAT(sub_8008AA8),

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

extern struct TextHandle gUnknown_030000D0[];
extern struct Font gUnknown_030000F0;

extern u16 gUnknown_089E84D4[];

extern u16 gUnknown_080D77FC[];
extern u16 gUnknown_0859F000[];
extern u16 gUnknown_0859EFE0[];

#if NONMATCHING

//! FE8U = 0x08006738
void sub_8006738(u16* a, u16 b, s8 c) {
    int i;
    int j;
    u16* src = gUnknown_080D77FC;
    u16* dst = a;


    if (c == 0) {
        for (i = 0; i < 10;) {
            for (j = 0; j < 12; j++) {

                if (src[j] == 0xFFFF) {
                    dst[j] = 0;
                } else {
                    dst[j] = src[j] + b;
                }

            }

            src += 12;
            dst += 0x20;

            i++;
        }
    } else {
        for (i = 0; i < 10;) {
            for (j = 0; j < 12; j++) {
                if (src[11 - j] == 0xFFFF) {
                    dst[j] = 0;
                } else {
                    dst[j] = src[11 - j] + b + 0x400;
                }
            }


            src += 12;
            dst += 0x20;

            i++;
        }
    }
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_8006738(u16* a, u16 b, s8 c) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        lsls r1, r1, #0x10\n\
        lsrs r7, r1, #0x10\n\
        ldr r3, _08006770  @ gUnknown_080D77FC\n\
        lsls r2, r2, #0x18\n\
        cmp r2, #0\n\
        bne _08006792\n\
        movs r2, #0\n\
        ldr r1, _08006774  @ 0x0000FFFF\n\
        mov r8, r1\n\
        movs r1, #0\n\
        mov ip, r1\n\
    _08006756:\n\
        adds r6, r3, #0\n\
        adds r6, #0x18\n\
        adds r5, r0, #0\n\
        adds r5, #0x40\n\
        adds r4, r2, #1\n\
        adds r2, r0, #0\n\
        movs r1, #0xb\n\
    _08006764:\n\
        ldrh r0, [r3]\n\
        cmp r0, r8\n\
        bne _08006778\n\
        mov r0, ip\n\
        b _0800677A\n\
        .align 2, 0\n\
    _08006770: .4byte gUnknown_080D77FC\n\
    _08006774: .4byte 0x0000FFFF\n\
    _08006778:\n\
        adds r0, r7, r0\n\
    _0800677A:\n\
        strh r0, [r2]\n\
        adds r2, #2\n\
        adds r3, #2\n\
        subs r1, #1\n\
        cmp r1, #0\n\
        bge _08006764\n\
        adds r3, r6, #0\n\
        adds r0, r5, #0\n\
        adds r2, r4, #0\n\
        cmp r2, #9\n\
        ble _08006756\n\
        b _080067DA\n\
    _08006792:\n\
        movs r2, #0\n\
        ldr r1, _080067BC  @ 0x0000FFFF\n\
        mov r9, r1\n\
        movs r1, #0\n\
        mov ip, r1\n\
        movs r1, #0x80\n\
        lsls r1, r1, #3\n\
        mov r8, r1\n\
    _080067A2:\n\
        adds r6, r3, #0\n\
        adds r6, #0x18\n\
        adds r5, r0, #0\n\
        adds r5, #0x40\n\
        adds r4, r2, #1\n\
        adds r2, r0, #0\n\
        adds r3, #0x16\n\
        movs r1, #0xb\n\
    _080067B2:\n\
        ldrh r0, [r3]\n\
        cmp r0, r9\n\
        bne _080067C0\n\
        mov r0, ip\n\
        b _080067C4\n\
        .align 2, 0\n\
    _080067BC: .4byte 0x0000FFFF\n\
    _080067C0:\n\
        adds r0, r7, r0\n\
        add r0, r8\n\
    _080067C4:\n\
        strh r0, [r2]\n\
        adds r2, #2\n\
        subs r3, #2\n\
        subs r1, #1\n\
        cmp r1, #0\n\
        bge _080067B2\n\
        adds r3, r6, #0\n\
        adds r0, r5, #0\n\
        adds r2, r4, #0\n\
        cmp r2, #9\n\
        ble _080067A2\n\
    _080067DA:\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

//! FE8U = 0x080067E8
void sub_80067E8(void) {
    int i;

    for (i = 0; i < 8; i++) {
        gUnknown_0859133C->faces[i] = NULL;
    }

    return;
}

//! FE8U = 0x0800680C
void sub_800680C(int chr, int lines, s8 unpackBubble) {
    int i;

    Font_InitForUI(&gUnknown_030000F0, (void*)(0x6000000 + GetBackgroundTileDataOffset(0) + (0x3FF & chr) * 0x20), chr, 2);
    sub_8006978();

    gUnknown_0859133C->unkLine0A = lines;

    for (i = 0; i < lines; i++) {
        Text_Init(gUnknown_030000D0 + i, 0x1e);
        Text_SetColorId(gUnknown_030000D0 + i, 1);
    }

    if (unpackBubble != 0) {
        CopyDataWithPossibleUncomp(gUnknown_089E8238, (void*)(GetBackgroundTileDataOffset(1) + 0x06000200));
        CopyToPaletteBuffer(gUnknown_089E84D4, 0x60, 0x20);
    }

    sub_80067E8();

    return;
}

//! FE8U = 0x080068AC
void sub_80068AC(int chr, int lines, int palId) {
    int i;

    InitSomeOtherGraphicsRelatedStruct(&gUnknown_030000F0, (void*)(0x06010000 + (0x3FF & chr) * 0x20), palId);

    SetFont(&gUnknown_030000F0);
    SetFontGlyphSet(1);

    CopyToPaletteBuffer(gUnknown_0859EF20, (palId + 0x10) * 0x20, 0x20);

    gPaletteBuffer[((palId + 0x10) * 0x10 + 4)] = 0x00007247;
    gPaletteBuffer[((palId + 0x10) * 0x10 + 0xe)] = 0x000031AE;
    gPaletteBuffer[((palId + 0x10) * 0x10 + 0xf)] = 0x00007FFF;

    gUnknown_0859133C->unkLine0A = lines;

    for (i = 0; i < lines; i++) {
        Text_Init3(gUnknown_030000D0 + i);

        sub_800465C(gUnknown_030000D0 + i);
        Text_SetColorId(gUnknown_030000D0 + i, 0);
        Text_SetXCursor(gUnknown_030000D0 + i, 4);
    }

    return;
}

//! FE8U = 0x08006964
void sub_8006964(void) {
    CopyToPaletteBuffer(Pal_UIFont, 0x40, 0x20);

    return;
}

//! FE8U = 0x08006978
void sub_8006978(void) {
    SetFont(&gUnknown_030000F0);
    Font_LoadForDialogue();

    return;
}

//! FE8U = 0x0800698C
ProcPtr sub_800698C(int x, int y, const char* str, ProcPtr parent) {
    gUnknown_0859133C->unk0C = x;
    gUnknown_0859133C->unk0D = y;

    gUnknown_0859133C->nextChar = str;
    gUnknown_0859133C->unk04 = NULL;

    gUnknown_0859133C->defaultColor = 1;
    gUnknown_0859133C->unkLine09 = 0;
    gUnknown_0859133C->unk82 = 0;
    gUnknown_0859133C->unkLine0B = 0;
    gUnknown_0859133C->charDisplayDelay = GetTextDisplaySpeed();
    gUnknown_0859133C->charDisplayClock = 0;

    sub_8007838(0xff);

    gUnknown_0859133C->speakingFaceSlot = (s8)0xff;
    gUnknown_0859133C->unk15 = 0;
    gUnknown_0859133C->instantScroll = 0;
    gUnknown_0859133C->unk16 = 1;
    gUnknown_0859133C->unk17 = 0;

    gUnknown_0859133C->config = 0;

    gUnknown_0859133C->unk38 = 0;
    gUnknown_0859133C->unk83 = 0;

    gUnknown_0859133C->unkWidth0E = Div(sub_8008B44(gUnknown_0859133C->nextChar, 0) + 7, 8) + 2;

    if (parent) {
        return Proc_StartBlocking(gUnknown_08591358, parent);
    } else {
        return Proc_Start(gUnknown_08591358, PROC_TREE_3);
    }
}

//! FE8U = 0x08006A30
ProcPtr sub_8006A30(int x, int y, int msgId) {
    return sub_800698C(x, y, GetStringFromIndex(msgId), NULL);
}

//! FE8U = 0x08006A50
ProcPtr sub_8006A50(int x, int y, int msgId, ProcPtr parent) {
    return sub_800698C(x, y, GetStringFromIndex(msgId), parent);
}

//! FE8U = 0x08006A70
ProcPtr sub_8006A70(int x, int y, const char* str) {
    return sub_800698C(x, y, str, NULL);
}

//! FE8U = 0x08006A7C
void sub_8006A7C(void) {
    Proc_EndEach(gUnknown_08591358);
    return;
}

//! FE8U = 0x08006A8C
void sub_8006A8C(int lines) {
    gUnknown_0859133C->unkLine0A = lines;
    return;
}

//! FE8U = 0x08006A98
void sub_8006A98(void) {
    gUnknown_0859133C->config = 0;
    return;
}

//! FE8U = 0x08006AA8
void sub_8006AA8(int flag) {
    gUnknown_0859133C->config |= flag;
    return;
}

//! FE8U = 0x08006ABC
void sub_8006ABC(void(*func)(ProcPtr)) {
    gUnknown_0859133C->unk38 = func;
    return;
}

//! FE8U = 0x08006AC8
void sub_8006AC8(int flag) {
    gUnknown_0859133C->config &= ~flag;
    return;
}

//! FE8U = 0x08006ADC
int sub_8006ADC(int flag) {
    return gUnknown_0859133C->config & flag;
}

//! FE8U = 0x08006AF0
void sub_8006AF0(int printDelay) {

    gUnknown_0859133C->charDisplayDelay = printDelay;

    if (gUnknown_0859133C->charDisplayDelay < 0) {
        gUnknown_0859133C->charDisplayDelay = 0;
    }

    return;
}

//! FE8U = 0x08006B10
void sub_8006B10(int color) {
    int i;

    gUnknown_0859133C->defaultColor = color;

    for (i = 0; i < gUnknown_0859133C->unkLine0A; i++) {
        Text_SetColorId(gUnknown_030000D0 + i, gUnknown_0859133C->defaultColor);
    }

    return;
}

//! FE8U = 0x08006B4C
void sub_8006B4C(ProcPtr proc) {

    if (Proc_Find(gUnknown_08591470) != 0) {
        return;
    }

    if (Proc_Find(gUnknown_085914C8) != 0) {
        return;
    }

    if (!sub_8006ADC(4) && (gKeyStatusPtr->newKeys & 10)) {
        sub_800D3E4();
        sub_80089C4(gUnknown_0859133C->selectedFaceSlot);

        Proc_End(proc);
        sub_8006A7C();

        BG_Fill(gBG0TilemapBuffer, 0);
        BG_Fill(gBG1TilemapBuffer, 0);
        BG_EnableSyncByMask(3);

        return;
    }

    if (Proc_Find(gUnknown_085913F0) != 0) {
        return;
    }

    if (!sub_8006ADC(8) && (gKeyStatusPtr->newKeys & 0xf3)) {
        gUnknown_0859133C->instantScroll = 1;
    }

    return;
}

//! FE8U = 0x08006C00
void sub_8006C00(void) {

    if (!sub_8006ADC(0x20)) {
        LoadObjUIGfx();
        BG_SetPosition(0, 0, 0);
        BG_SetPosition(1, 0, 0);
    }

    Proc_Start(gUnknown_08591340, PROC_TREE_3);

    return;
}

//! FE8U = 0x08006C34
void sub_8006C34(ProcPtr proc) {

    if (sub_8007A3C()) {
        return;
    }

    if (!gUnknown_0859133C->instantScroll) {
        gUnknown_0859133C->charDisplayClock++;

        if (gUnknown_0859133C->charDisplayClock < gUnknown_0859133C->charDisplayDelay) {
            return;
        }
    }

    gUnknown_0859133C->charDisplayClock = 0;

    while (1) {

        sub_80089C4(gUnknown_0859133C->selectedFaceSlot);

        switch (sub_8006FD0(proc)) {
            case 0:
                Proc_Break(proc);
                return;

            case 1:
                goto _08006CD0;

            case 2:
                if (gUnknown_0859133C->instantScroll || gUnknown_0859133C->charDisplayDelay <= 0) {
                    break;
                    goto _08006CC2;
                }

                return;

            case 3:
        _08006CC2:
                gUnknown_0859133C->charDisplayClock = gUnknown_0859133C->charDisplayDelay;
                gUnknown_0859133C->instantScroll = 0;

                return;

            default:
        _08006CD0:
                if (!(sub_8006ADC(0x20))) {
                    if (sub_8006DA0(proc) == 1) {
                        return;
                    }
                } else {
                    if (sub_8006E8C(proc) == 1) {
                        return;
                    }
                }

                gUnknown_0859133C->nextChar = Text_AppendChar(TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine09), gUnknown_0859133C->nextChar);

                if (!sub_8006ADC(0x40)) {
                    if (sub_8006ADC(0x80)) {
                        PlaySoundEffect(0x7a);
                    } else {
                        if ((GetTextDisplaySpeed() == 1) && !(GetGameClock() & 1)) {
                            break;
                        }

                        if (gUnknown_0859133C->instantScroll && gUnknown_0859133C->unk82) {
                            break;
                        }

                        gUnknown_0859133C->unk82 = 1;
                        PlaySoundEffect(0x6e);
                    }
                }
        }


        if (!gUnknown_0859133C->instantScroll && gUnknown_0859133C->charDisplayDelay > 0) {
            return;
        }
    }

    return;
}

//! FE8U = 0x08006DA0
s8 sub_8006DA0(ProcPtr proc) {

    if (!sub_800890C() && gUnknown_0859133C->selectedFaceSlot != 0xFF && !sub_8006ADC(2)) {

        if ((gUnknown_0859133C->unk04 == 0)) {
            gUnknown_0859133C->unkWidth0E = 2 + Div(sub_8008B44(gUnknown_0859133C->nextChar, 0) + 7, 8);
        } else {
            gUnknown_0859133C->unkWidth0E = 2 + Div(sub_8008B44(gUnknown_0859133C->unk04, 0) + 7, 8);
        }
        sub_80081A8();

        sub_80088A8(gUnknown_0859133C->selectedFaceSlot, proc);
        sub_800798C(gUnknown_0859133C->selectedFaceSlot, sub_8006ADC(0x10));

        return 1;
    }

    if (gUnknown_0859133C->unkLine09 >= gUnknown_0859133C->unkLine0A) {
        gUnknown_0859133C->instantScroll = 0;
        Proc_StartBlocking(gUnknown_085914C8, proc);

        return 1;
    }

    if (!gUnknown_0859133C->unk15) {
        Text_Draw(
            TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine09),
            gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + gUnknown_0859133C->unkLine09 * 2)
        );

        sub_8008F20(1);

        gUnknown_0859133C->unk15 = 1;
    }

    if (gUnknown_0859133C->unk16 != 0) {
        sub_80089B8(gUnknown_0859133C->selectedFaceSlot);
    }

    return 0;
}

//! FE8U = 0x08006E8C
s8 sub_8006E8C(ProcPtr proc) {

    if (gUnknown_0859133C->unkLine09 >= gUnknown_0859133C->unkLine0A) {
        gUnknown_0859133C->instantScroll = 0;
        Proc_StartBlocking(gUnknown_085914F0, proc);
        return 1;
    }

    if (gUnknown_0859133C->unk15 == 0) {
        gUnknown_0859133C->unk15 = 1;
    }
    return 0;
}

//! FE8U = 0x08006EC4
void sub_8006EC4(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_08591388, proc);
    return;
}

//! FE8U = 0x08006ED8
s8 sub_8006ED8(void) {
    return Proc_Find(gUnknown_08591388) != 0;
}

//! FE8U = 0x08006EF0
void sub_8006EF0(void) {
    Proc_EndEach(gUnknown_08591388);
    return;
}

//! FE8U = 0x08006F00
void sub_8006F00(void) {
    int i;

    if (gUnknown_0859133C->defaultColor == 1) {
        for (i = 0; i < gUnknown_0859133C->unkLine0A; i++) {
            Text_SetColorId(TALK_TEXT_BY_LINE(i), 4);
        }

        gUnknown_0859133C->defaultColor = 4;
    } else {

        for (i = 0; i < gUnknown_0859133C->unkLine0A; i++) {
            Text_SetColorId(TALK_TEXT_BY_LINE(i), 1);
        }

        gUnknown_0859133C->defaultColor = 1;
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
int sub_8006FD0(ProcPtr proc) {
    struct Proc* unkProc;
    int i;

    while (1) {
        switch (*gUnknown_0859133C->nextChar) {
            case 0x12:
            case 0x13:
            case 0x14:
                gUnknown_0859133C->nextChar++;

                gUnknown_0859133C->unkWidth0E = 2 + Div(sub_8008B44(gUnknown_0859133C->nextChar, sub_800890C()) + 7, 8);

                continue;
        }

        break;
    }

    switch (*gUnknown_0859133C->nextChar) {
        case 0x81:
            // _08007238
            if (gUnknown_0859133C->nextChar[1] == 0x40) {
                gUnknown_0859133C->nextChar += 2;

                Text_Advance(TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine09), 6);

                if (gUnknown_0859133C->instantScroll || gUnknown_0859133C->charDisplayDelay <= 0) {
                    return 2;
                }

                unkProc = Proc_StartBlocking(gUnknown_085913D0, proc);
                unkProc->unk64 = sub_8008198(4);
                return 3;
            }

            return 1;

        case 0x00: // [X]
            // _08007298
            if (gUnknown_0859133C->unk04 == 0) {
                return 0;
            }

            gUnknown_0859133C->nextChar = gUnknown_0859133C->unk04;
            gUnknown_0859133C->nextChar += 2;
            gUnknown_0859133C->unk04 = NULL;

            return sub_8006FD0(proc);

        case 0x01: // [NL]
            // _080072AE
            if (gUnknown_0859133C->unk15 == 1 || gUnknown_0859133C->unkLine09 == 1) {
                gUnknown_0859133C->unkLine09++;
            }

            gUnknown_0859133C->unk15 = 0;
            gUnknown_0859133C->nextChar++;
            return 2;

        case 0x02: // [2NL]
            // _080072CC
            if (sub_8006ADC(0x80)) {
                sub_800815C();
                gUnknown_0859133C->nextChar++;
            } else if (!sub_8006ADC(1)) {
                Proc_StartBlocking(gUnknown_08591470, proc);
            } else {
                sub_8008250();
            }

            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x03: // [A]
            // _08007314
            sub_8007CD8(
                proc,
                gUnknown_0859133C->unk0C * 8 + Text_GetXCursor(TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine09)) + 4,
                gUnknown_0859133C->unk0D * 8 + gUnknown_0859133C->unkLine09 * 16 + 8
            );

            gUnknown_0859133C->nextChar++;

            return 3;

        case 0x04: // [....]
        case 0x05: // [.....]
        case 0x06: // [......]
        case 0x07: // [.......]
            // _08007350
            if (gUnknown_0859133C->instantScroll) {
                gUnknown_0859133C->nextChar++;
                return 2;
            }

            unkProc = Proc_StartBlocking(gUnknown_085913D0, proc);
            unkProc->unk64 = sub_8008198(*gUnknown_0859133C->nextChar);

            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x15: // [CloseSpeechSlow]
            // _08007384
            sub_80081A8();
            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x16: // [ToggleMouthMove]
            // _08007394
            gUnknown_0859133C->unk16 = 1 - gUnknown_0859133C->unk16;
            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x17: // [ToggleSmile]
            // _080073A0
            gUnknown_0859133C->unk17 = 1 - gUnknown_0859133C->unk17;
            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x10: // [LoadFace]
            // _080073AC
            while (1) {
                switch (*gUnknown_0859133C->nextChar) {
                    case 0x08:
                    case 0x09:
                    case 0x0A:
                    case 0x0B:
                    case 0x0C:
                    case 0x0D:
                    case 0x0E:
                    case 0x0F:
                        sub_8007838(*gUnknown_0859133C->nextChar - 8);
                        gUnknown_0859133C->nextChar++;
                        continue;

                    case 0x10:
                        gUnknown_0859133C->nextChar++;

                        sub_8007854(proc);

                        gUnknown_0859133C->nextChar++;
                        gUnknown_0859133C->nextChar++;
                        continue;
                }

                break;
            }

            return 3;

        case 0x11: // [ClearFace]
            // _080073EC
            if (sub_800890C()) {
                sub_80081A8();
            }

            StartFaceFadeOut(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot]);
            gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot] = 0;

            gUnknown_0859133C->nextChar++;

            NewBlockingTimer(proc, 16);

            return 3;

        case 0x1C: // [SendToBack]
            // _08007430
            sub_8006AA8(0x10);
            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x1D: // [FastPrint]
            // _08007440
            sub_8006AC8(0x10);
            gUnknown_0859133C->nextChar++;
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
            sub_80089C4(gUnknown_0859133C->selectedFaceSlot);

            sub_8007838(*gUnknown_0859133C->nextChar - 8);
            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x18: // [Yes]
            // _08007462
            sub_8007DE8(
                gUnknown_08591490,
                TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine09),
                gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + gUnknown_0859133C->unkLine09 * 2),
                1,
                gUnknown_0859133C->defaultColor,
                proc
            );

            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x19: // [No]
            // _080074AC
            sub_8007DE8(
                gUnknown_08591490,
                TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine09),
                gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + gUnknown_0859133C->unkLine09 * 2),
                2,
                gUnknown_0859133C->defaultColor,
                proc
            );

            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x1A: // [Buy/Sell]
            // _080074F8
            sub_8007DE8(
                gUnknown_085914A0,
                TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine09),
                gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + gUnknown_0859133C->unkLine09 * 2),
                1,
                gUnknown_0859133C->defaultColor,
                proc
            );
            asm("");

            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x1B: // [ShopContinue]
            // _08007544
            sub_8007DE8(
                gUnknown_085914A0,
                TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine09),
                gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + gUnknown_0859133C->unkLine09 * 2),
                2,
                gUnknown_0859133C->defaultColor,
                proc
            );
            asm("");

            gUnknown_0859133C->nextChar++;
            return 3;

        case 0x80:
            // _08007590
            switch (*++gUnknown_0859133C->nextChar) {
                case 0x24:
                    // _08007648
                    if (gUnknown_0859133C->unk38) {
                        gUnknown_0859133C->unk38(proc);
                    }

                    gUnknown_0859133C->nextChar++;
                    return 3;

                case 0x21: // [ToggleRed]
                    // _08007658
                    sub_8006F00();
                    gUnknown_0859133C->nextChar++;
                    return sub_8006FD0(proc);

                case 0x00:
                case 0x01:
                case 0x02:
                case 0x03:
                    // _0800766C
                    gUnknown_0859133C->defaultColor = *++gUnknown_0859133C->nextChar;

                    for (i = 0; i < gUnknown_0859133C->unkLine0A; i++) {
                        Text_SetColorId(gUnknown_030000D0 + i, gUnknown_0859133C->defaultColor);
                    }

                    gUnknown_0859133C->nextChar++;
                    return 3;
                case 0x25: // [ToggleColorInvert]
                    // _080076AC
                    gUnknown_0859133C->unk83 = 3 - (gUnknown_0859133C->unk83 & 1);
                    gUnknown_0859133C->nextChar++;
                    return 3;

                case 0x04: // [Events]
                    // _080076BE
                    sub_8006EC4(proc);
                    gUnknown_0859133C->nextChar++;
                    return 3;

                case 0x05: // [G]
                    // _080076D0
                    String_FromNumber(gUnknown_0859133C->userNumber, gUnknown_0859133C->userNumberString);

                    gUnknown_0859133C->nextChar--;

                    gUnknown_0859133C->unk04 = gUnknown_0859133C->nextChar;

                    gUnknown_0859133C->nextChar = gUnknown_0859133C->userNumberString;

                    return sub_8006FD0(proc);

                case 0x20: // [Tact]
                    // _080076F0

                    gUnknown_0859133C->unk04 = gUnknown_0859133C->nextChar;
                    gUnknown_0859133C->unk04--;
                    gUnknown_0859133C->nextChar = GetTacticianName();

                    return sub_8006FD0(proc);

                case 0x06:
                    // _08007708
                    gUnknown_0859133C->nextChar--;

                    gUnknown_0859133C->unk04 = gUnknown_0859133C->nextChar;
                    gUnknown_0859133C->nextChar = gUnknown_0859133C->userString;

                    return sub_8006FD0(proc);
                case 0x0A: // [MoveFarLeft]
                case 0x0B: // [MoveMidLeft]
                case 0x0C: // [MoveLeft]
                case 0x0D: // [MoveRight]
                case 0x0E: // [MoveMidRight]
                case 0x0F: // [MoveFarRight]
                case 0x10: // [MoveFarFarLeft]
                case 0x11: // [MoveFarFarRight]
                    // _08007720
                    sub_80079E4(gUnknown_0859133C->selectedFaceSlot, *gUnknown_0859133C->nextChar - 10);
                    sub_8007838(*gUnknown_0859133C->nextChar - 10);

                    gUnknown_0859133C->nextChar++;
                    return 3;

                case 0x07:
                case 0x08:
                    // _0800773A
                    gUnknown_0859133C->nextChar++;
                    return 3;

                case 0x16: // [EnableBlinking]
                    // _08007744
                    gUnknown_0859133C->nextChar++;
                    SetFaceBlinkControl(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 0);
                    return 3;

                case 0x17:
                    // _0800775A
                    gUnknown_0859133C->nextChar++;
                    SetFaceBlinkControl(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 1);
                    return 3;

                case 0x18: // [DelayBlinking]
                    // _08007770
                    gUnknown_0859133C->nextChar++;
                    SetFaceBlinkControl(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 3);
                    return 3;

                case 0x19: // [PauseBlinking]
                    // _08007786
                    gUnknown_0859133C->nextChar++;
                    SetFaceBlinkControl(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 2);
                    return 3;

                case 0x1A:
                    // _0800779C
                    gUnknown_0859133C->nextChar++;
                    SetFaceBlinkControl(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 4);
                    return 3;

                case 0x1B: // [DisableBlinking]
                    // _080077B2
                    gUnknown_0859133C->nextChar++;
                    SetFaceBlinkControl(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 5);
                    return 3;

                case 0x1C: // [OpenEyes]
                    // _080077CC
                    gUnknown_0859133C->nextChar++;
                    sub_80064D4(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 0);
                    return 3;

                case 0x1D: // [CloseEyes]
                    // _080077E2
                    gUnknown_0859133C->nextChar++;
                    sub_80064D4(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 2);
                    return 3;

                case 0x1E: // [HalfCloseEyes]
                    // _080077F8
                    gUnknown_0859133C->nextChar++;
                    sub_80064D4(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 3);
                    return 3;

                case 0x1F: // [Wink]
                    // _0800780E
                    gUnknown_0859133C->nextChar++;
                    sub_80064D4(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], 4);
                    return 3;

                default:
                    return 0;
            }
    }

    return 1;
}

//! FE8U = 0x08007838
int sub_8007838(int slot) {
    gUnknown_0859133C->selectedFaceSlot = slot;
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

    if (gUnknown_0859133C->selectedFaceSlot == 0xFF) {
        sub_8007838(1);
    }

    if ((s8)IsBattleDeamonActive()) {
        sub_8007844();
    } else {
        faceDisp |= 2;
    }

    if (sub_8008934(gUnknown_0859133C->selectedFaceSlot) <= 14) {
        faceDisp |= 1;
    }

    faceId = gUnknown_0859133C->nextChar[0];
    faceId = (gUnknown_0859133C->nextChar[1] * 0x100) + faceId;

    if (faceId == 0xFFFF) {
        faceId = GetUnitPortraitId(gActiveUnit);
    } else {
        faceId = faceId - 0x100;
    }

    if (gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot] != 0) {
        sub_80066E0(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot], faceId);
        return;
    }

    gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot] = StartFaceAuto(faceId, sub_8008934(gUnknown_0859133C->selectedFaceSlot) * 8, 0x50, faceDisp);

    StartFaceFadeIn(gUnknown_0859133C->faces[gUnknown_0859133C->selectedFaceSlot]);

    sub_800798C(gUnknown_0859133C->selectedFaceSlot, sub_8006ADC(0x10));
    NewBlockingTimer(proc, 8);

    return;
}

//! FE8U = 0x08007938
ProcPtr sub_8007938(int faceId, int x, int y, int disp, int talkFace) {
    gUnknown_0859133C->faces[talkFace] = StartFaceAuto(faceId, x, y, disp);

    return gUnknown_0859133C->faces[talkFace];
}

//! FE8U = 0x08007958
int sub_8007958(int x) {
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
void sub_800798C(int talkFace, int toBack) {
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
        if (!gUnknown_0859133C->faces[i]) {
            continue;
        }

        if (i == talkFace) {
            gUnknown_0859133C->faces[i]->spriteLayer = argLayer;
        } else {
            gUnknown_0859133C->faces[i]->spriteLayer = otherLayer;
        }
    }

    return;
}

//! FE8U = 0x080079E4
void sub_80079E4(int talkFaceFrom, int talkFaceTo) {
    struct FaceProc* face;
    s8 isSwap = 0;

    if (gUnknown_0859133C->faces[talkFaceTo] != 0) {
        isSwap = 1;
        sub_8007A58(talkFaceTo, talkFaceFrom, 1);
    }

    sub_8007A58(talkFaceFrom, talkFaceTo, isSwap);

    face = gUnknown_0859133C->faces[talkFaceFrom];
    gUnknown_0859133C->faces[talkFaceFrom] = gUnknown_0859133C->faces[talkFaceTo];
    gUnknown_0859133C->faces[talkFaceTo] = face;

    return;
}

//! FE8U = 0x08007A3C
s8 sub_8007A3C(void) {
    if (Proc_Find(gUnknown_085913B0) != NULL) {
        return 1;
    }
    return 0;
}

//! FE8U = 0x08007A58
void sub_8007A58(int talkFaceFrom, int talkFaceTo, s8 isSwap) {
    struct UnkDialogueProc* proc;

    int slot = sub_8007958(sub_8008934(talkFaceFrom) * 8);

    if (slot == -1) {
        return;
    }

    proc = Proc_Start(gUnknown_085913B0, gFaces[slot]);

    proc->unk_64 = slot;
    proc->unk_66 = talkFaceTo;
    proc->unk_68 = gFaces[slot]->xPos;
    proc->unk_6a = isSwap;

    return;
}

//! FE8U = 0x08007AB0
void sub_8007AB0(struct UnkDialogueProc* proc) {

    proc->unk_58 = 0;

    if (((proc->unk_68 - sub_8008934(proc->unk_66) * 8) < 0)
        ? (sub_8008934(proc->unk_66) * 8 - proc->unk_68) > 24
        : (proc->unk_68 - sub_8008934(proc->unk_66) * 8)  > 24) {
        proc->unk_5c = 32;
    } else {
        proc->unk_5c = 16;
    }

    return;
}

//! FE8U = 0x08007B0C
void sub_8007B0C(struct UnkDialogueProc* proc) {
    if (proc->unk_5c > 16) {
        if (proc->unk_58 == proc->unk_5c / 8) {
            gFaces[proc->unk_64]->yPos++;
        }

        if (proc->unk_58 == proc->unk_5c / 2) {
            gFaces[proc->unk_64]->yPos--;
        }

        if (proc->unk_58 == proc->unk_5c * 5 / 8) {
            gFaces[proc->unk_64]->yPos++;
        }

    } else {
        if (proc->unk_58 == proc->unk_5c / 2) {
            gFaces[proc->unk_64]->yPos++;
        }
    }

    if (proc->unk_58 >= proc->unk_5c) {
        gFaces[proc->unk_64]->yPos--;
        Proc_Break(proc);
    } else {
        gFaces[proc->unk_64]->xPos = Interpolate(
            4,
            proc->unk_68,
            sub_8008934(proc->unk_66) * 8,
            proc->unk_58++,
            proc->unk_5c
        );
    }

    return;
}

//! FE8U = 0x08007C0C
void sub_8007C0C(void) {
    Proc_EndEach(gUnknown_08591340);
    Proc_EndEach(gUnknown_08591470);
    return;
}

//! FE8U = 0x08007C28
void _Loop6CBlockingTimer(struct BlockingTimerProc* proc) {

    if (proc->unk_64 == 0) {
        Proc_Break(proc);
        return;
    }

    proc->unk_64--;

    return;
}

//! FE8U = 0x08007C4C
void sub_8007C4C(struct BlockingTimerProc* proc) {
    int frame = (GetGameClock() / 2) & 0xf;

    if (!sub_8006ADC(0x80)) {
        PutSprite(2, proc->unk_64, proc->unk_66, gUnknown_08591430[frame], 4);
    } else {
        PutSprite(0, proc->unk_64, proc->unk_66, gUnknown_08591430[frame], 0x0000B2BF);
    }

    if (gKeyStatusPtr->newKeys & 0xf3) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08007CD4
void sub_8007CD4(void) {
    return;
}

//! FE8U = 0x08007CD8
void sub_8007CD8(ProcPtr parent, int x, int y) {
    struct BlockingTimerProc* proc = Proc_StartBlocking(gUnknown_085913F0, parent);

    proc->unk_64 = x;
    proc->unk_66 = y;
    proc->unk_68 = 0;

    return;
}

//! FE8U = 0x08007D04
void sub_8007D04(ProcPtr parent, int x, int y, int unk) {
    struct BlockingTimerProc* proc = Proc_StartBlocking(gUnknown_085913F0, parent);

    proc->unk_64 = x;
    proc->unk_66 = y;
    proc->unk_68 = unk;

    return;
}

//! FE8U = 0x08007D38
void sub_8007D38(struct Proc* proc) {

    TileMap_FillRect(
        gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + 4),
        gUnknown_0859133C->unkWidth0E - 2,
        gUnknown_0859133C->unkLine0A * 2,
        0
    );

    sub_8008F20(1);

    proc->unk64 = 0;

    if (gUnknown_0859133C->unkLine09 == 0) {
        proc->unk66 = 16;
    } else if (gUnknown_0859133C->unkLine09 + 1 >= gUnknown_0859133C->unkLine0A) {
        proc->unk66 = gUnknown_0859133C->unkLine0A * 16;
    } else {
        proc->unk66 = (gUnknown_0859133C->unkLine09 + 1) * 16;
    }

    return;
}

//! FE8U = 0x08007DA4
void sub_8007DA4(struct Proc* proc) {
    proc->unk64++;

    BG_SetPosition(0, 0, proc->unk64);

    if (proc->unk64 >= proc->unk66) {
        BG_SetPosition(0, 0, 0);
        sub_80081EC();

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08007DE8
void sub_8007DE8(const struct ChoiceEntryInfo* choices, struct TextHandle* text, u16* tm, int defaultChoice, int color, ProcPtr parent) {
    struct TalkChoiceProc* proc;

    int x = Text_GetXCursor(text) + 16;

    Text_InsertString(text, x, color, GetStringFromIndex(choices[0].msgid));

    Text_InsertString(text, x + 40, color, GetStringFromIndex(choices[1].msgid));

    Text_Draw(text, tm);

    sub_8008F20(1);

    proc = Proc_StartBlocking(gUnknown_085914B0, parent);

    proc->selectedChoice = defaultChoice;

    proc->xDisp = (((tm - gBG0TilemapBuffer) & 0x1f) * 8 - gLCDControlBuffer.bgoffset[0].x) + x;
    proc->yDisp = ((tm - gBG0TilemapBuffer) / 0x20) * 8 - gLCDControlBuffer.bgoffset[0].y;

    proc->choices = choices;

    if (proc->choices[defaultChoice - 1].onSwitchIn) {
        proc->choices[defaultChoice - 1].onSwitchIn();
    }

    return;
}

void sub_8007E9C(struct TalkChoiceProc* proc) {

    if ((gKeyStatusPtr->newKeys & 2) != 0) {
        PlaySoundEffect(0x6b);

        gUnknown_030000E8 = 0;

        Proc_Break(proc);

        return;
    } else if ((gKeyStatusPtr->newKeys & 1) != 0) {
        PlaySoundEffect(0x6a);

        gUnknown_030000E8 = proc->selectedChoice;

        Proc_Break(proc);

        return;
    }

    if (((gKeyStatusPtr->newKeys & 0x20) != 0) && (proc->selectedChoice == 2)) {
        PlaySoundEffect(0x67);

        proc->selectedChoice = 1;

        if (proc->choices[0].onSwitchIn) {
            proc->choices[0].onSwitchIn();
        }
    }

    if (((gKeyStatusPtr->newKeys & 0x10) != 0) && (proc->selectedChoice == 1)) {
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
void sub_8007F9C(struct Proc* proc) {

    TileMap_FillRect(
        gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + 4),
        gUnknown_0859133C->unkWidth0E - 2,
        gUnknown_0859133C->unkLine0A * 2,
        0
    );

    sub_8008F20(1);

    proc->unk64 = 0;

    return;
}

//! FE8U = 0x08007FDC
void sub_8007FDC(struct Proc* proc) {
    int i;

    proc->unk64++;

    BG_SetPosition(0, 0, proc->unk64);

    if (proc->unk64 >= 16) {
        gUnknown_0859133C->unkLine09--;
        gUnknown_0859133C->unkLine0B++;

        BG_SetPosition(0, 0, 0);

        for (i = 0; i < gUnknown_0859133C->unkLine0A - 1; i++) {
            Text_Draw(
                TALK_TEXT_BY_LINE(i),
                gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + 2 * i)
            );
        }

        TileMap_FillRect(
            gBG0TilemapBuffer + TILEMAP_INDEX(gUnknown_0859133C->unk0C, gUnknown_0859133C->unk0D + (gUnknown_0859133C->unkLine0A - 1) * 2),
            gUnknown_0859133C->unkWidth0E - 2,
            2,
            0
        );

        Text_Clear(TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine0A - 1));
        Text_SetColorId(
            TALK_TEXT_BY_LINE(gUnknown_0859133C->unkLine0A - 1),
            gUnknown_0859133C->defaultColor
        );

        sub_8008F20(1);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080080D0
void sub_80080D0(ProcPtr proc) {
    if (sub_8006ADC(0x80) != 0) {
        sub_8008F64(0x200, 0x1c, 0, proc);
    } else {
        sub_8008F64(0x200, 0x19, 0x44444444, proc);
    }

    return;
}

//! FE8U = 0x08008108
void sub_8008108(void) {
    gUnknown_0859133C->unkLine09--;

    if (sub_8006ADC(0x80) != 0) {
        sub_800465C(gUnknown_030000D0 + 1);
        Text_SetColorId(gUnknown_030000D0 + 1, 0);
    } else {
        sub_80045FC(gUnknown_030000D0 + 1);
        Text_SetColorId(gUnknown_030000D0 + 1, 6);
    }

    Text_SetXCursor(gUnknown_030000D0 + 1, 4);

    return;
}

//! FE8U = 0x0800815C
void sub_800815C(void) {
    int i;

    gUnknown_0859133C->unkLine09 = 0;

    for (i = 0; i < 2; i++) {
        sub_800465C(gUnknown_030000D0 + i);
        Text_SetColorId(gUnknown_030000D0 + i, 0);
        Text_SetXCursor(gUnknown_030000D0 + i, 4);
    }

    return;
}

//! FE8U = 0x08008198
int sub_8008198(int cmd) {
    return gUnknown_08591520[cmd - 4];
}

//! FE8U = 0x080081A8
void sub_80081A8(void) {
    gUnknown_0859133C->speakingFaceSlot = (s8)0xff;

    BG_Fill(gBG1TilemapBuffer, 0);
    sub_8008F20(2);

    sub_80081EC();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    return;
}

//! FE8U = 0x080081EC
void sub_80081EC(void) {
    int i;

    BG_Fill(gBG0TilemapBuffer, 0);
    sub_8008F20(1);

    gUnknown_0859133C->unkLine09 = 0;
    gUnknown_0859133C->unk82 = 0;
    gUnknown_0859133C->unk15 = 0;
    gUnknown_0859133C->unkLine0B = 0;

    for (i = 0; i < gUnknown_0859133C->unkLine0A; i++) {
        Text_Clear(gUnknown_030000D0 + i);
        Text_SetColorId(gUnknown_030000D0 + i, gUnknown_0859133C->defaultColor);
    }

    return;
}

void sub_8008250(void) {
    int i;

    gUnknown_0859133C->unkLine09 = 0;
    gUnknown_0859133C->unk82 = 0;
    gUnknown_0859133C->unk15 = 0;
    gUnknown_0859133C->unkLine0B = 0;

    for (i = 0; i < gUnknown_0859133C->unkLine0A; i++) {
        Text_Clear(gUnknown_030000D0 + i);
        Text_SetColorId(gUnknown_030000D0 + i, gUnknown_0859133C->defaultColor);
    }

    return;
}

//! FE8U = 0x080082A4
void sub_80082A4(int xAnchor, int yAnchor, int width, int height) {
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

    gUnknown_0859133C->unk0C = x + 1;
    gUnknown_0859133C->unk0D = y + 1;

    sub_8008668(1, x, y, width, height);

    if (gUnknown_0859133C->unk83 & 2) {
        sub_8006F8C(gUnknown_0859133C->unk83 & 1);
        gUnknown_0859133C->unk83 ^= 2;
    }

    if (!(gUnknown_0859133C->unk83 & 1)) {
        sub_80084E0(1, xTail, yAnchor, kind);
    }

    sub_8008464(x, y, width, height);

    sub_80083E0();

    sub_8008F20(2);

    return;
}

//! FE8U = 0x080083E0
void sub_80083E0(void) {
    struct Proc* proc = Proc_Start(gUnknown_08591530, PROC_TREE_3);
    proc->unk64 = 0;

    return;
}

//! FE8U = 0x080083F8
void sub_80083F8(struct Proc* proc) {
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

    CopyDataWithPossibleUncomp(gUnknown_080D78EC[proc->unk64 >> 1], (void*)(GetBackgroundTileDataOffset(1) + 0x06000200));

    if (gUnknown_080D78EC[(proc->unk64 >> 1) + 1] == 0) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08008464
void sub_8008464(int x, int y, int width, int height) {
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
void sub_80084E0(int bg, int x, int y, int kind) {

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
void sub_8008668(int bg, int x, int y, int width, int height) {

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
void sub_80087A4(void) {
    return;
}

//! FE8U = 0x080087A8
void sub_80087A8(struct Proc* proc) {

    proc->unk58 = 0;

    if (!sub_8006ADC(0x100)) {
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
void sub_800880C(struct Proc* proc) {
    sub_80082A4(proc->unk64, proc->unk66, proc->unk68, proc->unk6A);
    Proc_Break(proc);

    return;
}

//! FE8U = 0x08008840
void sub_8008840(struct Proc* proc) {
    int var;

    proc->unk58++;

    var = Interpolate(4, -30, 0, proc->unk58, 12);

    BG_SetPosition(1, 0, var / 2);

    if (!sub_8006ADC(0x100)) {
        SetSpecialColorEffectsParameters(1, var / 2 + 0x10, 1 - var / 2, 0);
    }

    if (proc->unk58 == 12) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080088A8
void sub_80088A8(int talkFace, ProcPtr parent) {

    struct Proc* proc = Proc_StartBlocking(gUnknown_08591540, parent);

    proc->unk64 = sub_8008934(talkFace);
    proc->unk66 = 8;

    proc->unk68 = gUnknown_0859133C->unkWidth0E;
    proc->unk6A = 6;

    if (proc->unk64 < 0) {
        proc->unk64 = 0;
    }
    if (proc->unk64 >= 30) {
        proc->unk64 = 30;
    }

    gUnknown_0859133C->speakingFaceSlot = talkFace;
    gUnknown_0859133C->unkFaceSlot10 = gUnknown_0859133C->unkWidth0E;

    return;
}

//! FE8U = 0x0800890C
s8 sub_800890C(void) {

    if ((gUnknown_0859133C->speakingFaceSlot == gUnknown_0859133C->selectedFaceSlot) && (gUnknown_0859133C->unkFaceSlot10 == gUnknown_0859133C->unkWidth0E)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08008934
int sub_8008934(int talkFace) {

    if ((s8)IsBattleDeamonActive()) {
        if (talkFace < 3) {
            return 4;
        } else {
            return 26;
        }
    }

    return gUnknown_08591570[talkFace];
}

//! FE8U = 0x08008960
void sub_8008960(int talkFace, int faceDisp) {

    const int gUnknown_080D7908[] = { 0, 8 };
    int disp;

    if (talkFace == 0xff) {
        return;
    }

    disp = GetFaceDisplayBits(gUnknown_0859133C->faces[talkFace]);
    disp &= 0xffffffc7;

    SetFaceDisplayBits(gUnknown_0859133C->faces[talkFace], disp | faceDisp | gUnknown_080D7908[gUnknown_0859133C->unk17]);

    return;
}

//! FE8U = 0x080089B8
void sub_80089B8(int talkFace) {
    sub_8008960(talkFace, 0x10);
    return;
}

//! FE8U = 0x080089C4
void sub_80089C4(int talkFace) {
    sub_8008960(talkFace, 0);

    return;
}

//! FE8U = 0x080089D0
s8 sub_80089D0(void) {
    return Proc_Find(gUnknown_08591358) ? 1 : 0;
}

//! FE8U = 0x080089E8
s8 Face6CExists(void) {
    return Proc_Find(gProcScr_E_FACE) ? 1 : 0;
}

//! FE8U = 0x08008A00
int GetDialoguePromptResult(void) {
    return gUnknown_030000E8;
}

#if NONMATCHING

//! FE8U = 0x08008A0C
void sub_8008A0C(int result) {
    gUnknown_030000E8 = result;
    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_8008A0C(int result) {
    asm("\n\
        .syntax unified\n\
        adds r2, r0, #0\n\
        ldr r1, _08008A14  @ gUnknown_030000E8\n\
        str r2, [r1]\n\
        bx lr\n\
        .align 2, 0\n\
    _08008A14: .4byte gUnknown_030000E8\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

//! FE8U = 0x08008A18
void sub_8008A18(int number) {
    gUnknown_0859133C->userNumber = number;
    return;
}

//! FE8U = 0x08008A24
void sub_8008A24(const char* str) {
    strcpy(gUnknown_0859133C->userString, str);
    return;
}

void sub_8008A3C(struct TextHandle** texts, const char* str, u16* tm, int unk) {
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
void sub_8008AA8(struct Proc* proc) {

    PutSprite(
        3,
        proc->x,
        proc->y,
        gUnknown_085915AA,
        (0x3FF & proc->unk52) | ((proc->unk64 & 0xf) << 0xc)
    );

    PutSprite(
        3,
        proc->x,
        proc->y,
        gUnknown_08591590,
        (0x3FF & proc->unk52) | ((gUnknown_030000F0.paletteNum & 0xf) << 0xc)
    );

    return;
}

//! FE8U = 0x08008B24
void sub_8008B24(void) {
    SetPrimaryHBlankHandler(NULL);
    return;
}

void SetupFutureCall2(void*, int);

//! FE8U = 0x08008B30
void sub_8008B30(void) {
    SetupFutureCall2(sub_8008B24, 1);
    return;
}

//! FE8U = 0x08008B44
int sub_8008B44(const char* str, s8 isBubbleOpen) {
    char buf[0x20];
    int chrLen;

    int speakFace = gUnknown_0859133C->speakingFaceSlot;
    int activeFace = gUnknown_0859133C->selectedFaceSlot;

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
                        sub_8014270(gUnknown_0859133C->userNumber, buf);
                        currentLineLen += sub_8008B44(buf, isBubbleOpen);

                        str++;
                        break;

                    case 0x20:
                        // _08008EA8
                        currentLineLen += GetStringTextWidth(GetTacticianName());

                        str++;
                        break;

                    case 0x06:
                        // _08008EB2
                        currentLineLen += sub_8008B44(gUnknown_0859133C->userString, isBubbleOpen);

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
    return 0;
}

//! FE8U = 0x08008F1C
void sub_8008F1C(void) {
    return;
}

//! FE8U = 0x08008F20
void sub_8008F20(int bg) {
    if (!sub_8006ADC(0x20)) {
        BG_EnableSyncByMask(bg);
    }

    return;
}

#if NONMATCHING

//! FE8U = 0x08008F3C
s8 sub_8008F3C(void) {
    return Proc_Find(gUnknown_08591624) ? 1 : 0;
}

#else // if !NONMATCHING

__attribute__((naked))
s8 sub_8008F3C(void) {
    asm("\n\
        .syntax unified\n\
        push {lr}\n\
        ldr r0, _08008F50  @ gUnknown_08591624\n\
        bl Proc_Find\n\
        adds r1, r0, #0\n\
        cmp r1, #0\n\
        beq _08008F4C\n\
        movs r0, #1\n\
    _08008F4C:\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _08008F50: .4byte gUnknown_08591624\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

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