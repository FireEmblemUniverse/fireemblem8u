#ifndef GUARD_MAPANIM_H
#define GUARD_MAPANIM_H

extern struct MapAnimState gCurrentMapAnimState;

void sub_807A708(u32 a);
void DisplayWpnBrokePopup(u32 a);
s8 BattleUnit_ShouldDisplayWpnBroke(struct BattleUnit *);
void DisplayWRankUpPopup(u32 a);
s8 BattleUnit_ShouldDisplayWRankUp(struct BattleUnit *);

#endif  // GUARD_MAPANIM_H
