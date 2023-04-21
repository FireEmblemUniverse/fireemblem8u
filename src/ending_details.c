#include "global.h"

#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"

struct EndingTitleEnt {
    /* 00 */ u8 pid;
    /* 02 */ u16 titleTextId;
    /* 04 */ int unk_04;
};

struct EndingWithdrawalEnt {
    /* 00 */ u8 pid;
    /* 01 */ u8 retreatDesignation;
};

struct EndingPairingEnt {
    /* 00 */ u8 type; // 1 = Alone, 2 = with A Support
    /* 01 */ u8 pidA;
    /* 02 */ u8 pidB;
    /* 04 */ int textId;
};

struct EndingDetailsProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x2E - 0x29];
    /* 2E */ u16 unk_2e;
    /* 30 */ struct EndingPairingEnt* unk_30;
    /* 34 */ void* unk_34;
    /* 38 */ struct Unit* unitA;
    /* 3C */ struct Unit* unitB;
    /* 40 */ u32* unk_40;
};

struct EndingDetails8A3D420Proc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* units[2];
    /* 34 */ int unk_34;
    /* 38 */ struct EndingPairingEnt* unk_38;
    /* 3C */ u16 battleAmounts[2];
    /* 40 */ u16 winAmounts[2];
    /* 44 */ u16 lossAmounts[2];
};

struct EndingDetails8A3D478Proc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct EndingPairingEnt* unk_2c;
    /* 30 */ struct Unit* unitA;
    /* 34 */ struct Unit* unitB;
    /* 38 */ u32 unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ const char* unk_44;
    /* 48 */ struct TextHandle* textHandle;
};

struct Fin8A3D498Proc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x4c-0x29];
    /* 4C */ u16 unk_4c;
    /* 4E */ u8 _pad2[0x58-0x4e];
    /* 58 */ int unk_58;
};

struct EndingTurnRecordProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 _pad[0x4c-0x3a];
    /* 4C */ s16 unk_4c;
};

struct UnkProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x40-0x29];
    /* 40 */ u8 unk_40[12]; // size unknown
    /* 4C */ u16 unk_4c[5];
};

extern struct EndingTitleEnt gUnknown_08A3D1B0[];
extern struct EndingWithdrawalEnt gUnknown_08A3D2C0[];
extern struct EndingPairingEnt* gUnknown_08A3D1A8[];

extern char* gUnknown_08A3CD64;

extern u16* gUnknown_08A3D348[];

extern struct TextHandle* gUnknown_08A3D358;

extern u8 gUnknown_08A3D40C[];

extern struct TextHandle* gUnknown_08A3D674;

extern u8 gUnknown_08A3F750[]; // gfx
extern u8 gUnknown_08A3FFEC[]; // tsa
extern u8 gUnknown_08A40068[]; // tsa
extern u16 gUnknown_08A3F710[]; // pal
extern u16 gUnknown_08B1754C[]; // pal

extern u8 gUnknown_08A40204[]; // tsa
extern u8 gUnknown_08A400E4[]; // tsa

extern u8 gUnknown_08A40470[]; // tsa
extern u8 gUnknown_08A4034C[]; // tsa
extern u16 gUnknown_02022CAC[];

extern u16 gUnknown_08A09A5C[]; // pal
extern u8 gUnknown_085A647C[]; // tsa

extern u16 gUnknown_08A40AD4[]; // pal
extern u8 gUnknown_08A40B14[]; // tsa

// "Fin" image
extern u16 gUnknown_08A405B4[]; // pal
extern u8 gUnknown_08A405D4[]; // gfx
extern u8 gUnknown_08A409D0[]; // tsa

// Sprites
extern u16 gUnknown_08A3D540[];
extern u16 gUnknown_08A3D5B4[];
extern u16 gUnknown_08A3D560[];
extern u16 gUnknown_08A3D56E[];
extern u16 gUnknown_08A3D598[];
extern u16 gUnknown_08A3D57C[];
extern u16 gUnknown_08A3D58A[];
extern u16 gUnknown_08A3D5A6[];

extern u16* gUnknown_08A3D624[];
extern u16* gUnknown_08A3D63C[];

// forward declarations
void sub_80B6F14(struct EndingPairingEnt*, struct Unit*, struct EndingDetailsProc*);
void sub_80B72A4(struct EndingPairingEnt*, struct Unit*, struct Unit*, struct EndingDetailsProc*);
void sub_80B742C(struct EndingPairingEnt*, struct Unit*, struct Unit*, struct EndingDetailsProc*);
void sub_80B744C(void);

//! FE8U = 0x080B6674
char* sub_80B6674(u16 textIdA, u16 defeatedChapter, u16 textIdB, char* str) {
    const char* locationStr;

    u8 count = 0;

    str = sub_80AEABC(GetStringFromIndex(textIdA), str);
    str = sub_80AEADC(1, str);

    if (defeatedChapter & 0x8000) {
        defeatedChapter &= 0x7FFF;
        locationStr = sub_80BBA28(defeatedChapter);
    } else {
        const s8* it; // TODO: should this be char*?

        defeatedChapter &= 0x7FFF;

        for (it = GetStringFromIndex(GetROMChapterStruct(defeatedChapter)->chapTitleTextId); *it != 0; it++) {
            if (*it != 0x21) {
                continue;
            }

            if (*(it+1) != 0x00) {
                continue;
            }

            count++;
        }

        locationStr = GetStringFromIndex(GetROMChapterStruct(defeatedChapter)->chapTitleTextId);
    }

    str = sub_80AEABC(locationStr, str);

    str = sub_80AEABC(GetStringFromIndex(textIdB) + count, str);

    return str;
}

//! FE8U = 0x080B6720
int sub_80B6720(int pid) {
    struct EndingTitleEnt* ent;

    for (ent = gUnknown_08A3D1B0; ent->pid != 0; ent++) {
        if (ent->pid == pid) {
            return ent->unk_04;
        }
    }

    return 0;
}

//! FE8U = 0x080B6744
int sub_80B6744(int pid) {
    struct EndingWithdrawalEnt* ent;

    for (ent = gUnknown_08A3D2C0; ent->pid != 0; ent++) {
        if (ent->pid == pid) {
            return ent->retreatDesignation;
        }
    }

    return 0;
}

//! FE8U = 0x080B6768
char* sub_80B6768(int pid) {
    struct UnitUsageStats* bwl;
    int defeatDetails;

    char* str = gUnknown_08A3CD64;

    int type = sub_80B6744(pid);

    if (type == 4) {
        CheckGlobalEventId(0x7d);
        pid = 0x100;
    }

    bwl = GetPidStats(pid);
    defeatDetails = bwl->deathLoc | (bwl->deathSkirm << 0xf);

    switch (type) {
        case 0: // "Died at <xyz>."
            sub_80B6674(0x7D1, defeatDetails, 0x22, str);
            break;

        case 2: // Wounded at <xyz>, but remained until the end."
            sub_80B6674(0x7D3, defeatDetails, 0x7D4, str);
            break;

        case 5:
            return 0;
    }

    return gUnknown_08A3CD64;
}

