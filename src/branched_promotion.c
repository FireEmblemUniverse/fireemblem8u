#include "global.h"

#include "anime.h"
#include "ap.h"
#include "bm.h"
#include "bmarch.h"
#include "bmbattle.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "branched_promotion.h"
#include "classdisplayfont.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "ctc.h"
#include "face.h"
#include "fontgrp.h"
#include "functions.h"
#include "hardware.h"
#include "mu.h"
#include "proc.h"
#include "scene.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "prepscreen.h"
#include "bmlib.h"

void sub_805AA68(void *);
void sub_805AE14(void *);
void sub_805AE40(void *, s16, s16, s16, s16);
u8 PromoHandler_SetInitStat(struct ProcPromoHandler *proc);
void PromoHandlerIdle(struct ProcPromoHandler *proc);

CONST_DATA
struct ProcCmd ProcScr_PromoHandler[] =
{
    PROC_SLEEP(3),
    PROC_LABEL(0),
    PROC_CALL(PromoHandler_SetInitStat),
    PROC_LABEL(1),
    PROC_REPEAT(PromoHandlerIdle),
    PROC_LABEL(7),
    PROC_END,
};

// Appears unused
CONST_DATA
u32 gUnknown_08B12704[] =
{
    0x00011e05,
    0x28050008,
    0x50050003,
    0x00080001,
    0x00032805,
    0x00000000,
};

struct TraineeData {
    u8 charId;
    u8 promotionLevel;
    u8 class;
};

const struct TraineeData gTrainees[] = {
    { CHARACTER_ROSS,   10, CLASS_JOURNEYMAN },
    { CHARACTER_AMELIA, 10, CLASS_RECRUIT },
    { CHARACTER_EWAN,   10, CLASS_PUPIL },
};

void SetupPromotionScreen(struct ProcPromoSel *proc);
void sub_80CCF60(struct ProcPromoSel *proc);
void sub_80CD294(struct Proc *proc);
void sub_80CD1D4(struct Proc *proc);
void sub_80CD2CC(struct Proc *proc);
void sub_80CD618(void);
void sub_80CD218(struct Proc *proc);
void LoadBattleSpritesForBranchScreen(struct ProcPromoSel *proc);

CONST_DATA
const struct ProcCmd ProcScr_PromoSelect[] =
{
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

    /* ? */
    PROC_NAME("ccramify"),

PROC_LABEL(0),
    PROC_CALL(SetupPromotionScreen),
    PROC_SLEEP(6),
    PROC_CALL(sub_80CCF60),

PROC_LABEL(1),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_REPEAT(LoadBattleSpritesForBranchScreen),
    PROC_GOTO(3),

/* Pre End */
PROC_LABEL(2),
    PROC_CALL(sub_80CD294),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

/* On End */
PROC_LABEL(4),
    PROC_CALL(sub_80CD1D4),
    PROC_CALL(sub_80CD2CC),
    PROC_SET_END_CB(sub_80CD618),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(sub_80CD218),

PROC_LABEL(5),
PROC_LABEL(3),
    PROC_END,
};

CONST_DATA
const struct ProcCmd ProcScr_PromoSelectEnd[] =
{
	PROC_NAME("ccramify_end"),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_END,
};

void PromoTrainee_InitScreen(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk1(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk2(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk3(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk4(struct ProcPromoTraineeEvent *proc);
void PromoTrainee_Talk5(struct ProcPromoTraineeEvent *proc);
u32 RemovePromoTraineeEventFace(void);
void PromoTrainee_OnEnd(struct Proc *proc);

CONST_DATA
const struct ProcCmd ProcScr_PromoSelectEvent[] =
{
    PROC_SLEEP(8),
	PROC_NAME("ccramify_event"),
    PROC_LABEL(0),
    PROC_CALL(PromoTrainee_InitScreen),
    PROC_LABEL(1),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(PromoTrainee_Talk1),
    PROC_WHILE(SomeTalkProcExists),
    PROC_CALL(PromoTrainee_Talk2),
    PROC_WHILE(SomeTalkProcExists),
    PROC_CALL(PromoTrainee_Talk3),
    PROC_WHILE(SomeTalkProcExists),
    PROC_CALL(PromoTrainee_Talk4),
    PROC_WHILE(SomeTalkProcExists),
    PROC_CALL(PromoTrainee_Talk5),
    PROC_WHILE(SomeTalkProcExists),
    PROC_LABEL(3),
    PROC_WHILE(RemovePromoTraineeEventFace),
    PROC_LABEL(2),
    PROC_CALL(PromoTrainee_OnEnd),
    PROC_LABEL(4),
    PROC_END,
};

u32 PromoHandler_SetupAndStartUI(struct ProcPromoHandler *proc) {

    struct TraineeList {
        struct TraineeData members[3];
    };

    struct Unit *unit;
    u8 classNumber;
    u32 terrain;

    struct TraineeList trainees = *(struct TraineeList *)gTrainees;

    switch (gPlaySt.chapterModeIndex) {
        case CHAPTER_MODE_EIRIKA:
        default:
            terrain = TERRAIN_PLAINS;
            break;

        case CHAPTER_MODE_EPHRAIM:
            terrain = TERRAIN_DESERT;
            break;
    }

    if (proc->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        u8 i;
        u8 flag;
        proc->bmtype = PROMO_HANDLER_TYPE_TRANINEE;
        proc->sel_en = 1;
        // This probably loops over trainee units - not sure why it goes to 6 though.
        flag = 0;
        for (i = 0; i < 7; i++) {
            unit = GetUnitFromCharId(trainees.members[i].charId);
            if (!unit)
                flag = true;

            if (unit->state & (US_BIT16 | US_DEAD))
                flag = true;

            if (unit->level < trainees.members[i].promotionLevel)
                flag = true;

            classNumber = unit->pClassData->number;
            if (classNumber != trainees.members[i].class)
                flag = true;

            if (!gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1])
                flag = true;

            if (!flag) {
                if (gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1]) {
                    proc->jid = gPromoJidLut[classNumber][0];
                    proc->sel_en = 0;
                }

                if (!gPromoJidLut[classNumber][0] && gPromoJidLut[classNumber][1]) {
                    proc->jid = gPromoJidLut[classNumber][1];
                    proc->sel_en = 0;
                }

                if (trainees.members[i].charId != terrain)
                    MakePromotionScreen(proc, trainees.members[i].charId, terrain);
                else
                    MakePromotionScreen(proc, trainees.members[i].charId, TERRAIN_ROAD);

                return PROMO_HANDLER_STAT_IDLE;
            }
            flag = 0;
        }
        return PROMO_HANDLER_STAT_END;
    }
    else if (proc->bmtype == PROMO_HANDLER_TYPE_BM) {
        proc->bmtype = PROMO_HANDLER_TYPE_BM;
        proc->sel_en = 1;
        unit = GetUnitFromCharId(proc->pid);
        classNumber = unit->pClassData->number;

        /* If no class to promote, end the handler proc */
        if (!gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1])
            return PROMO_HANDLER_STAT_END;

        if (gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1]) {
            proc->jid = gPromoJidLut[classNumber][0];
            proc->sel_en = 0;
        }

        if (!gPromoJidLut[classNumber][0] && gPromoJidLut[classNumber][1]) {
            proc->jid = gPromoJidLut[classNumber][1];
            proc->sel_en = 0;
        }

        MakePromotionScreen(proc, proc->pid, TERRAIN_PLAINS);
        return PROMO_HANDLER_STAT_IDLE;
    }
    else if (proc->bmtype == PROMO_HANDLER_TYPE_PREP) {
        proc->bmtype = PROMO_HANDLER_TYPE_PREP;
        proc->sel_en = 1;
        unit = GetUnitFromCharId(proc->pid);
        classNumber = unit->pClassData->number;
        if (!gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1]) {
            BMapDispResume();
            RefreshBMapGraphics();
            return PROMO_HANDLER_STAT_END;
        }
        if (gPromoJidLut[classNumber][0] && !gPromoJidLut[classNumber][1]) {
            proc->jid = gPromoJidLut[classNumber][0];
            proc->sel_en = 0;
        }
        if (!gPromoJidLut[classNumber][0] && gPromoJidLut[classNumber][1]) {
            proc->jid = gPromoJidLut[classNumber][1];
            proc->sel_en = 0;
        }
        MakePromotionScreen(proc, proc->pid, TERRAIN_PLAINS);
        return PROMO_HANDLER_STAT_IDLE;
    }
    else
        return PROMO_HANDLER_STAT_END;
}

