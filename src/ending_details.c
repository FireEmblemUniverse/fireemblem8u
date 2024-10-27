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
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"

#include "ending_details.h"

#include "constants/characters.h"

EWRAM_OVERLAY(gameending) u16 gEndingDetailBuf[0x3D0] = {};
EWRAM_OVERLAY(gameending) u16 gEndingTmScratchA[0x800 / 2] = {};
EWRAM_OVERLAY(gameending) u16 gEndingTmScratchB[0x800 / 2] = {};
EWRAM_OVERLAY(gameending) u16 gEndingTmScratchC[0x800 / 2] = {};
EWRAM_OVERLAY(gameending) u16 gEndingTmScratchD[0x800 / 2] = {};
EWRAM_OVERLAY(gameending) struct Text gEndingDetailTexts[19] = {};

char * CONST_DATA gpDefeatedEndingLocString = (char *)gEndingTmScratchA;

struct CharacterEndingEnt CONST_DATA gCharacterEndings_Eirika[] =
{
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

struct CharacterEndingEnt CONST_DATA gCharacterEndings_Ephraim[] =
{
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

struct CharacterEndingEnt * CONST_DATA gCharacterEndingsByRoute[] =
{
    gCharacterEndings_Eirika,
    gCharacterEndings_Ephraim,
};

struct EndingTitleEnt CONST_DATA gCharacterEndingTitleLut[] =
{
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

struct EndingDefeatEnt CONST_DATA gCharacterEndingDefeatLut[] =
{
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

u16 * CONST_DATA gSoloEndingBattleDispConf[] =
{
    gEndingTmScratchA,
    gEndingTmScratchB,
    gEndingTmScratchC,
    gEndingTmScratchD,
};

extern struct Text gEndingDetailTexts[];
struct Text * CONST_DATA gUnknown_08A3D358 = gEndingDetailTexts;

// forward declarations
void StartSoloEndingBattleDisplay(struct CharacterEndingEnt *, struct Unit *, struct CharacterEndingProc *);
void StartPairedEndingBattleDisplay(struct CharacterEndingEnt *, struct Unit *, struct Unit *, struct CharacterEndingProc *);
void StartEndingBattleText(struct CharacterEndingEnt *, struct Unit *, struct Unit *, struct CharacterEndingProc *);
void EndEndingBattleText(void);

//! FE8U = 0x080B6674
char * PrepareUnitDefeatLocationString(u16 textIdA, u16 defeatedChapter, u16 textIdB, char * str)
{
    const char * locationStr;

    u8 count = 0;

    str = AppendString(GetStringFromIndex(textIdA), str);
    str = AppendCharacter(1, str);

    if (defeatedChapter & 0x8000)
    {
        defeatedChapter &= 0x7FFF;
        locationStr = GetWorldMapNodeName(defeatedChapter);
    }
    else
    {
        const s8 * it; // TODO: should this be char*?

        defeatedChapter &= 0x7FFF;

        for (it = GetStringFromIndex(GetROMChapterStruct(defeatedChapter)->chapTitleTextId); *it != CHFE_L_X; it++)
        {
            if (*it != '!')
            {
                continue;
            }

            if (*(it+1) != CHFE_L_X)
            {
                continue;
            }

            count++;
        }

        locationStr = GetStringFromIndex(GetROMChapterStruct(defeatedChapter)->chapTitleTextId);
    }

    str = AppendString(locationStr, str);

    str = AppendString(GetStringFromIndex(textIdB) + count, str);

    return str;
}

//! FE8U = 0x080B6720
int GetPidTitleTextId(int pid)
{
    struct EndingTitleEnt * ent;

    for (ent = gCharacterEndingTitleLut; ent->pid != 0; ent++)
    {
        if (ent->pid == pid)
        {
            return ent->titleTextId;
        }
    }

    return 0;
}

//! FE8U = 0x080B6744
int GetPidDefeatType(int pid)
{
    struct EndingDefeatEnt * ent;

    for (ent = gCharacterEndingDefeatLut; ent->pid != 0; ent++)
    {
        if (ent->pid == pid)
        {
            return ent->defeatType;
        }
    }

    return DEFEAT_DIED;
}

//! FE8U = 0x080B6768
char * GetPidDefeatedEndingString(int pid)
{
    struct UnitUsageStats * bwl;
    int defeatDetails;

    char * str = gpDefeatedEndingLocString;

    int type = GetPidDefeatType(pid);

    if (type == DEFEAT_TYPE_4)
    {
        CheckPermanentFlag(0x7d);
        pid = 0x100;
    }

    bwl = GetPidStats(pid);
    defeatDetails = bwl->deathLoc | (bwl->deathSkirm << 0xf);

    switch (type)
    {
        case DEFEAT_DIED: // "Died at <xyz>."
            PrepareUnitDefeatLocationString(0x7D1, defeatDetails, 0x22, str);
            break;

        case DEFEAT_WOUNDED_REMAINED: // Wounded at <xyz>, but remained until the end."
            PrepareUnitDefeatLocationString(0x7D3, defeatDetails, 0x7D4, str);
            break;

        case DEFEAT_TYPE_5:
            return NULL;
    }

    return gpDefeatedEndingLocString;
}

//! FE8U = 0x080B67E8
void SetupCharacterEndingGfx(void)
{
    Decompress(gGfx_CharacterEndingMenu, (void *)0x06004C00);
    Decompress(Img_CommGameBgScreen, (void *)0x06008000);
    return;
}

//! FE8U = 0x080B6810
void sub_80B6810(void)
{
    int offset;
    int i;
    u16 * tm;

    ApplyPalettes(gPal_CharacterEndingMenu, 0xC, 2);
    ApplyPalettes(Pal_CommGameBgScreenInShop, 0xE, 2);

    tm = gBG3TilemapBuffer;
    offset = (((0x8000 - (u32)GetBackgroundTileDataOffset(BG_3)) * 0x8000) >> 0x14) + 0xe000;

    for (i = 0; i < 0x280; i++) {
        *tm++ = i + offset;
    }

    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_08A3FFEC, 0xC260);
    CallARM_FillTileRect(gBG2TilemapBuffer + TILEMAP_INDEX(0, 18), gUnknown_08A40068, 0xC260);

