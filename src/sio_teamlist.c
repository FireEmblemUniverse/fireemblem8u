#include "global.h"

#include "bmunit.h"
#include "bmsave.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "unitlistscreen.h"
#include "uiutils.h"
#include "prepscreen.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"

extern struct ProcCmd ProcScr_SioTeamList[];

struct LinkArenaTeamEnt
{
    /* 00 */ char name[MULTIARENA_TEAMNAME_SIZE + 1];
    /* 0F */ u8 unk_0f;
    /* 10 */ u8 unk_10;
    /* 11 */ STRUCT_PAD(0x11, 0x14);
};

extern struct LinkArenaTeamEnt gLinkArenaTeamList[];

struct LATeamListConfig
{
    /* 00 */ u8 kind;
    /* 01 */ STRUCT_PAD(0x01, 0x02);
    /* 02 */ u16 helpTextId; // Text that displays across the bottom
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ STRUCT_PAD(0x06, 0x08);
    /* 08 */ int menuTextId;
    /* 0C */ bool (*isValidFunc)(void);
};

// Forward declarations

int DrawLinkArenaTeamListMenu(u8, struct SioTeamListProc *);
bool CanBuildNewLinkArenaTeam(void);
bool AnyLinkArenaTeamExists(void);

enum
{
    MULTIARENA_LIST_NONE = 0,
    MULTIARENA_LIST_BUILDTEAM = 1,
    MULTIARENA_LIST_SELECTTEAM = 2,
    MULTIARENA_LIST_UNITLIST = 3,
    MULTIARENA_LIST_SWAP = 4,
    MULTIARENA_LIST_CONFIRMSWAP = 5,
    MULTIARENA_LIST_DISBAND = 6,
    MULTIARENA_LIST_LINKMENU = 7,
    MULTIARENA_LIST_8 = 8,
};

// clang-format off

struct LATeamListConfig CONST_DATA gSioTeamListConfig_1[] =
{
    [0] =
    {
        .kind = MULTIARENA_LIST_BUILDTEAM,
        .helpTextId = MSG_73C, // "Build a new team."
        .unk_04 = 1,
        .unk_05 = 0,
        .menuTextId = MSG_766, // "Build Team"
        .isValidFunc = CanBuildNewLinkArenaTeam,
    },
    [1] =
    {
        .kind = MULTIARENA_LIST_UNITLIST,
        .helpTextId = MSG_73D, // "View all units on team."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_767, // Unit List"
        .isValidFunc = AnyLinkArenaTeamExists,
    },
    [2] =
    {
        .kind = MULTIARENA_LIST_SWAP,
        .helpTextId = MSG_73E, // "Switch teams."
        .unk_04 = 0,
        .unk_05 = 0,
        .menuTextId = MSG_768, // "Swap"
        .isValidFunc = NULL,
    },
    [3] =
    {
        .kind = MULTIARENA_LIST_DISBAND,
        .helpTextId = MSG_73F, // "Disband teams."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_769, // "Disband"
        .isValidFunc = AnyLinkArenaTeamExists,
    },
    [4] =
    {
        .kind = MULTIARENA_LIST_LINKMENU,
        .helpTextId = MSG_740, // "Return to link menu."
        .unk_04 = 0,
        .unk_05 = 0,
        .menuTextId = MSG_76A, // "Link Menu"
        .isValidFunc = NULL,
    },
    [5] =
    {
        .kind = MULTIARENA_LIST_NONE,
        .helpTextId = 0,
        .unk_04 = 0,
        .unk_05 = 0,
        .menuTextId = 0,
        .isValidFunc = NULL,
    },
};

