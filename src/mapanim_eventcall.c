#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"

#include "constants/songs.h"

struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_0[] =
{
    {
        gMapanimEventcall_23,
        gMapanimEventcall_79,
        gMapanimEventcall_135,
    },
    {
        gMapanimEventcall_24,
        gMapanimEventcall_80,
        gMapanimEventcall_136,
    },
    {
        gMapanimEventcall_25,
        gMapanimEventcall_81,
        gMapanimEventcall_137,
    },
    {
        gMapanimEventcall_26,
        gMapanimEventcall_82,
        gMapanimEventcall_138,
    },
    {
        gMapanimEventcall_27,
        gMapanimEventcall_83,
        gMapanimEventcall_139,
    },
    {
        gMapanimEventcall_28,
        gMapanimEventcall_84,
        gMapanimEventcall_140,
    },
    {
        gMapanimEventcall_29,
        gMapanimEventcall_85,
        gMapanimEventcall_141,
    },
    {
        gMapanimEventcall_30,
        gMapanimEventcall_86,
        gMapanimEventcall_142,
    },
    {
        gMapanimEventcall_31,
        gMapanimEventcall_87,
        gMapanimEventcall_143,
    },
    {
        gMapanimEventcall_32,
        gMapanimEventcall_88,
        gMapanimEventcall_144,
    },
    {
        gMapanimEventcall_33,
        gMapanimEventcall_89,
        gMapanimEventcall_145,
    },
    {
        gMapanimEventcall_34,
        gMapanimEventcall_90,
        gMapanimEventcall_146,
    },
    {
        gMapanimEventcall_35,
        gMapanimEventcall_91,
        gMapanimEventcall_147,
    },
    {
        gMapanimEventcall_36,
        gMapanimEventcall_92,
        gMapanimEventcall_148,
    },
    {
        gMapanimEventcall_37,
        gMapanimEventcall_93,
        gMapanimEventcall_149,
    },
    {
        gMapanimEventcall_38,
        gMapanimEventcall_94,
        gMapanimEventcall_150,
    },
    {
        gMapanimEventcall_39,
        gMapanimEventcall_95,
        gMapanimEventcall_151,
    },
    {
        gMapanimEventcall_40,
        gMapanimEventcall_96,
        gMapanimEventcall_152,
    },
    {
        gMapanimEventcall_41,
        gMapanimEventcall_97,
        gMapanimEventcall_153,
    },
    {
        gMapanimEventcall_42,
        gMapanimEventcall_98,
        gMapanimEventcall_154,
    },
};

struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_1[] =
{
    {
        gMapanimEventcall_43,
        gMapanimEventcall_99,
        gMapanimEventcall_155,
    },
    {
        gMapanimEventcall_44,
        gMapanimEventcall_100,
        gMapanimEventcall_156,
    },
    {
        gMapanimEventcall_45,
        gMapanimEventcall_101,
        gMapanimEventcall_157,
    },
    {
        gMapanimEventcall_46,
        gMapanimEventcall_102,
        gMapanimEventcall_158,
    },
    {
        gMapanimEventcall_47,
        gMapanimEventcall_103,
        gMapanimEventcall_159,
    },
    {
        gMapanimEventcall_48,
        gMapanimEventcall_104,
        gMapanimEventcall_160,
    },
    {
        gMapanimEventcall_49,
        gMapanimEventcall_105,
        gMapanimEventcall_161,
    },
    {
        gMapanimEventcall_50,
        gMapanimEventcall_106,
        gMapanimEventcall_162,
    },
    {
        gMapanimEventcall_51,
        gMapanimEventcall_107,
        gMapanimEventcall_163,
    },
    {
        gMapanimEventcall_52,
        gMapanimEventcall_108,
        gMapanimEventcall_164,
    },
    {
        gMapanimEventcall_53,
        gMapanimEventcall_109,
        gMapanimEventcall_165,
    },
    {
        gMapanimEventcall_54,
        gMapanimEventcall_110,
        gMapanimEventcall_166,
    },
    {
        gMapanimEventcall_55,
        gMapanimEventcall_111,
        gMapanimEventcall_167,
    },
    {
        gMapanimEventcall_56,
        gMapanimEventcall_112,
        gMapanimEventcall_168,
    },
    {
        gMapanimEventcall_57,
        gMapanimEventcall_113,
        gMapanimEventcall_169,
    },
    {
        gMapanimEventcall_58,
        gMapanimEventcall_114,
        gMapanimEventcall_170,
    },
    {
        gMapanimEventcall_59,
        gMapanimEventcall_115,
        gMapanimEventcall_171,
    },
    {
        gMapanimEventcall_60,
        gMapanimEventcall_116,
        gMapanimEventcall_172,
    },
    {
        gMapanimEventcall_61,
        gMapanimEventcall_117,
        gMapanimEventcall_173,
    },
    {
        gMapanimEventcall_62,
        gMapanimEventcall_118,
        gMapanimEventcall_174,
    },
    {
        gMapanimEventcall_63,
        gMapanimEventcall_119,
        gMapanimEventcall_175,
    },
    {
        gMapanimEventcall_64,
        gMapanimEventcall_120,
        gMapanimEventcall_176,
    },
    {
        gMapanimEventcall_65,
        gMapanimEventcall_121,
        gMapanimEventcall_177,
    },
    {
        gMapanimEventcall_66,
        gMapanimEventcall_122,
        gMapanimEventcall_178,
    },
};

