#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

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

    Decompress(Img_OpAnimSplitLine, OBJ_VRAM0 + 0x0000);
    Decompress(Img_opanim_unk1, OBJ_VRAM0 + 0x0100);
    Decompress(Img_OpAnimEphEirikaName, OBJ_VRAM0 + 0x08C0);
    Decompress(Img_OpAnimDivlEye, OBJ_VRAM0 + 0x1140);

    CopyToPalOpAnim(Pal_OpAnimSplitLine, 0x200, 0x20);
    CopyToPalOpAnim(Pal_opanim_unk1, 0x220, 0x20);
    CopyToPalOpAnim(Pal_OpAnimEphEirikaName, 0x240, 0x20);
    CopyToPalOpAnim(Pal_OpAnimDivlEye, 0x260, 0x20);

    CpuFastFill16(-1, OBJ_VRAM0 + 0x7800, 0x800);
    SetNextGameActionId(GAME_ACTION_PLAYED_THROUGH);
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

    BgAffineSet(&data, &gLCDControlBuffer.bg2affin, 1);
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

    Decompress(Img_OpAnimWorldMapFog, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_1));
    ApplyPaletteOpAnim(Pal_OpAnimWorldMapFog, 2);

    vram = (void *)BG_VRAM + 0xE800;
    Decompress(Tsa_OpAnimWorldMapFog, vram);

    for (i = 0; i < 0x400;)
    {
        *vram += 0x2000;
        i = i + 1;
        vram = vram + 1;
    }

    EnablePaletteSync();
    SetBlendConfig(0x1, 0x0, 0x10, 0x8);
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
    SetBlendConfig(1, 8, 0x10, 8);
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

    SetBlendConfig(1, 8, 8, 8);

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

        ApplyPalettesOpAnim(Pal_OpAnimShiningRing, 8, 4);

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
        Decompress(Img_OpAnimCharacterBG, (void *)BG_VRAM + 0x2000 + GetBackgroundTileDataOffset(BG_3));
        Decompress(Tsa_OpAnimCharacterBG, gBG3TilemapBuffer);

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
    ApplyPaletteOpAnim(Pal_OpAnimCharacterBG, 14);
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
        PutSpriteExt(0, i << 5, yOam0, gObject_32x8,
            OAM2_PAL(0) + OAM2_LAYER(0) + OAM2_CHR(0x80 / 0x20));

    for (i = 0; i < 8; i++)
        PutSpriteExt(0, xOam1, i << 5, gObject_8x32,
            OAM2_PAL(0) + OAM2_LAYER(0) + OAM2_CHR(0x0 / 0x20));
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
        PutSpriteExt(1, 0x98, 0x88, Obj_OpAnimEphEirikaName, OAM2_PAL(2) + OAM2_CHR(0x8C0 / 0x20));

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
    PutSpriteExt(1, 0x98, 0x88, Obj_OpAnimEphEirikaName, OAM2_PAL(2) + OAM2_CHR(0xB40 / 0x20));

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

void OpAnimEphraimExit(struct ProcOpAnim * proc)
{
    int time, time1, time2, ret;

    BG_EnableSyncByMask(BG2_SYNC_BIT | BG0_SYNC_BIT);

    if (proc->timer < 2)
        PutSpriteExt(1, 0x98, 0x88, Obj_OpAnimEphEirikaName, 0x2046);

    if (proc->timer < 0x11)
    {
        gOpAnimSt.unk06 =
            Interpolate(1, 0x78, 0xA0, proc->timer, 0x10);

        ret = Interpolate(1, 0xE8, 0x100, proc->timer, 0x10);
        OpAnimDrawSplitLine(ret, gOpAnimSt.unk06 + 0x10);

        if (proc->timer == 0x10)
            SetPrimaryHBlankHandler(NULL);
    }

    time  = proc->timer;
    time1 = time - 4;

    if (time1 >= 0)
    {
        if (time1 <= 0x18)
        {
            ret = Interpolate(1, proc->unk34, 0x170, time1, 0x18);
            TsaModifyFirstPalMaybe(ret, proc->unk30, 0x88, BG_2, (void *)gGenericBuffer + 0x1000, NULL, 1);
            proc->unk30 = ret;
        }

        time2 = -0xB + time;
        if (time2 >= 0)
        {
            if (time1 == 0x18)
            {
                SetBlendTargetA(1, 0, 0, 0, 0);
                SetBlendTargetB(0, 0, 0, 1, 0);
            }

            if (time1 > 0x17)
            {
                ret = Interpolate(0, 0x10, 0, time - 0x1B, 0x8);
                SetBlendConfig(1, ret, 0x10 - ret, 8);
            }
            ret = Interpolate(1, proc->unk36, 0x180, time2, 0x18);
            sub_80C689C(ret, proc->unk32, 0xC8, BG_0, (void *)gGenericBuffer, (void *)(gGenericBuffer + 0x800), 0);
            proc->unk32 = ret;

            if (time2 == 0x18)
            {
                proc->timer = 0;
                Proc_Break(proc);
                return;
            }
        }
    }
    proc->timer++;
}

//! FE8U = 0x080C7CF8
void OpAnimPreparefxEirika(struct ProcOpAnim * proc)
{
    int i;
    u16 * it;

    switch (proc->timer)
    {
        case 0:
            SetDispEnable(0, 0, 0, 1, 1);
            SetWinEnable(0, 0, 0);

            SetBackgroundMapDataOffset(BG_2, 0xe800);

            BG_SetPosition(BG_0, 0, 0);
            BG_SetPosition(BG_1, 0, 0);
            BG_SetPosition(BG_2, 0, 0);

            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);
            BG_Fill(gBG2TilemapBuffer, 0);

            BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

            SetBlendBackdropA(0);
            SetBlendBackdropB(0);
            SetBlendConfig(BLEND_EFFECT_ALPHA, 8, 8, 8);

            SetBlendTargetA(0, 1, 0, 0, 0);
            SetBlendTargetB(0, 0, 1, 1, 0);

            break;

        case 1:
            Decompress(Img_OpAnimEirikaClose1, (void *)(0x6000000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimEirikaClose, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimEirikaClose2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimEirikaClose2, gGenericBuffer + 0x800);

            break;

        case 3:
            Decompress(Img_OpAnimEirika, (void *)(0x6000000 + GetBackgroundTileDataOffset(2)));
            Decompress(Tsa_OpAnimEirika, gGenericBuffer + 0x1000);
            CopyToPalOpAnim(Pal_OpAnimEirikaBlur, 0, 0x160);

            break;

        case 4:
            Decompress(Img_OpAnimEirikaBlur3, (void *)(0x06008000));
            Decompress(Tsa_OpAnimEirikaBlur3, (void *)(0x0600C000));

            break;

        case 5:
            Decompress(Img_OpAnimEirikaBlur2, (void *)(0x0600A000));
            Decompress(Tsa_OpAnimEirikaBlur2, (void *)(0x0600C800));

            it = (void *)0x0600C800;
            for (i = 0; i < 0x280; i++)
            {
                it[i] = it[i] + 0x100;
            }

            break;

        case 6:
            CpuFastSet(gGenericBuffer + 0x1000, gGenericBuffer + 0x1800, 0x200);

            it = (u16 *)(gGenericBuffer + 0x1800);
            for (i = 0; i < 0x280; i++)
            {
                it[i] = (it[i] & 0xFFF) | 0xf000;
            }

            CpuFastSet(it, (void *)0x0600F000, 0x140);
            EnablePaletteSync();

            SetDispEnable(0, 1, 1, 1, 1);

            proc->timer = 0;
            proc->unk30 = 0;
            proc->unk32 = 0;

            gOpAnimSt.x = DISPLAY_WIDTH;
            gOpAnimSt.y = 0;
            gOpAnimSt.unk04 = 0;
            gOpAnimSt.unk06 = DISPLAY_HEIGHT;

            SetBackgroundTileDataOffset(BG_2, 0x8000);

            Proc_Break(proc);

            return;
    }

    proc->timer++;

    return;
}

