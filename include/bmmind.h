#ifndef GUARD_BM_MIND_H
#define GUARD_BM_MIND_H

#include "global.h"
#include "bmunit.h"
#include "proc.h"
#include "bmbattle.h"

struct ActionData
{
    // unknown stuff (sometimes RNs are pushed here) (maybe an union?)
    /* 00 */ u16 _u00[3];
    /* 06 */ u16 item;

    /* 08 */ u16 unk08;
    /* 0A */ u16 unk0A;

    /* 0C */ u8 subjectIndex;
    /* 0D */ u8 targetIndex;

    /* 0E */ u8 xMove;
    /* 0F */ u8 yMove;

    /* 10 */ u8 moveCount;

    /* 11 */ u8 unitActionType;

    // maybe from this onwards it's an union?

    /* 12 */ u8 itemSlotIndex;

    /* 13 */ u8 xOther;
    /* 14 */ u8 yOther;

    /* 15 */ u8 trapType;

    /* 16 */ u8 suspendPointType;

    /* 18 */ struct BattleHit * scriptedBattleHits;

    /* 1C */ struct BattleHit script_hits[7]; /* equals to sizeof event-queue */

    /* 38 */
};

extern struct ActionData gActionData;

struct AfterDropActionProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29[0x54-0x29];

    /* 54 */ struct Unit * unit;
};

struct CombatActionProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29[0x54-0x29];

    /* 54 */ struct MuProc* unk_54;
    /* 58 */ u8 unk_58[0x64-0x58];

    /* 64 */ s16 unitIdA;
    /* 66 */ s16 unitIdB;
};

struct DeathDropAnimProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;
    /* 30 */ int xDrop, yDrop;
    /* 38 */ short xFrom, yFrom;
    /* 3C */ short xTo, yTo;
    /* 40 */ short yOffset;
    /* 42 */ short ySpeed;
    /* 44 */ short yAccel;
    /* 46 */ short clock;
    /* 48 */ short clockEnd;
};

void StoreRNStateToActionStruct(void);
void LoadRNStateFromActionStruct(void);
unsigned int ApplyUnitAction(ProcPtr proc);
s8 ActionRescue(ProcPtr);
int AfterDrop_CheckTrapAfterDropMaybe(struct AfterDropActionProc * proc);
int sub_80321C8(void);
s8 ActionDrop(ProcPtr);
s8 ActionVisitAndSeize(ProcPtr);
s8 ActionCombat(ProcPtr);
s8 ActionArena(ProcPtr);
s8 ActionDance(ProcPtr);
s8 ActionTalk(ProcPtr);
s8 ActionSupport(ProcPtr);
s8 ActionSteal(ProcPtr);
s8 ActionSummon(ProcPtr);
s8 ActionSummonDK(ProcPtr);
void DeathDropSpriteAnim_Loop(struct DeathDropAnimProc * proc);
void DeathDropSpriteAnim_ExecAnyTrap(struct DeathDropAnimProc * proc);
void DeathDropSpriteAnim_End(void);
void DropRescueOnDeath(ProcPtr proc, struct Unit * unit);
void KillUnitOnCombatDeath(struct Unit * unitA, struct Unit * unitB);
void KillUnitOnArenaDeathMaybe(struct Unit * unit);
void BATTLE_GOTO1_IfNobodyIsDead(ProcPtr proc);
bool DidUnitDie(struct Unit * unit);
void BATTLE_PostCombatDeathFades(struct CombatActionProc * proc);
void BATTLE_DeleteLinkedMOVEUNIT(struct CombatActionProc * proc);
void BATTLE_HandleCombatDeaths(struct CombatActionProc * proc);
void sub_80328B0(void);
bool BATTLE_HandleItemDrop(struct CombatActionProc * proc);
void sub_8032974(ProcPtr proc);
void BATTLE_HandleArenaDeathsMaybe(ProcPtr proc);
struct BattleHit * sub_80329C0(struct BattleHit * r0);

extern struct ProcCmd CONST_DATA sProcScr_CombatAction[];
extern struct ProcCmd CONST_DATA sProcScr_AfterDropAction[];

#endif // GUARD_BM_MIND_H
