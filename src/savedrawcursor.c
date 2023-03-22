#include "global.h"

#include "ctc.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"

#include "savemenu.h"

/*
 * TODO: This file can be merged with "savemenu.c" after "savedraw.s" is completed.
 */

// TODO: temp rodata - name of proc
const char gUnknown_08205DE0[] = "savedraw";

struct SaveDrawCursorProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a;
    /* 2C */ u8 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ u8 unk_36;
    /* 37 */ u8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
};

struct SaveMenuUnusedProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ struct SaveDrawCursorProc* unk_34;
};

struct SaveMenu8A206F8Proc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x3e - 0x29];

    /* 3E */ u16 unk_3e;
    /* 40 */ u16 unk_40;
};

struct SqMaskProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ s8 unk_2a;
    /* 2B */ u8 unk_2b;
};

struct Unknown020007E0 {
    /* 00 */ u32 unk_00;
    /* 04 */ int unk_04;
    /* 08 */ s16 unk_08;
    /* 0A */ s16 unk_0a;
    /* 0C */ s8 unk_0c;
    /* 0D */ s8 unk_0d;
    /* 0E */ s8 unk_0e;
};
// sizeof = 0x10

extern struct Unknown020007E0 gUnknown_020007E0[];

extern u8 gUnknown_02000000[];
extern struct Font gUnknown_02000920;
extern struct TextHandle gUnknown_02000938;
extern u16 gUnknown_020238F6[];

struct Unknown03004990 {
    /* 000 */ u8 unk[0x79E - 0x000];
    /* 79E */ u8 unk_79E;
};

extern struct Unknown03004990* gUnknown_03004990;

extern u16 gUnknown_08A20570[];
extern u16 gUnknown_08A20578[];
extern u16 gUnknown_08A20580[];

void sub_80AA9D8(ProcPtr);
u8 sub_80A88B8(u8);

void sub_8014DA8(void*);
void sub_8014E3C(void);
void sub_8014EC4(int, int);
void sub_8014EF4(int);


//! FE8U = 0x080AB314
void SaveDrawCursor_Init(struct SaveDrawCursorProc* proc) {
    proc->unk_36 = 0;

    proc->unk_2a = 0;
    proc->unk_2e = 0;
    proc->unk_30 = 0;
    proc->unk_32 = 0;
    proc->unk_34 = 0;

    proc->unk_37 = 0;
    proc->unk_38 = 0;
    proc->unk_3a = 0;
    proc->unk_2c = 0;
    return;
}

//! FE8U = 0x080AB340
void SaveDrawCursor_Loop(struct SaveDrawCursorProc* proc) {
    s16 yOam0;
    s16 xOam1;
    u16 xOam1_;

    u8 yOffsetLut[] = {
        0, 1, 2, 3, 3, 2, 1, 0,
    };

    if ((s8)((struct SaveMenuProc*)(proc->proc_parent))->unk_29 == 0) {
        return;
    }

    proc->unk_2a++;

    if (proc->unk_2c < 4) {
        proc->unk_2c++;
    }

    if (proc->unk_36 != 0) {
        yOam0 = proc->unk_32;
        xOam1 = proc->unk_2e;

        if (proc->unk_2c < 4) {
            yOam0 = (proc->unk_32 - proc->unk_34) / 2 + proc->unk_34;
            xOam1 = (proc->unk_2e - proc->unk_30) / 2 + proc->unk_30;
        }

        if (proc->unk_3a == 0) {
            xOam1_ = (xOam1) + 0x9c;
        } else {
            xOam1_ = (xOam1) + 0xb0;
        }

        proc->unk_34 = proc->unk_32;
        proc->unk_30 = proc->unk_2e;

        if (proc->unk_3a == 0) {
            PutSpriteExt(
                4,
                xOam1 & 0x1FF,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                gUnknown_08A20570,
                0x3000
            );

            xOam1 = xOam1_;

            PutSpriteExt(
                4,
                (xOam1 & 0x1FF) | 0x1000,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                gUnknown_08A20570,
                0x3000
            );
        } else {
            PutSpriteExt(
                4,
                4,
                (yOam0 + yOffsetLut[proc->unk_2a >> 3 & 7]) & 0xff,
                gUnknown_08A20570,
                0x3000
            );
        }

        proc->unk_2c = 0;
    } else {
        if (proc->unk_2c == 4) {
            proc->unk_36 = 0;
        }
    }

    if (proc->unk_38 != 0) {
        PutSpriteExt(4, 6, proc->unk_37, gUnknown_08A20570, 0x3000);
    }

    if (proc->unk_39 != 0) {
        proc->unk_38 = 0;
    }

    proc->unk_36 = 0;
    proc->unk_39 = 1;

    return;
}

