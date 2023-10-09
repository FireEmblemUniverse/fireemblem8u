#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"

void OpAnimInit(struct ProcOpAnim * proc)
{
    Sound_FadeOutBGM(1);
    SetupBackgrounds(0);
    SetPrimaryHBlankHandler(NULL);

    proc->timer = 0;
    gOpAnimSt.pal = 0;
    gLCDControlBuffer.dispcnt.obj1dMap = 1;
    SetDispEnable(0, 0, 0, 0, 0);

    Decompress(gUnknown_08AF1AE8, OBJ_VRAM0 + 0x0000);
    Decompress(gUnknown_08AF1B38, OBJ_VRAM0 + 0x0100);
    Decompress(gUnknown_08AF1FD0, OBJ_VRAM0 + 0x08C0);
    Decompress(gUnknown_08AF2654, OBJ_VRAM0 + 0x1140);

    CopyToPalOpAnim(gUnknown_08AF1B18, 0x200, 0x20);
    CopyToPalOpAnim(gUnknown_08AF1FB0, 0x220, 0x20);
    CopyToPalOpAnim(gUnknown_08AF2634, 0x240, 0x20);
    CopyToPalOpAnim(gUnknown_08AF310C, 0x260, 0x20);

    CpuFastFill16(-1, OBJ_VRAM0 + 0x7800, 0x800);
    SetNextGameActionId(GAME_ACTION_3);
    NewOpAnimfxTerminator(proc);
}

void OpAnimAllBlack(struct ProcOpAnimFadeIn * proc)
{
    gLCDControlBuffer.bldcnt.effect = 0x2;
    gLCDControlBuffer.blendY = 0;
    SetBlendTargetA(1, 1, 1, 1, 1);
    proc->cur = 0;
}

void OpAnimFadeInMain(struct ProcOpAnimFadeIn * proc)
{
    gLCDControlBuffer.blendY = Interpolate(
        INTERPOLATE_LINEAR,
        0, 0x10,
        proc->cur,
        proc->max);

    if (proc->cur == proc->max)
        Proc_Break(proc);

    proc->cur++;
}

CONST_DATA struct ProcCmd ProcScr_OpAnimFadeIn[] = {
    PROC_YIELD,
    PROC_CALL(OpAnimAllBlack),
    PROC_REPEAT(OpAnimFadeInMain),
    PROC_END
};

void NewProcOpAnimFadeIn(int max, ProcPtr parent)
{
    struct ProcOpAnimFadeIn * proc;
    proc = Proc_Start(ProcScr_OpAnimFadeIn, parent);
    proc->max = max;
}

void BgAffineSetOpAnim(int scaling_radio, int angle)
{
    struct BgAffineSrcData data;
    data.texX = 0x10000;
    data.texY = 0x10000;
    data.scrX = 0x78;
    data.scrY = 0x50;
    data.sx = scaling_radio;
    data.sy = scaling_radio;
    data.alpha = angle << 8;

    BgAffineSet(&data, &gOpAnimBgAffineDstData, 1);
}