u8 PromoHandler_SetInitStat(struct ProcPromoHandler *proc) {
    proc->stat = PROMO_HANDLER_STAT_INIT;
    return 0;
}

void PromoHandlerIdle(struct ProcPromoHandler *proc) {
    switch (proc->stat) {
    case PROMO_HANDLER_STAT_IDLE:
    default:
        return;

    case PROMO_HANDLER_STAT_INIT:
        proc->stat = PromoHandler_SetupAndStartUI(proc);
        break;

    case PROMO_HANDLER_STAT_END:
        Proc_Break(proc);
        break;
    }
}

extern struct ProcCmd ProcScr_PromoHandler[];

void StartTraineePromoScreen(ProcPtr parent) {
    struct BattleUnit *actor, *target;
    struct ProcPromoHandler *proc = Proc_StartBlocking(ProcScr_PromoHandler, parent);
    proc->bmtype = PROMO_HANDLER_TYPE_TRANINEE;
    proc->u32 = 0;
    proc->unit = NULL;
    proc->item_slot = -1;
    actor = &gBattleActor;
    target = &gBattleTarget;
    target->weaponBefore = 0;
    actor->weaponBefore = 0;
    target->weapon = 0;
    actor->weapon = 0;
    target->statusOut = -1;
}

void StartPrepScreenPromotion(struct ProcPrepItemUse *proc) {
    struct BattleUnit *actor, *target;
    struct ProcPromoHandler *new_proc;
    struct ProcPromoMain *parent;

    u32 weapon;
    u32 slot = proc->slot;
    if (slot != -1) {
        struct BattleUnit *actor, *target;
        actor = &gBattleActor;
        target = &gBattleTarget;
        target->weaponBefore = proc->unit->items[slot];
        actor->weaponBefore = proc->unit->items[slot];
    }

    weapon = GetUnitEquippedWeapon(proc->unit);
    actor = &gBattleActor;
    target = &gBattleTarget;
    target->weapon = weapon;
    actor->weapon = weapon;
    target->statusOut = -1;

    new_proc = Proc_StartBlocking(ProcScr_PromoHandler, proc);
    new_proc->bmtype = PROMO_HANDLER_TYPE_BM;
    new_proc->u32 = 0;

    parent = new_proc->proc_parent;
    new_proc->pid = parent->unit->pCharacterData->number;
    new_proc->unit = parent->unit;
    new_proc->item_slot = (s32) parent->priv;
}

void StartBmPromotion(struct ProcPromoMain *proc) {
    struct Unit *unit;
    struct ProcPromoHandler *new_proc = Proc_StartBlocking(ProcScr_PromoHandler, proc);
    new_proc->bmtype = PROMO_HANDLER_TYPE_PREP;
    new_proc->u32 = 0;
    unit = GetUnit(gActionData.subjectIndex);
    new_proc->pid = unit->pCharacterData->number;
    new_proc->unit = GetUnit(gActionData.subjectIndex);
    new_proc->item_slot = gActionData.itemSlotIndex;
    BMapDispSuspend();
    MU_EndAll();
}

void ChangeClassDescription(u32 a) {
    SetInitTalkTextFont();
    ClearTalkText();
    StartTalkMsg(2, 0xf, a);
    SetTalkPrintColor(0);
    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);
    SetTalkFlag(TALK_FLAG_NOFAST);
    SetTalkFlag(TALK_FLAG_SILENT);
    SetTalkPrintDelay(4);
}

void LoadClassReelFontPalette(struct ProcPromoSel *proc, s32 b) {
    u16 tmp = b;
    s8 buffer[0x20];
    s32 index, bufferStart;
    const struct ClassData *class;
    proc->u44 = 0;
    proc->u46 = 0;
    proc->u47 = 0x78;
    class = GetClassData(tmp);
    GetStringFromIndexInBuffer(class->nameTextId, buffer);

    for (index = 0; buffer[index] != 0;) {
        s32 ptr;
        struct ClassDisplayFont *res = GetClassDisplayFontInfo(buffer[index]);
        if (res) {
            proc->u46 += res->width - res->xBase;
        } else {
            proc->u46 += 4;
        }
        index++;
        if ((s32) buffer + index > (s32) buffer + 0x13)
            break;
    }
    Decompress(&gUnknown_08A36338, (void *) 0x06011000);
    CopyToPaletteBuffer(&gUnknown_08A372C0, 0x280, 0x40);
}

