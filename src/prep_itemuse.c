#include "global.h"
#include "bmunit.h"
#include "constants/classes.h"
#include "bmitem.h"
#include "constants/items.h"
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
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"

bool CheckInLinkArena(void);

// TODO: Implicit declaration?
int CanUnitUseItemPrepScreen(struct Unit* unit, int item);

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
    struct Text *text = gPrepItemTexts;

    for (i = 0; i < 8; i++)
        ClearText(&text[i]);

    /* HP */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 3),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x4E9)
    );

    if (UnitHasMagicRank(unit)) {
        /* Mag[.] */
        PutDrawText(
            text++,
            TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 5),
            TEXT_COLOR_SYSTEM_GOLD,
            0, 0,
            GetStringFromIndex(0x4FF)
        );
    } else {
        /* Str[.] */
        PutDrawText(
            text++,
            TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 5),
            TEXT_COLOR_SYSTEM_GOLD,
            0, 0,
            GetStringFromIndex(0x4FE)
        );
    }

    /* Skill[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 7),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x4EC)
    );

    /* Spd[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 9),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x4ED)
    );

    /* Luck */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 3),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x4EE)
    );

    /* Def[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 5),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x4EF)
    );

    /* Res[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 7),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x4F0)
    );

    /* Con[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 9),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x4F7)
    );

    str = GetStringFromIndex(unit->pClassData->nameTextId);
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1),
        TEXT_COLOR_SYSTEM_WHITE,
        GetStringTextCenteredPos(0x40, str),
        0, str
    );

    /* LV */
    PutTwoSpecialChar(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 1), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
}

void DrawPrepScreenItemUseStatBars(struct Unit* unit, int mask)
{
    s32 i;
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
        u32 var = 0x100 * i + 0x7000;

        if ((mask >> i) & 1) {
            u32 x = var << 15;
            if (x) { ++x; --x; }
            DrawStatBarGfx(
                x >> 20,
                4,
                TILEMAP_LOCATED(gBG0TilemapBuffer, (i >> 2) * 7 + 0x12, (i & 3) * 2 + 4),
                0x3000, 0x18, stat_pack[i], 0);
        } else {
            u32 x = var << 15;
            if (x) { ++x; --x; }
            DrawStatBarGfx(
                x >> 20,
                4,
                TILEMAP_LOCATED(gBG0TilemapBuffer, (i >> 2) * 7 + 0x12, (i & 3) * 2 + 4),
                0x2000, 0x18, stat_pack[i], 0);
        }
    }

    BG_EnableSyncByMask(1);
}

void DrawPrepScreenItemUseStatValues(struct Unit* unit)
{
    // HP
    PutNumberOrBlank( 
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 3),
        (GetUnitCurrentHp(unit) == UNIT_MHP_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitCurrentHp(unit)
    );

    // POW
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 5),
        (GetUnitPower(unit) == UNIT_POW_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitPower(unit)
    );

    // SKL
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 7),
        (GetUnitSkill(unit) == UNIT_SKL_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitSkill(unit)
    );

    // SPD
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 9),
        (GetUnitSpeed(unit) == UNIT_SPD_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitSpeed(unit)
    );

    // LCK
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 3),
        (GetUnitLuck(unit) == UNIT_LCK_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitLuck(unit)
    );

    // DEF
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 5),
        (GetUnitDefense(unit) == UNIT_DEF_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitDefense(unit)
    );

    // RES
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 7),
        (GetUnitResistance(unit) == UNIT_RES_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitResistance(unit)
    );

    // CON
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 9),
        (UNIT_CON(unit) == UNIT_CON_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        UNIT_CON(unit)
    );

    TileMap_FillRect(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 1),
        1, 1, 0
    );

    // LV
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 1),
        TEXT_COLOR_SYSTEM_BLUE,
        unit->level
    );

    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void DrawPrepScreenItemUseDesc(struct Unit *unit, int slot)
{
    ClearText(&gPrepItemTexts[TEXT_PREPITEM_DESC1]);
    ClearText(&gPrepItemTexts[TEXT_PREPITEM_DESC2]);
    ClearText(&gPrepItemTexts[TEXT_PREPITEM_DESC3]);

    if (slot != -1) {
        u16 item = unit->items[slot];
        int msg = GetItemUseDescId(item);

        struct Text* thlut[3] = {
            &gPrepItemTexts[TEXT_PREPITEM_DESC1],
            &gPrepItemTexts[TEXT_PREPITEM_DESC2],
            &gPrepItemTexts[TEXT_PREPITEM_DESC3]
        };

        if (msg != 0) {
            if (CanUnitUseItemPrepScreen(unit, item)) {
                Text_SetColor(thlut[0], TEXT_COLOR_SYSTEM_WHITE);
                Text_SetColor(thlut[1], TEXT_COLOR_SYSTEM_WHITE);
                Text_SetColor(thlut[2], TEXT_COLOR_SYSTEM_WHITE);
    
                PrintStringToTexts(thlut, GetStringFromIndex(msg), TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 12), 3);
            } else {
                Text_SetColor(thlut[0], TEXT_COLOR_SYSTEM_GRAY);
                Text_SetColor(thlut[1], TEXT_COLOR_SYSTEM_GRAY);
                Text_SetColor(thlut[2], TEXT_COLOR_SYSTEM_GRAY);
    
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

void PrepItemUse_OnInit(struct ProcPrepItemUse * proc)
{
    proc->slot = 0;
    proc->slot_rtext = 0xFF;
}

void PrepItemUse_InitDisplay(struct ProcPrepItemUse *proc)
{
    int i;
    const char *str;

    struct Text *texts;
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

    ResetText();
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    SetupMapSpritesPalettes();

    BG_SetPosition(BG_0, 0,0);
    BG_SetPosition(BG_1, 0,0);
    BG_SetPosition(BG_2, 0,0);

    LoadHelpBoxGfx(OBJ_VRAM1, -1);
    LoadIconPalettes(4);
    RestartMuralBackground();

    for (i = 0; i < 5; i++)
        InitTextDb(&gPrepItemTexts[0xF + i], 7);

    for (i = 0; i < 8; i++)
        InitText(&gPrepItemTexts[TEXT_PREPITEM_HP + i], 3);

    texts = gPrepItemTexts;

    InitText(&texts[TEXT_PREPITEM_CLASS], 8);
    InitText(&texts[25], 15);
    InitText(&texts[26], 15);
    InitText(&texts[29], 15);
    InitText(&texts[27], 14);
    InitText(&texts[28], 8);

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

    StartSysBrownBox(0xD, 0xE00, 0xF, 0xC00, 0, proc);
    EnableSysBrownBox(0, -0x28, -1, 1);

    str = GetStringFromIndex(proc->unit->pCharacterData->nameTextId);
    PutDrawText(
        0, gBG0TilemapBuffer, 
        TEXT_COLOR_SYSTEM_WHITE, 
        (0x30 - GetStringTextLen(str))/2,
        6, str
    );

    /* Some hand obj API */
    StartUiCursorHand(proc);
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    StartParallelWorker(PrepItemUseParallel_UpdateSMS, proc);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0x68, 0x5E, 0xF0, 0x92);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(3, 0, 0, 8);
    SetBlendTargetA(0,0,0,1,0);
    StartGreenText(proc);
    StartHelpPromptSprite(0xC0, 0x90, 9, proc);
    DrawPrepScreenItemUseDesc(proc->unit, proc->slot);

    DrawPrepScreenItems(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
        &texts[15],
        proc->unit, 1
    );

    ShowSysHandCursor(
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
            SetUiCursorHandConfig(0, 0x10, 0x10 * proc->slot + 72, 0);
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

    ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
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
    EndMuralBackground_();
    EndFaceById(0);
    EndFaceById(1);
}

void PrepItemUseDrawSubBox(void)
{
    struct Text *text = &gPrepItemTexts[27];
    ClearText(text);

    /* Are you sure?[.] */
    PutDrawText(
       text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 13),
        TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(0x585)
    );

    ClearText(text);

    /* Yes[.] */
    PutDrawText(
        text,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 15),
        TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(0x843)
    );

    /* No */
    PutDrawText(
        text,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 15),
        TEXT_COLOR_SYSTEM_WHITE, 0x20, 0,
        GetStringFromIndex(0x844)
    );

    BG_EnableSyncByMask(4);
}

