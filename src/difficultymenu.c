#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"

#include "savemenu.h"

extern u8 gUnknown_02000940[];
extern u8 gUnknown_02000944[];
extern struct PlaySt_OptionBits gUnknown_02000948[];

//! FE8U = 0x080ABC14
void sub_80ABC14(u8 slot, struct SaveMenuProc * proc)
{
    struct PlaySt playSt;
    struct GMapData worldMapData;
    u8 localbuffer[4] __attribute__((unused));

    if (slot < 3)
    {
        if (IsSaveValid(slot))
        {
            int chIndex;
            int r2;
            ReadGameSavePlaySt(slot, &playSt);

            r2 = playSt.chapterIndex;
            if (!(playSt.chapterStateBits & PLAY_FLAG_COMPLETE) && (playSt.unk4A_2 == 4))
            {
                LoadSavedWMStuff(slot, &worldMapData);
                r2 = sub_80BD224(&worldMapData);
            }

            chIndex = playSt.chapterIndex;
            playSt.chapterIndex = r2;
            proc->unk_37[slot] = sub_8089768(&playSt);

            playSt.chapterIndex = chIndex;
            proc->unk_48[slot] = playSt.time_saved;

            proc->unk_3a[slot] = 0;

            // BUG?
            if (IsGameNotFirstChapter((struct PlaySt *)(uintptr_t)slot) != 0)
            {
                proc->unk_3a[slot] |= 1;
            }

            if (LoadSavedEid8A(slot) != 0)
            {
                proc->unk_3a[slot] |= 2;
            }

            if (playSt.chapterStateBits & PLAY_FLAG_COMPLETE)
            {
                proc->unk_3a[slot] |= 4;
            }

            gUnknown_02000940[slot] = playSt.chapterStateBits;
            gUnknown_02000944[slot] = playSt.chapterModeIndex;
            memcpy(&gUnknown_02000948[slot], &playSt.config, 8);
        }
        else
        {
            proc->unk_37[slot] = 0xff;
            proc->unk_3a[slot] = 0;
            proc->unk_48[slot] = 0;

            gUnknown_02000940[slot] = 0;
            gUnknown_02000944[slot] = 0;

            memset(&gUnknown_02000948[slot], 0, 8);
        }
    }
    else if (proc->unk_44 == 0x100)
    {
        if (IsValidSuspendSave(3))
        {
            ReadSuspendSavePlaySt(3, &playSt);
            proc->unk_3f = playSt.gameSaveSlot;
            proc->unk_54 = playSt.time_saved;
        }
        else
        {
            proc->unk_44 = 0xf0;
        }
    }

    return;
}

//! FE8U = 0x080ABD88
void sub_80ABD88(u8 slot)
{
    int i;
#ifndef NONMATCHING
    register u32 r1 asm("r1");
#else
    u32 r1;
#endif

    for (i = 0; i < 3; i++)
    {
        u32 flags = gUnknown_02000940[i] & 0x40 ? 4 : 0;

        if (!gUnknown_02000948[i].controller)
        {
            if (gUnknown_02000944[i] == 1)
            {
                flags = flags | 0x10;
            }

            if (gUnknown_02000944[i] == 2)
            {
                flags = flags | 0x20;
                flags = (u8)flags;
            }

            if (gUnknown_02000944[i] == 3)
            {
                flags = flags | 0x40;
            }
        }
        else
        {
            if (gUnknown_02000944[i] == 3)
            {
                flags = flags | 0x40;
            }
            else
            {
                flags = flags | 0x20;
                flags = (u8)flags;
            }
        }

        if (i != slot)
        {
            flags = flags | 2;
            flags = (u8)flags;
        }
        r1 = 1;
        sub_80895B4(flags | r1, i * 2 + 0x1a);
        sub_80895B4(flags, i * 2 + 0x1b);
    }

    EnablePaletteSync();
    return;
}

extern u16 gUnknown_08A07B0A[];
extern u16 gUnknown_08A07AEA[];
extern u16 gUnknown_08A07C0A[];
extern u16 gUnknown_08A07BEA[];

#if NONMATCHING

/* https://decomp.me/scratch/pmTo7 */

