#pragma once

#include "global.h"
#include "proc.h"

#define ApplyPalettesOpAnim(aSrc, aPalId, aPalCount) CopyToPalOpAnim((aSrc), 0x20 * (aPalId), 0x20 * (aPalCount))
#define ApplyPaletteOpAnim(aSrc, aPalId) ApplyPalettesOpAnim((aSrc), (aPalId), 1)

#define gPaletteOpAnimHsBackup ((u16 *)__ewram_start)

struct TitleScreenProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 mode; // maybe a flag for whether we are coming from the intro sequence?
    /* 2A */ u16 timer;
    /* 2C */ int timer_idle;
    /* 30 */ int unk_30;

    /* 34 */ u8 _pad[0x4C-0x34];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e; // unused/pad?
    /* 50 */ s16 unk_50; // unused/pad?
    /* 52 */ u16 unk_52;
};

struct OpAnimSt {
    /* 00 */ s16 x;
    /* 02 */ s16 y;
    /* 04 */ s16 unk04;
    /* 06 */ s16 unk06;
    /* 08 */ s16 unk08;
    /* 0A */ s16 unk0A;
    /* 0C */ u16 pal;
};

extern struct OpAnimSt gOpAnimSt;
// #define gOpAnimSt ((struct OpAnimSt *)gGenericBuffer);

struct ProcOpAnim {
    PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ u16 unk34;
    /* 36 */ u16 unk36;
    /* 38 */ u16 unk38;
    /* 3A */ u16 unk3A;
    /* 3C */ u16 unk3C;
    /* 3E */ u16 unk3E;
    /* 40 */ u16 unk40;
    /* 42 */ u16 unk42;
    /* 44 */ s16 unk44;
    /* 46 */ u8 unk46;
    /* 47 */ u8 unk47;
    /* 48 */ u16 * unk48;
    /* 4C */ u16 * unk4C;
};

struct ProcOpAnimHS {
    PROC_HEADER;

    /* 2C */ int status;
    /* 30 */ int palette_timer;
    /* 34 */ int delay_timer;
    /* 38 */ int unk38;
};

struct ProcOpAnimFadeIn {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 cur;
    /* 4E */ STRUCT_PAD(0x4E, 0x64);
    /* 64 */ s16 max;
};

struct ProcOpAnimBLDALPHA {
    PROC_HEADER;

    /* 2A */ u16 timer;
};

struct Proc08AA7034 {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 timer;
};

// TODO: Maybe the struct above and below can be combined?

struct ProcOpAnimBlend
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

extern CONST_DATA u16 Obj_OpAnimEphEirikaName[];
extern CONST_DATA u16 Obj_Opanimfx_0[];
extern CONST_DATA u16 Obj_Opanimfx_1[];
extern CONST_DATA u16 Obj_Opanimfx_2[];
extern CONST_DATA u16 Obj_Opanimfx_3[];
extern CONST_DATA u16 Obj_Opanimfx_4[];
extern CONST_DATA u16 Obj_Opanimfx_4[];
extern CONST_DATA u16 Obj_Opanimfx_4[];
extern CONST_DATA u16 Obj_Opanimfx_5[];
extern CONST_DATA u16 Obj_Opanimfx_6[];
extern CONST_DATA u16 Obj_Opanimfx_7[];
extern CONST_DATA u16 Obj_Opanimfx_8[];
extern CONST_DATA u16 Obj_Opanimfx_9[];
extern CONST_DATA u16 Obj_Opanimfx_10[];
extern CONST_DATA struct ProcCmd ProcScr_OpAnimfxTerminator[];
extern CONST_DATA struct ProcCmd ProcScr_OpAnimFadeIn[];
extern CONST_DATA struct ProcCmd ProcScr_OpAnimBLDALPHA[];
extern CONST_DATA struct ProcCmd ProcScr_Opanim_0[];
extern CONST_DATA u8 * imgs_Opanim_0[100];
extern CONST_DATA u16 * tsas_Opanim_0[100];
extern CONST_DATA struct ProcCmd ProcScr_OpAnimMergeBG[];
// extern ??? ProcScr_OpAnimDarkenBg2In
// extern ??? ProcScr_OpAnimDarkenBg2Out
// extern ??? Obj_OpanimClassReelUnitSprite
// extern ??? Obj_OpanimTitleFlyInSeg1ObjWindow
// extern ??? Obj_OpanimTitleFlyInSeg2ObjWindow
// extern ??? Obj_OpanimTitleFlyInSeg3ObjWindow
// extern ??? Obj_OpanimTitleFlyInSeg4ObjWindow
// extern ??? Obj_OpanimTitleFlyInSeg10ObjWindow
// extern ??? Obj_OpanimTitleFlyInSeg9ObjWindow
// extern ??? Obj_OpanimTitleFlyInSeg12ObjWindow

