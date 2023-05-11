#include "global.h"
#include "bmunit.h"
#include "constants/classes.h"
#include "bmitem.h"
#include "constants/items.h"
#include "bmitemuse.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "branched_promotion.h"
#include "prepscreen.h"

bool CheckInLinkArena(void);

bool PrepItemUseTryMoveHand(struct ProcPrepItemUse *proc)
{
    int slot;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        slot = GetUnitItemCount(proc->unit);

        if (proc->slot > 0) {
            proc->slot = proc->slot - 1;
            PlaySoundEffect(0x66);
            return true;
        }

        if (gKeyStatusPtr->newKeys & DPAD_UP) {
            proc->slot = slot - 1;
            PlaySoundEffect(0x66);
            return true;
        }

        return false;

    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {

        if (proc->slot < (GetUnitItemCount(proc->unit) - 1)) {
            proc->slot = proc->slot + 1;
            PlaySoundEffect(0x66);
            return true;
        }

        if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
            proc->slot = 0;
            PlaySoundEffect(0x66);
            return true;
        }

        return false;
    }

    return false;
}

void DrawPrepScreenItemUseStatLabels(struct Unit *unit)
{
    int i;
    char *str;
    struct TextHandle *text = gPrepItemTexts;

    for (i = 0; i < 8; i++)
        Text_Clear(&text[i]);

    /* HP */
    DrawTextInline(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 3),
        TEXT_COLOR_GOLD,
        0, 0,
        GetStringFromIndex(0x4E9)
    );

    if (UnitHasMagicRank(unit)) {
        /* Mag[.] */
        DrawTextInline(
            text++,
            TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 5),
            TEXT_COLOR_GOLD,
            0, 0,
            GetStringFromIndex(0x4FF)
        );
    } else {
        /* Str[.] */
        DrawTextInline(
            text++,
            TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 5),
            TEXT_COLOR_GOLD,
            0, 0,
            GetStringFromIndex(0x4FE)
        );
    }

    /* Skill[.] */
    DrawTextInline(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 7),
        TEXT_COLOR_GOLD,
        0, 0,
        GetStringFromIndex(0x4EC)
    );

    /* Spd[.] */
    DrawTextInline(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 9),
        TEXT_COLOR_GOLD,
        0, 0,
        GetStringFromIndex(0x4ED)
    );

    /* Luck */
    DrawTextInline(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 3),
        TEXT_COLOR_GOLD,
        0, 0,
        GetStringFromIndex(0x4EE)
    );

    /* Def[.] */
    DrawTextInline(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 5),
        TEXT_COLOR_GOLD,
        0, 0,
        GetStringFromIndex(0x4EF)
    );

    /* Res[.] */
    DrawTextInline(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 7),
        TEXT_COLOR_GOLD,
        0, 0,
        GetStringFromIndex(0x4F0)
    );

    /* Con[.] */
    DrawTextInline(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 9),
        TEXT_COLOR_GOLD,
        0, 0,
        GetStringFromIndex(0x4F7)
    );

    str = GetStringFromIndex(unit->pClassData->nameTextId);
    DrawTextInline(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1),
        TEXT_COLOR_NORMAL,
        GetStringTextCenteredPos(0x40, str),
        0, str
    );

    /* LV */
    DrawSpecialUiStr(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 1), 3, 0x24, 0x25);
}

