#include "global.h"

#include "constants/classes.h"

#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiselecttarget.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "mu.h"
#include "bmtarget.h"

extern u16 gUnknown_08A032AC[];
extern u16 gUnknown_08A03334[]; // palette
extern u16 gUnknown_08A03354[];

extern u16 gUnknown_02022C28[];
extern u16 gUnknown_02022C48[];
extern u16 gUnknown_02022C68[];


// bb.s
void sub_80357A8(ProcPtr, struct Unit*, int, int);
void sub_8035804(struct Unit*, s8);
void sub_803584C(struct Unit*, s8);
void sub_80358C0(struct Unit*, s8);

// trapfx.s
void sub_801F68C(ProcPtr, int, int);
void sub_801F600(ProcPtr, int, int, int);
void sub_801F844(ProcPtr, int);
void sub_801F8C8(ProcPtr, int, int);


struct UnknownBMUSAilmentProc {
    PROC_HEADER;

    /* 29 */ u8 _pad1[0x2C-0x29];
    /* 2C */ int unk_2C;
    /* 30 */ int _pad2;
    /* 34 */ int unk_34;
    /* 38 */ u8 _pad3[0x4C-0x38];

    /* 4C */ s16 unk_4C;
    /* 4E */ u8 _pad4[0x58-0x4E];

    /* 58 */ int unk_58;
};


void sub_8035AA4(void);
void sub_8035B0C(void);

struct ProcCmd CONST_DATA sProcScr_0859E248[] = {
    PROC_CALL(sub_8035AA4),
    PROC_REPEAT(sub_8035B0C),

    PROC_END,
};

void sub_8035B44(struct UnknownBMUSAilmentProc* proc);
void sub_8035BEC(struct UnknownBMUSAilmentProc* proc);
void sub_8035C44(void);

struct ProcCmd CONST_DATA sProcScr_0859E260[] = {
    PROC_CALL(sub_8035B44),
    PROC_REPEAT(sub_8035BEC),
    PROC_CALL(sub_8035C44),

    PROC_END,
};

void sub_8035C58(struct UnknownBMUSAilmentProc* proc);
void sub_8035C80(struct UnknownBMUSAilmentProc* proc);
void sub_8035C6C(struct UnknownBMUSAilmentProc* proc);

struct ProcCmd CONST_DATA sProcScr_0859E280[] = {
    PROC_CALL(sub_8035C58),
    PROC_REPEAT(sub_8035C80),

    PROC_SLEEP(0x20),

    PROC_CALL(sub_8035C6C),
    PROC_REPEAT(sub_8035C80),

    PROC_END,
};

void sub_8035CB8(struct UnknownBMUSAilmentProc* proc);
void sub_8035D44(struct UnknownBMUSAilmentProc* proc);
void sub_8035D70(struct UnknownBMUSAilmentProc* proc);

struct ProcCmd CONST_DATA sProcScr_0859E2B0[] = {
    PROC_CALL(sub_8035CB8),
    PROC_REPEAT(sub_8035D44),
    PROC_REPEAT(sub_8035D70),

    PROC_END,
};

void sub_8035D9C(void);

struct ProcCmd CONST_DATA sProcScr_0859E2D0[] = {
    PROC_START_CHILD(sProcScr_0859E248),
    PROC_START_CHILD(sProcScr_0859E260),
    PROC_START_CHILD(sProcScr_0859E280),
    PROC_START_CHILD(sProcScr_0859E2B0),

    PROC_SLEEP(66),

    PROC_CALL(sub_8035D9C),

    PROC_END,
};

void sub_8035AA4() {
    int i;
    u16* src;
    u16* dst;

    ClearBg0Bg1();

    CopyDataWithPossibleUncomp(gUnknown_08A032AC, (u8*)BG_VRAM + 0x5000);
    CopyToPaletteBuffer(gUnknown_08A03334, 0x60, 0x20);

    CallARM_FillTileRect(gBG0TilemapBuffer, gUnknown_08A03354, 0x3280);

    src = gBG0TilemapBuffer;
    dst = gBG0TilemapBuffer + 0x80;
    for (i = 0; i < 7; dst += 0x80, i++) {
        TileMap_CopyRect(src, dst, 2, 4);
    }

    BG_EnableSyncByMask(1);

    return;
}

void sub_8035B0C() {
    BG_SetPosition(0, gUnknown_0202BCB0.camera.x - (gActiveUnit->xPos * 16), GetGameClock());

    return;
}

void sub_8035B44(struct UnknownBMUSAilmentProc* proc) {

    HideUnitSMS(gActiveUnit);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 1;

    gLCDControlBuffer.wincnt.wout_enableBlend = 0;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.wobj_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wobj_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wobj_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wobj_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wobj_enableObj = 1;

    sub_8001ED0(1, 0, 0, 0, 0);
    sub_8001F0C(0, 0, 0, 0, 1);

    proc->unk_4C = 0x40;

    return;
}