void LoadClassNameInClassReelFont(struct ProcPromoSel *proc) {
    s8 buffer[0x20];
    s32 index;
    u8 idx = proc->menu_index;
    u16 classNum = proc->u2c[idx];
    u32 xOffs = 0x74;
    const struct ClassData *class = GetClassData(classNum);
    GetStringFromIndexInBuffer(class->nameTextId, buffer);
    for (index = 0; buffer[index] != 0;) {
        struct ClassDisplayFont *res = GetClassDisplayFontInfo(buffer[index]);
        if (res) {
            if (res->a) {
                PutSpriteExt(4, xOffs - res->xBase - 2, res->yBase + 6, res->a, 0x81 << 7);
                xOffs += res->width - res->xBase;
            }
        } else {
            xOffs += 4;
        }
        index++;
        if ((s32) buffer + index > (s32) buffer + 0x13)
            break;
    }
    if (proc->u44 < 0xff)
        proc->u44++;
}

void sub_80CCBD4(void) {
    EndEfxAnimeDrvProc();
    sub_805AA28(&gUnknown_030053A0);
    sub_805AE14(&gUnknown_0201FADC);
}

struct Struct_8A30978 {
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};
extern struct Struct_8A30978 gUnknown_08A30978;

void sub_80CCCE0(u16 *buffer, struct Struct_8A30978 *b, u32 c);

void LoadUIForPromoScreen(void) {
    u8 *a = gUnknown_08A30800;
    u32 off = GetBackgroundTileDataOffset(2);
    Decompress(a, (void *)0x06003000 + off);
    sub_80CCCE0(gBG2TilemapBuffer, &gUnknown_08A30978, 0x8c << 5);
}

void sub_80CCC2C(struct ProcPromoSel *proc) {
    u8 local[0x16];
    const struct ClassData *class;
    char *string;
    DrawUiFrame(gBG2TilemapBuffer, 2, 1, 10, 6, 0, 1);
    SetFontGlyphSet(0);
    SetFont(0);
    class = GetClassData(proc->u2c[0]);
    string = GetStringFromIndex(class->nameTextId);
    DrawTextInline(0, TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 2), 0, 0, 0x8, string);
    class = GetClassData(proc->u2c[1]);
    string = GetStringFromIndex(class->nameTextId);
    DrawTextInline(0, TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 4), 0, 0, 0x8, string);
}

bool8 sub_80CCCA4(void) {
    struct GlobalSaveInfo meta;
    u8 unlock = ReadGlobalSaveInfo(&meta);
    if (!unlock) {
        InitGlobalSaveInfodata();
        ReadGlobalSaveInfo(&meta);
    }

    if (meta.Eirk_mode_easy || meta.Eirk_mode_norm || meta.Eirk_mode_hard)
        if (meta.Ephy_mode_easy || meta.Ephy_mode_norm || meta.Ephy_mode_hard)
            return true;

    return false;
}

void sub_80CCCE0(u16 *buffer, struct Struct_8A30978 *b, u32 c) {
    s16 i, j;
    s16 jrange;
    u16 *src;
    u16 *dst;
    u32 word;
    u8 mask;
    u16 add = c;
    src = b->longBuffer;
    mask = 0xff;
    word = *((u32*)b);
    jrange = b->a;
    i = (word >> 8) & mask;
    while (i > 0xc) {
        j = jrange;
        dst = buffer + i * 32;
        while (j >= 0) {
            *dst++ = (*src++) + add;
            j--;
        }
        i--;
    }
}

ProcPtr StartPromoClassSelect(ProcPtr parent) {
    return Proc_StartBlocking(ProcScr_PromoSelect, parent);
}

u8 LoadClassBattleSprite(u16*, u16, u16);

void sub_80CD47C(int, int, int, int, int);
void sub_80CD408(u32, s16, s16);

void EndSlidingWallEffectMaybe(void);

ProcPtr Make6C_PromotionMenuSelect(ProcPtr);

void SetupPromotionScreen(struct ProcPromoSel* proc) {
    struct ProcPromoMain *parent = proc->proc_parent;
    struct ProcPromoHandler *grandparent;
    struct Unit *unit;
    s32 i;
    s32 charnumber;
    ProcPtr select;
    parent->stat = PROMO_MAIN_STAT_2;
    proc->pid = parent->pid;
    proc->u50 = 9;
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    sub_80CD47C(0, -1, 0xfb * 2, 0x58, 6);
    LoadUIForPromoScreen();
    sub_80CD408(proc->u50, 0x8c * 2, 0x68);

    proc->u32[0] = 0;
    proc->u32[1] = 0;
    proc->u32[2] = 0;
    for (i = 1; i <= 0x3f; i++) {
        u16 classFromSwitch;

        u16 weapon;
        s32 j;
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;
        if (unit->pCharacterData->number !=  proc->pid)
            continue;
        charnumber = unit->pClassData->number;
        weapon = GetUnitEquippedWeapon(unit);
        for (j = 0; j < 2; j++) {
            u8 sprite;
            proc->u2c[j] = gPromoJidLut[charnumber][j];
            sprite = LoadClassBattleSprite(
                &proc->u32[j],
                gPromoJidLut[charnumber][j],
                weapon);
            proc->u4a[j] = sprite;
            proc->msg_desc[j] = GetClassData(gPromoJidLut[charnumber][j])->descTextId;
        }
        proc->u48 = weapon;
        if (!sub_80CCCA4())
            break;
        charnumber = unit->pClassData->number;
        switch (charnumber) {
            case 0x3d:
                proc->u2c[2] = 0x7e;
                proc->u4a[2] = LoadClassBattleSprite(&proc->u32[2], 0x7e, weapon);
                proc->msg_desc[2] = GetClassData(0x7e)->descTextId;

                break;
            case 0x3e:
                proc->u2c[2] = 0x7f;
                proc->u4a[2] = LoadClassBattleSprite(&proc->u32[2], 0x7f, weapon);
                proc->msg_desc[2] = GetClassData(0x7f)->descTextId;

                break;
            case 0x47:
                proc->u2c[2] = 0x37;
                proc->u4a[2] = LoadClassBattleSprite(&proc->u32[2], 0x37, weapon);
                proc->msg_desc[2] = GetClassData(0x37)->descTextId;

                break;
        }
        break;
    }
    if (proc->u32[0] == 0 && proc->u32[1] == 0) {
        proc->u32[1] = 0;
        proc->u32[0] = 0;
    }
    proc->u40 = 1;
    proc->menu_index = 0;
    LoadClassReelFontPalette(proc, charnumber);
    LoadClassNameInClassReelFont(proc);
    LoadObjUIGfx();

    select = Make6C_PromotionMenuSelect(proc);
    proc->menu_proc = select;
    grandparent = parent->proc_parent;
    if (grandparent->bmtype == PROMO_HANDLER_TYPE_BM) {
        EndSlidingWallEffectMaybe();
        BG_EnableSyncByMask(0xf);
    }
}