    BG_EnableSyncByMask(BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080B689C
void sub_80B689C(int a, int b)
{
    BG_Fill(gBG1TilemapBuffer, 0);

    sub_80AC844(gSoloEndingBattleDispConf[2], 0, 1, BG_2, a, b + 2, 30, 16);
    sub_80AC844(gSoloEndingBattleDispConf[1], 0, 1, BG_1, a, b + 2, 30, 18);
    sub_80AC844(gSoloEndingBattleDispConf[0], 0, 0, BG_0, a, b, 30, 20);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080B6920
void sub_80B6920(void)
{
    int i;

    ResetText();

    for (i = 0; i < 2; i++)
    {
        InitText(gUnknown_08A3D358 + 5 + i, 15);
        InitText(gUnknown_08A3D358 + 7 + i, 10);
    }

    for (i = 0; i < 5; i++)
    {
        InitText(gUnknown_08A3D358 + i, 26);
    }

    return;
}

//! FE8U = 0x080B696C
void CharacterEnding_Init(struct CharacterEndingProc * proc)
{
    SetupBackgrounds(NULL);
    ResetFaces();
    SetupCharacterEndingGfx();
    SetDefaultColorEffects();

    proc->unk_2e = 0;

    CpuFill16(0, proc->unk_40, sizeof(proc->unk_40));

    switch (gPlaySt.chapterModeIndex)
    {
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
void sub_80B69D4(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    ResetDialogueScreen();

    EndEndingBattleText();
    sub_80B6810();

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080B6A10
struct Unit * sub_80B6A10(int pid)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number != pid)
        {
            continue;
        }

        if (unit->state & US_BIT16)
        {
            return NULL;
        }

        return unit;
    }

    return NULL;
}

//! FE8U = 0x080B6A4C
int GetUnitASupporterPid(struct Unit * unit)
{
    int i;

    if (unit == NULL)
    {
        return 0;
    }

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
    {
        if (GetUnitSupportLevel(unit, i) == SUPPORT_LEVEL_A)
        {
            return GetUnitSupporterCharacter(unit, i);
        }
    }

    return 0;
}

//! FE8U = 0x080B6A80
bool DoesUnitHavePairedEnding(struct CharacterEndingEnt * pairingEnt, struct Unit * unit)
{
    int pidA = unit->pCharacterData->number;
    int pidB = GetUnitASupporterPid(unit);

    if (pidB == 0)
    {
        return false;
    }

    if (GetUnitFromCharId(pidA)->state & US_DEAD)
    {
        return false;
    }

    if (GetUnitFromCharId(pidB)->state & US_DEAD)
    {
        return false;
    }

    for (; pairingEnt->pidA != 0; pairingEnt++)
    {
        if (pairingEnt->pidA == pidA && pairingEnt->pidB == pidB)
        {
            return true;
        }

        if (pairingEnt->pidA == pidB && pairingEnt->pidB == pidA)
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x080B6AE0
void LoadNextCharacterEnding(struct CharacterEndingProc * proc)
{
    proc->unitB = NULL;
    proc->unitA = NULL;

    for (;; proc->unk_30++)
    {
        if (proc->unk_30->type == CHARACTER_ENDING_NONE)
        {
            Proc_Goto(proc, 100);
            return;
        }

        if ((*&proc->unk_40[proc->unk_30->pidA >> 5] >> (proc->unk_30->pidA & 0x1f)) & 1)
        {
            continue;
        }

        if (proc->unk_30->pidB != 0)
        {
            if ((*&proc->unk_40[proc->unk_30->pidB >> 5] >> (proc->unk_30->pidB & 0x1f)) & 1)
            {
                continue;
            }
        }

        proc->unitA = sub_80B6A10(proc->unk_30->pidA);

        if (proc->unitA == NULL)
        {
            continue;
        }

        switch (proc->unk_30->type)
        {
            case CHARACTER_ENDING_SOLO:
                if (DoesUnitHavePairedEnding(proc->unk_34, proc->unitA))
                {
                    continue;
                }

                break;

            case CHARACTER_ENDING_PAIRED:
                proc->unitB = sub_80B6A10(proc->unk_30->pidB);

                if (proc->unitB == NULL)
                {
                    continue;
                }

                if (GetUnitASupporterPid(proc->unitA) != proc->unk_30->pidB)
                {
                    continue;
                }

                if (proc->unitA->state & US_DEAD)
                {
                    continue;
                }

                if (proc->unitB->state & US_DEAD)
                {
                    continue;
                }

                break;
        }

        *&proc->unk_40[(proc->unk_30->pidA >> 5)] |= 1 << (proc->unk_30->pidA & 0x1f);

        if (proc->unk_30->pidB == 0)
        {
            return;
        }

        *&proc->unk_40[proc->unk_30->pidB >> 5] |= 1 << (proc->unk_30->pidB & 0x1f);

        return;
    }
}

//! FE8U = 0x080B6BD8
void CharacterEnding_StartBattleDisplay(struct CharacterEndingProc * proc)
{
    switch (proc->unk_30->type)
    {
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
void CharacterEnding_StartBattleDisplayText(struct CharacterEndingProc * proc)
{
    StartEndingBattleText(proc->unk_30, proc->unitA, proc->unitB, proc);
    return;
}

//! FE8U = 0x080B6C14
void CharacterEnding_End(void)
{
    SetupBackgrounds(NULL);
    ResetDialogueScreen();
    EndEndingBattleText();

    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(0, 0, 0, 0, 0);

    SetDispEnable(1, 1, 1, 1, 1);

    return;
}

//! FE8U = 0x080B6C74
void CharacterEnding_Unused_80B6C74(struct CharacterEndingProc * proc)
{
    proc->unk_30++;

    if (proc->unk_30->type == CHARACTER_ENDING_NONE)
    {
        Proc_Goto(proc, 100);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_CharacterEndings[] =
{
    PROC_YIELD,

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

// clang-format on

//! FE8U = 0x080B6C94
void StartCharacterEndings(ProcPtr parent)
{
    Proc_StartBlocking(gProcScr_CharacterEndings, parent);
    return;
}

//! FE8U = 0x080B6CA8
void sub_80B6CA8(struct EndingBattleDisplayProc * proc)
{
    int i;

    for (i = 0; i < 2; i++)
    {
        struct UnitUsageStats * bwl;

        struct Unit * unit = proc->units[i];

        if (unit == NULL)
        {
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
void SoloEndingBattleDisp_Init(struct EndingBattleDisplayProc * proc)
{
    const char * str;

    sub_80B6920();

    sub_80B6CA8(proc);

    BG_Fill(gSoloEndingBattleDispConf[0], 0);
    BG_Fill(gSoloEndingBattleDispConf[1], 0);
    BG_Fill(gSoloEndingBattleDispConf[2], 0);

    Decompress(gTsa_SoloEndingWindow, gGenericBuffer);
    CallARM_FillTileRect(gSoloEndingBattleDispConf[2], gGenericBuffer, 0xC260);

    Decompress(gTsa_SoloEndingNameplate, gGenericBuffer);
    CallARM_FillTileRect(gSoloEndingBattleDispConf[1], gGenericBuffer, 0xC260);

    str = GetStringFromIndex(GetPidTitleTextId(proc->pCharacterEnding->pidA));

    PutDrawText(gUnknown_08A3D358 + 5, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(1, 3), TEXT_COLOR_SYSTEM_WHITE, GetStringTextCenteredPos(120, str), 0, str);

    PutDrawText(gUnknown_08A3D358 + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(17, 1), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x51F));
    PutDrawText(gUnknown_08A3D358 + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(17, 1), TEXT_COLOR_SYSTEM_GOLD, 32, 0, GetStringFromIndex(0x520));
    PutDrawText(gUnknown_08A3D358 + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(17, 1), TEXT_COLOR_SYSTEM_GOLD, 64, 0, GetStringFromIndex(0x521));

    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(17, 1) + CountDigits(proc->battleAmounts[0]), TEXT_COLOR_SYSTEM_BLUE, proc->battleAmounts[0]);
    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(21, 1) + CountDigits(proc->winAmounts[0]), TEXT_COLOR_SYSTEM_BLUE, proc->winAmounts[0]);
    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(25, 1) + CountDigits(proc->lossAmounts[0]), TEXT_COLOR_SYSTEM_BLUE, proc->lossAmounts[0]);

    StartFace2(0, gCharacterData[proc->pCharacterEnding->pidA - 1].portraitId, 416, 56, 0x502);

    if (proc->units[0]->state & US_DEAD)
    {
        ArchivePalette(0x16);
        WriteFadedPaletteFromArchive(0xc0, 0xc0, 0xc0, 0x400000);
    }

    proc->unk_34 = 0;
    SetDefaultColorEffects();

    return;
}

// clang-format off

u8 CONST_DATA gUnknown_08A3D40C[] =
{
    0x00, 0x03, 0x06, 0x08, 0x0A,
    0x0C, 0x0E, 0x10, 0x12, 0x14,
    0x15, 0x16, 0x17, 0x18, 0x19,
    0x1A, 0x1B, 0x1C, 0x1D, 0x1E,
};

// clang-format on

//! FE8U = 0x080B6ED0
void SoloEndingBattleDisp_Loop(struct EndingBattleDisplayProc * proc)
{
    int a = 30;

    int b = gUnknown_08A3D40C[proc->unk_34];
    proc->unk_34++;

    a -= b;

    sub_8006618(0, (a * 8 + 176) & 0x1FF, 56);

    sub_80B689C(a, 0);

    if (b == 30)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_EndingBattleDisplay_Solo[] =
{
    PROC_YIELD,

    PROC_CALL(SoloEndingBattleDisp_Init),
    PROC_REPEAT(SoloEndingBattleDisp_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B6F14
void StartSoloEndingBattleDisplay(struct CharacterEndingEnt * endingEnt, struct Unit * unit, struct CharacterEndingProc * parent)
{
    struct EndingBattleDisplayProc * proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Solo, parent);

    proc->units[0] = unit;
    proc->units[1] = NULL;

    proc->pCharacterEnding = endingEnt;

    return;
}

//! FE8U = 0x080B6F34
void sub_80B6F34(struct EndingBattleDisplayProc * proc)
{
    const char * str;

    sub_80B6920();

    sub_80B6CA8(proc);

    BG_Fill(gSoloEndingBattleDispConf[0], 0);
    BG_Fill(gSoloEndingBattleDispConf[1], 0);
    BG_Fill(gSoloEndingBattleDispConf[2], 0);

    Decompress(gTsa_PairedEndingWindow, gGenericBuffer);
    CallARM_FillTileRect(gSoloEndingBattleDispConf[2], gGenericBuffer, 0xC260);

    Decompress(gTsa_PairedEndingNameplates, gGenericBuffer);
    CallARM_FillTileRect(gSoloEndingBattleDispConf[1], gGenericBuffer, 0xC260);

    str = GetStringFromIndex(GetPidTitleTextId(proc->pCharacterEnding->pidA));
    PutDrawText(gUnknown_08A3D358 + 5, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(1, 3), TEXT_COLOR_SYSTEM_WHITE, GetStringTextCenteredPos(120, str), 0, str);

    PutDrawText(gUnknown_08A3D358 + 7, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(17, 1), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x51F));
    PutDrawText(gUnknown_08A3D358 + 7, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(17, 1), TEXT_COLOR_SYSTEM_GOLD, 32, 0, GetStringFromIndex(0x520));
    PutDrawText(gUnknown_08A3D358 + 7, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(17, 1), TEXT_COLOR_SYSTEM_GOLD, 64, 0, GetStringFromIndex(0x521));

    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(17, 1) + CountDigits(proc->battleAmounts[0]), TEXT_COLOR_SYSTEM_BLUE, proc->battleAmounts[0]);
    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(21, 1) + CountDigits(proc->winAmounts[0]), TEXT_COLOR_SYSTEM_BLUE, proc->winAmounts[0]);
    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(25, 1) + CountDigits(proc->lossAmounts[0]), TEXT_COLOR_SYSTEM_BLUE, proc->lossAmounts[0]);

    str = GetStringFromIndex(GetPidTitleTextId(proc->pCharacterEnding->pidB));
    PutDrawText(gUnknown_08A3D358 + 6, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(14, 17), TEXT_COLOR_SYSTEM_WHITE, GetStringTextCenteredPos(120, str), 0, str);

    PutDrawText(gUnknown_08A3D358 + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(1, 17), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x51F));
    PutDrawText(gUnknown_08A3D358 + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(1, 17), TEXT_COLOR_SYSTEM_GOLD, 32, 0, GetStringFromIndex(0x520));
    PutDrawText(gUnknown_08A3D358 + 8, gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(1, 17), TEXT_COLOR_SYSTEM_GOLD, 64, 0, GetStringFromIndex(0x521));

    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(1, 17) + CountDigits(proc->battleAmounts[1]), TEXT_COLOR_SYSTEM_BLUE, proc->battleAmounts[1]);
    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(5, 17) + CountDigits(proc->winAmounts[1]), TEXT_COLOR_SYSTEM_BLUE, proc->winAmounts[1]);
    PutNumber(gSoloEndingBattleDispConf[0] + TILEMAP_INDEX(9, 17) + CountDigits(proc->lossAmounts[1]), TEXT_COLOR_SYSTEM_BLUE, proc->lossAmounts[1]);

    proc->unk_34 = 0;

    SetDefaultColorEffects();

    StartFace2(0, gCharacterData[proc->pCharacterEnding->pidA - 1].portraitId, 304, 48, 0x503);
    StartFace2(1, gCharacterData[proc->pCharacterEnding->pidB - 1].portraitId, 416, 48, 0x502);

    return;
}

//! FE8U = 0x080B71DC
void sub_80B71DC(struct EndingBattleDisplayProc * proc)
{
    int a = 30;

    int b = gUnknown_08A3D40C[proc->unk_34];
    proc->unk_34++;

    a -= b;

    sub_8006618(0, (a * 8 + 64) & 0x1FF, 48);
    sub_8006618(1, (a * 8 + 176) & 0x1FF, 48);

    sub_80B689C(a, 0);

    if (b == 30)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B723C
void sub_80B723C(struct EndingBattleDisplayProc * proc)
{
    proc->unk_34 = 0;

    SetBlendAlpha(0x10, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);

    return;
}

//! FE8U = 0x080B7274
void sub_80B7274(struct EndingBattleDisplayProc * proc)
{
    int var = proc->unk_34 >> 2;

    proc->unk_34++;

    SetBlendAlpha(0x10 - var, var);

    if (var == 8)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_EndingBattleDisplay_Paired[] =
{
    PROC_YIELD,

    PROC_CALL(sub_80B6F34),
    PROC_REPEAT(sub_80B71DC),

    PROC_SLEEP(16),

    PROC_CALL(sub_80B723C),
    PROC_REPEAT(sub_80B7274),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B72A4
void StartPairedEndingBattleDisplay(struct CharacterEndingEnt * endingEnt, struct Unit * unitA, struct Unit * unitB, struct CharacterEndingProc * parent)
{
    struct EndingBattleDisplayProc * proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Paired, parent);

    proc->units[0] = unitA;
    proc->units[1] = unitB;

    proc->pCharacterEnding = endingEnt;

    return;
}

//! FE8U = 0x080B72C4
void EndingBattleInitText(struct EndingBattleTextProc * proc)
{
    int i;

    proc->text = gUnknown_08A3D358;

    proc->defaultPauseDelay = 4;
    proc->pauseTimer = 4;

    Text_SetCursor(proc->text, 0);
    Text_SetColor(proc->text, TEXT_COLOR_SYSTEM_WHITE);

    for (i = 0; i < 5; i++)
    {
        int offset = 0xc0 + i * 0x40;

        ClearText(gUnknown_08A3D358 + i);
        PutText(gUnknown_08A3D358 + i, gBG0TilemapBuffer + 2 + offset);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    if (proc->unitA->state & US_DEAD)
    {
        proc->str = GetPidDefeatedEndingString(proc->unitA->pCharacterData->number);

        if (proc->str != NULL)
        {
            return;
        }
    }

    proc->str = GetStringFromIndex(proc->pCharacterEnding->textId);

    return;
}

//! FE8U = 0x080B734C
void EndingBattleText_Loop(struct EndingBattleTextProc * proc)
{
    if ((gKeyStatusPtr->newKeys & START_BUTTON) && (CheckGameEndFlag() != 0))
    {
        Proc_Break(proc);
        Proc_Goto(proc->proc_parent, 100);
        return;
    }

    if (proc->pauseTimer != 0)
    {
        proc->pauseTimer--;
        return;
    }

    SetTextFont(NULL);

    switch (*proc->str)
    {
        case CHFE_L_X: // [X]
            Proc_Break(proc);
            break;

        case CHFE_L_NL: // [NL]
            proc->str++;
            proc->text++;
            proc->pauseTimer += 16;

            Text_SetCursor(proc->text, 0);
            Text_SetColor(proc->text, 0);

            break;

        case CHFE_L_Pause8: // [....]
            proc->pauseTimer = 8;
            proc->str++;

            break;

        case CHFE_L_Pause16: // [.....]
            proc->pauseTimer = 16;
            proc->str++;

            break;

        case CHFE_L_Pause32: // [......]
            proc->pauseTimer = 32;
            proc->str++;

            break;

        case CHFE_L_Pause64: // [.......]
            proc->pauseTimer = 64;
            proc->str++;

            break;

        case CHFE_L_2NL: // [NL2]
        case CHFE_L_A: // [A]
        default:
            proc->str = Text_DrawCharacter(proc->text, proc->str);
    }

    // TODO: Is this a bug? Seems to overwrite any pauses with the default delay of 4 frames...
    proc->pauseTimer = proc->defaultPauseDelay;

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_EndingBattleDisplay_Text[] =
{
    PROC_YIELD,

    PROC_CALL(EndingBattleInitText),
    PROC_REPEAT(EndingBattleText_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B742C
void StartEndingBattleText(struct CharacterEndingEnt * pairingEnt, struct Unit * unitA, struct Unit * unitB, struct CharacterEndingProc * parent)
{
    struct EndingBattleTextProc * proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Text, parent);
    proc->pCharacterEnding = pairingEnt;
    proc->unitA = unitA;
    proc->unitB = unitB;

    return;
}

//! FE8U = 0x080B744C
void EndEndingBattleText(void)
{
    Proc_EndEach(gProcScr_EndingBattleDisplay_Text);
    return;
}

//! FE8U = 0x080B745C
void SetupFinScreenGfx(void)
{
    ApplyPalette(gPal_FinScreen, 0xE);

    Decompress(gGfx_FinScreen, (void *)0x06001000);
    Decompress(gTsa_FinScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0xE080);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080B74B0
void Fin_Init(struct FinScreenProc * proc)
{
    proc->unk_4c = 0;
    proc->unk_58 = 0;

    SetupBackgrounds(NULL);

    SetupFinScreenGfx();

    StartBgmFadeIn(0x56, 7, 0);
    SetDefaultColorEffects();

    return;
}

//! FE8U = 0x080B74D8
void Fin_Loop_KeyListener(struct FinScreenProc * proc)
{
    proc->unk_58++;

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON))
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B7500
void sub_80B7500(struct FinScreenProc * proc)
{
    SetBlendAlpha(0, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    proc->unk_4c = 0;

    SetupFinScreenGfx();

    return;
}

//! FE8U = 0x080B7540
void sub_80B7540(struct FinScreenProc * proc)
{
    int b;

    s16 a = proc->unk_4c;
    proc->unk_4c++;

    b = a >> 2;
    SetBlendAlpha(b, 0x10);

    if (b == 16)
    {
        Proc_Break(proc);
        proc->unk_4c = 0;
    }

    return;
}

//! FE8U = 0x080B7574
void Fin_End(void)
{
    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_FinScreen[] =
{
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

// clang-format on

//! FE8U = 0x080B7598
void StartFinScreen(ProcPtr parent)
{
    Proc_StartBlocking(gProcScr_FinScreen, parent);
    return;
}

// === TODO: File split here?

// clang-format off

// Sprites
u16 CONST_DATA gUnknown_08A3D540[] =
{
    5,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(96), OAM2_CHR(0xC),
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_X(128), OAM2_CHR(0x10),
};

u16 CONST_DATA gUnknown_08A3D560[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x40),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x44),
};

u16 CONST_DATA gUnknown_08A3D56E[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x48),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4C),
};

u16 CONST_DATA gUnknown_08A3D57C[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x50),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x54),
};

u16 CONST_DATA gUnknown_08A3D58A[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x58),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x5C),
};

u16 CONST_DATA gUnknown_08A3D598[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x88),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x8C),
};

u16 CONST_DATA gUnknown_08A3D5A6[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x80),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x84),
};

u16 CONST_DATA gUnknown_08A3D5B4[] =
{
    2,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0x1B),
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_X(32), OAM2_CHR(0x1F),
};

u16 CONST_DATA gSprite_08A3D5C2[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xC0),
};

u16 CONST_DATA gSprite_08A3D5CA[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xC4),
};

