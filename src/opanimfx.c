#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "gamecontrol.h"
#include "opanim.h"

CONST_DATA u16 unk_AA6BB8[] = {
    2,
    0x0000, 0x4000, 0x0000,
    0x8000, 0x0010, 0x0004,

    6,
    0x4000, 0x8000, 0x0000,
    0x4000, 0x8020, 0x0008,
    0x4000, 0x8040, 0x0010,
    0x4000, 0x8060, 0x0018,
    0x4000, 0x8080, 0x0020,
    0x0000, 0x40A0, 0x0028,

    2,
    0x4000, 0x8000, 0x0000,
    0x0000, 0x4020, 0x0008
};

CONST_DATA u16 Obj_OpAnimEphEirikaName[] = {
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(0x00), OAM2_CHR(0x000 / 0x20),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(0x20), OAM2_CHR(0x100 / 0x20),
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(0x40), OAM2_CHR(0x200 / 0x20)
};

CONST_DATA u16 Obj_08AA6C0E[] = {
    3,
    0x4000, 0x8000, 0x0000,
    0x0000, 0x4020, 0x0008,
    0x8000, 0x0030, 0x000C
};

CONST_DATA u16 Obj_08AA6C22[] = {
    3,
    0x4000, 0xC000, 0x0000,
    0x4020, 0x4000, 0x0020,
    0x4020, 0x4020, 0x0024
};

CONST_DATA u16 Obj_08AA6C36[] = {
    3,
    0x4000, 0xD000, 0x0000,
    0x4020, 0x5000, 0x0024,
    0x4020, 0x5020, 0x0020
};

CONST_DATA u16 Obj_08AA6C4A[] = {
    2,
    0x0000, 0x8000, 0x0000,
    0x8000, 0x8020, 0x0010
};

CONST_DATA u16 Obj_08AA6C58[] = {
    2,
    0x8000, 0x9000, 0x0010,
    0x0000, 0x9010, 0x0000
};

CONST_DATA u16 Obj_08AA6C66[] = {
    2,
    0x4000, 0x8000, 0x0000,
    0x4010, 0x4000, 0x0008
};

CONST_DATA u16 Obj_08AA6C74[] = {
    2,
    0x4000, 0x9000, 0x0000,
    0x4010, 0x5000, 0x0008
};

CONST_DATA u16 Obj_08AA6C82[] = {
    1,
    0x0000, 0x4000, 0x0000,
};

CONST_DATA u16 Obj_08AA6C8A[] = {
    1,
    0x0000, 0x5000, 0x0000,
};

CONST_DATA u16 Obj_08AA6C92[] = {
    1,
    0x4000, 0x0000, 0x0000,
};

CONST_DATA u16 Obj_08AA6C9A[] = {
    1,
    0x4000, 0x1000, 0x0000,
};

void OpAnimPutObjCommon(int ix, int iy, u8 a, u8 b)
{
    const u16 * obj;
    int oam2_chr;
    u16 oam2;

    switch (a) {
    case 0:
        switch (b) {
        case 0:
            oam2_chr = 0x8A;
            obj = Obj_08AA6C22;
            break;

        case 1:
            oam2_chr = 0x8A;
            obj = Obj_08AA6C36;
            break;

        case 2:
            oam2_chr = 0xB2;
            obj = Obj_08AA6C22;
            break;

        case 3:
            oam2_chr = 0xB2;
            obj = Obj_08AA6C36;
            break;

        default:
            break;
        }
        break;

    case 1:
        switch (b) {
        case 0:
            oam2_chr = 0xDA;
            obj = Obj_08AA6C4A;
            break;

        case 1:
            oam2_chr = 0xDA;
            obj = Obj_08AA6C58;
            break;

        case 2:
            oam2_chr = 0xF2;
            obj = Obj_08AA6C4A;
            break;

        case 3:
            oam2_chr = 0xF2;
            obj = Obj_08AA6C58;
            break;

        default:
            break;
        }
        break;

    case 2:
        switch (b) {
        case 0:
            oam2_chr = 0x10A;
            obj = Obj_08AA6C66;
            break;

        case 1:
            oam2_chr = 0x10A;
            obj = Obj_08AA6C74;
            break;

        case 2:
            oam2_chr = 0x116;
            obj = Obj_08AA6C66;
            break;

        case 3:
            oam2_chr = 0x116;
            obj = Obj_08AA6C74;
            break;

        case 4:
            oam2_chr = 0x13A;
            obj = Obj_08AA6C66;
            break;

        case 5:
            oam2_chr = 0x13A;
            obj = Obj_08AA6C74;
            break;
        }
        break;

    case 3:
        switch (b) {
        case 0:
            oam2_chr = 0x122;
            obj = Obj_08AA6C82;
            break;

        case 1:
            oam2_chr = 0x122;
            obj = Obj_08AA6C8A;
            break;

        case 2:
            oam2_chr = 0x126;
            obj = Obj_08AA6C82;
            break;

        case 3:
            oam2_chr = 0x126;
            obj = Obj_08AA6C8A;
            break;

        case 4:
            oam2_chr = 0x12E;
            obj = Obj_08AA6C82;
            break;

        case 5:
            oam2_chr = 0x12E;
            obj = Obj_08AA6C8A;
            break;
        }
        break;

    case 4:
        switch (b) {
        case 0:
            oam2_chr = 0x12A;
            obj = Obj_08AA6C92;
            break;

        case 1:
            oam2_chr = 0x12A;
            obj = Obj_08AA6C9A;
            break;

        case 2:
            oam2_chr = 0x12C;
            obj = Obj_08AA6C92;
            break;

        case 3:
            oam2_chr = 0x12C;
            obj = Obj_08AA6C9A;
            break;

        case 4:
            oam2_chr = 0x132;
            obj = Obj_08AA6C92;
            break;

        case 5:
            oam2_chr = 0x132;
            obj = Obj_08AA6C9A;
            break;

        case 6:
            oam2_chr = 0x134;
            obj = Obj_08AA6C92;
            break;

        case 7:
            oam2_chr = 0x134;
            obj = Obj_08AA6C9A;
            break;

        case 8:
            oam2_chr = 0x136;
            obj = Obj_08AA6C92;
            break;

        case 9:
            oam2_chr = 0x136;
            obj = Obj_08AA6C9A;
            break;

        case 10:
            oam2_chr = 0x138;
            obj = Obj_08AA6C92;
            break;

        case 11:
            oam2_chr = 0x138;
            obj = Obj_08AA6C9A;
            break;
        }
        break;
    }
    oam2 = 0x3000 | oam2_chr;
    PutSpriteExt(0, ix, iy, obj, oam2);
}