void sub_80CCF60(struct ProcPromoSel *proc) {
    u16 tmp;
    Font_ResetAllocation();
    Font_InitForUIDefault();
    BG_EnableSyncByMask(0xf);
    InitTalk(0x100, 2, 0);
    ChangeClassDescription(proc->msg_desc[proc->menu_index]);
    SetTalkPrintDelay(-1);
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;
    BG_EnableSyncByMask(0xf);
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

u8 sub_805A96C(struct Unknown_030053A0 *);
void sub_805A990(struct Unknown_030053A0 *);
void LoadBattleSpritesForBranchScreen(struct ProcPromoSel *proc) {
    u32 a;
    u8 b;
    struct ProcPromoSel *p2;
    struct ProcPromoSel *c2;
    struct Anim *anim1;
    struct Anim *anim2;
    struct Unit copied_unit;
    void *tmp;
    u16 sp58;
    anim1 = gUnknown_030053A0.anim1;
    anim2 = gUnknown_030053A0.anim2;

    p2 = (void *)gUnknown_0201FADC.p1;
    c2 = (void *)gUnknown_0201FADC.p2;

    a = proc->u40;
    tmp = &gUnknown_030053A0;

    if (a == 1) {
        u16 r4, r6;
        s16 i;
        struct Unit *unit;
        const void * battle_anim_ptr;
        u32 battle_anim_id;
        u16 ret;
        if ((s16) p2->u32[0] <= 0x117) {
            p2->u32[0] += 12;
            c2->u32[0] += 12;
            anim1->xPosition += 12;
            anim2->xPosition = anim1->xPosition;
        } else {
            proc->u40 = 2;
        }
        if (proc->u40 == 2) {
            EndEfxAnimeDrvProc();
            sub_805AA28(&gUnknown_030053A0);
            r4 = proc->pid - 1;
            r6 = proc->u2c[proc->menu_index];
            sp58 = 0xffff;
            unit = GetUnitFromCharId(proc->pid);
            copied_unit = *unit;
            copied_unit.pClassData = GetClassData(proc->u2c[proc->menu_index]);
            battle_anim_ptr = copied_unit.pClassData->pBattleAnimDef;
            ret = GetBattleAnimationId(
                &copied_unit,
                battle_anim_ptr,
                (u16) GetUnitEquippedWeapon(&copied_unit),
                &battle_anim_id);
            for (i = 0; i <= 6; i++) {
                if (gUnknown_0895E0A4[i + (s16) r4 * 7] == (s16) r6) {
                    sp58 = gUnknown_0895EEA4[i + (s16) r4 * 7] - 1;
                    break;
                }
            }
            sub_80CD47C((s16) ret, (s16) sp58, (s16) (p2->u32[0] + 0x28), 0x58, 6);
            sub_805AE14(&gUnknown_0201FADC);
            sub_80CD408(proc->u50, p2->u32[0], p2->msg_desc[1]);
        } else {
            goto D1AC;
        }
    }
    ++proc; --proc;
    b = proc->u40;
    tmp = &gUnknown_030053A0;
    if (b == 2) {
        if ((s16) p2->u32[0] > 0x82) {
#ifdef NONMATCHING
            u16 off = 12;
#else
            register u16 off asm("r1") = 12;
#endif // NONMATCHING
            p2->u32[0] -= off;
            c2->u32[0] -= off;
            anim1->xPosition -= off;
            anim2->xPosition = anim1->xPosition;
        } else {
            proc->u40 = 0;
        }
    }
D1AC:
    if ((u8) sub_805A96C(tmp)) {
        sub_805A990(tmp);
    }
    LoadClassNameInClassReelFont(proc);
    return;
}

void sub_80CD1D4(struct Proc *proc) {
    struct Proc *parent = proc->proc_parent;
    struct ProcPromoHandler *gparent = parent->proc_parent;
    switch (gparent->bmtype) {
    case PROMO_HANDLER_TYPE_TRANINEE:
        return;
    case PROMO_HANDLER_TYPE_BM:
        Proc_End(proc);
        Proc_End(parent);
        Proc_End(gparent);
        sub_805AA28(&gUnknown_030053A0);
        sub_805AE14(&gUnknown_0201FADC);
        EndEfxAnimeDrvProc();
    }
}

void sub_80CD218(struct Proc *proc) {
    struct Proc *parent;
    struct ProcPromoHandler *gparent;
    struct Proc *ggparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    if (gparent->bmtype == PROMO_HANDLER_TYPE_PREP) {
        Proc_End(proc);
        Proc_End(parent);
        Proc_End(gparent);
        sub_805AA28(&gUnknown_030053A0);
        sub_805AE14(&gUnknown_0201FADC);
        EndEfxAnimeDrvProc();
        gActionData.unitActionType = 0;
        Proc_Goto(ggparent, 2);
        BMapDispResume();
        RefreshBMapGraphics();
        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        MU_EndAll();
        MU_Create(gActiveUnit);
    }
}

void sub_80CD294(struct Proc *proc) {
    struct Proc *parent;
    struct ProcPromoHandler *gparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    if (gparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        Proc_Goto(proc, 4);
    } else if (gparent->bmtype == PROMO_HANDLER_TYPE_BM) {
        Proc_Break(proc);
    } else if (gparent->bmtype == PROMO_HANDLER_TYPE_PREP) {
        Proc_Goto(proc, 4);
    }
}

void sub_80CD2CC(struct Proc *proc) {
    struct Proc *parent;
    struct ProcPromoHandler *gparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;

    if (gparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        Proc_Goto(proc, 5);
    } else if (gparent->bmtype == PROMO_HANDLER_TYPE_BM) {
        Proc_Goto(proc, 5);
    } else if (gparent->bmtype == PROMO_HANDLER_TYPE_PREP) {
        Proc_Break(proc);
    }
}

bool StartAndWaitPromoSelect(struct ProcPromoMain *proc)
{
    struct ProcPromoMain *tmp = (struct ProcPromoMain *)proc;
    switch (tmp->stat) {
    case PROMO_MAIN_STAT_SELECTION:
        return false;

    case PROMO_MAIN_STAT_TRAINEE_EVENT:
    case PROMO_MAIN_STAT_INIT:
        proc->sel_en = StartPromoClassSelect(proc);
        tmp->stat = PROMO_MAIN_STAT_SELECTION;
        return false;

    default:
        return true;
    }
}

u32 sub_80CD330(struct ProcPromoMain *proc) {
    switch (proc->stat) {
    case PROMO_MAIN_STAT_INIT:
    case PROMO_MAIN_STAT_SELECTION:
        return 1;

    case PROMO_MAIN_STAT_2:
        return 0;

    default:
        return 1;
    }
}

void sub_80CD34C(void) {
    SetSpecialColorEffectsParameters(1, 16, 16, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    gLCDControlBuffer.dispcnt.win0_on   = TRUE;
    gLCDControlBuffer.dispcnt.win1_on   = FALSE;
    gLCDControlBuffer.dispcnt.objWin_on = FALSE;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0;
    gLCDControlBuffer.win0_right = 0xf0;
    gLCDControlBuffer.win0_bottom = 0xa0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = TRUE;
    gLCDControlBuffer.wincnt.win0_enableBg1 = TRUE;
    gLCDControlBuffer.wincnt.win0_enableBg2 = TRUE;
    gLCDControlBuffer.wincnt.win0_enableBg3 = TRUE;
    gLCDControlBuffer.wincnt.win0_enableObj = TRUE;

    gLCDControlBuffer.wincnt.wout_enableBg0 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBg1 = FALSE;
    gLCDControlBuffer.wincnt.wout_enableBg2 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBg3 = TRUE;
    gLCDControlBuffer.wincnt.wout_enableObj = TRUE;

    gLCDControlBuffer.wincnt.win0_enableBlend = TRUE;
    gLCDControlBuffer.wincnt.wout_enableBlend = FALSE;

    gLCDControlBuffer.bldcnt.target2_bd_on = TRUE;
}

void sub_80CD408(u32 a, s16 b, s16 c) {
    u32 tmp;
    s16 tmp2;
    gUnknown_0201FADC.things[0] = a;
    gUnknown_0201FADC.things[1] = 0xe;
    gUnknown_0201FADC.things[2] = 0x380;
    gUnknown_0201FADC.things[3] = a;
    gUnknown_0201FADC.things[4] = 0xf;
    gUnknown_0201FADC.things[5] = 0xf0 << 2;
    gUnknown_0201FADC.things[6] = 0;
    gUnknown_0201FADC.things[7] = 0xffff;
    gUnknown_0201FADC.u1c = 0x06010000;
    gUnknown_0201FADC.u20 = gUnknown_020145C8;
    sub_805AA68(&gUnknown_0201FADC);

    sub_805AE40(&gUnknown_0201FADC, b, c, b + 0x60, c);
}

extern u16 gUnknown_03005408[];
extern u8 gUnknown_02000088[];
extern u8 gBanimOaml[];
extern u8 gBanimPal1[];
extern u8 gBanimScrLeft[];

extern u8 gUnknown_0201A790[];

void sub_806E8F0(void);
void NewEkrUnitMainMini(struct Unknown_030053A0 *);

void sub_80CD47C(int a, int b, int c, int d, int e) {
    u16 c1 = c;
    u16 d1 = d;
    if (gKeyStatusPtr->heldKeys & 0xc)
        gUnknown_03005408[0] = 0;

    if (gKeyStatusPtr->newKeys & 0x200)
        gUnknown_03005408[0] += 1;

    NewEfxAnimeDrvProc();
    gUnknown_030053A0.u02 = c1;
    gUnknown_030053A0.u04 = d1;
    gUnknown_030053A0.u0c = 1;
    gUnknown_030053A0.u06 = a;
    gUnknown_030053A0.u08 = b;
    gUnknown_030053A0.u0a = e;
    gUnknown_030053A0.u01 = 0;
    gUnknown_030053A0.u0e = 0x200;
    gUnknown_030053A0.u10 = 0xa;
    gUnknown_030053A0.u1c = gUnknown_02000088;
    gUnknown_030053A0.u24 = gBanimOaml;
    gUnknown_030053A0.u20 = gBanimPal1;
    gUnknown_030053A0.u28 = gBanimScrLeft;
    gUnknown_030053A0.u30 = &gUnknown_030053E0;
    gUnknown_030053E0.u00 = 0x4;
    gUnknown_030053E0.u02 = 0;
    gUnknown_030053E0.u04 = 0;
    gUnknown_030053E0.u06 = 0;
    gUnknown_030053E0.u08 = 0;
    gUnknown_030053E0.u0e = 0x300;
    gUnknown_030053E0.u10 = 0x8;
    gUnknown_030053E0.u0a = 0x200;
    gUnknown_030053E0.u0c = 0x4;
    gUnknown_030053E0.u12 = 0x1;
    gUnknown_030053E0.buf = gBG1TilemapBuffer;
    gUnknown_030053E0.u18 = gEkrImgBuffer;
    gUnknown_030053E0.u1c = gEkrTsaBuffer;
    gUnknown_030053E0.u20 = gUnknown_0201A790;
    gUnknown_030053E0.u24 = sub_80CD34C;

    sub_806E8F0();
    NewEkrUnitMainMini(&gUnknown_030053A0);
}

u8 LoadClassBattleSprite(u16 *a, u16 b, u16 c) {
    u8 i;
    const void *r5 = GetClassData(b)->pBattleAnimDef;
    u32 item_type = GetItemType(c);
    u16 expected_type = item_type + 0x100;
    u8 ret;

    *a = 0;
    for (i = 0; ; i++) {
        u16 item = ((u16 *)r5)[2 * i];
        if (item == expected_type) {
            *a = ((u16 *)r5)[2 * i + 1] - 1;
        }
        if (((u16 *)r5)[2 * i + 1] == 0) {
            break;
        }
    }

    if (* ((s16 *)a) == 0) {
        u32 key = 0x109;
        for (i = 0; ; i++) {
            if (((u16 *)r5)[2 * i] == key) {
                *a = ((u16 *)r5)[2 * i + 1] - 1;
            }
            if (((u16 *)r5)[2 * i + 1] == 0) {
                break;
            }
        }
    }

    if (!c) {
        return 0;
    } else {
        s32 exp = GetItemRequiredExp(c);
        const struct ClassData *data = GetClassData(b);
        u32 type = GetItemType(c);
        if (exp >= data->baseRanks[type]) {
            return 1;
        }
    }
    return 0;
}

void sub_80CD618(void) {
    Proc_Start(ProcScr_PromoSelectEnd, (ProcPtr)3);
}

void sub_80CD62C(void) {
    BMapDispResume();
    RefreshBMapGraphics();
    RefreshEntityBmMaps();
    MU_EndAll();
    MU_Create(gActiveUnit);
    RenderBmMap();
    RefreshUnitSprites();
}

ProcPtr StartPromoTraineeEvent(ProcPtr);

void PromoMain_SetupTraineeEvent(struct ProcPromoMain *proc) {
    proc->priv = (u32)StartPromoTraineeEvent(proc);
}

ProcPtr StartPromoTraineeEvent(ProcPtr proc) {
    return Proc_StartBlocking(ProcScr_PromoSelectEvent, proc);
}

u32 RemovePromoTraineeEventFace(void) {
    u16 start = gFaces[0]->xPos;
    s16 cmp = start;

    if (cmp > 0x150) {
        return 0;
    } else {
        struct FaceProc *b = gFaces[1];
        struct FaceProc *c = gFaces[2];
        struct FaceProc *d = gFaces[3];
        gFaces[0]->xPos = start + 4;
        d->xPos = start + 4;
        c->xPos = start + 4;
        b->xPos = start + 4;

        return 1;
    }
}

void PromoTrainee_InitScreen(struct ProcPromoTraineeEvent *proc) {
    struct ProcPromoMain *parent = proc->proc_parent;
    struct Unit *unit;
    proc->pid = parent->pid;
    unit = GetUnitFromCharId(proc->pid);
    if (unit)
        proc->face = unit->pCharacterData->portraitId;
    else
        proc->face = 0;

    ResetFaces();
    Font_InitForUIDefault();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;
    BG_EnableSyncByMask(2);
    EndSlidingWallEffectMaybe();
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(0xf);

    SetDispEnable(1, 0, 0, 1, 1);
    InitTalk(0x200, 3, 1);
    SetSpecialColorEffectsParameters(1, 14, 8, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
}

void PromoTrainee_OnEnd(struct Proc *proc) {
    struct ProcPromoMain *parent = proc->proc_parent;
    parent->stat = PROMO_MAIN_STAT_TRAINEE_EVENT;
    ResetDialogueScreen();
    EndPrepSpecialCharEffect();
    APProc_DeleteAll();
    EndBG3Slider_();
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(4, 0, 0);
    BG_SetPosition(8, 0, 0);
    BG_EnableSyncByMask(15);
    SetDispEnable(1, 1, 1, 1, 1);
}

extern s8 gUnknown_03005398;

void PromoTrainee_Talk1(struct ProcPromoTraineeEvent *proc)
{
    struct FaceProc *b;
    struct FaceProc *c;
    struct FaceProc *d;
    u8 i;

    const u32 msgs[3] = { 
        0xc44,  /* [ToggleSmile]Wow... Would you look at[NL]these muscles![A][ToggleSmile] */
        0xc48,  /* [ToggleSmile]I'm ready to fight now![.][A][ToggleSmile] */
        0xc4d   /* [ToggleSmile]Oh, my... Look at this![.][A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }
    StartTalkFace(proc->face, 0xd4, 0x50, 0x82, 0);

    sub_808F128(0x16, 0x12, 0x12, 4, msgs[i], 0x06011800, -1, 0);
    sub_808E9D8(0xa);

    gFaces[0]->displayBits = FACE_DISP_KIND(2) | FACE_DISP_HLAYER(2);
    b = gFaces[1];
    c = gFaces[2];
    d = gFaces[3];
    d->displayBits = FACE_DISP_BIT_14;
    c->displayBits = FACE_DISP_BIT_14;
    b->displayBits = FACE_DISP_BIT_14;

    gUnknown_03005398 = -1;
}

void PromoTrainee_Talk2(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xc45,  /* [ToggleSmile]I had no idea how much[NL]stronger I'd gotten...[A][ToggleSmile] */
        0xc49,  /* [ToggleSmile]This armor used to be too[.][NL]heavy for me to wear...[.][A][ToggleSmile] */
        0xc4e   /* [ToggleSmile]Magic used to seem so hard,[.][NL]but I...I think I've got it.[A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }

    sub_808F128(0x16, 0x12, 0x12, 4, msgs[i], 0x06011800, -1, 0);
    sub_808E9D8(0xa);
}

void PromoTrainee_Talk3(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xc46,  /* [ToggleSmile]Why, I bet I could take on my[.][NL]dad or just about anyone![.][A][ToggleSmile] */
        0xc4a,  /* [ToggleSmile]But now, it's no problem![.][NL]I've come a long way.[.][A][ToggleSmile] */
        0xc4f   /* [ToggleSmile]I've turned a corner in my[NL]education. I'm a real mage![.][A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }

    sub_808F128(0x16, 0x12, 0x12, 4, msgs[i], 0x06011800, -1, 0);
    sub_808E9D8(0xa);
}

void PromoTrainee_Talk4(struct ProcPromoTraineeEvent *proc)
{
    u8 i;

    const u32 msgs[3] = {
        0xc47,  /* [ToggleSmile]I knew if I worked at it, I'd[.][NL]become a great warrior![.][A][ToggleSmile] */
        0xc4b,  /* [ToggleSmile]That's right. I'm a real[NL]soldier now![A][ToggleSmile] */
        0xc50   /* [ToggleSmile]But I'm not going to stop[.][NL]studying...[.][A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }

    sub_808F128(0x16, 0x12, 0x12, 4, msgs[i], 0x06011800, -1, 0);
    sub_808E9D8(0xa);
}

void PromoTrainee_Talk5(struct ProcPromoTraineeEvent *proc) {
    u8 i;

    const u32 msgs[3] = {
        -1,
        0xc4c,  /* [ToggleSmile]But I'm not about to stop.[NL]I'm just getting started![.][A][ToggleSmile] */
        0xc51   /* [ToggleSmile]Not until I've become a[.][NL]great sage, like my teacher.[A][ToggleSmile] */
    };

    switch (proc->pid) {
    case CHARACTER_AMELIA:
        i = 1;
        break;

    case CHARACTER_EWAN:
        i = 2;
        break;

    case CHARACTER_ROSS:
    default:
        i = 0;
        break;
    }

    if (msgs[i] == (u32)-1) {
        Proc_Goto(proc, 3);
        return;
    }
    else {
        sub_808F128(0x16, 0x12, 0x12, 4, msgs[i], 0x06011800, -1, 0);
        sub_808E9D8(0xa);
    }
}

int PromoMain_SetupTraineeEvent_(struct ProcPromoMain *proc) {
    PromoMain_SetupTraineeEvent(proc);
    return 0;
}

bool PromoTraineeEventExists(struct ProcPromoMain *proc) {
    if (proc->stat == PROMO_MAIN_STAT_TRAINEE_EVENT)
        return false;
    else
        return true;
}

void sub_80CDA4C(struct MenuProc *proc) {
    s32 i;
    for (i = 0; i < proc->itemCount; i++) {
        if (proc->menuItems[i]->def->onDraw == 0) {
            Text_SetXCursor(&proc->menuItems[i]->text, 0);
        }
    }
}

u8 PromoSelMenu_OnInit(struct MenuProc *proc) {
    SyncMenuBgs(proc);
    return 0;
}

extern struct Font gUnknown_03005380;

u8 PromoSelMenu_OnEnd(struct MenuProc *proc) {
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 4), 0xa, 6, 0);
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 8, 4), 0xa, 6, 0);
    SetFont(&gUnknown_03005380);
    sub_80CDA4C(proc->proc_parent);
    RedrawMenu(proc->proc_parent);
    SyncMenuBgs(proc);
    return 0;
}

