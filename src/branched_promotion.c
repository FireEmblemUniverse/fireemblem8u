#include "global.h"

#include "anime.h"
#include "ap.h"
#include "bmarch.h"
#include "bmbattle.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmunit.h"
#include "branched_promotion.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "ctc.h"
#include "fontgrp.h"
#include "functions.h"
#include "hardware.h"
#include "mu.h"
#include "proc.h"
#include "soundwrapper.h"
#include "uimenu.h"
#include "uiutils.h"

u8 PromotionInit_SetNullState(struct PromoProc *proc);
void PromotionInit_Loop(struct PromoProc *proc);

CONST_DATA
struct ProcCmd gUnknown_08B126CC[] =
{
    PROC_SLEEP(3),
    PROC_LABEL(0),
    PROC_CALL(PromotionInit_SetNullState),
    PROC_LABEL(1),
    PROC_REPEAT(PromotionInit_Loop),
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

struct TraineeList {
    struct TraineeData members[3];
};
const struct TraineeList gTrainees = {
    {
        { CHARACTER_ROSS, 10, CLASS_JOURNEYMAN },
        { CHARACTER_AMELIA, 10, CLASS_RECRUIT },
        { CHARACTER_EWAN, 10, CLASS_PUPIL }
    }
};

void SetupPromotionScreen(struct PromoProc3 *proc);
void sub_80CCF60(struct PromoProc3 *proc);
void sub_8013D8C(ProcPtr);
void sub_80CD294(struct Proc *proc);
void sub_80CD1D4(struct Proc *proc);
void sub_80CD2CC(struct Proc *proc);
void sub_80CD618(void);
void sub_80CD218(struct Proc *proc);
void LoadBattleSpritesForBranchScreen(struct PromoProc3 *proc);

CONST_DATA
const struct ProcCmd gUnknown_08B1271C[] =
{
    PROC_CALL(sub_8013D68),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_NAME("ccramify"),
    PROC_LABEL(0),
    PROC_CALL(SetupPromotionScreen),
    PROC_SLEEP(6),
    PROC_CALL(sub_80CCF60),
    PROC_LABEL(1),
    PROC_CALL(sub_8013D8C),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_REPEAT(LoadBattleSpritesForBranchScreen),
    PROC_GOTO(3),
    PROC_LABEL(2),
    PROC_CALL(sub_80CD294),
    PROC_CALL(sub_8013D68),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_LABEL(4),
    PROC_CALL(sub_80CD1D4),
    PROC_CALL(sub_80CD2CC),
    PROC_SET_END_CB(sub_80CD618),
    PROC_CALL(sub_8013D68),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(sub_80CD218),
    PROC_LABEL(5),
    PROC_LABEL(3),
    PROC_END,
};

CONST_DATA
const struct ProcCmd gUnknown_08B127EC[] =
{
	PROC_NAME("ccramify_end"),
    PROC_CALL(sub_8013D8C),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_END,
};

void sub_80CD6B0(struct PromoProc4 *proc);
void sub_80CD7FC(struct PromoProc4 *proc);
void sub_808F284(ProcPtr);
void sub_80CD898(struct PromoProc4 *proc);
void sub_80CD8F8(struct PromoProc4 *proc);
void sub_80CD958(struct PromoProc4 *proc);
void sub_80CD9B8(struct PromoProc4 *proc);
u32 sub_80CD67C(void);
void sub_80CD790(struct Proc *proc);

CONST_DATA
const struct ProcCmd gUnknown_08B1280C[] =
{
    PROC_SLEEP(8),
	PROC_NAME("ccramify_event"),
    PROC_LABEL(0),
    PROC_CALL(sub_80CD6B0),
    PROC_LABEL(1),
    PROC_CALL(sub_8013D8C),
    PROC_REPEAT(ContinueUntilSomeTransistion6CExists),
    PROC_CALL(sub_80CD7FC),
    PROC_WHILE(sub_808F284),
    PROC_CALL(sub_80CD898),
    PROC_WHILE(sub_808F284),
    PROC_CALL(sub_80CD8F8),
    PROC_WHILE(sub_808F284),
    PROC_CALL(sub_80CD958),
    PROC_WHILE(sub_808F284),
    PROC_CALL(sub_80CD9B8),
    PROC_WHILE(sub_808F284),
    PROC_LABEL(3),
    PROC_WHILE(sub_80CD67C),
    PROC_LABEL(2),
    PROC_CALL(sub_80CD790),
    PROC_LABEL(4),
    PROC_END,
};

u32 sub_80CC6D4(struct PromoProc *proc) {
    struct TraineeList trainees = gTrainees;
    struct Unit *unit;
    u8 classNumber;
    u32 somethingAboutPath;
    switch (gRAMChapterData.chapterModeIndex) {
        case 2:
        default:
            somethingAboutPath = 1;
            break;
        case 3:
            somethingAboutPath = 0xf;
            break;
    }
    if (!proc->u31) {
        u8 i;
        u8 flag;
        proc->u31 = 0;
        proc->u34 = 1;
        // This probably loops over trainee units - not sure why it goes to 6 though.
        flag = 0;
        for (i = 0; i < 7; i++) {
            unit = GetUnitFromCharId(trainees.members[i].charId);
            if (!unit) {
                flag = 1;
            }
            if (unit->state & 0x10004) {
                flag = 1;
            }
            if (unit->level < trainees.members[i].promotionLevel) {
                flag = 1;
            }
            classNumber = unit->pClassData->number;
            if (classNumber != trainees.members[i].class) {
                flag = 1;
            }
            if (!gUnknown_0895DFA4[classNumber][0] && !gUnknown_0895DFA4[classNumber][1]) {
                flag = 1;
            }
            if (!flag) {
                if (gUnknown_0895DFA4[classNumber][0] && !gUnknown_0895DFA4[classNumber][1]) {
                    proc->u35 = gUnknown_0895DFA4[classNumber][0];
                    proc->u34 = 0;
                }
                if (!gUnknown_0895DFA4[classNumber][0] && gUnknown_0895DFA4[classNumber][1]) {
                    proc->u35 = gUnknown_0895DFA4[classNumber][1];
                    proc->u34 = 0;
                }

                if (trainees.members[i].charId != somethingAboutPath) {
                    MakePromotionScreen(proc, trainees.members[i].charId, (u8) somethingAboutPath);
                } else {
                    MakePromotionScreen(proc, somethingAboutPath, 2);
                }
                return 1;
            }
            flag = 0;
        }
        return 2;
    }
    else if (proc->u31 == 1) {
        proc->u31 = 1;
        proc->u34 = 1;
        unit = GetUnitFromCharId(proc->u33);
        classNumber = unit->pClassData->number;
        if (!gUnknown_0895DFA4[classNumber][0] && !gUnknown_0895DFA4[classNumber][1]) {
            return 2;
        }
        if (gUnknown_0895DFA4[classNumber][0] && !gUnknown_0895DFA4[classNumber][1]) {
            proc->u35 = gUnknown_0895DFA4[classNumber][0];
            proc->u34 = 0;

        }
        if (!gUnknown_0895DFA4[classNumber][0] && gUnknown_0895DFA4[classNumber][1]) {
            proc->u35 = gUnknown_0895DFA4[classNumber][1];
            proc->u34 = 0;
        }

        MakePromotionScreen(proc, proc->u33, 1);
        return 1;
    }
    else if (proc->u31 == 2) {
        proc->u31 = 2;
        proc->u34 = 1;
        unit = GetUnitFromCharId(proc->u33);
        classNumber = unit->pClassData->number;
        if (!gUnknown_0895DFA4[classNumber][0] && !gUnknown_0895DFA4[classNumber][1]) {
            BMapDispResume();
            RefreshBMapGraphics();
            return 2;
        }
        if (gUnknown_0895DFA4[classNumber][0] && !gUnknown_0895DFA4[classNumber][1]) {
            proc->u35 = gUnknown_0895DFA4[classNumber][0];
            proc->u34 = 0;
        }
        if (!gUnknown_0895DFA4[classNumber][0] && gUnknown_0895DFA4[classNumber][1]) {
            proc->u35 = gUnknown_0895DFA4[classNumber][1];
            proc->u34 = 0;
        }
        MakePromotionScreen(proc, proc->u33, 1);
        return 1;
    }
    else
        return 2;
}

u8 PromotionInit_SetNullState(struct PromoProc *proc) {
    proc->u30 = 0;
    return 0;
}

void PromotionInit_Loop(struct PromoProc *proc) {
    switch (proc->u30) {
    case 1:
    default:
        return;
    case 0:
        proc->u30 = sub_80CC6D4(proc);
        break;
    case 2:
        Proc_Break(proc);
        break;

    }
}

extern struct ProcCmd gUnknown_08B126CC[];

void sub_80CC940(ProcPtr parent) {
    struct BattleUnit *actor, *target;
    struct PromoProc *proc = Proc_StartBlocking(gUnknown_08B126CC, parent);
    proc->u31 = 0;
    proc->u32 = 0;
    proc->u38 = 0;
    proc->u3c = -1;
    actor = &gBattleActor;
    target = &gBattleTarget;
    target->weaponBefore = 0;
    actor->weaponBefore = 0;
    target->weapon = 0;
    actor->weapon = 0;
    target->statusOut = -1;
}

struct Proc_80CC990 {
    PROC_HEADER;