struct MapAnimfxConf CONST_DATA MapAnimfxConf_MapanimEventcall_2[] =
{
    {
        gMapanimEventcall_67,
        gMapanimEventcall_123,
        gMapanimEventcall_179,
    },
    {
        gMapanimEventcall_68,
        gMapanimEventcall_124,
        gMapanimEventcall_180,
    },
    {
        gMapanimEventcall_69,
        gMapanimEventcall_125,
        gMapanimEventcall_181,
    },
    {
        gMapanimEventcall_70,
        gMapanimEventcall_126,
        gMapanimEventcall_182,
    },
    {
        gMapanimEventcall_71,
        gMapanimEventcall_127,
        gMapanimEventcall_183,
    },
    {
        gMapanimEventcall_72,
        gMapanimEventcall_128,
        gMapanimEventcall_184,
    },
    {
        gMapanimEventcall_73,
        gMapanimEventcall_129,
        gMapanimEventcall_185,
    },
    {
        gMapanimEventcall_74,
        gMapanimEventcall_130,
        gMapanimEventcall_186,
    },
    {
        gMapanimEventcall_75,
        gMapanimEventcall_131,
        gMapanimEventcall_187,
    },
    {
        gMapanimEventcall_76,
        gMapanimEventcall_132,
        gMapanimEventcall_188,
    },
    {
        gMapanimEventcall_77,
        gMapanimEventcall_133,
        gMapanimEventcall_189,
    },
    {
        gMapanimEventcall_78,
        gMapanimEventcall_134,
        gMapanimEventcall_190,
    },
};

CONST_DATA struct ProcCmd ProcScr_MapanimEventcall_0[] =
{
    PROC_SLEEP(1),

    PROC_CALL(MapEventcallFx0_Init),
    PROC_REPEAT(MapEventcallFx0_PlayIntroAnim),

    PROC_SLEEP(30),

    PROC_REPEAT(MapEventcallFx0_PlayMainAnim),
    PROC_REPEAT(MapEventcallFx0_FillWhiteTile),
    PROC_REPEAT(MapEventcallFx0_RampToWhite),

    PROC_CALL(MapEventcallFx0_ClearBg2),

    PROC_END
};

void StartMapEventcallFx0(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapanimEventcall_0, proc);
    else
        Proc_Start(ProcScr_MapanimEventcall_0, PROC_TREE_3);
}

void MapEventcallFx0_Init(struct MAEffectProc * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 1, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 1, 0, 0);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;
}

// clang-format off

const int gMapanimEventcall_0[] =
{
    0x80, 0x1E0,
};

const u8 gMapanimEventcall_1[] =
{
    4, 5,
};

// clang-format on

