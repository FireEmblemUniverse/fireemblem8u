#include "gbafe.h"

void sub_805AA68(void *);
void sub_805AE14(void *);
void sub_805AE40(void *, s16, s16, s16, s16);

CONST_DATA struct ProcCmd gProc_ekrDispUP[] = {
    PROC_NAME("ekrDispUP"),
    PROC_REPEAT(ekrDispUPMain),
    PROC_END
};

void NewEkrDispUP(void)
{
    gpProcEkrDispUP = Proc_Start(gProc_ekrDispUP, PROC_TREE_5);
    EkrDispUP_SetPositionUnsync(0, 0);
    EkrDispUpClear4C50();
    UnAsyncEkrDispUP();
    UnsyncEkrDispUP();
}

void EndEkrDispUP(void)
{
    Proc_End(gpProcEkrDispUP);
}

void EkrDispUpClear4C50(void)
{
    gpProcEkrDispUP->unk4C = 0;
    gpProcEkrDispUP->unk50 = 0;
}

void EkrDispUpSet4C50(void)
{
    gpProcEkrDispUP->unk4C = 1;
    gpProcEkrDispUP->unk50 = 1;
}

void EkrDispUpSet4C(void)
{
    gpProcEkrDispUP->unk4C = 1;
}

void EkrDispUpSet50(void)
{
    gpProcEkrDispUP->unk50 = 1;
}

void EkrDispUP_SetPositionUnsync(u16 x, u16 y)
{
    gpProcEkrDispUP->x = x; /* unused actually */
    gpProcEkrDispUP->y = y; /* unused actually */
    gpProcEkrDispUP->sync = 0;
}

void EkrDispUP_SetPositionSync(u16 x, u16 y)
{
    gpProcEkrDispUP->x = x; /* unused actually */
    gpProcEkrDispUP->y = y; /* unused actually */
    gpProcEkrDispUP->sync = 1;
}

void SyncEkrDispUP(void)
{
    gpProcEkrDispUP->sync = true;
}

void UnsyncEkrDispUP(void)
{
    gpProcEkrDispUP->sync = false;
}

void AsyncEkrDispUP(void)
{
    gpProcEkrDispUP->asnyc = true;
}

void UnAsyncEkrDispUP(void)
{
    gpProcEkrDispUP->asnyc = false;
}

#define gBG0TilemapBuffer2D ((u16 (*)[1])gBG0TilemapBuffer)