//! FE8U = 0x080C7F90
void sub_80C7F90(struct ProcOpAnim * proc)
{
    int time;
    int ret;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->timer <= 0x10)
    {
        ret = Interpolate(INTERPOLATE_RSQUARE, 0, 0x68, proc->timer, 0x10);

        switch (proc->timer)
        {
            case 12:
                sub_80C689C(ret, 0, 0x98, 2, (void *)(0x0600C800), 0, 0);

                break;

            case 13:
                Decompress(Img_OpAnimEirikaBlur1, (void *)(0x06008000));
                sub_80C689C(ret, proc->unk30, 0x98, 2, (void *)(0x0600C800), 0, 0);

                break;

            case 14:
                Decompress(Tsa_OpAnimEirikaBlur1, (void *)(0x0600C000));
                sub_80C689C(ret, 0, 0x98, 2, (void *)(0x0600C000), 0, 0);

                break;

            case 15:
            default:
                sub_80C689C(ret, proc->unk30, 0x98, 2, (void *)(0x0600C000), 0, 0);

                break;

            case 16:
                sub_80C689C(ret, 0, 0x98, 2, (u16 *)(gGenericBuffer + 0x1000), 0, 0);
                SetBackgroundTileDataOffset(2, 0x4000);

                break;
        }

        proc->unk30 = ret;
    }

    time = proc->timer - 5;

    if (time >= 0)
    {
        ret = Interpolate(INTERPOLATE_RSQUARE, 0, 0xcc, time, 0x10);
        TsaModifyFirstPalMaybe(ret, proc->unk32, 0xc0, 1, (u16 *)gGenericBuffer, (u16 *)(gGenericBuffer + 0x800), 1);
        proc->unk32 = ret;

        if (time == 0x10)
        {
            TsaModifyFirstPalMaybe(proc->unk32, 0, 0xc0, 0, (u16 *)gGenericBuffer, (u16 *)(gGenericBuffer + 0x800), 0);
            proc->timer = 0;
            Proc_Break(proc);
            return;
        }
    }

    proc->timer++;

    return;
}

