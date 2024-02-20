#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"

struct Unknown_08A209FC gUnknown_08A209FC[] =
{
    { 0, 0x20, },
    { 0, 0x40, },
    { 0, 0x60, },
};

//! FE8U = 0x080ABC14
void sub_80ABC14(u8 slot, struct SaveMenuProc * proc)
{
    struct PlaySt playSt;
    struct GMapData worldMapData;
    u8 localbuffer[4] __attribute__((unused));

    if (slot < 3)
    {
        if (IsSaveValid(slot))
        {
            int chIndex;
            int r2;
            ReadGameSavePlaySt(slot, &playSt);

            r2 = playSt.chapterIndex;
            if (!(playSt.chapterStateBits & PLAY_FLAG_COMPLETE) && (playSt.save_menu_type == 4))
            {
                LoadSavedWMStuff(slot, &worldMapData);
                r2 = sub_80BD224(&worldMapData);
            }

            chIndex = playSt.chapterIndex;
            playSt.chapterIndex = r2;
            proc->unk_37[slot] = sub_8089768(&playSt);

            playSt.chapterIndex = chIndex;
            proc->unk_48[slot] = playSt.time_saved;

            proc->unk_3a[slot] = 0;

            // BUG?
            if (IsGameNotFirstChapter((struct PlaySt *)(uintptr_t)slot) != 0)
            {
                proc->unk_3a[slot] |= 1;
            }

            if (LoadSavedEid8A(slot) != 0)
            {
                proc->unk_3a[slot] |= 2;
            }

            if (playSt.chapterStateBits & PLAY_FLAG_COMPLETE)
            {
                proc->unk_3a[slot] |= 4;
            }

            gUnknown_02000940[slot] = playSt.chapterStateBits;
            gUnknown_02000944[slot] = playSt.chapterModeIndex;
            memcpy(&gUnknown_02000948[slot], &playSt.config, 8);
        }
        else
        {
            proc->unk_37[slot] = 0xff;
            proc->unk_3a[slot] = 0;
            proc->unk_48[slot] = 0;

            gUnknown_02000940[slot] = 0;
            gUnknown_02000944[slot] = 0;

            memset(&gUnknown_02000948[slot], 0, 8);
        }
    }
    else if (proc->unk_44 == 0x100)
    {
        if (IsValidSuspendSave(3))
        {
            ReadSuspendSavePlaySt(3, &playSt);
            proc->unk_3f = playSt.gameSaveSlot;
            proc->unk_54 = playSt.time_saved;
        }
        else
        {
            proc->unk_44 = 0xf0;
        }
    }

    return;
}

//! FE8U = 0x080ABD88
void sub_80ABD88(u8 slot)
{
    int i;
#ifndef NONMATCHING
    register u32 r1 asm("r1");
#else
    u32 r1;
#endif

    for (i = 0; i < 3; i++)
    {
        u32 flags = gUnknown_02000940[i] & 0x40 ? 4 : 0;

        if (!gUnknown_02000948[i].controller)
        {
            if (gUnknown_02000944[i] == 1)
            {
                flags = flags | 0x10;
            }

            if (gUnknown_02000944[i] == 2)
            {
                flags = flags | 0x20;
                flags = (u8)flags;
            }

            if (gUnknown_02000944[i] == 3)
            {
                flags = flags | 0x40;
            }
        }
        else
        {
            if (gUnknown_02000944[i] == 3)
            {
                flags = flags | 0x40;
            }
            else
            {
                flags = flags | 0x20;
                flags = (u8)flags;
            }
        }

        if (i != slot)
        {
            flags = flags | 2;
            flags = (u8)flags;
        }
        r1 = 1;
        sub_80895B4(flags | r1, i * 2 + 0x1a);
        sub_80895B4(flags, i * 2 + 0x1b);
    }

    EnablePaletteSync();
    return;
}

extern u16 gUnknown_08A07B0A[];
extern u16 gUnknown_08A07AEA[];
extern u16 gUnknown_08A07C0A[];
extern u16 gUnknown_08A07BEA[];

