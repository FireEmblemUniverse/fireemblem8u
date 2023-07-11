#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"

#include "prepscreen.h"

struct MenuScrollBarProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 xBase;
    /* 2C */ u8 yBase;
    /* 2D */ u8 numSegments;
    /* 2E */ u16 currentSegment;
    /* 30 */ u16 prevSegment;
    /* 32 */ u16 numTotalRows;
    /* 34 */ u8 numVisibleRows;
    /* 36 */ u16 oam2Chr;
    /* 38 */ u16 oam2Pal;
    /* 3A */ u8 topArrowFrameIdx;
    /* 3B */ u8 bottomArrowFrameIdx;
};

u16 CONST_DATA gUnknown_08A18744[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
};

u16 CONST_DATA gUnknown_08A1874C[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(9),
};

u16 CONST_DATA gUnknown_08A18754[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_VFLIP, OAM2_CHR(9),
};

u16 CONST_DATA gSprite_08A1875C[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(1),
};

u16 CONST_DATA gSprite_08A18764[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(2),
};

u16 CONST_DATA gSprite_08A1876C[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(3),
};

u16 CONST_DATA gSprite_08A18774[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(4),
};

u16 CONST_DATA gSprite_08A1877C[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(5),
};

u16 CONST_DATA gSprite_08A18784[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(6),
};

u16 CONST_DATA gSprite_08A1878C[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(7),
};

u16 CONST_DATA gSprite_08A18794[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(8),
};

const u16* CONST_DATA gUnknown_08A1879C[] = {
    NULL,
    gSprite_08A1875C,
    gSprite_08A18764,
    gSprite_08A1876C,
    gSprite_08A18774,
    gSprite_08A1877C,
    gSprite_08A18784,
    gSprite_08A1878C,
    gSprite_08A18794,
};

u16 CONST_DATA gSprite_08A187C0[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xA),
};

u16 CONST_DATA gSprite_08A187C8[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xB),
};

u16 CONST_DATA gSprite_08A187D0[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xC),
};

u16 CONST_DATA gSprite_08A187D8[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xD),
};

u16 CONST_DATA gSprite_08A187E0[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xE),
};

u16 CONST_DATA gSprite_08A187E8[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xF),
};

const u16* CONST_DATA gUnknown_08A187F0[] = {
    gSprite_08A187C0,
    gSprite_08A187C8,
    gSprite_08A187D0,
    gSprite_08A187D8,
    gSprite_08A187E0,
    gSprite_08A187E8,
};

//! FE8U = 0x080973B0
void sub_80973B0(struct MenuScrollBarProc* proc) {
    proc->xBase = 0;
    proc->yBase = 0;
    proc->numSegments = 0;
    proc->currentSegment = 0;
    proc->numTotalRows = proc->currentSegment;
    proc->numVisibleRows = 0;
    proc->prevSegment = proc->currentSegment;
    proc->oam2Chr = 0x390;
    proc->oam2Pal = 0x1000;
    proc->topArrowFrameIdx = 0;
    proc->bottomArrowFrameIdx = 0;
    return;
}

//! FE8U = 0x080973E4
void sub_80973E4(struct MenuScrollBarProc* proc) {
    u32 r7;
    int r2;
    u32 sp04;
    u32 sp08;
    int oam2;
    int i;
    u16 currentSegment;
    u16 numTotalRows;

    oam2 = proc->oam2Chr + proc->oam2Pal;

    if (proc->numTotalRows <= proc->numVisibleRows) {
        return;
    }

    for (i = 0; i < proc->numSegments; i++) {
        PutSpriteExt(
            4,
            proc->xBase + 1,
            proc->yBase + ({1 + 8 * i;}),
            gUnknown_08A18744,
            oam2
        );
    }

    if (i != 0) {
        r7 = proc->numSegments << 0x13;
        currentSegment = proc->currentSegment;
        numTotalRows = proc->numTotalRows;
        if (numTotalRows > proc->numVisibleRows) {
            sp04 = r7 / numTotalRows;
            sp08 = r7 * proc->numVisibleRows / numTotalRows;

            if (currentSegment != 0) {
                PutSpriteExt(
                    4,
                    proc->xBase + OAM1_VFLIP + 1,
                    proc->yBase - 8,
                    gUnknown_08A187F0[(proc->topArrowFrameIdx >> 3)],
                    oam2
                );
            }

            for (i = 0; i < sp08 >> 0x13; i++) {
                // Put full vertical scroll bar segments
                PutSpriteExt(
                    4,
                    proc->xBase + 1,
                    proc->yBase + ({(sp04 * currentSegment >> 0x14) + 1;}) + i * 8,
                    gUnknown_08A1879C[8],
                    oam2
                );
            }

            if (((proc->currentSegment >> 4) + proc->numVisibleRows) == proc->numTotalRows) {
                // We are at the bottom of the scrollable area
                u32 var = proc->numSegments * 8 - ((r2 = sp04 * currentSegment >> 0x14) + i * 8);
                if (var != 0) {
                    // Put last partial scroll bar segment, if needed
                    PutSpriteExt(
                        4,
                        proc->xBase + 1,
                        ({r2 + 1;}) + proc->yBase + i * 8,
                        gUnknown_08A1879C[var],
                        oam2
                    );
                }
            } else {
                if ((sp08 >> 0x10) & 7) {
                    // Put last partial scroll bar segment, if needed
                    PutSpriteExt(
                        4,
                        proc->xBase + 1,
                        ({(sp04 * currentSegment >> 0x14) + 1;}) + proc->yBase + i * 8,
                        gUnknown_08A1879C[(sp08 >> 0x10) & 7],
                        oam2
                    );
                }

                PutSpriteExt(
                    4,
                    proc->xBase + 1,
                    proc->numSegments * 8 + proc->yBase + 2,
                    gUnknown_08A187F0[proc->bottomArrowFrameIdx >> 3],
                    oam2
                );
            }
        }

        // top decal
        PutSpriteExt(
            4,
            proc->xBase + 1,
            proc->yBase - 7,
            gUnknown_08A1874C,
            oam2
        );

        // bottom decal
        PutSpriteExt(
            4,
            proc->xBase + 1,
            proc->yBase + ({proc->numSegments * 8 + 1;}),
            gUnknown_08A18754,
            oam2
        );
    }

    if (proc->prevSegment != proc->currentSegment) {
        if (proc->prevSegment > proc->currentSegment) {
            proc->topArrowFrameIdx += 3;
        }

        if (proc->prevSegment < proc->currentSegment) {
            proc->bottomArrowFrameIdx += 3;
        }

        proc->prevSegment = proc->currentSegment;
    }

    proc->topArrowFrameIdx++;
    proc->bottomArrowFrameIdx++;

    if ((proc->topArrowFrameIdx >> 3) > 5) {
        proc->topArrowFrameIdx = 0;
    }

    if ((proc->bottomArrowFrameIdx >> 3) > 5) {
        proc->bottomArrowFrameIdx = 0;
    }

    return;
}

