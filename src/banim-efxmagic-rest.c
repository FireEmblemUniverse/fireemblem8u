#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

CONST_DATA SpellAnimFunc gEkrSpellAnimLut[] = {
    StartSpellAnimDummy,
    StartSpellAnimHandAxe,
    StartSpellAnimArrow,
    StartSpellAnimJavelin,
    sub_805C44C,
    sub_805C4A8,
    sub_805C504,
    sub_805C560,
    sub_805C5BC,
    sub_805C618,
    sub_805C674,
    sub_805C6D0,
    sub_805C72C,
    sub_805C788,
    StartSpellAnimSong,
    StartSpellAnimDance,
    sub_805CD0C,
    nullsub_42,
    sub_805CEC8,
    StartSpellAnimFireBreath,
    StartSpellAnimIceBreath,
    StartSpellAnimDarkBreath,
    StartSpellAnimFire,
    StartSpellAnimElfire,
    nullsub_41,
    StartSpellAnimThunder,
    sub_805E754,
    StartSpellAnimFimbulvetr,
    sub_805EB98,
    sub_805EED8,
    StartSpellAnimNosferatu,
    sub_805F8B4,
    StartSpellAnimPurge,
    sub_8060284,
    StartSpellAnimDivine,
    nullsub_40,
    sub_806028C,
    StartSpellAnimFenrir,
    StartSpellAnimHeal,
    StartSpellAnimMend,
    StartSpellAnimRecover,
    sub_8061420,
    sub_8061C18,
    sub_8061C48,
    sub_80620EC,
    StartSpellAnimSilence,
    StartSpellAnimSleep,
    StartSpellAnimHammerne,
    StartSpellAnimBerserk,
    sub_8063214,
    (void *)NULL,
    StartSpellAnimShine,
    StartSpellAnimLuna,
    sub_8064308,
    nullsub_51,
    StartSpellAnimAura,
    sub_8065490,
    nullsub_53,
    sub_8065634,
    sub_8065670,
    sub_80656AC,
    sub_80656E8,
    StartSpellAnimStone,
    StartSpellAnimIvaldi,
    sub_8066514,
    sub_8068B80,
    StartSpellAnimCrimsonEye,
    StartSpellAnimEvilEye,
    sub_806AEF4,
    sub_806B4F8,
    StartSpellAnimNaglfar,
    sub_80687E4,
    (void *)NULL
};

u32 FramData_Unk5D4F84[] = {
    0x1, 0x0, 0x0
};

u32 FramData_Unk5D4F90[] = {
    0x85D4F85, /* (uintptr_t)FramData_Unk5D4F84 + 1 */
    0x80000000
};

void StartSpellAnimation(struct Anim *anim)
{
    s16 index = gEkrSpellAnimIndex[GetAISSubjectId(anim)];

#if BUGFIX
    if (gEkrSpellAnimLut[index](anim) == NULL)
        return;
#endif

    gEkrSpellAnimLut[index](anim);
}

void sub_805B3FC(void)
{
    return;
}

CONST_DATA struct ProcCmd ProcScr_efxRestRST[] = {
    PROC_NAME("efxRestRST"),
    PROC_SET_END_CB(sub_805B444),
    PROC_REPEAT(efxRestRSTMain),
    PROC_END
};

ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int unk50)
{
    struct ProcEfxMagic *proc;

    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxRestRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0,
    proc->unk2E = 0;
    proc->unk44 = unk44;
    proc->unk48 = unk48;
    proc->unk4C = frame;
    proc->unk50 = unk50;

    return proc;
}

void sub_805B444(struct ProcEfxMagic *proc)
{
    gUnknown_0201774C--;
}

