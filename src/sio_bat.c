#include "global.h"

#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "scene.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"
#include "rng.h"
#include "sioerror.h"

#include "sio.h"
#include "sio_core.h"

#include "constants/faces.h"

struct SioBatProc_Unk2C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x34);
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
};

struct SioBatProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct SioBatProc_Unk2C * unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ STRUCT_PAD(0x3C, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ s16 unk_64;
};

extern struct Font Font_0203DB64;
extern char gUnknown_03004E86[];
extern int gUnk_Sio_0203DD28;
extern struct SioMessage gUnknown_03004E80;
extern u8 gUnk_Sio_0203DAC0[];
extern struct Text gUnk_Sio_0203DA78;

//! FE8U = 0x08045930
int sub_8045930(u8 ranking, u32 playerCount, u32 mode, u32 points)
{
    u32 r4;
    int r2;
    int r7;

    r4 = points;

    for (r2 = 0; r2 < 10; r2++)
    {
        if (gSioResultRankings[r2].points >= r4)
        {
            continue;
        }

        r7 = r2;
        r2 = 9;

        if (r2 <= r7)
        {
            goto _080459E4;
        }
        else
        {
            goto _08045976;
        }
    }

    return -1;

_08045976:
    for (r2 = 9; r2 > r7; r2--)
    {
        gSioResultRankings[r2].ranking = gSioResultRankings[r2 - 1].ranking;
        gSioResultRankings[r2].points = gSioResultRankings[r2 - 1].points;
        gSioResultRankings[r2].player_count = gSioResultRankings[r2 - 1].player_count;
        gSioResultRankings[r2].mode = gSioResultRankings[r2 - 1].mode;
        SioStrCpy(gSioResultRankings[r2 - 1].name, gSioResultRankings[r2].name);
    }

_080459E4:
    gSioResultRankings[r7].ranking = ranking;
    gSioResultRankings[r7].points = points;
    gSioResultRankings[r7].player_count = playerCount;
    gSioResultRankings[r7].mode = mode;

    SioStrCpy(gUnk_Sio_0203DAC5[gSioSt->selfId], gSioResultRankings[r7].name);

    return r7;
}

//! FE8U = 0x08045A64
void sub_8045A64(struct SioBatProc * proc)
{
    int mode = gLinkArenaSt.unk_ec.unk_0_1;
    int playerCount = gLinkArenaSt.unk_A0 - 1;
    u8 ranking = sub_8049A60();
    int points = gUnk_Sio_0203DD90.currentScore[gSioSt->selfId];

    ReadMultiArenaSaveRankings(gSioResultRankings);

    proc->unk_58 = sub_8045930(ranking, playerCount, mode, points);

    WriteMultiArenaSaveRankings(gSioResultRankings);

    if (proc->unk_58 != -1)
    {
        StartSioResultNewHighScore(proc->unk_58, proc);
    }
    else
    {
        Sound_FadeOutBGM(1);
    }

    return;
}

extern u8 gUnknown_080D9E44[];

//! FE8U = 0x08045AF4
void sub_8045AF4(void)
{
    int i;
    int j;

    // TODO: rodata
    u8 hack[3];
    memcpy(hack, gUnknown_080D9E44, 3);

    InitUnits();

    for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
    {
        int r4 = i * 0x40 + 1;

        struct Unit * unit = GetUnit(r4);
        ReadMultiArenaSaveTeam(gLinkArenaSt.unk_06[i], unit, gUnk_Sio_0203DAC5[i]);

        gLinkArenaSt.unk_05 = gLinkArenaSt.unk_05;

        for (j = 0; j < 5; j++)
        {
            u16 * fid = gUnk_Sio_0203DD90.unk_24 - -i;

            unit = GetUnit(r4 + j);

            unit->exp = 0;
            SetUnitStatus(unit, 0);
            unit->rescue = 0;

            if ((gSioSaveConfig._unk2_) == 0)
            {
                sub_80431B4(unit);
            }
            else
            {
                sub_804D40C(unit);
            }

            if (j == 0)
            {
                *fid = GetUnitMiniPortraitId(unit);
            }

            unit->index = r4 + j;

            if (i == 0)
            {
                continue;
            }

            if (gSioSaveConfig._unk0_ == 0)
            {
                unit->state = US_BIT9;
            }
        }
    }

    gUnk_Sio_0203DD90.unk_00 = 0;

    gSioSt->selfId = 0;
    gSioSt->unk_009 = hack[gLinkArenaSt.unk_05];
    gSioSt->unk_007 = gLinkArenaSt.unk_05 + 2;

    gLinkArenaSt.unk_A0 = gLinkArenaSt.unk_05 + 2;

    return;
}

