#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "m4a.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

EWRAM_OVERLAY(banim) int gEkrMainBgmPlaying = false;
EWRAM_OVERLAY(banim) int gEfxSoundSeExist = false;

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

void DoM4aSongNumStop(int songid)
{
    m4aSongNumStop(songid);
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
        m4aMPlayPanpotControl(info, 0xFFFF, Screen2Pan(x));
    }
}

void EfxPlaySEwithCmdCtrl(struct Anim * anim, int cmd)
{
    u16 sound_type, sound_pos, val2;
    int pos, terrain, volume, basecon, tmp, _tmp;
    int songid;
    s16 _songid, _volume;
    u16 * song_table;

    struct Anim * anim2 = GetAnimAnotherSide(anim);

    if (GetAISLayerId(anim) == 1)
        return;

    pos = GetAnimPosition(anim);
    if (pos == POS_L)
        terrain = gBanimTerrain[POS_L];
    else
        terrain = gBanimTerrain[POS_R];

    sound_type = GetEfxSoundType1FromTerrain(terrain);
    if (terrain == TERRAIN_BRIDGE_14)
    {
        if (IsAnimSoundInPositionMaybe(anim) == 0)
            sound_type = 2;
    }

    if (pos == POS_L)
        basecon = gBanimCon[POS_L];
    else
        basecon = gBanimCon[POS_R];

    val2 = GetEfxSoundType2FromBaseCon(basecon);

    songid = (u16)-1;
    sound_pos = GetProperAnimSoundLocation(anim) + anim->xPosition;
    volume = 0x100;

    switch (cmd) {
    case 25:
        songid = SONG_D1;
        break;

    case 27:
        song_table = gBanimSongTable1[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 28:
        song_table = gBanimSongTable2[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 29:
        song_table = gBanimSongTable3[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 30:
        song_table = gBanimSongTable4[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 31:
        EfxPlayCriticalHittedSFX(anim2);

        if (GetEfxHpChangeType(anim2) != EFX_HPT_NOT_CHANGE)
        {
            if (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE)
            {
                _songid = SONG_3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = SONG_D2;
            break;

        case EFX_HPT_DEFEATED:
            songid = SONG_D5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = SONG_2CE;
            break;

        default:
            break;
        }
        sound_pos = anim2->xPosition + GetProperAnimSoundLocation(anim2);
        break;

    case 32:
        EfxPlayCriticalHittedSFX(anim2);
        if (GetEfxHpChangeType(anim2) != EFX_HPT_NOT_CHANGE)
        {
            if (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE)
            {
                _songid = SONG_3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = SONG_D3;
            break;

        case EFX_HPT_DEFEATED:
            songid = SONG_D5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = SONG_2CE;
            break;

        default:
            break;
        }
        sound_pos = anim2->xPosition + GetProperAnimSoundLocation(anim2);
        break;

    case 33:
        EfxPlayCriticalHittedSFX(anim2);

        if (GetEfxHpChangeType(anim2) != EFX_HPT_NOT_CHANGE)
        {
            if (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE)
            {
                _songid = SONG_3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = SONG_D4;
            break;

        case EFX_HPT_DEFEATED:
            songid = SONG_D5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = SONG_2CE;
            break;

        default:
            break;
        }
        sound_pos = anim2->xPosition + GetProperAnimSoundLocation(anim2);
        break;

    case 34:
        songid = SONG_C9;
        break;

    case 35:
        songid = SONG_C8;
        break;

    case 36:
        songid = SONG_CA;
        break;

    case 37:
        songid = SONG_263;
        if (pos == POS_L)
            songid = songid - 1; //SONG_262
        break;

    case 40:
        songid = SONG_F6;
        break;

    case 41:
        songid = SONG_141;
        break;

    case 42:
        songid = SONG_142;
        break;

    case 43:
        songid = SONG_267;
        if (pos == POS_L)
            songid = songid - 1; //SONG_266
        break;

    case 47:
        songid = SONG_2F8;
        break;

    case 51:
        songid = SONG_E7;
        break;

    case 52:
        if (pos != POS_L)
            tmp = gBanimIdx[POS_L];
        else
            tmp = gBanimIdx[POS_R];

        switch (tmp) {
        case 0xBC:  /* todo: battle anim index */
        case 0xBD:
        case 0xBE:
        case 0xBF:
            song_table = gBanimSongTable1[sound_type];
            _tmp = pos + 4;
            songid = song_table[_tmp];
            break;

        default:
            song_table = gBanimSongTable1[sound_type];
            songid = song_table[pos + val2 * 2];
            break;
        }
        break;

    case 53:
        songid = SONG_265;
        if (pos == POS_L)
            songid = songid - 1; // SONG_264
        break;

    case 54:
        songid = SONG_CE;
        break;

    case 55:
        songid = SONG_CF;
        break;

    case 56:
        songid = SONG_CB;
        break;

    case 58:
        songid = SONG_2D3;
        break;

    case 59:
        songid = SONG_2D4;
        break;

    case 60:
        songid = SONG_263;
        if (pos == POS_L)
            songid = songid - 1; //SONG_262

        volume = 0x80;
        break;

    case 62:
        songid = SONG_F1;
        break;

    case 63:
        songid = SONG_136;
        break;

    case 64:
        songid = SONG_117;
        break;

    case 65:
        songid = SONG_EB;
        break;

    case 66:
        songid = SONG_EA;
        break;

    case 67:
        songid = SONG_2CF;
        break;

    case 68:
        songid = SONG_2D0;
        break;

    case 69:
        songid = SONG_2D1;
        break;

    case 70:
        songid = SONG_2D2;
        break;

    case 72:
        songid = SONG_ED;
        break;

    case 73:
        songid = SONG_135;
        break;

    case 74:
        songid = SONG_134;
        break;

    case 75:
        songid = SONG_2DD;
        break;

    case 76:
        songid = SONG_2DE;
        break;

    case 77:
        songid = SONG_2DF;
        break;

    case 79:
        songid = SONG_2F7;
        break;

    case 80:
        songid = SONG_2E8;
        break;

    case 86:
        songid = SONG_325;
        break;

    case 87:
        songid = SONG_326;
        break;

    case 88:
        songid = SONG_327;
        break;

    case 89:
        song_table = gBanimSongTable5[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 90:
        songid = SONG_32A;
        break;

    case 91:
        songid = SONG_32B;
        break;

    case 92:
        songid = SONG_32C;
        break;

    case 93:
        song_table = gBanimSongTable6[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 94:
        songid = SONG_32E;
        break;

    case 95:
        songid = SONG_332;
        break;

    case 96:
        songid = SONG_3B7;
        break;

    case 97:
        songid = SONG_32F;
        break;

    case 98:
        songid = SONG_330;
        break;

    case 99:
        songid = SONG_331;
        break;

    case 100:
        songid = SONG_320;
        break;

    case 101:
        songid = SONG_321;
        break;

    case 102:
        song_table = gBanimSongTable7[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 103:
        song_table = gBanimSongTable8[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 104:
        songid = SONG_3C0;
        break;

    case 106:
        songid = SONG_3C2;
        break;

    case 107:
        songid = SONG_3C3;
        break;

    case 108:
        songid = SONG_3C4;
        break;

    case 109:
        song_table = gBanimSongTable1[sound_type];
        songid = song_table[pos];
        break;

    case 110:
        song_table = gBanimSongTable1[sound_type];
        songid = song_table[pos + 2];
        break;

    case 111:
        song_table = gBanimSongTable1[sound_type];
        songid = song_table[pos + 4];
        break;

    case 112:
        song_table = gBanimSongTable1[sound_type];
        songid = song_table[pos + 6];
        break;

    case 115:
        songid = SONG_322;
        break;

    case 116:
        songid = SONG_37D;
        break;

    case 117:
        songid = SONG_329;
        break;

    case 118:
        songid = SONG_37A;
        break;

    case 119:
        songid = SONG_37B;
        break;

    case 120:
        songid = SONG_2E4;
        break;

    case 121:
        songid = SONG_37C;
        break;

    case 122:
        songid = SONG_37F;
        break;

    case 123:
        songid = SONG_DE;
        break;

    default:
        songid = SONG_NONE;
        break;
    }

    _songid = songid;
    if (_songid != -1)
    {
        _volume = volume;
        EfxPlaySE(_songid, _volume);
#if !NONMATCHING
{
        register int r2 asm("r2");
        register int r1 asm("r1");

        r2 = sound_pos;
        r1 = (r2 << 0x10) >> 0x10;
        r2 = 1;
        M4aPlayWithPostionCtrl(_songid, r1, r2);
}
#else
        M4aPlayWithPostionCtrl(_songid, (s16)sound_pos, 1);
#endif
    }
}

u16 GetEfxSoundType1FromTerrain(u16 terrain)
{
    int ret;

    if (GetBattleAnimArenaFlag() == true)
        return 0;

    switch (terrain) {
    case TERRAIN_PLAINS:
    case TERRAIN_ROAD:
    case TERRAIN_VILLAGE_REGULAR:
    case TERRAIN_VILLAGE_CLOSED:
    case TERRAIN_HOUSE:
    case TERRAIN_FORT:
    case TERRAIN_MOUNTAIN:
    case TERRAIN_FENCE_REGULAR:
    case TERRAIN_WALL_REGULAR:
    case TERRAIN_WALL_DAMAGED:
    case TERRAIN_RUBBLE:
    case TERRAIN_ROOF:
    case TERRAIN_GATE_REGULAR:
    case TERRAIN_RUINS_REGULAR:
    case TERRAIN_BALLISTA_REGULAR:
    case TERRAIN_BALLISTA_LONG:
    case TERRAIN_BALLISTA_KILLER:
    case TERRAIN_SHIP_WRECK:
    case TERRAIN_GLACIER:
    case TERRAIN_SNAG:
    case TERRAIN_INN:
    case TERRAIN_BARREL:
    case TERRAIN_BRACE:
    case TERRAIN_MAST:
        ret = 0;
        break;

    case TERRAIN_FOREST:
    case TERRAIN_THICKET:
        ret = 1;
        break;

    case TERRAIN_RIVER:
    case TERRAIN_SEA:
    case TERRAIN_LAKE:
    case TERRAIN_DEEPS:
    case TERRAIN_WATER:
        ret = 2;
        break;

    case TERRAIN_PEAK:
    case TERRAIN_CLIFF:
    case TERRAIN_SHIP_FLAT:
    case TERRAIN_BONE:
    case TERRAIN_DARK:
    case TERRAIN_GUNNELS:
        ret = 3;
        break;

    case TERRAIN_SAND:
    case TERRAIN_DESERT:
        ret = 4;
        break;

    case TERRAIN_BRIDGE_REGULAR:
    case TERRAIN_BRIDGE_14:
        ret = 5;
        break;

    case TERRAIN_ARMORY:
    case TERRAIN_VENDOR:
    case TERRAIN_ARENA_REGULAR:
    case TERRAIN_C_ROOM_09:
    case TERRAIN_GATE_CASTLE:
    case TERRAIN_FLOOR_REGULAR:
    case TERRAIN_FLOOR_MAGIC:
    case TERRAIN_PILLAR:
    case TERRAIN_DOOR:
    case TERRAIN_THRONE:
    case TERRAIN_CHEST_EMPTY:
    case TERRAIN_CHEST_FULL:
    case TERRAIN_CHURCH:
    case TERRAIN_STAIRS:
    case TERRAIN_ARENA_30:
    case TERRAIN_VALLEY:
    case TERRAIN_FENCE_32:
    case TERRAIN_RUINS_VILLAGE:
    case TERRAIN_DECK:
        ret = 6;
        break;

    case TERRAIN_NONE:
    default:
        ret = 0;
        break;
    }
    return ret;
}

int IsAnimSoundInPositionMaybe(struct Anim * anim)
{
    int sound_pos = GetProperAnimSoundLocation(anim) + anim->xPosition;
    if (GetAnimPosition(anim) == POS_L)
    {
        if (sound_pos > 0x58)
            return false;
        else
            return true;
    }
    else
    {
        if (sound_pos <= 0x97)
            return false;
        else
            return true;
    }
}

u16 GetEfxSoundType2FromBaseCon(u16 basecon)
{
    int ret = 0;
    if (basecon >= 5)
    {
        if (basecon <= 8)
            ret = 1;
        else if (basecon <= 0xB)
            ret = 2;
        else if (basecon <= 0xF)
            ret = 3;
    }
    return ret;
}

s16 GetEfxHpChangeType(struct Anim * anim)
{
    int offset, hp1, hp2;
    offset = gEfxHpLutOff[GetAnimPosition(anim)];
    offset = offset * 2 + GetAnimPosition(anim);

    hp1 = GetEfxHp(offset);
    hp2 = GetEfxHp(offset + 2);

    if (hp1 != hp2)
    {
        /* Hurt */
        if (hp2 != 0)
            return EFX_HPT_CHANGED;

        /* Defeated */
        return EFX_HPT_DEFEATED;
    }
    /* Hp not change */
    return EFX_HPT_NOT_CHANGE;
}

void EfxPlayHittedSFX(struct Anim * anim)
{
    struct Anim * animr = GetAnimAnotherSide(anim);
    int songid = (u16)-1;
    s16 _songid;

    EfxPlayCriticalHittedSFX(anim);

    if (GetEfxHpChangeType(animr) != EFX_HPT_NOT_CHANGE && (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE))
    {
        _songid = SONG_3CF;
        EfxPlaySE(_songid, 0x100);
        M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
    }

    switch (GetEfxHpChangeType(anim)) {
    case EFX_HPT_CHANGED:
        songid = SONG_D4;
        break;

    case EFX_HPT_DEFEATED:
        songid = SONG_D5;
        break;

    case EFX_HPT_NOT_CHANGE:
        songid = SONG_2CE;
        break;

    default:
        break;
    }

    _songid = songid;
    if (_songid != -1)
    {
        EfxPlaySE(_songid, 0x100);
        M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
    }
}

void EfxPlayCriticalHittedSFX(struct Anim * anim)
{
    struct Anim * animr = GetAnimAnotherSide(anim);

    switch (GetEfxHpChangeType(anim)) {
    case EFX_HPT_CHANGED:
    case EFX_HPT_DEFEATED:
        if (CheckRoundCrit(animr) == true)
        {
            EfxPlaySE(SONG_D8, 0x100);
            M4aPlayWithPostionCtrl(SONG_D8, anim->xPosition, 1);
        }
        break;
    }
}

int EfxCheckRetaliation(int is_retaliation)
{
    int ret;
    struct BattleHit * hit = gBattleHitArray;

    if (hit->info & BATTLE_HIT_INFO_RETALIATION)
        ret = true;
    else
        ret = false;

    if (is_retaliation == ret)
        return true;

    return false;
}

int EfxCheckStaffType(int weapon)
{
    int ret;

    if (!weapon)
        return 0;

    switch (GetItemIndex(weapon)) {
    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_MEND:
    case ITEM_STAFF_RECOVER:
    case ITEM_STAFF_PHYSIC:
    case ITEM_STAFF_FORTIFY:
    case ITEM_STAFF_RESTORE:
    case ITEM_STAFF_REPAIR:
    case ITEM_STAFF_BARRIER:
    case ITEM_STAFF_LATONA:
        return 2;

    case ITEM_STAFF_SILENCE:
    case ITEM_STAFF_SLEEP:
    case ITEM_STAFF_BERSERK:
        return 1;

    default:
        return 0;
    }
}


void EkrPlayMainBGM(void)
{
    int ret, songid, songid2, pid, staff_type;
    struct BattleUnit * bu, * bul, * bur, ** pbul, ** pbur;

    pbul = &gpEkrBattleUnitLeft;
    pbur = &gpEkrBattleUnitRight;

    bul = *pbul;
    bur = *pbur;

    if (gBmSt.gameStateBits & BM_FLAG_5)
    {
        gEkrMainBgmPlaying = 0;
        return;
    }

    gEkrMainBgmPlaying = 1;

    songid = gBanimFactionPal[gEkrInitialHitSide] != 1 ? SONG_ATTACK : SONG_DEFENSE;

    if (GetBattleAnimArenaFlag() == 1)
    {
        Sound_SetDefaultMaxNumChannels();
        EfxOverrideBgm(SONG_IN_THE_COLOSSEUM, 0x100);
        return;
    }

    if (GetBanimLinkArenaFlag() == 1)
    {
        EfxOverrideBgm(SONG_IN_THE_COLOSSEUM, 0x100);
        return;
    }

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        EfxOverrideBgm(SONG_TO_A_HIGHER_PLACE, 0x100);
        return;
    }

    ret = false;
    if (EkrCheckWeaponSieglindeSiegmund(bur->weaponBefore) == true)
        ret = true;

    if (!EkrCheckAttackRound(1))
        ret = false;

    if (gBanimValid[POS_L] == false)
        ret = false;

    pid = UNIT_CHAR_ID(&bul->unit);
    if (pid == CHARACTER_LYON)
        ret = false;

    if (pid == CHARACTER_LYON_FINAL)
        ret = false;

    if (pid == CHARACTER_FOMORTIIS)
        ret = false;

    if (ret == true)
    {
        EfxOverrideBgm(SONG_SACRED_STRENGTH, 0x100);
        return;
    }

    if (pid == CHARACTER_FOMORTIIS)
    {
        if (CheckFlag82() == true)
        {
            EfxOverrideBgm(SONG_55, 0x100);
            return;
        }
        SetFlag82();
    }

    songid2 = GetBanimBossBGM(&bul->unit);

    if (UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bul->unit))) == FACTION_BLUE)
        songid2 = -1;

    if (gBanimValid[POS_L] == false)
        songid2 = -1;

    if (songid2 != -1)
    {
        EfxOverrideBgm(songid2, 0x100);
        return;
    }

    ret = false;
    if (UNIT_CLASS_ID(&bur->unit) == CLASS_DANCER)
    {
        if (gBattleStats.config & 0x40)
            ret = true;

        if (gBattleStats.config & 0x200)
            ret = true;
    }

    if (ret == true)
    {
        EfxOverrideBgm(SONG_TETHYS, 0x100);
        return;
    }

    if (EfxCheckRetaliation(POS_L) == true)
        staff_type = EfxCheckStaffType(gBattleActor.weaponBefore);
    else if (EfxCheckRetaliation(POS_R) == true)
        staff_type = EfxCheckStaffType(gBattleTarget.weaponBefore);
    else
        staff_type = 0;


    switch (staff_type) {
    case 2:
        songid = SONG_CURING;
        break;

    case 1:
        songid = SONG_HEALING;
        break;

    default:
        break;
    }

    if (songid != -1)
    {
        EfxOverrideBgm(songid, 0x100);
        return;
    }
    gEkrMainBgmPlaying = false;
}

void EkrRestoreBGM(void)
{
    if (CheckBanimHensei() == true || gBmSt.gameStateBits & BM_FLAG_5 || gEkrMainBgmPlaying == false)
    {
        MakeBgmOverridePersist();
        return;
    }

    RestoreBgm();
}

CONST_DATA int gBanimBossBGMs[32 * 2] = {
    CHARACTER_ONEILL,           SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_BREGUET,          SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_BONE,             SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_BAZBA,            SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_ENTOUMBED_CH4,    SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_SAAR,             SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_NOVALA,           SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_MURRAY,           SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_TIRADO,           SONG_POWERFUL_FOE,
    CHARACTER_BINKS,            SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_PABLO,            SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_WIGHT_CHUnk,      SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_DEATHGOYLE_CHUnk, SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_MAELDUIN_CHUnk,   SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_AIAS,             SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_CARLYLE,          SONG_POWERFUL_FOE,
    CHARACTER_ZONTA,            SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_GHEB,             SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_BERAN,            SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_CYCLOPS_CHUnk,    SONG_THE_BATTLE_MUST_BE_WON,
    CHARACTER_SELENA,           SONG_POWERFUL_FOE,
    CHARACTER_VIGARDE,          SONG_POWERFUL_FOE,
    CHARACTER_CAELLACH,         SONG_POWERFUL_FOE,
    CHARACTER_VALTER,           SONG_POWERFUL_FOE,
    CHARACTER_ORSON,            SONG_POWERFUL_FOE,
    CHARACTER_LYON,             SONG_THE_PRINCES_DESPAIR,
    CHARACTER_GORGON_CHUnk,     SONG_POWERFUL_FOE,
    CHARACTER_RIEV,             SONG_POWERFUL_FOE,
    CHARACTER_MORVA,            SONG_POWERFUL_FOE,
    CHARACTER_LYON_FINAL,       SONG_THE_PRINCES_DESPAIR,
    CHARACTER_FOMORTIIS,        SONG_RETURN_OF_THE_DEMON_KING,
    -1, -1
};

int GetBanimBossBGM(struct Unit * unit)
{
    int i, pid = UNIT_CHAR_ID(unit);
    for (i = 0; gBanimBossBGMs[i] != -1; i = i + 2)
    {
        if (pid == gBanimBossBGMs[i])
            break;
    }
    return gBanimBossBGMs[i + 1];
}

int GetProperAnimSoundLocation(struct Anim * anim)
{
    int i, header, val2, val1;
    u32 ret;
    const struct AnimSpriteData * anim_sprite, * it;

    anim_sprite = anim->pSpriteData;
    header = anim_sprite->header;

    if ((header & 0xFFFF0000) == 0xFFFF0000)
        for (val2 = (header & 0x0000FFFF); val2 != 0; val2--, anim_sprite++);

    it = anim_sprite;
    val2 = 0;
    val1 = 0;

    for (; it->header != 1; it++)
    {
        int a, b, c;
        
        a = it->as.object.x;
        a += (GetAnimSpriteRotScaleX(it->header) << 0x10) >> 0x11;
        b = GetAnimSpriteRotScaleX(it->header);
        c = GetAnimSpriteRotScaleY(it->header);

        val1 += ((s16)b) * ((s16)c) * a;
        val2 += ((s16)b) * ((s16)c);
    }

    if (val2 == 0)
        ret = 0x7FFFFFFF;
    else
        ret = Div(val1, val2);

    val1 = ret;

    asm("":::"memory");
    ret = val1;
    return val1;
}

void PlaySFX(int songid, int volume, int locate, int type)
{
    EfxPlaySE(songid, volume);
    M4aPlayWithPostionCtrl(songid, locate, type);
}

void PlaySfxAutomatically(int songid, int volume, struct Anim * anim)
{
    EfxPlaySE(songid, volume);
    M4aPlayWithPostionCtrl(songid, GetProperAnimSoundLocation(anim), 1);
}
