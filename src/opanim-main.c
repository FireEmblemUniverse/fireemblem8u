#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"

void Initialize6CIntroSequence(struct ProcOpAnim * proc)
{
    Sound_FadeOutBGM(1);
    SetupBackgrounds(0);
    SetPrimaryHBlankHandler(NULL);

    proc->timer = 0;
    gOpAnimSt.unk0C = 0;
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
        gOpAnimSt.unk0C = 0x7FFF;
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
    gOpAnimSt.unk08 = gOpAnimSt.unk02;
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
    img_gameintro1,
    img_gameintro2,
    img_gameintro3,
    img_gameintro4,
    img_gameintro5,
    img_gameintro6,
    img_gameintro7,
    img_gameintro8,
    img_gameintro9,
    img_gameintro10,
    img_gameintro11,
    img_gameintro12,
    img_gameintro13,
    img_gameintro14,
    img_gameintro15,
    img_gameintro16,
    img_gameintro17,
    img_gameintro18,
    img_gameintro19,
    img_gameintro20,
    img_gameintro21,
    img_gameintro22,
    img_gameintro23,
    img_gameintro24,
    img_gameintro25,
    img_gameintro26,
    img_gameintro27,
    img_gameintro28,
    img_gameintro29,
    img_gameintro30,
    img_gameintro31,
    img_gameintro32,
    img_gameintro33,
    img_gameintro34,
    img_gameintro35,
    img_gameintro36,
    img_gameintro37,
    img_gameintro38,
    img_gameintro39,
    img_gameintro40,
    img_gameintro41,
    img_gameintro42,
    img_gameintro43,
    img_gameintro44,
    img_gameintro45,
    img_gameintro46,
    img_gameintro47,
    img_gameintro48,
    img_gameintro49,
    img_gameintro50,
    img_gameintro51,
    img_gameintro52,
    img_gameintro53,
    img_gameintro54,
    img_gameintro55,
    img_gameintro56,
    img_gameintro57,
    img_gameintro58,
    img_gameintro59,
    img_gameintro60,
    img_gameintro61,
    img_gameintro62,
    img_gameintro63,
    img_gameintro64,
    img_gameintro65,
    img_gameintro66,
    img_gameintro67,
    img_gameintro68,
    img_gameintro69,
    img_gameintro70,
    img_gameintro71,
    img_gameintro72,
    img_gameintro73,
    img_gameintro74,
    img_gameintro75,
    img_gameintro76,
    img_gameintro77,
    img_gameintro78,
    img_gameintro79,
    img_gameintro80,
    img_gameintro81,
    img_gameintro82,
    img_gameintro83,
    img_gameintro84,
    img_gameintro85,
    img_gameintro86,
    img_gameintro87,
    img_gameintro88,
    img_gameintro89,
    img_gameintro90,
    img_gameintro91,
    img_gameintro92,
    img_gameintro93,
    img_gameintro94,
    img_gameintro95,
    img_gameintro96,
    img_gameintro97,
    img_gameintro98,
    img_gameintro99,
    img_gameintro100,
};