struct ProcCmd CONST_DATA ProcScr_menu_scroll[] = {
    PROC_NAME("menu_scroll"),

    PROC_CALL(sub_80973B0),

    // fallthrough

PROC_LABEL(0),
    PROC_REPEAT(sub_80973E4),

    // fallthrough

PROC_LABEL(1),
    PROC_BLOCK,

    PROC_END,
};

//! FE8U = 0x0809764C
void sub_809764C(void) {
    struct MenuScrollBarProc* proc = Proc_Find(ProcScr_menu_scroll);

    if (proc) {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x08097668
void sub_8097668(void) {
    struct MenuScrollBarProc* proc = Proc_Find(ProcScr_menu_scroll);

    if (proc) {
        Proc_Goto(proc, 0);
    }

    return;
}

//! FE8U = 0x08097684
void Delete6CMenuScroll(void) {
    Proc_End(Proc_Find(ProcScr_menu_scroll));
    return;
}

//! FE8U = 0x08097698
ProcPtr Make6CMenuScroll(ProcPtr parent) {
    return Proc_Start(ProcScr_menu_scroll, parent);
}

//! FE8U = 0x080976AC
void sub_80976AC(int x, int y) {
    struct MenuScrollBarProc* proc = Proc_Find(ProcScr_menu_scroll);

    if (proc) {
        proc->xBase = x;
        proc->yBase = y;
    }

    return;
}

//! FE8U = 0x080976CC
void sub_80976CC(u8 segments, u16 param_2, u16 totalRows, u8 visibleRows) {
    struct MenuScrollBarProc* proc = Proc_Find(ProcScr_menu_scroll);

    if (proc) {
        proc->numSegments = segments;
        proc->currentSegment = param_2;
        proc->numTotalRows = totalRows;
        proc->numVisibleRows = visibleRows;
    }

    return;
}

extern u8 Img_PrepWindowSideBar[];
extern u16 Pal_PrepWindowSideBar[];

//! FE8U = 0x08097700
void InitPrepSideBarImg(int chr, int pal) {
    struct MenuScrollBarProc* proc;

    CopyToPaletteBuffer(Pal_PrepWindowSideBar, (pal + 0x10) * 0x20, 0x20);
    Decompress(Img_PrepWindowSideBar, (void *)(0x06010000 + chr));

    proc = Proc_Find(ProcScr_menu_scroll);

    if (proc) {
        proc->oam2Chr = chr >> 5;
        proc->oam2Pal = pal << 0xc;
    }
    return;
}

//! FE8U = 0x08097748
ProcPtr PrepStartSideBarScroll(ProcPtr parent, int x, int y, int chr, int pal) {
    struct MenuScrollBarProc* proc = Proc_Start(ProcScr_menu_scroll, parent);

    proc->xBase = x;
    proc->yBase = y;

    CopyToPaletteBuffer(Pal_PrepWindowSideBar, (pal + 0x10) * 0x20, 0x20);
    Decompress(Img_PrepWindowSideBar, (void *)(0x06010000 + chr));

    proc->oam2Chr = chr >> 5;
    proc->oam2Pal = pal << 0xc;

#if BUGFIX
    return proc;
#endif
}