//! FE8U = 0x080ABE3C
void sub_80ABE3C(int param_1, int param_2)
{
    int r2;
    u16 * r6;
    u16 * r8;
    int r9;
    u16 * ip;
    // permuter
    u16 * pickle = gUnknown_08A07BEA;
    u16 * ketchup = gUnknown_08A07AEA;

    param_1 = (param_1 >> 1) & 0x1f;
    if (param_1 > 0x10)
        param_1 = 0x10 - (param_1 & 0xf);

    for (r2 = 0; r2 < 3; r2++)
    {
        int tmp;
        if (!(gUnknown_02000940[r2] & 0x40))
            continue;

        tmp = (r2 * 0x20 + 0xa0);
        r8 = &gPaletteBuffer[tmp + 0x109];

        if (r2 == param_2)
        {
            ip = ketchup;
            r6 = pickle;
        }
        else
        {
            ip = gUnknown_08A07B0A;
            r6 = gUnknown_08A07C0A;
        }

        for (r9 = 0; r9 < 7; r9++)
        {
            *r8 =
                ((((*ip & 0x1f) * param_1 + (0x10 - param_1) * (*r6 & 0x1f)) >> 4) & 0x1f) +
                ((((*ip & 0x3e0) * param_1 + (0x10 - param_1) * (*r6 & 0x3e0)) >> 4) & 0x3e0) +
                ((((*ip & 0x7c00) * param_1 + (0x10 - param_1) * (*r6 & 0x7c00)) >> 4) & 0x7c00);
            ++r8;
            ++ip;
            ++r6;
        }
    }

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080ABF44
u8 SaveMenuGetValidMenuAmt(u8 endMask, struct SaveMenuProc * proc)
{
    int mask, count = 0;

    for (mask = 1; mask < endMask; mask <<= 1)
    {
        if ((proc->active_options & mask) != 0)
        {
            count++;
        }
    }
    return count;
}

//! FE8U = 0x080ABF74
void sub_80ABF74(u8 param_1)
{
    int r4;
    void * r6;
    int r2;
    int i;
    void * r5;
    s16 z; // by decomp permuter

    if ((z = param_1) & 0x60)
    {
        r6 = (void *)0x06014000;
        r2 = 0xe;
        r4 = 2;
    }
    else if (param_1 & 0x10)
    {
        r6 = (void *)0x06014800;
        r2 = 0xe;
        r4 = 2;
    }

    r5 = (void *)(0x060121C0);
    for (i = 0; i < r4; i++)
    {
        CpuFastCopy(
            r6,
            r5 + i * 0x400,
            r2 * 0x20
        );
        r6 += 0x400;
    }
}

u16 CONST_DATA gTextIds_DifficultyDescription[] =
{
    0x0149, // TODO: msgid "For first-timers.[.][NL]Game rules and[NL]controls will be[NL]explained as you[NL]play.[.]"
    0x014A, // TODO: msgid "For experienced[.][NL]players. No game-[.][NL]play hints will[.][NL]be provided as[NL]you play.[.]"
    0x014B, // TODO: msgid "For players seeking[.][NL]a real challenge.[.][NL]No instructions are[.][NL]given & difficulty[NL]is set to high.[.]"
};

//! FE8U = 0x080ABFE0
void DrawDifficultyModeText(struct DifficultyMenuProc * proc)
{
    const char * str;
    struct Text * th;
    int i;

    for (i = 0; i < 5; i++)
    {
        ClearText(&proc->unk_38[i]);
    }

    th = proc->unk_38;
    str = GetStringFromIndex(gTextIds_DifficultyDescription[proc->current_selection]);

    while (1)
    {
        if (*str == 0x00) // [X]
        {
            return;
        }

        if (*str == 0x01) // [NL]
        {
            th++;
            str++;
            continue;
        }

        str = Text_DrawCharacter(th, str);
    }

    return;
}

//! FE8U = 0x080AC034
void sub_80AC034(struct DifficultyMenuProc * proc)
{
    int i;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 7), 14, 10, 0);

    for (i = 0; i < 5; i++)
    {
        PutText(&proc->unk_38[i], TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 7 + i * 2));
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x080AC078
void DifficultySelect_OnEnd(struct DifficultyMenuProc * proc)
{
    ((struct SaveMenuProc *)(proc->proc_parent))->savedraw->unk_29 = 1;
    return;
}

