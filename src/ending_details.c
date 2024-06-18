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
#include "bmlib.h"
#include "worldmap.h"
#include "savemenu.h"
#include "ending_details.h"
#include "sysutil.h"
#include "constants/characters.h"

struct CharacterEndingProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x2E - 0x29];
    /* 2E */ u16 unk_2e;
    /* 30 */ struct CharacterEndingEnt* unk_30;
    /* 34 */ struct CharacterEndingEnt* unk_34;
    /* 38 */ struct Unit* unitA;
    /* 3C */ struct Unit* unitB;
    /* 40 */ u32 unk_40[8]; // flags for characters who have already been shown in an ending
};

struct EndingBattleDisplayProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* units[2];
    /* 34 */ int unk_34;
    /* 38 */ struct CharacterEndingEnt* pCharacterEnding;
    /* 3C */ u16 battleAmounts[2];
    /* 40 */ u16 winAmounts[2];
    /* 44 */ u16 lossAmounts[2];
};

struct EndingBattleTextProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct CharacterEndingEnt* pCharacterEnding;
    /* 30 */ struct Unit* unitA;
    /* 34 */ struct Unit* unitB;
    /* 38 */ u32 unk_38;
    /* 3C */ int pauseTimer;
    /* 40 */ int defaultPauseDelay;
    /* 44 */ const char* str;
    /* 48 */ struct Text* Text;
};

struct FinScreenProc {
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

extern char Pal_020007A0[];

char* CONST_DATA gUnknown_08A3CD64 = Pal_020007A0;

struct CharacterEndingEnt CONST_DATA gCharacterEndings_Eirika[] = {
    { CHARACTER_ENDING_PAIRED, CHARACTER_SETH,     CHARACTER_NATASHA,  0x0000081F, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_SETH,     CHARACTER_NONE,     0x000007D8, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_FRANZ,    CHARACTER_AMELIA,   0x00000820, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_FRANZ,    CHARACTER_NONE,     0x000007DC, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_GILLIAM,  CHARACTER_SYRENE,   0x00000821, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_GILLIAM,  CHARACTER_NONE,     0x000007DA, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_MOULDER,  CHARACTER_NONE,     0x000007DE, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_VANESSA,  CHARACTER_NONE,     0x000007E0, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_ROSS,     CHARACTER_AMELIA,   0x00000832, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_ROSS,     CHARACTER_NONE,     0x000007E2, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_GARCIA,   CHARACTER_ROSS,     0x00000824, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_GARCIA,   CHARACTER_NONE,     0x000007E8, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_COLM,     CHARACTER_NEIMI,    0x00000825, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_COLM,     CHARACTER_NONE,     0x000007E6, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_NEIMI,    CHARACTER_NONE,     0x000007E4, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_ARTUR,    CHARACTER_LUTE,     0x00000826, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_ARTUR,    CHARACTER_NONE,     0x000007FA, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_LUTE,     CHARACTER_NONE,     0x000007EC, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_JOSHUA,   CHARACTER_MARISA,   0x00000830, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_JOSHUA,   CHARACTER_GERIK,    0x00000834, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_JOSHUA,   CHARACTER_NATASHA,  0x00000828, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_JOSHUA,   CHARACTER_NONE,     0x00000812, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_NATASHA,  CHARACTER_NONE,     0x000007EE, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_FORDE,    CHARACTER_VANESSA,  0x00000823, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_FORDE,    CHARACTER_NONE,     0x000007F4, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_KYLE,     CHARACTER_FORDE,    0x00000829, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_KYLE,     CHARACTER_SYRENE,   0x00000837, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_KYLE,     CHARACTER_LUTE,     0x00000827, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_KYLE,     CHARACTER_NONE,     0x000007F6, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_TANA,     CHARACTER_CORMAG,   0x0000082A, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_TANA,     CHARACTER_NONE,     0x00000816, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_INNES,    CHARACTER_LARACHEL, 0x0000082B, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_INNES,    CHARACTER_VANESSA,  0x00000822, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_INNES,    CHARACTER_NONE,     0x000007EA, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_SYRENE,   CHARACTER_VANESSA,  0x00000835, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_SYRENE,   CHARACTER_NONE,     0x00000814, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_AMELIA,   CHARACTER_NONE,     0x000007F8, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_DUESSEL,  CHARACTER_AMELIA,   0x00000838, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_DUESSEL,  CHARACTER_NONE,     0x0000080C, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_KNOLL,    CHARACTER_NONE,     0x00000810, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_CORMAG,   CHARACTER_NONE,     0x000007F0, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_LARACHEL, CHARACTER_DOZLA,    0x00000831, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_LARACHEL, CHARACTER_NONE,     0x00000806, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_DOZLA,    CHARACTER_NONE,     0x00000808, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_RENNAC,   CHARACTER_NONE,     0x0000080A, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_GERIK,    CHARACTER_TETHYS,   0x0000082C, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_GERIK,    CHARACTER_MARISA,   0x0000082D, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_GERIK,    CHARACTER_NONE,     0x000007FC, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_TETHYS,   CHARACTER_NONE,     0x000007FE, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EWAN,     CHARACTER_AMELIA,   0x00000833, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_EWAN,     CHARACTER_NONE,     0x00000804, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_MARISA,   CHARACTER_NONE,     0x00000800, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_SALEH,    CHARACTER_EWAN,     0x0000082F, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_SALEH,    CHARACTER_NONE,     0x00000802, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_MYRRH,    CHARACTER_SALEH,    0x0000082E, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_MYRRH,    CHARACTER_NONE,     0x0000080E, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EPHRAIM,  CHARACTER_EIRIKA,   0x00000817, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EPHRAIM,  CHARACTER_MYRRH,    0x0000081C, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EPHRAIM,  CHARACTER_LARACHEL, 0x0000081D, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EPHRAIM,  CHARACTER_TANA,     0x0000081E, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_EPHRAIM,  CHARACTER_NONE,     0x000007F2, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_SETH,     0x00000818, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_SALEH,    0x00000819, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_TANA,     0x0000081A, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_FORDE,    0x0000081B, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_INNES,    0x00000836, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_EIRIKA,   CHARACTER_NONE,     0x000007D6, },

