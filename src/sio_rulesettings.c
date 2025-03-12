#include "global.h"

#include "hardware.h"
#include "bmsave.h"
#include "bmlib.h"
#include "fontgrp.h"

#include "sio_core.h"
#include "sio.h"

//! FE8U = 0x0804766C
void LoadLinkArenaRuleSettings(u8 * buf)
{
    buf[0] = gLinkArenaSt.unk_ec.unk_0_0;
    buf[1] = gLinkArenaSt.unk_ec.unk_0_1;
    buf[2] = gLinkArenaSt.unk_ec.unk_0_2;

    return;
}

//! FE8U = 0x0804768C
void SaveLinkArenaRuleSettings(u8 * buf)
{
    struct LinkArenaStMaybe * las = &gLinkArenaSt;
    struct LinkArenaStMaybe_ec * unk_ec = &las->unk_ec;

    { u32 r4 = 1; ++r4; --r4; }

    unk_ec->unk_0_0 = buf[0] % 2;
    unk_ec->unk_0_1 = buf[1] % 2;
    unk_ec->unk_0_2 = buf[2] % 2;

    return;
}

//! FE8U = 0x080476CC
void sub_80476CC(int idx, int state)
{
    int i;

    // clang-format off

    const int textColorLut[2] =
    {
        TEXT_COLOR_SYSTEM_BLUE,
        TEXT_COLOR_SYSTEM_GRAY,
    };

    // clang-format on

    for (i = 0; i < 2; i++)
    {
        ClearText(&gUnk_Sio_0203DA88[(idx << 1) + i]);
        Text_SetColor(&gUnk_Sio_0203DA88[(idx << 1) + i], textColorLut[(state + i) & 1]);
        Text_DrawString(&gUnk_Sio_0203DA88[(idx << 1) + i], GetStringFromIndex(gLinkArenaRuleData[idx].optionTextId[i]));
        PutText(
            &gUnk_Sio_0203DA88[(idx << 1) + i],
            TILEMAP_LOCATED(gBG0TilemapBuffer, gLinkArenaRuleData[idx].xPos[i], 6 + idx * 3));
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08047780
void SioRuleSettings_Init(struct ProcSioRuleSettings * proc)
{
    int i;
    int r7;
    u8 buf[4];

    ClearSioBG();
    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(Img_LinkArenaRankIcons, (void *)(0x06000F00 + GetBackgroundTileDataOffset(BG_1)));
    ApplyPalette(Pal_LinkArenaRankIcons, 6);

    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    sub_804C3A4(0);

    Decompress(gUnknown_085AE778, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer + 0xA1, gGenericBuffer, 0x1000);

    SetTextFont(&Font_0203DB64);
    ResetTextFont();

    sub_8043164();

    proc->unk_30 = 0;
    proc->unk_2c = StartRuleSettingSpriteDrawInteractive(proc);

    BG_SetPosition(BG_1, 254, 0);

    LoadLinkArenaRuleSettings(buf);

    UpdateRuleSettingSprites(
        proc->unk_2c, proc->unk_30, gLinkArenaRuleData[proc->unk_30].xPos[buf[proc->unk_30]] * 8,
        ((proc->unk_30 * 3) << 3) + 0x30);

    r7 = 0xc0;

    for (i = 0; i < 3; i++)
    {
        ClearText(&gLinkArenaSt.texts[i]);
        Text_SetColor(&gLinkArenaSt.texts[i], 0);
        Text_DrawString(&gLinkArenaSt.texts[i], GetStringFromIndex(gLinkArenaRuleData[i].labelTextId));
        PutText(&gLinkArenaSt.texts[i], gBG0TilemapBuffer + 6 + (r7 + i * 0x60));

        sub_80476CC(i, buf[i]);
    }

    DrawLinkArenaModeIcon(gBG1TilemapBuffer + 0x11E + gLinkArenaRuleData[1].xPos[0], 0);
    DrawLinkArenaModeIcon(gBG1TilemapBuffer + 0x11E + gLinkArenaRuleData[1].xPos[1], 1);

    StartLinkArenaTitleBanner(proc->unk_2c, 6, 0);

    sub_804C508();

    sub_8043100(proc->unk_30 + 0x745, 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08047928
void SioRuleSettings_Loop_Main(struct ProcSioRuleSettings * proc)
{
    u8 buf[4];
    u8 change = 0;
    int var = 0;

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        WriteMultiArenaSaveConfig(&gSioSaveConfig);
        Proc_Break(proc);
    }

    LoadLinkArenaRuleSettings(buf);

    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) && (proc->unk_30 != 0))
    {
        proc->unk_30--;
        change = 1;
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) && (proc->unk_30 < 2))
    {
        proc->unk_30++;
        change++;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_LEFT) != 0)
    {
        buf[proc->unk_30] = (buf[proc->unk_30] - 1) & 1;
        sub_80476CC(proc->unk_30, buf[proc->unk_30]);
        change++;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0)
    {
        buf[proc->unk_30] = (buf[proc->unk_30] + 1) & 1;
        sub_80476CC(proc->unk_30, buf[proc->unk_30]);
        change++;
    }

    SaveLinkArenaRuleSettings(buf);

    if (change != 0)
    {
        SioPlaySoundEffect(3);

        if (proc->unk_30 == 1)
        {
            var = -2;
        }

        UpdateRuleSettingSprites(
            proc->unk_2c, proc->unk_30, (gLinkArenaRuleData[proc->unk_30].xPos[buf[proc->unk_30]] + var) * 8,
            ((proc->unk_30 * 3) << 3) + 0x30);

        sub_8043100(proc->unk_30 + 0x745, 1);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_SIO_RuleSettings[] =
{
    PROC_CALL(SioRuleSettings_Init),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_0203DDDC),

    PROC_REPEAT(SioRuleSettings_Loop_Main),

    PROC_CALL(Set_0203DDDC),

    PROC_CALL(sub_8013F40),
    PROC_YIELD,

    PROC_CALL(EndMuralBackground),

    PROC_END,
};

// clang-format on
