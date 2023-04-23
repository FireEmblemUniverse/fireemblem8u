#include "global.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"
#include "ekrlevelup.h"
#include "bmitem.h"
#include "proc.h"
#include "banim_data.h"

extern struct Anim *gUnknown_02000000[4];

void sub_8051CC4(void)
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

    sub_8051F1C();
    EnablePaletteSync();

    BG_EnableSyncByMask(BG0_SYNC_BIT);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    SetDefaultColorEffects();
}

void sub_8051E00(void)
{
    struct Unknown_0201FADC *unk0201FADC = &gUnknown_0201FADC;
    BattleAnimTerrain *terrain1 = &battle_terrain_table[gBanimTerrainIndexMaybe[0]];
    BattleAnimTerrain *terrain2 = &battle_terrain_table[gBanimTerrainIndexMaybe[1]];

    switch (gEkrSomeType) {
    case 0:
    case 4:
        gUnknown_0200003C[0] = &gUnknown_020145C8[0];
        gUnknown_0200003C[1] = &gUnknown_020145C8[0x1000];
        break;

    case 1:
    case 2:
    case 3:
        gUnknown_0200003C[0] = &gUnknown_020145C8[0x800];
        gUnknown_0200003C[1] = &gUnknown_020145C8[0x1800];
        break;

    }

    switch (gPlaySt.chapterWeatherId) {
        // dummy, both cases do the same thing
    case 1:
        gBanimTerrainPaletteMaybe[0] = terrain1->palette;
        gBanimTerrainPaletteMaybe[1] = terrain2->palette;
        break;

    default:
        gBanimTerrainPaletteMaybe[0] = terrain1->palette;
        gBanimTerrainPaletteMaybe[1] = terrain2->palette;
        break;
    }

    gUnknown_02000044[0] = gUnknown_085B9D6C[gEkrSomeType * 2];
    gUnknown_02000044[1] = gUnknown_085B9D6C[gEkrSomeType * 2 + 1];

    unk0201FADC->things[0] = gBanimTerrainIndexMaybe[0];
    unk0201FADC->things[1] = 4;
    unk0201FADC->things[2] = 640;
    unk0201FADC->things[3] = gBanimTerrainIndexMaybe[1];
    unk0201FADC->things[4] = 5;
    unk0201FADC->things[5] = 640;
    unk0201FADC->things[6] = gEkrSomeType;
    unk0201FADC->things[7] = 2;
    unk0201FADC->u1c = 0;
    unk0201FADC->u20 = &gUnknown_020145C8[0];
    unk0201FADC->_pad_10 = gUnknown_0203E102;
    sub_805AA68(unk0201FADC);
}

