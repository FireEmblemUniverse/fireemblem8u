#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "cg.h"

#include "ending_credits.h"

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

    /* 2C */ const struct CreditsCG * cg;
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
    /* 44 */ const struct CreditsCG * cg;
    /* 48 */ s8 unk_48;
    /* 4A */ s16 timer;
};

struct StaffReelEnt
{
    /* 00 */ void * img;
    /* 04 */ void * tsa;
};

struct CreditsEnt
{
    /* 00 */ const struct StaffReelEnt * entry;
    /* 04 */ const struct CreditsCG * cg[2];
    /* 0C */ int unk_0c; // delay before playing the CG
    /* 10 */ int unk_10; // delay before playing next staff credit roll
};

extern const struct CreditsEnt gEndingCredits_0[];
extern const u32 gEndingCredits_1[];

extern u16 gUnk_33[];

#define CREDITS_PARENT(proc) ((struct CreditsMainProc *)(proc->proc_parent))

// TODO: Implicit declaration
int CheckGameEndFlag(void);

//! FE8U = 0x080C40B0
void CreditsBlendCG_Init(struct CreditsSubProc * proc)
{
    proc->unk_30 = 0;
    proc->unk_34 = 0;
    return;
}

//! FE8U = 0x080C40B8
void CreditsBlendCG_0(struct CreditsSubProc * proc)
{
    proc->unk_30++;

    if (proc->unk_30 < 120)
    {
        int tmp = _DivArm2(119 - proc->unk_30, 120, 1);
        int bldAmt = DivArm(0x1000, (0x1000 - tmp) * 16);
        SetBlendAlpha(16 - bldAmt, bldAmt);
    }
    else
    {
        SetBlendAlpha(0, 16);
        proc->unk_34 = proc->cg->unk_30;

        CREDITS_PARENT(proc)->unk_29_0 = 1;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C412C
void CreditsBlendCG_1(struct CreditsSubProc * proc)
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
void CreditsBlendCG_2(struct CreditsSubProc * proc)
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
void CreditsBlendCG_3(struct CreditsSubProc * proc)
{
    proc->unk_30++;

    if (proc->unk_30 < 120)
    {
        int tmp = _DivArm2(119 - proc->unk_30, 120, 1);
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
void CreditsBlendCG_OnEnd(struct CreditsSubProc * proc)
{
    CREDITS_PARENT(proc)->unk_29_2 = 0;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_EndingCredits_BlendCGMaybe[] =
{
    PROC_YIELD,

    PROC_CALL(CreditsBlendCG_Init),

    PROC_REPEAT(CreditsBlendCG_0),
    PROC_REPEAT(CreditsBlendCG_1),
    PROC_REPEAT(CreditsBlendCG_2),
    PROC_REPEAT(CreditsBlendCG_3),

    PROC_CALL(CreditsBlendCG_OnEnd),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C41F4
void StartBlendCreditsCGMaybe(ProcPtr parent, const struct CreditsCG * cg)
{
    struct CreditsSubProc * proc = Proc_Start(ProcScr_EndingCredits_BlendCGMaybe, parent);
    proc->cg = cg;
    return;
}

//! FE8U = 0x080C4210
bool IsCreditsBlendCGActive(void)
{
    return Proc_Find(ProcScr_EndingCredits_BlendCGMaybe) ? true : false;
}

//! FE8U = 0x080C4228
void EndCreditsBlendCG(void)
{
    Proc_EndEach(ProcScr_EndingCredits_BlendCGMaybe);
    return;
}

//! FE8U = 0x080C4238
void EndingCredits_UpdateStaffReel(struct CreditsMainProc * proc)
{
    u32 something;
    s32 i;
    const struct CreditsEnt * ptr;

    proc->unk_35 = (proc->unk_30 >> 8) / 0x100;

    if (((proc->unk_30 >> 8) - ((proc->unk_30 >> 8) / 0x100) * 0x100 > 0xf) && (proc->unk_35 != proc->unk_34))
    {
        if (!proc->unk_29_2)
        {
            for (i = proc->unk_35 + 1; i < 23u; i++)
            {
                ptr = &gEndingCredits_0[i - 1];

                if (ptr->cg[0] == NULL)
                {
                    continue;
                }

                proc->unk_48 = 0;

                if (gPlaySt.chapterModeIndex == CHAPTER_MODE_EIRIKA)
                {
                    proc->cg = ptr->cg[0];
                }
                else
                {
                    proc->cg = ptr->cg[1];
                }

                proc->unk_3c = ptr->unk_0c;
                proc->unk_40 = ptr->unk_10;

                proc->unk_29_2 = 1;
                proc->unk_29_1 = 1;
                break;
            }
        }

        ptr = &gEndingCredits_0[proc->unk_35];
        something = (proc->unk_35 + 1) & 1;
        if (ptr->entry != NULL)
        {
            Decompress(ptr->entry->img, (void *)(VRAM + gEndingCredits_1[something]));
            Decompress(ptr->entry->tsa, gGenericBuffer);
            CallARM_FillTileRect(
                gUnk_33, gGenericBuffer, (u16)((gEndingCredits_1[something] / CHR_SIZE) + 0x7000));
        }
        else
        {
            CpuFastFill(-1, (void *)(VRAM + gEndingCredits_1[something]), 0x20);
            for (i = 0; i < 0x400; i++)
            {
                gUnk_33[i] = (gEndingCredits_1[something] / CHR_SIZE) + 0x7000;
            }
        }

        proc->unk_34 = proc->unk_35;
    }

    return;
}

//! FE8U = 0x080C43B4
void EndingCredits_UpdateScroll(struct CreditsMainProc * proc)
{
    int unk_30 = (proc->unk_30 >> 8);
    proc->unk_38 = unk_30 / 16;

    if (proc->unk_38 != proc->unk_36)
    {
        int tmp = unk_30 + 240;
        int val = tmp - (tmp / 0x100) * 0x100;
        val = ((val / 8) * 32);

        CpuFastCopy(gUnk_33 + val, gBG0TilemapBuffer + val, 0x80);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        proc->unk_36 = proc->unk_38;
    }

    if (!IsCreditsBlendCGActive() && (proc->unk_2c != proc->unk_30) && ((proc->unk_29_2) != 0) && (proc->unk_30 >= proc->unk_3c))
    {
        StartBlendCreditsCGMaybe(proc, proc->cg);
    }

    BG_SetPosition(BG_0, 0, unk_30 & 0xff);

    proc->unk_2c = proc->unk_30;

    return;
}

//! FE8U = 0x080C4460
void EndingCredits_Init(struct CreditsMainProc * proc)
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

    ApplyPalette(Pal_StaffReelEnt_EndingFin, 7);

    CpuFastFill(-1, (void *)(VRAM + (chr = gEndingCredits_1[0])), 0x20);

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
    proc->timer = 0;

    return;
}

//! FE8U = 0x080C45E0
void EndingCredits_LoadCG(struct CreditsMainProc * proc)
{
    if (proc->unk_29_1)
    {
        if (proc->unk_48 < 10)
        {
            Decompress(proc->cg->img[proc->unk_48], (void *)(0x06008000 + proc->unk_48 * 0x800));
        }
        else
        {
            CallARM_FillTileRect(gBG3TilemapBuffer, proc->cg->tsa, 0);
            BG_EnableSyncByMask(BG3_SYNC_BIT);

            ApplyPalettes(proc->cg->pal, 0, 6);
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
void EndingCredits_Loop_Main(struct CreditsMainProc * proc)
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

    EndingCredits_UpdateStaffReel(proc);
    EndingCredits_UpdateScroll(proc);
    EndingCredits_LoadCG(proc);

    if ((u8)proc->unk_35 > 20)
    {
        proc->timer = 240;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C46E4
void EndingCredits_EndBlendCG(void)
{
    EndCreditsBlendCG();
    return;
}

//! FE8U = 0x080C46F0
void EndingCredits_0(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    SetDefaultColorEffects();

    BG_SetPosition(BG_0, 0, 0);
    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080C4738
void EndingCredits_ShowCopyright(struct CreditsMainProc * proc)
{
    u32 chr;
    const struct StaffReelEnt * ptr = (&gEndingCredits_0[20])->entry;

    Decompress(ptr->img, (void *)(VRAM + (chr = gEndingCredits_1[0])));
    Decompress(ptr->tsa, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, (u16)((chr >> 5) + 0x7000));
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gPaletteBuffer[0] = 0;
    ApplyPalette(Pal_StaffReelEnt_EndingFin, 7);
    EnablePaletteSync();

    proc->timer = 240;

    return;
}

//! FE8U = 0x080C47B0
void EndingCredits_AwaitInputForEnd(struct CreditsMainProc * proc)
{
    proc->timer--;

    if (((gKeyStatusPtr->newKeys & START_BUTTON) != 0) && (CheckGameEndFlag() != 0))
    {
        proc->timer = 0;
    }

    if (proc->timer < 1)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C47F4
void EndingCredits_OnEnd(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    CpuFastFill(0, (void *)VRAM, VRAM_SIZE);
    SetDispEnable(0, 0, 0, 0, 0);
    SetBlendAlpha(0, 0);

    BG_Fill(gBG3TilemapBuffer, -1);
    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_EndingCredits[] =
{
    PROC_YIELD,

    PROC_CALL(EndingCredits_Init),
    PROC_REPEAT(EndingCredits_Loop_Main),

    PROC_GOTO(1),

PROC_LABEL(0),
    PROC_CALL(EndingCredits_EndBlendCG),
    PROC_SLEEP(1),

    PROC_CALL_ARG(NewFadeOut, 16),
    PROC_WHILE(FadeOutExists),

    PROC_CALL(EndingCredits_0),
    PROC_SLEEP(1),

    PROC_CALL(EndingCredits_ShowCopyright),
    PROC_SLEEP(1),

    PROC_CALL_ARG(NewFadeIn, 16),
    PROC_WHILE(FadeInExists),

PROC_LABEL(1),
    PROC_REPEAT(EndingCredits_AwaitInputForEnd),

    PROC_CALL(StartSlowFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_SLEEP(30),

    PROC_CALL(EndingCredits_OnEnd),
    PROC_SLEEP(1),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C4878
void StartEndingCredits(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_EndingCredits, parent);
    return;
}

// clang-format off

const struct StaffReelEnt StaffReelEnt_EndingCredits_0 =
{
    .img = Img_StaffReelEnt_0,
    .tsa = Tsa_StaffReelEnt_0,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_1 =
{
    .img = Img_StaffReelEnt_1,
    .tsa = Tsa_StaffReelEnt_1,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_2 =
{
    .img = Img_StaffReelEnt_2,
    .tsa = Tsa_StaffReelEnt_2,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_3 =
{
    .img = Img_StaffReelEnt_3,
    .tsa = Tsa_StaffReelEnt_3,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_4 =
{
    .img = Img_StaffReelEnt_4,
    .tsa = Tsa_StaffReelEnt_4,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_5 =
{
    .img = Img_StaffReelEnt_5,
    .tsa = Tsa_StaffReelEnt_5,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_6 =
{
    .img = Img_StaffReelEnt_6,
    .tsa = Tsa_StaffReelEnt_6,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_7 =
{
    .img = Img_StaffReelEnt_7,
    .tsa = Tsa_StaffReelEnt_7,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_8 =
{
    .img = Img_StaffReelEnt_8,
    .tsa = Tsa_StaffReelEnt_8,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_9 =
{
    .img = Img_StaffReelEnt_9,
    .tsa = Tsa_StaffReelEnt_9,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_10 =
{
    .img = Img_StaffReelEnt_10,
    .tsa = Tsa_StaffReelEnt_10,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_11 =
{
    .img = Img_StaffReelEnt_11,
    .tsa = Tsa_StaffReelEnt_11,
};

const struct StaffReelEnt StaffReelEnt_EndingCredits_12 =
{
    .img = Img_StaffReelEnt_12,
    .tsa = Tsa_StaffReelEnt_12,
};

const struct CreditsCG CreditsCG_EndingCredits_0 =
{
    .img =
    {
        cg_0_part_0_tiles,
        cg_0_part_1_tiles,
        cg_0_part_2_tiles,
        cg_0_part_3_tiles,
        cg_0_part_4_tiles,
        cg_0_part_5_tiles,
        cg_0_part_6_tiles,
        cg_0_part_7_tiles,
        cg_0_part_8_tiles,
        cg_0_part_9_tiles,
    },
    .tsa = cg_0_map,
    .pal = cg_0_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_1 =
{
    .img =
    {
        cg_1_part_0_tiles,
        cg_1_part_1_tiles,
        cg_1_part_2_tiles,
        cg_1_part_3_tiles,
        cg_1_part_4_tiles,
        cg_1_part_5_tiles,
        cg_1_part_6_tiles,
        cg_1_part_7_tiles,
        cg_1_part_8_tiles,
        cg_1_part_9_tiles,
    },
    .tsa = cg_1_map,
    .pal = cg_1_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_2 =
{
    .img =
    {
        cg_2_part_0_tiles,
        cg_2_part_1_tiles,
        cg_2_part_2_tiles,
        cg_2_part_3_tiles,
        cg_2_part_4_tiles,
        cg_2_part_5_tiles,
        cg_2_part_6_tiles,
        cg_2_part_7_tiles,
        cg_2_part_8_tiles,
        cg_2_part_9_tiles,
    },
    .tsa = cg_2_map,
    .pal = cg_2_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_3 =
{
    .img =
    {
        cg_3_part_0_tiles,
        cg_3_part_1_tiles,
        cg_3_part_2_tiles,
        cg_3_part_3_tiles,
        cg_3_part_4_tiles,
        cg_3_part_5_tiles,
        cg_3_part_6_tiles,
        cg_3_part_7_tiles,
        cg_3_part_8_tiles,
        cg_3_part_9_tiles,
    },
    .tsa = cg_3_map,
    .pal = cg_3_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_4 =
{
    .img =
    {
        cg_4_part_0_tiles,
        cg_4_part_1_tiles,
        cg_4_part_2_tiles,
        cg_4_part_3_tiles,
        cg_4_part_4_tiles,
        cg_4_part_5_tiles,
        cg_4_part_6_tiles,
        cg_4_part_7_tiles,
        cg_4_part_8_tiles,
        cg_4_part_9_tiles,
    },
    .tsa = cg_4_map,
    .pal = cg_4_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_5 =
{
    .img =
    {
        cg_5_part_0_tiles,
        cg_5_part_1_tiles,
        cg_5_part_2_tiles,
        cg_5_part_3_tiles,
        cg_5_part_4_tiles,
        cg_5_part_5_tiles,
        cg_5_part_6_tiles,
        cg_5_part_7_tiles,
        cg_5_part_8_tiles,
        cg_5_part_9_tiles,
    },
    .tsa = cg_5_map,
    .pal = cg_5_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_6 =
{
    .img =
    {
        cg_6_part_0_tiles,
        cg_6_part_1_tiles,
        cg_6_part_2_tiles,
        cg_6_part_3_tiles,
        cg_6_part_4_tiles,
        cg_6_part_5_tiles,
        cg_6_part_6_tiles,
        cg_6_part_7_tiles,
        cg_6_part_8_tiles,
        cg_6_part_9_tiles,
    },
    .tsa = cg_6_map,
    .pal = cg_6_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_7 =
{
    .img =
    {
        cg_7_part_0_tiles,
        cg_7_part_1_tiles,
        cg_7_part_2_tiles,
        cg_7_part_3_tiles,
        cg_7_part_4_tiles,
        cg_7_part_5_tiles,
        cg_7_part_6_tiles,
        cg_7_part_7_tiles,
        cg_7_part_8_tiles,
        cg_7_part_9_tiles,
    },
    .tsa = cg_7_map,
    .pal = cg_7_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_8 =
{
    .img =
    {
        cg_8_part_0_tiles,
        cg_8_part_1_tiles,
        cg_8_part_2_tiles,
        cg_8_part_3_tiles,
        cg_8_part_4_tiles,
        cg_8_part_5_tiles,
        cg_8_part_6_tiles,
        cg_8_part_7_tiles,
        cg_8_part_8_tiles,
        cg_8_part_9_tiles,
    },
    .tsa = cg_8_map,
    .pal = cg_8_palette,
    .unk_30 = 0x78,
};

const struct CreditsCG CreditsCG_EndingCredits_9 =
{
    .img =
    {
        cg_9_part_0_tiles,
        cg_9_part_1_tiles,
        cg_9_part_2_tiles,
        cg_9_part_3_tiles,
        cg_9_part_4_tiles,
        cg_9_part_5_tiles,
        cg_9_part_6_tiles,
        cg_9_part_7_tiles,
        cg_9_part_8_tiles,
        cg_9_part_9_tiles,
    },
    .tsa = cg_9_map,
    .pal = cg_9_palette,
    .unk_30 = 0x78,
};

const u32 Padding_EndingCredits_0[5] = {0};

const struct CreditsEnt gEndingCredits_0[] =
{
    [0] =
    {
        .entry = &StaffReelEnt_EndingCredits_0,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [1] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = &CreditsCG_EndingCredits_1,
            [1] = &CreditsCG_EndingCredits_2,
        },
        .unk_0c = 0x00016000,
        .unk_10 = 0x00027000,
    },
    [2] =
    {
        .entry = &StaffReelEnt_EndingCredits_1,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [3] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = &CreditsCG_EndingCredits_8,
            [1] = &CreditsCG_EndingCredits_8,
        },
        .unk_0c = 0x00034000,
        .unk_10 = 0x00047000,
    },
    [4] =
    {
        .entry = &StaffReelEnt_EndingCredits_2,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [5] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = &CreditsCG_EndingCredits_3,
            [1] = &CreditsCG_EndingCredits_3,
        },
        .unk_0c = 0x00055000,
        .unk_10 = 0x00067000,
    },
    [6] =
    {
        .entry = &StaffReelEnt_EndingCredits_3,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [7] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = &CreditsCG_EndingCredits_6,
            [1] = &CreditsCG_EndingCredits_6,
        },
        .unk_0c = 0x00074000,
        .unk_10 = 0x00087000,
    },
    [8] =
    {
        .entry = &StaffReelEnt_EndingCredits_4,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [9] =
    {
        .entry = &StaffReelEnt_EndingCredits_5,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [10] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = &CreditsCG_EndingCredits_7,
            [1] = &CreditsCG_EndingCredits_7,
        },
        .unk_0c = 0x0009E800,
        .unk_10 = 0x000B7000,
    },
    [11] =
    {
        .entry = &StaffReelEnt_EndingCredits_6,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [12] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = &CreditsCG_EndingCredits_9,
            [1] = &CreditsCG_EndingCredits_9,
        },
        .unk_0c = 0x000C2000,
        .unk_10 = 0x000D7000,
    },
    [13] =
    {
        .entry = &StaffReelEnt_EndingCredits_7,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [14] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = &CreditsCG_EndingCredits_4,
            [1] = &CreditsCG_EndingCredits_4,
        },
        .unk_0c = 0x000E4000,
        .unk_10 = 0x000F7000,
    },
    [15] =
    {
        .entry = &StaffReelEnt_EndingCredits_8,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [16] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = &CreditsCG_EndingCredits_5,
            [1] = &CreditsCG_EndingCredits_5,
        },
        .unk_0c = 0x00103000,
        .unk_10 = 0x00117000,
    },
    [17] =
    {
        .entry = &StaffReelEnt_EndingCredits_9,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [18] =
    {
        .entry = &StaffReelEnt_EndingCredits_10,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [19] =
    {
        .entry = &StaffReelEnt_EndingCredits_11,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [20] =
    {
        .entry = &StaffReelEnt_EndingCredits_12,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
    [21] =
    {
        .entry = NULL,
        .cg =
        {
            [0] = NULL,
            [1] = NULL,
        },
        .unk_0c = 0,
        .unk_10 = 0,
    },
};

const u32 gEndingCredits_1[] =
{
    0x400,
    0x3400,
};

// clang-format on