    struct Unit *unit;
    u32 u30;
};

void sub_80CC990(struct Proc_80CC990 *proc) {
    struct BattleUnit *actor, *target;
    struct PromoProc *new_proc;
    struct PromoProc2 *parent;

    u32 weapon;
    u32 u30 = proc->u30;
    if (u30 != -1) {
        struct BattleUnit *actor, *target;
        actor = &gBattleActor;
        target = &gBattleTarget;
        target->weaponBefore = proc->unit->items[u30];
        actor->weaponBefore = proc->unit->items[u30];
    }
    weapon = GetUnitEquippedWeapon(proc->unit);
    actor = &gBattleActor;
    target = &gBattleTarget;
    target->weapon = weapon;
    actor->weapon = weapon;
    target->statusOut = -1;

    new_proc = Proc_StartBlocking(gUnknown_08B126CC, proc);
    new_proc->u31 = 1;
    new_proc->u32 = 0;

    parent = new_proc->proc_parent;
    new_proc->u33 = parent->unit->pCharacterData->number;
    new_proc->u38 = parent->unit;
    new_proc->u3c = (s32) parent->u30;
}

void sub_80CCA14(struct PromoProc2 *proc) {
    struct Unit *unit;
    struct PromoProc *new_proc = Proc_StartBlocking(gUnknown_08B126CC, proc);
    new_proc->u31 = 2;
    new_proc->u32 = 0;
    unit = GetUnit(gActionData.subjectIndex);
    new_proc->u33 = unit->pCharacterData->number;
    new_proc->u38 = GetUnit(gActionData.subjectIndex);
    new_proc->u3c = gActionData.itemSlotIndex;
    BMapDispSuspend();
    MU_EndAll();
}

void ChangeClassDescription(u32 a) {
    sub_8006978();
    sub_8008250();
    sub_8006A30(2, 0xf, a);
    sub_8006B10(0);
    sub_8006AA8(1);
    sub_8006AA8(2);
    sub_8006AA8(4);
    sub_8006AA8(8);
    sub_8006AA8(0x40);
    sub_8006AF0(4);
}

struct Struct_80B4108 {
    u16 *a;
    s8 b;
    s8 c;
    s8 d;
};

struct Struct_80B4108 *sub_80B4108(u8 a);

void LoadClassReelFontPalette(struct PromoProc3 *proc, s32 b) {
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
        struct Struct_80B4108 *res = sub_80B4108(buffer[index]);
        if (res) {
            proc->u46 += res->c - res->b;
        } else {
            proc->u46 += 4;
        }
        index++;
        if ((s32) buffer + index > (s32) buffer + 0x13)
            break;
    }
    CopyDataWithPossibleUncomp(&gUnknown_08A36338, (void *) 0x06011000);
    CopyToPaletteBuffer(&gUnknown_08A372C0, 0x280, 0x40);
}

