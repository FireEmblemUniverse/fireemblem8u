#include "global.h"

#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "sallycursor.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"

#include "constants/characters.h"

struct ChapterStatusProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u8 unk_30;
    /* 31 */ u8 unk_31;

    /* 34 */ struct Unit* unk_34[2];

    /* 3C */ u16 unk_3c;
    /* 3E */ u8 unk_3e;
    /* 3F */ u8 unk_3f;
    /* 40 */ u8 unk_40;

    /* 41 */ u8 _pad[0x64-0x41];

    /* 64 */ u16 unk_64;
};

extern struct TextHandle gUnknown_02004BAC[];

struct Struct2004BBC {
    struct TextHandle th;
    struct Font font;
};

extern struct Struct2004BBC gUnknown_02004BBC;

extern u16 gUnknown_02022BA4[];
extern u16 gUnknown_02022CDC[];
extern u16 gUnknown_02022F1A[];
extern u16 gUnknown_02022F2A[];
extern u16 gUnknown_02022F6A[];
extern u16 gUnknown_02023028[];
extern u16 gUnknown_020230CE[];
extern u16 gUnknown_020235F0[];

extern u8 gUnknown_08A2D32C[]; // Gfx
extern u16 gUnknown_08A2E1B8[]; // Pal
extern u8 gUnknown_08A2E1F8[]; // Gfx
extern u8 gUnknown_08A2E214[]; // Gfx
extern u16 gUnknown_08A2E4A4[]; // Pal
extern u8 gUnknown_08A2E4C4[]; // TSA
extern u8 gUnknown_08A2E5EC[]; // Gfx
extern u16 gUnknown_08A2E8F0[]; // Pal

extern u16 gUnknown_08A01AA4[];
extern u16 gUnknown_08A01AAC[];
extern u16 gUnknown_08A01ABA[];
extern u16 gUnknown_08A01AC8[];
extern u16 gUnknown_08A01AD6[];
extern u16 gUnknown_08A01ADE[];
extern u16 gUnknown_08A01AE6[];
extern u16 gUnknown_08A01B18[];
extern u16 gUnknown_08A01B2C[];
extern struct TextBatch gUnknown_08A01B3C[];
extern struct ProcCmd gUnknown_08A01B54[];
extern struct ProcCmd gUnknown_08A01C04[];
extern struct ProcCmd gUnknown_08A01CA4[];
extern u16 gUnknown_08A01C7C[];

struct Unit* sub_808DCF8() {
    int i;

    struct Unit* unit = NULL;

    switch (gRAMChapterData.chapterIndex) {
        case 0x0D:
            unit = GetUnitFromCharId(CHARACTER_AIAS);
            break;

        case 0x0F:
            unit = GetUnitFromCharId(CHARACTER_VALER);
            break;

        case 0x1C:
            unit = GetUnitFromCharId(CHARACTER_CAELLACH);
            break;

        case 0x14:
        case 0x21:
            unit = GetUnitFromCharId(CHARACTER_MORVA);
            break;
    }

    if (unit) {
        return unit;
    }

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS)) {
            continue;
        }

        return unit;
    }

    return NULL;
}

int sub_808DDC0() {
    int count;
    int i;

    count = 0;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS)) {
            continue;
        }

        count++;
    }

    return count;
}

int sub_808DDF8(int faction) {
    int count;
    int i;

    count = 0;

    for (i = faction + 1; i < faction + 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & US_UNAVAILABLE) {
            continue;
        }

        count++;
    }

    return count;
}

void sub_808DE38(struct ChapterStatusProc* proc) {
    u16* palPtr;
    u16 base;
    int mod;

    base = gUnknown_08A2E8F0[0x2F];
    palPtr = gUnknown_02022BA4;

    mod = RED_VALUE(proc->unk_40 >> 1);

    proc->unk_40++;

    if (mod > 16) {
        mod = 16 - (mod & 0xF);
    }

    if (proc->unk_2e != proc->unk_2f) {
        proc->unk_2f = proc->unk_2e;
        proc->unk_40 = 0;
    }

    *palPtr = ((((base & 0x1F) * (16 - mod)) >> 4) & 0x1F) +
        ((((base & (0x1F << 5)) * (16 - mod)) >> 4) & (0x1F << 5)) +
        ((((base & (0x1F << 10)) * (16 - mod)) >> 4) & (0x1F << 10));

    EnablePaletteSync();

    return;
}

char* sub_808DEBC(char* str) {
    if (str == 0) {
        return NULL;
    }

    if (*str == 0) {
        return NULL;
    }

    while (1) {
        char c = *str;
        u32 width;

        if (c != 0) {
            if (c == 1) {
                return str + 1;
            }
        } else {
            return NULL;

        }

        str = GetCharTextWidth(str, &width);
    }
}