extern CONST_DATA u16 * Pal_OpAnimShiningRing[];
extern CONST_DATA u8 img_opanim1[];
extern CONST_DATA u8 img_opanim2[];
extern CONST_DATA u8 img_opanim3[];
extern CONST_DATA u8 img_opanim4[];
extern CONST_DATA u8 img_opanim5[];
extern CONST_DATA u8 img_opanim6[];
extern CONST_DATA u8 img_opanim7[];
extern CONST_DATA u8 img_opanim8[];
extern CONST_DATA u8 img_opanim9[];
extern CONST_DATA u8 img_opanim10[];
extern CONST_DATA u8 img_opanim11[];
extern CONST_DATA u8 img_opanim12[];
extern CONST_DATA u8 img_opanim13[];
extern CONST_DATA u8 img_opanim14[];
extern CONST_DATA u8 img_opanim15[];
extern CONST_DATA u8 img_opanim16[];
extern CONST_DATA u8 img_opanim17[];
extern CONST_DATA u8 img_opanim18[];
extern CONST_DATA u8 img_opanim19[];
extern CONST_DATA u8 img_opanim20[];
extern CONST_DATA u8 img_opanim21[];
extern CONST_DATA u8 img_opanim22[];
extern CONST_DATA u8 img_opanim23[];
extern CONST_DATA u8 img_opanim24[];
extern CONST_DATA u8 img_opanim25[];
extern CONST_DATA u8 img_opanim26[];
extern CONST_DATA u8 img_opanim27[];
extern CONST_DATA u8 img_opanim28[];
extern CONST_DATA u8 img_opanim29[];
extern CONST_DATA u8 img_opanim30[];
extern CONST_DATA u8 img_opanim31[];
extern CONST_DATA u8 img_opanim32[];
extern CONST_DATA u8 img_opanim33[];
extern CONST_DATA u8 img_opanim34[];
extern CONST_DATA u8 img_opanim35[];
extern CONST_DATA u8 img_opanim36[];
extern CONST_DATA u8 img_opanim37[];
extern CONST_DATA u8 img_opanim38[];
extern CONST_DATA u8 img_opanim39[];
extern CONST_DATA u8 img_opanim40[];
extern CONST_DATA u8 img_opanim41[];
extern CONST_DATA u8 img_opanim42[];
extern CONST_DATA u8 img_opanim43[];
extern CONST_DATA u8 img_opanim44[];
extern CONST_DATA u8 img_opanim45[];
extern CONST_DATA u8 img_opanim46[];
extern CONST_DATA u8 img_opanim47[];
extern CONST_DATA u8 img_opanim48[];
extern CONST_DATA u8 img_opanim49[];
extern CONST_DATA u8 img_opanim50[];
extern CONST_DATA u8 img_opanim51[];
extern CONST_DATA u8 img_opanim52[];
extern CONST_DATA u8 img_opanim53[];
extern CONST_DATA u8 img_opanim54[];
extern CONST_DATA u8 img_opanim55[];
extern CONST_DATA u8 img_opanim56[];
extern CONST_DATA u8 img_opanim57[];
extern CONST_DATA u8 img_opanim58[];
extern CONST_DATA u8 img_opanim59[];
extern CONST_DATA u8 img_opanim60[];
extern CONST_DATA u8 img_opanim61[];
extern CONST_DATA u8 img_opanim62[];
extern CONST_DATA u8 img_opanim63[];
extern CONST_DATA u8 img_opanim64[];
extern CONST_DATA u8 img_opanim65[];
extern CONST_DATA u8 img_opanim66[];
extern CONST_DATA u8 img_opanim67[];
extern CONST_DATA u8 img_opanim68[];
extern CONST_DATA u8 img_opanim69[];
extern CONST_DATA u8 img_opanim70[];
extern CONST_DATA u8 img_opanim71[];
extern CONST_DATA u8 img_opanim72[];
extern CONST_DATA u8 img_opanim73[];
extern CONST_DATA u8 img_opanim74[];
extern CONST_DATA u8 img_opanim75[];
extern CONST_DATA u8 img_opanim76[];
extern CONST_DATA u8 img_opanim77[];
extern CONST_DATA u8 img_opanim78[];
extern CONST_DATA u8 img_opanim79[];
extern CONST_DATA u8 img_opanim80[];
extern CONST_DATA u8 img_opanim81[];
extern CONST_DATA u8 img_opanim82[];
extern CONST_DATA u8 img_opanim83[];
extern CONST_DATA u8 img_opanim84[];
extern CONST_DATA u8 img_opanim85[];
extern CONST_DATA u8 img_opanim86[];
extern CONST_DATA u8 img_opanim87[];
extern CONST_DATA u8 img_opanim88[];
extern CONST_DATA u8 img_opanim89[];
extern CONST_DATA u8 img_opanim90[];
extern CONST_DATA u8 img_opanim91[];
extern CONST_DATA u8 img_opanim92[];
extern CONST_DATA u8 img_opanim93[];
extern CONST_DATA u8 img_opanim94[];
extern CONST_DATA u8 img_opanim95[];
extern CONST_DATA u8 img_opanim96[];
extern CONST_DATA u8 img_opanim97[];
extern CONST_DATA u8 img_opanim98[];
extern CONST_DATA u8 img_opanim99[];
extern CONST_DATA u8 img_opanim100[];
extern CONST_DATA u16 tsa_opanim1[];
extern CONST_DATA u16 tsa_opanim2[];
extern CONST_DATA u16 tsa_opanim3[];
extern CONST_DATA u16 tsa_opanim4[];
extern CONST_DATA u16 tsa_opanim5[];
extern CONST_DATA u16 tsa_opanim6[];
extern CONST_DATA u16 tsa_opanim7[];
extern CONST_DATA u16 tsa_opanim8[];
extern CONST_DATA u16 tsa_opanim9[];
extern CONST_DATA u16 tsa_opanim10[];
extern CONST_DATA u16 tsa_opanim11[];
extern CONST_DATA u16 tsa_opanim12[];
extern CONST_DATA u16 tsa_opanim13[];
extern CONST_DATA u16 tsa_opanim14[];
extern CONST_DATA u16 tsa_opanim15[];
extern CONST_DATA u16 tsa_opanim16[];
extern CONST_DATA u16 tsa_opanim17[];
extern CONST_DATA u16 tsa_opanim18[];
extern CONST_DATA u16 tsa_opanim19[];
extern CONST_DATA u16 tsa_opanim20[];
extern CONST_DATA u16 tsa_opanim21[];
extern CONST_DATA u16 tsa_opanim22[];
extern CONST_DATA u16 tsa_opanim23[];
extern CONST_DATA u16 tsa_opanim24[];
extern CONST_DATA u16 tsa_opanim25[];
extern CONST_DATA u16 tsa_opanim26[];
extern CONST_DATA u16 tsa_opanim27[];
extern CONST_DATA u16 tsa_opanim28[];
extern CONST_DATA u16 tsa_opanim29[];
extern CONST_DATA u16 tsa_opanim30[];
extern CONST_DATA u16 tsa_opanim31[];
extern CONST_DATA u16 tsa_opanim32[];
extern CONST_DATA u16 tsa_opanim33[];
extern CONST_DATA u16 tsa_opanim34[];
extern CONST_DATA u16 tsa_opanim35[];
extern CONST_DATA u16 tsa_opanim36[];
extern CONST_DATA u16 tsa_opanim37[];
extern CONST_DATA u16 tsa_opanim38[];
extern CONST_DATA u16 tsa_opanim39[];
extern CONST_DATA u16 tsa_opanim40[];
extern CONST_DATA u16 tsa_opanim41[];
extern CONST_DATA u16 tsa_opanim42[];
extern CONST_DATA u16 tsa_opanim43[];
extern CONST_DATA u16 tsa_opanim44[];
extern CONST_DATA u16 tsa_opanim45[];
extern CONST_DATA u16 tsa_opanim46[];
extern CONST_DATA u16 tsa_opanim47[];
extern CONST_DATA u16 tsa_opanim48[];
extern CONST_DATA u16 tsa_opanim49[];
extern CONST_DATA u16 tsa_opanim50[];
extern CONST_DATA u16 tsa_opanim51[];
extern CONST_DATA u16 tsa_opanim52[];
extern CONST_DATA u16 tsa_opanim53[];
extern CONST_DATA u16 tsa_opanim54[];
extern CONST_DATA u16 tsa_opanim55[];
extern CONST_DATA u16 tsa_opanim56[];
extern CONST_DATA u16 tsa_opanim57[];
extern CONST_DATA u16 tsa_opanim58[];
extern CONST_DATA u16 tsa_opanim59[];
extern CONST_DATA u16 tsa_opanim60[];
extern CONST_DATA u16 tsa_opanim61[];
extern CONST_DATA u16 tsa_opanim62[];
extern CONST_DATA u16 tsa_opanim63[];
extern CONST_DATA u16 tsa_opanim64[];
extern CONST_DATA u16 tsa_opanim65[];
extern CONST_DATA u16 tsa_opanim66[];
extern CONST_DATA u16 tsa_opanim67[];
extern CONST_DATA u16 tsa_opanim68[];
extern CONST_DATA u16 tsa_opanim69[];
extern CONST_DATA u16 tsa_opanim70[];
extern CONST_DATA u16 tsa_opanim71[];
extern CONST_DATA u16 tsa_opanim72[];
extern CONST_DATA u16 tsa_opanim73[];
extern CONST_DATA u16 tsa_opanim74[];
extern CONST_DATA u16 tsa_opanim75[];
extern CONST_DATA u16 tsa_opanim76[];
extern CONST_DATA u16 tsa_opanim77[];
extern CONST_DATA u16 tsa_opanim78[];
extern CONST_DATA u16 tsa_opanim79[];
extern CONST_DATA u16 tsa_opanim80[];
extern CONST_DATA u16 tsa_opanim81[];
extern CONST_DATA u16 tsa_opanim82[];
extern CONST_DATA u16 tsa_opanim83[];
extern CONST_DATA u16 tsa_opanim84[];
extern CONST_DATA u16 tsa_opanim85[];
extern CONST_DATA u16 tsa_opanim86[];
extern CONST_DATA u16 tsa_opanim87[];
extern CONST_DATA u16 tsa_opanim88[];
extern CONST_DATA u16 tsa_opanim89[];
extern CONST_DATA u16 tsa_opanim90[];
extern CONST_DATA u16 tsa_opanim91[];
extern CONST_DATA u16 tsa_opanim92[];
extern CONST_DATA u16 tsa_opanim93[];
extern CONST_DATA u16 tsa_opanim94[];
extern CONST_DATA u16 tsa_opanim95[];
extern CONST_DATA u16 tsa_opanim96[];
extern CONST_DATA u16 tsa_opanim97[];
extern CONST_DATA u16 tsa_opanim98[];
extern CONST_DATA u16 tsa_opanim99[];
extern CONST_DATA u16 tsa_opanim100[];
extern u16 pal_OpanimGfx_0[];