void SetupOpAnimWorldMapfx(struct ProcOpAnim * proc)
{
    int i;
    u16 * vram;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundTileDataOffset(BG_0, 0x0000);
    SetBackgroundTileDataOffset(BG_1, 0x4000);
    SetBackgroundTileDataOffset(BG_2, 0x8000);
    SetBackgroundTileDataOffset(BG_3, 0x0000);

    SetBackgroundMapDataOffset(BG_0, 0xD800);
    SetBackgroundMapDataOffset(BG_1, 0xE800);
    SetBackgroundMapDataOffset(BG_2, 0xF000);
    SetBackgroundMapDataOffset(BG_3, 0xF800);

    SetBackgroundScreenSize(BG_0, 0);
    SetBackgroundScreenSize(BG_1, 0);
    SetBackgroundScreenSize(BG_2, 0);
    SetBackgroundScreenSize(BG_3, 0);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetWinEnable(0, 0, 0);

    Decompress(Img_OpAnimWorldMap, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_2));
    Decompress(Tsa_OpAnimWorldMap, (void *)BG_VRAM + 0xF000);
    CpuFastFill16(0, gPaletteBuffer, 0x20);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    Decompress(img_08AB632C, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_1));
    ApplyPaletteOpAnim(pal_08AB7DB0, 2);

    vram = (void *)BG_VRAM + 0xE800;
    Decompress(img_08AB7AC0, vram);

    for (i = 0; i < 0x400;)
    {
        *vram += 0x2000;
        i = i + 1;
        vram = vram + 1;
    }

    EnablePaletteSync();
    SetSpecialColorEffectsParameters(0x1, 0x0, 0x10, 0x8);
    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendTargetB(1, 1, 1, 1, 0);

    proc->timer = 0;
    proc->unk34 = 0;
    proc->unk36 = 0;

    SetDispEnable(0, 0, 1, 0, 1);
    StartBgmExt(0x1, 0, NULL);
}

void OpAnimBldAlphaInit(struct ProcOpAnimBLDALPHA * proc)
{
    proc->timer = 0;
}

