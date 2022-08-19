#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bmunit.h"
#include "mu.h"
#include "rng.h"
#include "event.h"

extern u16 gUnknown_0300534E[];

extern u16 gUnknown_08A0035C[];
extern u16 gUnknown_08A00364[];
extern u16 gUnknown_08A0037C[];
extern u16 gUnknown_08A0048C[];

extern struct ProcCmd gUnknown_085916D4[];

// ev_triggercheck.s
void sub_8083D18(void);
void ClearLocalEvents(void);

void sub_8086BB8(ProcPtr, u8*, int);
void sub_80A41C8(void);
int sub_80A4BB0(void);
void sub_80A4CD8(void);
s8 sub_80A5218(int);
void sub_80A522C(int, struct RAMChapterData*);
void sub_80A5A20(int);
void sub_80A6D38(void);
void Make6C_savemenu2(ProcPtr);
void Make6C_opinfo(int, ProcPtr);
void sub_80C541C(ProcPtr);


int sub_80097E8(int chapterId) {

    switch (chapterId) {
        case 0x02:
            return 1;

        case 0x03:
            return 2;

        case 0x04:
            return 3;

        case 0x05:
        case 0x06:
            return 4;

        case 0x07:
            return 5;

        case 0x08:
            return 6;

        case 0x09:
        case 0x38:
            return 7;

        case 0x0A:
        case 0x17:
            return 8;

        case 0x0B:
        case 0x18:
            return 9;

        case 0x0C:
        case 0x19:
        case 0x3D:
        case 0x3E:
            return 10;

        case 0x0D:
        case 0x1A:
            return 11;

        case 0x0E:
        case 0x1B:
            return 12;

        case 0x0F:
        case 0x1C:
            return 13;

        case 0x10:
        case 0x1D:
            return 14;

        case 0x11:
        case 0x1E:
            return 15;

        case 0x12:
        case 0x1F:
            return 16;

        case 0x13:
        case 0x20:
            return 17;

        case 0x14:
        case 0x21:
            return 18;

        case 0x15:
        case 0x16:
        case 0x22:
        case 0x23:
            return 19;

        case 0x00:
        case 0x01:
        default:
            return 0;
    }
}

u8 sub_8009950() {
    int iVar2;
    int iVar4;
    int i;
    struct RAMChapterData chapterData;

    if (sub_80A4BB0() != 0) {
        return 9;
    }

    iVar2 = 0;

    for (i = 0; i < 3; i++) {

        if (sub_80A5218(i) == 0) {
            continue;
        }

        sub_80A522C(i, &chapterData);

        if (chapterData.unk_2C_2 != 0) {
            return 9;
        }

        iVar4 = sub_80097E8(chapterData.chapterIndex);

        if (iVar2 < iVar4) {
            iVar2 = iVar4;
        }

    }

    if (iVar2 > 0x11) {
        return 8;
    } else if (iVar2 > 0xF) {
        return 7;
    } else if (iVar2 > 0xD) {
        return 6;
    } else if (iVar2 > 0xB) {
        return 5;
    } else if (iVar2 > 0x9) {
        return 4;
    } else if (iVar2 > 0x7) {
        return 3;
    } else if (iVar2 > 0x5) {
        return 2;
    } else if (iVar2 > 0x3) {
        return 1;
    } else {
        return 0;
    }
}

s8 sub_80099E4(ProcPtr proc) {

    Make6C_opinfo(sub_8009950(), proc);

    return 0;
}

void Goto6CLabel12IfSomething(ProcPtr proc) {

    if (gKeyStatusPtr->heldKeys == (L_BUTTON | DPAD_RIGHT | SELECT_BUTTON)) {
        Proc_Goto(proc, 0x12);
    }

    return;
}

void sub_8009A24() {

    SetupBackgrounds(0);
    sub_80156D4();

    gRAMChapterData.cfgTextSpeed = 1;

    sub_8086BB8(PROC_TREE_3, 0, -1);

    return;
}

void sub_8009A58(struct GameCtrlProc* proc) {
    proc->unk_2E = 20;

    return;
}

void Null6CCallback(ProcPtr proc) {
    Proc_Break(proc);
    return;
}

void Delete6CIfNotMarkedB(ProcPtr proc) {
    if (((struct Proc*)proc)->proc_mark != 0xB) {
        Proc_End(proc);
    }

    return;
}

void sub_8009A84() {
    CpuFastFill16(0, gPaletteBuffer, 0x400);
    EnablePaletteSync();

    Proc_ForAll(Delete6CIfNotMarkedB);

    SetMainUpdateRoutine(SomeUpdateRoutine);

    return;
}

void sub_8009ABC() {
    Sound_PlaySong8002448(0x43, 0);
    ISuspectThisToBeMusicRelated_8002730(0, 0xC0, 0x3C, 0);
    return;
}


