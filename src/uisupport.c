#include "global.h"

#include "bmunit.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"

struct SupportScreenUnit {
    /* 00 */ u8 charId;
    /* 01 */ u8 classId;
    /* 02 */ u8 supportLevel[7];
    /* 09 */ u8 partnerClassId[7];
    /* 10 */ s8 partnerIsAlive[7];
};

extern struct SupportScreenUnit* gUnknown_08A196FC;
// 0200F17C

struct SupportScreenProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ s8 unk_40;
    /* 41 */ u8 unk_41;
    /* 42 */ s8 unk_42;
    /* 43 */ s8 unk_43;
};

extern u16 gUnknown_08A19700[];
extern u16 gUnknown_08A19726[];

extern u8 gUnknown_08A1DB80[];

extern u8 gUnknown_08A1A8E4[];
extern u16 gUnknown_08A1B174[];

int sub_80A0B44(int);
void sub_80A199C(ProcPtr, int);
int sub_80A1B6C(int);
void sub_80A2C08(s8, int, ProcPtr);

extern struct TextHandle gUnknown_02013498[];
extern struct TextHandle gUnknown_02013590[];

extern int gUnknown_020136F0;

extern u16 gUnknown_02023136[];
extern u16 gUnknown_020235AA[];

//! FE8U = 0x080A0A94
int sub_80A0A94(void) {
    return gUnknown_020136F0;
}

//! FE8U = 0x080A0AA0
int sub_80A0AA0(int num) {

    if (num >= (gUnknown_020136F0 - 1)) {
        return 0;
    }

    return num + 1;
}

//! FE8U = 0x080A0AC0
int sub_80A0AC0(int num) {

    if (num == 0) {
        num = gUnknown_020136F0;
    }

    return num - 1;
}

//! FE8U = 0x080A0AD4
int sub_80A0AD4(int idx, int partner) {
    return gUnknown_08A196FC[idx].supportLevel[partner];
}

//! FE8U = 0x080A0AEC
int sub_80A0AEC(int idx, int partner) {
    return gUnknown_08A196FC[idx].partnerClassId[partner];
}

//! FE8U = 0x080A0B04
int sub_80A0B04(int idx, int partner) {
    return gUnknown_08A196FC[idx].partnerIsAlive[partner];
}

//! FE8U = 0x080A0B20
int sub_80A0B20(int idx, int partner) {
    return gCharacterData[sub_80A0B44(idx) - 1].pSupportData->characters[partner];
}

//! FE8U = 0x080A0B44
int sub_80A0B44(int idx) {
    return gUnknown_08A196FC[idx].charId;
}

//! FE8U = 0x080A0B58
int sub_80A0B58(int idx) {
    return gUnknown_08A196FC[idx].classId;
}

//! FE8U = 0x080A0B6C
int sub_80A0B6C(int charId) {
    int i;

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & 0x00010004) {
            continue;
        }

        if (unit->pCharacterData->number != charId) {
            continue;
        }

        return unit->pClassData->number;
    }

    return gCharacterData[charId - 1].defaultClass;
}