u16 CONST_DATA gSprite_08A3D5D2[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xC8),
};

u16 CONST_DATA gSprite_08A3D5DA[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xCC),
};

u16 CONST_DATA gSprite_08A3D5E2[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xD0),
};

u16 CONST_DATA gSprite_08A3D5EA[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xD4),
};

u16 CONST_DATA gSprite_08A3D5F2[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x140),
};

u16 CONST_DATA gSprite_08A3D5FA[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x144),
};

u16 CONST_DATA gSprite_08A3D602[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x148),
};

u16 CONST_DATA gSprite_08A3D60A[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x14C),
};

u16 CONST_DATA gSprite_08A3D612[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x150),
};

u16 CONST_DATA gSprite_08A3D61A[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x154),
};

u16 * CONST_DATA gUnknown_08A3D624[] =
{
    gSprite_08A3D5EA,
    gSprite_08A3D5E2,
    gSprite_08A3D5DA,
    gSprite_08A3D5D2,
    gSprite_08A3D5CA,
    gSprite_08A3D5C2,
};

u16 * CONST_DATA gUnknown_08A3D63C[] =
{
    gSprite_08A3D61A,
    gSprite_08A3D612,
    gSprite_08A3D60A,
    gSprite_08A3D602,
    gSprite_08A3D5FA,
    gSprite_08A3D5F2,
};