//! FE8U = 0x080C8100
void sub_80C8100(struct ProcOpAnim * proc)
{
    SetPrimaryHBlankHandler(OpAnimHBlank1);

    SetWinEnable(1, 0, 0);
    SetDispEnable(1, 1, 1, 1, 1);

    SetWin0Box(gOpAnimSt.x, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetBackgroundMapDataOffset(BG_2, 0xf000);

    SetBlendTargetA(0, 1, 1, 0, 0);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080C8184
void sub_80C8184(struct ProcOpAnim * proc)
{
    int x;
    int y;

    gOpAnimSt.x = Interpolate(INTERPOLATE_RSQUARE, DISPLAY_WIDTH, 0, proc->timer, 0x10);
    gOpAnimSt.y = Interpolate(INTERPOLATE_RSQUARE, 0, DISPLAY_HEIGHT, proc->timer, 0x10);

    SetWin0Box(gOpAnimSt.x, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    x = gOpAnimSt.x;
    y = gOpAnimSt.y;

    if (x < 8)
    {
        x = 8;
    }

    if (y > 0x88)
    {
        y = 0x88;
    }

    OpAnimDrawSplitLine(x, y);

    if (proc->timer == 0x10)
    {
        SetPrimaryHBlankHandler(OpAnimHBlank2);
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8214
void sub_80C8214(struct ProcOpAnim * proc)
{
    gOpAnimSt.unk06 = Interpolate(INTERPOLATE_RSQUARE, DISPLAY_HEIGHT, DISPLAY_WIDTH / 2, proc->timer, 0x10);
    OpAnimDrawSplitLine(8, 0x88);

    if (proc->timer > 0xe)
    {
        PutSpriteExt(1, 8, 0x88, Obj_08AA6C0E, 0x0000206E);
    }

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8278
void sub_80C8278(struct ProcOpAnim * proc)
{
    int i;

    OpAnimDrawSplitLine(8, 0x88);
    PutSpriteExt(1, 8, 0x88, Obj_08AA6C0E, OAM2_CHR(0x7C) + OAM2_PAL(2));

    switch (proc->timer)
    {
        case 0:
            for (i = 0; i < 8; i++)
            {
                OpAnim1_UpdateScrollOneLine(i);
            }

            break;

        case 1:
            for (i = 8; i < 0x10; i++)
            {
                OpAnim1_UpdateScrollOneLine(i);
            }

            break;

        case 2:
            for (i = 0x10; i < 0x16; i++)
            {
                OpAnim1_UpdateScrollOneLine(i);
            }

            break;
    }

    if (proc->timer == 0x38)
    {
        proc->timer = 0;
        proc->unk34 = proc->unk30;
        proc->unk36 = proc->unk32;

        SetDispEnable(1, 0, 1, 1, 1);

        for (i = 0; i < 0x280; i++)
        {
            gBG2TilemapBuffer[i] = (gBG2TilemapBuffer[i] & 0x7FFF) | 0xf000;
        }

        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C835C
void sub_80C835C(struct ProcOpAnim * proc)
{
    int time;
    int time1;
    int time2;
    int ret;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->timer < 2)
    {
        PutSpriteExt(1, 8, 0x88, Obj_08AA6C0E, OAM2_CHR(0x6E) + OAM2_PAL(2));
    }

    if (proc->timer < 0x11)
    {
        gOpAnimSt.unk06 = Interpolate(1, 0x78, 0xa0, proc->timer, 0x10);
        ret = Interpolate(1, 8, 0, proc->timer, 0x10);
        OpAnimDrawSplitLine(ret, 0x10 + gOpAnimSt.unk06);

        if (proc->timer == 0x10)
        {
            SetPrimaryHBlankHandler(NULL);
        }
    }

    time = proc->timer;
    time1 = time - 4;

    if (time1 >= 0)
    {
        if (time1 <= 0x18)
        {
            ret = Interpolate(1, proc->unk34, 0x158, time1, 0x18);
            sub_80C689C(ret, proc->unk30, 0x98, 2, (u16 *)(gGenericBuffer + 0x1000), 0, 1);
            proc->unk30 = ret;
        }

        time2 = time - 0xB;

        if (time2 >= 0)
        {
            if (time1 == 0x18)
            {
                SetBlendTargetA(1, 0, 0, 0, 0);
                SetBlendTargetB(0, 0, 0, 1, 0);
            }

            if (time1 > 0x17)
            {
                ret = Interpolate(0, 0x10, 0, time - 0x1b, 8);
                SetBlendConfig(1, ret, 16 - ret, 8);
            }

            ret = Interpolate(1, proc->unk36, 0x1bc, time2, 0x18);
            TsaModifyFirstPalMaybe(
                ret, proc->unk32, 0xc0, 0, (u16 *)gGenericBuffer, (u16 *)(gGenericBuffer + 0x800), 0);
            proc->unk32 = ret;

            if (time2 == 0x18)
            {
                SetPrimaryHBlankHandler(NULL);
                proc->timer = 0;
                Proc_Break(proc);
                return;
            }
        }
    }

    proc->timer++;

    return;
}

//! FE8U = 0x080C84D8
void sub_80C84D8(struct ProcOpAnim * proc)
{
    if (proc->timer == 0)
    {
        SetDispEnable(0, 0, 0, 1, 1);
        SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, 0);
        SetBlendTargetA(1, 1, 1, 1, 1);
    }

    gLCDControlBuffer.blendY = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 8);

    if (proc->timer == 8)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8554
void sub_80C8554(void)
{
    gLCDControlBuffer.bgoffset[BG_3].x += 2;
    return;
}

//! FE8U = 0x080C8564
void sub_80C8564(struct ProcOpAnim * proc)
{
    sub_80C72A4(proc->unk46);
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    return;
}

//! FE8U = 0x080C8580
void sub_80C8580(struct ProcOpAnimBlend * proc)
{
    SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, 14);
    SetBlendTargetA(0, 0, 1, 0, 0);

    proc->unk4C = 0;

    return;
}

//! FE8U = 0x080C85B0
void sub_80C85B0(struct ProcOpAnimBlend * proc)
{
    SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, Interpolate(INTERPOLATE_LINEAR, 0xe, 0, proc->unk4C, 0x28));

    if (proc->unk4C == 0x28)
    {
        Proc_Break(proc);
    }
    else
    {
        proc->unk4C++;
    }

    return;
}

//! FE8U = 0x080C85FC
void sub_80C85FC(void)
{
    SetDefaultColorEffects();
    return;
}

//! FE8U = 0x080C8608
void sub_80C8608(struct ProcOpAnimBlend * proc)
{
    SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);

    proc->unk4C = 0;

    return;
}

//! FE8U = 0x080C8638
void sub_80C8638(struct ProcOpAnimBlend * proc)
{
    SetBlendConfig(BLEND_EFFECT_DARKEN, 8, 8, Interpolate(INTERPOLATE_LINEAR, 0, 12, proc->unk4C, 0x28));

    if (proc->unk4C == 0x28)
    {
        Proc_Break(proc);
    }
    else
    {
        proc->unk4C++;
    }

    return;
}

//! FE8U = 0x080C8684
void sub_80C8684(void)
{
    SetDefaultColorEffects();
    return;
}

//! FE8U = 0x080C8690
void sub_80C8690(struct ProcOpAnim * proc)
{
    int i;
    s16 * vram;

    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);

    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimGenericCharacterBG, (void *)(0x06002000 + GetBackgroundTileDataOffset(3)));
            Decompress(Tsa_OpAnimGenericCharacterBG, gBG3TilemapBuffer);

            for (i = 0; i < 0x280; i++)
            {
                gBG3TilemapBuffer[i] = gBG3TilemapBuffer[i] + 0xe100;
            }

            BG_EnableSyncByMask(BG3_SYNC_BIT);

            break;

        case 2:
            Decompress(Img_OpAnimJoshua, (void *)(0x6000000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimJoshua2, gGenericBuffer);

            break;

        case 3:
            Decompress(Img_OpAnimJoshua2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(gUnknown_08ACC340, gGenericBuffer + 0x800);

            break;

        case 4:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);
            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;

        case 5:
            Decompress(Img_OpAnimShiningRing, (void *)0x06004000);

            break;

        case 6:
            Decompress(Tsa_OpAnimShiningRing, (void *)0x0600F000);

            vram = (void *)0x0600F000;

            for (i = 0; i < 0x280; i++, vram++)
            {
                *vram = *vram - 0x8000;
            }

            break;
    }

    if (proc->timer == 0x28)
    {
        Proc_EndEach(gUnknown_08AA705C);
        Proc_EndEach(gUnknown_08AA707C);
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C883C
void sub_80C883C(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimLArachel, (void *)(0x6000000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimLArachel, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimLArachel2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimLArachelLeft, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        Proc_EndEach(gUnknown_08AA705C);
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8934
void sub_80C8934(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimCharacterSeth, (void *)(0x6000000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimCharacterSeth, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimCharacterSeth2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(gUnknown_08AD236C, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8A20
void sub_80C8A20(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimMyrrh, (void *)(0x6000000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimMyrrh2, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimMyrrh2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(gUnknown_08AD543C, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8B0C
void sub_80C8B0C(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimSaleh, (void *)(0x6000000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimSaleh2, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimSaleh2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(gUnknown_08AD88D4, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8BF8
void sub_80C8BF8(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimTethys, (void *)(0x6000000 + GetBackgroundTileDataOffset(0)));
            Decompress(Tsa_OpAnimTethys, gGenericBuffer);

            break;

        case 2:
            Decompress(Img_OpAnimTethys2, (void *)(0x06002000 + GetBackgroundTileDataOffset(0)));
            Decompress(gUnknown_08ADBC0C, gGenericBuffer + 0x800);

            break;

        case 3:
            BG_Fill(gBG0TilemapBuffer, 0);
            BG_Fill(gBG1TilemapBuffer, 0);

            CpuFastFill(0, (void *)0x0600D800, 0x1000);

            break;
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8CE4
void sub_80C8CE4(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8D30
void sub_80C8D30(struct ProcOpAnim * proc)
{
    int ret;
    int i;

    i = DivRem(proc->unk3E, 0x4c);
    i = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, i, 0x4c);

    if (i < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, i, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - i, 0x10, 8);
    }

    proc->unk3E++;

    CopyToPalOpAnim(pal_08B103D8, 0, 0x100);

    ret = Interpolate(INTERPOLATE_LINEAR, 0xc, 0, proc->timer, 0x26);

    for (i = 0; i < 8; i++)
    {
        sub_80C69B0(gPaletteBuffer + i * 0x10, 0, ret);
    }

    switch (proc->timer)
    {
        case 1:
            break;

        case 2:
            CopyToPalOpAnim(gUnknown_08ADBE78, 0x220, 0x20);
            CopyToPalOpAnim(gUnknown_08ADBE78, 0x260, 0x20);
            CopyToPalOpAnim(gUnknown_08ADBE78, 0x2a0, 0x20);
            CopyToPalOpAnim(gUnknown_08ADBE78, 0x2e0, 0x20);

            break;

        case 3:
            Decompress(Img_OpAnimFaceRennac, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceRennac, 0x200, 0x20);
            Decompress(Img_OpAnimFaceRennacShadow, (void *)0x06010F00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceLArachel, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceLArachel, 0x240, 0x20);
            Decompress(Img_OpAnimFaceLArachelShadow, (void *)0x06012D00);

            break;

        case 5:
            Decompress(Img_OpAnimFaceDozla, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceDozla, 0x280, 0x20);
            Decompress(Img_OpAnimFaceDozlaShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 0x26)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C8ED4
void sub_80C8ED4(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 0x12);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 0x12);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceEwan, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceEwan, 0x200, 0x20);
            Decompress(Img_OpAnimFaceEwanShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceTethys, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceTethys, 0x240, 0x20);
            Decompress(Img_OpAnimFaceTethysShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceGerik, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceGerik, 0x280, 0x20);
            Decompress(Img_OpAnimFaceGerikShadow, (void *)0x06014B00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceMarisa, (void *)0x06015A00);
            CopyToPalOpAnim(Pal_OpAnimFaceMarisa, 0x2c0, 0x20);
            Decompress(Img_OpAnimFaceMarisaShadow, (void *)0x06016900);

            break;
    }

    if (proc->timer == 7)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9024
void sub_80C9024(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 0xe);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 0xe);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceGarcia, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceGarcia, 0x200, 0x20);
            Decompress(Img_OpAnimFaceGarciaShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceRoss, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceRoss, 0x240, 0x20);
            Decompress(Img_OpAnimFaceRossShadow, (void *)0x06012D00);

            break;
    }

    if (proc->timer == 8)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9100
void sub_80C9100(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 0xc);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 0xc);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceVanessa, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceVanessa, 0x200, 0x20);
            Decompress(Img_OpAnimFaceVanessaShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceTana, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceTana, 0x240, 0x20);
            Decompress(Img_OpAnimFaceTanaShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceSyrene, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceSyrene, 0x280, 0x20);
            Decompress(Img_OpAnimFaceSyreneShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9218
void sub_80C9218(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 10);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 10);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceGilliam, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceGilliam, 0x200, 0x20);
            Decompress(Img_OpAnimFaceGilliamShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceInnes, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceInnes, 0x240, 0x20);
            Decompress(Img_OpAnimFaceInnesShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceMoulder, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceMoulder, 0x280, 0x20);
            Decompress(Img_OpAnimFaceMoulderShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9330
void sub_80C9330(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 9);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 9);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceColm, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceColm, 0x200, 0x20);
            Decompress(Img_OpAnimFaceColmShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceNeimi, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceNeimi, 0x240, 0x20);
            Decompress(Img_OpAnimFaceNeimiShadow, (void *)0x06012D00);

            break;
    }

    if (proc->timer == 11)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C940C
void sub_80C940C(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 8);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 8);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceKnoll, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceKnoll, 0x200, 0x20);
            Decompress(Img_OpAnimFaceKnollShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceNatasha, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceNatasha, 0x240, 0x20);
            Decompress(Img_OpAnimFaceNatashaShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceCormag, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceCormag, 0x280, 0x20);
            Decompress(Img_OpAnimFaceCormagShadow, (void *)0x06014B00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceAmelia, (void *)0x06015A00);
            CopyToPalOpAnim(Pal_OpAnimFaceAmelia, 0x2c0, 0x20);
            Decompress(Img_OpAnimFaceAmeliaShadow, (void *)0x06016900);

            break;
    }

    if (proc->timer == 12)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C955C
void sub_80C955C(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 7);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 7);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceLute, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceLute, 0x200, 0x20);
            Decompress(Img_OpAnimFaceLuteShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceArtur, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceArtur, 0x240, 0x20);
            Decompress(Img_OpAnimFaceArturShadow, (void *)0x06012D00);

            break;
    }

    if (proc->timer == 13)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9638
