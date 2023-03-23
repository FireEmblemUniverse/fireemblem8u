#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmsave.h"
#include "bmunit.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "ap.h"
#include "gamecontrol.h"

#include "savemenu.h"

struct Unknown203EF64 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
};

extern struct Unknown203EF64 gUnknown_0203EF64; // gSaveMenuRTextData

struct SaveMenu8A20068Proc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ u8 _pad[0x58-0x34];

    /* 58 */ int msgId;
};

extern u16 gUnknown_08A2C23C[];
extern u16 gUnknown_020007A0[];


s8 sub_80A9D20(struct SaveMenuProc*, int);
void StartSqMask(struct SaveMenuProc*, int, int);
void sub_80AA6EC(struct SaveMenuProc*);
s8 sub_80ABA98(struct SaveMenuProc*);
void sub_80AB83C(struct SaveMenuProc*, u8);
void sub_80AB89C(struct SaveMenuProc*);
s8 sub_80AB9FC(struct SaveMenuProc*, int);

//! FE8U = 0x080A882C
void sub_80A882C(ProcPtr proc) {
    Proc_Goto(proc, 18);
    ISuspectThisToBeMusicRelated_8002730(0xc0, 0, 0x10, 0);
    return;
}

//! FE8U = 0x080A8844
u8 sub_80A8844(u8 a, u32 b) {
    int i;
    int count = 0;

    for (i = 0; i < 8; i++) {
        if (((a >> i) & 1) != 0) {
            if (b == count) {
                return (1 << i & 0xff);
            }

            count++;
        }
    }

    return -1;
}

//! FE8U = 0x080A887C
u8 sub_80A887C(u8 a, u8 b) {
    int i;
    int count = 0;

    for (i = 0; i < 8; i++) {
        if (((a >> i) & 1) != 0) {
            if (((b >> i) & 1) != 0) {
                return count;
            }

            count++;
        }
    }

    return -1;
}

//! FE8U = 0x080A88B8
u8 sub_80A88B8(u8 a) {
    int i;

    for (i = 0; i < 8; i++) {
        if (((a >> i) & 1) != 0) {
            return i;
        }
    }

    return -1;
}