void sub_8009AD8() {
    ISuspectThisToBeMusicRelated_8002730(0x100, 0xC0, 0x20, 0);
    return;
}

void sub_8009AEC(struct GameCtrlProc* proc) {
    int tmp;

    switch (proc->unk_29) {
        case 2:
            Proc_Goto(proc, 4);
            break;
        case 0:
            Proc_Goto(proc, 5);
            sub_8009AD8(proc);
            break;
        case 1:

            tmp = proc->unk_2B;

            switch (tmp & 1) {
                case 0:
                    Proc_Goto(proc, 2);
                    break;

                case 1:
                    Proc_Goto(proc, 1);
                    break;
            }

            proc->unk_2B++;
            break;

        case 3:
            Proc_Goto(proc, 0x18);
            break;
    }

    return;
}

void sub_8009B64(struct GameCtrlProc* proc) {

    switch (proc->unk_29) {
        case 0:
            Proc_Goto(proc, 4);
            break;

        case 1:
            Proc_Goto(proc, 1);
            break;
    }

    return;
}

void GAMECTRL_MasterSwitch(struct GameCtrlProc* proc) {

    switch (proc->unk_29) {
        case 0:
            sub_80BC81C();

            // fallthrough

        case 1:
        case 2:
        case 3:
            Proc_Goto(proc, 7);
            return;

        case 4:
            Proc_Goto(proc, 8);
            return;

        case 5:
            Proc_Goto(proc, 0x19);
            return;

        case 6:
            Proc_Goto(proc, 0xC);
            return;

        case 7:
            Proc_Goto(proc, 0xE);
            return;

        case 12:
            Proc_Goto(proc, 0xF);
            return;

        case 8:
        case 9:
        case 10:
        case 11:
        default:
            return;
    }

    return;
}

void sub_8009C1C(struct GameCtrlProc* proc) {

    if (proc->unk_29 == 5) {
        Proc_Goto(proc, 4);
    }

    return;
}

void sub_8009C34(struct GameCtrlProc* proc) {

    Proc_Goto(proc, 4);
    return;
}

void sub_8009C40(struct GameCtrlProc* proc) {

    if (proc->unk_29 == 0) {
        return;
    }

    if (proc->unk_29 == 1) {
        Proc_Goto(proc, 0x13);
    }

    return;
}

void sub_8009C5C(struct GameCtrlProc* proc) {
    if (proc->unk_29 == 5) {
        Proc_Goto(proc, 5);
    } else {
        InitPlaythroughState(0, 0);

        gRAMChapterData.chapterStateBits |= 8;

        sub_8083D18();
        ClearLocalEvents();

        ClearUnits();

        gRAMChapterData.chapterIndex = proc->unk_2A;
    }

    return;
}

void sub_8009CA4() {
    sub_80A6D38();
    sub_80A41C8();

    ChapterChangeUnitCleanup();

    gRAMChapterData.chapterIndex = 0x7F;

    return;
}

void sub_8009CC0() {
    sub_80A5A20(3);

    gRAMChapterData.unk41_1 = 0;

    return;
}

void sub_8009CE0(struct GameCtrlProc* proc) {

    MU_EndAll();

    switch (proc->unk_29) {
        case 0:
            Proc_Goto(proc, 4);
            break;

        case 3:
            Proc_Goto(proc, 0x10);
            break;

        case 1:
        case 2:
        default:
            break;
    }

    return;
}

#if NONMATCHING