//! FE8U = 0x080B67E8
void sub_80B67E8(void) {
    Decompress(gUnknown_08A3F750, (void *)0x06004C00);
    Decompress(Img_CommGameBgScreen, (void *)0x06008000);
    return;
}

//! FE8U = 0x080B6810
void sub_80B6810(void) {
    int offset;
    int i;
    u16* tm;

    CopyToPaletteBuffer(gUnknown_08A3F710, 0x180, 0x40);
    CopyToPaletteBuffer(gUnknown_08B1754C, 0x1c0, 0x40);

    tm = gBG3TilemapBuffer;
    offset = (((0x8000 - (u32)GetBackgroundTileDataOffset(3)) * 0x8000) >> 0x14) + 0xe000;

    for (i = 0; i < 0x280; i++) {
        *tm++ = i + offset;
    }

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_08A3FFEC, 0x0000C260);

    CallARM_FillTileRect(gBG2TilemapBuffer + 0x240, gUnknown_08A40068, 0x0000C260);

    BG_EnableSyncByMask(0xc);

    return;
}

//! FE8U = 0x080B689C
void sub_80B689C(int a, int b) {
    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80AC844(gUnknown_08A3D348[2], 0, 1, 2, a, b + 2, 0x1e, 0x10);
    sub_80AC844(gUnknown_08A3D348[1], 0, 1, 1, a, b + 2, 0x1e, 0x12);
    sub_80AC844(gUnknown_08A3D348[0], 0, 0, 0, a, b, 0x1e, 0x14);

    BG_EnableSyncByMask(7);

    return;
}

//! FE8U = 0x080B6920
void sub_80B6920(void) {
    int i;

    Font_InitForUIDefault();

    for (i = 0; i < 2; i++) {
        Text_Init(gUnknown_08A3D358 + 5 + i, 15);
        Text_Init(gUnknown_08A3D358 + 7 + i, 10);
    }

    for (i = 0; i < 5; i++) {
        Text_Init(gUnknown_08A3D358 + i, 0x1a);
    }

    return;
}

//! FE8U = 0x080B696C
void sub_80B696C(struct EndingDetailsProc* proc) {

    SetupBackgrounds(0);
    ResetFaces();
    sub_80B67E8();
    SetDefaultColorEffects();

    proc->unk_2e = 0;

    CpuFill16(0, &proc->unk_40, 0x20);

    switch (gPlaySt.chapterModeIndex) {
        case 1:
        case 2:
            proc->unk_30 = gUnknown_08A3D1A8[0];
            break;

        case 3:
            proc->unk_30 = gUnknown_08A3D1A8[1];
            break;
    }

    proc->unk_34 = proc->unk_30;

    return;
}

//! FE8U = 0x080B69D4
void sub_80B69D4(void) {
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    ResetDialogueScreen();

    sub_80B744C();
    sub_80B6810();

    BG_EnableSyncByMask(7);

    return;
}

//! FE8U = 0x080B6A10
struct Unit* sub_80B6A10(int pid) {
    int i;

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->pCharacterData->number != pid) {
            continue;
        }

        if (unit->state & US_BIT16) {
            return NULL;
        }

        return unit;
    }

    return NULL;
}

//! FE8U = 0x080B6A4C
int sub_80B6A4C(struct Unit* unit) {
    int i;

    if (unit == NULL) {
        return 0;
    }

    for (i = 0; i < 7; i++) {
        if (GetUnitSupportLevel(unit, i) == 3) {
            return GetUnitSupporterCharacter(unit, i);
        }
    }

    return 0;
}