void MapEventcallFx0_PlayIntroAnim(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_140, proc->xDisplay);
        }
        else if (proc->frame > 19)
        {
            proc->frame = 0;
            proc->timer = 0;
            proc->unk44 = 1;

            SetDispEnable(0, 0, 0, 0, 0);

            Proc_Break(proc);
            return;
        }

        Decompress(
            MapAnimfxConf_MapanimEventcall_0[proc->frame].img,
            (void*) VRAM + gMapanimEventcall_0[proc->unk44] * 0x20);

        Decompress(
            MapAnimfxConf_MapanimEventcall_0[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gMapanimEventcall_0[proc->unk44] | (gMapanimEventcall_1[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(MapAnimfxConf_MapanimEventcall_0[proc->frame].pal, gMapanimEventcall_1[proc->unk44]);
        EnablePaletteSync();

        proc->frame++;
        proc->timer = 3;
        proc->unk44 ^= 1;
    }

    proc->timer--;
}

// clang-format off

const u8 gMapanimEventcall_2[] =
{
    4, 5, 6, 7, 7, 7, 4,
    5, 5, 6, 6, 4, 4, 5,
    5, 3, 4, 3, 4, 3, 4,
    2, 2, 2, 0, 0,
};

// clang-format on

void MapEventcallFx0_PlayMainAnim(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        Decompress(
            MapAnimfxConf_MapanimEventcall_1[proc->frame].img,
            (void*) VRAM + gMapanimEventcall_0[proc->unk44]*0x20);

        Decompress(
            MapAnimfxConf_MapanimEventcall_1[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16 *)gGenericBuffer,
            0, 0,
            gMapanimEventcall_0[proc->unk44] | (gMapanimEventcall_1[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(MapAnimfxConf_MapanimEventcall_1[proc->frame].pal, gMapanimEventcall_1[proc->unk44]);
        EnablePaletteSync();

        if (proc->frame == 0)
        {
            SetDispEnable(0, 0, 1, 0, 0);
        }
        else if (proc->frame > 22)
        {
            Proc_Break(proc);
        }

        proc->timer = gMapanimEventcall_2[proc->frame];
        proc->frame++;
        proc->unk44 ^= 1;
    }

    proc->timer--;
}

void MapEventcallFx0_FillWhiteTile(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        proc->frame = 0;

        CpuFastFill(-1, (void*) VRAM + 0x20 * 0x2FF, 0x20);

        TileMap_FillRect(gBG0TilemapBuffer, 30, 20, TILEREF(0x2FF, 3));
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        PAL_BG_COLOR(3, 15) = 0;
        EnablePaletteSync();

        SetDispEnable(1, 0, 1, 0, 0);

        Proc_Break(proc);
    }
    proc->timer--;
}

void MapEventcallFx0_RampToWhite(struct MAEffectProc * proc)
{
    u16 brightness = proc->frame * 4;

    if (proc->frame < 8)
    {
        PAL_BG_COLOR(3, 15) = RGB(brightness, brightness, brightness);
    }
    else
    {
        PAL_BG_COLOR(3, 15) = RGB(31, 31, 31);
        Proc_Break(proc);
    }

    EnablePaletteSync();
    proc->frame++;
}

void MapEventcallFx0_ClearBg2(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

CONST_DATA struct ProcCmd ProcScr_MapanimEventcall_1[] =
{
    PROC_SLEEP(1),

    PROC_CALL(MapEventcallFx1_Init),
    PROC_REPEAT(MapEventcallFx1_FadeWhiteDown),
    PROC_REPEAT(MapEventcallFx1_PlayFadeAnim),
    PROC_CALL(MapEventcallFx1_ClearBgs),

    PROC_SLEEP(60),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END
};

void StartMapEventcallFx1(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapanimEventcall_1, proc);
    else
        Proc_Start(ProcScr_MapanimEventcall_1, PROC_TREE_3);
}

void MapEventcallFx1_Init(struct MAEffectProc * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(1, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    PAL_BG_COLOR(3, 15) = RGB(31, 31, 31);
    EnablePaletteSync();

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;

    proc->unk48 = 119;
}

void MapEventcallFx1_FadeWhiteDown(struct MAEffectProc * proc)
{
    int brightness = proc->unk48 * 32 / 120;
    PAL_BG_COLOR(3, 15) = RGB(brightness, brightness, brightness);

    EnablePaletteSync();

    proc->unk48--;

    if (proc->unk48 < 31)
        Proc_Break(proc);
}

void MapEventcallFx1_PlayFadeAnim(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame != 0)
        {
            if (proc->frame > 11)
            {
                proc->frame = proc->timer;
                Proc_Break(proc);
                return;
            }
        }
        else
        {
            SetDispEnable(0, 0, 1, 1, 1);
        }

        Decompress(
            MapAnimfxConf_MapanimEventcall_2[proc->frame].img,
            (void*) VRAM + gMapanimEventcall_0[proc->unk44]*0x20);

        Decompress(
            MapAnimfxConf_MapanimEventcall_2[proc->frame].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16*) gGenericBuffer,
            0, 0,
            gMapanimEventcall_0[proc->unk44] | (gMapanimEventcall_1[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        if (proc->unk48 < 0)
        {
            ApplyPalette(MapAnimfxConf_MapanimEventcall_2[proc->frame].pal, gMapanimEventcall_1[proc->unk44]);
            EnablePaletteSync();
        }

        proc->frame_idx = proc->frame;
        proc->frame++;

        proc->timer = 4;

        proc->unk4C = proc->unk44;
        proc->unk44 ^= 1;
    }

    proc->timer--;

    if (proc->unk48 >= 0)
    {
        int i, addedBrightness = proc->unk48 * 32 / 240;

        const u16 * const in  = MapAnimfxConf_MapanimEventcall_2[proc->frame_idx].pal;
        u16 *       const out = &gPaletteBuffer[0x10 * gMapanimEventcall_1[proc->unk4C]];

        for (i = 1; i < 16; ++i)
        {
            u32 r = RED_VALUE(in[i]);
            u32 g = GREEN_VALUE(in[i]);
            u32 b = BLUE_VALUE(in[i]);

            r = r + addedBrightness > 31 ? 31 : r + addedBrightness;
            g = g + addedBrightness > 31 ? 31 : g + addedBrightness;
            b = b + addedBrightness > 31 ? 31 : b + addedBrightness;

            out[i] = RGB(r, g, b);
        }

        EnablePaletteSync();

        proc->unk48--;
    }
}

void MapEventcallFx1_ClearBgs(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT + BG2_SYNC_BIT);
}

void StartMapEventcallFx2(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapanimEventcall_2, proc);
    else
        Proc_Start(ProcScr_MapanimEventcall_2, PROC_TREE_3);
}

void MapEventcallFx2_OnEnd(void)
{
    SetSecondaryHBlankHandler(NULL);
    Proc_EndEach(ProcScr_MapanimEventcall_3);
}

void MapEventcallFx2_Init(struct MAEffectProc * proc)
{
    struct Proc8080050 * vsync;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_2, 0, 0);

    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;

    gUnk_57 = 0;

    vsync = Proc_Start(ProcScr_MapanimEventcall_3, PROC_TREE_VSYNC);

    vsync->unk29 = 0;
    vsync->unk2A = 0;

    SetSecondaryHBlankHandler(MapEventcallFx2_HBlankWobble);
}

// clang-format off

struct MapAnimfxConf CONST_DATA gMapanimEventcall_16[] =
{
    {
        .img = gMapanimEventcall_191,
        .pal = gMapanimEventcall_199,
        .tsa = gMapanimEventcall_207,
    },
    {
        .img = gMapanimEventcall_192,
        .pal = gMapanimEventcall_200,
        .tsa = gMapanimEventcall_208,
    },
    {
        .img = gMapanimEventcall_193,
        .pal = gMapanimEventcall_201,
        .tsa = gMapanimEventcall_209,
    },
    {
        .img = gMapanimEventcall_194,
        .pal = gMapanimEventcall_202,
        .tsa = gMapanimEventcall_210,
    },
    {
        .img = gMapanimEventcall_195,
        .pal = gMapanimEventcall_203,
        .tsa = gMapanimEventcall_211,
    },
    {
        .img = gMapanimEventcall_196,
        .pal = gMapanimEventcall_204,
        .tsa = gMapanimEventcall_212,
    },
    {
        .img = gMapanimEventcall_197,
        .pal = gMapanimEventcall_205,
        .tsa = gMapanimEventcall_213,
    },
    {
        .img = gMapanimEventcall_198,
        .pal = gMapanimEventcall_206,
        .tsa = gMapanimEventcall_214,
    },
};

const u32 gMapanimEventcall_3[] =
{
    0x160, 0x260,
};

const u8 gMapanimEventcall_4[] =
{
    4, 5,
};

const struct Unk082058B4 gMapanimEventcall_5[] =
{
    { 0, 5, 0, },
    { 1, 4, 0, },
    { 2, 4, 0, },
    { 3, 3, 0, },
    { 4, 3, 0, },
    { 5, 2, 1, },
    { 6, 2, 1, },
    { 7, 1, 0, },
};

// clang-format on

void MapEventcallFx2_PlayAnim(struct MAEffectProc* proc)
{
    if (proc->timer == 0)
    {
        struct Proc8080050* vsync;
        u8 v0 = gMapanimEventcall_5[proc->frame].unk00;

        Decompress(
            gMapanimEventcall_16[v0].img,
            (void*) VRAM + gMapanimEventcall_3[proc->unk44] * 0x20);

        Decompress(
            gMapanimEventcall_16[v0].tsa,
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (u16*) gGenericBuffer,
            0, 0,
            gMapanimEventcall_3[proc->unk44] | (gMapanimEventcall_4[proc->unk44] << 12));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        ApplyPalette(
            gMapanimEventcall_16[v0].pal,
            gMapanimEventcall_4[proc->unk44]);

        EnablePaletteSync();

        vsync = (void*) Proc_Find(ProcScr_MapanimEventcall_3);

        vsync->unk29 = 1;
        vsync->unk2A = gMapanimEventcall_5[proc->frame].unk02;

        if (proc->frame == 0)
            PlaySeSpacial(SONG_13F, proc->xDisplay);

        proc->timer = gMapanimEventcall_5[proc->frame].unk01;

        if (proc->frame > 6)
        {
            vsync->unk29 = 1;
            vsync->unk2A = 0;

            proc->frame = 0;

            Proc_Break(proc);
        }
        else
        {
            proc->frame++;
            proc->unk44 ^= 1;
        }
    }

    proc->timer--;
}

//! FE8U = 0x08080288
void MapEventcallFx2_RampToWhite(struct MAEffectProc * proc)
{
    int i;

    if (proc->timer == 0)
    {
        u16 amount = proc->frame * 4;

        if (proc->frame <= 7)
        {
            for (i = 1; i < 16; i++)
            {
                u16 r;
                u16 g;
                u16 b;
                u16 color = PAL_BG_COLOR(gMapanimEventcall_4[proc->unk44], i);

                r = amount + RED_VALUE(color);

                if (r > 31)
                {
                    r = 31;
                }

                g = amount + GREEN_VALUE(color);

                if (g > 31)
                {
                    g = 31;
                }

                b = amount + BLUE_VALUE(color);

                if (b > 31)
                {
                    b = 31;
                }

                PAL_BG_COLOR(gMapanimEventcall_4[proc->unk44], i) = RGB(r, g, b);
            }
        }
        else
        {
            SetBlendTargetA(0, 0, 0, 1, 1);
            SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 16, 16, 16);
            SetDispEnable(0, 0, 0, 1, 1);

            proc->frame = 0;
            Proc_Break(proc);

            return;
        }

        EnablePaletteSync();
        proc->frame++;
    }
    else
    {
        proc->timer--;
    }

    return;
}

