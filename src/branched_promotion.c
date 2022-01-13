#include "global.h"

#include "bmbattle.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
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
    s8 u29;
    s8 u2a;
    s8 u2b;
    ProcPtr u2c;
    u8 u30;
    u8 u31;
    s8 u32;
    u8 u33;
    u8 u34;
    s8 u35;
    s8 u36;
    s8 u37;
    struct Unit *u38;
    s32 u3c;
    u32 u40;
    s8 u44[36];
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
    s8 u2a;
    s8 u2b;
    struct Unit *unit;
    u32 u30;
    u32 u34;
    s8 u38;
    s8 u39;
    s8 u3a;
    s8 u3b;
    s8 u3c;
    s8 u3d;
    s8 u3e;
    s8 u3f;
    s8 u40;
    s8 u41[40];
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
