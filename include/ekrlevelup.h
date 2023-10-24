#pragma once

#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "anime.h"
#include "efxbattle.h"

#define EKR_LVUP_UI_BASE 0x50

struct ProcEkrLevelup {
    PROC_HEADER;

    /* 29 */ bool8 finished;
    /* 2A */ bool8 is_promotion;
    /* 2C */ s16 timer;
    /* 2E */ s16 index;
    /* 30 */ u8 _pad_30[0x44 - 0x30];
    /* 44 */ int unk_44;
    /* 48 */ int unk_48;
    /* 4C */ int unk_4C;
    /* 50 */ int unk_50;
    /* 54 */ u8 _pad_54[0x5C - 0x54];
    /* 5C */ struct Anim * ais_main;
    /* 60 */ struct Anim * ais_core;
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

struct Struct20200E0_14 {
    /* 00 */ u8 _pad_00[0x4C - 0x0];
    /* 4C */ int unk4C;
};

struct Struct20200E0 {
    /* 00 */ u16 unk00;
    /* 02 */ u16 unk02;
    /* 04 */ u16 unk04;
    /* 06 */ u16 unk06;
    /* 08 */ u16 unk08;
    /* 0A */ u16 unk0A;
    /* 0C */ u16 unk0C;
    /* 0E */ u16 unk0E;
    /* 10 */ u16 unk10;
    /* 14 */ void * unk14;
    /* 18 */ void * unk18;
    /* 1C */ void * unk1C;
    /* 20 */ void * unk20;
    /* 24 */ void * unk24;
};
extern struct Struct20200E0 gUnknown_020200E0;

struct ProcEkrLvupApfx {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 pal;
    /* 2E */ s16 clock;
};

struct ProcEobjLvup {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 chr1;
    /* 30 */ s16 chr2;
    /* 32 */ s16 x;

    STRUCT_PAD(0x34, 0x3A);

    /* 3A */ s16 y;

    STRUCT_PAD(0x3C, 0x44);

    /* 44 */ int chr;
    /* 48 */ int pal;
    /* 4C */ int index;
    /* 50 */ int diff;

    STRUCT_PAD(0x54, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ struct ProcEkrSubAnimeEmulator * child1, * child2;
};

extern CONST_DATA unsigned * EkrLvupMsgsStr[];
extern CONST_DATA unsigned * EkrLvupMsgsMag[];
extern const u16 sEfxLvupPartsPos[];

extern struct Text gTextEkrlvupMsg[EKRLVUP_STAT_MAX];
extern struct Text gTextEkrlvupValue[EKRLVUP_STAT_MAX + 2];
extern struct ProcEkrLevelup * gpProcEkrLevelup;
extern u32 gUnknown_020200B8[8];
extern ProcPtr gpProcEfxPartsofScroll;
extern ProcPtr gpProcEfxleveluphb;
// extern ??? gUnknown_020200E0
extern struct Unit * gpEkrLvupUnit;
extern struct BattleUnit * gpEkrLvupBattleUnit;
extern u16 gEkrLvupPreLevel;
extern u16 gEkrLvupPostLevel;
extern u16 gEkrLvupBaseStatus[EKRLVUP_STAT_MAX];
extern u16 gEkrLvupPostStatus[EKRLVUP_STAT_MAX];
extern u16 gEkrLvupScrollPos1;
extern u16 gEkrLvupScrollPos2;
extern int gEkrLvupApfxUnexist;

bool CheckEkrLvupDone(void);
void EndEkrLevelUp(void);
void EkrLvup_InitStatusText(struct ProcEkrLevelup * proc);
void EkrLvup_DrawUpdatedStatus(struct ProcEkrLevelup * proc, int index);
void EkrLvup_DrawUnitName(struct ProcEkrLevelup * proc);
void EkrLvup_DrawPreLevelValue(struct ProcEkrLevelup * proc);
void NewEkrLevelup(struct Anim * ais);
void EkrLvup_OnPrepare(struct ProcEkrLevelup * proc);
void EkrLvup_InitScreen(struct ProcEkrLevelup * proc);
void EkrLvup_InitLevelUpBox(struct ProcEkrLevelup * proc);
void EkrLvup_SetBgs(struct ProcEkrLevelup * proc);
void EkrLvup_InitPalette(struct ProcEkrLevelup * proc);
void EkrLvup_PutWindowOnScreen(struct ProcEkrLevelup * proc);
void EkrLvup_PrepareApGfx(struct ProcEkrLevelup * proc);
void EkrLvup_Promo_WindowScroll0(struct ProcEkrLevelup * proc);
void EkrLvup_Promo_DrawPromoNewClassName(struct ProcEkrLevelup * proc);
void EkrLvup_Promo_WindowScroll1(struct ProcEkrLevelup * proc);
void EkrLvup_DrawNewLevel(struct ProcEkrLevelup * proc);
void EkrLvup_InitCounterForMainAnim(struct ProcEkrLevelup * proc);
void EkrLvup_MainAnime(struct ProcEkrLevelup * proc);
void EkrLvup_SetHBlank(struct ProcEkrLevelup * proc);
void EkrLvup_DoNothing(struct ProcEkrLevelup * proc);
void EkrLvup_PutWindowOffScreen(struct ProcEkrLevelup * proc);
void EkrLvup_ResetScreen(struct ProcEkrLevelup * proc);
void EkrLvup_OnEnd(struct ProcEkrLevelup * proc);

ProcPtr NewEfxPartsofScroll(void);
void EfxUpdatePartsofScroll(void);
void EfxPartsofScrollCallBack(ProcPtr proc);
void EfxPartsofScrollMain(ProcPtr proc);
ProcPtr NewEfxPartsofScroll2(void);
void EfxPartsofScroll2CallBack(ProcPtr proc);
void EfxPartsofScroll2Main(ProcPtr proc);
ProcPtr NewEfxleveluphb(void);
void EfxleveluphbCallBack(ProcPtr proc);
void EfxleveluphbNop(ProcPtr proc);
void EfxleveluphbMain(ProcPtr proc);
void EkrLvupHBlank(void);
void EfxPartsofScroll2HBlank(void);
void NewEfxlvupbg(struct Anim * anim);
void EfxlvupbgMain(struct ProcEfxBG * proc);
void NewEfxLvupBG2(struct Anim * anim);
void EfxLvupBg2Main(struct ProcEfxBG * proc);
void NewEfxLvupOBJ2(struct Anim * anim, int x, int y);
void EfxLvupOBJ2CallBack(struct ProcEfxOBJ * proc);
void NewEfxLvupBGCOL(struct Anim * anim);
void Loop6C1_EfxLvupBGCOL(struct ProcEfxBGCOL * proc);
void Loop6C2_EfxLvupBGCOL(struct ProcEfxBGCOL * proc);
void EkrLvupApfxInit(struct ProcEkrLvupApfx * proc);
void EkrLvupApfxMain(struct ProcEkrLvupApfx * proc);
void NewEkrLvupApfx(int chr, int pal);
void EkrLvupApfxEndEach(void);
void PutEkrLvupStatGainLabelGfx1(int stat_num, int stat_gain);
void PutEkrLvupStatGainLabelGfx2(int chr, int stat_gain);
void BanimDrawStatupAp(int chr, int pal, int x, int y, int index, int gain);
void sub_8074E6C(struct ProcEobjLvup * proc);
void sub_8074EDC(struct ProcEobjLvup * proc);
void sub_8074F14(struct ProcEobjLvup * proc);
