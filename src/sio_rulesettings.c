#include "global.h"

#include "hardware.h"
#include "bmsave.h"
#include "bmlib.h"
#include "fontgrp.h"

#include "sio_core.h"
#include "sio.h"

struct ProcSioRuleSettings
{
    /* 00 */ PROC_HEADER;
    /* 2C */ ProcPtr unk_2c;
    /* 30 */ int unk_30;
};

struct Unknown_080D9E50
{
    /* 00 */ int labelTextId;
    /* 04 */ int xPos[2];
    /* 0C */ int optionTextId[2];
};

extern const struct Unknown_080D9E50 gUnknown_080D9E50[];

//! FE8U = 0x0804766C
void sub_804766C(u8 * buf)
{
    buf[0] = gLinkArenaSt.unk_ec_1;
    buf[1] = gLinkArenaSt.unk_ec_2;
    buf[2] = gLinkArenaSt.unk_ec_3;

    return;
}

#if NONMATCHING

//! FE8U = 0x0804768C
void sub_804768C(u8 * buf)
{
    gLinkArenaSt.unk_ec_1 = buf[0] % 2;
    gLinkArenaSt.unk_ec_2 = buf[1] % 2;
    gLinkArenaSt.unk_ec_3 = buf[2] % 2;

    return;
}

#else

NAKEDFUNC
void sub_804768C(u8 * buf)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, lr}\n\
        ldr r5, _080476C8  @ gLinkArenaSt\n\
        adds r5, #0xec\n\
        movs r4, #1\n\
        ldrb r2, [r0]\n\
        ands r2, r4\n\
        ldrb r3, [r5]\n\
        movs r1, #2\n\
        negs r1, r1\n\
        ands r1, r3\n\
        orrs r1, r2\n\
        ldrb r2, [r0, #1]\n\
        ands r2, r4\n\
        lsls r2, r2, #1\n\
        movs r3, #3\n\
        negs r3, r3\n\
        ands r1, r3\n\
        orrs r1, r2\n\
        ldrb r0, [r0, #2]\n\
        ands r0, r4\n\
        lsls r0, r0, #2\n\
        movs r2, #5\n\
        negs r2, r2\n\
        ands r1, r2\n\
        orrs r1, r0\n\
        strb r1, [r5]\n\
        pop {r4, r5}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080476C8: .4byte gLinkArenaSt\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080476CC
void sub_80476CC(int idx, int state)
{
    int i;

    // clang-format off

    const int gUnknown_080D9EC0[2] =
    {
        2,
        1,
    };

    // clang-format on

    for (i = 0; i < 2; i++)
    {
        ClearText(&gUnk_Sio_0203DA88[(idx << 1) + i]);
        Text_SetColor(&gUnk_Sio_0203DA88[(idx << 1) + i], gUnknown_080D9EC0[(state + i) & 1]);
        Text_DrawString(&gUnk_Sio_0203DA88[(idx << 1) + i], GetStringFromIndex(gUnknown_080D9E50[idx].optionTextId[i]));
        PutText(
            &gUnk_Sio_0203DA88[(idx << 1) + i],
            TILEMAP_LOCATED(gBG0TilemapBuffer, gUnknown_080D9E50[idx].xPos[i], 6 + idx * 3));
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x08047780
void sub_8047780(struct ProcSioRuleSettings * proc)
{
    int i;
    int r7;
    u8 buf[4];

    ClearSioBG();
    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0x12, 2, 0);

    Decompress(gUnknown_085AC9DC, (void *)(0x06000F00 + GetBackgroundTileDataOffset(BG_1)));
    ApplyPalette(gUnknown_085ADCC8, 6);

    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    ApplyPalettes(Pal_TacticianSelObj, 0x13, 4);

    sub_804C3A4(0);

    Decompress(gUnknown_085AE778, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer + 0xA1, gGenericBuffer, 0x1000);

    SetTextFont(&Font_0203DB64);
    ResetTextFont();

    sub_8043164();

    proc->unk_30 = 0;
    proc->unk_2c = sub_804CE8C(proc);

    BG_SetPosition(BG_1, 254, 0);

    sub_804766C(buf);

    sub_804CEC4(
        proc->unk_2c, proc->unk_30, gUnknown_080D9E50[proc->unk_30].xPos[buf[proc->unk_30]] * 8,
        ((proc->unk_30 * 3) << 3) + 0x30);

    r7 = 0xc0;

    for (i = 0; i < 3; i++)
    {
        ClearText(&gLinkArenaSt.texts[i]);
        Text_SetColor(&gLinkArenaSt.texts[i], 0);
        Text_DrawString(&gLinkArenaSt.texts[i], GetStringFromIndex(gUnknown_080D9E50[i].labelTextId));
        PutText(&gLinkArenaSt.texts[i], gBG0TilemapBuffer + 6 + (r7 + i * 0x60));

        sub_80476CC(i, buf[i]);
    }

    sub_8046E94(gBG1TilemapBuffer + 0x11E + gUnknown_080D9E50[1].xPos[0], 0);
    sub_8046E94(gBG1TilemapBuffer + 0x11E + gUnknown_080D9E50[1].xPos[1], 1);

    NewProc085AA980(proc->unk_2c, 6, 0);

    sub_804C508();

    sub_8043100(proc->unk_30 + 0x745, 1);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x08047928
void sub_8047928(struct ProcSioRuleSettings * proc)
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

    sub_804766C(buf);

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

    sub_804768C(buf);

    if (change != 0)
    {
        SioPlaySoundEffect(3);

        if (proc->unk_30 == 1)
        {
            var = -2;
        }

        sub_804CEC4(
            proc->unk_2c, proc->unk_30, (gUnknown_080D9E50[proc->unk_30].xPos[buf[proc->unk_30]] + var) * 8,
            ((proc->unk_30 * 3) << 3) + 0x30);

        sub_8043100(proc->unk_30 + 0x745, 1);
    }

    return;
}
