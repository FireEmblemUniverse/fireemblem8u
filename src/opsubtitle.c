#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"

struct OpSubtitleProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;

    /* 2E */ u8 pad[0x4c-0x2e];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
};

struct Unknown08206FE4 {
    void* a;
    void* b;
    int c;
};

extern struct Unknown08206FE4 gUnknown_08206FE4[];

extern u16 gUnknown_08AA213C[];
extern u16 gUnknown_08AA21A4[4*3];
extern struct ProcCmd gUnknown_08AA21BC[];

extern u16 gUnknown_08AA239C[]; // pal
extern u16 gUnknown_08B1756C[];

extern u16 gUnknown_0201CDD4[];
extern u16 gUnknown_02022908[]; // pal buffer
extern u16 gUnknown_02022A68[]; // pal buffer
extern u16 gUnknown_02022A88[]; // pal buffer

//! FE8U = 0x080C488C
void sub_80C488C(int bg) {
    int offset = GetBackgroundTileDataOffset(bg);

    CopyDataWithPossibleUncomp(gUnknown_08B12DB4, (void*)(offset + 0x6000000));

    CpuFastFill(0, (void*)(offset + 0x06005000), 0x20);

    BG_EnableSyncByMask(1 << bg);

    CpuFastFill(0x08A708A7, gUnknown_02022A68, 0x20);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C48F0
void sub_80C48F0(int bg) {
    u16* mapBuf;
    int tmp;
    int i;

    mapBuf = BG_GetMapBuffer(bg);
    tmp = 0xF000;

    for (i = 0; i < 0x280; mapBuf++, i++) {
        *mapBuf = tmp + i;
    }

    return;
}

//! FE8U = 0x080C4918
void sub_80C4918(ProcPtr proc) {

    if ((gKeyStatusPtr->newKeys) & START_BUTTON) {
        Sound_FadeOutBGM(1);
        Proc_Goto(proc, 6);
    }

    return;
}

//! FE8U = 0x080C4944
void sub_80C4944(struct OpSubtitleProc* proc) {

    SetupBackgrounds(gUnknown_08AA213C);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg0cnt.priority = 3;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 1);

    CopyDataWithPossibleUncomp(gUnknown_08B17B64, (void*)(GetBackgroundTileDataOffset(2) + 0x6000000));
    CopyToPaletteBuffer(gUnknown_08B18ED4, 0, 0x60);

    BG_Fill(gBG2TilemapBuffer,0);

    BG_EnableSyncByMask(4);

    Sound_PlaySong80024D4(3, 0);

    proc->unk_29 = 0;
    proc->unk_2a = 0x3c;

    return;
}