    { CHARACTER_ENDING_NONE },
};

struct CharacterEndingEnt CONST_DATA gCharacterEndings_Ephraim[] = {
    { CHARACTER_ENDING_PAIRED, CHARACTER_SETH,     CHARACTER_NATASHA,  0x0000081F, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_SETH,     CHARACTER_NONE,     0x000007D8, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_FRANZ,    CHARACTER_AMELIA,   0x00000820, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_FRANZ,    CHARACTER_NONE,     0x000007DC, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_GILLIAM,  CHARACTER_SYRENE,   0x00000821, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_GILLIAM,  CHARACTER_NONE,     0x000007DA, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_MOULDER,  CHARACTER_NONE,     0x000007DE, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_VANESSA,  CHARACTER_NONE,     0x000007E0, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_ROSS,     CHARACTER_AMELIA,   0x00000832, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_ROSS,     CHARACTER_NONE,     0x000007E2, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_GARCIA,   CHARACTER_ROSS,     0x00000824, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_GARCIA,   CHARACTER_NONE,     0x000007E8, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_COLM,     CHARACTER_NEIMI,    0x00000825, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_COLM,     CHARACTER_NONE,     0x000007E6, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_NEIMI,    CHARACTER_NONE,     0x000007E4, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_ARTUR,    CHARACTER_LUTE,     0x00000826, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_ARTUR,    CHARACTER_NONE,     0x000007FA, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_LUTE,     CHARACTER_NONE,     0x000007EC, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_JOSHUA,   CHARACTER_MARISA,   0x00000830, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_JOSHUA,   CHARACTER_GERIK,    0x00000834, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_JOSHUA,   CHARACTER_NATASHA,  0x00000828, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_JOSHUA,   CHARACTER_NONE,     0x00000812, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_NATASHA,  CHARACTER_NONE,     0x000007EE, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_FORDE,    CHARACTER_VANESSA,  0x00000823, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_FORDE,    CHARACTER_NONE,     0x000007F4, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_KYLE,     CHARACTER_FORDE,    0x00000829, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_KYLE,     CHARACTER_SYRENE,   0x00000837, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_KYLE,     CHARACTER_LUTE,     0x00000827, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_KYLE,     CHARACTER_NONE,     0x000007F6, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_TANA,     CHARACTER_CORMAG,   0x0000082A, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_TANA,     CHARACTER_NONE,     0x00000816, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_INNES,    CHARACTER_LARACHEL, 0x0000082B, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_INNES,    CHARACTER_VANESSA,  0x00000822, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_INNES,    CHARACTER_NONE,     0x000007EA, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_SYRENE,   CHARACTER_VANESSA,  0x00000835, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_SYRENE,   CHARACTER_NONE,     0x00000814, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_AMELIA,   CHARACTER_NONE,     0x000007F8, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_DUESSEL,  CHARACTER_AMELIA,   0x00000838, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_DUESSEL,  CHARACTER_NONE,     0x0000080C, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_KNOLL,    CHARACTER_NONE,     0x00000810, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_CORMAG,   CHARACTER_NONE,     0x000007F0, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_LARACHEL, CHARACTER_DOZLA,    0x00000831, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_LARACHEL, CHARACTER_NONE,     0x00000806, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_DOZLA,    CHARACTER_NONE,     0x00000808, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_RENNAC,   CHARACTER_NONE,     0x0000080A, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_GERIK,    CHARACTER_TETHYS,   0x0000082C, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_GERIK,    CHARACTER_MARISA,   0x0000082D, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_GERIK,    CHARACTER_NONE,     0x000007FC, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_TETHYS,   CHARACTER_NONE,     0x000007FE, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EWAN,     CHARACTER_AMELIA,   0x00000833, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_EWAN,     CHARACTER_NONE,     0x00000804, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_MARISA,   CHARACTER_NONE,     0x00000800, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_SALEH,    CHARACTER_EWAN,     0x0000082F, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_SALEH,    CHARACTER_NONE,     0x00000802, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_MYRRH,    CHARACTER_SALEH,    0x0000082E, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_MYRRH,    CHARACTER_NONE,     0x0000080E, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_SETH,     0x00000818, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_SALEH,    0x00000819, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_TANA,     0x0000081A, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_FORDE,    0x0000081B, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EIRIKA,   CHARACTER_INNES,    0x00000836, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_EIRIKA,   CHARACTER_NONE,     0x000007D6, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EPHRAIM,  CHARACTER_EIRIKA,   0x00000817, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EPHRAIM,  CHARACTER_MYRRH,    0x0000081C, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EPHRAIM,  CHARACTER_LARACHEL, 0x0000081D, },
    { CHARACTER_ENDING_PAIRED, CHARACTER_EPHRAIM,  CHARACTER_TANA,     0x0000081E, },
    { CHARACTER_ENDING_SOLO,   CHARACTER_EPHRAIM,  CHARACTER_NONE,     0x000007F2, },

    { CHARACTER_ENDING_NONE },
};

struct CharacterEndingEnt* CONST_DATA gCharacterEndingsByRoute[] = {
    gCharacterEndings_Eirika,
    gCharacterEndings_Ephraim,
};

struct EndingTitleEnt CONST_DATA gCharacterEndingTitleLut[] = {
    { CHARACTER_SETH,     0x000007D7 },
    { CHARACTER_FRANZ,    0x000007DB },
    { CHARACTER_GILLIAM,  0x000007D9 },
    { CHARACTER_MOULDER,  0x000007DD },
    { CHARACTER_VANESSA,  0x000007DF },
    { CHARACTER_ROSS,     0x000007E1 },
    { CHARACTER_GARCIA,   0x000007E7 },
    { CHARACTER_COLM,     0x000007E5 },
    { CHARACTER_NEIMI,    0x000007E3 },
    { CHARACTER_ARTUR,    0x000007F9 },
    { CHARACTER_LUTE,     0x000007EB },
    { CHARACTER_JOSHUA,   0x00000811 },
    { CHARACTER_NATASHA,  0x000007ED },
    { CHARACTER_FORDE,    0x000007F3 },
    { CHARACTER_KYLE,     0x000007F5 },
    { CHARACTER_TANA,     0x00000815 },
    { CHARACTER_INNES,    0x000007E9 },
    { CHARACTER_SYRENE,   0x00000813 },
    { CHARACTER_AMELIA,   0x000007F7 },
    { CHARACTER_DUESSEL,  0x0000080B },
    { CHARACTER_KNOLL,    0x0000080F },
    { CHARACTER_CORMAG,   0x000007EF },
    { CHARACTER_LARACHEL, 0x00000805 },
    { CHARACTER_DOZLA,    0x00000807 },
    { CHARACTER_RENNAC,   0x00000809 },
    { CHARACTER_GERIK,    0x000007FB },
    { CHARACTER_TETHYS,   0x000007FD },
    { CHARACTER_EWAN,     0x00000803 },
    { CHARACTER_MARISA,   0x000007FF },
    { CHARACTER_SALEH,    0x00000801 },
    { CHARACTER_MYRRH,    0x0000080D },
    { CHARACTER_EPHRAIM,  0x000007F1 },
    { CHARACTER_EIRIKA,   0x000007D5 },