//! FE8U = 0x080A88E0
void sub_80A88E0(struct SaveMenuProc* proc) {

    if ((proc->unk_3f == 0xFF) || (proc->unk_36 == 0)) {
        CloseHelpBox();
        proc->unk_3e = 0;

        return;
    }

    switch (proc->unk_42) {
        case 2:
        case 0x10:
        case 0x20:
            if ((proc->unk_36 != 0) && (proc->unk_3e == 0)) {
                LoadDialogueBoxGfx((void*)0x06014000, 9);
                StartHelpBoxExt_Unk(0x30, 0x30, 0x882);
                proc->unk_3e = 1;
            }

            break;
    }

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/5PCbw */

//! FE8U = 0x080A8950
int LoadSaveMenuHelpText(int slot) {
    int leaderId;
    uintptr_t saveBase;
    int i;
    struct PlaySt chapterData;
    struct Unit unit;
    struct GMapData mapData;

    u8 localbuffer[0x30];

    if (!IsSaveValid(slot)) {
        return 0;
    }

    ReadGameSavePlaySt(slot, &chapterData);

    switch (chapterData.chapterModeIndex) {
        case 1:
        case 2:
        default:
            leaderId = 1;
            break;
        case 3:
            leaderId = 0xF;
            break;
    }

    saveBase = GetSaveReadAddr(slot);

    for (i = 0;; i++) {

        if (i >= 0x33) {
            sub_80AA700();
            return 2;
        }

        LoadSavedUnit((void*)((saveBase + 0x4c) + 0x24 * i), &unit);

        if (unit.pCharacterData == NULL) {
            continue;
        }

        if (unit.pCharacterData->number != leaderId) {
            continue;
        }

        gUnknown_0203EF64.unk_00 = leaderId;
        gUnknown_0203EF64.unk_01 = unit.level;

        ReadWorldMapStuff((void*)(saveBase + 0xD8C), &mapData);
        gUnknown_0203EF64.unk_02 = mapData.unk10[0].location;

        return 2;
    }

}

#else // if !NONMATCHING

__attribute__((naked))
int LoadSaveMenuHelpText(int slot) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        sub sp, #0x168\n\
        adds r4, r0, #0\n\
        bl IsSaveValid\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        bne _080A8964\n\
        movs r0, #0\n\
        b _080A89DA\n\
    _080A8964:\n\
        adds r0, r4, #0\n\
        mov r1, sp\n\
        bl ReadGameSavePlaySt\n\
        mov r0, sp\n\
        ldrb r0, [r0, #0x1b]\n\
        cmp r0, #1\n\
        blt _080A897C\n\
        cmp r0, #2\n\
        ble _080A897C\n\
        cmp r0, #3\n\
        beq _080A8980\n\
    _080A897C:\n\
        movs r6, #1\n\
        b _080A8982\n\
    _080A8980:\n\
        movs r6, #0xf\n\
    _080A8982:\n\
        adds r0, r4, #0\n\
        bl GetSaveReadAddr\n\
        adds r7, r0, #0\n\
        movs r5, #0\n\
        adds r4, r7, #0\n\
        adds r4, #0x4c\n\
        b _080A8996\n\
    _080A8992:\n\
        adds r4, #0x24\n\
        adds r5, #1\n\
    _080A8996:\n\
        cmp r5, #0x32\n\
        bgt _080A89D4\n\
        adds r0, r4, #0\n\
        add r1, sp, #0x4c\n\
        bl LoadSavedUnit\n\
        ldr r0, [sp, #0x4c]\n\
        add r1, sp, #0x4c\n\
        cmp r0, #0\n\
        beq _080A8992\n\
        ldrb r0, [r0, #4]\n\
        cmp r0, r6\n\
        bne _080A8992\n\
        ldr r4, _080A89CC  @ gUnknown_0203EF64\n\
        strb r6, [r4]\n\
        ldrb r0, [r1, #8]\n\
        strb r0, [r4, #1]\n\
        ldr r1, _080A89D0  @ 0x00000D8C\n\
        adds r0, r7, r1\n\
        add r5, sp, #0x94\n\
        adds r1, r5, #0\n\
        bl ReadWorldMapStuff\n\
        ldrb r0, [r5, #0x11]\n\
        strb r0, [r4, #2]\n\
        b _080A89D8\n\
        .align 2, 0\n\
    _080A89CC: .4byte gUnknown_0203EF64\n\
    _080A89D0: .4byte 0x00000D8C\n\
    _080A89D4:\n\
        bl sub_80AA700\n\
    _080A89D8:\n\
        movs r0, #2\n\
    _080A89DA:\n\
        add sp, #0x168\n\
        pop {r4, r5, r6, r7}\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080A89E4
s8 sub_80A89E4(struct SaveMenuProc* proc) {
    int a;

    int r7 = 8;

    if (proc->unk_40 == 8) {
        if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON | DPAD_ANY)) {
            CloseHelpBox();
            proc->unk_40 = 7;
        }
    } else if (gKeyStatusPtr->newKeys & R_BUTTON) {
        switch (LoadSaveMenuHelpText(proc->unk_2c)) {
            case 0:
                PlaySoundEffect(0x6c);
                break;
            case 1:
            case 2:
                LoadDialogueBoxGfx((void*)0x06014000, 9);
                StartItemHelpBox(0x50, proc->unk_2c * 0x20 + 0x2c, 0xFFFE);
                proc->unk_40 = r7;
                break;
        }
    }

    a = proc->unk_40;

    if (a == 0) {
        return 0;
    }

    if (a < r7) {
        proc->unk_40--;
    }

    a = proc->unk_40;

    if (a != 0) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080A8A9C
void sub_80A8A9C(struct SaveMenuProc* proc) {
    int i;

    sub_8089678(0xac0);

    for (i = 0; i < 3; i++) {
        if (proc->unk_37[i] != 0xFF) {
            sub_8089624(((0x16800 + (0x800 * (u32)i)) & 0x1FFFF) / 0x20, proc->unk_37[i]);
        } else {
            sub_8089624(((0x16800 + (0x800 * (u32)i)) & 0x1FFFF) / 0x20, -1);
        }
    }

    return;
}

u16 CONST_DATA gBgConfig_SaveMenu[] = {
    0x0000, 0x6000, 0x0000,
    0x0000, 0x6800, 0x0000,
    0x8000, 0x7000, 0x0000,
    0x8000, 0x7800, 0x0000,
};

//! FE8U = 0x080A8AF0
void sub_80A8AF0(void) {
    int mapLocation;
    u32 chapterId;

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE)) {

        chapterId = gPlaySt.chapterIndex;

        if ((gGMData.state & 3) == 3) {
            if (chapterId > 0x01 && chapterId != 0x38) {

                mapLocation = sub_80BD014(&gGMData);
                if (mapLocation < 0) {
                    mapLocation = 0;
                }

                gPlaySt.chapterIndex = WMLoc_GetChapterId(mapLocation);
            }
        } else {
            if (gPlaySt.chapterIndex == 0x06 && CheckEventId(0x88) != 0) {
                gPlaySt.chapterIndex = 0x38;
            } else {
                if (chapterId != 0x01 && chapterId != 0x0A && chapterId != 0x17) {
                    if (gPlaySt.unk4A_2 != 2) {
                        if (!(gBmSt.gameStateBits & 0x10)) {
                            gPlaySt.chapterIndex = sub_80BD224(&gGMData);
                            asm("");
                        }
                    }
                }
            }
        }
    }

    sub_80AA700();

    SetupBackgrounds(gBgConfig_SaveMenu);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.mode = 0;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    sub_8001F48(0);
    sub_8001F64(0);

    SetSpecialColorEffectsParameters(1, 6, 0x10, 0);

    return;
}

//! FE8U = 0x080A8C2C
void SaveMenu_Init(void) {
    sub_80AA700();

    SetupBackgrounds(gBgConfig_SaveMenu);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.mode = 0;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    sub_8001F48(0);
    sub_8001F64(0);

    SetSpecialColorEffectsParameters(1, 6, 0x10, 0);

    return;
}

//! FE8U = 0x080A8CD4
void ProcSaveMenu_InitScreen(struct SaveMenuProc* proc) {
    int i;

    Font_ResetAllocation();

    LoadUiFrameGraphics();
    LoadObjUIGfx();

    CopyToPaletteBuffer(gUnknown_08A25DCC, 0x100, 0x100);

    CopyDataWithPossibleUncomp(gUnknown_08A21658, (void*)(GetBackgroundTileDataOffset(3) + 0x6000000));

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A25ECC, 0x8000);

    CopyToPaletteBuffer(gUnknown_08A268D8, 0xe0, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08A26380, (void*)(GetBackgroundTileDataOffset(3) + 0x06004C00));

    CopyDataWithPossibleUncomp(gUnknown_08A268F8, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x00007260);

    CopyDataWithPossibleUncomp(Img_SaveScreenSprits, (void*)0x06010800);

    CopyToPaletteBuffer(Pal_SaveScreenSprits, 0x240, 0x100);
    CopyToPaletteBuffer(gUnknown_08A295B4, 0x40, 0x20);

    sub_80AA790(&gPaletteBuffer[0x12 * 0x10], &gPaletteBuffer[0x12 * 0x10] - 0x10, 1);
    sub_80AA790(gUnknown_08A2C23C, gUnknown_020007A0, 2);

    BG_EnableSyncByMask(0xf);

    proc->unk_29 = 0;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;

    proc->unk_36 = 0;
    proc->unk_2d = 0xff;
    proc->unk_3d = 0;

    for (i = 0; i < 4; i++) {
        WriteOAMRotScaleData(
            i,
            Div(+COS(0) * 16, 0x100),
            Div(-SIN(0) * 16, 0x100),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, 0x100)
        );
    }

    proc->unk_44 = 0x100;
    proc->unk_3f = 0xff;
    proc->unk_3e = 0;
    proc->unk_40 = 0;

    for (i = 0; i < 4; i++) {
        sub_80ABC14(i, proc);
    }

    sub_80ABD88(proc->unk_2c);
    sub_80AB794();

    BG_EnableSyncByMask(2);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gPaletteBuffer[0] = 0;
    EnablePaletteSync();

    sub_80A8A9C(proc);

    proc->unk_58 = New6C_savedraw(proc);

    return;
}

//! FE8U = 0x080A8F04
void SaveMenu_LoadExtraMenuGraphics(struct SaveMenuProc* proc) {
    CopyDataWithPossibleUncomp(Img_GameMainMenuObjs, (void*)0x06014000);

    sub_80AB89C(proc);

    if (proc->unk_42 == 0x20) {
        proc->unk_2b = sub_80ABF44(0x20, proc);
    } else {
        proc->unk_2e = 2;
        proc->unk_2c = 0;
        proc->unk_2b = 0;
        proc->unk_34 = 0;
        proc->unk_46 = 0;
        proc->unk_42 = sub_80A8844(proc->unk_30, proc->unk_2b);
    }

    if (proc->unk_2e == 2) {
        proc->unk_2f = 0;
    }

    if (proc->unk_2e == 5) {
        proc->unk_2f = 0xdc;
    }

    return;
}

//! FE8U = 0x080A8F8C
void sub_80A8F8C(struct SaveMenuProc* proc) {
    proc->unk_2e = 5;
    proc->unk_2c = ReadLastGameSaveId();
    proc->unk_2b = 0;
    proc->unk_34 = 0;
    proc->unk_46 = 0;
    proc->unk_30 = 0x40;
    proc->unk_42 = 0x40;
    proc->unk_31 = 0;
    proc->unk_2f = 0xdc;
    return;
}

//! FE8U = 0x080A8FD0
void sub_80A8FD0(struct SaveMenuProc* proc) {
    proc->unk_2e = 5;
    proc->unk_2c = ReadLastGameSaveId();
    proc->unk_2b = 0;
    proc->unk_34 = 0;
    proc->unk_46 = 0;
    proc->unk_30 = 0x80;
    proc->unk_42 = 0x80;
    proc->unk_31 = 0;
    proc->unk_2f = 0xdc;
    return;
}

//! FE8U = 0x080A9014
void sub_80A9014(struct SaveMenuProc* proc) {
    Proc_Goto(proc, proc->unk_2e);
    return;
}

//! FE8U = 0x080A9024
void Loop6C_savemenu(struct SaveMenuProc* proc) {
    proc->unk_2e = 2;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        if (proc->unk_2b != 0) {
            proc->unk_2b--;
            PlaySoundEffect(0x66);
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_UP) {
                proc->unk_2b = proc->unk_31 - 1;
                PlaySoundEffect(0x66);
            }
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        if (proc->unk_2b < proc->unk_31 - 1) {
            proc->unk_2b++;
            PlaySoundEffect(0x66);
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                proc->unk_2b = 0;
                PlaySoundEffect(0x66);
            }
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        proc->unk_42 = sub_80A8844(proc->unk_30, proc->unk_2b);
        PlaySoundEffect(0x6a);
        proc->unk_29 = 0;

        switch (proc->unk_42) {
            case 1:
                proc->unk_2c = proc->unk_3f;
                Proc_Goto(proc, 3);

                break;

            case 2:
            case 4:
            case 8:
                proc->unk_2c = sub_80AB98C(ReadLastGameSaveId(), 1, 1);
                Proc_Goto(proc, 3);

                break;

            case 0x10:
                proc->unk_2c = sub_80AB98C(proc->unk_2c, 0, 1);
                Proc_Goto(proc, 1);
                ISuspectThisToBeMusicRelated_8002730(0xC0, 0x100, 0x10, 0);

                break;

            case 0x20:
                if (proc->unk_34 >= proc->unk_33) {
                    proc->unk_34 = 0;
                }

                Proc_Goto(proc, 8);

                break;

            default:
                return;
        }
    } else if (gKeyStatusPtr->newKeys & B_BUTTON) {
        PlaySoundEffect(0x6b);
        Proc_Goto(proc, 18);
        proc->unk_42 = 0x100;
    }

    return;
}

//! FE8U = 0x080A9250
void sub_80A9250(struct SaveMenuProc* proc) {
    int isDifficult;
    s8 isTutorial;

    switch (proc->unk_2a) {
        case 0:
            isTutorial = 0;
            isDifficult = 0;
            break;
        case 1:
            isTutorial = 1;
            isDifficult = 0;
            break;
        case 2:
            isTutorial = 1;
            isDifficult = 1;
            break;
    }

    WriteNewGameSave(proc->unk_2c, isDifficult, 1, isTutorial);

    return;
}

//! FE8U = 0x080A9290
void sub_80A9290(struct SaveMenuProc* proc) {

    if (proc->unk_36 == 0) {
        PlaySoundEffect(0x6a);

        switch (proc->unk_42) {
            case 0x4:
                if (proc->unk_2d == 0xFF) {
                    proc->unk_2d = proc->unk_2c;
                    sub_80AB9FC(proc, 1);
                    return;
                }

                CopyGameSave(proc->unk_2d, proc->unk_2c);
                Proc_Goto(proc, 6);

                return;

            case 0x8:
                proc->unk_36 = 2;
                sub_80AB83C(proc, 1);
                break;

            case 0x40:
                proc->unk_36 = 1;
                sub_80AB83C(proc, 1);
                break;

            case 0x2:
            case 0x20:
            case 0x10:
                proc->unk_36 = 2;
                sub_80AB83C(proc, 1);
                break;
        }

        sub_80A88E0(proc);
        return;
    }

    switch (proc->unk_42) {
        case 0x20:
            if (proc->unk_36 == 1) {
                proc->unk_44 = 0xf0;

                ReadGameSave(proc->unk_2c);

                PlaySoundEffect(0x6a);

                if (proc->unk_35 != 0x10) {
                    if (proc->unk_35 == 0x20) {
                        Proc_Goto(proc, 14);
                    }

                    break;
                }
                sub_80A882C(proc);
            } else {
                PlaySoundEffect(0x6b);
            }

            break;

        case 2:
            if (proc->unk_36 == 1) {
                proc->unk_44 = 0xf0;
                PlaySoundEffect(0x6a);
                sub_80A882C(proc);
            } else {
                PlaySoundEffect(0x6b);
            }

            break;

        case 0x10:
            if (proc->unk_36 == 1) {
                sub_80A9250(proc);
            _080A9432:
                Proc_Goto(proc, 6);
                PlaySoundEffect(0x60);
            } else {
                PlaySoundEffect(0x6b);
            }

            break;

        case 8:
            if (proc->unk_36 == 1) {
                InvalidateGameSave(proc->unk_2c);
                Proc_Goto(proc, 6);
                PlaySoundEffect(0x6a);
            } else {
                PlaySoundEffect(0x6b);
            }

            break;

        case 0x40:
            if (proc->unk_36 == 1) {
                WriteGameSave(proc->unk_2c);
                Proc_Goto(proc, 6);
                PlaySoundEffect(0x60);
            } else {
                Proc_Goto(proc, 0x11);
                proc->unk_42 |= 0x100;
                PlaySoundEffect(0x6b);
            }

            break;
    }

    sub_80AB83C(proc, 0);
    sub_80A88E0(proc);

    return;
}

//! FE8U = 0x080A9494
void sub_80A9494(struct SaveMenuProc* proc) {

    proc->unk_2e = 5;

    if (sub_80A89E4(proc) != 0) {
        return;
    }

    if (proc->unk_36 == 0) {
        if (gKeyStatusPtr->newKeys & DPAD_UP) {
            if (sub_80AB9FC(proc, -1) != 0) {
                PlaySoundEffect(0x66);
            }
        } else if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
            if (sub_80AB9FC(proc, 1) != 0) {
                PlaySoundEffect(0x66);
            }
        }
    } else if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
        if (proc->unk_36 != 1) {
            proc->unk_36 = 1;
            PlaySoundEffect(0x67);
            sub_80A88E0(proc);
        }
    } else if (gKeyStatusPtr->newKeys & DPAD_RIGHT) {
        if (proc->unk_36 != 2) {
            proc->unk_36 = 2;
            PlaySoundEffect(0x67);
            sub_80A88E0(proc);
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        proc->unk_29 = 0;

        switch (proc->unk_42) {
            case 2:
                if (proc->unk_3f != 0xFF) {
                    goto _080A9614;
                }

                PlaySoundEffect(0x6a);
                sub_80A882C(proc);
                return;

            case 0x80:
                if (proc->unk_3f != 0xFF) {
                    proc->unk_44 = 0xf0;
                }

                PlaySoundEffect(0x6a);
                sub_80A882C(proc);
                return;

            case 1:
                PlaySoundEffect(0x6a);
                sub_80A882C(proc);
                return;

            case 0x10:
                if (proc->unk_3f == 0xFF) {
                    break;
                }

                PlaySoundEffect(0x6a);
                sub_80A9290(proc);
                return;
            case 4:
            case 8:
            case 0x40:
        _080A9614:
                sub_80A9290(proc);
                return;
            default:
                return;
        }

        sub_80A9250(proc);
        Proc_Goto(proc, 6);
        PlaySoundEffect(0x60);
        return;

    } else if (gKeyStatusPtr->newKeys & B_BUTTON) {

        proc->unk_29 = 0;
        PlaySoundEffect(0x6b);

        if (proc->unk_36 != 0) {
            sub_80AB83C(proc, 0);
            sub_80A88E0(proc);
            return;
        }

        if (proc->unk_2d != 0xFF) {
            proc->unk_2c = proc->unk_2d;
            proc->unk_2d = -1;
            return;
        }

        if ((proc->unk_42 & 0xc0) != 0) {
            Proc_Goto(proc, 17);
            proc->unk_42 |= 0x100;
            return;
        }

        Proc_Goto(proc, 4);

        return;
    }

    return;
}

//! FE8U = 0x080A96D0
void sub_80A96D0(struct SaveMenuProc* proc) {
    sub_80A9290(proc);
    return;
}

//! FE8U = 0x080A96DC
void sub_80A96DC(struct SaveMenuProc* proc) {
    proc->unk_2e = 6;
    proc->unk_29 = 0;
    return;
}

//! FE8U = 0x080A96EC
void sub_80A96EC(struct SaveMenuProc* proc) {

    if (proc->unk_29 == 8) {
        sub_80ABC14(proc->unk_2c, proc);
        sub_80ABC14(4, proc);

        if (proc->unk_37[proc->unk_2c] != 0xFF) {
            sub_8089624(((u32)(proc->unk_2c * 0x800 + 0x16800) & 0x0001FFFF) >> 5, proc->unk_37[proc->unk_2c]);
        } else {
            sub_8089624(((u32)(proc->unk_2c * 0x800 + 0x16800) & 0x0001FFFF) >> 5, -1);
        }

        sub_80ABD88(proc->unk_2c);

    } else if (proc->unk_29 == 0x20) {
        sub_80AB89C(proc);

        if (proc->unk_42 == 0x10) {
            Proc_Goto(proc, 0x12);
            ISuspectThisToBeMusicRelated_8002730(0xc0, 0, 0x10, 0);
        } else if (proc->unk_42 == 0x40) {
            Proc_Goto(proc, 0x11);
        } else {
            if (sub_80ABA98(proc) != 0) {
                if (proc->unk_2d != 0xFF) {
                    proc->unk_2c = proc->unk_2d;
                    proc->unk_2d = -1;
                } else {
                    proc->unk_2c = sub_80AB98C(proc->unk_2c, 1, 1);
                }

                Proc_Goto(proc, 5);
            }
        }
    } else if (proc->unk_29 == 0x30) {
        proc->unk_2c = 0;
        proc->unk_2d = 0xff;
        proc->unk_29 = 0;
        proc->unk_2b = 0;
        proc->unk_42 = sub_80A8844(proc->unk_30, 0);

        PlaySoundEffect(0x6b);
        Proc_Goto(proc, 4);

        return;
    }

    if (proc->unk_29 == 0x10) {
        WriteOAMRotScaleData(
            proc->unk_2c,
            Div(+COS(0) * 16, 0x100),
            Div(-SIN(0) * 16, 0x100),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, 0x100)
        );
    } else {
        if ((proc->unk_29 <= 7)) {
            WriteOAMRotScaleData(
                proc->unk_2c,
                Div(+COS(0) * 16, 0x100),
                Div(-SIN(0) * 16, (proc->unk_29 * -0x20) + 0x100),
                Div(+SIN(0) * 16, 0x100),
                Div(+COS(0) * 16, (proc->unk_29 * -0x20) + 0x100)
            );
        } else if ((proc->unk_29 < 0x10)) {
            WriteOAMRotScaleData(
                proc->unk_2c,
                Div(+COS(0) * 16, 0x100),
                Div(-SIN(0) * 16, (proc->unk_29 * 0x20) - 0xE0),
                Div(+SIN(0) * 16, 0x100),
                Div(+COS(0) * 16, (proc->unk_29 * 0x20) - 0xE0)
            );
        }
    }

    proc->unk_29++;

    return;
}