void OpAnimBldAlphaUpdateBgPalette(struct ProcOpAnimBLDALPHA * proc)
{
    u16 * pal;
    int i, ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1F, proc->timer, 0x3E);

    int color = ret;
    int b = ret << 10;
    int g = ret << 5;

    color = b | g | color;

    for (i = 0; i < 0x10; i++)
        gPaletteBuffer[i] = color;

    EnablePaletteSync();

    if (proc->timer == 0x3E)
    {
        proc->timer = 0;
        gOpAnimSt.pal = 0x7FFF;
        SetBlendTargetA(0, 0, 0, 0, 1);
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void OpAnimBldAlphaDelay(struct ProcOpAnimBLDALPHA * proc)
{
    if (proc->timer == 8)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void OpAnimBldAlphaMain(struct ProcOpAnimBLDALPHA * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0x0, proc->timer, 0x10);
    gLCDControlBuffer.blendCoeffA = ret;
    gLCDControlBuffer.blendCoeffB = 0x10 - ret;

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

CONST_DATA struct ProcCmd ProcScr_OpAnimBLDALPHA[] = {
    PROC_CALL(OpAnimBldAlphaInit),
    PROC_REPEAT(OpAnimBldAlphaUpdateBgPalette),
    PROC_REPEAT(OpAnimBldAlphaDelay),
    PROC_REPEAT(OpAnimBldAlphaMain),
    PROC_END,
};

bool OpAnimBldAlphaExists(void)
{
    return Proc_Find(ProcScr_OpAnimBLDALPHA) ? true : false;
}

void OpAnimUpdateScreen1(struct ProcOpAnim * proc)
{
    SetSpecialColorEffectsParameters(1, 8, 0x10, 8);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);
    SetDispEnable(0, 1, 1, 0, 1);
    proc->unk2C = 0;
    proc->unk2E = 0;
}

void sub_80C6F70(struct ProcOpAnim * proc)
{
    if (!(proc->timer & 1))
        proc->unk2C++;

    if (!(proc->timer & 3))
        proc->unk2E++;

    BG_SetPosition(BG_1, proc->unk2C, proc->unk2E);

    if (proc->timer <= 0x60)
    {
        int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x60);
        ApplyPaletteOpAnim(pal_08AB630C, 0);
        sub_80C69B0(PAL_BG(0), 0x7FFF, ret);
    }

    if ((u32)(proc->timer - 0x80) <= 0x60)
    {
        int ret = Interpolate(INTERPOLATE_LINEAR, 8, 0, proc->timer - 0x80, 0x60);
        gLCDControlBuffer.blendCoeffA = ret;
    }

    if (proc->timer == 0xEF)
    {
        SetDispEnable(0, 0, 1, 0, 1);
        NewProcOpAnimFadeIn(0x20, proc);
    }

    if (proc->timer == 0x110)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void sub_80C7050(struct ProcOpAnim * proc)
{
    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundTileDataOffset(BG_0, 0x0000);
    SetBackgroundTileDataOffset(BG_1, 0x0000);
    SetBackgroundTileDataOffset(BG_2, 0x4000);
    SetBackgroundTileDataOffset(BG_3, 0x4000);

    SetBackgroundMapDataOffset(BG_0, 0xD800);
    SetBackgroundMapDataOffset(BG_1, 0xE000);
    SetBackgroundMapDataOffset(BG_2, 0xE800);
    SetBackgroundMapDataOffset(BG_3, 0xF800);

    SetBackgroundScreenSize(BG_0, 0);
    SetBackgroundScreenSize(BG_1, 0);
    SetBackgroundScreenSize(BG_2, 0);
    SetBackgroundScreenSize(BG_3, 0);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDispEnable(0, 0, 0, 0, 0);
    SetWinEnable(0, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetSpecialColorEffectsParameters(1, 8, 8, 8);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 0);

    proc->timer = 0;
    proc->unk38 = 0;
    proc->unk3A = 0;
    proc->unk3C = 0;
    proc->unk46 = 0;
    proc->unk3E = 0;
}

void Proc08AA6D04Main(void)
{
    gOpAnimSt.unk08 = gOpAnimSt.y;
    gOpAnimSt.unk0A = gOpAnimSt.unk06;
}

CONST_DATA struct ProcCmd ProcScr_08AA6D04[] = {
    PROC_REPEAT(Proc08AA6D04Main),
    PROC_END
};

void NewProc08AA6D04(void)
{
    Proc_Start(ProcScr_08AA6D04, PROC_TREE_VSYNC);
}

void EndProc08AA6D04(void)
{
    Proc_EndEach(ProcScr_08AA6D04);
}

CONST_DATA u8 * imgs_08AA6D14[100] = {
    img_opanim1,
    img_opanim2,
    img_opanim3,
    img_opanim4,
    img_opanim5,
    img_opanim6,
    img_opanim7,
    img_opanim8,
    img_opanim9,
    img_opanim10,
    img_opanim11,
    img_opanim12,
    img_opanim13,
    img_opanim14,
    img_opanim15,
    img_opanim16,
    img_opanim17,
    img_opanim18,
    img_opanim19,
    img_opanim20,
    img_opanim21,
    img_opanim22,
    img_opanim23,
    img_opanim24,
    img_opanim25,
    img_opanim26,
    img_opanim27,
    img_opanim28,
    img_opanim29,
    img_opanim30,
    img_opanim31,
    img_opanim32,
    img_opanim33,
    img_opanim34,
    img_opanim35,
    img_opanim36,
    img_opanim37,
    img_opanim38,
    img_opanim39,
    img_opanim40,
    img_opanim41,
    img_opanim42,
    img_opanim43,
    img_opanim44,
    img_opanim45,
    img_opanim46,
    img_opanim47,
    img_opanim48,
    img_opanim49,
    img_opanim50,
    img_opanim51,
    img_opanim52,
    img_opanim53,
    img_opanim54,
    img_opanim55,
    img_opanim56,
    img_opanim57,
    img_opanim58,
    img_opanim59,
    img_opanim60,
    img_opanim61,
    img_opanim62,
    img_opanim63,
    img_opanim64,
    img_opanim65,
    img_opanim66,
    img_opanim67,
    img_opanim68,
    img_opanim69,
    img_opanim70,
    img_opanim71,
    img_opanim72,
    img_opanim73,
    img_opanim74,
    img_opanim75,
    img_opanim76,
    img_opanim77,
    img_opanim78,
    img_opanim79,
    img_opanim80,
    img_opanim81,
    img_opanim82,
    img_opanim83,
    img_opanim84,
    img_opanim85,
    img_opanim86,
    img_opanim87,
    img_opanim88,
    img_opanim89,
    img_opanim90,
    img_opanim91,
    img_opanim92,
    img_opanim93,
    img_opanim94,
    img_opanim95,
    img_opanim96,
    img_opanim97,
    img_opanim98,
    img_opanim99,
    img_opanim100,
};

CONST_DATA u16 * tsas_08AA6EA4[100] = {
    tsa_opanim1,
    tsa_opanim2,
    tsa_opanim3,
    tsa_opanim4,
    tsa_opanim5,
    tsa_opanim6,
    tsa_opanim7,
    tsa_opanim8,
    tsa_opanim9,
    tsa_opanim10,
    tsa_opanim11,
    tsa_opanim12,
    tsa_opanim13,
    tsa_opanim14,
    tsa_opanim15,
    tsa_opanim16,
    tsa_opanim17,
    tsa_opanim18,
    tsa_opanim19,
    tsa_opanim20,
    tsa_opanim21,
    tsa_opanim22,
    tsa_opanim23,
    tsa_opanim24,
    tsa_opanim25,
    tsa_opanim26,
    tsa_opanim27,
    tsa_opanim28,
    tsa_opanim29,
    tsa_opanim30,
    tsa_opanim31,
    tsa_opanim32,
    tsa_opanim33,
    tsa_opanim34,
    tsa_opanim35,
    tsa_opanim36,
    tsa_opanim37,
    tsa_opanim38,
    tsa_opanim39,
    tsa_opanim40,
    tsa_opanim41,
    tsa_opanim42,
    tsa_opanim43,
    tsa_opanim44,
    tsa_opanim45,
    tsa_opanim46,
    tsa_opanim47,
    tsa_opanim48,
    tsa_opanim49,
    tsa_opanim50,
    tsa_opanim51,
    tsa_opanim52,
    tsa_opanim53,
    tsa_opanim54,
    tsa_opanim55,
    tsa_opanim56,
    tsa_opanim57,
    tsa_opanim58,
    tsa_opanim59,
    tsa_opanim60,
    tsa_opanim61,
    tsa_opanim62,
    tsa_opanim63,
    tsa_opanim64,
    tsa_opanim65,
    tsa_opanim66,
    tsa_opanim67,
    tsa_opanim68,
    tsa_opanim69,
    tsa_opanim70,
    tsa_opanim71,
    tsa_opanim72,
    tsa_opanim73,
    tsa_opanim74,
    tsa_opanim75,
    tsa_opanim76,
    tsa_opanim77,
    tsa_opanim78,
    tsa_opanim79,
    tsa_opanim80,
    tsa_opanim81,
    tsa_opanim82,
    tsa_opanim83,
    tsa_opanim84,
    tsa_opanim85,
    tsa_opanim86,
    tsa_opanim87,
    tsa_opanim88,
    tsa_opanim89,
    tsa_opanim90,
    tsa_opanim91,
    tsa_opanim92,
    tsa_opanim93,
    tsa_opanim94,
    tsa_opanim95,
    tsa_opanim96,
    tsa_opanim97,
    tsa_opanim98,
    tsa_opanim99,
    tsa_opanim100,
};

void OpAnim1_UpdateScrollOneLine(s16 index)
{
    int i;
    s16 _index;
    u16 * tsa, * vram = (void *)BG_VRAM + 0xE800;

    if (index < 0 || index > 99)
        return;

    vram = ((~index & 0x1F) << 6) + (void *)vram;
    _index = 99 - index;

    Decompress(imgs_08AA6D14[_index], (void *)BG_VRAM + 0x8000 + 0x400 * DivRem(_index, 0x16));

    tsa = tsas_08AA6EA4[_index];
    for (i = 0; i < 0x1E;)
    {
        *vram = (*tsa & 0xFC00) | (32 * DivRem(_index, 0x16) + i);
        i++;
        vram++;
        tsa++;
    }
}

void OpAnim1_UpdateScroll(int new, int old)
{
    int i;
    for (i = (old >> 3) + 0x15; i < ((new >> 3) + 0x15); i++)
        OpAnim1_UpdateScrollOneLine(i);

    BG_SetPosition(2, 0, 0x60 - new);
}

void sub_80C72A4(u8 type)
{
    SetDefaultColorEffects();

    if (type == 0)
    {
        SetDispEnable(0, 0, 1, 0, 0);
    }
    else
    {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        SetDispEnable(1, 0, 0, 0, 0);

        SetBackgroundTileDataOffset(BG_1, 0x4000);
        SetBackgroundMapDataOffset(BG_1, 0xF000);

        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 0, 0);

        ApplyPalettesOpAnim(pal_08AF47F0, 8, 4);

        BG_SetPosition(BG_1, 0, 0);
        SetWinEnable(0, 0, 0);
    }

    SetBackgroundTileDataOffset(BG_2, 0x8000);
    SetBackgroundMapDataOffset(BG_2, 0xE800);
    ApplyPalettesOpAnim(pal_08B103D8, 0, 8);
}

