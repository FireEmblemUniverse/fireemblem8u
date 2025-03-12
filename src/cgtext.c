#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"

EWRAM_DATA struct CgTextSt gCgTextSt = { 0 };

// clang-format off

u16 CONST_DATA gSprite_08A01D88[] =
{
    6,
    OAM0_SHAPE_32x8 + OAM0_BLEND, OAM1_SIZE_32x8, OAM2_CHR(0),
    OAM0_SHAPE_32x8 + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x8 + OAM0_Y(8) + OAM0_BLEND, OAM1_SIZE_32x8, OAM2_CHR(0x8),
    OAM0_SHAPE_32x8 + OAM0_Y(8) + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0xC),
    OAM0_SHAPE_32x8 + OAM0_Y(16) + OAM0_BLEND, OAM1_SIZE_32x8, OAM2_CHR(0x10),
    OAM0_SHAPE_32x8 + OAM0_Y(16) + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x14),
};

u16 CONST_DATA gSprite_08A01DAE[] =
{
    2,
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16, OAM2_CHR(0),
    OAM0_SHAPE_32x16 + OAM0_BLEND, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
};

// clang-format on

//! FE8U = 0x0808E9D8
void SetCgTextFlags(int flags)
{
    gCgTextSt.flags = flags;
    return;
}

//! FE8U = 0x0808E9F0
void SetCgTextFlag(int flag)
{
    gCgTextSt.flags |= flag & 0x3FFFFF;
    return;
}

//! FE8U = 0x0808EA1C
void ClearCgTextFlag(int flag)
{
    SetCgTextFlags(GetCgTextFlags() & (flag ^ 0x3FFFFF));
    return;
}

//! FE8U = 0x0808EA3C
u32 GetCgTextFlags(void)
{
    return gCgTextSt.flags;
}

//! FE8U = 0x0808EA48
void SetCgTextBlendControl(u16 target1, u16 target2)
{
    target2 |= 0x20;
    gCgTextSt.bldCnt = target1 + BLDCNT_EFFECT_BLEND + (target2 << 8);
    return;
}

//! FE8U = 0x0808EA68
u16 GetCgTextBlendControl(void)
{
    return gCgTextSt.bldCnt;
}

//! FE8U = 0x0808EA74
void SetCgTextBlendAlpha(u16 target1, u16 target2)
{
    gCgTextSt.bldAlpha = target1 + (target2 << 8);
    return;
}

//! FE8U = 0x0808EA8C
u16 GetCgTextBlendAlpha(void)
{
    return gCgTextSt.bldAlpha;
}

//! FE8U = 0x0808EA98
void CgText_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        vcount = 0;
    }

    if (vcount == gCgTextSt.unk_48_00 * 8 - 32)
    {
        REG_BLDCNT = GetCgTextBlendControl();
        REG_BLDALPHA = GetCgTextBlendAlpha();
    }

    if ((vcount == 0) || (vcount == (gCgTextSt.unk_48_05 * 8 + 4)))
    {
        REG_BLDCNT = *((u16 *)&gLCDControlBuffer.bldcnt);
        REG_BLDALPHA = gLCDControlBuffer.blendCoeffA + gLCDControlBuffer.blendCoeffB * 0x100;
    }

    return;
}

//! FE8U = 0x0808EB0C
void sub_808EB0C(struct CgTextMainProc * proc)
{
    struct Font font;
    struct Text th;
    char buf[32];

    char * iter = buf;

    if ((proc->str[0] == 0x80) && (proc->str[1] == 0x23)) // [SetName]
    {
        proc->str += 2;

        while (*proc->str != 0x01) // [NL]
        {
            iter[0] = proc->str[0];
            iter[1] = proc->str[1];
            proc->str += 2;
            iter += 2;
        }

        proc->str++;
        *iter = 0;

        SetCgTextFlag(CG_TEXT_FLAG_16);

        InitSpriteTextFont(&font, (void *)0x06017800, 0x12);
        SetTextFont(&font);
        InitSpriteText(&th);

        SpriteText_DrawBackgroundExt(&th, 0);

        SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
        Text_InsertDrawString(&th, GetStringTextCenteredPos(48, buf), 0, buf);

        SetTextFont(NULL);

        ApplyPalette(Pal_Text, 0x12);
        ApplyPalette(gUnknown_085A643C, 0x11);
        Decompress(gUnknown_085A638C, (void *)0x06017900);
    }

    return;
}