    { CHARACTER_NONE },
};

struct EndingDefeatEnt CONST_DATA gCharacterEndingDefeatLut[] = {
    { CHARACTER_EIRIKA,   DEFEAT_DIED,             },
    { CHARACTER_EPHRAIM,  DEFEAT_DIED,             },
    { CHARACTER_SETH,     DEFEAT_WOUNDED_REMAINED, },
    { CHARACTER_FRANZ,    DEFEAT_DIED,             },
    { CHARACTER_GILLIAM,  DEFEAT_DIED,             },
    { CHARACTER_MOULDER,  DEFEAT_DIED,             },
    { CHARACTER_VANESSA,  DEFEAT_DIED,             },
    { CHARACTER_ROSS,     DEFEAT_DIED,             },
    { CHARACTER_GARCIA,   DEFEAT_DIED,             },
    { CHARACTER_COLM,     DEFEAT_DIED,             },
    { CHARACTER_NEIMI,    DEFEAT_DIED,             },
    { CHARACTER_ARTUR,    DEFEAT_DIED,             },
    { CHARACTER_LUTE,     DEFEAT_DIED,             },
    { CHARACTER_JOSHUA,   DEFEAT_DIED,             },
    { CHARACTER_NATASHA,  DEFEAT_DIED,             },
    { CHARACTER_FORDE,    DEFEAT_DIED,             },
    { CHARACTER_KYLE,     DEFEAT_DIED,             },
    { CHARACTER_TANA,     DEFEAT_DIED,             },
    { CHARACTER_INNES,    DEFEAT_WOUNDED_REMAINED, },
    { CHARACTER_SYRENE,   DEFEAT_DIED,             },
    { CHARACTER_AMELIA,   DEFEAT_DIED,             },
    { CHARACTER_DUESSEL,  DEFEAT_DIED,             },
    { CHARACTER_KNOLL,    DEFEAT_DIED,             },
    { CHARACTER_CORMAG,   DEFEAT_DIED,             },
    { CHARACTER_LARACHEL, DEFEAT_WOUNDED_REMAINED, },
    { CHARACTER_DOZLA,    DEFEAT_DIED,             },
    { CHARACTER_RENNAC,   DEFEAT_DIED,             },
    { CHARACTER_GERIK,    DEFEAT_DIED,             },
    { CHARACTER_TETHYS,   DEFEAT_DIED,             },
    { CHARACTER_EWAN,     DEFEAT_DIED,             },
    { CHARACTER_MARISA,   DEFEAT_DIED,             },
    { CHARACTER_SALEH,    DEFEAT_DIED,             },
    { CHARACTER_MYRRH,    DEFEAT_WOUNDED_REMAINED, },