struct LATeamListConfig CONST_DATA gSioTeamListConfig_2[] =
{
    [0] =
    {
        .kind = MULTIARENA_LIST_SELECTTEAM,
        .helpTextId = MSG_741, // "Select team for battle."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_76C, // "Team"
        .isValidFunc = NULL,
    },
    [1] =
    {
        .kind = MULTIARENA_LIST_UNITLIST,
        .helpTextId = MSG_73D, // "View all units on team."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_767, // "Unit List"
        .isValidFunc = NULL,
    },
    [2] =
    {
        .kind = MULTIARENA_LIST_LINKMENU,
        .helpTextId = MSG_740, // "Return to link menu."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_76A, // "Link Menu"
        .isValidFunc = NULL,
    },
    [3] =
    {
        .kind = MULTIARENA_LIST_NONE,
        .helpTextId = 0,
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = 0,
        .isValidFunc = NULL,
    },
};

struct LATeamListConfig * CONST_DATA gSioTeamListConfigLut[] =
{
    gSioTeamListConfig_1,
    gSioTeamListConfig_2,
    gSioTeamListConfig_2,
};

// clang-format on

extern char gUnk_Sio_14[][MULTIARENA_TEAMNAME_SIZE + 1];
extern struct Text gUnk_Sio_7[];

//! FE8U = 0x08043308
void StartLinkArenaTeamList(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_SioTeamList, parent);
    return;
}

//! FE8U = 0x0804331C
void SioTeamList_Init(struct SioTeamListProc * proc)
{
    proc->yBg1 = 216;
    proc->unk_48 = 0;
    proc->unk_40 = 0;
    proc->optionIdx = 0;
    proc->selectedOption = MULTIARENA_LIST_NONE;
    proc->unk_54 = 0xff;
    proc->selectedTeam = 0xff;
    proc->unk_4c = 0;
    return;
}

