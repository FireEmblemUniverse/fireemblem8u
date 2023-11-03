#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"

#include "prepscreen.h"

u16 CONST_DATA gSprite_MenuScrollContainer[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
};

u16 CONST_DATA gSprite_MenuScroll_TopDecal[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(9),
};

u16 CONST_DATA gSprite_MenuScroll_BottomDecal[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_VFLIP, OAM2_CHR(9),
};

u16 CONST_DATA gSprite_MenuScrollSegmentA[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(1),
};

u16 CONST_DATA gSprite_MenuScrollSegmentB[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(2),
};

u16 CONST_DATA gSprite_MenuScrollSegmentC[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(3),
};

u16 CONST_DATA gSprite_MenuScrollSegmentD[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(4),
};

u16 CONST_DATA gSprite_MenuScrollSegmentE[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(5),
};

u16 CONST_DATA gSprite_MenuScrollSegmentF[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(6),
};

u16 CONST_DATA gSprite_MenuScrollSegmentG[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(7),
};

u16 CONST_DATA gSprite_MenuScrollSegmentH[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(8),
};

const u16* CONST_DATA gMenuScrollBarSegmentSprites[] = {
    NULL, // No sprite if segment is empty
    gSprite_MenuScrollSegmentA,
    gSprite_MenuScrollSegmentB,
    gSprite_MenuScrollSegmentC,
    gSprite_MenuScrollSegmentD,
    gSprite_MenuScrollSegmentE,
    gSprite_MenuScrollSegmentF,
    gSprite_MenuScrollSegmentG,
    gSprite_MenuScrollSegmentH, // Full segment
};

u16 CONST_DATA gSprite_MenuScrollArrowA[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(10),
};

u16 CONST_DATA gSprite_MenuScrollArrowB[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(11),
};

u16 CONST_DATA gSprite_MenuScrollArrowC[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(12),
};

u16 CONST_DATA gSprite_MenuScrollArrowD[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(13),
};

u16 CONST_DATA gSprite_MenuScrollArrowE[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(14),
};

u16 CONST_DATA gSprite_MenuScrollArrowF[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(15),
};

const u16* CONST_DATA gMenuScrollArrowSprites[] = {
    gSprite_MenuScrollArrowA,
    gSprite_MenuScrollArrowB,
    gSprite_MenuScrollArrowC,
    gSprite_MenuScrollArrowD,
    gSprite_MenuScrollArrowE,
    gSprite_MenuScrollArrowF,
};

//! FE8U = 0x080973B0
void MenuScroll_Init(struct MenuScrollBarProc * proc)
{
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
void MenuScroll_Loop(struct MenuScrollBarProc* proc) {
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
            gSprite_MenuScrollContainer,
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
                    gMenuScrollArrowSprites[(proc->topArrowFrameIdx >> 3)],
                    oam2
                );
            }

            for (i = 0; i < sp08 >> 0x13; i++) {
                // Put full vertical scroll bar segments
                PutSpriteExt(
                    4,
                    proc->xBase + 1,
                    proc->yBase + ({(sp04 * currentSegment >> 0x14) + 1;}) + i * 8,
                    gMenuScrollBarSegmentSprites[8],
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
                        gMenuScrollBarSegmentSprites[var],
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
                        gMenuScrollBarSegmentSprites[(sp08 >> 0x10) & 7],
                        oam2
                    );
                }

                PutSpriteExt(
                    4,
                    proc->xBase + 1,
                    proc->numSegments * 8 + proc->yBase + 2,
                    gMenuScrollArrowSprites[proc->bottomArrowFrameIdx >> 3],
                    oam2
                );
            }
        }

        PutSpriteExt(
            4,
            proc->xBase + 1,
            proc->yBase - 7,
            gSprite_MenuScroll_TopDecal,
            oam2
        );

        PutSpriteExt(
            4,
            proc->xBase + 1,
            proc->yBase + ({proc->numSegments * 8 + 1;}),
            gSprite_MenuScroll_BottomDecal,
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

    PROC_CALL(MenuScroll_Init),

    // fallthrough

PROC_LABEL(0),
    PROC_REPEAT(MenuScroll_Loop),

    // fallthrough

PROC_LABEL(1),
    PROC_BLOCK,

    PROC_END,
};

//! FE8U = 0x0809764C
void LockMenuScrollBar(void)
{
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
void EndMenuScrollBar(void) {
    Proc_End(Proc_Find(ProcScr_menu_scroll));
    return;
}

//! FE8U = 0x08097698
ProcPtr StartMenuScrollBar(ProcPtr parent) {
    return Proc_Start(ProcScr_menu_scroll, parent);
}

//! FE8U = 0x080976AC
void PutMenuScrollBarAt(int x, int y) {
    struct MenuScrollBarProc* proc = Proc_Find(ProcScr_menu_scroll);

    if (proc) {
        proc->xBase = x;
        proc->yBase = y;
    }

    return;
}

//! FE8U = 0x080976CC
void UpdateMenuScrollBarConfig(u8 segments, u16 currentSegment, u16 totalRows, u8 visibleRows) {
    struct MenuScrollBarProc* proc = Proc_Find(ProcScr_menu_scroll);

    if (proc) {
        proc->numSegments = segments;
        proc->currentSegment = currentSegment;
        proc->numTotalRows = totalRows;
        proc->numVisibleRows = visibleRows;
    }

    return;
}

//! FE8U = 0x08097700
void InitMenuScrollBarImg(int chr, int pal) {
    struct MenuScrollBarProc* proc;

    ApplyPalette(Pal_MenuScrollBar, pal + 0x10);
    Decompress(Img_MenuScrollBar, (void *)(0x06010000 + chr));

    proc = Proc_Find(ProcScr_menu_scroll);

    if (proc) {
        proc->oam2Chr = chr >> 5;
        proc->oam2Pal = pal << 0xc;
    }
    return;
}

//! FE8U = 0x08097748
ProcPtr StartMenuScrollBarExt(ProcPtr parent, int x, int y, int chr, int pal) {
    struct MenuScrollBarProc* proc = Proc_Start(ProcScr_menu_scroll, parent);

    proc->xBase = x;
    proc->yBase = y;

    ApplyPalette(Pal_MenuScrollBar, pal + 0x10);
    Decompress(Img_MenuScrollBar, (void *)(0x06010000 + chr));

    proc->oam2Chr = chr >> 5;
    proc->oam2Pal = pal << 0xc;

#if BUGFIX
    return proc;
#endif
}
