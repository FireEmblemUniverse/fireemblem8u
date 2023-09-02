#ifndef GUARD_BMARCH_H
#define GUARD_BMARCH_H

struct Trap* GetRiddenBallistaAt(int xPos, int yPos);
int GetBallistaItemAt(int xPos, int yPos);
int GetSomeBallistaItemAt(int xPos, int yPos);
struct Trap* AddBallista(int xPos, int yPos, int ballistaType);
void RideBallista(struct Unit* unit);
void TryRemoveUnitFromBallista(struct Unit* unit);
s8 IsBallista(struct Trap* trap);
int sub_8037AC0(struct Trap* trap);
int sub_8037AEC(struct Trap* trap);
int GetBallistaItemUses(struct Trap* trap);
// ??? ClearBallistaOccupied(???);
// ??? SetBallistaOccupied(???);

#endif // GUARD_BMARCH_H
