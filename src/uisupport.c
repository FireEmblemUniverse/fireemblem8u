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
#include "event.h"
#include "bmsave.h"

struct SupportScreenUnit {
    /* 00 */ u8 charId;
    /* 01 */ u8 classId;
    /* 02 */ u8 supportLevel[UNIT_SUPPORT_MAX_COUNT];
    /* 09 */ u8 partnerClassId[UNIT_SUPPORT_MAX_COUNT];
    /* 10 */ s8 partnerIsAlive[UNIT_SUPPORT_MAX_COUNT];
};

struct SupportScreenProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int curIndex;
    /* 3C */ int unk_3c;
    /* 40 */ s8 unk_40; // possibly direction (up or down)
    /* 41 */ u8 unk_41; // possibly number of positions to move up or down
    /* 42 */ s8 fromPrepScreen; // true if from prep screen; false if from title screen
    /* 43 */ s8 helpTextActive;
};

struct SubScreenProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unitIdx;
    /* 30 */ int x;
    /* 34 */ int y;
    /* 38 */ s8 fromPrepScreen;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 partnerCount;
    /* 3D */ u8 remainingSupports;
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 partnerState[UNIT_SUPPORT_MAX_COUNT];
    /* 46 */ u8 supportLevel[UNIT_SUPPORT_MAX_COUNT];
    /* 4D */ u8 partnerClassId[UNIT_SUPPORT_MAX_COUNT];
};

struct SupportScreenUnit* CONST_DATA sSupportScreenUnits = (void*)gStringBufferAlt;

u16 CONST_DATA gSprite_SupportScreenSuccessBox[] = {
    6,
    0x4004, 0x8000, 0x0000,
    0x4004, 0x8020, 0x0004,
    0x4004, 0x8040, 0x0008,
    0x4014, 0x4000, 0x000C,
    0x4014, 0x4020, 0x0010,
    0x4014, 0x4040, 0x0014,
};

u16 CONST_DATA gSprite_SupportScreenBanner[] = {
    3,
    0x4000, 0xC000, 0x0000,
    0x0000, 0x8040, 0x0008,
    0x8000, 0x8060, 0x000C,
};

extern u8 gUnknown_08A1DB80[];

extern u8 gGfx_SupportScreenBanner[];
extern u16 gPal_SupportScreenBanner[];
extern u8 gTsa_SupportSubScreen[];

int GetSupportScreenCharIdAt(int);
void sub_80A199C(struct SupportScreenProc*, int);
int GetSupportScreenPartnerCount(int);
void StartSupportUnitSubScreen(s8, int, ProcPtr);

extern struct TextHandle gUnknown_02013498[];
extern struct TextHandle gUnknown_02013590[];

extern int sSupportScreenUnitCount;
extern u16 gUnknown_020136F4[];
extern u8 gUnknown_0203E884;

extern u16 gUnknown_02022CEC[];
extern u16 gUnknown_02023136[];
extern u16 gUnknown_020235AA[];
extern u16 gUnknown_02023CC8[];

//! FE8U = 0x080A0A94
int GetSupportScreenUnitCount(void) {
    return sSupportScreenUnitCount;
}

//! FE8U = 0x080A0AA0
int GetNextSupportScreenUnit(int num) {

    if (num >= (sSupportScreenUnitCount - 1)) {
        return 0;
    }

    return num + 1;
}

//! FE8U = 0x080A0AC0
int GetPreviousSupportScreenUnit(int num) {

    if (num == 0) {
        num = sSupportScreenUnitCount;
    }

    return num - 1;
}

//! FE8U = 0x080A0AD4
int GetSupportScreenPartnerSupportLevel(int idx, int partner) {
    return sSupportScreenUnits[idx].supportLevel[partner];
}

//! FE8U = 0x080A0AEC
int GetSupportScreenPartnerClassId(int idx, int partner) {
    return sSupportScreenUnits[idx].partnerClassId[partner];
}

//! FE8U = 0x080A0B04
s8 GetSupportScreenPartnerIsAlive(int idx, int partner) {
    return sSupportScreenUnits[idx].partnerIsAlive[partner];
}

//! FE8U = 0x080A0B20
int GetSupportScreenPartnerCharId(int idx, int partner) {
    return gCharacterData[GetSupportScreenCharIdAt(idx) - 1].pSupportData->characters[partner];
}

//! FE8U = 0x080A0B44
int GetSupportScreenCharIdAt(int idx) {
    return sSupportScreenUnits[idx].charId;
}

//! FE8U = 0x080A0B58
int GetSupportScreenClassIdAt(int idx) {
    return sSupportScreenUnits[idx].classId;
}

//! FE8U = 0x080A0B6C
int GetSupportClassForCharId(int charId) {
    int i;

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_DEAD | US_BIT16)) {
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
void SupportScreen_SetupUnits(struct SupportScreenProc* proc) {
    int k;
    int j;

    CpuFill16(0, sSupportScreenUnits, 0xC00);

    sSupportScreenUnitCount = 0;

    if (proc->fromPrepScreen) {
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

            if (!GetSupportScreenPartnerCount(unit->pCharacterData->number)) {
                continue;
            }

            sSupportScreenUnits[sSupportScreenUnitCount].charId = unit->pCharacterData->number;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = unit->pClassData->number;

            for (j = 0; j < gCharacterData[unit->pCharacterData->number - 1].pSupportData->supportCount; j++) {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, j);

                sSupportScreenUnits[sSupportScreenUnitCount].supportLevel[j] = GetUnitSupportLevel(unit, j);
                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[j] = GetSupportClassForCharId(charId);

                // BUG: This seems to have been intended to be an array of which of this unit's
                // support partners are dead/alive, but it indexes into this array with an uninitialized variable
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[k] = (*(unitFlags + (charId >> 5)) >> (charId & 0x1f)) & 1;
            }

            sSupportScreenUnitCount++;
        }
    } else {
        struct GlobalSaveInfo GlobalSaveInfo;
        ReadGlobalSaveInfo(&GlobalSaveInfo);

        SetTacticianName(GetStringFromIndex(0x26A)); // TODO: msgid "Mark"

        for (j = 0; j < 0x100; j++) {
            if (!GGM_IsCharacterKnown(j, &GlobalSaveInfo)) {
                continue;
            }

            if (!GetSupportScreenPartnerCount(j)) {
                continue;
            }

            sSupportScreenUnits[sSupportScreenUnitCount].charId = j;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = gCharacterData[j - 1].defaultClass;

            sub_80A35EC(j, sSupportScreenUnits[sSupportScreenUnitCount].supportLevel, &GlobalSaveInfo);

            for (k = 0; k < GetSupportScreenPartnerCount(j); k++) {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, k);

                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[k] = gCharacterData[charId - 1].defaultClass;
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[k] = GGM_IsCharacterKnown(charId, &GlobalSaveInfo);
            }

            sSupportScreenUnitCount++;
        }
    }

    return;
}