void sub_80C9638(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 6);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 6);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceDuessel, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceDuessel, 0x200, 0x20);
            Decompress(Img_OpAnimFaceDuesselShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceSelena, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceSelena, 0x240, 0x20);
            Decompress(Img_OpAnimFaceSelenaShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceGlen, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceGlen, 0x280, 0x20);
            Decompress(Img_OpAnimFaceGlenShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 14)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9750
void sub_80C9750(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 5);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 5);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceKyle, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceKyle, 0x200, 0x20);
            Decompress(Img_OpAnimFaceKyleShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceFranz, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceFranz, 0x240, 0x20);
            Decompress(Img_OpAnimFaceFranzShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceForde, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceForde, 0x280, 0x20);
            Decompress(Img_OpAnimFaceFordeShadow, (void *)0x06014B00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceSeth, (void *)0x06015A00);
            CopyToPalOpAnim(Pal_OpAnimFaceSeth, 0x2c0, 0x20);
            Decompress(Img_OpAnimFaceSethShadow, (void *)0x06016900);

            break;
    }

    if (proc->timer == 15)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C98A0
void sub_80C98A0(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 4);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 4);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceValter, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceValter, 0x200, 0x20);
            Decompress(Img_OpAnimFaceValterShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceRiev, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceRiev, 0x240, 0x20);
            Decompress(Img_OpAnimFaceRievShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceCaellach, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceCaellach, 0x280, 0x20);
            Decompress(Img_OpAnimFaceCaellachShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 16)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C99B8
void sub_80C99B8(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 3);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 3);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceLyon, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceLyon, 0x200, 0x20);
            Decompress(Img_OpAnimFaceLyonShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceVigarde, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceVigarde, 0x240, 0x20);
            Decompress(Img_OpAnimFaceVigardeShadow, (void *)0x06012D00);

            break;
    }

    if (proc->timer == 18)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9A94