//! FE8U = 0x080ABE3C
void sub_80ABE3C(int param_1, int param_2)
{
    s16 * psVar1;
    int uVar4;
    u16 * puVar5;
    int iVar7;
    u16 * puVar8;
    int local_24;

    uVar4 = param_1 >> 1 & 0x1f;
    if (uVar4 > 0x10)
    {
        uVar4 = 0x10 - (uVar4 & 0xf);
    }

    for (local_24 = 0; local_24 < 3; local_24++)
    {
        int tmp;
        if (!(gUnknown_02000940[local_24] & 0x40))
        {
            continue;
        }

        tmp = (local_24 * 0x20 + 0xa0);
        psVar1 = (s16 *)(tmp + (gPaletteBuffer + 0x109));

        if (local_24 == param_2)
        {
            puVar8 = gUnknown_08A07AEA;
            puVar5 = gUnknown_08A07BEA;
        }
        else
        {
            puVar8 = gUnknown_08A07B0A;
            puVar5 = gUnknown_08A07C0A;
        }

        for (iVar7 = 0; iVar7 < 6; iVar7++)
        {
            psVar1[iVar7] = (((uVar4 * (puVar8[iVar7] & 0x1f) + (0x10 - uVar4) * (puVar5[iVar7] & 0x1f)) >> 4) & 0x1f) +
                (((uVar4 * (puVar8[iVar7] & 0x3e0) + (0x10 - uVar4) * (puVar5[iVar7] & 0x3e0)) >> 4) & 0x3e0) +
                (((uVar4 * (puVar8[iVar7] & 0x7c00) + (0x10 - uVar4) * (puVar5[iVar7] & 0x7c00)) >> 4) & 0x7c00);
        }
    }

    EnablePaletteSync();

    return;
}

#else

