//
// Created by laqieer on 2020/3/3.
//

#ifndef GUARD_BMDEBUG_H
#define GUARD_BMDEBUG_H

#include "functions.h"
#include "variables.h"
#include "gba/io_reg.h"
#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "bmio.h"

struct DebugPrintProc
{
    PROC_HEADER
    int x; // unit: tile
    int y; // unit: tile
    int unk_34;
    int unk_38;
    int unk_3C;
    int unk_40;
    int unk_44;
    int unk_48;
    int unk_4C;
    short unk_50;
    unsigned short width; // unit: tile
    const char * text; // string
    int unk_58;
    int unk_5C;
    int unk_60;
    s16 unk_64;
    s16 unk_66;
    int unk_68;
};

int DebugMenuInit(void);
u8 EndMenuAndClear(struct MenuProc*, struct MenuItemProc*);
void DebugMenuMapIdleCore(struct MenuItemProc *menuItemProc, int, int);
u8 DebugClearMenu_ClearFile(struct MenuProc*, struct MenuItemProc*);
int DebugChargeMenu_Draw(struct MenuProc*, struct MenuItemProc*);
u8 DebugChargeMenu_Idle(struct MenuProc*, struct MenuItemProc*);
u8 DebugContinueMenu_ReleaseEntry(struct MenuProc*, struct MenuItemProc*);
u8 DebugContinueMenu_IsContinueChapterAvailable(const struct MenuItemDef*, int number);
u8 DebugContinueMenu_ContinueChapter(struct MenuProc*, struct MenuItemProc*);
u8 DebugContinueMenu_IsManualContinueAvailable(const struct MenuItemDef*, int number);
u8 DebugContinueMenu_ManualContinue(struct MenuProc*, struct MenuItemProc*);
u8 DebugContinueMenu_InitializeFile(struct MenuProc*, struct MenuItemProc*);
u8 DebugChuudanMenu_IsManualSaveAvailable(const struct MenuItemDef*, int number);
u8 DebugChuudanMenu_ManualSave(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_MapEffect(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_MapIdle(struct MenuProc*, struct MenuItemProc*);
int DebugMapMenu_DisplayInfoDraw(struct MenuProc*, struct MenuItemProc*);
u8 DebugMapMenu_DisplayInfoEffect(struct MenuProc*, struct MenuItemProc*);
u8 DebugMapMenu_DisplayInfoIdle(struct MenuProc*, struct MenuItemProc*);
int DebugMenu_WeatherDraw(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_WeatherEffect(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_WeatherIdle(struct MenuProc*, struct MenuItemProc*);
int DebugMenu_FogDraw(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_FogEffect(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_FogIdle(struct MenuProc*, struct MenuItemProc*);
int DebugMenu_ClearDraw(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_ClearEffect(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_ClearIdle(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_ErasedEffect(struct MenuProc*, struct MenuItemProc*);
u8 DebugMenu_GNightEffect(struct MenuProc*, struct MenuItemProc*);
int DebugContinueMenuInit(struct MenuProc*);
int DebugContinueMenuEnd(struct MenuProc*);
u8 Debug_GetChapterId(int menuItemNumber);
void nullsub_9();

extern const struct MenuDef gDebugClearMenuDef;
extern const struct MenuDef gDebugChargeMenuDef;
extern const struct MenuDef gDebugContinueMenuDef;
extern const struct MenuDef gDebugChuudanMenuDef;
extern const struct MenuDef gDebugMenuDef;

extern u8 gDebugChapterModeIndex;

extern struct ProcCmd CONST_DATA ProcScr_DebugMonitor[];
extern struct ProcCmd CONST_DATA gProc_DebugPrintWithProc[];

#endif //GUARD_BMDEBUG_H
