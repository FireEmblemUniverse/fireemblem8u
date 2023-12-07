#ifndef GUARD_BKSEL_H
#define GUARD_BKSEL_H

#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "uiselecttarget.h"

struct BattleForecastProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ s8 x;
    /* 31 */ s8 y;
    /* 32 */ u8 frameKind;
    /* 33 */ s8 ready;
    /* 34 */ s8 needContentUpdate;
    /* 35 */ s8 side; // -1 is left, +1 is right
    /* 36 */ s8 slide_offset;
    /* 38 */ struct Text unitNameTextA;
    /* 40 */ struct Text unitNameTextB;
    /* 48 */ struct Text itemNameText;
    /* 50 */ s8 hitCountA;
    /* 51 */ s8 hitCountB;
    /* 52 */ s8 isEffectiveA;
    /* 53 */ s8 isEffectiveB;
};

int GetBattleForecastPanelSide(void);
void InitBattleForecastIconPaletteBuffer(void);
void InitBattleForecastLabels(void);
void PutBattleForecastUnitName(u16 * dest, struct Text * text, struct Unit * unit);
void PutBattleForecastItemName(u16* dest, struct Text * text, int itemIdx);
void BattleForecastHitCountUpdate(struct BattleUnit * battleUnit, u8 * hitsCounter, int * usesCounter);
void InitBattleForecastBattleStats(struct BattleForecastProc * proc);
void DrawBattleForecastContentsStandard(struct BattleForecastProc * proc);
void DrawBattleForecastContentsExtended(struct BattleForecastProc * proc);
void DrawBattleForecastContents(struct BattleForecastProc * proc);
const u16 * GetFactionBattleForecastFramePalette(int faction);
void InitBattleForecastFramePalettes(void);
void BattleForecast_Init(struct BattleForecastProc * proc);
void BattleForecast_OnEnd(void);
void PutBattleForecastTilemaps(struct BattleForecastProc * proc);
void PutBattleForecastWeaponTriangleArrows(struct BattleForecastProc * proc);
void PutBattleForecastMultipliers(struct BattleForecastProc * proc);
void UpdateBattleForecastEffectivenessPalettes(struct BattleForecastProc * proc);
void BattleForecast_LoopDisplay(struct BattleForecastProc * proc);
void BattleForecast_OnNewBattle(struct BattleForecastProc * proc);
void BattleForecast_LoopSlideIn(struct BattleForecastProc * proc);
void BattleForecast_LoopSlideOut(struct BattleForecastProc * proc);
bool MapEventEngineExists_(void);
void TriggerBattleForcastToturialEvent(void);
void NewBattleForecast(void);
void UpdateBattleForecastContents(void);
void CloseBattleForecast(void);
u8 StartBattleForecastHelpBox(ProcPtr parent, struct SelectTarget * target);
u16 GetBkselHelpBoxMsg(int wt, s8 isEffective);
void HbPopulate_BkselWTriEffA(struct HelpBoxProc * proc);
void HbPopulate_BkselWTriEffB(struct HelpBoxProc * proc);

extern struct ProcCmd gProcScr_BKSEL[];

extern struct Text gaBattleForecastTextStructs[6];
extern u16 gBkselPals[8][16];

extern u16 gTSA_BattleForecastStandard[];
extern u16 gTSA_BattleForecastExtended[];

extern u16 gBattleForecast_x2x4Gfx[];
extern u16 gBattleForecast_x2x4Pal[];

#endif  // GUARD_BKSEL_H
