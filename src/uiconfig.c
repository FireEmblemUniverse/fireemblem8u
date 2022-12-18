#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmshop.h"
#include "uiutils.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "statscreen.h"


struct Selector {
    /* 00 */ u16 helpTextId;
    /* 02 */ u16 optionTextId;
    /* 04 */ u8 xPos;
    /* 05 */ u8 unk_05;
};

struct GameOption {
    /* 00 */ u16 msgId;
    /* 04 */ struct Selector selectors[4];
    /* 24 */ u8 icon;
    /* 28 */ s8 (*func)(ProcPtr);
};

struct ConfigScreen {
    /* 00 */ u8 _pad[0x2A-0x00];
    /* 2A */ s16 unk_2a; // current index
    /* 2C */ s16 unk_2c; // top of menu index
    /* 2E */ u16 unk_2e; // ? maybe offset on current bg?
    /* 30 */ u16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ u8 unk_36;
    /* 37 */ s8 unk_37; // some flags / state var
    /* 38 */ struct TextHandle unk_38[6]; // size: 0x30

    /* 68 */ struct TextHandle unk_68;
    /* 70 */ struct TextHandle unk_70[6];

    /* A0 */ struct TextHandle unk_a0;
    /* A8 */ struct TextHandle unk_a8;
};

struct ConfigProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 _pad1[0x30-0x29];

    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;

    /* 36 */ u8 unk_36;
};

enum {
    GAME_OPTION_ANIMATION      =  0,
    GAME_OPTION_TERRAIN        =  1,
    GAME_OPTION_UNIT           =  2,
    GAME_OPTION_AUTOCURSOR     =  3,
    GAME_OPTION_TEXT_SPEED     =  4,
    GAME_OPTION_GAME_SPEED     =  5,
    GAME_OPTION_MUSIC          =  6,
    GAME_OPTION_SOUND_EFFECTS  =  7,
    GAME_OPTION_WINDOW_COLOR   =  8,
    GAME_OPTION_CPU_LEVEL      =  9,
    GAME_OPTION_COMBAT         = 10,
    GAME_OPTION_SUBTITLE_HELP  = 11,
    GAME_OPTION_AUTOEND_TURNS  = 12,
    GAME_OPTION_UNIT_COLOR     = 13,
    GAME_OPTION_OBJECTIVE      = 14,
    GAME_OPTION_CONTROLLER     = 15,
    GAME_OPTION_RANK_DISPLAY   = 16,
};

struct ConfigScreen* CONST_DATA gUnknown_08A2E974 = (struct ConfigScreen*) gGenericBuffer;

u8 CONST_DATA gUnknown_08A2E978[] = {
    GAME_OPTION_ANIMATION,
    GAME_OPTION_GAME_SPEED,
    GAME_OPTION_TEXT_SPEED,
    GAME_OPTION_TERRAIN,
    GAME_OPTION_UNIT,
    GAME_OPTION_COMBAT,
    GAME_OPTION_OBJECTIVE,
    GAME_OPTION_SUBTITLE_HELP,
    GAME_OPTION_AUTOCURSOR,
    GAME_OPTION_AUTOEND_TURNS,
    GAME_OPTION_MUSIC,
    GAME_OPTION_SOUND_EFFECTS,
    GAME_OPTION_WINDOW_COLOR,
};

u16 CONST_DATA gUnknown_08A2E986[] = {
    3,
    0x4000, 0x8000, 0x0000,
    0x4000, 0x8020, 0x0004,
    0x4000, 0x8040, 0x0008,
};

s8 sub_80B1C90(ProcPtr proc);
s8 sub_80B1CAC(ProcPtr proc);
s8 sub_80B1D14(ProcPtr);

struct GameOption CONST_DATA gUnknown_08A2E99C[] = {
    [GAME_OPTION_ANIMATION] = {
        .msgId = 0x90, // Animation[.]
        .selectors = {
            { 0xa1, 0xbf, 0x70, 1 },
            { 0xa2, 0xc0, 0x7f, 1 },
            { 0xa3, 0xbe, 0x8e, 2 },
            { 0xa4, 0xc7, 0xa5, 2 },
        },
        .icon = 0x0,
        .func = sub_80B1D14
    },

    [GAME_OPTION_TERRAIN] = {
        .msgId = 0x91, // Terrain[.]
        .selectors = {
            { 0xab, 0xbd, 0x70, 2 },
            { 0xab, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x02,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_UNIT] = {
        .msgId = 0x92, // Unit
        .selectors = {
            { 0xac, 0xca, 0x70, 3 },
            { 0xad, 0xcb, 0x8f, 4 },
            { 0xae, 0xbe, 0xb6, 2 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x04,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_AUTOCURSOR] = {
        .msgId = 0x95, // Autocursor
        .selectors = {
            { 0xb3, 0xbd, 0x70, 2 },
            { 0xb3, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x06,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_TEXT_SPEED] = {
        .msgId = 0x96, // Text Speed
        .selectors = {
            { 0xa7, 0xc3, 0x70, 3 },
            { 0xa8, 0xc4, 0x8f, 3 },
            { 0xa9, 0xc5, 0xae, 3 },
            { 0xaa, 0xc6, 0xcd, 2 },
        },
        .icon = 0x08,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_GAME_SPEED] = {
        .msgId = 0x97, // Game Speed
        .selectors = {
            { 0xa5, 0xc4, 0x70, 3 },
            { 0xa6, 0xc5, 0x8f, 3 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x0a,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_MUSIC] =  {
        .msgId = 0x98, // Music[.]
        .selectors = {
            { 0xb5, 0xbd, 0x70, 2 },
            { 0xb5, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x0c,
        .func = sub_80B1CAC,
    },

    [GAME_OPTION_SOUND_EFFECTS] = {
        .msgId = 0x99, // Sound Effects[.],
        .selectors = {
            { 0xb6, 0xbd, 0x70, 2 },
            { 0xb6, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x0e,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_WINDOW_COLOR] = {
        .msgId = 0x9a, // Window Color
        .selectors = {
            { 0xb7, 0xbf, 0x70, 1 },
            { 0xb7, 0xc0, 0x7f, 1 },
            { 0xb7, 0xc1, 0x8e, 1 },
            { 0xb7, 0xc2, 0x9d, 1 },
        },
        .icon = 0x10,
        .func = sub_80B1C90,
    },

    [GAME_OPTION_CPU_LEVEL] = {
        .msgId = 0x9b, // CPU Level[.]
        .selectors = {
            { 0xb8, 0xbf, 0x70, 1 },
            { 0xb8, 0xc0, 0x7f, 1 },
            { 0xb8, 0xc1, 0x8e, 1 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x12,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_COMBAT] = {
        .msgId = 0x93, // Combat
        .selectors = {
            { 0xaf, 0xc8, 0x70, 3 },
            { 0xb0, 0xc9, 0x8f, 3 },
            { 0xb1, 0xbe, 0xb6, 2 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x14,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_SUBTITLE_HELP] = {
        .msgId = 0x94, // Subtitle Help[.]
        .selectors = {
            { 0xb2, 0xbd, 0x70, 2 },
            { 0xb2, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x16,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_AUTOEND_TURNS] = {
        .msgId = 0x9c, // Autoend Turns[.]
        .selectors = {
            { 0xb4, 0xbd, 0x70, 2 },
            { 0xb4, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x18,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_UNIT_COLOR] = {
        .msgId = 0x9d, // Unit Color
        .selectors = {
            { 0xb9, 0xbd, 0x70, 2 },
            { 0xb9, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x1a,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_OBJECTIVE] = {
        .msgId = 0x9e, // Show Objective
        .selectors = {
            { 0xba, 0xbd, 0x70, 2 },
            { 0xba, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x1c,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_CONTROLLER] = {
        .msgId = 0x9f, // Controller
        .selectors = {
            { 0xbb, 0xbd, 0x70, 2 },
            { 0xbb, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x1e,
        .func = sub_80B1D14,
    },

    [GAME_OPTION_RANK_DISPLAY] = {
        .msgId = 0xa0, // Rank Display
        .selectors = {
            { 0xbc, 0xbd, 0x70, 2 },
            { 0xbc, 0xbe, 0x87, 2 },
            { 0x00, 0x00, 0xbe, 0 },
            { 0x00, 0x00, 0xbd, 0 },
        },
        .icon = 0x20,
        .func = sub_80B1D14,
    }
};

void sub_80B1784(void);

struct ProcCmd CONST_DATA gUnknown_08A2EC88[] = {
    PROC_NAME("E_CfExplReWrite"),

    PROC_SLEEP(1),
    PROC_CALL(sub_80B1784),

    PROC_END,
};

void sub_80B1920(void);
void sub_80B1938(void);

struct ProcCmd CONST_DATA gUnknown_08A2ECA8[] = {
    PROC_NAME("E_cfObj"),

    PROC_CALL(sub_80B1920),

PROC_LABEL(0),
    PROC_CALL(sub_80B1938),
    PROC_SLEEP(0),

    PROC_GOTO(0),

    PROC_END,
};

extern u16 gUnknown_08A07A98[]; // pal
extern u8 gUnknown_08A0733C[]; // gfx
extern u8 gUnknown_08A0754C[]; // gfx
extern u8 gUnknown_08A079B4[]; // tsa

u8 sub_80B1DE8(u8);
void sub_80B1F64(u8, u8);

//! FE8U: 0x080B169C
s16 sub_80B169C(void) {
    int unk = gUnknown_08A2E974->unk_32;

    if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_DIFFICULT)) {
        return unk;
    }

    return unk + 3;
}

//! FE8U = 0x080B16CC
u8 sub_80B16CC(void) {
    return gUnknown_08A2E974->unk_2a;
}

//! FE8U = 0x080B16DC
u8 sub_80B16DC(void) {
    return sub_80B1DE8(gUnknown_08A2E978[gUnknown_08A2E974->unk_2a]);
}

#if NONMATCHING

//! FE8U: 0x080B1700
void sub_80B1700(int a, int b) {
    int tmpA;
    int tmpB;
    int tmpC;
    int tmpD;
    int tmpE;

    tmpC = (a * 2 + b) & 0x1f;
    tmpE = 0x20 * tmpC;

    tmpA = gUnknown_08A2E99C[gUnknown_08A2E978[a]].icon;

    tmpB = (tmpA & 0x1f) + ((((tmpA) << 1) & 0xFFC0));
    tmpB += 0x200;

    tmpD = tmpB + 0x4000;
    gBG1TilemapBuffer[tmpE + 0x02] = tmpD;
    gBG1TilemapBuffer[tmpE + 0x03] = tmpB + 0x4001;

    gBG1TilemapBuffer[tmpE + 0x22] = tmpB + 0x4020;
    gBG1TilemapBuffer[tmpE + 0x23] = tmpB + 0x4021;

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80B1700(int a, int b) {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, lr}\n\
        lsls r2, r0, #1\n\
        adds r2, r2, r1\n\
        movs r4, #0x1f\n\
        ands r2, r4\n\
        lsls r2, r2, #5\n\
        ldr r3, _080B176C  @ gUnknown_08A2E99C\n\
        ldr r1, _080B1770  @ gUnknown_08A2E978\n\
        adds r0, r0, r1\n\
        ldrb r1, [r0]\n\
        movs r0, #0x2c\n\
        muls r0, r1, r0\n\
        adds r0, r0, r3\n\
        adds r0, #0x24\n\
        ldrb r1, [r0]\n\
        adds r3, r1, #0\n\
        ands r3, r4\n\
        lsls r0, r1, #1\n\
        ldr r1, _080B1774  @ 0x0000FFC0\n\
        ands r0, r1\n\
        movs r1, #0x80\n\
        lsls r1, r1, #2\n\
        adds r0, r0, r1\n\
        adds r3, r3, r0\n\
        movs r0, #0x80\n\
        lsls r0, r0, #7\n\
        adds r1, r3, r0\n\
        ldr r4, _080B1778  @ gBG1TilemapBuffer\n\
        adds r0, r2, #2\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r4\n\
        strh r1, [r0]\n\
        adds r0, r2, #3\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r4\n\
        ldr r5, _080B177C  @ 0x00004001\n\
        adds r1, r3, r5\n\
        strh r1, [r0]\n\
        adds r0, r2, #0\n\
        adds r0, #0x22\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r4\n\
        adds r5, #0x1f\n\
        adds r1, r3, r5\n\
        strh r1, [r0]\n\
        adds r2, #0x23\n\
        lsls r2, r2, #1\n\
        adds r2, r2, r4\n\
        ldr r0, _080B1780  @ 0x00004021\n\
        adds r3, r3, r0\n\
        strh r3, [r2]\n\
        pop {r4, r5}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080B176C: .4byte gUnknown_08A2E99C\n\
    _080B1770: .4byte gUnknown_08A2E978\n\
    _080B1774: .4byte 0x0000FFC0\n\
    _080B1778: .4byte gBG1TilemapBuffer\n\
    _080B177C: .4byte 0x00004001\n\
    _080B1780: .4byte 0x00004021\n\
        .syntax divided\n\
    ");

}

#endif // NONMATCHING

//! FE8U: 0x080B1784
void sub_80B1784(void) {
    const char* str;

    Text_Clear(&gUnknown_08A2E974->unk_a8);

    str = GetStringFromIndex(gUnknown_08A2E99C[gUnknown_08A2E978[gUnknown_08A2E974->unk_2a]].selectors[sub_80B16DC()].helpTextId);

    DrawTextInline(&gUnknown_08A2E974->unk_a8, gBG0TilemapBuffer + 0x244, 0, 0, 0x16, str);

    return;
}

//! FE8U = 0x080B17E4
void sub_80B17E4(int selectedIdx, int textIdx, int y) {
    const char* str;

    Text_Clear(&gUnknown_08A2E974->unk_38[textIdx]);

    str = GetStringFromIndex(gUnknown_08A2E99C[gUnknown_08A2E978[selectedIdx]].msgId);

    DrawTextInline(&gUnknown_08A2E974->unk_38[textIdx], gBG1TilemapBuffer + 4 + y * 0x20, 0, 0, 9, str);

    return;
}

//! FE8U: 0x080B1850
void sub_80B1850(int selectedIdx, int textIdx, int y) {
    int i;

    int optionIdx = gUnknown_08A2E978[selectedIdx];

    int x = gUnknown_08A2E99C[optionIdx].selectors[0].xPos / 8;

    Text_Clear(&gUnknown_08A2E974->unk_70[textIdx]);

    for (i = 0; i < 4; i++) {

        if (gUnknown_08A2E99C[optionIdx].selectors[i].optionTextId == 0) {
            break;
        }

        Text_InsertString(
            &gUnknown_08A2E974->unk_70[textIdx],
            gUnknown_08A2E99C[optionIdx].selectors[i].xPos - 0x70,
            (i == sub_80B1DE8(optionIdx)) ? 2 : 1,
            GetStringFromIndex(gUnknown_08A2E99C[optionIdx].selectors[i].optionTextId)
        );

    }

    Text_Draw(&gUnknown_08A2E974->unk_70[textIdx], gBG1TilemapBuffer + (y * 0x20 + (x)));

    return;
}

//! FE8U: 0x080B1920
void sub_80B1920(void) {
    LoadIconPalette(1, 0x12);
    UnpackUiVArrowGfx(0x80, 3);
    return;
}

//! FE8U = 0x080B1938
void sub_80B1938(void) {
    int y;

    int optionIdx = gUnknown_08A2E978[gUnknown_08A2E974->unk_2a];

    u8 time = (GetGameClock() % 16) & 8;

    CallARM_PushToSecondaryOAM(0x12, 8, gUnknown_08A2E986, 0x20c0);

    // current option position on screen (cur index - top index)
    y = (gUnknown_08A2E974->unk_2a - gUnknown_08A2E974->unk_2c) * 0x10 + 0x28;

    DisplayFrozenUiHand(0x10, y);

    DisplayUiHand(gUnknown_08A2E99C[optionIdx].selectors[sub_80B1DE8(optionIdx)].xPos - 2, y);

    if (((gUnknown_08A2E974->unk_37 & 1) == 0) || (sub_8095970() != 0)) {
        if ((sub_80B16CC() == 0) && (sub_80B16DC() == 3)) {
            CallARM_PushToSecondaryOAM(0xc0, 0x28, gObject_16x16, (time  != 0) ? 0x20CC + 2 : 0x20CC);
        }
    }

    sub_80976CC(10, gUnknown_08A2E974->unk_2e, (u16)gUnknown_08A2E974->unk_34, 6);

    return;
}

//! FE8U = 0x080B1A08
void sub_80B1A08(struct ConfigProc* proc) {
    int i;

    u16 gUnknown_08205E50[12] = {
        0x0000, 0x6000, 0,
        0x0000, 0x6800, 0,
        0x0000, 0x7000, 0,
        0x8000, 0x7800, 0,
    };

    i = 0;

    SetupBackgrounds(gUnknown_08205E50);

    gUnknown_08A2E974->unk_32 = 0;
    gUnknown_08A2E974->unk_34 = 0xd;
    gUnknown_08A2E974->unk_2a = 0;
    gUnknown_08A2E974->unk_2c = 0;
    gUnknown_08A2E974->unk_2e = 0;

    proc->unk_30 = 0;
    proc->unk_36 = 0;

    gUnknown_08A2E974->unk_37 &= ~1;
    gUnknown_08A2E974->unk_37 &= ~2;

    Font_InitForUIDefault();

    sub_80156BC();

    LoadUiFrameGraphics();

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, gUnknown_08A2E974->unk_2e);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0x28;
    gLCDControlBuffer.win0_right = 0xf0;
    gLCDControlBuffer.win0_bottom = 0x88;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    SetSpecialColorEffectsParameters(1, 0xe, 4, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    CopyToPaletteBuffer(gUnknown_08A07A98, 0x80, 0x20);
    CopyToPaletteBuffer(gUnknown_08A07A98, 0x240, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08A0733C, (void*)0x06011800);
    CopyDataWithPossibleUncomp(gUnknown_08A0754C, (void*)0x06004000);

    CopyDataWithPossibleUncomp(gUnknown_08A079B4, gGenericBuffer + 0x80);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer + 0x80, 0x1000);

    Font_ResetAllocation();

    Text_Init(&gUnknown_08A2E974->unk_a8, 0x16);

    sub_80B1784();

    sub_8097748(proc, 0xe0, 0x2f, 0x7200, 1);

    Text_Init(&gUnknown_08A2E974->unk_68, 9);
    Text_Init(&gUnknown_08A2E974->unk_a0, 0xe);


    for (; i < 6; i++) {
        int y = (i * 2) + 5;

        sub_80B1700(i, 5);

        Text_Init(&gUnknown_08A2E974->unk_38[i], 9);
        Text_Init(&gUnknown_08A2E974->unk_70[i], 0xe);

        sub_80B17E4(i, i, y);
        sub_80B1850(i, i, y);
    }

    sub_8086CE8(proc, 0, 0x12, 2, 0);

    Proc_Start(gUnknown_08A2ECA8, proc);

    BG_EnableSyncByMask(0xf);

    return;
}

//! FE8U = 0x080B1C90
s8 sub_80B1C90(ProcPtr proc) {

    if (sub_80B1D14(proc) != 0) {
        UnpackUiFrameBuffered(-1);
    }

    return 0;
}

//! FE8U: 0x080B1CAC
s8 sub_80B1CAC(ProcPtr proc) {

    if (sub_80B1D14(proc) == 0) {
        return 0;
    }

    if (sub_80B1DE8(gUnknown_08A2E978[gUnknown_08A2E974->unk_2a]) != 0) {
        sub_8002AC8();
        return 0;
    }

    if ((gUnknown_08A2E974->unk_37 & 1) != 0) {
        Sound_PlaySong80024D4(0x34, 0);
        return 0;
    }

    if ((gUnknown_08A2E974->unk_37 & 2) != 0) {
        sub_80B9FC0();
    } else {
        sub_80160D0();
    }

    return 0;
}

//! FE8U: 0x080B1D14
s8 sub_80B1D14(ProcPtr proc) {

    int valueChanged = 0;

    int selectedIdx = gUnknown_08A2E974->unk_2a;
    u8 optionIdx = gUnknown_08A2E978[selectedIdx];

    u8 selectedValue = sub_80B16DC();

    if (gKeyStatusPtr->repeatedKeys & (DPAD_LEFT | DPAD_RIGHT)) {

        if (gKeyStatusPtr->repeatedKeys & (DPAD_LEFT)) {
            if (selectedValue != 0) {
                selectedValue--;
                sub_80B1F64(optionIdx, selectedValue);

                valueChanged = 1;
            }
        } else { // if (gKeyStatusPtr->repeatedKeys & (DPAD_RIGHT))
            if (gUnknown_08A2E99C[optionIdx].selectors[selectedValue+1].optionTextId != 0) {
                if (selectedValue < 3) {
                    selectedValue++;
                    sub_80B1F64(optionIdx, selectedValue);

                    valueChanged = 1;
                }
            }
        }

        if (valueChanged != 0) {

            Proc_Start(gUnknown_08A2EC88, proc);

            sub_80B1850(selectedIdx, selectedIdx % 7, selectedIdx * 2 + 5);

            BG_EnableSyncByMask(3);

            PlaySoundEffect(0x67);
        }
    }

    return valueChanged;
}

//! FE8U: 0x080B1DE8
u8 sub_80B1DE8(u8 index) {
    int value = 0;

    switch (index) {
        case GAME_OPTION_ANIMATION:
            switch (gRAMChapterData.unk42_2) {
                case 0:
                    return 0;
                case 3:
                    return 1;
                case 1:
                    return 2;
                case 2:
                    return 3;
            }

            // fallthrough

        case GAME_OPTION_TERRAIN:
            value = gRAMChapterData.cfgDisableTerrainDisplay;

            break;

        case GAME_OPTION_UNIT:
            value = gRAMChapterData.cfgUnitDisplayType;

            break;

        case GAME_OPTION_AUTOCURSOR:
            value = gRAMChapterData.auto_cursor;

            break;

        case GAME_OPTION_TEXT_SPEED:
            value = gRAMChapterData.cfgTextSpeed;

            break;

        case GAME_OPTION_GAME_SPEED:
            value = gRAMChapterData.unk40_8;

            break;

        case GAME_OPTION_MUSIC:
            value = gRAMChapterData.unk41_1;

            break;

        case GAME_OPTION_SOUND_EFFECTS:
            value = gRAMChapterData.unk41_2;

            break;

        case GAME_OPTION_WINDOW_COLOR:
            value = gRAMChapterData.cfgWindowColor;

            break;

        case GAME_OPTION_COMBAT:
            value = gRAMChapterData.cfgBattleForecastType;

            break;

        case GAME_OPTION_SUBTITLE_HELP:
            value = gRAMChapterData.cfgNoSubtitleHelp;

            break;

        case GAME_OPTION_AUTOEND_TURNS:
            value = gRAMChapterData.unk41_7;

            break;

        case GAME_OPTION_UNIT_COLOR:
            value = gRAMChapterData.unk40_1;

            break;

        case GAME_OPTION_OBJECTIVE:
            value = gRAMChapterData.cfgDisableGoalDisplay;

            break;

        case GAME_OPTION_CONTROLLER:
            value = gRAMChapterData.unk42_6;

            break;

        case GAME_OPTION_RANK_DISPLAY:
            value = gRAMChapterData.unk42_7;

            break;

    }

    return value;
}

//! FE8U: 0x080B1F64
void sub_80B1F64(u8 index, u8 newValue) {

    switch (index) {
        case GAME_OPTION_ANIMATION:
            switch (newValue) {
                case 0:
                    gRAMChapterData.unk42_2 = 0;
                    return;

                case 1:
                    gRAMChapterData.unk42_2 = 3;
                    return;

                case 2:
                    gRAMChapterData.unk42_2 = 1;
                    return;

                case 3:
                    gRAMChapterData.unk42_2 = 2;
                    return;
            }

            // fallthrough

        case GAME_OPTION_TERRAIN:
            gRAMChapterData.cfgDisableTerrainDisplay = newValue;

            break;

        case GAME_OPTION_UNIT:
            gRAMChapterData.cfgUnitDisplayType = newValue;

            break;

        case GAME_OPTION_AUTOCURSOR:
            gRAMChapterData.auto_cursor = newValue;

            break;

        case GAME_OPTION_TEXT_SPEED:
            gRAMChapterData.cfgTextSpeed = newValue;

            break;

        case GAME_OPTION_GAME_SPEED:
            gRAMChapterData.unk40_8 = newValue;

            break;

        case GAME_OPTION_MUSIC:
            gRAMChapterData.unk41_1 = newValue;

            break;

        case GAME_OPTION_SOUND_EFFECTS:
            gRAMChapterData.unk41_2 = newValue;

            break;

        case GAME_OPTION_WINDOW_COLOR:
            gRAMChapterData.cfgWindowColor = newValue;

            break;

        case GAME_OPTION_COMBAT:
            gRAMChapterData.cfgBattleForecastType = newValue;

            break;

        case GAME_OPTION_SUBTITLE_HELP:
            gRAMChapterData.cfgNoSubtitleHelp = newValue;

            break;

        case GAME_OPTION_AUTOEND_TURNS:
            gRAMChapterData.unk41_7 = newValue;

            break;

        case GAME_OPTION_UNIT_COLOR:
            gRAMChapterData.unk40_1 = newValue;

            break;

        case GAME_OPTION_OBJECTIVE:
            gRAMChapterData.cfgDisableGoalDisplay = newValue;

            break;

        case GAME_OPTION_CONTROLLER:
            gRAMChapterData.unk42_6 = newValue;

            break;

        case GAME_OPTION_RANK_DISPLAY:
            gRAMChapterData.unk42_7 = newValue;

            break;

    }

    return;
}

//! FE8U: 0x080B2188
void sub_80B2188(ProcPtr proc, int selectedIdx, int c) {
    int i;
    int textIdx;

    int y = ((selectedIdx * 2) + 5) & 0x1f;

    int yTmp = 0x20 * y;

    for (i = 0; i <= 0x1a; i++) {
        gBG1TilemapBuffer[yTmp + 0x02 + i] = 0;
        gBG1TilemapBuffer[yTmp + 0x22 + i] = 0;
    }

    textIdx = selectedIdx % 7;

    sub_80B1700(selectedIdx, 5);
    sub_80B17E4(selectedIdx, textIdx, y);
    sub_80B1850(selectedIdx, textIdx, y);

    for (i = 0; i <= 0x1a; i++) {
        gBG0TilemapBuffer[c + 0x62 + i] = 0;
    }

    BG_EnableSyncByMask(3);

    return;
}

//! FE8U: 0x080B220C
void sub_80B220C(struct ConfigProc* proc) {
    s8 valueChanged = 0;

    switch (proc->unk_30) {
        case 0:
            if (gKeyStatusPtr->newKeys & (B_BUTTON)) {
                PlaySoundEffect(0x6B);

                Proc_Break(proc);

                break;

            } else if (gKeyStatusPtr->newKeys & (A_BUTTON)) {
                if (((gUnknown_08A2E974->unk_37 & 1) != 0) && (sub_8095970() == 0)) {
                    break;
                }

                if (gUnknown_08A2E978[gUnknown_08A2E974->unk_2a] != 0) {
                    break;
                }

                if (sub_80B1DE8(0) != 3) {
                    break;
                }

                PlaySoundEffect(0x6A);

                proc->unk_36 = 1;

                Proc_Break(proc);

                break;

            } else if (gKeyStatusPtr->repeatedKeys & (DPAD_UP | DPAD_DOWN)) {
                if (gKeyStatusPtr->repeatedKeys & (DPAD_UP)) {

                    if (gUnknown_08A2E974->unk_2a != 0) {
                        gUnknown_08A2E974->unk_2a--;

                        if ((gUnknown_08A2E974->unk_2a - gUnknown_08A2E974->unk_2c < 1)
                            && (gUnknown_08A2E974->unk_2c != 0)) {
                            gUnknown_08A2E974->unk_2c--;

                            sub_80B2188(proc, gUnknown_08A2E974->unk_2a - 1, 0);

                            gUnknown_08A2E974->unk_2e -= 4;

                            proc->unk_30 = 1;

                        }

                        valueChanged = 1;

                    }

                } else { // if (gKeyStatusPtr->repeatedKeys & (DPAD_DOWN))

                    if (gUnknown_08A2E974->unk_2a < gUnknown_08A2E974->unk_34 - 1) {
                        gUnknown_08A2E974->unk_2a++;

                        if ((gUnknown_08A2E974->unk_2a - gUnknown_08A2E974->unk_2c > 4)
                            && (gUnknown_08A2E974->unk_2a < gUnknown_08A2E974->unk_34 - 1)) {
                            gUnknown_08A2E974->unk_2c++;

                            sub_80B2188(proc, gUnknown_08A2E974->unk_2a + 1, 0x140);

                            gUnknown_08A2E974->unk_2e += 4;

                            proc->unk_30 = 4;

                        }

                        valueChanged = 1;
                    }
                }

                if (valueChanged != 0) {

                    Proc_Start(gUnknown_08A2EC88, proc);

                    BG_EnableSyncByMask(3);

                    PlaySoundEffect(0x66);

                    break;
                }
            }

            if (gKeyStatusPtr->newKeys & (DPAD_LEFT | DPAD_RIGHT)) {

                if (gUnknown_08A2E99C[gUnknown_08A2E978[gUnknown_08A2E974->unk_2a]].func != 0) {
                    gUnknown_08A2E99C[gUnknown_08A2E978[gUnknown_08A2E974->unk_2a]].func(proc);
                }

            }

            break;

        case 1:
        case 2:
        case 3:

            gUnknown_08A2E974->unk_2e -= 4;

            if (proc->unk_30 == 3) {
                proc->unk_30 = 0;
            } else {
                proc->unk_30++;
            }

            break;

        case 4:
        case 5:
        case 6:

            gUnknown_08A2E974->unk_2e += 4;

            if (proc->unk_30 == 6) {
                proc->unk_30 = 0;
            } else {
                proc->unk_30++;
            }

            break;
    }

    BG_SetPosition(1, 0, gUnknown_08A2E974->unk_2e);

    return;
}

//! FE8U: 0x080B2464
s8 sub_80B2464(struct ConfigProc* proc) {
    Delete6CMenuScroll();

    EndBG3Slider();

    Proc_EndEach(gUnknown_08A2ECA8);
    Proc_EndEach(gUnknown_08A2EC88);

    if (proc->unk_36 != 0) {
        sub_8092134(proc);
        Proc_Goto(proc, 0);

        return 0;
    }

    return 1;
}

static inline s8* GetConfigUnk37() {
    return &gUnknown_08A2E974->unk_37;
}

//! FE8U: 0x080B24AC
void sub_80B24AC(void) {
    s8* flag = GetConfigUnk37();
    *flag |= 1;
    return;
}

//! FE8U: 0x080B24C0
void sub_80B24C0(void) {
    s8* flag = GetConfigUnk37();
    *flag |= 2;
    SMS_ClearUsageTable();

    return;
}

struct ProcCmd CONST_DATA gProcScr_Config1[] = {
    PROC_NAME("E_config"),

    PROC_CALL(AddSkipThread2),
    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(sub_80B1A08),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(sub_80B220C),
    PROC_CALL(sub_8013D80),

    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(sub_8013DA4),

    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_08A2ED88[] = {
    PROC_NAME("E_config"),

    PROC_CALL(AddSkipThread2),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(sub_80B1A08),
    PROC_CALL(sub_80B24AC),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(sub_80B220C),

    PROC_CALL(sub_8013D80),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_08A2EE00[] = {
    PROC_NAME("E_config"),

    PROC_CALL(AddSkipThread2),
    PROC_CALL(BMapDispSuspend),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(sub_80B1A08),
    PROC_CALL(sub_80B24C0),

    PROC_CALL(sub_8013DA4),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_REPEAT(sub_80B220C),

    PROC_CALL(sub_8013D80),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),

    PROC_CALL(EndHelpBox),
    PROC_CALL_2(sub_80B2464),

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};