    { CHARACTER_NONE },
};

extern u16 gUnknown_02000FA0[];
extern u16 gUnknown_020017A0[];
extern u16 gUnknown_02001FA0[];

u16* CONST_DATA gUnknown_08A3D348[] = {
    (u16*) Pal_020007A0,
    gUnknown_02000FA0,
    gUnknown_020017A0,
    gUnknown_02001FA0,
};

extern struct Text gUnknown_020027A0[];
struct Text* gUnknown_08A3D358 = gUnknown_020027A0;

// forward declarations
void StartSoloEndingBattleDisplay(struct CharacterEndingEnt*, struct Unit*, struct CharacterEndingProc*);
void StartPairedEndingBattleDisplay(struct CharacterEndingEnt*, struct Unit*, struct Unit*, struct CharacterEndingProc*);
void StartEndingBattleText(struct CharacterEndingEnt*, struct Unit*, struct Unit*, struct CharacterEndingProc*);
void EndEndingBattleText(void);

//! FE8U = 0x080B6674
char* PrepareUnitDefeatLocationString(u16 textIdA, u16 defeatedChapter, u16 textIdB, char* str) {
    const char* locationStr;

    u8 count = 0;

    str = AppendTextBuffer_80AEABC(GetStringFromIndex(textIdA), str);
    str = AppendCharAndTerminate(1, str);

    if (defeatedChapter & 0x8000) {
        defeatedChapter &= 0x7FFF;
        locationStr = GetWorldMapNodeName(defeatedChapter);
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

    str = AppendTextBuffer_80AEABC(locationStr, str);

    str = AppendTextBuffer_80AEABC(GetStringFromIndex(textIdB) + count, str);

    return str;
}

//! FE8U = 0x080B6720
int GetPidTitleTextId(int pid) {
    struct EndingTitleEnt* ent;

    for (ent = gCharacterEndingTitleLut; ent->pid != 0; ent++) {
        if (ent->pid == pid) {
            return ent->titleTextId;
        }
    }

    return 0;
}

//! FE8U = 0x080B6744
int GetPidDefeatType(int pid) {
    struct EndingDefeatEnt* ent;

    for (ent = gCharacterEndingDefeatLut; ent->pid != 0; ent++) {
        if (ent->pid == pid) {
            return ent->defeatType;
        }
    }

    return 0;
}

//! FE8U = 0x080B6768
char* GetPidDefeatedEndingString(int pid) {
    struct UnitUsageStats* bwl;
    int defeatDetails;

    char* str = gUnknown_08A3CD64;

    int type = GetPidDefeatType(pid);

    if (type == DEFEAT_TYPE_4) {
        CheckPermanentFlag(0x7d);
        pid = 0x100;
    }

    bwl = GetPidStats(pid);
    defeatDetails = bwl->deathLoc | (bwl->deathSkirm << 0xf);

    switch (type) {
        case DEFEAT_DIED: // "Died at <xyz>."
            PrepareUnitDefeatLocationString(0x7D1, defeatDetails, 0x22, str);
            break;

        case DEFEAT_WOUNDED_REMAINED: // Wounded at <xyz>, but remained until the end."
            PrepareUnitDefeatLocationString(0x7D3, defeatDetails, 0x7D4, str);
            break;

        case DEFEAT_TYPE_5:
            return NULL;
    }

    return gUnknown_08A3CD64;
}

//! FE8U = 0x080B67E8
void SetupCharacterEndingGfx(void) {
    Decompress(gGfx_CharacterEndingMenu, (void *)0x06004C00);
    Decompress(Img_CommGameBgScreen, (void *)0x06008000);
    return;
}

//! FE8U = 0x080B6810
void sub_80B6810(void) {
    int offset;
    int i;
    u16 * tm;

    ApplyPalettes(gPal_CharacterEndingMenu, 0xC, 2);
    ApplyPalettes(Pal_CommGameBgScreenInShop, 0xE, 2);

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

    ResetText();

    for (i = 0; i < 2; i++) {
        InitText(gUnknown_08A3D358 + 5 + i, 15);
        InitText(gUnknown_08A3D358 + 7 + i, 10);
    }

    for (i = 0; i < 5; i++) {
        InitText(gUnknown_08A3D358 + i, 26);
    }

    return;
}

//! FE8U = 0x080B696C
void CharacterEnding_Init(struct CharacterEndingProc* proc) {
    SetupBackgrounds(NULL);
    ResetFaces();
    SetupCharacterEndingGfx();
    SetDefaultColorEffects();

    proc->unk_2e = 0;

    CpuFill16(0, proc->unk_40, sizeof(proc->unk_40));

    switch (gPlaySt.chapterModeIndex) {
        case CHAPTER_MODE_COMMON:
        case CHAPTER_MODE_EIRIKA:
            proc->unk_30 = gCharacterEndingsByRoute[0];
            break;

        case CHAPTER_MODE_EPHRAIM:
            proc->unk_30 = gCharacterEndingsByRoute[1];
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

    EndEndingBattleText();
    sub_80B6810();

    BG_EnableSyncByMask(7);

    return;
}

//! FE8U = 0x080B6A10
struct Unit* sub_80B6A10(int pid) {
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
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
int GetUnitASupporterPid(struct Unit* unit) {
    int i;

    if (unit == NULL) {
        return 0;
    }

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++) {
        if (GetUnitSupportLevel(unit, i) == SUPPORT_LEVEL_A) {
            return GetUnitSupporterCharacter(unit, i);
        }
    }

    return 0;
}

//! FE8U = 0x080B6A80
s8 DoesUnitHavePairedEnding(struct CharacterEndingEnt* pairingEnt, struct Unit* unit) {
    int pidA = unit->pCharacterData->number;
    int pidB = GetUnitASupporterPid(unit);

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
void LoadNextCharacterEnding(struct CharacterEndingProc* proc) {
    proc->unitB = NULL;
    proc->unitA = NULL;

    for (;; proc->unk_30++) {
        if (proc->unk_30->type == CHARACTER_ENDING_NONE) {
            Proc_Goto(proc, 100);
            return;
        }

        if ((*&proc->unk_40[proc->unk_30->pidA >> 5] >> (proc->unk_30->pidA & 0x1f)) & 1) {
            continue;
        }

        if (proc->unk_30->pidB != 0) {
            if ((*&proc->unk_40[proc->unk_30->pidB >> 5] >> (proc->unk_30->pidB & 0x1f)) & 1) {
                continue;
            }
        }

        proc->unitA = sub_80B6A10(proc->unk_30->pidA);

        if (proc->unitA == NULL) {
            continue;
        }

        switch (proc->unk_30->type) {
            case CHARACTER_ENDING_SOLO:
                if (DoesUnitHavePairedEnding(proc->unk_34, proc->unitA)) {
                    continue;
                }

                break;

            case CHARACTER_ENDING_PAIRED:
                proc->unitB = sub_80B6A10(proc->unk_30->pidB);

                if (proc->unitB == NULL) {
                    continue;
                }

                if (GetUnitASupporterPid(proc->unitA) != proc->unk_30->pidB) {
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

        *&proc->unk_40[(proc->unk_30->pidA >> 5)] |= 1 << (proc->unk_30->pidA & 0x1f);

        if (proc->unk_30->pidB == 0) {
            return;
        }

        *&proc->unk_40[proc->unk_30->pidB >> 5] |= 1 << (proc->unk_30->pidB & 0x1f);

        return;
    }
}

//! FE8U = 0x080B6BD8
void CharacterEnding_StartBattleDisplay(struct CharacterEndingProc* proc) {

    switch (proc->unk_30->type) {
        case CHARACTER_ENDING_SOLO:
            StartSoloEndingBattleDisplay(proc->unk_30, proc->unitA, proc);
            break;

        case CHARACTER_ENDING_PAIRED:
            StartPairedEndingBattleDisplay(proc->unk_30, proc->unitA, proc->unitB, proc);
            break;
    }

    return;
}

//! FE8U = 0x080B6C00
void CharacterEnding_StartBattleDisplayText(struct CharacterEndingProc* proc) {
    StartEndingBattleText(proc->unk_30, proc->unitA, proc->unitB, proc);
    return;
}

//! FE8U = 0x080B6C14
void CharacterEnding_End(void) {
    SetupBackgrounds(NULL);
    ResetDialogueScreen();
    EndEndingBattleText();

    SetBlendConfig(3, 0, 0, 0x10);

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
void CharacterEnding_Unused_80B6C74(struct CharacterEndingProc* proc) {
    proc->unk_30++;

    if (proc->unk_30->type == CHARACTER_ENDING_NONE) {
        Proc_Goto(proc, 100);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_CharacterEndings[] = {
    PROC_SLEEP(0),
    PROC_CALL(CharacterEnding_Init),
    PROC_CALL(LoadNextCharacterEnding),

PROC_LABEL(0),
    PROC_CALL(sub_80B69D4),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),

    PROC_CALL(CharacterEnding_StartBattleDisplay),

    PROC_SLEEP(30),
    PROC_CALL(CharacterEnding_StartBattleDisplayText),
    PROC_SLEEP(114),

PROC_LABEL(99),
    PROC_CALL(LoadNextCharacterEnding),

    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),

    PROC_GOTO(0),

PROC_LABEL(100),
    PROC_CALL_ARG(_FadeBgmOut, 7),

    PROC_CALL_ARG(NewFadeOut, 2),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(CharacterEnding_End),

    PROC_END,
};

//! FE8U = 0x080B6C94
void StartCharacterEndings(ProcPtr parent) {
    Proc_StartBlocking(gProcScr_CharacterEndings, parent);
    return;
}

//! FE8U = 0x080B6CA8
void sub_80B6CA8(struct EndingBattleDisplayProc* proc) {
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
void SoloEndingBattleDisp_Init(struct EndingBattleDisplayProc* proc) {
    const char* str;

    sub_80B6920();

    sub_80B6CA8(proc);

    BG_Fill(gUnknown_08A3D348[0], 0);
    BG_Fill(gUnknown_08A3D348[1], 0);
    BG_Fill(gUnknown_08A3D348[2], 0);

    Decompress(gTsa_SoloEndingWindow, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_08A3D348[2], gGenericBuffer, 0x0000C260);

    Decompress(gTsa_SoloEndingNameplate, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_08A3D348[1], gGenericBuffer, 0x0000C260);

    str = GetStringFromIndex(GetPidTitleTextId(proc->pCharacterEnding->pidA));

    PutDrawText(gUnknown_08A3D358 + 5, gUnknown_08A3D348[0] + 0x61, 0, GetStringTextCenteredPos(0x78, str), 0, str);

    PutDrawText(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x31, 3, 0, 0, GetStringFromIndex(0x51F));
    PutDrawText(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x31, 3, 0x20, 0, GetStringFromIndex(0x520));
    PutDrawText(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x31, 3, 0x40, 0, GetStringFromIndex(0x521));

    PutNumber(gUnknown_08A3D348[0] + 0x31 + CountDigits(proc->battleAmounts[0]), 2, proc->battleAmounts[0]);
    PutNumber(gUnknown_08A3D348[0] + 0x35 + CountDigits(proc->winAmounts[0]), 2, proc->winAmounts[0]);
    PutNumber(gUnknown_08A3D348[0] + 0x39 + CountDigits(proc->lossAmounts[0]), 2, proc->lossAmounts[0]);

    StartFace2(0, gCharacterData[proc->pCharacterEnding->pidA - 1].portraitId, 0x1a0, 0x38, 0x502);

    if (proc->units[0]->state & US_DEAD) {
        ArchivePalette(0x16);
        WriteFadedPaletteFromArchive(0xc0, 0xc0, 0xc0, 0x400000);
    }

    proc->unk_34 = 0;
    SetDefaultColorEffects();

    return;
}

u8 CONST_DATA gUnknown_08A3D40C[] = {
    0x00, 0x03, 0x06, 0x08, 0x0A,
    0x0C, 0x0E, 0x10, 0x12, 0x14,
    0x15, 0x16, 0x17, 0x18, 0x19,
    0x1A, 0x1B, 0x1C, 0x1D, 0x1E,
};

//! FE8U = 0x080B6ED0
void SoloEndingBattleDisp_Loop(struct EndingBattleDisplayProc* proc) {
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

struct ProcCmd CONST_DATA gProcScr_EndingBattleDisplay_Solo[] = {
    PROC_SLEEP(0),
    PROC_CALL(SoloEndingBattleDisp_Init),

    PROC_REPEAT(SoloEndingBattleDisp_Loop),

    PROC_END,
};

//! FE8U = 0x080B6F14
void StartSoloEndingBattleDisplay(struct CharacterEndingEnt* endingEnt, struct Unit* unit, struct CharacterEndingProc* parent) {
    struct EndingBattleDisplayProc* proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Solo, parent);

    proc->units[0] = unit;
    proc->units[1] = NULL;

    proc->pCharacterEnding = endingEnt;

    return;
}

//! FE8U = 0x080B6F34
void sub_80B6F34(struct EndingBattleDisplayProc* proc) {
    const char* str;

    sub_80B6920();

    sub_80B6CA8(proc);

    BG_Fill(gUnknown_08A3D348[0], 0);
    BG_Fill(gUnknown_08A3D348[1], 0);
    BG_Fill(gUnknown_08A3D348[2], 0);

    Decompress(gTsa_PairedEndingWindow, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_08A3D348[2], gGenericBuffer, 0x0000C260);

    Decompress(gTsa_PairedEndingNameplates, gGenericBuffer);
    CallARM_FillTileRect(gUnknown_08A3D348[1], gGenericBuffer, 0x0000C260);

    str = GetStringFromIndex(GetPidTitleTextId(proc->pCharacterEnding->pidA));

    PutDrawText(gUnknown_08A3D358 + 5, gUnknown_08A3D348[0] + 0x61, 0, GetStringTextCenteredPos(0x78, str), 0, str);

    PutDrawText(gUnknown_08A3D358 + 7, gUnknown_08A3D348[0] + 0x31, 3, 0, 0, GetStringFromIndex(0x51F));
    PutDrawText(gUnknown_08A3D358 + 7, gUnknown_08A3D348[0] + 0x31, 3, 0x20, 0, GetStringFromIndex(0x520));
    PutDrawText(gUnknown_08A3D358 + 7, gUnknown_08A3D348[0] + 0x31, 3, 0x40, 0, GetStringFromIndex(0x521));

    PutNumber(gUnknown_08A3D348[0] + 0x31 + CountDigits(proc->battleAmounts[0]), 2, proc->battleAmounts[0]);
    PutNumber(gUnknown_08A3D348[0] + 0x35 + CountDigits(proc->winAmounts[0]), 2, proc->winAmounts[0]);
    PutNumber(gUnknown_08A3D348[0] + 0x39 + CountDigits(proc->lossAmounts[0]), 2, proc->lossAmounts[0]);

    str = GetStringFromIndex(GetPidTitleTextId(proc->pCharacterEnding->pidB));
    PutDrawText(gUnknown_08A3D358 + 6, gUnknown_08A3D348[0] + 0x22E, 0, GetStringTextCenteredPos(0x78, str), 0, str);

    PutDrawText(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x221, 3, 0, 0, GetStringFromIndex(0x51F));
    PutDrawText(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x221, 3, 0x20, 0, GetStringFromIndex(0x520));
    PutDrawText(gUnknown_08A3D358 + 8, gUnknown_08A3D348[0] + 0x221, 3, 0x40, 0, GetStringFromIndex(0x521));

    PutNumber(gUnknown_08A3D348[0] + 0x221 + CountDigits(proc->battleAmounts[1]), 2, proc->battleAmounts[1]);
    PutNumber(gUnknown_08A3D348[0] + 0x225 + CountDigits(proc->winAmounts[1]), 2, proc->winAmounts[1]);
    PutNumber(gUnknown_08A3D348[0] + 0x229 + CountDigits(proc->lossAmounts[1]), 2, proc->lossAmounts[1]);

    proc->unk_34 = 0;

    SetDefaultColorEffects();

    StartFace2(0, gCharacterData[proc->pCharacterEnding->pidA - 1].portraitId, 0x130, 0x30, 0x503);
    StartFace2(1, gCharacterData[proc->pCharacterEnding->pidB - 1].portraitId, 0x1a0, 0x30, 0x502);

    return;
}

//! FE8U = 0x080B71DC
void sub_80B71DC(struct EndingBattleDisplayProc* proc) {
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
void sub_80B723C(struct EndingBattleDisplayProc* proc) {
    proc->unk_34 = 0;

    SetBlendConfig(1, 0x10, 0, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);

    return;
}

//! FE8U = 0x080B7274
void sub_80B7274(struct EndingBattleDisplayProc* proc) {
    int var = proc->unk_34 >> 2;

    proc->unk_34++;

    SetBlendConfig(1, 0x10 - var, var, 0);

    if (var == 8) {
        Proc_Break(proc);
    }
    return;
}

struct ProcCmd CONST_DATA gProcScr_EndingBattleDisplay_Paired[] = {
    PROC_SLEEP(0),

    PROC_CALL(sub_80B6F34),
    PROC_REPEAT(sub_80B71DC),

    PROC_SLEEP(16),

    PROC_CALL(sub_80B723C),
    PROC_REPEAT(sub_80B7274),

    PROC_END,
};

//! FE8U = 0x080B72A4
void StartPairedEndingBattleDisplay(struct CharacterEndingEnt* endingEnt, struct Unit* unitA, struct Unit* unitB, struct CharacterEndingProc* parent) {
    struct EndingBattleDisplayProc* proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Paired, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    proc->pCharacterEnding = endingEnt;

    return;
}

//! FE8U = 0x080B72C4
void EndingBattleInitText(struct EndingBattleTextProc* proc) {
    int i;

    proc->Text = gUnknown_08A3D358;

    proc->defaultPauseDelay = 4;
    proc->pauseTimer = 4;

    Text_SetCursor(proc->Text, 0);
    Text_SetColor(proc->Text, 0);

    for (i = 0; i < 5; i++) {
        int offset = 0xc0 + i * 0x40;

        ClearText(gUnknown_08A3D358 + i);
        PutText(gUnknown_08A3D358 + i, gBG0TilemapBuffer + 2 + offset);
    }

    BG_EnableSyncByMask(1);

    if (proc->unitA->state & US_DEAD) {
        proc->str = GetPidDefeatedEndingString(proc->unitA->pCharacterData->number);

        if (proc->str != 0) {
            return;
        }
    }

    proc->str = GetStringFromIndex(proc->pCharacterEnding->textId);

    return;
}

//! FE8U = 0x080B734C
void EndingBattleText_Loop(struct EndingBattleTextProc* proc) {
    if ((gKeyStatusPtr->newKeys & START_BUTTON) && (CheckGameEndFlag() != 0)) {
        Proc_Break(proc);
        Proc_Goto(proc->proc_parent, 100);
        return;
    }

    if (proc->pauseTimer != 0) {
        proc->pauseTimer--;
        return;
    }

    SetTextFont(NULL);

    switch (*proc->str) {
        case 0x00: // [X]
            Proc_Break(proc);
            break;

        case 0x01: // [NL]
            proc->str++;
            proc->Text++;
            proc->pauseTimer += 16;

            Text_SetCursor(proc->Text, 0);
            Text_SetColor(proc->Text, 0);

            break;

        case 0x04: // [....]
            proc->pauseTimer = 8;
            proc->str++;

            break;

        case 0x05: // [.....]
            proc->pauseTimer = 16;
            proc->str++;

            break;

        case 0x06: // [......]
            proc->pauseTimer = 32;
            proc->str++;

            break;

        case 0x07: // [.......]
            proc->pauseTimer = 64;
            proc->str++;

            break;

        case 0x02: // [NL2]
        case 0x03: // [A]
        default:
            proc->str = Text_DrawCharacter(proc->Text, proc->str);
    }

    // TODO: Is this a bug? Seems to overwrite any pauses with the default delay of 4 frames...
    proc->pauseTimer = proc->defaultPauseDelay;

    return;
}

struct ProcCmd CONST_DATA gProcScr_EndingBattleDisplay_Text[] = {
    PROC_SLEEP(0),
    PROC_CALL(EndingBattleInitText),
    PROC_REPEAT(EndingBattleText_Loop),

    PROC_END,
};

//! FE8U = 0x080B742C
void StartEndingBattleText(struct CharacterEndingEnt* pairingEnt, struct Unit* unitA, struct Unit* unitB, struct CharacterEndingProc* parent) {
    struct EndingBattleTextProc* proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Text, parent);
    proc->pCharacterEnding = pairingEnt;
    proc->unitA = unitA;
    proc->unitB = unitB;

    return;
}

//! FE8U = 0x080B744C
void EndEndingBattleText(void) {
    Proc_EndEach(gProcScr_EndingBattleDisplay_Text);
    return;
}

//! FE8U = 0x080B745C
void SetupFinScreenGfx(void) {
    ApplyPalette(gPal_FinScreen, 0xE);

    Decompress(gGfx_FinScreen, (void *)0x06001000);

    Decompress(gTsa_FinScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x0000E080);

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x080B74B0
void Fin_Init(struct FinScreenProc* proc) {
    proc->unk_4c = 0;
    proc->unk_58 = 0;

    SetupBackgrounds(0);

    SetupFinScreenGfx();

    StartBgmFadeIn(0x56, 7, 0);
    SetDefaultColorEffects();

    return;
}

//! FE8U = 0x080B74D8
void Fin_Loop_KeyListener(struct FinScreenProc* proc) {
    proc->unk_58++;

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B7500
void sub_80B7500(struct FinScreenProc* proc) {
    SetBlendConfig(1, 0, 0x10, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    proc->unk_4c = 0;

    SetupFinScreenGfx();

    return;
}

//! FE8U = 0x080B7540
void sub_80B7540(struct FinScreenProc* proc) {
    int b;

    s16 a = proc->unk_4c;
    proc->unk_4c++;

    b = a >> 2;
    SetBlendConfig(1, b, 0x10, 0);

    if (b == 16) {
        Proc_Break(proc);
        proc->unk_4c = 0;
    }

    return;
}

//! FE8U = 0x080B7574
void Fin_End(void) {
    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    return;
}

struct ProcCmd CONST_DATA gProcScr_FinScreen[] = {
    PROC_SLEEP(30),

    PROC_CALL(Fin_Init),

    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),

PROC_LABEL(0),
    PROC_REPEAT(Fin_Loop_KeyListener),
    PROC_CALL_ARG(_FadeBgmOut, 4),

    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_SLEEP(60),

    PROC_GOTO(100),

PROC_LABEL(1),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),

    PROC_SLEEP(60),

    PROC_CALL(sub_80B7500),
    PROC_REPEAT(sub_80B7540),

    PROC_GOTO(0),

PROC_LABEL(100),
    PROC_CALL(Fin_End),

    PROC_END,
};

//! FE8U = 0x080B7598
void StartFinScreen(ProcPtr parent) {
    Proc_StartBlocking(gProcScr_FinScreen, parent);
    return;
}

// === TODO: File split here?

// Sprites
u16 CONST_DATA gUnknown_08A3D540[] = {
    5,
    0x4000, 0x8000, 0x0000,
    0x4000, 0x8020, 0x0004,
    0x4000, 0x8040, 0x0008,
    0x4000, 0x8060, 0x000C,
    0x8000, 0x0080, 0x0010,
};

u16 CONST_DATA gUnknown_08A3D560[] = {
    2,
    0x4000, 0x8000, 0x0040,
    0x4000, 0x8020, 0x0044,
};

u16 CONST_DATA gUnknown_08A3D56E[] = {
    2,
    0x4000, 0x8000, 0x0048,
    0x4000, 0x8020, 0x004C,
};

u16 CONST_DATA gUnknown_08A3D57C[] = {
    2,
    0x4000, 0x8000, 0x0050,
    0x4000, 0x8020, 0x0054,
};

u16 CONST_DATA gUnknown_08A3D58A[] = {
    2,
    0x4000, 0x8000, 0x0058,
    0x4000, 0x8020, 0x005C,
};

u16 CONST_DATA gUnknown_08A3D598[] = {
    2,
    0x4000, 0x8000, 0x0088,
    0x4000, 0x8020, 0x008C,
};

u16 CONST_DATA gUnknown_08A3D5A6[] = {
    2,
    0x4000, 0x8000, 0x0080,
    0x4000, 0x8020, 0x0084,
};

u16 CONST_DATA gUnknown_08A3D5B4[] = {
    2,
    0x4000, 0x4000, 0x001B,
    0x0000, 0x0020, 0x001F,
};

u16 CONST_DATA gSprite_08A3D5C2[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xC0),
};

u16 CONST_DATA gSprite_08A3D5CA[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xC4),
};

u16 CONST_DATA gSprite_08A3D5D2[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xC8),
};

u16 CONST_DATA gSprite_08A3D5DA[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xCC),
};

u16 CONST_DATA gSprite_08A3D5E2[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xD0),
};

u16 CONST_DATA gSprite_08A3D5EA[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xD4),
};

u16 CONST_DATA gSprite_08A3D5F2[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x140),
};

u16 CONST_DATA gSprite_08A3D5FA[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x144),
};

u16 CONST_DATA gSprite_08A3D602[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x148),
};

