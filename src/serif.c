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

#include "serif.h"

extern struct Unknown0203E82C gUnknown_0203E82C;

//! FE8U = 0x0808E9D8
void sub_808E9D8(int flags)
{
    gUnknown_0203E82C.unk_48_10 = flags;
    return;
}

//! FE8U = 0x0808E9F0
void sub_808E9F0(int flag)
{
    gUnknown_0203E82C.unk_48_10 |= flag & 0x3FFFFF;
    return;
}

//! FE8U = 0x0808EA1C
void sub_808EA1C(int flag)
{
    sub_808E9D8(sub_808EA3C() & (flag ^ 0x3FFFFF));
    return;
}

//! FE8U = 0x0808EA3C
u32 sub_808EA3C(void)
{
    return gUnknown_0203E82C.unk_48_10;
}

//! FE8U = 0x0808EA48
void sub_808EA48(u16 a, u16 b)
{
    b |= 0x20;
    gUnknown_0203E82C.unk_4c = a + 0x40 + b * 0x100;
    return;
}

//! FE8U = 0x0808EA68
u16 sub_808EA68(void)
{
    return gUnknown_0203E82C.unk_4c;
}

//! FE8U = 0x0808EA74
void sub_808EA74(u16 a, u16 b)
{
    gUnknown_0203E82C.unk_4e = a + (b * 0x100);
    return;
}

//! FE8U = 0x0808EA8C
u16 sub_808EA8C(void)
{
    return gUnknown_0203E82C.unk_4e;
}

//! FE8U = 0x0808EA98
void sub_808EA98(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        vcount = 0;
    }

    if (vcount == gUnknown_0203E82C.unk_48_00 * 8 - 32)
    {
        REG_BLDCNT = sub_808EA68();
        REG_BLDALPHA = sub_808EA8C();
    }

    if ((vcount == 0) || (vcount == (gUnknown_0203E82C.unk_48_05 * 8 + 4)))
    {
        REG_BLDCNT = *((u16 *)&gLCDControlBuffer.bldcnt);
        REG_BLDALPHA = gLCDControlBuffer.blendCoeffA + gLCDControlBuffer.blendCoeffB * 0x100;
    }

    return;
}