void OpAnimPreparefxEphraim(struct ProcOpAnim * proc)
{
    int i;
    u16 * dst;

    switch (proc->timer) {
    case 0:
        Decompress(Img_08AB7DD0, (void *)BG_VRAM + 0x2000 + GetBackgroundTileDataOffset(BG_3));
        Decompress(gUnknown_08AB87E0, gBG3TilemapBuffer);

        for (i = 1; i < 0x10; ++i)
            gPaletteBuffer[0xe0 + i] = RGB_WHITE;

        for (i = 0; i < 0x280; ++i)
            gBG3TilemapBuffer[i] += 0xe100;

        BG_EnableSyncByMask(BG3_SYNC_BIT);
        break;

    case 1:
        Decompress(Img_OpAnimEphraimClose1, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_0));
        Decompress(Tsa_OpAnimEphraimClose, gGenericBuffer);
        break;

    case 2:
        Decompress(Img_OpAnimEphraimClose2, (void *)BG_VRAM + 0x2000 + GetBackgroundTileDataOffset(BG_0));
        Decompress(Tsa_OpAnimEphraimClose2, gGenericBuffer + 0x800);
        break;

    case 3:
        Decompress(Img_OpAnimEphraim, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_2));
        Decompress(Tsa_OpAnimEphraim, gGenericBuffer + 0x1000);
        ApplyPalettesOpAnim(Pal_OpAnimEphraimBlur, 0, 11);
        break;

    case 4:
        Decompress(Img_OpAnimEphraimBlur3, (void *)BG_VRAM + 0x8000);
        Decompress(Tsa_OpAnimEphraimBlur3, (void *)BG_VRAM + 0xC000);
        break;

    case 5:
    {
        Decompress(Img_OpAnimEphraimBlur2, (void *)BG_VRAM + 0xA000);
        Decompress(Tsa_OpAnimEphraimBlur2, (void *)BG_VRAM + 0xC800);

        dst = (void *)BG_VRAM + 0xC800;
        for (i = 0; i < 0x280; ++i)
            dst[i] += 0x100;

        break;
    }
    case 6:
    {
        for (i = 1; i < 0x10; ++i)
            gPaletteBuffer[0xf0 + i] = RGB_BLACK;

        CpuFastCopy((u16 *)(gGenericBuffer + 0x1000), (u16 *)(gGenericBuffer + 0x1000) + 0x800 / 2, 0x800);
        dst = (u16 *)(gGenericBuffer + 0x1000) + 0x400;
        for (i = 0; i < 0x280; ++i)
            dst[i] = (dst[i] & 0xFFF) | 0xF000;

        CpuFastCopy(dst, (void *)BG_VRAM + 0xF000, 0x500);
        EnablePaletteSync();
        SetDispEnable(0, 1, 1, 1, 1);

        proc->timer = 0;
        proc->unk30 = 0;
        proc->unk32 = 0;

        gOpAnimSt.x = 0;
        gOpAnimSt.y = 0;
        gOpAnimSt.unk04 = 0;
        gOpAnimSt.unk06 = 0xA0;
        gOpAnimSt.pal = 0;
        SetBackgroundTileDataOffset(BG_2, 0x8000);
        Proc_Break(proc);
        return;
    }
    default:
        break;
    }
    proc->timer++;
}