u16 CONST_DATA gSprite_08A3D60A[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x14C),
};

u16 CONST_DATA gSprite_08A3D612[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x150),
};

u16 CONST_DATA gSprite_08A3D61A[] = {
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x154),
};

u16* CONST_DATA gUnknown_08A3D624[] = {
    gSprite_08A3D5EA,
    gSprite_08A3D5E2,
    gSprite_08A3D5DA,
    gSprite_08A3D5D2,
    gSprite_08A3D5CA,
    gSprite_08A3D5C2,
};

u16* CONST_DATA gUnknown_08A3D63C[] = {
    gSprite_08A3D61A,
    gSprite_08A3D612,
    gSprite_08A3D60A,
    gSprite_08A3D602,
    gSprite_08A3D5FA,
    gSprite_08A3D5F2,
};

//! FE8U = 0x080B75AC
void sub_80B75AC(struct EndingTurnRecordProc* proc) {
    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    ApplyPalette(gUnknown_08A09A5C, 5);

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

struct ProcCmd CONST_DATA gProcScr_08A3D654[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_80B75AC),
    PROC_REPEAT(sub_80B7614),

    PROC_END,
};

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
    ResetText();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    ApplyPalettes(gUnknown_08A40AD4, 0xE, 2);
    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A40B14, 0xe000);

    BG_EnableSyncByMask(8);

    return;
}

