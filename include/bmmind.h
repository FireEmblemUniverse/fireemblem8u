#ifndef GUARD_BM_MIND_H
#define GUARD_BM_MIND_H

void StoreRNStateToActionStruct(void);
void LoadRNStateFromActionStruct(void);
unsigned int ApplyUnitAction(ProcPtr proc);
// ??? ActionRescue(???);
// ??? AfterDrop_CheckTrapAfterDropMaybe(???);
// ??? sub_80321C8(???);
// ??? ActionDrop(???);
// ??? ActionVisitAndSeize(???);
// ??? ActionCombat(???);
// ??? ActionArena(???);
// ??? ActionDance(???);
// ??? ActionTalk(???);
// ??? ActionSupport(???);
// ??? ActionSteal(???);
// ??? ActionSummon(???);
// ??? ActionSummonDK(???);
// ??? sub_80325AC(???);
// ??? sub_8032658(???);
// ??? sub_8032664(???);
void DropRescueOnDeath(ProcPtr proc, struct Unit* unit);
// ??? KillUnitOnCombatDeath(???);
// ??? KillUnitOnArenaDeathMaybe(???);
// ??? BATTLE_GOTO1_IfNobodyIsDead(???);
// ??? DidUnitDie(???);
// ??? BATTLE_PostCombatDeathFades(???);
// ??? BATTLE_DeleteLinkedMOVEUNIT(???);
// ??? BATTLE_HandleCombatDeaths(???);
// ??? sub_80328B0(???);
// ??? BATTLE_HandleItemDrop(???);
// ??? sub_8032974(???);
// ??? BATTLE_HandleArenaDeathsMaybe(???);
// ??? sub_80329C0(???);

#endif // GUARD_BM_MIND_H