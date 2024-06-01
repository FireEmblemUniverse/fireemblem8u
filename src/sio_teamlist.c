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

struct SioProc85AAA78
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x30);
    /* 30 */ s16 unk_30[5];
    /* 3A */ u8 unk_3a[2];
    /* 3C */ STRUCT_PAD(0x3c, 0x40);
    /* 40 */ int unk_40;
    /* 44 */ u8 unk_44;
    /* 45 */ STRUCT_PAD(0x45, 0x48);
    /* 48 */ int unk_48;
};

struct SioProc85A94AC
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioProc85AAA78 * unk_2c;
    /* 30 */ ProcPtr unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u8 unk_48;
    /* 49 */ STRUCT_PAD(0x49, 0x4A);
    /* 4A */ u16 unk_4a;
    /* 4C */ s8 unk_4c;
    /* 4D */ u8 unk_4d[5];
    /* 52 */ u8 unk_52;
    /* 53 */ u8 unk_53;
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ STRUCT_PAD(0x56, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ s8 unk_5c;
};

extern struct ProcCmd ProcScr_Sio_085A94AC[];

struct SioUnknown_0203DB7C
{
    /* 00 */ char unk_00[15];
    /* 0F */ u8 unk_0f;
    /* 10 */ u8 unk_10;
    /* 11 */ STRUCT_PAD(0x11, 0x14);
};

extern struct SioUnknown_0203DB7C gUnk_Sio_0203DB7C[];

struct SioUnknown_085A94A0
{
    /* 00 */ u8 unk_00;
    /* 01 */ STRUCT_PAD(0x01, 0x02);
    /* 02 */ u16 unk_02;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ STRUCT_PAD(0x06, 0x08);
    /* 08 */ int unk_08;
    /* 0C */ s8 (*unk_0c)(void);
};

// Forward declarations

int sub_80437C0(u8, struct SioProc85A94AC *);
s8 sub_804335C(void);
s8 sub_8043394(void);

// clang-format off

struct SioUnknown_085A94A0 CONST_DATA Sio_UnitConf_1[] =
{
    [0] =
    {
        .unk_00 = 1,
        .unk_02 = 0x073C,
        .unk_04 = 1,
        .unk_05 = 0,
        .unk_08 = 0x0766,
        .unk_0c = sub_804335C,
    },
    [1] =
    {
        .unk_00 = 3,
        .unk_02 = 0x073D,
        .unk_04 = 0,
        .unk_05 = 1,
        .unk_08 = 0x0767,
        .unk_0c = sub_8043394,
    },
    [2] =
    {
        .unk_00 = 4,
        .unk_02 = 0x073E,
        .unk_04 = 0,
        .unk_05 = 0,
        .unk_08 = 0x0768,
        .unk_0c = NULL,
    },
    [3] =
    {
        .unk_00 = 6,
        .unk_02 = 0x073F,
        .unk_04 = 0,
        .unk_05 = 1,
        .unk_08 = 0x0769,
        .unk_0c = sub_8043394,
    },
    [4] =
    {
        .unk_00 = 7,
        .unk_02 = 0x0740,
        .unk_04 = 0,
        .unk_05 = 0,
        .unk_08 = 0x076A,
        .unk_0c = NULL,
    },
    [5] =
    {
        .unk_00 = 0,
        .unk_02 = 0,
        .unk_04 = 0,
        .unk_05 = 0,
        .unk_08 = 0,
        .unk_0c = NULL,
    },
};

struct SioUnknown_085A94A0 CONST_DATA Sio_UnitConf_2[] =
{
    [0] =
    {
        .unk_00 = 2,
        .unk_02 = 0x0741,
        .unk_04 = 0,
        .unk_05 = 1,
        .unk_08 = 0x076C,
        .unk_0c = NULL,
    },
    [1] =
    {
        .unk_00 = 3,
        .unk_02 = 0x073D,
        .unk_04 = 0,
        .unk_05 = 1,
        .unk_08 = 0x0767,
        .unk_0c = NULL,
    },
    [2] =
    {
        .unk_00 = 7,
        .unk_02 = 0x0740,
        .unk_04 = 0,
        .unk_05 = 1,
        .unk_08 = 0x076A,
        .unk_0c = NULL,
    },
    [3] =
    {
        .unk_00 = 0,
        .unk_02 = 0,
        .unk_04 = 0,
        .unk_05 = 1,
        .unk_08 = 0,
        .unk_0c = NULL,
    },
};