/* https://decomp.me/scratch/uskyF */
#if NONMATCHING
void DrawPrepScreenItemUseStatBars(struct Unit* unit, int mask)
{
    u32 i;
    int stat_pack[8];
    UnpackUiBarPalette(2);

    stat_pack[0] = GetUnitCurrentHp(unit) * 24 / UNIT_MHP_MAX(unit);
    stat_pack[1] = GetUnitPower(unit) * 24 / UNIT_POW_MAX(unit);
    stat_pack[2] = GetUnitSkill(unit) * 24 / UNIT_SKL_MAX(unit);
    stat_pack[3] = GetUnitSpeed(unit) * 24 / UNIT_SPD_MAX(unit);
    stat_pack[4] = GetUnitLuck(unit) * 24 / UNIT_LCK_MAX(unit);
	stat_pack[5] = GetUnitDefense(unit) * 24 / UNIT_DEF_MAX(unit);
	stat_pack[6] = GetUnitResistance(unit) * 24 / UNIT_RES_MAX(unit);
	stat_pack[7] = UNIT_CON(unit) * 24 / UNIT_CON_MAX(unit);

    for (i = 0; i < 8; i++) {
        if ((mask >> i) & 1) {
            DrawStatBarGfx(
                0x380 + 8 * i,
                4,
                TILEMAP_LOCATED(gBG0TilemapBuffer, (i >> 2) * 7 + 0x12, (i & 3) * 2 + 4),
                0x3000, 0x18, stat_pack[i], 0);
        } else {
            DrawStatBarGfx(
                0x380 + 8 * i,
                4,
                TILEMAP_LOCATED(gBG0TilemapBuffer, (i >> 2) * 7 + 0x12, (i & 3) * 2 + 4),
                0x2000, 0x18, stat_pack[i], 1);
        }
    }

    BG_EnableSyncByMask(1);
}
#else
__attribute__((naked))
void DrawPrepScreenItemUseStatBars(struct Unit* unit, int mask)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r8\n\
        push {r7}\n\
        sub sp, #0x2c\n\
        adds r5, r0, #0\n\
        mov r8, r1\n\
        movs r0, #2\n\
        bl UnpackUiBarPalette\n\
        add r4, sp, #0xc\n\
        adds r0, r5, #0\n\
        bl GetUnitCurrentHp\n\
        adds r2, r0, #0\n\
        lsls r0, r2, #1\n\
        adds r0, r0, r2\n\
        lsls r3, r0, #3\n\
        movs r0, #0xb\n\
        ldrsb r0, [r5, r0]\n\
        movs r1, #0xc0\n\
        ands r0, r1\n\
        cmp r0, #0x80\n\
        beq _0809C0E8\n\
        adds r0, r3, #0\n\
        movs r1, #0x3c\n\
        b _0809C0EC\n\
    _0809C0E8:\n\
        adds r0, r2, #0\n\
        movs r1, #5\n\
    _0809C0EC:\n\
        bl __divsi3\n\
        str r0, [r4]\n\
        adds r0, r5, #0\n\
        bl GetUnitPower\n\
        adds r1, r0, #0\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #3\n\
        ldr r1, [r5, #4]\n\
        ldrb r1, [r1, #0x14]\n\
        lsls r1, r1, #0x18\n\
        asrs r1, r1, #0x18\n\
        bl __divsi3\n\
        str r0, [sp, #0x10]\n\
        adds r0, r5, #0\n\
        bl GetUnitSkill\n\
        adds r1, r0, #0\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #3\n\
        ldr r1, [r5, #4]\n\
        ldrb r1, [r1, #0x15]\n\
        lsls r1, r1, #0x18\n\
        asrs r1, r1, #0x18\n\
        bl __divsi3\n\
        str r0, [sp, #0x14]\n\
        adds r0, r5, #0\n\
        bl GetUnitSpeed\n\
        adds r1, r0, #0\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #3\n\
        ldr r1, [r5, #4]\n\
        ldrb r1, [r1, #0x16]\n\
        lsls r1, r1, #0x18\n\
        asrs r1, r1, #0x18\n\
        bl __divsi3\n\
        str r0, [sp, #0x18]\n\
        adds r0, r5, #0\n\
        bl GetUnitLuck\n\
        adds r1, r0, #0\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #3\n\
        movs r1, #0x1e\n\
        bl __divsi3\n\
        str r0, [sp, #0x1c]\n\
        adds r0, r5, #0\n\
        bl GetUnitDefense\n\
        adds r1, r0, #0\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #3\n\
        ldr r1, [r5, #4]\n\
        ldrb r1, [r1, #0x17]\n\
        lsls r1, r1, #0x18\n\
        asrs r1, r1, #0x18\n\
        bl __divsi3\n\
        str r0, [sp, #0x20]\n\
        adds r0, r5, #0\n\
        bl GetUnitResistance\n\
        adds r1, r0, #0\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #3\n\
        ldr r4, [r5, #4]\n\
        movs r1, #0x18\n\
        ldrsb r1, [r4, r1]\n\
        bl __divsi3\n\
        str r0, [sp, #0x24]\n\
        movs r1, #0x11\n\
        ldrsb r1, [r4, r1]\n\
        ldr r0, [r5]\n\
        ldrb r0, [r0, #0x13]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        adds r1, r1, r0\n\
        movs r0, #0x1a\n\
        ldrsb r0, [r5, r0]\n\
        adds r1, r1, r0\n\
        lsls r0, r1, #1\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #3\n\
        movs r1, #0x19\n\
        ldrsb r1, [r4, r1]\n\
        bl __divsi3\n\
        str r0, [sp, #0x28]\n\
        movs r5, #0\n\
        add r6, sp, #0xc\n\
        movs r7, #0xe0\n\
        lsls r7, r7, #7\n\
    _0809C1BE:\n\
        mov r4, r8\n\
        asrs r4, r5\n\
        movs r0, #1\n\
        ands r4, r0\n\
        cmp r4, #0\n\
        beq _0809C200\n\
        lsls r0, r7, #0xf\n\
        lsrs r0, r0, #0x14\n\
        movs r2, #3\n\
        ands r2, r5\n\
        lsls r2, r2, #6\n\
        adds r2, #0x92\n\
        asrs r3, r5, #2\n\
        lsls r1, r3, #3\n\
        subs r1, r1, r3\n\
        adds r2, r2, r1\n\
        lsls r2, r2, #1\n\
        ldr r1, _0809C1FC  @ gBG0TilemapBuffer\n\
        adds r2, r2, r1\n\
        movs r1, #0x18\n\
        str r1, [sp]\n\
        ldr r1, [r6]\n\
        str r1, [sp, #4]\n\
        movs r1, #0\n\
        str r1, [sp, #8]\n\
        movs r1, #4\n\
        movs r3, #0xc0\n\
        lsls r3, r3, #6\n\
        bl DrawStatBarGfx\n\
        b _0809C22E\n\
        .align 2, 0\n\
    _0809C1FC: .4byte gBG0TilemapBuffer\n\
    _0809C200:\n\
        lsls r0, r7, #0xf\n\
        lsrs r0, r0, #0x14\n\
        movs r2, #3\n\
        ands r2, r5\n\
        lsls r2, r2, #6\n\
        adds r2, #0x92\n\
        asrs r3, r5, #2\n\
        lsls r1, r3, #3\n\
        subs r1, r1, r3\n\
        adds r2, r2, r1\n\
        lsls r2, r2, #1\n\
        ldr r1, _0809C250  @ gBG0TilemapBuffer\n\
        adds r2, r2, r1\n\
        movs r1, #0x18\n\
        str r1, [sp]\n\
        ldr r1, [r6]\n\
        str r1, [sp, #4]\n\
        str r4, [sp, #8]\n\
        movs r1, #4\n\
        movs r3, #0x80\n\
        lsls r3, r3, #6\n\
        bl DrawStatBarGfx\n\
    _0809C22E:\n\
        adds r6, #4\n\
        movs r0, #0x80\n\
        lsls r0, r0, #1\n\
        adds r7, r7, r0\n\
        adds r5, #1\n\
        cmp r5, #7\n\
        ble _0809C1BE\n\
        movs r0, #1\n\
        bl BG_EnableSyncByMask\n\
        add sp, #0x2c\n\
        pop {r3}\n\
        mov r8, r3\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0809C250: .4byte gBG0TilemapBuffer\n\
        .syntax divided\n\
    ");
}
#endif

void DrawPrepScreenItemUseStatValues(struct Unit* unit)
{
    // HP
    DrawDecNumber( 
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 3),
        (GetUnitCurrentHp(unit) == UNIT_MHP_MAX(unit)) 
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        GetUnitCurrentHp(unit)
    );

    // POW
    DrawDecNumber(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 5),
        (GetUnitPower(unit) == UNIT_POW_MAX(unit)) 
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        GetUnitPower(unit)
    );

    // SKL
    DrawDecNumber(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 7),
        (GetUnitSkill(unit) == UNIT_SKL_MAX(unit)) 
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        GetUnitSkill(unit)
    );

    // SPD
    DrawDecNumber(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 9),
        (GetUnitSpeed(unit) == UNIT_SPD_MAX(unit)) 
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        GetUnitSpeed(unit)
    );

    // LCK
    DrawDecNumber(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 3),
        (GetUnitLuck(unit) == UNIT_LCK_MAX(unit)) 
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        GetUnitLuck(unit)
    );

    // DEF
    DrawDecNumber(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 5),
        (GetUnitDefense(unit) == UNIT_DEF_MAX(unit)) 
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        GetUnitDefense(unit)
    );

    // RES
    DrawDecNumber(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 7),
        (GetUnitResistance(unit) == UNIT_RES_MAX(unit)) 
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        GetUnitResistance(unit)
    );

    // CON
    DrawDecNumber(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 9),
        (UNIT_CON(unit) == UNIT_CON_MAX(unit)) 
            ? TEXT_COLOR_GREEN
            : TEXT_COLOR_BLUE,
        UNIT_CON(unit)
    );

    TileMap_FillRect(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 1),
        1, 1, 0
    );

    // LV
    DrawDecNumber(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 1),
        TEXT_COLOR_BLUE,
        unit->level
    );

    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void DrawPrepScreenItemUseDesc(struct Unit *unit, int slot)
{
    Text_Clear(&gPrepItemTexts[TEXT_PREPITEM_DESC1]);
    Text_Clear(&gPrepItemTexts[TEXT_PREPITEM_DESC2]);
    Text_Clear(&gPrepItemTexts[TEXT_PREPITEM_DESC3]);

    if (slot != -1) {
        u16 item = unit->items[slot];
        int msg = GetItemUseDescId(item);

        struct TextHandle* thlut[3] = {
            &gPrepItemTexts[TEXT_PREPITEM_DESC1],
            &gPrepItemTexts[TEXT_PREPITEM_DESC2],
            &gPrepItemTexts[TEXT_PREPITEM_DESC3]
        };

        if (msg != 0) {
            if (CanUnitUseItemPrepScreen(unit, item)) {
                Text_SetColorId(thlut[0], TEXT_COLOR_NORMAL);
                Text_SetColorId(thlut[1], TEXT_COLOR_NORMAL);
                Text_SetColorId(thlut[2], TEXT_COLOR_NORMAL);
    
                PrintStringToTexts(thlut, GetStringFromIndex(msg), TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 12), 3);
            } else {
                Text_SetColorId(thlut[0], TEXT_COLOR_GRAY);
                Text_SetColorId(thlut[1], TEXT_COLOR_GRAY);
                Text_SetColorId(thlut[2], TEXT_COLOR_GRAY);
    
                PrintStringToTexts(thlut, GetStringFromIndex(msg), TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 12), 3);
            }
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PrepItemUseParallel_UpdateSMS(struct ProcPrepItemUse *proc)
{
    PutUnitSpriteForClassId(0, 0x78, 0xA, 0xC800, proc->unit->pClassData->number);
    SyncUnitSpriteSheet();
}

void PrepItemUse_OnInit(struct ProcPrepItemUse *proc)
{
    proc->slot = 0;
    proc->slot_rtext = 0xFF;
}

void PrepItemUse_InitDisplay(struct ProcPrepItemUse *proc)
{
    int i;
    const char *str;

    struct TextHandle *texts;
    struct FaceVramEntry face_config[4] = {
        {0x5800, 0x6},
        {0x6800, 0x7},
        {0x0000, 0x0},
        {0x0000, 0x0}
    };

    gLCDControlBuffer.dispcnt.mode = 0;
    SetupBackgrounds(gBgConfig_ItemUseScreen);
    SetupFaceGfxData(face_config);
    proc->unk34 = 0xFF;

    BG_Fill(BG_GetMapBuffer(BG_0), 0);
    BG_Fill(BG_GetMapBuffer(BG_1), 0);
    BG_Fill(BG_GetMapBuffer(BG_2), 0);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    Font_InitForUIDefault();
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    SetupMapSpritesPalettes();

    BG_SetPosition(BG_0, 0,0);
    BG_SetPosition(BG_1, 0,0);
    BG_SetPosition(BG_2, 0,0);

    LoadHelpBoxGfx(OBJ_VRAM1, -1);
    LoadIconPalettes(4);
    EndSlidingWallEffectMaybe();

    for (i = 0; i < 5; i++)
        Text_Allocate(&gPrepItemTexts[0xF + i], 7);

    for (i = 0; i < 8; i++)
        Text_Init(&gPrepItemTexts[TEXT_PREPITEM_HP + i], 3);

    texts = gPrepItemTexts;

    Text_Init(&texts[TEXT_PREPITEM_CLASS], 8);
    Text_Init(&texts[25], 15);
    Text_Init(&texts[26], 15);
    Text_Init(&texts[29], 15);
    Text_Init(&texts[27], 14);
    Text_Init(&texts[28], 8);

    DrawPrepScreenItemUseStatLabels(proc->unit);
    DrawPrepScreenItemUseStatValues(proc->unit);
    DrawPrepScreenItemUseStatBars(proc->unit, 0);

    StartFace2(0, GetUnitPortraitId(proc->unit), 0x40, -4, 0x203);
    PutImg_PrepItemUseUnk(0x6000, 0x5);
    PutImg_PrepPopupWindow(0x800, 0xA);

    Decompress(Img_PrepItemUseScreen, (void *)BG_VRAM + 0x440);
    Decompress(Tsa_PrepItemUseScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    StartSmallBrownNameBoxes(0xD, 0xE00, 0xF, 0xC00, 0, proc);
    SmallBrownNameBoxDoSomeConfig(0, -0x28, -1, 1);

    str = GetStringFromIndex(proc->unit->pCharacterData->nameTextId);
    DrawTextInline(
        0, gBG0TilemapBuffer, 
        TEXT_COLOR_NORMAL, 
        (0x30 - GetStringTextWidth(str))/2,
        6, str
    );

    /* Some hand obj API */
    sub_80AC9C0(proc);
    ResetPrepScreenHandCursor(proc);
    sub_80AD4A0(0x600, 1);

    StartParallelWorker(PrepItemUseParallel_UpdateSMS, proc);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0x68, 0x5E, 0xF0, 0x92);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetSpecialColorEffectsParameters(3, 0, 0, 8);
    SetBlendTargetA(0,0,0,1,0);
    NewGreenTextColorManager(proc);
    StartHelpPromptSprite(0xC0, 0x90, 9, proc);
    DrawPrepScreenItemUseDesc(proc->unit, proc->slot);

    DrawPrepScreenItems(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
        &texts[15],
        proc->unit, 1
    );

    ShowPrepScreenHandCursor(
        (proc->slot >> 3) * 7 * 0x10 + 0x10,
        (proc->slot & 0x7) * 0x10 + 0x48,
        0xB, 0x800
    );

    UseUnitSprite(GetUnitSMSId(proc->unit));
    ForceSyncUnitSpriteSheet();
}

void PrepItemUse_CtrlLoop(struct ProcPrepItemUse *proc)
{
    u16 item;

    if (proc->slot_rtext != 0xFF) {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->slot_rtext = 0xFF;
            return;
        }
    } else if (gKeyStatusPtr->newKeys & R_BUTTON) {
        item = proc->unit->items[proc->slot];

        if (item != 0) {
            StartItemHelpBox(0x10, 0x48 + proc->slot * 0x10, item);
            proc->slot_rtext = proc->slot;
        }
        return;

    } else if (gKeyStatusPtr->newKeys & A_BUTTON) {

        if (CanUnitUseItemPrepScreen(proc->unit, proc->unit->items[proc->slot]) != false) {
            proc->unk34 = proc->slot;
            sub_80AC9D4(0, 0x10, 0x10 * proc->slot + 72, 0);
            proc->pos_subbox = 1;
            PlaySoundEffect(0x6A);
            Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_CONFIRM);
            return;

        } else {
            PlaySoundEffect(0x6C);
            return;
        }

    } else if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXIT_FADE);
        PlaySoundEffect(0x6B);
        return;
    }

    if (!PrepItemUseTryMoveHand(proc))
        return;

    ShowPrepScreenHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
    DrawPrepScreenItemUseDesc(proc->unit, proc->slot);

    if (proc->slot_rtext != 0xFF) {
        item = proc->unit->items[proc->slot];

        if (item != 0) {
            StartItemHelpBox(0x10, 0x48 + proc->slot * 0x10, item);
            proc->slot_rtext = proc->slot;
        }
    }
}

void ProcPrepItemUse_OnEnd(void)
{
    EndBG3Slider_();
    EndFaceById(0);
    EndFaceById(1);
}

void PrepItemUseDrawSubBox(void)
{
    struct TextHandle *text = &gPrepItemTexts[27];
    Text_Clear(text);

    /* Are you sure?[.] */
    DrawTextInline(
       text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 13),
        TEXT_COLOR_NORMAL, 0, 0,
        GetStringFromIndex(0x585)
    );

    Text_Clear(text);

    /* Yes[.] */
    DrawTextInline(
        text,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 15),
        TEXT_COLOR_NORMAL, 0, 0,
        GetStringFromIndex(0x843)
    );

    /* No */
    DrawTextInline(
        text,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 15),
        TEXT_COLOR_NORMAL, 0x20, 0,
        GetStringFromIndex(0x844)
    );

    BG_EnableSyncByMask(4);
}

void PrepItemUseClearSubBox(void)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 13), 13, 4, 0);
    BG_EnableSyncByMask(4);
}

void PrepItemUse_ConfirmWindowInit(struct ProcPrepItemUse *proc)
{
    PrepItemUseDrawSubBox();
    ShowPrepScreenHandCursor(proc->pos_subbox * 0x20 + 0x94, 0x78, 0, 0x800);
}

void PrepItemUse_ConfirmWindowCtrlLoop(struct ProcPrepItemUse *proc)
{
    int old = proc->pos_subbox;

    PrepItemDrawPopupBox(0x80, 0x64, 0xC, 0x4, 0xA440);

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        ShowPrepScreenHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
        sub_80ACA84(0);
        PrepItemUseClearSubBox();
        PlaySoundEffect(0x6B);
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        PrepItemUseClearSubBox();
        
        if (proc->pos_subbox == POS_L) {
            HidePrepScreenHandCursor();
            PlaySoundEffect(0x6A);
            Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXEC_ITEMEFFECT);
            return;
        } else {
            ShowPrepScreenHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
            PlaySoundEffect(0x6B);
            sub_80ACA84(0);
            Proc_Break(proc);
            return;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
        proc->pos_subbox = POS_L;

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
        proc->pos_subbox = POS_R;

    if (old != proc->pos_subbox) {
        ShowPrepScreenHandCursor(proc->pos_subbox * 0x20 + 0x94, 0x78, 0, 0x800);
        PlaySoundEffect(0x67);
    }
}

void PrepItemUse_HandleItemEffect(struct ProcPrepItemUse *proc)
{
    switch (GetItemIndex(proc->unit->items[proc->slot])) {
    case ITEM_HEAVENSEAL:
    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_MASTERSEAL:
    case ITEM_OCEANSEAL:
    case ITEM_LUNARBRACE:
    case ITEM_SOLARBRACE:
    case ITEM_UNK_C1:
        PlaySoundEffect(0x6A);
        Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXEC_PROMO);
        break;

    case ITEM_JUNAFRUIT:
        Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXEC_JUNA);
        break;

        default:
        break;
    }
}