extern u8 Img_OpAnimGenericCharacterBG[];
extern u8 Tsa_OpAnimGenericCharacterBG[];

extern u8 Img_OpAnimJoshua[];
extern u8 Img_OpAnimJoshua2[];
extern u8 Tsa_OpAnimJoshua2[];
extern u8 Tsa_OpAnimJoshua[];

extern u8 Img_OpAnimShiningRing[];
extern u8 Tsa_OpAnimShiningRing[];

extern struct ProcCmd ProcScr_OpAnimDarkenBg2In[];
extern struct ProcCmd ProcScr_OpAnimDarkenBg2Out[];

extern u8 Img_OpAnimTethys[];
extern u8 Tsa_OpAnimTethys[];

extern u8 Img_OpAnimTethys2[];
extern u8 Tsa_OpAnimTethys2[];

extern u16 pal_OpanimGfx_0[];

extern u16 Pal_OpanimGfx_0[];

extern u8 Img_OpAnimFaceRennac[];
extern u16 Pal_OpAnimFaceRennac[];
extern u8 Img_OpAnimFaceRennacShadow[];

extern u8 Img_OpAnimFaceLArachel[];
extern u16 Pal_OpAnimFaceLArachel[];
extern u8 Img_OpAnimFaceLArachelShadow[];