//! FE8U = 0x0808038C
void MapEventcallFx2_FadeOutBlend(struct MAEffectProc * proc)
{
    if (proc->frame < 130)
    {
        int bldY = (proc->frame * 16) / 130;
        SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 16, 16, 16 - bldY);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_BRIGHTEN, 16, 16, 0);
        Proc_Break(proc);
    }

    proc->frame++;

    return;
}

//! FE8U = 0x080803D8
void MapEventcallFx2_ClearBgs(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_MapanimEventcall_2[] =
{
    PROC_SET_END_CB(MapEventcallFx2_OnEnd),
    PROC_SLEEP(1),

    PROC_CALL(MapEventcallFx2_Init),
    PROC_REPEAT(MapEventcallFx2_PlayAnim),
    PROC_REPEAT(MapEventcallFx2_RampToWhite),

    PROC_SLEEP(30),

    PROC_REPEAT(MapEventcallFx2_FadeOutBlend),
    PROC_CALL(MapEventcallFx2_ClearBgs),

    PROC_SLEEP(60),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08080408
void MapEventcallFx2_HBlankWobble(void)
{
    u16 vcount;

    if (gUnk_57 == 0)
    {
        return;
    }

    vcount = REG_VCOUNT + 1;

    if (vcount == 228)
    {
        vcount = 0;
    }

    if (vcount < DISPLAY_HEIGHT)
    {
        REG_BG2VOFS = ((vcount >> 1) - vcount) & 0x1FF;
    }

    return;
}

struct Proc89A448C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s8 unk_2a;
};

//! FE8U = 0x0808044C
void MapanimEventcall_VsyncWaveLoop(struct Proc89A448C * proc)
{
    if (proc->unk_29 != 0)
    {
        gUnk_57 = proc->unk_2a;
        proc->unk_29 = 0;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_MapanimEventcall_3[] =
{
    PROC_YIELD,
    PROC_REPEAT(MapanimEventcall_VsyncWaveLoop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08080474
void StartDemonKingSummonAnim(ProcPtr parent)
{

    if (parent != NULL)
    {
        Proc_StartBlocking(gMapanimEventcall_18, parent);
    }
    else
    {
        Proc_Start(gMapanimEventcall_18, PROC_TREE_3);
    }

    return;
}

// clang-format off

struct MapAnimfxConf CONST_DATA gMapanimEventcall_17[] =
{
    {
        .img = gMapanimEventcall_215,
        .pal = gMapanimEventcall_241,
        .tsa = gMapanimEventcall_267,
    },
    {
        .img = gMapanimEventcall_216,
        .pal = gMapanimEventcall_242,
        .tsa = gMapanimEventcall_268,
    },
    {
        .img = gMapanimEventcall_217,
        .pal = gMapanimEventcall_243,
        .tsa = gMapanimEventcall_269,
    },
    {
        .img = gMapanimEventcall_218,
        .pal = gMapanimEventcall_244,
        .tsa = gMapanimEventcall_270,
    },
    {
        .img = gMapanimEventcall_219,
        .pal = gMapanimEventcall_245,
        .tsa = gMapanimEventcall_271,
    },
    {
        .img = gMapanimEventcall_220,
        .pal = gMapanimEventcall_246,
        .tsa = gMapanimEventcall_272,
    },
    {
        .img = gMapanimEventcall_221,
        .pal = gMapanimEventcall_247,
        .tsa = gMapanimEventcall_273,
    },
    {
        .img = gMapanimEventcall_222,
        .pal = gMapanimEventcall_248,
        .tsa = gMapanimEventcall_274,
    },
    {
        .img = gMapanimEventcall_223,
        .pal = gMapanimEventcall_249,
        .tsa = gMapanimEventcall_275,
    },
    {
        .img = gMapanimEventcall_224,
        .pal = gMapanimEventcall_250,
        .tsa = gMapanimEventcall_276,
    },
    {
        .img = gMapanimEventcall_225,
        .pal = gMapanimEventcall_251,
        .tsa = gMapanimEventcall_277,
    },
    {
        .img = gMapanimEventcall_226,
        .pal = gMapanimEventcall_252,
        .tsa = gMapanimEventcall_278,
    },
    {
        .img = gMapanimEventcall_227,
        .pal = gMapanimEventcall_253,
        .tsa = gMapanimEventcall_279,
    },
    {
        .img = gMapanimEventcall_228,
        .pal = gMapanimEventcall_254,
        .tsa = gMapanimEventcall_280,
    },
    {
        .img = gMapanimEventcall_229,
        .pal = gMapanimEventcall_255,
        .tsa = gMapanimEventcall_281,
    },
    {
        .img = gMapanimEventcall_230,
        .pal = gMapanimEventcall_256,
        .tsa = gMapanimEventcall_282,
    },
    {
        .img = gMapanimEventcall_231,
        .pal = gMapanimEventcall_257,
        .tsa = gMapanimEventcall_283,
    },
    {
        .img = gMapanimEventcall_232,
        .pal = gMapanimEventcall_258,
        .tsa = gMapanimEventcall_284,
    },
    {
        .img = gMapanimEventcall_233,
        .pal = gMapanimEventcall_259,
        .tsa = gMapanimEventcall_285,
    },
    {
        .img = gMapanimEventcall_234,
        .pal = gMapanimEventcall_260,
        .tsa = gMapanimEventcall_286,
    },
    {
        .img = gMapanimEventcall_235,
        .pal = gMapanimEventcall_261,
        .tsa = gMapanimEventcall_287,
    },
    {
        .img = gMapanimEventcall_236,
        .pal = gMapanimEventcall_262,
        .tsa = gMapanimEventcall_288,
    },
    {
        .img = gMapanimEventcall_237,
        .pal = gMapanimEventcall_263,
        .tsa = gMapanimEventcall_289,
    },
    {
        .img = gMapanimEventcall_238,
        .pal = gMapanimEventcall_264,
        .tsa = gMapanimEventcall_290,
    },
    {
        .img = gMapanimEventcall_239,
        .pal = gMapanimEventcall_265,
        .tsa = gMapanimEventcall_291,
    },
    {
        .img = gMapanimEventcall_240,
        .pal = gMapanimEventcall_266,
        .tsa = gMapanimEventcall_292,
    },
};

const int gMapanimEventcall_6[] =
{
    0x160, 0x260,
};

const u8 gMapanimEventcall_7[] =
{
    4, 5,
};

// clang-format on

//! FE8U = 0x08080498
void MapanimEventcall_SummonLoadFrameAndPal(int frame, int unk44)
{
    Decompress(gMapanimEventcall_17[frame].img, (void *)(VRAM + gMapanimEventcall_6[unk44] * 0x20));
    Decompress(gMapanimEventcall_17[frame].tsa, gGenericBuffer);
    AddAttr2dBitMap(
        gBG2TilemapBuffer, (u16 *)gGenericBuffer, 0, 0, gMapanimEventcall_6[unk44] | gMapanimEventcall_7[unk44] << 12);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ApplyPalette(gMapanimEventcall_17[frame].pal, gMapanimEventcall_7[unk44]);
    EnablePaletteSync();

    return;
}

//! FE8U = 0x08080530
void MapanimEventcall_SummonLoadFrame(int frame, int unk44)
{
    Decompress(gMapanimEventcall_17[frame].img, (void *)(VRAM + gMapanimEventcall_6[unk44] * 0x20));
    Decompress(gMapanimEventcall_17[frame].tsa, gGenericBuffer);
    AddAttr2dBitMap(
        gBG2TilemapBuffer, (u16 *)gGenericBuffer, 0, 0, gMapanimEventcall_6[unk44] | gMapanimEventcall_7[unk44] << 12);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080805AC
void MapanimEventcall_SummonFadeFramePal(int idxA, int idxB, int val)
{
    s32 i;

    const u16 * src = gMapanimEventcall_17[idxA].pal;
    u16 * dst = PAL_BG(gMapanimEventcall_7[idxB]);

    for (i = 0; i < 16; i++)
    {
        u16 r;
        u16 g;
        u16 b;
        u16 color = src[i];

        r = RED_VALUE(color);
        r += (31 - r) * val / 32;

        g = GREEN_VALUE(color);
        g += (31 - g) * val / 32;

        b = BLUE_VALUE(color);
        b += (31 - b) * val / 32;

        dst[i] = RGB(r, g, b);
    }

    EnablePaletteSync();

    return;
}

struct MAEffectSummonProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ s8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 2E */ s16 unk_2e;
    /* 30 */ s16 unk_30;
    /* 32 */ s16 unk_32;
    /* 34 */ s16 unk_34;
    /* 36 */ s16 unk_36;
    /* 38 */ u8 unk_38;
    /* 3A */ STRUCT_PAD(0x3a, 0x40);
    /* 40 */ u16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u16 unk_44;
    /* 46 */ u16 unk_46;
    /* 48 */ s16 unk_48;
    /* 4A */ s16 unk_4a;
    /* 4C */ STRUCT_PAD(0x4c, 0x50);
    /* 50 */ struct MAEffectSummonProc * unk_50;
};

//! FE8U = 0x08080654
void DemonKingSummonAnim_OnEnd(struct MAEffectProc * proc)
{
    Proc_End((void *)proc->img);
    return;
}

//! FE8U = 0x08080660
void DemonKingSummonAnim_Init(struct MAEffectProc * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.win1_enableBlend = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    SetBlendAlpha(16, 16);

    BG_SetPosition(BG_2, 8, 8);

    proc->img = Proc_Start(gMapanimEventcall_19, proc);
    proc->frame = 0;
    proc->timer = 0;
    proc->unk44 = 0;
    proc->unk46 = 0;

    return;
}

// clang-format off

const u8 gMapanimEventcall_8[] =
{
    0, 1, 2, 3,
};

// clang-format on

//! FE8U = 0x08080730
void DemonKingSummonAnim_PhaseIntro(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        MapanimEventcall_SummonLoadFrameAndPal(gMapanimEventcall_8[proc->frame], proc->unk44);

        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_141, proc->xDisplay);
        }

        proc->frame++;
        proc->timer = 5;

        if (proc->frame > 3)
        {
            proc->frame = 0;
            proc->unk46 = 0;

            proc->unk48 = 0;
            proc->frame_idx = 0;

            proc->xDisplay = gBmSt.camera.x;
            proc->yDisplay = gBmSt.camera.y;

            Proc_Break(proc);
        }

        proc->unk44 ^= 1;
    }

    proc->timer--;

    return;
}

// clang-format off

const u8 gMapanimEventcall_9[] =
{
    4, 5,
};

// clang-format on

//! FE8U = 0x080807C8
void DemonKingSummonAnim_PhaseShakeRamp(struct MAEffectSummonProc * proc)
{
    if (proc->unk_46 == 5)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 0;

        proc->unk_50->unk_34 = 2;
    }
    else if (proc->unk_46 == 8)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 1;

        proc->unk_50->unk_34 = 3;
    }
    else if (proc->unk_46 == 0xb)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 2;

        proc->unk_50->unk_34 = 4;
    }

    if (proc->unk_42 == 0)
    {
        MapanimEventcall_SummonLoadFrameAndPal(gMapanimEventcall_9[proc->unk_40], proc->unk_44);

        proc->unk_40++;
        proc->unk_42 = 4;

        if (proc->unk_46 > 21)
        {
            if (proc->unk_40 > 1)
            {
                proc->unk_40 = 0;
                proc->unk_46 = 0;
                Proc_Break(proc);
            }
        }
        else if (proc->unk_40 > 1)
        {
            proc->unk_40 = 0;
            proc->unk_46++;
        }

        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    return;
}