void sub_80C9A94(struct ProcOpAnim * proc)
{
    SetDispEnable(0, 1, 1, 0, 0);

    SetBlendConfig(1, Interpolate(INTERPOLATE_LINEAR, 0, 0xd, proc->timer, 0x30), 0x10, 8);

    if (proc->timer == 0x30)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9AFC
void sub_80C9AFC(struct ProcOpAnim * proc)
{
    int i;

    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 0x30);

    CopyToPalOpAnim(pal_08B103D8, 0, 0x100);

    for (i = 0; i < 8; i++)
    {
        sub_80C69B0(gPaletteBuffer + i * 0x10, 0x7FFF, ret);
    }

    if (proc->timer == 0x30)
    {
        gOpAnimSt.pal = 0x7FFF;
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9B6C
void sub_80C9B6C(void)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendConfig(BLEND_EFFECT_ALPHA, 0x10, 0, 8);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetDispEnable(1, 1, 0, 1, 1);

    SetBackgroundTileDataOffset(BG_1, 0);
    SetBackgroundMapDataOffset(BG_1, 0xe000);

    return;
}

//! FE8U = 0x080C9C08
void sub_80C9C08(struct ProcOpAnim * proc)
{
    sub_80C9B6C();
    CopyToPalOpAnim(Pal_OpAnimJoshua, 0, 0x160);

    proc->unk47 = 1;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0x118;
    proc->unk42 = 0xe8;
    proc->unk40 = 0xe8;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9C5C
void sub_80C9C5C(struct ProcOpAnim * proc)
{
    sub_80C9B6C();
    CopyToPalOpAnim(Pal_OpAnimLArachel, 0, 0x160);

    proc->unk47 = 0;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0xc0;
    proc->unk42 = 0x140;
    proc->unk40 = 0x108;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9CAC
void sub_80C9CAC(struct ProcOpAnim * proc)
{
    sub_80C9B6C();
    CopyToPalOpAnim(Pal_OpAnimCharacterSeth, 0, 0x160);

    proc->unk47 = 1;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0xc0;
    proc->unk42 = 0x140;
    proc->unk40 = 0x118;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9CFC
void sub_80C9CFC(struct ProcOpAnim * proc)
{
    sub_80C9B6C();
    CopyToPalOpAnim(Pal_OpAnimMyrrh2, 0, 0x160);

    proc->unk47 = 0;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0x110;
    proc->unk42 = 0xf0;
    proc->unk40 = 0x108;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9D4C
void sub_80C9D4C(struct ProcOpAnim * proc)
{
    sub_80C9B6C();
    CopyToPalOpAnim(Pal_OpAnimSaleh2, 0, 0x160);
    proc->unk47 = 1;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0xe8;
    proc->unk42 = 0x118;
    proc->unk40 = 0xe8;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9DA0
void sub_80C9DA0(struct ProcOpAnim * proc)
{
    sub_80C9B6C();
    CopyToPalOpAnim(Pal_OpAnimTethys, 0, 0x160);

    proc->unk47 = 0;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 200;
    proc->unk42 = 0x138;
    proc->unk40 = 0x128;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9DF0
void sub_80C9DF0(void)
{
    SetBlendConfig(BLEND_EFFECT_ALPHA, 0x10, 0, 8);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetDispEnable(1, 1, 1, 1, 1);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    return;
}

//! FE8U = 0x080C9E6C
void sub_80C9E6C(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    if (proc->timer < 0x11)
    {
        int bldAmt = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x10);

        gLCDControlBuffer.blendCoeffA = bldAmt;
        gLCDControlBuffer.blendCoeffB = 16 - bldAmt;

        if (proc->timer == 0x10)
        {
            proc->timer = 0;
            Proc_Break(proc);
            return;
        }
    }

    proc->timer++;

    return;
}

//! FE8U = 0x080C9EE8
void sub_80C9EE8(void)
{
    CopyToPalOpAnim(pal_08B103D8, 0, 0x100);

    SetBlendConfig(BLEND_EFFECT_ALPHA, 0, 0x10, 8);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetDispEnable(0, 0, 1, 1, 1);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    return;
}

//! FE8U = 0x080C9F7C
void sub_80C9F7C(struct ProcOpAnim * proc)
{
    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    if (proc->timer < 0x11)
    {
        int bldAmt = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 0x10);

        gLCDControlBuffer.blendCoeffA = bldAmt;
        gLCDControlBuffer.blendCoeffB = 16 - bldAmt;

        if (proc->timer == 0x10)
        {
            proc->timer = 0;
            Proc_Break(proc);
            return;
        }
    }

    proc->timer++;

    return;
}

//! FE8U = 0x080C9FF8
void sub_80C9FF8(struct ProcOpAnim * proc)
{
    int ret;

    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;
    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    ret = Interpolate(INTERPOLATE_RSQUARE, 0, proc->unk40, proc->timer, 0x1e);

    if (proc->unk47 != 0)
    {
        TsaModifyFirstPalMaybe(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }
    else
    {
        sub_80C689C(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }

    proc->unk30 = ret;

    if (proc->timer == 0x1e)
    {
        BG_EnableSyncByMask(BG1_SYNC_BIT);

        proc->unk32 = (proc->unk42 + DISPLAY_WIDTH) - proc->unk40;

        if (proc->unk47 != 0)
        {
            sub_80C689C(proc->unk32, 0, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
        }
        else
        {
            TsaModifyFirstPalMaybe(proc->unk32, 0, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
        }

        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CA10C
void sub_80CA10C(struct ProcOpAnim * proc)
{
    int ret;

    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;
    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    ret = Interpolate(1, 8, 0, proc->timer, 0x28);
    SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 16 - ret, 8);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    ret = Interpolate(INTERPOLATE_LINEAR, proc->unk40, proc->unk40 + 0x10, proc->timer, 0x1e);

    if (proc->unk47 != 0)
    {
        TsaModifyFirstPalMaybe(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }
    else
    {
        sub_80C689C(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }

    proc->unk30 = ret;

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    ret = ((DISPLAY_WIDTH - proc->unk40) + proc->unk42) + Interpolate(INTERPOLATE_LINEAR, 0, 0x60, proc->timer, 0x3c) +
        Interpolate(INTERPOLATE_SQUARE, 0, 0x60, proc->timer, 0x3c);

    if (proc->unk47 != 0)
    {
        sub_80C689C(ret, proc->unk32, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
    }
    else
    {
        TsaModifyFirstPalMaybe(ret, proc->unk32, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
    }

    proc->unk32 = ret;

    if (proc->timer == 0x1e)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CA26C
void sub_80CA26C(struct ProcOpAnim * proc)
{
    int ret;

    if (proc->timer == 0xb)
    {
        SetDispEnable(1, 0, 0, 1, 1);

        SetBlendTargetA(1, 0, 0, 0, 0);
        SetBlendTargetB(0, 0, 0, 1, 0);
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x10, 0, 8);

        SetDispEnable(1, 0, 0, 1, 1);
    }

    if (proc->timer < 0xb)
    {
        ret = Interpolate(INTERPOLATE_SQUARE, 8, 0, proc->timer + 0x1e, 0x28);
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 16 - ret, 8);

        BG_EnableSyncByMask(BG1_SYNC_BIT);

        ret = ((DISPLAY_WIDTH - proc->unk40) + proc->unk42) +
            Interpolate(INTERPOLATE_LINEAR, 0, 0x60, proc->timer + 0x1e, 0x3c) +
            Interpolate(INTERPOLATE_SQUARE, 0, 0x60, proc->timer + 0x1e, 0x3c);

        if (proc->unk47 != 0)
        {
            sub_80C689C(ret, proc->unk32, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
        }
        else
        {
            TsaModifyFirstPalMaybe(ret, proc->unk32, proc->unk44, 1, proc->unk48, proc->unk4C, 1);
        }

        proc->unk32 = ret;
    }

    return;
}

//! FE8U = 0x080CA3B8
void sub_80CA3B8(struct ProcOpAnim * proc)
{
    int ret;

    sub_80CA26C(proc);

    OpAnim1_UpdateScroll(proc->unk38, proc->unk3A);
    proc->unk3A = proc->unk38;

    proc->unk38 = Interpolate(INTERPOLATE_LINEAR, 0, 0x270, proc->unk3C, 0x430);
    proc->unk3C++;

    if (proc->timer - 0xf >= 0)
    {
        int bldAmt = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer - 0xf, 0xf);
        gLCDControlBuffer.blendCoeffA = bldAmt;
        gLCDControlBuffer.blendCoeffB = 16 - bldAmt;
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    ret = Interpolate(INTERPOLATE_SQUARE, proc->unk40 + 0x10, proc->unk40 * 2 + 0x10, proc->timer, 0x1e);

    if (proc->unk47 != 0)
    {
        TsaModifyFirstPalMaybe(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }
    else
    {
        sub_80C689C(ret, proc->unk30, proc->unk44, 0, proc->unk48, proc->unk4C, 0);
    }

    proc->unk30 = ret;

    if (proc->timer == 0x1e)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CA4A4
void sub_80CA4A4(void)
{
    Proc_EndEach(gUnknown_08AA707C);
    SetDispEnable(0, 0, 0, 0, 1);
    SetDefaultColorEffects();
    return;
}

//! FE8U = 0x080CA4DC
void sub_80CA4DC(struct ProcOpAnim * proc)
{
    int bldAmt;
    int ret;
    u32 timer;
    int i;

    switch (proc->timer)
    {
        case 0:
            break;

        case 1:
            OpAnim1_UpdateScroll(0x1b0, 0x188);

            break;

        case 2:
            OpAnim1_UpdateScroll(0x1f0, 0x1b0);

            break;

        case 3:
            OpAnim1_UpdateScroll(0x230, 0x1f0);

            break;

        case 4:
            proc->unk3A = 0x230;
            proc->unk38 = 0x230;

            break;
    }

    if (proc->timer > 0x8e)
    {
        OpAnimPutObjCommon(0xae, 10, 4, 9);
    }

    if (proc->timer > 0x8d)
    {
        OpAnimPutObjCommon(0x38, 0x28, 4, 7);
    }

    if (proc->timer > 0x8c)
    {
        OpAnimPutObjCommon(0x9c, 0x3a, 3, 3);
    }

    if (proc->timer > 0x8b)
    {
        OpAnimPutObjCommon(0x22, 0, 4, 1);
    }

    if (proc->timer > 0x8a)
    {
        OpAnimPutObjCommon(0xd2, 0x10, 4, 5);
    }

    if (proc->timer > 0x89)
    {
        OpAnimPutObjCommon(0xc, 0x1a, 3, 1);
    }

    if (proc->timer > 0x88)
    {
        OpAnimPutObjCommon(0xcc, 0x2a, 3, 4);
    }

    if (proc->timer > 0x87)
    {
        OpAnimPutObjCommon(0x60, 0, 4, 0);
    }

    if (proc->timer > 0x86)
    {
        OpAnimPutObjCommon(0xe4, 0x10, 4, 0xb);
    }

    if (proc->timer > 0x85)
    {
        OpAnimPutObjCommon(0x58, 0x1e, 3, 3);
    }

    if (proc->timer > 0x84)
    {
        OpAnimPutObjCommon(0x54, 0x2e, 2, 1);
    }

    if (proc->timer > 0x83)
    {
        OpAnimPutObjCommon(0, 2, 4, 2);
    }

    if (proc->timer > 0x82)
    {
        OpAnimPutObjCommon(0xc6, 0x18, 4, 9);
    }

    if (proc->timer > 0x81)
    {
        OpAnimPutObjCommon(0x90, 0x22, 3, 5);
    }

    if (proc->timer > 0x80)
    {
        OpAnimPutObjCommon(0xa8, 0x44, 2, 0);
    }

    if (proc->timer > 0x7f)
    {
        OpAnimPutObjCommon(0xca, 2, 4, 7);
    }

    if (proc->timer > 0x7e)
    {
        OpAnimPutObjCommon(0x26, 0x18, 4, 2);
    }

    if (proc->timer > 0x7d)
    {
        OpAnimPutObjCommon(0x80, 0x26, 3, 0);
    }

    if (proc->timer > 0x7b)
    {
        OpAnimPutObjCommon(0x80, 0x32, 2, 5);
    }

    if (proc->timer > 0x79)
    {
        OpAnimPutObjCommon(0x86, 6, 4, 0);
    }

    if (proc->timer > 0x77)
    {
        OpAnimPutObjCommon(0x98, 0x16, 4, 1);
    }

    if (proc->timer > 0x75)
    {
        OpAnimPutObjCommon(0xe8, 0x16, 3, 3);
    }

    if (proc->timer > 0x73)
    {
        OpAnimPutObjCommon(100, 0x48, 2, 1);
    }

    if (proc->timer > 0x71)
    {
        OpAnimPutObjCommon(0x70, 6, 4, 10);
    }

    if (proc->timer > 0x6f)
    {
        OpAnimPutObjCommon(0x40, 0x14, 4, 8);
    }

    if (proc->timer > 0x6d)
    {
        OpAnimPutObjCommon(0, 0x2e, 3, 4);
    }

    if (proc->timer > 0x6b)
    {
        OpAnimPutObjCommon(0x2c, 0x4a, 2, 4);
    }

    if (proc->timer > 0x69)
    {
        OpAnimPutObjCommon(0x40, 8, 4, 6);
    }

    if (proc->timer > 0x67)
    {
        OpAnimPutObjCommon(0x78, 0x1a, 4, 2);
    }

    if (proc->timer > 0x65)
    {
        OpAnimPutObjCommon(0x24, 0x32, 3, 2);
    }

    if (proc->timer > 0x62)
    {
        OpAnimPutObjCommon(0xe, 0x4e, 2, 0);
    }

    if (proc->timer > 0x5f)
    {
        OpAnimPutObjCommon(0x16, 10, 4, 4);
    }

    if (proc->timer > 0x5c)
    {
        OpAnimPutObjCommon(0xb4, 0x28, 4, 1);
    }

    if (proc->timer > 0x59)
    {
        OpAnimPutObjCommon(0x42, 0x36, 3, 1);
    }

    if (proc->timer > 0x55)
    {
        OpAnimPutObjCommon(0xdc, 0x32, 2, 2);
    }

    if (proc->timer > 0x51)
    {
        OpAnimPutObjCommon(200, 0x48, 1, 0);
    }

    if (proc->timer > 0x4c)
    {
        OpAnimPutObjCommon(0x38, 0x28, 4, 0);
    }

    if (proc->timer > 0x47)
    {
        OpAnimPutObjCommon(0x8c, 0x54, 1, 2);
    }

    if (proc->timer > 0x41)
    {
        OpAnimPutObjCommon(0x10, 100, 1, 1);
    }

    if (proc->timer > 0x37)
    {
        OpAnimPutObjCommon(0, 0x7e, 0, 1);
    }

    if (proc->timer > 0x31)
    {
        OpAnimPutObjCommon(0xa0, 0x78, 0, 2);
    }

    if (proc->timer > 0x1d)
    {
        OpAnimPutObjCommon(0x58, 0x70, 0, 0);
    }

    timer = proc->timer - 0x52;

    if (timer == 0)
    {
        SetDispEnable(0, 0, 1, 0, 1);
        SetBackgroundTileDataOffset(BG_2, 0x8000);
        SetBackgroundMapDataOffset(BG_2, 0xe800);
    }

    if (timer < 0x60)
    {
        CopyToPalOpAnim(pal_08B103D8, 0, 0x100);

        ret = Interpolate(INTERPOLATE_RSQUARE, 0x10, 0xc, timer, 0x5f);

        for (i = 0; i < 8; i++)
        {
            sub_80C69B0(gPaletteBuffer + i * 0x10, 0, ret);
        }
    }

    timer = proc->timer - 0xb1;

    if (timer == 0)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x10, 0, 0);
        SetBlendTargetA(0, 0, 0, 0, 1);
        SetBlendTargetB(0, 0, 1, 0, 0);
    }

    if (timer < 0x21)
    {
        bldAmt = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, timer, 0x20);
        gLCDControlBuffer.blendCoeffA = bldAmt;
        gLCDControlBuffer.blendCoeffB = 16 - bldAmt;
    }

    if (proc->timer == 0xd1)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CA92C
void sub_80CA92C(struct ProcOpAnim * proc)
{
    SetDefaultColorEffects();
    proc->unk46 = 1;
    return;
}

//! FE8U = 0x080CA940
void sub_80CA940(void)
{
    Proc_EndEach(gUnknown_08AA707C);

    BG_SetPosition(BG_3, 0, 0);

    SetDispEnable(0, 0, 1, 0, 1);
    SetWinEnable(0, 0, 1);

    SetWObjLayers(0, 0, 1, 0, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(BLEND_EFFECT_ALPHA, 4, 8, 8);
    SetBlendTargetA(0, 0, 0, 0, 0);

    return;
}

//! FE8U = 0x080CA9F8
int sub_80CA9F8(int a, int b, int c, int d)
{
    int val = 0x10 - (d - c);

    if (val < 0)
    {
        return 0xffff;
    }

    if (val >= 0x10)
    {
        return a;
    }

    return Interpolate(INTERPOLATE_RSQUARE, a + b * DISPLAY_WIDTH, a, val, 0x10);
}

//! FE8U = 0x080CAA38
void sub_80CAA38(struct ProcOpAnim * proc)
{
    int x;

    int timer = proc->timer + 10;

    x = sub_80CA9F8(0x78, -1, timer, 0x14);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0xec, gUnknown_08AA709C, 0);
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x000004EC, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x30), 0x00000804, gUnknown_08AA70BC, 0);
    }

    timer = proc->timer + 6;
    x = sub_80CA9F8(0x78, -1, timer, 0x14);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0x20, gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x420, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x30), 0x00000838, gUnknown_08AA70BC, 0);
    }

    timer = proc->timer + 2;
    x = sub_80CA9F8(0x78, -1, timer, 0x14);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0x54, gUnknown_08AA709C, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x00000454, gUnknown_08AA709C, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, OAM1_X(x - 0x30), 0x0000086C, gUnknown_08AA70BC, 0);
    }

    if (proc->timer == 0x14)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CABB0
void sub_80CABB0(struct ProcOpAnim * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;
    int timer;

    timer = proc->timer + 2;

    x1 = sub_80CA9F8(0x42, -1, timer, 0x12);
    y1 = sub_80CA9F8(0x2a, -1, timer, 0x12);
    x2 = sub_80CA9F8(0xae, +1, timer, 0x12);
    y2 = sub_80CA9F8(0x76, +1, timer, 0x12);

    if (x1 != 0x0000FFFF)
    {
        if ((y1 != 0x0000FFFF) && (y1 >= -0x28) && (y1 < 0xc9))
        {
            PutSpriteExt(1, OAM1_X(x1 - 0x30), OAM0_Y(y1 - 0x28), gUnknown_08AA709C, 0);
            PutSpriteExt(
                2, OAM1_X(x1 - 0x2c), OAM0_Y(y1 - 0x28) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
            PutSpriteExt(0, OAM1_X(x1 - 0x30), OAM0_Y(y1 - 0x20) | OAM0_WINDOW, gUnknown_08AA70DC, 0);
        }

        if ((x1 != 0x0000FFFF) && (y2 != 0x0000FFFF) && (y2 >= -0x28) && (y2 < 0xc9))
        {
            PutSpriteExt(1, OAM1_X(x1 - 0x30), OAM0_Y(y2 - 0x28), gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
            PutSpriteExt(
                2, OAM1_X(x1 - 0x2c), OAM0_Y(y2 - 0x28) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
            PutSpriteExt(0, OAM1_X(x1 - 0x30), OAM0_Y(y2 - 0x20) | OAM0_WINDOW, gUnknown_08AA70DC, 0);
        }
    }

    if (x2 != 0x0000FFFF)
    {
        if ((y1 != 0x0000FFFF) && (y1 >= -0x28) && (y1 < 0xc9))
        {
            PutSpriteExt(1, OAM1_X(x2 - 0x30), OAM0_Y(y1 - 0x28), gUnknown_08AA709C, OAM2_CHR(0x1E0) + OAM2_PAL(4));
            PutSpriteExt(
                2, OAM1_X(x2 - 0x2c), OAM0_Y(y1 - 0x28) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x258) + OAM2_PAL(5));
            PutSpriteExt(0, OAM1_X(x2 - 0x30), OAM0_Y(y1 - 0x20) | OAM0_WINDOW, gUnknown_08AA70DC, 0);
        }

        if ((x2 != 0x0000FFFF) && (y2 != 0x0000FFFF) && (y2 >= -0x28) && (y2 < 0xc9))
        {
            PutSpriteExt(1, OAM1_X(x2 - 0x30), (y2 - 0x28) & 0xff, gUnknown_08AA709C, OAM2_CHR(0x2D0) + OAM2_PAL(6));
            PutSpriteExt(
                2, OAM1_X(x2 - 0x2c), ((y2 - 0x28) & 0xff) | OAM0_BLEND, gUnknown_08AA709C,
                OAM2_CHR(0x348) + OAM2_PAL(7));
            PutSpriteExt(0, OAM1_X(x2 - 0x30), ((y2 - 0x20) & 0xff) | OAM0_WINDOW, gUnknown_08AA70DC, 0);
        }
    }

    if (proc->timer == 0x12)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CAE20
void sub_80CAE20(struct ProcOpAnim * proc)
{
    int timer;
    int x;

    timer = proc->timer + 2;
    x = sub_80CA9F8(0x3e, -1, timer, 0x10);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x20), 0x20, gUnknown_08AA709C, 0);
        PutSpriteExt(2, OAM1_X(x - 0x1c), 0x420, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000838, gUnknown_08AA70EA, 0);
    }

    x = sub_80CA9F8(0xb2, +1, timer, 0x10);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x40), 0x20, gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x3c), 0x420, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000838, gUnknown_08AA70EA, 0);
    }

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CAF2C
void sub_80CAF2C(struct ProcOpAnim * proc)
{
    int y;
    int timer;

    timer = proc->timer + 10;
    y = sub_80CA9F8(0x50, -1, timer, 0xf);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        int oam2 = 0;
        PutSpriteExt(1, 0, OAM0_Y(y - 0x28), gUnknown_08AA709C, oam2);
        PutSpriteExt(2, 4, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, 0x10, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA7116, 0);
    }

    timer = proc->timer + 6;
    y = sub_80CA9F8(0x50, -1, timer, 0xf);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x48, OAM0_Y(y - 0x28), gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, 0x4c, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, 0x58, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA7116, 0);
    }

    timer = proc->timer + 2;
    y = sub_80CA9F8(0x50, -1, timer, 0xf);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x90, OAM0_Y(y - 0x28), gUnknown_08AA709C, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(2, 0x94, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, 0xa0, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA7116, 0);
    }

    if (proc->timer == 0xf)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CB0A0
void sub_80CB0A0(struct ProcOpAnim * proc)
{
    int y;
    int timer;

    timer = proc->timer + 10;
    y = sub_80CA9F8(0x50, +1, timer, 0xd);

    if (((y != 0x0000FFFF) && (y >= -0x28)) && (y < 0xc9))
    {
        int oam2 = 0;
        PutSpriteExt(1, 0, OAM0_Y(y - 0x28), gUnknown_08AA709C, oam2);
        PutSpriteExt(2, 4, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, 0x10, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA7116, 0);
    }

    timer = proc->timer + 6;
    y = sub_80CA9F8(0x50, +1, timer, 0xd);

    if (((y != 0x0000FFFF) && (y >= -0x28)) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x48, OAM0_Y(y - 0x28), gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, 0x4c, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, 0x58, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA7116, 0);
    }

    timer = proc->timer + 2;
    y = sub_80CA9F8(0x50, +1, timer, 0xd);

    if (((y != 0x0000FFFF) && (y >= -0x28)) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x90, OAM0_Y(y - 0x28), gUnknown_08AA709C, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(2, 0x94, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, 0xa0, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA7116, 0);
    }

    if (proc->timer == 0xd)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CB20C
void sub_80CB20C(struct ProcOpAnim * proc)
{
    int timer;
    int x;

    timer = proc->timer + 6;
    x = sub_80CA9F8(0x3c, -1, timer, 0xb);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x20), 6, gUnknown_08AA709C, 0);
        PutSpriteExt(2, OAM1_X(x - 0x1c), 0x00000406, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x0000081E, gUnknown_08AA70EA, 0);
    }

    timer = proc->timer + 2;
    x = sub_80CA9F8(0x3c, -1, timer, 0xb);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x40), 0x3a, gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x3c), 0x0000043A, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000852, gUnknown_08AA70EA, 0);
    }

    if (proc->timer == 0xb)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CB320