void sub_808DEF0(s8 flag) {

    if (flag) {
        CpuFastFill16(0, gUnknown_02022C48, 0x20);
        EnablePaletteSync();
    } else {
        SetupMapSpritesPalettes();
    }

    return;
}

void sub_808DF24(struct ChapterStatusProc* proc) {
    int i;

    SetupBackgrounds(0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 2;

    Font_InitForUIDefault();
    LoadUiFrameGraphics();

    proc->unk_3c = 0;
    proc->unk_3e = 0;
    proc->unk_2a = 0;

    BG_SetPosition(0, -2, -4);
    BG_SetPosition(1, 0, -2);
    BG_SetPosition(2, 0, -36);
    BG_SetPosition(3, 0, 0);

    ClearBg0Bg1();

    CopyToPaletteBuffer(gUiFramePaletteA, 0x40, 0x60);
    CopyDataWithPossibleUncomp(gUnknown_08A2E5EC, (void*)(BG_VRAM + 0x5800));
    CopyDataWithPossibleUncomp(gUnknown_08A2E4C4, gUnknown_02020188);
    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_02020188, 0x1000);

    CopyDataWithPossibleUncomp(gUnknown_08A2D32C, OBJ_VRAM0 + 0x3000);
    CopyToPaletteBuffer(gUnknown_08A2E1B8, 0x300, 0x40);

    CopyDataWithPossibleUncomp(gUnknown_08A2E1F8, OBJ_VRAM0 + 0x3300);

    SetDefaultColorEffects();

    BG_EnableSyncByMask(0xF);

    proc->unk_2d = 0;
    proc->unk_2e = 0;
    proc->unk_40 = 0;

    proc->unk_34[0] = GetUnitFromCharId(GetPlayerLeaderUnitId());

    proc->unk_30 = sub_808DDF8(0);

    proc->unk_2b = sub_80A4BB0();

    if (proc->unk_34[0]->state & US_UNSELECTABLE) {
        proc->unk_34[0]->state &= ~US_UNSELECTABLE;
        proc->unk_29 = 1;
    } else {
        proc->unk_29 = 0;
    }

    if (sub_808DDC0() != 0) {
        proc->unk_34[1] = sub_808DCF8();
    } else {
        proc->unk_34[1] = NULL;
    }

    proc->unk_31 = sub_808DDF8(FACTION_RED);

    SetupMapSpritesPalettes();

    for (i = 0; i < 2; i++) {
        if (proc->unk_34[i] == 0) {
            continue;
        }

        SMS_RegisterUsage(GetUnitSMSId(proc->unk_34[i]));
    }

    SMS_FlushIndirect();

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.win0_left = 0;
    gLCDControlBuffer.win0_top = 40;
    gLCDControlBuffer.win0_right = 240;
    gLCDControlBuffer.win0_bottom = 72;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    sub_8086BB8(proc, 0, 14);

    CopyToPaletteBuffer(gUnknown_08B1754C, 0x1C0, 0x40);

    StartHelpPromptSprite(200, 18, 2, (struct Proc*)proc);

    Proc_Start(gUnknown_08A01CA4, proc);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

void sub_808E19C(struct Unit* unit) {
    struct Struct2004BBC* ptr = &gUnknown_02004BBC;

    TileMap_FillRect(gUnknown_02022F1A, 3, 3, 0);

    SetFont(&ptr->font);
    SetFontGlyphSet(0);

    Text_80046B4(&ptr->th, 0);

    if (unit != 0) {
        if (unit->state & (US_UNDER_A_ROOF | US_BIT9)) {
            Text_SetColorId(&ptr->th, 2);

            Text_SetXCursor(&ptr->th, 130);
            Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

            Text_SetXCursor(&ptr->th, 162);
            Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

            Text_SetXCursor(&ptr->th, 186);
            Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

            sub_808DEF0(1);
        } else {
            char* str;

            Text_SetColorId(&ptr->th, 0);

            str = GetStringFromIndex(unit->pCharacterData->nameTextId);
            Text_SetXCursor(&ptr->th, GetStringTextCenteredPos(0x30, str));
            Text_AppendString(&ptr->th, str);

            Text_SetColorId(&ptr->th, 2);

            Text_SetXCursor(&ptr->th, 138);
            Text_AppendNumberOr2Dashes(&ptr->th, unit->level);

            if (GetUnitCurrentHp(unit) >= 100) {
                Text_SetXCursor(&ptr->th, 162);
                Text_AppendString(&ptr->th, GetStringFromIndex(0x535));
            } else {
                Text_SetXCursor(&ptr->th, 170);
                Text_AppendNumberOr2Dashes(&ptr->th, GetUnitCurrentHp(unit));
            }

            if (GetUnitMaxHp(unit) >= 100) {
                Text_SetXCursor(&ptr->th, 186);
                Text_AppendString(&ptr->th, GetStringFromIndex(0x535));
            } else {
                Text_SetXCursor(&ptr->th, 194);
                Text_AppendNumberOr2Dashes(&ptr->th, GetUnitMaxHp(unit));
            }

            sub_8005988(GetUnitMiniPortraitId(unit), gUnknown_02022F1A, 0x280, 4, 0);

            sub_808DEF0(0);
        }
    } else {
        Text_SetColorId(&ptr->th, 2);

        Text_SetXCursor(&ptr->th, 130);
        Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

        Text_SetXCursor(&ptr->th, 162);
        Text_AppendString(&ptr->th, GetStringFromIndex(0x535));

        Text_SetXCursor(&ptr->th, 186);
        Text_AppendString(&ptr->th, GetStringFromIndex(0x535));
    }

    Text_SetColorId(&ptr->th, 0);

    Text_SetXCursor(&ptr->th, 179);
    Text_AppendString(&ptr->th, GetStringFromIndex(0x539));

    SetFont(0);

    BG_EnableSyncByMask(1);

    sub_8001ED0(0, 0, 1, 0, 0);

    sub_8001F0C(0, 0, 0, 1, 0);

    SetSpecialColorEffectsParameters(1, 13, 3, 0);

    sub_8001F48(0);

    sub_8001F64(0);

    return;
}

void sub_808E3D4() {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

void sub_808E3F4() {
    CopyToPaletteBuffer(gUnknown_0859EF00, 0x340, 0x20);

    InitSomeOtherGraphicsRelatedStruct(&gUnknown_02004BBC.font, OBJ_VRAM0 + 0x7800, 0x1A);

    SetFont(&gUnknown_02004BBC.font);
    SetFontGlyphSet(0);

    Text_Init3(&gUnknown_02004BBC.th);

    SetFont(0);

    return;
}

void sub_808E43C() {
    TileMap_FillRect(gUnknown_02023028, 15, 6, 0);

    sub_8004B88(gUnknown_02023028 + 0xC, 2, gRAMChapterData.chapterTurnNumber);

    sub_8004B88(gUnknown_02023028 + 0x4B, 2, GetPartyGoldAmount());

    sub_8004B0C(gUnknown_02023028 + 0x4C, 3, 30);

    sub_8004D5C(gUnknown_02023028 - 0x8F, 3, 36, 37);

    sub_8004D5C(gUnknown_02023028 - 0x4F, 3, 34, 35);

    BG_EnableSyncByMask(1);

    return;
}

void sub_808E4AC(struct ChapterStatusProc* proc) {
    char* str;

    InitTextBatch(gUnknown_08A01B3C);

    sub_808E3F4(proc);

    sub_808E19C(proc->unk_34[proc->unk_2e]);

    sub_8004B88(gUnknown_020235F0, 2, proc->unk_30);

    if (gRAMChapterData.chapterVisionRange != 0) {
        sub_8004B0C(gUnknown_020235F0 + 7, 2, 20);
        sub_8004B0C(gUnknown_020235F0 + 8, 2, 20);
    } else {
        sub_8004B88(gUnknown_020235F0 + 7, 2, proc->unk_31);
    }

    proc->unk_2c = 1;

    str = GetStringFromIndex(
        GetChapterThing() != 2 ?
        GetROMChapterStruct(gRAMChapterData.chapterIndex)->statusObjectiveTextId : 0x1C0
    );

    Text_InsertString(gUnknown_02004BAC, GetStringTextCenteredPos(0x60, str), 0, str);

    str = sub_808DEBC(str);

    if (str != 0) {
        Text_InsertString(gUnknown_02004BAC + 1, GetStringTextCenteredPos(0x60, str), 0, str);
        proc->unk_2c = 2;
    }

    if (proc->unk_2c == 2) {
        Text_Draw(gUnknown_02004BAC, gUnknown_02022F2A);
        Text_Draw(gUnknown_02004BAC + 1, gUnknown_02022F2A + 0x40);
    } else {
        Text_Draw(gUnknown_02004BAC, gUnknown_02022F6A);
    }

    if (proc->unk_2b != 0) {
        if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME)) {
            DrawDecNumber(gUnknown_02022CDC, 0, proc->unk_2b + 1);
        }
    }

    sub_808E43C();

    BG_EnableSyncByMask(1);

    return;
}