void efxRestRSTMain(struct ProcEfxMagic *proc)
{
    u8 val1;
    int val2;
    u32 i;
    u16 *buf;

    if (gUnknown_0201FDB8 == 0)
        buf = gUnknown_0201FF04;
    else
        buf = gUnknown_0201FDC4;

    val1 = proc->unk2E;
    proc->unk2E += proc->unk50;

    for (i = 0; i < 0x78; buf++, i++) {
        val1 += proc->unk48;
        *buf = (((gUnknown_0875879C[val1] * proc->unk4C) << 8) >> 0x10) + gLCDControlBuffer.bgoffset[1].x;
    }

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxTwobaiRST[] = {
    PROC_NAME("efxTwobaiRST"),
    PROC_REPEAT(EfxTwobaiRSTMain),
    PROC_END
};

void NewEfxTwobaiRST(struct Anim *anim, int unk44)
{
    u32 i, j;
    u16 *buf;
    struct ProcEfxMagic *proc;
    proc = Proc_Start(ProcScr_efxTwobaiRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0;
    proc->unk44 = unk44;

    for (i = 0; i < 0x78; i++)
        gUnknown_0201FDC4[i] = -(i / 2);

    buf = gUnknown_0201FF04;
    for (j = 0; j < 0x78; buf++, j++)
        *buf = -(j / 2);
}

void EfxTwobaiRSTMain(struct ProcEfxMagic *proc)
{
    if (++proc->timer == proc->unk44)
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_DummvRST[] = {
    PROC_NAME("efxDummyRST"),
    PROC_SET_END_CB(sub_805B584),
    PROC_REPEAT(DummvRSTMain),
    PROC_END
};

void NewDummvRST(struct Anim *anim, int unk44)
{
    struct ProcEfxMagic *proc;

    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_DummvRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0;
    proc->unk44 = unk44;
}

void sub_805B584(void)
{
    gUnknown_0201774C--;
}

void DummvRSTMain(struct ProcEfxMagic *proc)
{
    u32 i;
    u16 *buf;

    if (gUnknown_0201FDB8 == 0)
        buf = gUnknown_0201FF04;
    else
        buf = gUnknown_0201FDC4;

    for (i = 0; i < 0x78; i++)
        buf[i] = gLCDControlBuffer.bgoffset[1].x;

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}

CONST_DATA struct ProcCmd ProcScr_EfxRestWIN[] = {
    PROC_NAME("efxRestWIN"),
    PROC_REPEAT(EfxRestWINMain),
    PROC_END
};

void NewEfxRestWIN(struct Anim *anim, int unk44, void *unk54, void *unk58)
{
    struct ProcEfxMagic *proc;

    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_EfxRestWIN, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0;
    proc->unk44 = unk44;
    proc->unk54 = unk54;
    proc->unk58 = unk58;

    if (GetAISSubjectId(GetCoreAIStruct(anim)) == EKR_BATTLE_LEFT)
        proc->unk32 = 0xFFB8;
    else
        proc->unk32 = 0xFFF8;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(anim) == EKR_BATTLE_LEFT)
            proc->unk32 += 0x18;
        else
            proc->unk32 -= 0x18;
    }
}

/* https://decomp.me/scratch/jwO0K */
#if NONMATCHING
void EfxRestWINMain(struct ProcEfxMagic *proc)
{
    u32 i;
    int val1;
    u16 val2;
    u16 *buf;
    u16 *buf2;

    if (gUnknown_0201FB2C == NULL)
        buf = gUnknown_0201FC78;
    else
        buf = gUnknown_0201FB38;

    buf2 = proc->unk54;
    val2 = buf2[proc->unk2E];
    buf2 = proc->unk58[val2];

    if (val2 != 0xFFFF) {
        proc->unk2E++;
        for (i = 0; i < 0x78; buf2 = buf2 + 2, buf++, i++) {
            s16 _tmp1 = *buf2;
            register int tmp2 asm("r2");
            if (_tmp1 == 0x7FFF)
                tmp2 = 0;
            else {
                s32 tmp3 = buf2[0] + proc->unk32;
                s32 tmp4 = proc->unk32 + buf2[1];
                tmp3 = (((tmp3) << 0x10) >> 0x8);
                tmp4 = (tmp4 << 0x10) >> 0x10;
                tmp2 = tmp3 | tmp4;
            }
            *buf = tmp2;
        }
    } else {
        for (i = 0; i < 0x78; i++)
            buf[i] = 0;
    }

    proc->timer++;
    if (proc->timer == proc->unk44) {
        gUnknown_0201774C--;
        Proc_Break(proc);
    }
}

#else
__attribute__((naked))
void EfxRestWINMain(struct ProcEfxMagic *proc)
{
    asm(".syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        adds r4, r0, #0\n\
        ldr r0, _0805B6B8  @ gUnknown_0201FB2C\n\
        ldr r0, [r0]\n\
        ldr r5, _0805B6BC  @ gUnknown_0201FB38\n\
        cmp r0, #0\n\
        bne _0805B680\n\
        ldr r5, _0805B6C0  @ gUnknown_0201FC78\n\
    _0805B680:\n\
        ldr r1, [r4, #0x54]\n\
        movs r2, #0x2e\n\
        ldrsh r0, [r4, r2]\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r1\n\
        ldrh r2, [r0]\n\
        ldr r1, [r4, #0x58]\n\
        lsls r0, r2, #2\n\
        adds r0, r0, r1\n\
        ldr r3, [r0]\n\
        ldr r0, _0805B6C4  @ 0x0000FFFF\n\
        cmp r2, r0\n\
        beq _0805B6EC\n\
        ldrh r0, [r4, #0x2e]\n\
        adds r0, #1\n\
        strh r0, [r4, #0x2e]\n\
        movs r2, #0\n\
        ldr r6, [r4, #0x44]\n\
        ldr r7, _0805B6C8  @ 0x00007FFF\n\
        mov ip, r7\n\
    _0805B6A8:\n\
        ldrh r1, [r3]\n\
        movs r7, #0\n\
        ldrsh r0, [r3, r7]\n\
        cmp r0, ip\n\
        bne _0805B6CC\n\
        movs r0, #0\n\
        b _0805B6DE\n\
        .align 2, 0\n\
    _0805B6B8: .4byte gUnknown_0201FB2C\n\
    _0805B6BC: .4byte gUnknown_0201FB38\n\
    _0805B6C0: .4byte gUnknown_0201FC78\n\
    _0805B6C4: .4byte 0x0000FFFF\n\
    _0805B6C8: .4byte 0x00007FFF\n\
    _0805B6CC:\n\
        ldrh r0, [r4, #0x32]\n\
        adds r1, r1, r0\n\
        ldrh r7, [r3, #2]\n\
        adds r0, r0, r7\n\
        lsls r1, r1, #0x10\n\
        asrs r1, r1, #8\n\
        lsls r0, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        orrs r0, r1\n\
    _0805B6DE:\n\
        strh r0, [r5]\n\
        adds r3, #4\n\
        adds r5, #2\n\
        adds r2, #1\n\
        cmp r2, #0x77\n\
        bls _0805B6A8\n\
        b _0805B6FC\n\
    _0805B6EC:\n\
        movs r2, #0\n\
        ldr r6, [r4, #0x44]\n\
        movs r0, #0\n\
    _0805B6F2:\n\
        strh r0, [r5]\n\
        adds r5, #2\n\
        adds r2, #1\n\
        cmp r2, #0x77\n\
        bls _0805B6F2\n\
    _0805B6FC:\n\
        ldrh r0, [r4, #0x2c]\n\
        adds r0, #1\n\
        strh r0, [r4, #0x2c]\n\
        movs r1, #0x2c\n\
        ldrsh r0, [r4, r1]\n\
        cmp r0, r6\n\
        bne _0805B718\n\
        ldr r1, _0805B720  @ gUnknown_0201774C\n\
        ldr r0, [r1]\n\
        subs r0, #1\n\
        str r0, [r1]\n\
        adds r0, r4, #0\n\
        bl Proc_Break\n\
    _0805B718:\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0805B720: .4byte gUnknown_0201774C\n\
    .syntax divided");
}
#endif

void EfxMagicHBlank_805B724(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
        REG_BG1HOFS = *gUnknown_0201FDC0++;
}

void EfxMagicHBlank_805B750(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
        REG_BG1VOFS = *gUnknown_0201FDC0++;
}

void EfxMagicHBlank_805B77C(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gUnknown_0201FB34++;
        REG_BG1HOFS = *gUnknown_0201FDC0++;
    }
}