//! FE8U = 0x0804335C
bool CanBuildNewLinkArenaTeam(void)
{
    int i;

    if (gLinkArenaSt.unk_0A == 0)
    {
        return false;
    }

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
    {
        if ((gLinkArenaTeamList[i].unk_0f & 0x80) != 0)
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x08043394
bool AnyLinkArenaTeamExists(void)
{
    int i;

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
    {
        if ((gLinkArenaTeamList[i].unk_0f & 0x80) == 0)
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x080433C0
int LoadLinkArenaTeamList(int activeOption, u8 mode)
{
    int i;
    int count = 0;
    char buf[16];

    struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    InitUnits();

    switch (mode)
    {
        case 0:
            for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
            {
                if (ReadMultiArenaSaveTeamName(i, gLinkArenaTeamList[i].name) == 1)
                {
                    gLinkArenaTeamList[i].unk_10 = ptr[activeOption].unk_04;
                    gLinkArenaTeamList[i].unk_0f = i;
                }
                else
                {
                    SioStrCpy(GetStringFromIndex(MSG_0CC), gLinkArenaTeamList[i].name); // "NO DATA"
                    gLinkArenaTeamList[i].unk_10 = ptr[activeOption].unk_05;
                    gLinkArenaTeamList[i].unk_0f = i | 0x80;
                }

                ReadMultiArenaSaveTeam(i, GetUnit(i * 5 + 1), buf);
            }

            count = i;

            break;

        case 1:
        case 2:
            for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
            {
                if (ReadMultiArenaSaveTeamName(i, gLinkArenaTeamList[count].name) == 1)
                {
                    gLinkArenaTeamList[count].unk_10 = ptr[activeOption].unk_04;
                    gLinkArenaTeamList[count].unk_0f = i;
                    ReadMultiArenaSaveTeam(i, GetUnit(count * 5 + 1), buf);

                    count++;
                }
            }

            break;
    }

    return count;
}

//! FE8U = 0x080434B4
void DrawLinkArenaTeamName(int idx)
{
    ClearText(&gLinkArenaSt.texts[idx]);
    Text_SetColor(&gLinkArenaSt.texts[idx], TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(&gLinkArenaSt.texts[idx], gLinkArenaTeamList[idx].name);

    gLinkArenaSt.texts[idx].chr_position =
        (gLinkArenaSt.texts[idx].chr_position & 0xFFF) | ((gLinkArenaTeamList[idx].unk_10 & 0xf) << 0xc);

    PutText(&gLinkArenaSt.texts[idx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, idx * 2));

    return;
}

//! FE8U = 0x0804352C
void DrawAllLinkArenaTeamNames(struct SioTeamListProc * proc)
{
    int i;

    for (i = 0; i < proc->unk_38; i++)
    {
        DrawLinkArenaTeamName(i);
    }

    return;
}

//! FE8U = 0x08043548
void UpdateLinkArenaTeamNamePalettes(struct SioTeamListProc * proc, u8 mode)
{
    int i;

    struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    for (i = 0; i < proc->unk_38; i++)
    {
        if ((gLinkArenaTeamList[i].unk_0f & 0x80) == 0)
        {
            gLinkArenaTeamList[i].unk_10 = ptr[proc->optionIdx].unk_04;
        }
        else
        {
            gLinkArenaTeamList[i].unk_10 = ptr[proc->optionIdx].unk_05;
        }

        gLinkArenaSt.texts[i].chr_position =
            (gLinkArenaSt.texts[i].chr_position & 0xFFF) | ((gLinkArenaTeamList[i].unk_10 & 0xf) << 0xc);
        PutText(&gLinkArenaSt.texts[i], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, i * 2));
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x080435F0
void SioTeamList_EraseTeam(struct SioTeamListProc * proc)
{
    int team = proc->unk_40;

    struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    struct Unit * unit = GetUnit(team * 5 + 1);

    WipeMultiArenaSaveTeam(gLinkArenaTeamList[team].unk_0f & 0x7f);
    ReadMultiArenaSaveTeam(team, unit, gLinkArenaTeamList[team].name);

    SioStrCpy(GetStringFromIndex(MSG_0CC), gLinkArenaTeamList[team].name); // "NO DATA"

    gLinkArenaTeamList[team].unk_10 = ptr[proc->optionIdx].unk_05;
    gLinkArenaTeamList[team].unk_0f = team | 0x80;
    DrawLinkArenaTeamName(team);

    if (!AnyLinkArenaTeamExists())
    {
        DrawLinkArenaTeamListMenu(gLinkArenaSt.unk_00, proc);
        Proc_Goto(proc, 2);
    }
    else if (proc->validOptions[0] == 0)
    {
        DrawLinkArenaTeamListMenu(gLinkArenaSt.unk_00, proc);
    }

    UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x080436C0
void SioTeamList_SwapTeams(struct SioTeamListProc * proc)
{
    int tmp;

    int teamB = proc->unk_40;
    int teamA = proc->selectedTeam;

    SwapMultiArenaSaveTeams(gLinkArenaTeamList[teamA].unk_0f & 0x7f, gLinkArenaTeamList[teamB].unk_0f & 0x7f);

    tmp = gLinkArenaTeamList[teamA].unk_10;
    gLinkArenaTeamList[teamA].unk_10 = gLinkArenaTeamList[teamB].unk_10;
    gLinkArenaTeamList[teamB].unk_10 = tmp;

    if (ReadMultiArenaSaveTeam(teamA, GetUnit(teamA * 5 + 1), gLinkArenaTeamList[teamA].name) == 0)
    {
        SioStrCpy(GetStringFromIndex(MSG_0CC), gLinkArenaTeamList[teamA].name); // "NO DATA"
        gLinkArenaTeamList[teamA].unk_0f = teamA | 0x80;
    }
    else
    {
        gLinkArenaTeamList[teamA].unk_0f = teamA;
    }

    if (ReadMultiArenaSaveTeam(teamB, GetUnit(teamB * 5 + 1), gLinkArenaTeamList[teamB].name) == 0)
    {
        SioStrCpy(GetStringFromIndex(MSG_0CC), gLinkArenaTeamList[teamB].name); // "NO DATA"
        gLinkArenaTeamList[teamB].unk_0f = teamB | 0x80;
    }
    else
    {
        gLinkArenaTeamList[teamB].unk_0f = teamB;
    }

    DrawLinkArenaTeamName(teamB);
    DrawLinkArenaTeamName(teamA);

    UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

    Proc_End(proc->pSioHoldProc);

    proc->selectedOption = MULTIARENA_LIST_SWAP;

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x080437C0
int DrawLinkArenaTeamListMenu(u8 mode, struct SioTeamListProc * proc)
{
    int color;

    int i = 0;
    struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    if (mode == 1)
    {
        for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
        {
            SioStrCpy(GetStringFromIndex(MSG_76B), gUnk_Sio_14[i]); // "Empty"
            ClearText(&gLinkArenaSt.unk_64[i]);
            PutDrawTextCentered(&gLinkArenaSt.unk_64[i], 1, i * 3 + 5, gUnk_Sio_14[i], 10);
        }

        return gLinkArenaSt.unk_05 + 2;
    }

    while (1)
    {
        if (ptr[i].menuTextId == 0)
        {
            return i;
        }

        proc->validOptions[i] = 1;
        color = TEXT_COLOR_SYSTEM_WHITE;

        if (ptr[i].isValidFunc != NULL && !ptr[i].isValidFunc())
        {
            proc->validOptions[i] = 0;
            color = TEXT_COLOR_SYSTEM_GRAY;
        }

        ClearText(&gUnk_Sio_7[i]);
        Text_SetColor(&gUnk_Sio_7[i], color);
        PutDrawTextCentered(&gUnk_Sio_7[i], 1, i * 2 + 5, GetStringFromIndex(ptr[i].menuTextId), 7);

        i++;
    }
}

//! FE8U = 0x080438C0
u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc)
{
    struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    if (gLinkArenaSt.unk_00 != 1)
    {
        return ptr[proc->optionIdx].helpTextId;
    }

    if (proc->optionIdx == 0)
    {
        return MSG_742; // "Select your own team."
    }
    else
    {
        return MSG_743; // "Select team to battle."
    }
}

//! FE8U = 0x08043904
void SioTeamList_SetupGfx(struct SioTeamListProc * proc)
{
    int i;
    u8 buf[8];

    u16 * textPalette = Pal_Text;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_TacticianSelObj, OBJ_CHR_ADDR(0x240));
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 9, 4), Tsa_SioTeamList, TILEREF(0x0, 1));
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    Decompress(Img_LinkArenaMenuBanner, OBJ_CHR_ADDR(0x300));
    ApplyPalettes(Pal_SioTeamList, 0x11, 2);

    gPaletteBuffer[0x20] = 0;

    for (i = 0; i < 3; i++)
    {
        gPaletteBuffer[0x21 + i] = textPalette[4 + i];
    }

    EnablePaletteSync();

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    InitSioTexts();

    ApplyUnitSpritePalettes();
    ResetUnitSprites();
    ForceSyncUnitSpriteSheet();

    proc->unk_38 = LoadLinkArenaTeamList(proc->optionIdx, gLinkArenaSt.unk_00);

    for (i = 0; i < 5; i++)
    {
        buf[i] = 0;
    }

    buf[proc->optionIdx] = 1;

    proc->numActiveOptions = DrawLinkArenaTeamListMenu(gLinkArenaSt.unk_00, proc);

    DrawAllLinkArenaTeamNames(proc);

    proc->unk_2c = StartSioTeamMenuSpriteDraw(proc, proc->numActiveOptions, buf);

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.unk_06[i] = 0xff;
    }

    proc->unk_5c = 0;

    BG_SetPosition(BG_1, 0, proc->yBg1);

    SetWinEnable(1, 1, 0);

    SetWin0Box(0, 40, DISPLAY_WIDTH, 136);
    SetWin1Box(0, 136, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 0, 1, 1, 0);
    SetWOutLayers(1, 0, 1, 1, 1);

    StartLinkArenaTitleBanner(proc->unk_2c, gSioMain2_0[gLinkArenaSt.unk_00], 0);
    SetLinkArenaUiBlend();

    PutSioText(GetLATeamListHelpTextId(proc), 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08043B08
void SioTeamList_Main_HandleDPadInput(int * selection, u8 max, u8 min, u8 total)
{
    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0)
    {
        if (*selection > min || gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)
        {
            *selection = *selection - 1;

            if (*selection < 0)
            {
                *selection = total - 1;
            }
        }
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0)
    {
        if (*selection < max || gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)
        {
            *selection = *selection + 1;
            *selection = *selection % total;
        }
    }

    return;
}

//! FE8U = 0x08043B6C
void SioTeamList_Loop_MainKeyHandler(struct SioTeamListProc * proc)
{
    int previous = proc->optionIdx;

    struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    struct SioProc85AAA78 * unk_2C = proc->unk_2c;
    unk_2C->unk_44 = 1;
    unk_2C->unk_48 = -1;

    SioTeamList_Main_HandleDPadInput(&proc->optionIdx, proc->numActiveOptions - 1, 0, proc->numActiveOptions);

    if (previous != proc->optionIdx)
    {
        SioPlaySoundEffect(3);

        unk_2C->unk_3a[previous] = 0;
        unk_2C->unk_3a[proc->optionIdx] = 1;

        UpdateLinkArenaTeamNamePalettes(proc, gLinkArenaSt.unk_00);
        PutSioText(GetLATeamListHelpTextId(proc), 1);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        if (gLinkArenaSt.unk_00 != 1)
        {
            if (proc->validOptions[proc->optionIdx] != 0)
            {
                proc->selectedOption = ptr[proc->optionIdx].kind;

                if (proc->selectedOption == MULTIARENA_LIST_LINKMENU)
                {
                    SioPlaySoundEffect(1);
                    Proc_Goto(proc, 9);
                    gLinkArenaSt.unk_03 = 0xff;
                    return;
                }

                SioPlaySoundEffect(2);

                Proc_Break(proc);
            }
            else
            {
                SioPlaySoundEffect(0);
            }
        }
        else
        {
            SioPlaySoundEffect(2);

            proc->selectedOption = MULTIARENA_LIST_8;
            proc->selectedTeam = proc->optionIdx;
            proc->unk_44 = 0;

            Proc_Goto(proc, 5);

            return;
        }
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Goto(proc, 9);
        gLinkArenaSt.unk_03 = 0xff;
    }

    if (((gKeyStatusPtr->newKeys & START_BUTTON) != 0) && (proc->unk_5c != 0))
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        gLinkArenaSt.unk_03 = 0;
        Proc_Goto(proc, 9);
    }

    return;
}

//! FE8U = 0x08043CF4
void SioTeamList_StartUnitList(struct SioTeamListProc * proc)
{
    u8 buf[16];
    struct Unit * unit;

    Proc_End(proc->unk_2c);
    Nop_SioUiutils_0();
    EndMuralBackground();

    InitUnits();

    unit = GetUnit(1);
    ReadMultiArenaSaveTeam(gLinkArenaTeamList[proc->unk_40].unk_0f, unit, buf);

    StartUnitListScreenUnk(proc);

    return;
}

//! FE8U = 0x08043D3C
void SioTeamList_WaitForUnitListScreen(ProcPtr proc)
{
    if (Proc_Find(ProcScr_UnitListScreen_PrepMenu) == NULL)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08043D5C
int AreAllLinkArenaTeamsSelected(void)
{
    int i;

    for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
    {
        if (gLinkArenaSt.unk_06[i] == 0xFF)
        {
            return 0;
        }
    }

    return 1;
}

//! FE8U = 0x08043D8C
void SioTeamList_0(struct SioTeamListProc * proc)
{
    int unk_40 = proc->unk_40;
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    if ((IsKeyInputSequenceComplete(gSioList_SioMain2_1)) && ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0))
    {
        Proc_Goto(proc, 8);
        return;
    }

    unk_2C->unk_44 = 0;
    unk_2C->unk_48 = (proc->unk_40 - proc->unk_48) * 16 + 40;

    if (proc->unk_4c > 0)
    {
        proc->yBg1 -= 4;
        proc->unk_4c--;

        BG_SetPosition(BG_1, 0, proc->yBg1);

        if (proc->pSioHoldProc != NULL)
        {
            MoveSioHold(proc->pSioHoldProc, +4);
        }

        ScrollMultiArenaTeamSprites(+4);

        DisplayUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);
        UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

        return;
    }
    else if (proc->unk_4c < 0)
    {
        proc->yBg1 += 4;
        proc->unk_4c++;

        BG_SetPosition(BG_1, 0, proc->yBg1);

        if (proc->pSioHoldProc != NULL)
        {
            MoveSioHold(proc->pSioHoldProc, -4);
        }

        ScrollMultiArenaTeamSprites(-4);

        DisplayUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);
        UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

        return;
    }

    DisplayUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        switch (proc->selectedOption)
        {
            case MULTIARENA_LIST_BUILDTEAM:
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) != 0)
                {
                    SioPlaySoundEffect(2);
                    gLinkArenaSt.unk_03 = proc->unk_40;
                    Proc_Break(proc);

                    return;
                }

                SioPlaySoundEffect(0);

                break;

            case MULTIARENA_LIST_SELECTTEAM:
                SioPlaySoundEffect(2);
                gLinkArenaSt.unk_03 = gLinkArenaTeamList[unk_40].unk_0f;
                Proc_Break(proc);

                return;

            case MULTIARENA_LIST_UNITLIST:
                // Unit List
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0)
                {
                    SioPlaySoundEffect(2);
                    Proc_Goto(proc, 4);
                    return;
                }

                SioPlaySoundEffect(0);

                break;

            case MULTIARENA_LIST_SWAP:
                if (proc->unk_38 > 1)
                {
                    SioPlaySoundEffect(2);

                    proc->selectedTeam = unk_40;
                    proc->pSioHoldProc =
                        StartSioHold(proc, 80, (proc->selectedTeam - proc->unk_48) * 16 + 40, 0x88, 0x27);

                    if (unk_40 + 1 < proc->unk_38)
                    {
                        gKeyStatusPtr->repeatedKeys |= DPAD_DOWN;
                    }
                    else
                    {
                        gKeyStatusPtr->repeatedKeys |= DPAD_UP;
                    }

                    proc->selectedOption = MULTIARENA_LIST_CONFIRMSWAP;
                }

                break;

            case MULTIARENA_LIST_LINKMENU:
                break;

            case MULTIARENA_LIST_CONFIRMSWAP:
                SioPlaySoundEffect(2);
                SioTeamList_SwapTeams(proc);

                break;

            case MULTIARENA_LIST_DISBAND:
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0)
                {
                    SioPlaySoundEffect(2);
                    proc->pSioHoldProc = StartSioHold(proc, 80, (unk_40 - proc->unk_48) * 16 + 40, 0x88, 0x27);
                    Proc_Goto(proc, 7);
                }
                else
                {
                    SioPlaySoundEffect(0);
                }

                break;

            case MULTIARENA_LIST_8:
                // Team selected (Practice or Battle)
                SioPlaySoundEffect(2);

                SioStrCpy(gLinkArenaTeamList[unk_40].name, gUnk_Sio_14[proc->selectedTeam]);

                gLinkArenaSt.unk_06[proc->selectedTeam] = gLinkArenaTeamList[unk_40].unk_0f;

                ClearText(&gLinkArenaSt.unk_64[proc->selectedTeam]);
                PutDrawTextCentered(
                    &gLinkArenaSt.unk_64[proc->selectedTeam], 1, proc->selectedTeam * 3 + 5,
                    gUnk_Sio_14[proc->selectedTeam], 10);

                proc->unk_5c = AreAllLinkArenaTeamsSelected();

                if ((proc->unk_5c != 0) && (unk_2C->unk_40 == 0))
                {
                    unk_2C->unk_40 = 8;
                }

                proc->unk_44 = 0;

                Proc_Goto(proc, 6);

                break;
        }
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        if (proc->selectedOption == MULTIARENA_LIST_CONFIRMSWAP)
        {
            proc->selectedOption = MULTIARENA_LIST_SWAP;
            Proc_End(proc->pSioHoldProc);
            return;
        }

        if (proc->selectedOption != MULTIARENA_LIST_8)
        {
            Proc_Goto(proc, 2);
        }
        else
        {
            proc->unk_44 = 0;
            Proc_Goto(proc, 6);
        }
    }

    if (((gKeyStatusPtr->newKeys & START_BUTTON) != 0) && (proc->unk_5c != 0))
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        gLinkArenaSt.unk_03 = 0;
        Proc_Goto(proc, 9);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0)
    {
        if ((proc->unk_48 != 0) && ((proc->unk_40 - proc->unk_48) < 2))
        {
            proc->yBg1 -= 4;

            if (proc->pSioHoldProc != NULL)
            {
                MoveSioHold(proc->pSioHoldProc, +4);
            }

            ScrollMultiArenaTeamSprites(+4);

            proc->unk_48--;
            proc->unk_4c = +3;
            proc->unk_40--;

            BG_SetPosition(BG_1, 0, proc->yBg1);

            UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);
        }
        else
        {
            if (proc->unk_40 > 0)
            {
                proc->unk_40--;
            }
        }
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0)
    {
        if (((proc->unk_38 > 6) && ((proc->unk_48 + 6) < proc->unk_38)) && ((proc->unk_40 - proc->unk_48) > 3))
        {
            proc->yBg1 += 4;

            if (proc->pSioHoldProc != 0)
            {
                MoveSioHold(proc->pSioHoldProc, -4);
            }

            ScrollMultiArenaTeamSprites(-4);

            proc->unk_48++;
            proc->unk_4c = -3;
            proc->unk_40++;

            BG_SetPosition(BG_1, 0, proc->yBg1);

            UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);
        }
        else
        {
            if (proc->unk_40 < proc->unk_38 - 1)
            {
                proc->unk_40++;
            }
        }
    }

    if (unk_40 != proc->unk_40)
    {
        SioPlaySoundEffect(3);
    }

    return;
}