//! FE8U = 0x080B6A80
s8 sub_80B6A80(struct EndingPairingEnt* pairingEnt, struct Unit* unit) {
    int pidA = unit->pCharacterData->number;
    int pidB = sub_80B6A4C(unit);

    if (pidB == 0) {
        return 0;
    }

    if (GetUnitFromCharId(pidA)->state & US_DEAD) {
        return 0;
    }

    if (GetUnitFromCharId(pidB)->state & US_DEAD) {
        return 0;
    }

    for (; pairingEnt->pidA != 0; pairingEnt++) {
        if (pairingEnt->pidA == pidA && pairingEnt->pidB == pidB) {
            return 1;
        }

        if (pairingEnt->pidA == pidB && pairingEnt->pidB == pidA) {
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x080B6AE0
void sub_80B6AE0(struct EndingDetailsProc* proc) {
    proc->unitB = NULL;
    proc->unitA = NULL;

    for (;; proc->unk_30++) {
        if (proc->unk_30->type == 0) {
            Proc_Goto(proc, 100);
            return;
        }

        if ((((u32*)proc + 0x10)[proc->unk_30->pidA >> 5] >> (proc->unk_30->pidA & 0x1f)) & 1) {
            continue;
        }

        if (proc->unk_30->pidB != 0) {
            if ((((u32*)proc + 0x10)[proc->unk_30->pidB >> 5] >> (proc->unk_30->pidB & 0x1f)) & 1) {
                continue;
            }
        }

        proc->unitA = sub_80B6A10(proc->unk_30->pidA);

        if (proc->unitA == 0) {
            continue;
        }

        switch (proc->unk_30->type) {
            case 1:
                if (sub_80B6A80(proc->unk_34, proc->unitA)) {
                    continue;
                }

                break;

            case 2:
                proc->unitB = sub_80B6A10(proc->unk_30->pidB);

                if (proc->unitB == NULL) {
                    continue;
                }

                if (sub_80B6A4C(proc->unitA) != proc->unk_30->pidB) {
                    continue;
                }

                if (proc->unitA->state & US_DEAD) {
                    continue;
                }

                if (proc->unitB->state & US_DEAD) {
                    continue;
                }

                break;
        }

        ((u32*)proc + 0x10)[(proc->unk_30->pidA >> 5)] |= 1 << (proc->unk_30->pidA & 0x1f);

        if (proc->unk_30->pidB == 0) {
            return;
        }

        ((u32*)proc + 0x10)[proc->unk_30->pidB >> 5] |= 1 << (proc->unk_30->pidB & 0x1f);

        return;
    }
}

//! FE8U = 0x080B6BD8
void sub_80B6BD8(struct EndingDetailsProc* proc) {

    switch (proc->unk_30->type) {
        case 1:
            sub_80B6F14(proc->unk_30, proc->unitA, proc);
            break;

        case 2:
            sub_80B72A4(proc->unk_30, proc->unitA, proc->unitB, proc);
            break;
    }

    return;
}

//! FE8U = 0x080B6C00
void sub_80B6C00(struct EndingDetailsProc* proc) {
    sub_80B742C(proc->unk_30, proc->unitA, proc->unitB, proc);
    return;
}

//! FE8U = 0x080B6C14
void sub_80B6C14(void) {
    SetupBackgrounds(0);
    ResetDialogueScreen();
    sub_80B744C();

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(0, 0, 0, 0, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

//! FE8U = 0x080B6C74
void sub_80B6C74(struct EndingDetailsProc* proc) {
    proc->unk_30++;

    if (proc->unk_30->type == 0) {
        Proc_Goto(proc, 100);
    }

    return;
}

extern struct ProcCmd gUnknown_08A3D35C[];

//! FE8U = 0x080B6C94
void sub_80B6C94(ProcPtr parent) {
    Proc_StartBlocking(gUnknown_08A3D35C, parent);
    return;
}

//! FE8U = 0x080B6CA8
void sub_80B6CA8(struct EndingDetails8A3D420Proc* proc) {
    int i;

    for (i = 0; i < 2; i++) {
        struct UnitUsageStats* bwl;

        struct Unit* unit = proc->units[i];

        if (unit == NULL) {
            continue;
        }

        bwl = GetPidStats(unit->pCharacterData->number);

        proc->battleAmounts[i] = bwl->battleAmt < 999 ? bwl->battleAmt : 999;
        proc->winAmounts[i] = bwl->winAmt < 999 ? bwl->winAmt : 999;
        proc->lossAmounts[i] = bwl->lossAmt;
    }

    return;
}

//! FE8U = 0x080B6D24
void sub_80B6D24(struct EndingDetails8A3D420Proc* proc) {
    const char* str;

    sub_80B6920();

    sub_80B6CA8(proc);

    BG_Fill(gUnknown_08A3D348[0], 0);
    BG_Fill(gUnknown_08A3D348[1], 0);
    BG_Fill(gUnknown_08A3D348[2], 0);

    Decompress(gUnknown_08A40204, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_08A3D348[2], gGenericBuffer, 0x0000C260);

    Decompress(gUnknown_08A400E4, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_08A3D348[1], gGenericBuffer, 0x0000C260);

    str = GetStringFromIndex(sub_80B6720(proc->unk_38->pidA));

    DrawTextInline(gUnknown_08A3D358 + 5, gUnknown_08A3D348[0] + 0x61, 0, GetStringTextCenteredPos(0x78, str), 0, str);

    DrawTextInline(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x31, 3, 0, 0, GetStringFromIndex(0x51F));
    DrawTextInline(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x31, 3, 0x20, 0, GetStringFromIndex(0x520));
    DrawTextInline(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x31, 3, 0x40, 0, GetStringFromIndex(0x521));

    sub_8004B88(gUnknown_08A3D348[0] + 0x31 + sub_80AEBEC(proc->battleAmounts[0]), 2, proc->battleAmounts[0]);
    sub_8004B88(gUnknown_08A3D348[0] + 0x35 + sub_80AEBEC(proc->winAmounts[0]), 2, proc->winAmounts[0]);
    sub_8004B88(gUnknown_08A3D348[0] + 0x39 + sub_80AEBEC(proc->lossAmounts[0]), 2, proc->lossAmounts[0]);

    StartFace2(0, gCharacterData[proc->unk_38->pidA - 1].portraitId, 0x1a0, 0x38, 0x502);

    if (proc->units[0]->state & US_DEAD) {
        ArchivePalette(0x16);
        WriteFadedPaletteFromArchive(0xc0, 0xc0, 0xc0, 0x400000);
    }

    proc->unk_34 = 0;
    SetDefaultColorEffects();

    return;
}

//! FE8U = 0x080B6ED0
void sub_80B6ED0(struct EndingDetails8A3D420Proc* proc) {
    int a = 30;

    int b = gUnknown_08A3D40C[proc->unk_34];
    proc->unk_34++;

    a -= b;

    sub_8006618(0, (a * 8 + 176) & 0x1FF, 0x38);
    sub_80B689C(a, 0);

    if (b == 30) {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_08A3D420[];

//! FE8U = 0x080B6F14
void sub_80B6F14(struct EndingPairingEnt* pairingEnt, struct Unit* unit, struct EndingDetailsProc* parent) {
    struct EndingDetails8A3D420Proc* proc = Proc_StartBlocking(gUnknown_08A3D420, parent);

    proc->units[0] = unit;
    proc->units[1] = NULL;

    proc->unk_38 = pairingEnt;

    return;
}

//! FE8U = 0x080B6F34
void sub_80B6F34(struct EndingDetails8A3D420Proc* proc) {
    const char* str;

    sub_80B6920();

    sub_80B6CA8(proc);

    BG_Fill(gUnknown_08A3D348[0], 0);
    BG_Fill(gUnknown_08A3D348[1], 0);
    BG_Fill(gUnknown_08A3D348[2], 0);

    Decompress(gUnknown_08A40470, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_08A3D348[2], gGenericBuffer, 0x0000C260);

    Decompress(gUnknown_08A4034C, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_08A3D348[1], gGenericBuffer, 0x0000C260);

    str = GetStringFromIndex(sub_80B6720(proc->unk_38->pidA));

    DrawTextInline(gUnknown_08A3D358 + 5, gUnknown_08A3D348[0] + 0x61, 0, GetStringTextCenteredPos(0x78, str), 0, str);

    DrawTextInline(gUnknown_08A3D358 + 7, gUnknown_08A3D348[0] + 0x31, 3, 0, 0, GetStringFromIndex(0x51F));
    DrawTextInline(gUnknown_08A3D358 + 7, gUnknown_08A3D348[0] + 0x31, 3, 0x20, 0, GetStringFromIndex(0x520));
    DrawTextInline(gUnknown_08A3D358 + 7, gUnknown_08A3D348[0] + 0x31, 3, 0x40, 0, GetStringFromIndex(0x521));

    sub_8004B88(gUnknown_08A3D348[0] + 0x31 + sub_80AEBEC(proc->battleAmounts[0]), 2, proc->battleAmounts[0]);
    sub_8004B88(gUnknown_08A3D348[0] + 0x35 + sub_80AEBEC(proc->winAmounts[0]), 2, proc->winAmounts[0]);
    sub_8004B88(gUnknown_08A3D348[0] + 0x39 + sub_80AEBEC(proc->lossAmounts[0]), 2, proc->lossAmounts[0]);

    str = GetStringFromIndex(sub_80B6720(proc->unk_38->pidB));
    DrawTextInline(gUnknown_08A3D358 + 6, gUnknown_08A3D348[0] + 0x22E, 0, GetStringTextCenteredPos(0x78, str), 0, str);

    DrawTextInline(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x221, 3, 0, 0, GetStringFromIndex(0x51F));
    DrawTextInline(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x221, 3, 0x20, 0, GetStringFromIndex(0x520));
    DrawTextInline(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x221, 3, 0x40, 0, GetStringFromIndex(0x521));

    sub_8004B88(gUnknown_08A3D348[0] + 0x221 + sub_80AEBEC(proc->battleAmounts[1]), 2, proc->battleAmounts[1]);
    sub_8004B88(gUnknown_08A3D348[0] + 0x225 + sub_80AEBEC(proc->winAmounts[1]), 2, proc->winAmounts[1]);
    sub_8004B88(gUnknown_08A3D348[0] + 0x229 + sub_80AEBEC(proc->lossAmounts[1]), 2, proc->lossAmounts[1]);

    proc->unk_34 = 0;

    SetDefaultColorEffects();

    StartFace2(0, gCharacterData[proc->unk_38->pidA - 1].portraitId, 0x130, 0x30, 0x503);
    StartFace2(1, gCharacterData[proc->unk_38->pidB - 1].portraitId, 0x1a0, 0x30, 0x502);

    return;
}

//! FE8U = 0x080B71DC
void sub_80B71DC(struct EndingDetails8A3D420Proc* proc) {
    int a = 30;

    int b = gUnknown_08A3D40C[proc->unk_34];
    proc->unk_34++;

    a -= b;

    sub_8006618(0, (a * 8 + 0x40) & 0x1FF, 0x30);
    sub_8006618(1, (a * 8 + 0xb0) & 0x1FF, 0x30);

    sub_80B689C(a, 0);

    if (b == 30) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B723C
void sub_80B723C(struct EndingDetails8A3D420Proc* proc) {
    proc->unk_34 = 0;

    SetSpecialColorEffectsParameters(1, 0x10, 0, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);

    return;
}

//! FE8U = 0x080B7274
void sub_80B7274(struct EndingDetails8A3D420Proc* proc) {
    int var = proc->unk_34 >> 2;

    proc->unk_34++;

    SetSpecialColorEffectsParameters(1, 0x10 - var, var, 0);

    if (var == 8) {
        Proc_Break(proc);
    }
    return;
}

extern struct ProcCmd gUnknown_08A3D440[];

//! FE8U = 0x080B72A4
void sub_80B72A4(struct EndingPairingEnt* pairingEnt, struct Unit* unitA, struct Unit* unitB, struct EndingDetailsProc* parent) {
    struct EndingDetails8A3D420Proc* proc = Proc_StartBlocking(gUnknown_08A3D440, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    proc->unk_38 = pairingEnt;

    return;
}

//! FE8U = 0x080B72C4
void sub_80B72C4(struct EndingDetails8A3D478Proc* proc) {
    int i;

    proc->textHandle = gUnknown_08A3D358;

    proc->unk_40 = 4;
    proc->unk_3c = 4;

    Text_SetXCursor(proc->textHandle, 0);
    Text_SetColorId(proc->textHandle, 0);

    for (i = 0; i < 5; i++) {
        int offset = 0xc0 + i * 0x40;

        Text_Clear(gUnknown_08A3D358 + i);
        Text_Draw(gUnknown_08A3D358 + i, gUnknown_02022CAC + offset);
    }

    BG_EnableSyncByMask(1);

    if (proc->unitA->state & US_DEAD) {
        proc->unk_44 = sub_80B6768(proc->unitA->pCharacterData->number);

        if (proc->unk_44 != 0) {
            return;
        }
    }

    proc->unk_44 = GetStringFromIndex(proc->unk_2c->textId);

    return;
}

//! FE8U = 0x080B734C
void sub_80B734C(struct EndingDetails8A3D478Proc* proc) {
    if ((gKeyStatusPtr->newKeys & START_BUTTON) && (CheckGameEndFlag() != 0)) {
        Proc_Break(proc);
        Proc_Goto(proc->proc_parent, 100);
        return;
    }

    if (proc->unk_3c != 0) {
        proc->unk_3c--;
        return;
    }

    SetFont(NULL);

    switch (*proc->unk_44) {
        case 0x00: // [X]
            Proc_Break(proc);
            break;

        case 0x01: // [NL]
            proc->unk_44++;
            proc->textHandle++;
            proc->unk_3c += 16;

            Text_SetXCursor(proc->textHandle, 0);
            Text_SetColorId(proc->textHandle, 0);

            break;

        case 0x04: // [....]
            proc->unk_3c = 8;
            proc->unk_44++;

            break;

        case 0x05: // [.....]
            proc->unk_3c = 16;
            proc->unk_44++;

            break;

        case 0x06: // [......]
            proc->unk_3c = 32;
            proc->unk_44++;

            break;

        case 0x07: // [.......]
            proc->unk_3c = 64;
            proc->unk_44++;

            break;

        case 0x02: // [NL2]
        case 0x03: // [A]
        default:
            proc->unk_44 = Text_AppendChar(proc->textHandle, proc->unk_44);
    }

    proc->unk_3c = proc->unk_40;

    return;
}

extern struct ProcCmd gUnknown_08A3D478[];

//! FE8U = 0x080B742C
void sub_80B742C(struct EndingPairingEnt* pairingEnt, struct Unit* unitA, struct Unit* unitB, struct EndingDetailsProc* parent) {
    struct EndingDetails8A3D478Proc* proc = Proc_StartBlocking(gUnknown_08A3D478, parent);
    proc->unk_2c = pairingEnt;
    proc->unitA = unitA;
    proc->unitB = unitB;

    return;
}

//! FE8U = 0x080B744C
void sub_80B744C(void) {
    Proc_EndEach(gUnknown_08A3D478);
    return;
}

//! FE8U = 0x080B745C
void sub_80B745C(void) {
    CopyToPaletteBuffer(gUnknown_08A405B4, 0x1c0, 0x20);

    Decompress(gUnknown_08A405D4, (void *)0x06001000);

    Decompress(gUnknown_08A409D0, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x0000E080);

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x080B74B0
void sub_80B74B0(struct Fin8A3D498Proc* proc) {
    proc->unk_4c = 0;
    proc->unk_58 = 0;

    SetupBackgrounds(0);

    sub_80B745C();

    Sound_PlaySong8002574(0x56, 7, 0);
    SetDefaultColorEffects();

    return;
}

//! FE8U = 0x080B74D8
void sub_80B74D8(struct Fin8A3D498Proc* proc) {
    proc->unk_58++;

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B7500
void sub_80B7500(struct Fin8A3D498Proc* proc) {
    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    proc->unk_4c = 0;

    sub_80B745C();

    return;
}

//! FE8U = 0x080B7540
void sub_80B7540(struct Fin8A3D498Proc* proc) {
    int b;

    s16 a = proc->unk_4c;
    proc->unk_4c++;

    b = a >> 2;
    SetSpecialColorEffectsParameters(1, b, 0x10, 0);

    if (b == 16) {
        Proc_Break(proc);
        proc->unk_4c = 0;
    }

    return;
}

//! FE8U = 0x080B7574
void sub_80B7574(void) {
    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    return;
}

extern struct ProcCmd gUnknown_08A3D498[];

//! FE8U = 0x080B7598
void sub_80B7598(ProcPtr parent) {
    Proc_StartBlocking(gUnknown_08A3D498, parent);
    return;
}

//! FE8U = 0x080B75AC
void sub_80B75AC(struct EndingTurnRecordProc* proc) {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    CopyToPaletteBuffer(gUnknown_08A09A5C, 0xa0, 0x20);

    Decompress(Img_ChapterIntroFog, (void *)0x06004000);
    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_085A647C, 0x5200);

    BG_EnableSyncByMask(4);

    proc->unk_4c = 0;

    return;
}

//! FE8U = 0x080B7614
void sub_80B7614(struct EndingTurnRecordProc* proc) {
    int x;
    int y;

    proc->unk_4c++;

    y = proc->unk_4c;
    x = y * 3;

    BG_SetPosition(2, x / 8, y / 4);

    return;
}

//! FE8U = 0x080B7648
void sub_80B7648(struct EndingTurnRecordProc* proc) {
    proc->unk_30 = 0;
    proc->unk_34 = 32;
    proc->unk_39 = 0;
    proc->unk_2c = 0;
    proc->unk_38 = GetNextChapterStatsSlot();

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    SetPrimaryHBlankHandler(NULL);

    SetupBackgrounds(0);

    // ??
    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    SetDefaultColorEffects();
    Font_InitForUIDefault();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    CopyToPaletteBuffer(gUnknown_08A40AD4, 0x1c0, 0x40);
    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A40B14, 0xe000);

    BG_EnableSyncByMask(8);

    return;
}

//! FE8U = 0x080B770C
void sub_80B770C(void) {
    int i;

    BG_SetPosition(1, 0, -136);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 24;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 136;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    for (i = 0; i < 9; i++) {
        Text_Init(gUnknown_08A3D674 + i, 5);
        Text_Init(gUnknown_08A3D674 + 9 + i, 13);
    }

    Text_Init(gUnknown_08A3D674 + 18, 4);
    Text_Init(gUnknown_08A3D674 + 19, 2);

    Text_AppendString(gUnknown_08A3D674 + 18, GetStringFromIndex(0x15D));

    Text_SetColorId(gUnknown_08A3D674 + 19, 3);
    Text_AppendString(gUnknown_08A3D674 + 19, GetStringFromIndex(0x157));

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/hajQV */

//! FE8U = 0x080B7800
int sub_80B7800(struct ChapterStats* param_1, int param_2) {
    int bVar1;
    int uVar5;
    int r6;
    int r7;
    int uVar7;
    int iVar8;
    int iVar9;
    int uVar10;
    const char* str;
    int a;

    s8 local_24 = 0;
    int iVar4 = param_2 % 9;

    param_2 = (param_2 * 2) & 0x1f;
    r6 = param_2 * 0x20;

    TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, param_2), 0x1f, 1, 0);
    BG_EnableSyncByMask(2);

    Text_Clear(gUnknown_08A3D674 + iVar4);
    Text_Clear(gUnknown_08A3D674 + 9 + iVar4);

    if ((u32)param_1 == -1) {
        int t;
        uVar5 = GetGameTotalTurnCount();

        DrawTextInline(gUnknown_08A3D674 + 9 + iVar4, gBG1TilemapBuffer + (t = r6 + 0xc), 3, 0, 0, GetStringFromIndex(0x15F));
        sub_8004B88(gBG1TilemapBuffer + (t = r6 + 0x17), 2, uVar5);
        Text_Draw(gUnknown_08A3D674 + 18, gBG1TilemapBuffer + (t = r6 + 0x18));

        return 0;
    }

    if (param_1 == 0) {
        return local_24;
    }

    uVar7 = param_1->chapter_index;
    bVar1 = GetROMChapterStruct(uVar7)->prepScreenNumber >> 1;
    switch (uVar7) {
        case 0:
            // _080B7988
            str = GetStringFromIndex(0x15a); // TODO: msgid "Prologue"
            DrawTextInline(gUnknown_08A3D674 + iVar4, gBG1TilemapBuffer + TILEMAP_INDEX(3, param_2), 3, 0, 0, str);
            break;

        case 21:
        case 22:
        case 34:
        case 35:
            // _080B798E
            str = GetStringFromIndex(0x159); // TODO: msgid "Final[.]"
            DrawTextInline(gUnknown_08A3D674 + iVar4, gBG1TilemapBuffer + TILEMAP_INDEX(3, param_2), 3, 0, 0, str);
            break;

        case 5:
            // _080B79CC
            Text_Draw(gUnknown_08A3D674 + 0x13, gBG1TilemapBuffer + TILEMAP_INDEX(3, param_2));
            sub_8004B88(gBG1TilemapBuffer + TILEMAP_INDEX(sub_80AEBEC(bVar1) + 4, param_2), 2, bVar1);
            DrawTextInline(gUnknown_08A3D674 + iVar4, gBG1TilemapBuffer + TILEMAP_INDEX(sub_80AEBEC(bVar1) + 5, param_2), 2, 0, 0, GetStringFromIndex(0x158));
            break;

        default:
            // _080B7A40
            DrawTextInline(gUnknown_08A3D674 + iVar4, gBG1TilemapBuffer + TILEMAP_INDEX(3, param_2), 3, 0, 0, GetStringFromIndex(0x157));
            sub_8004B88(gBG1TilemapBuffer + TILEMAP_INDEX(sub_80AEBEC(bVar1) + 4, param_2), 2, bVar1);
            break;

    }

    switch (uVar7) {
        default:
            uVar10 = (param_1->chapter_turn) + ((++param_1)->chapter_turn);
            local_24 = 1;
            break;

        case 21:
        case 22:
        case 34:
        case 35:
            uVar10 = param_1->chapter_turn;
            break;
    }

    DrawTextInline(gUnknown_08A3D674 + 9 + iVar4, gBG1TilemapBuffer + TILEMAP_INDEX(8, param_2), 0, 0, 0, GetStringFromIndex(GetROMChapterStruct(uVar7)->chapTitleTextId));
    sub_8004B88(gBG1TilemapBuffer + TILEMAP_INDEX(0x17, param_2), 2, uVar10);
    Text_Draw(gUnknown_08A3D674 + 18, gBG1TilemapBuffer + TILEMAP_INDEX(0x18, param_2));

    return local_24;
}


#else // if !NONMATCHING

__attribute__((naked))
int sub_80B7800(struct ChapterStats* param_1, int param_2) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x14\n\
        str r0, [sp, #8]\n\
        adds r4, r1, #0\n\
        movs r0, #0\n\
        str r0, [sp, #0x10]\n\
        adds r0, r4, #0\n\
        movs r1, #9\n\
        bl __modsi3\n\
        str r0, [sp, #0xc]\n\
        lsls r7, r4, #1\n\
        movs r0, #0x1f\n\
        ands r7, r0\n\
        lsls r6, r7, #5\n\
        lsls r0, r7, #6\n\
        ldr r1, _080B78B8  @ gBG1TilemapBuffer\n\
        mov r9, r1\n\
        add r0, r9\n\
        movs r1, #0x1f\n\
        movs r2, #1\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        movs r0, #2\n\
        bl BG_EnableSyncByMask\n\
        ldr r3, _080B78BC  @ gUnknown_08A3D674\n\
        mov r8, r3\n\
        ldr r0, [sp, #0xc]\n\
        lsls r4, r0, #3\n\
        ldr r0, [r3]\n\
        adds r0, r0, r4\n\
        bl Text_Clear\n\
        adds r5, r4, #0\n\
        adds r5, #0x48\n\
        mov r1, r8\n\
        ldr r0, [r1]\n\
        adds r0, r0, r5\n\
        bl Text_Clear\n\
        movs r0, #1\n\
        negs r0, r0\n\
        ldr r3, [sp, #8]\n\
        cmp r3, r0\n\
        bne _080B78C4\n\
        bl GetGameTotalTurnCount\n\
        adds r4, r0, #0\n\
        ldr r0, _080B78C0  @ 0x0000015F\n\
        bl GetStringFromIndex\n\
        adds r2, r0, #0\n\
        mov r1, r8\n\
        ldr r0, [r1]\n\
        adds r0, r0, r5\n\
        adds r1, r6, #0\n\
        adds r1, #0xc\n\
        lsls r1, r1, #1\n\
        add r1, r9\n\
        ldr r3, [sp, #0x10]\n\
        str r3, [sp]\n\
        str r2, [sp, #4]\n\
        movs r2, #3\n\
        movs r3, #0\n\
        bl DrawTextInline\n\
        adds r0, r6, #0\n\
        adds r0, #0x17\n\
        lsls r0, r0, #1\n\
        add r0, r9\n\
        movs r1, #2\n\
        adds r2, r4, #0\n\
        bl sub_8004B88\n\
        mov r1, r8\n\
        ldr r0, [r1]\n\
        adds r0, #0x90\n\
        adds r1, r6, #0\n\
        adds r1, #0x18\n\
        lsls r1, r1, #1\n\
        add r1, r9\n\
        bl Text_Draw\n\
        movs r0, #0\n\
        b _080B7B18\n\
        .align 2, 0\n\
    _080B78B8: .4byte gBG1TilemapBuffer\n\
    _080B78BC: .4byte gUnknown_08A3D674\n\
    _080B78C0: .4byte 0x0000015F\n\
    _080B78C4:\n\
        ldr r3, [sp, #8]\n\
        cmp r3, #0\n\
        bne _080B78CC\n\
        b _080B7B16\n\
    _080B78CC:\n\
        ldr r0, [r3]\n\
        lsls r0, r0, #0x19\n\
        lsrs r0, r0, #0x19\n\
        mov sl, r0\n\
        bl GetROMChapterStruct\n\
        adds r0, #0x80\n\
        ldrb r0, [r0]\n\
        lsrs r0, r0, #1\n\
        mov r9, r0\n\
        mov r0, sl\n\
        cmp r0, #0x23\n\
        bls _080B78E8\n\
        b _080B7A40\n\
    _080B78E8:\n\
        lsls r0, r0, #2\n\
        ldr r1, _080B78F4  @ _080B78F8\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov pc, r0\n\
        .align 2, 0\n\
    _080B78F4: .4byte _080B78F8\n\
    _080B78F8: @ jump table\n\
        .4byte _080B7988 @ case 0\n\
        .4byte _080B7A40 @ case 1\n\
        .4byte _080B7A40 @ case 2\n\
        .4byte _080B7A40 @ case 3\n\
        .4byte _080B7A40 @ case 4\n\
        .4byte _080B79CC @ case 5\n\
        .4byte _080B7A40 @ case 6\n\
        .4byte _080B7A40 @ case 7\n\
        .4byte _080B7A40 @ case 8\n\
        .4byte _080B7A40 @ case 9\n\
        .4byte _080B7A40 @ case 10\n\
        .4byte _080B7A40 @ case 11\n\
        .4byte _080B7A40 @ case 12\n\
        .4byte _080B7A40 @ case 13\n\
        .4byte _080B7A40 @ case 14\n\
        .4byte _080B7A40 @ case 15\n\
        .4byte _080B7A40 @ case 16\n\
        .4byte _080B7A40 @ case 17\n\
        .4byte _080B7A40 @ case 18\n\
        .4byte _080B7A40 @ case 19\n\
        .4byte _080B7A40 @ case 20\n\
        .4byte _080B798E @ case 21\n\
        .4byte _080B798E @ case 22\n\
        .4byte _080B7A40 @ case 23\n\
        .4byte _080B7A40 @ case 24\n\
        .4byte _080B7A40 @ case 25\n\
        .4byte _080B7A40 @ case 26\n\
        .4byte _080B7A40 @ case 27\n\
        .4byte _080B7A40 @ case 28\n\
        .4byte _080B7A40 @ case 29\n\
        .4byte _080B7A40 @ case 30\n\
        .4byte _080B7A40 @ case 31\n\
        .4byte _080B7A40 @ case 32\n\
        .4byte _080B7A40 @ case 33\n\
        .4byte _080B798E @ case 34\n\
        .4byte _080B798E @ case 35\n\
    _080B7988:\n\
        movs r0, #0xad\n\
        lsls r0, r0, #1\n\
        b _080B7990\n\
    _080B798E:\n\
        ldr r0, _080B79C0  @ 0x00000159\n\
    _080B7990:\n\
        bl GetStringFromIndex\n\
        adds r3, r0, #0\n\
        ldr r0, _080B79C4  @ gUnknown_08A3D674\n\
        ldr r1, [sp, #0xc]\n\
        lsls r5, r1, #3\n\
        ldr r0, [r0]\n\
        adds r0, r0, r5\n\
        lsls r4, r7, #5\n\
        adds r1, r4, #3\n\
        lsls r1, r1, #1\n\
        ldr r2, _080B79C8  @ gBG1TilemapBuffer\n\
        adds r1, r1, r2\n\
        movs r2, #0\n\
        str r2, [sp]\n\
        str r3, [sp, #4]\n\
        movs r2, #3\n\
        movs r3, #0\n\
        bl DrawTextInline\n\
        mov r8, r4\n\
        adds r6, r5, #0\n\
        b _080B7A84\n\
        .align 2, 0\n\
    _080B79C0: .4byte 0x00000159\n\
    _080B79C4: .4byte gUnknown_08A3D674\n\
    _080B79C8: .4byte gBG1TilemapBuffer\n\
    _080B79CC:\n\
        ldr r3, _080B7A38  @ gUnknown_08A3D674\n\
        mov r8, r3\n\
        ldr r0, [r3]\n\
        adds r0, #0x98\n\
        lsls r6, r7, #5\n\
        adds r1, r6, #3\n\
        lsls r1, r1, #1\n\
        ldr r5, _080B7A3C  @ gBG1TilemapBuffer\n\
        adds r1, r1, r5\n\
        bl Text_Draw\n\
        mov r0, r9\n\
        bl sub_80AEBEC\n\
        adds r0, #1\n\
        adds r0, #3\n\
        adds r0, r6, r0\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r5\n\
        movs r1, #2\n\
        mov r2, r9\n\
        bl sub_8004B88\n\
        mov r0, r9\n\
        bl sub_80AEBEC\n\
        adds r4, r0, #0\n\
        adds r4, #2\n\
        adds r4, #3\n\
        adds r4, r6, r4\n\
        lsls r4, r4, #1\n\
        adds r4, r4, r5\n\
        movs r0, #0xac\n\
        lsls r0, r0, #1\n\
        bl GetStringFromIndex\n\
        adds r2, r0, #0\n\
        ldr r0, [sp, #0xc]\n\
        lsls r5, r0, #3\n\
        mov r1, r8\n\
        ldr r0, [r1]\n\
        adds r0, r0, r5\n\
        movs r1, #0\n\
        str r1, [sp]\n\
        str r2, [sp, #4]\n\
        adds r1, r4, #0\n\
        movs r2, #2\n\
        movs r3, #0\n\
        bl DrawTextInline\n\
        mov r8, r6\n\
        adds r6, r5, #0\n\
        b _080B7A84\n\
        .align 2, 0\n\
    _080B7A38: .4byte gUnknown_08A3D674\n\
    _080B7A3C: .4byte gBG1TilemapBuffer\n\
    _080B7A40:\n\
        ldr r0, _080B7AAC  @ 0x00000157\n\
        bl GetStringFromIndex\n\
        adds r3, r0, #0\n\
        ldr r0, _080B7AB0  @ gUnknown_08A3D674\n\
        ldr r1, [sp, #0xc]\n\
        lsls r6, r1, #3\n\
        ldr r0, [r0]\n\
        adds r0, r0, r6\n\
        lsls r4, r7, #5\n\
        adds r1, r4, #3\n\
        lsls r1, r1, #1\n\
        ldr r5, _080B7AB4  @ gBG1TilemapBuffer\n\
        adds r1, r1, r5\n\
        movs r2, #0\n\
        str r2, [sp]\n\
        str r3, [sp, #4]\n\
        movs r2, #3\n\
        movs r3, #0\n\
        bl DrawTextInline\n\
        mov r0, r9\n\
        bl sub_80AEBEC\n\
        adds r0, #1\n\
        adds r0, #3\n\
        adds r0, r4, r0\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r5\n\
        movs r1, #2\n\
        mov r2, r9\n\
        bl sub_8004B88\n\
        mov r8, r4\n\
    _080B7A84:\n\
        mov r3, sl\n\
        cmp r3, #0x15\n\
        blt _080B7AB8\n\
        cmp r3, #0x16\n\
        ble _080B7A96\n\
        cmp r3, #0x23\n\
        bgt _080B7AB8\n\
        cmp r3, #0x22\n\
        blt _080B7AB8\n\
    _080B7A96:\n\
        ldr r1, [sp, #8]\n\
        ldm r1!, {r0}\n\
        lsls r0, r0, #0x10\n\
        lsrs r7, r0, #0x17\n\
        ldr r0, [r1]\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x17\n\
        adds r7, r7, r0\n\
        movs r3, #1\n\
        str r3, [sp, #0x10]\n\
        b _080B7AC0\n\
        .align 2, 0\n\
    _080B7AAC: .4byte 0x00000157\n\
    _080B7AB0: .4byte gUnknown_08A3D674\n\
    _080B7AB4: .4byte gBG1TilemapBuffer\n\
    _080B7AB8:\n\
        ldr r1, [sp, #8]\n\
        ldr r0, [r1]\n\
        lsls r0, r0, #0x10\n\
        lsrs r7, r0, #0x17\n\
    _080B7AC0:\n\
        mov r0, sl\n\
        bl GetROMChapterStruct\n\
        adds r0, #0x70\n\
        ldrh r0, [r0]\n\
        bl GetStringFromIndex\n\
        adds r3, r0, #0\n\
        ldr r5, _080B7B28  @ gUnknown_08A3D674\n\
        adds r1, r6, #0\n\
        adds r1, #0x48\n\
        ldr r0, [r5]\n\
        adds r0, r0, r1\n\
        mov r1, r8\n\
        adds r1, #5\n\
        adds r1, #3\n\
        lsls r1, r1, #1\n\
        ldr r4, _080B7B2C  @ gBG1TilemapBuffer\n\
        adds r1, r1, r4\n\
        movs r2, #0\n\
        str r2, [sp]\n\
        str r3, [sp, #4]\n\
        movs r3, #0\n\
        bl DrawTextInline\n\
        mov r0, r8\n\
        adds r0, #0x14\n\
        adds r0, #3\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r4\n\
        movs r1, #2\n\
        adds r2, r7, #0\n\
        bl sub_8004B88\n\
        ldr r0, [r5]\n\
        adds r0, #0x90\n\
        mov r1, r8\n\
        adds r1, #0x15\n\
        adds r1, #3\n\
        lsls r1, r1, #1\n\
        adds r1, r1, r4\n\
        bl Text_Draw\n\
    _080B7B16:\n\
        ldr r0, [sp, #0x10]\n\
    _080B7B18:\n\
        add sp, #0x14\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _080B7B28: .4byte gUnknown_08A3D674\n\
    _080B7B2C: .4byte gBG1TilemapBuffer\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

//! FE8U = 0x080B7B30
void sub_80B7B30(struct EndingTurnRecordProc* proc) {
    int pos = proc->unk_30 >> 6;

    BG_SetPosition(1, 0, pos - 136);

    if ((pos & 0xf) == 0) {
        if (proc->unk_39 == (pos / 16)) {
            if (proc->unk_2c >= proc->unk_38) {
                int unk = proc->unk_2c - proc->unk_38;
                if (unk == 1) {
                    sub_80B7800((void *)-1, proc->unk_39);
                } else if (unk >= 3) {
                    Proc_Break(proc);
                } else {
                    sub_80B7800(NULL, proc->unk_39);
                }
            } else {
                proc->unk_2c += sub_80B7800(GetChapterStats(proc->unk_2c), proc->unk_39);
            }

            proc->unk_2c++;
            proc->unk_39++;
        }
    }

    if (gKeyStatusPtr->heldKeys & A_BUTTON) {
        proc->unk_30 += proc->unk_34;
    }

    proc->unk_30 += proc->unk_34;

    return;
}

void sub_80B7BD8(struct UnkProc* proc) {
    int i;

    PutSpriteExt(2, 0x18, 0x14, gUnknown_08A3D540, 0x9480);
    PutSpriteExt(2, 0x10, 0x80, gUnknown_08A3D5B4, 0x6480);

    if (gPlaySt.chapterStateBits & PLAY_FLAG_7) {
        PutSpriteExt(2, 0x10, 0x38, gUnknown_08A3D560, 0x8480);
        PutSpriteExt(2, 0x80, 0x38, gUnknown_08A3D56E, 0x8480);
        PutSpriteExt(2, 0x10, 0x58, gUnknown_08A3D58A, 0x8480);
        PutSpriteExt(2, 0x80, 0x58, gUnknown_08A3D5A6, 0x7480);

        for (i = 0; i < 3; i++) {
            if (proc->unk_4c[i] > 0x10) {
                WriteOAMRotScaleData(
                    i,
                    Div(+COS(0) * 16, proc->unk_4c[i]),
                    Div(-SIN(0) * 16, 0x100),
                    Div(+SIN(0) * 16, proc->unk_4c[i]),
                    Div(+COS(0) * 16, 0x100)
                );

                PutSpriteExt(
                    2,
                    (i & 1) * 0x70 + 0x50 + i * 0x200,
                    (i >> 1) * 0x20 + 0x130,
                    gUnknown_08A3D624[proc->unk_40[i]],
                     ((i + 10) & 0xf) * 0x1000 + 0x480
                );
            }
        }

        if (proc->unk_4c[i] > 0x10) {
            WriteOAMRotScaleData(
                i,
                Div(+COS(0) * 16, proc->unk_4c[i]),
                Div(-SIN(0) * 16, 0x100),
                Div(+SIN(0) * 16, proc->unk_4c[i]),
                Div(+COS(0) * 16, 0x100)
            );
            PutSpriteExt(
                2,
                (i & 1) * 0x70 + 0x50 + i * 0x200,
                (i >> 1) * 0x20 + 0x130,
                 gUnknown_08A3D63C[proc->unk_40[i]],
                 0xF480
            );
        }
    } else {
        PutSpriteExt(2, 0x10, 0x30, gUnknown_08A3D560, 0x8480);
        PutSpriteExt(2, 0x80, 0x30, gUnknown_08A3D56E, 0x8480);
        PutSpriteExt(2, 0x10, 0x48, gUnknown_08A3D598, 0x8480);
        PutSpriteExt(2, 0x80, 0x48, gUnknown_08A3D57C, 0x8480);
        PutSpriteExt(2, 0x10, 0x60, gUnknown_08A3D58A, 0x8480);
        PutSpriteExt(2, 0x80, 0x60, gUnknown_08A3D5A6, 0x7480);

        for (i = 0; i < 5; i++) {
            if (proc->unk_4c[i] > 0x10) {
                WriteOAMRotScaleData(
                    i,
                    Div(+COS(0) * 16, proc->unk_4c[i]),
                    Div(-SIN(0) * 16, 0x100),
                    Div(+SIN(0) * 16, proc->unk_4c[i]),
                    Div(+COS(0) * 16, 0x100)
                );

                PutSpriteExt(
                    2,
                    (i & 1) * 0x70 + 0x50 + i * 0x200,
                    (i >> 1) * 0x18 + 0x128,
                    gUnknown_08A3D624[proc->unk_40[i]],
                     ((i + 10) & 0xf) * 0x1000 + 0x480
                );
            }
        }

        if (proc->unk_4c[i] > 0x10) {
            WriteOAMRotScaleData(
                i,
                Div(+COS(0) * 16, proc->unk_4c[i]),
                Div(-SIN(0) * 16, 0x100),
                Div(+SIN(0) * 16, proc->unk_4c[i]),
                Div(+COS(0) * 16, 0x100)
            );
            PutSpriteExt(
                2,
                (i & 1) * 0x70 + 0x50 + (i * 0x200),
                (i >> 1) * 0x18 + 0x128,
                gUnknown_08A3D63C[proc->unk_40[i]],
                0xF480
            );
        }
    }
    return;
}

extern u8 gUnknown_02000000[];

//! FE8U = 0x080B8014
void sub_80B8014(void) {
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    sub_8001F48(0);
    sub_8001F64(0);
    SetSpecialColorEffectsParameters(1, 6, 0x10, 0);

    Decompress(gUnknown_08A21658, (void *)(GetBackgroundTileDataOffset(3) + 0x6000000));
    CopyToPaletteBuffer(gUnknown_08A25DCC, 0x100, 0x100);
    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A25ECC, 0x8000);

    Decompress(gUnknown_08A26380, (void *)(GetBackgroundTileDataOffset(2) + 0x06004C00));
    Decompress(gUnknown_08A268F8, gGenericBuffer);
    CopyToPaletteBuffer(gUnknown_08A268D8, 0xe0, 0x20);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x00007260);

    BG_EnableSyncByMask(0xc);
    sub_80AB760(gUnknown_02000000);
    Sound_PlaySong80024D4(0x46, 0);

    return;
}

//! FE8U = 0x080B8168
int sub_80B8168(void) {
    sub_80AB77C();
    // return; // BUG
}

extern struct ProcCmd gUnknown_08A3D678[];

//! FE8U = 0x080B8174
void sub_80B8174(ProcPtr parent) {
    Proc_StartBlocking(gUnknown_08A3D678, parent);
    return;
}

//! FE8U = 0x080B8188
void sub_80B8188(void) {
    return;
}

//! FE8U = 0x080B818C
void nullsub_7(void) {
    return;
}

//! FE8U = 0x080B8190
void sub_80B8190(u16* dst, u16* src, u8 coeff) {
    int i;

    for (i = 0; i < 0x10; i++) {
        *dst = ((((*src & 0x1f) * coeff) >> 5) & 0x1f) +
               ((((*src & 0x3e0) * coeff) >> 5) & 0x3e0) +
               ((((*src & 0x7c00) * coeff) >> 5) & 0x7c00);
        dst++;
        src++;
    }

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080B81FC
void nullsub_5(void) {
    return;
}

//! FE8U = 0x080B8200
void sub_80B8200(void) {
    Sound_FadeOutBGM(4);
    return;
}