void sub_8051F1C(void)
{
    const char *str;

    CopyToPaletteBuffer(Pal_UIFont, 0x40, 0x20);
    CopyToPaletteBuffer(Pal_UIFont, 0x60, 0x20);
    Font_InitForUI(&gSomeFontStruct, (void *)0x6001880, 0xC4, 2);
    Font_SetSomeSpecialDrawingRoutine();
    LZ77UnCompVram(gUnknown_08801C14, (void *)0x6001000);

    /* left unit name */
    if (gBanimSideVaildFlagMaybe[EKR_BATTLE_LEFT] == false)
        str = gNopStr;
    else
        str = GetStringFromIndex(gpEkrBattleUnitLeft->unit.pCharacterData->nameTextId);

    Text_Init(&gTextEkrlvupMsg[0], 7);
    Text_SetXCursor(&gTextEkrlvupMsg[0], GetStringTextCenteredPos(0x38, str));
    LZ77UnCompVram(gUnknown_08801F7C, (void *)0x6001880);
    Text_AppendString(&gTextEkrlvupMsg[0], str);

    /* left unit item */
    if (gBanimSideVaildFlagMaybe[EKR_BATTLE_LEFT] == false)
        str = gNopStr;
    else
        str = GetItemName(gpEkrBattleUnitLeft->weaponBefore);

    Text_Init(&gTextEkrlvupMsg[2], 8);
    Text_SetXCursor(&gTextEkrlvupMsg[2], GetStringTextCenteredPos(0x40, str));
    LZ77UnCompVram(gUnknown_08801FF4, (void *)0x6001A40);
    Text_AppendString(&gTextEkrlvupMsg[2], str);

    /* right unit name */
    if (gBanimSideVaildFlagMaybe[EKR_BATTLE_RIGHT] == false)
        str = gNopStr;
    else
        str = GetStringFromIndex(gpEkrBattleUnitRight->unit.pCharacterData->nameTextId);

    Text_Init(&gTextEkrlvupMsg[3], 7);
    Text_SetXCursor(&gTextEkrlvupMsg[3], GetStringTextCenteredPos(0x38, str));
    LZ77UnCompVram(gUnknown_08802044, (void *)0x6001C40);
    Text_AppendString(&gTextEkrlvupMsg[3], str);

    /* right unit item */
    if (gBanimSideVaildFlagMaybe[EKR_BATTLE_RIGHT] == false)
        str = gNopStr;
    else
        str = GetItemName(gpEkrBattleUnitRight->weaponBefore);

    Text_Init(&gTextEkrlvupMsg[1], 8);
    Text_SetXCursor(&gTextEkrlvupMsg[1], GetStringTextCenteredPos(0x3E, str));
    LZ77UnCompVram(gUnknown_088020BC, (void *)0x6001E00);
    Text_AppendString(&gTextEkrlvupMsg[1], str);

    BG_Fill(gBG0TilemapBuffer, 0x80);
    sub_8070E94(gUnknown_08802508, gBG0TilemapBuffer + 0x1E, 2, 20, -1, -1);
    sub_8070D04(gBG0TilemapBuffer + 0x1F, 1, 20, 2, 128);
    sub_8070D04(gBG0TilemapBuffer + 0x1E, 1, 20, 3, 128);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    CpuFastCopy(&PAL_BUF_COLOR(gUnknown_08802558, gUnknown_0203E114[0], 0), &PAL_COLOR(2, 0), 0x20);
    CpuFastCopy(&PAL_BUF_COLOR(gUnknown_08802558, gUnknown_0203E114[1], 0), &PAL_COLOR(3, 0), 0x20);
    EnablePaletteSync();

    gBanimBgPosMaybe.x = 0;
    gBanimBgPosMaybe.y = 0;
    BG_SetPosition(BG_0, 0, 0);
}

int GetEkrSomePosMaybe(void)
{
    int quote1, quote2;

    switch (gEkrSomeType) {
    case 1:
        return gEkrPos1Maybe;

    case 0:
    case 3:
    case 4:
        return EKR_BATTLE_RIGHT;

    case 2:
    default:
        quote2 = false;
        quote1 = false;

        if (gUnknown_0203E0FC == 0) {
            quote1 = ShouldCallBattleQuote(gEkrPids[EKR_BATTLE_LEFT],  gEkrPids[EKR_BATTLE_RIGHT]);
            quote2 = ShouldCallBattleQuote(gEkrPids[EKR_BATTLE_RIGHT], gEkrPids[EKR_BATTLE_LEFT]);
        }

        if (quote1 == true)
            return EKR_BATTLE_LEFT;
        else if (quote2 == true)
            return EKR_BATTLE_RIGHT;
        else
            return gEkrPos1Maybe;
    }
}

void sub_8052214(int a, int b)
{
    gUnknown_02017760[0] = a;
    gUnknown_02017760[1] = b;
}