u8 sub_80CDAD8(struct MenuProc *proc, struct MenuItemProc *b) {
    if (b->itemNumber == 0) {
        ProcPtr found;
        EndMenu(proc);
        EndMenu(proc->proc_parent);
        found = Proc_Find(ProcScr_PromoMain);

        EndAllProcChildren(found);
        sub_80CCBD4();
        Proc_Goto(found, 5);
    }
    return 7;
}

u8 PromoSelMenu_OnBPress(struct MenuProc *_proc, struct MenuItemProc *_proc2) {
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}

u32 PromoSelMenuOnInit(struct MenuProc *proc) {
    SyncMenuBgs(proc);
    return 0;
}

u32 PromoSelMenuOnEnd(struct MenuProc *proc) {
    SyncMenuBgs(proc);
    return 0;
}

// TODO: write in shift-jis. Also, why so much padding required?
const char gText_082070B8[] = { 0x81, 0x40, 0x82, 0xe2, 0x82, 0xdf, 0x82, 0xe9, 0x0, 0x0, 0x0, 0x0 };
const char gText_082070C4[] = { 0x81, 0x40, 0x8c, 0x88, 0x92, 0xe8, 0x0, 0x0 };
const char gText_082070CC[] = { 0x81, 0x40, 0x91, 0xe6, 0x82, 0x52, 0x95, 0xba, 0x8e, 0xed, 0x0, 0x0, };
const char gText_082070D8[] = { 0x81, 0x40, 0x91, 0xe6, 0x82, 0x51, 0x95, 0xba, 0x8e, 0xed, 0x0, 0x0, };
const char gText_082070E4[] = { 0x81, 0x40, 0x91, 0xe6, 0x82, 0x50, 0x95, 0xba, 0x8e, 0xed, 0x0, 0x0, };