void PrepItemUse_ExecPromotionItemUnused(struct ProcPrepItemUse *proc)
{
    EndBG3Slider_();
    Font_InitForUIDefault();
    SetupBackgrounds(NULL);
    EndGreenTextColorManager();

    /**
     * Although it is not a bad idea to detect game lock level
     * to trigger banim done, but it also need to take risks for
     * unexpected configuration.
     *
     * So I think this is the reason why such routine is abandoned.
     *
     * BTW, branched-promotion maybe the new requirements introduced
     * later during the game development, and then the developers
     * replaced such routine to branched-promotion handler.
     *
     *          -------- from Mokha's conjecture wwwww
     */
    proc->game_lock = GetGameLock();

    ResetFaces();
    EndHelpPromptSprite();

    SetWinEnable(0, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetSpecialColorEffectsParameters(0, 0, 0, 8);
    EndSmallBrownNameBoxes();
    EndAllParallelWorkers();
    EndFaceById(0);

    sub_80ACA84(0);
    ExecUnitPromotion(proc->unit, CLASS_EPHRAIM_LORD, proc->slot, false);
    gBattleStats.config = 0x110;
    BeginBattleAnimations();
}

void PrepItemUse_ExecPromoDoneUnusedIDLE(struct ProcPrepItemUse *proc)
{
    if (proc->game_lock == GetGameLock())
        Proc_Break(proc);
}

void PrepItemUse_PostPromotion(struct ProcPrepItemUse *proc)
{
    int max = GetUnitItemCount(proc->unit);

    PrepSetLatestCharId(proc->unit->pCharacterData->number);

    if (max == 0) {
        Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_END);
        return;
    }

    if (proc->slot >= max)
        proc->slot--;
    
    Proc_Break(proc);
}

