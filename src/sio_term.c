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

#if NONMATCHING

/* https://decomp.me/scratch/lXFC6 */

//! FE8U = 0x080469C4
void sub_80469C4(struct SioTermProc * proc)
{
    int permuter;
    int i;
    struct PlaySt playSt;
    u8 flags[4];
    int local_38;

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

            if ((playSt.chapterStateBits & 0x40) != 0)
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

#else

NAKEDFUNC
void sub_80469C4(struct SioTermProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x6c\n\
        adds r7, r0, #0\n\
        movs r0, #0\n\
        str r0, [sp, #0x54]\n\
        bl ClearSioBG\n\
        bl InitSioBG\n\
        ldr r1, [sp, #0x54]\n\
        str r1, [sp]\n\
        adds r0, r7, #0\n\
        movs r1, #0\n\
        movs r2, #0x10\n\
        movs r3, #4\n\
        bl StartMuralBackgroundExt\n\
        ldr r0, _08046AB8  @ Img_TacticianSelObj\n\
        ldr r1, _08046ABC  @ 0x06014800\n\
        bl Decompress\n\
        ldr r0, _08046AC0  @ Font_0203DB64\n\
        bl SetTextFont\n\
        bl InitSystemTextFont\n\
        bl ResetTextFont\n\
        movs r0, #0xc0\n\
        movs r1, #0x10\n\
        adds r2, r7, #0\n\
        bl StartLinkArenaButtonSpriteDraw\n\
        ldr r4, _08046AC4  @ gSioTexts\n\
        adds r0, r4, #0\n\
        movs r1, #0x18\n\
        bl InitText\n\
        adds r4, #8\n\
        adds r0, r4, #0\n\
        movs r1, #0x18\n\
        bl InitText\n\
        ldr r0, _08046AC8  @ 0x0000074C\n\
        movs r1, #0\n\
        bl sub_8043100\n\
        ldr r0, _08046ACC  @ 0x0000074D\n\
        movs r1, #1\n\
        bl sub_8043100\n\
        movs r0, #1\n\
        negs r0, r0\n\
        str r0, [r7, #0x4c]\n\
        movs r2, #2\n\
        mov r9, r2\n\
        mov r3, sp\n\
        adds r3, #0x50\n\
        str r3, [sp, #0x58]\n\
        add r6, sp, #4\n\
        movs r5, #8\n\
        mov r4, sp\n\
        adds r4, #0x52\n\
    _08046A4A:\n\
        movs r0, #0\n\
        strb r0, [r4]\n\
        mov r0, r9\n\
        bl IsSaveValid\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        beq _08046B34\n\
        mov r0, r9\n\
        add r1, sp, #4\n\
        bl ReadGameSavePlaySt\n\
        add r0, sp, #4\n\
        bl GetChapterTitleExtra\n\
        adds r2, r7, #0\n\
        adds r2, #0x2c\n\
        adds r1, r2, r5\n\
        str r0, [r1]\n\
        ldrb r1, [r6, #0x14]\n\
        movs r0, #0x40\n\
        ands r0, r1\n\
        mov sl, r2\n\
        cmp r0, #0\n\
        beq _08046A84\n\
        ldrb r0, [r4]\n\
        movs r1, #4\n\
        orrs r0, r1\n\
        strb r0, [r4]\n\
    _08046A84:\n\
        mov r0, sp\n\
        adds r0, #0x46\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #0x1a\n\
        cmp r0, #0\n\
        blt _08046AD0\n\
        ldrb r0, [r6, #0x1b]\n\
        cmp r0, #1\n\
        bne _08046A9E\n\
        ldrb r0, [r4]\n\
        movs r1, #0x10\n\
        orrs r0, r1\n\
        strb r0, [r4]\n\
    _08046A9E:\n\
        ldrb r0, [r6, #0x1b]\n\
        cmp r0, #2\n\
        bne _08046AAC\n\
        ldrb r0, [r4]\n\
        movs r1, #0x20\n\
        orrs r0, r1\n\
        strb r0, [r4]\n\
    _08046AAC:\n\
        ldrb r0, [r6, #0x1b]\n\
        cmp r0, #3\n\
        bne _08046AE4\n\
        ldrb r0, [r4]\n\
        movs r1, #0x40\n\
        b _08046AE0\n\
        .align 2, 0\n\
    _08046AB8: .4byte Img_TacticianSelObj\n\
    _08046ABC: .4byte 0x06014800\n\
    _08046AC0: .4byte Font_0203DB64\n\
    _08046AC4: .4byte gSioTexts\n\
    _08046AC8: .4byte 0x0000074C\n\
    _08046ACC: .4byte 0x0000074D\n\
    _08046AD0:\n\
        ldrb r0, [r6, #0x1b]\n\
        cmp r0, #3\n\
        bne _08046ADC\n\
        ldrb r0, [r4]\n\
        movs r1, #0x40\n\
        b _08046AE0\n\
    _08046ADC:\n\
        ldrb r0, [r4]\n\
        movs r1, #0x20\n\
    _08046AE0:\n\
        orrs r0, r1\n\
        strb r0, [r4]\n\
    _08046AE4:\n\
        add r0, sp, #4\n\
        bl IsGameNotFirstChapter\n\
        lsls r0, r0, #0x18\n\
        cmp r0, #0\n\
        beq _08046B02\n\
        adds r2, r7, #0\n\
        adds r2, #0x38\n\
        adds r1, r2, r5\n\
        mov r3, sl\n\
        adds r0, r3, r5\n\
        ldr r0, [r0]\n\
        str r0, [r1]\n\
        mov r8, r2\n\
        b _08046B10\n\
    _08046B02:\n\
        adds r1, r7, #0\n\
        adds r1, #0x38\n\
        adds r0, r1, r5\n\
        movs r2, #1\n\
        negs r2, r2\n\
        str r2, [r0]\n\
        mov r8, r1\n\
    _08046B10:\n\
        mov r3, r8\n\
        adds r0, r3, r5\n\
        ldr r0, [r0]\n\
        movs r1, #1\n\
        negs r1, r1\n\
        cmp r0, r1\n\
        beq _08046B50\n\
        ldr r2, [sp, #0x54]\n\
        cmp r2, #0\n\
        bne _08046B2E\n\
        mov r3, r9\n\
        str r3, [r7, #0x50]\n\
        movs r0, #1\n\
        str r0, [sp, #0x54]\n\
        b _08046B50\n\
    _08046B2E:\n\
        mov r1, r9\n\
        str r1, [r7, #0x4c]\n\
        b _08046B50\n\
    _08046B34:\n\
        adds r2, r7, #0\n\
        adds r2, #0x2c\n\
        adds r3, r2, r5\n\
        mov r8, r3\n\
        adds r1, r7, #0\n\
        adds r1, #0x38\n\
        adds r0, r1, r5\n\
        movs r3, #1\n\
        negs r3, r3\n\
        str r3, [r0]\n\
        mov r0, r8\n\
        str r3, [r0]\n\
        mov sl, r2\n\
        mov r8, r1\n\
    _08046B50:\n\
        subs r5, #4\n\
        subs r4, #1\n\
        movs r1, #1\n\
        negs r1, r1\n\
        add r9, r1\n\
        mov r2, r9\n\
        cmp r2, #0\n\
        blt _08046B62\n\
        b _08046A4A\n\
    _08046B62:\n\
        adds r0, r1, #0\n\
        ldr r1, [r7, #0x4c]\n\
        cmp r1, r0\n\
        bne _08046B72\n\
        ldr r0, [r7, #0x50]\n\
        str r0, [r7, #0x4c]\n\
        str r0, [r7, #0x48]\n\
        b _08046B74\n\
    _08046B72:\n\
        str r1, [r7, #0x48]\n\
    _08046B74:\n\
        movs r0, #0xd0\n\
        lsls r0, r0, #1\n\
        bl PutChapterTitleBG\n\
        movs r3, #0\n\
        mov r9, r3\n\
        movs r0, #0xa0\n\
        lsls r0, r0, #1\n\
        str r0, [sp, #0x5c]\n\
        mov r1, sl\n\
        str r1, [sp, #0x60]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #1\n\
        str r2, [sp, #0x64]\n\
        ldr r6, [sp, #0x58]\n\
        str r3, [sp, #0x68]\n\
        movs r0, #0x88\n\
        lsls r0, r0, #7\n\
        mov sl, r0\n\
    _08046B9A:\n\
        ldr r0, [sp, #0x68]\n\
        add r0, r8\n\
        ldr r1, [r0]\n\
        movs r0, #1\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        bne _08046BB0\n\
        ldrb r1, [r6]\n\
        movs r0, #2\n\
        orrs r0, r1\n\
        strb r0, [r6]\n\
    _08046BB0:\n\
        ldrb r1, [r6]\n\
        movs r0, #1\n\
        orrs r0, r1\n\
        mov r4, r9\n\
        adds r4, #4\n\
        adds r1, r4, #0\n\
        bl sub_80895B4\n\
        ldrb r0, [r6]\n\
        mov r5, r9\n\
        adds r5, #7\n\
        adds r1, r5, #0\n\
        bl sub_80895B4\n\
        ldr r0, _08046C58  @ gBG1TilemapBuffer+0x006\n\
        ldr r1, [sp, #0x64]\n\
        adds r0, r1, r0\n\
        adds r1, r4, #0\n\
        bl sub_8089720\n\
        mov r2, sl\n\
        lsls r0, r2, #0xf\n\
        lsrs r0, r0, #0x14\n\
        ldr r3, [sp, #0x60]\n\
        ldm r3!, {r1}\n\
        str r3, [sp, #0x60]\n\
        bl PutChapterTitleGfx\n\
        ldr r0, _08046C5C  @ gBG0TilemapBuffer+0x006\n\
        ldr r1, [sp, #0x5c]\n\
        adds r0, r1, r0\n\
        adds r1, r5, #0\n\
        bl sub_80896D8\n\
        ldr r2, [sp, #0x5c]\n\
        movs r3, #0x80\n\
        lsls r3, r3, #1\n\
        adds r2, r2, r3\n\
        str r2, [sp, #0x5c]\n\
        ldr r0, [sp, #0x64]\n\
        adds r0, r0, r3\n\
        str r0, [sp, #0x64]\n\
        adds r6, #1\n\
        ldr r1, [sp, #0x68]\n\
        adds r1, #4\n\
        str r1, [sp, #0x68]\n\
        movs r2, #0x80\n\
        lsls r2, r2, #4\n\
        add sl, r2\n\
        movs r3, #1\n\
        add r9, r3\n\
        mov r0, r9\n\
        cmp r0, #2\n\
        ble _08046B9A\n\
        ldr r2, _08046C60  @ gLCDControlBuffer\n\
        ldrb r1, [r2, #1]\n\
        movs r0, #0x21\n\
        negs r0, r0\n\
        ands r0, r1\n\
        movs r1, #0x41\n\
        negs r1, r1\n\
        ands r0, r1\n\
        movs r1, #0x7f\n\
        ands r0, r1\n\
        strb r0, [r2, #1]\n\
        adds r0, r7, #0\n\
        movs r1, #1\n\
        movs r2, #0\n\
        bl StartLinkArenaTitleBanner\n\
        bl sub_804C508\n\
        movs r0, #0xf\n\
        bl BG_EnableSyncByMask\n\
        add sp, #0x6c\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08046C58: .4byte gBG1TilemapBuffer+0x006\n\
    _08046C5C: .4byte gBG0TilemapBuffer+0x006\n\
    _08046C60: .4byte gLCDControlBuffer\n\
        .syntax divided\n\
    ");
}

#endif

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