NAKEDFUNC
void sub_80ABE3C(int param_1, int param_2)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #8\n\
        adds r5, r0, #0\n\
        str r1, [sp]\n\
        asrs r5, r5, #1\n\
        movs r0, #0x1f\n\
        ands r5, r0\n\
        cmp r5, #0x10\n\
        ble _080ABE5E\n\
        movs r0, #0xf\n\
        ands r0, r5\n\
        movs r1, #0x10\n\
        subs r5, r1, r0\n\
    _080ABE5E:\n\
        movs r2, #0\n\
    _080ABE60:\n\
        ldr r1, _080ABE90  @ gUnknown_02000940\n\
        adds r0, r2, r1\n\
        ldrb r1, [r0]\n\
        movs r0, #0x40\n\
        ands r0, r1\n\
        adds r1, r2, #1\n\
        str r1, [sp, #4]\n\
        cmp r0, #0\n\
        beq _080ABF22\n\
        lsls r0, r2, #6\n\
        movs r1, #0xa0\n\
        lsls r1, r1, #1\n\
        adds r0, r0, r1\n\
        ldr r1, _080ABE94  @ gPaletteBuffer + 0x212\n\
        adds r0, r0, r1\n\
        mov r8, r0\n\
        ldr r0, [sp]\n\
        cmp r2, r0\n\
        bne _080ABEA0\n\
        ldr r1, _080ABE98  @ gUnknown_08A07AEA\n\
        mov ip, r1\n\
        ldr r6, _080ABE9C  @ gUnknown_08A07BEA\n\
        b _080ABEA6\n\
        .align 2, 0\n\
    _080ABE90: .4byte gUnknown_02000940\n\
    _080ABE94: .4byte gPaletteBuffer + 0x212\n\
    _080ABE98: .4byte gUnknown_08A07AEA\n\
    _080ABE9C: .4byte gUnknown_08A07BEA\n\
    _080ABEA0:\n\
        ldr r0, _080ABF3C  @ gUnknown_08A07B0A\n\
        mov ip, r0\n\
        ldr r6, _080ABF40  @ gUnknown_08A07C0A\n\
    _080ABEA6:\n\
        adds r2, #1\n\
        str r2, [sp, #4]\n\
        movs r0, #0x10\n\
        subs r7, r0, r5\n\
        movs r1, #0xf8\n\
        lsls r1, r1, #7\n\
        mov sl, r1\n\
        movs r0, #6\n\
        mov r9, r0\n\
    _080ABEB8:\n\
        mov r1, ip\n\
        ldrh r4, [r1]\n\
        movs r0, #0x1f\n\
        ands r0, r4\n\
        adds r2, r0, #0\n\
        muls r2, r5, r2\n\
        ldrh r3, [r6]\n\
        movs r0, #0x1f\n\
        ands r0, r3\n\
        muls r0, r7, r0\n\
        adds r2, r2, r0\n\
        asrs r2, r2, #4\n\
        movs r0, #0x1f\n\
        ands r2, r0\n\
        movs r0, #0xf8\n\
        lsls r0, r0, #2\n\
        ands r0, r4\n\
        adds r1, r0, #0\n\
        muls r1, r5, r1\n\
        movs r0, #0xf8\n\
        lsls r0, r0, #2\n\
        ands r0, r3\n\
        muls r0, r7, r0\n\
        adds r1, r1, r0\n\
        asrs r1, r1, #4\n\
        movs r0, #0xf8\n\
        lsls r0, r0, #2\n\
        ands r1, r0\n\
        adds r2, r2, r1\n\
        mov r0, sl\n\
        ands r0, r4\n\
        adds r1, r0, #0\n\
        muls r1, r5, r1\n\
        mov r0, sl\n\
        ands r0, r3\n\
        muls r0, r7, r0\n\
        adds r1, r1, r0\n\
        asrs r1, r1, #4\n\
        mov r0, sl\n\
        ands r1, r0\n\
        adds r2, r2, r1\n\
        mov r1, r8\n\
        strh r2, [r1]\n\
        movs r0, #2\n\
        add r8, r0\n\
        add ip, r0\n\
        adds r6, #2\n\
        movs r1, #1\n\
        negs r1, r1\n\
        add r9, r1\n\
        mov r0, r9\n\
        cmp r0, #0\n\
        bge _080ABEB8\n\
    _080ABF22:\n\
        ldr r2, [sp, #4]\n\
        cmp r2, #2\n\
        ble _080ABE60\n\
        bl EnablePaletteSync\n\
        add sp, #8\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080ABF3C: .4byte gUnknown_08A07B0A\n\
    _080ABF40: .4byte gUnknown_08A07C0A\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x080ABF44
u8 sub_80ABF44(u8 endMask, struct SaveMenuProc * proc)
{
    int mask;
    int count = 0;

    for (mask = 1; mask < endMask; mask <<= 1)
    {
        if ((proc->unk_30 & mask) != 0)
        {
            count++;
        }
    }

    return count;
}

#if NONMATCHING

/* https://decomp.me/scratch/SDtUT */

//! FE8U = 0x080ABF74
void sub_80ABF74(u8 param_1)
{
    int r4;
    void * r6;
    int r2;
    int i;
    void * r5;

    if ((param_1 & 0x60) != 0)
    {
        r6 = (void *)0x06014000;
        r2 = 0xe;
        r4 = 2;
    }
    else if ((param_1 & 0x10) != 0)
    {
        r6 = (void *)0x06014800;
        r2 = 0xe;
        r4 = 2;
    }

    r5 = (void *)(0x060121C0);
    for (i = 0; i < r4; i++)
    {
        CpuFastCopy(r6, r5 + i * 0x400, r2 * 0x20);
        r6 += 0x400;
    }

    return;
}

#else

NAKEDFUNC
void sub_80ABF74(u8 param_1)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r8\n\
        push {r7}\n\
        lsls r0, r0, #0x18\n\
        lsrs r3, r0, #0x18\n\
        movs r1, #0x60\n\
        adds r0, r3, #0\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080ABF94\n\
        ldr r6, _080ABF90  @ 0x06014000\n\
        movs r2, #0xe\n\
        movs r4, #2\n\
        b _080ABFA6\n\
        .align 2, 0\n\
    _080ABF90: .4byte 0x06014000\n\
    _080ABF94:\n\
        movs r0, #0x10\n\
        ands r0, r3\n\
        cmp r0, #0\n\
        beq _080ABFA2\n\
        ldr r6, _080ABFD4  @ 0x06014800\n\
        movs r2, #0xe\n\
        movs r4, #2\n\
    _080ABFA2:\n\
        cmp r4, #0\n\
        ble _080ABFC8\n\
    _080ABFA6:\n\
        lsls r7, r2, #3\n\
        ldr r5, _080ABFD8  @ 0x060121C0\n\
        ldr r0, _080ABFDC  @ 0x001FFFFF\n\
        mov r8, r0\n\
    _080ABFAE:\n\
        adds r0, r6, #0\n\
        adds r1, r5, #0\n\
        mov r2, r8\n\
        ands r2, r7\n\
        bl CpuFastSet\n\
        movs r0, #0x80\n\
        lsls r0, r0, #3\n\
        adds r6, r6, r0\n\
        adds r5, r5, r0\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bne _080ABFAE\n\
    _080ABFC8:\n\
        pop {r3}\n\
        mov r8, r3\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080ABFD4: .4byte 0x06014800\n\
    _080ABFD8: .4byte 0x060121C0\n\
    _080ABFDC: .4byte 0x001FFFFF\n\
        .syntax divided\n\
    ");
}

#endif

extern u16 gUnknown_08A20A08[];

//! FE8U = 0x080ABFE0
void sub_80ABFE0(struct DifficultyMenuProc * proc)
{
    const char * str;
    struct Text * th;
    int i;

    for (i = 0; i < 5; i++)
    {
        ClearText(&proc->unk_38[i]);
    }

    th = proc->unk_38;
    str = GetStringFromIndex(gUnknown_08A20A08[proc->unk_30]);

    while (1)
    {
        if (*str == 0x00) // [X]
        {
            return;
        }

        if (*str == 0x01) // [NL]
        {
            th++;
            str++;
            continue;
        }

        str = Text_DrawCharacter(th, str);
    }

    return;
}

//! FE8U = 0x080AC034
void sub_80AC034(struct DifficultyMenuProc * proc)
{
    int i;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 7), 14, 10, 0);

    for (i = 0; i < 5; i++)
    {
        PutText(&proc->unk_38[i], TILEMAP_LOCATED(gBG0TilemapBuffer, 18, 7 + i * 2));
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x080AC078
void sub_80AC078(struct DifficultyMenuProc * proc)
{
    ((struct SaveMenuProc *)(proc->proc_parent))->unk_58->unk_29 = 1;
    return;
}

extern u16 gUnknown_08A25DCC[];    // pal
extern u16 gUnknown_08A268D8[];    // pal
extern u16 Pal_SaveScreenSprits[]; // pal
extern u16 gUnknown_08A295B4[];    // pal
extern u16 Pal_DifficultyMenuObjs[];
extern u8 Img_DifficultyMenuObjs[];

extern u8 gUnknown_08A29558[];

struct Unknown_08A209FC
{
    s8 a;
    s8 b;
};

extern struct Unknown_08A209FC gUnknown_08A209FC[];

//! FE8U = 0x080AC084
void InitDifficultySelectScreen(struct DifficultyMenuProc * proc)
{
    int i;

    ResetTextFont();
    LoadUiFrameGraphics();
    ResetText();

    for (i = 0; i < 5; i++)
    {
        InitText(&proc->unk_38[i], 14);
    }

    ApplyPalettes(gUnknown_08A25DCC, 8, 8);
    ApplyPalette(gUnknown_08A268D8, 7);

    ApplyPalettes(Pal_SaveScreenSprits, 18, 8);
    ApplyPalette(gUnknown_08A295B4, 2);

    Decompress(Img_DifficultyMenuObjs, (void *)0x06010800);
    ApplyPalettes(Pal_DifficultyMenuObjs, 17, 10);

    EnablePaletteSync();

    ((struct SaveMenuProc *)(proc->proc_parent))->unk_58->unk_29 = 0;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    Decompress(gUnknown_08A29558, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer + 0xd1, gGenericBuffer, 0x1000);

    sub_80ABFE0(proc);
    sub_80AC034(proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    proc->unk_34 = sub_80AC698(proc);
    proc->unk_30 = 0;
    proc->unk_34->unk_2b = 0;
    proc->unk_34->unk_2c = gUnknown_08A209FC[proc->unk_30].a;
    proc->unk_34->unk_2e = gUnknown_08A209FC[proc->unk_30].b;

    return;
}

//! FE8U = 0x080AC1A8
void sub_80AC1A8(struct DifficultyMenuProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_2c = 0;
    InitDifficultySelectScreen(proc);
    return;
}

//! FE8U = 0x080AC1BC
void sub_80AC1BC(struct DifficultyMenuProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_2c++;

    SetDispEnable(1, 1, 1, 1, 1);

    a = (0x10 - proc->unk_2c);
    b = (a * 0x50 * a) / 256;
    c = 0x50 - b;

    SetWin0Box(0, 0x50 - c, 0xf0, c + 0x50);

    if (proc->unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AC22C
void sub_80AC22C(struct DifficultyMenuProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_2c++;

    a = (0x10 - proc->unk_2c);
    b = (a * 0x50 * a) / 256;
    c = 0x50 - b;

    SetWin0Box(0, c, 0xf0, -0x60 - c);

    if (proc->unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AC288
void sub_80AC288(struct DifficultyMenuProc * proc)
{
    s8 hasChanged = 0;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->unk_30 == 0)
        {
            proc->unk_30 = 2;
        }
        else
        {
            proc->unk_30--;
        }

        hasChanged = 1;
    }
    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->unk_30 == 2)
        {
            proc->unk_30 = 0;
        }
        else
        {
            proc->unk_30++;
        }

        hasChanged = 1;
    }

    if (hasChanged != 0)
    {
        PlaySoundEffect(0x66);
        proc->unk_34->unk_2b = proc->unk_30;
        sub_80AC680(proc->unk_34, gUnknown_08A209FC[proc->unk_30].a, gUnknown_08A209FC[proc->unk_30].b);
        sub_80ABFE0(proc);
        sub_80AC034(proc);
        return;
    }

    if (proc->unk_34->unk_29_1)
    {
        return;
    }

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON))
    {
        proc->unk_2c = 0;
        PlaySoundEffect(0x6a);
        switch (proc->unk_30)
        {
            case 0:
                savemenu_SetDifficultyChoice(0, 0);
                break;

            case 1:
                savemenu_SetDifficultyChoice(1, 0);
                break;

            case 2:
                savemenu_SetDifficultyChoice(2, 0);
                break;
        }

        Proc_Goto(proc, 1);
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        proc->unk_2c = 0;
        PlaySoundEffect(0x6b);
        savemenu_SetDifficultyChoice(3, 0);
        Proc_Goto(proc, 2);
    }

    return;
}

//! FE8U = 0x080AC3DC
void nullsub_64(void)
{
    return;
}

extern struct ProcCmd ProcScr_NewGameDiffilcultySelect[];

//! FE8U = 0x080AC3E0
void NewNewGameDifficultySelect(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_NewGameDiffilcultySelect, parent);
    return;
}

