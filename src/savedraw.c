#include "global.h"


#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"

#include "savemenu.h"

#define SAVE_MENU_PARENT(proc) ((struct SaveMenuProc *)(proc->proc_parent))

// clang-format off

u16 CONST_DATA Sprite_08A2051C[] =
{
    4,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x40) + OAM2_LAYER(2),
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32 + OAM1_X(64), OAM2_CHR(0x48) + OAM2_LAYER(2),
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32 + OAM1_X(72) + OAM1_HFLIP, OAM2_CHR(0x48) + OAM2_LAYER(2),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(80) + OAM1_HFLIP, OAM2_CHR(0x40) + OAM2_LAYER(2),
};

u16 CONST_DATA Sprite_08A20536[] =
{
    3,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x49) + OAM2_LAYER(2),
    OAM0_SHAPE_16x32, OAM1_SIZE_16x32 + OAM1_X(64), OAM2_CHR(0x51) + OAM2_LAYER(2),
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32 + OAM1_X(80), OAM2_CHR(0x53) + OAM2_LAYER(2),
};

u16 CONST_DATA Sprite_08A2054A[] =
{
    6,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x40) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x42) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16, OAM2_CHR(0x60) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x62) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16, OAM2_CHR(0x80) + OAM2_LAYER(1),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x82) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A20570[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x5C) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A20578[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1D1) + OAM2_LAYER(2),
};

u16 CONST_DATA Sprite_08A20580[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1F1) + OAM2_LAYER(2),
};

u16 CONST_DATA Sprite_08A20588[] =
{
    1,
    OAM0_SHAPE_32x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x32 + OAM1_AFFINE_ID(3), OAM2_CHR(0xDC) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A20590[] =
{
    2,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_CHR(0x196) + OAM2_LAYER(2),
    OAM0_SHAPE_16x32, OAM1_SIZE_16x32 + OAM1_X(64), OAM2_CHR(0x19E) + OAM2_LAYER(2),
};

u16 CONST_DATA Sprite_08A2059E[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1C0) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205A6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1C1) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205AE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1C2) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205B6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1C3) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205BE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1C4) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205C6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1C5) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205CE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1E0) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205D6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1E1) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205DE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1E2) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205E6[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1E3) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205EE[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1E4) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205F6[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1C6) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A205FE[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1C7) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A20606[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1C8) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A2060E[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1C9) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A20616[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1CA) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A2061E[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1CB) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A20626[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1CC) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A2062E[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1CD) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A20636[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1CE) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A2063E[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1CF) + OAM2_LAYER(1),
};

u16 CONST_DATA Sprite_08A20646[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1D0) + OAM2_LAYER(1),
};

u16 * CONST_DATA SpriteArray_08A20650[] =
{
    Sprite_08A2059E,
    Sprite_08A205A6,
    Sprite_08A205AE,
    Sprite_08A205B6,
    Sprite_08A205BE,
    Sprite_08A205C6,
    Sprite_08A205CE,
    Sprite_08A205D6,
    Sprite_08A205DE,
    Sprite_08A205E6,
    Sprite_08A205EE,
};

u16 * CONST_DATA SpriteArray_08A2067C[] =
{
    Sprite_08A205F6,
    Sprite_08A205FE,
    Sprite_08A20606,
    Sprite_08A2060E,
    Sprite_08A20616,
    Sprite_08A2061E,
    Sprite_08A20626,
    Sprite_08A2062E,
    Sprite_08A20636,
    Sprite_08A2063E,
    Sprite_08A20646,
};

// clang-format on

