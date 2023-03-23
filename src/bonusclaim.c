#include "global.h"

#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"

struct BonusClaimProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ s16 unk_2c;
    /* 2E */ s8 unk_2e;
    /* 30 */ int unk_30;
    /* 34 */ ProcPtr unk_34;
};

struct Unknown8A215A4 {
    /* 00 */ s8 unk_00;
    /* 04 */ struct Unit* unk_04;
};

struct BonusClaimEnt {
    /* 00 */ u8 unk_00; // new or old
    /* 01 */ u8 unk_01; // kind; 0 and 1 = item, 2 = money, 3 = song, 4 = song
    /* 02 */ u8 unk_02; // content item id
    /* 03 */ char unk_03[0x11]; // fe8 only, string
};

struct BonusClaimItemEnt {
    /* 00 */ s8 unk_00;
    /* 01 */ s8 unk_01;
};

extern struct BonusClaimEnt gUnknown_02000968[];
extern struct BonusClaimEnt gUnknown_02000D68[];
extern struct BonusClaimItemEnt gUnknown_02001168[];
extern struct Unknown8A215A4 gUnknown_02001368[];
extern int gUnknown_02001568;
extern struct TextHandle gUnknown_02001668[];

struct BonusClaimEnt* CONST_DATA gUnknown_08A21590 = gUnknown_02000968; // gpBonusClaimData
struct BonusClaimEnt* CONST_DATA gUnknown_08A21594 = gUnknown_02000D68; // gpBonusClaimDataUpdated
struct BonusClaimItemEnt* CONST_DATA gUnknown_08A21598 = gUnknown_02001168; // gpBonusClaimItemList
int* CONST_DATA gUnknown_08A2159C = &gUnknown_02001568; // gpBonusClaimItemCount
struct TextHandle* CONST_DATA gUnknown_08A215A0 = gUnknown_02001668;
struct Unknown8A215A4* CONST_DATA gUnknown_08A215A4 = gUnknown_02001368;

extern u16 gUnknown_02023CC0[];
extern u16 gUnknown_02022CC4[];

extern u16 gUnknown_08B1754C[]; // pal
extern u16 gUnknown_08A295B4[]; // pal
extern u8 Img_CommGameBgScreen[]; // gfx
extern u8 gUnknown_08A295D4[]; // tsa

void Make6CMenuScroll(ProcPtr);
void sub_80976AC(int, int);
void InitPrepSideBarImg(int, int);
void sub_80AEBCC(int, int, int, ProcPtr);

void SetBonusContentClaimFlags(u32 num);
u32 GetBonusContentClaimFlags();
void SaveBonusContentData(void*);
int LoadBonusContentData(void*);

void sub_80895B4(int, int);
void sub_8089678(int);
void sub_8089624(int, u32);
int sub_8089768(struct PlaySt*);

extern u16* gUnknown_08A209E4[];
extern u16* gUnknown_08A209F0[];

//! FE8U = 0x080B0638
void sub_80B0638(void) {
    PutSpriteExt(4, 24, 8, *gUnknown_08A209F0, 0x8000);
    PutSpriteExt(4, 24, 16, *gUnknown_08A209E4, 0x9000);
    return;
}

//! FE8U = 0x080B0674
void sub_80B0674(void) {

    u32 flags = (-(gPlaySt.chapterStateBits & 0x40) >> 0x1f) & 4;

    if (gPlaySt.cfgController == 0) {

        if (gPlaySt.chapterModeIndex == 1) {
            flags |= 0x10;
        }

        if (gPlaySt.chapterModeIndex == 2) {
            flags |= 0x20;
        }

        if (gPlaySt.chapterModeIndex == 3) {
            flags |= 0x40;
        }
    } else {
        if (gPlaySt.chapterModeIndex == 3) {
            flags |= 0x40;
        } else {
            flags |= 0x20;
        }
    }

    sub_80895B4(flags | 1, 0x18);
    sub_80895B4(flags, 0x19);

    EnablePaletteSync();

    sub_8089678(0xac0);
    sub_8089624(0xb40, sub_8089768(&gPlaySt));

    return;
}