extern u16 gUnknown_08A25DCC[];    // pal
extern u16 gUnknown_08A268D8[];    // pal
extern u16 Pal_SaveScreenSprits[]; // pal
extern u16 gUnknown_08A295B4[];    // pal
extern u16 Pal_DifficultyMenuObjs[];
extern u8 Img_DifficultyMenuObjs[];

extern u8 gUnknown_08A29558[];

//! FE8U = 0x080AC084
void InitDifficultySelectScreen(struct DifficultyMenuProc * proc)
{
    int i;

    ResetTextFont();
    LoadUiFrameGraphics();
    ResetText();

    for (i = 0; i < 5; i++)
    {
        InitText(&proc->unk_38[i], 14);
    }

    ApplyPalettes(gUnknown_08A25DCC, 8, 8);
    ApplyPalette(gUnknown_08A268D8, 7);

    ApplyPalettes(Pal_SaveScreenSprits, 18, 8);
    ApplyPalette(gUnknown_08A295B4, 2);

    Decompress(Img_DifficultyMenuObjs, (void *)0x06010800);
    ApplyPalettes(Pal_DifficultyMenuObjs, 17, 10);

    EnablePaletteSync();

    ((struct SaveMenuProc *)(proc->proc_parent))->savedraw->unk_29 = 0;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    Decompress(gUnknown_08A29558, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer + 0xd1, gGenericBuffer, 0x1000);

    DrawDifficultyModeText(proc);
    sub_80AC034(proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    proc->sprites_proc = StartDrawDifficultyMenuSprites(proc);
    proc->current_selection = 0;
    proc->sprites_proc->current_selection = 0;
    proc->sprites_proc->unk_2c = gUnknown_08A209FC[proc->current_selection].a;
    proc->sprites_proc->unk_2e = gUnknown_08A209FC[proc->current_selection].b;

    return;
}

//! FE8U = 0x080AC1A8
void DifficultySelect_Init(struct DifficultyMenuProc * proc)
{
    proc->current_selection = 0;
    proc->unk_2c = 0;
    InitDifficultySelectScreen(proc);
    return;
}

//! FE8U = 0x080AC1BC
void sub_80AC1BC(struct DifficultyMenuProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_2c++;

    SetDispEnable(1, 1, 1, 1, 1);

    a = (0x10 - proc->unk_2c);
    b = (a * 0x50 * a) / 256;
    c = 0x50 - b;

    SetWin0Box(0, 0x50 - c, 0xf0, c + 0x50);

    if (proc->unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AC22C
void sub_80AC22C(struct DifficultyMenuProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_2c++;

    a = (0x10 - proc->unk_2c);
    b = (a * 0x50 * a) / 256;
    c = 0x50 - b;

    SetWin0Box(0, c, 0xf0, -0x60 - c);

    if (proc->unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AC288
void DifficultySelect_Loop_KeyHandler(struct DifficultyMenuProc * proc)
{
    s8 hasChanged = 0;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->current_selection == 0)
        {
            proc->current_selection = 2;
        }
        else
        {
            proc->current_selection--;
        }

        hasChanged = 1;
    }
    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->current_selection == 2)
        {
            proc->current_selection = 0;
        }
        else
        {
            proc->current_selection++;
        }

        hasChanged = 1;
    }

    if (hasChanged != 0)
    {
        PlaySoundEffect(0x66);
        proc->sprites_proc->current_selection = proc->current_selection;
        sub_80AC680(proc->sprites_proc, gUnknown_08A209FC[proc->current_selection].a, gUnknown_08A209FC[proc->current_selection].b);
        DrawDifficultyModeText(proc);
        sub_80AC034(proc);
        return;
    }

    if (proc->sprites_proc->flags_1)
    {
        return;
    }

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON))
    {
        proc->unk_2c = 0;
        PlaySoundEffect(0x6a);
        switch (proc->current_selection)
        {
            case 0:
                savemenu_SetDifficultyChoice(0, 0);
                break;

            case 1:
                savemenu_SetDifficultyChoice(1, 0);
                break;

            case 2:
                savemenu_SetDifficultyChoice(2, 0);
                break;
        }

        Proc_Goto(proc, 1);
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        proc->unk_2c = 0;
        PlaySoundEffect(0x6b);
        savemenu_SetDifficultyChoice(3, 0);
        Proc_Goto(proc, 2);
    }

    return;
}

