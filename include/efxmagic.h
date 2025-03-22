#pragma once

#include "global.h"
#include "anime.h"
#include "efxbattle.h"

struct ProcEfxMagicOBJ {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    STRUCT_PAD(0x30, 0x5C);
    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ ProcPtr seproc;
};

struct ProcEfxEclipseBG
{
    PROC_HEADER;

    /* 29 */ u8 unk29;
    STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    STRUCT_PAD(0x32, 0x44);
    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ u16 ** tsal;
    /* 50 */ u16 ** tsar;
    /* 54 */ u16 ** img;
    /* 58 */ u16 * pal;
    /* 5C */ struct Anim * anim;
};

typedef void (*SpellAnimFunc)(struct Anim * anim);
extern CONST_DATA SpellAnimFunc gEkrSpellAnimLut[];

extern u32 FramScr_Unk5D4F90[];
extern CONST_DATA struct ProcCmd ProcScr_efxRestRST[];
extern CONST_DATA struct ProcCmd ProcScr_efxTwobaiRST[];
extern CONST_DATA struct ProcCmd ProcScr_DummvRST[];
extern CONST_DATA struct ProcCmd ProcScr_EfxRestWIN[];
extern CONST_DATA struct ProcCmd ProcScr_EfxRestWINH[];

ProcPtr NewefxRestRST(struct Anim * anim, int unk44, int unk48, int frame, int unk50);
void sub_805B444(struct ProcEfx * proc);
void efxRestRSTMain(struct ProcEfx * proc);
void NewEfxTwobaiRST(struct Anim * anim, int a);
void EfxTwobaiRSTMain(struct ProcEfx * proc);
void NewDummvRST(struct Anim * anim, int unk44);
void sub_805B584(void);
void DummvRSTMain(struct ProcEfx * proc);
void NewEfxRestWIN(struct Anim * anim, int unk44, void * unk54, void * unk58);
void EfxRestWINMain(struct ProcEfx * proc);
// ??? EfxMagicHBlank_805B724(???);
// ??? EfxMagicHBlank_805B750(???);
// ??? EfxMagicHBlank_805B77C(???);
// ??? EfxMagicHBlank_805B7BC(???);
// ??? EfxMagicHBlank_805B7FC(???);
void NewEfxRestWINH(struct Anim * anim, int a, s16 b, u32 c);
void NewEfxRestWINH_(struct Anim * anim, int a, int b);

