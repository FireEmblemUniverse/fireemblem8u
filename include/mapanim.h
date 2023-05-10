#ifndef GUARD_MAPANIM_H
#define GUARD_MAPANIM_H

#include "global.h"
#include "proc.h"
#include "fontgrp.h"

enum {
    MA_FACING_OPPONENT,
    MA_FACING_DEFAULT,
    MA_FACING_UNK,
    MA_FACING_STANDING,
};

#define SCREEN_TILE_X(xPos) ((xPos) - (gBmSt.camera.x >> 4))
#define SCREEN_TILE_Y(yPos) ((yPos) - (gBmSt.camera.y >> 4))

struct MAExpBarProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8    pad29[0x64 - 0x29];
    /* 64 */ short expFrom;
    /* 66 */ short expTo;
    /* 68 */ short actorId;
    /* 6A */ short timer;
};

enum summonDK_proc_lables {
    PROC_LABEL_SUMDK_LOAD_START,
    PROC_LABEL_SUMDK_LOAD_TERMINAL,
    PROC_LABEL_SUMDK_LOAD_POS_DOWN,
    PROC_LABEL_SUMDK_LOAD_POS_RIGHT,
    PROC_LABEL_SUMDK_LOAD_POS_LEFT,
    PROC_LABEL_SUMDK_LOAD_POS_UP,
    PROC_LABEL_SUMDK_LOAD_POS_END,
};

struct SumProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad29[0x3C - 0x29];

    /* 3C */ int x;
    /* 40 */ int y;

    /* 44 */ u8 pad44[0x64 - 0x44];

    /* 64 */ short counter;
    /* 66 */ short monsters;
};

struct SumThing {
    s8 x, y;
    s8 boolAvailable;
    u32 unk04, unk08;
};

struct MAInfoFrameProc {
    PROC_HEADER;

    /* 2A */ short unk2A;
    /* 2C */ u16 unk2C;
    /* 2E */ u8 x;
    /* 2F */ u8 y;
    /* 30 */ struct Proc* maMain;
};

struct MADebugProc {
    PROC_HEADER;

    /* 29 */ u8 pad29[0x64 - 0x29];
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};

struct MADebugInfoEntry {
    /* 00 */ short data[10];
    /* 14 */ struct TextHandle text[10];
};

struct MADebugInfo {
    /* 00 */ u8 pad00[8];
    /* 08 */ struct MADebugInfoEntry infos[2];
};

struct Unk089A3798 {
    /* 00 */ u8 a; s8 b, c, d, e; u8 f, g;
};

struct MAEffectProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit* unit;
    /* 30 */ int xDisplay;
    /* 34 */ int yDisplay;
    /* 38 */ u8 pad38[0x40 - 0x38];
    /* 40 */ u16 unk40;
    /* 42 */ u16 unk42;
    /* 44 */ u16 unk44;
    /* 44 */ u8 pad46[0x48 - 0x46];
    /* 48 */ short unk48;
    /* 4A */ short unk4A;
    /* 4C */ short unk4C;
    /* 4E */ /* pad */
    /* 50 */ const void* img;
    /* 54 */ const void* pal;
    /* 58 */ u16 unk58;
    /* 5A */ u8 pad5A[0x64 - 0x5A];
    /* 64 */ short unk64;
};

struct MAAnotherProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    /* 30 */ int unk30;
    /* 34 */ u8 pad34[0x44 - 0x34];
    /* 44 */ short unk44;
    /* 46 */ u8 pad46[0x54 - 0x46];
    /* 54 */ int unk54;
    /* 58 */ int unk58;
    /* 5C */ u8 pad5C[0x64 - 0x5C];
    /* 64 */ short unk64;
};

struct MALevelUpProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ short pad2A;
    /* 2C */ short pad2C;
    /* 2E */ short actor;
    /* 30 */ u8 unk30;
    /* 31 */ u8 unk31;
    /* 32 */ short unk32;
};

struct MAFrameShakeProc {
    PROC_HEADER;

    /* 29 */ u8 pad29[0x64 - 0x29];
    /* 64 */ short unk64;
};

struct MAStarProc {
    PROC_HEADER;

    /* 2A */ short xCenter;
    /* 2C */ short yCenter;
    /* 2E */ short unk2E;
    /* 30 */ short unk30;

    /* 29 */ u8    pad32[0x36 - 0x32];

    /* 36 */ u16 unk36;
    /* 38 */ u16 unk38;
    /* 3A */ u16 unk3A;
    /* 3C */ u16 unk3C;
    /* 3E */ u16 unk3E;
    /* 40 */ u16 unk40;
};