//! FE8U = 0x080AB4F4
void sub_80AB4F4(int a, s16 b, s16 c, struct SaveMenuUnusedProc* proc) {
    struct SaveDrawCursorProc* drawCursorProc = proc->unk_34;

    drawCursorProc->unk_32 = c - 12;
    drawCursorProc->unk_2e = b - 2;
    drawCursorProc->unk_36 = 1;
    drawCursorProc->unk_3a = a;
    return;
}

//! FE8U = 0x080AB514
void sub_80AB514(int a, int b, struct SaveMenuUnusedProc* proc) {
    struct SaveDrawCursorProc* drawCursorProc = proc->unk_34;

    drawCursorProc->unk_37 = b;
    drawCursorProc->unk_38 = 1;
    drawCursorProc->unk_3a = a;
    drawCursorProc->unk_39 = 0;
    return;
}

struct ProcCmd CONST_DATA gProcScr_SaveDrawCursor[] = {
    PROC_NAME("savedrawcursor"),

    PROC_CALL(SaveDrawCursor_Init),
    PROC_REPEAT(SaveDrawCursor_Loop),

    PROC_END,
};

//! FE8U = 0x080AB534
struct SaveMenuCursorProc* StartSaveDrawCursor(ProcPtr parent) {
    return Proc_Start(gProcScr_SaveDrawCursor, parent);
}

//! FE8U = 0x080AB548
void sub_80AB548(void) {
    int i;

    for (i = 0; i <= 0x13; i++) {
        gUnknown_020007E0[i].unk_0e = 0;
        gUnknown_020007E0[i].unk_04 = 0xa0;
        gUnknown_020007E0[i].unk_00 = 0xa0;
        gUnknown_020007E0[i].unk_0a = 0;
        gUnknown_020007E0[i].unk_08 = 0;
    }

    return;
}

//! FE8U = 0x080AB56C
void sub_80AB56C(u32 a) {
    int i;
    struct Unknown020007E0* ptr;

    int count = 0;

    for (i = 0, ptr = gUnknown_020007E0; i <= 0x13; i++, ptr++) {
        if (ptr->unk_0e != 0) {

            if (ptr->unk_00 + 0xC0 <= 0xC5F) {

                if (ptr->unk_04 <= 0x3BF) {
                    PutSpriteExt(
                        0xe,
                        ((int)ptr->unk_00 / 12) & 0x1FF,
                        (ptr->unk_04 / 12) & 0xff,
                        gUnknown_08A20580,
                        0x3000
                    );
                } else {
                    PutSpriteExt(
                        0xe,
                        ((int)ptr->unk_00 / 12) & 0x1FF,
                        (ptr->unk_04 / 12) & 0xff,
                        gUnknown_08A20578,
                        0x3000
                    );
                }
            }

            ptr->unk_00 += ptr->unk_08;
            ptr->unk_04 += ptr->unk_0a;

            if ((a & 3) == 0) {
                ptr->unk_08 += ptr->unk_0c;
                ptr->unk_0a += ptr->unk_0d;
            }

            if ((ptr->unk_00 + 0x5a0 > 0x167F)
                || (ptr->unk_04 < -0x3C0)
                || (ptr->unk_04 > 0xB3F)) {
                ptr->unk_0e = 0;
            } else {
                count++;
            }
        }

    }

    if (count < 0x13) {
        for (ptr = gUnknown_020007E0, i = 0; i <= 0x13; i++, ptr++) {
            if (ptr->unk_0e == 0) {

                if (DivRem(AdvanceGetLCGRNValue(), 0xb) == 0) {
                    ptr->unk_00 = (((DivRem(AdvanceGetLCGRNValue(), 0x11) - 8) * 0x1e)
                        + DivRem(AdvanceGetLCGRNValue(), 0x1f)) * 0xc;
                    ptr->unk_04 = 0x780;
                    ptr->unk_08 = DivRem(AdvanceGetLCGRNValue(), 7) + 6;
                    ptr->unk_0a = -0x18 - DivRem(AdvanceGetLCGRNValue(), 0x19);
                    ptr->unk_0c = DivRem(AdvanceGetLCGRNValue(), 3) + 1;
                    ptr->unk_0d = 0;
                    ptr->unk_0e = 1;
                }

            }
        }
    }

    return;
}

