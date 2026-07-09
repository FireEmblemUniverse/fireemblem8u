#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "hardware.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "constants/video-global.h"
#include "constants/classes.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmsave.h"
#include "bm.h"
#include "bmmind.h"
#include "bmio.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmitem.h"
#include "prepscreen.h"

void EndBanimTerrain(void *);
void InitBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

void ChangeClassDescription(u32 msg) {
    SetInitTalkTextFont();
    ClearTalkText();
    StartTalkMsg(2, 0xF, msg);
    SetTalkPrintColor(0);
    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);
    SetTalkFlag(TALK_FLAG_NOFAST);
    SetTalkFlag(TALK_FLAG_SILENT);
    SetTalkPrintDelay(4);
}

void LoadClassReelFontPalette(struct ProcPromoSel *proc, int class_id) {
    int i;
    s8 str[20];
    const struct ClassData *class;
    u8 _pad_[0xC];
    u16 jid = class_id;

    proc->u44 = 0;
    proc->u46 = 0;
    proc->u47 = 0x78;
    class = GetClassData(jid);
    GetStringFromIndexInBuffer(class->nameTextId, str);

    for (i = 0; i < 20 /* sizeof(str) */ && str[i] != '\0'; i++) {
        struct ClassDisplayFont *font = GetClassDisplayFontInfo(str[i]);
        if (font)
            proc->u46 += font->width - font->xBase;
        else
            proc->u46 += 4;
    }

    Decompress(&Img_ClassReelFont, OBJ_VRAM0 + 0x1000);
    ApplyPalettes(Pal_ClassReelFont, 0x14, 0x2);
}

void LoadClassNameInClassReelFont(struct ProcPromoSel *proc) {
    s8 str[0x20];
    s32 index;
    u8 idx = proc->main_select;
    u16 classNum = proc->jid[idx];
    u32 xOffs = 0x74;
    const struct ClassData *class = GetClassData(classNum);
    GetStringFromIndexInBuffer(class->nameTextId, str);
    for (index = 0; index < 0x14 && str[index] != '\0'; index++) {
        struct ClassDisplayFont *font = GetClassDisplayFontInfo(str[index]);
        if (font) {
            if (font->a) {
                PutSpriteExt(4, xOffs - font->xBase - 2, font->yBase + 6, font->a, 0x81 << 7);
                xOffs += font->width - font->xBase;
            }
        } else {
            xOffs += 4;
        }
    }

    if (proc->u44 < 0xff)
        proc->u44++;
}

void ClassChgLoadEfxTerrain(void)
{
    EndEfxAnimeDrvProc();
    EndEkrUnitMainMini(&gUnk_81);
    EndBanimTerrain(&gEkrbattle_9);
}

void ClassChgLoadUI(void)
{
    u8 *src = Img_ClassChangeSelectUi;
    u32 off = GetBackgroundTileDataOffset(BG_2);
    Decompress(src, (void *)VRAM + 0x3000 + off);
    RegisterTsaWithOffset(gBG2TilemapBuffer, Tsa_ClassChangeSelectUi, TILEREF(0x180, BGPAL_TEXT_DEFAULT) + 0x1000);
}

void ClassChgSelDrawPidName(struct ProcPromoSel *proc) {
    u8 _pad_[0x16];
    const struct ClassData *class;
    char *string;

    DrawUiFrame(gBG2TilemapBuffer, 2, 1, 10, 6, 0, 1);
    SetTextFontGlyphs(0);
    SetTextFont(0);

    PutDrawText(
        NULL,
        TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 2),
        TEXT_COLOR_SYSTEM_WHITE, 0, 0x8,
        GetStringFromIndex(GetClassData(proc->jid[0])->nameTextId)
    );

    PutDrawText(
        NULL,
        TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 4),
        TEXT_COLOR_SYSTEM_WHITE, 0, 0x8,
        GetStringFromIndex(GetClassData(proc->jid[1])->nameTextId)
    );
}

bool Check3rdTraineeEnabled(void)
{
    struct GlobalSaveInfo info;
    u8 unlock = ReadGlobalSaveInfo(&info);
    if (!unlock) {
        InitGlobalSaveInfodata();
        ReadGlobalSaveInfo(&info);
    }

    /* 3rd trainee class can only get access after both Eirka and ephyram played through */
    if (info.Eirk_mode_easy || info.Eirk_mode_norm || info.Eirk_mode_hard)
        if (info.Ephy_mode_easy || info.Ephy_mode_norm || info.Ephy_mode_hard)
            return true;

    return false;
}