//! FE8U = 0x080B06FC
void sub_80B06FC(void) {

    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160) {
        vcount = 0;
    }

    if ((vcount & 1) == 0) {
        if (vcount < 100) {
            REG_BLDCNT = 200;
            // TODO: In "bb.c", REG_BLDY matches as vu8, but here it is vu16
            (*(vu16*)REG_ADDR_BLDY) = ((100 - vcount) * 16) / 100;
        }

        if (vcount == 0) {
            REG_BG0VOFS = gLCDControlBuffer.bgoffset[0].y;
        }

        if (vcount == 120) {
            REG_BG0VOFS = 4;
        }
    }

    return;
}

//! FE8U = 0x080B0760
s8 sub_80B0760(void) {
    int i;

    int count = 0;

    CpuFill16(0, gUnknown_08A21598, 0x80);
    CpuFill16(0, gUnknown_08A21590, 0x144);

    if (LoadBonusContentData(gUnknown_08A21590) != 0) {
        CpuFastCopy(gUnknown_08A21590, gUnknown_08A21594, 0x144);

        for (i = 0; i < 0x10; i++) {
            struct BonusClaimEnt* ent = &gUnknown_08A21590[i];
            struct BonusClaimEnt* ent2;

            if ((ent->unk_00 & 3) == 0) {
                continue;
            }

            switch (ent->unk_01) {
                case 1:
                    if ((gPlaySt.unk_2B_00) == 0) {
                        continue;
                    }

                case 0:
                case 2:
                    gUnknown_08A21598[count].unk_00 = i;

                    if (((1 << i) & GetBonusContentClaimFlags()) != 0) {
                        gUnknown_08A21598[count].unk_01 = 0;
                    } else {
                        gUnknown_08A21598[count].unk_01 = 1;
                    }

                    count++;

                    break;
            }

            ent2 = &gUnknown_08A21590[i];
            if ((ent2->unk_00 & 3) == 1) {
                struct BonusClaimEnt* ent3 = &gUnknown_08A21594[i];
                ent3->unk_00 = (ent3->unk_00 & 0xfc) + 2;
            }
        }

        *gUnknown_08A2159C = count;

        SaveBonusContentData(gUnknown_08A21594);
    }

    if (count == 0) {
        return 0;
    }

    return 1;
}

//! FE8U = 0x080B0894
void sub_80B0894(int idx) {
    int unk1;
    s8 unk2;
    int unk3;
    int itemId;
    int color;
    struct BonusClaimEnt* ent;
    struct BonusClaimEnt* ent2;

    struct TextHandle* th = gUnknown_08A215A0 + ((idx % 6) << 1);

    unk1 = idx * 2;
    unk1 &= 0x1f;

    unk2 = gUnknown_08A21598[idx].unk_01;
    unk3 = gUnknown_08A21598[idx].unk_00;

    ent = gUnknown_08A21590;
    ent += unk3;
    itemId = ent->unk_02;

    color = 0;

    TileMap_FillRect(gBG2TilemapBuffer + ((unk1) * 0x20), 0x14, 1, 0);

    Text_Clear(th);

    if (idx >= 0x20) {
        return;
    }

    ent2 = &gUnknown_08A21590[unk3];
    if ((ent2->unk_00 & 3) == 0) {
        return;
    }

    if ((ent2->unk_00 & 3) == 1) {
        color = 4;
    }

    if (unk2 == 0) {
        color = 1;
    }

    switch (gUnknown_08A21590[unk3].unk_01) {
        case 0:
        case 1:
            DrawTextInline(
                th,
                gBG2TilemapBuffer + (unk1 * 0x20) + 2,
                color,
                0,
                0,
                GetItemName(itemId)
            );

            DrawDecNumber(
                gBG2TilemapBuffer + (unk1 * 0x20) + 0xA,
                color == 0 ? 2 : color,
                GetItemMaxUses(itemId)
            );

            DrawIcon(gBG2TilemapBuffer + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);

            break;

        case 2:
            DrawTextInline(
                th,
                gBG2TilemapBuffer + (unk1 * 0x20) + 2,
                color,
                0,
                0,
                GetItemName(itemId)
            );

            DrawIcon(gBG2TilemapBuffer + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);

            break;
    }

    th++;

    Text_Clear(th);

    DrawTextInline(
        th,
        gUnknown_02023CC0 + unk1 * 0x20,
        color == 0 ? 3 : color,
        0,
        0,
        gUnknown_08A21590[unk3].unk_03
    );

    BG_EnableSyncByMask(4);

    return;
}


