#ifndef GUARD_BMARCH_H
#define GUARD_BMARCH_H

struct Trap* GetRiddenBallistaAt(int xPos, int yPos);
int GetBallistaItemAt(int xPos, int yPos);
int GetSomeBallistaItemAt(int xPos, int yPos);
struct Trap* AddBallista(int xPos, int yPos, int ballistaType);
void RideBallista(struct Unit* unit);
void TryRemoveUnitFromBallista(struct Unit* unit);
// ??? IsBallista(???);
// ??? sub_8037AC0(???);
// ??? sub_8037AEC(???);
// ??? GetBallistaItemUses(???);
// ??? ClearBallistaOccupied(???);
// ??? SetBallistaOccupied(???);

#endif // GUARD_BMARCH_H