u8 sub_80CDAD8(struct MenuProc *proc, struct MenuItemProc *b);

CONST_DATA
struct MenuItemDef MenuItem_PromoSel[] = {
    { gText_082070C4, 35, 0, 0, 0, MenuAlwaysEnabled, 0, sub_80CDAD8, 0, 0 },
    { gText_082070B8, 36, 0, 0, 1, MenuAlwaysEnabled, 0, sub_80CDAD8, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};

u8 PromoSelMenu_OnInit(struct MenuProc *proc);
u8 PromoSelMenu_OnEnd(struct MenuProc *proc);
u8 PromoSelMenu_OnBPress(struct MenuProc *proc, struct MenuItemProc *proc2);

CONST_DATA
struct MenuDef Menu_PromoSel = {
    { 9, 4, 6, 0 },
    1,
    MenuItem_PromoSel,
    (void(*)(struct MenuProc*)) PromoSelMenu_OnInit,
    (void(*)(struct MenuProc*)) PromoSelMenu_OnEnd,
    NULL,
    PromoSelMenu_OnBPress,
    NULL,
    MenuStdHelpBox
};

int PromotionCommand_OnTextDraw(struct MenuProc *a, struct MenuItemProc *b);
u8 PromotionCommand_OnSelect(struct MenuProc *proc, struct MenuItemProc *proc2);
int PromotionCommand_OnChange(struct MenuProc *a, struct MenuItemProc *b);
u8 Usability_ThirdPromotionOption(const struct MenuItemDef *, int number);

CONST_DATA
struct MenuItemDef gMenuItem_PromoSel[] = {
    {
        gText_082070E4,
        0,
        0x6DC,
        0,
        0,
        MenuAlwaysEnabled,
        PromotionCommand_OnTextDraw,
        PromotionCommand_OnSelect,
        0,
        PromotionCommand_OnChange,
        0
    },
    {
        gText_082070D8,
        0,
        0x6DC,
        0,
        1,
        MenuAlwaysEnabled,
        PromotionCommand_OnTextDraw,
        PromotionCommand_OnSelect,
        0,
        PromotionCommand_OnChange,
        0
    },
    {
        gText_082070CC,
        0,
        0x6DC,
        0,
        2,
        Usability_ThirdPromotionOption,
        PromotionCommand_OnTextDraw,
        PromotionCommand_OnSelect,
        0,
        PromotionCommand_OnChange,
        0
    },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
};

u32 PromoSelMenuOnInit(struct MenuProc *proc);
u32 PromoSelMenuOnEnd(struct MenuProc *proc);
u8 PromoSelMenuOnPressB(struct MenuProc *proc, struct MenuItemProc *proc2);

CONST_DATA
struct MenuDef gMenuDef_PromoSel = {
    .rect = { 16, 2, 8, 0 },
    .menuItems = gMenuItem_PromoSel,
    .onInit = (void(*)(struct MenuProc*)) PromoSelMenuOnInit,
    .onEnd = (void(*)(struct MenuProc*)) PromoSelMenuOnEnd,
    .onBPress = PromoSelMenuOnPressB,
};

void BuildPromotionMenu(struct ProcPromoHandler *proc);
void sub_80CDDD4(void);
void nullsub_61(void);

CONST_DATA
struct ProcCmd ProcScr_PromoMenuSel[] = {
    PROC_SLEEP(6),
	PROC_NAME("CCRamifyMenuSelect"),
    PROC_CALL(BuildPromotionMenu),
    PROC_REPEAT(sub_80CDDD4),
    PROC_YIELD,
    PROC_LABEL(0),
    PROC_GOTO(2),
    PROC_LABEL(1),
    PROC_CALL(nullsub_61),
    PROC_LABEL(2),
    PROC_END,
};

extern struct Font gUnknown_03005360;

u8 PromotionCommand_OnSelect(struct MenuProc *proc, struct MenuItemProc *proc2) {
    struct Proc *parent;
    struct ProcPromoSel *gparent;
    struct ProcPromoMain *ggparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    if (gparent->u40 == 0) {
        struct Unit *unit = GetUnitFromCharId(ggparent->pid);
        u8 classnumber = unit->pClassData->number;
        if (proc2->itemNumber <= 1) {
            classnumber = gPromoJidLut[classnumber][proc2->itemNumber];
            ggparent->jid = classnumber;
        } else {
            if (proc2->itemNumber == 2) {
                switch (classnumber) {
                case CLASS_JOURNEYMAN:
                    ggparent->jid = CLASS_JOURNEYMAN_T1;
                    break;
                case CLASS_PUPIL:
                    ggparent->jid = CLASS_PUPIL_T1;
                    break;
                case CLASS_RECRUIT:
                    ggparent->jid = CLASS_RECRUIT_T1;
                    break;
                default:
                    ggparent->jid = classnumber;
                    break;
                }
            }
        }
        switch ((u8) ggparent->jid) {
            case CLASS_RANGER:
            case CLASS_RANGER_F:
            if (unit->state & US_IN_BALLISTA) {
                TryRemoveUnitFromBallista(unit);
            }
            break;
        }
        Font_InitForUI(&gUnknown_03005360, (void *) 0x06001000, 0x80, 0x5);
        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 9, 4), 0xa, 0x6, 0);
        BG_EnableSyncByMask(1);
        StartMenuExt(&Menu_PromoSel, 2, 0, 0, 0, (struct Proc *) proc);
    }
    return 0;
}

