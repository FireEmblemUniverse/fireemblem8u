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

    proc->timer = 0;
    proc->name_width = 0;
    proc->name_x = 0x78;
    class = GetClassData(jid);
    GetStringFromIndexInBuffer(class->nameTextId, str);

    for (i = 0; i < 20 /* sizeof(str) */ && str[i] != '\0'; i++) {
        struct ClassDisplayFont *font = GetClassDisplayFontInfo(str[i]);
        if (font)
            proc->name_width += font->width - font->xBase;
        else
            proc->name_width += 4;
    }

    Decompress(&Img_ClassReel_ClassNameLetters, OBJ_VRAM0 + 0x1000);
    ApplyPalettes(Pal_ClassReel_ClassNameLetters, 0x14, 0x2);
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

    if (proc->timer < 0xff)
        proc->timer++;
}

void ClassChgEndEkrPreview(void)
{
    EndEfxAnimeDrvProc();
    EndEkrMainMini(&gClassChgEkrMiniDesc);
    EndEkrTerrainfx(&gEkrTerrainfxDesc);
}

void ClassChgLoadUI(void)
{
    u8 *src = Img_ClassReel_UiBox;
    u32 off = GetBackgroundTileDataOffset(BG_2);
    Decompress(src, (void *)VRAM + 0x3000 + off);
    RegisterTsaWithOffset(gBG2TilemapBuffer, Tsa_ClassReel_UiBox, TILEREF(0x180, BGPAL_TEXT_DEFAULT) + 0x1000);
}