//! FE8U = 0x08044280
void SioTeamList_SetTeamSpriteXOffsets(struct SioProc85AAA78 * proc, s8 b)
{
    int i;

    for (i = 0; i < 5; i++)
    {
        proc->unk_30[i] = -b - 8;
    }

    return;
}

//! FE8U = 0x0804429C
void SioTeamList_1(struct SioTeamListProc * proc)
{
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    s8 xPos = gSioMain2_1[proc->unk_44];

    if (xPos == -1)
    {
        Proc_Goto(proc, 3);
    }

    proc->unk_44++;

    if (xPos == -2)
    {
        gLCDControlBuffer.bg1cnt.priority = 0;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg0cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        unk_2C->unk_44 = 0;
    }
    else
    {
        BG_SetPosition(BG_0, xPos, 0);
        SioTeamList_SetTeamSpriteXOffsets(unk_2C, xPos);
    }

    return;
}

//! FE8U = 0x08044324
void SioTeamList_2(struct SioTeamListProc * proc)
{
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    s8 xPos = gSioMain2_1[proc->unk_44];

    if (xPos == -1)
    {
        Proc_Goto(proc, 2);
    }

    proc->unk_44++;

    if (xPos == -2)
    {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        unk_2C->unk_44 = 1;
        unk_2C->unk_48 = -1;
    }
    else
    {
        BG_SetPosition(BG_0, xPos, 0);
        SioTeamList_SetTeamSpriteXOffsets(unk_2C, xPos);
    }

    return;
}