//! FE8U = 0x0808EB0C
void sub_808EB0C(struct SerifProc * proc)
{
    struct Font font;
    struct Text th;
    char buf[32];

    char * iter = buf;

    if ((proc->unk_2c[0] == 0x80) && (proc->unk_2c[1] == 0x23)) // [SetName]
    {
        proc->unk_2c += 2;

        while (*proc->unk_2c != 0x01) // [NL]
        {
            iter[0] = proc->unk_2c[0];
            iter[1] = proc->unk_2c[1];
            proc->unk_2c += 2;
            iter += 2;
        }

        proc->unk_2c++;
        *iter = 0;

        sub_808E9F0(0x10000);

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
void sub_808EBD4(struct SerifProc * proc)
{
    int i;
    int x;
    int y;

    int width = 0;
    int height = 0;

    proc->unk_55 = 0;
    proc->unk_56 = 0;

    if (sub_808EA3C() >> 0xb & 7)
    {
        proc->unk_52 = ((sub_808EA3C() >> 0xb) & 7) - 1;
    }
    else
    {
        proc->unk_52 = GetTextDisplaySpeed();
    }

    proc->unk_53 = (proc->unk_52 != 0) ? 1 : INT8_MAX;

    proc->unk_54 = 0;
    proc->unk_5e = 0;

    sub_808EB0C(proc);

    if ((proc->unk_5b < 0) || (proc->unk_5c < 0))
    {
        int r1;

        SetTextFontGlyphs(TEXT_GLYPHS_TALK);
        sub_808F428(proc->unk_2c, &width, &height);
        SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

        r1 = width + 7;
        proc->unk_5b = r1 / 8;
        proc->unk_5c = height / 8;
    }

    if (!(sub_808EA3C() & 1))
    {
        y = proc->unk_58 + ~proc->unk_5c;
        if (sub_808EA3C() & 2)
        {
            x = (proc->unk_57 - proc->unk_5b) - 2;
            PutTalkBubbleTm(
                (sub_808EA3C() & 0xc000) >> 0xe, (proc->unk_57 - proc->unk_5b) - 2, proc->unk_58 + ~proc->unk_5c,
                proc->unk_5b + 2, proc->unk_5c + 2);

            if (!(sub_808EA3C() & 0x400))
            {
                int kind = (sub_808EA3C() & 0x40000) ? 5 : 3;
                PutTalkBubbleTail((sub_808EA3C() & 0xc000) >> 0xe, proc->unk_57 - 1, proc->unk_58 - 2, kind);
            }
        }
        else
        {
            x = (proc->unk_57) + 1;
            PutTalkBubbleTm(
                (sub_808EA3C() & 0xc000) >> 0xe, (proc->unk_57) + 1, proc->unk_58 + ~proc->unk_5c, proc->unk_5b + 2,
                proc->unk_5c + 2);

            if (!(sub_808EA3C() & 0x400))
            {
                int kind = (sub_808EA3C() & 0x40000) ? 5 : 2;
                PutTalkBubbleTail((sub_808EA3C() & 0xc000) >> 0xe, proc->unk_57, proc->unk_58 - 2, kind);
            }
        }

        if (sub_808EA3C() & 0x10000)
        {
            u16 * bg = BG_GetMapBuffer((sub_808EA3C() & 0xc000) >> 0xe);
            TileMap_FillRect(bg + y * 0x20 + x, 6, 0, 0);
        }

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
    }

    sub_808F3D8(proc);
    StartParallelWorker(sub_808F5C8, proc);

    SetTextFont(proc->unk_30);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    for (i = 0; i <= proc->unk_5c / 2; i++)
    {
        InitSpriteText(proc->unk_34[i]);
        Text_SetColor(proc->unk_34[i], 0xb);
    }

    sub_808F2BC(proc);
    SetTextFont(NULL);

    if (sub_808EA3C() & 1)
    {
        Proc_Goto(proc, 3);
    }
    else
    {
        if (sub_808EA3C() & 0x80)
        {
            sub_808EA74(0x10, 1);
            Proc_Goto(proc, 3);
        }
        else
        {
            sub_808EA74(0, 0x10);
        }

        if (sub_808EA3C() & 0x10000)
        {
            gUnknown_0203E82C.unk_48_00 = proc->unk_58 - 5;
        }
        else
        {
            gUnknown_0203E82C.unk_48_00 = proc->unk_58 - 1;
        }
        gUnknown_0203E82C.unk_48_05 = proc->unk_5c + proc->unk_58 + 1;

        sub_808EA48(1 << ((sub_808EA3C() & 0xc000) >> 0xe), 1 << ((sub_808EA3C() & 0xc000) >> 0xe) ^ 0x1f);

        if (!(sub_808EA3C() & 0x80000))
        {
            SetSecondaryHBlankHandler(NULL);
            SetSecondaryHBlankHandler(sub_808EA98);
        }
    }

    BG_SetPosition((sub_808EA3C() & 0xc000) >> 0xe, 0, 0);

    return;
}

//! FE8U = 0x0808EF64
void sub_808EF64(struct SerifProc * proc)
{
    proc->unk_56 = 0;
    return;
}

//! FE8U = 0x0808EF6C
void sub_808EF6C(struct SerifProc * proc)
{
    u16 a;
    u16 b;

    proc->unk_56++;

    a = proc->unk_56;

    if (proc->unk_56 != 0x10)
    {
        b = 0x10 - proc->unk_56;
    }
    else
    {
        b = 1;
    }

    sub_808EA74(a, b);

    if (proc->unk_56 == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808EFA8
void sub_808EFA8(struct SerifProc * proc)
{
    sub_808F2BC(proc);
    SetFaceDisplayBitsById(0, GetFaceDisplayBitsById(0) & ~FACE_DISP_TALK_1);

    sub_808FFE8();

    if (sub_808EA3C() & 1)
    {
        Proc_Goto(proc, 5);
    }
    else
    {
        proc->unk_56 = 0x10;
    }

    if (sub_808EA3C() & 0x20000)
    {
        StartFaceFadeOut(Proc_Find(gProcScr_E_FACE));
    }

    return;
}

//! FE8U = 0x0808F008
void sub_808F008(struct SerifProc * proc)
{
    u16 a;
    u16 b;

    proc->unk_56--;

    a = proc->unk_56;
    if (a != 0x10)
    {
        b = 0x10 - a;
    }
    else
    {
        b = 1;
    }

    sub_808EA74(a, b);

    if (proc->unk_56 == 0)
    {
        sub_808EA1C(0x10000);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808F04C
void sub_808F04C(struct SerifProc * proc)
{
    if (!(gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON)))
    {
        return;
    }

    if (sub_808EA3C() & 0x40)
    {
        return;
    }

    sub_800D3E4();
    sub_808FFE8();
    Proc_Goto(proc, 0);

    return;
}

//! FE8U = 0x0808F084
void sub_808F084(struct SerifProc * proc)
{
    u16 * bg = BG_GetMapBuffer((sub_808EA3C() & 0xc000) >> 0xe);
    TileMap_FillRect(bg + (proc->unk_58 - 1) * 32, 31, proc->unk_5c + 1, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
    return;
}

//! FE8U = 0x0808F0C4
void sub_808F0C4(struct SerifProc * proc)
{
    SetFaceDisplayBitsById(0, GetFaceDisplayBitsById(0) & ~FACE_DISP_TALK_1);
    sub_808F084(proc);
    SetSecondaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x0808F0EC
void sub_808F0EC(struct SerifProc * proc)
{
    sub_808F2BC(proc);

    proc->unk_54 = 0;

    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    proc->unk_59 = 0;
    proc->unk_5a = 0;
    sub_808F358(proc->unk_2c, &proc->unk_59, &proc->unk_5a);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    sub_808FFC4(proc);

    return;
}

extern struct ProcCmd gUnknown_08A01DBC[];

//! FE8U = 0x0808F128
void sub_808F128(int x, int y, int widthMaybe, int heightMaybe, int stringId, void * vram, int pal, ProcPtr parent)
{
    int palTmp;
    int i;
    int mask;

    struct SerifProc * proc = Proc_Find(gUnknown_08A01DBC);

    if (proc)
    {
        proc->unk_2c = GetStringFromIndex(stringId);
        if (sub_808F5A0(proc->unk_2c) != 0)
        {
            proc->unk_2c = StringInsertSpecialPrefixByCtrl();
        }
        if (proc->unk_56 == 0x10)
        {
            Proc_Goto(proc, 3);
        }
        else
        {
            Proc_Goto(proc, 2);
        }

        return;
    }

    if (parent != 0)
    {
        proc = Proc_StartBlocking(gUnknown_08A01DBC, parent);
    }
    else
    {
        proc = Proc_Start(gUnknown_08A01DBC, PROC_TREE_3);
    }

    sub_808E9D8(0x4000);
    ClearAllTalkFlags();

    proc->unk_30 = &gUnknown_0203E82C.unk_00;

    for (i = 0; i <= 5; i++)
    {
        proc->unk_34[i] = &gUnknown_0203E82C.unk_18[i];
    }

    proc->unk_57 = x;
    proc->unk_58 = y;
    proc->unk_5b = widthMaybe;
    proc->unk_5c = heightMaybe;
    proc->unk_4c = vram;

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

    InitSpriteTextFont(proc->unk_30, (void *)vram, pal);
    SetTextFont(NULL);

    ApplyPalette(gPal_HelpTextBox, pal);
    proc->unk_50 = ((((uintptr_t)vram) << 0x11) >> 0x16) + ((pal & mask) << 0xc);

    proc->unk_2c = GetStringFromIndex(stringId);
    if (sub_808F5A0(proc->unk_2c) != 0)
    {
        proc->unk_2c = StringInsertSpecialPrefixByCtrl();
    }

    return;
}

//! FE8U = 0x0808F270
void sub_808F270(void)
{
    Proc_End(Proc_Find(gUnknown_08A01DBC));
    return;
}

//! FE8U = 0x0808F284
s8 SomeTalkProcExists(void)
{
    if (Proc_Find(gUnknown_08A01DBC))
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0808F2A0
void sub_808F2A0(void)
{
    struct SerifProc * proc = Proc_Find(gUnknown_08A01DBC);

    if (proc)
    {
        Proc_Goto(proc, 0);
    }

    return;
}

//! FE8U = 0x0808F2BC
void sub_808F2BC(struct SerifProc * proc)
{
    int i;

    SetTextFont(proc->unk_30);

    for (i = 0; i <= proc->unk_5c / 2; i++)
    {
        SpriteText_DrawBackgroundExt(proc->unk_34[i], 0);
    }

    SetTextFont(NULL);

    return;
}

//! FE8U = 0x0808F30C
void sub_808F30C(struct SerifProc * proc)
{
    int i;

    SetTextFont(proc->unk_30);

    for (i = 0; i <= proc->unk_5c / 2; i++)
    {
        Text_SetCursor(proc->unk_34[i], 0);
    }

    return;
}

//! FE8U = 0x0808F358
void sub_808F358(const char * str, u8 * wOut, u8 * hOut)
{
    int h;
    int w;
    int charWidth;

    w = 0;
    h = *hOut;

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
void sub_808F3D8(struct SerifProc * proc)
{
    if (sub_808EA3C() & 1)
    {
        return;
    }

    if (sub_808EA3C() & 2)
    {
        proc->unk_57 += ~proc->unk_5b;
    }
    else
    {
        proc->unk_57 += 2;
    }

    proc->unk_58 -= proc->unk_5c;

    return;
}

//! FE8U = 0x0808F428
void sub_808F428(const char * str, int * wOut, int * hOut)
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
s8 sub_808F5A0(const char * str)
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

extern u16 gUnknown_08A01D88[];
extern u16 gUnknown_08A01DAE[];

//! FE8U = 0x0808F5C8
void sub_808F5C8(struct SerifProc * proc) {
    int iy;

    int x = proc->unk_57 * 8;
    int y = proc->unk_58 * 8;
    int ix = 0;

    // FAKE
    int oam2Maybe = (int)-(sub_808EA3C() & 0x100) >> 0x1f & 0x400;

    switch (sub_808EA3C() & 0xc000) {
        case 0x0000:
            x -= gLCDControlBuffer.bgoffset[BG_0].x;
            y -= gLCDControlBuffer.bgoffset[BG_0].y;
            break;

        case 0x4000:
            x -= gLCDControlBuffer.bgoffset[BG_1].x;
            y -= gLCDControlBuffer.bgoffset[BG_1].y;
            break;

        case 0x8000:
            x -= gLCDControlBuffer.bgoffset[BG_2].x;
            y -= gLCDControlBuffer.bgoffset[BG_2].y;
            break;

        case 0xc000:
            x -= gLCDControlBuffer.bgoffset[BG_3].x;
            y -= gLCDControlBuffer.bgoffset[BG_3].y;
            break;
    }

    if (sub_808EA3C() & 0x10000) {
        PutSpriteExt(0, OAM1_X(x - 16), OAM0_Y(y - 24), gUnknown_08A01D88, OAM2_CHR(0x3C8) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 8), OAM0_Y(y - 20), gUnknown_08A01DAE, OAM2_CHR(0x3C0) + OAM2_PAL(2));
    }

    for (iy = 0; iy < proc->unk_5c / 2; iy++) {
        for (ix = 0; ix < proc->unk_5b / 4; ix++) {
            PutSpriteExt(
                2,
                OAM1_X(x + ix * 0x20),
                OAM0_Y(y + iy * 0x10),
                gObject_32x16,
                proc->unk_50 + ix * 4 + iy * 64 + oam2Maybe
            );
        }
    }

    if ((proc->unk_5b % 4) != 0) {
        int tmp = proc->unk_5b / 4 * 4;
        x += proc->unk_5b / 4 * 32;
        

        for (iy = 0; iy < proc->unk_5c / 2; iy++) {
            // FIXME: The shifts should be a cast to s8, but I can't get it to match that way
            for (ix = 0; ix < (((proc->unk_5b) - (proc->unk_5b / 4) * 4) << 0x18 >> 0x18); ix++) {
                PutSpriteExt(
                    2,
                    OAM1_X(x + ix * 8),
                    OAM0_Y(y + iy * 16),
                    gObject_8x16,
                    proc->unk_50 + tmp + ix + iy * 64 + oam2Maybe
                );
            }
        }
    }

    PutSpriteExt(
        2,
        OAM1_X(x + ix * 0x20),
        OAM0_Y(y + iy * 0x10),
        gObject_32x16,
        proc->unk_50 + ix * 4 + iy * 64 + oam2Maybe
    );
    
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

extern int gUnknown_08A01E5C[];
extern int gUnknown_08A01E54[];

//! FE8U = 0x0808F8B4
void sub_808F8B4(struct ProcA01E64 * proc)
{
    u16 faceDisp;
    int i;

    struct SerifProc * parent = proc->proc_parent;

    int numCharShown = parent->unk_53;

    if ((gKeyStatusPtr->newKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) && !(sub_808EA3C() & 0x20))
    {
        numCharShown = INT8_MAX;
    }
    else
    {
        parent->unk_55--;

        if (parent->unk_55 > 0)
        {
            return;
        }

        parent->unk_55 = parent->unk_52;
    }

    SetTextFont(parent->unk_30);

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

    for (i = 0; i < numCharShown; i++)
    {
        switch (*parent->unk_2c)
        {
            case 0x18: // [Yes]
                parent->unk_54++;

                sub_80900EC(
                    (sub_808EA3C() & 0x200) ? gUnknown_08A01E54 : gUnknown_08A01E5C, parent->unk_34[parent->unk_54],
                    parent->unk_57 * 8, (parent->unk_54 * 2 + parent->unk_58) * 8, 0xb, 1, proc);

                parent->unk_2c++;
                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x19: // [No]
                parent->unk_54++;

                sub_80900EC(
                    (sub_808EA3C() & 0x200) ? gUnknown_08A01E54 : gUnknown_08A01E5C, parent->unk_34[parent->unk_54],
                    parent->unk_57 * 8, (parent->unk_54 * 2 + parent->unk_58) * 8, 0xb, 2, proc);

                parent->unk_2c++;
                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x00: // [X]
                if (sub_808EA3C() & 4)
                {
                    sub_808EA1C(4);
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
                parent->unk_2c++;

                if (parent->unk_54 + 1 >= parent->unk_5c / 2)
                {
                    parent->unk_5f = 1;
                    Proc_Goto(proc, 1);

                    goto _0808FE68;
                }

                parent->unk_54++;

                continue;

            case 0x04: // [...]
                parent->unk_55 = 8;
                parent->unk_2c++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x05: // [....]
                parent->unk_55 = 16;
                parent->unk_2c++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x06: // [.....]
                parent->unk_55 = 32;
                parent->unk_2c++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x07: // [......]
                parent->unk_55 = 128;
                parent->unk_2c++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x16: // [ToggleMouthMove]
                parent->unk_2c++;

                faceDisp &= ~FACE_DISP_SMILE;

                continue;

            case 0x17: // [ToggleSmile]
                parent->unk_2c++;

                faceDisp |= FACE_DISP_SMILE;

                continue;

            case 0x02: // [2NL]
                parent->unk_2c++;

                if (*parent->unk_2c == 0x01) // [NL]
                {
                    parent->unk_2c++;
                }

                if (sub_808EA3C() & 8)
                {
                    Proc_Goto(proc, 2);
                }
                else
                {
                    parent->unk_5f = parent->unk_54 + 1;
                    Proc_Goto(proc, 1);
                }

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x03: // [A]
                faceDisp &= ~FACE_DISP_TALK_1;
                parent->unk_2c++;

                if (sub_808EA3C() & 0x100)
                {
                    StartTalkWaitForInputUnk(
                        proc, parent->unk_57 * 8 + parent->unk_59 + 4, parent->unk_58 * 8 + parent->unk_5a + 8, 0x400);
                }
                else
                {
                    StartTalkWaitForInput(
                        proc, parent->unk_57 * 8 + parent->unk_59 + 4, parent->unk_58 * 8 + parent->unk_5a + 8);
                }

                sub_808F358(parent->unk_2c, &parent->unk_59, &parent->unk_5a);

                goto _0808FE68;

            case 0x80:
                parent->unk_2c++;

                if (*parent->unk_2c == 0x21) // [ToggleRed]
                {
                    parent->unk_5e = 1 - parent->unk_5e;
                }

                parent->unk_2c++;

                continue;
        }

        if (parent->unk_5e != 0)
        {
            Text_SetColor(parent->unk_34[parent->unk_54], 0xc);
        }
        else
        {
            Text_SetColor(parent->unk_34[parent->unk_54], 0xb);
        }

        parent->unk_2c = Text_DrawCharacter(parent->unk_34[parent->unk_54], parent->unk_2c);

        if ((GetTextDisplaySpeed() != 1) && !(sub_808EA3C() & 0x10))
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
void sub_808FF10(struct ProcA01E64 * proc)
{
    proc->unk_4c = 0;
    return;
}

//! FE8U = 0x0808FF18
void sub_808FF18(struct ProcA01E64 * proc)
{
    struct SerifProc * parent = proc->proc_parent;

    int a = (parent->unk_54 + 1) * 2;

    sub_808FEA4(parent->unk_4c, parent->unk_5b, a);

    proc->unk_4c++;

    if (proc->unk_4c == parent->unk_5f * 16)
    {
        sub_808F30C(parent);

        parent->unk_54 -= parent->unk_5f - 1;

        parent->unk_59 = 0;
        parent->unk_5a = 0;
        sub_808F358(parent->unk_2c, &parent->unk_59, &parent->unk_5a);

        parent->unk_5a = parent->unk_54 * 16 + parent->unk_5a;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808FF9C
void sub_808FF9C(struct ProcA01E64 * proc)
{
    struct SerifProc * parent = proc->proc_parent;

    sub_808F2BC(parent);

    parent->unk_54 = 0;

    parent->unk_59 = 0;
    parent->unk_5a = 0;
    sub_808F358(parent->unk_2c, &parent->unk_59, &parent->unk_5a);

    return;
}

extern struct ProcCmd gUnknown_08A01E64[];

//! FE8U = 0x0808FFC4
void sub_808FFC4(struct SerifProc * parent)
{
    Proc_End(Proc_Find(gUnknown_08A01E64));
    Proc_Start(gUnknown_08A01E64, parent);
    return;
}

//! FE8U = 0x0808FFE8
void sub_808FFE8(void)
{
    Proc_End(Proc_Find(gUnknown_08A01E64));
    return;
}

//! FE8U = 0x0808FFFC
s8 sub_808FFFC(void)
{
    if (sub_808EA3C() & 4)
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x08090014
void sub_8090014(struct YesNoChoiceProc * proc)
{
    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(0x6b);
        SetTalkChoiceResult(0);
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

    if ((gKeyStatusPtr->newKeys & DPAD_LEFT) && (proc->currentChoice == 2))
    {
        PlaySoundEffect(0x67);
        proc->currentChoice = 1;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) && (proc->currentChoice == 1))
    {
        PlaySoundEffect(0x67);
        proc->currentChoice = 2;
    }

    DisplayUiHand(proc->x + (proc->currentChoice - 1) * 40 - 4, proc->y);

    return;
}

extern struct ProcCmd gUnknown_08A01EC4[];

//! FE8U = 0x080900EC
void sub_80900EC(int * choiceTextIds, struct Text * th, int x, int y, int color, int defaultChoice, ProcPtr parent)
{
    struct YesNoChoiceProc * proc;

    Text_InsertDrawString(th, 16, color, GetStringFromIndex(choiceTextIds[0]));
    Text_InsertDrawString(th, 56, color, GetStringFromIndex(choiceTextIds[1]));

    proc = Proc_StartBlocking(gUnknown_08A01EC4, parent);
    proc->currentChoice = defaultChoice;
    proc->x = x + 16;
    proc->y = y;

    return;
}