extern u8 Img_OpAnimFaceDozla[];
extern u16 Pal_OpAnimFaceDozla[];
extern u8 Img_OpAnimFaceDozlaShadow[];

extern u8 Img_OpAnimFaceEwan[];
extern u16 Pal_OpAnimFaceEwan[];
extern u8 Img_OpAnimFaceEwanShadow[];

extern u8 Img_OpAnimFaceTethys[];
extern u16 Pal_OpAnimFaceTethys[];
extern u8 Img_OpAnimFaceTethysShadow[];

extern u8 Img_OpAnimFaceGerik[];
extern u16 Pal_OpAnimFaceGerik[];
extern u8 Img_OpAnimFaceGerikShadow[];

extern u8 Img_OpAnimFaceMarisa[];
extern u16 Pal_OpAnimFaceMarisa[];
extern u8 Img_OpAnimFaceMarisaShadow[];

extern u8 Img_OpAnimFaceGarcia[];
extern u16 Pal_OpAnimFaceGarcia[];
extern u8 Img_OpAnimFaceGarciaShadow[];

extern u8 Img_OpAnimFaceRoss[];
extern u16 Pal_OpAnimFaceRoss[];
extern u8 Img_OpAnimFaceRossShadow[];

extern u8 Img_OpAnimFaceVanessa[];
extern u16 Pal_OpAnimFaceVanessa[];
extern u8 Img_OpAnimFaceVanessaShadow[];