u8 PromoSelMenuOnPressB(struct MenuProc *proc, struct MenuItemProc *_proc2) {
    struct Proc *parent;
    struct Proc *gparent;
    struct Proc *ggparent;
    struct ProcPromoHandler *gggparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    gggparent = ggparent->proc_parent;
    if (gggparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        return 0;
    } else {
        if (gggparent->bmtype == PROMO_HANDLER_TYPE_BM) {
            Proc_End(parent);
            Proc_Goto(gparent, 2);
            return 11;
        }
        if (gggparent->bmtype == PROMO_HANDLER_TYPE_PREP) {
            Proc_End(parent);
            Proc_Goto(gparent, 2);
            return 11;
        }
        return 0;
    }
}

void sub_80CDC48(struct MenuProc *a, struct MenuItemProc *b, char *c) {
    u8 unused_stack[32];
    u16 *mapbuf;
    if (b->def->color) {
        Text_SetColorId(&b->text, b->def->color);
    }
    if (b->availability == 2) {
        Text_SetColorId(&b->text, 1);
    }
    sub_8003E00(&b->text, 0, 20);
    Text_SetXCursor(&b->text, 8);
    Text_AppendString(&b->text, c);
    mapbuf = BG_GetMapBuffer(a->frontBg);

    Text_Draw(&b->text, &mapbuf[b->yTile * 32 + b->xTile]);
}