extern struct ProcCmd ProcScr_SIOMAIN2[];

//! FE8U = 0x08045C14
void New6C_SIOMAIN2(void)
{
    Proc_Start(ProcScr_SIOMAIN2, PROC_TREE_2);
    return;
}

//! FE8U = 0x08045C28
void sub_8045C28(ProcPtr proc)
{
    if (Proc_Find(ProcScr_SIOMAIN2) != NULL)
    {
        return;
    }

    if (gLinkArenaSt.unk_0B == 1)
    {
        Proc_Goto(proc, 1);
    }

    if (gLinkArenaSt.unk_0B == 2)
    {
        Proc_Goto(proc, 4);
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08045C68
void sub_8045C68(const char * str, int x, int y, ProcPtr parent)
{
    SetInitTalkTextFont();
    ClearTalkText();
    ResetTextFont();

    StartTalkExt(x, y, str, parent);

    SetTalkPrintColor(1);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetTalkPrintDelay(2);

    SetActiveTalkFace(1);

    return;
}

//! FE8U = 0x08045CBC
void sub_8045CBC(void)
{
    Proc_EndEach(ProcScr_SIOVSYNC);
    Proc_EndEach(ProcScr_SIOMAIN);
    Proc_EndEach(ProcScr_SIOCON);
    return;
}

//! FE8U = 0x08045CE0
void sub_8045CE0(void)
{
    SioReleaseIrq();
    return;
}

extern int gUnknown_080D9D34[];

//! FE8U = 0x08045CEC
void sub_8045CEC(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        if (gLinkArenaSt.unk_9C[i] != gSioSt->playerStatus[i])
        {
            gLinkArenaSt.unk_9C[i] = gSioSt->playerStatus[i];

            ClearText(&gLinkArenaSt.texts[i]);
            Text_SetColor(&gLinkArenaSt.texts[i], 0);

            if (gLinkArenaSt.unk_9C[i] < 5)
            {
                PutDrawTextCentered(
                    &gLinkArenaSt.texts[i], 0xb, 5 + i * 3,
                    GetStringFromIndex(gUnknown_080D9D34[gLinkArenaSt.unk_9C[i]]), 10);
                ApplyPalette(gUnknown_085ADDA8, 0x13 + i);
            }
            else
            {
                PutDrawTextCentered(&gLinkArenaSt.texts[i], 0xb, 5 + i * 3, gLinkArenaSt.unk_A1[i], 10);
                ApplyPalette(Pal_TacticianSelObj + 0x10 * i, 0x13 + i);
            }

            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    return;
}

extern struct FaceVramEntry gUnknown_085A9864[];

//! FE8U = 0x08045DC0
void sub_8045DC0(struct SioBatProc * proc)
{
    int i;
    char buf[15];

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_TacticianSelObj, (void *)(0x06014800));
    Decompress(Img_LinkArenaPlayerBanners, (void *)(0x06016000));
    Decompress(gUnknown_085AC604, (void *)(0x06016800));

    for (i = 0; i < 4; i++)
    {
        ApplyPalette(gUnknown_085ADDA8, 0x13 + i);
    }

    ReadMultiArenaSaveTeamName(gLinkArenaSt.unk_03, buf);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();
    sub_8043164();

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.unk_9C[i] = 0xff;
    }

    sub_8045CEC();

    for (i = 0; i < 15; i++)
    {
        gUnknown_03004E86[i] = buf[i];
    }

    proc->unk_34 = 0;
    proc->unk_30 = 0;

    StartLinkArenaButtonSpriteDraw(0xc0, 0x10, proc);
    proc->unk_2c = (void *)StartLinkArenaVersusSpriteDraw(0x50, 0x20, proc);

    SetupFaceGfxData(gUnknown_085A9864);
    StartFace(3, FID_ANNA, 0xd0, 0x50, 2);

    StartLinkArenaTitleBanner(proc->unk_2c, gUnknown_080D9D5E[gLinkArenaSt.unk_00], 0);

    sub_804C508();
    sub_8043100(proc->unk_30 + 0x748, 1);

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08045F00
void sub_8045F00(ProcPtr proc)
{
    u16 data = 0x2586;

    Proc_Start(ProcScr_SIOVSYNC, PROC_TREE_VSYNC);
    Proc_Start(ProcScr_SIOMAIN, proc);
    Proc_Start(ProcScr_SIOCON, proc);

    SioSend16(&data, -1);

    return;
}

//! FE8U = 0x08045F48
void sub_8045F48(struct SioBatProc * proc)
{
    int i;
    u8 buf[4];
    u8 recvBuf[4];

    int timeouts = 0;
    u16 got = 0;
    struct SioBatProc_Unk2C * unk_2c = proc->unk_2c;

    gUnk_Sio_0203DD28 = 0;
    buf[0] = 0;

    sub_8045CEC();

    if (Proc_Find(ProcScr_SIOCON) != NULL)
    {
        if ((gKeyStatusPtr->newKeys & 2) != 0)
        {
            SioPlaySoundEffect(1);
            EndLinkArenaButtonSpriteDraw();
            sub_8045CBC();
            sub_8045CE0();
            Proc_Goto(proc, 2);
        }

        return;
    }

    if ((gKeyStatusPtr->newKeys & 2) != 0)
    {
        SioPlaySoundEffect(1);
        EndLinkArenaButtonSpriteDraw();
        sub_8045CBC();
        sub_8045CE0();
        Proc_Goto(proc, 2);
    }

    unk_2c->unk_34 = gSioSt->selfId;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 0x3c)
        {
            timeouts++;
        }
    }

    if (gSioSt->playerStatus[gSioSt->selfId] == 2)
    {
        sub_8045CBC();
        sub_8045CE0();
        Proc_Goto(proc, 2);
        return;
    }

    if ((sub_80421E4() == 0) || (gSioSt->unk_01E > 0x3C) || (timeouts != 0))
    {
        sub_8045CBC();
        sub_8045CE0();
        sub_8045F00(proc);
        proc->unk_30 = 0;
        sub_8043100(0x748, 1);
        StartLinkArenaButtonSpriteDraw(0xc0, 0x10, proc);
        return;
    }

    if ((gSioSt->selfId == 0) && (sub_804226C() == 1))
    {
        if (proc->unk_30 != 2)
        {
            proc->unk_30 = 2;
            sub_8043100(0x74A, 1);
        }

        if ((gKeyStatusPtr->newKeys & 8) != 0)
        {
            EndLinkArenaButtonSpriteDraw();

            gSioSt->unk_004 = 6;
            gSioSt->unk_01E = 0;

            for (i = 0; i < 4; i++)
            {
                gSioSt->timeoutClock[i] = 0;
            }

            SioPlaySoundEffect(2);

            gSioSt->unk_007 = sub_804213C();
            gLinkArenaSt.unk_A0 = gSioSt->unk_007;
            sub_8042AF4();

            buf[0] = 0x18;
            proc->unk_34 = SioEmitData(buf, 4);

            Proc_Break(proc);
            return;
        }
    }
    else if (proc->unk_30 != 1)
    {
        proc->unk_30 = 1;
        sub_8043100(0x749, 1);
    }

    if (((gSioSt->selfId != 0) && (sub_8042194(gSioSt->selfId) != 0)))
    {
        got = SioReceiveData(buf, recvBuf, 0);
        if (got != 0)
        {
            EndLinkArenaButtonSpriteDraw();

            gSioSt->unk_004 = 6;
            gSioSt->unk_01E = 0;

            for (i = 0; i < 4; i++)
            {
                gSioSt->timeoutClock[i] = 0;
            }

            gSioSt->unk_007 = sub_804213C();
            gLinkArenaSt.unk_A0 = gSioSt->unk_007;

            sub_8042AF4();
            Proc_Break(proc);
            return;
        }
    }

    if ((GetGameClock() % 0x26) != 0)
    {
        return;
    }

    gUnknown_03004E80.kind = 0x8c;
    gUnknown_03004E80.sender = gSioSt->selfId;
    gUnknown_03004E80.param = gSioSt->unk_000;

    SioSend(&gUnknown_03004E80, 0x16);

    return;
}