CONST_DATA u16 * tsas_08AA6EA4[100] = {
    tsa_gameintro1,
    tsa_gameintro2,
    tsa_gameintro3,
    tsa_gameintro4,
    tsa_gameintro5,
    tsa_gameintro6,
    tsa_gameintro7,
    tsa_gameintro8,
    tsa_gameintro9,
    tsa_gameintro10,
    tsa_gameintro11,
    tsa_gameintro12,
    tsa_gameintro13,
    tsa_gameintro14,
    tsa_gameintro15,
    tsa_gameintro16,
    tsa_gameintro17,
    tsa_gameintro18,
    tsa_gameintro19,
    tsa_gameintro20,
    tsa_gameintro21,
    tsa_gameintro22,
    tsa_gameintro23,
    tsa_gameintro24,
    tsa_gameintro25,
    tsa_gameintro26,
    tsa_gameintro27,
    tsa_gameintro28,
    tsa_gameintro29,
    tsa_gameintro30,
    tsa_gameintro31,
    tsa_gameintro32,
    tsa_gameintro33,
    tsa_gameintro34,
    tsa_gameintro35,
    tsa_gameintro36,
    tsa_gameintro37,
    tsa_gameintro38,
    tsa_gameintro39,
    tsa_gameintro40,
    tsa_gameintro41,
    tsa_gameintro42,
    tsa_gameintro43,
    tsa_gameintro44,
    tsa_gameintro45,
    tsa_gameintro46,
    tsa_gameintro47,
    tsa_gameintro48,
    tsa_gameintro49,
    tsa_gameintro50,
    tsa_gameintro51,
    tsa_gameintro52,
    tsa_gameintro53,
    tsa_gameintro54,
    tsa_gameintro55,
    tsa_gameintro56,
    tsa_gameintro57,
    tsa_gameintro58,
    tsa_gameintro59,
    tsa_gameintro60,
    tsa_gameintro61,
    tsa_gameintro62,
    tsa_gameintro63,
    tsa_gameintro64,
    tsa_gameintro65,
    tsa_gameintro66,
    tsa_gameintro67,
    tsa_gameintro68,
    tsa_gameintro69,
    tsa_gameintro70,
    tsa_gameintro71,
    tsa_gameintro72,
    tsa_gameintro73,
    tsa_gameintro74,
    tsa_gameintro75,
    tsa_gameintro76,
    tsa_gameintro77,
    tsa_gameintro78,
    tsa_gameintro79,
    tsa_gameintro80,
    tsa_gameintro81,
    tsa_gameintro82,
    tsa_gameintro83,
    tsa_gameintro84,
    tsa_gameintro85,
    tsa_gameintro86,
    tsa_gameintro87,
    tsa_gameintro88,
    tsa_gameintro89,
    tsa_gameintro90,
    tsa_gameintro91,
    tsa_gameintro92,
    tsa_gameintro93,
    tsa_gameintro94,
    tsa_gameintro95,
    tsa_gameintro96,
    tsa_gameintro97,
    tsa_gameintro98,
    tsa_gameintro99,
    tsa_gameintro100,
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

void sub_80C73B0(struct ProcOpAnim * proc)
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
        Decompress(gUnknown_08ABF168, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_0));
        Decompress(gUnknown_08AC1878, gGenericBuffer);
        break;

    case 2:
        Decompress(gUnknown_08AC0BD8, (void *)BG_VRAM + 0x2000 + GetBackgroundTileDataOffset(BG_0));
        Decompress(gUnknown_08AC1B98, gGenericBuffer + 0x800);
        break;

    case 3:
        Decompress(gUnknown_08ABB14C, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_2));
        Decompress(gUnknown_08ABC074, gGenericBuffer + 0x1000);
        ApplyPalettesOpAnim(Pal_08AC1C8C, 0, 11);
        break;

    case 4:
        Decompress(gUnknown_08ABE304, (void *)BG_VRAM + 0x8000);
        Decompress(gUnknown_08ABEF70, (void *)BG_VRAM + 0xC000);
        break;

    case 5:
    {
        Decompress(gUnknown_08ABD348, (void *)BG_VRAM + 0xA000);
        Decompress(gUnknown_08ABE120, (void *)BG_VRAM + 0xC800);

        dst = (void *)BG_VRAM + 0xC800;
        for (i = 0; i < 0x280; ++i)
            dst[i] += 0x100;

        break;
    }
    case 6:
    {
        for (i = 1; i < 0x10; ++i)
            gPaletteBuffer[0xf0 + i] = RGB_BLACK;

        CpuFastCopy((u16 *)(gGenericBuffer + 0x1000), (u16 *)(gGenericBuffer + 0x1000) + 0x400, 0x800);
        dst = (u16 *)(gGenericBuffer + 0x1000) + 0x400;
        for (i = 0; i < 0x280; ++i)
            dst[i] = (dst[i] & 0xFFF) | 0xF000;

        CpuFastCopy(dst, (void *)BG_VRAM + 0xF000, 0x500);
        EnablePaletteSync();
        SetDispEnable(0, 1, 1, 1, 1);

        proc->timer = 0;
        proc->unk30 = 0;
        proc->unk32 = 0;

        gOpAnimSt.unk00 = 0;
        gOpAnimSt.unk02 = 0;
        gOpAnimSt.unk04 = 0;
        gOpAnimSt.unk06 = 0xA0;
        gOpAnimSt.unk0C = 0;
        SetBackgroundTileDataOffset(BG_2, 0x8000);
        Proc_Break(proc);
        return;
    }
    default:
        break;
    }
    proc->timer++;
}

void Proc08AA7034_Init(struct Proc08AA7034 * proc)
{
    proc->timer = 0;
}

void Proc08AA7034_Main(struct Proc08AA7034 * proc)
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

CONST_DATA struct ProcCmd ProcScr_08AA7034[] = {
    PROC_CALL(Proc08AA7034_Init),
    PROC_REPEAT(Proc08AA7034_Main),
    PROC_END
};

void GameIntoCharCgFlyInMaybe(int xOam1, int yOam0)
{
    int i;
    for (i = 0; i < 8; i++)
        PutSpriteExt(0, i << 5, yOam0, gObject_32x8, 4);

    for (i = 0; i < 8; i++)
        PutSpriteExt(0, xOam1, i << 5, gObject_8x32, 0);
}

void sub_80C76C8(struct ProcOpAnim * proc)
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
            Decompress(gUnknown_08ABC22C, (void *)BG_VRAM + 0x8000);
            TsaModifyFirstPalMaybe(ret, proc->unk30, 0x88, BG_2, (void *)BG_VRAM + 0xC800, NULL, 0);
            break;

        case 14:
            Decompress(gUnknown_08ABD174, (void *)BG_VRAM + 0xC000);
            TsaModifyFirstPalMaybe(ret, 0, 0x88, BG_2, (void *)BG_VRAM + 0xC000, NULL, 0);
            break;

        case 15:
        default:
            TsaModifyFirstPalMaybe(ret, proc->unk30, 0x88, BG_2, (void *)BG_VRAM + 0xC000, NULL, 0);
            break;

        case 16:
            TsaModifyFirstPalMaybe(ret, 0, 0x88, BG_2, (void *)(gGenericBuffer + 0x1000), NULL, 0);
            SetBackgroundTileDataOffset(BG_2, 0x4000);
            Proc_Start(ProcScr_08AA7034, proc);
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

    SetWin0Box(0, 0, gOpAnimSt.unk00, 0xA0);

    SetBackgroundMapDataOffset(BG_2, 0xF000);
    SetBlendTargetA(0, 1, 1, 0, 0);
    Proc_Break(proc);
}
#if 0
void sub_80C79F4(struct ProcOpAnim * proc)
{
    gOpAnimSt.unk00 =
        Interpolate(4, 0, 0xF0, proc->timer, 0x10);

    gOpAnimSt.unk02 =
        Interpolate(4, 0, 0xA0, proc->timer, 0x10);

    SetWin0Box(0, 0, gOpAnimSt.unk00, 0xA0);
}
#endif
