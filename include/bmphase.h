#ifndef GUARD_BMPHASE_H
#define GUARD_BMPHASE_H

int GetPhaseAbleUnitCount(int faction);
int CountUnitsInState(int faction, int state);
s8 AreUnitsAllied(int left, int right);
s8 IsSameAllegiance(int left, int right);
int GetCurrentPhase(void);
int GetNonActiveFaction(void);

#endif
