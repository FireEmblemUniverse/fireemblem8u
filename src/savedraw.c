#include "global.h"

#include "savemenu.h"

#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"

#define SAVE_MENU_PARENT(proc) ((struct SaveMenuProc *)(proc->proc_parent))

extern u16 gUnknown_08A20590[];
extern u16 * gUnknown_08A2067C[];
extern u16 * gUnknown_08A20650[];

//! FE8U = 0x080AA7EC
void sub_80AA7EC(struct SaveDrawProc * proc)
{
    int x;
    int y;
    u16 hours;
    u16 minutes;
    u16 seconds;

    struct SaveMenuProc * saveMenuProc = SAVE_MENU_PARENT(proc);

    // FIXME: Can we avoid the shifts? Is this a cast to u8?
    y = (((0x20 - ((saveMenuProc->unk_2f * 0x20) / 220)) << 0x18) + 0x92000000) >> 0x18;

    x = 143;

    if (saveMenuProc->action_flag == 1)
    {
        FormatTime(saveMenuProc->unk_54, &hours, &minutes, &seconds);
    }
    else
    {
        FormatTime(saveMenuProc->unk_48[saveMenuProc->save_slot], &hours, &minutes, &seconds);
    }

    PutSpriteExt(13, x + 6, y - 14, Obj_08A20590, OAM2_PAL(2));

    if (hours > 99)
    {
        PutSpriteExt(13, x + 10, y - 8, Objs_08A2067C[(hours / 100)], OAM2_PAL(7));
        hours = hours - ((hours / 100) * 100);
    }

    if (hours > 9)
    {
        PutSpriteExt(13, x + 18, y - 8, Objs_08A2067C[(hours / 10)], OAM2_PAL(7));
    }

    PutSpriteExt(13, x + 26, y - 8, Objs_08A2067C[(hours % 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 34, y - 7, Objs_08A2067C[10], OAM2_PAL(7));
    PutSpriteExt(13, x + 42, y - 8, Objs_08A2067C[(minutes / 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 50, y - 8, Objs_08A2067C[(minutes % 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 58, y + 1, gUnknown_08A20650[10], OAM2_PAL(7));
    PutSpriteExt(13, x + 66, y, gUnknown_08A20650[(seconds / 10)], OAM2_PAL(7));
    PutSpriteExt(13, x + 74, y, gUnknown_08A20650[(seconds % 10)], OAM2_PAL(7));

    return;
}

struct Unknown8A215A4
{
    s16 a;
    int b;
    int c;
};

struct Unknown8A215A4 * sub_8014E74(int, int);
void sub_8014EA8(void);

#if NONMATCHING

/* https://decomp.me/scratch/srRsF */

//! FE8U = 0x080AA9D8
void sub_80AA9D8(struct SaveDrawProc * proc)
{
    struct Unknown8A215A4 * ptr;
    int i;
    u16 x;
    s16 unk_40;

    proc->unk_3e++;

    proc->unk_40 += 2;

    x = (proc->unk_3e << 0x14) >> 0x17;
    unk_40 = (proc->unk_40 >> 3) & 0xff;

    for (ptr = sub_8014E74(0, 1), i = 0; i < 0x100; ptr++, i++)
    {
        int v = SIN(unk_40 * i) / 0x300;
        ptr->a = ((v + x) & 0x1ff);
    }

    BG_SetPosition(2, x, unk_40);

    sub_8014EA8();

    return;
}

#else

NAKEDFUNC
void sub_80AA9D8(struct SaveDrawProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        ldrh r1, [r0, #0x3e]\n\
        adds r1, #1\n\
        strh r1, [r0, #0x3e]\n\
        adds r2, r0, #0\n\
        adds r2, #0x40\n\
        ldrh r1, [r2]\n\
        adds r1, #2\n\
        strh r1, [r2]\n\
        ldrh r4, [r0, #0x3e]\n\
        lsls r4, r4, #0x14\n\
        lsrs r4, r4, #0x17\n\
        ldrh r0, [r2]\n\
        lsrs r7, r0, #3\n\
        movs r0, #0xff\n\
        ands r7, r0\n\
        movs r0, #0\n\
        movs r1, #1\n\
        bl sub_8014E74\n\
        adds r6, r7, #0\n\
        ldr r1, _080AAA64  @ gSinLookup\n\
        mov sl, r1\n\
        lsls r4, r4, #0x10\n\
        asrs r2, r4, #0x10\n\
        mov r8, r2\n\
        adds r5, r0, #0\n\
        mov r9, r4\n\
        movs r4, #0x9f\n\
    _080AAA1A:\n\
        movs r0, #0xff\n\
        ands r0, r6\n\
        lsls r0, r0, #1\n\
        add r0, sl\n\
        movs r1, #0\n\
        ldrsh r0, [r0, r1]\n\
        movs r1, #0xc0\n\
        lsls r1, r1, #2\n\
        bl __divsi3\n\
        lsls r0, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        add r0, r8\n\
        ldr r2, _080AAA68  @ 0x000001FF\n\
        adds r1, r2, #0\n\
        ands r0, r1\n\
        strh r0, [r5]\n\
        adds r6, #0xc\n\
        adds r5, #2\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bge _080AAA1A\n\
        mov r0, r9\n\
        lsrs r1, r0, #0x10\n\
        adds r2, r7, #0\n\
        movs r0, #2\n\
        bl BG_SetPosition\n\
        bl sub_8014EA8\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080AAA64: .4byte gSinLookup\n\
    _080AAA68: .4byte 0x000001FF\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080AAA6C
void sub_80AAA6C(void)
{
    sub_8014E3C();
    return;
}

extern u16 gUnknown_08A280A8[];

//! FE8U = 0x080AAA78
void sub_80AAA78(struct SaveDrawProc * proc)
{
    proc->unk_29 = 1;
    proc->unk_2c = 0;
    proc->unk_2e = 0x100;
    proc->unk_3a = 0;
    proc->unk_3b = 40;
    proc->unk_30 = 0;
    proc->unk_32 = 0;

    SetObjAffine(0, 0x100, 0, 0, 0x100);
    SetObjAffine(1, 0x100, 0, 0, 0x100);
    SetObjAffine(2, 0x100, 0, 0, 0x100);
    SetObjAffine(3, 0x100, 0, 0, 0x100);

    proc->unk_2a = 0;
    proc->unk_34 = StartSaveDrawCursor(proc);
    proc->unk_39 = 0;

    if (SAVE_MENU_PARENT(proc)->unk_3f == 0xff)
    {
        SAVE_MENU_PARENT(proc)->unk_60 = NULL;
    }
    else
    {
        SAVE_MENU_PARENT(proc)->unk_60 =
            APProc_Create(gUnknown_08A280A8, 320, SAVE_MENU_PARENT(proc)->unk_3f * 32 + 48, 0x3140, 0, 4);
    }

    proc->unk_3c = SAVE_MENU_PARENT(proc)->save_slot;
    proc->unk_40 = 0;
    proc->unk_3e = 0;

    sub_8014DA8(__ewram_start);
    sub_8014EC4(0, REG_ADDR_BG2HOFS);
    sub_8014EF4(0);

    sub_80AA9D8(proc);
    gUnknown_03004990->unk_79E = 1;

    sub_80AB548();

    return;
}

//! FE8U = 0x080AAB78
void sub_80AAB78(s8 flag, u16 color)
{
    if (flag != 0)
    {
        PAL_OBJ_COLOR(6, 8) = PAL_OBJ_COLOR(9, ((color >> 2) & 0xf));
    }
    else
    {
        PAL_OBJ_COLOR(6, 8) = PAL_OBJ_COLOR(9, 13);
    }

    EnablePaletteSync();

    return;
}

extern u16 * gUnknown_08A209B8[];
extern u16 gUnknown_08A2051C[];

//! FE8U = 0x080AABC4
void sub_80AABC4(ProcPtr unused, int x, int y, u8 spriteIdx, u8 palIdA, u8 palIdB)
{
    PutSpriteExt(4, OAM1_X(x), y, gUnknown_08A2051C, OAM2_PAL(palIdA));
    PutSpriteExt(4, OAM1_X(x + 8), y + 8, gUnknown_08A209B8[spriteIdx], OAM2_PAL(palIdB));
    return;
}

extern u16 * gUnknown_08A2099C[];
extern u16 gUnknown_08A2051C[];

//! FE8U = 0x080AAC40
void sub_80AAC40(ProcPtr unused, int x, int y, u8 spriteIdx, u8 palIdA, u8 palIdB)
{
    PutSpriteExt(4, OAM1_X(x), y, gUnknown_08A2051C, OAM2_PAL(palIdA));
    PutSpriteExt(4, OAM1_X(x + 8), y + 8, gUnknown_08A2099C[spriteIdx], OAM2_PAL(palIdB));
    return;
}

//! FE8U = 0x080AACBC
void sub_80AACBC(struct SaveDrawProc * proc)
{
    if (proc->unk_3c != SAVE_MENU_PARENT(proc)->save_slot)
    {
        sub_80ABD88(SAVE_MENU_PARENT(proc)->save_slot);
        proc->unk_3c = SAVE_MENU_PARENT(proc)->save_slot;
    }

    sub_80ABE3C(proc->unk_2a, proc->unk_3c);

    EnablePaletteSync();

    if (SAVE_MENU_PARENT(proc)->unk_3f != 0xff)
    {
        if (SAVE_MENU_PARENT(proc)->unk_44 != 0x100)
        {
            if (SAVE_MENU_PARENT(proc)->unk_44 < 0x10)
            {
                SAVE_MENU_PARENT(proc)->unk_3f = 0xff;
            }
            else
            {

                // clang-format off
                SetObjAffine(
                    3,
                    Div(+COS(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(-SIN(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(+SIN(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44),
                    Div(+COS(SAVE_MENU_PARENT(proc)->unk_44) * 16, SAVE_MENU_PARENT(proc)->unk_44)
                );
                // clang-format on
            }

            SAVE_MENU_PARENT(proc)->unk_44 -= 16;
        }
    }

    sub_80AA7AC(proc->unk_2a, proc->unk_3c);
    proc->unk_2a++;

    return;
}

extern u16 gUnknown_08A2051C[];
extern u16 * gUnknown_08A209B8[];

u8 sub_80A88B8(u8);

//! FE8U = 0x080AADE0
void sub_80AADE0(struct SaveDrawProc * proc)
{
    struct SaveMenuProc * saveMenuProc;
    u8 spriteIdx;

    int y = OAM0_Y(((SAVE_MENU_PARENT(proc)->unk_2f * 48) / 0xdc) + 0x1d0);

    PutSpriteExt(4, 48, y, gUnknown_08A2051C, OAM2_PAL(2));

    saveMenuProc = SAVE_MENU_PARENT(proc);

    if (saveMenuProc->unk_46 != 0)
    {
        if (saveMenuProc->unk_35 & 0x10)
        {
            PutSpriteExt(4, 56, y + 8, gUnknown_08A209B8[10], OAM2_PAL(4));
        }
        else
        {
            PutSpriteExt(4, 56, y + 8, gUnknown_08A209B8[8], OAM2_PAL(4));
        }
    }
    else
    {
        spriteIdx = sub_80A88B8(saveMenuProc->action_flag);
        PutSpriteExt(4, 56, y + 8, gUnknown_08A209B8[spriteIdx], OAM2_PAL(4));
    }

    return;
}

//! FE8U = 0x080AAE90
void sub_80AAE90(struct SaveDrawProc * proc)
{
    int i;
    u64 tmp; // found by permuter
    int xOffset = SAVE_MENU_PARENT(proc)->unk_2f + SAVE_MENU_PARENT(proc)->unk_46;

    if (xOffset < 220)
    {
        int y = 68 - ((int)((SAVE_MENU_PARENT(proc)->unk_31) * 25) >> 1);
        if (y < 2)
        {
            y = 2;
        }

        for (i = 0; i < SAVE_MENU_PARENT(proc)->unk_31; i++)
        {
            int spriteIdx = sub_80A88B8(SaveMenuIndexToValidBitfile(SAVE_MENU_PARENT(proc)->active_options, i));

            if (i == SAVE_MENU_PARENT(proc)->menu_index)
            {
                sub_80AABC4(proc, 48 - xOffset, y + i * 25, spriteIdx, 1, 4);
            }
            else
            {
                sub_80AABC4(proc, 48 - xOffset, y + i * 25, spriteIdx, 6, 4);
            }
        }

        if (SAVE_MENU_PARENT(proc)->unk_2e == 2)
        {
            tmp = y + (SAVE_MENU_PARENT(proc)->menu_index * 25);
            sub_80AB4F4(0, 28, tmp, proc);
        }
    }

    return;
}

//! FE8U = 0x080AAF6C
void sub_80AAF6C(struct SaveDrawProc * proc)
{
    int i;
    int yBase;
    int yMult;
    int spriteIdx;

    u16 tmp = SAVE_MENU_PARENT(proc)->unk_46 - 1;

    if (tmp > 438)
    {
        return;
    }

    if (SAVE_MENU_PARENT(proc)->unk_33 == 7)
    {
        yBase = 2;
        yMult = 21;
    }
    else
    {
        yBase = 68 - SAVE_MENU_PARENT(proc)->unk_33 * 12;
        if (yBase < 2)
        {
            yBase = 2;
        }
        yMult = 25;
    }

    for (i = 0; i < SAVE_MENU_PARENT(proc)->unk_33; i++)
    {
        spriteIdx = sub_80A88B8(SaveMenuIndexToValidBitfile(SAVE_MENU_PARENT(proc)->unk_32, i));

        if (i == SAVE_MENU_PARENT(proc)->unk_34)
        {
            sub_80AAC40(proc, 268 - SAVE_MENU_PARENT(proc)->unk_46, yBase + i * yMult, spriteIdx, 1, 4);
        }
        else
        {
            sub_80AAC40(proc, 268 - SAVE_MENU_PARENT(proc)->unk_46, yBase + i * yMult, spriteIdx, 6, 4);
        }
    }

    if (SAVE_MENU_PARENT(proc)->unk_2e == 10)
    {
        sub_80AB4F4(0, 28, yBase + SAVE_MENU_PARENT(proc)->unk_34 * yMult, proc);
    }

    return;
}

extern u16 * gUnknown_08A209E4[];
extern u16 * gUnknown_08A209F0[];
extern u16 gUnknown_08A20588[];
extern u16 gUnknown_08A20536[];

//! FE8U = 0x080AB05C
void sub_80AB05C(struct SaveDrawProc * proc)
{
    int i;

    if (SAVE_MENU_PARENT(proc)->unk_2f != 0)
    {
        sub_80AA7EC(proc);
        sub_80AADE0(proc);

        for (i = 0; i < 3; i++)
        {
            int y;
            if ((SAVE_MENU_PARENT(proc)->unk_2e == 6) && (SAVE_MENU_PARENT(proc)->save_slot == i))
            {
                y = 0x100;
            }
            else
            {
                y = 0;
            }

            PutSpriteExt(
                4, OAM1_X(248 - SAVE_MENU_PARENT(proc)->unk_2f), y + 32 + (i * 32), gUnknown_08A209F0[i],
                OAM2_PAL(i * 2 + 10));
            PutSpriteExt(
                4, OAM1_X(248 - SAVE_MENU_PARENT(proc)->unk_2f), (y + 32 + (i * 32)) + 8, gUnknown_08A209E4[i],
                OAM2_PAL(i * 2 + 11));
        }

        if (SAVE_MENU_PARENT(proc)->unk_3f != 0xff)
        {
            if (SAVE_MENU_PARENT(proc)->unk_44 != 0x100)
            {
                int unused;
                if (SAVE_MENU_PARENT(proc)->unk_60 != NULL)
                {
                    APProc_Delete(SAVE_MENU_PARENT(proc)->unk_60);
                    SAVE_MENU_PARENT(proc)->unk_60 = NULL;
                }

                // redundant
                if (SAVE_MENU_PARENT(proc)->action_flag & 1)
                    PutSpriteExt(4, 202, SAVE_MENU_PARENT(proc)->unk_3f * 0x20 + 0x1e, gUnknown_08A20588, 0x3000);
                else
                    PutSpriteExt(4, 202, SAVE_MENU_PARENT(proc)->unk_3f * 0x20 + 0x1e, gUnknown_08A20588, 0x3000);
            }
            else
            {
                if (SAVE_MENU_PARENT(proc)->action_flag == 1)
                {
                    APProc_SetParameters(
                        SAVE_MENU_PARENT(proc)->unk_60, 436 - SAVE_MENU_PARENT(proc)->unk_2f,
                        SAVE_MENU_PARENT(proc)->unk_3f * 32 + 48, 0x3140);
                }
                else
                {
                    APProc_SetParameters(
                        SAVE_MENU_PARENT(proc)->unk_60, 320, SAVE_MENU_PARENT(proc)->unk_3f * 32 + 48, 0x3140);
                    PutSpriteExt(
                        4, 422 - SAVE_MENU_PARENT(proc)->unk_2f, SAVE_MENU_PARENT(proc)->unk_3f * 32 + 30,
                        gUnknown_08A20588, 0x3000);
                }
            }
        }
    }

    if ((SAVE_MENU_PARENT(proc)->unk_2e) > 4 && (SAVE_MENU_PARENT(proc)->unk_2e) < 7)
    {
        if (SAVE_MENU_PARENT(proc)->unk_36 != 0)
        {
            PutSpriteExt(4, 44, 128, gUnknown_08A20536, OAM2_PAL(2));
            DisplayUiHand(((SAVE_MENU_PARENT(proc)->unk_36 - 1) % 2) * 44 + 52, 136);
            sub_80AB4F4(1, 12, SAVE_MENU_PARENT(proc)->save_slot * 32 + 32, proc);
        }
        else
        {
            if (SAVE_MENU_PARENT(proc)->save_slot != 0xff)
            {
                sub_80AB4F4(1, 12, SAVE_MENU_PARENT(proc)->save_slot * 32 + 32, proc);
            }
        }

        if (SAVE_MENU_PARENT(proc)->unk_2d != 0xff)
        {
            sub_80AB514(1, SAVE_MENU_PARENT(proc)->unk_2d * 32 + 32, proc);
        }
    }

    return;
}

//! FE8U = 0x080AB2A0
void sub_80AB2A0(struct SaveDrawProc * proc)
{
    if (proc->unk_29 != 0)
    {
        if (SAVE_MENU_PARENT(proc)->action_flag < 0x100)
        {
            if (SAVE_MENU_PARENT(proc)->action_flag == 0x20)
            {
                proc->unk_33 = SAVE_MENU_PARENT(proc)->unk_35;
            }
            else
            {
                proc->unk_33 = SAVE_MENU_PARENT(proc)->action_flag;
            }
        }

        sub_80AAE90(proc);
        sub_80AAF6C(proc);
        sub_80AB05C(proc);
        sub_80AACBC(proc);
    }

    sub_80AA9D8(proc);
    sub_80AB56C(proc->unk_2a);

    return;
}

extern struct ProcCmd ProcScr_savedraw[];

//! FE8U = 0x080AB300
struct SaveDrawProc * New6C_savedraw(ProcPtr parent)
{
    return Proc_Start(ProcScr_savedraw, parent);
}