//! FE8U = 0x080AC3DC
void nullsub_64(void)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_NewGameDifficultySelect[] =
{
    PROC_SET_END_CB(DifficultySelect_OnEnd),

    PROC_CALL(DisableAllGfx),
    PROC_YIELD,

    PROC_CALL(DifficultySelect_Init),
    PROC_SLEEP(1),

    PROC_CALL(EnableAllGfx),
    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),

PROC_LABEL(0),
    PROC_REPEAT(DifficultySelect_Loop_KeyHandler),

    // fallthrough

PROC_LABEL(1),
    PROC_SLEEP(10),

    // fallthrough

PROC_LABEL(2),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(nullsub_64),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AC3E0
void NewNewGameDifficultySelect(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_NewGameDifficultySelect, parent);
    return;
}

//! FE8U = 0x080AC3F4
void DrawDifficultySprite_Init(struct DifficultyMenuSpritesProc * proc)
{
    proc->flags_0 = 0;
    proc->flags_1 = 0;

    proc->unk_2a = 0;
    proc->unk_2e = 0;
    proc->unk_2c = 0;

    return;
}

// clang-format off

u16 CONST_DATA gSprite_08A20A98[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x5C) + OAM2_LAYER(1),
};

// clang-format on

//! FE8U = 0x080AC418
void DrawDifficultyMenuCursorMaybe(struct DifficultyMenuSpritesProc * proc)
{
    if (proc->flags_0)
    {
        proc->unk_38 = proc->unk_34 - proc->unk_30;
        proc->unk_3a = proc->unk_36 - proc->unk_32;
        proc->unk_2c = proc->unk_30;
        proc->unk_2e = proc->unk_32;
        proc->unk_3c = 0;
        proc->flags_0 = 0;
        proc->flags_1 = 1;
    }

    if (proc->flags_1)
    {
        proc->unk_3c++;

        if (proc->unk_3c < 4)
        {
            int unk = sub_800B84C(proc->unk_3c, 4, 0);

            proc->unk_2c = proc->unk_30 + DivArm(0x1000, proc->unk_38 * unk);
            proc->unk_2e = proc->unk_32 + DivArm(0x1000, proc->unk_3a * unk);
        }
        else
        {
            proc->unk_2c = proc->unk_34;
            proc->unk_2e = proc->unk_36;
            proc->flags_1 = 0;
        }
    }

    PutSpriteExt(
        4, proc->unk_2c, OAM0_Y(proc->unk_2e + gUnknown_08A20B14[(proc->unk_2a >> 3) & 7]), gSprite_08A20A98, OAM2_PAL(3));

    return;
}

// TODO: Confirm that this is a 3D array
// Seems to be palettes for easy, normal, difficult; active / inactive; size 0x10 each
extern u16 gUnknown_08A29498[0x60];

//! FE8U = 0x080AC4F8
void sub_80AC4F8(u8 frameMaybe, u8 selectedIdx)
{
    int i;
    int palId;
    int color;
    s16 var; // by permuter

    for (i = 0; i < 3; i++)
    {
        if (i == selectedIdx)
        {
            var = i * 0x20;
            PAL_OBJ_COLOR(5 + i * 2, 1) = (gUnknown_08A29498 + var)[1];
        }
        else
            PAL_OBJ_COLOR(6 + i * 2, 1) = (gUnknown_08A29498 + i * 0x20)[0x10 + 1];
    }

    color = (frameMaybe % 0x40) / 4;
    gPaletteBuffer[((5 + 0x10) * 0x10 + 1) + selectedIdx * 0x20] = Pal_08A28088[color];
    EnablePaletteSync();
}