struct Unk03005090 {
    /* 00 */ u16 unk00;
    /* 02 */ u16 unk02;
    /* 04 */ int pad04;
};

struct MapAnimActorState {
    /* 00 */ struct Unit* unit;
    /* 04 */ struct BattleUnit* bu;
    /* 08 */ struct MUProc* mu;
    /* 0C */ u8 hp_max;
    /* 0D */ u8 hp_cur;
    /* 0E */ u16 hp_displayed_q4;
    /* 10 */ u8 hp_info_x;
    /* 11 */ u8 hp_info_y;
    /* 12 */ STRUCT_PAD(0x12, 0x14);
};

struct MapAnimState {
    /* 00 */ struct MapAnimActorState actor[4];

    /* 50 */ struct BattleHit* pCurrentRound;
    /* 54 */ const struct ProcCmd* specialProcScr;
    /* 58 */ u8 subjectActorId;
    /* 59 */ u8 targetActorId;
    /* 5A */ u16 hitAttributes;
    /* 5C */ u8 hitInfo;
    /* 5D */ u8 hitDamage;
    /* 5E */ u8 actorCount_maybe;
    /* 5F */ u8 u5F;
    /* 60 */ u8 u60;
    /* 61 */ u8 u61;
    /* 62 */ u8 u62;
};

extern struct MapAnimState gManimSt;

struct ManimLevelUpStatGainLabelProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ u16 chr;
    /* 2C */ u16 pal;
    /* 2E */ u16 sprite_layer;
};

struct ManimLevelUpProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2E);
    /* 2E */ s16 actor_id;
    /* 30 */ u8 next_stat_num;
    /* 31 */ u8 clock;
    /* 32 */ s16 y_scroll_offset;
};

struct ManimLevelUpLabelColorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x54);
    /* 54 */ s32 clock;
    /* 58 */ STRUCT_PAD(0x58, 0x64);
    /* 64 */ s16 pal;
};

struct ManimLevelUpLabelInfo {
    /* 00 */ u8 x;
    /* 01 */ u8 y;
    /* 02 */ STRUCT_PAD(0x02, 0x04);
    /* 04 */ int *msg[2];
};

extern struct ManimLevelUpLabelInfo CONST_DATA gManimLevelUpLabelInfoList[];

extern CONST_DATA struct MADebugInfo* pMADebugInfoData;
extern CONST_DATA struct Unk089A3798 gUnknown_089A3798[];

void MapAnimProc_DisplayItemStealingPopup(ProcPtr proc);
void DisplayWpnBrokePopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit *);
void DisplayWRankUpPopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit *);

void PutManimLevelUpFrame(int actor_id, int x, int y);
void PutManimLevelUpStat(int actor_id, int x, int y, int stat_num, bool after_gain);
int GetManimLevelUpStatGain(int actor_id, int stat_num);
int GetManimLevelUpBaseStat(int actor_id, int stat_num);
// ??? ManimLevelUpStatGainLabel_Finish(???);
void StartManimLevelUpStatGainLabels(int chr, int pal, int sprite_layer, ProcPtr parent);
void EndManimLevelUpStatGainLabels(void);
void StartManimLevelUpStatGainLabelAnim(int x, int y, int stat_num, int stat_gain);
void StartPrepItemBoostStatGainLabelAnim(int x, int y, int stat_gain);
void StartManimLevelUp(int actor, ProcPtr parent);
void InitManimLevelUpWindow(void);
void ClearManimLevelUpWindow(void);
void ManimLevelUp_InitMainScreen(struct ManimLevelUpProc *proc);
void ManimLevelUpLabelColor_Init(struct ManimLevelUpLabelColorProc *proc);
void ManimLevelUpLabelColor_Loop(struct ManimLevelUpLabelColorProc *proc);
void ManimLevelUp_ScrollIn(struct ManimLevelUpProc *proc);
void ManimLevelUp_ScrollOut(struct ManimLevelUpProc *proc);
void ManimLevelUp_PutStatGainLabels(struct ManimLevelUpProc * proc);
void ManimLevelUp_DimBgm(struct ManimLevelUpProc * proc);
void ManimLevelUp_StartLevelUpText(struct ManimLevelUpProc * proc);
void ManimLevelUp_EndLevelUpText(struct ManimLevelUpProc * proc);
void ManimLevelUp_RestoreBgm(struct ManimLevelUpProc * proc);
void ManimLevelUp_Clear(struct ManimLevelUpProc * proc);

#endif  // GUARD_MAPANIM_H