void EkrEfxStatusClear(void)
{
    gUnknown_02017728 = 0;
    gUnknown_0201772C = 0;
    gUnknown_02017730 = 0;
    gUnknown_02017738 = 0;
    gUnknown_0201773C = 0;
    gUnknown_02017740 = 0;
    gUnknown_02017748 = 0;
    gUnknown_0201774C = 0;
    gUnknown_02017750 = 0;
    gUnknown_02017754 = 0;
    gUnknown_02017758 = 0;
    gUnknown_0201775C = 0;
    sub_8052214(0, 0);
    gUnknown_02017764[0] = 0;
    gUnknown_02017764[1] = 0;
    gUnknown_02017768[0] = 0;
    gUnknown_02017768[1] = 0;
    gEkrHitEfxBool[0] = 0;
    gEkrHitEfxBool[1] = 0;
    gUnknown_0201776C[0] = 0;
    gUnknown_0201776C[1] = 0;
    gUnknown_02017778 = 0;
    gUnknown_0201777C = 0;
}

int sub_80522CC(void)
{
    if (gUnknown_02017728 == 0 && gUnknown_0201772C == 0)
        return true;
    else
        return false;
}

short EkrEfxIsUnitHittedNow(int pos)
{
    return gEkrHitEfxBool[pos];
}

void NewEfxHPBar(struct Anim *anim)
{
    int val1;
    s16 val2;
    struct ProcEfxHPBar *proc;
    int ais_id = GetAISSubjectId(anim);

    if (0x400 & sub_8058A34((anim->nextRoundId - 1) * 2 + ais_id) || gUnknown_02017728 != 0)
        return;

    gUnknown_02017728 = 1;

    proc = Proc_Start(ProcScr_efxHPBar, PROC_TREE_3);
    proc->anim64 = anim;

    if (GetAISSubjectId(anim) == 0) {
        proc->anim5C = gUnknown_02000000[2];
        proc->anim60 = gUnknown_02000000[0];
    } else {
        proc->anim5C = gUnknown_02000000[0];
        proc->anim60 = gUnknown_02000000[2];
    }

    val1 = gUnknown_0203E152[GetAISSubjectId(proc->anim60)];
    val2 = val1 + 1;

    proc->unk4C = sub_8058A60(val1 * 2 + GetAISSubjectId(proc->anim60));
    proc->unk50 = sub_8058A60(val2 * 2 + GetAISSubjectId(proc->anim60));

    if (proc->unk4C > proc->unk50)
        proc->unk48 = -1;
    else
        proc->unk48 = 1;

    proc->unk2C = 0;
    proc->unk2E = proc->unk4C;
    proc->unk54 = 0;
    proc->unk58 = 0;
    gEkrHitEfxBool[GetAISSubjectId(proc->anim60)] = 1;
}

void efxHPBar_80523EC(struct ProcEfxHPBar *proc)
{
    struct Anim *anim1 = gUnknown_02000000[GetAISSubjectId(proc->anim60) * 2];
    struct Anim *anim2 = gUnknown_02000000[GetAISSubjectId(proc->anim60) * 2 + 1];

    if (proc->unk58 == 0) {
        if (++proc->unk2C == 2) {
            proc->unk2C = 0;
            proc->unk2E += proc->unk48;
            gUnknown_0203E1AC[GetAISSubjectId(proc->anim60)] += proc->unk48;

            if (proc->unk2E == proc->unk50)
                proc->unk58 = 1;
        }
    }

    if (proc->unk54 == 0x1E && proc->unk58 == 1) {
        gUnknown_0203E152[GetAISSubjectId(proc->anim60)]++;
        gEkrHitEfxBool[GetAISSubjectId(proc->anim60)] = 0;
    
        if (proc->unk50 == 0) {
            int ret;
            if (GetEkrEventFlagMaybe() == true)
                ret = 0;
            else
                ret = sub_80835A8(gEkrPids[GetAISSubjectId(anim1)]);

            if (ret == true)
                sub_8052DD4(anim1, anim2);
            else {
                sub_805B07C();
                sub_8052FAC(anim1, anim2);
                gBanimSideVaildFlagMaybe[GetAISSubjectId(proc->anim60)] = false;
            }
        }
    
        Proc_Break(proc);
        return;
    }

    if (++proc->unk54 >= 0x1Eu)
        proc->unk54 = 0x1E;
}