void sub_808E608(struct ChapterStatusProc* proc) {
    int previous = proc->unk_2e;

    proc->unk_3e = 0;

    if (gKeyStatusPtr->newKeys & R_BUTTON) {
        proc->unk_3e = 1;

        sub_808DCAC(proc);
        return;
    } else if (gKeyStatusPtr->newKeys & A_BUTTON) {

        if ((proc->unk_34[proc->unk_2e] != 0) && !(proc->unk_34[proc->unk_2e]->state & (US_UNDER_A_ROOF | US_BIT9))) {
            SetLastStatScreenUid(proc->unk_34[proc->unk_2e]->index);
            proc->unk_2a = 1;
        }

        PlaySoundEffect(0x6A);
        Proc_Goto(proc, 1);
        return;
    } else if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, 1);

        PlaySoundEffect(0x6B);
        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && (proc->unk_2e != 0)) {
        proc->unk_2e--;
    }


    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && (proc->unk_2e == 0)) {
        proc->unk_2e++;
    }

    if (proc->unk_2e != previous) {
        PlaySoundEffect(0x66);
        sub_808E19C(proc->unk_34[proc->unk_2e]);
    }

    return;
}

void sub_808E71C(struct ChapterStatusProc* proc) {
    Proc_EndEach(gUnknown_08A01CA4);

    EndHelpPromptSprite();

    if (proc->unk_29 != 0) {
        proc->unk_34[0]->state |= US_UNSELECTABLE;
    }

    return;
}