//! FE8U = 0x0804619C
void sub_804619C(struct SioBatProc * proc)
{
    sub_8045CEC();

    gUnk_Sio_0203DD28++;

    if ((gLinkArenaSt.unk_A0 != gSioSt->unk_007) || (gUnk_Sio_0203DD28 >= 0x259))
    {
        sub_8045CBC();
        sub_8045CE0();
        sub_8045F00(proc);

        proc->unk_30 = 0;

        sub_8043100(0x748, 1);
        StartLinkArenaButtonSpriteDraw(0xc0, 0x10, proc);

        Proc_Goto(proc, 3);

        goto _08046220;
    }
    else if (gSioSt->selfId == 0)
    {
        if ((gSioSt->pendingSend[proc->unk_34].unk_00 & gSioSt->unk_009) == gSioSt->unk_009)
        {
        _08046220:
            Proc_Break(proc);
        }

        return;
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08046234
void sub_8046234(struct SioBatProc * proc)
{
    u8 buf[0x10];

    sub_8043100(0x749, 1);

    if (gSioSt->selfId == 0)
    {
        proc->unk_3b = GetGameClock() % gLinkArenaSt.unk_A0;
        proc->unk_39 = gLinkArenaSt.unk_A0 * ((AdvanceGetLCGRNValue() & 3) + 4) + proc->unk_3b;

        buf[0] = gLinkArenaSt.unk_ec.unk_0_0;
        buf[1] = gLinkArenaSt.unk_ec.unk_0_2;
        buf[2] = gLinkArenaSt.unk_ec.unk_0_1;
        buf[3] = proc->unk_3b;
        buf[4] = proc->unk_39;

        StoreRNState((void *)buf + 6);

        proc->unk_34 = SioEmitData(buf, 0x10);
    }

    proc->unk_3a = 0;
    proc->unk_38 = 0;

    return;
}

//! FE8U = 0x080462D4
void sub_80462D4(struct SioBatProc * proc)
{
    u16 got;
    struct SioBatProc_Unk2C * unk_2c;
    u8 buf[16];
    u8 outSenderId[4];

    unk_2c = proc->unk_2c;

    if (gSioSt->selfId == 0)
    {
        if (gSioSt->pendingSend[proc->unk_34].unk_00 == gSioSt->unk_009)
        {
            sub_8043100(0x74E, 1);
            unk_2c->unk_38 = 0;
            Proc_Break(proc);
        }
    }
    else
    {
        if ((GetGameClock() % 0x26) == 0)
        {
            got = SioReceiveData(buf, outSenderId, 0);

            if (got != 0)
            {
                struct LinkArenaStMaybe * las = &gLinkArenaSt;
                u8 * buf2 = buf;
                struct LinkArenaStMaybe_ec * unk_ec = &las->unk_ec;

                // clang-format off
                { u32 r4 = 1; ++r4; --r4; }
                // clang-format on

                unk_ec->unk_0_0 = buf2[0] % 2;
                unk_ec->unk_0_2 = buf[1] % 2;
                unk_ec->unk_0_1 = buf[2] % 2;

                proc->unk_3b = buf[3];
                proc->unk_39 = buf[4];
                LoadRNState((void *)(buf + 6));
                sub_8043100(0x74E, 1);
                unk_2c->unk_38 = 0;
                Proc_Break(proc);
            }
        }
    }

    return;
}

//! FE8U = 0x080463A8
void sub_80463A8(struct SioBatProc * proc)
{
    struct SioBatProc_Unk2C * unk_2c = proc->unk_2c;

    proc->unk_38++;

    if (proc->unk_38 > 0x10)
    {
        proc->unk_38 = 0;
        proc->unk_3a++;
        proc->unk_3a = proc->unk_3a % gLinkArenaSt.unk_A0;
        proc->unk_39--;
        unk_2c->unk_38 = proc->unk_3a;

        PlaySoundEffect(0x7d);

        if (proc->unk_39 == 0)
        {
            if (proc->unk_3b != gSioSt->selfId)
            {
                sub_8043100(proc->unk_3b + 0x750, 1);
            }
            else
            {
                sub_8043100(0x74F, 1);
            }

            unk_2c->unk_38 = proc->unk_3b;

            gUnk_Sio_0203DD90.unk_00 = proc->unk_3b;
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x0804645C
void sub_804645C(void)
{
    PlaySoundEffect(0x7e);
    return;
}

//! FE8U = 0x08046478
void sub_8046478(struct Unit * unit)
{
    unit->exp = 0;
    SetUnitStatus(unit, 0);
    unit->rescue = 0;

    if (gLinkArenaSt.unk_ec.unk_0_2 == 0)
    {
        sub_80431B4(unit);
    }
    else
    {
        sub_804D40C(unit);
    }

    return;
}

extern struct MultiArenaSaveTeam * gUnknown_085A9884;

//! FE8U = 0x080464B0
void sub_80464B0(struct SioBatProc * proc)
{
    int i;

    int base = gSioSt->selfId * 0x40 + 1;
    gUnk_Sio_0203DD28 = 0;

    InitUnits();
    ReadMultiArenaSaveTeamRaw(gLinkArenaSt.unk_03, gUnknown_085A9884);

    for (i = 0; i < 5; i++)
    {
        struct Unit * unit = GetUnit(base + i);

        ClearUnit(unit);
        LoadSavedUnit(&gUnknown_085A9884->units[i], unit);

        sub_8046478(unit);

        unit->index = base + i;

        if (i == 0)
        {
            gUnk_Sio_0203DD90.unk_24[gSioSt->selfId] = GetUnitMiniPortraitId(unit);
        }
    }

    for (i = 0; i < 4; i++)
    {
        gLinkArenaSt.unk_9C[i] = 0;
    }

    gSioSt->unk_00A = 1 << gSioSt->selfId;

    proc->unk_64 = 0;
    proc->unk_4c = 0;

    return;
}

//! FE8U = 0x08046580
void sub_8046580(struct SioBatProc * proc)
{
    int i;
    u8 buf[0x24];
    u8 outSenderId[4];

    u8 unk = 0;

    if ((proc->unk_4c == 0))
    {
        PlaySoundEffect(0x7c);
    }

    proc->unk_4c++;

    if (proc->unk_4c > 23)
    {
        proc->unk_4c = 0;
    }

    if (proc->unk_64 < 5)
    {
        proc->unk_58 = (u8)SioEmitData((u8 *)&gUnknown_085A9884->units[proc->unk_64], 0x28);
        proc->unk_64++;
        gLinkArenaSt.unk_9C[gSioSt->selfId] = proc->unk_64;
    }

    if ((GetGameClock() % 0x26) == 0)
    {
        u16 got = SioReceiveData(buf, outSenderId, 0);

        if (got != 0)
        {
            int base = outSenderId[0] * 0x40 + 1;
            struct Unit * unit = GetUnit(base + gLinkArenaSt.unk_9C[outSenderId[0]]);

            ClearUnit(unit);
            LoadSavedUnit(buf, unit);
            sub_8046478(unit);

            unit->index = gLinkArenaSt.unk_9C[outSenderId[0]] + base;

            if (gLinkArenaSt.unk_9C[outSenderId[0]] == 0)
            {
                gUnk_Sio_0203DD90.unk_24[outSenderId[0]] = GetUnitMiniPortraitId(unit);
            }

            if (gLinkArenaSt.unk_ec.unk_0_0 == 0)
            {
                unit->state = US_BIT9;
            }

            gLinkArenaSt.unk_9C[outSenderId[0]]++;
        }

        for (i = 0; i < 4; i++)
        {
            u8 * ptr = gUnk_Sio_0203DAC0;

            if ((sub_8042194(i) != 0) && (ptr[i] < 5))
            {
                unk++;
            }
        }

        if (unk == 0)
        {
            gSioSt->unk_00A = 1 << gSioSt->selfId;
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x08046704
void sub_8046704(struct SioBatProc * proc)
{
    if (proc->unk_4c == 0)
    {
        PlaySoundEffect(0x7c);
    }

    proc->unk_4c++;

    if (proc->unk_4c > 23)
    {
        proc->unk_4c = 0;
    }

    gUnk_Sio_0203DD28++;

    if (gUnk_Sio_0203DD28 > 600)
    {
        StartSioErrorScreen();
    }

    gSioMsgBuf.kind = SIO_MSG_89;
    gSioMsgBuf.sender = gSioSt->selfId;
    gSioMsgBuf.param = 0;

    SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

    if ((gSioSt->pendingSend[proc->unk_58].unk_00 == gSioSt->unk_009) &&
        ((gSioSt->unk_00A & gSioSt->unk_009) == gSioSt->pendingSend[proc->unk_58].unk_00))
    {
        Proc_EndEach(gUnknown_085A93A0);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080467AC
void sub_80467AC(struct SioBatProc * proc)
{
    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0, 0, 0);

    EndLinkArenaVersusSpriteDraw();
    EndFaceById(3);

    ClearText(&gUnk_Sio_0203DA78);
    Text_SetColor(&gUnk_Sio_0203DA78, 0);
    Text_SetCursor(&gUnk_Sio_0203DA78, GetStringTextCenteredPos(0x60, GetStringFromIndex(0x77D)));
    Text_DrawString(&gUnk_Sio_0203DA78, GetStringFromIndex(0x77D));
    PutText(&gUnk_Sio_0203DA78, TILEMAP_LOCATED(gBG2TilemapBuffer, 9, 12));

    Proc_Start(gUnknown_085A93A0, proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08046838
void sub_8046838(ProcPtr proc)
{
    int i;
    u8 buf[4];

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_LinkArenaRankIcons, (void *)(GetBackgroundTileDataOffset(1) + 0x06000F00));
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, (void *)(0x06014800));
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    sub_804C3A4(0);

    Decompress(gUnknown_085AE778, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 1, 5), gGenericBuffer, 0x1000);
    SetTextFont(&Font_0203DB64);
    ResetTextFont();

    sub_8043164();
    StartRuleSettingSpriteDrawStatic();
    LoadLinkArenaRuleSettings(buf);

    BG_SetPosition(BG_1, 0xfe, 0);

    for (i = 0; i < 3; i++)
    {
        int y = 6 + i * 3;

        ClearText(&gLinkArenaSt.texts[i]);
        Text_SetColor(&gLinkArenaSt.texts[i], 0);
        Text_DrawString(&gLinkArenaSt.texts[i], GetStringFromIndex(gLinkArenaRuleData[i].labelTextId));
        PutText(&gLinkArenaSt.texts[i], TILEMAP_LOCATED(gBG0TilemapBuffer, 6, y));

        sub_80476CC(i, buf[i]);
    }

    DrawLinkArenaModeIcon(TILEMAP_LOCATED(gBG1TilemapBuffer, 30 + gLinkArenaRuleData[1].xPos[0], 8), 0);
    DrawLinkArenaModeIcon(TILEMAP_LOCATED(gBG1TilemapBuffer, 30 + gLinkArenaRuleData[1].xPos[1], 8), 1);

    StartLinkArenaTitleBanner(proc, gUnknown_080D9D5E[gLinkArenaSt.unk_00], 0);

    sub_804C508();
    sub_8043100(0x74B, 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080469AC
void sub_80469AC(void)
{
    sub_8042980(3);
    return;
}

//! FE8U = 0x080469B8
void sub_80469B8(void)
{
    sub_8042980(0);
    return;
}