void sub_8009D1C(struct GameCtrlProc* proc) {
    if ((gRAMChapterData.unk4A_2 == 4) || (gRAMChapterData.unk4A_2 == 8)) {
        Proc_Goto(proc, 6);
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_8009D1C(struct GameCtrlProc* proc) {

    asm("\n\
        .syntax unified\n\
        push {lr}\n\
        adds r2, r0, #0\n\
        ldr r0, _08009D40  @ gRAMChapterData\n\
        adds r0, #0x4a\n\
        ldrb r0, [r0]\n\
        movs r1, #0xe\n\
        ands r1, r0\n\
        cmp r1, #4\n\
        beq _08009D32\n\
        cmp r1, #8\n\
        bne _08009D3A\n\
    _08009D32:\n\
        adds r0, r2, #0\n\
        movs r1, #6\n\
        bl Proc_Goto\n\
    _08009D3A:\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08009D40: .4byte gRAMChapterData\n\
        .syntax divided\n\
    ");

}

#endif // NONMATCHING

void sub_8009D44(struct GameCtrlProc* proc) {
    if (gRAMChapterData.chapterStateBits & 4) {
        return;
    }

    if (!(gRAMChapterData.chapterStateBits & 0x20)) {
        return;
    }

    Proc_Goto(proc, 0x11);

    return;
}

void sub_8009D6C(struct GameCtrlProc* proc) {
    if (gRAMChapterData.chapterStateBits & 0x80) {
        Proc_Goto(proc, 10);
    } else {
        Proc_Goto(proc, 9);
    }

    return;
}

void sub_8009D98(struct GameCtrlProc* proc) {
    int i;

    for (i = 0; i <= 2; i++) {
        NextRN();
    }

    StoreRNState(gUnknown_0300534E);

    if (CheckEventId(3) != 0) {
        RegisterChapterTimeAndTurnCount(&gRAMChapterData);
    }

    ComputeChapterRankings();

    gRAMChapterData.chapterIndex = proc->unk_2A;

    ChapterChangeUnitCleanup();

    return;
}

void CallActualSaveMenu(struct GameCtrlProc* proc) {
    if (gRAMChapterData.chapterIndex != 0x38) {
        Make6C_savemenu2(proc);
    }

    return;
}

void sub_8009E00(struct GameCtrlProc* proc) {
    if (gRAMChapterData.chapterStateBits & 4) {
        return;
    }

    if (gRAMChapterData.chapterIndex != 0) {
        return;
    }

    sub_80C541C(proc);

    return;
}

void sub_8009E28() {

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
    sub_8001ED0(1, 1, 1, 1, 1);
    sub_8001F48(1);

    return;
}

void sub_8009E54() {
    SetupBackgrounds(0);

    switch (gRAMChapterData.chapterModeIndex) {
        case 2:
            CallEvent(gUnknown_08A0035C, 1);
            break;

        case 3:
            CallEvent(gUnknown_08A00364, 1);
            break;
    }

    SetEventId(0x84);

    return;
}

void sub_8009E98(ProcPtr proc) {
    StartBattleMap(proc);

    sub_80141B0();

    switch (gRAMChapterData.chapterModeIndex) {
        case 2:
            CallEvent(gUnknown_08A0037C, 1);
            break;

        case 3:
            CallEvent(gUnknown_08A0048C, 1);
            break;
    }

    SetEventId(0x84);

    return;
}

void GetChapterIdTo6C(struct GameCtrlProc* proc) {
    proc->unk_30 = gRAMChapterData.chapterIndex;
    return;
}

void SetChapterIdFrom6C(struct GameCtrlProc* proc) {
    gRAMChapterData.chapterIndex = proc->unk_30;
    return;
}

void sub_8009EFC() {
    sub_80A4CD8();
    return;
}

void NewGameControl() {
    struct GameCtrlProc* proc;

    SetMainUpdateRoutine(SomeUpdateRoutine);

    SetInterrupt_LCDVBlank(GeneralVBlankHandler);

    proc = Proc_Start(gUnknown_085916D4, PROC_TREE_3);
    proc->unk_29 = 0;
    proc->unk_2A = 0;
    proc->unk_2B = 0;

    return;
}

struct GameCtrlProc* GetGameControl6C() {
    return Proc_Find(gUnknown_085916D4);
}

void SetNextGameActionId(int param_1) {
    struct GameCtrlProc* proc = GetGameControl6C();

    proc->unk_29 = param_1;

    return;
}

void SetNextChapterId(int param_1) {
    struct GameCtrlProc* proc = GetGameControl6C();

    proc->unk_2A = param_1;

    return;
}

s8 sub_8009F78() {
    struct GameCtrlProc* proc = GetGameControl6C();

    return proc->unk_2A == 0 ? 0 : 1;
}

void RestartGameAndGoto8() {
    struct GameCtrlProc* proc;

    Proc_EndEach(gUnknown_085916D4);

    proc = Proc_Start(gUnknown_085916D4, PROC_TREE_3);

    Proc_Goto(proc, 8);

    return;
}

void RestartGameAndGoto12() {
    struct GameCtrlProc* proc;

    Proc_EndEach(gUnknown_085916D4);

    proc = Proc_Start(gUnknown_085916D4, PROC_TREE_3);

    Proc_Goto(proc, 0x12);

    return;
}

void sub_8009FD4() {
    return;
}

void nullsub_9() {
    return;
}

void ForceEnableSoundEffects() {
    gRAMChapterData.unk41_1 = 0;
    gRAMChapterData.unk41_2 = 0;

    return;
}

void sub_8009FF8() {

    gRAMChapterData.unk42_2 = 0;
    gRAMChapterData.cfgTextSpeed = 1;
    gRAMChapterData.unk40_8 = 0;
    gRAMChapterData.unk41_1 = 0;
    gRAMChapterData.unk41_2 = 1;
    gRAMChapterData.cfgWindowColor = 0;
    gRAMChapterData.unk40_1 = 0;

    return;
}