extern u8 Img_OpAnimFaceTana[];
extern u16 Pal_OpAnimFaceTana[];
extern u8 Img_OpAnimFaceTanaShadow[];

extern u8 Img_OpAnimFaceSyrene[];
extern u16 Pal_OpAnimFaceSyrene[];
extern u8 Img_OpAnimFaceSyreneShadow[];

extern u8 Img_OpAnimFaceGilliam[];
extern u16 Pal_OpAnimFaceGilliam[];
extern u8 Img_OpAnimFaceGilliamShadow[];

extern u8 Img_OpAnimFaceInnes[];
extern u16 Pal_OpAnimFaceInnes[];
extern u8 Img_OpAnimFaceInnesShadow[];

extern u8 Img_OpAnimFaceMoulder[];
extern u16 Pal_OpAnimFaceMoulder[];
extern u8 Img_OpAnimFaceMoulderShadow[];

extern u8 Img_OpAnimFaceColm[];
extern u16 Pal_OpAnimFaceColm[];
extern u8 Img_OpAnimFaceColmShadow[];

extern u8 Img_OpAnimFaceNeimi[];
extern u16 Pal_OpAnimFaceNeimi[];
extern u8 Img_OpAnimFaceNeimiShadow[];

extern u8 Img_OpAnimFaceKnoll[];
extern u16 Pal_OpAnimFaceKnoll[];
extern u8 Img_OpAnimFaceKnollShadow[];

extern u8 Img_OpAnimFaceNatasha[];
extern u16 Pal_OpAnimFaceNatasha[];
extern u8 Img_OpAnimFaceNatashaShadow[];

extern u8 Img_OpAnimFaceCormag[];
extern u16 Pal_OpAnimFaceCormag[];
extern u8 Img_OpAnimFaceCormagShadow[];

