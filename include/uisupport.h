#pragma once

#include "global.h"
#include "bmunit.h"
#include "proc.h"

struct SupportScreenUnit {
    /* 00 */ u8 charId;
    /* 01 */ u8 classId;
    /* 02 */ u8 supportLevel[UNIT_SUPPORT_MAX_COUNT];
    /* 09 */ u8 partnerClassId[UNIT_SUPPORT_MAX_COUNT];
    /* 10 */ s8 partnerIsAlive[UNIT_SUPPORT_MAX_COUNT];
};

struct SupportScreenProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int curIndex;
    /* 3C */ int unk_3c;
    /* 40 */ s8 unk_40; // possibly direction (up or down)
    /* 41 */ u8 unk_41; // possibly number of positions to move up or down
    /* 42 */ s8 fromPrepScreen; // true if from prep screen; false if from title screen
    /* 43 */ s8 helpTextActive;
};

struct SubScreenProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unitIdx;
    /* 30 */ int x;
    /* 34 */ int y;
    /* 38 */ s8 fromPrepScreen;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3a;
    /* 3B */ u8 unk_3b;
    /* 3C */ u8 partnerCount;
    /* 3D */ u8 remainingSupports;
    /* 3E */ u8 songId;
    /* 3F */ u8 partnerState[UNIT_SUPPORT_MAX_COUNT];
    /* 46 */ u8 supportLevel[UNIT_SUPPORT_MAX_COUNT];
    /* 4D */ u8 partnerClassId[UNIT_SUPPORT_MAX_COUNT];
};

int GetSupportScreenUnitCount(void);
int GetNextSupportScreenUnit(int num);
int GetPreviousSupportScreenUnit(int num);
int GetSupportScreenPartnerSupportLevel(int idx, int partner);
int GetSupportScreenPartnerClassId(int idx, int partner);
s8 GetSupportScreenPartnerIsAlive(int idx, int partner);
int GetSupportScreenPartnerCharId(int idx, int partner);
int GetSupportScreenCharIdAt(int idx);
int GetSupportScreenClassIdAt(int idx);
int GetSupportClassForCharId(int charId);
s8 sub_80A0BBC(int charId);
void sub_80A0BF4(void);
void SupportScreen_SetupUnits(struct SupportScreenProc* proc);
void sub_80A0EC0(struct SupportScreenProc* proc);
int GetTotalSupportLevel(int idx);
int sub_80A0F6C(s8 flag, int idx);
void DrawSupportScreenText(void);
void SupportScreen_OnInit(struct SupportScreenProc* proc);
void DrawSupportBannerSprites_Init(struct Proc* proc);
void DrawSupportBannerSprites_Loop(struct Proc* proc);
void StartDrawSupportBannerSprites(int x, int y, int palIdx, ProcPtr parent);
void EndDrawSupportBannerSprites(void);
void DrawSupportScreenUnitSprites(struct SupportScreenProc* proc);
void sub_80A11E0(struct SupportScreenProc* proc);
void SupportScreen_SetupGraphics(struct SupportScreenProc* proc);
void SupportScreen_OnEnd(ProcPtr proc);
void SupportScreen_UpdateBlend(void);
void SupportScreen_Loop_KeyHandler(struct SupportScreenProc* proc);
void SupportScreen_StartUnitSubMenu(struct SupportScreenProc* proc);
void SupportScreen_RestartSourceScreenMusic(struct SupportScreenProc* proc);
void StartSupportScreenFromPrepScreen(ProcPtr parent);
void StartSupportScreen(ProcPtr);
void sub_80A199C(struct SupportScreenProc* proc, int param_2);
void sub_80A1A90(int idx);
int UiSupport_GetSupportTalkSong(int idx, int partner, int rank);
void sub_80A1AE4(void);
int GetSupportScreenPartnerCount(int charId);
void DrawSupportSubScreenSprites(struct SubScreenProc* proc);
void DrawSupportSubScreenUnitPartnerText(struct SubScreenProc* proc, int idx);
void DrawSupportSubScreenRemainingText(struct SubScreenProc* proc);
void InitSupportSubScreenPartners(struct SubScreenProc* proc);
void InitSupportSubScreenPartnerLevels(struct SubScreenProc* proc);
void InitSupportSubScreenRemainingSupports(struct SubScreenProc* proc);
void DrawSupportSubScreenUnitPartnerDetails(struct SubScreenProc* proc);
void SupportSubScreen_MoveCursorToNextValidUnit(struct SubScreenProc* proc, int partnerIdx, int step);
void SupportSubScreen_Init(struct SubScreenProc* proc);
void sub_80A221C(void);
void SupportSubScreen_SetupGraphics(struct SubScreenProc* proc);
void SupportSubScreen_Loop_KeyHandler(struct SubScreenProc* proc);
void sub_80A25F8(struct SubScreenProc* proc);
void SupportSubScreen_StartSwapPage(struct SubScreenProc* proc);
void sub_80A2730(u32 xBase);
void SupportSubScreen_SwapPageOut_ToLeft(struct SubScreenProc* proc);
void SupportSubScreen_SwapPageIn_FromRight(struct SubScreenProc* proc);
void SupportSubScreen_SwapPageOut_ToRight(struct SubScreenProc* proc);
void SupportSubScreen_SwapPageIn_FromLeft(struct SubScreenProc* proc);
void SupportSubScreen_ReinitAfterSwapPage(struct SubScreenProc* proc);
void SupportSubScreen_EndSwapPage(struct SubScreenProc* proc);
void SupportSubScreen_OnEnd(struct SubScreenProc* proc);
void SupportSubScreen_PrepareSupportConvo(struct SubScreenProc* proc);
void sub_80A2BD0(struct SubScreenProc* proc);
u8 *sub_80A2C2C(void);
void sub_80A2C38(void);