// clang-format off

const u8 gMapanimEventcall_10[] =
{
     6,  7,  8,  9,
    10, 11, 12, 13,
    14, 15, 16, 17,
};

// clang-format on

//! FE8U = 0x08080890
void DemonKingSummonAnim_PhaseBurst(struct MAEffectSummonProc * proc)
{
    if (proc->unk_42 == 0)
    {
        MapanimEventcall_SummonLoadFrameAndPal(gMapanimEventcall_10[proc->unk_40], proc->unk_44);

        proc->unk_42 = 3;

        if (proc->unk_40 > 10)
        {
            proc->unk_40 = 0;
            proc->unk_46 = 0;

            proc->unk_42--;

            Proc_Break(proc);

            return;
        }

        proc->unk_40++;
        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    return;
}

//! FE8U = 0x08080900
void DemonKingSummonAnim_PhaseFlashWhite(struct MAEffectSummonProc * proc)
{
    int i;

    if (proc->unk_42 == 0)
    {
        u16 amount = proc->unk_40 << 2;

        if (proc->unk_40 < 8)
        {
            for (i = 1; i < 16; i++)
            {
                u16 r;
                u16 g;
                u16 b;

                u16 color = PAL_BG_COLOR(gMapanimEventcall_7[proc->unk_44], i);

                r = amount + RED_VALUE(color);

                if (r > 31)
                {
                    r = 31;
                }

                g = amount + GREEN_VALUE(color);

                if (g > 31)
                {
                    g = 31;
                }

                b = amount + BLUE_VALUE(color);

                if (b > 31)
                {
                    b = 31;
                }

                PAL_BG_COLOR(gMapanimEventcall_7[proc->unk_44], i) = RGB(r, g, b);
            }

            EnablePaletteSync();

            proc->unk_40++;
        }
        else
        {
            proc->unk_40 = 0;
            proc->unk_46 = 0;
            proc->unk_48 = 0;
            proc->unk_4a = -1;

            Proc_Break(proc);

            return;
        }
    }
    else
    {
        proc->unk_42--;
    }

    return;
}

// clang-format off

const u8 gMapanimEventcall_11[] =
{
    18, 19, 20, 21,
};

// clang-format on

//! FE8U = 0x080809D8
void DemonKingSummonAnim_PhaseDissolve(struct MAEffectSummonProc * proc)
{
    s16 tmp = 0x95;

    if (proc->unk_46 == 2)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 1;

        proc->unk_50->unk_34 = 3;
    }
    else if (proc->unk_46 == 3)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 1;

        proc->unk_50->unk_34 = 4;
    }
    else if (proc->unk_46 == 4)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 0;

        proc->unk_50->unk_34 = 3;
    }
    else if (proc->unk_46 == 5)
    {
        proc->unk_50->unk_29 = 1;
        proc->unk_50->unk_2a = 0;

        proc->unk_50->unk_34 = 4;
    }
    else if (proc->unk_46 == 6)
    {
        proc->unk_50->unk_29 = 0;
        proc->unk_50->unk_2a = 0;
    }

    if (proc->unk_42 == 0)
    {
        MapanimEventcall_SummonLoadFrame(gMapanimEventcall_11[proc->unk_40], proc->unk_44);

        proc->unk_4a = proc->unk_40;
        proc->unk_40++;

        proc->unk_42 = 4;

        if (proc->unk_46 >= 11)
        {
            if (proc->unk_40 > 3)
            {
                proc->unk_40 = 0;
                proc->unk_46 = 0;

                Proc_Break(proc);
            }
        }
        else if (proc->unk_40 > 3)
        {
            proc->unk_40 = 0;
            proc->unk_46++;
        }

        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    if (proc->unk_48 <= tmp)
    {
        proc->unk_48++;
    }

    if (proc->unk_4a >= 0)
    {
        MapanimEventcall_SummonFadeFramePal(gMapanimEventcall_11[proc->unk_4a], proc->unk_44, 0x20 - ((proc->unk_48 * 0x20) / 0x96));
    }

    return;
}