//! FE8U = 0x080B0A24
void sub_80B0A24(int idx) {
    struct BonusClaimItemEnt* ent = &gUnknown_08A21598[idx];

    int itemFlag = ent->unk_00;

    SetBonusContentClaimFlags((1 << itemFlag) | GetBonusContentClaimFlags());

    ent->unk_01 = 0;

    return;
}

//! FE8U = 0x080B0A50
void sub_80B0A50(struct BonusClaimProc* proc) {
    int i;

    int count = 0;

    ResetUnitSprites();

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & 0x00010004) {
            continue;
        }

        if (unit->pCharacterData->number != 1 && unit->pCharacterData->number != 0xF) {
            continue;
        }

        (gUnknown_08A215A4 + count)->unk_04 = unit;
        count++;
        UseUnitSprite(GetUnitSMSId(unit));
    }

    proc->unk_2b = count + 1;

    SetupMapSpritesPalettes();

    ForceSyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x080B0ABC
void sub_80B0ABC(void) {
    DrawUiFrame2(3, 6, 24, 12, 0);
    BG_EnableSyncByMask(3);
    return;
}

//! FE8U = 0x080B0ADC
void sub_80B0ADC(struct BonusClaimProc* proc) {
    int i;

    SetupBackgrounds(0);

    CopyToPaletteBuffer(gUnknown_08B1754C, 0x180, 0x40);
    CopyToPaletteBuffer(gUnknown_08A295B4, 0x1c0, 0x20);
    CopyDataWithPossibleUncomp(Img_CommGameBgScreen, (void*)0x06008000);

    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A295D4, 0xc000);

    BG_EnableSyncByMask(8);

    LoadUiFrameGraphics();
    Font_InitForUIDefault();
    ResetIconGraphics_();
    LoadIconPalettes(4);
    LoadObjUIGfx();

    sub_80B0674();
    sub_80B0ABC();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win1_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win1_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win1_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 2;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.win1_left = 0;
    gLCDControlBuffer.win1_top = 56;
    gLCDControlBuffer.win1_right = 240;
    gLCDControlBuffer.win1_bottom = 136;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    sub_80B0760();

    for (i = 0; i <= 5 && i < *gUnknown_08A2159C; i++) {
        struct TextHandle* th = gUnknown_08A215A0 + i * 2;
        Text_Init(th, 7);
        th++;
        Text_Init(th, 10);
        sub_80B0894(i);
    }

    for (i = 0; i < 2; i++) {
        Text_Init(gUnknown_08A215A0 + 12 + i, 6);
    }

    Text_Init(gUnknown_08A215A0 + 14, 15);

    StartParallelWorker(sub_80B0638, proc);

    BG_EnableSyncByMask(2);

    SetPrimaryHBlankHandler(sub_80B06FC);

    proc->unk_29 = 0;
    proc->unk_2c = 0;
    proc->unk_2e = 0;
    proc->unk_2a = 0;
    proc->unk_2b = 2;

    proc->unk_34 = NULL;

    BG_SetPosition(2, -40, (proc->unk_2c - 56) & 0xff);

    ResetPrepScreenHandCursor(proc);
    sub_80AD4A0(0x600, 1);
    ShowPrepScreenHandCursor(40, proc->unk_29 * 16 + 56 - proc->unk_2c, 19, 0x800);

    NewGreenTextColorManager(proc);

    Make6CMenuScroll(proc);

    sub_80976AC(200, 0x40);

    InitPrepSideBarImg(0x200, 2);

    sub_80976CC(8, proc->unk_2c, *gUnknown_08A2159C, 5);

    sub_80AC9C0(proc);

    sub_80B0A50(proc);

    LoadDialogueBoxGfx((void*)0x06013800, 5);

    return;
}

