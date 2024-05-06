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

//! FE8U = 0x08047AB8
bool sub_8047AB8(void)
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
void sub_8047AF4(void)
{
    int i;

    gLinkArenaSt.unk_0A = sub_8047AB8();

    for (i = 0; i < 0x10; i++)
    {
        gUnk_Sio_0203DD2C[i] = 0;
    }

    gUnknown_03001808 = gUnknown_0300180C = gUnk_Sio_0203DD4C = 0;

    return;
}

// clang-format off

struct FaceVramEntry CONST_DATA gUnknown_085A9E48[] =
{
    0x7000, 1,
    0x7000, 1,
    0x7000, 1,
    0x7000, 1,
};

// clang-format on

//! FE8U = 0x08047B34
void sub_8047B34(struct SioMenuProc * proc)
{
    int unkBool;
    int i;

    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    proc->unk_59 = gSioSaveConfig._unk3_;

    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0x10, 4, 0);

    Decompress(gUnknown_085AB358, (void *)0x06014800);
    ApplyPalettes(gUnknown_085ADBE8, 0x13, 3);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    sub_8043164();

    proc->unk_4c = 0;

    proc->unk_58 = IsMultiArenaSaveReady();
    proc->unk_40[0] = 1;
    unkBool = proc->unk_58 != 0;
    proc->unk_40[1] = unkBool;
    proc->unk_40[2] = unkBool;
    proc->unk_40[3] = unkBool;

    if (proc->unk_59 == 0)
    {
        unkBool = 0;
        proc->unk_50 = 3;
    }
    else
    {
        unkBool = 1;
        proc->unk_50 = 4;
    }

    proc->unk_44 = unkBool;

    proc->unk_48 = gLinkArenaSt.unk_01;
    proc->unk_40[proc->unk_48] = 2;

    for (i = 4; i >= 0; i--)
    {
        proc->unk_2c[i] = sub_804C758(proc, 0xb0, 0xa0, i, proc->unk_40[i]);
    }

    NewProc085AA980(proc->unk_2c[0], 0, 0);
    sub_804C508();

    SetupFaceGfxData(gUnknown_085A9E48);
    StartFace(3, 100, 0xd0, 0x50, 2);

    proc->unk_54 = 0;

    StartBgm(0x38, 0);
    sub_80497CC();

    return;
}

// clang-format off

const u8 gUnknown_080D9EF0[] =
{
    0x78, 0x10,
    0x60, 0x24,
    0x48, 0x38,
    0x30, 0x4C,
    0x18, 0x60,
    0x00, 0x00,
};

// clang-format on

//! FE8U = 0x08047C60
void sub_8047C60(struct SioMenuProc * proc)
{
    int i;

    int x = Interpolate(4, -0x50, gUnknown_080D9EF0[0], proc->unk_54, 0x20);
    int y = Interpolate(5, 0xa0, gUnknown_080D9EF0[1], proc->unk_54, 0x20);

    for (i = 4; i >= 0; i--)
    {
        sub_804C7DC(proc->unk_2c[i], x, y);
    }

    if (proc->unk_54 >= 0x20)
    {
        proc->unk_54 = 0;

        sub_8043100(sub_8047A54(proc, 0), 0);
        sub_8043100(sub_8047A54(proc, 1), 1);

        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

//! FE8U = 0x08047CF0
void sub_8047CF0(struct SioMenuProc * proc)
{
    int i;

    int idx = proc->unk_48 * 2;

    for (i = 4; i >= 0; i--)
    {
        int x = Interpolate(4, gUnknown_080D9EF0[idx + 0], gUnknown_080D9EF0[i * 2 + 0], proc->unk_54, 0x10);
        int y = Interpolate(4, gUnknown_080D9EF0[idx + 1], gUnknown_080D9EF0[i * 2 + 1], proc->unk_54, 0x10);
        sub_804C7DC(proc->unk_2c[i], x, y);
    }

    if (proc->unk_54 >= 0x10)
    {
        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

// clang-format off

struct FaceVramEntry CONST_DATA gUnknown_085A9E68[] =
{
    0x7000, 1,
    0x7000, 1,
    0x7000, 1,
    0x7000, 1,
};

// clang-format on

//! FE8U = 0x08047D88
void sub_8047D88(struct SioMenuProc * proc)
{
    int unkBool;
    int i;
    int idx;

    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    proc->unk_59 = gSioSaveConfig._unk3_;

    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x10, 4, 0);

    Decompress(gUnknown_085AB358, (void *)0x06014800);
    ApplyPalettes(gUnknown_085ADBE8, 0x13, 3);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    sub_8043164();

    proc->unk_4c = 0;

    proc->unk_58 = IsMultiArenaSaveReady();
    proc->unk_40[0] = 1;
    unkBool = proc->unk_58 != 0;
    proc->unk_40[1] = unkBool;
    proc->unk_40[2] = unkBool;
    proc->unk_40[3] = unkBool;

    if (proc->unk_59 == 0)
    {
        unkBool = 0;
        proc->unk_50 = 3;
    }
    else
    {
        unkBool = 1;
        proc->unk_50 = 4;
    }

    proc->unk_44 = unkBool;

    proc->unk_48 = gLinkArenaSt.unk_01;
    proc->unk_40[proc->unk_48] = 2;

    idx = proc->unk_48 * 2;

    for (i = 4; i >= 0; i--)
    {
        proc->unk_2c[i] = sub_804C758(proc, gUnknown_080D9EF0[idx + 0], gUnknown_080D9EF0[idx + 1], i, proc->unk_40[i]);
    }

    NewProc085AA980(proc->unk_2c[0], 0, 0);
    sub_804C508();

    SetupFaceGfxData(gUnknown_085A9E68);
    StartFace(3, 100, 0xd0, 0x50, 2);

    sub_8043100(sub_8047A54(proc, 0), 0);
    sub_8043100(sub_8047A54(proc, 1), 1);
    sub_80497CC();

    StartBgm(0x38, 0);

    proc->unk_54 = 0;

    return;
}

//! FE8U = 0x08047EF8
void sub_8047EF8(struct SioMenuProc * proc, u8 b)
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

            sub_804C7C8(proc->unk_2c[1], -6, 0x34, 0x1f, 4);
            SioPlaySoundEffect(3);
        }

        if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0)
        {
            gLinkArenaSt.unk_05++;
            gLinkArenaSt.unk_05 = gLinkArenaSt.unk_05 % 3;

            sub_804C7C8(proc->unk_2c[1], 0, 0x3a, 4, 0x1f);
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
        } while (proc->unk_40[proc->unk_48] == 0);
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) &&
        ((proc->unk_48 < proc->unk_50) || (gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)))
    {
        do
        {
            proc->unk_48++;
            proc->unk_48 = proc->unk_48 % b;
        } while (proc->unk_40[proc->unk_48] == 0);
    }
    return;
}

