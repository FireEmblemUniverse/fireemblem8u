#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "gamecontrol.h"
#include "game-introfx.h"

void GameIntroPutObjCommon(int ix, int iy, u8 a, u8 b)
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

void GameIntrofxTerminatorMain(struct Proc * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        SetNextGameActionId(GAME_ACTION_2);
        gUnknown_02022188.unk0C = 0;
        Proc_Goto(proc->proc_parent, 99);
    }
}

void NewGameIntrofxTerminator(ProcPtr parent)
{
    Proc_Start(ProcScr_GameIntrofxTerminator, parent);
}

void EndGameIntrofxTerminator(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_GameIntrofxTerminator));
}

void StorePaletteToBufferMaybe(const void * src, int offset, int size)
{
    CopyToPaletteBuffer(src, offset, size);
    gPaletteBuffer[0] = gUnknown_02022188.unk0C;
}

void sub_80C677C(const u16 * src, u16 * dst)
{
    int i;
    for (i = 0; i < 20; i++)
        dst[i * 0x20] = src[i * 0x20];
}

void sub_80C6794(u16 * src, u16 * dst, u8 pal)
{
    int i;
    for (i = 0; i < 20; i++)
    {
        *dst = (*src & 0x7FFF) | (pal << 0xC);
        src += 0x20;
        dst += 0x20;
    }
}

void sub_80C67C0(u16 * dst)
{
    int oam2 = 0;
    int i = 0x13;
    do {
        *dst = oam2;
        dst += 0x20;
    } while (--i >= 0);
}

/* This function need to work a lot */
/* https://decomp.me/scratch/RdAMR */
#if NONMATCHING

void sub_80C67D4(u16 a1, u16 a2, int a3, u16 bg, u16 * src1, u16 * src2, u8 a7)
{
    s16 i;
    u16 * tm = BG_GetMapBuffer(bg);

    if ((s16)a2 != 0)
        a2 = a2 - 8;

    for (i = a2 / 8 - 1; i < (a1 / 8 - 1); i++)
    {
        if (i > 0x1F && !src2)
        {
            sub_80C67C0(tm + (i % 0x20));
        }
        else
        {
            u16 * src = src2;
            if (i <= 0x1F)
                src = src1;

            if (a7 == 0)
                sub_80C6794(src + (i % 0x20), tm + (i % 0x20), 0xF);
        }
    }
    BG_SetPosition(bg, a1 / 8 + 0x10, 0);
}

#else

NAKEDFUNC
void sub_80C67D4(u16 a1, u16 a2, int a3, u16 bg, u16 * src1, u16 * src2, u8 a7)
{
    asm("\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        ldr r2, [sp, #0x24]\n\
        mov r9, r2\n\
        ldr r2, [sp, #0x28]\n\
        lsls r0, r0, #0x10\n\
        lsrs r6, r0, #0x10\n\
        lsls r1, r1, #0x10\n\
        lsrs r4, r1, #0x10\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov sl, r3\n\
        lsls r2, r2, #0x18\n\
        lsrs r2, r2, #0x18\n\
        mov r8, r2\n\
        mov r0, sl\n\
        bl BG_GetMapBuffer\n\
        adds r5, r0, #0\n\
        lsls r0, r4, #0x10\n\
        asrs r0, r0, #0x10\n\
        cmp r0, #0\n\
        bne _080C680E\n\
        subs r0, #8\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
    _080C680E:\n\
        lsls r0, r4, #0x10\n\
        asrs r0, r0, #0x13\n\
        adds r4, r0, #1\n\
        lsls r1, r6, #0x10\n\
        asrs r0, r1, #0x13\n\
        adds r0, #1\n\
        adds r6, r1, #0\n\
        cmp r4, r0\n\
        bge _080C687E\n\
        movs r7, #0x1f\n\
        mov r1, r8\n\
        lsls r0, r1, #0x18\n\
        asrs r0, r0, #0x18\n\
        mov r8, r0\n\
    _080C682A:\n\
        cmp r4, #0x3f\n\
        bhi _080C6838\n\
        cmp r4, #0x1f\n\
        ble _080C6846\n\
        mov r2, r9\n\
        cmp r2, #0\n\
        bne _080C6846\n\
    _080C6838:\n\
        adds r0, r4, #0\n\
        ands r0, r7\n\
        lsls r0, r0, #1\n\
        adds r0, r5, r0\n\
        bl sub_80C67C0\n\
        b _080C6874\n\
    _080C6846:\n\
        mov r0, r9\n\
        cmp r4, #0x1f\n\
        bgt _080C684E\n\
        ldr r0, [sp, #0x20]\n\
    _080C684E:\n\
        mov r1, r8\n\
        cmp r1, #0\n\
        bne _080C6864\n\
        adds r1, r4, #0\n\
        ands r1, r7\n\
        lsls r1, r1, #1\n\
        adds r0, r0, r1\n\
        adds r1, r5, r1\n\
        bl sub_80C677C\n\
        b _080C6874\n\
    _080C6864:\n\
        adds r1, r4, #0\n\
        ands r1, r7\n\
        lsls r1, r1, #1\n\
        adds r0, r0, r1\n\
        adds r1, r5, r1\n\
        movs r2, #0xf\n\
        bl sub_80C6794\n\
    _080C6874:\n\
        adds r4, #1\n\
        asrs r0, r6, #0x13\n\
        adds r0, #1\n\
        cmp r4, r0\n\
        blt _080C682A\n\
    _080C687E:\n\
        movs r2, #0x80\n\
        lsls r2, r2, #0xd\n\
        adds r1, r6, r2\n\
        lsrs r1, r1, #0x10\n\
        mov r0, sl\n\
        movs r2, #0\n\
        bl BG_SetPosition\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif
