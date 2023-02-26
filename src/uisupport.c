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

int GetSupportScreenCharIdAt(int);
void sub_80A199C(ProcPtr, int);
int sub_80A1B6C(int);
void sub_80A2C08(s8, int, ProcPtr);

extern struct TextHandle gUnknown_02013498[];
extern struct TextHandle gUnknown_02013590[];

extern int sSupportScreenUnitCount;

extern u16 gUnknown_02023136[];
extern u16 gUnknown_020235AA[];

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
int GetSupportScreenPartnerIsAlive(int idx, int partner) {
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

            if (!sub_80A1B6C(unit->pCharacterData->number)) {
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

            sSupportScreenUnits[sSupportScreenUnitCount].charId = j;
            sSupportScreenUnits[sSupportScreenUnitCount].classId = gCharacterData[j - 1].defaultClass;

            sub_80A35EC(j, sSupportScreenUnits[sSupportScreenUnitCount].supportLevel, &saveMeta);

            for (k = 0; k < sub_80A1B6C(j); k++) {
                int charId = GetSupportScreenPartnerCharId(sSupportScreenUnitCount, k);

                sSupportScreenUnits[sSupportScreenUnitCount].partnerClassId[k] = gCharacterData[charId - 1].defaultClass;
                sSupportScreenUnits[sSupportScreenUnitCount].partnerIsAlive[k] = GGM_IsCharacterKnown(charId, &saveMeta);
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

    c = sub_80A1B6C(GetSupportScreenCharIdAt(idx));

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

    sub_8097748(proc, 0xd8, 0x2d, 0x200, 4);

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
    sub_80A2C08(proc->fromPrepScreen, proc->curIndex, proc);
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