// clang-format on

//! FE8U = 0x080B75AC
void sub_80B75AC(struct EndingTurnRecordProc * proc)
{
    SetDispEnable(1, 1, 0, 1, 1);

    ApplyPalette(gUnknown_08A09A5C, 5);

    Decompress(Img_ChapterIntroFog, (void *)0x06004000);
    CallARM_FillTileRect(gBG2TilemapBuffer, gUnknown_085A647C, 0x5200);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->unk_4c = 0;

    return;
}

//! FE8U = 0x080B7614
void sub_80B7614(struct EndingTurnRecordProc * proc)
{
    int x;
    int y;

    proc->unk_4c++;

    y = proc->unk_4c;
    x = y * 3;

    BG_SetPosition(BG_2, x / 8, y / 4);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_08A3D654[] =
{
    PROC_YIELD,

    PROC_CALL(sub_80B75AC),
    PROC_REPEAT(sub_80B7614),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080B7648
void sub_80B7648(struct EndingTurnRecordProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_34 = 32;
    proc->unk_39 = 0;
    proc->unk_2c = 0;
    proc->unk_38 = GetNextChapterStatsSlot();

    SetDispEnable(0, 0, 0, 0, 0);

    SetPrimaryHBlankHandler(NULL);
    SetupBackgrounds(NULL);

    // ??
    SetDispEnable(0, 0, 0, 0, 0);

    SetDefaultColorEffects();
    ResetText();

    SetWinEnable(0, 0, 0);

    ApplyPalettes(gUnknown_08A40AD4, 0xE, 2);
    CallARM_FillTileRect(gBG3TilemapBuffer, gUnknown_08A40B14, 0xe000);

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

struct Text * CONST_DATA gpEndingDetailTexts = gEndingDetailTexts;

//! FE8U = 0x080B770C
void sub_80B770C(void)
{
    int i;

    BG_SetPosition(BG_1, 0, -136);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 24, 240, 136);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);

    for (i = 0; i < 9; i++)
    {
        InitText(gpEndingDetailTexts + 0 + i, 5);
        InitText(gpEndingDetailTexts + 9 + i, 13);
    }

    InitText(gpEndingDetailTexts + 18, 4);
    InitText(gpEndingDetailTexts + 19, 2);

    Text_DrawString(gpEndingDetailTexts + 18, GetStringFromIndex(0x15D));

    Text_SetColor(gpEndingDetailTexts + 19, TEXT_COLOR_SYSTEM_GOLD);
    Text_DrawString(gpEndingDetailTexts + 19, GetStringFromIndex(0x157));

    return;
}

//! FE8U = 0x080B7800
int sub_80B7800(struct ChapterStats * chapterStats, int param_2)
{
    int r6;
    int y;
    int chapterTurn;
    int textIndex;

    int x = 3;
    s8 sp10 = 0;

    textIndex = param_2 % 9;
    y = (param_2 * 2) & 0x1f;
    r6 = y * 0x20;

    TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, y), 31, 1, 0);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    ClearText(gpEndingDetailTexts + 0 + textIndex);
    ClearText(gpEndingDetailTexts + 9 + textIndex);

    if ((u32)chapterStats == -1)
    {
        int gameTotalTurns = GetGameTotalTurnCount();

        PutDrawText(gpEndingDetailTexts + 9 + textIndex, gBG1TilemapBuffer + ({r6 + 0xC;}), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x15f));
        PutNumber(gBG1TilemapBuffer + ({r6 + 0x17;}), TEXT_COLOR_SYSTEM_BLUE, gameTotalTurns);
        PutText(gpEndingDetailTexts + 18, gBG1TilemapBuffer + ({r6 + 0x18;}));

        return 0;
    }

    if (chapterStats)
    {
        int chapterIndex = chapterStats->chapter_index;
        int r9 = GetROMChapterStruct(chapterIndex)->prepScreenNumber >> 1;

        switch (chapterIndex)
        {
            case 0x00:
                PutDrawText(gpEndingDetailTexts + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(x, y), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x15a)); // TODO: msgid "Prologue"
                break;

            case 0x15:
            case 0x16:
            case 0x22:
            case 0x23:
                PutDrawText(gpEndingDetailTexts + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(x, y), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x159)); // TODO: msgid "Final[.]"
                break;

            case 0x05:
                PutText(gpEndingDetailTexts + 0x13, gBG1TilemapBuffer + TILEMAP_INDEX(x, y));
                PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(CountDigits(r9) + (1  + x), y), TEXT_COLOR_SYSTEM_BLUE, r9);
                PutDrawText(gpEndingDetailTexts + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(CountDigits(r9) + (2 + x), y), TEXT_COLOR_SYSTEM_BLUE, 0, 0, GetStringFromIndex(0x158));
                break;

            default:
                PutDrawText(gpEndingDetailTexts + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(x, y), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x0157));
                PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(CountDigits(r9) + (1 + x), y), TEXT_COLOR_SYSTEM_BLUE, r9);
                break;
        }

        switch (chapterIndex)
        {
            case 0x15:
            case 0x16:
            case 0x22:
            case 0x23:
                // Compute the combined total turn count for both parts of final chapter
                chapterTurn = chapterStats->chapter_turn;
                ++chapterStats;
                chapterTurn += chapterStats->chapter_turn;
                sp10 = 1;
                break;

            default:
                chapterTurn = chapterStats->chapter_turn;
                break;
        }

        PutDrawText(gpEndingDetailTexts + 9 + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(5 + x, y), TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(GetROMChapterStruct(chapterIndex)->chapTitleTextId));
        PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(20 + x, y), TEXT_COLOR_SYSTEM_BLUE, chapterTurn);
        PutText(gpEndingDetailTexts + 18, gBG1TilemapBuffer + TILEMAP_INDEX(21 + x, y));
    }

    return sp10;
}

