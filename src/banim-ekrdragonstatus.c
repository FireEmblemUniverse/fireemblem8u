#include "global.h"
#include "hardware.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

EWRAM_DATA struct EkrDragonStatus gEkrDragonStatusLeft  = {0};
EWRAM_DATA struct EkrDragonStatus gEkrDragonStatusRight = {0};
EWRAM_DATA u16 gEkrDragonPalBackup[0x40 / sizeof(u16)] = {0};

u32 GetEkrDragonStatusType_(struct Anim *anim);

void ResetEkrDragonStatus(void)
{
    struct EkrDragonStatus *dstat;

    dstat = &gEkrDragonStatusLeft;
    dstat->type = 0;
    dstat->unk01 = 0;
    dstat->attr = 0;
    dstat->proc = NULL;
    dstat->unk08 = 0;
    dstat->anim = NULL;

    dstat = &gEkrDragonStatusRight;
    dstat->type = 0;
    dstat->unk01 = 0;
    dstat->attr = 0;
    dstat->proc = NULL;
    dstat->unk08 = 0;
    dstat->anim = NULL;
}

struct EkrDragonStatus *GetEkrDragonStatus(struct Anim *anim)
{
    if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT)
        return &gEkrDragonStatusLeft;
    else
        return &gEkrDragonStatusRight;
}

u16 GetEkrDragonStatusAttr(struct Anim *anim)
{
    return GetEkrDragonStatus(anim)->attr;
}

void AddEkrDragonStatusAttr(struct Anim *anim, u16 attr_bitfile)
{
    GetEkrDragonStatus(anim)->attr |= attr_bitfile;
}

u32 GetEkrDragonStatusType(struct Anim *anim)
{
    return GetEkrDragonStatusType_(anim);
}

/* 1 for Draco Zombie, 2 for DemonKing, 3 for Myrrh */
u32 GetEkrDragonStatusType_(struct Anim *anim)
{
    return GetEkrDragonStatus(anim)->type;
}

void SetEkrDragonStatusType(struct Anim *anim, u8 type)
{
    GetEkrDragonStatus(anim)->type = type;
}

int GetEkrDragonStatusUnk1(void)
{
    return gEkrDragonStatusLeft.unk01;
}

void SetEkrDragonStatusUnk1(int unk1)
{
    gEkrDragonStatusLeft.unk01 = unk1;
}

u32 GetBanimDragonStatusType(void)
{
    int ret;

    ret = GetEkrDragonStatusType(gEkrDragonStatusLeft.anim);
    if (ret)
        return ret;

    ret = GetEkrDragonStatusType(gEkrDragonStatusRight.anim);
    if (ret)
        return ret;

    return 0;
}

void sub_806FAD8(int a, int b)
{
    int _a, _b;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL || GetBanimDragonStatusType() == EKRDRGON_TYPE_MYRRH)
        return;

    _a = a >> 3;
    _b = b >> 3;

    sub_8070FA4(gEkrTsaBuffer, -1,
        gUnknown_0201D428 + _a + 66 * _b,
        66, 32, 32, 6, 0);
}

void EkrDragonBgSetPostion(int x, int y)
{
    int _x, _y;
    int tmp1, tmp2, tmp3;
    u16 *buf;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL)
        return;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_MYRRH)
        return;
    
    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_DEMON_KING) {
        tmp1 = x - 0x70;
        x = tmp1 - gEkrXQuakeOff;

        tmp2 = y + 0x08;
        y = tmp2 - gEkrYQuakeOff;
    }

    _x = x >> 3;
    tmp3 = 7;
    _y = y >> 3;

    BG_SetPosition(BG_3, x & tmp3, y & tmp3);

    buf = gUnknown_0201D46A + _x;
    buf += 66 * _y;

    sub_8070EF4(buf, 66, gBG3TilemapBuffer, 32, 32, 32, -1, -1);
    
    BG_EnableSyncByMask(BG3_SYNC_BIT);
}

void sub_806FBB8(void)
{
    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        sub_806FAD8(0x90, 0);
        break;

    case EKR_DISTANCE_FAR:
        sub_806FAD8(0x58, 0);
        break;

    case EKR_DISTANCE_FARFAR:
        sub_806FAD8(-0x78, 0);
        break;

    default:
        break;
    }
}

bool CheckEfrDragonStatusAttrPrepared(struct Anim *anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);

    if (attr & EKRDRGON_ATTR_BANIMFX_PREPARED)
        return true;
    else
        return false;
}

bool CheckEfrDragonStatusAttrEnd(struct Anim *anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);

    if (attr & EKRDRGON_ATTR_END)
        return true;
    else
        return false;
}