//! FE8U = 0x080A99C0
void sub_80A99C0(struct SaveMenuProc* proc) {
    int unk;

    proc->unk_2e = 3;
    proc->unk_29++;

    unk = 0xe - proc->unk_29;
    proc->unk_2f = -0x24 - (unk * 0xdc * unk / 0xc4);

    if (proc->unk_29 == 0xe) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080A9A08
void sub_80A9A08(struct SaveMenuProc* proc) {
    sub_80ABF74(proc->unk_35);
    return;
}

//! FE8U = 0x080A9A18
void sub_80A9A18(struct SaveMenuProc* proc) {
    int unk;

    proc->unk_2e = 4;
    proc->unk_29++;

    unk = 0xe - proc->unk_29;
    proc->unk_2f = (unk * 0xdc * unk / 0xc4);

    if (proc->unk_29 == 0xe) {
        CopyDataWithPossibleUncomp(Img_GameMainMenuObjs, (void*)0x06014000);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080A9A68
void sub_80A9A68(struct SaveMenuProc* proc) {
    int unk;

    proc->unk_2e = 8;
    proc->unk_29++;

    unk = 0xe - proc->unk_29;
    proc->unk_46 = 0xdc - (unk * 0xdc * unk / 0xc4);

    if (proc->unk_29 == 0xe) {
        Proc_Goto(proc, 10);
    }

    return;
}

//! FE8U = 0x080A9AB0
void sub_80A9AB0(struct SaveMenuProc* proc) {
    int unk;

    proc->unk_2e = 8;
    proc->unk_29++;

    unk = 0xe - proc->unk_29;
    proc->unk_46 = (unk * 0xdc * unk / 0xc4);

    if (proc->unk_29 == 0xe) {
        Proc_Goto(proc, 2);
    }

    return;
}

//! FE8U = 0x080A9AF4
void sub_80A9AF4(struct SaveMenuProc* proc) {
    int unk;

    proc->unk_2e = 0xc;
    proc->unk_29++;

    unk = 0xe - proc->unk_29;

    proc->unk_46 = 0x1b8 - (unk * 0xdc * unk / 0xc4);
    proc->unk_2f = proc->unk_46 + 0x24;

    if (proc->unk_29 == 0xe) {
        Proc_Goto(proc, 0xb);
    }

    return;
}

//! FE8U = 0x080A9B44
void sub_80A9B44(struct SaveMenuProc* proc) {
    int unk;

    proc->unk_2e = 0xd;
    proc->unk_29++;

    unk = 0xe - proc->unk_29;

    proc->unk_46 = 0xdc + (unk * 0xdc * unk / 0xc4);
    proc->unk_2f = proc->unk_46 - 0xdc;

    if (proc->unk_29 == 0xe) {
        Proc_Goto(proc, 10);
    }

    return;
}

//! FE8U = 0x080A9B90
void sub_80A9B90(struct SaveMenuProc* proc) {
    int previous = proc->unk_34;

    proc->unk_2e = 10;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        if (proc->unk_34 != 0) {
            proc->unk_34--;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_UP) {
                proc->unk_34 = proc->unk_33 - 1;
            }
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        if (proc->unk_34 < proc->unk_33 - 1) {
            proc->unk_34++;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                proc->unk_34 = 0;
            }
        }
    }

    if (previous != proc->unk_34) {
        PlaySoundEffect(0x66);
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {
        proc->unk_35 = sub_80A8844(proc->unk_32, proc->unk_34);
        PlaySoundEffect(0x6a);

        proc->unk_29 = 0;

        switch (proc->unk_35) {
            case 0x40:
                proc->unk_2c = sub_80AB98C(ReadLastGameSaveId(), 1, 1);
                sub_80A9D20(proc, 0);

                PlaySoundEffect(0x6a);

                Proc_Goto(proc, 0xc);

                break;

            case 2:
                sub_80029E8(0, 0xc0, 0, 0x18, 0);
                Proc_Goto(proc, 0xe);

                break;

            case 4:
                sub_80029E8(9, 0xc0, 0x100, 0x18, 0);
                Proc_Goto(proc, 0xe);

                break;

            case 0x10:
                proc->unk_2c = sub_80AB98C(ReadLastGameSaveId(), 1, 1);
                sub_80A9D20(proc, 0);

                PlaySoundEffect(0x6a);

                Proc_Goto(proc, 0xc);

                break;

            case 0x20:
                proc->unk_2c = sub_80AB98C(ReadLastGameSaveId(), 1, 1);
                sub_80A9D20(proc, 0);

                PlaySoundEffect(0x6a);

                Proc_Goto(proc, 0xc);

                break;

            default:
                sub_80A882C(proc);
                Proc_Goto(proc, 0x12);
                break;
        }


    } else if (gKeyStatusPtr->newKeys & B_BUTTON) {
        proc->unk_29 = 0;
        Proc_Goto(proc, 9);
        PlaySoundEffect(0x6b);
        return;
    }

    return;

}

//! FE8U = 0x080A9D20
s8 sub_80A9D20(struct SaveMenuProc* proc, int direction) {
    u8 unk = proc->unk_2c;

    if (unk > 2) {
        proc->unk_2c = 0;
    }

    if (direction == 0) {
        return 1;
    }

    if (direction > 0) {
        if (proc->unk_2c < 2) {
            proc->unk_2c = proc->unk_2c + 1;
        } else {
            proc->unk_2c = 0;
        }
    } else {
        if (proc->unk_2c == 0) {
            proc->unk_2c = 2;
        } else {
            proc->unk_2c = proc->unk_2c - 1;
        }
    }

    if (unk != proc->unk_2c) {
        PlaySoundEffect(0x66);
        return 1;
    }

    return 0;
}

//! FE8U = 0x080A9D84
void sub_80A9D84(struct SaveMenu8A20068Proc* proc) {
    LoadDialogueBoxGfx((void*)0x06014000, 9);
    StartHelpBoxExt_Unk(proc->x, proc->y, proc->msgId);
    PlaySoundEffect(0x70);
    return;
}

//! FE8U = 0x080A9DBC
void sub_80A9DBC(struct SaveMenu8A20068Proc* proc) {

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | R_BUTTON)) {
        PlaySoundEffect(0x71);
        CloseHelpBox();
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_08A20068[] = {
    PROC_SLEEP(0),

    PROC_CALL(sub_80A9D84),
    PROC_SLEEP(8),

    PROC_REPEAT(sub_80A9DBC),
    PROC_SLEEP(8),

    PROC_END,
};

//! FE8U = 0x080A9DFC
void sub_80A9DFC(int x, int y, int msgId, ProcPtr parent) {
    struct SaveMenu8A20068Proc* proc = Proc_StartBlocking(gProcScr_08A20068, parent);
    proc->msgId = msgId;
    proc->x = x;
    proc->y = y;
    return;
}

//! FE8U = 0x080A9E1C
void sub_80A9E1C(struct SaveMenuProc* proc) {

    proc->unk_2e = 5;

    if (proc->unk_36 == 0) {
        if (gKeyStatusPtr->newKeys & DPAD_UP) {
            sub_80A9D20(proc, -1);
        } else if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
            sub_80A9D20(proc, 1);
        }
    } else if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
        if (proc->unk_36 != 1) {
            proc->unk_36 = 1;
            PlaySoundEffect(0x67);
        }
    } else if (gKeyStatusPtr->newKeys & DPAD_RIGHT) {
        if (proc->unk_36 != 2) {
            proc->unk_36 = 2;
            PlaySoundEffect(0x67);
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON) {

        switch (proc->unk_35) {
            case 0x40:
                if (((proc->unk_3b[proc->unk_2c]) & 1) != 0) {
                    if (proc->unk_3f != 0xFF) {
                        sub_80A9290(proc);
                        return;
                    }

                    ReadGameSave(proc->unk_2c);
                    Proc_Goto(proc, 0xe);
                    PlaySoundEffect(0x6a);
                    return;
                }

                sub_80A9DFC(0x40, 0x30, 0x892, proc); // TODO: msgid "This data[.][NL]can't be used[.][NL]on a trial map.[.]"

                return;

            case 0x20:
                if (((proc->unk_3b[proc->unk_2c]) & 2) != 0) {
                    if (proc->unk_3f != 0xFF) {
                        sub_80A9290(proc);
                        return;
                    }

                    ReadGameSave(proc->unk_2c);
                    Proc_Goto(proc, 0xe);
                    PlaySoundEffect(0x6a);
                    return;
                }

                sub_80A9DFC(0x2e, 0x38, 0x891, proc); // TODO: msgid "Send data from[NL]Chapter 2+"

                return;

            case 0x10:
                if (((proc->unk_3b[proc->unk_2c]) & 4) != 0) {
                    if (proc->unk_3f == 0xFF) {
                        ReadGameSave(proc->unk_2c);
                        sub_80A882C(proc);
                        PlaySoundEffect(0x6a);
                        return;
                    }

                    sub_80A9290(proc);
                    return;
                }

                sub_80A9DFC(0x2e, 0x38, 0x895, proc); // TODO: msgid "Select cleared save data.[.]"

                return;

            default:
                return;
        }

    } else if (gKeyStatusPtr->newKeys & B_BUTTON) {

        PlaySoundEffect(0x6b);

        if (proc->unk_36 != 0) {
            sub_80AB83C(proc, 0);
            sub_80A88E0(proc);
            return;
        }

        CopyDataWithPossibleUncomp(Img_GameMainMenuObjs, (void*)0x06014000);
        proc->unk_29 = 0;
        Proc_Goto(proc, 13);

        return;
    }
}

//! FE8U = 0x080AA018
void sub_80AA018(struct SaveMenuProc* proc) {

    StartSqMask(proc, 1, 2);
    Proc_Break(proc);
    return;
}

//! FE8U = 0x080AA030
void sub_80AA030(struct SaveMenuProc* proc) {

    if (proc->unk_60 != 0) {
        APProc_Delete(proc->unk_60);
    }

    Proc_End(proc->unk_58);

    SetPrimaryHBlankHandler(0);

    if (proc->unk_42 == 0x20) {
        switch (proc->unk_35) {
            case 1:
                SetNextGameActionId(GAME_ACTION_6);
                return;
            case 0x10:
                SetNextGameActionId(GAME_ACTION_C);
                gPlaySt.chapterStateBits |= PLAY_FLAG_POSTGAME;
                return;
        }
    } else if (proc->unk_42 & 0x40) {
        return;
    } else if (proc->unk_42 & 0x100) {
        ISuspectThisToBeMusicRelated_8002730(0xc0, 0x100, 0x10, 0);
        if ((proc->unk_42 & 0x80) != 0) {
            SetNextGameActionId(GAME_ACTION_A);
        } else {
            SetNextGameActionId(GAME_ACTION_5);
        }
    } else if (proc->unk_42 & 1) {
        ReadSuspendSave(3);
        SetNextGameActionId(GAME_ACTION_4);
    } else if (proc->unk_42 & 0x82) {
        ReadGameSave(proc->unk_2c);
        SetNextGameActionId(proc->unk_2c + 1);
    } else if (proc->unk_42 & 0x10) {
        SetNextGameActionId(GAME_ACTION_0);
    }

    return;
}

//! FE8U = 0x080AA100
void sub_80AA100(struct SaveMenuProc* proc) {
    sub_80029E8(0, 0xc0, 0, 0x18, proc);
    return;
}

//! FE8U = 0x080AA118
void sub_80AA118(struct SaveMenuProc* proc) {

    SetNextGameActionId(GAME_ACTION_7);

    gPlaySt.chapterStateBits |= PLAY_FLAG_7;

    sub_80A6C8C();

    gPlaySt.chapterIndex = 0x7f;

    Proc_End(proc->proc_parent);

    return;
}

struct ProcCmd CONST_DATA gProcScr_08A20098[] = {
    PROC_CALL(sub_80AA100),
    PROC_SLEEP(0),

    PROC_CALL(sub_80AA118),

    PROC_END,
};

//! FE8U = 0x080AA144
void StartTrialMapMaybe(ProcPtr parent) {
    Proc_StartBlocking(gProcScr_08A20098, parent);
    return;
}

//! FE8U = 0x080AA158
void sub_80AA158(struct SaveMenuProc* proc) {

    proc->unk_42 = 0x20;

    Proc_End(proc->unk_58);

    SetPrimaryHBlankHandler(0);

    if (proc->unk_60 != 0) {
        APProc_Delete(proc->unk_60);
    }

    switch (proc->unk_35) {
        default:
            return;
        case 0x40:
            StartTrialMapMaybe(proc);
            return;
        case 0x20:
            StartBonusClaimScreen(proc);
            return;
        case 2:
            StartSoundRoomScreen(proc);
            return;
        case 4:
            StartSupportScreen(proc);
            return;
    }
}

//! FE8U = 0x080AA1BC
void sub_80AA1BC(struct SaveMenuProc* proc) {

    switch (proc->unk_35) {
        case 0x10:
        case 0x20:
            Proc_Goto(proc, 11);
            return;
        case 4:
        case 2:
            Proc_Goto(proc, 10);
            return;
    }
}

//! FE8U = 0x080AA1EC
void sub_80AA1EC(struct SaveMenuProc* proc) {
    proc->unk_29 = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 0;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;
    return;
}

//! FE8U = 0x080AA248
void sub_80AA248(struct SaveMenuProc* proc) {
    int unkA;
    int unkB;

    proc->unk_29++;

    unkA = (0x10 - proc->unk_29);

    unkB = 0x50 - ((unkA * 0x50 * unkA) / 256);

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 0x50 - (unkB);
    gLCDControlBuffer.win0_right = 0xf0;
    gLCDControlBuffer.win0_bottom = unkB + 0x50;

    if (proc->unk_29 == 0x10) {
        Proc_Break(proc);
    }
    return;
}

//! FE8U = 0x080AA2A8
void sub_80AA2A8(struct SaveMenuProc* proc) {
    int unkA;
    int unkB;

    proc->unk_29++;

    unkA = (0x10 - proc->unk_29);

    unkB = 0x50 - ((unkA * 0x50 * unkA) / 256);

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = unkB;
    gLCDControlBuffer.win0_right = 0xf0;
    gLCDControlBuffer.win0_bottom = -0x60 - unkB;

    if (proc->unk_29 == 0x10) {
        Proc_Break(proc);
    }
    return;
}

//! FE8U = 0x080AA30C
void sub_80AA30C(struct SaveMenuProc* proc) {

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    Font_ResetAllocation();
    LoadUiFrameGraphics();
    LoadObjUIGfx();

    CopyToPaletteBuffer(gUnknown_08A25DCC, 0x100, 0x100);

    CopyDataWithPossibleUncomp(gUnknown_08A21658, (void*)(GetBackgroundTileDataOffset(3) + 0x6000000));
    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A25ECC, 0x8000);
    CopyToPaletteBuffer(gUnknown_08A268D8, 0xe0, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08A26380, (void*)(GetBackgroundTileDataOffset(3) + 0x06004C00));

    CopyDataWithPossibleUncomp(gUnknown_08A268F8, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x00007260);

    CopyDataWithPossibleUncomp(Img_SaveScreenSprits, (void*)0x06010800);
    CopyToPaletteBuffer(Pal_SaveScreenSprits, 0x240, 0x100);
    CopyToPaletteBuffer(gUnknown_08A295B4, 0x40, 0x20);

    sub_80AA790(&gPaletteBuffer[0x12 * 0x10], &gPaletteBuffer[0x12 * 0x10] - 0x10, 1);
    CopyDataWithPossibleUncomp(Img_GameMainMenuObjs, (void*)0x06014000);

    sub_80AB794();
    sub_80A8A9C(proc);
    sub_80ABD88(proc->unk_2c);

    Proc_UnblockEachMarked(PROC_MARK_C);
    Proc_UnblockEachMarked(PROC_MARK_D);

    BG_EnableSyncByMask(3);

    if (proc->unk_2a != 3) {
        proc->unk_2e = 5;
        proc->unk_2f = 0xdc;
    }

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080AA458
void sub_80AA458(struct SaveMenuProc* proc) {
    if (proc->unk_2a == 3) {
        Proc_Goto(proc, 2);
    } else {
        Proc_Goto(proc, 5);
    }
    return;
}

//! FE8U = 0x080AA47C
void sub_80AA47C(struct SaveMenuProc* proc) {
    if (!(proc->unk_42 & 0x10)) {
        StartHelpPromptSprite(0xc0, 8, 8, (void*)proc);
    }
    return;
}

//! FE8U = 0x080AA49C
void sub_80AA49C(struct SaveMenuProc* proc) {
    if (proc->unk_35 == 0x20) {
        sub_80AA6EC(proc);
    }
    return;
}

//! FE8U = 0x080AA4B4
void sub_80AA4B4(void) {
    EndHelpPromptSprite();
    return;
}

struct ProcCmd CONST_DATA ProcScr_SaveMenu[] = {
    PROC_NAME("savemenu"),

PROC_LABEL(0),
    PROC_SLEEP(0),

    PROC_CALL(SaveMenu_Init),
    PROC_SLEEP(0),

    PROC_CALL(ProcSaveMenu_InitScreen),

    PROC_CALL(SaveMenu_LoadExtraMenuGraphics),
    PROC_SLEEP(0),

    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_SLEEP(0),

    PROC_WHILE(MusicProc4Exists),
    PROC_CALL(sub_80A9014),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(Loop6C_savemenu),

    PROC_GOTO(15),

PROC_LABEL(1),
    PROC_CALL(sub_80AA1EC),

    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(sub_80AD5B4),

    PROC_CALL(NewNewGameDifficultySelect),
    PROC_SLEEP(0),

    PROC_CALL(sub_80AA30C),
    PROC_CALL(sub_80AA1EC),

    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),

    PROC_CALL(sub_80AA458),

    // fallthrough

PROC_LABEL(5),
    PROC_CALL(sub_80AA47C),
    PROC_SLEEP(0),

    PROC_REPEAT(sub_80A9494),

    PROC_GOTO(15),

PROC_LABEL(7),
    PROC_SLEEP(5),
    PROC_CALL(sub_80A96D0),

    PROC_GOTO(5),

PROC_LABEL(6),
    PROC_SLEEP(1),
    PROC_CALL(sub_80A96DC),
    PROC_SLEEP(1),

    PROC_REPEAT(sub_80A96EC),

    PROC_GOTO(5),

PROC_LABEL(3),
    PROC_REPEAT(sub_80A99C0),

    PROC_GOTO(5),

PROC_LABEL(4),
    PROC_CALL(sub_80AA4B4),
    PROC_REPEAT(sub_80A9A18),

    PROC_GOTO(2),

PROC_LABEL(8),
    PROC_REPEAT(sub_80A9A68),

    // fallthrough

PROC_LABEL(9),
    PROC_REPEAT(sub_80A9AB0),

    // fallthrough

PROC_LABEL(12),
    PROC_CALL(sub_80A9A08),
    PROC_REPEAT(sub_80A9AF4),

    // fallthrough

PROC_LABEL(13),
    PROC_REPEAT(sub_80A9B44),

    // fallthrough

PROC_LABEL(10),
    PROC_REPEAT(sub_80A9B90),

    // fallthrough

PROC_LABEL(11),
    PROC_CALL(sub_80AA49C),
    PROC_SLEEP(0),

    PROC_REPEAT(sub_80A9E1C),

    // fallthrough

PROC_LABEL(14),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_WHILE(IsMusicProc2Running),

    PROC_CALL(sub_80AA158),
    PROC_SLEEP(0),

    PROC_CALL(SaveMenu_Init),
    PROC_SLEEP(0),

    PROC_CALL(ProcSaveMenu_InitScreen),

    PROC_CALL(SaveMenu_LoadExtraMenuGraphics),
    PROC_SLEEP(0),

    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),

    PROC_WHILE(IsMusicProc2Running),

    PROC_CALL(sub_80AA1BC),

    // fallthrough