extern u8 Img_OpAnimFaceAmelia[];
extern u16 Pal_OpAnimFaceAmelia[];
extern u8 Img_OpAnimFaceAmeliaShadow[];

extern u8 Img_OpAnimFaceLute[];
extern u16 Pal_OpAnimFaceLute[];
extern u8 Img_OpAnimFaceLuteShadow[];

extern u8 Img_OpAnimFaceArtur[];
extern u16 Pal_OpAnimFaceArtur[];
extern u8 Img_OpAnimFaceArturShadow[];

extern u8 Img_OpAnimFaceDuessel[];
extern u16 Pal_OpAnimFaceDuessel[];
extern u8 Img_OpAnimFaceDuesselShadow[];

extern u8 Img_OpAnimFaceSelena[];
extern u16 Pal_OpAnimFaceSelena[];
extern u8 Img_OpAnimFaceSelenaShadow[];

extern u8 Img_OpAnimFaceGlen[];
extern u16 Pal_OpAnimFaceGlen[];
extern u8 Img_OpAnimFaceGlenShadow[];

extern u8 Img_OpAnimFaceKyle[];
extern u16 Pal_OpAnimFaceKyle[];
extern u8 Img_OpAnimFaceKyleShadow[];

extern u8 Img_OpAnimFaceFranz[];
extern u16 Pal_OpAnimFaceFranz[];
extern u8 Img_OpAnimFaceFranzShadow[];

extern u8 Img_OpAnimFaceForde[];
extern u16 Pal_OpAnimFaceForde[];
extern u8 Img_OpAnimFaceFordeShadow[];

extern u8 Img_OpAnimFaceSeth[];
extern u16 Pal_OpAnimFaceSeth[];
extern u8 Img_OpAnimFaceSethShadow[];

extern u8 Img_OpAnimFaceValter[];
extern u16 Pal_OpAnimFaceValter[];
extern u8 Img_OpAnimFaceValterShadow[];

extern u8 Img_OpAnimFaceRiev[];
extern u16 Pal_OpAnimFaceRiev[];
extern u8 Img_OpAnimFaceRievShadow[];

extern u8 Img_OpAnimFaceCaellach[];
extern u16 Pal_OpAnimFaceCaellach[];
extern u8 Img_OpAnimFaceCaellachShadow[];

extern u8 Img_OpAnimFaceLyon[];
extern u16 Pal_OpAnimFaceLyon[];
extern u8 Img_OpAnimFaceLyonShadow[];

extern u8 Img_OpAnimFaceVigarde[];
extern u16 Pal_OpAnimFaceVigarde[];
extern u8 Img_OpAnimFaceVigardeShadow[];

extern u16 Pal_OpAnimTethys[];

extern u8 Tsa_OpAnimShiningRingBlinking[];

extern u16 Obj_OpanimClassReelUnitSprite[];
extern u16 Obj_OpanimTitleFlyInSeg1ObjWindow[];
extern u16 Obj_OpanimTitleFlyInSeg2ObjWindow[];
extern u16 Obj_OpanimTitleFlyInSeg3ObjWindow[];
extern u16 Obj_OpanimTitleFlyInSeg4ObjWindow[];
extern u16 Obj_OpanimTitleFlyInSeg10ObjWindow[];
extern u16 Obj_OpanimTitleFlyInSeg9ObjWindow[];

extern u16 Obj_OpanimTitleFlyInSeg12ObjWindow[];

