#include "global.h"

#include "hardware.h"

#include "worldmap.h"

struct GmapPalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 38 */ u16 * unk_38;
    /* 3C */ u16 * unk_3c;
    /* 40 */ u16 * unk_40;
};

struct InputStruct
{
    /* 00 */ u16 * unk_00;
    /* 04 */ u16 * unk_04;
    /* 08 */ u8 unk_08;
    /* 09 */ u8 unk_09;
    /* 0C */ int unk_0c;
};

extern u16 gUnknown_08A95FE4[];
extern u16 gUnknown_08A95F64[];

//! FE8U = 0x080BF5C0
void nullsub_50(void)
{
    return;
}

//! FE8U = 0x080BF5C4
void sub_80BF5C4(struct GmapPalFadeProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_40 = gPaletteBuffer + proc->unk_35;
    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/K21xg */

//! FE8U = 0x080BF5DC
void sub_80BF5DC(struct GmapPalFadeProc * proc)
{
    int i;

    proc->unk_30++;

    if (proc->unk_30 < proc->unk_2c)
    {
        int scale = proc->unk_30 * 0x40 / proc->unk_2c;

        for (i = 0; i < proc->unk_34; i++)
        {
            u16 red =
                RED_VALUE(proc->unk_38[i]) + ((RED_VALUE(proc->unk_3c[i]) - RED_VALUE(proc->unk_38[i])) * scale / 0x40);
            u16 green = GREEN_VALUE(proc->unk_38[i]) +
                ((GREEN_VALUE(proc->unk_3c[i]) - GREEN_VALUE(proc->unk_38[i])) * scale / 0x40);
            u16 blue = BLUE_VALUE(proc->unk_38[i]) +
                ((BLUE_VALUE(proc->unk_3c[i]) - BLUE_VALUE(proc->unk_38[i])) * scale / 0x40);

            proc->unk_40[i] = (blue << 10) + (green << 5) + red;
        }
    }
    else
    {
        CpuCopy16(proc->unk_3c, proc->unk_40, proc->unk_34 * 2);
        Proc_Break(proc);
    }

    EnablePaletteSync();

    return;
}

#else

NAKEDFUNC
void sub_80BF5DC(struct GmapPalFadeProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        adds r5, r0, #0\n\
        ldr r0, [r5, #0x30]\n\
        adds r0, #1\n\
        str r0, [r5, #0x30]\n\
        ldr r1, [r5, #0x2c]\n\
        cmp r0, r1\n\
        bge _080BF69A\n\
        lsls r0, r0, #6\n\
        bl __divsi3\n\
        mov r9, r0\n\
        movs r7, #0\n\
        adds r0, r5, #0\n\
        adds r0, #0x34\n\
        mov sl, r0\n\
        ldrb r0, [r0]\n\
        cmp r7, r0\n\
        bge _080BF6AE\n\
        movs r1, #0x1f\n\
        mov ip, r1\n\
    _080BF60E:\n\
        ldr r0, [r5, #0x38]\n\
        lsls r6, r7, #1\n\
        adds r0, r6, r0\n\
        ldrh r3, [r0]\n\
        movs r2, #0x1f\n\
        ands r2, r3\n\
        ldr r0, [r5, #0x3c]\n\
        adds r0, r6, r0\n\
        ldrh r1, [r0]\n\
        movs r0, #0x1f\n\
        ands r0, r1\n\
        subs r0, r0, r2\n\
        mov r4, r9\n\
        muls r4, r0, r4\n\
        adds r0, r4, #0\n\
        cmp r0, #0\n\
        bge _080BF632\n\
        adds r0, #0x3f\n\
    _080BF632:\n\
        asrs r0, r0, #6\n\
        adds r0, r2, r0\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0x10\n\
        mov r8, r0\n\
        lsls r4, r3, #0x10\n\
        lsrs r2, r4, #0x15\n\
        mov r0, ip\n\
        ands r2, r0\n\
        lsls r3, r1, #0x10\n\
        lsrs r0, r3, #0x15\n\
        mov r1, ip\n\
        ands r0, r1\n\
        subs r0, r0, r2\n\
        mov r1, r9\n\
        muls r1, r0, r1\n\
        adds r0, r1, #0\n\
        cmp r0, #0\n\
        bge _080BF65A\n\
        adds r0, #0x3f\n\
    _080BF65A:\n\
        asrs r0, r0, #6\n\
        adds r0, r2, r0\n\
        lsls r0, r0, #0x10\n\
        lsrs r1, r0, #0x10\n\
        lsrs r2, r4, #0x1a\n\
        mov r4, ip\n\
        ands r2, r4\n\
        lsrs r0, r3, #0x1a\n\
        ands r0, r4\n\
        subs r0, r0, r2\n\
        mov r3, r9\n\
        muls r3, r0, r3\n\
        adds r0, r3, #0\n\
        cmp r0, #0\n\
        bge _080BF67A\n\
        adds r0, #0x3f\n\
    _080BF67A:\n\
        asrs r0, r0, #6\n\
        adds r0, r2, r0\n\
        lsls r0, r0, #0x10\n\
        ldr r2, [r5, #0x40]\n\
        adds r2, r6, r2\n\
        lsrs r0, r0, #6\n\
        lsls r1, r1, #5\n\
        adds r0, r0, r1\n\
        add r0, r8\n\
        strh r0, [r2]\n\
        adds r7, #1\n\
        mov r4, sl\n\
        ldrb r4, [r4]\n\
        cmp r7, r4\n\
        blt _080BF60E\n\
        b _080BF6AE\n\
    _080BF69A:\n\
        ldr r0, [r5, #0x3c]\n\
        ldr r1, [r5, #0x40]\n\
        adds r2, r5, #0\n\
        adds r2, #0x34\n\
        ldrb r2, [r2]\n\
        bl CpuSet\n\
        adds r0, r5, #0\n\
        bl Proc_Break\n\
    _080BF6AE:\n\
        bl EnablePaletteSync\n\
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

extern struct ProcCmd gUnknown_08A3E55C[];

//! FE8U = 0x080BF6C0
ProcPtr sub_80BF6C0(ProcPtr parent, struct InputStruct * input)
{
    if (input->unk_0c >= 1)
    {
        struct GmapPalFadeProc * proc;
        if (parent)
        {
            proc = Proc_StartBlocking(gUnknown_08A3E55C, parent);
        }
        else
        {
            proc = Proc_Start(gUnknown_08A3E55C, PROC_TREE_3);
        }

        proc->unk_2c = input->unk_0c;
        proc->unk_34 = input->unk_08;
        proc->unk_35 = input->unk_09;
        proc->unk_38 = input->unk_00;
        proc->unk_3c = input->unk_04;

        return proc;
    }

    CpuCopy16(input->unk_04, gPaletteBuffer + input->unk_09, input->unk_08 * 2);
    EnablePaletteSync();

    return NULL;
}

//! FE8U = 0x080BF730
s8 sub_80BF730(void)
{
    return (Proc_Find(gUnknown_08A3E55C)) ? 1 : 0;
}

//! FE8U = 0x080BF748
void sub_80BF748(void)
{
    struct GmapPalFadeProc * proc = Proc_Find(gUnknown_08A3E55C);
    if (proc)
    {
        CpuCopy16(proc->unk_3c, gPaletteBuffer + proc->unk_35, proc->unk_34 * 2);

        EnablePaletteSync();

        Proc_EndEach(gUnknown_08A3E55C);
    }

    return;
}

//! FE8U = 0x080BF788
ProcPtr sub_80BF788(ProcPtr parent, int unk)
{
    struct InputStruct input;

    input.unk_00 = gUnknown_08A95FE4;
    input.unk_04 = gUnknown_08A95F64;
    input.unk_09 = 144;
    input.unk_08 = 64;
    input.unk_0c = unk;

    return sub_80BF6C0(parent, &input);
}