//! FE8U = 0x080B7B30
void sub_80B7B30(struct EndingTurnRecordProc * proc)
{
    int pos = proc->unk_30 >> 6;

    BG_SetPosition(BG_1, 0, pos - 136);

    if ((pos & 15) == 0)
    {
        if (proc->unk_39 == (pos / 16))
        {
            if (proc->unk_2c >= proc->unk_38)
            {
                int unk = proc->unk_2c - proc->unk_38;

                if (unk == 1)
                {
                    sub_80B7800((void *)-1, proc->unk_39);
                }
                else if (unk >= 3)
                {
                    Proc_Break(proc);
                }
                else
                {
                    sub_80B7800(NULL, proc->unk_39);
                }
            }
            else
            {
                proc->unk_2c += sub_80B7800(GetChapterStats(proc->unk_2c), proc->unk_39);
            }

            proc->unk_2c++;
            proc->unk_39++;
        }
    }

    if (gKeyStatusPtr->heldKeys & A_BUTTON)
    {
        proc->unk_30 += proc->unk_34;
    }

    proc->unk_30 += proc->unk_34;

    return;
}

//! FE8U = 0x080B7BD8
void sub_80B7BD8(struct UnkProc * proc)
{
    int i;

    PutSpriteExt(2, 24, 20, gUnknown_08A3D540, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(9));
    PutSpriteExt(2, 16, 128, gUnknown_08A3D5B4, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(6));

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
    {
        PutSpriteExt(2, 16, 56, gUnknown_08A3D560, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 56, gUnknown_08A3D56E, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 88, gUnknown_08A3D58A, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 88, gUnknown_08A3D5A6, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(7));

        for (i = 0; i < 3; i++)
        {
            if (proc->unk_4c[i] > 0x10)
            {
                SetObjAffine(
                    i,
                    Div(+COS(0) * 16, proc->unk_4c[i]),
                    Div(-SIN(0) * 16, 0x100),
                    Div(+SIN(0) * 16, proc->unk_4c[i]),
                    Div(+COS(0) * 16, 0x100)
                );

                PutSpriteExt(
                    2,
                    (i & 1) * 112 + 80 + i * 512,
                    (i >> 1) * 32 + 304,
                    gUnknown_08A3D624[proc->unk_40[i]],
                    OAM2_PAL(i + 10) + OAM2_CHR(0x80) + OAM2_LAYER(1)
                );
            }
        }

        if (proc->unk_4c[i] > 0x10)
        {
            SetObjAffine(
                i,
                Div(+COS(0) * 16, proc->unk_4c[i]),
                Div(-SIN(0) * 16, 0x100),
                Div(+SIN(0) * 16, proc->unk_4c[i]),
                Div(+COS(0) * 16, 0x100)
            );

            PutSpriteExt(
                2,
                (i & 1) * 112 + 80 + i * 512,
                (i >> 1) * 32 + 304,
                gUnknown_08A3D63C[proc->unk_40[i]],
                OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(15)
            );
        }
    }
    else
    {
        PutSpriteExt(2, 16, 48, gUnknown_08A3D560, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 48, gUnknown_08A3D56E, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 72, gUnknown_08A3D598, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 72, gUnknown_08A3D57C, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 16, 96, gUnknown_08A3D58A, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(8));
        PutSpriteExt(2, 128, 96, gUnknown_08A3D5A6, OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(7));

        for (i = 0; i < 5; i++)
        {
            if (proc->unk_4c[i] > 0x10)
            {
                SetObjAffine(
                    i,
                    Div(+COS(0) * 16, proc->unk_4c[i]),
                    Div(-SIN(0) * 16, 0x100),
                    Div(+SIN(0) * 16, proc->unk_4c[i]),
                    Div(+COS(0) * 16, 0x100)
                );

                PutSpriteExt(
                    2,
                    (i & 1) * 112 + 80 + i * 512,
                    (i >> 1) * 24 + 296,
                    gUnknown_08A3D624[proc->unk_40[i]],
                    OAM2_PAL(i + 10) + OAM2_CHR(0x80) + OAM2_LAYER(1)
                );
            }
        }

        if (proc->unk_4c[i] > 0x10)
        {
            SetObjAffine(
                i,
                Div(+COS(0) * 16, proc->unk_4c[i]),
                Div(-SIN(0) * 16, 0x100),
                Div(+SIN(0) * 16, proc->unk_4c[i]),
                Div(+COS(0) * 16, 0x100)
            );

            PutSpriteExt(
                2,
                (i & 1) * 112 + 80 + (i * 512),
                (i >> 1) * 24 + 296,
                gUnknown_08A3D63C[proc->unk_40[i]],
                OAM2_CHR(0x80) + OAM2_LAYER(1) + OAM2_PAL(15)
            );
        }
    }

    return;
}