//! FE8U = 0x080443B0
void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc)
{
    int var;

    proc->unk_55 = 1;

    LoadLinkArenaChoiceBoxGfx();

    var = proc->unk_40 - proc->unk_48;

    if (var > 2)
    {
        proc->unk_58 = var * 2 - 2;
    }
    else
    {
        proc->unk_58 = var * 2 + 5;
    }

    ClearText(&Texts_0);
    Text_DrawString(&Texts_0, GetStringFromIndex(MSG_140)); // "Erase"
    Text_SetCursor(&Texts_0, 38);
    Text_DrawString(&Texts_0, GetStringFromIndex(MSG_141)); // "Back"
    PutText(&Texts_0, TILEMAP_LOCATED(gBG0TilemapBuffer, 15, (proc->unk_58 + 4)));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08044430
void SioTeamList_EraseTeam_KeyHandler(struct SioTeamListProc * proc)
{
    PutLinkArenaChoiceBannerSprite(96, proc->unk_58 * 8 + 24);

    if (((gKeyStatusPtr->newKeys & DPAD_LEFT) != 0) && (proc->unk_55 == 1))
    {
        proc->unk_55 = 0;
        SioPlaySoundEffect(3);
    }

    if (((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0) && (proc->unk_55 == 0))
    {
        proc->unk_55 = 1;
        SioPlaySoundEffect(3);
    }

    DisplayUiHand(proc->unk_55 * 40 + 112, proc->unk_58 * 8 + 32);

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        Proc_End(proc->pSioHoldProc);

        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, proc->unk_58 + 4), 12, 2, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        Proc_Break(proc);
    }
    else if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        Proc_End(proc->pSioHoldProc);

        if (proc->unk_55 == 0)
        {
            SioTeamList_EraseTeam(proc);
            SioPlaySoundEffect(2);
        }
        else
        {
            SioPlaySoundEffect(1);
        }

        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, proc->unk_58 + 4), 12, 2, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08044530
