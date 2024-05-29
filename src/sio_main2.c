#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmsave.h"
#include "ctc.h"
#include "constants/items.h"
#include "sio.h"
#include "sio_core.h"

struct ProcCmd CONST_DATA ProcScr_HOLD[] = {
    PROC_NAME("HOLD"),
    PROC_REPEAT(SioHold_Loop),
    PROC_END,
};

void SioHold_Loop(struct ProcSioHold * proc)
{
    if (proc->y < proc->y_max && proc->y > proc->y_min)
        DisplayFrozenUiHand(proc->x, proc->y);
}

ProcPtr StartSioHold(ProcPtr parent, int x, int y, int y_max, int y_min)
{
    struct ProcSioHold * proc;
    proc = Proc_Start(ProcScr_HOLD, parent);
    proc->x = x;
    proc->y = y;
    proc->y_max = y_max;
    proc->y_min = y_min;
    return proc;
}

void EndSioHold(void)
{
    Proc_EndEach(ProcScr_HOLD);
}

void sub_804303C(ProcPtr proc, int num)
{
    ((struct Proc *)proc)->y += num;
}

void ClearSioBG(void)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void sub_804309C(void)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void sub_8043100(int msg, int text_idx)
{
    struct Text * text = &gSioTexts[text_idx];

    ClearText(text);

    if (msg < 0)
    {
        PutText(text, TILEMAP_LOCATED(gBG2TilemapBuffer, 1, text_idx * 2 + 0x10));
    }
    else
    {
        Text_DrawString(text, GetStringFromIndex(msg));
        PutText(text, TILEMAP_LOCATED(gBG2TilemapBuffer, 1, text_idx * 2 + 0x10));
        BG_EnableSyncByMask(BG2_SYNC_BIT);
    }
}

void sub_8043164(void)
{
    int i;
    for (i = 0; i < 6; i++)
        InitText(&gUnk_Sio_0203DA88[i], 12);

    for (i = 0; i < 11; i++)
        InitText(&gLinkArenaSt.texts[i], 12);

    for (i = 0; i < 2; i++)
        InitText(&gSioTexts[i], 24);
}

void sub_80431B4(struct Unit * unit)
{
    int i;
    u8 item_list[] = {
        ITEM_SWORD_IRON,
        ITEM_LANCE_IRON,
        ITEM_AXE_IRON,
        ITEM_BOW_IRON,
        ITEM_NONE,
        ITEM_ANIMA_FIRE,
        ITEM_LIGHT_LIGHTNING,
        ITEM_DARK_FLUX,
    };

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
        unit->items[i] = 0;

    for (i = 0; i < 8; i++)
    {
        if (i == 4)
            continue;

        if (unit->ranks[i] == 0)
            continue;

        UnitAddItem(unit, item_list[i] | (0xFF << 8));
    }
}

void SioPlaySoundEffect(int idx)
{
    u16 sfx_list[] = {0x6C, 0x6B, 0x6A, 0x66};
    PlaySoundEffect(sfx_list[idx]);
}

void sub_8043244(void)
{
    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    gSioSaveConfig._unk3_ = true;
    WriteMultiArenaSaveConfig(&gSioSaveConfig);
}

bool sub_8043268(const u16 * list)
{
    if (gKeyStatusPtr->newKeys == 0)
    {
        if (++gUnk_Sio_0203DD4C >= 0x3C)
        {
            gUnknown_0300180C = gUnk_Sio_0203DD4C = 0;
        }
        return false;
    }

    gUnk_Sio_0203DD4C = 0;
    gUnk_Sio_0203DD2C[gUnknown_03001808] = gKeyStatusPtr->newKeys;

    if (gUnk_Sio_0203DD2C[gUnknown_03001808] == list[gUnknown_0300180C])
    {
        gUnknown_0300180C = gUnknown_0300180C + 1;

        if (list[gUnknown_0300180C] == 0xFFFF)
            return true;
    }
    else
    {
        gUnknown_0300180C = 0;
    }

    gUnknown_03001808 = (gUnknown_03001808 + 1) & 0xF;
    return false;
}

/**
 * Maybe some lists for sub_8043268() ?
 */