PROC_LABEL(21),
    PROC_BLOCK,

PROC_LABEL(18),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),

    PROC_GOTO(15),

PROC_LABEL(17),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    // fallthrough

PROC_LABEL(15),
    PROC_SLEEP(0),
    PROC_CALL(sub_80AA030),
    PROC_SLEEP(0),

    PROC_END,
};

//! FE8U = 0x080AA4C0
void Make6C_savemenu(ProcPtr parent) {
    struct SaveMenuProc* proc = Proc_StartBlocking(ProcScr_SaveMenu, parent);
    proc->unk_42 = 0x100;
    proc->unk_35 = 0;

    gPlaySt.cfgTextSpeed = 2;

    return;
}

//! FE8U = 0x080AA4F8
void sub_80AA4F8(ProcPtr proc) {
    if (!(gBmSt.gameStateBits & 0x10)) {
        Proc_Goto(proc, 0x14);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_SaveMenu2[] = {
    PROC_NAME("savemenu"),
    PROC_SLEEP(0),

    PROC_CALL(sub_80A8F8C),

    PROC_CALL(sub_80A8AF0),
    PROC_SLEEP(0),

    PROC_CALL(ProcSaveMenu_InitScreen),
    PROC_SLEEP(0),

    PROC_CALL(sub_80AA4F8),

    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),

    PROC_GOTO(5),

PROC_LABEL(20),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),

    // fallthrough

PROC_LABEL(5),
    PROC_REPEAT(sub_80A9494),

    PROC_GOTO(15),

PROC_LABEL(6),
    PROC_SLEEP(1),
    PROC_CALL(sub_80A96DC),
    PROC_SLEEP(1),
    PROC_REPEAT(sub_80A96EC),

    PROC_GOTO(5),

PROC_LABEL(18),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),

    PROC_GOTO(15),

PROC_LABEL(17),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    // fallthrough

PROC_LABEL(15),
    PROC_SLEEP(0),
    PROC_CALL(sub_80AA030),

    PROC_END,
};

//! FE8U = 0x080AA518
void Make6C_savemenu2(ProcPtr parent) {
    Proc_StartBlocking(gProcScr_SaveMenu2, parent);
    return;
}