void PrepItemUse_ResetBgmAfterPromo(struct ProcPrepItemUse *proc)
{
    Sound_SetSEVolume(0x100);

    if (CheckInLinkArena()) {
        OverrideBgm(0x38);
        return;
    }
    
    if (gGMData.state & GMAP_STATE_BIT0) {
        MakeBgmOverridePersist();
        sub_80B9FC0();
        return;
    }

    OverrideBgm(0x34);
}

void sub_809CCE0(void)
{
    sub_80029E8(0, 0x100, 0, 0x10, NULL);
}

void StartPrepItemUseScreen(struct Unit *unit, ProcPtr parent)
{
    struct ProcPrepItemUse *proc;
    proc = Proc_StartBlocking(ProcScr_PrepItemUseScreen, parent);
    proc->unit = unit;
}

CONST_DATA struct ProcCmd ProcScr_PrepItemUseScreen[] = {
    PROC_YIELD,

PROC_LABEL(PROC_LABEL_PREPITEMUSE_INIT),
    PROC_CALL(PrepItemUse_OnInit),
    PROC_CALL(PrepItemUse_InitDisplay),
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),

PROC_LABEL(PROC_LABEL_PREPITEMUSE_MAIN),
    PROC_REPEAT(PrepItemUse_CtrlLoop),