u16 gSioList_085A93D0[] = {
    DPAD_LEFT, DPAD_LEFT, DPAD_RIGHT, DPAD_RIGHT, L_BUTTON, L_BUTTON, START_BUTTON, -1
};

u16 gSioList_085A93E0[] = {
    DPAD_LEFT, DPAD_LEFT, DPAD_RIGHT, DPAD_RIGHT, L_BUTTON, L_BUTTON, START_BUTTON, -1
};

u16 gSioList_085A93F0[] = {
    DPAD_LEFT, DPAD_LEFT, DPAD_RIGHT, DPAD_RIGHT, L_BUTTON, L_BUTTON, START_BUTTON, -1
};

bool sub_80432F4(void)
{
    return sub_8043268(gSioList_085A93F0);
}

u8 const gUnknown_080D9D5E[] = {1, 2, 4};
u8 const gUnknown_080D9D61[] = {
    0x02, 0x06, 0x0D, 0x13, 0x14, 0xFE, 0x14, 0x13, 0x0D, 0x06, 0x02, 0x00, 0xFF,
};

// Sprite data here is not used until "sio_postbattle.c",
// suggesting that this may have been a particularly large file

// clang-format off

u16 const Sprite_080D9D6E[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x300) + OAM2_LAYER(1) + OAM2_PAL(3),
};

u16 const Sprite_080D9D76[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x304) + OAM2_LAYER(1) + OAM2_PAL(4),
};

u16 const Sprite_080D9D7E[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x308) + OAM2_LAYER(1) + OAM2_PAL(5),
};

u16 const Sprite_080D9D86[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x30C) + OAM2_LAYER(1) + OAM2_PAL(6),
};

u16 const Sprite_080D9D8E[] =
{
    3,
    OAM0_SHAPE_32x8 + OAM0_Y(1), OAM1_SIZE_32x8 + OAM1_X(16), OAM2_CHR(0x360) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_32x16 + OAM0_Y(9), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x344) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_64x32 + OAM0_Y(4), OAM1_SIZE_64x32, OAM2_CHR(0x358) + OAM2_LAYER(1) + OAM2_PAL(7),
};

u16 const Sprite_080D9DA2[] =
{
    5,
    OAM0_SHAPE_32x16 + OAM0_Y(10), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x348) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x380) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_16x16 + OAM0_Y(8), OAM1_SIZE_16x16 + OAM1_X(40), OAM2_CHR(0x384) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_32x16 + OAM0_Y(24), OAM1_SIZE_32x16 + OAM1_X(8), OAM2_CHR(0x386) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_16x16 + OAM0_Y(24), OAM1_SIZE_16x16 + OAM1_X(40), OAM2_CHR(0x38A) + OAM2_LAYER(1) + OAM2_PAL(7),
};

u16 const Sprite_080D9DC2[] =
{
    3,
    OAM0_SHAPE_32x16 + OAM0_Y(12), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x34C) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_32x16 + OAM0_Y(8), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x38C) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_32x16 + OAM0_Y(24), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x390) + OAM2_LAYER(1) + OAM2_PAL(7),
};

u16 const Sprite_080D9DD6[] =
{
    2,
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x350) + OAM2_LAYER(1) + OAM2_PAL(7),
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16 + OAM1_X(16), OAM2_CHR(0x394) + OAM2_LAYER(1) + OAM2_PAL(7),
};

u16 const gUnknown_080D9DE4[] =
{
    2,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x355) + OAM2_LAYER(1) + OAM2_PAL(8),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(16), OAM2_CHR(0x357) + OAM2_LAYER(1) + OAM2_PAL(8),
};

u16 const gUnknown_080D9DF2[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x100) + OAM2_PAL(14),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x104) + OAM2_PAL(14),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(64), OAM2_CHR(0x108) + OAM2_PAL(14),
};

u16 const gUnknown_080D9E06[] =
{
    1,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x100) + OAM2_PAL(14),
};

u16 const gUnknown_080D9E0E[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16 + OAM0_Y(16), OAM1_SIZE_32x16, OAM2_CHR(0x4),
};

// clang-format on