//! FE8U = 0x080A0BBC
s8 sub_80A0BBC(int charId) {
    struct SupportTalkEnt* iter;

    for (iter = sub_80847F8(); ; iter++) {
        if (iter->unitA == 0xFFFF) {
            break;
        }

        if (iter->unitA == charId || iter->unitB == charId) {
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x080A0BF4
void sub_80A0BF4(void) {
    struct SupportTalkEnt* iter;

    for (iter = sub_80847F8(); iter->unitA != 0xFFFF; iter++) {
        SGM_SetCharacterKnown(iter->unitA, NULL);
        SGM_SetCharacterKnown(iter->unitB, NULL);
        sub_80A3724(iter->unitA, iter->unitB, sub_80A3468(iter->unitA, iter->unitB));
    }

    return;
}


//! FE8U = 0x080A0C40
void sub_80A0C40(struct SupportScreenProc* proc) {
    int k;
    int j;

    CpuFill16(0, gUnknown_08A196FC, 0xC00);

    gUnknown_020136F0 = 0;

    if (proc->unk_42) {
        int i;

        u32 unitFlags[8];
        CpuFill16(0, unitFlags, 0x20);

        for (i = 1; i < 0x40; i++) {
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            if (unit->state & (US_DEAD | US_BIT16)) {
                continue;
            }

            *(unitFlags + (unit->pCharacterData->number >> 5)) |= (1 << (unit->pCharacterData->number & 0x1f));
        }

        for (i = 1; i < 0x40; i++) {
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            if (unit->state & (US_DEAD | US_BIT16)) {
                continue;
            }

            if (!sub_80A1B6C(unit->pCharacterData->number)) {
                continue;
            }

            gUnknown_08A196FC[gUnknown_020136F0].charId = unit->pCharacterData->number;
            gUnknown_08A196FC[gUnknown_020136F0].classId = unit->pClassData->number;

            for (j = 0; j < gCharacterData[unit->pCharacterData->number - 1].pSupportData->supportCount; j++) {
                int unk = sub_80A0B20(gUnknown_020136F0, j);

                gUnknown_08A196FC[gUnknown_020136F0].supportLevel[j] = GetUnitSupportLevel(unit, j);
                gUnknown_08A196FC[gUnknown_020136F0].partnerClassId[j] = sub_80A0B6C(unk);

                // BUG: This seems to have been intended to be an array of which of this unit's
                // support partners are dead/alive, but it indexes into this array with an uninitialized variable
                gUnknown_08A196FC[gUnknown_020136F0].partnerIsAlive[k] = (*(unitFlags + (unk >> 5)) >> (unk & 0x1f)) & 1;
            }

            gUnknown_020136F0++;
        }
    } else {
        struct SaveMeta saveMeta;
        LoadGeneralGameMetadata(&saveMeta);

        SetTacticianName(GetStringFromIndex(0x26A)); // TODO: msgid "Mark"

        for (j = 0; j < 0x100; j++) {
            if (!GGM_IsCharacterKnown(j, &saveMeta)) {
                continue;
            }

            if (!sub_80A1B6C(j)) {
                continue;
            }

            gUnknown_08A196FC[gUnknown_020136F0].charId = j;
            gUnknown_08A196FC[gUnknown_020136F0].classId = gCharacterData[j - 1].defaultClass;

            sub_80A35EC(j, gUnknown_08A196FC[gUnknown_020136F0].supportLevel, &saveMeta);

            for (k = 0; k < sub_80A1B6C(j); k++) {
                int unk = sub_80A0B20(gUnknown_020136F0, k);

                gUnknown_08A196FC[gUnknown_020136F0].partnerClassId[k] = gCharacterData[unk - 1].defaultClass;
                gUnknown_08A196FC[gUnknown_020136F0].partnerIsAlive[k] = GGM_IsCharacterKnown(unk, &saveMeta);
            }

            gUnknown_020136F0++;
        }
    }

    return;
}

//! FE8U = 0x080A0EC0
void sub_80A0EC0(struct SupportScreenProc* proc) {
    int i;

    if (proc->unk_42) {
        for (i = 1; i < 0x40; i++) {
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            UseUnitSprite(GetUnitSMSId(unit));

        }
    } else {
        for (i = 0; i < gUnknown_020136F0; i++) {
            UseUnitSprite(GetClassSMSId(gUnknown_08A196FC[i].classId));
        }
    }

    ForceSyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x080A0F30
int sub_80A0F30(int a) {
    int i;

    int total = 0;

    for (i = 0; i < gCharacterData[sub_80A0B44(a) - 1].pSupportData->supportCount; i++) {
        total += sub_80A0AD4(a, i);
    }
    return total;
}

//! FE8U = 0x080A0F6C
int sub_80A0F6C(s8 flag, int unk) {
    int i;
    int a;
    int b;
    int c;

    if (flag != 0) {
        int var = sub_80A0F30(unk);

        if (var == 5) {
            return 2;
        }

        if (var == 0) {
            return 0;
        }

        return 1;
    }

    a = 0;
    b = sub_80A0F30(unk);

    c = sub_80A1B6C(sub_80A0B44(unk));

    for (i = 0; i < c; i++) {
        a += sub_80A3468(sub_80A0B44(unk), sub_80A0B20(unk, i));
    }

    if (a == b) {
        return 2;
    }

    if (b == 0) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080A0FE8
void sub_80A0FE8(void) {
    struct TextHandle* th;
    int perc;
    const char* str;

    th = gUnknown_02013590;

    perc = sub_80A3544();

    Text_Init(th - 1, 16);
    Text_Init(th + 0, 9);
    Text_Clear(th - 1);

    str = GetStringFromIndex(0x000005AD);
    Text_InsertString(th - 1, (s16)GetStringTextCenteredPos(128, str), 0, str);

    Text_Draw(th - 1, gUnknown_02023136);

    Text_Clear(th + 0);
    Text_InsertString(
        th + 0,
        0,
        perc == 100 ? 4 : 0,
        GetStringFromIndex(0x000005AA)
    );

    Text_SetXCursor(th + 0, 52);
    Text_SetColorId(th + 0, perc == 100 ? 4 : 2);
    Text_AppendNumberOr2Dashes(th + 0, perc);

    Text_InsertString(
        th + 0,
        60,
        perc == 100 ? 4 : 0,
        GetStringFromIndex(0x000005AE)
    );

    Text_Draw(th + 0, gUnknown_02023136 - 500);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080A10BC
void sub_80A10BC(struct SupportScreenProc* proc) {
    proc->unk_2c = 0;
    proc->unk_40 = 0;
    proc->unk_34 = 0;
    proc->unk_38 = 0;
    proc->unk_3c = -1;
    return;
}

extern u8 gUnknown_08A1DD0C[];
extern u16 gUnknown_08A1E0D8[];

//! FE8U = 0x080A10D0
void sub_80A10D0(struct SupportScreenProc* proc) {
    CopyDataWithPossibleUncomp(gUnknown_08A1DD0C, (void*)0x06017800);
    CopyToPaletteBuffer(gUnknown_08A1E0D8, (proc->unk_34 + 16) * 32, 32);
    return;
}

//! FE8U = 0x080A10FC
void sub_80A10FC(struct SupportScreenProc* proc) {
    PutSpriteExt(4, proc->unk_2c, proc->unk_30, gUnknown_08A19700, (proc->unk_34 & 0xf) * 0x1000 + 0xfc0);
    PutSpriteExt(4, 4, 0, gUnknown_08A19726, 0x21c0);
    return;
}

extern struct ProcCmd gUnknown_08A1973C[];

//! FE8U = 0x080A1140
void sub_80A1140(int a, int b, int c, ProcPtr parent) {
    struct SupportScreenProc* proc = Proc_Start(gUnknown_08A1973C, parent);
    proc->unk_2c = a;
    proc->unk_30 = b;
    proc->unk_34 = c;
    return;
}

//! FE8U = 0x080A1160
void sub_80A1160(void) {
    Proc_End(Proc_Find(gUnknown_08A1973C));
    return;
}

//! FE8U = 0x080A1174
void sub_80A1174(struct SupportScreenProc* proc) {
    int i;

    int a = sub_80A0A94();

    for (i = 0; i < a; i++) {
        u32 y = (i / 3) * 16 + 36 - proc->unk_34;

        int x = i % 3 * 64 + 24;


        if (y - 36 < 83) {
            PutUnitSpriteForClassId(0, x, y, 0xc800, sub_80A0B58(i));
        }
    }

    SyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x080A11E0
void sub_80A11E0(struct SupportScreenProc* proc) {
    int a;
    int b;

    if (proc->unk_3c != -1) {
        proc->unk_38 = proc->unk_3c;
        proc->unk_3c = -1;

        if ((((proc->unk_38 / 3) - (proc->unk_34 / 16)) * 16 + 36) < 37) {
            if ((proc->unk_38 / 3) == 0) {
                proc->unk_34 = 0;
            } else {
                proc->unk_34 = ((proc->unk_38 / 3) - 1) * 16;
            }
        }

        a = proc->unk_38 / 3;
        if ((((a) - (proc->unk_34 / 16)) * 16 + 36) > 115) {
            b = (sub_80A0A94() - 1);
            if (a == b / 3) {
                proc->unk_34 = (((sub_80A0A94() - 1) / 3) - 5) * 16;
            } else {
                proc->unk_34 = ((proc->unk_38 / 3) - 4) * 16;
            }
        }
    }

    return;
}

//! FE8U = 0x080A1270
void sub_80A1270(struct SupportScreenProc* proc) {
    int i;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    BG_Fill(BG_GetMapBuffer(0), 0);
    BG_Fill(BG_GetMapBuffer(1), 0);
    BG_Fill(BG_GetMapBuffer(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetFaces();

    Font_InitForUIDefault();
    ResetIconGraphics_();
    LoadUiFrameGraphicsTo(0x4000, -1);
    LoadObjUIGfx();
    LoadIconPalettes(0xe);

    sub_80A11E0(proc);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 2);
    BG_SetPosition(2, 0x0000FFD8, proc->unk_34 - 36);

    sub_8086CE8(proc, 0, 18, 2, 0);

    SetupMapSpritesPalettes();
    ResetUnitSprites();

    sub_80A0EC0((void*)proc);
    sub_8098C3C(0x5000, 5);

    CopyDataWithPossibleUncomp(gUnknown_08A1DB80, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_020235AA, gGenericBuffer, 0x1200);

    CopyDataWithPossibleUncomp(gUnknown_08A1A8E4, (void*)0x06013800);

    CopyToPaletteBuffer(gUnknown_08A1B174, 0x240, 0x20);

    BG_EnableSyncByMask(7);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 38;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 134;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);

    for (i = 0; i <= 20; i++) {
        Text_Init(gUnknown_02013498 + i, 5);
    }

    sub_80A0FE8();

    if (sub_80A0A94() != 0) {
        ResetPrepScreenHandCursor(proc);
        sub_80AD4A0(0x600, 1);
        ShowPrepScreenHandCursor(
            (proc->unk_38 % 3) * 64 + 20,
            ((proc->unk_38 / 3) - (proc->unk_34 / 16)) * 16 + 36,
            7,
            0x800
        );
        StartHelpPromptSprite(0xc0, 1, 9, (void*)proc);
    }

    sub_80A1140(136, 9, 11, proc);

    StartParallelWorker(sub_80A1174, proc);

    sub_8097748(proc, 0xd8, 0x2d, 0x200, 4);

    sub_80976CC(10, proc->unk_34, ((sub_80A0A94() - 1) / 3) + 1, 6);

    sub_8097668();

    for (i = proc->unk_34 / 16; i < (proc->unk_34 / 16) + 6; i++) {
        sub_80A199C(proc, i);
    }

    NewGreenTextColorManager((void*)proc);

    proc->unk_43 = 0;

    LoadDialogueBoxGfx((void*)0x06014800, 10);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

//! FE8U = 0x080A1554
void sub_80A1554(ProcPtr proc) {
    sub_808F270();
    EndAllProcChildren(proc);
    EndBG3Slider_();
    EndFaceById(0);
    SetPrimaryHBlankHandler(0);
    sub_80A1160();

    return;
}

//! FE8U = 0x080A157C
void sub_80A157C(void) {
    SetSpecialColorEffectsParameters(1, 0xe, 3, 0);
    SetBlendTargetA(0, 1, 0, 0, 1);
    SetBlendTargetB(0, 0, 0, 1, 0);
    return;
}

//! FE8U = 0x080A15B0
void sub_80A15B0(struct SupportScreenProc* proc) {
    u16 keys;
    int previous;
    int var;

    if (sub_80A0A94()) {
        if (!proc->unk_40) {
            previous = proc->unk_38;

            keys = gKeyStatusPtr->repeatedKeys;
            proc->unk_41 = 4;

            if (gKeyStatusPtr->heldKeys & L_BUTTON) {
                keys = gKeyStatusPtr->heldKeys;
                proc->unk_41 = 8;
            }

            if (proc->unk_43) {
                if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
                    CloseHelpBox();
                    proc->unk_43 = 0;
                    return;
                }
            } else {
                if (gKeyStatusPtr->newKeys & R_BUTTON) {
                    StartHelpBox(
                        (proc->unk_38 % 3) * 64 + 20,
                        ((proc->unk_38 / 3) - (proc->unk_34 / 16)) * 16 + 36,
                        gCharacterData[sub_80A0B44(proc->unk_38) - 1].descTextId
                    );

                    proc->unk_43 = 1;

                    return;
                }

                if (gKeyStatusPtr->newKeys & A_BUTTON) {
                    Proc_Goto(proc, 2);
                    PlaySoundEffect(0x6a);
                    return;
                }

                if (gKeyStatusPtr->newKeys & B_BUTTON) {
                    Proc_Goto(proc, 3);
                    PlaySoundEffect(0x6b);
                    return;
                }
            }
            if (keys & DPAD_LEFT) {
                if ((proc->unk_38 % 3) != 0) {
                    proc->unk_38--;
                }
            }

            if (keys & DPAD_RIGHT) {
                if ((proc->unk_38 % 3) != 2) {
                    proc->unk_38++;

                    if (proc->unk_38 >= sub_80A0A94()) {
                        proc->unk_38 = sub_80A0A94() - 1;
                    }
                }
            }

            if ((keys & DPAD_UP) && (proc->unk_38 > 2)) {
                proc->unk_38 -= 3;
            }

            if ((keys & DPAD_DOWN) && (proc->unk_38 + 3 < sub_80A0A94())) {
                proc->unk_38 += 3;
            }

            if (previous != proc->unk_38) {
                var = ((proc->unk_38 / 3) - (proc->unk_34 / 16)) * 16;

                proc->unk_40 = 0;
                PlaySoundEffect(0x65);

                if ((var < 0x10) && (proc->unk_34 != 0)) {
                    sub_80A199C(proc, (proc->unk_34 / 16) - 1);
                    proc->unk_40 = -1;
                    SetPrepScreenHandXPos((proc->unk_38 % 3) * 64 + 20);
                } else if ((var >= 0x50) && (proc->unk_34 != ((((sub_80A0A94() - 1) / 3) - 5) * 16))) {
                    sub_80A199C(proc, (proc->unk_34 / 16) + 6);
                    proc->unk_40 = 1;
                    SetPrepScreenHandXPos((proc->unk_38 % 3) * 64 + 20);
                } else {

                    ShowPrepScreenHandCursor(
                        (proc->unk_38 % 3) * 64 + 20,
                        var + 36,
                        7,
                        0x800
                    );
                }

                if (proc->unk_43 != 0) {
                    StartHelpBox(
                        (proc->unk_38 % 3) * 64 + 0x14,
                        ((proc->unk_38 / 3) - (proc->unk_34 / 16)) * 16 + 36 - (proc->unk_40 * 16),
                        gCharacterData[sub_80A0B44(proc->unk_38) - 1].descTextId
                    );
                }
            }

            if (proc->unk_40 == 0) {
                return;
            }
        }

        if (proc->unk_40 < 0) {
            proc->unk_34 -= proc->unk_41;
        }

        if (proc->unk_40 > 0) {
            proc->unk_34 += proc->unk_41;
        }

        if ((proc->unk_34 & 0xf) == 0) {
            proc->unk_40 = 0;
        }

        sub_80976CC(10, proc->unk_34, ((sub_80A0A94() - 1) / 3) + 1, 6);

        BG_SetPosition(2, 0x0000FFD8, (proc->unk_34 - 0x24) & 0xff);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 3);
        PlaySoundEffect(0x6b);
    }

    return;
}

//! FE8U = 0x080A1918
void sub_80A1918(struct SupportScreenProc* proc) {
    sub_80A2C08(proc->unk_42, proc->unk_38, proc);
    return;
}

//! FE8U = 0x080A1930
void sub_80A1930(struct SupportScreenProc* proc) {
    if (!proc->unk_42) {
        sub_80029E8(0x43, 0x100, 0xc0, 0x18, 0);
    } else {
        sub_80029E8(0x34, 0x100, 0x100, 0x18, 0);
    }

    return;
}

extern struct ProcCmd gUnknown_08A1975C[];

//! FE8U = 0x080A196C
void sub_80A196C(ProcPtr parent) {
    struct SupportScreenProc* proc = Proc_StartBlocking(gUnknown_08A1975C, parent);
    proc->unk_42 = 1;
    return;
}

//! FE8U = 0x080A1984
void StartSupportScreen(ProcPtr parent) {
    struct SupportScreenProc* proc = Proc_StartBlocking(gUnknown_08A1975C, parent);
    proc->unk_42 = 0;
    return;
}