void OpAnimPutObjCommon(int ix, int iy, u8 a, u8 b);
void OpAnimfxTerminatorMain(struct Proc * proc);
void NewOpAnimfxTerminator(ProcPtr parent);
void EndOpAnimfxTerminator(void);
void CopyToPalOpAnim(const void * src, int offset, int size);
void CopyFirstPalDirectly(const u16 * src, u16 * dst);
void SetFirstPalDirectly(u16 * src, u16 * dst, u8 pal);
void ClearFirstPalDirectly(u16 * dst);
void TsaModifyFirstPalMaybe(s16 end, s16 start, s16 unused, u16 bg, u16 * src1, u16 * src2, s8 flag);
void TsaModifyFirstPalReverse(s16 end, s16 start, s16 unused, u16 bg, u16 * src1, u16 * src2, s8 flag);
void BlendPaletteToColor(u16 *, u16, u16);
void OpAnimInit(struct ProcOpAnim * proc);
void OpAnimAllBlack(struct ProcOpAnimFadeIn * proc);
void OpAnimFadeInMain(struct ProcOpAnimFadeIn * proc);
void NewProcOpAnimFadeIn(int max, ProcPtr parent);
void BgAffineSetOpAnim(int scaling_radio, int angle);
void SetupOpAnimWorldMapfx(struct ProcOpAnim * proc);
void OpAnimBldAlphaInit(struct ProcOpAnimBLDALPHA * proc);
void OpAnimBldAlphaUpdateBgPalette(struct ProcOpAnimBLDALPHA * proc);
void OpAnimBldAlphaDelay(struct ProcOpAnimBLDALPHA * proc);
void OpAnimBldAlphaMain(struct ProcOpAnimBLDALPHA * proc);
bool OpAnimBldAlphaExists(void);
void OpAnimUpdateScreen1(struct ProcOpAnim * proc);
void OpAnimWorldMapfxMain(struct ProcOpAnim * proc);
void OpAnimSetupCharacterScene(struct ProcOpAnim * proc);
void Proc08AA6D04Main(void);
void NewProc08AA6D04(void);
void EndProc08AA6D04(void);
void OpAnim1_UpdateScrollOneLine(s16 index);
void OpAnim1_UpdateScroll(int new, int old);
void OpAnimApplyScrollPalettes(u8 type);
void OpAnimPreparefxEphraim(struct ProcOpAnim * proc);
void OpAnimMergeBGProcInit(struct Proc08AA7034 * proc);
void OpAnimMergeBGProcUpdateBgPalette(struct Proc08AA7034 * proc);
void OpAnimDrawSplitLine(int xOam1, int yOam0);
void OpAnimEphraimfxFlyIn(struct ProcOpAnim * proc);
void OpAnimHBlank1(void);
void OpAnimHBlank2(void);
void OpAnimEphraimSetupSplitWindow(struct ProcOpAnim * proc);
void OpAnim1AdvanceSplitLine(struct ProcOpAnim * proc);
void OpAnimEphraimMergeShadow(struct ProcOpAnim * proc);
void OpAnimEphraimDisplayName(struct ProcOpAnim * proc);
void OpAnimEphraimExit(struct ProcOpAnim * proc);
// ??? OpAnimPreparefxEirika(???);
// ??? OpAnimEirikafxFlyIn(???);
// ??? OpAnimEirikaSetupSplitWindow(???);
// ??? OpAnimEirikaAdvanceSplitLine(???);
// ??? OpAnimEirikaMergeShadow(???);
// ??? OpAnimEirikaDisplayName(???);
// ??? OpAnimEirikaExit(???);
// ??? OpAnimFadeToBlack(???);
// ??? OpAnimScrollBg3Loop(???);
// ??? OpAnimApplyScrollAndPalettes(???);
// ??? OpAnimDarkenBg2Init(???);
// ??? OpAnimDarkenBg2In(???);
// ??? OpAnimRestoreColorEffectsOnEnd(???);
// ??? OpAnimDarkenBg2OutInit(???);
// ??? OpAnimDarkenBg2Out(???);
// ??? OpAnimRestoreColorEffectsOnEnd2(???);
// ??? OpAnimJoshuaScrollIn(???);
// ??? OpAnimScrollInLArachel(???);
// ??? OpAnimScrollInSeth(???);
// ??? OpAnimScrollInMyrrh(???);
// ??? OpAnimScrollInSaleh(???);
// ??? OpAnimScrollInTethys(???);
// ??? OpAnimScrollInBlank(???);
// ??? OpAnimFaceMontageBegin(???);
// ??? OpAnimFaceMontageEwanGroup(???);
// ??? OpAnimFaceMontageGarciaGroup(???);
// ??? OpAnimFaceMontageVanessaGroup(???);
// ??? OpAnimFaceMontageGilliamGroup(???);
// ??? OpAnimFaceMontageColmGroup(???);
// ??? OpAnimFaceMontageKnollGroup(???);
// ??? OpAnimFaceMontageLuteGroup(???);
// ??? OpAnimFaceMontageDuesselGroup(???);
// ??? OpAnimFaceMontageKyleGroup(???);
// ??? OpAnimFaceMontageValterGroup(???);
// ??? OpAnimFaceMontageLyonGroup(???);
// ??? OpAnimFaceMontageBlendOut(???);
// ??? OpAnimFadeToWhite(???);
// ??? OpAnimConfigCharacterScrollBg(???);
// ??? OpAnimSetupJoshuaScroll(???);
// ??? OpAnimSetupLArachelScroll(???);
// ??? OpAnimSetupSethScroll(???);
// ??? OpAnimSetupMyrrhScroll(???);
// ??? OpAnimSetupSalehScroll(???);
// ??? OpAnimSetupTethysScroll(???);
// ??? OpAnimCharacterScrollInBegin(???);
// ??? OpAnimCharacterScrollInMain(???);
// ??? OpAnimCharacterScrollOutBegin(???);
// ??? OpAnimCharacterScrollOutMain(???);
// ??? OpAnimCharacterFlyIn1(???);
// ??? OpAnimCharacterFlyIn2(???);
// ??? OpAnimCharacterFlyOutBg1(???);
// ??? OpAnimCharacterFlyOut(???);
// ??? OpAnimGatherUnitsBegin(???);
// ??? OpAnimGatherUnitsMain(???);
// ??? OpAnimGatherUnitsEnd(???);
// ??? OpAnimSetupWalkingObjWindow(???);
// ??? OpAnimCalcObjSlideIn(???);
// ??? OpAnimTitleFlyInSeg1(???);
// ??? OpAnimTitleFlyInSeg2(???);
// ??? OpAnimTitleFlyInSeg3(???);
// ??? OpAnimTitleFlyInSeg4(???);
// ??? OpAnimTitleFlyInSeg5(???);
// ??? OpAnimTitleFlyInSeg6(???);
// ??? OpAnimTitleFlyInSeg7(???);
// ??? OpAnimTitleFlyInSeg8(???);
// ??? OpAnimTitleFlyInSeg9(???);
// ??? OpAnimTitleFlyInSeg10(???);
// ??? OpAnimTitleFlyInSeg11(???);
// ??? OpAnimTitleFlyInSeg12(???);
// ??? OpAnimEnd(???);