// clang-format off

u16 CONST_DATA gSprite_DifficultyMenuSelectModeBg[] =
{
    2,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x40) + OAM2_LAYER(2),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x48) + OAM2_LAYER(2),
};

u16 CONST_DATA gSprite_DifficultyMenuSelectModeText[] =
{
    3,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x50) + OAM2_LAYER(2),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(48), OAM2_CHR(0x54) + OAM2_LAYER(2),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(80), OAM2_CHR(0x58) + OAM2_LAYER(2),
};

u16 CONST_DATA gSprite_08A20AC2[] =
{
    2,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x40) + OAM2_LAYER(2),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x48) + OAM2_LAYER(2),
};

u16 CONST_DATA gSprite_08A20AD0[] =
{
    3,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(24), OAM2_CHR(0xC0) + OAM2_LAYER(2),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(56), OAM2_CHR(0xC4) + OAM2_LAYER(2),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(88), OAM2_CHR(0xC8) + OAM2_LAYER(2),
};

u16 CONST_DATA gSprite_08A20AE4[] =
{
    2,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0xCA) + OAM2_LAYER(2),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0xCE) + OAM2_LAYER(2),
};

u16 CONST_DATA gSprite_08A20AF2[] =
{
    3,
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x90) + OAM2_LAYER(2),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(48), OAM2_CHR(0x94) + OAM2_LAYER(2),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(80), OAM2_CHR(0x98) + OAM2_LAYER(2),
};

u16 * CONST_DATA gSpriteArray_08A20B08[] =
{
    gSprite_08A20AD0,
    gSprite_08A20AE4,
    gSprite_08A20AF2,
};

u8 CONST_DATA gUnknown_08A20B14[] =
{
    0, 1, 2, 3, 3, 2, 1, 0,
};

// clang-format on

//! FE8U = 0x080AC588
void DrawDifficultySprites_Loop(struct DifficultyMenuSpritesProc * proc)
{
    int i;

    proc->unk_2a++;

    PutSpriteExt(4, 56, 4, gSprite_DifficultyMenuSelectModeBg, OAM2_PAL(2));
    PutSpriteExt(4, 56, 4, gSprite_DifficultyMenuSelectModeText, OAM2_PAL(4));

    for (i = 0; i < 3; i++)
    {
        s16 x = 8; // ?
        s16 y = 48 + i * 32;

        if (i == proc->current_selection)
        {
            PutSpriteExt(4, x, y, gSprite_08A20AC2, OAM2_PAL(5 + (i * 2)));
        }
        else
        {
            PutSpriteExt(4, x, y, gSprite_08A20AC2, OAM2_PAL(6 + (i * 2)));
        }

        PutSpriteExt(4, x, y, gSpriteArray_08A20B08[i], OAM2_PAL(4));
    }

    sub_80AC4F8(proc->unk_2a, proc->current_selection);
    DrawDifficultyMenuCursorMaybe(proc);

    return;
}

//! FE8U = 0x080AC680
void sub_80AC680(struct DifficultyMenuSpritesProc * proc, int param_2, int param_3)
{
    proc->unk_30 = proc->unk_2c;
    proc->unk_32 = proc->unk_2e;
    proc->unk_34 = param_2;
    proc->unk_36 = param_3;
    proc->flags_0 = 1;

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_DrawDifficultyMenuSprites[] =
{
    PROC_CALL(DrawDifficultySprite_Init),
    PROC_YIELD,

    PROC_REPEAT(DrawDifficultySprites_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AC698
ProcPtr StartDrawDifficultyMenuSprites(ProcPtr parent)
{
    return Proc_Start(gProcScr_DrawDifficultyMenuSprites, parent);
}
