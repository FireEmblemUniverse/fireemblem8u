#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "spline.h"

struct CreditsCG
{
    /* 00 */ u8 * img[10];
    /* 28 */ u8 * tsa;
    /* 2C */ u16 * pal;
    /* 30 */ u16 unk_30;
    STRUCT_PAD(0x32, 0x34);
};

struct CreditsSubProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct CreditsCG * unk_2c;
    /* 30 */ s16 unk_30;
    /* 32 */ STRUCT_PAD(0x32, 0x34);
    /* 34 */ s16 unk_34;
};

struct CreditsMainProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29_0 : 1;
    /* 29 */ u8 unk_29_1 : 1;
    /* 29 */ u8 unk_29_2 : 1;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ s8 unk_34;
    /* 35 */ s8 unk_35;
    /* 36 */ s16 unk_36;
    /* 38 */ s16 unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ struct CreditsCG * unk_44;
    /* 48 */ s8 unk_48;
    /* 4A */ s16 unk_4a;
};

struct StaffReelEnt
{
    /* 00 */ void * img;
    /* 04 */ void * tsa;
};

struct Unknown08206E24
{
    /* 00 */ struct StaffReelEnt * entry;
    /* 04 */ struct CreditsCG * cg[2];
    /* 0C */ int unk_0c;
    /* 10 */ int unk_10;
};

extern const struct Unknown08206E24 gUnknown_08206E24[];
extern const struct StaffReelEnt * gUnknown_08206FB4;
extern const u32 gUnknown_08206FDC[];

extern u16 gUnknown_0201C5D4[];
extern u16 gUnknown_08A40FC8[];


#define CREDITS_PARENT(proc) ((struct CreditsMainProc *)(proc->proc_parent))

// TODO: Implicit declaration
int CheckGameEndFlag(void);

//! FE8U = 0x080C40B0
void sub_80C40B0(struct CreditsSubProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_34 = 0;
    return;
}

