#include "global.h"

#include "anime.h"
#include "ap.h"
#include "bmbattle.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmunit.h"
#include "ctc.h"
#include "fontgrp.h"
#include "functions.h"
#include "hardware.h"
#include "mu.h"
#include "proc.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uimenu.h"
#include "uiutils.h"

struct PromoProc
{
    PROC_HEADER;
    ProcPtr u2c;
    u8 u30;
    u8 u31;
    s8 u32;
    u8 u33;
    u8 u34;
    s8 u35;
    struct Unit *u38;
    s32 u3c;
    u32 u40;
};

extern const struct ProcCmd gUnknown_08B12614[];

ProcPtr Make6C_PromotionMain(ProcPtr proc);

void MakePromotionScreen(ProcPtr proc, u32 a, u32 b) {
    struct PromoProc *proc_ = (struct PromoProc *) proc;
    u8 a_ = a;
    u8 b_ = b;
    u8 * res;
    proc_->u30 = 0;
    res = Make6C_PromotionMain(proc_);
    proc_->u2c = res;
    res[0x38] = a_;
    res[0x39] = b_;
}

ProcPtr Make6C_PromotionMain(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_08B12614, proc);
}

/* Seems like there are a couple of proc structures going on here */
struct PromoProc2
{
    PROC_HEADER;
    u8 u29;
    struct Unit *unit;
    u32 u30;
    ProcPtr u34;
    u8 u38;
    s8 _u39;
    s8 _u3a;
    s8 u3b;
};