void sub_808E748(struct ChapterStatusProc* proc) {

    if (proc->unk_2a != 0) {
        Proc_StartBlocking(gProcScr_ADJUSTSFROMXI, proc);
    }

    return;
}

void NewChapterStatusScreen(ProcPtr proc) {
    struct ChapterStatusProc* child;

    if (proc != 0) {
        child = Proc_StartBlocking(gUnknown_08A01B54, proc);
        child->unk_3f = 0;
    } else {
        child = Proc_Start(gUnknown_08A01B54, PROC_TREE_3);
        child->unk_3f = 0;
    }

    return;
}

void sub_808E79C(ProcPtr proc) {
    struct ChapterStatusProc* child;

    child = Proc_StartBlocking(gUnknown_08A01C04, proc);
    child->unk_3f = 1;

    return;
}

void sub_808E7B4(struct ChapterStatusProc* proc) {
    LoadObjUIGfx();

    CopyToPaletteBuffer(gUnknown_08A2E4A4, 0x280, 0x20);
    CopyToPaletteBuffer(gUnknown_08A2E8F0, 0x2E0, 0x20);

    CopyDataWithPossibleUncomp(gUnknown_08A2E214, OBJ_VRAM0 + 0x6800);

    proc->unk_64 = 0;

    sub_80895B4(0x80, 0x13);

    sub_8089624(0xB80, sub_808979C(&gRAMChapterData));

    return;
}

void sub_808E818(struct ChapterStatusProc* proc) {
    int i;

    struct ChapterStatusProc* parent = proc->proc_parent;

    PutSprite(4, 4, 3, gUnknown_08A01B18, 0x8580);
    PutSprite(4, 150, 124, gUnknown_08A01B2C, 0x9580);

    if (parent->unk_3f == 0) {
        PutSprite(4, 4, 11, gUnknown_08A01C7C, 0x3780);
    }

    PutSprite(4, parent->unk_2e * 56, 44, gUnknown_08A01AE6, 0x7580);

    PutSprite(4, 8, 37, gUnknown_08A01AAC, 0);
    PutSprite(4, 64, 37, gUnknown_08A01ABA, 0);
    PutSprite(4, 18, 115, gUnknown_08A01AD6, 0);
    PutSprite(4, 18, 131, gUnknown_08A01ADE, 0);
    PutSprite(4, 28, 67, gUnknown_08A01AC8, 0);

    for (i = 0; i < 2; i++) {
        PutSprite(4, 160 + (i * 32), 60, gObject_32x16, 0xA3C0 + (i * 4));
    }

    PutSprite(4, 180, 75, gObject_32x16, 0xA3D0);

    for (i = 0; i < 2; i++) {
        PutSprite(4, 156 + (i * 32), 91, gObject_32x16, 0xA3D4 + (i * 4));
    }

    sub_8004C68(gUnknown_020230CE, 2, GetGameClock(), 0);

    BG_EnableSyncByMask(1);

    if (parent->unk_34[parent->unk_2e] != 0) {
        sub_8027B60(4, 136, 61, parent->unk_34[parent->unk_2e]);
    }

    SMS_FlushDirect();

    if (parent->unk_2b != 0) {
        if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME)) {
            PutSprite(4, 219, 3, gUnknown_08A01AA4, gRAMChapterData.chapterStateBits & CHAPTER_FLAG_POSTGAME);
        }
    }

    sub_808DE38(parent);

    return;
}