struct TsaData {
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};

/** todo
 * https://decomp.me/scratch/BnY8k
 */
void RegisterTsaWithOffset(u16 *_dst, u16 *_src, u32 offset) {
    s16 i, j;
    s16 jrange;
    u16 *src;
    u16 *dst;
    u32 word;
    u8 mask;
    struct TsaData *b = (void *)_src;
    u16 add = offset;
    src = b->longBuffer;
    mask = 0xff;
    word = *((u32*)b);
    jrange = b->a;
    i = (word >> 8) & mask;
    while (i > 0xc) {
        j = jrange;
        dst = _dst + i * 32;
        while (j >= 0) {
            *dst++ = (*src++) + add;
            j--;
        }
        i--;
    }
}

ProcPtr StartPromoClassSelect(ProcPtr parent)
{
    return Proc_StartBlocking(ProcScr_PromoSelect, parent);
}

void Make6C_PromotionMenuSelect(struct ProcPromoSel* proc) {
    struct ProcPromoMain *parent = proc->proc_parent;
    struct ProcPromoHandler *grandparent;
    struct Unit *unit;
    int i, pid;

    parent->stat = PROMO_MAIN_STAT_2;
    proc->pid = parent->pid;
    proc->u50 = 9;
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    ClassChgSel_StartClassBattleSprite(0, -1, 0xfb * 2, 0x58, 6);
    ClassChgLoadUI();
    ClassChgSel_SetupBattleTerrain(proc->u50, 0x8c * 2, 0x68);

    proc->sprite[0] = 0;
    proc->sprite[1] = 0;
    proc->sprite[2] = 0;

    for (i = 1; i < 0x40; i++) {
        u16 classFromSwitch;

        u16 weapon;
        s32 j;
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number !=  proc->pid)
            continue;

        pid = unit->pClassData->number;
        weapon = GetUnitEquippedWeapon(unit);

        for (j = 0; j < 2; j++) {
            proc->jid[j] = gPromoJidLut[pid][j];
            proc->use_wpn[j] = LoadClassBattleSprite(&proc->sprite[j], gPromoJidLut[pid][j], weapon);
            proc->msg_desc[j] = GetClassData(gPromoJidLut[pid][j])->descTextId;
        }

        proc->weapon = weapon;

        if (Check3rdTraineeEnabled()) {
            pid = unit->pClassData->number;
            switch (pid) {
            case CLASS_JOURNEYMAN:
                proc->jid[2] = CLASS_JOURNEYMAN_T1;
                proc->use_wpn[2] = LoadClassBattleSprite(&proc->sprite[2], CLASS_JOURNEYMAN_T1, weapon);
                proc->msg_desc[2] = GetClassData(CLASS_JOURNEYMAN_T1)->descTextId;
                break;

            case CLASS_PUPIL:
                proc->jid[2] = CLASS_PUPIL_T1;
                proc->use_wpn[2] = LoadClassBattleSprite(&proc->sprite[2], CLASS_PUPIL_T1, weapon);
                proc->msg_desc[2] = GetClassData(CLASS_PUPIL_T1)->descTextId;
                break;

            case CLASS_RECRUIT:
                proc->jid[2] = CLASS_RECRUIT_T1;
                proc->use_wpn[2] = LoadClassBattleSprite(&proc->sprite[2], CLASS_RECRUIT_T1, weapon);
                proc->msg_desc[2] = GetClassData(CLASS_RECRUIT_T1)->descTextId;
                break;
            }
        }
        break;
    }

    if (proc->sprite[0] == 0 && proc->sprite[1] == 0) {
        proc->sprite[1] = 0;
        proc->sprite[0] = 0;
    }

    proc->stat = 1;
    proc->main_select = 0;
    LoadClassReelFontPalette(proc, pid);
    LoadClassNameInClassReelFont(proc);
    LoadObjUIGfx();

    proc->menu_proc = NewClassChgMenuSelect(proc);

    grandparent = parent->proc_parent;
    if (grandparent->bmtype == PROMO_HANDLER_TYPE_BM) {
        RestartMuralBackground();
        BG_EnableSyncByMask(0xf);
    }
}