void ClassChgSel_DrawClassNames(struct ProcPromoSel *proc) {
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

struct Struct_8A30978 {
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
    struct Struct_8A30978 *b = (void *)_src;
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

void PromoSel_Init(struct ProcPromoSel* proc) {
    struct ProcPromoMain *parent = proc->proc_parent;
    struct ProcPromoHandler *grandparent;
    struct Unit *unit;
    int i, pid;

    parent->stat = PROMO_MAIN_STAT_2;
    proc->pid = parent->pid;
    proc->terrain = 9;
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    ClassChg_InitMainMini(0, -1, 0xfb * 2, 0x58, 6);
    ClassChgLoadUI();
    ClassChg_InitTerrainfx(proc->terrain, 0x8c * 2, 0x68);

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

void PromoSel_StartClassDesc(struct ProcPromoSel *proc) {
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

void PromoSel_Loop(struct ProcPromoSel *proc) {
    u32 a;
    u8 b;
    struct ProcEkrSubAnimeEmulator *terrainL;
    struct ProcEkrSubAnimeEmulator *terrainR;
    struct Anim *anim1;
    struct Anim *anim2;
    struct Unit copied_unit;
    struct EkrMainMiniDesc *desc;
    u16 chara_pal;
    anim1 = gClassChgEkrMiniDesc.anim1;
    anim2 = gClassChgEkrMiniDesc.anim2;

    terrainL = gEkrTerrainfxDesc.proc1;
    terrainR = gEkrTerrainfxDesc.proc2;

    a = proc->stat;
    desc = &gClassChgEkrMiniDesc;

    if (a == 1) {
        u16 _pid, _jid;
        s16 i;
        struct Unit *unit;
        const struct BattleAnimDef * battle_anim_ptr;
        u32 battle_anim_id;
        u16 ret;
        if (terrainL->x1 <= 0x117) {
            terrainL->x1 += 12;
            terrainR->x1 += 12;
            anim1->xPosition += 12;
            anim2->xPosition = anim1->xPosition;
        } else {
            proc->stat = 2;
        }

        if (proc->stat == 2) {
            EndEfxAnimeDrvProc();
            EndEkrMainMini(&gClassChgEkrMiniDesc);
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
            ClassChg_InitMainMini((s16) ret, (s16) chara_pal, (s16) (terrainL->x1 + 0x28), 0x58, 6);
            EndEkrTerrainfx(&gEkrTerrainfxDesc);
            ClassChg_InitTerrainfx(proc->terrain, terrainL->x1, terrainL->y1);
        } else {
            goto D1AC;
        }
    }
    ++proc; --proc;
    b = proc->stat;
    desc = &gClassChgEkrMiniDesc;
    if (b == 2) {
        if (terrainL->x1 > 0x82) {
#ifdef NONMATCHING
            u16 off = 12;
#else
            register u16 off asm("r1") = 12;
#endif // NONMATCHING
            terrainL->x1 -= off;
            terrainR->x1 -= off;
            anim1->xPosition -= off;
            anim2->xPosition = anim1->xPosition;
        } else {
            proc->stat = 0;
        }
    }
D1AC:
    if ((u8) EkrMainMini_CheckBlocking(desc)) {
        EkrMainMini_EndBlock(desc);
    }
    LoadClassNameInClassReelFont(proc);
    return;
}

void PromoSel_EndOnMap(struct ProcPromoSel *proc)
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
        EndEkrMainMini(&gClassChgEkrMiniDesc);
        EndEkrTerrainfx(&gEkrTerrainfxDesc);
        EndEfxAnimeDrvProc();
    }
}

void PromoSel_OnPrepCancel(struct ProcPromoSel *proc)
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
        EndEkrMainMini(&gClassChgEkrMiniDesc);
        EndEkrTerrainfx(&gEkrTerrainfxDesc);
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

void PromoSel_RoutePreEnd(struct ProcPromoSel *proc)
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

void PromoSel_RouteOnEnd(struct ProcPromoSel *proc)
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

bool PromoMain_WaitSelection(struct ProcPromoMain *proc)
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

void ClassChgMagi_ResetBlend(void)
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

void ClassChg_InitTerrainfx(u32 terrain, s16 x, s16 y) {
    gEkrTerrainfxDesc.terrain_l = terrain;
    gEkrTerrainfxDesc.pal_l = 0xe;
    gEkrTerrainfxDesc.chr_l = 0x380;
    gEkrTerrainfxDesc.terrain_r = terrain;
    gEkrTerrainfxDesc.pal_r = 0xf;
    gEkrTerrainfxDesc.chr_r = 0xf0 << 2;
    gEkrTerrainfxDesc.distance = 0;
    gEkrTerrainfxDesc.bg_index = -1;
    gEkrTerrainfxDesc.vram_offset = (void *)0x06010000;
    gEkrTerrainfxDesc.img_buf = gUnk_Banim_020145C8;
    NewEkrTerrainfx(&gEkrTerrainfxDesc);

    EkrTerrainfx_SetPosition(&gEkrTerrainfxDesc, x, y, x + 0x60, y);
}

void ClassChg_InitMainMini(int bid, int char_pal, int x, int y, int round_type) {
    u16 xPos = x;
    u16 yPos = y;
    if (gKeyStatusPtr->heldKeys & 0xc)
        gUnknown_03005408[0] = 0;

    if (gKeyStatusPtr->newKeys & 0x200)
        gUnknown_03005408[0] += 1;

    NewEfxAnimeDrvProc();
    gClassChgEkrMiniDesc.x = xPos;
    gClassChgEkrMiniDesc.y = yPos;
    gClassChgEkrMiniDesc.pos = 1;
    gClassChgEkrMiniDesc.bid = bid;
    gClassChgEkrMiniDesc.char_pal = char_pal;
    gClassChgEkrMiniDesc.round_type = round_type;
    gClassChgEkrMiniDesc.faction_pal = 0;
    gClassChgEkrMiniDesc.oam2_chr = 0x200;
    gClassChgEkrMiniDesc.oam2_pal = 0xa;
    gClassChgEkrMiniDesc.img_buf = gBanimLeftImgSheetBuf;
    gClassChgEkrMiniDesc.oam_buf = gBanimOaml;
    gClassChgEkrMiniDesc.pal_buf = gBanimPaletteLeft;
    gClassChgEkrMiniDesc.scr_buf = gBanimScrLeft;
    gClassChgEkrMiniDesc.magicfx_desc = &gClassChgEkrMagiDesc;
    gClassChgEkrMagiDesc.magicFuncIdx = 0x4;
    gClassChgEkrMagiDesc.xOffsetBg = 0;
    gClassChgEkrMagiDesc.yOffsetBg = 0;
    gClassChgEkrMagiDesc.xOffsetObj = 0;
    gClassChgEkrMagiDesc.yOffsetObj = 0;
    gClassChgEkrMagiDesc.objChr = 0x300;
    gClassChgEkrMagiDesc.objPalId = 0x8;
    gClassChgEkrMagiDesc.bgChr = 0x200;
    gClassChgEkrMagiDesc.bgPalId = 0x4;
    gClassChgEkrMagiDesc.bg = 0x1;
    gClassChgEkrMagiDesc.bgTmBuf = gBG1TilemapBuffer;
    gClassChgEkrMagiDesc.bgImgBuf = gSpellAnimBgfx;
    gClassChgEkrMagiDesc.bgTsaBuf = (void *)gEkrTsaBuffer;
    gClassChgEkrMagiDesc.objImgBuf = gBuf_Banim;
    gClassChgEkrMagiDesc.resetCallback = ClassChgMagi_ResetBlend;

    ResetClassReelSpell();
    NewEkrUnitMainMini(&gClassChgEkrMiniDesc);
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

void StartPromoSelectEnd(void) {
    Proc_Start(ProcScr_PromoSelectEnd, PROC_TREE_3);
}

CONST_DATA struct ProcCmd ProcScr_PromoSelect[] = {
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

    /* ? */
    PROC_NAME("ccramify"),

PROC_LABEL(PROC_CLASSCHG_SEL_INIT),
    PROC_CALL(PromoSel_Init),
    PROC_SLEEP(6),
    PROC_CALL(PromoSel_StartClassDesc),

PROC_LABEL(PROC_CLASSCHG_SEL_1),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_REPEAT(PromoSel_Loop),
    PROC_GOTO(PROC_CLASSCHG_SEL_END1),

/* Pre End */
PROC_LABEL(PROC_CLASSCHG_SEL_2),
    PROC_CALL(PromoSel_RoutePreEnd),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

/* On End */
PROC_LABEL(PROC_CLASSCHG_SEL_4),
    PROC_CALL(PromoSel_EndOnMap),
    PROC_CALL(PromoSel_RouteOnEnd),
    PROC_SET_END_CB(StartPromoSelectEnd),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(PromoSel_OnPrepCancel),

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
