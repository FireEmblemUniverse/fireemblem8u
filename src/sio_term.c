#include "global.h"

#include "bmlib.h"
#include "hardware.h"
#include "bmsave.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmio.h"
#include "prepscreen.h"

#include "sio.h"
#include "sio_core.h"

struct SioTermProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c[3];
    /* 38 */ int unk_38[3];
    /* 44 */ STRUCT_PAD(0x44, 0x48);
    /* 48 */ int unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
};

extern struct Font Font_0203DB64;
extern struct Text gSioTexts[];

/* https://decomp.me/scratch/lXFC6 */
//! FE8U = 0x080469C4
void sub_80469C4(struct SioTermProc * proc)
{
    int permuter, permuter2;
    int i;
    struct PlaySt playSt;
    u8 flags[4];
    int local_38;
    u8 r1;

    local_38 = 0;

    ClearSioBG();
    InitSioBG();

    StartMuralBackgroundExt(proc, 0, 0x10, 4, 0);

    Decompress(Img_TacticianSelObj, (void *)0x06014800);

    SetTextFont(&Font_0203DB64);
    InitSystemTextFont();
    ResetTextFont();

    StartLinkArenaButtonSpriteDraw(0xc0, 0x10, proc);

    InitText(&gSioTexts[0], 0x18);
    InitText(&gSioTexts[1], 0x18);

    sub_8043100(0x0000074C, 0);
    sub_8043100(0x0000074D, 1);

    proc->unk_4c = -1;

    for (i = 2; i >= 0; i--)
    {
        flags[i] = 0;

        if (IsSaveValid(i))
        {
            ReadGameSavePlaySt(i, &playSt);
            proc->unk_2c[i] = GetChapterTitleExtra(&playSt);

            r1 = playSt.chapterStateBits;
            permuter2 = 0x40;

            permuter2 &= r1;
            if (permuter2)
            {
                flags[i] |= 4;
            }

            if (playSt.config.controller == 0)
            {
                if (playSt.chapterModeIndex == 1)
                {
                    flags[i] |= 0x10;
                }

                if (playSt.chapterModeIndex == 2)
                {
                    flags[i] |= 0x20;
                }

                if (playSt.chapterModeIndex == 3)
                {
                    flags[i] |= 0x40;
                }
            }
            else
            {
                if (playSt.chapterModeIndex == 3)
                {
                    flags[i] |= 0x40;
                }
                else
                {
                    flags[i] |= 0x20;
                }
            }

            if (IsGameNotFirstChapter(&playSt))
            {
                proc->unk_38[i] = proc->unk_2c[i];
            }
            else
            {
                proc->unk_38[i] = -1;
            }

            if (proc->unk_38[i] != -1)
            {
                if (local_38 == 0)
                {
                    proc->unk_50 = i;
                    local_38 = 1;
                }
                else
                {
                    proc->unk_4c = i;
                }
            }
        }
        else
        {
            proc->unk_2c[i] = proc->unk_38[i] = -1;
        }
    }

    if (proc->unk_4c == -1)
    {
        proc->unk_4c = proc->unk_50;
        proc->unk_48 = proc->unk_50;
    }
    else
    {
        proc->unk_48 = proc->unk_4c;
    }

    PutChapterTitleBG(0x1a0);

    for (i = 0; i < 3; i++)
    {
        permuter = 4;

        if (proc->unk_38[i] == -1)
        {
            flags[i] |= 2;
        }

        sub_80895B4(flags[i] | 1, i + 4);
        sub_80895B4(flags[i], i + 7);
        sub_8089720(TILEMAP_LOCATED(gBG1TilemapBuffer, 3, (3 + i * permuter) + 1), i + 4);
        PutChapterTitleGfx(((0x800 * (u32)i + 0x4400) & 0x1FFFF) / 0x20, proc->unk_2c[i]);
        sub_80896D8(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, (3 + i * permuter) + 2), i + 7);
    }

    SetWinEnable(0, 0, 0);

    StartLinkArenaTitleBanner(proc, 1, 0);
    sub_804C508();

    BG_EnableSyncByMask(0xf);

    return;
}

//! FE8U = 0x08046C64
void sub_8046C64(int * cur, u8 bottom, u8 top, int * buf, u8 total)
{
    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) &&
        (*cur > top || gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys))
    {
        do
        {
            *cur -= 1;

            if (*cur < 0)
            {
                *cur = total - 1;
            }
        } while (buf[*cur] == -1);
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) &&
        (*cur < bottom || gKeyStatusPtr->repeatedKeys == gKeyStatusPtr->newKeys))
    {
        do
        {
            *cur += 1;
            *cur = *cur % total;
        } while (buf[*cur] == -1);
    }

    return;
}

//! FE8U = 0x08046CF0
void sub_8046CF0(struct SioTermProc * proc)
{
    int current = proc->unk_48;

    sub_8046C64(&proc->unk_48, proc->unk_50, proc->unk_4c, proc->unk_38, 3);
    DisplayUiHand(0x1c, proc->unk_48 * 0x20 + 0x28);

    if (current != proc->unk_48)
    {
        SioPlaySoundEffect(3);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        SioPlaySoundEffect(2);
        Proc_Break(proc);
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Goto(proc, 4);
    }

    return;
}

//! FE8U = 0x08046D6C
void sub_8046D6C(struct SioTermProc * proc)
{
    ReadGameSave(proc->unk_48);

    gPlaySt.chapterStateBits &= ~(PLAY_FLAG_COMPLETE);
    gPlaySt.config.windowColor = 0;
    gLinkArenaSt.unk_04 = proc->unk_48;

    SetupMapSpritesPalettes();
    sub_80496A4();

    BG_SetPosition(BG_1, 0, 0);

    return;
}

//! FE8U = 0x08046DB4
void sub_8046DB4(ProcPtr proc)
{
    if (gLinkArenaSt.unk_03 == 0xFF)
    {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x08046DD0
void sub_8046DD0(ProcPtr proc)
{
    if (gLinkArenaSt.unk_04 == 0xFF)
    {
        Proc_Goto(proc, 2);
    }

    return;
}

//! FE8U = 0x08046DEC
void sub_8046DEC(ProcPtr proc)
{
    if (Proc_Find(ProcScr_AtMenu) == NULL)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08046E0C
void sub_8046E0C(ProcPtr proc)
{
    if (gUnk_Sio_0203DD24 == 0)
    {
        return;
    }

    sub_804309C();
    nullsub_13();
    sub_804C4F8();
    sub_804C590();
    EndLinkArenaButtonSpriteDraw();

    BMapVSync_End();
    StartPrepAtMenu();

    Proc_Goto(proc, 5);

    return;
}

//! FE8U = 0x08046E4C
void sub_8046E4C(void)
{
    BG_SetPosition(1, 0, 0);
    return;
}
