#include "global.h"
#include "proc.h"
#include "opanim.h"

/* forward declarations not present in headers */
void OpAnimPreparefxEirika(struct Proc * proc);
void OpAnimEirikafxFlyIn(struct Proc * proc);
void OpAnimEirikaSetupSplitWindow(struct Proc * proc);
void OpAnimEirikaAdvanceSplitLine(struct Proc * proc);
void OpAnimEirikaMergeShadow(struct Proc * proc);
void OpAnimEirikaDisplayName(struct Proc * proc);
void OpAnimEirikaExit(struct Proc * proc);
void OpAnimFadeToBlack(struct Proc * proc);
void OpAnimApplyScrollAndPalettes(struct Proc * proc);
void OpAnimJoshuaScrollIn(struct Proc * proc);
void OpAnimScrollInLArachel(struct Proc * proc);
void OpAnimScrollInSeth(struct Proc * proc);
void OpAnimScrollInMyrrh(struct Proc * proc);
void OpAnimScrollInSaleh(struct Proc * proc);
void OpAnimScrollInTethys(struct Proc * proc);
void OpAnimScrollInBlank(struct Proc * proc);
void OpAnimFaceMontageBegin(struct Proc * proc);
void OpAnimFaceMontageEwanGroup(struct Proc * proc);
void OpAnimFaceMontageGarciaGroup(struct Proc * proc);
void OpAnimFaceMontageVanessaGroup(struct Proc * proc);
void OpAnimFaceMontageGilliamGroup(struct Proc * proc);
void OpAnimFaceMontageColmGroup(struct Proc * proc);
void OpAnimFaceMontageKnollGroup(struct Proc * proc);
void OpAnimFaceMontageLuteGroup(struct Proc * proc);
void OpAnimFaceMontageDuesselGroup(struct Proc * proc);
void OpAnimFaceMontageKyleGroup(struct Proc * proc);
void OpAnimFaceMontageValterGroup(struct Proc * proc);
void OpAnimFaceMontageLyonGroup(struct Proc * proc);
void OpAnimFaceMontageBlendOut(struct Proc * proc);
void OpAnimFadeToWhite(struct Proc * proc);
void OpAnimSetupJoshuaScroll(struct Proc * proc);
void OpAnimSetupLArachelScroll(struct Proc * proc);
void OpAnimSetupSethScroll(struct Proc * proc);
void OpAnimSetupMyrrhScroll(struct Proc * proc);
void OpAnimSetupSalehScroll(struct Proc * proc);
void OpAnimSetupTethysScroll(struct Proc * proc);
void OpAnimCharacterScrollInBegin(struct Proc * proc);
void OpAnimCharacterScrollInMain(struct Proc * proc);
void OpAnimCharacterScrollOutBegin(struct Proc * proc);
void OpAnimCharacterScrollOutMain(struct Proc * proc);
void OpAnimCharacterFlyIn1(struct Proc * proc);
void OpAnimCharacterFlyIn2(struct Proc * proc);
void OpAnimCharacterFlyOut(struct Proc * proc);
void OpAnimGatherUnitsBegin(struct Proc * proc);
void OpAnimGatherUnitsMain(struct Proc * proc);
void OpAnimGatherUnitsEnd(struct Proc * proc);
void OpAnimSetupWalkingObjWindow(struct Proc * proc);
void OpAnimTitleFlyInSeg1(struct Proc * proc);
void OpAnimTitleFlyInSeg2(struct Proc * proc);
void OpAnimTitleFlyInSeg3(struct Proc * proc);
void OpAnimTitleFlyInSeg4(struct Proc * proc);
void OpAnimTitleFlyInSeg5(struct Proc * proc);
void OpAnimTitleFlyInSeg6(struct Proc * proc);
void OpAnimTitleFlyInSeg7(struct Proc * proc);
void OpAnimTitleFlyInSeg8(struct Proc * proc);
void OpAnimTitleFlyInSeg9(struct Proc * proc);
void OpAnimTitleFlyInSeg10(struct Proc * proc);
void OpAnimTitleFlyInSeg11(struct Proc * proc);
void OpAnimTitleFlyInSeg12(struct Proc * proc);
void OpAnimEnd(struct Proc * proc);
extern struct ProcCmd ProcScr_OpAnimScrollBg3[];