int PromotionCommand_OnTextDraw(struct MenuProc *a, struct MenuItemProc *b) {
    u8 unused_stack[0x48];
    struct Proc *parent;
    struct ProcPromoSel *gparent;
    const struct ClassData *class_data;
    char *string;
    parent = a->proc_parent;
    gparent = parent->proc_parent;
    class_data = GetClassData(gparent->u2c[b->itemNumber]);
    string = GetStringFromIndex(class_data->nameTextId);
    sub_80CDC48(a, b, string);
}

int PromotionCommand_OnChange(struct MenuProc *a, struct MenuItemProc *b) {
    struct Proc *parent;
    struct ProcPromoSel *gparent;
    const struct ClassData *class_data;
    const char *string;
    parent = a->proc_parent;
    gparent = parent->proc_parent;
    gparent->u40 = 1;
    gparent->menu_index = b->itemNumber;
    ChangeClassDescription(gparent->msg_desc[gparent->menu_index]);
    SetTalkPrintDelay(-1);
}

extern struct ProcCmd ProcScr_PromoMenuSel[];
u8 Usability_ThirdPromotionOption(const struct MenuItemDef * _def, int _number) {
    struct Proc *proc = Proc_Find(ProcScr_PromoMenuSel);
    struct Proc *parent = proc->proc_parent;
    struct ProcPromoMain *gparent = parent->proc_parent;
    const struct ClassData *class_data;
    const char *string;
    if (sub_80CCCA4()) {
        struct Unit *unit = GetUnitFromCharId(gparent->pid);
        switch (unit->pClassData->number) {
        case 0x3d:
        case 0x3e:
        case 0x47:
            return 1;
        default:
            return 3;
        }
    } else {
        return 3;
    }
}

CONST_DATA struct MenuRect PromotionMenuRect = {
    .x = 1,
    .y = 1,
    .w = 12,
    .h = 0
};

void BuildPromotionMenu(struct ProcPromoHandler *proc) {
    proc->u4c = 0;
    Font_ResetAllocation();
    Font_InitForUIDefault();
    SetFontGlyphSet(0);
    Font_InitForUI(&gUnknown_03005380, (void *) 0x06001400, 160, 5);
    SetFont(&gUnknown_03005380);
    proc->u50 = StartMenuCore(
		&gMenuDef_PromoSel,
		PromotionMenuRect,
		2,
		0,
		0,
		0,
		(struct Proc *) proc);
}

void sub_80CDDD4(void) {}

void nullsub_61(void) {}

ProcPtr Make6C_PromotionMenuSelect(ProcPtr parent) {
	return Proc_Start(ProcScr_PromoMenuSel, parent);
}

// Some proc names for procs in data_B12A60
const char gProcName_E_guideSub[] = "E_guideSub";
const char gProcName_E_guMenu1ReWrite[] = "E_guMenu1ReWrite";
const char gProcName_E_guMenu2ReWriteFirst[] = "E_guMenu2ReWriteFirst";
const char gProcName_E_guMenu2ReWriteUp[] = "E_guMenu2ReWriteUp";
const char gProcName_E_guMenu2ReWriteDown[] = "E_guMenu2ReWriteDown";
const char gProcName_E_guMess3ReWrite[] = "E_guMess3ReWrite";
const char gProcName_E_Guide[] = "E_Guide";

// Pad the data here so that the linker script doesn't need to specify the
// exact location of data after this file.
const u8 gPromotionData_Filler[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