const u8 gMapanimEventcall_12[] =
{
    22, 23, 24, 25,
};

//! FE8U = 0x08080B18
void DemonKingSummonAnim_PhaseOutro(struct MAEffectSummonProc * proc)
{
    if (proc->unk_42 == 0)
    {
        MapanimEventcall_SummonLoadFrameAndPal(gMapanimEventcall_12[proc->unk_40], proc->unk_44);

        proc->unk_40++;
        proc->unk_42 = 5;

        if (proc->unk_40 > 3)
        {
            proc->unk_40 = 0;
            proc->unk_46 = 0;
            Proc_Break(proc);
        }

        proc->unk_44 ^= 1;
    }

    proc->unk_42--;

    return;
}

//! FE8U = 0x08080B84
void DemonKingSummonAnim_Cleanup(void)
{
    BG_SetPosition(BG_2, 0, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gMapanimEventcall_18[] =
{
    PROC_SET_END_CB(DemonKingSummonAnim_OnEnd),
    PROC_SLEEP(1),

    PROC_CALL(DemonKingSummonAnim_Init),
    PROC_REPEAT(DemonKingSummonAnim_PhaseIntro),
    PROC_REPEAT(DemonKingSummonAnim_PhaseShakeRamp),
    PROC_REPEAT(DemonKingSummonAnim_PhaseBurst),
    PROC_REPEAT(DemonKingSummonAnim_PhaseFlashWhite),
    PROC_REPEAT(DemonKingSummonAnim_PhaseDissolve),
    PROC_REPEAT(DemonKingSummonAnim_PhaseOutro),
    PROC_CALL(DemonKingSummonAnim_Cleanup),

    PROC_SLEEP(60),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08080BA8
void DemonKingSummonShake_Init(struct MAEffectSummonProc * proc)
{
    proc->unk_29 = 0;
    proc->unk_2a = 0;

    proc->unk_2c = gBmSt.camera.x;
    proc->unk_2e = gBmSt.camera.y;

    proc->unk_30 = 0;
    proc->unk_32 = 0;

    proc->unk_34 = 4;
    proc->unk_36 = 0;

    proc->unk_38 = 0;

    return;
}

// clang-format off

struct Pair
{
    s8 x;
    s8 y;
};

const struct Pair gMapanimEventcall_13[] =
{
    { -1, +0, },
    { +0, +0, },
    { +1, +0, },
    { +0, +0, },
    { +0, -1, },
    { +0, +0, },
    { +0, +1, },
    { +0, +0, },
};

const struct Pair gMapanimEventcall_14[] =
{
    { -1, +0, },
    { +1, +0, },
    { +0, -1, },
    { +0, +1, },
    { -1, +0, },
    { +1, +0, },
    { +0, -1, },
    { +0, +1, },
};

const struct Pair gMapanimEventcall_15[] =
{
    { -2, +0, },
    { +1, +0, },
    { +0, -2, },
    { +0, +1, },
    { -1, +0, },
    { +2, +0, },
    { +0, -1, },
    { +0, +2, },
};

// clang-format on

//! FE8U = 0x08080BD8
void DemonKingSummonShake_Loop(struct MAEffectSummonProc * proc)
{
    int tmp = 8;

    if (proc->unk_29 == 0)
    {
        gBmSt.camera.x = proc->unk_2c;
        gBmSt.camera.y = proc->unk_2e;

        BG_SetPosition(BG_2, 8, 8);

        return;
    }

    if (proc->unk_36 > 0)
    {
        proc->unk_36--;
        return;
    }

    proc->unk_36 = proc->unk_34;

    switch (proc->unk_2a)
    {
        case 0:
            proc->unk_30 = gMapanimEventcall_13[proc->unk_38].x;
            proc->unk_32 = gMapanimEventcall_13[proc->unk_38].y;

            break;

        case 1:
            proc->unk_30 = gMapanimEventcall_14[proc->unk_38].x;
            proc->unk_32 = gMapanimEventcall_14[proc->unk_38].y;

            break;

        case 2:
            proc->unk_30 = gMapanimEventcall_15[proc->unk_38].x;
            proc->unk_32 = gMapanimEventcall_15[proc->unk_38].y;

            break;

        default:
            proc->unk_30 = proc->unk_2a * gMapanimEventcall_14[proc->unk_38].x;
            proc->unk_32 = proc->unk_2a * gMapanimEventcall_14[proc->unk_38].y;

            break;
    }

    gBmSt.camera.x = proc->unk_2c + proc->unk_30;
    gBmSt.camera.y = proc->unk_2e + proc->unk_32;

    BG_SetPosition(BG_2, proc->unk_30 + 8, proc->unk_32 + 8);

    proc->unk_38++;

    if (proc->unk_38 >= tmp)
    {
        proc->unk_38 = 0;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gMapanimEventcall_19[] =
{
    PROC_CALL(DemonKingSummonShake_Init),
    PROC_YIELD,

    PROC_REPEAT(DemonKingSummonShake_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0807AD08
void New6C_SummonGfx(ProcPtr parent, int xBase, int yBase)
{
    struct MAEffectProc * proc = Proc_StartBlocking(gMapanimEventcall_21, parent);

    proc->xDisplay = ((xBase - (gBmSt.camera.x >> 4)) * 2 + 1) * 8;
    proc->yDisplay = ((yBase - (gBmSt.camera.y >> 4)) * 2 + 1) * 8;

    return;
}

//! FE8U = 0x08080D6C
void SummonGfxAnim_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();

    BG_SetPosition(BG_2, 0, 0);

    Decompress(gMapanimEventcall_293, (void *)(0x06002C00 + GetBackgroundTileDataOffset(BG_2)));
    ApplyPalette(gMapanimEventcall_294, 4);
    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();

    return;
}

// clang-format off

u8 * CONST_DATA gMapanimEventcall_20[] =
{
    Tsa_Mapeventcall_0,
    Tsa_Mapeventcall_1,
    Tsa_Mapeventcall_2,
    Tsa_Mapeventcall_3,
    Tsa_Mapeventcall_4,
    Tsa_Mapeventcall_5,
    Tsa_Mapeventcall_6,
    Tsa_Mapeventcall_7,
    Tsa_Mapeventcall_8,
    Tsa_Mapeventcall_9,
    Tsa_Mapeventcall_10,
    Tsa_Mapeventcall_11,
    Tsa_Mapeventcall_12,
    Tsa_Mapeventcall_13,
    Tsa_Mapeventcall_14,
    Tsa_Mapeventcall_15,
    Tsa_Mapeventcall_16,
    Tsa_Mapeventcall_17,
};

// clang-format on

//! FE8U = 0x08080DCC
void SummonGfxAnim_Loop(struct MAEffectProc * proc)
{
    s32 exit;

    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_3BF, proc->xDisplay);
            exit = 0;
        }
        else if (proc->frame == 12)
        {
            RefreshEntityBmMaps();
            RefreshUnitSprites();
            exit = 0;
        }
        else if (proc->frame > 17)
        {
            Proc_Break(proc);
            exit = 1;
        }
        else
        {
            exit = 0;
        }

        if (exit)
        {
            return;
        }

        Decompress(gMapanimEventcall_20[proc->frame], gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer, (u16 *)gGenericBuffer, proc->xDisplay / 8 - 4, proc->yDisplay / 8 - 6, 0x00004160);

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }

    proc->timer--;

    return;
}

//! FE8U = 0x08080E84
void SummonGfxAnim_Cleanup(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gMapanimEventcall_21[] =
{
    PROC_SLEEP(1),

    PROC_CALL(SummonGfxAnim_Init),
    PROC_REPEAT(SummonGfxAnim_Loop),
    PROC_CALL(SummonGfxAnim_Cleanup),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08080E9C
void StartSummonUnitRevealAnim(ProcPtr parent, struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_StartBlocking(gMapanimEventcall_22, parent);

    proc->unit = unit;
    proc->xDisplay = (((unit->xPos - (gBmSt.camera.x >> 4)) * 2) + 1) * 8;
    proc->yDisplay = (((unit->yPos - (gBmSt.camera.y >> 4)) * 2) + 1) * 8;

    return;
}

//! FE8U = 0x08080EE4
void SummonUnitGfx_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();

    BG_SetPosition(BG_2, 0, 0);

    Decompress(gMapanimEventcall_293, (void *)(0x06002C00 + GetBackgroundTileDataOffset(BG_2)));
    ApplyPalette(gMapanimEventcall_294, 4);
    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();

    return;
}

//! FE8U = 0x08080F44
void SummonUnitGfx_Loop(struct MAEffectProc * proc)
{
    s32 exit;

    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_3BF, proc->xDisplay);
            exit = 0;
        }
        else if (proc->frame == 12)
        {
            proc->unit->state &= ~US_HIDDEN;
            RefreshEntityBmMaps();
            RefreshUnitSprites();
            exit = 0;
        }
        else if (proc->frame > 17)
        {
            Proc_Break(proc);
            exit = 1;
        }
        else
        {
            exit = 0;
        }

        if (exit)
        {
            return;
        }

        Decompress(gMapanimEventcall_20[proc->frame], gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer, (u16 *)gGenericBuffer, proc->xDisplay / 8 - 4, proc->yDisplay / 8 - 6, 0x00004160);

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }

    proc->timer--;

    return;
}

//! FE8U = 0x08081008
void SummonUnitGfx_End(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gMapanimEventcall_22[] =
{
    PROC_SLEEP(1),

    PROC_CALL(SummonUnitGfx_Init),
    PROC_REPEAT(SummonUnitGfx_Loop),
    PROC_CALL(SummonUnitGfx_End),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08081020
void StartGlowingCross(ProcPtr parent, struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_GlowingCross, parent);

    proc->unit = unit;
    proc->xDisplay = (((unit->xPos - (gBmSt.camera.x >> 4)) * 2) + 1) * 8;
    proc->yDisplay = (((unit->yPos - (gBmSt.camera.y >> 4)) * 2) + 1) * 8;

    return;
}

//! FE8U = 0x08081068
void RemoveGlowingCrossDirectly(void)
{
    Proc_EndEach(ProcScr_GlowingCross);
    return;
}

//! FE8U = 0x08081078
void GlowingCross_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(BG_2, 0, 0);

    Decompress(gMapanimEventcall_293, (void *)(0x06002C00 + GetBackgroundTileDataOffset(BG_2)));
    ApplyPalette(gMapanimEventcall_294, 4);
    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();

    return;
}

//! FE8U = 0x08081100
void GlowingCross_Loop(struct MAEffectProc * proc)
{
    s32 exit;

    if (proc->timer == 0)
    {
        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_3BF, proc->xDisplay);
            exit = FALSE;
        }
        else if (proc->frame > 9)
        {
            Proc_Break(proc);
            exit = TRUE;
        }
        else
        {
            exit = FALSE;
        }

        if (exit)
        {
            return;
        }

        Decompress(gMapanimEventcall_20[proc->frame], gGenericBuffer);
        AddAttr2dBitMap(
            gBG2TilemapBuffer, (u16 *)gGenericBuffer, proc->xDisplay / 8 - 4, proc->yDisplay / 8 - 6, 0x00004160);
        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }

    proc->timer--;

    return;
}

