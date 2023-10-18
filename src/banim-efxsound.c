#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "constants/terrains.h"

CONST_DATA struct ProcCmd ProcScr_efxSoundSE[] = {
    PROC_NAME("efxSoundSE"),
    PROC_REPEAT(Loop6C_efxSoundSE),
    PROC_END
};

void EfxPlaySE(int songid, int volume)
{
    struct ProcEfxSoundSE * proc;

    if (gBmSt.gameStateBits & BM_FLAG_5)
        return;

    if (CheckEfxSoundSeExist() == 0)
    {
        RegisterEfxSoundSeExist();
        Sound_SetBGMVolume(volume);
        PlaySoundEffect(songid);
        return;
    }

    proc = Proc_Start(ProcScr_efxSoundSE, PROC_TREE_3);
    proc->volume = volume;
    proc->index = songid;
    proc->timer = 0;
}

void Loop6C_efxSoundSE(struct ProcEfxSoundSE * proc)
{
    if (++proc->timer == 5)
    {
        Proc_Break(proc);
        return;
    }

    if (CheckEfxSoundSeExist() == 0)
    {
        RegisterEfxSoundSeExist();
        Sound_SetBGMVolume(proc->volume);
        PlaySoundEffect(proc->index);
        Proc_Break(proc);
    }
}

void DoM4aSongNumStop(int num)
{
    m4aSongNumStop(num);
}

void EfxOverrideBgm(int songid, int volume)
{
    if (gBmSt.gameStateBits & BM_FLAG_5)
        return;

    Sound_SetSEVolume(volume);
    OverrideBgm(songid);
}

void StopBGM1(void)
{
    m4aMPlayStop(&gMPlayInfo_BGM1);
}

void UnregisterEfxSoundSeExist(void)
{
    gEfxSoundSeExist = false;
}

void RegisterEfxSoundSeExist(void)
{
    gEfxSoundSeExist = true;
}

int CheckEfxSoundSeExist(void)
{
    return gEfxSoundSeExist;
}

void M4aPlayWithPostionCtrl(int songid, int x, int flag)
{
    int pan;

    if (gBmSt.gameStateBits & BM_FLAG_5)
        return;

    if (flag != 0)
    {
        struct MusicPlayerInfo * info;
        if (x <= 0x77)
            pan = Div(x * x, 0x78) - 0x78;
        else
            pan = 0x78 - Div((0xF0 - x) * (0xF0 - x), 0x78);

        info = gMPlayTable[gSongTable[songid].ms].info;
        m4aMPlayImmInit(info);
        m4aMPlayPanpotControl(info, 0xFFFF, pan);
    }
    else
    {
        struct MusicPlayerInfo * info;
        info = gMPlayTable[gSongTable[songid].ms].info;
        m4aMPlayImmInit(info);
        m4aMPlayPanpotControl(info, 0xFFFF, RerangeSomething(x));
    }
}