void OpAnimMergeBGProcInit(struct Proc08AA7034 * proc)
{
    proc->timer = 0;
}

void OpAnimMergeBGProcUpdateBgPalette(struct Proc08AA7034 * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x20);
    ApplyPaletteOpAnim(Pal_08AB8CAC, 14);
    sub_80C69B0(PAL_BG(14), 0x7FFF, ret);

    if (proc->timer == 0x20)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
    proc->timer++;
}

CONST_DATA struct ProcCmd ProcScr_OpAnimMergeBG[] = {
    PROC_CALL(OpAnimMergeBGProcInit),
    PROC_REPEAT(OpAnimMergeBGProcUpdateBgPalette),
    PROC_END
};

void OpAnimDrawSplitLine(int xOam1, int yOam0)
{
    int i;
    for (i = 0; i < 8; i++)
        PutSpriteExt(0, i << 5, yOam0, gObject_32x8, 4);

    for (i = 0; i < 8; i++)
        PutSpriteExt(0, xOam1, i << 5, gObject_8x32, 0);
}

void OpAnimEphraimfxFlyIn(struct ProcOpAnim * proc)
{
    int val, ret;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->timer <= 0x10)
    {
        ret = Interpolate(4, 0, 0x80, proc->timer, 0x10);
        switch (proc->timer) {
        case 12:
            TsaModifyFirstPalMaybe(ret, 0, 0x88, BG_2, (void *)BG_VRAM + 0xC800, NULL, 0);
            break;

        case 13:
            Decompress(Img_OpAnimEphraimBlur1, (void *)BG_VRAM + 0x8000);
            TsaModifyFirstPalMaybe(ret, proc->unk30, 0x88, BG_2, (void *)BG_VRAM + 0xC800, NULL, 0);
            break;

        case 14:
            Decompress(Tsa_OpAnimEphraimBlur1, (void *)BG_VRAM + 0xC000);
            TsaModifyFirstPalMaybe(ret, 0, 0x88, BG_2, (void *)BG_VRAM + 0xC000, NULL, 0);
            break;

        case 15:
        default:
            TsaModifyFirstPalMaybe(ret, proc->unk30, 0x88, BG_2, (void *)BG_VRAM + 0xC000, NULL, 0);
            break;

        case 16:
            TsaModifyFirstPalMaybe(ret, 0, 0x88, BG_2, (void *)(gGenericBuffer + 0x1000), NULL, 0);
            SetBackgroundTileDataOffset(BG_2, 0x4000);
            Proc_Start(ProcScr_OpAnimMergeBG, proc);
            break;
        }
        proc->unk30 = ret;
    }

    val = (proc->timer - 5);
    if (val >= 0)
    {
        ret = Interpolate(4, 0, 0x90, val, 0x10);
        sub_80C689C(ret, proc->unk32, 0xC8, BG_1, (u16 *)(gGenericBuffer), (u16 *)(gGenericBuffer + 0x800), 1);
        proc->unk32 = ret;

        if (val == 0x10)
        {
            sub_80C689C(proc->unk32, 0, 0xC8, BG_0, (u16 *)(gGenericBuffer), (u16 *)(gGenericBuffer + 0x800), 0);
            proc->timer = 0;
            Proc_Break(proc);
            return;
        }
    }
    proc->timer++;
}