//! FE8U = 0x080AB720
void sub_80AB720(struct SaveMenu8A206F8Proc* proc) {
    proc->unk_40 = 0;
    proc->unk_3e = 0;

    sub_8014EC4(0, REG_ADDR_BG2HOFS);
    sub_8014EF4(0);
    sub_80AA9D8(proc);

    gUnknown_03004990->unk_79E = 1;

    return;
}

struct ProcCmd CONST_DATA gProcScr_08A206F8[] = {
    PROC_SET_END_CB(sub_8014E3C),
    PROC_SLEEP(0),

    PROC_CALL(sub_80AB720),
    PROC_REPEAT(sub_80AA9D8),

    PROC_END,
};

//! FE8U = 0x080AB760
void sub_80AB760(void) {
    Proc_Start(gProcScr_08A206F8, PROC_TREE_3);
    sub_8014DA8(gUnknown_02000000);
    return;
}

//! FE8U = 0x080AB77C
void sub_80AB77C(void) {
    Proc_EndEach(gProcScr_08A206F8);
    SetPrimaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x080AB794
void sub_80AB794(void) {
    Font_InitForUI(&gUnknown_02000920, (void*)0x06001000, 0x80, 4);
    Text_Init(&gUnknown_02000938, 10);
    return;
}

//! FE8U = 0x080AB7BC
void sub_80AB7BC(int msgId, s8 flag) {
    const char* str;

    if (flag != 0) {
        str = GetStringFromIndex(msgId);

        SetFont(&gUnknown_02000920);

        Text_Clear(&gUnknown_02000938);
        Text_SetXCursor(&gUnknown_02000938, 0);
        Text_SetColorId(&gUnknown_02000938, 0);
        Text_AppendString(&gUnknown_02000938, str);

        Text_SetXCursor(&gUnknown_02000938, 0x2c);
        Text_AppendString(&gUnknown_02000938, GetStringFromIndex(0x142)); // TODO: msgid "Cancel"

        Text_Draw(&gUnknown_02000938, gUnknown_020238F6);
    } else {
        TileMap_FillRect(gUnknown_020238F6, 0xb, 1, 0);
    }

    BG_EnableSyncByMask(2);

    return;
}

int CONST_DATA gUnknown_08A20720[] = {
    0x0000, // ""
    0x0143, // "Start[.]"
    0x0144, // "Copy"
    0x0140, // "Erase[.]"
    0x0143, // "Start[.]"
    0x0143, // "Start[.]"
    0x0145, // "Save"
};

//! FE8U = 0x080AB83C
void sub_80AB83C(struct SaveMenuProc* proc, s8 flag) {
    sub_80AB7BC(gUnknown_08A20720[sub_80A88B8(proc->unk_42)], flag);

    if (flag == 0) {
        proc->unk_36 = 0;
    }

    return;
}

//! FE8U = 0x080AB874
void AddMainMenuOption(struct SaveMenuProc* proc, int option) {
    proc->unk_30 |= option;
    proc->unk_31++;
    return;
}

//! FE8U = 0x080AB888
void AddExtraMenuOption(struct SaveMenuProc* proc, int option) {
    proc->unk_32 |= option;
    proc->unk_33++;
    return;
}

//! FE8U = 0x080AB89C
void sub_80AB89C(struct SaveMenuProc* proc) {
    int i;

    int count = 0;

    proc->unk_31 = 0;
    proc->unk_30 = 0;

    if (proc->unk_44 == 0x100) {
        AddMainMenuOption(proc, MAIN_MENU_OPTION_RESUME);
    }

    for (i = 0; i < 3; i++) {
        if (proc->unk_37[i] != 0xFF) {
            count++;
        }
    }

    if (count > 0) {
        AddMainMenuOption(proc, MAIN_MENU_OPTION_RESTART);

        if (count < 3) {
            AddMainMenuOption(proc, MAIN_MENU_OPTION_COPY);
        }

        AddMainMenuOption(proc, MAIN_MENU_OPTION_ERASE);
    }

    if (count < 3) {
        AddMainMenuOption(proc, MAIN_MENU_OPTION_NEW_GAME);
    }

    proc->unk_32 = 0;
    proc->unk_33 = 0;

    if (IsExtraLinkArenaEnabled(0) != 0) {
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_LINK_ARENA);
    }

    if (IsExtraSoundRoomEnabled() != 0) {
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_SOUND_ROOM);
    }

    if (IsExtraSupportViewerEnabled() != 0) {
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_SUPPORT);
    }

    if (IsExtraFreeMapEnabled() != 0) {
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_MAP);
    }

    if (IsExtraBonusClaimEnabled() != 0) {
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_BONUS_CLAIM);
    }

    if (proc->unk_32 != 0) {
        proc->unk_30 |= MAIN_MENU_OPTION_EXTRAS;
        proc->unk_31++;
    }

    return;
}

