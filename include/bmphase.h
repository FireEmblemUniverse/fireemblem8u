#ifndef GUARD_BMPHASE_H
#define GUARD_BMPHASE_H

int GetPhaseAbleUnitCount(int faction);
int CountUnitsInState(int faction, int state);
int AreUnitsAllied(int left, int right);
int IsSameAllegiance(int left, int right);
int GetCurrentPhase(void);
int GetNonActiveFaction(void);

#endif
