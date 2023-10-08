#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "game-introfx.h"

void Initialize6CIntroSequence(struct ProcGameIntro * proc)
{
    Sound_FadeOutBGM(1);
    SetupBackgrounds(0);
    SetPrimaryHBlankHandler(NULL);

    proc->timer = 0;
    gUnknown_02022188.unk0C = 0;
    gLCDControlBuffer.dispcnt.obj1dMap = 1;
    SetDispEnable(0, 0, 0, 0, 0);

    Decompress(gUnknown_08AF1AE8, OBJ_VRAM0 + 0x0000);
    Decompress(gUnknown_08AF1B38, OBJ_VRAM0 + 0x0100);
    Decompress(gUnknown_08AF1FD0, OBJ_VRAM0 + 0x08C0);
    Decompress(gUnknown_08AF2654, OBJ_VRAM0 + 0x1140);

    CopyToPalGameIntro(gUnknown_08AF1B18, 0x200, 0x20);
    CopyToPalGameIntro(gUnknown_08AF1FB0, 0x220, 0x20);
    CopyToPalGameIntro(gUnknown_08AF2634, 0x240, 0x20);
    CopyToPalGameIntro(gUnknown_08AF310C, 0x260, 0x20);

    CpuFastFill16(-1, OBJ_VRAM0 + 0x7800, 0x800);
    SetNextGameActionId(GAME_ACTION_3);
    NewGameIntrofxTerminator(proc);
}

void GameIntroAllBlack(struct ProcGameIntroFadeIn * proc)
{
    gLCDControlBuffer.bldcnt.effect = 0x2;
    gLCDControlBuffer.blendY = 0;
    SetBlendTargetA(1, 1, 1, 1, 1);
    proc->cur = 0;
}

void GameIntroFadeInMain(struct ProcGameIntroFadeIn * proc)
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

CONST_DATA struct ProcCmd ProcScr_GameIntroFadeIn[] = {
    PROC_YIELD,
    PROC_CALL(GameIntroAllBlack),
    PROC_REPEAT(GameIntroFadeInMain),
    PROC_END
};

void NewProcGameIntroFadeIn(int max, ProcPtr parent)
{
    struct ProcGameIntroFadeIn * proc;
    proc = Proc_Start(ProcScr_GameIntroFadeIn, parent);
    proc->max = max;
}

void BgAffineSetGameIntro(int scaling_radio, int angle)
{
    struct BgAffineSrcData data;
    data.texX = 0x10000;
    data.texY = 0x10000;
    data.scrX = 0x78;
    data.scrY = 0x50;
    data.sx = scaling_radio;
    data.sy = scaling_radio;
    data.alpha = angle << 8;

    BgAffineSet(&data, &gGameIntroBgAffineDstData, 1);
}

void GameIntroInitScreen(struct ProcGameIntro * proc)
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

    Decompress(Img_GameIntroWorldMap, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_2));
    Decompress(img_08AB5D90, (void *)BG_VRAM + 0xF000);
    CpuFastFill16(0, gPaletteBuffer, 0x20);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    Decompress(img_08AB632C, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_1));
    ApplyPaletteGameIntro(pal_08AB7DB0, 2);

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

void GameIntroBldAlphaInit(struct ProcGameIntroBLDALPHA * proc)
{
    proc->timer = 0;
}

void GameIntroBldAlphaUpdateBgPalette(struct ProcGameIntroBLDALPHA * proc)
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
        gUnknown_02022188.unk0C = 0x7FFF;
        SetBlendTargetA(0, 0, 0, 0, 1);
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void GameIntroBldAlphaDelay(struct ProcGameIntroBLDALPHA * proc)
{
    if (proc->timer == 8)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void GameIntroBldAlphaMain(struct ProcGameIntroBLDALPHA * proc)
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

CONST_DATA struct ProcCmd ProcScr_GameIntroBLDALPHA[] = {
    PROC_CALL(GameIntroBldAlphaInit),
    PROC_REPEAT(GameIntroBldAlphaUpdateBgPalette),
    PROC_REPEAT(GameIntroBldAlphaDelay),
    PROC_REPEAT(GameIntroBldAlphaMain),
    PROC_END,
};

bool GameIntroBldAlphaExists(void)
{
    return Proc_Find(ProcScr_GameIntroBLDALPHA) ? true : false;
}

void GameIntroUpdateScreen1(struct ProcGameIntro * proc)
{
    SetSpecialColorEffectsParameters(1, 8, 0x10, 8);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);
    SetDispEnable(0, 1, 1, 0, 1);
    proc->unk2C = 0;
    proc->unk2E = 0;
}

void sub_80C6F70(struct ProcGameIntro * proc)
{
    if (!(proc->timer & 1))
        proc->unk2C++;

    if (!(proc->timer & 3))
        proc->unk2E++;

    BG_SetPosition(BG_1, proc->unk2C, proc->unk2E);

    if (proc->timer <= 0x60)
    {
        int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x60);
        ApplyPaletteGameIntro(pal_08AB630C, 0);
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
        NewProcGameIntroFadeIn(0x20, proc);
    }

    if (proc->timer == 0x110)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void sub_80C7050(struct ProcGameIntro * proc)
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
    gUnknown_02022188.unk08 = gUnknown_02022188.unk02;
    gUnknown_02022188.unk0A = gUnknown_02022188.unk06;
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

void GameIntro1_UpdateScrollOneLine(s16 index)
{
    int i;
    s16 _index;
    u16 * tsa, * vram = (void *)BG_VRAM + 0xE800;

    if ((u16)index > 99)
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

void GameIntro1_UpdateScroll(int new, int old)
{
    int i;
    for (i = (old >> 3) + 0x15; i < ((new >> 3) + 0x15); i++)
        GameIntro1_UpdateScrollOneLine(i);

    BG_SetPosition(2, 0, 0x60 - new);
}