void OpAnimHBlank1(void)
{
    u16 vcount = REG_VCOUNT;
    u16 _vcount = vcount - 1;

    if (_vcount > 0x9F)
    {
        REG_BG2CNT = (REG_BG2CNT & 0xC0FF) | 0x1E00;
        REG_BLDCNT = 0xC46;
    }

    if (vcount == gOpAnimSt.unk08 || gOpAnimSt.unk08 == 0)
    {
        REG_BG2CNT = (REG_BG2CNT & 0xC0FF) | 0x1D00;
        REG_BLDCNT = 0xC42;
    }
}

void OpAnimHBlank2(void)
{
    u16 vcount = REG_VCOUNT;
    u16 _vcount = vcount - 1;

    if (_vcount > 0x9F)
        REG_BLDCNT = 0xC46;

    if (vcount == gOpAnimSt.unk0A)
        REG_BLDCNT = 0xCCF;
}

void sub_80C7900(struct ProcOpAnim * proc)
{
    SetPrimaryHBlankHandler(OpAnimHBlank1);

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWin1Layers(1, 1, 0, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);
    SetDispEnable(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWin0Box(0, 0, gOpAnimSt.x, 0xA0);

    SetBackgroundMapDataOffset(BG_2, 0xF000);
    SetBlendTargetA(0, 1, 1, 0, 0);
    Proc_Break(proc);
}

void OpAnim1AdvanceSplitLine(struct ProcOpAnim * proc)
{
    int x, y;

    gOpAnimSt.x =
        Interpolate(4, 0, 0xF0, proc->timer, 0x10);

    gOpAnimSt.y =
        Interpolate(4, 0, 0xA0, proc->timer, 0x10);

    SetWin0Box(0, 0, gOpAnimSt.x, 0xA0);

    x = gOpAnimSt.x;
    y = gOpAnimSt.y;

    if (x > 0xE8)
        x = 0xE8;

    if (y > 0x88)
        y = 0x88;

    OpAnimDrawSplitLine(x, y);

    if (proc->timer == 0x10)
    {
        SetPrimaryHBlankHandler(OpAnimHBlank2);
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
    proc->timer++;
}

void OpAnimEphraimMergeShadow(struct ProcOpAnim * proc)
{
    gOpAnimSt.unk06 =
        Interpolate(4, 0xA0, 0x78, proc->timer, 0x10);

    OpAnimDrawSplitLine(0xE8, 0x88);

    if (proc->timer > 0xE)
        PutSpriteExt(1, 0x98, 0x88, Obj_08AA6BFA, 0x2046);

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
    proc->timer++;
}

void OpAnimEphraimDisplayName(struct ProcOpAnim * proc)
{
    int i;

    OpAnimDrawSplitLine(0xE8, 0x88);
    PutSpriteExt(1, 0x98, 0x88, Obj_08AA6BFA, 0x205A);

    if (proc->timer == 0x38)
    {
        proc->timer = 0;
        proc->unk34 = proc->unk30;
        proc->unk36 = proc->unk32;

        SetDispEnable(1, 0, 1, 1, 1);

        for (i = 0; i < 0x280; ++i)
            gBG2TilemapBuffer[i] = (gBG2TilemapBuffer[i] & 0x7FFF) | 0xF000;

        Proc_Break(proc);
        return;
    }
    proc->timer++;
}

/* WIP */
#if 0
void OpAnimEphraimExit(struct ProcOpAnim * proc)
{
    BG_EnableSyncByMask(BG2_SYNC_BIT | BG0_SYNC_BIT);

    if (proc->timer < 1)
        PutSpriteExt(1, 0x98, 0x88, Obj_08AA6BFA, 0x2046);

    if (proc->timer < 0x10)
    {
        gOpAnimSt.unk06 =
            Interpolate(1, 0x78, 0xA0, proc->timer, 0x10);
    }
}
#endif