/* https://decomp.me/scratch/B31Dj */
#if 0
void EfxPlaySEwithCmdCtrl(struct Anim * anim, int cmd)
{
    u16 val1, val2, val3;
    int pos, terrain, volume, tmp;
    int songid;
    s16 _songid;
    struct Anim * anim2 = GetAnimAnotherSide(anim);

    if (GetAISLayerId(anim) == 1)
        return;

    pos = GetAnimPosition(anim);
    if (pos == POS_L)
        terrain = gEkrPairTerrainID[POS_L];
    else
        terrain = gEkrPairTerrainID[POS_R];

    val1 = sub_8072258(terrain);
    if (terrain == TERRAIN_BRIDGE_14)
    {
        if (sub_80723A4(anim) == 0)
            val1 = 2;
    }

    if (pos == POS_L)
        val2 = sub_80723D4(gEkrPairBaseCon[POS_L]);
    else
        val2 = sub_80723D4(gEkrPairBaseCon[POS_R]);

    songid = (u16)-1;
    val3 = anim->xPosition + sub_807290C(anim);
    volume = 0x100;

    switch (cmd) {
    case 25:
        songid = 0xD1;
        break;

    case 27:
        songid = gBanimSongTable1[val1][pos];
        break;

    case 28:
        songid = gBanimSongTable2[val1][pos];
        break;

    case 29:
        songid = gBanimSongTable2[val1][pos];
        break;

    case 30:
        songid = gBanimSongTable2[val1][pos];
        break;

    case 31:
        sub_8072504(anim2);

        if (sub_8072400(anim2) != 2)
        {
            int flag = GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim));
            if (flag & 0x200)
            {
                _songid = 0x3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (sub_8072400(anim2)) {
        case 1:
            songid = 0xD5;
            break;

        case 2:
            songid = 0x2CE;
            break;

        case 0:
            songid = 0xD2;
            break;

        default:
            break;
        }
        val3 = anim2->xPosition + sub_807290C(anim2);
        break;

    case 32:
        sub_8072504(anim2);

        if (sub_8072400(anim2) != 2)
        {
            int flag = GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim));
            if (flag & 0x200)
            {
                _songid = 0x3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (sub_8072400(anim2)) {
        case 1:
            songid = 0xD5;
            break;

        case 2:
            songid = 0x2CE;
            break;

        case 0:
            songid = 0xD3;
            break;

        default:
            break;
        }
        val3 = anim2->xPosition + sub_807290C(anim2);
        break;

    case 33:
        sub_8072504(anim2);

        if (sub_8072400(anim2) != 2)
        {
            int flag = GetBattleAnimRoundTypeFlags((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim));
            if (flag & 0x200)
            {
                _songid = 0x3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (sub_8072400(anim2)) {
        case 1:
            songid = 0xD5;
            break;

        case 2:
            songid = 0x2CE;
            break;

        case 0:
            songid = 0xD4;
            break;

        default:
            break;
        }
        val3 = anim2->xPosition + sub_807290C(anim2);
        break;

    case 34:
        songid = 0xC9;
        break;

    case 35:
        songid = 0xC8;
        break;

    case 36:
        songid = 0xCA;
        break;

    case 37:
        songid = 0x263;
        if (pos == POS_L)
            songid = songid - 1;
        break;

    case 40:
        songid = 0xF6;
        break;

    case 41:
        songid = 0x141;
        break;

    case 42:
        songid = 0x142;
        break;

    case 43:
        songid = 0x267;
        if (pos == POS_L)
            songid = songid - 1;
        break;

    case 47:
        songid = 0x2F8;
        break;

    case 51:
        songid = 0xE7;
        break;

    case 52:
        if (pos == POS_L)
            tmp = gEkrPairBanimID2[POS_L];
        else
            tmp = gEkrPairBanimID2[POS_R];

        switch (tmp) {
        case 0xBC:
        case 0xBD:
        case 0xBE:
        case 0xBF:
            songid = gBanimSongTable1[val1][pos + 4];
            break;

        default:
            songid = gBanimSongTable1[val1][pos + val2 * 2];
            break;
        }
        break;

    case 53:
        songid = 0x265;
        if (pos == POS_L)
            songid = songid - 1;
        break;

    case 54:
        songid = 0xCE;
        break;

    case 55:
        songid = 0xCF;
        break;

    case 56:
        songid = 0xCB;
        break;

    case 58:
        songid = 0x2D3;
        break;

    case 59:
        songid = 0x2D4;
        break;

    case 60:
        songid = 0x263;
        if (pos == POS_L)
            songid = songid - 1;

        volume = 0x80;
        break;

    case 62:
        songid = 0xF1;
        break;

    case 63:
        songid = 0x136;
        break;

    case 64:
        songid = 0x117;
        break;

    case 65:
        songid = 0xEB;
        break;

    case 66:
        songid = 0xEA;
        break;

    case 67:
        songid = 0x2CF;
        break;

    case 68:
        songid = 0x2D0;
        break;

    case 69:
        songid = 0x2D1;
        break;

    case 70:
        songid = 0x2D2;
        break;

    case 72:
        songid = 0xED;
        break;

    case 73:
        songid = 0x135;
        break;

    case 74:
        songid = 0x134;
        break;

    case 75:
        songid = 0x2DD;
        break;

    case 76:
        songid = 0x2DE;
        break;

    case 77:
        songid = 0x2DF;
        break;

    case 79:
        songid = 0x2F7;
        break;

    case 80:
        songid = 0x2E8;
        break;

    case 86:
        songid = 0x325;
        break;

    case 87:
        songid = 0x326;
        break;

    case 88:
        songid = 0x327;
        break;

    case 89:
        songid = gBanimSongTable5[val1][pos + val2 * 2];
        break;

    case 90:
        songid = 0x32A;
        break;

    case 91:
        songid = 0x32B;
        break;

    case 92:
        songid = 0x32C;
        break;

    case 93:
        songid = gBanimSongTable6[val1][pos + val2 * 2];
        break;

    case 94:
        songid = 0x32E;
        break;

    case 95:
        songid = 0x332;
        break;

    case 96:
        songid = 0x3B7;
        break;

    case 97:
        songid = 0x32F;
        break;

    case 98:
        songid = 0x330;
        break;

    case 99:
        songid = 0x331;
        break;

    case 100:
        songid = 0x320;
        break;

    case 101:
        songid = 0x321;
        break;

    case 102:
        songid = gBanimSongTable7[val1][pos + val2 * 2];
        break;

    case 103:
        songid = gBanimSongTable8[val1][pos + val2 * 2];
        break;

    case 104:
        songid = 0x3C0;
        break;

    case 106:
        songid = 0x3C2;
        break;

    case 107:
        songid = 0x3C3;
        break;

    case 108:
        songid = 0x3C4;
        break;

    case 109:
        songid = gBanimSongTable1[val1][pos];
        break;

    case 110:
        songid = gBanimSongTable1[val1][pos + 2];
        break;

    case 111:
        songid = gBanimSongTable1[val1][pos + 4];
        break;

    case 112:
        songid = gBanimSongTable1[val1][pos + 6];
        break;

    case 115:
        songid = 0x322;
        break;

    case 116:
        songid = 0x37D;
        break;

    case 117:
        songid = 0x329;
        break;

    case 118:
        songid = 0x37A;
        break;

    case 119:
        songid = 0x37B;
        break;

    case 120:
        songid = 0x2E4;
        break;

    case 121:
        songid = 0x37C;
        break;

    case 122:
        songid = 0x37F;
        break;

    case 123:
        songid = 0xDE;
        break;

    default:
        songid = 0x0;
        break;
    }

    _songid = songid;
    if (_songid != -1)
    {
        EfxPlaySE(_songid, volume);
        M4aPlayWithPostionCtrl(_songid, val3, 1);
    }
}
#endif