void sub_80CB320(struct ProcOpAnim * proc)
{
    int timer;
    int y;
    int x;

    x = 0x78;

    if (proc->timer == 0)
    {
        SetWinEnable(1, 1, 1);

        gLCDControlBuffer.wincnt.win0_enableBlend = 1;
        SetWin0Layers(0, 0, 1, 0, 1);

        gLCDControlBuffer.wincnt.win1_enableBlend = 1;
        SetWin1Layers(0, 0, 1, 0, 1);

        SetWin0Box(0, 0, 0, 0);
        SetWin1Box(0, 0, 0, 0);
    }

    timer = proc->timer + 2;
    y = sub_80CA9F8(0x1c, -1, timer, 10);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, (x - 0x30), OAM0_Y(y - 0x30), gUnknown_08AA709C, 0);
        PutSpriteExt(2, (x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, (x - 0x38), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnknown_08AA70EA, 0);
    }

    y = sub_80CA9F8(0x84, +1, timer, 10);

    if ((x != 0x0000FFFF) && (y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x30), gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnknown_08AA70EA, 0);
    }

    if (timer > 1 && timer < 10)
    {
        y = Interpolate(4, 0, 0x18, timer - 2, 8);

        SetWin0Box(6, 0x50 - y, 0x76, y + 0x50);
        SetWin1Box(0x7A, 0x50 - y, 0xea, y + 0x50);
    }

    PutSpriteExt(1, 0xe, 0x20, gUnknown_08AA709C, OAM2_CHR(0x1E0) + OAM2_PAL(4));
    PutSpriteExt(2, 0x12, 0x420, gUnknown_08AA709C, OAM2_CHR(0x258) + OAM2_PAL(5));
    PutSpriteExt(1, 0x82, 0x20, gUnknown_08AA709C, OAM2_CHR(0x2D0) + OAM2_PAL(6));
    PutSpriteExt(2, 0x86, 0x420, gUnknown_08AA709C, OAM2_CHR(0x348) + OAM2_PAL(7));

    if (proc->timer == 10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CB594
void sub_80CB594(struct ProcOpAnim * proc)
{
    int timer;
    int x;

    timer = proc->timer + 6;
    x = sub_80CA9F8(0xb4, +1, timer, 9);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x20), 6, gUnknown_08AA709C, 0);
        PutSpriteExt(2, OAM1_X(x - 0x1c), 0x00000406, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x0000081E, gUnknown_08AA70EA, 0);
    }

    timer = proc->timer + 2;
    x = sub_80CA9F8(0xb4, +1, timer, 9);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x40), 0x3a, gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x3c), 0x0000043A, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000852, gUnknown_08AA70EA, 0);
    }

    if (proc->timer == 9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CB6A0
void sub_80CB6A0(struct ProcOpAnim * proc)
{
    int x;
    int y;
    int timer;

    timer = proc->timer + 10;
    x = 0x78;

    y = sub_80CA9F8(0x1c, 1, timer, 8);

    if (((y != 0x0000FFFF) && (y >= -0x28)) && (y < 0xc9))
    {
        PutSpriteExt(1, x - 0x30, OAM0_Y(y - 0x30), gUnknown_08AA709C, 0);
        PutSpriteExt(2, x - 0x2c, (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, x - 0x60, (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnknown_08AA715C, 0);
    }

    timer = proc->timer + 6;
    y = sub_80CA9F8(0x50, +1, timer, 8);

    if ((x != 0x0000FFFF) && (y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x30), gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x60), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnknown_08AA715C, 0);
    }

    timer = proc->timer + 2;
    y = sub_80CA9F8(0x84, +1, timer, 8);

    if ((x != 0x0000FFFF) && (y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x30), gUnknown_08AA709C, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, OAM1_X(x - 0x60), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnknown_08AA715C, 0);
    }

    if (proc->timer == 8)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CB878
void sub_80CB878(struct ProcOpAnim * proc)
{
    int timer;
    int y;
    int x;

    timer = proc->timer + 2;
    x = 0x1e;
    y = sub_80CA9F8(0x50, -1, timer, 7);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x28), gUnknown_08AA709C, 0);
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, 2, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA712A, 0);
    }

    y--, y++;

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x66, OAM0_Y(y - 0x28), gUnknown_08AA709C, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(2, 0x6a, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, 0x7a, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA712A, 0);
    }

    y = sub_80CA9F8(0x50, 1, timer, 7);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0x2a, OAM0_Y(y - 0x28), gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, 0x2e, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, 0x3e, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA712A, 0);
    }

    y--, y++;

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, 0xa2, OAM0_Y(y - 0x28), gUnknown_08AA709C, OAM2_CHR(0x2D0) + OAM2_PAL(6));
        PutSpriteExt(2, 0xa6, (OAM0_Y(y - 0x28)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x348) + OAM2_PAL(7));
        PutSpriteExt(0, 0xb6, (OAM0_Y(y - 0x28)) | OAM0_WINDOW, gUnknown_08AA712A, 0);
    }

    if (proc->timer == 7)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CBA64