struct SioUnknown_085A94A0 * CONST_DATA gUnknown_085A94A0[] =
{
    Sio_UnitConf_1,
    Sio_UnitConf_2,
    Sio_UnitConf_2,
};

// clang-format on

extern char gUnk_Sio_0203DD50[][15];
extern struct Text gUnk_Sio_0203DA88[];

//! FE8U = 0x08043308
void sub_8043308(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_Sio_085A94AC, parent);
    return;
}

//! FE8U = 0x0804331C
void sub_804331C(struct SioProc85A94AC * proc)
{
    proc->unk_4a = 0xd8;
    proc->unk_48 = 0;
    proc->unk_40 = 0;
    proc->unk_3c = 0;
    proc->unk_52 = 0;
    proc->unk_54 = 0xff;
    proc->unk_53 = 0xff;
    proc->unk_4c = 0;
    return;
}

//! FE8U = 0x0804335C
s8 sub_804335C(void)
{
    int i;

    if (gLinkArenaSt.unk_0A == 0)
    {
        return 0;
    }

    for (i = 0; i < 10; i++)
    {
        if ((gUnk_Sio_0203DB7C[i].unk_0f & 0x80) != 0)
        {
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x08043394
s8 sub_8043394(void)
{
    int i;

    for (i = 0; i < 10; i++)
    {
        if ((gUnk_Sio_0203DB7C[i].unk_0f & 0x80) == 0)
        {
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x080433C0
int sub_80433C0(int a, u8 b)
{
    int i;
    int count = 0;
    char buf[16];

    struct SioUnknown_085A94A0 * ptr = gUnknown_085A94A0[b];

    InitUnits();

    switch (b)
    {
        case 0:
            for (i = 0; i < 10; i++)
            {
                if (ReadMultiArenaSaveTeamName(i, gUnk_Sio_0203DB7C[i].unk_00) == 1)
                {
                    gUnk_Sio_0203DB7C[i].unk_10 = ptr[a].unk_04;
                    gUnk_Sio_0203DB7C[i].unk_0f = i;
                }
                else
                {
                    SioStrCpy(GetStringFromIndex(0xcc), gUnk_Sio_0203DB7C[i].unk_00);
                    gUnk_Sio_0203DB7C[i].unk_10 = ptr[a].unk_05;
                    gUnk_Sio_0203DB7C[i].unk_0f = i | 0x80;
                }

                ReadMultiArenaSaveTeam(i, GetUnit(i * 5 + 1), buf);
            }

            count = i;

            break;

        case 1:
        case 2:
            for (i = 0; i < 10; i++)
            {
                if (ReadMultiArenaSaveTeamName(i, gUnk_Sio_0203DB7C[count].unk_00) == 1)
                {
                    gUnk_Sio_0203DB7C[count].unk_10 = ptr[a].unk_04;
                    gUnk_Sio_0203DB7C[count].unk_0f = i;
                    ReadMultiArenaSaveTeam(i, GetUnit(count * 5 + 1), buf);

                    count++;
                }
            }

            break;
    }

    return count;
}

//! FE8U = 0x080434B4
void sub_80434B4(int idx)
{
    ClearText(&gLinkArenaSt.texts[idx]);
    Text_SetColor(&gLinkArenaSt.texts[idx], 0);
    Text_DrawString(&gLinkArenaSt.texts[idx], gUnk_Sio_0203DB7C[idx].unk_00);

    gLinkArenaSt.texts[idx].chr_position =
        (gLinkArenaSt.texts[idx].chr_position & 0xFFF) | ((gUnk_Sio_0203DB7C[idx].unk_10 & 0xf) << 0xc);

    PutText(&gLinkArenaSt.texts[idx], idx * 0x40 + gBG1TilemapBuffer + 0x0b);

    return;
}

//! FE8U = 0x0804352C
void sub_804352C(struct SioProc85A94AC * proc)
{
    int i;

    for (i = 0; i < proc->unk_38; i++)
    {
        sub_80434B4(i);
    }

    return;
}

//! FE8U = 0x08043548
void sub_8043548(struct SioProc85A94AC * proc, u8 b)
{
    int i;

    struct SioUnknown_085A94A0 * ptr = gUnknown_085A94A0[b];

    for (i = 0; i < proc->unk_38; i++)
    {
        if ((gUnk_Sio_0203DB7C[i].unk_0f & 0x80) == 0)
        {
            gUnk_Sio_0203DB7C[i].unk_10 = ptr[proc->unk_3c].unk_04;
        }
        else
        {
            gUnk_Sio_0203DB7C[i].unk_10 = ptr[proc->unk_3c].unk_05;
        }

        gLinkArenaSt.texts[i].chr_position =
            (gLinkArenaSt.texts[i].chr_position & 0xFFF) | ((gUnk_Sio_0203DB7C[i].unk_10 & 0xf) << 0xc);
        PutText(&gLinkArenaSt.texts[i], i * 0x40 + gBG1TilemapBuffer + 0x0b);
    }

    BG_EnableSyncByMask(2);

    return;
}

//! FE8U = 0x080435F0
void sub_80435F0(struct SioProc85A94AC * proc)
{
    int team = proc->unk_40;

    struct SioUnknown_085A94A0 * ptr = gUnknown_085A94A0[gLinkArenaSt.unk_00];

    struct Unit * unit = GetUnit(team * 5 + 1);

    WipeMultiArenaSaveTeam(gUnk_Sio_0203DB7C[team].unk_0f & 0x7f);
    ReadMultiArenaSaveTeam(team, unit, gUnk_Sio_0203DB7C[team].unk_00);

    SioStrCpy(GetStringFromIndex(0xcc), gUnk_Sio_0203DB7C[team].unk_00);

    gUnk_Sio_0203DB7C[team].unk_10 = ptr[proc->unk_3c].unk_05;
    gUnk_Sio_0203DB7C[team].unk_0f = team | 0x80;
    sub_80434B4(team);

    if (sub_8043394() == 0)
    {
        sub_80437C0(gLinkArenaSt.unk_00, proc);
        Proc_Goto(proc, 2);
    }
    else if (proc->unk_4d[0] == 0)
    {
        sub_80437C0(gLinkArenaSt.unk_00, proc);
    }

    sub_804D24C(proc->unk_38, proc->unk_4a + 0x28);

    BG_EnableSyncByMask(2);

    return;
}

//! FE8U = 0x080436C0
void sub_80436C0(struct SioProc85A94AC * proc)
{
    int tmp;

    int teamB = proc->unk_40;
    int teamA = proc->unk_53;

    SwapMultiArenaSaveTeams(gUnk_Sio_0203DB7C[teamA].unk_0f & 0x7f, gUnk_Sio_0203DB7C[teamB].unk_0f & 0x7f);

    tmp = gUnk_Sio_0203DB7C[teamA].unk_10;
    gUnk_Sio_0203DB7C[teamA].unk_10 = gUnk_Sio_0203DB7C[teamB].unk_10;
    gUnk_Sio_0203DB7C[teamB].unk_10 = tmp;

    if (ReadMultiArenaSaveTeam(teamA, GetUnit(teamA * 5 + 1), gUnk_Sio_0203DB7C[teamA].unk_00) == 0)
    {
        SioStrCpy(GetStringFromIndex(0xcc), gUnk_Sio_0203DB7C[teamA].unk_00);
        gUnk_Sio_0203DB7C[teamA].unk_0f = teamA | 0x80;
    }
    else
    {
        gUnk_Sio_0203DB7C[teamA].unk_0f = teamA;
    }

    if (ReadMultiArenaSaveTeam(teamB, GetUnit(teamB * 5 + 1), gUnk_Sio_0203DB7C[teamB].unk_00) == 0)
    {
        SioStrCpy(GetStringFromIndex(0xcc), gUnk_Sio_0203DB7C[teamB].unk_00);
        gUnk_Sio_0203DB7C[teamB].unk_0f = teamB | 0x80;
    }
    else
    {
        gUnk_Sio_0203DB7C[teamB].unk_0f = teamB;
    }

    sub_80434B4(teamB);
    sub_80434B4(teamA);

    sub_804D24C(proc->unk_38, proc->unk_4a + 0x28);

    Proc_End(proc->unk_30);

    proc->unk_52 = 4;

    BG_EnableSyncByMask(2);

    return;
}

//! FE8U = 0x080437C0
int sub_80437C0(u8 a, struct SioProc85A94AC * proc)
{
    int color;

    int i = 0;
    struct SioUnknown_085A94A0 * ptr = gUnknown_085A94A0[a];

    if (a == 1)
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
        if (ptr[i].unk_08 == 0)
        {
            return i;
        }

        proc->unk_4d[i] = 1;
        color = 0;

        if (ptr[i].unk_0c != NULL && !ptr[i].unk_0c())
        {
            proc->unk_4d[i] = 0;
            color = 1;
        }

        ClearText(&gUnk_Sio_0203DA88[i]);
        Text_SetColor(&gUnk_Sio_0203DA88[i], color);
        PutDrawTextCentered(&gUnk_Sio_0203DA88[i], 1, i * 2 + 5, GetStringFromIndex(ptr[i].unk_08), 7);

        i++;
    }
}

//! FE8U = 0x080438C0
u16 sub_80438C0(struct SioProc85A94AC * proc)
{
    struct SioUnknown_085A94A0 * ptr = gUnknown_085A94A0[gLinkArenaSt.unk_00];

    if (gLinkArenaSt.unk_00 != 1)
    {
        return ptr[proc->unk_3c].unk_02;
    }

    if (proc->unk_3c == 0)
    {
        return 0x742;
    }
    else
    {
        return 0x743;
    }
}

//! FE8U = 0x08043904
void sub_8043904(struct SioProc85A94AC * proc)
{
    int i;
    u8 buf[8];

    u16 * textPalette = Pal_Text;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_TacticianSelObj, (void *)(0x06014800));
    CallARM_FillTileRect(gBG2TilemapBuffer + 0x89, gUnknown_085ADF40, 0x1000);
    CopyToPaletteBuffer(Pal_TacticianSelObj, 0x260, 0x80);

    Decompress(gUnknown_085AC604, (void *)(0x06016000));
    CopyToPaletteBuffer(gUnknown_08A1BD00, 0x220, 0x40);

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

    proc->unk_38 = sub_80433C0(proc->unk_3c, gLinkArenaSt.unk_00);

    for (i = 0; i < 5; i++)
    {
        buf[i] = 0;
    }

    buf[proc->unk_3c] = 1;

    proc->unk_34 = sub_80437C0(gLinkArenaSt.unk_00, proc);

    sub_804352C(proc);

    proc->unk_2c = sub_804CAEC(proc, proc->unk_34, buf);

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.unk_06[i] = 0xff;
    }

    proc->unk_5c = 0;

    BG_SetPosition(1, 0, proc->unk_4a);

    SetWinEnable(1, 1, 0);

    SetWin0Box(0, 0x28, 0xf0, 0x88);
    SetWin1Box(0, 0x88, 0xf0, 0xa0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 0, 1, 1, 0);
    SetWOutLayers(1, 0, 1, 1, 1);

    NewProc085AA980(proc->unk_2c, gUnknown_080D9D5E[gLinkArenaSt.unk_00], 0);
    sub_804C558();

    sub_8043100(sub_80438C0(proc), 1);

    BG_EnableSyncByMask(0xf);

    return;
}

//! FE8U = 0x08043B08
void sub_8043B08(int * a, u8 b, u8 c, u8 d)
{
    if ((gKeyStatusPtr->repeatedKeys & 0x40) != 0)
    {
        if (*a > c || gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)
        {
            *a = *a - 1;

            if (*a < 0)
            {
                *a = d - 1;
            }
        }
    }

    if ((gKeyStatusPtr->repeatedKeys & 0x80) != 0)
    {
        if (*a < b || gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys)
        {
            *a = *a + 1;
            *a = *a % d;
        }
    }

    return;
}

//! FE8U = 0x08043B6C
void sub_8043B6C(struct SioProc85A94AC * proc)
{
    int previous = proc->unk_3c;

    struct SioUnknown_085A94A0 * ptr = gUnknown_085A94A0[gLinkArenaSt.unk_00];

    struct SioProc85AAA78 * unk_2C = proc->unk_2c;
    unk_2C->unk_44 = 1;
    unk_2C->unk_48 = -1;

    sub_8043B08(&proc->unk_3c, proc->unk_34 - 1, 0, proc->unk_34);

    if (previous != proc->unk_3c)
    {
        SioPlaySoundEffect(3);

        unk_2C->unk_3a[previous] = 0;
        unk_2C->unk_3a[proc->unk_3c] = 1;

        sub_8043548(proc, gLinkArenaSt.unk_00);
        sub_8043100(sub_80438C0(proc), 1);
    }

    if ((gKeyStatusPtr->newKeys & 1) != 0)
    {
        if (gLinkArenaSt.unk_00 != 1)
        {
            if (proc->unk_4d[proc->unk_3c] != 0)
            {
                proc->unk_52 = ptr[proc->unk_3c].unk_00;
                if (proc->unk_52 == 7)
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

            proc->unk_52 = 8;
            proc->unk_53 = proc->unk_3c;
            proc->unk_44 = 0;

            Proc_Goto(proc, 5);

            return;
        }
    }

    if ((gKeyStatusPtr->newKeys & 2) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Goto(proc, 9);
        gLinkArenaSt.unk_03 = 0xff;
    }

    if (((gKeyStatusPtr->newKeys & 8) != 0) && (proc->unk_5c != 0))
    {
        PlaySoundEffect(0x6a);
        gLinkArenaSt.unk_03 = 0;
        Proc_Goto(proc, 9);
    }

    return;
}

//! FE8U = 0x08043CF4
void sub_8043CF4(struct SioProc85A94AC * proc)
{
    u8 buf[16];
    struct Unit * unit;

    Proc_End(proc->unk_2c);
    nullsub_13();
    EndMuralBackground();

    InitUnits();

    unit = GetUnit(1);
    ReadMultiArenaSaveTeam(gUnk_Sio_0203DB7C[proc->unk_40].unk_0f, unit, buf);

    StartUnitListScreenUnk(proc);

    return;
}

//! FE8U = 0x08043D3C
void sub_8043D3C(ProcPtr proc)
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
void sub_8043D8C(struct SioProc85A94AC * proc)
{
    int unk_40 = proc->unk_40;
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    if ((sub_8043268(gSioList_085A93E0) != 0) && ((gUnk_Sio_0203DB7C[unk_40].unk_0f & 0x80) == 0))
    {
        Proc_Goto(proc, 8);
        return;
    }

    unk_2C->unk_44 = 0;
    unk_2C->unk_48 = (proc->unk_40 - proc->unk_48) * 0x10 + 0x28;

    if (proc->unk_4c > 0)
    {
        proc->unk_4a -= 4;
        proc->unk_4c--;

        BG_SetPosition(1, 0, proc->unk_4a);

        if (proc->unk_30 != 0)
        {
            sub_804303C(proc->unk_30, 4);
        }

        sub_804CC5C(4);

        DisplayUiHand(0x50, (proc->unk_40 - proc->unk_48) * 0x10 + 0x28);
        sub_804D24C(proc->unk_38, proc->unk_4a + 0x28);

        return;
    }
    else if (proc->unk_4c < 0)
    {
        proc->unk_4a += 4;
        proc->unk_4c++;

        BG_SetPosition(1, 0, proc->unk_4a);

        if (proc->unk_30 != 0)
        {
            sub_804303C(proc->unk_30, -4);
        }

        sub_804CC5C(-4);

        DisplayUiHand(0x50, (proc->unk_40 - proc->unk_48) * 0x10 + 0x28);
        sub_804D24C(proc->unk_38, proc->unk_4a + 0x28);

        return;
    }

    DisplayUiHand(0x50, (proc->unk_40 - proc->unk_48) * 0x10 + 0x28);

    if ((gKeyStatusPtr->newKeys & 1) != 0)
    {
        switch (proc->unk_52)
        {
            case 1:
                // Build Team
                if ((gUnk_Sio_0203DB7C[unk_40].unk_0f & 0x80) != 0)
                {
                    SioPlaySoundEffect(2);
                    gLinkArenaSt.unk_03 = proc->unk_40;
                    Proc_Break(proc);

                    return;
                }

                SioPlaySoundEffect(0);

                break;

            case 2:
                // Team
                SioPlaySoundEffect(2);
                gLinkArenaSt.unk_03 = gUnk_Sio_0203DB7C[unk_40].unk_0f;
                Proc_Break(proc);

                return;

            case 3:
                // Unit List
                if ((gUnk_Sio_0203DB7C[unk_40].unk_0f & 0x80) == 0)
                {
                    SioPlaySoundEffect(2);
                    Proc_Goto(proc, 4);
                    return;
                }

                SioPlaySoundEffect(0);

                break;

            case 4:
                // Swap
                if (proc->unk_38 > 1)
                {
                    SioPlaySoundEffect(2);

                    proc->unk_53 = unk_40;
                    proc->unk_30 = StartSioHold(proc, 0x50, (proc->unk_53 - proc->unk_48) * 0x10 + 0x28, 0x88, 0x27);

                    if (unk_40 + 1 < proc->unk_38)
                    {
                        gKeyStatusPtr->repeatedKeys |= 0x80;
                    }
                    else
                    {
                        gKeyStatusPtr->repeatedKeys |= 0x40;
                    }

                    proc->unk_52 = 5;
                }

                break;

            case 7:
                // Link Menu
                break;

            case 5:
                // ??
                SioPlaySoundEffect(2);
                sub_80436C0(proc);

                break;

            case 6:
                // Disband
                if ((gUnk_Sio_0203DB7C[unk_40].unk_0f & 0x80) == 0)
                {
                    SioPlaySoundEffect(2);
                    proc->unk_30 = StartSioHold(proc, 0x50, (unk_40 - proc->unk_48) * 0x10 + 0x28, 0x88, 0x27);
                    Proc_Goto(proc, 7);
                }
                else
                {
                    SioPlaySoundEffect(0);
                }

                break;

            case 8:
                // Team selected (Practice or Battle)
                SioPlaySoundEffect(2);

                SioStrCpy(gUnk_Sio_0203DB7C[unk_40].unk_00, gUnk_Sio_0203DD50[proc->unk_53]);

                gLinkArenaSt.unk_06[proc->unk_53] = gUnk_Sio_0203DB7C[unk_40].unk_0f;

                ClearText(&gLinkArenaSt.unk_64[proc->unk_53]);
                PutDrawTextCentered(
                    &gLinkArenaSt.unk_64[proc->unk_53], 1, proc->unk_53 * 3 + 5, gUnk_Sio_0203DD50[proc->unk_53], 10);

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

    if ((gKeyStatusPtr->newKeys & 2) != 0)
    {
        SioPlaySoundEffect(1);

        if (proc->unk_52 == 5)
        {
            proc->unk_52 = 4;
            Proc_End(proc->unk_30);
            return;
        }

        if (proc->unk_52 != 8)
        {
            Proc_Goto(proc, 2);
        }
        else
        {
            proc->unk_44 = 0;
            Proc_Goto(proc, 6);
        }
    }

    if (((gKeyStatusPtr->newKeys & 8) != 0) && (proc->unk_5c != 0))
    {
        PlaySoundEffect(0x6a);
        gLinkArenaSt.unk_03 = 0;
        Proc_Goto(proc, 9);
    }

    if ((gKeyStatusPtr->repeatedKeys & 0x40) != 0)
    {
        if ((proc->unk_48 != 0) && ((proc->unk_40 - proc->unk_48) < 2))
        {
            proc->unk_4a -= 4;
            if (proc->unk_30 != 0)
            {
                sub_804303C(proc->unk_30, 4);
            }

            sub_804CC5C(4);

            proc->unk_48--;
            proc->unk_4c = 3;
            proc->unk_40--;

            BG_SetPosition(1, 0, proc->unk_4a);

            sub_804D24C(proc->unk_38, proc->unk_4a + 0x28);
        }
        else
        {
            if (proc->unk_40 > 0)
            {
                proc->unk_40--;
            }
        }
    }

    if ((gKeyStatusPtr->repeatedKeys & 0x80) != 0)
    {
        if (((proc->unk_38 > 6) && ((proc->unk_48 + 6) < proc->unk_38)) && ((proc->unk_40 - proc->unk_48) > 3))
        {
            proc->unk_4a += 4;

            if (proc->unk_30 != 0)
            {
                sub_804303C(proc->unk_30, -4);
            }

            sub_804CC5C(-4);

            proc->unk_48++;
            proc->unk_4c = -3;
            proc->unk_40++;

            BG_SetPosition(1, 0, proc->unk_4a);

            sub_804D24C(proc->unk_38, proc->unk_4a + 0x28);
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
void sub_804429C(struct SioProc85A94AC * proc)
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
        BG_SetPosition(0, xPos, 0);
        sub_8044280(unk_2C, xPos);
    }

    return;
}

//! FE8U = 0x08044324
void sub_8044324(struct SioProc85A94AC * proc)
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
        BG_SetPosition(0, xPos, 0);
        sub_8044280(unk_2C, xPos);
    }

    return;
}

//! FE8U = 0x080443B0
void sub_80443B0(struct SioProc85A94AC * proc)
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
    Text_DrawString(&Texts_0203DAB0, GetStringFromIndex(0x140));
    Text_SetCursor(&Texts_0203DAB0, 0x26);
    Text_DrawString(&Texts_0203DAB0, GetStringFromIndex(0x141));
    PutText(&Texts_0203DAB0, (proc->unk_58 + 4) * 0x20 + gBG0TilemapBuffer + 0x0f);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x08044430
void sub_8044430(struct SioProc85A94AC * proc)
{
    sub_804D834(0x60, proc->unk_58 * 8 + 0x18);

    if (((gKeyStatusPtr->newKeys & 0x20) != 0) && (proc->unk_55 == 1))
    {
        proc->unk_55 = 0;
        SioPlaySoundEffect(3);
    }

    if (((gKeyStatusPtr->newKeys & 0x10) != 0) && (proc->unk_55 == 0))
    {
        proc->unk_55 = 1;
        SioPlaySoundEffect(3);
    }

    DisplayUiHand(proc->unk_55 * 0x28 + 0x70, proc->unk_58 * 8 + 0x20);

    if ((gKeyStatusPtr->newKeys & 2) != 0)
    {
        SioPlaySoundEffect(1);

        Proc_End(proc->unk_30);

        TileMap_FillRect((proc->unk_58 + 4) * 0x20 + gBG0TilemapBuffer + 0x0F, 0xc, 2, 0);
        BG_EnableSyncByMask(1);

        Proc_Break(proc);
        return;
    }

    if ((gKeyStatusPtr->newKeys & 1) != 0)
    {
        Proc_End(proc->unk_30);

        if (proc->unk_55 == 0)
        {
            sub_80435F0(proc);
            SioPlaySoundEffect(2);
        }
        else
        {
            SioPlaySoundEffect(1);
        }

        TileMap_FillRect((proc->unk_58 + 4) * 0x20 + gBG0TilemapBuffer + 0x0F, 0xc, 2, 0);
        BG_EnableSyncByMask(1);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08044530
void sub_8044530(struct SioProc85A94AC * proc)
{
    char buf[16];

    ReadMultiArenaSaveTeam(proc->unk_40, GetUnit(1), buf);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_Sio_085A94AC[] =
{
    PROC_YIELD,

PROC_LABEL(0),
    PROC_CALL(sub_804331C),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(sub_8043904),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_0203DDDC),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(sub_8043B6C),

    // fallthrough

PROC_LABEL(3),
    PROC_REPEAT(sub_8043D8C),

    PROC_GOTO(9),

PROC_LABEL(4),
    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(sub_8043CF4),

    PROC_REPEAT(sub_8043D3C),

    PROC_CALL(sub_8043904),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_0203DDDC),

    PROC_GOTO(2),

PROC_LABEL(5),
    PROC_REPEAT(sub_804429C),

    // fallthrough

PROC_LABEL(6),
    PROC_REPEAT(sub_8044324),

    // fallthrough

PROC_LABEL(7),
    PROC_CALL(sub_80443B0),
    PROC_REPEAT(sub_8044430),

    PROC_GOTO(3),

PROC_LABEL(8),
    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(sub_8044530),
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