extern CONST_DATA struct ProcCmd ProcScr_efxALPHA[];
extern CONST_DATA struct ProcCmd ProcScr_efxCircleWIN[];
extern CONST_DATA struct ProcCmd ProcScr_efxMagicQUAKE[];
extern CONST_DATA struct ProcCmd ProcScr_efxDummymagic[];
extern CONST_DATA struct ProcCmd ProcScr_efxTeono[];
extern CONST_DATA struct ProcCmd ProcScr_efxTeonoOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_efxTeonoOBJ2[];
extern CONST_DATA struct ProcCmd ProcScr_efxTeonoSE[];
extern CONST_DATA struct ProcCmd ProcScr_efxArrow[];
extern CONST_DATA struct ProcCmd ProcScr_efxArrowOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_efxTeyari[];
extern CONST_DATA struct ProcCmd ProcScr_efxTeyariOBJ[];
extern CONST_DATA struct ProcCmd ProcScr_efxSong[];
extern CONST_DATA struct ProcCmd ProcScr_efxSongBG[];
// extern ??? TsaArray_SongBg
// extern ??? ImgArray_SongBg
// extern ??? ProcScr_efxSongOBJ
// extern ??? ProcScr_efxDance
// extern ??? ProcScr_efxShooter
// extern ??? ProcScr_efxShooterOBJ
// extern ??? ProcScr_efxHurtmut
// extern ??? ProcScr_efxHurtmutOBJ
// extern ??? ProcScr_efxFirebreath
// extern ??? ProcScr_efxFirebreathOBJ
// extern ??? ProcScr_efxFirebreathBG
// extern ??? ProcScr_efxFirebreathBGCOL
// extern ??? ProcScr_efxIcebreath
// extern ??? ProcScr_efxIcebreathOBJ
// extern ??? ProcScr_efxDarkbreath
// extern ??? ProcScr_efxDarkbreathBG
// extern ??? TsaArray_DarkBreathBg
// extern ??? ProcScr_efxDarkbreathBGCOL
extern struct ProcCmd ProcScr_efxDarkbreathOBJ[];
extern struct ProcCmd ProcScr_efxThunder[];
extern struct ProcCmd ProcScr_efxThunderBG[];
extern u16 *gUnknown_085D5458[2];
extern u16 *gUnknown_085D5460[2];
extern struct ProcCmd ProcScr_efxThunderBGCOL[];
extern struct ProcCmd ProcScr_efxThunderOBJ[];
extern struct ProcCmd ProcScr_efxFire[];
extern struct ProcCmd ProcScr_efxFireBG[];
extern struct ProcCmd ProcScr_efxFireOBJ[];
extern struct ProcCmd ProcScr_efxFireHITBG[];
extern u16 * ImgLut_AnimaHitBG[];
extern u16 * TsaLut_AnimaHitBG[];
extern struct ProcCmd ProcScr_efxElfireBG[];
extern struct ProcCmd ProcScr_efxElfireBGCOL[];
extern struct ProcCmd ProcScr_efxElfireOBJ[];
extern struct ProcCmd ProcScr_efxFimbulvetr[];
extern struct ProcCmd ProcScr_efxFimbulvetrBGTR[];
// extern ??? TsaArray_FimbulvetrBg_Tornado
// extern ??? ImgArray_FimbulvetrBg_Tornado
// extern ??? ProcScr_efxFimbulvetrBG
// extern ??? TsaArray_FimbulvetrBg
// extern ??? ImgArray_FimbulvetrBg
// extern ??? ProcScr_efxFimbulvetrOBJ
// extern ??? ProcScr_efxFimbulvetrOBJ2
// extern ??? ProcScr_efxFimbulvetrOBJ2Fall
// extern ??? gProcScr_efxThunderstorm
// extern ??? gProcScr_efxThunderstormBG
extern u16 * ImgArray_BoltingBg[];
extern u16 * TsaArray_BoltingBg[];
// extern ??? gProcScr_efxThunderstormOBJ
// extern ??? gProcScr_efxThunderstormCOLOR
// extern ??? gProcScr_efxThunderstormDARK
extern struct ProcCmd gProcScr_efxAlacalibur[];
extern struct ProcCmd gProcScr_efxAlacaliburBG[];
extern u16 * TsaArray_AircaliburBg[];
extern struct ProcCmd gProcScr_efxAlacaliburBGCOL[];
extern struct ProcCmd gProcScr_efxAlacaliburOBJ[];
extern struct ProcCmd gProcScr_efxMistyrain[];
extern struct ProcCmd gProcScr_efxMistyrainBG[];
extern u16 * gUnknown_085D5920[];
extern u16 * gUnknown_085D59C4[];
extern struct ProcCmd ProcScr_efxMistyrainOBJ[];
extern struct ProcCmd gProcScr_efxMistyrainOBJ2[];
// extern ??? ProcScr_efxResire
// extern ??? ProcScr_efxResireBG
// extern ??? ProcScr_efxResireBG2
// extern ??? ImgArray_NosferatuBg
// extern ??? TsaArray_NosferatuBg
// extern ??? ProcScr_efxResireRST
// extern ??? ProcScr_efxLightning
// extern ??? ProcScr_efxLightningBG
// extern ??? ImgArray_LightningBg
// extern ??? PalArray_LightningBg
// extern ??? TsaArray_LightningBg
// extern ??? ProcScr_efxPurge
// extern ??? ProcScr_efxPurgeBG
// extern ??? ImgArray_PurgeBg
// extern ??? PalArray_PurgeBg
// extern ??? TsaArray_PurgeBg
// extern ??? ProcScr_efxPurgeOBJRND
// extern ??? gPurgeAnimSpriteCoordinates
// extern ??? ProcScr_efxPurgeOBJ
// extern ??? ProcScr_efxDivine
// extern ??? ProcScr_efxDivineBG
// extern ??? ImgArray_DivineBg
// extern ??? TsaArray_DivineBg
// extern ??? ImgArray_DivineBg2
// extern ??? TsaArray_DivineBg2
// extern ??? ImgArray_DivineBg3
// extern ??? TsaArray_DivineBg3
// extern ??? ProcScr_efxDivineOBJ
// extern ??? ProcScr_efxHazymoon
// extern ??? ProcScr_efxHazymoonBG
// extern ??? TsaArray_EclipseBg
// extern ??? ImgArray_EclipseBg
// extern ??? ProcScr_efxHazymoonOBJ2
// extern ??? ProcScr_efxHazymoonOBJ3
// extern ??? gEclipseAnimSpriteCoordinates
// extern ??? ProcScr_efxHazymoonOBJ3RND
// extern ??? ProcScr_efxFenrir
// extern ??? ProcScr_efxFenrirBG
// extern ??? ProcScr_efxFenrirBGCOL
// extern ??? ProcScr_efxFenrirOBJ
// extern ??? ProcScr_efxFenrirBG2
// extern ??? ImgArray_FenrirBg
// extern ??? TsaArray_FenrirBg
// extern ??? ProcScr_efxFenrirOBJ2
// extern ??? ProcScr_efxFenrirOBJ2Chiri
// extern ??? gFenrirSpriteAngles
// extern ??? ProcScr_efxLive
// extern ??? ProcScr_efxRelive
// extern ??? ProcScr_efxRecover
// extern ??? ProcScr_efxReblow
// extern ??? ProcScr_efxLiveBG
// extern ??? ProcScr_efxLiveBGCOL
// extern ??? ProcScr_efxLiveALPHA
// extern ??? ProcScr_efxLiveOBJ
// extern ??? ProcScr_efxReserveOBJ
// extern ??? ProcScr_efxReblowOBJ
// extern ??? ProcScr_efxReserve
// extern ??? ProcScr_efxReserveBG
// extern ??? TsaArray_Fortify
// extern ??? ProcScr_efxReserveBGCOL
// extern ??? ProcScr_efxReserveBG2
// extern ??? TsaArray_FortifyBg2
// extern ??? ProcScr_efxReserveBGCOL2
// extern ??? ProcScr_efxRest
// extern ??? ProcScr_efxRestBG
// extern ??? TsaArray_RestoreBg
// extern ??? ImgArray_RestoreBg
// extern ??? ProcScr_efxRestOBJ
// extern ??? ProcScr_efxSilence
// extern ??? ProcScr_efxSilenceBG
// extern ??? TsaArray_SilenceBg
// extern ??? ProcScr_efxSilenceOBJ
// extern ??? ProcScr_efxSleep
// extern ??? ProcScr_efxSleepBG
// extern ??? TsaArray_SleepBg
// extern ??? ProcScr_efxSleepOBJ
// extern ??? ProcScr_efxSleepOBJ2
// extern ??? ProcScr_efxSleepSE
// extern ??? ProcScr_efxHammarne
// extern ??? ProcScr_efxHammarneBG
// extern ??? TsaArray_HammerneBg
// extern ??? ImgArray_HammerneBg
// extern ??? ProcScr_efxHammarneOBJ
// extern ??? ProcScr_efxBerserk
// extern ??? ProcScr_efxBerserkBG
// extern ??? ProcScr_efxBerserkCLONE
// extern ??? ProcScr_efxBerserkOBJ
// extern ??? ProcScr_efxMshield
// extern ??? ProcScr_efxMshieldBG
// extern ??? TsaArray_BarrierBg
// extern ??? ProcScr_efxMshieldBGOBJ
// extern ??? ProcScr_efxMshieldBGOBJ2
// extern ??? ProcScr_efxShine
// extern ??? ProcScr_efxShineBG
// extern ??? TsaArray_ShineBg_Left
// extern ??? TsaArray_ShineBg_Right
// extern ??? ImgArray_ShineBg
// extern ??? ProcScr_efxShineBG2
// extern ??? TsaArray_ShineBg2
// extern ??? ProcScr_efxShineBGCOL
// extern ??? ProcScr_efxShineOBJRND
// extern ??? gShineSpriteCoords
// extern ??? ProcScr_efxShineOBJ
// extern ??? ProcScr_efxLuna
// extern ??? ProcScr_efxLunaBG
// extern ??? TsaArray_LunaBg1
// extern ??? ProcScr_efxLunaSCR
// extern ??? ProcScr_efxLunaSCR2
// extern ??? gLunaBgScrollOffsets
// extern ??? ProcScr_efxLunaBG2
// extern ??? ProcScr_efxLunaBGCOL
// extern ??? ProcScr_efxLunaBG3
// extern ??? TsaArray_LunaBg3
// extern ??? ImgArray_LunaBg3
// extern ??? ProcScr_efxLunaOBJ
// extern ??? ProcScr_efxLunaRST
// extern ??? ProcScr_efxExcalibur
// extern ??? ProcScr_efxExcaliburBG
// extern ??? ProcScr_efxExcaliburBGCOL
// extern ??? ProcScr_efxExcaliburSCR
// extern ??? ProcScr_efxExcaliburSCR2
// extern ??? gExcaliburBgScrollOffsets
// extern ??? ProcScr_efxExcaliburBG2
// extern ??? ProcScr_efxExcaliburBGCOL2
// extern ??? ProcScr_efxExcaliburBG3
// extern ??? ProcScr_efxExcaliburBGCOL3
// extern ??? ProcScr_efxExcaliburOBJ
// extern ??? ProcScr_efxExcaliburBG0
// extern ??? ImgArray_efxExcaliburBG0
// extern ??? TsaArray_efxExcaliburBG0
// extern ??? ProcScr_efxGespenstBG4
// extern ??? ProcScr_efxGespenstBGCOL2
// extern ??? ProcScr_efxOura
// extern ??? ProcScr_efxOuraBG
// extern ??? TsaArray_AuraBg1
// extern ??? ProcScr_efxOuraBG2
// extern ??? ProcScr_efxOuraBGCOL
// extern ??? ProcScr_efxOuraBG3
// extern ??? TsaArray_AuraBg3
// extern ??? ImgArray_AuraBg3
// extern ??? ProcScr_efxSuperdruidBG3
// extern ??? ImgArray_EreshkigalBg3
// extern ??? TsaArray_EreshkigalBg3
// extern ??? ProcScr_efxSuperdruidOBJ2
// extern ??? ProcScr_efxDancepara
// extern ??? ProcScr_efxIvaldi
// extern ??? ProcScr_efxIvaldiBG1
// extern ??? TsaArray_IvaldiBg1
// extern ??? ProcScr_efxIvaldiBG2
// extern ??? TsaArray_IvaldiBg2
// extern ??? ProcScr_efxIvaldiBG3
// extern ??? TsaArray_IvaldiBg3
// extern ??? ImgArray_IvaldiBg3
// extern ??? PalArray_IvaldiBg3
// extern ??? ProcScr_efxIvaldiBG4
// extern ??? TsaArray_IvaldiBg4
// extern ??? ProcScr_efxIvaldiOBJFall
// extern ??? ProcScr_efxIvaldiOBJSideWash
// extern ??? ProcScr_efxIvaldiOBJUprise
// extern ??? ProcScr_efxIvaldiOBJ1
// extern ??? ProcScr_efxIvaldiOBJ2
// extern ??? ProcScr_efxIvaldiWOUT