void SioTeamList_LoadTeam_Dummy(struct SioTeamListProc * proc)
{
    // Probably dummied-out logic for the FE6 Link Arena password

    char buf[16];

    ReadMultiArenaSaveTeam(proc->unk_40, GetUnit(1), buf);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SioTeamList[] =
{
    PROC_YIELD,

PROC_LABEL(0),
    PROC_CALL(SioTeamList_Init),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(SioTeamList_SetupGfx),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(ClearLinkArenaUiBlendWindow),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(SioTeamList_Loop_MainKeyHandler),

    // fallthrough

PROC_LABEL(3),
    PROC_REPEAT(SioTeamList_0),

    PROC_GOTO(9),

PROC_LABEL(4),
    PROC_CALL(SetLinkArenaUiBlendWindow),

    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_YIELD,

    PROC_CALL(SioTeamList_StartUnitList),

    PROC_REPEAT(SioTeamList_WaitForUnitListScreen),

    PROC_CALL(SioTeamList_SetupGfx),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(ClearLinkArenaUiBlendWindow),

    PROC_GOTO(2),

PROC_LABEL(5),
    PROC_REPEAT(SioTeamList_1),

    // fallthrough

PROC_LABEL(6),
    PROC_REPEAT(SioTeamList_2),

    // fallthrough

PROC_LABEL(7),
    PROC_CALL(SioTeamList_StartEraseTeamSubMenu),
    PROC_REPEAT(SioTeamList_EraseTeam_KeyHandler),

    PROC_GOTO(3),

PROC_LABEL(8), /* Label for the Battle Password logic in FE6 */
    PROC_CALL(SetLinkArenaUiBlendWindow),

    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_YIELD,

    PROC_CALL(SioTeamList_LoadTeam_Dummy),
    PROC_YIELD,

    PROC_GOTO(1),

PROC_LABEL(9),
    PROC_CALL(EndMuralBackground),

    PROC_CALL(SetLinkArenaUiBlendWindow),

    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_YIELD,

    PROC_END,
};

// clang-format on