void EfxMagicHBlank_805B7BC(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gUnknown_0201FB34++;
        REG_BG1VOFS = *gUnknown_0201FDC0++;
    }
}

void EfxMagicHBlank_805B7FC(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gUnknown_0201FB34++;
    }
}

CONST_DATA struct ProcCmd ProcScr_EfxRestWINH[] = {
    PROC_NAME("efxRestWINH"),
    PROC_REPEAT(sub_805B94C),
    PROC_REPEAT(sub_805B958),
    PROC_END
};

/**
 * This function has been matched in decomp, but unmatched here!!
 * 
 * https://decomp.me/scratch/BaOfW
 */

#if NONMATCHING
void NewEfxRestWINH(struct Anim *anim, int a, u16 b, u32 c)
{
    u32 i;
    u16 *buf, **buf1;
    struct ProcEfxMagic *proc;

    buf1 = &gUnknown_0201FDC0;

    gUnknown_0201774C++;

    if (c == 2) {
        buf = gUnknown_0201FB38;
        for (i = 0; i < 0xA0; buf++, i++)
            *buf = b;

        buf = gUnknown_0201FC78;
        for (i = 0; i < 0xA0; buf++, i++)
            *buf = b;

        gUnknown_0201FB2C = 0;
        gUnknown_0201FB30 = gUnknown_0201FB38;
        gUnknown_0201FB34 = gUnknown_0201FB38;
    }

    buf = gUnknown_0201FDC4;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    buf = gUnknown_0201FF04;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    gUnknown_0201FDB8 = 0;
    gUnknown_0201FDBC = gUnknown_0201FDC4;
    *buf1 = gUnknown_0201FDC4;

    switch (c) {
    case 0:
        SetPrimaryHBlankHandler(EfxMagicHBlank_805B724);
        break;

    case 1:
        SetPrimaryHBlankHandler(EfxMagicHBlank_805B750);
        break;

    case 2:
        SetPrimaryHBlankHandler(EfxMagicHBlank_805B750);
        break;
    }

    proc = Proc_Start(ProcScr_EfxRestWINH, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = a;
    proc->unk48 = c;
}
#else
__attribute__((naked))
void NewEfxRestWINH(struct Anim *anim, int a, u16 b, u32 c)
{
    asm(".syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #8\n\
        str r0, [sp]\n\
        str r1, [sp, #4]\n\
        adds r4, r3, #0\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        ldr r1, _0805B8C4  @ gUnknown_0201774C\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r6, _0805B8C8  @ gUnknown_0201FDC4\n\
        ldr r7, _0805B8CC  @ gUnknown_0201FF04\n\
        ldr r0, _0805B8D0  @ gUnknown_0201FDBC\n\
        mov sl, r0\n\
        cmp r4, #2\n\
        bne _0805B88A\n\
        ldr r1, _0805B8D4  @ gUnknown_0201FB38\n\
        movs r0, #0\n\
        adds r5, r1, #0\n\
        ldr r3, _0805B8D8  @ gUnknown_0201FB2C\n\
        mov ip, r3\n\
        ldr r3, _0805B8DC  @ gUnknown_0201FB30\n\
        mov r8, r3\n\
        ldr r3, _0805B8E0  @ gUnknown_0201FB34\n\
        mov r9, r3\n\
    _0805B864:\n\
        strh r2, [r1]\n\
        adds r1, #2\n\
        adds r0, #1\n\
        cmp r0, #0x9f\n\
        bls _0805B864\n\
        ldr r1, _0805B8E4  @ gUnknown_0201FC78\n\
        movs r0, #0\n\
    _0805B872:\n\
        strh r2, [r1]\n\
        adds r1, #2\n\
        adds r0, #1\n\
        cmp r0, #0x9f\n\
        bls _0805B872\n\
        movs r0, #0\n\
        mov r1, ip\n\
        str r0, [r1]\n\
        mov r3, r8\n\
        str r5, [r3]\n\
        mov r0, r9\n\
        str r5, [r0]\n\
    _0805B88A:\n\
        adds r1, r6, #0\n\
        movs r0, #0\n\
    _0805B88E:\n\
        strh r2, [r1]\n\
        adds r1, #2\n\
        adds r0, #1\n\
        cmp r0, #0x9f\n\
        bls _0805B88E\n\
        adds r1, r7, #0\n\
        movs r0, #0\n\
    _0805B89C:\n\
        strh r2, [r1]\n\
        adds r1, #2\n\
        adds r0, #1\n\
        cmp r0, #0x9f\n\
        bls _0805B89C\n\
        movs r0, #0\n\
        ldr r1, _0805B8E8  @ gUnknown_0201FDB8\n\
        str r0, [r1]\n\
        mov r3, sl\n\
        str r6, [r3]\n\
        ldr r0, _0805B8EC  @ gUnknown_0201FDC0\n\
        str r6, [r0]\n\
        cmp r4, #1\n\
        beq _0805B8FC\n\
        cmp r4, #1\n\
        bcc _0805B8F0\n\
        cmp r4, #2\n\
        beq _0805B908\n\
        b _0805B90E\n\
        .align 2, 0\n\
    _0805B8C4: .4byte gUnknown_0201774C\n\
    _0805B8C8: .4byte gUnknown_0201FDC4\n\
    _0805B8CC: .4byte gUnknown_0201FF04\n\
    _0805B8D0: .4byte gUnknown_0201FDBC\n\
    _0805B8D4: .4byte gUnknown_0201FB38\n\
    _0805B8D8: .4byte gUnknown_0201FB2C\n\
    _0805B8DC: .4byte gUnknown_0201FB30\n\
    _0805B8E0: .4byte gUnknown_0201FB34\n\
    _0805B8E4: .4byte gUnknown_0201FC78\n\
    _0805B8E8: .4byte gUnknown_0201FDB8\n\
    _0805B8EC: .4byte gUnknown_0201FDC0\n\
    _0805B8F0:\n\
        ldr r0, _0805B8F8  @ EfxMagicHBlank_805B724\n\
        bl SetPrimaryHBlankHandler\n\
        b _0805B90E\n\
        .align 2, 0\n\
    _0805B8F8: .4byte EfxMagicHBlank_805B724\n\
    _0805B8FC:\n\
        ldr r0, _0805B904  @ EfxMagicHBlank_805B750\n\
        bl SetPrimaryHBlankHandler\n\
        b _0805B90E\n\
        .align 2, 0\n\
    _0805B904: .4byte EfxMagicHBlank_805B750\n\
    _0805B908:\n\
        ldr r0, _0805B934  @ EfxMagicHBlank_805B750\n\
        bl SetPrimaryHBlankHandler\n\
    _0805B90E:\n\
        ldr r0, _0805B938  @ ProcScr_EfxRestWINH\n\
        movs r1, #0\n\
        bl Proc_Start\n\
        ldr r1, [sp]\n\
        str r1, [r0, #0x5c]\n\
        movs r1, #0\n\
        strh r1, [r0, #0x2c]\n\
        ldr r3, [sp, #4]\n\
        str r3, [r0, #0x44]\n\
        str r4, [r0, #0x48]\n\
        add sp, #8\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0805B934: .4byte EfxMagicHBlank_805B750\n\
    _0805B938: .4byte ProcScr_EfxRestWINH\n\
    .syntax divided");
}
#endif

void NewEfxRestWINH_(struct Anim *anim, int a, int b)
{
    NewEfxRestWINH(anim, a, 0, b);
}

void sub_805B94C(ProcPtr proc)
{
    Proc_Break(proc);
}

void sub_805B958(struct ProcEfxMagic *proc)
{
    if (gBmSt.mainLoopEndedFlag != false) {
        if (proc->unk48 == 0x2) {
            if (gUnknown_0201FB2C == 1) {
                gUnknown_0201FB2C = 0;
                gUnknown_0201FB30 = gUnknown_0201FB38;
            } else {
                gUnknown_0201FB2C = 1;
                gUnknown_0201FB30 = gUnknown_0201FC78;
            }
        }

        if (gUnknown_0201FDB8 == 1) {
            gUnknown_0201FDB8 = 0;
            gUnknown_0201FDBC = gUnknown_0201FDC4;
        } else {
            gUnknown_0201FDB8 = 1;
            gUnknown_0201FDBC = gUnknown_0201FF04;
        }
    }

    gUnknown_0201FB34 = gUnknown_0201FB30;
    gUnknown_0201FDC0 = gUnknown_0201FDBC;

    if (++proc->timer == proc->unk44) {
        gUnknown_0201774C--;
        SetPrimaryHBlankHandler(NULL);
        Proc_Break(proc);
    }
}

void NewEfxALPHA(struct Anim *anim, int a, int b, int c, int d, int e)
{
    struct ProcEfxMagic *proc;
    gUnknown_0201774C++;
    proc = Proc_Start(ProcScr_efxALPHA, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = a;
    proc->unk30 = a + b;
    proc->unk44 = c;
    proc->unk48 = d;
    proc->unk4C = e;
}