//! FE8U = 0x080B0D38
void sub_80B0D38(struct BonusClaimProc* proc) {
    u16 tmp;
    struct BonusClaimEnt* ent;

    int curIdx = proc->unk_29;

    if (proc->unk_2e == 0) {
        if ((gKeyStatusPtr->newKeys & 1) != 0) {
            int itemIdx = gUnknown_08A21598[curIdx].unk_00;

            if (((1 << itemIdx) & GetBonusContentClaimFlags()) != 0) {
                sub_80AEBCC(-1, -1, 0x0000088F, proc);
                return;
            }

            if (proc->unk_2b != 0) {
                struct BonusClaimEnt* ent2 = gUnknown_08A21590;
                ent2 += itemIdx;

                switch (ent2->unk_01) {
                    case 0:
                    case 1:
                        Proc_Goto(proc, 1);
                        PlaySoundEffect(0x6a);

                    default:
                        return;

                    case 2:
                        if (ent2->unk_02 == 0x9f) {
                            sub_8024E20(3000);
                        }

                        ent = &gUnknown_08A21590[itemIdx];
                        if (ent->unk_02 == 0xa0) {
                            sub_8024E20(5000);
                        }

                        sub_80B0A24(proc->unk_29);
                        sub_80B0894(proc->unk_29);

                        Proc_Goto(proc, 2);

                        return;
                }
            }

            PlaySoundEffect(0x6c);

            return;
        }

        if ((gKeyStatusPtr->newKeys & 2) != 0) {
            Proc_Break(proc);
            PlaySoundEffect(0x6b);
            return;
        }

        if ((gKeyStatusPtr->repeatedKeys & 0x40) != 0) {
            curIdx -= 1;
        }

        if ((gKeyStatusPtr->repeatedKeys & 0x80) != 0) {
            curIdx += 1;
        }

        if (proc->unk_29 != curIdx) {
            if (curIdx >= 0) {

                if (curIdx >= *gUnknown_08A2159C) {
                    return;
                }

                PlaySoundEffect(0x66);

                proc->unk_29 = curIdx;

                if ((proc->unk_29 * 16 - proc->unk_2c == 0) && (proc->unk_29 != 0)) {
                    proc->unk_2e = -1;
                    sub_80B0894(proc->unk_29 - 1);
                } else {
                    if ((proc->unk_29 * 16 - proc->unk_2c == 64) && (proc->unk_29 < *gUnknown_08A2159C - 1)) {
                        proc->unk_2e = 1;
                        sub_80B0894(proc->unk_29 + 1);
                    } else {
                        ShowPrepScreenHandCursor(40, proc->unk_29 * 16 + 56 - proc->unk_2c, 19, 0x800);
                    }
                }
            } else {
                return;
            }
        }

        if (proc->unk_2e == 0) {
            return;
        }
    }

    if (proc->unk_2e < 0) {
        proc->unk_2c -= 4;
    }

    if (proc->unk_2e > 0) {
        proc->unk_2c += 4;
    }

    tmp = (proc->unk_2c);
    tmp &= 0xf;

    if (tmp == 0) {
        proc->unk_2e = 0;
    }

    BG_SetPosition(2, -40, (proc->unk_2c - 56) & 0xff);

    sub_80976CC(8, proc->unk_2c, *gUnknown_08A2159C, 5);

    return;
}

