#include "global.h"

#include "bmbattle.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "ctc.h"
#include "fontgrp.h"
#include "functions.h"
#include "hardware.h"
#include "mu.h"
#include "proc.h"
#include "soundwrapper.h"
#include "statscreen.h"
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
    s8 u29;
    struct Unit *unit;
    u32 u30;
    u32 u34;
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
        Sound_SetVolume80022EC(0x100);
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

void sub_80CCBD4(void) {
    sub_805A9E0();
    sub_805AA28(gUnknown_030053A0);
    sub_805AE14(gUnknown_0201FADC);
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

u8 LoadClassBattleSprite(u16*, u8, u16);

void sub_80CD47C(int, int, int, int, int);
void sub_80CD408(int, int, int);
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