void PrepItemUseClearSubBox(void)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 13), 13, 4, 0);
    BG_EnableSyncByMask(4);
}

void PrepItemUse_ConfirmWindowInit(struct ProcPrepItemUse * proc)
{
    PrepItemUseDrawSubBox();
    ShowSysHandCursor(proc->pos_subbox * 0x20 + 0x94, 0x78, 0, 0x800);
}

void PrepItemUse_ConfirmWindowCtrlLoop(struct ProcPrepItemUse * proc)
{
    int old = proc->pos_subbox;

    PrepItemDrawPopupBox(0x80, 0x64, 0xC, 0x4, 0xA440);

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
        sub_80ACA84(0);
        PrepItemUseClearSubBox();
        PlaySoundEffect(0x6B);
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        PrepItemUseClearSubBox();
        
        if (proc->pos_subbox == POS_L) {
            HideSysHandCursor();
            PlaySoundEffect(0x6A);
            Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXEC_ITEMEFFECT);
            return;
        } else {
            ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
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
        ShowSysHandCursor(proc->pos_subbox * 0x20 + 0x94, 0x78, 0, 0x800);
        PlaySoundEffect(0x67);
    }
}

void PrepItemUse_HandleItemEffect(struct ProcPrepItemUse * proc)
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

void PrepItemUse_ExecPromotionItemUnused(struct ProcPrepItemUse * proc)
{
    EndMuralBackground_();
    ResetText();
    SetupBackgrounds(NULL);
    EndGreenText();

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

    SetBlendConfig(0, 0, 0, 8);
    EndSysBrownBox();
    EndAllParallelWorkers();
    EndFaceById(0);

    sub_80ACA84(0);
    ExecUnitPromotion(proc->unit, CLASS_EPHRAIM_LORD, proc->slot, false);
    gBattleStats.config = 0x110;
    BeginBattleAnimations();
}

void PrepItemUse_ExecPromoDoneUnusedIDLE(struct ProcPrepItemUse * proc)
{
    if (proc->game_lock == GetGameLock())
        Proc_Break(proc);
}

void PrepItemUse_PostPromotion(struct ProcPrepItemUse * proc)
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

void PrepItemUse_ResetBgmAfterPromo(struct ProcPrepItemUse * proc)
{
    Sound_SetSEVolume(0x100);

    if (CheckInLinkArena()) {
        OverrideBgm(0x38);
        return;
    }
    
    if (gGMData.state.bits.state_0) {
        MakeBgmOverridePersist();
        sub_80B9FC0();
        return;
    }

    OverrideBgm(0x34);
}

void sub_809CCE0(void)
{
    CallSomeSoundMaybe(0, 0x100, 0, 0x10, NULL);
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
    PROC_CALL(StartMidFadeToBlack),
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