void sub_80CC4AC(struct PromoProc2 *proc) {
    struct PromoProc *parent;
    proc->u29 = 0;
    proc->u30 = 0;
    proc->u34 = 0;
    parent = proc->proc_parent;
    if (parent->u31 == 0) {
        ResetFaces();
        Font_InitForUIDefault();
        LoadUiFrameGraphics();
        LoadObjUIGfx();
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
    if (parent->u31 == 1) {
        struct PromoProc *gparent = parent->proc_parent;

        SetupBackgrounds(0);
        EndGreenTextColorManager();
        gparent->u40 = GetThread2SkipStack();
        EndHelpPromptSprite();
        sub_80ADC90();
        DeleteEach6CDifferedLoop();
        DeleteFaceByIndex(0);
        sub_80ACA84(0);
        ResetFaces();
        Font_InitForUIDefault();
        LoadUiFrameGraphics();
        LoadObjUIGfx();
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
        BG_EnableSyncByMask(2);
    }
    if (parent->u31 == 2) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
}

void sub_80CC5B4(struct PromoProc2 *proc) {
    struct PromoProc *parent = proc->proc_parent;
    switch (parent->u31) {
        case 0:
            Proc_Goto(proc, 2);
            break;
        case 1:
            if (!parent->u34) {
                proc->u3b = parent->u35;
                Proc_Goto(proc, 5);
            }
            else if (parent->u34 == 1)
                Proc_Goto(proc, 4);
            break;
        case 2:
            if (!parent->u34) {
                proc->u3b = parent->u35;
                Proc_Goto(proc, 5);
            }
            else if (parent->u34 == 1)
                Proc_Goto(proc, 4);
            break;
    }
}

void sub_80CC628(struct PromoProc2 *proc) {
    struct PromoProc *parent = proc->proc_parent;
    if (parent->u31 == 0) {
        if (parent->u34 == 0) {
            proc->u3b = parent->u35;
            Proc_Goto(proc, 5);
        }
        if (parent->u34 == 1) {
            Proc_Goto(proc, 4);
        }
    }
}

void sub_80CC66C(struct PromoProc2 *proc) {
    struct PromoProc *parent = proc->proc_parent;
    switch (parent->u31) {
        case 0:
        case 1:
            break;
        case 2:
            BMapDispResume();
            SMS_UpdateFromGameData();
            SetupMapSpritesPalettes();
            SMS_FlushIndirect();
            Font_LoadForUI();
            break;
    }
}

void sub_80CC698(struct PromoProc2 *proc) {
    struct PromoProc *parent = proc->proc_parent;
    if (parent->u31 == 0) {
        sub_8002670();
        Sound_SetSEVolume(0x100);
        sub_8002620(0x34);
    }
    parent->u30 = 2;
    sub_80ADDD4(proc);
    Proc_End(proc);
}

struct MaybeTraineeData {
    u8 a;
    u8 b;
    u8 c;
    u8 d;
};

struct MaybeTraineeList {
    struct MaybeTraineeData members[3];
};
extern struct MaybeTraineeList gUnknown_08207044;

u32 sub_80CC6D4(struct PromoProc *proc) {
    struct MaybeTraineeList trainees = gUnknown_08207044;
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
            unit = GetUnitFromCharId(trainees.members[i].a);
            if (!unit) {
                flag = 1;
            }
            if (unit->state & 0x10004) {
                flag = 1;
            }
            if (unit->level < trainees.members[i].b) {
                flag = 1;
            }
            classNumber = unit->pClassData->number;
            if (classNumber != trainees.members[i].c) {
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

                if (trainees.members[i].a != somethingAboutPath) {
                    MakePromotionScreen(proc, trainees.members[i].a, (u8) somethingAboutPath);
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

void sub_80CC990(struct PromoProc2 *proc) {
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
    new_proc->u3c = parent->u30;
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

struct PromoProc3
{
    PROC_HEADER;
    s8 _u29;
    s8 _u2a;
    s8 _u2b;
    u16 u2c[3];
    u16 u32[3];
    u16 u38[3];
    u16 _u3e;
    u8 u40;
    u8 u41;
    u16 u42;
    u16 u44;
    u8 u46;
    u8 u47;
    u16 u48;
    u8 u4a[3];
    u8 _u4d[3];
    u32 u50;
    ProcPtr u54;
    /* ... more maybe */
};

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

extern struct ProcCmd gUnknown_08B127EC[];
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

struct PromoProc4
{
    PROC_HEADER;
    s8 _u29;
    u16 u2a;
    u16 _u2c;
    u8 u2e;
    u8 _u2f;
    ProcPtr u30;
};

void sub_80CD658(struct PromoProc4 *a) {
    a->u30 = sub_80CD668(a);
}

extern struct ProcCmd gUnknown_08B1280C[];
ProcPtr sub_80CD668(ProcPtr a) {
    return Proc_StartBlocking(gUnknown_08B1280C, a);
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

struct Unknown_0820707C {
    u32 a[3];
};
extern struct Unknown_0820707C gUnknown_0820707C;

extern s8 gUnknown_03005398[];

void sub_80CD7FC(struct PromoProc4 *proc) {
    struct Unknown_0820707C locals = gUnknown_0820707C;
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

struct Unknown_08207088 {
    u32 a[3];
};
extern struct Unknown_08207088 gUnknown_08207088;

void sub_80CD898(struct PromoProc4 *proc) {
    struct Unknown_08207088 locals = gUnknown_08207088;
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

struct Unknown_08207094 {
    u32 a[3];
};
extern struct Unknown_08207094 gUnknown_08207094;

void sub_80CD8F8(struct PromoProc4 *proc) {
    struct Unknown_08207094 locals = gUnknown_08207094;
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

struct Unknown_082070A0 {
    u32 a[3];
};
extern struct Unknown_082070A0 gUnknown_082070A0;

void sub_80CD958(struct PromoProc4 *proc) {
    struct Unknown_082070A0 locals = gUnknown_082070A0;
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

struct Unknown_082070AC {
    u32 a[3];
};
extern struct Unknown_082070AC gUnknown_082070AC;

void sub_80CD9B8(struct PromoProc4 *proc) {
    struct Unknown_082070AC locals = gUnknown_082070AC;
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

int sub_80CDA2C(struct PromoProc4 *a) {
    sub_80CD658(a);
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

u32 sub_80CDA84(struct MenuProc *proc) {
    SyncMenuBgs(proc);
    return 0;
}

extern u16 gUnknown_02022DB8[];
extern u16 gUnknown_02023DB8[];
extern struct Font gUnknown_03005380;

u32 sub_80CDA90(struct MenuProc *proc) {
    TileMap_FillRect(gUnknown_02022DB8, 0xa, 6, 0);
    TileMap_FillRect(gUnknown_02023DB8, 0xa, 6, 0);
    SetFont(&gUnknown_03005380);
    sub_80CDA4C(proc->proc_parent);
    RedrawMenu(proc->proc_parent);
    SyncMenuBgs(proc);
    return 0;
}

struct arg_80CDAD8 {
    u8 _pad[0x3c];
    s8 u3c;
};
u32 sub_80CDAD8(struct MenuProc *proc, struct arg_80CDAD8 *b) {
    if (b->u3c == 0) {
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

u32 sub_80CDB18(void) {
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