void ClassChgSel_InitDescAndBg(struct ProcPromoSel *proc) {
    u16 tmp;

    ResetTextFont();
    ResetText();
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    InitTalk(0x100, 2, 0);
    ChangeClassDescription(proc->msg_desc[proc->main_select]);
    SetTalkPrintDelay(-1);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    tmp = REG_BG0CNT;
    tmp &= 0xFFFC;
    REG_BG0CNT = tmp + 1;
    tmp = REG_BG1CNT;
    tmp &= 0xFFFC;
    REG_BG1CNT = tmp + 1;
    tmp = REG_BG2CNT;
    tmp &= 0xFFFC;
    REG_BG2CNT = tmp + 1;
    tmp = REG_BG3CNT;
    tmp &= 0xFFFC;
    REG_BG3CNT = tmp + 1;
}

void LoadBattleSpritesForBranchScreen(struct ProcPromoSel *proc) {
    u32 a;
    u8 b;
    struct ProcPromoSel *p2;
    struct ProcPromoSel *c2;
    struct Anim *anim1;
    struct Anim *anim2;
    struct Unit copied_unit;
    void *tmp;
    u16 chara_pal;
    anim1 = gUnk_81.anim1;
    anim2 = gUnk_81.anim2;

    p2 = (void *)gEkrbattle_9.proc14;
    c2 = (void *)gEkrbattle_9.proc18;

    a = proc->stat;
    tmp = &gUnk_81;

    if (a == 1) {
        u16 _pid, _jid;
        s16 i;
        struct Unit *unit;
        const struct BattleAnimDef * battle_anim_ptr;
        u32 battle_anim_id;
        u16 ret;
        if ((s16) p2->sprite[0] <= 0x117) {
            p2->sprite[0] += 12;
            c2->sprite[0] += 12;
            anim1->xPosition += 12;
            anim2->xPosition = anim1->xPosition;
        } else {
            proc->stat = 2;
        }

        if (proc->stat == 2) {
            EndEfxAnimeDrvProc();
            EndEkrUnitMainMini(&gUnk_81);
            _pid = proc->pid - 1;
            _jid = proc->jid[proc->main_select];
            chara_pal = -1;
            unit = GetUnitFromCharId(proc->pid);
            copied_unit = *unit;
            copied_unit.pClassData = GetClassData(proc->jid[proc->main_select]);
            battle_anim_ptr = copied_unit.pClassData->pBattleAnimDef;
            ret = GetBattleAnimationId(
                &copied_unit,
                battle_anim_ptr,
                (u16) GetUnitEquippedWeapon(&copied_unit),
                &battle_anim_id);
            for (i = 0; i <= 6; i++) {
                if (gAnimCharaPalConfig[(s16)_pid][i] == (s16) _jid) {
                    chara_pal = gAnimCharaPalIt[(s16)_pid][i] - 1;
                    break;
                }
            }
            ClassChgSel_StartClassBattleSprite((s16) ret, (s16) chara_pal, (s16) (p2->sprite[0] + 0x28), 0x58, 6);
            EndBanimTerrain(&gEkrbattle_9);
            ClassChgSel_SetupBattleTerrain(proc->u50, p2->sprite[0], p2->msg_desc[1]);
        } else {
            goto D1AC;
        }
    }
    ++proc; --proc;
    b = proc->stat;
    tmp = &gUnk_81;
    if (b == 2) {
        if ((s16) p2->sprite[0] > 0x82) {
#ifdef NONMATCHING
            u16 off = 12;
#else
            register u16 off asm("r1") = 12;
#endif // NONMATCHING
            p2->sprite[0] -= off;
            c2->sprite[0] -= off;
            anim1->xPosition -= off;
            anim2->xPosition = anim1->xPosition;
        } else {
            proc->stat = 0;
        }
    }
D1AC:
    if ((u8) IsMainMiniAnimRoundEnd(tmp)) {
        ApplyMainMiniAnimHitEffect(tmp);
    }
    LoadClassNameInClassReelFont(proc);
    return;
}

void ClassChgSel_OnEndCleanupBm(struct ProcPromoSel *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    struct ProcPromoHandler *gparent = parent->proc_parent;
    switch (gparent->bmtype) {
    case PROMO_HANDLER_TYPE_TRANINEE:
        return;
    case PROMO_HANDLER_TYPE_BM:
        Proc_End(proc);
        Proc_End(parent);
        Proc_End(gparent);
        EndEkrUnitMainMini(&gUnk_81);
        EndBanimTerrain(&gEkrbattle_9);
        EndEfxAnimeDrvProc();
    }
}

