#include "gbafe.h"

EWRAM_OVERLAY(banim) struct EkrDragonStatus gEkrDragonStatusLeft  = {0};
EWRAM_OVERLAY(banim) struct EkrDragonStatus gEkrDragonStatusRight = {0};
EWRAM_OVERLAY(banim) u16 gEkrDragonPalBackup[0x40 / sizeof(u16)] = {0};

u32 GetEkrDragonStatusType_(struct Anim * anim);

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

struct EkrDragonStatus * GetEkrDragonStatus(struct Anim * anim)
{
    if (GetAnimPosition(anim) == EKR_POS_L)
        return &gEkrDragonStatusLeft;
    else
        return &gEkrDragonStatusRight;
}

u16 GetEkrDragonStatusAttr(struct Anim * anim)
{
    return GetEkrDragonStatus(anim)->attr;
}

void AddEkrDragonStatusAttr(struct Anim * anim, u16 attr_bitfile)
{
    GetEkrDragonStatus(anim)->attr |= attr_bitfile;
}

u32 GetEkrDragonStatusType(struct Anim * anim)
{
    return GetEkrDragonStatusType_(anim);
}

/* 1 for Draco Zombie, 2 for DemonKing, 3 for Myrrh */
u32 GetEkrDragonStatusType_(struct Anim * anim)
{
    return GetEkrDragonStatus(anim)->type;
}

void SetEkrDragonStatusType(struct Anim * anim, u8 type)
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

void EkrDragonTmCpyHFlip(int x, int y)
{
    int ix, iy;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL || GetBanimDragonStatusType() == EKRDRGON_TYPE_MYRRH)
        return;

    ix = x >> 3;
    iy = y >> 3;

    EfxTmCpyExtHFlip(gEkrTsaBuffer, -1,
        EFX_TILEMAP_LOC(gTmB_Banim, ix, iy),
        EFX_BG_WIDTH,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, 6, 0);
}

void EkrDragonTmCpyExt(int x, int y)
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

    buf = gTmB_Banim + 0x21 + _x;
    buf += 66 * _y;

    EfxTmCpyExt(
        buf,
        EFX_BG_WIDTH,
        gBG3TilemapBuffer,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, 32, -1, -1);

    BG_EnableSyncByMask(BG3_SYNC_BIT);
}

void EkrDragonTmCpyWithDistance(void)
{
    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        EkrDragonTmCpyHFlip(0x90, 0);
        break;

    case EKR_DISTANCE_FAR:
        EkrDragonTmCpyHFlip(0x58, 0);
        break;

    case EKR_DISTANCE_FARFAR:
        EkrDragonTmCpyHFlip(-0x78, 0);
        break;

    default:
        break;
    }
}

bool CheckEfrDragonStatusAttrPrepared(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);

    if (attr & EKRDRGON_ATTR_BANIMFX_PREPARED)
        return true;
    else
        return false;
}

bool CheckEfrDragonStatusAttrEnd(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);

    if (attr & EKRDRGON_ATTR_END)
        return true;
    else
        return false;
}