//! FE8U = 0x080AA7EC
void sub_80AA7EC(struct SaveDrawProc * proc)
{
    int x;
    int y;
    u16 hours;
    u16 minutes;
    u16 seconds;

    struct SaveMenuProc * saveMenuProc = SAVE_MENU_PARENT(proc);

    // FIXME: Can we avoid the shifts? Is this a cast to u8?
    y = (((0x20 - ((saveMenuProc->unk_2f * 0x20) / 220)) << 0x18) + 0x92000000) >> 0x18;

    x = 143;

    if (saveMenuProc->main_sel_bitfile == 1)
    {
        FormatTime(saveMenuProc->total_time, &hours, &minutes, &seconds);
    }
    else
    {
        FormatTime(saveMenuProc->played_time[saveMenuProc->sus_slot], &hours, &minutes, &seconds);
    }

    PutSpriteExt(13, x + 6, y - 14, Sprite_08A20590, OAM2_PAL(2));

    if (hours > 99)
    {
        PutSpriteExt(13, x + 10, y - 8, SpriteArray_08A2067C[(hours / 100)], OAM2_PAL(7));
        hours = hours - ((hours / 100) * 100);
    }

    if (hours > 9)
    {
        PutSpriteExt(13, x + 18, y - 8, SpriteArray_08A2067C[(hours / 10)], OAM2_PAL(7));
    }

    PutSpriteExt(13, x + 26, y - 8, SpriteArray_08A2067C[(hours % 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 34, y - 7, SpriteArray_08A2067C[10], OAM2_PAL(7));
    PutSpriteExt(13, x + 42, y - 8, SpriteArray_08A2067C[(minutes / 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 50, y - 8, SpriteArray_08A2067C[(minutes % 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 58, y + 1, SpriteArray_08A20650[10], OAM2_PAL(7));
    PutSpriteExt(13, x + 66, y, SpriteArray_08A20650[(seconds / 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 74, y, SpriteArray_08A20650[(seconds % 10)], OAM2_PAL(7));

    return;
}

//! FE8U = 0x080AA9D8
void sub_80AA9D8(struct SaveDrawProc * proc)
{
    u16 * ptr;
    int i;
    s16 x;
    u32 unk_40;
    u32 r6;

    proc->unk_3e++;
    proc->unk_40 += 2;

    x = (proc->unk_3e & 0xfff) >> 3;
    unk_40 = (proc->unk_40 / 8) & 0xff;

    ptr = sub_8014E74(0, 1);
    r6 = unk_40;

    for (i = 0; i < 0xA0; i++)
    {
        int v = SIN(r6) / 0x300;
        ptr[i] = (v + x) & 0x1ff;
        r6 += 0xC;
    }

    BG_SetPosition(2, x, unk_40);

    sub_8014EA8();

    return;
}

//! FE8U = 0x080AAA6C
void SaveDraw_OnEnd(void)
{
    sub_8014E3C();
    return;
}

//! FE8U = 0x080AAA78
void SaveDraw_Init(struct SaveDrawProc * proc)
{
    proc->unk_29 = 1;
    proc->unk_2c = 0;
    proc->unk_2e = 0x100;
    proc->unk_3a = 0;
    proc->unk_3b = 40;
    proc->unk_30 = 0;
    proc->unk_32 = 0;

    SetObjAffine(0, 0x100, 0, 0, 0x100);
    SetObjAffine(1, 0x100, 0, 0, 0x100);
    SetObjAffine(2, 0x100, 0, 0, 0x100);
    SetObjAffine(3, 0x100, 0, 0, 0x100);

    proc->unk_2a = 0;
    proc->unk_34 = StartSaveDrawCursor(proc);
    proc->unk_39 = 0;

    if (SAVE_MENU_PARENT(proc)->sus_slot_cur == 0xff)
    {
        SAVE_MENU_PARENT(proc)->approc = NULL;
    }
    else
    {
        SAVE_MENU_PARENT(proc)->approc =
            APProc_Create(gUnknown_08A280A8, 320, SAVE_MENU_PARENT(proc)->sus_slot_cur * 32 + 48, 0x3140, 0, 4);
    }

    proc->unk_3c = SAVE_MENU_PARENT(proc)->sus_slot;
    proc->unk_40 = 0;
    proc->unk_3e = 0;

    sub_8014DA8(EWRAM_ENTRY);
    sub_8014EC4(0, (void *)REG_ADDR_BG2HOFS);
    sub_8014EF4(0);

    sub_80AA9D8(proc);
    gUnknown_03004990->unk_79E = true;

    sub_80AB548();

    return;
}

//! FE8U = 0x080AAB78
void sub_80AAB78(s8 flag, u16 color)
{
    if (flag != 0)
    {
        PAL_OBJ_COLOR(6, 8) = PAL_OBJ_COLOR(9, ((color >> 2) & 0xf));
    }
    else
    {
        PAL_OBJ_COLOR(6, 8) = PAL_OBJ_COLOR(9, 13);
    }

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080AABC4
void sub_80AABC4(ProcPtr unused, int x, int y, u8 spriteIdx, u8 palIdA, u8 palIdB)
{
    PutSpriteExt(4, OAM1_X(x), y, Sprite_08A2051C, OAM2_PAL(palIdA));
    PutSpriteExt(4, OAM1_X(x + 8), y + 8, SpriteArray_08A209B8[spriteIdx], OAM2_PAL(palIdB));
    return;
}

//! FE8U = 0x080AAC40
void sub_80AAC40(ProcPtr unused, int x, int y, u8 spriteIdx, u8 palIdA, u8 palIdB)
{
    PutSpriteExt(4, OAM1_X(x), y, Sprite_08A2051C, OAM2_PAL(palIdA));
    PutSpriteExt(4, OAM1_X(x + 8), y + 8, SpriteArray_08A2099C[spriteIdx], OAM2_PAL(palIdB));
    return;
}

//! FE8U = 0x080AACBC
void sub_80AACBC(struct SaveDrawProc * proc)
{
    if (proc->unk_3c != SAVE_MENU_PARENT(proc)->sus_slot)
    {
        SaveMenuInitSlotPalette(SAVE_MENU_PARENT(proc)->sus_slot);
        proc->unk_3c = SAVE_MENU_PARENT(proc)->sus_slot;
    }

    SaveDrawSetDifficultSlotPalette(proc->unk_2a, proc->unk_3c);

    EnablePaletteSync();

    if (SAVE_MENU_PARENT(proc)->sus_slot_cur != 0xff)
    {
        if (SAVE_MENU_PARENT(proc)->unk_44 != 0x100)
        {
            if (SAVE_MENU_PARENT(proc)->unk_44 < 0x10)
            {
                SAVE_MENU_PARENT(proc)->sus_slot_cur = 0xff;
            }
            else
            {
                // clang-format off
                SetObjAffine(
                    3,
                    Div(+COS(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(-SIN(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(+SIN(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(+COS(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44)
                );
                // clang-format on
            }

            SAVE_MENU_PARENT(proc)->unk_44 -= 16;
        }
    }

    sub_80AA7AC(proc->unk_2a, proc->unk_3c);
    proc->unk_2a++;

    return;
}

extern u16 * SpriteArray_08A209B8[];

//! FE8U = 0x080AADE0
void sub_80AADE0(struct SaveDrawProc * proc)
{
    struct SaveMenuProc * saveMenuProc;
    u8 spriteIdx;

    int y = OAM0_Y(((SAVE_MENU_PARENT(proc)->unk_2f * 48) / 0xdc) + 0x1d0);

    PutSpriteExt(4, 48, y, Sprite_08A2051C, OAM2_PAL(2));

    saveMenuProc = SAVE_MENU_PARENT(proc);

    if (saveMenuProc->unk_46 != 0)
    {
        if (saveMenuProc->extra_sel_bitfile & EXTRA_MENU_OPTION_MAP)
            PutSpriteExt(4, 56, y + 8, SpriteArray_08A209B8[10], OAM2_PAL(4));
        else
            PutSpriteExt(4, 56, y + 8, SpriteArray_08A209B8[8], OAM2_PAL(4));
    }
    else
    {
        spriteIdx = BitfileToIndex(saveMenuProc->main_sel_bitfile);
        PutSpriteExt(4, 56, y + 8, SpriteArray_08A209B8[spriteIdx], OAM2_PAL(4));
    }
}

//! FE8U = 0x080AAE90
void sub_80AAE90(struct SaveDrawProc * proc)
{
    int i;
    u64 tmp; // found by permuter
    int xOffset = SAVE_MENU_PARENT(proc)->unk_2f + SAVE_MENU_PARENT(proc)->unk_46;

    if (xOffset < 220)
    {
        int y = 68 - ((int)((SAVE_MENU_PARENT(proc)->unk_31) * 25) >> 1);
        if (y < 2)
        {
            y = 2;
        }

        for (i = 0; i < SAVE_MENU_PARENT(proc)->unk_31; i++)
        {
            int spriteIdx = BitfileToIndex(SaveMenuGetBitfile(SAVE_MENU_PARENT(proc)->main_options, i));

            if (i == SAVE_MENU_PARENT(proc)->main_select)
            {
                sub_80AABC4(proc, 48 - xOffset, y + i * 25, spriteIdx, 1, 4);
            }
            else
            {
                sub_80AABC4(proc, 48 - xOffset, y + i * 25, spriteIdx, 6, 4);
            }
        }

        if (SAVE_MENU_PARENT(proc)->jump_label == PL_SAVEMENU_MAIN_LOOP)
        {
            tmp = y + (SAVE_MENU_PARENT(proc)->main_select * 25);
            sub_80AB4F4(0, 28, tmp, proc);
        }
    }

    return;
}

//! FE8U = 0x080AAF6C
void sub_80AAF6C(struct SaveDrawProc * proc)
{
    int i;
    int yBase;
    int yMult;
    int spriteIdx;

    u16 tmp = SAVE_MENU_PARENT(proc)->unk_46 - 1;

    if (tmp > 438)
    {
        return;
    }

    if (SAVE_MENU_PARENT(proc)->max_choice == 7)
    {
        yBase = 2;
        yMult = 21;
    }
    else
    {
        yBase = 68 - SAVE_MENU_PARENT(proc)->max_choice * 12;
        if (yBase < 2)
        {
            yBase = 2;
        }
        yMult = 25;
    }

    for (i = 0; i < SAVE_MENU_PARENT(proc)->max_choice; i++)
    {
        spriteIdx = BitfileToIndex(SaveMenuGetBitfile(SAVE_MENU_PARENT(proc)->extra_options, i));

        if (i == SAVE_MENU_PARENT(proc)->extra_select)
        {
            sub_80AAC40(proc, 268 - SAVE_MENU_PARENT(proc)->unk_46, yBase + i * yMult, spriteIdx, 1, 4);
        }
        else
        {
            sub_80AAC40(proc, 268 - SAVE_MENU_PARENT(proc)->unk_46, yBase + i * yMult, spriteIdx, 6, 4);
        }
    }

    if (SAVE_MENU_PARENT(proc)->jump_label == PL_SAVEMENU_10)
        sub_80AB4F4(0, 28, yBase + SAVE_MENU_PARENT(proc)->extra_select * yMult, proc);
}

//! FE8U = 0x080AB05C
void sub_80AB05C(struct SaveDrawProc * proc)
{
    int i;

    if (SAVE_MENU_PARENT(proc)->unk_2f != 0)
    {
        sub_80AA7EC(proc);
        sub_80AADE0(proc);

        for (i = 0; i < 3; i++)
        {
            int y;
            if ((SAVE_MENU_PARENT(proc)->jump_label == PL_SAVEMENU_SLOT_SELECTED) && (SAVE_MENU_PARENT(proc)->sus_slot == i))
            {
                y = 0x100;
            }
            else
            {
                y = 0;
            }

            PutSpriteExt(
                4, OAM1_X(248 - SAVE_MENU_PARENT(proc)->unk_2f), y + 32 + (i * 32), SpriteArray_08A209F0[i],
                OAM2_PAL(i * 2 + 10));
            PutSpriteExt(
                4, OAM1_X(248 - SAVE_MENU_PARENT(proc)->unk_2f), (y + 32 + (i * 32)) + 8, SpriteArray_08A209E4[i],
                OAM2_PAL(i * 2 + 11));
        }

        if (SAVE_MENU_PARENT(proc)->sus_slot_cur != 0xff)
        {
            if (SAVE_MENU_PARENT(proc)->unk_44 != 0x100)
            {
                int unused;
                if (SAVE_MENU_PARENT(proc)->approc != NULL)
                {
                    APProc_Delete(SAVE_MENU_PARENT(proc)->approc);
                    SAVE_MENU_PARENT(proc)->approc = NULL;
                }

                // redundant
                if (SAVE_MENU_PARENT(proc)->main_sel_bitfile & 1)
                    PutSpriteExt(4, 202, SAVE_MENU_PARENT(proc)->sus_slot_cur * 0x20 + 0x1e, Sprite_08A20588, 0x3000);
                else
                    PutSpriteExt(4, 202, SAVE_MENU_PARENT(proc)->sus_slot_cur * 0x20 + 0x1e, Sprite_08A20588, 0x3000);
            }
            else
            {
                if (SAVE_MENU_PARENT(proc)->main_sel_bitfile == 1)
                {
                    APProc_SetParameters(
                        SAVE_MENU_PARENT(proc)->approc, 436 - SAVE_MENU_PARENT(proc)->unk_2f,
                        SAVE_MENU_PARENT(proc)->sus_slot_cur * 32 + 48, 0x3140);
                }
                else
                {
                    APProc_SetParameters(
                        SAVE_MENU_PARENT(proc)->approc, 320, SAVE_MENU_PARENT(proc)->sus_slot_cur * 32 + 48, 0x3140);
                    PutSpriteExt(
                        4, 422 - SAVE_MENU_PARENT(proc)->unk_2f, SAVE_MENU_PARENT(proc)->sus_slot_cur * 32 + 30,
                        Sprite_08A20588, 0x3000);
                }
            }
        }
    }

    if ((SAVE_MENU_PARENT(proc)->jump_label) == PL_SAVEMENU_SAVE_SLOT_SEL || (SAVE_MENU_PARENT(proc)->jump_label) == PL_SAVEMENU_SLOT_SELECTED)
    {
        if (SAVE_MENU_PARENT(proc)->cursor_config != 0)
        {
            PutSpriteExt(4, 44, 128, Sprite_08A20536, OAM2_PAL(2));
            DisplayUiHand(((SAVE_MENU_PARENT(proc)->cursor_config - 1) % 2) * 44 + 52, 136);
            sub_80AB4F4(1, 12, SAVE_MENU_PARENT(proc)->sus_slot * 32 + 32, proc);
        }
        else if (SAVE_MENU_PARENT(proc)->sus_slot != 0xff)
            sub_80AB4F4(1, 12, SAVE_MENU_PARENT(proc)->sus_slot * 32 + 32, proc);

        if (SAVE_MENU_PARENT(proc)->cursor_slot != (u8)-1)
            sub_80AB514(1, SAVE_MENU_PARENT(proc)->cursor_slot * 32 + 32, proc);
    }
}

//! FE8U = 0x080AB2A0
void SaveDraw_Loop_Main(struct SaveDrawProc * proc)
{
    if (proc->unk_29 != 0)
    {
        if (SAVE_MENU_PARENT(proc)->main_sel_bitfile < 0x100)
        {
            if (SAVE_MENU_PARENT(proc)->main_sel_bitfile == 0x20)
                proc->unk_33 = SAVE_MENU_PARENT(proc)->extra_sel_bitfile;
            else
                proc->unk_33 = SAVE_MENU_PARENT(proc)->main_sel_bitfile;
        }

        sub_80AAE90(proc);
        sub_80AAF6C(proc);
        sub_80AB05C(proc);
        sub_80AACBC(proc);
    }

    sub_80AA9D8(proc);
    sub_80AB56C(proc->unk_2a);
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_savedraw[] =
{
    PROC_NAME("savedraw"),
    PROC_MARK(PROC_MARK_C),
    PROC_SET_END_CB(SaveDraw_OnEnd),

    PROC_CALL(SaveDraw_Init),
    PROC_REPEAT(SaveDraw_Loop_Main),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AB300
struct SaveDrawProc * StartSaveDraw(ProcPtr parent)
{
    return Proc_Start(ProcScr_savedraw, parent);
}

//! FE8U = 0x080AB314
void SaveDrawCursor_Init(struct SaveDrawCursorProc * proc)
{
    proc->cursor_en = 0;

    proc->unk_2a = 0;
    proc->unk_2e = 0;
    proc->main_options = 0;
    proc->unk_32 = 0;
    proc->unk_34 = 0;

    proc->unk_37 = 0;
    proc->unk_38 = 0;
    proc->unk_3a = 0;
    proc->sus_slot = 0;
    return;
}

//! FE8U = 0x080AB340
void SaveDrawCursor_Loop(struct SaveDrawCursorProc * proc)
{
    s16 yOam0;
    s16 xOam1;
    u16 xOam1_;

    u8 yOffsetLut[] = {
        0, 1, 2, 3, 3, 2, 1, 0,
    };

    if ((s8)((struct SaveMenuProc *)(proc->proc_parent))->scroll_cnt == 0) {
        return;
    }

    proc->unk_2a++;

    if (proc->sus_slot < 4) {
        proc->sus_slot++;
    }

    if (proc->cursor_en != 0) {
        yOam0 = proc->unk_32;
        xOam1 = proc->unk_2e;

        if (proc->sus_slot < 4) {
            yOam0 = (proc->unk_32 - proc->unk_34) / 2 + proc->unk_34;
            xOam1 = (proc->unk_2e - proc->main_options) / 2 + proc->main_options;
        }

        if (proc->unk_3a == 0) {
            xOam1_ = (xOam1) + 0x9c;
        } else {
            xOam1_ = (xOam1) + 0xb0;
        }

        proc->unk_34 = proc->unk_32;
        proc->main_options = proc->unk_2e;

        if (proc->unk_3a == 0) {
            PutSpriteExt(
                4,
                xOam1 & 0x1FF,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                Sprite_08A20570,
                0x3000
            );

            xOam1 = xOam1_;

            PutSpriteExt(
                4,
                (xOam1 & 0x1FF) | 0x1000,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                Sprite_08A20570,
                0x3000
            );
        } else {
            PutSpriteExt(
                4,
                4,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                Sprite_08A20570,
                0x3000
            );
        }

        proc->sus_slot = 0;
    } else {
        if (proc->sus_slot == 4) {
            proc->cursor_en = 0;
        }
    }

    if (proc->unk_38 != 0) {
        PutSpriteExt(4, 6, proc->unk_37, Sprite_08A20570, 0x3000);
    }

    if (proc->unk_39 != 0) {
        proc->unk_38 = 0;
    }

    proc->cursor_en = 0;
    proc->unk_39 = 1;

    return;
}

//! FE8U = 0x080AB4F4
void sub_80AB4F4(int a, s16 b, s16 c, struct SaveDrawProc * proc)
{
    struct SaveDrawCursorProc* drawCursorProc = proc->unk_34;

    drawCursorProc->unk_32 = c - 12;
    drawCursorProc->unk_2e = b - 2;
    drawCursorProc->cursor_en = 1;
    drawCursorProc->unk_3a = a;
    return;
}

//! FE8U = 0x080AB514
void sub_80AB514(int a, u8 b, struct SaveDrawProc * proc)
{
    struct SaveDrawCursorProc* drawCursorProc = proc->unk_34;

    drawCursorProc->unk_37 = b;
    drawCursorProc->unk_38 = 1;
    drawCursorProc->unk_3a = a;
    drawCursorProc->unk_39 = 0;
    return;
}

struct ProcCmd CONST_DATA gProcScr_SaveDrawCursor[] = {
    PROC_NAME("savedrawcursor"),

    PROC_CALL(SaveDrawCursor_Init),
    PROC_REPEAT(SaveDrawCursor_Loop),

    PROC_END,
};

//! FE8U = 0x080AB534
struct SaveMenuCursorProc* StartSaveDrawCursor(ProcPtr parent)
{
    return Proc_Start(gProcScr_SaveDrawCursor, parent);
}

//! FE8U = 0x080AB548
void sub_80AB548(void) {
    int i;

    for (i = 0; i <= 0x13; i++) {
        gUnknown_020007E0[i].unk_0e = 0;
        gUnknown_020007E0[i].unk_04 = 0xa0;
        gUnknown_020007E0[i].unk_00 = 0xa0;
        gUnknown_020007E0[i].unk_0a = 0;
        gUnknown_020007E0[i].unk_08 = 0;
    }

    return;
}

//! FE8U = 0x080AB56C
void sub_80AB56C(u32 a) {
    int i;
    struct Unknown020007E0* ptr;

    int count = 0;

    for (i = 0, ptr = gUnknown_020007E0; i <= 0x13; i++, ptr++) {
        if (ptr->unk_0e != 0) {

            if (ptr->unk_00 + 0xC0 <= 0xC5F) {

                if (ptr->unk_04 <= 0x3BF) {
                    PutSpriteExt(
                        0xe,
                        ((int)ptr->unk_00 / 12) & 0x1FF,
                        (ptr->unk_04 / 12) & 0xff,
                        Sprite_08A20580,
                        0x3000
                    );
                } else {
                    PutSpriteExt(
                        0xe,
                        ((int)ptr->unk_00 / 12) & 0x1FF,
                        (ptr->unk_04 / 12) & 0xff,
                        Sprite_08A20578,
                        0x3000
                    );
                }
            }

            ptr->unk_00 += ptr->unk_08;
            ptr->unk_04 += ptr->unk_0a;

            if ((a & 3) == 0) {
                ptr->unk_08 += ptr->unk_0c;
                ptr->unk_0a += ptr->unk_0d;
            }

            if ((ptr->unk_00 + 0x5a0 > 0x167F)
                || (ptr->unk_04 < -0x3C0)
                || (ptr->unk_04 > 0xB3F)) {
                ptr->unk_0e = 0;
            } else {
                count++;
            }
        }

    }

    if (count < 0x13) {
        for (ptr = gUnknown_020007E0, i = 0; i <= 0x13; i++, ptr++) {
            if (ptr->unk_0e == 0) {

                if (DivRem(AdvanceGetLCGRNValue(), 0xb) == 0) {
                    ptr->unk_00 = (((DivRem(AdvanceGetLCGRNValue(), 0x11) - 8) * 0x1e)
                        + DivRem(AdvanceGetLCGRNValue(), 0x1f)) * 0xc;
                    ptr->unk_04 = 0x780;
                    ptr->unk_08 = DivRem(AdvanceGetLCGRNValue(), 7) + 6;
                    ptr->unk_0a = -0x18 - DivRem(AdvanceGetLCGRNValue(), 0x19);
                    ptr->unk_0c = DivRem(AdvanceGetLCGRNValue(), 3) + 1;
                    ptr->unk_0d = 0;
                    ptr->unk_0e = 1;
                }

            }
        }
    }

    return;
}

//! FE8U = 0x080AB720
void sub_80AB720(struct SaveDrawProc * proc)
{
    proc->unk_40 = 0;
    proc->unk_3e = 0;

    sub_8014EC4(0, (void *)REG_ADDR_BG2HOFS);
    sub_8014EF4(0);
    sub_80AA9D8(proc);

    gUnknown_03004990->unk_79E = true;

    return;
}

struct ProcCmd CONST_DATA gProcScr_08A206F8[] = {
    PROC_SET_END_CB(sub_8014E3C),
    PROC_SLEEP(0),

    PROC_CALL(sub_80AB720),
    PROC_REPEAT(sub_80AA9D8),

    PROC_END,
};

//! FE8U = 0x080AB760
void sub_80AB760(void* unused) {
    Proc_Start(gProcScr_08A206F8, PROC_TREE_3);
    sub_8014DA8(EWRAM_ENTRY);
    return;
}

//! FE8U = 0x080AB77C
void sub_80AB77C(void) {
    Proc_EndEach(gProcScr_08A206F8);
    SetPrimaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x080AB794
void SaveMenuInitSubBoxText(void)
{
    InitTextFont(
        &gSaveMenuSubBoxFont,
        (void*)BG_VRAM + BGCHR_SAVEMENU_SUBBOX_TEXT * TILE_SIZE_4BPP,
        BGCHR_SAVEMENU_SUBBOX_TEXT,
        BGPAL_SAVEMENU_SUBBOX_TEXT);

    InitText(&gSaveMenuSubBoxText, 10);
}

//! FE8U = 0x080AB7BC
void SaveMenuDrawSubSelBoxExt(int msgId, bool draw_en)
{
    const char * str;

    if (draw_en != 0)
    {
        str = GetStringFromIndex(msgId);

        SetTextFont(&gSaveMenuSubBoxFont);

        ClearText(&gSaveMenuSubBoxText);
        Text_SetCursor(&gSaveMenuSubBoxText, 0);
        Text_SetColor(&gSaveMenuSubBoxText, 0);
        Text_DrawString(&gSaveMenuSubBoxText, str);

        Text_SetCursor(&gSaveMenuSubBoxText, 0x2c);
        Text_DrawString(&gSaveMenuSubBoxText, GetStringFromIndex(0x142)); // TODO: msgid "Cancel"

        PutText(&gSaveMenuSubBoxText, TILEMAP_LOCATED(gBG1TilemapBuffer, 7, 17));
    }
    else
    {
        TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 7, 17), 0xb, 1, 0);
    }
    BG_EnableSyncByMask(2);
}

int CONST_DATA SaveMenuSubSelBoxTexts[] = {
    0x0000, // ""
    0x0143, // "Start[.]"
    0x0144, // "Copy"
    0x0140, // "Erase[.]"
    0x0143, // "Start[.]"
    0x0143, // "Start[.]"
    0x0145, // "Save"
};

//! FE8U = 0x080AB83C
void SaveMenuDrawSubSelBox(struct SaveMenuProc * proc, s8 flag)
{
    SaveMenuDrawSubSelBoxExt(SaveMenuSubSelBoxTexts[BitfileToIndex(proc->main_sel_bitfile)], flag);
    if (flag == 0)
        proc->cursor_config = 0;
}

//! FE8U = 0x080AB874
void AddMainMenuOption(struct SaveMenuProc * proc, int option) {
    proc->main_options |= option;
    proc->unk_31++;
    return;
}

//! FE8U = 0x080AB888
void AddExtraMenuOption(struct SaveMenuProc * proc, int option) {
    proc->extra_options |= option;
    proc->max_choice++;
    return;
}

//! FE8U = 0x080AB89C
void InitSaveMenuChoice(struct SaveMenuProc * proc)
{
    int i;

    int count = 0;

    proc->unk_31 = 0;
    proc->main_options = 0;

    if (proc->unk_44 == 0x100)
        AddMainMenuOption(proc, MAIN_MENU_OPTION_RESUME);

    for (i = 0; i < 3; i++)
        if (proc->chapter_idx[i] != (u8)-1)
            count++;

    if (count > 0)
    {
        AddMainMenuOption(proc, MAIN_MENU_OPTION_RESTART);

        if (count < 3)
            AddMainMenuOption(proc, MAIN_MENU_OPTION_COPY);
        AddMainMenuOption(proc, MAIN_MENU_OPTION_ERASE);
    }

    if (count < 3)
        AddMainMenuOption(proc, MAIN_MENU_OPTION_NEW_GAME);

    proc->extra_options = 0;
    proc->max_choice = 0;

    if (IsExtraLinkArenaEnabled(0) != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_LINK_ARENA);

    if (IsExtraSoundRoomEnabled() != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_SOUND_ROOM);

    if (IsExtraSupportViewerEnabled() != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_SUPPORT);

    if (IsExtraFreeMapEnabled() != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_MAP);

    if (IsExtraBonusClaimEnabled() != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_BONUS_CLAIM);

    if (proc->extra_options != 0)
    {
        proc->main_options |= MAIN_MENU_OPTION_EXTRAS;
        proc->unk_31++;
    }
}

//! FE8U = 0x080AB98C
u8 SaveMenuModifySaveSlot(u8 slot, bool valid, s8 position)
{
    u8 i;
    if (position > 0)
    {
        /* up */
        for (i = 0; i < 3; i++)
        {
            if ((IsSaveValid(slot) == valid))
                return slot;

            if (slot == 2)
                slot = 0;
            else
                slot++;
        }
    }
    else
    {
        /* down */
        for (i = 0; i < 3; i++)
        {
            if ((IsSaveValid(slot) == valid))
                return slot;

            if (slot == 0)
                slot = 2;
            else
                slot--;
        }
    }
    return -1;
}

//! FE8U = 0x080AB9FC
bool SaveMenuTryMoveSaveSlotCursor(struct SaveMenuProc * proc, s8 position)
{
    s8 flag = 0;

    u8 previous = proc->sus_slot;

    switch (proc->main_sel_bitfile) {
    case MAIN_MENU_OPTION_7:
        flag = 1;
        break;

    case MAIN_MENU_OPTION_COPY:
        if (proc->cursor_slot == (u8)-1)
            flag = 1;

        break;

    case MAIN_MENU_OPTION_RESTART:
    case MAIN_MENU_OPTION_ERASE:
        flag = 1;
        break;

    case MAIN_MENU_OPTION_NEW_GAME:
        break;

    case MAIN_MENU_OPTION_RESUME:
        return 0;
    }

    if (position >= 1)
    {
        /* up */
        if (proc->sus_slot == 2)
            proc->sus_slot = 0;
        else
            proc->sus_slot++;
    }
    else
    {
        /* down */
        if (proc->sus_slot == 0)
            proc->sus_slot = 2;
        else
            proc->sus_slot--;
    }

    if (proc->main_sel_bitfile == MAIN_MENU_OPTION_INVALID)
        return true;

    proc->sus_slot = SaveMenuModifySaveSlot(proc->sus_slot, flag, position);
    if (previous == proc->sus_slot)
        return false;

    return true;
}

bool SaveMenuHasOptions(struct SaveMenuProc * proc)
{
    if ((proc->main_sel_bitfile & proc->main_options) != 0)
        return true;

    return false;
}

void SqMask_Loop(struct SqMaskProc * proc)
{
    proc->unk_29 += proc->unk_2b;

    SetWinEnable(0, 1, 0);

    if (proc->unk_2a >= 1) {
        SetWin1Box(proc->unk_29 * 3, proc->unk_29 * 2, -0x10 - (proc->unk_29 * 3), -0x60 - (proc->unk_29 * 2));
    } else {
        SetWin1Box(0x78 - (proc->unk_29 * 3), 0x50 - (proc->unk_29 * 2), proc->unk_29 * 3 + 0x78, proc->unk_29 * 2 + 0x50);
    }

    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    if (proc->unk_29 > 0x27) {
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_SqMask[] = {
    PROC_NAME("SqMask"),
    PROC_SLEEP(1),

    PROC_REPEAT(SqMask_Loop),

    PROC_END,
};

//! FE8U = 0x080ABBB0
void StartSqMask(struct SaveMenuProc * parent, int b, int c)
{
    u8 castB = b;
    u8 castC = c;

    struct SqMaskProc* proc = Proc_StartBlocking(gProcScr_SqMask, parent);
    proc->unk_2a = castB;
    proc->unk_2b = castC;

    proc->unk_29 = 0;

    return;
}

//! FE8U = 0x080ABBE4
void SaveBgUp_Loop(void)
{
    RegisterDataMove(gBG2TilemapBuffer, (void*)0x06007000, 0x800);
    return;
}

struct ProcCmd CONST_DATA gProcScr_SaveBgUp[] = {
    PROC_NAME("SaveBgUp"),
    PROC_SLEEP(1),

    PROC_REPEAT(SaveBgUp_Loop),

    PROC_END,
};

//! FE8U = 0x080ABC00
ProcPtr StartSaveBgUp(ProcPtr parent)
{
    return Proc_Start(gProcScr_SaveBgUp, parent);
}