void PrepClassChgOnCancel(struct ProcPromoSel *proc)
{
    struct ProcPromoMain *parent;
    struct ProcPromoHandler *gparent;
    struct ProcPrepItemUse *ggparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    if (gparent->bmtype == PROMO_HANDLER_TYPE_PREP) {
        Proc_End(proc);
        Proc_End(parent);
        Proc_End(gparent);
        EndEkrUnitMainMini(&gUnk_81);
        EndBanimTerrain(&gEkrbattle_9);
        EndEfxAnimeDrvProc();
        gActionData.unitActionType = 0;
        Proc_Goto(ggparent, PROC_LABEL_PREPITEMUSE_CONFIRM);
        BMapDispResume();
        RefreshBMapGraphics();
        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        EndAllMus();
        StartMu(gActiveUnit);
    }
}

void ClassChgSel_RoutePreEndByType(struct ProcPromoSel *proc)
{
    struct ProcPromoMain *parent;
    struct ProcPromoHandler *gparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    if (gparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE)
        Proc_Goto(proc, 4);
    else if (gparent->bmtype == PROMO_HANDLER_TYPE_BM)
        Proc_Break(proc);
    else if (gparent->bmtype == PROMO_HANDLER_TYPE_PREP)
        Proc_Goto(proc, 4);
}

void ClassChgSel_RouteOnEndByType(struct ProcPromoSel *proc)
{
    struct ProcPromoMain *parent;
    struct ProcPromoHandler *gparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;

    if (gparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE)
        Proc_Goto(proc, 5);
    else if (gparent->bmtype == PROMO_HANDLER_TYPE_BM)
        Proc_Goto(proc, 5);
    else if (gparent->bmtype == PROMO_HANDLER_TYPE_PREP)
        Proc_Break(proc);
}

bool StartAndWaitPromoSelect(struct ProcPromoMain *proc)
{
    struct ProcPromoMain *_proc = (struct ProcPromoMain *)proc;
    switch (_proc->stat) {
    case PROMO_MAIN_STAT_SELECTION:
        return false;

    case PROMO_MAIN_STAT_TRAINEE_EVENT:
    case PROMO_MAIN_STAT_INIT:
        proc->sel_en = StartPromoClassSelect(proc);
        _proc->stat = PROMO_MAIN_STAT_SELECTION;
        return false;

    default:
        return true;
    }
}

bool PromoMain_WaitSelectDone(struct ProcPromoMain *proc)
{
    switch (proc->stat) {
    case PROMO_MAIN_STAT_INIT:
    case PROMO_MAIN_STAT_SELECTION:
        return true;

    case PROMO_MAIN_STAT_2:
        return false;

    default:
        return true;
    }
}

