#include "global.h"

#include "face.h"
#include "hardware.h"

struct WMFaceWrapper {
    /* 00 */ s16 unk_00; // x?
    /* 02 */ s16 unk_02; // y?
    /* 04 */ struct FaceProc* faceProc;
    /* 08 */ u16 faceId;
    /* 0A */ s8 unk_0a; // possibly "fade direction" (+1 for fade in, -1 for fade out?)
};

struct WMFaceHolderProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct WMFaceWrapper faceWrapper[2];
};

struct WMFaceCtrlProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a; // some index into an array, functionality appears to be unused
    /* 2C */ struct WMFaceHolderProc* faceHolderProc;
    /* 30 */ s8 increment;
    /* 31 */ u8 blendAmt;
    /* 32 */ u8 unk_32; // unreferenced
    /* 33 */ u8 unk_33; // initialized to 0 and unused
    /* 34 */ u8 unk_34; // initialized to 0 and unused
};

//! FE8U = 0x080B820C
void WorldMapFaceHolder_Init(struct WMFaceHolderProc* proc) {
    int i;

    for (i = 0; i < 2; i++) {
        proc->faceWrapper[i].faceProc = NULL;
        proc->faceWrapper[i].unk_0a = 0;
        proc->faceWrapper[i].unk_02 = 0;
        proc->faceWrapper[i].unk_00 = 0;
        proc->faceWrapper[i].faceId |= 0xFFFF;
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_WorldMapFaceHolder[] = {
    PROC_MARK(8),
    PROC_CALL(WorldMapFaceHolder_Init),
    PROC_BLOCK,

    PROC_END,
};

//! FE8U = 0x080B823C
void WMFaceCtrl_Init(struct WMFaceCtrlProc* proc) {
    proc->unk_2a = 0;
    proc->faceHolderProc = Proc_Start(gProcScr_WorldMapFaceHolder, proc);
    proc->increment = 0;
    proc->blendAmt = 0;
    proc->unk_33 = 0;
    proc->unk_34 = 0;

    return;
}

//! FE8U = 0x080B826C
int sub_80B826C(int xIn, int* xOut) {
    int a;
    int b;
    register int r3 asm("r3");

    a = (xIn - 0x30);

    if (a < 0) {
        b = xIn - 0x29;
    } else {
        b = a;
    }

    r3 = b >> 3;
    b = r3 << 3;

    *xOut = (b) - a;

    return r3;
}

//! FE8U = 0x080B828C
int GetWMFaceBg(void) {
    return (gGMData.state & GMAP_STATE_BIT3) ? BG_2 : BG_1;
}

//! FE8U = 0x080B82A8
int GetWMFaceVramOffset(void) {
    return (gGMData.state & GMAP_STATE_BIT3) ? 0x5000 : 0x1800;
}

//! FE8U = 0x080B82C8
void sub_80B82C8(int bg, u32 offset, int xIn, int yIn, u8 isFlippedMaybe) {
    int bgX;
    u16* r0;
    int x;
    int y;
    int y_;

    x = sub_80B826C(xIn, &bgX);
    y = yIn / 8;
    y_ = (y * 8) - yIn;

    r0 = BG_GetMapBuffer(bg) + y * 0x20 + x;

    sub_8006738(
        r0,
        (offset >> 5) + 0x4000,
        isFlippedMaybe
    );

    BG_EnableSyncByMask(1 << (bg));

    BG_SetPosition(bg, bgX, y_);

    return;
}

//! FE8U = 0x080B8350
void HandleWMFaceFade(struct WMFaceCtrlProc* proc) {
    int i;

    SetSpecialColorEffectsParameters(1, proc->blendAmt >> 1, 0x10 - (proc->blendAmt >> 1), 0);

    proc->blendAmt += proc->increment;

    if (proc->blendAmt == 0) {
        for (i = 0; i < 2; i++) {
            if ((proc->faceHolderProc->faceWrapper[i].faceProc != NULL) && ((proc->faceHolderProc->faceWrapper[i].unk_0a == -1))) {
                EndFaceById(i);

                proc->faceHolderProc->faceWrapper[i].unk_0a = 0;
                proc->faceHolderProc->faceWrapper[i].faceProc = NULL;
            }
        }

        proc->increment = 0;
    }

    if (proc->blendAmt == 0x20) {
        for (i = 0; i < 2; i++) {
            struct FaceProc* faceProc = proc->faceHolderProc->faceWrapper[i].faceProc;

            if (faceProc != NULL && (proc->faceHolderProc->faceWrapper[i].unk_0a == 1)) {
                SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) & ~(FACE_DISP_BLEND));
                proc->faceHolderProc->faceWrapper[i].unk_0a = 0;
            }
        }

        proc->increment = 0;
    }

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/A4kYr */

//! FE8U = 0x080B843C
void sub_80B843C(struct WMFaceCtrlProc* proc) {
    int i;
    int iVar10;
    int y;
    u16* yptr;

    struct WMFaceHolderProc* internalProc = proc->faceHolderProc;

    int bgMaybe = GetWMFaceBg();

    for (i = 0, yptr = &internalProc->faceWrapper[0].unk_02; i < 2; i++, yptr = &internalProc->faceWrapper[i].unk_02) {
        iVar10 = 0;

        if (internalProc->faceWrapper[i].faceProc != 0) {
            struct FaceProc* faceProc = internalProc->faceWrapper[i].faceProc;
            int x_ = internalProc->faceWrapper[i].unk_00;

            if (((*yptr & 0x800) != 0) && ((*yptr & 0xff) < 0x10)) {
                if ((*yptr & 0x100) != 0) {
                    faceProc->xPos = x_ + (((0x10 - (*yptr & 0xff)) * 0x20 * (0x10 - (*yptr & 0xff))) / 256);
                    iVar10 = 1;
                }

                if ((*yptr & 0x200) != 0) {
                    faceProc->xPos = x_ - (((0x10 - (*yptr & 0xff)) * 0x20 * (0x10 - (*yptr & 0xff))) / 256);
                    iVar10 = 1;
                }

                (*yptr)++;

                if ((*yptr & 0xff) > 0xf) {
                    iVar10 = 2;

                    SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) &~ 0x4000);
                    *yptr &= ~0x800;
                }
            }

            if (((*yptr & 0x1000) != 0) && ((*yptr & 0xff) < 0x10)) {
                if ((*yptr & 0xff) == 0) {
                    SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) | 0x4000);
                }

                if ((*yptr & 0x100) != 0) {
                    int t2 = x_ - 0x20;
                    faceProc->xPos = t2 + (((0x10 - ((*yptr) & 0xff)) * 0x20 * (0x10 - ((*yptr) & 0xff))) / 256);
                    iVar10 = 1;
                }

                if ((*yptr & 0x200) != 0) {
                    int t2 = x_ + 0x20;
                    faceProc->xPos = t2 - (((0x10 - ((*yptr) & 0xff)) * 0x20 * (0x10 - ((*yptr) & 0xff))) / 256);
                    iVar10 = 1;
                }

                (*yptr)++;

                if ((*yptr & 0xff) > 0xf) {
                    iVar10 = 2;
                }
            }

            switch (iVar10) {
                case 1:
                    BG_Fill(BG_GetMapBuffer(bgMaybe), 0);
                    sub_80B82C8(
                        GetWMFaceBg(),
                        GetWMFaceVramOffset(),
                        faceProc->xPos,
                        0x1c,
                        (*yptr >> 10) & 1
                    );
                    BG_EnableSyncByMask(1 << (bgMaybe));

                    break;

                case 2:
                    BG_Fill(BG_GetMapBuffer(bgMaybe), 0);
                    BG_EnableSyncByMask(1 << (bgMaybe));

                    break;
            }
        }
    }

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_80B843C(struct WMFaceCtrlProc* proc) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x14\n\
        ldr r0, [r0, #0x2c]\n\
        str r0, [sp, #8]\n\
        bl GetWMFaceBg\n\
        mov sl, r0\n\
        ldr r0, [sp, #8]\n\
        adds r0, #0x2e\n\
        mov r9, r0\n\
        ldr r1, [sp, #8]\n\
        adds r1, #0x2c\n\
        str r1, [sp, #0xc]\n\
        movs r2, #0\n\
        str r2, [sp, #0x10]\n\
        movs r3, #1\n\
        str r3, [sp, #4]\n\
    _080B8466:\n\
        movs r7, #0\n\
        ldr r0, [sp, #8]\n\
        adds r0, #0x30\n\
        ldr r1, [sp, #0x10]\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        cmp r0, #0\n\
        bne _080B8478\n\
        b _080B8602\n\
    _080B8478:\n\
        adds r6, r0, #0\n\
        ldr r2, [sp, #0xc]\n\
        movs r3, #0\n\
        ldrsh r4, [r2, r3]\n\
        mov r5, r9\n\
        ldrh r2, [r5]\n\
        movs r1, #0x80\n\
        lsls r1, r1, #4\n\
        adds r0, r1, #0\n\
        ands r0, r2\n\
        cmp r0, #0\n\
        beq _080B850C\n\
        movs r1, #0xff\n\
        ands r1, r2\n\
        cmp r1, #0xf\n\
        bhi _080B850C\n\
        movs r3, #0x80\n\
        lsls r3, r3, #1\n\
        adds r0, r3, #0\n\
        ands r0, r2\n\
        cmp r0, #0\n\
        beq _080B84BA\n\
        movs r0, #0x10\n\
        subs r0, r0, r1\n\
        lsls r1, r0, #5\n\
        muls r0, r1, r0\n\
        cmp r0, #0\n\
        bge _080B84B2\n\
        adds r0, #0xff\n\
    _080B84B2:\n\
        asrs r0, r0, #8\n\
        adds r0, r4, r0\n\
        strh r0, [r6, #0x34]\n\
        movs r7, #1\n\
    _080B84BA:\n\
        ldrh r1, [r5]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #2\n\
        adds r0, r2, #0\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080B84E2\n\
        movs r0, #0xff\n\
        ands r0, r1\n\
        movs r1, #0x10\n\
        subs r1, r1, r0\n\
        lsls r0, r1, #5\n\
        muls r0, r1, r0\n\
        cmp r0, #0\n\
        bge _080B84DA\n\
        adds r0, #0xff\n\
    _080B84DA:\n\
        asrs r0, r0, #8\n\
        subs r0, r4, r0\n\
        strh r0, [r6, #0x34]\n\
        movs r7, #1\n\
    _080B84E2:\n\
        ldrh r0, [r5]\n\
        adds r0, #1\n\
        strh r0, [r5]\n\
        movs r3, #0xff\n\
        ands r0, r3\n\
        cmp r0, #0xf\n\
        bls _080B850C\n\
        movs r7, #2\n\
        adds r0, r6, #0\n\
        bl GetFaceDisplayBits\n\
        ldr r1, _080B85AC  @ 0xFFFFBFFF\n\
        ands r1, r0\n\
        adds r0, r6, #0\n\
        bl SetFaceDisplayBits\n\
        ldrh r0, [r5]\n\
        ldr r2, _080B85B0  @ 0x0000F7FF\n\
        adds r1, r2, #0\n\
        ands r0, r1\n\
        strh r0, [r5]\n\
    _080B850C:\n\
        ldrh r1, [r5]\n\
        movs r3, #0x80\n\
        lsls r3, r3, #5\n\
        adds r0, r3, #0\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080B85A2\n\
        movs r0, #0xff\n\
        mov r8, r0\n\
        ands r0, r1\n\
        cmp r0, #0xf\n\
        bhi _080B85A2\n\
        cmp r0, #0\n\
        bne _080B853A\n\
        adds r0, r6, #0\n\
        bl GetFaceDisplayBits\n\
        movs r1, #0x80\n\
        lsls r1, r1, #7\n\
        orrs r1, r0\n\
        adds r0, r6, #0\n\
        bl SetFaceDisplayBits\n\
    _080B853A:\n\
        ldrh r1, [r5]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #1\n\
        adds r0, r2, #0\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080B8566\n\
        adds r2, r4, #0\n\
        subs r2, #0x20\n\
        mov r0, r8\n\
        ands r0, r1\n\
        movs r1, #0x10\n\
        subs r1, r1, r0\n\
        lsls r0, r1, #5\n\
        muls r0, r1, r0\n\
        cmp r0, #0\n\
        bge _080B855E\n\
        adds r0, #0xff\n\
    _080B855E:\n\
        asrs r0, r0, #8\n\
        adds r0, r2, r0\n\
        strh r0, [r6, #0x34]\n\
        movs r7, #1\n\
    _080B8566:\n\
        ldrh r1, [r5]\n\
        movs r3, #0x80\n\
        lsls r3, r3, #2\n\
        adds r0, r3, #0\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080B8592\n\
        adds r2, r4, #0\n\
        adds r2, #0x20\n\
        movs r0, #0xff\n\
        ands r0, r1\n\
        movs r1, #0x10\n\
        subs r1, r1, r0\n\
        lsls r0, r1, #5\n\
        muls r0, r1, r0\n\
        cmp r0, #0\n\
        bge _080B858A\n\
        adds r0, #0xff\n\
    _080B858A:\n\
        asrs r0, r0, #8\n\
        subs r0, r2, r0\n\
        strh r0, [r6, #0x34]\n\
        movs r7, #1\n\
    _080B8592:\n\
        ldrh r0, [r5]\n\
        adds r0, #1\n\
        strh r0, [r5]\n\
        movs r1, #0xff\n\
        ands r0, r1\n\
        cmp r0, #0xf\n\
        bls _080B85A2\n\
        movs r7, #2\n\
    _080B85A2:\n\
        cmp r7, #1\n\
        beq _080B85B4\n\
        cmp r7, #2\n\
        beq _080B85EC\n\
        b _080B8602\n\
        .align 2, 0\n\
    _080B85AC: .4byte 0xFFFFBFFF\n\
    _080B85B0: .4byte 0x0000F7FF\n\
    _080B85B4:\n\
        mov r0, sl\n\
        bl BG_GetMapBuffer\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        bl GetWMFaceBg\n\
        adds r4, r0, #0\n\
        bl GetWMFaceVramOffset\n\
        adds r1, r0, #0\n\
        movs r3, #0x34\n\
        ldrsh r2, [r6, r3]\n\
        ldrh r0, [r5]\n\
        lsrs r0, r0, #0xa\n\
        ands r0, r7\n\
        str r0, [sp]\n\
        adds r0, r4, #0\n\
        movs r3, #0x1c\n\
        bl sub_80B82C8\n\
        mov r0, sl\n\
        lsls r7, r0\n\
        adds r0, r7, #0\n\
        bl BG_EnableSyncByMask\n\
        b _080B8602\n\
    _080B85EC:\n\
        mov r0, sl\n\
        bl BG_GetMapBuffer\n\
        movs r1, #0\n\
        bl BG_Fill\n\
        movs r0, #1\n\
        mov r1, sl\n\
        lsls r0, r1\n\
        bl BG_EnableSyncByMask\n\
    _080B8602:\n\
        movs r2, #0xc\n\
        add r9, r2\n\
        ldr r3, [sp, #0xc]\n\
        adds r3, #0xc\n\
        str r3, [sp, #0xc]\n\
        ldr r0, [sp, #0x10]\n\
        adds r0, #0xc\n\
        str r0, [sp, #0x10]\n\
        ldr r1, [sp, #4]\n\
        subs r1, #1\n\
        str r1, [sp, #4]\n\
        cmp r1, #0\n\
        blt _080B861E\n\
        b _080B8466\n\
    _080B861E:\n\
        add sp, #0x14\n\
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

//! FE8U = 0x080B8630
void WMFaceCtrl_Loop(struct WMFaceCtrlProc* proc) {
    u8 gUnknown_08205F28[] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1, 1, 1, 1, 1, 1, 2, 2,
        2, 2, 2, 2, 3, 3, 3, 3, 3,
        3, 3, 3, 3, 3, 2, 2, 2, 2,
        2, 2, 1, 1, 1, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0,

        -1,
    };

    proc->unk_2a++;

    if (gUnknown_08205F28[proc->unk_2a] == 0xFF) {
        proc->unk_2a = 0;
    }

    sub_80B843C(proc);

    if (proc->increment != 0) {
        HandleWMFaceFade(proc);
    }

    return;
}

//! FE8U = 0x080B867C
void nullsub_57(void) {
    return;
}

struct ProcCmd CONST_DATA gProcScr_WorldMapFaceCtrl[] = {
    PROC_MARK(8),
    PROC_SET_END_CB(nullsub_57),

    PROC_CALL(WMFaceCtrl_Init),
    PROC_REPEAT(WMFaceCtrl_Loop),

    PROC_END,
};

//! FE8U = 0x080B8680
ProcPtr StartWMFaceCtrl(ProcPtr parent) {
    return Proc_Start(gProcScr_WorldMapFaceCtrl, parent);
}

//! FE8U = 0x080B8694
void EndWMFaceCtrl(void) {
    Proc_EndEach(gProcScr_WorldMapFaceCtrl);
    return;
}

//! FE8U = 0x080B86A4
int GetWMFaceBlendAmt(void) {
    struct WMFaceCtrlProc* proc;

    Proc_Find(gProcScr_WorldMapFaceCtrl);

    proc = Proc_Find(gProcScr_WorldMapFaceCtrl);

    if (proc) {
        return proc->blendAmt >> 1;
    } else {
        return 0x10;
    }
}

//! FE8U = 0x080B86CC
void sub_80B86CC(int faceSlot, int faceId, u16 config) {
    int bg;
    u32 offset;

    struct WMFaceCtrlProc* proc = Proc_Find(gProcScr_WorldMapFaceCtrl);

    struct WMFaceWrapper* pWrapper = proc->faceHolderProc->faceWrapper + faceSlot;

    if (gGMData.state & GMAP_STATE_BIT3) {
        SetBlendTargetA(0, 0, 1, 0, 0);
        SetBlendTargetB(0, 1, 0, 1, 1);
    } else {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
    }

    bg = GetWMFaceBg();
    offset = GetWMFaceVramOffset();

    if (pWrapper->faceProc == NULL) {
        int x;
        int disp;
        struct FaceProc* faceProc;

        pWrapper->faceId = faceId;

        pWrapper->unk_00 = config & 0x00ff;
        pWrapper->unk_02 = (config & 0xff00) + 0x800;

        sub_80066FC(offset / CHR_SIZE, faceId);
        sub_800671C(4, faceId);

        BG_Fill(BG_GetMapBuffer(bg), 0);

        x = pWrapper->unk_00;

        if (config & 0x400) {
            disp = (FACE_DISP_BIT_14 | FACE_DISP_BLEND | FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(FACE_HLAYER_1) | FACE_DISP_FLIPPED);
        } else {
            disp = (FACE_DISP_BIT_14 | FACE_DISP_BLEND | FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(FACE_HLAYER_1));
        }

        if (config & 0x8000) {
            disp = disp | FACE_DISP_BIT_13;
        }

        faceProc = StartFace2(faceSlot, faceId, x, 28, disp);

        pWrapper->faceProc = faceProc;

        if ((config & 0x6000) == 0x6000) {
            faceProc->spriteLayer = 6;
        } else if (config & 0x4000) {
            faceProc->spriteLayer = 5;
        } else if (config & 0x2000) {
            faceProc->spriteLayer = 4;
        } else {
            faceProc->spriteLayer = 3;
        }

        SetFaceBlinkControlById(faceSlot, 5);

        pWrapper->unk_0a = +1;
        proc->increment = +2;

        if (proc->blendAmt == 0x20) {
            proc->blendAmt = 0;
            SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
        }
    }

    return;
}

//! FE8U = 0x080B8844
void sub_80B8844(int faceSlot, u16 config) {
    int bg;
    u32 offset;

    struct WMFaceCtrlProc* proc = Proc_Find(gProcScr_WorldMapFaceCtrl);

    struct WMFaceWrapper* pWrapper = proc->faceHolderProc->faceWrapper + faceSlot;

    if (gGMData.state & GMAP_STATE_BIT3) {
        SetBlendTargetA(0, 0, 1, 0, 0);
        SetBlendTargetB(0, 1, 0, 1, 1);
    } else {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
    }

    bg = GetWMFaceBg();
    offset = GetWMFaceVramOffset();

    if (pWrapper->faceProc != NULL && (pWrapper->unk_02 & 0x1000) == 0) {
        int tmp;

        sub_80066FC(offset / CHR_SIZE, (s16)pWrapper->faceId);
        sub_800671C(4, (s16)pWrapper->faceId);

        BG_Fill(BG_GetMapBuffer(bg), 0);

        tmp = 0xFFFFFF00 & (u16)pWrapper->unk_02;
        // Seems to be required to match...
        tmp &= (u16)pWrapper->unk_02;

        if (config & 0x300) {
            tmp &= 0x0000FCFF;
            tmp |= (config & 0x300);
        } else {
            tmp &= 0x0000FCFF;
        }

        tmp &= 0xff00;

        pWrapper->unk_02 = tmp + 0x1000;

        pWrapper->unk_0a = -1;
        proc->increment = -2;

        if (proc->blendAmt == 0) {
            proc->blendAmt = 0x20;
            SetSpecialColorEffectsParameters(1, 0x10, 0, 0);
        }
    }

    return;
}

//! FE8U = 0x080B895C
void sub_80B895C(void) {
    int i;

    struct WMFaceCtrlProc* proc = Proc_Find(gProcScr_WorldMapFaceCtrl);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    for (i = 0; i < 2; i++) {
        struct WMFaceWrapper* pWrapper = &proc->faceHolderProc->faceWrapper[i];

        struct FaceProc* faceProc = pWrapper->faceProc;

        if (faceProc != NULL && (pWrapper->unk_02 & 0x1000) == 0) {
            int tmp;

            SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) | FACE_DISP_BIT_14);

            tmp = (u16)pWrapper->unk_02;

        #if NONMATCHING

            tmp &= 0xFFFFFF00;

        #else // if !NONMATCHING

            {
                int r1;
                int r2 = 0xFFFFFF00;
                asm("add %0, %1, #0" : "=r" (r1) : "r" (r2));
                tmp &= r1;
            }

        #endif // NONMATCHING

            pWrapper->unk_02 = tmp + 0x1000;

            pWrapper->unk_0a = -1;
            proc->increment = -2;

            if (proc->blendAmt == 0) {
                proc->blendAmt = 0x20;
                SetSpecialColorEffectsParameters(0, 0x10, 0, 0);
            }
        }
    }

    return;
}