void LoadClassNameInClassReelFont(struct PromoProc3 *proc) {
    s8 buffer[0x20];
    s32 index;
    u8 idx = proc->u41;
    u16 classNum = proc->u2c[idx];
    u32 xOffs = 0x74;
    const struct ClassData *class = GetClassData(classNum);
    GetStringFromIndexInBuffer(class->nameTextId, buffer);
    for (index = 0; buffer[index] != 0;) {
        struct Struct_80B4108 *res = sub_80B4108(buffer[index]);
        if (res) {
            if (res->a) {
                PutSpriteExt(4, xOffs - res->b - 2, res->d + 6, res->a, 0x81 << 7);
                xOffs += res->c - res->b;
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

struct Unknown_030053A0 {
    u8 u00;
    u8 u01;
    u16 u02;
    u16 u04;
    u16 u06;
    u16 u08;
    u16 u0a;
    u16 u0c;
    u16 u0e;
    u16 u10;
    struct Anim *anim1;
    struct Anim *anim2;
    u8 * u1c;
    u8 * u20;
    u8 * u24;
    u8 * u28;
    u8 * _u2c;
    struct Unknown_030053E0 * u30;
};

extern struct Unknown_030053A0 gUnknown_030053A0;

struct Unknown_0201FADC {
    u16 things[8];
    u16 _pad1;
    struct PromoProc3 *p1;
    struct PromoProc3 *p2;
    u32 u1c;
    u8 * u20;
    u32 _pad2;
};

extern struct Unknown_0201FADC gUnknown_0201FADC;

void sub_805AA28(struct Unknown_030053A0 *a);

void sub_805AE14(struct Unknown_0201FADC *a);

void sub_80CCBD4(void) {
    sub_805A9E0();
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
    CopyDataWithPossibleUncomp(a, (void *)0x06003000 + off);
    sub_80CCCE0(gBG2TilemapBuffer, &gUnknown_08A30978, 0x8c << 5);
}

void sub_80CCC2C(struct PromoProc3 *proc) {
    u8 local[0x16];
    const struct ClassData *class;
    char *string;
    DrawUiFrame(gBG2TilemapBuffer, 2, 1, 10, 6, 0, 1);
    SetFontGlyphSet(0);
    SetFont(0);
    class = GetClassData(proc->u2c[0]);
    string = GetStringFromIndex(class->nameTextId);
    DrawTextInline(0, gUnknown_02022D2E, 0, 0, 0x8, string);
    class = GetClassData(proc->u2c[1]);
    string = GetStringFromIndex(class->nameTextId);
    DrawTextInline(0, gUnknown_02022D2E + 0x40, 0, 0, 0x8, string);
}

struct SomeLocal {
    u8 whatever[0x64];
};

u8 LoadSomeUnitStatThingUnlockIdk(struct SomeLocal *);

u8 sub_80CCCA4(void) {
    struct SomeLocal local;
    u8 unlock = LoadSomeUnitStatThingUnlockIdk(&local);
    if (!unlock) {
        sub_80A2DE4();
        LoadSomeUnitStatThingUnlockIdk(&local);
    }

    if (local.whatever[0xe] & 0x1c) {
        if (local.whatever[0xe] & 0xe0) {
            return 1;
        }
    }
    return 0;
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

ProcPtr Make6C_PromotionSub(ProcPtr parent) {
    return Proc_StartBlocking(gUnknown_08B1271C, parent);
}

u8 LoadClassBattleSprite(u16*, u16, u16);

void sub_80CD47C(int, int, int, int, int);
void sub_80CD408(u32, s16, s16);

void sub_8095A1C(void);

ProcPtr Make6C_PromotionMenuSelect(ProcPtr);

void SetupPromotionScreen(struct PromoProc3* proc) {
    struct PromoProc2 *parent = proc->proc_parent;
    struct PromoProc *grandparent;
    struct Unit *unit;
    s32 i;
    s32 charnumber;
    ProcPtr select;
    parent->u29 = 2;
    proc->u42 = parent->u38;
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
        if (unit->pCharacterData->number !=  proc->u42)
            continue;
        charnumber = unit->pClassData->number;
        weapon = GetUnitEquippedWeapon(unit);
        for (j = 0; j < 2; j++) {
            u8 sprite;
            proc->u2c[j] = gUnknown_0895DFA4[charnumber][j];
            sprite = LoadClassBattleSprite(
                &proc->u32[j],
                gUnknown_0895DFA4[charnumber][j],
                weapon);
            proc->u4a[j] = sprite;
            proc->u38[j] = GetClassData(gUnknown_0895DFA4[charnumber][j])->descTextId;
        }
        proc->u48 = weapon;
        if (!sub_80CCCA4())
            break;
        charnumber = unit->pClassData->number;
        switch (charnumber) {
            case 0x3d:
                proc->u2c[2] = 0x7e;
                proc->u4a[2] = LoadClassBattleSprite(&proc->u32[2], 0x7e, weapon);
                proc->u38[2] = GetClassData(0x7e)->descTextId;

                break;
            case 0x3e:
                proc->u2c[2] = 0x7f;
                proc->u4a[2] = LoadClassBattleSprite(&proc->u32[2], 0x7f, weapon);
                proc->u38[2] = GetClassData(0x7f)->descTextId;

                break;
            case 0x47:
                proc->u2c[2] = 0x37;
                proc->u4a[2] = LoadClassBattleSprite(&proc->u32[2], 0x37, weapon);
                proc->u38[2] = GetClassData(0x37)->descTextId;

                break;
        }
        break;
    }
    if (proc->u32[0] == 0 && proc->u32[1] == 0) {
        proc->u32[1] = 0;
        proc->u32[0] = 0;
    }
    proc->u40 = 1;
    proc->u41 = 0;
    LoadClassReelFontPalette(proc, charnumber);
    LoadClassNameInClassReelFont(proc);
    LoadObjUIGfx();

    select = Make6C_PromotionMenuSelect(proc);
    proc->u54 = select;
    grandparent = parent->proc_parent;
    if (grandparent->u31 == 1) {
        sub_8095A1C();
        BG_EnableSyncByMask(0xf);
    }
}

void sub_800680C(u16, u8, u8);

void sub_80CCF60(struct PromoProc3 *proc) {
    s16 x;
    u16 tmp;
    sub_8003D20();
    Font_InitForUIDefault();
    BG_EnableSyncByMask(0xf);
    sub_800680C(0x100, 2, 0);
    x = proc->u38[proc->u41];
    ChangeClassDescription(x);
    sub_8006AF0(-1);
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

u16 GetBattleAnimationId(struct Unit *unit, const void *anim, u16 wpn, u32 *out);
u8 sub_805A96C(struct Unknown_030053A0 *);
void sub_805A990(struct Unknown_030053A0 *);
void LoadBattleSpritesForBranchScreen(struct PromoProc3 *proc) {
    u32 a;
    u8 b;
    struct PromoProc3 *p2;
    struct PromoProc3 *c2;
    struct Anim *anim1;
    struct Anim *anim2;
    struct Unit copied_unit;
    struct Unknown_030053A0 *tmp;
    struct Unknown_030053A0 *tmp2;
    u16 sp58;
    anim1 = gUnknown_030053A0.anim1;
    anim2 = gUnknown_030053A0.anim2;

    p2 = gUnknown_0201FADC.p1;
    c2 = gUnknown_0201FADC.p2;

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
            sub_805A9E0();
            sub_805AA28(&gUnknown_030053A0);
            r4 = proc->u42 - 1;
            r6 = proc->u2c[proc->u41];
            sp58 = 0xffff;
            unit = GetUnitFromCharId(proc->u42);
            copied_unit = *unit;
            copied_unit.pClassData = GetClassData(proc->u2c[proc->u41]);
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
            sub_80CD408(proc->u50, p2->u32[0], p2->u38[1]);
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
    struct PromoProc *gparent = parent->proc_parent;
    switch (gparent->u31) {
    case 0:
        return;
    case 1:
        Proc_End(proc);
        Proc_End(parent);
        Proc_End(gparent);
        sub_805AA28(&gUnknown_030053A0);
        sub_805AE14(&gUnknown_0201FADC);
        sub_805A9E0();
    }
}

void sub_80CD218(struct Proc *proc) {
    struct Proc *parent;
    struct PromoProc *gparent;
    struct Proc *ggparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    if (gparent->u31 == 2) {
        Proc_End(proc);
        Proc_End(parent);
        Proc_End(gparent);
        sub_805AA28(&gUnknown_030053A0);
        sub_805AE14(&gUnknown_0201FADC);
        sub_805A9E0();
        gActionData.unitActionType = 0;
        Proc_Goto(ggparent, 2);
        BMapDispResume();
        RefreshBMapGraphics();
        RefreshEntityBmMaps();
        RenderBmMap();
        SMS_UpdateFromGameData();
        MU_EndAll();
        MU_Create(gActiveUnit);
    }
}

void sub_80CD294(struct Proc *proc) {
    struct Proc *parent;
    struct PromoProc *gparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    if (gparent->u31 == 0) {
        Proc_Goto(proc, 4);
    } else if (gparent->u31 == 1) {
        Proc_Break(proc);
    } else if (gparent->u31 == 2) {
        Proc_Goto(proc, 4);
    }
}

void sub_80CD2CC(struct Proc *proc) {
    struct Proc *parent;
    struct PromoProc *gparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    if (gparent->u31 == 0) {
        Proc_Goto(proc, 5);
    } else if (gparent->u31 == 1) {
        Proc_Goto(proc, 5);
    } else if (gparent->u31 == 2) {
        Proc_Break(proc);
    }
}

u32 sub_80CD2F8(struct PromoProc2 *proc) {
    struct PromoProc2 *tmp = (struct PromoProc2 *)proc;
    switch (tmp->u29) {
    case 1:
        return 0;
    case 0xff:
    case 0:
        proc->u34 = Make6C_PromotionSub(proc);
        tmp->u29 = 1;
        return 0;
    default:
        return 1;
    }
}
u32 sub_80CD330(struct PromoProc2 *proc) {
    switch (proc->u29) {
    case 0:
    case 1:
        return 1;
    case 2:
        return 0;
    default:
        return 1;
    }
}

void sub_80CD34C(void) {
    SetSpecialColorEffectsParameters(1, 16, 16, 0);
    sub_8001ED0(0, 1, 0, 0, 0);
    sub_8001F0C(0, 0, 1, 1, 1);
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

void sub_805AA68(struct Unknown_0201FADC *);
void sub_805AE40(struct Unknown_0201FADC *, s16, s16, s16, s16);

extern u8 gUnknown_020145C8[];


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

struct Unknown_030053E0 {
    u16 u00;
    u16 u02;
    u16 u04;
    u16 u06;
    u16 u08;
    u16 u0a;
    u16 u0c;
    u16 u0e;
    u16 u10;
    u16 u12;
    u16 *buf;
    u8 *u18;
    u8 *u1c;
    u8 *u20;
    void (*u24)(void);
};
extern struct Unknown_030053E0 gUnknown_030053E0;

extern u16 gUnknown_03005408[];
extern u8 gUnknown_02000088[];
extern u8 gUnknown_020041C8[];
extern u8 gUnknown_02004088[];
extern u8 gUnknown_0200F1C8[];

extern u8 gUnknown_02017790[];
extern u8 gUnknown_02019790[];
extern u8 gUnknown_0201A790[];

void sub_806E8F0(void);
void sub_805AA00(struct Unknown_030053A0 *);

void sub_80CD47C(int a, int b, int c, int d, int e) {
    u16 c1 = c;
    u16 d1 = d;
    if (gKeyStatusPtr->heldKeys & 0xc) {
        gUnknown_03005408[0] = 0;
    }

    if (gKeyStatusPtr->newKeys & 0x200) {
        gUnknown_03005408[0] += 1;
    }

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
    gUnknown_030053A0.u24 = gUnknown_020041C8;
    gUnknown_030053A0.u20 = gUnknown_02004088;
    gUnknown_030053A0.u28 = gUnknown_0200F1C8;
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
    gUnknown_030053E0.u18 = gUnknown_02017790;
    gUnknown_030053E0.u1c = gUnknown_02019790;
    gUnknown_030053E0.u20 = gUnknown_0201A790;
    gUnknown_030053E0.u24 = sub_80CD34C;

    sub_806E8F0();
    sub_805AA00(&gUnknown_030053A0);
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
    Proc_Start(gUnknown_08B127EC, (ProcPtr)3);
}

void sub_80CD62C(void) {
    BMapDispResume();
    RefreshBMapGraphics();
    RefreshEntityBmMaps();
    MU_EndAll();
    MU_Create(gActiveUnit);
    RenderBmMap();
    SMS_UpdateFromGameData();
}

ProcPtr sub_80CD668(ProcPtr);

void sub_80CD658(struct PromoProc2 *proc) {
    proc->u30 = sub_80CD668(proc);
}

ProcPtr sub_80CD668(ProcPtr proc) {
    return Proc_StartBlocking(gUnknown_08B1280C, proc);
}

struct U03004980_Member {
    u32 _fill[12];
    u32 u30;
    u16 u34;
};

struct Unknown_03004980 {
    struct U03004980_Member *a;
    struct U03004980_Member *b;
    struct U03004980_Member *c;
    struct U03004980_Member *d;
};
extern struct Unknown_03004980 gUnknown_03004980;

u32 sub_80CD67C(void) {
    u16 start = gUnknown_03004980.a->u34;
    s16 cmp = start;

    if (cmp > 0x150) {
        return 0;
    } else {
        struct U03004980_Member *b = gUnknown_03004980.b;
        struct U03004980_Member *c = gUnknown_03004980.c;
        struct U03004980_Member *d = gUnknown_03004980.d;
        gUnknown_03004980.a->u34 = start + 4;
        d->u34 = start + 4;
        c->u34 = start + 4;
        b->u34 = start + 4;

        return 1;
    }
}

void sub_80CD6B0(struct PromoProc4 *proc) {
    struct PromoProc2 *parent = proc->proc_parent;
    struct Unit *unit;
    proc->u2a = parent->u38;
    unit = GetUnitFromCharId(proc->u2a);
    if (unit) {
        proc->u2e = unit->pCharacterData->portraitId;
    } else {
        proc->u2e = 0;
    }
    ResetFaces();
    Font_InitForUIDefault();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;
    BG_EnableSyncByMask(2);
    sub_8095A1C();
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(0xf);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;
    sub_800680C(0x200, 3, 1);
    SetSpecialColorEffectsParameters(1, 14, 8, 0);
    sub_8001ED0(0, 0, 0, 0, 0);
    sub_8001F0C(0, 0, 0, 1, 0);
}

void sub_80CD790(struct Proc *proc) {
    struct PromoProc2 *parent = proc->proc_parent;
    parent->u29 = -1;
    sub_8010E50();
    sub_8096C20();
    APProc_DeleteAll();
    EndBG3Slider_();
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(4, 0, 0);
    BG_SetPosition(8, 0, 0);
    BG_EnableSyncByMask(15);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;
}

struct Unknown_PromotionTriple {
    u32 a[3];
};
const struct Unknown_PromotionTriple gUnknown_0820707C = { 0xc44, 0xc48, 0xc4d };

extern s8 gUnknown_03005398[];

void sub_80CD7FC(struct PromoProc4 *proc) {
    struct Unknown_PromotionTriple locals = gUnknown_0820707C;
    struct U03004980_Member *b;
    struct U03004980_Member *c;
    struct U03004980_Member *d;
    u8 i;
    u8 negative_one;
    switch (proc->u2a) {
    case 0x12:
        i = 1;
        break;
    case 0x18:
        i = 2;
        break;
    case 0:
    default:
        i = 0;
        break;
    }
    sub_8007938(proc->u2e, 0xd4, 0x50, 0x82, 0);

    negative_one = -1;
    sub_808F128(0x16, 0x12, 0x12, 4, locals.a[i], 0x06011800, negative_one, 0);

    sub_808E9D8(0xa);

    gUnknown_03004980.a->u30 = 0x82;
    b = gUnknown_03004980.b;
    c = gUnknown_03004980.c;
    d = gUnknown_03004980.d;
    d->u30 = 0x80 << 7;
    c->u30 = 0x80 << 7;
    b->u30 = 0x80 << 7;
    gUnknown_03005398[0] = negative_one;
}

const struct Unknown_PromotionTriple gUnknown_08207088 = { 0xc45, 0xc49, 0xc4e };

void sub_80CD898(struct PromoProc4 *proc) {
    struct Unknown_PromotionTriple locals = gUnknown_08207088;
    u8 i;
    u8 negative_one;
    switch (proc->u2a) {
    case 0x12:
        i = 1;
        break;
    case 0x18:
        i = 2;
        break;
    case 0:
    default:
        i = 0;
        break;
    }

    negative_one = -1;
    sub_808F128(0x16, 0x12, 0x12, 4, locals.a[i], 0x06011800, negative_one, 0);

    sub_808E9D8(0xa);
}

const struct Unknown_PromotionTriple gUnknown_08207094 = { 0xc46, 0xc4a, 0xc4f };

void sub_80CD8F8(struct PromoProc4 *proc) {
    struct Unknown_PromotionTriple locals = gUnknown_08207094;
    u8 i;
    u8 negative_one;
    switch (proc->u2a) {
    case 0x12:
        i = 1;
        break;
    case 0x18:
        i = 2;
        break;
    case 0:
    default:
        i = 0;
        break;
    }

    negative_one = -1;
    sub_808F128(0x16, 0x12, 0x12, 4, locals.a[i], 0x06011800, negative_one, 0);

    sub_808E9D8(0xa);
}

const struct Unknown_PromotionTriple gUnknown_082070A0 = { 0xc47, 0xc4b, 0xc50 };

void sub_80CD958(struct PromoProc4 *proc) {
    struct Unknown_PromotionTriple locals = gUnknown_082070A0;
    u8 i;
    u8 negative_one;
    switch (proc->u2a) {
    case 0x12:
        i = 1;
        break;
    case 0x18:
        i = 2;
        break;
    case 0:
    default:
        i = 0;
        break;
    }

    negative_one = -1;
    sub_808F128(0x16, 0x12, 0x12, 4, locals.a[i], 0x06011800, negative_one, 0);

    sub_808E9D8(0xa);
}

const struct Unknown_PromotionTriple gUnknown_082070AC = { -1, 0xc4c, 0xc51 };

void sub_80CD9B8(struct PromoProc4 *proc) {
    struct Unknown_PromotionTriple locals = gUnknown_082070AC;
    u8 i;
    u8 negative_one;
    switch (proc->u2a) {
    case 0x12:
        i = 1;
        break;
    case 0x18:
        i = 2;
        break;
    case 0:
    default:
        i = 0;
        break;
    }

    negative_one = -1;

    if (locals.a[i] == -1) {
        Proc_Goto(proc, 3);
    } else {
        sub_808F128(0x16, 0x12, 0x12, 4, locals.a[i], 0x06011800, negative_one, 0);

        sub_808E9D8(0xa);
    }
}

int sub_80CDA2C(struct PromoProc2 *proc) {
    sub_80CD658(proc);
    return 0;
}

u32 sub_80CDA38(struct PromoProc2 *proc) {
    if (proc->u29 == 0xff) {
        return 0;
    } else {
        return 1;
    }
}

void sub_80CDA4C(struct MenuProc *proc) {
    s32 i;
    for (i = 0; i < proc->itemCount; i++) {
        if (proc->menuItems[i]->def->onDraw == 0) {
            Text_SetXCursor(&proc->menuItems[i]->text, 0);
        }
    }
}

u8 sub_80CDA84(struct MenuProc *proc) {
    SyncMenuBgs(proc);
    return 0;
}

extern u16 gUnknown_02022DB8[];
extern u16 gUnknown_02023DB8[];
extern struct Font gUnknown_03005380;

u8 sub_80CDA90(struct MenuProc *proc) {
    TileMap_FillRect(gUnknown_02022DB8, 0xa, 6, 0);
    TileMap_FillRect(gUnknown_02023DB8, 0xa, 6, 0);
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
        found = Proc_Find(gUnknown_08B12614);

        sub_80ADDD4(found);
        sub_80CCBD4();
        Proc_Goto(found, 5);
    }
    return 7;
}

u8 sub_80CDB18(struct MenuProc *_proc, struct MenuItemProc *_proc2) {
    return 0xb;
}

u32 sub_80CDB1C(struct MenuProc *proc) {
    SyncMenuBgs(proc);
    return 0;
}

u32 sub_80CDB28(struct MenuProc *proc) {
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
struct MenuItemDef gUnknown_08B128C4[] = {
    { gText_082070C4, 35, 0, 0, 0, MenuAlwaysEnabled, 0, sub_80CDAD8, 0, 0 },
    { gText_082070B8, 36, 0, 0, 1, MenuAlwaysEnabled, 0, sub_80CDAD8, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};

u8 sub_80CDA84(struct MenuProc *proc);
u8 sub_80CDA90(struct MenuProc *proc);
u8 sub_80CDB18(struct MenuProc *proc, struct MenuItemProc *proc2);

CONST_DATA
struct MenuDef gUnknown_08B12930 = {
    { 9, 4, 6, 0 },
    1,
    gUnknown_08B128C4,
    (void(*)(struct MenuProc*)) sub_80CDA84,
    (void(*)(struct MenuProc*)) sub_80CDA90,
    0,
    sub_80CDB18,
    0,
    MenuStdHelpBox
};

int PromotionCommand_OnTextDraw(struct MenuProc *a, struct MenuItemProc *b);
u8 PromotionCommand_OnSelect(struct MenuProc *proc, struct MenuItemProc *proc2);
int PromotionCommand_OnChange(struct MenuProc *a, struct MenuItemProc *b);
u8 Usability_ThirdPromotionOption(const struct MenuItemDef *, int number);

CONST_DATA
struct MenuItemDef gUnknown_08B12954[] = {
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

u32 sub_80CDB1C(struct MenuProc *proc);
u32 sub_80CDB28(struct MenuProc *proc);
u8 sub_80CDC14(struct MenuProc *proc, struct MenuItemProc *proc2);

CONST_DATA
struct MenuDef gUnknown_08B129E4 = {
    { 16, 2, 8, 0 },
    0,
    gUnknown_08B12954,
    (void(*)(struct MenuProc*)) sub_80CDB1C,
    (void(*)(struct MenuProc*)) sub_80CDB28,
    0,
    sub_80CDC14,
    0,
    0,
};

void BuildPromotionMenu(struct PromoProc *proc);
void sub_80CDDD4(void);
void nullsub_61(void);

CONST_DATA
struct ProcCmd gUnknown_08B12A08[] = {
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
extern u16 gUnknown_02022DBA[];
u8 PromotionCommand_OnSelect(struct MenuProc *proc, struct MenuItemProc *proc2) {
    struct Proc *parent;
    struct PromoProc3 *gparent;
    struct PromoProc2 *ggparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    if (gparent->u40 == 0) {
        struct Unit *unit = GetUnitFromCharId(ggparent->u38);
        u8 classnumber = unit->pClassData->number;
        if (proc2->itemNumber <= 1) {
            classnumber = gUnknown_0895DFA4[classnumber][proc2->itemNumber];
            ggparent->u3b = classnumber;
        } else {
            if (proc2->itemNumber == 2) {
                switch (classnumber) {
                case 0x3d:
                    ggparent->u3b = 0x7e;
                    break;
                case 0x3e:
                    ggparent->u3b = 0x7f;
                    break;
                case 0x47:
                    ggparent->u3b = 0x37;
                    break;
                default:
                    ggparent->u3b = classnumber;
                    break;
                }
            }
        }
        switch ((u8) ggparent->u3b) {
            case 0x1e:
            case 0x1d:
            if (unit->state & 0x800) {
                TryRemoveUnitFromBallista(unit);
            }
            break;
        }
        Font_InitForUI(&gUnknown_03005360, (void *) 0x06001000, 0x80, 0x5);
        TileMap_FillRect(gUnknown_02022DBA, 0xa, 0x6, 0);
        BG_EnableSyncByMask(1);
        StartMenuExt(&gUnknown_08B12930, 2, 0, 0, 0, (struct Proc *) proc);
    }
    return 0;
}

u8 sub_80CDC14(struct MenuProc *proc, struct MenuItemProc *_proc2) {
    struct Proc *parent;
    struct Proc *gparent;
    struct Proc *ggparent;
    struct PromoProc *gggparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    gggparent = ggparent->proc_parent;
    if (gggparent->u31 == 0) {
        return 0;
    } else {
        if (gggparent->u31 == 1) {
            Proc_End(parent);
            Proc_Goto(gparent, 2);
            return 11;
        }
        if (gggparent->u31 == 2) {
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
    struct PromoProc3 *gparent;
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
    struct PromoProc3 *gparent;
    const struct ClassData *class_data;
    const char *string;
    parent = a->proc_parent;
    gparent = parent->proc_parent;
    gparent->u40 = 1;
    gparent->u41 = b->itemNumber;
    ChangeClassDescription(gparent->u38[gparent->u41]);
    sub_8006AF0(-1);
}

extern struct ProcCmd gUnknown_08B12A08[];
u8 Usability_ThirdPromotionOption(const struct MenuItemDef * _def, int _number) {
    struct Proc *proc = Proc_Find(gUnknown_08B12A08);
    struct Proc *parent = proc->proc_parent;
    struct PromoProc2 *gparent = parent->proc_parent;
    const struct ClassData *class_data;
    const char *string;
    if (sub_80CCCA4()) {
        struct Unit *unit = GetUnitFromCharId(gparent->u38);
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

extern struct MenuRect gUnknown_08B12A60;

void BuildPromotionMenu(struct PromoProc *proc) {
    proc->u4c = 0;
    sub_8003D20();
    Font_InitForUIDefault();
    SetFontGlyphSet(0);
    Font_InitForUI(&gUnknown_03005380, (void *) 0x06001400, 160, 5);
    SetFont(&gUnknown_03005380);
    proc->u50 = StartMenuCore(
		&gUnknown_08B129E4,
		gUnknown_08B12A60,
		2,
		0,
		0,
		0,
		(struct Proc *) proc);
}

void sub_80CDDD4(void) {}

void nullsub_61(void) {}

ProcPtr Make6C_PromotionMenuSelect(ProcPtr parent) {
	return Proc_Start(gUnknown_08B12A08, parent);
}

// Some proc names for procs in data_B12A60
const char gProcName_E_guideSub[] = "E_guideSub";
const char gProcName_E_guMenu1ReWrite[] = "E_guMenu1ReWrite";
const char gProcName_E_guMenu2ReWriteFirst[] = "E_guMenu2ReWriteFirst";
const char gProcName_E_guMenu2ReWriteUp[] = "E_guMenu2ReWriteUp";
const char gProcName_E_guMenu2ReWriteDown[] = "E_guMenu2ReWriteDown";
const char gProcName_E_guMess3ReWrite[] = "E_guMess3ReWrite";
const char gProcName_E_Guide[] = "E_Guide";