struct Text* CONST_DATA gUnknown_08A3D674 = gUnknown_020027A0;

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
        InitText(gUnknown_08A3D674 + i, 5);
        InitText(gUnknown_08A3D674 + 9 + i, 13);
    }

    InitText(gUnknown_08A3D674 + 18, 4);
    InitText(gUnknown_08A3D674 + 19, 2);

    Text_DrawString(gUnknown_08A3D674 + 18, GetStringFromIndex(0x15D));

    Text_SetColor(gUnknown_08A3D674 + 19, 3);
    Text_DrawString(gUnknown_08A3D674 + 19, GetStringFromIndex(0x157));

    return;
}

//! FE8U = 0x080B7800
int sub_80B7800(struct ChapterStats* param_1, int param_2) {
    int var = 3;
    int r4;
    int r6;
    int r7;
    int uVar10;
    int r9;
    int sl;
    int sp0C;
    s8 sp10 = 0;

    sp0C = param_2 % 9;
    r7 = (param_2 * 2) & 0x1f;
    r6 = r7 * 0x20;

    TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, r7), 0x1f, 1, 0);
    BG_EnableSyncByMask(2);

    ClearText(gUnknown_08A3D674 + sp0C);
    ClearText(gUnknown_08A3D674 + 9 + sp0C);

    if ((u32)param_1 == -1) {
        r4 = GetGameTotalTurnCount();

        PutDrawText(gUnknown_08A3D674 + 9 + sp0C, gBG1TilemapBuffer + ({r6 + 0xC;}), 3, 0, 0, GetStringFromIndex(0x15f));
        PutNumber(gBG1TilemapBuffer + ({r6 + 0x17;}), 2, r4);
        PutText(gUnknown_08A3D674 + 18, gBG1TilemapBuffer + ({r6 + 0x18;}));

        return 0;
    }

    if (param_1) {
        sl = param_1->chapter_index;
        r9 = GetROMChapterStruct(sl)->prepScreenNumber >> 1;
        switch (sl) {
            case 0:
                PutDrawText(gUnknown_08A3D674 + sp0C, gBG1TilemapBuffer + TILEMAP_INDEX(var, r7), 3, 0, 0, GetStringFromIndex(0x15a)); // TODO: msgid "Prologue"
                break;

            case 21:
            case 22:
            case 34:
            case 35:
                PutDrawText(gUnknown_08A3D674 + sp0C, gBG1TilemapBuffer + TILEMAP_INDEX(var, r7), 3, 0, 0, GetStringFromIndex(0x159)); // TODO: msgid "Final[.]"
                break;

            case 5:
                PutText(gUnknown_08A3D674 + 0x13, gBG1TilemapBuffer + TILEMAP_INDEX(var, r7));
                PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(CountDigits(r9) + (1  + var), r7), 2, r9);
                PutDrawText(gUnknown_08A3D674 + sp0C, gBG1TilemapBuffer + TILEMAP_INDEX(CountDigits(r9) + (2 + var), r7), 2, 0, 0, GetStringFromIndex(0x158));
                break;

            default:
                PutDrawText(gUnknown_08A3D674 + sp0C, gBG1TilemapBuffer + TILEMAP_INDEX(var, r7), 3, 0, 0, GetStringFromIndex(0x0157));
                PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(CountDigits(r9) + (1 + var), r7), 2, r9);
                break;
        }

        switch (sl) {
            case 21:
            case 22:
            case 34:
            case 35:
                uVar10 = param_1->chapter_turn;
                ++param_1;
                uVar10 += param_1->chapter_turn;
                sp10 = 1;
                break;

            default:
                uVar10 = param_1->chapter_turn;
                break;
        }

        PutDrawText(gUnknown_08A3D674 + 9 + sp0C, gBG1TilemapBuffer + TILEMAP_INDEX(5 + var, r7), 0, 0, 0, GetStringFromIndex(GetROMChapterStruct(sl)->chapTitleTextId));
        PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(0x14 + var, r7), 2, uVar10);
        PutText(gUnknown_08A3D674 + 18, gBG1TilemapBuffer + TILEMAP_INDEX(0x15 + var, r7));
    }

    return sp10;
}

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