void OpAnimfxTerminatorMain(struct Proc * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        SetNextGameActionId(GAME_ACTION_USR_SKIPPED);
        gOpAnimSt.pal = 0;
        Proc_Goto(proc->proc_parent, 99);
    }
}

CONST_DATA struct ProcCmd ProcScr_OpAnimfxTerminator[] = {
    PROC_YIELD,
    PROC_REPEAT(OpAnimfxTerminatorMain),
    PROC_END
};

void NewOpAnimfxTerminator(ProcPtr parent)
{
    Proc_Start(ProcScr_OpAnimfxTerminator, parent);
}

void EndOpAnimfxTerminator(void)
{
    Proc_End(Proc_Find(ProcScr_OpAnimfxTerminator));
}

void CopyToPalOpAnim(const void * src, int offset, int size)
{
    CopyToPaletteBuffer(src, offset, size);
    gPaletteBuffer[0] = gOpAnimSt.pal;
}

void CopyFirstPalDirectly(const u16 * src, u16 * dst)
{
    int i;
    for (i = 0; i < 20; i++)
        dst[i * 0x20] = src[i * 0x20];
}

void SetFirstPalDirectly(u16 * src, u16 * dst, u8 pal)
{
    int i;
    for (i = 0; i < 20; i++)
    {
        *dst = (*src & 0x7FFF) | (pal << 0xC);
        src += 0x20;
        dst += 0x20;
    }
}

void ClearFirstPalDirectly(u16 * dst)
{
    int oam2 = 0;
    int i = 0x13;
    do {
        *dst = oam2;
        dst += OAM2_CHR(0x400 / 0x20);
    } while (--i >= 0);
}

void TsaModifyFirstPalMaybe(s16 end, s16 start, s16 unused, u16 bg, u16 * src1, u16 * src2, s8 flag)
{
    u16 * dst;
    u16 * src;
    int i;

    dst = BG_GetMapBuffer(bg);

    if (start == 0)
        start -= 8;
    
    for (i = (start >> 3) + 1; i < (end >> 3) + 1; i++)
    {
        if (((u32)i >= 0x40) || (i >= 0x20 && src2 == 0))
        {
            ClearFirstPalDirectly(dst + (i & 0x1f));
            continue;
        }

        if (i < 0x20)
            src = src1;
        else
            src = src2;
        
        if (flag == 0)
            CopyFirstPalDirectly(src + (i & 0x1f), dst + (i & 0x1f));
        else
            SetFirstPalDirectly(src + (i & 0x1f), dst + (i & 0x1f), 0xf);
    }
    BG_SetPosition(bg, end + 0x10, 0);
}

//! FE8U = 0x080C689C
void sub_80C689C(s16 end, s16 start, s16 offset, u16 bg, u16 * src1, u16 * src2, s8 flag)
{
    u16 * src;
    u16 * dst;
    int i;

    dst = BG_GetMapBuffer(bg);

    if (start == 0)
    {
        start -= 8;
    }

    end = end + offset;
    start = start + offset;

    if (src2 != 0)
    {
        end = 0x200 - end;
        start = 0x200 - start;
    }
    else
    {
        end = 0x100 - end;
        start = 0x100 - start;
    }

    for (i = (start >> 3) - 1; i > (end >> 3) - 1; i--)
    {
        if (((u32)i >= 0x40) || (i >= 0x20 && src2 == 0))
        {
            ClearFirstPalDirectly(dst + (i & 0x1f));
            continue;
        }

        if (i < 0x20)
        {
            src = src1;
        }
        else
        {
            src = src2;
        }

        if (src == 0)
        {
            break;
        }

        if (flag == 0)
        {
            CopyFirstPalDirectly(src + (i & 0x1f), dst + (i & 0x1f));
        }
        else
        {
            SetFirstPalDirectly(src + (i & 0x1f), dst + (i & 0x1f), 0xf);
        }
    }

    BG_SetPosition(bg, end, 0);

    return;
}

//! FE8U = 0x080C69B0
void sub_80C69B0(u16 * pal, u16 color, u16 blend)
{
    int i;

    for (i = 0; i < 0x10; i++)
    {
        u8 r = ((RED_VALUE(*pal) * (0x10 - blend)) + (RED_VALUE(color) * blend)) >> 4;
        u8 g = ((GREEN_VALUE(*pal) * (0x10 - blend)) + (GREEN_VALUE(color) * blend)) >> 4;
        u8 b = ((BLUE_VALUE(*pal) * (0x10 - blend)) + (BLUE_VALUE(color) * blend)) >> 4;

        *pal++ = ((b & 0x1f) << 10) | ((g & 0x1f) << 5) | (r & 0x1f);
    }

    return;
}