void StartSpellAnimation(struct Anim * anim);
// ??? sub_805B3FC(???);

void sub_805B94C(ProcPtr proc);
void sub_805B958(struct ProcEfx * proc);
void NewEfxALPHA(struct Anim * anim, int a, int b, int c, int d, int e);
void EfxALPHAMain(struct ProcEfxALPHA * proc);
void sub_805BB24(struct Anim * anim, int terminator, u16 * c, u16 d, u16 e);
void EfxCircleWINMain(struct ProcEfxCircleWIN * proc);
void StartSpellThing_MagicQuake(struct Anim *, int, int);
void Loop6C_efxMagicQUAKE(struct ProcEfxMagicQuake * proc);
void StartSpellAnimDummy(struct Anim * anim);
void EfxDummymagicMain(struct ProcEfx * proc);
void StartSpellAnimHandAxe(struct Anim * anim);
void EfxTeonoMain(struct ProcEfx * proc);
void NewEfxTeonoOBJ(struct Anim * anim);
void EfxTeonoObjMain(struct ProcEfxMagicOBJ * proc);
void EfxTeonoObjEnd(struct ProcEfxMagicOBJ * proc);
void NewEfxTeonoOBJ2(struct Anim * anim);
void EfxTeonoObj2Main(struct ProcEfxMagicOBJ * proc);
ProcPtr NewEfxTeonoSE(struct Anim * anim, struct Anim * anim2);
void EfxTeonoSeCallBack(struct ProcEfxMagicOBJ * proc);
void EfxTeonoSeMain(struct ProcEfxMagicOBJ * proc);
void StartSpellAnimArrow(struct Anim * anim);
void EfxArrowMain(struct ProcEfx * proc);
void NewEfxArrowOBJ(struct Anim * anim);
void EfxArrowObjMain(struct ProcEfxMagicOBJ * proc);
void StartSpellAnimJavelin(struct Anim * anim);
void StartSpellAnimJavelinCavalier(struct Anim * anim);
void StartSpellAnimJavelinSoldier(struct Anim * anim);
void StartSpellAnimJavelinPaladin(struct Anim * anim);
void StartSpellAnimJavelinPegasusKnight(struct Anim * anim);
void StartSpellAnimJavelinFalcon(struct Anim * anim);
void StartSpellAnimJavelinWyvernRider(struct Anim * anim);
void StartSpellAnimJavelinWyvernLord(struct Anim * anim);
void StartSpellAnimJavelinGenerial(struct Anim * anim);
void StartSpellAnimJavelinUnk(struct Anim * anim);
void StartSpellAnimJavelinPaladinF(struct Anim * anim);
void EfxTeyariMain(struct ProcEfx * proc);
void NewEfxTeyariOBJ(struct Anim * anim, int type);
void EfxTeyariObjMain(struct ProcEfxMagicOBJ * proc);
void StartSpellAnimSong(struct Anim * anim);
void efxSong_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxSongBG(struct Anim * anim, int kind);
void efxSongBG_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxSongOBJ(struct Anim * anim, int kind);
void efxSongOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimDance(struct Anim * anim);
void efxDance_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimBallista(struct Anim * anim);
void efxShooter_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxShooterOBJ(struct Anim * anim);
void efxShooterOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimEckesachsRanged_Null(struct Anim * anim);
void StartSpellAnimBindingBlade(struct Anim * anim);
void efxHurtmut_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxHurtmutOBJ(struct Anim * anim);
void efxHurtmutOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimFireBreath(struct Anim * anim);
void efxFirebreath_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxFirebreathOBJ(struct Anim * anim);
void efxFirebreathOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFirebreathBG(struct Anim * anim);
void efxFirebreathBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxFirebreathBGCOL(struct Anim * anim);
void efxFirebreathBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSpellAnimIceBreath(struct Anim * anim);
void efxIcebreath_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxIcebreathOBJ(struct Anim * anim);
void efxIcebreathOBJ_OnEnd(struct ProcEfxOBJ * proc);
void StartSpellAnimDarkBreath(struct Anim * anim);
void efxDarkbreath_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxDarkbreathBG(struct Anim * anim);
void efxDarkbreathBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxDarkbreathBGCOL(struct Anim * anim);
void efxDarkbreathBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxDarkbreathOBJ(struct Anim * anim);
void efxDarkbreathOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimThunder(struct Anim * anim);
void Loop6C_efxThunder(struct ProcEfx * proc);
void NewEfxThunderBG(struct Anim * anim);
void EfxThunderBGMain(struct ProcEfxBG * proc);
void NewEfxThunderBGCOL(struct Anim * anim);
void EfxThunderBGCOL_Loop(struct ProcEfxBGCOL * proc);
void NewEfxThunderOBJ(struct Anim * anim);
void EfxThunderOBJMain(struct ProcEfxOBJ * proc);
void StartSpellAnimFire(struct Anim * anim);
void StartSpellAnimElfire(struct Anim * anim);
void Loop6C_efxFire(struct ProcEfx * proc);
void NewEfxFireBG(struct Anim * anim);
void Loop6C_efxFireBG(struct ProcEfxBG * proc);
void NewEfxFireOBJ(struct Anim * anim);
void EfxFireOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFireHITBG(struct Anim * anim);
void sub_805DE74(struct ProcEfxBG * proc);
void StartSubSpell_efxElfireBG(struct Anim * anim);
void EfxElfireBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxElfireBGCOL(struct Anim * anim);
void EfxElfireBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxElfireOBJ(struct Anim * anim);
void EfxElfireObj_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimFimbulvetr(struct Anim * anim);
void efxFimbulvetr_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxFimbulvetrBGTR(struct Anim * anim);
void efxFimbulvetrBGTR_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxFimbulvetrBG(struct Anim * anim);
void efxFimbulvetrBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxFimbulvetrOBJ(struct Anim * anim);
void efxFimbulvetrOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFimbulvetrOBJ2(struct Anim * anim);
void efxFimbulvetrOBJ2_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFimbulvetrOBJ2Fall(struct Anim * anim, int unk);
void efxFimbulvetrOBJ2Fall_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimBolting(struct Anim * anim);
void efxThunderstorm_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxThunderstormBG(struct Anim * anim);
void efxThunderstormBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxThunderstormOBJ(struct Anim * anim);
void efxThunderstormOBJ_Loop(struct ProcEfxOBJ * proc);
void efxThunderstormOBJ_End(struct ProcEfxOBJ * proc);
void StartSubSpell_efxThunderstormCOLOR(struct Anim * anim);
void efxThunderstormColor_Loop_A(struct ProcEfxBGCOL * proc);
void efxThunderstormColor_Loop_B(struct ProcEfxBGCOL * proc);
void efxThunderstormColor_Loop_C(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxThunderstormDARK(struct Anim * anim, int timer, int terminator);
void efxThunderstormDark_Loop_A(struct ProcEfxBGCOL * proc);
void efxThunderstormDark_Loop_B(struct ProcEfxBGCOL * proc);
void StartSpellAnimAircalibur(struct Anim * anim);
void efxAlacalibur_Loop_Main(struct ProcEfx * proc);
void sub_805ECD4(struct Anim * anim);
void efxAlacaliburBG_Loop(struct ProcEfxBG * proc);
void sub_805ED98(struct Anim * anim);
void efxAlacaliburBGCOL_Loop(struct ProcEfxBGCOL * proc);
void sub_805EE24(struct Anim * anim);
void efxAlacaliburOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimFlux(struct Anim * anim);
void efxMistyRain_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxMistyrainBG(struct Anim * anim);
void StartSubSpell_efxMistyrainBG2(struct Anim * anim);
void efxMistyRainBg_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxMistyRainOBJ(struct Anim * anim);
struct ProcEfxOBJ * StartSubSpell_efxMistyrainOBJ2(struct Anim * anim);
void efxMistyRainObj_OnEnd(struct ProcEfxOBJ * proc);
void efxMistyRainObj_805F24C(struct ProcEfxOBJ * proc);
void efxMistyRainObj_805F288(struct ProcEfxOBJ * proc);
void efxMistyRainObj_805F2C4(struct ProcEfxOBJ * proc);
void efxMistyRainObj2_805F300(struct ProcEfxOBJ * proc);
void efxMistyRainObj2_805F32C(struct ProcEfxOBJ * proc);
void StartSpellAnimNosferatu(struct Anim * anim);
void efxResire_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxResireBG(struct Anim * anim, int unk);
void StartSubSpell_efxResireBG2(struct Anim * anim);
void efxResireBG_Loop_A(struct ProcEfxBG * proc);
void efxResireBG_Loop_B(struct ProcEfxBG * proc);
void efxResireBG_Loop_C(struct ProcEfxBG * proc);
void efxResireBG_Loop_D(struct ProcEfxBG * proc);
void efxResireBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxResireRST(struct Anim * anim, ProcPtr b, int c);
void efxResireRST_Loop(struct ProcEfxRST * proc);
void StartSpellAnimLightning(struct Anim * anim);
void efxLightning_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxLightningBG(struct Anim * anim);
void efxLightningBG_Loop(struct ProcEfxBG * proc);
void StartSpellAnimPurge(struct Anim * anim);
void sub_805FB24(int location, int type);
void efxPurge_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxPurgeBG(struct Anim * anim);
void efxPurgeBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxPurgeOBJRND(struct Anim * anim);
void efxPurgeOBJRND_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxPurgeOBJ(struct Anim * anim, int x, int y);
void efxPurgeOBJ_OnEnd(struct ProcEfxOBJ * proc);
void StartSpellAnim_805FE80_Null(struct Anim * anim);
void StartSpellAnimDivine(struct Anim * anim);
void efxDivine_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxDivineBG(struct Anim * anim);
void StartSubSpell_efxDivineBG_2(struct Anim * anim);
void StartSubSpell_efxDivineBG_3(struct Anim * anim);
void efxDivineBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxDivineOBJ(struct Anim * anim);
void efxDivineOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnim_8060284_Null(struct Anim * anim);
void StartSpellAnim_8060288_Null(struct Anim * anim);
void StartSpellAnimEclipse(struct Anim * anim);
void efxHazymoon_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxHazymoonBG_A(struct Anim * anim);
void StartSubSpell_efxHazymoonBG_B(struct Anim * anim);
void StartSubSpell_efxHazymoonBG_C(struct Anim * anim);
void efxHazymoonBG_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxHazymoonOBJ2(struct Anim * anim);
void efxHazymoonOBJ2_OnEnd(struct ProcEfxOBJ * proc);
void efxHazymoonOBJ2_Loop_A(struct ProcEfxOBJ * proc);
void efxHazymoonOBJ2_Loop_B(struct ProcEfxOBJ * proc);
void efxHazymoonOBJ2_Loop_C(struct ProcEfxOBJ * proc);
void StartSubSpell_efxHazymoonOBJ3(struct Anim * anim);
void efxHazymoonOBJ3_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxHazymoonOBJ3RND(struct Anim * anim, int x, int y);
void efxHazymoonOBJ3RND_OnEnd(struct ProcEfxOBJ * proc);
void StartSpellAnimFenrir(struct Anim * anim);
void efxFenrir_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxFenrirBG(struct Anim * anim, int terminator);
void efxFenrirBG_OnEnd(void);
void efxFenrirBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxFenrirBGCOL(struct Anim * anim, int terminator);
void efxFenrirBGCOL_OnEnd(void);
void efxFenrirBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxFenrirOBJ(struct Anim * anim, int terminator);
void efxFenrirOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFenrirBG2_A(struct Anim * anim);
void StartSubSpell_efxFenrirBG2_B(struct Anim * anim);
void efxFenrirBG2_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxFenrirOBJ2(struct Anim * anim);
void efxFenrirOBJ2_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxFenrirOBJ2Chiri(struct Anim * anim, int idx);
void efxFenrirOBJ2Chiri_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimHeal(struct Anim * anim);
void efxLive_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimMend(struct Anim * anim);
void efxRelive_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimRecover(struct Anim * anim);
void efxRecover_Loop_Main(struct ProcEfx * proc);
void StartSpellAnimPhysic(struct Anim * anim);
void efxReblow_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxLiveBG_A(struct Anim * anim, u32 kind);
void StartSubSpell_efxLiveBG_B(struct Anim * anim, u32 kind);
void efxLiveBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLiveBGCOL_A(struct Anim * anim, u32 kind);
void StartSubSpell_efxLiveBGCOL_B(struct Anim * anim, u32 kind);
void efxLiveBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxLiveALPHA(struct Anim * anim, int timer, int c, int d);
void efxLiveALPHA_Loop_A(struct ProcEfxALPHA * proc);
void efxLiveALPHA_Loop_B(struct ProcEfxALPHA * proc);
void StartSubSpell_efxLiveOBJ(struct Anim * anim);
void StartSubSpell_efxReserveOBJ(struct Anim * anim);
void efxLiveOBJ_Loop(struct ProcEfxOBJ * proc);
void efxReserveOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxReserveOBJ_Loop_B(struct ProcEfxOBJ * proc);
void StartSubSpell_efxReblowOBJ(struct Anim * anim, u32 kind);
void efxReblowOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxReblowOBJ_Loop_B(struct ProcEfxOBJ * proc);
void StartSpellAnimFortify(struct Anim * anim);
void StartSpellAnimLatona(struct Anim * anim);
void efxReserve_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxReserveBG(struct Anim * anim);
void efxReserveBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxReserveBGCOL(struct Anim * anim, u32 kind);
void efxReserveBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxReserveBG2(struct Anim * anim);
void efxReserveBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxReserveBGCOL2(struct Anim * anim, u32 kind);
void efxReserveBGCOL2_Loop(struct ProcEfxBGCOL * proc);
void StartSpellAnimRestore(struct Anim * anim);
void efxRest_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxRestBG(struct Anim * anim);
void efxRestBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxRestOBJ(struct Anim * anim);
void efxRestOBJ_Loop(void);
void StartSpellAnimSilence(struct Anim * anim);
void efxSilence_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxSilenceBG(struct Anim * anim);
void efxSilenceBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxSilenceOBJ(struct Anim * anim);
void efxSilenceOBJ_OnEnd(struct ProcEfxOBJ * proc);
void StartSpellAnimSleep(struct Anim * anim);
void efxSleep_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxSleepBG(struct Anim * anim);
void efxSleepBG_Loop(struct ProcEfxBG * proc);
void sub_8062898(struct Anim * anim);
void StartSubSpell_efxSleepOBJ2(struct Anim * anim);
void efxSleepOBJ_OnEnd(void);
void StartSubSpell_efxSleepSE(struct Anim * anim);
void efxSleepSE_PlaySE(struct ProcEfx * proc);
void efxSleepSE_OnEnd(void);
void StartSpellAnimHammerne(struct Anim * anim);
void efxHammarne_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxHammarneBG(struct Anim * anim);
void efxHammarneBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxHammarneOBJ(struct Anim * anim);
void efxHammarneOBJ_OnEnd(void);
void StartSpellAnimBerserk(struct Anim * anim);
void efxBerserk_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxBerserkBG(struct Anim * anim, int terminator);
void efxBerserkBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxBerserkCLONE(struct Anim * anim, int terminator);
void efxBerserkCLONE_Loop(struct ProcEfxBG * proc);
void efxBerserkCLONE_OnEnd(void);
void StartSubSpell_efxBerserkOBJ(struct Anim * anim);
void efxBerserkOBJ_OnEnd(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_C(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_E(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_G(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_I(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_B(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_D(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_F(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_H(struct ProcEfxOBJ * proc);
void efxBerserkOBJ_Loop_J(struct ProcEfxOBJ * proc);
void StartSpellAnimBarrier(struct Anim * anim);
void efxMshield_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxMshieldBG(struct Anim * anim);
void efxMshieldBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxMshieldBGOBJ(struct Anim * anim);
void StartSubSpell_efxMshieldBGOBJ2(struct Anim * anim);
void efxMshieldBGOBJ_OnEnd(struct ProcEfxOBJ * proc);
void StartSpellAnimShine(struct Anim * anim);
void efxShine_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxShineBG(struct Anim * anim);
void efxShineBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxShineBG2(struct Anim * anim);
void efxShineBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxShineBGCOL(struct Anim * anim);
void efxShineBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxShineOBJRND(struct Anim * anim);
void efxShineOBJRND_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxShineOBJ(struct Anim * anim, int x, int y);
void efxShineOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimLuna(struct Anim * anim);
void efxLuna_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxLunaBG(struct Anim * anim);
void efxLunaBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLunaSCR(void);
void efxLunaSCR_Loop(struct ProcEfx * proc);
void StartSubSpell_efxLunaSCR2(ProcPtr proc);
void efxLunaSCR2_Loop(struct ProcEfxSCR * proc);
void StartSubSpell_efxLunaBG2(struct Anim * anim, int terminator);
void efxLunaBG2_OnEnd(void);
void efxLunaBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLunaBGCOL(struct Anim * anim, int terminator);
void efxLunaBGCOL_OnEnd(void);
void efxLunaBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxLunaBG3(struct Anim * anim);
void efxLunaBG3_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxLunaOBJ(struct Anim * anim);
void efxLunaOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxLunaOBJ_Loop_B(struct ProcEfxOBJ * proc);
void efxLunaOBJ_Loop_C(struct ProcEfxOBJ * proc);
void efxLunaOBJ_Loop_D(struct ProcEfxOBJ * proc);
void StartSubSpell_efxLunaRST(struct Anim * anim, ProcPtr b, int c);
void efxLunaRST_Loop(struct ProcEfxRST * proc);
void StartSpellAnimExcalibur(struct Anim * anim);
void efxExcalibur_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxExcaliburBG(struct Anim * anim);
void efxExcaliburBG_OnEnd(void);
void efxExcaliburBG_Loop_A(struct ProcEfxBG * proc);
void efxExcaliburBG_Loop_B(struct ProcEfxBG * proc);
void efxExcaliburBG_Loop_C(struct ProcEfxBG * proc);
void StartSubSpell_efxExcaliburBGCOL(struct Anim * anim);
void efxExcaliburBGCOL_OnEnd(void);
void efxExcaliburBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxExcaliburSCR(int unk);
void efxExcaliburSCR_Loop(struct ProcEfx * proc);
void StartSubSpell_efxExcaliburSCR2(struct ProcEfx * proc, int b);
void efxExcaliburSCR2_Loop(struct ProcEfxSCR * proc);
void StartSubSpell_efxExcaliburBG2(struct Anim * anim);
void efxExcaliburBG2_OnEnd(void);
void efxExcaliburBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxExcaliburBGCOL2(struct Anim * anim);
void efxExcaliburBGCOL2_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxExcaliburBG3(struct Anim * anim);
void efxExcaliburBG3_OnEnd(void);
void efxExcaliburBG3_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxExcaliburBGCOL3(struct Anim * anim);
void efxExcaliburBGCOL3_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxExcaliburOBJ(struct Anim * anim);
void efxExcaliburOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxExcaliburBG0(struct Anim * anim);
void efxExcaliburBG0_Loop(struct ProcEfxBG * proc);
void StartSpellAnimGespenst_Null(struct Anim * anim);
void StartSubSpell_efxGespenstBG4(struct Anim * anim, int terminator);
void efxGespenstBG4_OnEnd(void);
void efxGespenstBG4_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxGespenstBGCOL2(struct Anim * anim);
void efxGespenstBGCOL2_Loop(struct ProcEfxBGCOL * proc);
void StartSpellAnimAura(struct Anim * anim);
void efxOura_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxOuraBG_A(struct Anim * anim);
void StartSubSpell_efxOuraBG_B(struct Anim * anim);
void StartSubSpell_efxOuraBG_C(struct Anim * anim);
void efxOuraBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxOuraBG2(struct Anim * anim);
void efxOuraBG2_OnEnd(void);
void efxOuraBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxOuraBGCOL(struct Anim * anim);
void efxOuraBGCOL_Loop(struct ProcEfxBGCOL * proc);
void StartSubSpell_efxOuraBG3(struct Anim * anim);
void efxOuraBG3_Loop(struct ProcEfxBG * proc);
void StartSpellAnimLuce_Null(struct Anim * anim);
void StartSpellAnimEreshkigal_Null(struct Anim * anim);
void StartSubSpell_efxSuperdruidBG3(struct Anim * anim);
void efxSuperdruidBG3_Loop(struct ProcEfxEclipseBG * proc);
void StartSubSpell_efxSuperdruidOBJ2(struct Anim * anim);
void efxSuperdruidOBJ2_OnEnd(void);
void StartSpellAnimFillasMight(struct Anim * anim);
void StartSpellAnimThorsIre(struct Anim * anim);
void StartSpellAnimNinisGrace(struct Anim * anim);
void StartSpellAnimSetsLitany(struct Anim * anim);
void efxDancepara_Loop(struct ProcEfx * proc);
void StartSpellAnimIvaldi(struct Anim * anim);
void efxIvaldi_Loop_Main(struct ProcEfx * proc);
void StartSpellBG_IvaldiBG1(struct Anim * anim);
void efxIvaldiBG1_Loop(struct ProcEfxBG * proc);
void StartSpellBG_IvaldiBG2(struct Anim * anim);
void efxIvaldiBG2_Loop(struct ProcEfxBG * proc);
void StartSpellBG_IvaldiBG3(struct Anim * anim);
void efxIvaldiBG3_Loop(struct ProcEfxBG * proc);
void StartSpellBG_IvaldiBG4(struct Anim * anim);
void efxIvaldiBG4_Loop(struct ProcEfxBG * proc);
void PrepareSomeIvaldiParticleGraphics(void);
void StartSpellOBJ_IvaldiFall(struct Anim * anim, int terminator);
void efxIvaldiOBJFall_Loop(struct ProcEfxOBJ * proc);
void StartSpellOBJ_IvaldiSideWash(struct Anim * anim, int terminator);
void efxIvaldiOBJSideWash_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxIvaldiOBJUprise(struct Anim * anim, int terminator);
void efxIvaldiOBJUprise_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxIvaldiOBJ1(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind);
void efxIvaldiOBJ1_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxIvaldiOBJ2(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind);
void efxIvaldiOBJ2_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxIvaldiWOUT(struct Anim * anim, int duration, int terminator);
void efxIvaldiWOUT_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimDemonLight(struct Anim * anim);
void efxMaohFlash_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxMaohFlashBG1(struct Anim * anim);
void efxMaohFlashBG1_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxMaohFlashBG2(struct Anim * anim);
void efxMaohFlashBG2_Loop(struct ProcEfxBG * proc);
void sub_80668DC(void);
void sub_8066914(struct Anim * anim);
void efxMaohFlashBG3_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxMaohFlashBG4(struct Anim * anim);
void efxMaohFlashBG4_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxMaohFlashWOUT(struct Anim * anim, int unused, int terminator);
void efxMaohFlashWOUT_Loop_A(struct ProcEfxOBJ * proc);
void efxMaohFlashWOUT_Loop_B(struct ProcEfxOBJ * proc);
void StartSubSpell_efxMaohFlashBGCOL(struct Anim * anim);
void efxMaohFlashBGCOL_Loop(struct ProcEfxBGCOL * proc);
int sub_8066C74(int pos);
void sub_8066C98(void);
void StartSubSpell_efxMaohFlashEyeROBJ2(struct Anim * anim, int terminator, s16 x, s16 y);
void efxMaohFlashEyeROBJ2_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxMaohFlashEyeLOBJ2(struct Anim * anim, int terminator, s16 x, s16 y);
void efxMaohFlashEyeLOBJ2_Loop(struct ProcEfxOBJ * proc);
void sub_8066EA8(void);
void StartSubSpell_efxMaohFlashEyeOBJ1(struct Anim * anim, int terminator, s16 x, s16 y);
void efxMaohFlashEyeOBJ1_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxMaohFlashEyeFire1OBJ1(struct Anim * anim, int terminator, s16 x, s16 y);
void efxMaohFlashEyeFire1OBJ1_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxMaohFlashEyeFire2OBJ1(struct Anim * anim, int terminator, s16 x, s16 y);
void efxMaohFlashEyeFire2OBJ1_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxMaohFlashThunderOBJ(struct Anim * anim, int terminator);
void efxMaohFlashThunderOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxMaohFlashThunderOBJ2(struct Anim * anim, int terminator, s16 x, s16 y);
void efxMaohFlashThunderOBJ2_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimStone(struct Anim * anim);
void efxStone_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxStoneBG(struct Anim * anim);
void efxStoneBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxStoneOBJ(struct Anim * anim, int terminator);
void efxStoneOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimEvilEye(struct Anim * anim);
void efxEvilEye_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxEvilEyeBG(struct Anim * anim);
void efxEvilEyeBG_Loop(struct ProcEfxBG * proc);
void sub_8067984(struct Anim * anim);
void efxEvilEyeBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxEvilEyeOBJ(struct Anim * anim, int terminator);
void efxEvilEyeOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSpellAnimNaglfar(struct Anim * anim);
void efxNaglfar_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxNaglfarBG(struct Anim * anim);
void efxNaglfarBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxNaglfarBG2(struct Anim * anim);
void efxNaglfarBG2_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxNaglfarBG3(struct Anim * anim);
void efxNaglfarBG3_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxNaglfarBG4(struct Anim * anim);
void efxNaglfarBG4_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxNaglfarOBJ(struct Anim * anim, int terminator, s16 x, s16 y, u8 pos, u8 index);
void efxNaglfarOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxNaglfarOBJ2(struct Anim * anim, int terminator, u8 c);
void efxNaglfarOBJ2_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxNaglfarOBJRockGyre(struct Anim * anim, int terminator);
void efxNaglfarOBJRockGyre_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxNaglfarBlack(struct Anim * anim, int b, int c);
void efxNaglfarBlack_Loop_A(struct ProcEfx * proc);
void efxNaglfarBlack_Loop_B(struct ProcEfx * proc);
void efxNaglfarBlack_Loop_C(struct ProcEfx * proc);
void efxNaglfarBlack_Loop_D(struct ProcEfx * proc);
void StartSpellAnimWretchedAir(struct Anim * anim);
void efxDrzDrakbreath_Loop_Main(struct ProcEfx * proc);
void StartSubSpell_efxDrzDrakbreathOBJ(struct Anim * anim);
void efxDrzDrakbreathOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxDrzDrakbreathBG(struct Anim * anim);
void efxDrzDrakbreathBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxDrzDrakbreathBGCOL(struct Anim * anim);
void efxDrzDrakbreathBGCOL_Loop(struct ProcEfxBGCOL * proc);
void sub_8068AFC(struct Anim * anim, u16 * tsaL, u16 * tsaR, u8 unk);
void StartSpellAnimGleipnir(struct Anim * anim);
void efxDarkGrado_Loop_Main(struct ProcEfx * proc);
void efxDarkGradoMapFadeOut_Loop(struct ProcEfx * proc);
void StartSubSpell_efxDarkGradoMapFadeOut(void);
void sub_8068D9C(void);
void sub_8068DD8(void);
void sub_8068E14(void);
void sub_8068E50(void);
void sub_8068E8C(void);
void sub_8068EC8(void);
void sub_8068F04(void);
void sub_8068F40(void);
void sub_8068F7C(void);
void sub_8068FB8(void);
void sub_8068FF4(void);
void sub_8069030(void);
void sub_806906C(void);
void sub_80690A8(void);
void sub_80690E4(void);
void efxDarkGradoBG01_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxDarkGradoBG01(struct Anim * anim);
void efxDarkGradoBG02_Loop_A(struct ProcEfxBG * proc);
void efxDarkGradoBG02_80693CC(struct ProcEfxBG * proc);
void efxDarkGradoBG02_Loop_B(struct ProcEfxBG * proc);
void StartSubSpell_efxDarkGradoBG02(struct Anim * anim);
// ??? sub_8069528(???);
// ??? sub_8069530(???);
void sub_80696F0(void);
int sub_8069704(int a, int b, int c);
int sub_806977C(int a, int b, int c);
void efxDarkGradoOBJ01piece_Loop(struct ProcEfxOBJ * proc);
void NewEfxDarkGradoOBJ01piece(struct Anim * anim, s16 b, s16 c, s16 d, u16 e);
void efxDarkGradoOBJ01_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxDarkGradoOBJ01(struct Anim * anim);
void efxDarkGradoOBJ02piece_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxDarkGradoOBJ02piece_A(struct Anim * anim, int xOffset, int yPosition, int unk, int terminator);
void StartSubSpell_efxDarkGradoOBJ02piece_B(struct Anim * anim, int xOffset, int yPosition, int unk, int terminator);
void efxDarkGradoOBJ02_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxDarkGradoOBJ02(struct Anim * anim);
void StartSpellAnimCrimsonEye(struct Anim * anim);
void efxCrimsonEye_Loop_Main(struct ProcEfx * proc);
void efxCrimsonEyeBGFinish1_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxCrimsonEyeBGFinish1(struct Anim * anim);
void efxCrimsonEyeOBJFinishPiece_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxCrimsonEyeOBJFinishPiece(struct Anim * anim, int terminator, u8 c, s8 flag);
void efxCrimsonEyeOBJFinish_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxCrimsonEyeOBJFinish(struct Anim * anim);
void StartSubSpell_efxGorgonBGFinish_(struct Anim * anim);
void efxCrimsonEyeBG_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxCrimsonEyeBG(struct Anim * anim);
int sub_806A560(int a);
void sub_806A578(struct Anim * anim, u32 b);
void sub_806A590(int index, int denom, int c);
int sub_806A634(int index, int b);
int sub_806A64C(int index, int b);
int sub_806A664(int a, int b);
int sub_806A6C4(int a, int b);
void sub_806A6FC(int index, int b, int c);
void efxCrimsonEyeOBJ_Loop_A(struct ProcEfxOBJ * proc);
void efxCrimsonEyeOBJ_Loop_B(struct ProcEfxOBJ * proc);
void efxCrimsonEyeOBJ_Loop_C(struct ProcEfxOBJ * proc);
void efxCrimsonEyeOBJ_Loop_D(struct ProcEfxOBJ * proc);
void StartSubSpell_efxCrimsonEyeOBJ(struct Anim * anim);
void StartSpellAnimShadowshot(struct Anim * anim);
void efxDarkLongMons_Loop_Main(struct ProcEfx * proc);
void OnHBlank_806B088(void);
void efxDarkLongMonsBG01_Loop_A(struct ProcEfxBG * proc);
void efxDarkLongMonsBG01_Loop_B(struct ProcEfxBG * proc);
void StartSubSpell_efxDarkLongMonsBG01(struct Anim * anim);
void efxDarkLongMonsBG02_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxDarkLongMonsBG02(struct Anim * anim);
void efxDarkLongMonsOBJ_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxDarkLongMonsOBJ(struct Anim * anim);
// ??? sub_806B33C(???);
// ??? sub_806B344(???);
void sub_806B4E4(void);
void StartSpellAnimDemonSurge(struct Anim * anim);
void efxGorgon_Loop_Main(struct ProcEfx * proc);
void sub_806B64C(struct ProcEfxOBJ * proc);
void sub_806B664(struct ProcEfxOBJ * proc);
void StartSubSpell_efxGorgon_806B680(struct Anim * anim);
void efxGorgonBGDirt_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxGorgonBGDirt(struct Anim * anim);
void efxGorgonBGTwister_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxGorgonBGTwister(struct Anim * anim);
// ??? sub_806B938(???);
// ??? sub_806B940(???);
// ??? sub_806BACC(???);
void sub_806BBDC(void);
void efxGorgonOBJTwisterPiece_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxGorgonOBJTwisterPiece(struct Anim * anim, int flag, int c, int terminator);
void efxGorgonOBJTwister_Loop(struct ProcEfxOBJ * proc);
void StartSubSpell_efxGorgonOBJTwister(struct Anim * anim);
void efxGorgonBGFinish_Loop(struct ProcEfxBG * proc);
void StartSubSpell_efxGorgonBGFinish(struct Anim * anim);
// ??? sub_806C14C(???);
// ??? sub_806C154(???);
// ??? sub_806C1B8(???);
// ??? sub_806C2D4(???);
void sub_806C464(void);
// ??? sub_806C478(???);
void sub_806C608(void);