//! FE8U = 0x080811AC
void GlowingCross_OnEnd(void)
{
    DeleteAllPaletteAnimator();
    SetWinEnable(0, 0, 0);
    return;
}


// clang-format off

struct ProcCmd CONST_DATA ProcScr_GlowingCross[] =
{
    PROC_SLEEP(1),
    PROC_SET_END_CB(GlowingCross_OnEnd),

    PROC_CALL(GlowingCross_Init),
    PROC_REPEAT(GlowingCross_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080811D0
void RemoveGlowingCrossDirectlyWithAnim(ProcPtr parent, int timer)
{
    struct MAEffectProc * proc = Proc_StartBlocking(ProcScr_GlowCrossExit, parent);
    proc->timer = timer;
    return;
}

//! FE8U = 0x080811EC
void GlowCrossExit_Init(struct MAEffectProc * proc)
{
    SetBlendAlpha(16, 16);
    proc->frame = 0;
    return;
}

//! FE8U = 0x08081208
void GlowCrossExit_Loop(struct MAEffectProc * proc)
{
    proc->frame++;

    if (proc->frame < proc->timer)
    {
        SetBlendAlpha(16 - (proc->frame * 16) / proc->timer, 16);
    }
    else
    {
        SetBlendAlpha(0, 16);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808125C
void Nop_MapanimEventcall_0(void)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_GlowCrossExit[] =
{
    PROC_SLEEP(1),

    PROC_CALL(GlowCrossExit_Init),
    PROC_REPEAT(GlowCrossExit_Loop),
    PROC_CALL(Nop_MapanimEventcall_0),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END,
};

const u8 gUnused_MapanimEventcall_0[] =
{
    0, 0, 0, 0,
    0x50, 0, 0, 0,
    0x8A, 0, 0, 0,
};

// clang-format on