void TryTickHSScreenExit(struct ProcOpAnimHS * proc);
void GameIntroPrepareNintendofx(struct ProcOpAnimHS * proc);
void OpAnimHS_BrightenPalette(u16 * src, int palid, int line, int cur, int max);
void OpAnimHS_InitFadeToBlack(struct ProcOpAnimHS * proc);
void OpAnimHS_FadeToBlackLoop(struct ProcOpAnimHS * proc);
void GameEarlyStartDelay(struct ProcOpAnimHS * proc);
void GameIntroNintendoFadeIN(struct ProcOpAnimHS * proc);
void GameIntroNintendoFadeOUT(struct ProcOpAnimHS * proc);
void GameIntroIntelligentSystemsFadeIN(struct ProcOpAnimHS * proc);
void GameIntroIntelligentSystemsFadeOUT(struct ProcOpAnimHS * proc);
void SetOpAnimHsStatus0(struct ProcOpAnimHS * proc);
void SetOpAnimHsStatus1(struct ProcOpAnimHS * proc);
void SetOpAnimHsStatus2(struct ProcOpAnimHS * proc);
void PrepareHealthAndSafetyScreen(struct ProcOpAnimHS * proc);
void GameIntroHealthSafetyFadeIN(struct ProcOpAnimHS * proc);
void GameIntroHealthSafetyWaitButton(struct ProcOpAnimHS * proc);
void GameIntroHealthSafetyFadeOUT(struct ProcOpAnimHS * proc);
