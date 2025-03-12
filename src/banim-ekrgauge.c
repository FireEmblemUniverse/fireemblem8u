#include "gbafe.h"

void sub_8050E40(void *_src, void *_dst)
{
    u16 *src = _src;
    u16 *dst = _dst;
    u32 i, val;

    for (i = 0; i < 11; i++) {
        u32 val = *src == 0xFF ? 0xF : *src;
        CpuFastCopy(&PAL_BUF_COLOR(gUnknown_08802904, val, 0), &PAL_BUF_COLOR(dst, i, 0), 0x10 * sizeof(u16));
        src++;
    }

    CpuFastFill(0, &PAL_BUF_COLOR(dst, 0xC, 0), 0x10 * sizeof(u16));
}

/**
 * buf[0] = val % 100
 * buf[1] = (val - [val]) % 10
 * buf[1] = (val - [val]) % 1
 * 
 * example:
 * in 312, out 3, 1, 2
 * 
 * in 458, out 4, 5, 8
 */
void ModDec(s16 val, u16 buf[])
{
    if (val == -1) {
        buf[0] = 11;
        buf[1] = 10;
        buf[2] = 10;
        return;
    }

    buf[0] = Div(val, 100);

    val -= buf[0] * 100;
    buf[1] = Div(val, 10);

    val -= buf[1] * 10;
    buf[2] = val;

    if (buf[0] == -buf[1])
        buf[1] = 11;

    if (buf[0] == 0)
        buf[0] = 11;
}

CONST_DATA struct ProcCmd ProcScr_ekrGauge[] = {
    PROC_NAME("ekrGauge"),
    PROC_REPEAT(ekrGaugeMain),
    PROC_END
};

void NewEkrGauge(void)
{
    u32 i, j;

    gpProcEkrGauge = Proc_Start(ProcScr_ekrGauge, PROC_TREE_1);

    EkrGauge_Setup44(0);
    EkrGauge_Clr4C50();
    DisableEkrGauge();
    EkrGauge_ClrInitFlag();
    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

    if (gEkrGaugeHp[0] > 0x50)
        CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(0xB), 0x10 * sizeof(u16));
    else
        CpuCopy16(gUnknown_08802B04 + gBanimFactionPal[POS_L] * 0x10, PAL_OBJ(0xB), 0x10 * sizeof(u16));

    if (gEkrGaugeHp[1] > 0x50)
        CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(0xC), 0x10 * sizeof(u16));
    else
        CpuCopy16(gUnknown_08802B04 + gBanimFactionPal[POS_R] * 0x10, PAL_OBJ(0xC), 0x10 * sizeof(u16));

    gEkrGaugeHpBak[0] = -1;
    gEkrGaugeHpBak[1] = -1;

    LZ77UnCompVram(Img_EfxSideHitDmgCrit, (void *)0x6013800);
    LZ77UnCompVram(Img_EfxWTAArrow1, (void *)0x6013940);
    LZ77UnCompVram(Img_EfxWTAArrow2, (void *)0x6013D40);

    CpuFastCopy(gUnknown_08802884 + gBanimFactionPal[POS_L] * 0x10, PAL_OBJ(0x5), 0x10 * sizeof(u16));
    CpuFastCopy(gUnknown_08802884 + gBanimFactionPal[POS_R] * 0x10, PAL_OBJ(0x6), 0x10 * sizeof(u16));

    EnablePaletteSync();

    /* decode value to number for display: 998 --> 9 9 8 */
    ModDec(gEkrGaugeHit[0], &gEkrGaugeDecoder[0x0]);
    ModDec(gEkrGaugeDmg[0], &gEkrGaugeDecoder[0x3]);
    ModDec(gEkrGaugeCrt[0], &gEkrGaugeDecoder[0x6]);

    ModDec(gEkrGaugeHit[1], &gEkrGaugeDecoder[0x9]);
    ModDec(gEkrGaugeDmg[1], &gEkrGaugeDecoder[0xC]);
    ModDec(gEkrGaugeCrt[1], &gEkrGaugeDecoder[0xF]);

    CpuFastFill(0, gObjBuf_EkrSideHitDmgCrit, 0x400);

    /* value of hit & dmg & crit */
    for (i = 0; i < 6; i++) {
        for (j = 0; j < 3; j++) {
            int r4 = i * 0x40 + j * 0x10;

            CpuCopy16(
                gUnknown_088026E4 + gEkrGaugeDecoder[i * 3 + j] * 0x10,
                gObjBuf_EkrSideHitDmgCrit + r4,
                0x10 * sizeof(u16));
        }
    }

    /* left side of hit & dmg & crit */
    RegisterDataMove(gObjBuf_EkrSideHitDmgCrit, (void *)0x6013A00, 0xC0 * sizeof(u16));

    /* right side of hit & dmg & crit */
    RegisterDataMove(gObjBuf_EkrSideHitDmgCrit + 0xC0, (void *)0x6013E00, 0xC0 * sizeof(u16));

    ResetIconGraphics_();
    LoadIconPalette(0, 0x1D);
    LoadIconPalette(0, 0x1E);
    LoadIconObjectGraphics(GetItemIconId(gpEkrBattleUnitLeft->weaponBefore), 0x1DC);
    LoadIconObjectGraphics(GetItemIconId(gpEkrBattleUnitRight->weaponBefore), 0x1DE);
    ApplyPalette(gPal_MiscUiGraphics, 0x10);
}