void ClassChgSel_SetBlendWindowConfig(void)
{
    SetBlendConfig(1, 16, 16, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 0xF0, 0xA0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = true;
    gLCDControlBuffer.wincnt.wout_enableBlend = false;
    gLCDControlBuffer.bldcnt.target2_bd_on = true;
}

void ClassChgSel_SetupBattleTerrain(u32 a, s16 b, s16 c) {
    gEkrbattle_9.terrain_l = a;
    gEkrbattle_9.pal_l = 0xe;
    gEkrbattle_9.chr_l = 0x380;
    gEkrbattle_9.terrain_r = a;
    gEkrbattle_9.pal_r = 0xf;
    gEkrbattle_9.chr_r = 0xf0 << 2;
    gEkrbattle_9.distance = 0;
    gEkrbattle_9.unk0E = -1;
    gEkrbattle_9.unk1C = (void *)0x06010000;
    gEkrbattle_9.unk20 = gUnk_Banim_Ekrbattle_0;
    InitBanimTerrain(&gEkrbattle_9);

    SetBanimTerrainPos(&gEkrbattle_9, b, c, b + 0x60, c);
}

void ClassChgSel_StartClassBattleSprite(int a, int b, int c, int d, int e) {
    u16 c1 = c;
    u16 d1 = d;
    if (gKeyStatusPtr->heldKeys & 0xc)
        gUnk_83[0] = 0;

    if (gKeyStatusPtr->newKeys & 0x200)
        gUnk_83[0] += 1;

    NewEfxAnimeDrvProc();
    gUnk_81.xPos = c1;
    gUnk_81.yPos = d1;
    gUnk_81.state2 = 1;
    gUnk_81.animId = a;
    gUnk_81.charPalId = b;
    gUnk_81.roundType = e;
    gUnk_81.genericPalId = 0;
    gUnk_81.oam2Tile = 0x200;
    gUnk_81.oam2Pal = 0xa;
    gUnk_81.pImgSheetBuf = gBanimLeftImgSheetBuf;
    gUnk_81.unk_24 = gBanimOaml;
    gUnk_81.unk_20 = gBanimPaletteLeft;
    gUnk_81.unk_28 = gBanimScrLeft;
    gUnk_81.unk_30 = &gUnk_82;
    gUnk_82.u00 = 0x4;
    gUnk_82.u02 = 0;
    gUnk_82.u04 = 0;
    gUnk_82.u06 = 0;
    gUnk_82.u08 = 0;
    gUnk_82.u0e = 0x300;
    gUnk_82.u10 = 0x8;
    gUnk_82.u0a = 0x200;
    gUnk_82.u0c = 0x4;
    gUnk_82.u12 = 0x1;
    gUnk_82.buf = gBG1TilemapBuffer;
    gUnk_82.u18 = gSpellAnimBgfx;
    gUnk_82.u1c = (void *)gEkrTsaBuffer;
    gUnk_82.u20 = gBuf_Banim;
    gUnk_82.u24 = ClassChgSel_SetBlendWindowConfig;

    ResetClassReelSpell();
    NewEkrUnitMainMini(&gUnk_81);
}

u8 LoadClassBattleSprite(s16 * out, u16 jid, u16 wpn_before) 
{
    u8 i;
    const struct BattleAnimDef * anim_instr = GetClassData(jid)->pBattleAnimDef;
    u32 item_type = GetItemType(wpn_before);
    u16 expected_type = item_type + 0x100;
    u8 ret;

    *out = 0;
    for (i = 0; ; i++) {
        u16 item = anim_instr[i].wtype;
        if (item == expected_type)
            *out = anim_instr[i].index - 1;

        if (anim_instr[i].index == 0)
            break;
    }

    if (*out == 0) {
        u32 key = SPECIAL_BANIM_WTYPE;
        for (i = 0; ; i++) {
            if (anim_instr[i].wtype == key)
                *out = anim_instr[i].index - 1;

            if (anim_instr[i].index == 0)
                break;
        }
    }

    if (wpn_before == 0)
        return false;

    if (GetItemRequiredExp(wpn_before) >= GetClassData(jid)->baseRanks[GetItemType(wpn_before)])
        return true;

    return false;
}

void NewCcramifyEnd(void) {
    Proc_Start(ProcScr_PromoSelectEnd, PROC_TREE_3);
}

CONST_DATA struct ProcCmd ProcScr_PromoSelect[] = {
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

    /* ? */
    PROC_NAME("ccramify"),

PROC_LABEL(PROC_CLASSCHG_SEL_INIT),
    PROC_CALL(Make6C_PromotionMenuSelect),
    PROC_SLEEP(6),
    PROC_CALL(ClassChgSel_InitDescAndBg),

PROC_LABEL(PROC_CLASSCHG_SEL_1),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_REPEAT(LoadBattleSpritesForBranchScreen),
    PROC_GOTO(PROC_CLASSCHG_SEL_END1),

/* Pre End */
PROC_LABEL(PROC_CLASSCHG_SEL_2),
    PROC_CALL(ClassChgSel_RoutePreEndByType),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

/* On End */
PROC_LABEL(PROC_CLASSCHG_SEL_4),
    PROC_CALL(ClassChgSel_OnEndCleanupBm),
    PROC_CALL(ClassChgSel_RouteOnEndByType),
    PROC_SET_END_CB(NewCcramifyEnd),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(PrepClassChgOnCancel),

PROC_LABEL(PROC_CLASSCHG_SEL_END2),
PROC_LABEL(PROC_CLASSCHG_SEL_END1),
    PROC_END,
};

CONST_DATA struct ProcCmd ProcScr_PromoSelectEnd[] = {
	PROC_NAME("ccramify_end"),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_END,
};
