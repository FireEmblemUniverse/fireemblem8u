#include "global.h"
#include "hardware.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "icon.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrlevelup.h"
#include "soundwrapper.h"

EWRAM_DATA struct ProcEkrPopup *gpProcEkrPopup = NULL;
EWRAM_DATA int gEkrPopupEnded = false;

void PutBanimBgIMG(int index)
{
    int _i = index * 3;
    LZ77UnCompVram(gBattleBGDataTable[_i], (void *)BG_VRAM + 0x8000);
}

void PutBanimBgTSA(int index)
{
    int _i = index * 3 + 1;
    LZ77UnCompWram(gBattleBGDataTable[_i], gEkrTsaBuffer);
    sub_8070E94(gEkrTsaBuffer, gBG3TilemapBuffer, 0x1E, 0x14, 0x6, 0x0);
}

void PutBanimBgPAL(int index)
{
    int _i = index * 3 + 2;
    LZ77UnCompWram(gBattleBGDataTable[_i], PAL_BG(0x6));
}

void PutBanimBG(int index)
{
    PutBanimBgIMG(index);
    CpuFastFill16(0, (void *)BG_VRAM + BG_VRAM_SIZE - 0x20, 0x20);
    PutBanimBgTSA(index);
    PutBanimBgPAL(index);

    PAL_BG_COLOR(0, 0) = RGB(0, 0, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    EnablePaletteSync();
}

bool CheckEkrPopupEnded(void)
{
    if (gEkrPopupEnded == true)
        return true;
    
    return false;
}

void DeleteAnimsOnPopup(void)
{
    if (gpProcEkrPopup != NULL) {
        Proc_End(gpProcEkrPopup);
        gpProcEkrPopup = NULL;
    }
}

void EfxPlaySound5AVol100(void)
{
    EfxPlaySE(0x5A, 0x100);
}

void EfxPlaySound5CVol100(void)
{
    EfxPlaySE(0x5C, 0x100);
}

void MakeBattlePopupTileMapFromTSA(u16 *tm, u16 width)
{
    u32 i;
    u16 *ekrTsaBuf = gEkrTsaBuffer;
    s32 constant = 0x1100;

    tm[0x00] = ekrTsaBuf[0x00] + constant;
    tm[0x20] = ekrTsaBuf[0x1A] + constant;
    tm[0x40] = ekrTsaBuf[0x34] + constant;
    tm[0x60] = ekrTsaBuf[0x4E] + constant;

    tm[0x01] = ekrTsaBuf[0x01] + constant;
    tm[0x21] = ekrTsaBuf[0x1B] + constant;
    tm[0x41] = ekrTsaBuf[0x35] + constant;
    tm[0x61] = ekrTsaBuf[0x4F] + constant;

    for (i = 0; i < width; i++) {
  
        tm[0x02 + i] = ekrTsaBuf[0x02 + i] + constant;
        tm[0x22 + i] = ekrTsaBuf[0x1C + i] + constant;
        tm[0x42 + i] = ekrTsaBuf[0x36 + i] + constant;
        tm[0x62 + i] = ekrTsaBuf[0x50 + i] + constant;
    }

    tm[0x02 + i] = ekrTsaBuf[0x18] + constant;
    tm[0x22 + i] = ekrTsaBuf[0x32] + constant;
    tm[0x42 + i] = ekrTsaBuf[0x4C] + constant;
    tm[0x62 + i] = ekrTsaBuf[0x66] + constant;

    tm[0x03 + i] = ekrTsaBuf[0x19] + constant;
    tm[0x23 + i] = ekrTsaBuf[0x33] + constant;
    tm[0x43 + i] = ekrTsaBuf[0x4D] + constant;
    tm[0x63 + i] = ekrTsaBuf[0x67] + constant;
}

void DrawBattlePopup(struct ProcEkrPopup *proc, int type, u32 priv)
{
    const char *str;
    int width1, width2, width3, width_popupbox, width5, xcursor, tmp, tmpr0;

#if NONMATCHING
    int tmpr1;
#else
    register int tmpr1 asm("r1");
#endif

    struct TextHandle *text;
    struct Anim *anim;

    static u32 instr_unit[6] = {
        0x40000000, 0, 0, 1, 0, 0
    };

    static u32 anim_instr[2] = {
        (u32)instr_unit + 1,
        0x80000000
    };

    LZ77UnCompVram(gUnknown_08803B30, (void *)BG_VRAM + 0x2000);
    LZ77UnCompWram(gUnknown_08803CD0, (void *)gEkrTsaBuffer);
    Font_InitForUI(&gSomeFontStruct, (void *)BG_VRAM + 0x2100, 0x108, 1);
    Font_SetSomeSpecialDrawingRoutine();
    CpuFastCopy(gUnknown_08803CB0, PAL_BG(0x1), 0x20);

    if (type == 0) {
        /*  [.] */
        str = GetStringFromIndex(0x01);
        width1 = GetStringTextWidth(str);
        width2 = width1 + 0x10;

        /* Weapon Level increased.[.] */
        str = GetStringFromIndex(0x02);
        width3 = GetStringTextWidth(str) + width2;
    } else if (type == 1) {
        width1 = 0;
        str = GetItemNameWithArticle(priv, 1);
        width2 = GetStringTextWidth(str) + 0x10;

        /* broke! */
        str = GetStringFromIndex(0x03);
        width3 = GetStringTextWidth(str) + width2 + 0x04;
    } else {
        width1 = 0;
        width2 = 0x10;

        /* You can now use  */
        str = GetStringFromIndex(0x0D);
        width3 = GetStringTextWidth(str) + 0x10;
    }

    width_popupbox = (width3 + 7) >> 3;
    MakeBattlePopupTileMapFromTSA(gBG1TilemapBuffer, width_popupbox);

    text = &gTextEkrlvupMsg[0];
    Text_Init(text, width_popupbox);
    xcursor = (width_popupbox * 8 - width3) >> 1;
    Text_SetXCursor(text, xcursor);
    LZ77UnCompVram(gUnknown_08803BD0, (void *)BG_VRAM + 0x2100);

    if (type == 0) {
        /*  [.] */
        str = GetStringFromIndex(0x01);
        Text_SetColorId(text, TEXT_COLOR_NORMAL);
        Text_AppendString(text, str);

        Text_Advance(text, 0x10);

        /* Weapon Level increased.[.] */
        str = GetStringFromIndex(0x02);
        Text_SetColorId(text, TEXT_COLOR_NORMAL);
        Text_AppendString(text, str);
    } else if (type == 1) {
        str = GetItemNameWithArticle(priv, 1);
        Text_SetColorId(text, TEXT_COLOR_GRAY);
        Text_AppendString(text, str);
        Text_Advance(text, 0x14);

        /* broke! */
        str = GetStringFromIndex(0x03);
        Text_SetColorId(text, TEXT_COLOR_NORMAL);
        Text_AppendString(text, str);
    } else {
        /* You can now use  */
        str = GetStringFromIndex(0x0D);
        Text_SetColorId(text, TEXT_COLOR_NORMAL);
        Text_AppendString(text, str);
    }

    width5 = (0xE0 - (width_popupbox + 2) * 8) / 2;
    BG_SetPosition(BG_1, -width5, 0xFFD0);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    ResetIconGraphics_();

    if (type == 0) {
        LoadIconPalette(1, 0x12);
        LoadIconObjectGraphics(GetItemType(priv) + 0x70, 0x40);
    } else if (type == 1) {
        LoadIconPalette(0, 0x12);
        LoadIconObjectGraphics(GetItemIconId(priv), 0x40);
        tmpr0 = width5 - 0xE;
        width5 = tmpr0 + width2;
    } else {
        LoadIconPalette(1, 0x12);
        LoadIconObjectGraphics(priv + 0x70, 0x40);
        tmpr0 = width5 -0x10;
        width5 = tmpr0 + width3;
    }

    anim = AnimCreate(anim_instr, 0x96);
    proc->anim = anim;
    anim->oam2Base = 0x2440;

    tmpr1 = xcursor + 0x10;
    tmpr1 = width5 + tmpr1;
    anim->xPosition = tmpr1 + width1;
    anim->yPosition = 0x38;

    EnablePaletteSync();
    SetDefaultColorEffects();
    SetWinEnable(0, 0, 0);
}

CONST_DATA struct ProcCmd ProcScr_ekrPopup[] = {
    PROC_NAME("ekrPopup"),
    PROC_REPEAT(BattlePopup_Wait16Frames),
    PROC_REPEAT(ekrPopup_DrawWRankUp),
    PROC_REPEAT(ekrPopup_WaitWRankUp),
    PROC_REPEAT(ekrPopup_DrawWRankUp2),
    PROC_REPEAT(ekrPopup_WaitWRankUp2),
    PROC_REPEAT(ekrPopup_DrawWpnBroke),
    PROC_REPEAT(ekrPopup_WaitWpnBroke),
    PROC_REPEAT(ekrPopup_DrawWpnBroke2),
    PROC_REPEAT(ekrPopup_WaitWpnBroke2),
    PROC_REPEAT(ekrPopup_MarkEnd),
    PROC_REPEAT(nullsub_68),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_ekrPopup2[] = {
    PROC_NAME("ekrPopup2"),
    PROC_REPEAT(BattlePopup_Wait16Frames),

PROC_LABEL(0x0),
    PROC_REPEAT(sub_8076250),
    PROC_REPEAT(sub_8076290),
    PROC_SLEEP(0x14),

PROC_LABEL(0x1),
    PROC_REPEAT(sub_80762D0),
    PROC_REPEAT(sub_8076290),

PROC_LABEL(0x5),
    PROC_REPEAT(ekrPopup_MarkEnd),
    PROC_REPEAT(nullsub_68),
    PROC_END
};

void NewEkrPopup(void)
{
    int i;
    struct ProcEkrPopup *proc;

    if (gEkrDistanceType == 4) {
        gpProcEkrPopup = proc = Proc_Start(ProcScr_ekrPopup2, PROC_TREE_3);
        gEkrPopupEnded = 0;

        proc->unk44 = -1;
        proc->unk48 = -1;

        for (i = 0; i < 8; i++) {
            gpEkrBattleUnitRight = gpEkrBattleUnitRight;
            if (&gpEkrBattleUnitLeft == &gpEkrBattleUnitLeft && &gpEkrBattleUnitRight == &gpEkrBattleUnitRight && gpEkrBattleUnitRight->unit.ranks[i] == 0) {
                if (gpEkrBattleUnitLeft->unit.ranks[i] != 0) {
                    if (proc->unk44 == -1)
                        proc->unk44 = i;
                    else
                        proc->unk48 = i;
                }
            }
            gpEkrBattleUnitLeft = gpEkrBattleUnitLeft;
        }

        if (proc->unk44 != -1) {
            Sound_SetSEVolume(0x80);
        } else {
            gEkrPopupEnded = true;
            DeleteAnimsOnPopup();
            return;
        }
    } else {
        gpProcEkrPopup = proc = Proc_Start(ProcScr_ekrPopup, PROC_TREE_3);
        gEkrPopupEnded = 0;
    
        proc->timer = 0;
        proc->unk48 = 0;
        proc->unk44 = 0;
        proc->unk50 = 0;
        proc->unk4C = 0;
    
        if (gBanimSomeObjPalIndex[EKR_BATTLE_LEFT] == false) {
            if (HasBattleUnitGainedWeaponLevel(gpEkrBattleUnitLeft) == true)
                proc->unk44 = gpEkrBattleUnitLeft->weaponBefore;
    
            if (DidBattleUnitBreakWeapon(gpEkrBattleUnitLeft) == true)
                proc->unk48 = gpEkrBattleUnitLeft->weaponBefore;
        }
    
        if (gBanimSomeObjPalIndex[EKR_BATTLE_RIGHT] == false) {
            if (HasBattleUnitGainedWeaponLevel(gpEkrBattleUnitRight) == true)
                proc->unk4C = gpEkrBattleUnitRight->weaponBefore;
    
            if (DidBattleUnitBreakWeapon(gpEkrBattleUnitRight) == true)
                proc->unk50 = gpEkrBattleUnitRight->weaponBefore;
        }
    
        if (proc->unk44 + proc->unk48 + proc->unk4C + proc->unk50 == 0) {
            gEkrPopupEnded = true;
            DeleteAnimsOnPopup();
        } else {
            Sound_SetSEVolume(0x80);
        }
    }
}

void BattlePopup_Wait16Frames(struct ProcEkrPopup *proc)
{
    if (++proc->timer > 16)
        Proc_Break(proc);
}

void ekrPopup_DrawWRankUp(struct ProcEkrPopup *proc)
{
    u32 priv;

    priv = proc->unk44;
    if (priv != 0) {
        DrawBattlePopup(proc, 0, priv);
        EfxPlaySound5AVol100();
        proc->timer = 0;
        proc->unk2E = 0x60;
    }

    Proc_Break(proc);
}

void ekrPopup_WaitWRankUp(struct ProcEkrPopup *proc)
{
    if (proc->unk44 == 0) {
        Proc_Break(proc);
        return;
    }
    
    if (++proc->timer > proc->unk2E) {
        AnimDelete(proc->anim);
        ClearBG1();
        Proc_Break(proc);
    }
}

void ekrPopup_DrawWRankUp2(struct ProcEkrPopup *proc)
{
    u32 priv = proc->unk4C;
    if (priv != 0) {
        DrawBattlePopup(proc, 0, priv);
        EfxPlaySound5AVol100();
        
        proc->timer = 0;
        proc->unk2E = 0x60;
    }

    Proc_Break(proc);
}

void ekrPopup_WaitWRankUp2(struct ProcEkrPopup *proc)
{
    if (proc->unk4C == 0) {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->unk2E) {
        AnimDelete(proc->anim);
        ClearBG1();
        Proc_Break(proc);
    }
}

void ekrPopup_DrawWpnBroke(struct ProcEkrPopup *proc)
{
    u32 priv = proc->unk48;
    if (priv != 0) {
        DrawBattlePopup(proc, 1, priv);
        EfxPlaySound5CVol100();
        
        proc->timer = 0;
        proc->unk2E = 0x6C;
    }

    Proc_Break(proc);
}

void ekrPopup_WaitWpnBroke(struct ProcEkrPopup *proc)
{
    if (proc->unk48 == 0) {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->unk2E) {
        AnimDelete(proc->anim);
        ClearBG1();
        Proc_Break(proc);
    }
}

void ekrPopup_DrawWpnBroke2(struct ProcEkrPopup *proc)
{
    u32 priv = proc->unk50;
    if (priv != 0) {
        DrawBattlePopup(proc, 1, priv);
        EfxPlaySound5CVol100();
        
        proc->timer = 0;
        proc->unk2E = 0x6C;
    }

    Proc_Break(proc);
}

void ekrPopup_WaitWpnBroke2(struct ProcEkrPopup *proc)
{
    if (proc->unk50 == 0) {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->unk2E) {
        proc->timer = 0;
        AnimDelete(proc->anim);
        ClearBG1();
        Proc_Break(proc);
    }
}

void ekrPopup_MarkEnd(struct ProcEkrPopup *proc)
{
    if (++proc->timer > 0x10) {
        gEkrPopupEnded = true;
        Sound_SetSEVolume(0x100);
        Proc_Break(proc);
    }
}

void nullsub_68(struct ProcEkrPopup *proc)
{
    return;
}

/**
 * Popup2: for promotion
 */

void sub_8076250(struct ProcEkrPopup *proc)
{
    u32 priv;

    priv = proc->unk44;
    if (priv == -1) {
        Proc_Goto(proc, 0x1);
        return;
    }

    if (proc->unk4C != 0) {
        DrawBattlePopup(proc, 2, priv);
        EfxPlaySound5AVol100();
        proc->timer = 0;
        proc->unk2E = 0x60;
    }

    Proc_Break(proc);
}

void sub_8076290(struct ProcEkrPopup *proc)
{
    if (proc->unk50 == 0) {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer > proc->unk2E) {
        proc->timer = 0;
        AnimDelete(proc->anim);
        ClearBG1();
        Proc_Break(proc);
    }
}

void sub_80762D0(struct ProcEkrPopup *proc)
{
    u32 priv;

    priv = proc->unk48;
    if (priv == -1) {
        Proc_Goto(proc, 0x5);
        return;
    }

    if (proc->unk4C != 0) {
        DrawBattlePopup(proc, 2, priv);
        EfxPlaySound5AVol100();
        proc->timer = 0;
        proc->unk2E = 0x60;
    }

    Proc_Break(proc);
}