//! FE8U = 0x0808EBD4
void CgText_Init(struct CgTextMainProc * proc)
{
    int i;
    int x;
    int y;

    int width = 0;
    int height = 0;

    proc->pauseTimer = 0;
    proc->blendAmt = 0;

    if (GetCgTextFlags() >> 0xb & 7)
    {
        proc->displaySpeed = ((GetCgTextFlags() >> 0xb) & 7) - 1;
    }
    else
    {
        proc->displaySpeed = GetTextDisplaySpeed();
    }

    proc->numCharsVisible = (proc->displaySpeed != 0) ? 1 : INT8_MAX;

    proc->thIndex = 0;
    proc->unk_5e = 0;

    sub_808EB0C(proc);

    if ((proc->boxWidth < 0) || (proc->boxHeight < 0))
    {
        int r1;

        SetTextFontGlyphs(TEXT_GLYPHS_TALK);
        GetCgTextBoxDimensions(proc->str, &width, &height);
        SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

        r1 = width + 7;
        proc->boxWidth = r1 / 8;
        proc->boxHeight = height / 8;
    }

    if (!(GetCgTextFlags() & CG_TEXT_FLAG_0))
    {
        y = proc->y + ~proc->boxHeight;
        if (GetCgTextFlags() & CG_TEXT_FLAG_1)
        {
            x = (proc->x - proc->boxWidth) - 2;
            PutTalkBubbleTm(
                GetCgTextBg(GetCgTextFlags()), (proc->x - proc->boxWidth) - 2, proc->y + ~proc->boxHeight,
                proc->boxWidth + 2, proc->boxHeight + 2);

            if (!(GetCgTextFlags() & CG_TEXT_FLAG_10))
            {
                int kind = (GetCgTextFlags() & CG_TEXT_FLAG_18) ? 5 : 3;
                PutTalkBubbleTail(GetCgTextBg(GetCgTextFlags()), proc->x - 1, proc->y - 2, kind);
            }
        }
        else
        {
            x = (proc->x) + 1;
            PutTalkBubbleTm(
                GetCgTextBg(GetCgTextFlags()), (proc->x) + 1, proc->y + ~proc->boxHeight, proc->boxWidth + 2,
                proc->boxHeight + 2);

            if (!(GetCgTextFlags() & CG_TEXT_FLAG_10))
            {
                int kind = (GetCgTextFlags() & CG_TEXT_FLAG_18) ? 5 : 2;
                PutTalkBubbleTail(GetCgTextBg(GetCgTextFlags()), proc->x, proc->y - 2, kind);
            }
        }

        if (GetCgTextFlags() & CG_TEXT_FLAG_16)
        {
            u16 * bg = BG_GetMapBuffer(GetCgTextBg(GetCgTextFlags()));
            TileMap_FillRect(bg + y * 0x20 + x, 6, 0, 0);
        }

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
    }

    sub_808F3D8(proc);
    StartParallelWorker(sub_808F5C8, proc);

    SetTextFont(proc->pFont);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    for (i = 0; i <= proc->boxHeight / 2; i++)
    {
        InitSpriteText(proc->pTexts[i]);
        Text_SetColor(proc->pTexts[i], 0xb);
    }

    CgText_ClearSpriteText(proc);
    SetTextFont(NULL);

    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
    {
        Proc_Goto(proc, 3);
    }
    else
    {
        if (GetCgTextFlags() & CG_TEXT_FLAG_7)
        {
            SetCgTextBlendAlpha(0x10, 1);
            Proc_Goto(proc, 3);
        }
        else
        {
            SetCgTextBlendAlpha(0, 0x10);
        }

        if (GetCgTextFlags() & CG_TEXT_FLAG_16)
        {
            gCgTextSt.unk_48_00 = proc->y - 5;
        }
        else
        {
            gCgTextSt.unk_48_00 = proc->y - 1;
        }

        gCgTextSt.unk_48_05 = proc->boxHeight + proc->y + 1;

        SetCgTextBlendControl(1 << GetCgTextBg(GetCgTextFlags()), 1 << GetCgTextBg(GetCgTextFlags()) ^ 0x1f);

        if (!(GetCgTextFlags() & CG_TEXT_FLAG_19))
        {
            SetSecondaryHBlankHandler(NULL);
            SetSecondaryHBlankHandler(CgText_OnHBlank);
        }
    }

    BG_SetPosition(GetCgTextBg(GetCgTextFlags()), 0, 0);

    return;
}