//! FE8U = 0x080C4A3C
void sub_80C4A3C(struct OpSubtitleProc* proc) {
    proc->unk_4c = 0;
    proc->unk_4e = 0;

    sub_800154C(gBG2TilemapBuffer, gUnknown_08B18D68, 0, 5);

    BG_EnableSyncByMask(4);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x080C4A88
void sub_80C4A88(struct OpSubtitleProc* proc) {
    int a;
    int b;
    int c;
    int d;

    if (proc->unk_4c < 0x1e) {
        a = Interpolate(5, 4, 0x32, proc->unk_4c, 0x1e);
        b = Interpolate(4, 0, 0x10, proc->unk_4c, 0x1e);
    } else {
        a = Interpolate(0, 0x32, 100, proc->unk_4c - 0x1e, 0x1e);
        b = Interpolate(0, 0x10, 0, proc->unk_4c - 0x1e, 0x1e);
    }

    if (a > 0x31) {
        a = 100 - a;
    }

    c = Interpolate(0, 0, 0xd6, proc->unk_4c, 0x3c);
    d = Interpolate(0, 0x10, 0x80, proc->unk_4c, 0x3c);

    sub_80ADDFC(2, proc->unk_4e, 0, 0, (s16)(a * 5 + 0x80), (s16)(a * 5 + 0x80));
    sub_80ADE90(2, 0x100, 0x100);
    sub_80ADEE0(2, (s16)c, (s16)d, 0x50, 0x48);

    proc->unk_4e -= 0x40;

    SetSpecialColorEffectsParameters(1, b, 0x10, 0);

    proc->unk_4c++;

    if (proc->unk_4c > 0x3b) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C4BA0
void sub_80C4BA0(void) {
    gLCDControlBuffer.dispcnt.bg2_on = 0;

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/GbVMW */

//! FE8U = 0x080C4BB4
void sub_80C4BB4(u16* src, u16* dst, int count, int coeff) {
    u16* srcIt;
    u16* dstIt;
    int i;

    if (count <= 0) {
        return;
    }

    dstIt = dst;

    // TODO: Nonmatch seems to be caused by these two assignments being out of order
    i = count;
    srcIt = src;

    while (i != 0) {
        int color = (*srcIt);

        s16 r = DivArm(0x1000, (color & 0x1f) * coeff);
        s16 g = DivArm(0x1000, ((color >> 5) & 0x1f) * coeff);
        s16 b = DivArm(0x1000, ((color >> 10) & 0x1f) * coeff);

        *dstIt++ = (u32)r + ((u32)g << 5) + ((u32)b << 10);

        srcIt++;
        i--;
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80C4BB4(u16* src, u16* dst, int count, int coeff) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        mov sl, r3\n\
        cmp r2, #0\n\
        ble _080C4C2E\n\
        mov r9, r1\n\
        adds r7, r0, #0\n\
        mov r8, r2\n\
    _080C4BCA:\n\
        ldrh r6, [r7]\n\
        adds r0, r6, #0\n\
        movs r1, #0x1f\n\
        ands r0, r1\n\
        mov r1, sl\n\
        muls r1, r0, r1\n\
        movs r0, #0x80\n\
        lsls r0, r0, #5\n\
        bl DivArm\n\
        adds r5, r0, #0\n\
        lsls r5, r5, #0x10\n\
        lsrs r5, r5, #0x10\n\
        asrs r0, r6, #5\n\
        movs r1, #0x1f\n\
        ands r0, r1\n\
        mov r1, sl\n\
        muls r1, r0, r1\n\
        movs r0, #0x80\n\
        lsls r0, r0, #5\n\
        bl DivArm\n\
        adds r4, r0, #0\n\
        lsls r4, r4, #0x10\n\
        lsrs r4, r4, #0x10\n\
        asrs r6, r6, #0xa\n\
        movs r0, #0x1f\n\
        ands r6, r0\n\
        mov r1, sl\n\
        muls r1, r6, r1\n\
        movs r0, #0x80\n\
        lsls r0, r0, #5\n\
        bl DivArm\n\
        lsls r0, r0, #0x10\n\
        lsls r4, r4, #5\n\
        adds r5, r5, r4\n\
        lsrs r0, r0, #6\n\
        adds r5, r5, r0\n\
        mov r1, r9\n\
        strh r5, [r1]\n\
        movs r0, #2\n\
        add r9, r0\n\
        adds r7, #2\n\
        movs r1, #1\n\
        negs r1, r1\n\
        add r8, r1\n\
        mov r0, r8\n\
        cmp r0, #0\n\
        bne _080C4BCA\n\
    _080C4C2E:\n\
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

#endif // NONMATCHING

//! FE8U = 0x080C4C3C
void sub_80C4C3C(struct OpSubtitleProc* proc) {

    proc->unk_2a--;

    if (proc->unk_2a < 1) {
        Proc_Break(proc);
    }

    sub_80C4918(proc);

    return;
}

//! FE8U = 0x080C4C60
void sub_80C4C60(struct OpSubtitleProc* proc) {

    CopyDataWithPossibleUncomp(gUnknown_08206FE4[proc->unk_29].a, (void*)0x06001000);

    CopyDataWithPossibleUncomp(gUnknown_08206FE4[proc->unk_29].b, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x3080);

    gLCDControlBuffer.dispcnt.bg0_on = 1;

    BG_EnableSyncByMask(1);

    proc->unk_2c = 0;

    return;
}

//! FE8U = 0x080C4CD0
void sub_80C4CD0(struct OpSubtitleProc* proc) {

    CopyDataWithPossibleUncomp(gUnknown_08206FE4[proc->unk_29].a, (void*)0x06001000);

    CopyDataWithPossibleUncomp(gUnknown_08206FE4[proc->unk_29].b, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x3080);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0xE080);

    gLCDControlBuffer.dispcnt.bg0_on = 1;

    BG_EnableSyncByMask(3);

    proc->unk_2c = 0;

    return;
}

//! FE8U = 0x080C4D54
void sub_80C4D54(int index) {

    CopyDataWithPossibleUncomp(gUnknown_08206FE4[index].a, (void*)0x06005000);

    CopyDataWithPossibleUncomp(gUnknown_08206FE4[index].b, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x3280);

    BG_EnableSyncByMask(1);

    return;
}

//! FE8U = 0x080C4DA0
void sub_80C4DA0(struct OpSubtitleProc* proc) {

    proc->unk_2c++;

    if (proc->unk_2c < 0x50) {
        int coeff = sub_800B7E0(proc->unk_2c, 0x50, 0);

        sub_80C4BB4(
            gUnknown_08AA239C,
            gUnknown_02022908,
            0x10,
            coeff
        );
    } else {
        CopyToPaletteBuffer(gUnknown_08AA239C, 0x60, 0x20);

        Proc_Break(proc);

        proc->unk_2a = gUnknown_08206FE4[proc->unk_29].c;
        proc->unk_2c = 0;
    }

    EnablePaletteSync();

    sub_80C4918(proc);

    return;
}

//! FE8U = 0x080C4E18
void sub_80C4E18(struct OpSubtitleProc* proc) {

    proc->unk_2c++;

    if (proc->unk_2c < 0x50) {
        int coeff = 0x1000 - sub_800B7E0(proc->unk_2c, 0x50, 0);

        sub_80C4BB4(
            gUnknown_08AA239C,
            gUnknown_02022908,
            0x10,
            coeff
        );
    } else {
        CpuFastFill(0, gUnknown_02022908, 0x20);

        proc->unk_2c = 0;

        proc->unk_29++;

        if (proc->unk_29 < 2) {
            proc->unk_2a = 0x50;
            Proc_Break(proc);
        } else {
            gLCDControlBuffer.dispcnt.bg0_on = 0;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 0;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;

            Proc_Goto(proc, 1);
        }
    }

    EnablePaletteSync();

    sub_80C4918(proc);

    return;
}

//! FE8U = 0x080C4EC4
void sub_80C4EC4(struct OpSubtitleProc* proc) {

    proc->unk_2c++;

    if (proc->unk_2c < 0x50) {
        int coeff = 0x1000 - sub_800B7E0(proc->unk_2c, 0x50, 0);

        sub_80C4BB4(
            gUnknown_08AA239C,
            gUnknown_02022908,
            0x10,
            coeff
        );
    } else {
        CpuFastFill(0, gUnknown_02022908, 0x20);

        proc->unk_2c = 0;

        proc->unk_29++;

        proc->unk_2a = 0x5a;

        gLCDControlBuffer.dispcnt.bg0_on = 0;
        gLCDControlBuffer.dispcnt.bg1_on = 0;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;

        Proc_Break(proc);
    }

    EnablePaletteSync();

    sub_80C4918(proc);

    return;
}

//! FE8U = 0x080C4F60
void sub_80C4F60(struct OpSubtitleProc* proc) {

    proc->unk_2c++;

    if (proc->unk_2c < 0x50) {
        int coeff = sub_800B7E0(proc->unk_2c, 0x50, 0);
        s16 var = DivArm(0x1000, coeff << 4);

        SetSpecialColorEffectsParameters(1, 0x10 - var, var, 0);
    } else {
        SetSpecialColorEffectsParameters(1, 0, 0x10, 0);

        if (proc->unk_29 < 5) {
            Proc_Break(proc);
            proc->unk_2a = gUnknown_08206FE4[proc->unk_29].c;
            proc->unk_2c = 0;
        } else {
            proc->unk_2a = gUnknown_08206FE4[proc->unk_29].c;
            proc->unk_29++;

            Proc_Goto(proc, 4);
        }
    }

    EnablePaletteSync();

    sub_80C4918(proc);

    return;
}

//! FE8U = 0x080C501C
void sub_80C501C(struct OpSubtitleProc* proc) {

    proc->unk_2c++;

    if (proc->unk_2c < 0x50) {
        int coeff = sub_800B7E0(proc->unk_2c, 0x50, 0);
        s16 var = DivArm(0x1000, (0x1000 - coeff) << 4);

        SetSpecialColorEffectsParameters(1, 0x10 - var, var, 0);
    } else {
        SetSpecialColorEffectsParameters(1, 0x10, 0, 0);

        proc->unk_2c = 0;
        proc->unk_29++;
        proc->unk_2a = 0x50;

        Proc_Break(proc);

        sub_80C4918(proc);
    }

    EnablePaletteSync();

    sub_80C4918(proc);

    return;
}

//! FE8U = 0x080C50A0
void sub_80C50A0(struct OpSubtitleProc* proc) {
    sub_80C488C(1);

    CpuFastFill(0, gUnknown_02022A88, 0x20);

    sub_80C48F0(1);

    BG_EnableSyncByMask(2);

    CpuFastFill(0, (void*)0x06005000, 0x1000);

    BG_Fill(gBG0TilemapBuffer, 0x280);

    BG_EnableSyncByMask(1);

    proc->unk_2a = 0x16;
    proc->unk_2c = 0;

    return;
}

//! FE8U = 0x080C5104
void sub_80C5104(struct OpSubtitleProc* proc) {

    if (proc->unk_2c == 0) {
        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;
    }

    proc->unk_2c++;

    if (proc->unk_2c < 0x2e) {
        int coeff = sub_800B7E0(proc->unk_2c, 0x2e, 0);

        sub_80C4BB4(
            gUnknown_08B1756C,
            gUnknown_02022A88,
            0x10,
            coeff
        );
    } else {
        CopyToPaletteBuffer(gUnknown_08B1756C, 0x1e0, 0x20);

        Proc_Break(proc);

        proc->unk_2a = gUnknown_08206FE4[proc->unk_29].c;
        proc->unk_2c = 0;
    }

    EnablePaletteSync();

    sub_80C4918(proc);

    return;
}

//! FE8U = 0x080C51A8
void sub_80C51A8(void) {
    sub_80C4D54(2);

    CopyToPaletteBuffer(gUnknown_08AA239C, 0x60, 0x20);
    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C51C8
void sub_80C51C8(void) {
    int i;
    u16* ptr;

    memset(&gLCDControlBuffer.bg0cnt, 0, 2);
    memset(&gLCDControlBuffer.bg1cnt, 0, 2);
    memset(&gLCDControlBuffer.bg2cnt, 0, 2);
    memset(&gLCDControlBuffer.bg3cnt, 0, 2);

    ptr = gUnknown_08AA21A4;

    for (i = 0; i < 4; i++) {
        SetBackgroundTileDataOffset(i, *ptr++);
        SetBackgroundMapDataOffset(i, *ptr++);
        SetBackgroundScreenSize(i, *ptr++);
        BG_SetPosition(i & 0xffff, 0, 0);
    }

    return;
}

//! FE8U = 0x080C5218
void sub_80C5218(struct OpSubtitleProc* proc) {
    sub_80C51C8();

    gLCDControlBuffer.dispcnt.mode = 0;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 0;

    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    sub_8001F48(0);
    sub_8001F64(0);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0x0000FFFD, 0x0000FFFD);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    sub_80C488C(3);
    sub_80C48F0(3);

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(0xe);

    sub_80C4D54(2);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    proc->unk_29 = 2;
    proc->unk_2a = 0x78;

    return;
}

//! FE8U = 0x080C5328
void sub_80C5328(void) {
    CpuFastFill(0, (void*)0x6000000, 0x20);

    BG_EnableSyncByMask(2);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x080C5370
void sub_80C5370(struct OpSubtitleProc* proc) {
    proc->unk_2c = 0;
    CpuFastCopy(gPaletteBuffer, gUnknown_0201CDD4, 0x200);

    return;
}

//! FE8U = 0x080C538C
void sub_80C538C(struct OpSubtitleProc* proc) {

    proc->unk_2c++;

    if (proc->unk_2c < 0x3c) {
        int coeff = 0x1000 - sub_800B7E0(proc->unk_2c, 0x3c, 0);

        sub_80C4BB4(
            gUnknown_0201CDD4,
            gPaletteBuffer,
            0x200,
            coeff
        );
    } else {
        CpuFastFill(0, gPaletteBuffer, 0x200);

        proc->unk_2c = 0;
        proc->unk_2a = 0x3c;

        Proc_Break(proc);
    }

    EnablePaletteSync();

    sub_80C4918(proc);

    return;
}

//! FE8U = 0x080C5400
void sub_80C5400(void) {
    Sound_FadeOutBGM(4);

    return;
}

//! FE8U = 0x080C540C
void sub_80C540C(void) {
    BG_SetPosition(1, 0, 0);

    return;
}

//! FE8U = 0x080C541C
void sub_80C541C(ProcPtr proc) {
    Proc_StartBlocking(gUnknown_08AA21BC, proc);

    return;
}