struct ProcCmd CONST_DATA ProcScr_OpAnim[] =
{
    PROC_YIELD,
    PROC_CALL(OpAnimInit),
    PROC_YIELD,
    PROC_CALL(SetupOpAnimWorldMapfx),
    PROC_START_CHILD(ProcScr_OpAnimBLDALPHA),
    PROC_WHILE(OpAnimBldAlphaExists),
    PROC_CALL(OpAnimUpdateScreen1),
    PROC_REPEAT(OpAnimWorldMapfxMain),
    PROC_CALL(OpAnimSetupCharacterScene),
    PROC_YIELD,
    PROC_REPEAT(OpAnimPreparefxEphraim),
    PROC_CALL(NewProc08AA6D04),
    PROC_REPEAT(OpAnimEphraimfxFlyIn),
    PROC_REPEAT(OpAnimEphraimSetupSplitWindow),
    PROC_REPEAT(OpAnim1AdvanceSplitLine),
    PROC_REPEAT(OpAnimEphraimMergeShadow),
    PROC_REPEAT(OpAnimEphraimDisplayName),
    PROC_REPEAT(OpAnimEphraimExit),
    PROC_REPEAT(OpAnimPreparefxEirika),
    PROC_REPEAT(OpAnimEirikafxFlyIn),
    PROC_REPEAT(OpAnimEirikaSetupSplitWindow),
    PROC_REPEAT(OpAnimEirikaAdvanceSplitLine),
    PROC_REPEAT(OpAnimEirikaMergeShadow),
    PROC_REPEAT(OpAnimEirikaDisplayName),
    PROC_REPEAT(OpAnimEirikaExit),
    PROC_REPEAT(OpAnimFadeToBlack),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_START_CHILD(ProcScr_OpAnimDarkenBg2In),
    PROC_REPEAT(OpAnimJoshuaScrollIn),
    PROC_START_CHILD(ProcScr_OpAnimScrollBg3),
    PROC_CALL(OpAnimCharacterScrollInBegin),
    PROC_REPEAT(OpAnimCharacterScrollInMain),
    PROC_CALL(OpAnimSetupJoshuaScroll),
    PROC_REPEAT(OpAnimCharacterFlyIn1),
    PROC_REPEAT(OpAnimCharacterFlyIn2),
    PROC_REPEAT(OpAnimCharacterFlyOut),
    PROC_CALL(OpAnimCharacterScrollOutBegin),
    PROC_REPEAT(OpAnimCharacterScrollOutMain),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimScrollInLArachel),
    PROC_CALL(OpAnimCharacterScrollInBegin),
    PROC_REPEAT(OpAnimCharacterScrollInMain),
    PROC_CALL(OpAnimSetupLArachelScroll),
    PROC_REPEAT(OpAnimCharacterFlyIn1),
    PROC_REPEAT(OpAnimCharacterFlyIn2),
    PROC_REPEAT(OpAnimCharacterFlyOut),
    PROC_CALL(OpAnimCharacterScrollOutBegin),
    PROC_REPEAT(OpAnimCharacterScrollOutMain),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimScrollInSeth),
    PROC_CALL(OpAnimCharacterScrollInBegin),
    PROC_REPEAT(OpAnimCharacterScrollInMain),
    PROC_CALL(OpAnimSetupSethScroll),
    PROC_REPEAT(OpAnimCharacterFlyIn1),
    PROC_REPEAT(OpAnimCharacterFlyIn2),
    PROC_REPEAT(OpAnimCharacterFlyOut),
    PROC_CALL(OpAnimCharacterScrollOutBegin),
    PROC_REPEAT(OpAnimCharacterScrollOutMain),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimScrollInMyrrh),
    PROC_CALL(OpAnimCharacterScrollInBegin),
    PROC_REPEAT(OpAnimCharacterScrollInMain),
    PROC_CALL(OpAnimSetupMyrrhScroll),
    PROC_REPEAT(OpAnimCharacterFlyIn1),
    PROC_REPEAT(OpAnimCharacterFlyIn2),
    PROC_REPEAT(OpAnimCharacterFlyOut),
    PROC_CALL(OpAnimCharacterScrollOutBegin),
    PROC_REPEAT(OpAnimCharacterScrollOutMain),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimScrollInSaleh),
    PROC_CALL(OpAnimCharacterScrollInBegin),
    PROC_REPEAT(OpAnimCharacterScrollInMain),
    PROC_CALL(OpAnimSetupSalehScroll),
    PROC_REPEAT(OpAnimCharacterFlyIn1),
    PROC_REPEAT(OpAnimCharacterFlyIn2),
    PROC_REPEAT(OpAnimCharacterFlyOut),
    PROC_CALL(OpAnimCharacterScrollOutBegin),
    PROC_REPEAT(OpAnimCharacterScrollOutMain),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimScrollInTethys),
    PROC_CALL(OpAnimCharacterScrollInBegin),
    PROC_REPEAT(OpAnimCharacterScrollInMain),
    PROC_CALL(OpAnimSetupTethysScroll),
    PROC_REPEAT(OpAnimCharacterFlyIn1),
    PROC_REPEAT(OpAnimCharacterFlyIn2),
    PROC_REPEAT(OpAnimCharacterFlyOut),
    PROC_CALL(OpAnimCharacterScrollOutBegin),
    PROC_REPEAT(OpAnimCharacterScrollOutMain),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_START_CHILD(ProcScr_OpAnimDarkenBg2Out),
    PROC_END_EACH(ProcScr_OpAnimScrollBg3),
    PROC_REPEAT(OpAnimScrollInBlank),
    PROC_CALL(OpAnimGatherUnitsBegin),
    PROC_REPEAT(OpAnimGatherUnitsMain),
    PROC_CALL(OpAnimGatherUnitsEnd),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageBegin),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg1),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageEwanGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg2),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageGarciaGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg3),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageVanessaGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg4),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageGilliamGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg5),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageColmGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg6),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageKnollGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg7),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageLuteGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg8),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageDuesselGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg9),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageKyleGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg10),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageValterGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg11),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageLyonGroup),
    PROC_CALL(OpAnimSetupWalkingObjWindow),
    PROC_REPEAT(OpAnimTitleFlyInSeg12),
    PROC_CALL(OpAnimApplyScrollAndPalettes),
    PROC_REPEAT(OpAnimFaceMontageBlendOut),
    PROC_REPEAT(OpAnimFadeToWhite),
    PROC_SLEEP(32),
    PROC_LABEL(99),
    PROC_CALL(OpAnimEnd),
    PROC_SLEEP(1),
    PROC_END,
};