//! FE8U = 0x080AC3F4
void sub_80AC3F4(struct DifficultyMenuSpritesProc * proc)
{
    proc->unk_29_0 = 0;
    proc->unk_29_1 = 0;

    proc->unk_2a = 0;
    proc->unk_2e = 0;
    proc->unk_2c = 0;

    return;
}

extern u8 gUnknown_08A20B14[];
extern u16 gUnknown_08A20A98[];

//! FE8U = 0x080AC418
void sub_80AC418(struct DifficultyMenuSpritesProc * proc)
{
    if (proc->unk_29_0)
    {
        proc->unk_38 = proc->unk_34 - proc->unk_30;
        proc->unk_3a = proc->unk_36 - proc->unk_32;
        proc->unk_2c = proc->unk_30;
        proc->unk_2e = proc->unk_32;
        proc->unk_3c = 0;
        proc->unk_29_0 = 0;
        proc->unk_29_1 = 1;
    }

    if (proc->unk_29_1)
    {
        proc->unk_3c++;

        if (proc->unk_3c < 4)
        {
            int unk = sub_800B84C(proc->unk_3c, 4, 0);

            proc->unk_2c = proc->unk_30 + DivArm(0x1000, proc->unk_38 * unk);
            proc->unk_2e = proc->unk_32 + DivArm(0x1000, proc->unk_3a * unk);
        }
        else
        {
            proc->unk_2c = proc->unk_34;
            proc->unk_2e = proc->unk_36;
            proc->unk_29_1 = 0;
        }
    }

    PutSpriteExt(
        4, proc->unk_2c, (proc->unk_2e + gUnknown_08A20B14[(proc->unk_2a >> 3) & 7]) & 0xff, gUnknown_08A20A98, 0x3000);

    return;
}

