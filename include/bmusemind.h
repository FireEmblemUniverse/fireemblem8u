#ifndef GUARD_BM_USE_MIND_H
#define GUARD_BM_USE_MIND_H

#include "proc.h"
#include "bmunit.h"

void ExecStandardHeal(ProcPtr proc);
void ExecRestore(ProcPtr proc);
void ExecBarrierStaff(ProcPtr proc);
void GetRescueStaffeePosition(struct Unit* unit, struct Unit* target, int* xOut, int* yOut);
void ExecRescueStaff(ProcPtr proc);
int PostWarpStaff_ExecTrap(ProcPtr proc);
int PostWarpStaff_RefreshMap();
void ExecWarpStaff(ProcPtr proc);
void ExecStatusStaff(ProcPtr proc);
void ExecFortify(ProcPtr proc);
void ExecNightmare(ProcPtr proc);
void ApplyNightmareEffect();
void ExecUnlockStaff(ProcPtr proc);
void ExecHammerne(ProcPtr proc);
void ExecLatona(ProcPtr proc);
void ExecVulneraryItem(ProcPtr proc, int amount);
void ExecElixirItem(ProcPtr proc);
void ExecPureWaterItem(ProcPtr proc);
void ExecTorchItem(ProcPtr proc);
void ExecAntitoxinItem(ProcPtr proc);
void ExecKeyItem();
void ExecUnitDefaultPromotion(struct Unit* unit, int itemIdx, s8 unk);
void ExecUnitPromotion(struct Unit* unit, u8 classId, int itemIdx, s8 unk);
void ExecPromotionToClass1();
void ExecUnitDefaultPromotionAndHide(struct Unit* unit, int item);
int ApplyStatBoostItem(struct Unit* unit, int itemIdx);
void ExecStatBoostItem(ProcPtr proc);
int ApplyJunaFruitItem(struct Unit* unit, int itemIdx);
void ExecJunaFruitItem(ProcPtr proc);
void ExecMine(ProcPtr proc);
void ExecLightRune(ProcPtr proc);
void ExecLightRuneSummon(ProcPtr proc);
void ExecTorchStaff(ProcPtr proc);
void ExecDanceRing(ProcPtr proc);
void ActionStaffDoorChestUseItem(ProcPtr proc);
void ActionPick(ProcPtr proc);
void AfterItemUse_SetTargetStatus(void);
void ExecNightmareStaffEffect(void);

extern struct UnitDefinition gUnk_39;

#endif // GUARD_BM_USE_MIND_H