//! FE8U = 0x080A0EC0
void sub_80A0EC0(struct SupportScreenProc* proc) {
    int i;

    if (proc->fromPrepScreen) {
        for (i = 1; i < 0x40; i++) {
            struct Unit* unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit)) {
                continue;
            }

            UseUnitSprite(GetUnitSMSId(unit));
        }
    } else {
        for (i = 0; i < sSupportScreenUnitCount; i++) {
            UseUnitSprite(GetClassSMSId(sSupportScreenUnits[i].classId));
        }
    }

    ForceSyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x080A0F30
int GetTotalSupportLevel(int idx) {
    int i;

    int total = 0;

    for (i = 0; i < gCharacterData[GetSupportScreenCharIdAt(idx) - 1].pSupportData->supportCount; i++) {
        total += GetSupportScreenPartnerSupportLevel(idx, i);
    }

    return total;
}

//! FE8U = 0x080A0F6C
int sub_80A0F6C(s8 flag, int idx) {
    int i;
    int a;
    int b;
    int c;

    if (flag != 0) {
        int var = GetTotalSupportLevel(idx);

        if (var == MAX_SIMULTANEOUS_SUPPORT_COUNT) {
            return 2;
        }

        if (var == 0) {
            return 0;
        }

        return 1;
    }

    a = 0;
    b = GetTotalSupportLevel(idx);

    c = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(idx));

    for (i = 0; i < c; i++) {
        a += sub_80A3468(GetSupportScreenCharIdAt(idx), GetSupportScreenPartnerCharId(idx, i));
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
void DrawSupportScreenText(void) {
    struct TextHandle* th;
    int perc;
    const char* str;

    th = gUnknown_02013590;

    perc = sub_80A3544();

    Text_Init(th - 1, 16);
    Text_Init(th + 0, 9);
    Text_Clear(th - 1);

    str = GetStringFromIndex(0x5AD); // TODO: msgid "Select Character"
    Text_InsertString(th - 1, (s16)GetStringTextCenteredPos(128, str), 0, str);

    Text_Draw(th - 1, gUnknown_02023136);

    Text_Clear(th + 0);
    Text_InsertString(
        th + 0,
        0,
        perc == 100 ? 4 : 0,
        GetStringFromIndex(0x5AA) // TODO: msgid "Success[.]"
    );

    Text_SetXCursor(th + 0, 52);
    Text_SetColorId(th + 0, perc == 100 ? 4 : 2);
    Text_AppendNumberOr2Dashes(th + 0, perc);

    Text_InsertString(
        th + 0,
        60,
        perc == 100 ? 4 : 0,
        GetStringFromIndex(0x5AE) // TODO: msgid "%[.]"
    );

    Text_Draw(th + 0, gUnknown_02023136 - 500);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080A10BC
void SupportScreen_OnInit(struct SupportScreenProc* proc) {
    proc->unk_2c = 0;
    proc->unk_40 = 0;
    proc->unk_34 = 0;
    proc->curIndex = 0;
    proc->unk_3c = -1;
    return;
}

extern u8 gGfx_SupportMenu[];
extern u16 gPal_SupportMenu[];

//! FE8U = 0x080A10D0
void DrawSupportBannerSprites_Init(struct Proc* proc) {
    CopyDataWithPossibleUncomp(gGfx_SupportMenu, (void*)0x06017800);
    CopyToPaletteBuffer(gPal_SupportMenu, (proc->unk34 + 16) * 32, 32);
    return;
}

//! FE8U = 0x080A10FC
void DrawSupportBannerSprites_Loop(struct Proc* proc) {
    PutSpriteExt(4, proc->x, proc->y, gSprite_SupportScreenSuccessBox, (proc->unk34 & 0xf) * 0x1000 + 0xfc0);
    PutSpriteExt(4, 4, 0, gSprite_SupportScreenBanner, 0x21c0);
    return;
}

struct ProcCmd CONST_DATA gProcScr_SupportScreen_DrawBannerSprites[] = {
    PROC_SLEEP(0),
    PROC_CALL(DrawSupportBannerSprites_Init),
    PROC_REPEAT(DrawSupportBannerSprites_Loop),

    PROC_END,
};

//! FE8U = 0x080A1140
void StartDrawSupportBannerSprites(int x, int y, int palIdx, ProcPtr parent) {
    struct Proc* proc = Proc_Start(gProcScr_SupportScreen_DrawBannerSprites, parent);
    proc->x = x;
    proc->y = y;
    proc->unk34 = palIdx;
    return;
}

//! FE8U = 0x080A1160
void EndDrawSupportBannerSprites(void) {
    Proc_End(Proc_Find(gProcScr_SupportScreen_DrawBannerSprites));
    return;
}

//! FE8U = 0x080A1174
void DrawSupportScreenUnitSprites(struct SupportScreenProc* proc) {
    int i;

    int unitCount = GetSupportScreenUnitCount();

    for (i = 0; i < unitCount; i++) {
        u32 y = (i / 3) * 16 + 36 - proc->unk_34;
        int x = i % 3 * 64 + 24;

        if (y - 36 < 83) {
            PutUnitSpriteForClassId(0, x, y, 0xc800, GetSupportScreenClassIdAt(i));
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
        proc->curIndex = proc->unk_3c;
        proc->unk_3c = -1;

        if ((((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 36) < 37) {
            if ((proc->curIndex / 3) == 0) {
                proc->unk_34 = 0;
            } else {
                proc->unk_34 = ((proc->curIndex / 3) - 1) * 16;
            }
        }

        a = proc->curIndex / 3;
        if ((((a) - (proc->unk_34 / 16)) * 16 + 36) > 115) {
            b = (GetSupportScreenUnitCount() - 1);
            if (a == b / 3) {
                proc->unk_34 = (((GetSupportScreenUnitCount() - 1) / 3) - 5) * 16;
            } else {
                proc->unk_34 = ((proc->curIndex / 3) - 4) * 16;
            }
        }
    }

    return;
}

//! FE8U = 0x080A1270
void SupportScreen_SetupGraphics(struct SupportScreenProc* proc) {
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

    CopyDataWithPossibleUncomp(gGfx_SupportScreenBanner, (void*)0x06013800);
    CopyToPaletteBuffer(gPal_SupportScreenBanner, 0x240, 0x20);

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

    DrawSupportScreenText();

    if (GetSupportScreenUnitCount() != 0) {
        ResetPrepScreenHandCursor(proc);
        sub_80AD4A0(0x600, 1);
        ShowPrepScreenHandCursor(
            (proc->curIndex % 3) * 64 + 20,
            ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 36,
            7,
            0x800
        );
        StartHelpPromptSprite(0xc0, 1, 9, (void*)proc);
    }

    StartDrawSupportBannerSprites(136, 9, 11, proc);

    StartParallelWorker(DrawSupportScreenUnitSprites, proc);

    PrepStartSideBarScroll(proc, 0xd8, 0x2d, 0x200, 4);

    sub_80976CC(10, proc->unk_34, ((GetSupportScreenUnitCount() - 1) / 3) + 1, 6);

    sub_8097668();

    for (i = proc->unk_34 / 16; i < (proc->unk_34 / 16) + 6; i++) {
        sub_80A199C(proc, i);
    }

    NewGreenTextColorManager((void*)proc);

    proc->helpTextActive = 0;

    LoadDialogueBoxGfx((void*)0x06014800, 10);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

//! FE8U = 0x080A1554
void SupportScreen_OnEnd(ProcPtr proc) {
    sub_808F270();
    EndAllProcChildren(proc);
    EndBG3Slider_();
    EndFaceById(0);
    SetPrimaryHBlankHandler(0);
    EndDrawSupportBannerSprites();

    return;
}

//! FE8U = 0x080A157C
void SupportScreen_UpdateBlend(void) {
    SetSpecialColorEffectsParameters(1, 0xe, 3, 0);
    SetBlendTargetA(0, 1, 0, 0, 1);
    SetBlendTargetB(0, 0, 0, 1, 0);
    return;
}

//! FE8U = 0x080A15B0
void SupportScreen_Loop_KeyHandler(struct SupportScreenProc* proc) {
    u16 keys;
    int previous;
    int var;

    if (GetSupportScreenUnitCount()) {
        if (!proc->unk_40) {
            previous = proc->curIndex;

            keys = gKeyStatusPtr->repeatedKeys;
            proc->unk_41 = 4;

            if (gKeyStatusPtr->heldKeys & L_BUTTON) {
                keys = gKeyStatusPtr->heldKeys;
                proc->unk_41 = 8;
            }

            if (proc->helpTextActive) {
                if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
                    CloseHelpBox();
                    proc->helpTextActive = 0;
                    return;
                }
            } else {
                if (gKeyStatusPtr->newKeys & R_BUTTON) {
                    StartHelpBox(
                        (proc->curIndex % 3) * 64 + 20,
                        ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 36,
                        gCharacterData[GetSupportScreenCharIdAt(proc->curIndex) - 1].descTextId
                    );

                    proc->helpTextActive = 1;

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
                if ((proc->curIndex % 3) != 0) {
                    proc->curIndex--;
                }
            }

            if (keys & DPAD_RIGHT) {
                if ((proc->curIndex % 3) != 2) {
                    proc->curIndex++;

                    if (proc->curIndex >= GetSupportScreenUnitCount()) {
                        proc->curIndex = GetSupportScreenUnitCount() - 1;
                    }
                }
            }

            if ((keys & DPAD_UP) && (proc->curIndex > 2)) {
                proc->curIndex -= 3;
            }

            if ((keys & DPAD_DOWN) && (proc->curIndex + 3 < GetSupportScreenUnitCount())) {
                proc->curIndex += 3;
            }

            if (previous != proc->curIndex) {
                var = ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16;

                proc->unk_40 = 0;
                PlaySoundEffect(0x65);

                if ((var < 0x10) && (proc->unk_34 != 0)) {
                    sub_80A199C(proc, (proc->unk_34 / 16) - 1);
                    proc->unk_40 = -1;
                    SetPrepScreenHandXPos((proc->curIndex % 3) * 64 + 20);
                } else if ((var >= 0x50) && (proc->unk_34 != ((((GetSupportScreenUnitCount() - 1) / 3) - 5) * 16))) {
                    sub_80A199C(proc, (proc->unk_34 / 16) + 6);
                    proc->unk_40 = 1;
                    SetPrepScreenHandXPos((proc->curIndex % 3) * 64 + 20);
                } else {

                    ShowPrepScreenHandCursor(
                        (proc->curIndex % 3) * 64 + 20,
                        var + 36,
                        7,
                        0x800
                    );
                }

                if (proc->helpTextActive != 0) {
                    StartHelpBox(
                        (proc->curIndex % 3) * 64 + 0x14,
                        ((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 36 - (proc->unk_40 * 16),
                        gCharacterData[GetSupportScreenCharIdAt(proc->curIndex) - 1].descTextId
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

        sub_80976CC(10, proc->unk_34, ((GetSupportScreenUnitCount() - 1) / 3) + 1, 6);

        BG_SetPosition(2, 0x0000FFD8, (proc->unk_34 - 36) & 0xff);
        return;
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 3);
        PlaySoundEffect(0x6b);
    }

    return;
}

//! FE8U = 0x080A1918
void SupportScreen_StartUnitSubMenu(struct SupportScreenProc* proc) {
    StartSupportUnitSubScreen(proc->fromPrepScreen, proc->curIndex, proc);
    return;
}

//! FE8U = 0x080A1930
void SupportScreen_RestartSourceScreenMusic(struct SupportScreenProc* proc) {
    if (!proc->fromPrepScreen) {
        sub_80029E8(0x43, 0x100, 0xc0, 0x18, 0);
    } else {
        sub_80029E8(0x34, 0x100, 0x100, 0x18, 0);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_SupportScreen[] = {
    PROC_SLEEP(0),

    PROC_CALL(SupportScreen_SetupUnits),
    PROC_CALL(SupportScreen_OnInit),

    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(SupportScreen_SetupGraphics),
    PROC_WHILE(IsMusicProc2Running),

    PROC_CALL(sub_8013D8C),
    PROC_REPEAT(WaitForFade),

    PROC_WHILE(MusicProc4Exists),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(SupportScreen_UpdateBlend),
    PROC_REPEAT(SupportScreen_Loop_KeyHandler),

    PROC_GOTO(1),

PROC_LABEL(2),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(SupportScreen_OnEnd),

    PROC_CALL(SupportScreen_StartUnitSubMenu),
    PROC_SLEEP(0),

    PROC_GOTO(0),

PROC_LABEL(3),
    PROC_CALL(SupportScreen_RestartSourceScreenMusic),

    PROC_CALL(StartFadeInBlackMedium),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(SupportScreen_OnEnd),
    PROC_WHILE(IsMusicProc2Running),

    PROC_END,
};

//! FE8U = 0x080A196C
void StartSupportScreenFromPrepScreen(ProcPtr parent) {
    struct SupportScreenProc* proc = Proc_StartBlocking(gProcScr_SupportScreen, parent);
    proc->fromPrepScreen = 1;
    return;
}

//! FE8U = 0x080A1984
void StartSupportScreen(ProcPtr parent) {
    struct SupportScreenProc* proc = Proc_StartBlocking(gProcScr_SupportScreen, parent);
    proc->fromPrepScreen = 0;
    return;
}

//! FE8U = 0x080A199C
void sub_80A199C(struct SupportScreenProc* proc, int param_2) {
    int i;
    int j;
    int x;
    int y;
    int color;
    struct TextHandle* textPtr;

    SetFontGlyphSet(0);
    SetFont(0);

    textPtr = gUnknown_02013498 + ((param_2 * 3) % 0x15);
    for (i = 0, j = (param_2 * 3); i < 3; textPtr++, j++, i++) {
        Text_Clear(textPtr);

        if ((j) < GetSupportScreenUnitCount()) {
            x = ((i) % 3) * 8;
            y = ((param_2 * 2)) & 0x1f;

            switch (sub_80A0F6C(proc->fromPrepScreen, (j))) {
                case 0:
                    color = 1;
                    break;
                case 1:
                    color = 0;
                    break;
                case 2:
                    color = 4;
                    break;
            }

            Text_SetXCursor(textPtr, 0);
            Text_SetColorId(textPtr, color);

            Text_AppendString(
                textPtr,
                GetStringFromIndex(gCharacterData[GetSupportScreenCharIdAt((j)) - 1].nameTextId)
            );

            Text_Draw(
                textPtr,
                gBG2TilemapBuffer + TILEMAP_INDEX(x, y)
            );
        }
    }

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x080A1A90
void sub_80A1A90(int idx) {
    struct SupportScreenProc* proc = Proc_Find(gProcScr_SupportScreen);

    if (proc != 0) {
        proc->unk_3c = idx;
    }

    return;
}

//! FE8U = 0x080A1AAC
int sub_80A1AAC(int idx, int partner, int unk) {
    return sub_8083790(
        0,
        GetSupportScreenCharIdAt(idx),
        GetSupportScreenPartnerCharId(idx, partner),
        unk
    );
}

//! FE8U = 0x080A1AE4
void sub_80A1AE4(void) {
    int ix;
    int iy;

    for (ix = 0; ix < 30; ix++) {
        for (iy = 0; iy < 20; iy++) {
            *(gUnknown_020136F4 + TILEMAP_INDEX(ix, iy+0x00)) = gBG0TilemapBuffer[TILEMAP_INDEX(ix, iy)];
            *(gUnknown_020136F4 + TILEMAP_INDEX(ix, iy+0x20)) = gBG1TilemapBuffer[TILEMAP_INDEX(ix, iy)];
            *(gUnknown_020136F4 + TILEMAP_INDEX(ix, iy+0x40)) = gBG2TilemapBuffer[TILEMAP_INDEX(ix, iy)];
        }
    }

    return;
}


//! FE8U = 0x080A1B6C
int GetSupportScreenPartnerCount(int charId) {
    if (gCharacterData[charId - 1].pSupportData == NULL) {
        return 0;
    }

    return gCharacterData[charId - 1].pSupportData->supportCount;
}

u16 CONST_DATA sSprite_NameAffinLv[] = {
    3,
    0x4000, 0x4000, 0x082C,
    0x4000, 0x4020, 0x0830,
    0x4000, 0x4040, 0x0834,
};

u16 CONST_DATA sSprite_08A19850[] = {
    2,
    0x4000, 0x8000, 0x0800,
    0x0000, 0x4020, 0x0804,
};

u16 CONST_DATA sSprite_08A1985E[] = {
    3,
    0x4000, 0x8000, 0x0806,
    0x4000, 0x8020, 0x080A,
    0x0000, 0x4040, 0x080E,
};

u16 CONST_DATA sSprite_BackButton[] = {
    2,
    0x4000, 0x8000, 0x0018,
    0x8000, 0x0020, 0x001C,
};

//! FE8U = 0x080A1B90
void DrawSupportSubScreenSprites(struct SubScreenProc* proc) {
    int oam2;
    int i;
    int x;
    int y;

    PutSpriteExt(4, (proc->x + 128) & 0x1FF, 8, sSprite_NameAffinLv, 0x23c0);
    PutSpriteExt(4, (proc->x + 32) & 0x1FF, 80, sSprite_08A19850, 0xE280);
    PutSpriteExt(4, (proc->x + 5) & 0x1FF, 103, gSprite_SupportScreenSuccessBox, 0xABC0);
    PutSpriteExt(4, (proc->x + 20) & 0x1FF, 111, sSprite_08A1985E, 0xE280);
    PutSpriteExt(4, (proc->x + 12) & 0x1FF, 144, sSprite_BackButton, 0x2bc0);

    x = (proc->x + 112) & 0x1FF;
    y = (proc->y + 22);

    for (i = 0; i < proc->partnerCount; i++) {
        oam2 = 0xc000;

        if (proc->partnerState[i] == 0) {
            oam2 = 0xd000;
        }

        if (proc->partnerState[i] == 2) {
            oam2 = 0xf000;
        }

        PutUnitSpriteForClassId(
            0,
            x,
            y + (i * 16),
            oam2 | 0xc00,
            proc->partnerClassId[i]
        );
    }

    SyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x080A1C8C
void DrawSupportSubScreenUnitPartnerText(struct SubScreenProc* proc, int idx) {

    int _y;
    int i;
    int unitCharId;
    int partnerCharId;

    int gUnknown_08205C90[3] = {
        0x1B,
        0x1A,
        0x19,
    };

    if (proc->partnerState[idx] == 0) {
        for (i = 0; i < 5; i++) {
            sub_8004B0C(gBG2TilemapBuffer + TILEMAP_INDEX(0x10 + i, _y = idx * 2 + 3), 1, 0x14);
        }

        for (i = 0; i < 2; i++) {
            sub_8004B0C(gBG2TilemapBuffer + TILEMAP_INDEX(0x16 + i, _y = idx * 2 + 3), 1, 0x14);
        }

        for (i = 0; i < 3; i++) {
            sub_8004B0C(gBG2TilemapBuffer + TILEMAP_INDEX(0x19 + i, _y = idx * 2 + 3), 1, 0x14);
        }
    } else {
        int color = 0;

        unitCharId = GetSupportScreenCharIdAt(proc->unitIdx);
        partnerCharId = GetSupportScreenPartnerCharId(proc->unitIdx, idx);

        if (proc->partnerState[idx] == 2) {
            color = 1;
        }

        DrawTextInline(
            0,
            gUnknown_02023CC8 + (_y = ((idx * 2) + 3) * 0x20),
            color,
            0,
            5,
            GetStringFromIndex(gCharacterData[GetSupportScreenPartnerCharId(proc->unitIdx, idx) - 1].nameTextId)
        );

        DrawIcon(
            gUnknown_02023CC8 + TILEMAP_INDEX(6, (idx * 2) + 3),
            gCharacterData[GetSupportScreenPartnerCharId(proc->unitIdx, idx) - 1].affinity + 0x79,
            0xe000
        );

        if (sub_80A3468(unitCharId, partnerCharId) == 2) {
            for (i = 0; i < 2; i++) {
                color = 1;
                if (proc->supportLevel[idx] == 2) {
                    color = 4;
                } else if (proc->supportLevel[idx] > i) {
                    color = 0;
                }

                sub_8004B0C(gBG2TilemapBuffer + TILEMAP_INDEX(0x19 + i, (idx * 2) + 3), color, gUnknown_08205C90[i]);
            }

            sub_8004B0C(gBG2TilemapBuffer + 0x1B + (((idx * 2) + 3) * 0x20), 1, 0x14);
        } else {

            for (i = 0; i < 3; i++) {
                color = 1;
                if (proc->supportLevel[idx] == 3) {
                    color = 4;
                } else if (proc->supportLevel[idx] > i) {
                    color = 0;
                }

                sub_8004B0C(gBG2TilemapBuffer + TILEMAP_INDEX(0x19 + i, (idx * 2) + 3), color, gUnknown_08205C90[i]);
            }
        }
    }
    return;
}

//! FE8U = 0x080A1E7C
void DrawSupportSubScreenRemainingText(struct SubScreenProc* proc) {
    const char* str;
    struct Font font;
    struct TextHandle th;

    InitSomeOtherGraphicsRelatedStruct(&font, (void*)0x06015000, 0xe);
    CopyToPaletteBuffer(Pal_UIFont, 0x3c0, 0x20);

    Text_Init3(&th);

    SetFont(&font);
    SetFontGlyphSet(0);

    Text_80046B4(&th, 0);

    str = GetStringFromIndex(gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].nameTextId);

    Text_InsertString(
        &th,
        GetStringTextCenteredPos(40, str),
        TEXT_COLOR_NORMAL,
        str
    );

    Text_InsertString(
        &th,
        48,
        proc->remainingSupports == 0 ? TEXT_COLOR_GRAY : TEXT_COLOR_NORMAL,
        GetStringFromIndex(0x5AB) // TODO: msgid "Remaining[.]"
    );

    Text_InsertString(
        &th,
        96,
        proc->remainingSupports == 0 ? TEXT_COLOR_GRAY : TEXT_COLOR_NORMAL,
        GetStringFromIndex(0x5AC) // TODO: msgid "x[.]"
    );

    Text_SetXCursor(&th, sub_80AEBEC(proc->remainingSupports) * 8 + 96);

    Text_SetColorId(&th, (proc->remainingSupports == 0) ? TEXT_COLOR_GRAY : TEXT_COLOR_BLUE);
    Text_AppendNumberOr2Dashes(&th, proc->remainingSupports);

    SetFont(0);

    return;
}

//! FE8U = 0x080A1F68
void InitSupportSubScreenPartners(struct SubScreenProc* proc) {
    int i;
    int j;

    if (proc->fromPrepScreen) {
        for (i = 0; i < proc->partnerCount; i++) {
            int partnerCharId = GetSupportScreenPartnerCharId(proc->unitIdx, i);

            proc->partnerState[i] = 0;

            for (j = 1; j < 0x40; j++) {
                struct Unit* unit = GetUnit(j);

                if (!UNIT_IS_VALID(unit)) {
                    continue;
                }

                if (unit->pCharacterData->number != partnerCharId) {
                    continue;
                }

                if (unit->state & US_BIT16) {
                    continue;
                }

                if (unit->state & US_DEAD) {
                    proc->partnerState[i] = 2;
                } else {
                    proc->partnerState[i] = 1;
                }
            }
        }
    } else {
        proc->unk_3b = 0;

        for (i = 0; i < proc->partnerCount; i++) {
            proc->partnerState[i] = 0;

            if (GetSupportScreenPartnerIsAlive(proc->unitIdx, i)) {
                proc->partnerState[i] = 1;
                proc->unk_3b += GetSupportScreenPartnerSupportLevel(proc->unitIdx, i);
            }
        }

    }

    return;
}

//! FE8U = 0x080A204C
void InitSupportSubScreenPartnerLevels(struct SubScreenProc* proc) {
    int i;

    for (i = 0; i < proc->partnerCount; i++) {
        proc->supportLevel[i] = GetSupportScreenPartnerSupportLevel(proc->unitIdx, i);
    }

    return;
}

//! FE8U = 0x080A207C
void InitSupportSubScreenRemainingSupports(struct SubScreenProc* proc) {
    int i;

    if (proc->fromPrepScreen) {
        proc->remainingSupports = 5 - GetTotalSupportLevel(proc->unitIdx);
    } else {
        int charId = GetSupportScreenCharIdAt(proc->unitIdx);

        proc->remainingSupports = 0;

        for (i = 0; i < proc->partnerCount; i++) {
            proc->remainingSupports += sub_80A3468(charId, GetSupportScreenPartnerCharId(proc->unitIdx, i));
        }

        proc->remainingSupports -= GetTotalSupportLevel(proc->unitIdx);
    }

    return;
}

//! FE8U = 0x080A20FC
void DrawSupportSubScreenUnitPartnerDetails(struct SubScreenProc* proc) {
    int i;

    ResetUnitSprites();

    for (i = 0; i < proc->partnerCount; i++) {
        proc->partnerClassId[i] = GetSupportScreenPartnerClassId(proc->unitIdx, i);
        UseUnitSprite(GetClassSMSId(proc->partnerClassId[i]));
    }

    ForceSyncUnitSpriteSheet();

    for (i = 0; i < proc->partnerCount; i++) {
        DrawSupportSubScreenUnitPartnerText(proc, i);
    }

    return;
}

//! FE8U = 0x080A2154
void SupportSubScreen_MoveCursorToNextValidUnit(struct SubScreenProc* proc, int partnerIdx, int step) {
    while (1) {
        if (partnerIdx < 0) {
            return;
        }

        if (partnerIdx > (proc->partnerCount - 1)) {
            return;
        }

        if (proc->partnerState[partnerIdx] & 1) {
            if (GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx) > 0) {
                proc->unk_39 = (proc->unk_39 & 0xe3) + ((partnerIdx & 7) << 2);

                if ((proc->unk_39 & 3) >= GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx)) {
                    proc->unk_39 = (proc->unk_39 & 0xfc) + (GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx) - 1);
                }

                return;
            }
        }

        partnerIdx += step;
    }

    return;
}

//! FE8U = 0x080A21D0
void SupportSubScreen_Init(struct SubScreenProc* proc) {
    proc->x = 0;
    proc->y = 0;
    proc->unk_39 &= 0xfc;
    proc->unk_39 &= 0xe3;
    proc->partnerCount = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(proc->unitIdx));

    InitSupportSubScreenPartners(proc);
    InitSupportSubScreenPartnerLevels(proc);
    InitSupportSubScreenRemainingSupports(proc);
    SupportSubScreen_MoveCursorToNextValidUnit(proc, 0, +1);

    return;
}

//! FE8U = 0x080A221C
void sub_80A221C(void) {
    int i;
    u16* src = &gPaletteBuffer[0x1C * 0x10];
    u16* dst = &gPaletteBuffer[0x1D * 0x10];

    for (i = 0; i < 0x10; dst++, src++, i++) {
        *dst = (((*src & 0x1f) >> 1) & 0x1f) + (((*src & 0x3e0) >> 1) & 0x3e0) + (((*src & 0x7c00) >> 1) & 0x7c00);
    }

    return;
}

//! FE8U = 0x080A2274
void SupportSubScreen_SetupGraphics(struct SubScreenProc* proc) {
    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    Font_InitForUIDefault();
    ResetIconGraphics_();

    LoadUiFrameGraphics();
    LoadObjUIGfx();

    SetupMapSpritesPalettes();
    sub_80A221C();
    LoadIconPalettes(0xd);

    NewGreenTextColorManager((void*)proc);

    if (!proc->fromPrepScreen) {
        gPlaySt.cfgTextSpeed = 1; // TODO: Text speed constants

        ResetPrepScreenHandCursor(proc);
        sub_80AD4A0(0x600, 1);
        sub_80AD594(1);

        proc->unk_3a = -1;

        if (proc->unk_3b != 0) {
            ShowPrepScreenHandCursor(
                (proc->unk_39 & 3) * 8 + 0xc4,
                ((proc->unk_39 >> 2) & 7) * 16 + 0x18,
                1,
                0x800
            );
        }
    }

    BG_SetPosition(0, 4, 0);
    BG_SetPosition(1, 4, 0);
    BG_SetPosition(2, 0, 0);

    SetSpecialColorEffectsParameters(1, 0xd, 3, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    sub_8001F48(0);
    sub_8001F64(0);

    EndSlidingWallEffectMaybe();

    sub_8098C3C(0x4000, 5);

    CopyDataWithPossibleUncomp(gTsa_SupportSubScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    PutFace80x72(
        (struct Proc*)proc,
        gUnknown_02022CEC,
        gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].portraitId,
        0x200,
        2
    );

    DrawSupportSubScreenUnitPartnerDetails(proc);
    DrawSupportSubScreenRemainingText(proc);

    CopyDataWithPossibleUncomp(gGfx_SupportMenu, (void*)0x06017800);
    CopyToPaletteBuffer(gPal_SupportMenu, 0x340, 0x20);
    CopyToPaletteBuffer(Pal_MapBattleInfoNum, 0x240, 0x20);

    StartParallelWorker(DrawSupportSubScreenSprites, proc);

    return;
}

//! FE8U = 0x080A2448
void SupportSubScreen_Loop_KeyHandler(struct SubScreenProc* proc) {

    if (gKeyStatusPtr->newKeys & B_BUTTON) {
        PlaySoundEffect(0x6b);
        Proc_Goto(proc, 3);
        return;
    }

    if (gKeyStatusPtr->repeatedKeys & R_BUTTON) {
        Proc_Goto(proc, 4);
        return;
    }

    if (gKeyStatusPtr->repeatedKeys & L_BUTTON) {
        Proc_Goto(proc, 5);
        return;
    }

    if (proc->fromPrepScreen) {
        return;
    }

    if (proc->unk_3b != 0) {
        u32 previous = proc->unk_39;

        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            PlaySoundEffect(0x6a);
            Proc_Goto(proc, 2);
            return;
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
            if ((proc->unk_39 & 3) != 0) {
                int unk = (proc->unk_39 & 0xfc) + 0xFF;
                proc->unk_39 = unk + (proc->unk_39 & 3);
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            if ((proc->unk_39 & 3) < GetSupportScreenPartnerSupportLevel(proc->unitIdx, (proc->unk_39 >> 2) & 7) - 1) {
                int unk = (proc->unk_39 & 0xfc) + 1;
                proc->unk_39 = unk + (proc->unk_39 & 3);
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
            SupportSubScreen_MoveCursorToNextValidUnit(proc, ((proc->unk_39 >> 2) & 7) - 1, -1);
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
            SupportSubScreen_MoveCursorToNextValidUnit(proc, ((proc->unk_39 >> 2) & 7) + 1, +1);
        }

        if (previous != proc->unk_39) {
            ShowPrepScreenHandCursor(
                (proc->unk_39 & 3) * 8 + 0xc4,
                ((proc->unk_39 >> 2) & 7) * 16  + 0x18,
                1,
                0x800
            );
            PlaySoundEffect(0x65);
        }

    } else {
        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            PlaySoundEffect(0x6c);
        }

        return;
    }

    return;
}

//! FE8U = 0x080A25F8
void sub_80A25F8(struct SubScreenProc* proc) {

    SetupBackgrounds(0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(0, 1, 0, 0, 0);

    ResetFaces();

    Font_InitForUIDefault();
    ResetIconGraphics_();
    LoadLegacyUiFrameGraphics();
    LoadObjUIGfx();

    sub_8083764(
        GetSupportScreenCharIdAt(proc->unitIdx),
        GetSupportScreenPartnerCharId(proc->unitIdx, proc->unk_39 >> 2 & 7),
        (proc->unk_39 & 3) + 1
    );

    return;
}

//! FE8U = 0x080A26A8
void SupportSubScreen_StartSwapPage(struct SubScreenProc* proc) {

    proc->unk_3a = 0;

    HidePrepScreenHandCursor();

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 0;

    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 0, 1);

    sub_80A1AE4();

    PlaySoundEffect(0xC8);

    return;
}

//! FE8U = 0x080A2730
void sub_80A2730(u32 xBase) {
    int ix;
    int iy;

    for (ix = 0; ix < 30; ix++) {
        u32 x = ix + xBase;
        if (x < 30) {

            for (iy = 0; iy < 20; iy++) {
                *(gBG0TilemapBuffer + TILEMAP_INDEX(ix, iy)) = *(gUnknown_020136F4 + TILEMAP_INDEX(x, iy + 0x00));
                *(gBG1TilemapBuffer + TILEMAP_INDEX(ix, iy)) = *(gUnknown_020136F4 + TILEMAP_INDEX(x, iy + 0x20));
                *(gBG2TilemapBuffer + TILEMAP_INDEX(ix, iy)) = *(gUnknown_020136F4 + TILEMAP_INDEX(x, iy + 0x40));
            }

        } else {
            for (iy = 0; iy < 20; iy++) {
                *(gBG0TilemapBuffer + TILEMAP_INDEX(ix, iy)) = 0;
                *(gBG1TilemapBuffer + TILEMAP_INDEX(ix, iy)) = 0;
                *(gBG2TilemapBuffer + TILEMAP_INDEX(ix, iy)) = 0;
            }
        }
    }

    BG_EnableSyncByMask(7);

    return;
}

//! FE8U = 0x080A2800
void SupportSubScreen_SwapPageOut_ToLeft(struct SubScreenProc* proc) {
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = -b * 8;
    sub_80A2730(b);

    SetSpecialColorEffectsParameters(1, c, 0x10 - c, 0);

    if (proc->unk_3a == 10) {
        Proc_Break(proc);
        proc->unitIdx = GetNextSupportScreenUnit(proc->unitIdx);
    }

    return;
}

//! FE8U = 0x080A286C
void SupportSubScreen_SwapPageIn_FromRight(struct SubScreenProc* proc) {
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = (8 - b) * 8;

    sub_80A2730(b - 8);
    SetSpecialColorEffectsParameters(1, 0x10 - c, c, 0);

    if (proc->unk_3a == 10) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080A28E0
void SupportSubScreen_SwapPageOut_ToRight(struct SubScreenProc* proc) {
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = b * 8;

    sub_80A2730(-b);
    SetSpecialColorEffectsParameters(1, c, 0x10 - c, 0);

    if (proc->unk_3a == 10) {
        Proc_Break(proc);
        proc->unitIdx = GetPreviousSupportScreenUnit(proc->unitIdx);
    }

    return;
}

//! FE8U = 0x080A294C
void SupportSubScreen_SwapPageIn_FromLeft(struct SubScreenProc* proc) {
    int a;
    int b;
    int c;

    proc->unk_3a++;

    a = 10 - proc->unk_3a;

    b = 8 - ((a * 8) * a / 100);
    c = 16 - (a * 0x10) * a / 100;

    proc->x = (b - 8) * 8;

    sub_80A2730(8 - b);
    SetSpecialColorEffectsParameters(1, 0x10 - c, c, 0);

    if (proc->unk_3a == 10) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080A29C0
void SupportSubScreen_ReinitAfterSwapPage(struct SubScreenProc* proc) {
    ResetFaces();
    Font_InitForUIDefault();
    ResetIconGraphics_();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    proc->unk_39 = proc->unk_39 & 0xfc;
    proc->unk_39 = proc->unk_39 & 0xe3;

    proc->partnerCount = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(proc->unitIdx));

    InitSupportSubScreenPartners(proc);
    InitSupportSubScreenPartnerLevels(proc);
    InitSupportSubScreenRemainingSupports(proc);
    SupportSubScreen_MoveCursorToNextValidUnit(proc, 0, +1);

    CopyDataWithPossibleUncomp(gTsa_SupportSubScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    PutFace80x72(
        (struct Proc*)proc,
        gBG0TilemapBuffer + 0x22,
        gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].portraitId,
        0x200,
        2
    );

    DrawSupportSubScreenUnitPartnerDetails(proc);
    DrawSupportSubScreenRemainingText(proc);
    sub_80A1AE4();

    proc->unk_3a = 0;

    return;
}

//! FE8U = 0x080A2AAC
void SupportSubScreen_EndSwapPage(struct SubScreenProc* proc) {

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetSpecialColorEffectsParameters(1, 0, 0xc, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    sub_8001F48(0);
    sub_8001F64(0);

    if (proc->fromPrepScreen == 0) {
        if (proc->unk_3b != 0) {
            ShowPrepScreenHandCursor(
                (proc->unk_39 & 3) * 8 + 0xc4,
                (proc->unk_39 >> 2 & 7) * 16 + 0x18,
                1,
                0x800
            );

            proc->unk_3a = -1;
        }
    }

    return;
}

//! FE8U = 0x080A2B5C
void SupportSubScreen_OnEnd(struct SubScreenProc* proc) {
    EndAllProcChildren(proc);
    EndBG3Slider_();
    EndFaceById(0);
    sub_80A1A90(proc->unitIdx);
    return;
}

//! FE8U = 0x080A2B7C
void SupportSubScreen_PrepareSupportConvo(struct SubScreenProc* proc) {

    proc->unk_3e = sub_80A1AAC(
        proc->unitIdx,
        proc->unk_39 >> 2 & 7,
        (proc->unk_39 & 3) + 1
    );

    if (proc->unk_3e == 0) {
        sub_80029E8(9, 0x100, 0x80, 0x10, 0);
    } else {
        sub_80029E8(proc->unk_3e, 0x100, 0x100, 0x10, 0);
    }

    return;
}

//! FE8U = 0x080A2BD0
void sub_80A2BD0(struct SubScreenProc* proc) {

    if (proc->unk_3e == 0) {
        sub_80029E8(9, 0x80, 0x100, 0x10, 0);
    } else {
        sub_80029E8(9, 0x100, 0x100, 0x10, 0);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_SupportUnitSubScreen[] = {
    PROC_SLEEP(0),

    PROC_CALL(SupportSubScreen_Init),

PROC_LABEL(0),
    PROC_CALL(SupportSubScreen_SetupGraphics),

    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),

    PROC_WHILE(MusicProc4Exists),

PROC_LABEL(1),
    PROC_REPEAT(SupportSubScreen_Loop_KeyHandler),

    // fallthrough

PROC_LABEL(2),
    PROC_CALL(SupportSubScreen_PrepareSupportConvo),

    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(SupportSubScreen_OnEnd),
    PROC_SLEEP(0),

    PROC_WHILE(MusicProc4Exists),

    PROC_CALL(sub_80A25F8),
    PROC_SLEEP(0),

    PROC_WHILE(EventEngineExists),

    PROC_CALL(sub_80A2BD0),
    PROC_SLEEP(8),

    PROC_GOTO(0),

PROC_LABEL(4),
    PROC_CALL(SupportSubScreen_StartSwapPage),
    PROC_REPEAT(SupportSubScreen_SwapPageOut_ToLeft),
    PROC_CALL(SupportSubScreen_ReinitAfterSwapPage),
    PROC_REPEAT(SupportSubScreen_SwapPageIn_FromRight),
    PROC_CALL(SupportSubScreen_EndSwapPage),

    PROC_GOTO(1),

PROC_LABEL(5),
    PROC_CALL(SupportSubScreen_StartSwapPage),
    PROC_REPEAT(SupportSubScreen_SwapPageOut_ToRight),
    PROC_CALL(SupportSubScreen_ReinitAfterSwapPage),
    PROC_REPEAT(SupportSubScreen_SwapPageIn_FromLeft),
    PROC_CALL(SupportSubScreen_EndSwapPage),

    PROC_GOTO(1),

PROC_LABEL(3),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(SupportSubScreen_OnEnd),

    PROC_END,
};

//! FE8U = 0x080A2C08
void StartSupportUnitSubScreen(s8 fromPrepScreen, int unitIndex, ProcPtr parent) {
    struct SubScreenProc* proc = Proc_StartBlocking(gProcScr_SupportUnitSubScreen, parent);

    proc->fromPrepScreen = fromPrepScreen;
    proc->unitIdx = unitIndex;

    return;
}

//! FE8U = 0x080A2C2C
u8 *sub_80A2C2C(void) {
    gUnknown_0203E884 = 0;
    return &gUnknown_0203E884;
}

//! FE8U = 0x080A2C38
void sub_80A2C38(void) {
    return;
}
