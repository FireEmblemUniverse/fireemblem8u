#pragma once

#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"

struct ProcEkrLevelup {
    PROC_HEADER;

    /* 29 */ bool8 unk29;
    /* 2A */ bool8 is_promotion; // promo = 1, else = 0
    /* 2C */ s16 count;    // init 0, maybe a counter
    /* 2E */ s16 stat_id;
    /* 30 */ u8 _pad_30[0x44 - 0x30];
    /* 44 */ int unk_44;
    /* 48 */ int unk_48;
    /* 4C */ int unk_4C;
    /* 50 */ int unk_50;
    /* 54 */ u8 _pad_54[0x5C - 0x54];
    /* 5C */ void *ais_main;
    /* 60 */ void *ais_struct;
};

enum ekr_lvup_status_index {
    EKRLVUP_STAT_HP = 0,
    EKRLVUP_STAT_POW,
    EKRLVUP_STAT_SKL,
    EKRLVUP_STAT_SPD,
    EKRLVUP_STAT_LCK,
    EKRLVUP_STAT_DEF,
    EKRLVUP_STAT_RES,
    EKRLVUP_STAT_CON,
    EKRLVUP_STAT_MAX,

    EKRLVUP_STAT_CLASS = EKRLVUP_STAT_MAX,
    EKRLVUP_STAT_LV_MSG,
    EKRLVUP_STAT_LV_VAL,

    EKRLVUP_STAT_PNAME = EKRLVUP_STAT_MAX,
    EKRLVUP_STAT_LVPRE_MSG,
    EKRLVUP_STAT_LVPRE_VAL
};

extern CONST_DATA unsigned *EkrLvupMsgsStr[];
extern CONST_DATA unsigned *EkrLvupMsgsMag[];
extern const u16 sEfxLvupPartsPos[];

extern struct TextHandle gTextEkrlvupMsg[EKRLVUP_STAT_MAX];
extern struct TextHandle gTextEkrlvupValue[EKRLVUP_STAT_MAX];
extern struct ProcEkrLevelup *gpProcEkrLevelup;
// extern ??? gUnknown_020200B8
// extern ??? gUnknown_020200D8
// extern ??? gUnknown_020200DC
// extern ??? gUnknown_020200E0
extern struct Unit *gpEkrLvupUnit;
extern struct BattleUnit *gpEkrLvupBattleUnit;
extern u16 gEkrLvupPreLevel;
extern u16 gEkrLvupPostLevel;
extern u16 gEkrLvupBaseStatus[EKRLVUP_STAT_MAX];
extern u16 gEkrLvupPostStatus[EKRLVUP_STAT_MAX];
extern u16 gEkrLvupScrollPos1;
extern u16 gEkrLvupScrollPos2;
// extern ??? gUnknown_02020138
// extern ??? gUnknown_0202013C

bool DoesEkrLevelUpSomething(void);
void EndEkrLevelUp(void);
void EkrLvup_InitStatusText(struct ProcEkrLevelup *proc);
void EkrLvup_DrawUpdatedStatus(struct ProcEkrLevelup *proc, int index);
void EkrLvup_DrawUnitName(void);
void EkrLvup_DrawPreLevelValue(void);
void NewEkrLevelup(void *ais);
void EkrLvup_OnPrepare(struct ProcEkrLevelup *proc);
void EkrLvup_InitScreen(struct ProcEkrLevelup *proc);
void EkrLvup_InitLevelUpBox(struct ProcEkrLevelup *proc);
void EkrLvup_SetBgs(struct ProcEkrLevelup *proc);
void EkrLvup_InitPalette(struct ProcEkrLevelup *proc);
void EkrLvup_PutWindowOnScreen(struct ProcEkrLevelup *proc);
void EkrLvup_PrepareApGfx(struct ProcEkrLevelup *proc);
void EkrLvup_Promo_WindowScroll0(struct ProcEkrLevelup *proc);
void EkrLvup_Promo_DrawPromoNewClassName(struct ProcEkrLevelup *proc);
void EkrLvup_Promo_WindowScroll1(struct ProcEkrLevelup *proc);
void EkrLvup_DrawNewLevel(struct ProcEkrLevelup *proc);
void EkrLvup_InitCounterForMainAnim(struct ProcEkrLevelup *proc);
void EkrLvup_MainAnime(struct ProcEkrLevelup *proc);
void EkrLvup_SetHBlank(struct ProcEkrLevelup *proc);
void EkrLvup_DoNothing(struct ProcEkrLevelup *proc);
void EkrLvup_PutWindowOffScreen(struct ProcEkrLevelup *proc);
void EkrLvup_ResetScreen(struct ProcEkrLevelup *proc);
void EkrLvup_OnEnd(struct ProcEkrLevelup *proc);
