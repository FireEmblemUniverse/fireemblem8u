#pragma once

#define FlashCursor(pid, time) \
    CUMO_CHAR(pid) \
    STAL(time) \
    CURE

#define StartBattle                           SVAL(EVT_SLOT_D, 0)
#define NormalDamage(combatantNumber,damage)  SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100) SAVETOQUEUE
#define CriticalHit(combatantNumber,damage)   SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00010000) SAVETOQUEUE
#define MissedAttack(combatantNumber,damage)  SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00020000) SAVETOQUEUE
#define Silencer(combatantNumber,damage)      SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00080000) SAVETOQUEUE
#define SureShot(combatantNumber,damage)      SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00400000) SAVETOQUEUE
#define Poison(combatantNumber,damage)        SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00400000) SAVETOQUEUE
#define DevilReversal(combatantNumber,damage) SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00800000) SAVETOQUEUE
#define Pierce(combatantNumber,damage)        SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0xC0000000) SAVETOQUEUE
#define EndAttack                             SVAL(EVT_SLOT_1, 0xFFFFFFFF) SAVETOQUEUE

/* Mokha's macro */
#define ATTACKER 1
#define DEFENDER 0