PROC_LABEL(PROC_LABEL_PREPITEMUSE_CONFIRM),
    PROC_CALL(PrepItemUse_ConfirmWindowInit),
    PROC_REPEAT(PrepItemUse_ConfirmWindowCtrlLoop),
    PROC_GOTO(PROC_LABEL_PREPITEMUSE_MAIN),

PROC_LABEL(PROC_LABEL_PREPITEMUSE_EXEC_ITEMEFFECT),
    PROC_CALL(PrepItemUse_HandleItemEffect),

    // Default effect
    PROC_START_CHILD_BLOCKING(ProcScr_PrepItemUseBooster),
    PROC_GOTO(PROC_LABEL_PREPITEMUSE_MAIN),

PROC_LABEL(PROC_LABEL_PREPITEMUSE_EXEC_JUNA),
    PROC_START_CHILD_BLOCKING(ProcScr_PrepItemUseJunaFruit),
    PROC_GOTO(PROC_LABEL_PREPITEMUSE_MAIN),

PROC_LABEL(PROC_LABEL_PREPITEMUSE_EXEC_PROMO),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(StartFadeInBlackMedium),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(StartPrepScreenPromotion),
    PROC_SLEEP(0x8),
    PROC_CALL(PrepItemUse_ResetBgmAfterPromo),
    PROC_SLEEP(0x1E),
    PROC_CALL(PrepItemUse_PostPromotion),

    PROC_CALL(PrepItemUse_InitDisplay),
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists),
    PROC_GOTO(PROC_LABEL_PREPITEMUSE_MAIN),

PROC_LABEL(PROC_LABEL_PREPITEMUSE_EXIT_FADE),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),

PROC_LABEL(PROC_LABEL_PREPITEMUSE_END),
    PROC_CALL(ProcPrepItemUse_OnEnd),
    PROC_END
};
