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

int sub_80437C0(u8, struct SioTeamListProc *);
bool CanBuildNewLinkArenaTeam(void);
bool sub_8043394(void);

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
        .helpTextId = 0x073C, // TODO: msgid "Build a new team."
        .unk_04 = 1,
        .unk_05 = 0,
        .menuTextId = 0x0766, // TODO: msgid "Build Team"
        .isValidFunc = CanBuildNewLinkArenaTeam,
    },
    [1] =
    {
        .kind = MULTIARENA_LIST_UNITLIST,
        .helpTextId = 0x073D, // TODO: msgid "View all units on team."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = 0x0767, // TODO: msgid "Unit List"
        .isValidFunc = sub_8043394,
    },
    [2] =
    {
        .kind = MULTIARENA_LIST_SWAP,
        .helpTextId = 0x073E, // TODO: msgid "Switch teams."
        .unk_04 = 0,
        .unk_05 = 0,
        .menuTextId = 0x0768, // TODO: msgid "Swap"
        .isValidFunc = NULL,
    },
    [3] =
    {
        .kind = MULTIARENA_LIST_DISBAND,
        .helpTextId = 0x073F, // TODO: msgid "Disband teams."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = 0x0769, // TODO: msgid "Disband"
        .isValidFunc = sub_8043394,
    },
    [4] =
    {
        .kind = MULTIARENA_LIST_LINKMENU,
        .helpTextId = 0x0740, // TODO: msgid "Return to link menu."
        .unk_04 = 0,
        .unk_05 = 0,
        .menuTextId = 0x076A, // TODO: msgid "Link Menu"
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
        .helpTextId = 0x0741, // TODO: msgid "Select team for battle."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = 0x076C, // TODO: msgid "Team"
        .isValidFunc = NULL,
    },
    [1] =
    {
        .kind = MULTIARENA_LIST_UNITLIST,
        .helpTextId = 0x073D, // TODO: msgid "View all units on team."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = 0x0767, // TODO: msgid "Unit List"
        .isValidFunc = NULL,
    },
    [2] =
    {
        .kind = MULTIARENA_LIST_LINKMENU,
        .helpTextId = 0x0740, // TODO: msgid "Return to link menu."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = 0x076A, // TODO: msgid "Link Menu"
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

extern char gUnk_Sio_0203DD50[][MULTIARENA_TEAMNAME_SIZE + 1];
extern struct Text gUnk_Sio_0203DA88[];

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
bool sub_8043394(void)
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
int sub_80433C0(int activeOption, u8 mode)
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
                    SioStrCpy(GetStringFromIndex(0xcc), gLinkArenaTeamList[i].name);
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
void sub_804352C(struct SioTeamListProc * proc)
{
    int i;

    for (i = 0; i < proc->unk_38; i++)
    {
        DrawLinkArenaTeamName(i);
    }

    return;
}

//! FE8U = 0x08043548
void sub_8043548(struct SioTeamListProc * proc, u8 mode)
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

    SioStrCpy(GetStringFromIndex(0xcc), gLinkArenaTeamList[team].name);

    gLinkArenaTeamList[team].unk_10 = ptr[proc->optionIdx].unk_05;
    gLinkArenaTeamList[team].unk_0f = team | 0x80;
    DrawLinkArenaTeamName(team);

    if (!sub_8043394())
    {
        sub_80437C0(gLinkArenaSt.unk_00, proc);
        Proc_Goto(proc, 2);
    }
    else if (proc->validOptions[0] == 0)
    {
        sub_80437C0(gLinkArenaSt.unk_00, proc);
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
        SioStrCpy(GetStringFromIndex(0xcc), gLinkArenaTeamList[teamA].name);
        gLinkArenaTeamList[teamA].unk_0f = teamA | 0x80;
    }
    else
    {
        gLinkArenaTeamList[teamA].unk_0f = teamA;
    }

    if (ReadMultiArenaSaveTeam(teamB, GetUnit(teamB * 5 + 1), gLinkArenaTeamList[teamB].name) == 0)
    {
        SioStrCpy(GetStringFromIndex(0xcc), gLinkArenaTeamList[teamB].name);
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
int sub_80437C0(u8 mode, struct SioTeamListProc * proc)
{
    int color;

    int i = 0;
    struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    if (mode == 1)
    {
        for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
        {
            SioStrCpy(GetStringFromIndex(0x76B), gUnk_Sio_0203DD50[i]);
            ClearText(&gLinkArenaSt.unk_64[i]);
            PutDrawTextCentered(&gLinkArenaSt.unk_64[i], 1, i * 3 + 5, gUnk_Sio_0203DD50[i], 10);
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

        ClearText(&gUnk_Sio_0203DA88[i]);
        Text_SetColor(&gUnk_Sio_0203DA88[i], color);
        PutDrawTextCentered(&gUnk_Sio_0203DA88[i], 1, i * 2 + 5, GetStringFromIndex(ptr[i].menuTextId), 7);

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
        return 0x742; // TODO: msgid "Select your own team."
    }
    else
    {
        return 0x743; // TODO: msgid "Select team to battle."
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

    Decompress(Img_TacticianSelObj, (void *)(0x06014800));
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 9, 4), gUnknown_085ADF40, 0x1000);
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    Decompress(gUnknown_085AC604, (void *)(0x06016000));
    ApplyPalettes(gUnknown_08A1BD00, 0x11, 2);

    gPaletteBuffer[0x20] = 0;

    for (i = 0; i < 3; i++)
    {
        gPaletteBuffer[0x21 + i] = textPalette[4 + i];
    }

    EnablePaletteSync();

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    sub_8043164();

    SetupMapSpritesPalettes();
    ResetUnitSprites();
    ForceSyncUnitSpriteSheet();

    proc->unk_38 = sub_80433C0(proc->optionIdx, gLinkArenaSt.unk_00);

    for (i = 0; i < 5; i++)
    {
        buf[i] = 0;
    }

    buf[proc->optionIdx] = 1;

    proc->numActiveOptions = sub_80437C0(gLinkArenaSt.unk_00, proc);

    sub_804352C(proc);

    proc->unk_2c = sub_804CAEC(proc, proc->numActiveOptions, buf);

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

    StartLinkArenaTitleBanner(proc->unk_2c, gUnknown_080D9D5E[gLinkArenaSt.unk_00], 0);
    sub_804C558();

    sub_8043100(GetLATeamListHelpTextId(proc), 1);

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

        sub_8043548(proc, gLinkArenaSt.unk_00);
        sub_8043100(GetLATeamListHelpTextId(proc), 1);
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
        PlaySoundEffect(0x6a);
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
    nullsub_13();
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
int sub_8043D5C(void)
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
void SioTeamList_8043D8C(struct SioTeamListProc * proc)
{
    int unk_40 = proc->unk_40;
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    if ((IsKeyInputSequenceComplete(gSioList_085A93E0)) && ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0))
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
            sub_804303C(proc->pSioHoldProc, +4);
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
            sub_804303C(proc->pSioHoldProc, -4);
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

                SioStrCpy(gLinkArenaTeamList[unk_40].name, gUnk_Sio_0203DD50[proc->selectedTeam]);

                gLinkArenaSt.unk_06[proc->selectedTeam] = gLinkArenaTeamList[unk_40].unk_0f;

                ClearText(&gLinkArenaSt.unk_64[proc->selectedTeam]);
                PutDrawTextCentered(
                    &gLinkArenaSt.unk_64[proc->selectedTeam], 1, proc->selectedTeam * 3 + 5,
                    gUnk_Sio_0203DD50[proc->selectedTeam], 10);

                proc->unk_5c = sub_8043D5C();

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
        PlaySoundEffect(0x6a);
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
                sub_804303C(proc->pSioHoldProc, +4);
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
                sub_804303C(proc->pSioHoldProc, -4);
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
void sub_8044280(struct SioProc85AAA78 * proc, s8 b)
{
    int i;

    for (i = 0; i < 5; i++)
    {
        proc->unk_30[i] = -b - 8;
    }

    return;
}

//! FE8U = 0x0804429C
void SioTeamList_804429C(struct SioTeamListProc * proc)
{
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    s8 xPos = gUnknown_080D9D61[proc->unk_44];

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
        sub_8044280(unk_2C, xPos);
    }

    return;
}

//! FE8U = 0x08044324
void SioTeamList_8044324(struct SioTeamListProc * proc)
{
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    s8 xPos = gUnknown_080D9D61[proc->unk_44];

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
        sub_8044280(unk_2C, xPos);
    }

    return;
}

//! FE8U = 0x080443B0
void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc)
{
    int var;

    proc->unk_55 = 1;

    sub_804D80C();

    var = proc->unk_40 - proc->unk_48;

    if (var > 2)
    {
        proc->unk_58 = var * 2 - 2;
    }
    else
    {
        proc->unk_58 = var * 2 + 5;
    }

    ClearText(&Texts_0203DAB0);
    Text_DrawString(&Texts_0203DAB0, GetStringFromIndex(0x140)); // TODO: msgid "Erase"
    Text_SetCursor(&Texts_0203DAB0, 38);
    Text_DrawString(&Texts_0203DAB0, GetStringFromIndex(0x141)); // TODO: msgid "Back"
    PutText(&Texts_0203DAB0, TILEMAP_LOCATED(gBG0TilemapBuffer, 15, (proc->unk_58 + 4)));

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

    PROC_CALL(Clear_0203DDDC),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(SioTeamList_Loop_MainKeyHandler),

    // fallthrough

PROC_LABEL(3),
    PROC_REPEAT(SioTeamList_8043D8C),

    PROC_GOTO(9),

PROC_LABEL(4),
    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(SioTeamList_StartUnitList),

    PROC_REPEAT(SioTeamList_WaitForUnitListScreen),

    PROC_CALL(SioTeamList_SetupGfx),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_0203DDDC),

    PROC_GOTO(2),

PROC_LABEL(5),
    PROC_REPEAT(SioTeamList_804429C),

    // fallthrough

PROC_LABEL(6),
    PROC_REPEAT(SioTeamList_8044324),

    // fallthrough

PROC_LABEL(7),
    PROC_CALL(SioTeamList_StartEraseTeamSubMenu),
    PROC_REPEAT(SioTeamList_EraseTeam_KeyHandler),

    PROC_GOTO(3),

PROC_LABEL(8), /* Label for the Battle Password logic in FE6 */
    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(SioTeamList_LoadTeam_Dummy),
    PROC_YIELD,

    PROC_GOTO(1),

PROC_LABEL(9),
    PROC_CALL(EndMuralBackground),

    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_END,
};

// clang-format on