//! FE8U = 0x080C40B8
void sub_80C40B8(struct CreditsSubProc * proc)
{
    proc->unk_30++;

    if (proc->unk_30 < 0x78)
    {
        int tmp = sub_800B84C(0x77 - proc->unk_30, 0x78, 1);
        int bldAmt = DivArm(0x1000, (0x1000 - tmp) * 0x10);
        SetBlendAlpha(0x10 - bldAmt, bldAmt);
    }
    else
    {
        SetBlendAlpha(0, 16);
        proc->unk_34 = proc->unk_2c->unk_30;

        CREDITS_PARENT(proc)->unk_29_0 = 1;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C412C
void sub_80C412C(struct CreditsSubProc * proc)
{
    int val;
    struct CreditsMainProc * parent;

    proc->unk_34--;

    parent = CREDITS_PARENT(proc);

    val = parent->unk_30 + 0x800;

    if (val >= parent->unk_40)
    {
        parent->unk_30 = parent->unk_40;
        Proc_Break(proc);
    }
    else
    {
        parent->unk_30 = val;
    }

    return;
}

//! FE8U = 0x080C4158
void sub_80C4158(struct CreditsSubProc * proc)
{
    proc->unk_34--;

    if (proc->unk_34 < 1)
    {
        proc->unk_30 = 0;
        CREDITS_PARENT(proc)->unk_29_0 = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C4184
void sub_80C4184(struct CreditsSubProc * proc)
{
    proc->unk_30++;

    if (proc->unk_30 < 0x78)
    {
        int tmp = sub_800B84C(0x77 - proc->unk_30, 0x78, 1);
        int bldAmt = DivArm(0x1000, (0x1000 - tmp) * 16);
        SetBlendAlpha(bldAmt, 16 - bldAmt);
    }
    else
    {
        SetBlendAlpha(16, 0);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C41E4
void sub_80C41E4(struct CreditsSubProc * proc)
{
    CREDITS_PARENT(proc)->unk_29_2 = 0;
    return;
}

extern struct ProcCmd gUnknown_08AA2044[];

//! FE8U = 0x080C41F4
void sub_80C41F4(ProcPtr parent, struct CreditsCG * cg)
{
    struct CreditsSubProc * proc = Proc_Start(gUnknown_08AA2044, parent);
    proc->unk_2c = cg;
    return;
}

//! FE8U = 0x080C4210
bool sub_80C4210(void)
{
    return Proc_Find(gUnknown_08AA2044) ? true : false;
}

//! FE8U = 0x080C4228
void sub_80C4228(void)
{
    Proc_EndEach(gUnknown_08AA2044);
    return;
}

//! FE8U = 0x080C4238
void sub_80C4238(struct CreditsMainProc * proc)
{
    u32 something;
    s32 i;
    const struct Unknown08206E24 * ptr;

    proc->unk_35 = (proc->unk_30 >> 8) / 0x100;

    if (((proc->unk_30 >> 8) - ((proc->unk_30 >> 8) / 0x100) * 0x100 > 0xf) && (proc->unk_35 != proc->unk_34))
    {
        if (!proc->unk_29_2)
        {
            for (i = proc->unk_35 + 1; i < 0x17u; i++)
            {
                ptr = &gUnknown_08206E24[i - 1];

                if (ptr->cg[0] == NULL)
                {
                    continue;
                }

                proc->unk_48 = 0;

                if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EIRIKA)
                {
                    proc->unk_44 = ptr->cg[0];
                }
                else
                {
                    proc->unk_44 = ptr->cg[1];
                }

                proc->unk_3c = ptr->unk_0c;
                proc->unk_40 = ptr->unk_10;

                proc->unk_29_2 = 1;
                proc->unk_29_1 = 1;
                break;
            }
        }

        ptr = &gUnknown_08206E24[proc->unk_35];
        something = (proc->unk_35 + 1) & 1;
        if (ptr->entry != NULL)
        {
            Decompress(ptr->entry->img, (void *)(0x6000000 + gUnknown_08206FDC[something]));
            Decompress(ptr->entry->tsa, gGenericBuffer);
            CallARM_FillTileRect(
                gUnknown_0201C5D4, gGenericBuffer, (u16)((gUnknown_08206FDC[something] / CHR_SIZE) + 0x7000));
        }
        else
        {
            CpuFastFill(-1, (void *)(0x6000000 + gUnknown_08206FDC[something]), 0x20);
            for (i = 0; i < 0x400; i++)
            {
                gUnknown_0201C5D4[i] = (gUnknown_08206FDC[something] / CHR_SIZE) + 0x7000;
            }
        }

        proc->unk_34 = proc->unk_35;
    }

    return;
}

//! FE8U = 0x080C43B4
void sub_80C43B4(struct CreditsMainProc * proc)
{
    int unk_30 = (proc->unk_30 >> 8);
    proc->unk_38 = unk_30 / 16;

    if (proc->unk_38 != proc->unk_36)
    {
        int tmp = unk_30 + 0xf0;
        int val = tmp - (tmp / 0x100) * 0x100;
        val = ((val / 8) * 0x20);

        CpuFastCopy(gUnknown_0201C5D4 + val, gBG0TilemapBuffer + val, 0x80);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        proc->unk_36 = proc->unk_38;
    }

    if (!sub_80C4210() && (proc->unk_2c != proc->unk_30) && ((proc->unk_29_2) != 0) && (proc->unk_30 >= proc->unk_3c))
    {
        sub_80C41F4(proc, proc->unk_44);
    }

    BG_SetPosition(BG_0, 0, unk_30 & 0xff);

    proc->unk_2c = proc->unk_30;

    return;
}

//! FE8U = 0x080C4460
void sub_80C4460(struct CreditsMainProc * proc)
{
    u32 chr;
    int i;

    SetPrimaryHBlankHandler(NULL);
    SetupBackgrounds(NULL);

    SetDispEnable(0, 0, 0, 0, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendAlpha(16, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    CpuFastFill(0, gPaletteBuffer, PLTT_SIZE);

    ApplyPalette(gUnknown_08A40FC8, 7);

    CpuFastFill(-1, (void *)(0x6000000 + (chr = gUnknown_08206FDC[0])), 0x20);

    chr = chr >> 5;

    for (i = 0; i < 0x400; i++)
    {
        gBG0TilemapBuffer[i] = (chr) + 0x7000;
    }

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    EnablePaletteSync();

    SetDispEnable(1, 0, 0, 1, 0);

    SetDefaultColorEffects();

    BG_SetPosition(BG_3, 0, 0);

    proc->unk_29_0 = 0;
    proc->unk_29_1 = 0;
    proc->unk_2c = 0;
    proc->unk_30 = 0;
    proc->unk_34 = 0xff;
    proc->unk_35 = 0;
    proc->unk_36 = 0;
    proc->unk_38 = 0;
    proc->unk_4a = 0;

    return;
}

//! FE8U = 0x080C45E0
void sub_80C45E0(struct CreditsMainProc * proc)
{

    if (proc->unk_29_1)
    {
        if (proc->unk_48 < 10)
        {
            Decompress(proc->unk_44->img[proc->unk_48], (void *)(0x06008000 + proc->unk_48 * 0x800));
        }
        else
        {
            CallARM_FillTileRect(gBG3TilemapBuffer, proc->unk_44->tsa, 0);
            BG_EnableSyncByMask(BG3_SYNC_BIT);

            ApplyPalettes(proc->unk_44->pal, 0, 6);
            EnablePaletteSync();
        }

        proc->unk_48++;

        if (proc->unk_48 > 10)
        {
            proc->unk_29_1 = 0;
        }
    }

    return;
}

//! FE8U = 0x080C4664
void sub_80C4664(struct CreditsMainProc * proc)
{
    if (((gKeyStatusPtr->newKeys & START_BUTTON) != 0) && (CheckGameEndFlag() != 0))
    {
        Proc_Goto(proc, 0);
        return;
    }

    if (proc->unk_30 < 0x3800)
    {
        proc->unk_30 += 0x780;
    }

    if (!proc->unk_29_0)
    {
        proc->unk_30 += 0x80;
    }

    sub_80C4238(proc);
    sub_80C43B4(proc);
    sub_80C45E0(proc);

    if ((u8)proc->unk_35 > 0x14)
    {
        proc->unk_4a = 0xf0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C46E4
void sub_80C46E4(void)
{
    sub_80C4228();
    return;
}

//! FE8U = 0x080C46F0
void sub_80C46F0(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    SetDefaultColorEffects();

    BG_SetPosition(BG_0, 0, 0);
    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080C4738
void sub_80C4738(struct CreditsMainProc * proc)
{
    u32 chr;
    const struct StaffReelEnt * ptr = gUnknown_08206FB4;

    Decompress(ptr->img, (void *)(0x6000000 + (chr = gUnknown_08206FDC[0])));
    Decompress(ptr->tsa, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, (u16)((chr >> 5) + 0x7000));
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gPaletteBuffer[0] = 0;
    ApplyPalette(gUnknown_08A40FC8, 7);
    EnablePaletteSync();

    proc->unk_4a = 0xf0;

    return;
}

//! FE8U = 0x080C47B0
void sub_80C47B0(struct CreditsMainProc * proc)
{
    proc->unk_4a--;

    if (((gKeyStatusPtr->newKeys & START_BUTTON) != 0) && (CheckGameEndFlag() != 0))
    {
        proc->unk_4a = 0;
    }

    if (proc->unk_4a < 1)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C47F4
void sub_80C47F4(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    CpuFastFill(0, (void *)0x6000000, VRAM_SIZE);
    SetDispEnable(0, 0, 0, 0, 0);
    SetBlendAlpha(0, 0);

    BG_Fill(gBG3TilemapBuffer, -1);
    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

extern struct ProcCmd gUnknown_08AA2084[];

//! FE8U = 0x080C4878
void sub_80C4878(ProcPtr parent)
{
    Proc_StartBlocking(gUnknown_08AA2084, parent);
    return;
}