void ekrDispUPMain(struct ProcEkrDispUP *proc)
{
    int val0, iy, height, map_idx, ix1;
    int ix2 = 15; // for matching

    if (proc->asnyc == true)
        return;

    if (proc->sync != false)
        return;

    val0 = (proc->y << 0x10) >> 0x13;
    iy = val0 << 5;
    if (iy < 0)
        iy = 0;

    height = val0 + 7;
    if (height > 6)
        height = 6;

    map_idx = 30 * (6 - height);

    if (gEkrDistanceType >= 0)
    {
        if (gEkrDistanceType <= 2)
            ix1 = 0;
        else
            goto label;
    }
    else
    {
        ix1 = 0; // for matching, can be any value
    label:
        ix1 = 15;
    }

    FillBGRect(gBG0TilemapBuffer, 30, 7, 0, 128);

    if (height > 0) {
        if (proc->unk4C == 0) { 
            EfxTmCpyBG(&gUnknown_0880210C[map_idx], &gBG0TilemapBuffer2D[iy][ix1], 15, height, -1, -1);
            sub_8070D04(&gBG0TilemapBuffer2D[iy][ix1], 15, height, 2, 128);
        }

        if (proc->unk50 == 0) {
            EfxTmCpyBG(&gUnknown_088021C0[map_idx], &gBG0TilemapBuffer2D[iy][ix2], ix2, height, -1, -1);
            sub_8070D04(&gBG0TilemapBuffer2D[iy][ix2], 15, height, 3, 128);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void EfxClearScreenFx(void)
{
    gLCDControlBuffer.dispcnt.mode = 0;
    SetDispEnable(1, 1, 1, 1, 1);
    gLCDControlBuffer.dispcnt.obj1dMap = 0;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    SetBackgroundTileDataOffset(BG_0, 0);
    SetBackgroundTileDataOffset(BG_1, 0);
    SetBackgroundTileDataOffset(BG_2, 0);
    SetBackgroundTileDataOffset(BG_3, 0x8000);

    SetBackgroundMapDataOffset(BG_0, 0x6000);
    SetBackgroundMapDataOffset(BG_1, 0x6800);
    SetBackgroundMapDataOffset(BG_2, 0x7000);
    SetBackgroundMapDataOffset(BG_3, 0x7800);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    CpuFastFill16(0, gBG0TilemapBuffer, 0x800);
    CpuFastFill16(0, gBG1TilemapBuffer, 0x800);
    CpuFastFill16(0, gBG2TilemapBuffer, 0x800);

    if (GetBattleAnimArenaFlag() == false)
        sub_8051E00();
    else
        CpuFastFill16(0, gBG2TilemapBuffer, 0x800);

    EfxPrepareScreenFx();
    EnablePaletteSync();

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    SetDefaultColorEffects();
}

void sub_8051E00(void)
{
    struct BanimUnkStructComm * unk0201FADC = &gUnknown_0201FADC;
    struct BattleAnimTerrain * terrain1 = &battle_terrain_table[gBanimFloorfx[0]];
    struct BattleAnimTerrain * terrain2 = &battle_terrain_table[gBanimFloorfx[1]];

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_PROMOTION:
        gUnknown_0200003C[0] = &gUnk_Banim_020145C8[0];
        gUnknown_0200003C[1] = &gUnk_Banim_020145C8[0x1000];
        break;

    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
    case EKR_DISTANCE_MONOCOMBAT:
        gUnknown_0200003C[0] = &gUnk_Banim_020145C8[0x800];
        gUnknown_0200003C[1] = &gUnk_Banim_020145C8[0x1800];
        break;

    }

    switch (gPlaySt.chapterWeatherId) {
        // dummy, both cases do the same thing
    case WEATHER_SNOW:
        gBanimTerrainPaletteMaybe[0] = terrain1->palette;
        gBanimTerrainPaletteMaybe[1] = terrain2->palette;
        break;

    default:
        gBanimTerrainPaletteMaybe[0] = terrain1->palette;
        gBanimTerrainPaletteMaybe[1] = terrain2->palette;
        break;
    }

    gUnknown_02000044[0] = gUnknown_085B9D6C[gEkrDistanceType * 2];
    gUnknown_02000044[1] = gUnknown_085B9D6C[gEkrDistanceType * 2 + 1];

    unk0201FADC->unk00 = gBanimFloorfx[0];
    unk0201FADC->unk02 = 4;
    unk0201FADC->unk04 = 640;
    unk0201FADC->unk06 = gBanimFloorfx[1];
    unk0201FADC->unk08 = 5;
    unk0201FADC->unk0A = 640;
    unk0201FADC->unk0C = gEkrDistanceType;
    unk0201FADC->unk0E = 2;
    unk0201FADC->unk1C = 0;
    unk0201FADC->unk20 = &gUnk_Banim_020145C8[0];
    unk0201FADC->unk10 = (u16)gEkrSnowWeather;
    sub_805AA68(unk0201FADC);
}

void EfxPrepareScreenFx(void)
{
    const char *str;

    ApplyPalette(Pal_Text, 2);
    ApplyPalette(Pal_Text, 3);
    InitTextFont(&gBanimFont, (void *)0x6001880, 0xC4, 2);
    SetTextDrawNoClear();
    LZ77UnCompVram(gUnknown_08801C14, (void *)0x6001000);

    /* left unit name */
    if (gBanimValid[EKR_POS_L] == false)
        str = gNopStr;
    else
        str = GetStringFromIndex(gpEkrBattleUnitLeft->unit.pCharacterData->nameTextId);

    InitText(&gBanimText[0], 7);
    Text_SetCursor(&gBanimText[0], GetStringTextCenteredPos(0x38, str));
    LZ77UnCompVram(Img_EfxLeftNameBox, (void *)0x6001880);
    Text_DrawString(&gBanimText[0], str);

    /* left unit item */
    if (gBanimValid[EKR_POS_L] == false)
        str = gNopStr;
    else
        str = GetItemName(gpEkrBattleUnitLeft->weaponBefore);

    InitText(&gBanimText[2], 8);
    Text_SetCursor(&gBanimText[2], GetStringTextCenteredPos(0x40, str));
    LZ77UnCompVram(Img_EfxLeftItemBox, (void *)0x6001A40);
    Text_DrawString(&gBanimText[2], str);

    /* right unit name */
    if (gBanimValid[EKR_POS_R] == false)
        str = gNopStr;
    else
        str = GetStringFromIndex(gpEkrBattleUnitRight->unit.pCharacterData->nameTextId);

    InitText(&gBanimText[3], 7);
    Text_SetCursor(&gBanimText[3], GetStringTextCenteredPos(0x38, str));
    LZ77UnCompVram(Img_EfxRightNameBox, (void *)0x6001C40);
    Text_DrawString(&gBanimText[3], str);

    /* right unit item */
    if (gBanimValid[EKR_POS_R] == false)
        str = gNopStr;
    else
        str = GetItemName(gpEkrBattleUnitRight->weaponBefore);

    InitText(&gBanimText[1], 8);
    Text_SetCursor(&gBanimText[1], GetStringTextCenteredPos(0x3E, str));
    LZ77UnCompVram(Img_EfxRightItemBox, (void *)0x6001E00);
    Text_DrawString(&gBanimText[1], str);

    BG_Fill(gBG0TilemapBuffer, 0x80);
    EfxTmCpyBG(gUnknown_08802508, gBG0TilemapBuffer + 0x1E, 2, 20, -1, -1);
    sub_8070D04(gBG0TilemapBuffer + 0x1F, 1, 20, 2, 128);
    sub_8070D04(gBG0TilemapBuffer + 0x1E, 1, 20, 3, 128);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    CpuFastCopy(&PAL_BUF_COLOR(gUnknown_08802558, gBanimFactionPal[POS_L], 0), PAL_BG(0x2), 0x20);
    CpuFastCopy(&PAL_BUF_COLOR(gUnknown_08802558, gBanimFactionPal[POS_R], 0), PAL_BG(0x3), 0x20);
    EnablePaletteSync();

    gEkrBg0QuakeVec.x = 0;
    gEkrBg0QuakeVec.y = 0;
    BG_SetPosition(BG_0, 0, 0);
}

int GetBanimInitPosReal(void)
{
    int quote1, quote2;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_FAR:
        return gEkrInitialHitSide;

    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_MONOCOMBAT:
    case EKR_DISTANCE_PROMOTION:
        return EKR_POS_R;

    case EKR_DISTANCE_FARFAR:
    default:
        quote2 = false;
        quote1 = false;

        if (gEkrDebugModeMaybe == 0) {
            quote1 = ShouldCallBattleQuote(gEkrPids[EKR_POS_L],  gEkrPids[EKR_POS_R]);
            quote2 = ShouldCallBattleQuote(gEkrPids[EKR_POS_R], gEkrPids[EKR_POS_L]);
        }

        if (quote1 == true)
            return EKR_POS_L;
        else if (quote2 == true)
            return EKR_POS_R;
        else
            return gEkrInitialHitSide;
    }
}

void SetEkrBg2QuakeVec(int a, int b)
{
    gEkrBg2QuakeVec.x = a;
    gEkrBg2QuakeVec.y = b;
}

void EkrEfxStatusClear(void)
{
    gEkrHPBarCount = 0;
    gEfxSpellAnimExists = 0;
    gUnknown_02017730 = 0;
    gEkrDeadEventExist = 0;
    gUnknown_0201773C = 0;
    gUnknown_02017740 = 0;
    gUnknown_02017748 = 0;
    gEfxBgSemaphore = 0;
    gUnknown_02017750 = 0;
    gUnknown_02017754 = 0;
    gUnknown_02017758 = 0;
    gUnknown_0201775C = 0;
    SetEkrBg2QuakeVec(0, 0);
    gUnknown_02017764[0] = 0;
    gUnknown_02017764[1] = 0;
    gUnknown_02017768[0] = 0;
    gUnknown_02017768[1] = 0;
    gEkrHitEfxBool[0] = 0;
    gEkrHitEfxBool[1] = 0;

    gpProcEfxStatusUnits[EKR_POS_L] = NULL;
    gpProcEfxStatusUnits[EKR_POS_R] = NULL;

    gpProcEfxSpellCast = NULL;
    gpProcEfxHPBarColorChange = NULL;
}
