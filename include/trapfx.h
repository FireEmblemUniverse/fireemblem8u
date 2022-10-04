#ifndef GUARD_TRAPFX_H
#define GUARD_TRAPFX_H

#include "proc.h"

void StartGasTrapAnim(ProcPtr, int x, int y, int direction);
void StartFireTrapAnim(ProcPtr, int x, int y);
void StartFireTrapAnim2(ProcPtr, int x, int y);
void StartUnkTrapAnim(ProcPtr, int x, int y, int direction, int time);
void StartArrowTrapAnim(ProcPtr, int x);
void StartShowMapChangeAnim(ProcPtr, int x, int y);
void StartPikeTrapAnim(ProcPtr, int x, int y, int direction);

#endif /* GUARD_TRAPFX_H */