void sub_8035BEC(struct UnknownBMUSAilmentProc* proc) {

    sub_8028014(
        4,
        gActiveUnit->xPos * 16 - gUnknown_0202BCB0.camera.x,
        gActiveUnit->yPos * 16 - gUnknown_0202BCB0.camera.y,
        0x2800,
        gActiveUnit
    );

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

void sub_8035C44() {
    ShowUnitSMS(gActiveUnit);
    return;
}

void sub_8035C58(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 15;
    proc->unk_2C = 0;
    proc->unk_34 = 1;

    return;
}

void sub_8035C6C(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 15;
    proc->unk_2C = 16;
    proc->unk_34 = -1;

    return;
}

void sub_8035C80(struct UnknownBMUSAilmentProc* proc) {

    proc->unk_2C += proc->unk_34;

    SetSpecialColorEffectsParameters(1, proc->unk_2C & 0xFF, 0x10, 0);

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

void sub_8035CB8(struct UnknownBMUSAilmentProc* proc) {
    u16* pal = NULL;

    switch (UNIT_FACTION(gActiveUnit)) {
        case FACTION_BLUE:
            pal = gUnknown_02022C28;
            break;

        case FACTION_RED:
            pal = gUnknown_02022C48;
            break;

        case FACTION_GREEN:
            pal = gUnknown_02022C68;
            break;
    }

    CopyToPaletteBuffer(pal, 0x240, 0x20);

    proc->unk_4C = 0;

    return;
}

void sub_8035D14(struct UnknownBMUSAilmentProc* proc, int unk) {
    if (unk > 31) {
        unk = 31;
    }

    if (unk < 0) {
        unk = 0;
    }

    gPaletteBuffer[0x12F] = (unk << 10) + (unk << 5) + unk;

    EnablePaletteSync();

    return;
}

void sub_8035D44(struct UnknownBMUSAilmentProc* proc) {

    sub_8035D14(proc, proc->unk_4C);
    
    proc->unk_4C++;

    if (proc->unk_4C == 32) {
        Proc_Break(proc);
    }

    return;
}

void sub_8035D70(struct UnknownBMUSAilmentProc* proc) {

    sub_8035D14(proc, proc->unk_4C);

    proc->unk_4C--;

    if (proc->unk_4C < 0) {
        Proc_Break(proc);
    }

    return;
}

void sub_8035D9C() {

    ClearBg0Bg1();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetDefaultColorEffects();

    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;

    return;
}

void sub_8035DDC(struct Unit* unit, ProcPtr proc) {
    gActiveUnit = unit;

    if (proc) {
        Proc_StartBlocking(sProcScr_0859E2D0, proc);
        PlaySoundEffect(0xAA);
        return;
    }

    Proc_StartBlocking(sProcScr_0859E2D0, (ProcPtr) 3);
    return;
}

void sub_8035E20(struct UnknownBMUSAilmentProc* proc) {

    MakeTerrainHealTargetList(gRAMChapterData.chapterPhaseIndex);

    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
    }

    return;
}

void sub_8035E50(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    gActionData.subjectIndex = target->uid;

    if (proc->unk_4C == GetSelectTargetCount()) {
        Proc_End(proc);
        return;
    }

    if ((gRAMChapterData.chapterVisionRange != 0) && (gBmMapFog[unit->yPos][unit->xPos] == 0)) {
        Proc_Goto(proc, 1);
    } else {
        if (GetUnitCurrentHp(unit) == 0) {
            Proc_Goto(proc, 1);
        }
    }

    return;
}

void sub_8035ED8(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    EnsureCameraOntoPosition(proc, target->x, target->y);

    return;
}

void sub_8035EFC(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    if (target->extra < 0) {
        sub_8035DDC(unit, proc);
    } else {
        HideUnitSMS(unit);
        sub_8035804(unit, target->extra);
    }

    return;
}

void sub_8035F40() {
    MU_EndAll();

    if (gBattleActor.unit.curHP != 0) {
        ShowUnitSMS(GetUnit(gActionData.subjectIndex));
    }

    return;
}

void sub_8035F6C(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    if (target->extra < 0) {
        sub_80357A8(proc, unit, 0, 0);
    } else {
        sub_80357A8(proc, unit, target->extra, -1);
    }

    proc->unk_4C++;

    return;
}

void sub_8035FB8(struct UnknownBMUSAilmentProc* proc) {
    MakePoisonDamageTargetList(gRAMChapterData.chapterPhaseIndex);
    sub_8026414(4);

    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
    }

    return;
}

void sub_8035FF0(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    HideUnitSMS(unit);

    sub_803584C(unit, target->extra);

    return;
}

void sub_803601C(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    sub_80357A8(proc, unit, -(target->extra), -1);

    proc->unk_4C++;

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) == 0) {
        if (CheckForWaitEvents() != 0) {
            RunWaitEvents();
        }
    }

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) < 1) {
        SMS_UpdateFromGameData();
    }

    return;
}