void EndEkrGauge(void)
{
    Proc_End(gpProcEkrGauge);
}

void EkrGauge_Clr4C50(void)
{
    gpProcEkrGauge->unk4C = 0;
    gpProcEkrGauge->unk50 = 0;
}

void EkrGauge_Set4C50(void)
{
    gpProcEkrGauge->unk4C = 1;
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_Set4C(void)
{
    gpProcEkrGauge->unk4C = 1;
}

void EkrGauge_Set50(void)
{
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_Setup44(u16 val)
{
    gpProcEkrGauge->unk44 = val * 0x400;
}

void EkrGauge_Clr323A(s16 x, s16 y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = false;
}

void EkrGauge_Setxy323A(s16 x, s16 y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = true;
}

void EkrGauge_SetInitFlag(void)
{
    gpProcEkrGauge->battle_init = true;
}

void EkrGauge_ClrInitFlag(void)
{
    gpProcEkrGauge->battle_init = false;
}

void EnableEkrGauge(void)
{
    gpProcEkrGauge->valid = true;
}

void DisableEkrGauge(void)
{
    gpProcEkrGauge->valid = false;
}

void sub_8051238(struct EkrGaugeStruct1 *buf, int a, int b)
{
    if (a > 0) {
        if (b != 1) {
            unsigned int temp = 1;
            if (b < temp) {
                buf->unk3C = gUnknown_085B955C;
                return;
            }
        } else {
            buf->unk3C = gUnknown_085B9574;
            return;
        }

        buf->unk3C = gUnknown_085B958C;
    } else {
        if (b != 1) {
            unsigned int temp = 1;
            if (b < temp) {
                buf->unk3C = gUnknown_085B95A4;
                return;
            }
        } else {
            buf->unk3C = gUnknown_085B95BC;
            return;
        }

        buf->unk3C = gUnknown_085B95D4;
    }
}

/* W.I.P */
#if 0
void ekrGaugeMain(struct ProcEkrGauge * proc)
{
    struct Anim _anim;
    struct Anim * anim = &_anim;
    u16 buf[4];
    u8 sprite_data[0x50];
    u16 gauge_hp;
    int i, j, ret = 0;
    int lhp, rhp, lhpmax, rhpmax;
    int ix, iy, x1, x2, x3, x4, y1, y2, ix1, ix2, iy1, iy2;
    int val1, val2, val3, val4, val5;
    int time = DivRem(GetGameClock() / 8, 3);

    if (proc->valid != true)
        return;

    if (proc->battle_init == false)
    {
        int height;
        int r4, r7, r8, r9, sp_5C;

        r4 = proc->unk3A / 8;
        r7 = r4 * 0x20 + 0x1A0;

        if (r7 < 0)
            r7 = 0;

        height = r4 + 7;
        if (height > 7)
            height = 7;

        r8 = (7 - height) * 30;

        switch (gEkrDistanceType) {
        case 0:
        case 1:
        case 2:
            r9 = 0;
            sp_5C = 0xF;
            break;

        case 3:
        case 4:
        default:
            r9 = 0x8;
            sp_5C = 0x8;
            break;
        }

        FillBGRect(gBG0TilemapBuffer + 0x340 / 2, 0x1E, 0x8, 0, 0x80);

        if (proc->unk4C == 0)
        {
            EfxTmCpyBG(gUnknown_08802274 + r8, gBG0TilemapBuffer + r9 + r7, 0xF, height, -1, -1);
            sub_8070D04(gBG0TilemapBuffer + r9 + r7, 0xF, height, 2, 0x80);
        }

        if (proc->unk50 == 0)
        {
            void * src;
            if (proc->unk4C == 0)
                src = gUnknown_08802348 + r8;
            else
                src = gUnknown_08802428 + r8;

            EfxTmCpyBG(src, gBG0TilemapBuffer + sp_5C, 0x10, height, -1, -1);
            sub_8070D04(gBG0TilemapBuffer + sp_5C, 0x10, height, 3, 0x80);
        }
        BG_EnableSyncByMask(BG0_SYNC_BIT);
    }

    /* _080513C4 */
    if (gEkrGaugeHpBak[POS_L] != gEkrGaugeHp[POS_L])
        ret = true;

    if (gEkrGaugeHpBak[POS_R] != gEkrGaugeHp[POS_R])
        ret = true;

    gEkrGaugeHpBak[POS_L] != gEkrGaugeHp[POS_L];
    gEkrGaugeHpBak[POS_R] != gEkrGaugeHp[POS_R];

    lhp = gEkrGaugeHp[POS_L];       /* R7 */
    lhpmax = gBanimMaxHP[POS_L];  /* r6 */
    rhp = gEkrGaugeHp[POS_R];       /* R8 */
    rhpmax = gBanimMaxHP[POS_R];  /* var64 */

    switch (gEkrDistanceType) {
    case 3:
        if (gBanimValid[POS_L] == true)
            y2 = proc->unk32 + 0x38;
        else
            y2 = proc->unk32 - 0x38;
        break;

    case 0:
    case 1:
    case 2:
        y2 = proc->unk32 - 0x38;
        break;

    case 4:
    default:
        y2 = proc->unk32;
        break;
    }

    /* _0805145E */
    if (proc->battle_init == false)
    {
        x3 = proc->unk3A;
        x3 = x3 & 0xFFF8;
    }
    else
        x3 = proc->unk3A;

    buf[0] = Div(gEkrGaugeHp[POS_L], 10);
    buf[1] = buf[0] * 10 - gEkrGaugeHp[POS_L];

    if (buf[0] == 0)
        buf[0] = 11;

    buf[2] = Div(gEkrGaugeHp[POS_L], 10);
    buf[3] = buf[2] * 10 - gEkrGaugeHp[POS_L];

    if (buf[2] == 0)
        buf[2] = 11;

    if (gEkrGaugeHp[POS_L] > 80)
    {
        buf[0] = 12;
        buf[1] = 12;
    }

    if (gEkrGaugeHp[POS_R] > 80)
    {
        buf[2] = 12;
        buf[3] = 12;
    }

    ix = y2 + 9;
    iy = x3 + 145;
    ix2 = y2 + 129;
    val1 = lhp << 16;
    val2 = lhpmax << 16;
    val3 = y2 + 29;
    val4 = rhp << 16;
    val5 = rhpmax << 16;
    x4 = y2 + 149;

    if (ret == 1)
    {
        CpuFastFill16(0, gUnk_Banim_02016DC8, 0x80);
        for (i = 0; i <= 1; i++)
        {
            for (j = 0; j <= 1; j++)
            {
                int hp = buf[i * 2 + j];
                CpuCopy16(gUnknown_088026E4 + hp * 0x10, gUnk_Banim_02016DC8 + i * 0x20 + j * 0x10, 0x20);
            }
        }
        RegisterDataMove(gUnk_Banim_02016DC8, (void *)0x60139C0, 0x40);
        RegisterDataMove(gUnk_Banim_02016DC8 + 0x40, (void *)0x6013DC0, 0x40);
    }

    anim->oam2Base = proc->unk44 | 0xB1CE;
    anim->xPosition = ix;
    anim->yPosition = iy;
    anim->state2 = 0;

    if (CheckEkrHitNow(POS_L) != true)
    {
        anim->pSpriteData = gUnknown_085B940C;
        anim->oamBase = 0;
    }
    else
    {
        anim->pSpriteData = sprite_data;
        anim->oamBase = 0x200;
        anim->xPosition = anim->xPosition - 8;
        anim->yPosition = anim->yPosition - 8;
        BanimUpdateSpriteRotScale(gUnknown_085B940C, sprite_data, 0x100, 0x80, 1);
    }

    if (proc->unk4C == 0)
        AnimDisplay(anim);

    anim->oamBase = 0;
    anim->oam2Base = proc->unk44 | 0xC1EE;
    anim->xPosition = ix2;
    anim->yPosition = iy;
    anim->state2 = 0;

    if (CheckEkrHitNow(POS_L) != true)
    {
        anim->pSpriteData = gUnknown_085B940C;
        anim->oamBase = 0;
    }
    else
    {
        anim->pSpriteData = sprite_data;
        anim->oamBase = 0x200;
        anim->xPosition = anim->xPosition - 8;
        anim->yPosition = anim->yPosition - 8;
        BanimUpdateSpriteRotScale(gUnknown_085B940C, sprite_data, 0x100, 0x80, 1);
    }

    if (proc->unk50 == 0)
        AnimDisplay(anim);

    /* _0805168C */
}
#endif