//! FE8U = 0x0808EF64
void CgText_InitBlendAmt(struct CgTextMainProc * proc)
{
    proc->blendAmt = 0;
    return;
}

//! FE8U = 0x0808EF6C
void CgText_LoopFadeIn(struct CgTextMainProc * proc)
{
    u16 target1;
    u16 target2;

    proc->blendAmt++;

    target1 = proc->blendAmt;

    if (proc->blendAmt != 0x10)
    {
        target2 = 0x10 - proc->blendAmt;
    }
    else
    {
        target2 = 1;
    }

    SetCgTextBlendAlpha(target1, target2);

    if (proc->blendAmt == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808EFA8
void CgText_InitFadeOut(struct CgTextMainProc * proc)
{
    CgText_ClearSpriteText(proc);
    SetFaceDisplayBitsById(0, GetFaceDisplayBitsById(0) & ~FACE_DISP_TALK_1);

    EndCgTextInterpreter();

    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
    {
        Proc_Goto(proc, 5);
    }
    else
    {
        proc->blendAmt = 0x10;
    }

    if (GetCgTextFlags() & CG_TEXT_FLAG_17)
    {
        StartFaceFadeOut(Proc_Find(gProcScr_E_FACE));
    }

    return;
}

//! FE8U = 0x0808F008
void CgText_LoopFadeOut(struct CgTextMainProc * proc)
{
    u16 target1;
    u16 target2;

    proc->blendAmt--;

    target1 = proc->blendAmt;

    if (target1 != 0x10)
    {
        target2 = 0x10 - target1;
    }
    else
    {
        target2 = 1;
    }

    SetCgTextBlendAlpha(target1, target2);

    if (proc->blendAmt == 0)
    {
        ClearCgTextFlag(CG_TEXT_FLAG_16);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808F04C
void CgText_808F04C(struct CgTextMainProc * proc)
{
    if (!(gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON)))
    {
        return;
    }

    if (GetCgTextFlags() & CG_TEXT_FLAG_6)
    {
        return;
    }

    SetDialogueSkipEvBit();
    EndCgTextInterpreter();

    Proc_Goto(proc, 0);

    return;
}

//! FE8U = 0x0808F084
void CgText_808F084(struct CgTextMainProc * proc)
{
    u16 * bg = BG_GetMapBuffer(GetCgTextBg(GetCgTextFlags()));
    TileMap_FillRect(bg + (proc->y - 1) * 32, 31, proc->boxHeight + 1, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
    return;
}

//! FE8U = 0x0808F0C4
void CgText_OnEnd(struct CgTextMainProc * proc)
{
    SetFaceDisplayBitsById(0, GetFaceDisplayBitsById(0) & ~FACE_DISP_TALK_1);
    CgText_808F084(proc);
    SetSecondaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x0808F0EC
void CgText_808F0EC(struct CgTextMainProc * proc)
{
    CgText_ClearSpriteText(proc);

    proc->thIndex = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    proc->textWidth = 0;
    proc->textHeight = 0;
    GetCgTextDimensions(proc->str, &proc->textWidth, &proc->textHeight);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    RestartCgTextInterpreter(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_CgTextMain[] =
{
    PROC_SET_END_CB(CgText_OnEnd),
    PROC_YIELD,

    PROC_CALL(CgText_Init),

PROC_LABEL(1),
    PROC_CALL(CgText_InitBlendAmt),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(CgText_LoopFadeIn),

    // fallthrough

PROC_LABEL(3),
    PROC_CALL(CgText_808F0EC),
    PROC_REPEAT(CgText_808F04C),

    // fallthrough

PROC_LABEL(4),
    PROC_BLOCK,

    // fallthrough

PROC_LABEL(0),
    PROC_CALL(CgText_InitFadeOut),
    PROC_REPEAT(CgText_LoopFadeOut),

    PROC_CALL(CgText_808F084),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(5),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0808F128
void StartCgText(int x, int y, int width, int height, int stringId, void * vram, int pal, ProcPtr parent)
{
    int palTmp;
    int i;
    int mask;

    struct CgTextMainProc * proc = Proc_Find(gProcScr_CgTextMain);

    if (proc)
    {
        proc->str = GetStringFromIndex(stringId);
        if (DoesStringContainTact(proc->str))
        {
            proc->str = StringInsertSpecialPrefixByCtrl();
        }

        if (proc->blendAmt == 0x10)
        {
            Proc_Goto(proc, 3);
        }
        else
        {
            Proc_Goto(proc, 2);
        }

        return;
    }

    if (parent)
    {
        proc = Proc_StartBlocking(gProcScr_CgTextMain, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_CgTextMain, PROC_TREE_3);
    }

    SetCgTextFlags(CG_TEXT_BG(BG_1));
    ClearAllTalkFlags();

    proc->pFont = &gCgTextSt.font;

    for (i = 0; i < 6; i++)
    {
        proc->pTexts[i] = &gCgTextSt.texts[i];
    }

    proc->x = x;
    proc->y = y;
    proc->boxWidth = width;
    proc->boxHeight = height;
    proc->vram = vram;

    if (pal < 0)
    {
        pal = 5;
    }

    mask = 0xf;
    palTmp = (pal & mask);
    pal = palTmp + 0x10;

    if (vram == 0)
    {
        vram = (void *)0x06013000;
    }

    InitSpriteTextFont(proc->pFont, vram, pal);
    SetTextFont(NULL);

    ApplyPalette(gPal_HelpTextBox, pal);
    proc->palId = ((((uintptr_t)vram) << 0x11) >> 0x16) + ((pal & mask) << 0xc);

    proc->str = GetStringFromIndex(stringId);
    if (DoesStringContainTact(proc->str) != 0)
    {
        proc->str = StringInsertSpecialPrefixByCtrl();
    }

    return;
}

//! FE8U = 0x0808F270
void EndCgText(void)
{
    Proc_End(Proc_Find(gProcScr_CgTextMain));
    return;
}

//! FE8U = 0x0808F284
s8 CgTextExists(void)
{
    if (Proc_Find(gProcScr_CgTextMain))
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0808F2A0
void sub_808F2A0(void)
{
    struct CgTextMainProc * proc = Proc_Find(gProcScr_CgTextMain);

    if (proc)
    {
        Proc_Goto(proc, 0);
    }

    return;
}

//! FE8U = 0x0808F2BC
void CgText_ClearSpriteText(struct CgTextMainProc * proc)
{
    int i;

    SetTextFont(proc->pFont);

    for (i = 0; i <= proc->boxHeight / 2; i++)
    {
        SpriteText_DrawBackgroundExt(proc->pTexts[i], 0);
    }

    SetTextFont(NULL);

    return;
}

//! FE8U = 0x0808F30C
void sub_808F30C(struct CgTextMainProc * proc)
{
    int i;

    SetTextFont(proc->pFont);

    for (i = 0; i <= proc->boxHeight / 2; i++)
    {
        Text_SetCursor(proc->pTexts[i], 0);
    }

    return;
}

//! FE8U = 0x0808F358
void GetCgTextDimensions(const char * str, u8 * wOut, u8 * hOut)
{
    int charWidth;

    int w = 0;
    int h = *hOut;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (1)
    {
        switch (*str)
        {
            case 0x00: // [X]
            case 0x03: // [A]
            case 0x18: // [Yes]
            case 0x19: // [No]
                *wOut = w;
                *hOut = h;

                return;

            case 0x02: // [NL2]
            case 0x04: // [....]
            case 0x05: // [.....]
            case 0x06: // [......]
            case 0x07: // [.......]
            case 0x16: // [ToggleMouthMove]
            case 0x17: // [ToggleSmile]
                str++;

                continue;

            case 0x01: // [NL]
                str++;
                h += 16;
                w = 0;

                continue;

            case 0x80:
                str += 2;

                continue;

            default:
                str = GetCharTextLen(str, &charWidth);
                w += charWidth;

                continue;
        }
    }

    return;
}

//! FE8U = 0x0808F3D8
void sub_808F3D8(struct CgTextMainProc * proc)
{
    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
    {
        return;
    }

    if (GetCgTextFlags() & CG_TEXT_FLAG_1)
    {
        proc->x += ~proc->boxWidth;
    }
    else
    {
        proc->x += 2;
    }

    proc->y -= proc->boxHeight;

    return;
}

//! FE8U = 0x0808F428
void GetCgTextBoxDimensions(const char * str, int * wOut, int * hOut)
{
    int charWidth;

    int w = 0;
    int h = 16;

    *wOut = 0;
    *hOut = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    while (1)
    {
        switch (*str)
        {
            case 0x03: // [A]
                w += 8;

            case 0x00: // [X]
            case 0x01: // [NL]
            case 0x02: // [2NL]
            case 0x18: // [Yes]
            case 0x19: // [No]
                if (*wOut < w)
                {
                    *wOut = w;
                }

                w = 0;

                break;
        }

        switch (*str)
        {
            case 0x01: // [NL]
            case 0x18: // [Yes]
            case 0x19: // [No]
                h += 16;

                break;

            case 0x00: // [X]
            case 0x02: // [2NL]
                if (*hOut < h)
                {
                    *hOut = h;
                }

                h = 0;

                break;
        }

        switch (*str)
        {
            case 0x00: // [X]
                return;

            case 0x01: // [NL]
            case 0x02: // [NL2]
            case 0x03: // [A]
            case 0x04: // [....]
            case 0x05: // [.....]
            case 0x06: // [......]
            case 0x07: // [.......]
            case 0x16: // [ToggleMouthMove]
            case 0x17: // [ToggleSmile]
            case 0x18: // [Yes]
            case 0x19: // [No]
                str++;

                continue;

            case 0x80:
                str += 2;

                continue;

            default:
                str = GetCharTextLen(str, &charWidth);
                w += charWidth;

                continue;
        }
    }

    return;
}

//! FE8U = 0x0808F5A0
s8 DoesStringContainTact(const char * str)
{
    while (1)
    {
        switch (*str)
        {
            case 0x00: // [X]
                return 0;

            case 0x80:
                str++;

                if (*str == 0x20) // [Tact]
                {
                    return 1;
                }
        }

        str++;
    }
}

//! FE8U = 0x0808F5C8
void sub_808F5C8(struct CgTextMainProc * proc)
{
    int iy;

    int x = proc->x * 8;
    int y = proc->y * 8;
    int ix = 0;

    // FAKE
    int oam2Maybe = (int)-(GetCgTextFlags() & 0x100) >> 0x1f & 0x400;

    switch (GetCgTextFlags() & CG_TEXT_BG_MASK)
    {
        case CG_TEXT_BG(BG_0):
            x -= gLCDControlBuffer.bgoffset[BG_0].x;
            y -= gLCDControlBuffer.bgoffset[BG_0].y;
            break;

        case CG_TEXT_BG(BG_1):
            x -= gLCDControlBuffer.bgoffset[BG_1].x;
            y -= gLCDControlBuffer.bgoffset[BG_1].y;
            break;

        case CG_TEXT_BG(BG_2):
            x -= gLCDControlBuffer.bgoffset[BG_2].x;
            y -= gLCDControlBuffer.bgoffset[BG_2].y;
            break;

        case CG_TEXT_BG(BG_3):
            x -= gLCDControlBuffer.bgoffset[BG_3].x;
            y -= gLCDControlBuffer.bgoffset[BG_3].y;
            break;
    }

    if (GetCgTextFlags() & CG_TEXT_FLAG_16)
    {
        PutSpriteExt(0, OAM1_X(x - 16), OAM0_Y(y - 24), gSprite_08A01D88, OAM2_CHR(0x3C8) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 8), OAM0_Y(y - 20), gSprite_08A01DAE, OAM2_CHR(0x3C0) + OAM2_PAL(2));
    }

    for (iy = 0; iy < proc->boxHeight / 2; iy++)
    {
        for (ix = 0; ix < proc->boxWidth / 4; ix++)
        {
            PutSpriteExt(
                2, OAM1_X(x + ix * 0x20), OAM0_Y(y + iy * 0x10), gObject_32x16,
                proc->palId + ix * 4 + iy * 64 + oam2Maybe);
        }
    }

    if ((proc->boxWidth % 4) != 0)
    {
        int tmp = proc->boxWidth / 4 * 4;
        x += proc->boxWidth / 4 * 32;

        for (iy = 0; iy < proc->boxHeight / 2; iy++)
        {
            // FIXME: The shifts should be a cast to s8, but I can't get it to match that way
            for (ix = 0; ix < (((proc->boxWidth) - (proc->boxWidth / 4) * 4) << 0x18 >> 0x18); ix++)
            {
                PutSpriteExt(
                    2, OAM1_X(x + ix * 8), OAM0_Y(y + iy * 16), gObject_8x16,
                    proc->palId + tmp + ix + iy * 64 + oam2Maybe);
            }
        }
    }

    PutSpriteExt(
        2, OAM1_X(x + ix * 0x20), OAM0_Y(y + iy * 0x10), gObject_32x16, proc->palId + ix * 4 + iy * 64 + oam2Maybe);

    return;
}

//! FE8U = 0x0808F824
s8 sub_808F824(int textCode)
{
    switch (textCode)
    {
        case 0x16: // [EnableBlinking]
            SetFaceBlinkControlById(0, 0);
            return 1;

        case 0x17: // ?
            SetFaceBlinkControlById(0, 1);
            return 1;

        case 0x18: // [DelayBlinking]
            SetFaceBlinkControlById(0, 3);
            return 1;

        case 0x19: // [PauseBlinking]
            SetFaceBlinkControlById(0, 2);
            return 1;

        case 0x1a: // ?
            SetFaceBlinkControlById(0, 4);
            return 1;

        case 0x1b: // [DisableBlinking]
            SetFaceBlinkControlById(0, 5);
            return 1;

        case 0x1c: // [OpenEyes]
            sub_80064DC(0, 0);
            return 1;

        case 0x1d: // [CloseEyes]
            sub_80064DC(0, 2);
            return 1;

        case 0x1e: // [HalfCloseEyes]
            sub_80064DC(0, 3);
            return 1;

        case 0x1f: // [Wink]
            sub_80064DC(0, 4);
            return 1;
    }

    return 0;
}

int CONST_DATA gTextIds_AskExit[] =
{
    0x0847, // TODO: msgid "Ask[.]"
    0x0848, // TODO: msgid "Exit"
};

int CONST_DATA gTextIds_YesNo[] =
{
    0x0843, // TODO: msgid "Yes[.]"
    0x0844, // TODO: msgid "No"
};

//! FE8U = 0x0808F8B4
void CgTextInterpreter_Loop_Main(struct CgTextInterpreterProc * proc)
{
    u16 faceDisp;
    int i;

    struct CgTextMainProc * parent = proc->proc_parent;

    int numCharsVisible = parent->numCharsVisible;

    if ((gKeyStatusPtr->newKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) && !(GetCgTextFlags() & CG_TEXT_FLAG_5))
    {
        numCharsVisible = INT8_MAX;
    }
    else
    {
        parent->pauseTimer--;

        if (parent->pauseTimer > 0)
        {
            return;
        }

        parent->pauseTimer = parent->displaySpeed;
    }

    SetTextFont(parent->pFont);

    switch ((u8)gUnknown_03005398)
    {
        case 0:
            faceDisp = GetFaceDisplayBitsById(0) | FACE_DISP_TALK_1;
            SetFaceBlinkControlById(0, 3);
            SetFaceBlinkControlById(1, 1);
            break;

        case 1:
            faceDisp = GetFaceDisplayBitsById(1) | FACE_DISP_TALK_1;
            SetFaceBlinkControlById(1, 3);
            SetFaceBlinkControlById(0, 1);
            break;

        default:
            faceDisp = GetFaceDisplayBitsById(0) | FACE_DISP_TALK_1;
            SetFaceBlinkControlById(0, 3);
            SetFaceBlinkControlById(1, 1);
            break;
    }

    for (i = 0; i < numCharsVisible; i++)
    {
        switch (*parent->str)
        {
            case 0x18: // [Yes]
                parent->thIndex++;

                StartYesNoChoice(
                    (GetCgTextFlags() & CG_TEXT_FLAG_9)
                        ? gTextIds_AskExit
                        : gTextIds_YesNo,
                    parent->pTexts[parent->thIndex],
                    parent->x * 8,
                    (parent->thIndex * 2 + parent->y) * 8,
                    0xb,
                    TALK_CHOICE_YES,
                    proc);

                parent->str++;
                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x19: // [No]
                parent->thIndex++;

                StartYesNoChoice(
                    (GetCgTextFlags() & CG_TEXT_FLAG_9)
                        ? gTextIds_AskExit
                        : gTextIds_YesNo,
                    parent->pTexts[parent->thIndex],
                    parent->x * 8,
                    (parent->thIndex * 2 + parent->y) * 8,
                    0xb,
                    TALK_CHOICE_NO,
                    proc);

                parent->str++;
                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x00: // [X]
                if (GetCgTextFlags() & CG_TEXT_FLAG_2)
                {
                    ClearCgTextFlag(CG_TEXT_FLAG_2);
                    Proc_Goto(parent, 4);
                }
                else
                {
                    Proc_Goto(parent, 0);
                }

                Proc_Goto(proc, 99);
                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x01: // [NL]
                parent->str++;

                if (parent->thIndex + 1 >= parent->boxHeight / 2)
                {
                    parent->unk_5f = 1;
                    Proc_Goto(proc, 1);

                    goto _0808FE68;
                }

                parent->thIndex++;

                continue;

            case 0x04: // [...]
                parent->pauseTimer = 8;
                parent->str++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x05: // [....]
                parent->pauseTimer = 16;
                parent->str++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x06: // [.....]
                parent->pauseTimer = 32;
                parent->str++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x07: // [......]
                parent->pauseTimer = 128;
                parent->str++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x16: // [ToggleMouthMove]
                parent->str++;

                faceDisp &= ~FACE_DISP_SMILE;

                continue;

            case 0x17: // [ToggleSmile]
                parent->str++;

                faceDisp |= FACE_DISP_SMILE;

                continue;

            case 0x02: // [2NL]
                parent->str++;

                if (*parent->str == 0x01) // [NL]
                {
                    parent->str++;
                }

                if (GetCgTextFlags() & CG_TEXT_FLAG_3)
                {
                    Proc_Goto(proc, 2);
                }
                else
                {
                    parent->unk_5f = parent->thIndex + 1;
                    Proc_Goto(proc, 1);
                }

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x03: // [A]
                faceDisp &= ~FACE_DISP_TALK_1;
                parent->str++;

                if (GetCgTextFlags() & CG_TEXT_FLAG_8)
                {
                    StartTalkWaitForInputUnk(
                        proc, parent->x * 8 + parent->textWidth + 4, parent->y * 8 + parent->textHeight + 8, 0x400);
                }
                else
                {
                    StartTalkWaitForInput(
                        proc, parent->x * 8 + parent->textWidth + 4, parent->y * 8 + parent->textHeight + 8);
                }

                GetCgTextDimensions(parent->str, &parent->textWidth, &parent->textHeight);

                goto _0808FE68;

            case 0x80:
                parent->str++;

                if (*parent->str == 0x21) // [ToggleRed]
                {
                    parent->unk_5e = 1 - parent->unk_5e;
                }

                parent->str++;

                continue;
        }

        if (parent->unk_5e != 0)
        {
            Text_SetColor(parent->pTexts[parent->thIndex], 0xc);
        }
        else
        {
            Text_SetColor(parent->pTexts[parent->thIndex], 0xb);
        }

        parent->str = Text_DrawCharacter(parent->pTexts[parent->thIndex], parent->str);

        if ((GetTextDisplaySpeed() != 1) && !(GetCgTextFlags() & CG_TEXT_FLAG_4))
        {
            PlaySoundEffect(0x6e);
        }
    }

_0808FE68:
    SetTextFont(NULL);

    switch ((u8)gUnknown_03005398)
    {
        case 0:
            SetFaceDisplayBitsById(0, faceDisp);
            break;

        case 1:
            SetFaceDisplayBitsById(1, faceDisp);
            break;

        default:
            SetFaceDisplayBitsById(0, faceDisp);
            break;
    }

    return;
}

//! FE8U = 0x0808FEA4
void sub_808FEA4(int * src, int x, int y)
{
    int i;
    int ix;
    int iy;

    int * srcPtr = src;

    for (iy = 0; iy < y; iy++)
    {
        int * srcPtr_ = srcPtr;

        for (ix = 0; ix < x; ix++)
        {
            for (i = 0; i < 7; i++)
            {
                srcPtr_[0] = srcPtr_[1];
                srcPtr_++;
            }

            if (iy == y - 1)
            {
                srcPtr_[0] = 0;
                srcPtr_++;
            }
            else
            {
                int tmp = ix + 0x20;
                srcPtr_[0] = srcPtr[tmp * 8];
                srcPtr_++;
            }
        }

        srcPtr += 0x100;
    }

    return;
}

//! FE8U = 0x0808FF10
void CgTextInterpreter_808FF10(struct CgTextInterpreterProc * proc)
{
    proc->unk_4c = 0;
    return;
}

//! FE8U = 0x0808FF18
void CgTextInterpreter_808FF18(struct CgTextInterpreterProc * proc)
{
    struct CgTextMainProc * parent = proc->proc_parent;

    int a = (parent->thIndex + 1) * 2;

    sub_808FEA4(parent->vram, parent->boxWidth, a);

    proc->unk_4c++;

    if (proc->unk_4c == parent->unk_5f * 16)
    {
        sub_808F30C(parent);

        parent->thIndex -= parent->unk_5f - 1;

        parent->textWidth = 0;
        parent->textHeight = 0;
        GetCgTextDimensions(parent->str, &parent->textWidth, &parent->textHeight);

        parent->textHeight = parent->thIndex * 16 + parent->textHeight;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808FF9C
void CgTextInterpreter_808FF9C(struct CgTextInterpreterProc * proc)
{
    struct CgTextMainProc * parent = proc->proc_parent;

    CgText_ClearSpriteText(parent);

    parent->thIndex = 0;

    parent->textWidth = 0;
    parent->textHeight = 0;
    GetCgTextDimensions(parent->str, &parent->textWidth, &parent->textHeight);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_CgTextInterpreter[] =
{
    PROC_YIELD,

PROC_LABEL(0),
    PROC_REPEAT(CgTextInterpreter_Loop_Main),

    // fallthrough

PROC_LABEL(1),
    PROC_CALL(CgTextInterpreter_808FF10),
    PROC_REPEAT(CgTextInterpreter_808FF18),

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_CALL(CgTextInterpreter_808FF9C),

    PROC_GOTO(0),

PROC_LABEL(99),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0808FFC4
void RestartCgTextInterpreter(struct CgTextMainProc * parent)
{
    Proc_End(Proc_Find(gProcScr_CgTextInterpreter));
    Proc_Start(gProcScr_CgTextInterpreter, parent);
    return;
}

//! FE8U = 0x0808FFE8
void EndCgTextInterpreter(void)
{
    Proc_End(Proc_Find(gProcScr_CgTextInterpreter));
    return;
}

//! FE8U = 0x0808FFFC
s8 sub_808FFFC(void)
{
    if (GetCgTextFlags() & CG_TEXT_FLAG_2)
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08090014
void YesNoChoice_Loop_KeyHandler(struct YesNoChoiceProc * proc)
{
    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(0x6b);
        SetTalkChoiceResult(TALK_CHOICE_CANCEL);
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        PlaySoundEffect(0x6a);
        SetTalkChoiceResult(proc->currentChoice);
        Proc_Break(proc);
        return;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_LEFT) && (proc->currentChoice == TALK_CHOICE_NO))
    {
        PlaySoundEffect(0x67);
        proc->currentChoice = TALK_CHOICE_YES;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) && (proc->currentChoice == TALK_CHOICE_YES))
    {
        PlaySoundEffect(0x67);
        proc->currentChoice = TALK_CHOICE_NO;
    }

    DisplayUiHand(proc->x + (proc->currentChoice - 1) * 40 - 4, proc->y);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_YesNoChoice[] =
{
    PROC_SLEEP(8),

    PROC_REPEAT(YesNoChoice_Loop_KeyHandler),
    PROC_SLEEP(5),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080900EC
void StartYesNoChoice(int * choiceTextIds, struct Text * th, int x, int y, int color, int defaultChoice, ProcPtr parent)
{
    struct YesNoChoiceProc * proc;

    Text_InsertDrawString(th, 16, color, GetStringFromIndex(choiceTextIds[0]));
    Text_InsertDrawString(th, 56, color, GetStringFromIndex(choiceTextIds[1]));

    proc = Proc_StartBlocking(gProcScr_YesNoChoice, parent);
    proc->currentChoice = defaultChoice;
    proc->x = x + 16;
    proc->y = y;

    return;
}