void sub_80CBA64(struct ProcOpAnim * proc)
{
    int y;
    int x;
    int timer;

    timer = proc->timer + 2;
    x = 0x78;
    y = sub_80CA9F8(0x1c, -1, timer, 6);

    if ((y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, (x - 0x30), OAM0_Y(y - 0x30), gUnknown_08AA709C, 0);
        PutSpriteExt(2, (x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, (x - 0x60), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnknown_08AA715C, 0);
    }

    timer = proc->timer + 6;
    y = sub_80CA9F8(0x50, -1, timer, 6);

    if ((x != 0x0000FFFF) && (y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x30), gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x60), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnknown_08AA715C, 0);
    }

    timer = proc->timer + 10;
    y = sub_80CA9F8(0x84, -1, timer, 6);

    if ((x != 0x0000FFFF) && (y != 0x0000FFFF) && (y >= -0x28) && (y < 0xc9))
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), OAM0_Y(y - 0x30), gUnknown_08AA709C, OAM2_CHR(0x1E0) + OAM2_PAL(4));
        PutSpriteExt(
            2, OAM1_X(x - 0x2c), (OAM0_Y(y - 0x30)) | OAM0_BLEND, gUnknown_08AA709C, OAM2_CHR(0x258) + OAM2_PAL(5));
        PutSpriteExt(0, OAM1_X(x - 0x60), (OAM0_Y(y - 0x18)) | OAM0_WINDOW, gUnknown_08AA715C, 0);
    }

    if (proc->timer == 6)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CBC40