void efxHPBar_8052504(struct ProcEfxHPBar *proc)
{
    struct Anim *anim;

    if (gUnknown_0201774C != 0 || gUnknown_0201772C != 0)
        return;

    proc->unk2C = 0;
    proc->unk2E = 1;
    anim = GetCoreAIStruct(proc->anim64);

    if (sub_805A21C(sub_805A2F0(anim)) == 1) {
        switch (gEkrSomeType) {
        case 0:
        case 1:
        case 3:
        case 4:
            proc->unk2E = 0x10;
            sub_80533D0(GetCoreAIStruct(anim), -1);
            break;

        case 2:
            proc->unk2E = 0x14;
            sub_80533D0(GetCoreAIStruct(anim), -1);
            break;
        }
    }

    Proc_Break(proc);
}

void efxHPBar_80525A4(struct ProcEfxHPBar *proc)
{
    if (++proc->unk2C == (proc->unk2E - 4)) {
        GetCoreAIStruct(proc->anim64);
        BG_EnableSyncByMask(BG2_SYNC_BIT);
    } else if (proc->unk2C == proc->unk2E){
        gUnknown_02017728--;
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_efxHPBar[] = {
    PROC_NAME("efxHPBar"),
    PROC_REPEAT(efxHPBar_80523EC),
    PROC_REPEAT(efxHPBar_8052504),
    PROC_REPEAT(efxHPBar_80525A4),
    PROC_END
};

void NewEfxHPBarResire(struct Anim *anim)
{
    int val1;
    s16 val2;
    struct ProcEfxHPBar *proc;

    if (gUnknown_02017728 != 0)
        return;

    gUnknown_02017728 = 1;

    proc = Proc_Start(ProcScr_efxHPBarResire, PROC_TREE_3);
    proc->anim64 = GetCoreAIStruct(anim);

    if (GetAISSubjectId(anim) == 0) {
        proc->anim5C = gUnknown_02000000[2];
        proc->anim60 = gUnknown_02000000[0];
    } else {
        proc->anim5C = gUnknown_02000000[0];
        proc->anim60 = gUnknown_02000000[2];
    }

    val1 = gUnknown_0203E152[GetAISSubjectId(proc->anim60)];
    val2 = val1 + 1;

    proc->unk4C = sub_8058A60(val1 * 2 + GetAISSubjectId(proc->anim60));
    proc->unk50 = sub_8058A60(val2 * 2 + GetAISSubjectId(proc->anim60));

    if (proc->unk4C > proc->unk50)
        proc->unk48 = -1;
    else
        proc->unk48 = 1;

    proc->unk29 = 0;
    proc->unk2C = 0;
    proc->unk2E = proc->unk4C;
    proc->unk54 = 0;
    proc->unk58 = 0;
    gUnknown_02017750 = 0;
    gEkrHitEfxBool[GetAISSubjectId(proc->anim60)] = 1;
}

void EfxHPBarResire_80526C8(struct ProcEfxHPBar *proc)
{
    GetAISSubjectId(proc->anim60);
    GetAISSubjectId(proc->anim60);

    if (proc->unk58 == 0) {
        if (++proc->unk2C == 2) {
            proc->unk2C = 0;
            proc->unk2E += proc->unk48;
            gUnknown_0203E1AC[GetAISSubjectId(proc->anim60)] += proc->unk48;

            if (proc->unk2E == proc->unk50)
                proc->unk58 = 1;
        }
    }

    if (proc->unk54 == 0x54 && proc->unk58 == 1) {
        gUnknown_0203E152[GetAISSubjectId(proc->anim60)]++;
        gEkrHitEfxBool[GetAISSubjectId(proc->anim60)] = 0;

        if (proc->unk50 == 0)
            proc->unk29 = 1;

        proc->unk2C = 0;
        proc->unk2E = 0xA;
        gUnknown_02017750 = 1;

        Proc_Break(proc);
        return;
    }

    if (++proc->unk54 >= 0x54u)
        proc->unk54 = 0x54;
}

void EfxHPBarResire_8052788(struct ProcEfxHPBar *proc)
{
    int val1;
    s16 val2;

    if (++proc->unk2C <= proc->unk2E)
        return;

    val1 = gUnknown_0203E152[GetAISSubjectId(proc->anim5C)];
    val2 = val1 + 1;

    proc->unk4C = sub_8058A60(val1 * 2 + GetAISSubjectId(proc->anim5C));
    proc->unk50 = sub_8058A60(val2 * 2 + GetAISSubjectId(proc->anim5C));

    proc->unk2C = 0;
    proc->unk2E = proc->unk4C;
    proc->unk54 = 0;
    proc->unk58 = 0;

    if (proc->unk4C == proc->unk50)
        proc->unk58 = 1;

    if (proc->unk4C > proc->unk50)
        proc->unk48 = -1;
    else
        proc->unk48 = 1;

    Proc_Break(proc);
    gEkrHitEfxBool[GetAISSubjectId(proc->anim5C)] = 2;
}

void EfxHPBarResire_805282C(struct ProcEfxHPBar *proc)
{
    struct Anim *anim1, *anim2, *anim3, *anim4;

    anim1 = gUnknown_02000000[GetAISSubjectId(proc->anim5C) * 2];
    anim2 = gUnknown_02000000[GetAISSubjectId(proc->anim5C) * 2 + 1];
    anim3 = gUnknown_02000000[GetAISSubjectId(proc->anim60) * 2];
    anim4 = gUnknown_02000000[GetAISSubjectId(proc->anim60) * 2 + 1];

    if (proc->unk58 == 0) {
        if (++proc->unk2C == 4) {
            proc->unk2C = 0;
            proc->unk2E += proc->unk48;
            gUnknown_0203E1AC[GetAISSubjectId(proc->anim5C)] += proc->unk48;
            SomePlaySound_8071990(0x75, 0x100);
            sub_8071AB0(0x75, anim1->xPosition, 1);

            if (proc->unk2E == proc->unk50)
                proc->unk58 = 1;
        }
    }

    if (proc->unk54 == 0x1E && proc->unk58 == 1) {
        gUnknown_0203E152[GetAISSubjectId(proc->anim5C)]++;
        gEkrHitEfxBool[GetAISSubjectId(proc->anim5C)] = 0;
    
        if (proc->unk29 == 1) {
            int ret;
            if (GetEkrEventFlagMaybe() == true)
                ret = 0;
            else
                ret = sub_80835A8(gEkrPids[GetAISSubjectId(anim3)]);

            if (ret == true)
                sub_8052DD4(anim3, anim4);
            else {
                sub_805B07C();
                sub_8052FAC(anim3, anim4);
                gBanimSideVaildFlagMaybe[GetAISSubjectId(proc->anim60)] = false;
            }
        }
    
        Proc_Break(proc);
        return;
    }

    if (++proc->unk54 >= 0x1Eu)
        proc->unk54 = 0x1E;
}

CONST_DATA struct ProcCmd ProcScr_efxHPBarResire[] = {
    PROC_NAME("efxHPBarResire"),
    PROC_REPEAT(EfxHPBarResire_80526C8),
    PROC_REPEAT(EfxHPBarResire_8052788),
    PROC_REPEAT(EfxHPBarResire_805282C),
    PROC_REPEAT(efxHPBar_8052504),
    PROC_REPEAT(efxHPBar_80525A4),
    PROC_END
};