void sub_803608C(struct Unit* unit) {

    if (unit->pClassData->number != CLASS_GORGONEGG2) {
        unit->pClassData = GetClassData(CLASS_GORGONEGG2);

        RefreshEntityBmMaps();
        RenderBmMap();
        SMS_UpdateFromGameData();
        MU_EndAll();
    }

    return;
}

void sub_80360B8(struct UnknownBMUSAilmentProc* proc) {

    MakeGorgonEggHatchTargetList(gRAMChapterData.chapterPhaseIndex);

    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
    }

    return;
}

void sub_80360E8(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    HideUnitSMS(unit);

    sub_803608C(unit);
    sub_80358C0(unit, target->extra);

    return;
}

void sub_803611C(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    sub_80357A8(proc, unit, target->extra, -1);

    proc->unk_4C++;

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) == 0) {
        if (CheckForWaitEvents() != 0) {
            RunWaitEvents();
        }
    }

    if (GetUnitCurrentHp(GetUnit(gActionData.subjectIndex)) < 1) {
        SMS_UpdateFromGameData();
    }

    return;
}

void sub_8036188(struct UnknownBMUSAilmentProc* proc) {
    if (GetSelectTargetCount() == 0) {
        Proc_End(proc);
    } else {
        proc->unk_4C = 0;
        proc->unk_58 = 0;
    }

    return;
}

void sub_80361AC(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    int status = GetUnit(gActionData.subjectIndex)->statusIndex;

    proc->unk_58 = status;

    SetUnitStatus(GetUnit(gActionData.subjectIndex), 0);

    switch (status) {
        case UNIT_STATUS_POISON:
        case UNIT_STATUS_SLEEP:
        case UNIT_STATUS_SILENCED:
        case UNIT_STATUS_BERSERK:
        case UNIT_STATUS_RECOVER:
        case UNIT_STATUS_PETRIFY:
        case UNIT_STATUS_13:
            sub_8035DDC(GetUnit(target->uid), proc);
            break;
    }

    return;
}

void sub_803623C(struct UnknownBMUSAilmentProc* proc) {

    if ((proc->unk_58 == UNIT_STATUS_PETRIFY) || (proc->unk_58 == UNIT_STATUS_13)) {
        SetUnitStatus(GetUnit(gActionData.subjectIndex), 0);
        GetUnit(gActionData.subjectIndex)->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);

        RefreshEntityBmMaps();
        RenderBmMap();
        SMS_UpdateFromGameData();
        MU_EndAll();
    }

    SetUnitStatus(GetUnit(gActionData.subjectIndex), 0);

    proc->unk_4C++;

    return;
}

void sub_803629C(struct UnknownBMUSAilmentProc* proc) {
    proc->unk_4C = 0;
    return;
}

void sub_80362A4(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    gActionData.subjectIndex = target->uid;

    if (proc->unk_4C == GetSelectTargetCount()) {
        Proc_End(proc);
        return;
    }

    if (target->uid == 0) {
        return;
    }

    if ((gRAMChapterData.chapterVisionRange != 0) && (gBmMapFog[unit->yPos][unit->xPos] == 0)) {
        Proc_Goto(proc, 1);
    } else {
        if (GetUnitCurrentHp(unit) == 0) {
            Proc_Goto(proc, 1);
        }
    }

    return;
}

void sub_8036334(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);

    if (target->uid != 0 || target->extra != 6) {
        EnsureCameraOntoPosition(proc, target->x, target->y);
    }

    return;
}

void sub_8036364(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);

    if (target->uid == 0) {
        switch (target->extra) {
            case 4:
                sub_801F68C(proc, target->x, target->y);
                break;

            case 0x64:
                sub_801F600(proc, target->x, target->y, 3);
                break;

            case 0x65:
                sub_801F600(proc, target->x, target->y, 2);
                break;

            case 0x66:
                sub_801F600(proc, target->x, target->y, 0);
                break;

            case 0x67:
                sub_801F600(proc, target->x, target->y, 1);
                break;

            case 7:
                sub_801F844(proc, target->x);
                break;

            case 6:
                sub_801F8C8(proc, target->x, target->y);
                break;
        }

        proc->unk_4C++;

        Proc_Goto(proc, 0);
    } else {
        gActionData.subjectIndex = target->uid;
        gActionData.trapType = target->extra;

        HideUnitSMS(GetUnit(gActionData.subjectIndex));

        if (gActionData.trapType < 6) {
            sub_803584C(GetUnit(gActionData.subjectIndex), target->extra);
        } else {
            sub_803592C(GetUnit(gActionData.subjectIndex), target->extra);
        }
    }

    return;
}

void sub_8036474(struct UnknownBMUSAilmentProc* proc) {
    struct SelectTarget* target = GetTarget(proc->unk_4C);
    struct Unit* unit = GetUnit(target->uid);

    if (target->extra < 6) {
        sub_80357A8(proc, unit, -(target->extra), 1);
    } else {
        sub_80357A8(proc, unit, -(target->extra), -1);
    }

    if (GetUnitCurrentHp(unit) <= 0) {
        SMS_UpdateFromGameData();
    }

    proc->unk_4C++;

    return;
}