//! FE8U = 0x08047FF8
void sub_8047FF8(struct SioMenuProc * proc)
{
    int idx;

    idx = proc->unk_48;
    sub_8047EF8(proc, 5);

    if (idx != proc->unk_48)
    {
        struct Proc85AA9C0 * child;

        SioPlaySoundEffect(3);

        child = proc->unk_2c[idx];
        child->unk_2e = 1;

        child = proc->unk_2c[proc->unk_48];
        child->unk_2e = 2;

        sub_804CFB8(child, child->unk_2a, child->unk_2c);

        sub_8043100(sub_8047A54(proc, 0), 0);
        sub_8043100(sub_8047A54(proc, 1), 1);
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
void sub_80480B4(struct SioMenuProc * proc)
{
    int r2;
    int i;

    if (gLinkArenaSt.unk_00 == 0xFF)
    {
        Proc_Break(proc);
    }

    r2 = gLinkArenaSt.unk_00;

    if (proc->unk_54 < 0x11)
    {
        for (i = 4; i >= 0; i--)
        {
            int x = Interpolate(4, gUnknown_080D9EF0[i * 2 + 0], gUnknown_080D9EF0[r2 * 2 + 0], proc->unk_54, 0x10);
            int y = Interpolate(4, gUnknown_080D9EF0[i * 2 + 1], gUnknown_080D9EF0[r2 * 2 + 1], proc->unk_54, 0x10);
            sub_804C7DC(proc->unk_2c[i], x, y);
        }
    }

    if (proc->unk_54 > 0x20)
    {
        Proc_Break(proc);
    }

    proc->unk_54++;

    return;
}

extern struct ProcCmd ProcScr_DebugMonitor[];
extern struct ProcCmd ProcScr_SIOTERM[];
extern struct ProcCmd ProcScr_SIOPRA[];
extern struct ProcCmd ProcScr_SIOBAT[];
extern struct ProcCmd ProcScr_SIORESULT[];
extern struct ProcCmd gUnknown_085A9DF8[];

//! FE8U = 0x08048168
void sub_8048168(struct SioMenuProc * proc)
{
    int i;

    struct ProcCmd * gUnknown_080D9EFC[5] = {
        ProcScr_SIOTERM, // Edit Teams
        ProcScr_SIOPRA, // Practice
        ProcScr_SIOBAT, // Linked Battle
        ProcScr_SIORESULT, // Battle Data
        gUnknown_085A9DF8, // Rule Settings
    };

    EndMuralBackground();
    EndFaceById(3);

    for (i = 0; i < 5; i++)
    {
        Proc_End(proc->unk_2c[i]);
    }

    if (gLinkArenaSt.unk_00 == 0xFF)
    {
        BMapVSync_End();
        nullsub_13();

        UnsetBmStLinkArenaFlag();

        Proc_EndEach(ProcScr_DebugMonitor);
        Proc_End(proc);
    }
    else
    {
        gLinkArenaSt.unk_01 = gLinkArenaSt.unk_00;
        Proc_StartBlocking(gUnknown_080D9EFC[gLinkArenaSt.unk_00], proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085A9E88[] =
{
    PROC_NAME("SIOMENU"),

PROC_LABEL(0),
    PROC_CALL(sub_8047AF4),
    PROC_CALL(sub_8047B34),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_0203DDDC),
    PROC_REPEAT(sub_8047C60),

    PROC_GOTO(2),

PROC_LABEL(1),
    PROC_CALL(sub_8047D88),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,
    PROC_CALL(Clear_0203DDDC),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(sub_8047CF0),
    PROC_REPEAT(sub_8047FF8),
    PROC_REPEAT(sub_80480B4),

    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(sub_8048168),
    PROC_SLEEP(1),

    PROC_GOTO(1),
};

// clang-format on

//! FE8U = 0x080481E0
void sub_80481E0(ProcPtr parent)
{
    LoadUiFrameGraphics();
    InitTextFont(&Font_0203DB64, (void *)0x06001800, 0xc0, 0);

    if (!IsSaveValid(5))
    {
        WriteNewMultiArenaSave();
    }

    gLinkArenaSt.unk_05 = 0;
    gLinkArenaSt.unk_03 = 0;
    gLinkArenaSt.unk_01 = 0;

    SetBmStLinkArenaFlag();
    sub_80496A4();

    BMapVSync_Start();

    gPlaySt.chapterStateBits &= ~PLAY_FLAG_COMPLETE;
    gPlaySt.config.windowColor = 0;

    Proc_StartBlocking(gUnknown_085A9E88, parent);
    Proc_Start(ProcScr_DebugMonitor, PROC_TREE_3);

    return;
}