// TODO: Confirm that this is a 3D array
// Seems to be palettes for easy, normal, difficult; active / inactive; size 0x10 each
extern u16 gUnknown_08A29498[3][2][0x10];

extern u16 gUnknown_08A28088[];

#if NONMATCHING

/* https://decomp.me/scratch/GaYjI */

//! FE8U = 0x080AC4F8
void sub_80AC4F8(u8 frameMaybe, u8 selectedIdx)
{
    int i;
    int palId;
    int color;

    for (i = 0; i < 3; i++)
    {
        if (i == selectedIdx)
        {
            PAL_OBJ_COLOR(5 + i * 2, 1) = gUnknown_08A29498[i][0][1];
        }
        else
        {
            // inactive
            u16 * pal = &gUnknown_08A29498[i][1][1];
            PAL_OBJ_COLOR(6 + i * 2, 1) = *pal;
        }
    }

    color = (frameMaybe % 0x40) / 4;

    gPaletteBuffer[(((5 + 0x10) * 0x10) + 1) + ((selectedIdx * 2))] = gUnknown_08A28088[color];

    EnablePaletteSync();

    return;
}

#else

NAKEDFUNC
void sub_80AC4F8(u8 frameMaybe, u8 selectedIdx)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r8\n\
        push {r7}\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        mov ip, r0\n\
        lsls r1, r1, #0x18\n\
        lsrs r3, r1, #0x18\n\
        movs r2, #0\n\
        ldr r7, _080AC530  @ gPaletteBuffer\n\
        ldr r0, _080AC534  @ gUnknown_08A28088\n\
        mov r8, r0\n\
        lsls r0, r3, #6\n\
        ldr r1, _080AC538  @ 0x000002A2\n\
        adds r0, r0, r1\n\
        adds r6, r0, r7\n\
        lsls r1, r3, #6\n\
        ldr r0, _080AC53C  @ 0x000002C2\n\
        adds r4, r7, r0\n\
        ldr r0, _080AC540  @ gUnknown_08A2949A\n\
        adds r5, r1, r0\n\
    _080AC522:\n\
        cmp r2, r3\n\
        bne _080AC544\n\
        ldrh r0, [r5]\n\
        strh r0, [r6]\n\
        lsls r1, r2, #5\n\
        b _080AC550\n\
        .align 2, 0\n\
    _080AC530: .4byte gPaletteBuffer\n\
    _080AC534: .4byte gUnknown_08A28088\n\
    _080AC538: .4byte 0x000002A2\n\
    _080AC53C: .4byte 0x000002C2\n\
    _080AC540: .4byte gUnknown_08A2949A\n\
    _080AC544:\n\
        lsls r0, r2, #6\n\
        ldr r1, _080AC580  @ gUnknown_08A294BA\n\
        adds r0, r0, r1\n\
        ldrh r0, [r0]\n\
        strh r0, [r4]\n\
        lsls r1, r3, #5\n\
    _080AC550:\n\
        adds r4, #0x40\n\
        adds r2, #1\n\
        cmp r2, #2\n\
        ble _080AC522\n\
        movs r0, #0x3f\n\
        mov r2, ip\n\
        ands r0, r2\n\
        lsrs r0, r0, #2\n\
        ldr r2, _080AC584  @ 0x00000151\n\
        adds r1, r1, r2\n\
        lsls r1, r1, #1\n\
        adds r1, r1, r7\n\
        lsls r0, r0, #1\n\
        add r0, r8\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        bl EnablePaletteSync\n\
        pop {r3}\n\
        mov r8, r3\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080AC580: .4byte gUnknown_08A294BA\n\
    _080AC584: .4byte 0x00000151\n\
        .syntax divided\n\
    ");
}