//! FE8U = 0x080B0F94
void sub_80B0F94(struct BonusClaimProc* proc) {
    int i;

    for (i = 0; i < proc->unk_2b - 1; i++) {
        struct Unit* unit = gUnknown_08A215A4[i].unk_04;

        if (gUnknown_08A215A4[i].unk_00 != 0) {
            PutUnitSpriteForClassId(0, 0x60, 0x30 + i * 0x10, 0xc400, unit->pClassData->number);
        } else {
            PutUnitSpriteForClassId(0, 0x60, 0x30 + i * 0x10, 0xf400, unit->pClassData->number);
        }
    }

    SyncUnitSpriteSheet();

    return;
}

//! FE8U = 0x080B1008
void sub_80B1008(struct BonusClaimProc* proc) {

    if (proc->unk_34 != NULL) {
        Proc_End(proc->unk_34);
        proc->unk_34 = NULL;
    }

    return;
}

//! FE8U = 0x080B1020
void sub_80B1020(struct BonusClaimProc* proc) {
    int i;

    struct TextHandle* th = gUnknown_08A215A0 + 12;
    int sl = proc->unk_2b;
    int tmp = (proc->unk_2b * 2);

    DrawUiFrame2(11, 5, 14, tmp + 2, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.win0_left = 88;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 200;
    gLCDControlBuffer.win0_bottom = (tmp + 7) * 8;

    sub_80AC9D4(0, 40, proc->unk_29 * 16 + 56 - proc->unk_2c, 1);

    ShowPrepScreenHandCursor(92, proc->unk_2a * 16 + 48, 12, 0x800);

    for (i = 0; i < sl; th++, i++) {
        int count;
        int color = 0;
        struct Unit* unit = gUnknown_08A215A4[i].unk_04;
        u16* tm = gUnknown_02022CC4;

        Text_Clear(th);
        Text_SetXCursor(th, 0);

        if (i == sl - 1) {
            count = GetConvoyItemCount();
            color = count == 100 ? 1 : 0;
            Text_SetParameters(th, 0, color);
            Text_AppendString(th, GetStringFromIndex(0x308));
        } else {
            count = GetUnitItemCount(unit);
            color = count == 5 ? 1 : 0;
            Text_SetParameters(th, 0, color);

            Text_AppendString(th, GetStringFromIndex(unit->pCharacterData->nameTextId));
        }

        if (color == 0) {
            gUnknown_08A215A4[i].unk_00 = 1;
        } else {
            gUnknown_08A215A4[i].unk_00 = 0;
        }

        Text_Draw(th, tm + 0xc0 + 0x40 * i);

        sub_8004B88(
            tm + 0xc9 + 0x40 * i,
            color == 0 ? 2 : 1,
            count
        );
    }

    proc->unk_34 = StartParallelWorker(sub_80B0F94, proc);

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/Opqpi */

//! FE8U = 0x080B11E4
s8 sub_80B11E4(struct BonusClaimProc* proc) {
    int itemId;
    struct BonusClaimItemEnt* itemEnt;
    struct BonusClaimEnt* ent;
    int tmp2;
    struct Unknown8A215A4* unk;

    int tmp = proc->unk_2a;

    unk = gUnknown_08A215A4 + proc->unk_2a;
    unk += tmp;


    itemEnt = gUnknown_08A21598 + proc->unk_29;
    tmp2 = itemEnt->unk_00;

    ent = gUnknown_08A21590;
    ent += tmp2;

    itemId = ent->unk_02;

    if (unk->unk_00 == 0) {
        return 0;
    }

    sub_80B0A24(proc->unk_29);

    sub_80B0894(proc->unk_29);

    if (proc->unk_2a == proc->unk_2b - 1) {
        AddItemToConvoy(MakeNewItem(itemId));
    } else {
        UnitAddItem(gUnknown_08A215A4[proc->unk_2a].unk_04, MakeNewItem(itemId));
    }

    return 1;
}

#else // if !NONMATCHING

__attribute__((naked))
s8 sub_80B11E4(struct BonusClaimProc* proc) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        adds r4, r0, #0\n\
        movs r0, #0x2a\n\
        adds r0, r0, r4\n\
        mov r8, r0\n\
        ldrb r3, [r0]\n\
        ldr r1, _080B122C  @ gUnknown_08A215A4\n\
        mov r9, r1\n\
        ldr r0, [r1]\n\
        lsls r3, r3, #3\n\
        adds r3, r3, r0\n\
        ldr r0, _080B1230  @ gUnknown_08A21598\n\
        adds r6, r4, #0\n\
        adds r6, #0x29\n\
        ldrb r5, [r6]\n\
        lsls r1, r5, #2\n\
        ldr r0, [r0]\n\
        adds r0, r0, r1\n\
        movs r2, #0\n\
        ldrsb r2, [r0, r2]\n\
        ldr r0, _080B1234  @ gUnknown_08A21590\n\
        ldr r1, [r0]\n\
        lsls r0, r2, #2\n\
        adds r0, r0, r2\n\
        lsls r0, r0, #2\n\
        adds r1, r1, r0\n\
        ldrb r7, [r1, #2]\n\
        movs r0, #0\n\
        ldrsb r0, [r3, r0]\n\
        cmp r0, #0\n\
        bne _080B1238\n\
        movs r0, #0\n\
        b _080B127A\n\
        .align 2, 0\n\
    _080B122C: .4byte gUnknown_08A215A4\n\
    _080B1230: .4byte gUnknown_08A21598\n\
    _080B1234: .4byte gUnknown_08A21590\n\
    _080B1238:\n\
        adds r0, r5, #0\n\
        bl sub_80B0A24\n\
        ldrb r0, [r6]\n\
        bl sub_80B0894\n\
        mov r0, r8\n\
        ldrb r2, [r0]\n\
        adds r0, r4, #0\n\
        adds r0, #0x2b\n\
        ldrb r0, [r0]\n\
        subs r0, #1\n\
        cmp r2, r0\n\
        bne _080B1260\n\
        adds r0, r7, #0\n\
        bl MakeNewItem\n\
        bl AddItemToConvoy\n\
        b _080B1278\n\
    _080B1260:\n\
        mov r0, r9\n\
        ldr r1, [r0]\n\
        lsls r0, r2, #3\n\
        adds r0, r0, r1\n\
        ldr r4, [r0, #4]\n\
        adds r0, r7, #0\n\
        bl MakeNewItem\n\
        adds r1, r0, #0\n\
        adds r0, r4, #0\n\
        bl UnitAddItem\n\
    _080B1278:\n\
        movs r0, #1\n\
    _080B127A:\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

//! FE8U = 0x080B1288
void sub_80B1288(struct BonusClaimProc* proc) {
    int tmp = proc->unk_2a;

    if ((gKeyStatusPtr->newKeys & 1) != 0) {
        if (sub_80B11E4(proc) != 0) {
            Proc_Goto(proc, 2);
            return;
        }

        sub_80AEBCC(-1, -1, 0x890, proc);
        return;
    }

    if ((gKeyStatusPtr->newKeys & 2) != 0) {
        Proc_Break(proc);
        PlaySoundEffect(0x6b);
        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & 0x40) != 0) {
        tmp--;
    }

    if ((gKeyStatusPtr->repeatedKeys & 0x80) != 0) {
        tmp++;
    }

    if (((tmp != proc->unk_2a) && (-1 < tmp)) && (tmp < proc->unk_2b)) {
        PlaySoundEffect(0x66);
        proc->unk_2a = tmp;
        ShowPrepScreenHandCursor(92, proc->unk_2a * 16 + 48, 12, 0x800);
    }

    return;
}

//! FE8U = 0x080B1350
void sub_80B1350(struct BonusClaimProc* proc) {
    sub_80B1008(proc);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG0TilemapBuffer, 0);

    sub_80B0ABC();

    BG_EnableSyncByMask(3);

    sub_80ACA84(0);

    ShowPrepScreenHandCursor(40, proc->unk_29 * 16 + 56 - proc->unk_2c, 19, 0x800);

    return;
}

//! FE8U = 0x080B13BC
void sub_80B13BC(struct BonusClaimProc* proc) {
    const char* itemNameStr;
    const char* otherStr;
    int width;
    int x;
    struct TextHandle* th;
    char buf[32];
    struct BonusClaimEnt* ent;
    struct BonusClaimEnt* ent2;
    int itemId;

    int idx = gUnknown_08A21598[proc->unk_29].unk_00;

    ent = gUnknown_08A21590;
    ent += idx;
    itemId = ent->unk_02;

    th = gUnknown_08A215A0 + 14;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80B0ABC();

    BG_EnableSyncByMask(3);

    sub_80B1008(proc);

    WriteGameSave(ReadLastGameSaveId());

    proc->unk_30 = 0;
    sub_80ACA84(proc->unk_30);

    ShowPrepScreenHandCursor(40, proc->unk_29 * 16 + 56 - proc->unk_2c, 19, 0x800);

    Text_Clear(th);
    Text_SetParameters(th, 0, 0);
    Text_SetXCursor(th, 0);

    itemNameStr = GetItemName(itemId);
    otherStr = GetStringFromIndexInBuffer(0x883, buf); // TODO: msgid "Sent[.]"

    width = ((GetStringTextWidth(itemNameStr) + GetStringTextWidth(otherStr) + 7) / 8) + 4;
    x = 15 - width / 2;

    Text_AppendString(th, itemNameStr);
    Text_AppendString(th, otherStr);

    Text_Draw(th, gBG0TilemapBuffer + x + 0x143);

    DrawIcon(gBG0TilemapBuffer + x + 0x141, GetItemIconId(itemId), 0x4000);

    ent2 = gUnknown_08A21590;
    ent2 += idx;
    switch (ent2->unk_01) {
        case 0:
        case 1:
            PlaySoundEffect(0x5a);
            break;
        case 2:
            PlaySoundEffect(0xb9);
            break;
    }

    DrawUiFrame(gBG1TilemapBuffer, x, 10, width, 3, 0, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 0;

    gLCDControlBuffer.win0_left = x * 8;
    gLCDControlBuffer.win0_top = 80;
    gLCDControlBuffer.win0_right = (x + width) * 8;
    gLCDControlBuffer.win0_bottom = 104;

    BG_EnableSyncByMask(3);

    BG_SetPosition(0, 0, -4);

    return;
}

//! FE8U = 0x080B15E8
void sub_80B15E8(struct BonusClaimProc* proc) {

    proc->unk_30++;

    if ((proc->unk_30 >= 0x1f) && ((gKeyStatusPtr->newKeys & 3) != 0)) {
        Proc_Break(proc);
        return;
    } else {
        if (proc->unk_30 > 0x78) {
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x080B1620
void sub_80B1620(void) {

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80B0ABC();

    BG_EnableSyncByMask(3);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_SetPosition(0, 0, 0);

    return;
}

//! FE8U = 0x080B166C
void sub_80B166C(struct BonusClaimProc* proc) {
    EndGreenTextColorManager();
    EndAllProcChildren(proc);
    SetPrimaryHBlankHandler(NULL);
    return;
}

struct ProcCmd CONST_DATA gUnknown_08A215A8[] = {
    PROC_SLEEP(0),

    PROC_CALL(sub_80B0ADC),

    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),

    // fallthrough

PROC_LABEL(0),
    PROC_REPEAT(sub_80B0D38),

    PROC_GOTO(100),

PROC_LABEL(1),
    PROC_CALL(sub_80B1020),
    PROC_REPEAT(sub_80B1288),
    PROC_CALL(sub_80B1350),

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_CALL(sub_80B13BC),
    PROC_REPEAT(sub_80B15E8),
    PROC_CALL(sub_80B1620),

    PROC_GOTO(0),

PROC_LABEL(100),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(sub_80B166C),

    PROC_END,
};

//! FE8U = 0x080B1688
void StartBonusClaimScreen(ProcPtr parent) {
    Proc_StartBlocking(gUnknown_08A215A8, parent);
    return;
}
