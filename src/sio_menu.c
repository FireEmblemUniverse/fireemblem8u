#include "global.h"

#include "bmsave.h"
#include "bmlib.h"
#include "face.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmio.h"
#include "uiutils.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08047A54
int SioMenu_GetItemHelpText(struct SioMenuProc * proc, int lineNum)
{
    // clang-format off

    int linkMenuMsgLut[] =
    {
        MSG_736, -1, // "Build or edit a multiplayer team."
        MSG_737, MSG_738, // "Battle the computer." / "Set team # with + Control Pad."
        MSG_739, -1, // "Battle against a linked player."
        MSG_73A, -1, // "Confirm battle records to date."
        MSG_73B, -1, // "Set combat rules."
    };

    // clang-format on

    if (lineNum == 0)
    {
        if (proc->unk_58 == 0)
        {
            return MSG_735; // "Select Edit Teams to build a team."
        }
    }
    else
    {
        if (proc->unk_58 == 0)
        {
            return -1;
        }
    }

    return linkMenuMsgLut[proc->unk_48 * 2 + lineNum];
}

//! FE8U = 0x08047AB8
bool CheckSomethingSaveRelated(void)
{
    int i;
    struct PlaySt playSt;

    for (i = 0; i < 3; i++)
    {
        if (!IsSaveValid(i))
        {
            continue;
        }

        ReadGameSavePlaySt(i, &playSt);

        if (IsGameNotFirstChapter(&playSt))
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x08047AF4
void SioMenu_Init(void)
{
    int i;

    gLinkArenaSt.unk_0A = CheckSomethingSaveRelated();

    for (i = 0; i < 0x10; i++)
    {
        gKeyInputSequenceBuffer[i] = 0;
    }

    gCurrentKeyInSeqIndex = gTargetKeyInSeqIndex = gKeyInputSequenceTimer = 0;

    return;
}

// clang-format off

struct FaceVramEntry CONST_DATA FaceConfig_SioMenu_0[] =
{
    0x7000, 1,
    0x7000, 1,
    0x7000, 1,
    0x7000, 1,
};

// clang-format on

//! FE8U = 0x08047B34
void SioMenu_LoadGraphics(struct SioMenuProc * proc)
{
    int enabled;
    int i;

    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    proc->unk_59 = gSioSaveConfig._unk3_;

    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0x10, 4, 0);

    Decompress(Img_LinkArenaMenu, OBJ_CHR_ADDR(0x240));
    ApplyPalettes(Pal_LinkArenaMenu, 0x13, 3);

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    InitSioTexts();

    proc->unk_4c = 0;

    proc->unk_58 = IsMultiArenaSaveReady();
    proc->menuItemState[0] = true;

    enabled = proc->unk_58 != 0;
    proc->menuItemState[1] = enabled;
    proc->menuItemState[2] = enabled;
    proc->menuItemState[3] = enabled;

    if (proc->unk_59 == 0)
    {
        enabled = false;
        proc->unk_50 = 3;
    }
    else
    {
        enabled = true;
        proc->unk_50 = 4;
    }

    proc->menuItemState[4] = enabled;

    proc->unk_48 = gLinkArenaSt.unk_01;
    proc->menuItemState[proc->unk_48] = 2;

    for (i = 4; i >= 0; i--)
    {
        proc->menuItems[i] = StartSioMenuItem(proc, 176, 160, i, proc->menuItemState[i]);
    }

    StartLinkArenaTitleBanner(proc->menuItems[0], 0, 0);
    SetLinkArenaUiBlendAndWindowOff();

    SetupFaceGfxData(FaceConfig_SioMenu_0);
    StartFace(3, FID_ANNA, 208, 80, FACE_DISP_KIND(FACE_96x80));

    proc->unk_54 = 0;

    StartBgm(SONG_COLOSSEUM_ENTRANCE, 0);
    LinkArenaBattleMap_InitConfig();

    return;
}

// clang-format off

const u8 gSioMenu_0[] =
{
    120, 16,
     96, 36,
     72, 56,
     48, 76,
     24, 96,
      0,  0,
};

// clang-format on

//! FE8U = 0x08047C60
void SioMenu_0(struct SioMenuProc * proc)
{
    int i;

    int x = Interpolate(INTERPOLATE_RSQUARE, -80, gSioMenu_0[0], proc->unk_54, 32);
    int y = Interpolate(INTERPOLATE_RCUBIC, 160, gSioMenu_0[1], proc->unk_54, 32);

    for (i = 4; i >= 0; i--)
    {
        SioMenuItem_SetPosition(proc->menuItems[i], x, y);
    }

    if (proc->unk_54 >= 32)
    {
        proc->unk_54 = 0;

        PutSioText(SioMenu_GetItemHelpText(proc, 0), 0);
        PutSioText(SioMenu_GetItemHelpText(proc, 1), 1);

        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

//! FE8U = 0x08047CF0
void SioMenu_AnimateItemsSpreadFromSelection(struct SioMenuProc * proc)
{
    int i;

    int idx = proc->unk_48 * 2;

    for (i = 4; i >= 0; i--)
    {
        int x = Interpolate(
            INTERPOLATE_RSQUARE, gSioMenu_0[idx + 0], gSioMenu_0[i * 2 + 0], proc->unk_54, 16);
        int y = Interpolate(
            INTERPOLATE_RSQUARE, gSioMenu_0[idx + 1], gSioMenu_0[i * 2 + 1], proc->unk_54, 16);
        SioMenuItem_SetPosition(proc->menuItems[i], x, y);
    }

    if (proc->unk_54 >= 16)
    {
        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

// clang-format off

struct FaceVramEntry CONST_DATA FaceConfig_SioMenu_1[] =
{
    0x7000, 1,
    0x7000, 1,
    0x7000, 1,
    0x7000, 1,
};

// clang-format on

//! FE8U = 0x08047D88
void SioMenu_RestartGraphicsMaybe(struct SioMenuProc * proc)
{
    int enabled;
    int i;
    int idx;

    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    proc->unk_59 = gSioSaveConfig._unk3_;

    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0x10, 4, 0);

    Decompress(Img_LinkArenaMenu, OBJ_CHR_ADDR(0x240));
    ApplyPalettes(Pal_LinkArenaMenu, 0x13, 3);

    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    InitSioTexts();

    proc->unk_4c = 0;

    proc->unk_58 = IsMultiArenaSaveReady();
    proc->menuItemState[0] = true;

    enabled = proc->unk_58 != 0;
    proc->menuItemState[1] = enabled;
    proc->menuItemState[2] = enabled;
    proc->menuItemState[3] = enabled;

    if (proc->unk_59 == 0)
    {
        enabled = false;
        proc->unk_50 = 3;
    }
    else
    {
        enabled = true;
        proc->unk_50 = 4;
    }

    proc->menuItemState[4] = enabled;

    proc->unk_48 = gLinkArenaSt.unk_01;
    proc->menuItemState[proc->unk_48] = 2;

    idx = proc->unk_48 * 2;

    for (i = 4; i >= 0; i--)
    {
        proc->menuItems[i] = StartSioMenuItem(proc, gSioMenu_0[idx + 0], gSioMenu_0[idx + 1], i, proc->menuItemState[i]);
    }

    StartLinkArenaTitleBanner(proc->menuItems[0], 0, 0);
    SetLinkArenaUiBlendAndWindowOff();

    SetupFaceGfxData(FaceConfig_SioMenu_1);
    StartFace(3, FID_ANNA, 208, 80, FACE_DISP_KIND(FACE_96x80));

    PutSioText(SioMenu_GetItemHelpText(proc, 0), 0);
    PutSioText(SioMenu_GetItemHelpText(proc, 1), 1);
    LinkArenaBattleMap_InitConfig();

    StartBgm(SONG_COLOSSEUM_ENTRANCE, 0);

    proc->unk_54 = 0;

    return;
}

//! FE8U = 0x08047EF8
void SioMenu_HandleDPadInput(struct SioMenuProc * proc, u8 b)
{
    if (proc->unk_48 == 1)
    {
        if ((gKeyStatusPtr->newKeys & DPAD_LEFT) != 0)
        {

            gLinkArenaSt.unk_05--;
            if (gLinkArenaSt.unk_05 > 2)
            {
                gLinkArenaSt.unk_05 = 2;
            }

            SioMenuItem_SetArrowConfig(proc->menuItems[1], -6, 0x34, 0x1f, 4);
            SioPlaySoundEffect(3);
        }

        if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0)
        {
            gLinkArenaSt.unk_05++;
            gLinkArenaSt.unk_05 = gLinkArenaSt.unk_05 % 3;

            SioMenuItem_SetArrowConfig(proc->menuItems[1], 0, 0x3a, 4, 0x1f);
            SioPlaySoundEffect(3);
        }
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) &&
        ((proc->unk_48 > proc->unk_4c) || (gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)))
    {
        do
        {
            proc->unk_48--;
            if (proc->unk_48 < 0)
            {
                proc->unk_48 = b - 1;
            }
        } while (proc->menuItemState[proc->unk_48] == 0);
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) &&
        ((proc->unk_48 < proc->unk_50) || (gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)))
    {
        do
        {
            proc->unk_48++;
            proc->unk_48 = proc->unk_48 % b;
        } while (proc->menuItemState[proc->unk_48] == 0);
    }
    return;
}

//! FE8U = 0x08047FF8
void SioMenu_Loop_HandleKeyInput(struct SioMenuProc * proc)
{
    int idx;

    idx = proc->unk_48;
    SioMenu_HandleDPadInput(proc, 5);

    if (idx != proc->unk_48)
    {
        struct SioMenuItemProc * child;

        SioPlaySoundEffect(3);

        child = proc->menuItems[idx];
        child->state = 1;

        child = proc->menuItems[proc->unk_48];
        child->state = 2;

        StartSioMenuBurstFx(child, child->xBase, child->yBase);

        PutSioText(SioMenu_GetItemHelpText(proc, 0), 0);
        PutSioText(SioMenu_GetItemHelpText(proc, 1), 1);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        proc->unk_54 = 0;
        SioPlaySoundEffect(2);
        gLinkArenaSt.unk_00 = proc->unk_48;
        Proc_Break(proc);
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Sound_FadeOutBGM(2);
        gLinkArenaSt.unk_00 = 0xff;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080480B4
void SioMenu_1(struct SioMenuProc * proc)
{
    int r2;
    int i;

    if (gLinkArenaSt.unk_00 == 0xFF)
    {
        Proc_Break(proc);
    }

    r2 = gLinkArenaSt.unk_00;

    if (proc->unk_54 <= 16)
    {
        for (i = 4; i >= 0; i--)
        {
            int x = Interpolate(
                INTERPOLATE_RSQUARE, gSioMenu_0[i * 2 + 0], gSioMenu_0[r2 * 2 + 0], proc->unk_54, 0x10);
            int y = Interpolate(
                INTERPOLATE_RSQUARE, gSioMenu_0[i * 2 + 1], gSioMenu_0[r2 * 2 + 1], proc->unk_54, 0x10);
            SioMenuItem_SetPosition(proc->menuItems[i], x, y);
        }
    }

    if (proc->unk_54 > 32)
    {
        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

//! FE8U = 0x08048168
void SioMenu_End(struct SioMenuProc * proc)
{
    int i;

    struct ProcCmd * SioMenuProcLut[5] = {
        ProcScr_SIOTERM, // Edit Teams
        ProcScr_SIOPRA, // Practice
        ProcScr_SIOBAT, // Linked Battle
        ProcScr_SIORESULT, // Battle Data
        ProcScr_SIO_RuleSettings, // Rule Settings
    };

    EndMuralBackground();
    EndFaceById(3);

    for (i = 0; i < 5; i++)
    {
        Proc_End(proc->menuItems[i]);
    }

    if (gLinkArenaSt.unk_00 == 0xFF)
    {
        BMapVSync_End();
        Nop_SioUiutils_0();

        UnsetBmStLinkArenaFlag();

        Proc_EndEach(ProcScr_DebugMonitor);
        Proc_End(proc);
    }
    else
    {
        gLinkArenaSt.unk_01 = gLinkArenaSt.unk_00;
        Proc_StartBlocking(SioMenuProcLut[gLinkArenaSt.unk_00], proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SIOMENU[] =
{
    PROC_NAME("SIOMENU"),

PROC_LABEL(0),
    PROC_CALL(SioMenu_Init),
    PROC_CALL(SioMenu_LoadGraphics),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(ClearLinkArenaUiBlendWindow),
    PROC_REPEAT(SioMenu_0),

    PROC_GOTO(2),

PROC_LABEL(1),
    PROC_CALL(SioMenu_RestartGraphicsMaybe),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,
    PROC_CALL(ClearLinkArenaUiBlendWindow),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(SioMenu_AnimateItemsSpreadFromSelection),
    PROC_REPEAT(SioMenu_Loop_HandleKeyInput),
    PROC_REPEAT(SioMenu_1),

    PROC_CALL(SetLinkArenaUiBlendWindow),

    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_YIELD,

    PROC_CALL(SioMenu_End),
    PROC_SLEEP(1),

    PROC_GOTO(1),
};

// clang-format on

//! FE8U = 0x080481E0
void StartLinkArenaMainMenu(ProcPtr parent)
{
    LoadUiFrameGraphics();
    InitTextFont(&Font_0, BG_CHR_ADDR(0xC0), 0xc0, 0);

    if (!IsSaveValid(SAVE_ID_ARENA))
    {
        WriteNewMultiArenaSave();
    }

    gLinkArenaSt.unk_05 = 0;
    gLinkArenaSt.unk_03 = 0;
    gLinkArenaSt.unk_01 = 0;

    SetBmStLinkArenaFlag();
    LinkArenaBattleMap_InitChapter();

    BMapVSync_Start();

    gPlaySt.chapterStateBits &= ~PLAY_FLAG_COMPLETE;
    gPlaySt.config.windowColor = 0;

    Proc_StartBlocking(ProcScr_SIOMENU, parent);
    Proc_Start(ProcScr_DebugMonitor, PROC_TREE_3);

    return;
}