//! FE8U = 0x080B8014
void sub_80B8014(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDispEnable(1, 1, 1, 1, 1);

    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);
    SetBlendAlpha(6, 0x10);

    Decompress(Img_SaveMenuBG, (void *)(GetBackgroundTileDataOffset(BG_3) + 0x6000000));
    ApplyPalettes(Pal_SaveMenuBG, 8, 8);
    CallARM_FillTileRect(gBG3TilemapBuffer, Tsa_SaveMenuBG, 0x8000);

    Decompress(Img_MainMenuBgFog, (void *)(GetBackgroundTileDataOffset(BG_2) + 0x06004C00));
    Decompress(Tsa_MainMenuBgFog, gGenericBuffer);
    ApplyPalette(Pal_MainMenuBgFog, 7);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, 0x7260);

    BG_EnableSyncByMask(BG2_SYNC_BIT | BG3_SYNC_BIT);

    sub_80AB760(gEndingDetailBuf);
    StartBgm(0x46, 0);

    return;
}

//! FE8U = 0x080B8168
int sub_80B8168(void)
{
    sub_80AB77C();
    // return; // BUG
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_EndingTurnRecord[] =
{
    PROC_YIELD,
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

// clang-format on

//! FE8U = 0x080B8174
void StartEndingTurnRecordScreen(ProcPtr parent)
{
    Proc_StartBlocking(gProcScr_EndingTurnRecord, parent);
    return;
}

//! FE8U = 0x080B8188
void sub_80B8188(int unusedA, int unusedB, int unusedC)
{
    return;
}

//! FE8U = 0x080B818C
void nullsub_7(void)
{
    return;
}

//! FE8U = 0x080B8190
void sub_80B8190(u16 * dst, u16 * src, u8 coeff)
{
    int i;

    for (i = 0; i < 0x10; i++)
    {
        *dst = ((((*src & RED_MASK) * coeff) >> 5) & RED_MASK) +
            ((((*src & GREEN_MASK) * coeff) >> 5) & GREEN_MASK) +
            ((((*src & BLUE_MASK) * coeff) >> 5) & BLUE_MASK);
        dst++;
        src++;
    }

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080B81FC
void nullsub_5(int unused)
{
    return;
}

//! FE8U = 0x080B8200
void sub_80B8200(void)
{
    Sound_FadeOutBGM(4);
    return;
}