void sub_80CBC40(struct ProcOpAnim * proc)
{
    int timer;
    int x;
    int i;
    u16 * ptr;

    timer = proc->timer + 2;
    x = sub_80CA9F8(0x3e, -1, timer, 5);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0x28, gUnknown_08AA709C, 0);
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x428, gUnknown_08AA709C, OAM2_CHR(0x78) + OAM2_PAL(1));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000828, gUnknown_08AA7194, 0);
    }

    x = sub_80CA9F8(0xb2, +1, timer, 5);

    if (x != 0x0000FFFF)
    {
        PutSpriteExt(1, OAM1_X(x - 0x30), 0x28, gUnknown_08AA709C, OAM2_CHR(0xF0) + OAM2_PAL(2));
        PutSpriteExt(2, OAM1_X(x - 0x2c), 0x428, gUnknown_08AA709C, OAM2_CHR(0x168) + OAM2_PAL(3));
        PutSpriteExt(0, OAM1_X(x - 0x38), 0x00000828, gUnknown_08AA7194, 0);
    }

    if (proc->timer == 1)
    {
        Decompress(Tsa_OpAnimShiningRingBlinking, (void *)0x0600F000);

        ptr = (void *)0x0600F000;
        for (i = 0; i < 0x280; i++, ptr++)
        {
            *ptr = *ptr + 0x8000;
        }
    }

    if (proc->timer == 5)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080CBD7C
void sub_80CBD7C(struct ProcOpAnim * proc)
{
    EndAllProcChildren(proc);
    EndProc08AA6D04();
    SetPrimaryHBlankHandler(NULL);
    EndOpAnimfxTerminator();

    gLCDControlBuffer.dispcnt.obj1dMap = 0;

    gPaletteBuffer[0] = gOpAnimSt.pal;
    EnablePaletteSync();

    SetDispEnable(0, 0, 0, 0, 0);

    return;
}