//! FE8U = 0x080AB98C
u8 sub_80AB98C(u8 slot, int b, int c) {
    u8 i;
    s8 castB = b;
    s8 castC = c;

    if (castC > 0) {
        for (i = 0; i < 3; i++) {
            if ((IsSaveValid(slot) == castB)) {
                return slot;
            }

            if (slot == 2) {
                slot = 0;
            } else {
                slot++;
            }
        }
    } else {
        for (i = 0; i < 3; i++) {
            if ((IsSaveValid(slot) == castB)) {
                return slot;
            }

            if (slot == 0) {
                slot = 2;
            } else {
                slot--;
            }
        }
    }

    return 0xff;
}

//! FE8U = 0x080AB9FC
s8 sub_80AB9FC(struct SaveMenuProc* proc, int b) {
    s8 castB = b;
    s8 flag = 0;

    u8 previous = proc->unk_2c;

    switch (proc->unk_42) {
        case 0x80:
            flag = 1;
            break;

        case 4:
            if (proc->unk_2d == 0xFF) {
                flag = 1;
            }

            break;

        case 2:
        case 8:
            flag = 1;
            break;

        case 0x10:
            break;

        case 1:
            return 0;
    }

    if (castB >= 1) {
        if (proc->unk_2c == 2) {
            proc->unk_2c = 0;
        } else {
            proc->unk_2c++;
        }
    } else {
        if (proc->unk_2c == 0) {
            proc->unk_2c = 2;
        } else {
            proc->unk_2c--;
        }
    }

    if (proc->unk_42 == 0x40) {
        return 1;
    }

    proc->unk_2c = sub_80AB98C(proc->unk_2c, flag, castB);

    if (previous == proc->unk_2c) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080ABA98
s8 sub_80ABA98(struct SaveMenuProc* proc) {

    if ((proc->unk_42 & proc->unk_30) != 0) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080ABAB4
void SqMask_Loop(struct SqMaskProc* proc) {
    proc->unk_29 += proc->unk_2b;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    if (proc->unk_2a >= 1) {
        gLCDControlBuffer.win1_left = proc->unk_29 * 3;
        gLCDControlBuffer.win1_top = proc->unk_29 * 2;
        gLCDControlBuffer.win1_right = -0x10 - (proc->unk_29 * 3);
        gLCDControlBuffer.win1_bottom = -0x60 - (proc->unk_29 * 2);
    } else {
        gLCDControlBuffer.win1_left = 0x78 - (proc->unk_29 * 3);
        gLCDControlBuffer.win1_top = 0x50 - (proc->unk_29 * 2);
        gLCDControlBuffer.win1_right = proc->unk_29 * 3 + 0x78;
        gLCDControlBuffer.win1_bottom = proc->unk_29 * 2 + 0x50;
    }

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 0;
    gLCDControlBuffer.wincnt.wout_enableObj = 0;

    if (proc->unk_29 > 0x27) {
        Proc_Break(proc);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_SqMask[] = {
    PROC_NAME("SqMask"),
    PROC_SLEEP(1),

    PROC_REPEAT(SqMask_Loop),

    PROC_END,
};

//! FE8U = 0x080ABBB0
void StartSqMask(struct SaveMenuProc* parent, int b, int c) {
    u8 castB = b;
    u8 castC = c;

    struct SqMaskProc* proc = Proc_StartBlocking(gProcScr_SqMask, parent);
    proc->unk_2a = castB;
    proc->unk_2b = castC;

    proc->unk_29 = 0;

    return;
}

//! FE8U = 0x080ABBE4
void SaveBgUp_Loop(void) {
    RegisterTileGraphics(gBG2TilemapBuffer, (void*)0x06007000, 0x800);
    return;
}

struct ProcCmd CONST_DATA gProcScr_SaveBgUp[] = {
    PROC_NAME("SaveBgUp"),
    PROC_SLEEP(1),

    PROC_REPEAT(SaveBgUp_Loop),

    PROC_END,
};

//! FE8U = 0x080ABC00
ProcPtr StartSaveBgUp(ProcPtr parent) {
    return Proc_Start(gProcScr_SaveBgUp, parent);
}
