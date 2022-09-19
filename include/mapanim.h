#ifndef GUARD_MAPANIM_H
#define GUARD_MAPANIM_H

extern struct MapAnimState gCurrentMapAnimState;

void sub_807A708(ProcPtr proc);
void DisplayWpnBrokePopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit *);
void DisplayWRankUpPopup(ProcPtr proc);
s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit *);

#endif  // GUARD_MAPANIM_H