//! FE8U = 0x080B7BD8
void sub_80B7BD8(struct UnkProc* proc) {
    int i;

    PutSpriteExt(2, 0x18, 0x14, gUnknown_08A3D540, 0x9480);
    PutSpriteExt(2, 0x10, 0x80, gUnknown_08A3D5B4, 0x6480);

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP) {
        PutSpriteExt(2, 0x10, 0x38, gUnknown_08A3D560, 0x8480);
        PutSpriteExt(2, 0x80, 0x38, gUnknown_08A3D56E, 0x8480);
        PutSpriteExt(2, 0x10, 0x58, gUnknown_08A3D58A, 0x8480);
        PutSpriteExt(2, 0x80, 0x58, gUnknown_08A3D5A6, 0x7480);

        for (i = 0; i < 3; i++) {
            if (proc->unk_4c[i] > 0x10) {
                SetObjAffine(
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
            SetObjAffine(
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
                SetObjAffine(
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
            SetObjAffine(
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

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);
    SetBlendConfig(1, 6, 0x10, 0);

    Decompress(Img_SaveMenuBG, (void *)(GetBackgroundTileDataOffset(3) + 0x6000000));
    ApplyPalettes(Pal_SaveMenuBG, 8, 8);
    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_SaveMenuBG, 0x8000);

    Decompress(Img_MainMenuBgFog, (void *)(GetBackgroundTileDataOffset(2) + 0x06004C00));
    Decompress(Tsa_MainMenuBgFog, gGenericBuffer);
    ApplyPalette(Pal_MainMenuBgFog, 7);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x00007260);

    BG_EnableSyncByMask(0xc);
    sub_80AB760(gUnk_02000000);
    StartBgm(0x46, 0);

    return;
}

//! FE8U = 0x080B8168
int sub_80B8168(void) {
    sub_80AB77C();
    // return; // BUG
}

struct ProcCmd CONST_DATA gProcScr_EndingTurnRecord[] = {
    PROC_SLEEP(0),
    PROC_CALL(sub_80B7648),

    PROC_CALL(sub_80B770C),
    PROC_CALL(sub_80B8014),

    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(sub_80B7B30),
    PROC_SLEEP(120),

    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(sub_80B8168),
    PROC_SLEEP(60),

    PROC_END,
};

//! FE8U = 0x080B8174
void StartEndingTurnRecordScreen(ProcPtr parent) {
    Proc_StartBlocking(gProcScr_EndingTurnRecord, parent);
    return;
}

//! FE8U = 0x080B8188
void sub_80B8188(int unusedA, int unusedB, int unusedC) {
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
void nullsub_5(int unused) {
    return;
}

//! FE8U = 0x080B8200
void sub_80B8200(void) {
    Sound_FadeOutBGM(4);
    return;
}