#endif

extern u16 gUnknown_08A20AA0[];
extern u16 gUnknown_08A20AAE[];
extern u16 gUnknown_08A20AC2[];
extern u16 * gUnknown_08A20B08[];

//! FE8U = 0x080AC588
void sub_80AC588(struct DifficultyMenuSpritesProc * proc)
{
    int i;

    proc->unk_2a++;

    PutSpriteExt(4, 0x38, 4, gUnknown_08A20AA0, 0x2000);
    PutSpriteExt(4, 0x38, 4, gUnknown_08A20AAE, 0x4000);

    for (i = 0; i < 3; i++)
    {
        s16 x = 8; // ?
        s16 y = 0x30 + i * 0x20;

        if (i == proc->unk_2b)
        {
            PutSpriteExt(4, x, y, gUnknown_08A20AC2, OAM2_PAL(5 + (i * 2)));
        }
        else
        {
            PutSpriteExt(4, x, y, gUnknown_08A20AC2, OAM2_PAL(6 + (i * 2)));
        }

        PutSpriteExt(4, x, y, gUnknown_08A20B08[i], 0x4000);
    }

    sub_80AC4F8(proc->unk_2a, proc->unk_2b);
    sub_80AC418(proc);

    return;
}

//! FE8U = 0x080AC680
void sub_80AC680(struct DifficultyMenuSpritesProc * proc, int param_2, int param_3)
{
    proc->unk_30 = proc->unk_2c;
    proc->unk_32 = proc->unk_2e;
    proc->unk_34 = param_2;
    proc->unk_36 = param_3;
    proc->unk_29_0 = 1;

    return;
}

extern struct ProcCmd gUnknown_08A20B1C[];

//! FE8U = 0x080AC698
ProcPtr sub_80AC698(ProcPtr parent)
{
    return Proc_Start(gUnknown_08A20B1C, parent);
}
