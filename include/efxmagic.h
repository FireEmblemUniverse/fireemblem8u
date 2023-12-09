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
// extern ??? gUnknown_085D5188
// extern ??? gUnknown_085D51F4
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
// extern ??? gUnknown_085D5358
// extern ??? gUnknown_085D5370
// extern ??? gUnknown_085D5390
// extern ??? gUnknown_085D53A8
// extern ??? gUnknown_085D53C0
// extern ??? gUnknown_085D53F0
extern struct ProcCmd ProcScr_efxDarkbreathOBJ[];
extern struct ProcCmd ProcScr_efxThunder[];
extern struct ProcCmd ProcScr_efxThunderBG[];
extern u16 *gUnknown_085D5458[2];
extern u16 *gUnknown_085D5460[2];
extern struct ProcCmd ProcScr_efxThunderBGCOL[];
extern struct ProcCmd ProcScr_efxThunderOBJ[];
extern struct ProcCmd ProcScr_efxFire[];
extern struct ProcCmd ProcScr_efxFireBG[];
extern u16 *gUnknown_085D54D0[];
extern u16 *gUnknown_085D5500[];
extern struct ProcCmd ProcScr_efxFireOBJ[];
extern struct ProcCmd ProcScr_efxFireHITBG[];
extern u16 *gUnknown_085D5560[];
extern u16 *gUnknown_085D55B4[];
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
// extern ??? gUnknown_085D6644
// extern ??? gUnknown_085D665C
// extern ??? ProcScr_efxFenrirBGCOL
// extern ??? gUnknown_085D66A4
// extern ??? ProcScr_efxFenrirBG2
// extern ??? gUnknown_085D66D4
// extern ??? gUnknown_085D67A0
// extern ??? ProcScr_efxFenrirOBJ2
// extern ??? gUnknown_085D6884
// extern ??? gUnknown_085D689C
// extern ??? ProcScr_efxLive
// extern ??? ProcScr_efxRelive
// extern ??? ProcScr_efxRecover
// extern ??? ProcScr_efxReblow
// extern ??? ProcScr_efxLiveBG
// extern ??? gUnknown_085D6934
// extern ??? gUnknown_085D6954
// extern ??? ProcScr_efxLiveOBJ
// extern ??? ProcScr_efxReserveOBJ
// extern ??? ProcScr_efxReblowOBJ
// extern ??? ProcScr_efxReserve
// extern ??? ProcScr_efxReserveBG
// extern ??? gUnknown_085D69FC
// extern ??? gUnknown_085D6A0C
// extern ??? gUnknown_085D6A2C
// extern ??? gUnknown_085D6A44
// extern ??? gUnknown_085D6A48
// extern ??? ProcScr_efxRest
// extern ??? gUnknown_085D6A80
// extern ??? gUnknown_085D6A98
// extern ??? gUnknown_085D6ACC
// extern ??? ProcScr_efxRestOBJ
// extern ??? gUnknown_085D6B20
// extern ??? gUnknown_085D6B38
// extern ??? gUnknown_085D6B50
// extern ??? gUnknown_085D6B98
// extern ??? gUnknown_085D6BB8
// extern ??? gUnknown_085D6BD0
// extern ??? gUnknown_085D6BE8
// extern ??? gUnknown_085D6C28
// extern ??? ProcScr_efxSleepOBJ2
// extern ??? ProcScr_efxSleepSE
// extern ??? ProcScr_efxHammarne
// extern ??? ProcScr_efxHammarneBG
// extern ??? gUnknown_085D6CE0
// extern ??? gUnknown_085D6D14
// extern ??? ProcScr_efxHammarneOBJ
// extern ??? ProcScr_efxBerserk
// extern ??? ProcScr_efxBerserkBG
// extern ??? ProcScr_efxBerserkCLONE
// extern ??? ProcScr_efxBerserkOBJ
// extern ??? ProcScr_efxMshield
// extern ??? ProcScr_efxMshieldBG
// extern ??? gUnknown_085D6EA0
// extern ??? ProcScr_efxMshieldBGOBJ
// extern ??? ProcScr_efxMshieldBGOBJ2
// extern ??? ProcScr_efxShine
// extern ??? ProcScr_efxShineBG
// extern ??? gUnknown_085D6F24
// extern ??? gUnknown_085D6F28
// extern ??? gUnknown_085D6F2C
// extern ??? ProcScr_efxShineBG2
// extern ??? gUnknown_085D6F48
// extern ??? ProcScr_efxShineBGCOL
// extern ??? ProcScr_efxShineOBJRND
// extern ??? gUnknown_085D6FA4
// extern ??? ProcScr_efxShineOBJ
// extern ??? ProcScr_efxLuna
// extern ??? gUnknown_085D6FE4
// extern ??? gUnknown_085D6FFC
// extern ??? gUnknown_085D7000
// extern ??? gUnknown_085D7018
// extern ??? gUnknown_085D7030
// extern ??? gUnknown_085D70F0
// extern ??? gUnknown_085D7110
// extern ??? gUnknown_085D7138
// extern ??? gUnknown_085D7150
// extern ??? gUnknown_085D7180
// extern ??? ProcScr_efxLunaOBJ
// extern ??? gUnknown_085D71E0
// extern ??? gUnknown_085D71F8
// extern ??? gUnknown_085D7210
// extern ??? gUnknown_085D7240
// extern ??? gUnknown_085D7268
// extern ??? gUnknown_085D7280
// extern ??? gUnknown_085D7298
// extern ??? gUnknown_085D7398
// extern ??? ProcScr_efxExcaliburBGCOL2
// extern ??? gUnknown_085D73D8
// extern ??? gUnknown_085D73F8
// extern ??? gUnknown_085D7418
// extern ??? gUnknown_085D7430
// extern ??? gUnknown_085D7448
// extern ??? gUnknown_085D744C
// extern ??? gUnknown_085D7450
// extern ??? ProcScr_efxGespenstBGCOL2
// extern ??? gUnknown_085D7490
// extern ??? gUnknown_085D74A8
// extern ??? gUnknown_085D74C0
// extern ??? gUnknown_085D7530
// extern ??? gUnknown_085D7550
// extern ??? gUnknown_085D7570
// extern ??? gUnknown_085D7588
// extern ??? gUnknown_085D75B8
// extern ??? gUnknown_085D75E8
// extern ??? gUnknown_085D7600
// extern ??? gUnknown_085D7628
// extern ??? gUnknown_085D7650
// extern ??? ProcScr_efxDancepara
// extern ??? ProcScr_efxIvaldi
// extern ??? gUnknown_085D76A0
// extern ??? gUnknown_085D76B8
// extern ??? gUnknown_085D76E8
// extern ??? gUnknown_085D7700
// extern ??? ProcScr_efxDanceparaBG3
// extern ??? gUnknown_085D772C
// extern ??? gUnknown_085D7758
// extern ??? gUnknown_085D7784
// extern ??? ProcScr_efxDanceparaBG4
// extern ??? gUnknown_085D77C8
// extern ??? ProcScr_efxDanceparaOBJFall
// extern ??? efxIvaldiOBJSideWash
// extern ??? ProcScr_efxDanceparaOBJUprise
// extern ??? ProcScr_efxDanceparaOBJ1
// extern ??? ProcScr_efxDanceparaOBJ2
// extern ??? ProcScr_efxDanceparaWOUT

void StartSpellAnimation(struct Anim * anim);
// ??? sub_805B3FC(???);

void sub_805B94C(ProcPtr proc);
void sub_805B958(struct ProcEfx * proc);
void NewEfxALPHA(struct Anim * anim, int a, int b, int c, int d, int e);
// ??? EfxALPHAMain(???);
// ??? sub_805BB24(???);
// ??? EfxCircleWINMain(???);
// ??? StartSpellThing_MagicQuake(???);
// ??? Loop6C_efxMagicQUAKE(???);
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
void StartSpellAnimJavelinPrgasusKnight(struct Anim * anim);
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
// ??? EfxSongMain(???);
// ??? sub_805CA64(???);
// ??? EfxSongBgMain(???);
// ??? sub_805CB40(???);
// ??? sub_805CBA8(???);
void StartSpellAnimDance(struct Anim * anim);
// ??? sub_805CC14(???);
void sub_805CD0C(struct Anim * anim);
// ??? sub_805CD5C(???);
// ??? sub_805CE1C(???);
// ??? sub_805CE94(???);
void nullsub_42(struct Anim * anim);
void sub_805CEC8(struct Anim * anim);
// ??? sub_805CF04(???);
// ??? sub_805CFC0(???);
// ??? sub_805D030(???);
void StartSpellAnimFireBreath(struct Anim * anim);
// ??? sub_805D09C(???);
// ??? sub_805D14C(???);
// ??? sub_805D1FC(???);
// ??? sub_805D260(???);
// ??? sub_805D2B4(???);
// ??? sub_805D2EC(???);
// ??? sub_805D328(???);
void StartSpellAnimIceBreath(struct Anim * anim);
// ??? sub_805D3C4(???);
// ??? sub_805D444(???);
// ??? sub_805D4B8(???);
void StartSpellAnimDarkBreath(struct Anim * anim);
// ??? Loop6C_efxDarkbreath(???);
// ??? sub_805D59C(???);
// ??? sub_805D5EC(???);
// ??? sub_805D644(???);
// ??? sub_805D680(???);
// ??? sub_805D6CC(???);
// ??? sub_805D774(???);
void StartSpellAnimThunder(struct Anim * anim);
void Loop6C_efxThunder(struct ProcEfx * proc);
void NewEfxThunderBG(struct Anim * anim);
// ??? EfxThunderBGMain(???);
void NewEfxThunderBGCOL(struct Anim * anim);
// ??? sub_805D9F8(???);
void NewEfxThunderOBJ(struct Anim * anim);
// ??? EfxThunderOBJMain(???);
void StartSpellAnimFire(struct Anim * anim);
void StartSpellAnimElfire(struct Anim * anim);
// ??? Loop6C_efxFire(???);
void NewEfxFireBG(struct Anim * anim);
// ??? Loop6C_efxFireBG(???);
void NewEfxFireOBJ(struct Anim * anim);
// ??? sub_805DDA8(???);
void StartSubSpell_efxFireHITBG(struct Anim * anim);
// ??? sub_805DE74(???);
void StartSubSpell_efxElfireBG(struct Anim * anim);
// ??? sub_805DF70(???);
void StartSubSpell_efxElfireBGCOL(struct Anim * anim);
// ??? sub_805DFE8(???);
void StartSubSpell_efxElfireOBJ(struct Anim * anim);
// ??? sub_805E0B4(???);
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
void sub_80608E0(struct ProcEfx * proc);
void sub_8060A9C(struct Anim * anim, int terminator);
void sub_8060B2C(void);
void sub_8060B48(struct ProcEfxBG * proc);
void sub_8060B7C(struct Anim * anim, int terminator);
void sub_8060BC4(void);
void sub_8060BD4(struct ProcEfxBGCOL * proc);
void sub_8060C18(struct Anim * anim, int terminator);
void sub_8060C78(struct ProcEfxOBJ * proc);
void sub_8060CAC(struct Anim * anim);
void sub_8060D3C(struct Anim * anim);
void sub_8060DC4(struct ProcEfxEclipseBG * proc);
void sub_8060E90(struct Anim * anim);
void sub_8060ED8(struct ProcEfxOBJ * proc);
void sub_8060F24(struct Anim * anim, int idx);
void sub_8060FA4(struct ProcEfxOBJ * proc);
void StartSpellAnimHeal(struct Anim * anim);
// ??? EfxLiveMain(???);
void StartSpellAnimMend(struct Anim * anim);
// ??? EfxReliveMain(???);
void StartSpellAnimRecover(struct Anim * anim);
// ??? EfxRecoverMain(???);
void sub_8061420(struct Anim * anim);
// ??? EfxReblowMain(???);
// ??? sub_8061594(???);
// ??? sub_8061650(???);
// ??? EfxLivebgMain(???);
// ??? sub_8061774(???);
// ??? sub_80617E4(???);
// ??? sub_8061854(???);
// ??? sub_806189C(???);
// ??? sub_80618D8(???);
// ??? sub_80618F4(???);
// ??? NewEfxLiveOBJ(???);
// ??? sub_80619CC(???);
// ??? EfxLiveobjMain(???);
// ??? sub_8061A64(???);
// ??? sub_8061A98(???);
// ??? sub_8061ACC(???);
// ??? sub_8061B14(???);
// ??? sub_8061BE4(???);
void sub_8061C18(struct Anim * anim);
void sub_8061C48(struct Anim * anim);
// ??? EfxReserveMain(???);
// ??? sub_8061D28(???);
// ??? EfxReservebgMain(???);
// ??? sub_8061DF8(???);
// ??? sub_8061E44(???);
// ??? sub_8061E8C(???);
// ??? sub_8061F78(???);
// ??? sub_8062058(???);
// ??? sub_80620A4(???);
void sub_80620EC(struct Anim * anim);
// ??? EfxRestMain(???);
// ??? sub_80622A0(???);
// ??? sub_80622F4(???);
// ??? sub_8062358(???);
// ??? sub_80623D0(???);
void StartSpellAnimSilence(struct Anim * anim);
// ??? sub_806241C(???);
// ??? sub_8062524(???);
// ??? sub_80625B0(???);
// ??? sub_8062608(???);
// ??? sub_8062660(???);
void StartSpellAnimSleep(struct Anim * anim);
// ??? sub_80626B4(???);
// ??? sub_80627B4(???);
// ??? sub_8062840(???);
// ??? sub_8062898(???);
// ??? sub_80628F0(???);
// ??? sub_8062934(???);
// ??? sub_8062944(???);
// ??? sub_8062968(???);
// ??? sub_8062988(???);
void StartSpellAnimHammerne(struct Anim * anim);
// ??? sub_80629D4(???);
// ??? sub_8062AF4(???);
// ??? sub_8062B48(???);
// ??? sub_8062BAC(???);
// ??? sub_8062C04(???);
void StartSpellAnimBerserk(struct Anim * anim);
// ??? sub_8062C50(???);
// ??? sub_8062D30(???);
// ??? sub_8062E44(???);
// ??? sub_8062EAC(???);
// ??? sub_8062ED8(???);
// ??? sub_8062F3C(???);
// ??? sub_8062F4C(???);
// ??? sub_8062FA4(???);
// ??? sub_8062FBC(???);
// ??? sub_8062FF8(???);
// ??? sub_8063034(???);
// ??? sub_8063070(???);
// ??? sub_80630AC(???);
// ??? sub_80630E8(???);
// ??? sub_8063124(???);
// ??? sub_8063160(???);
// ??? sub_806319C(???);
// ??? sub_80631D8(???);
void sub_8063214(struct Anim * anim);
// ??? sub_8063250(???);
// ??? sub_806331C(???);
// ??? sub_8063378(???);
// ??? sub_80633D0(???);
// ??? sub_8063428(???);
// ??? sub_8063468(???);
void StartSpellAnimShine(struct Anim * anim);
// ??? sub_80634BC(???);
// ??? sub_8063590(???);
// ??? sub_80635E8(???);
// ??? sub_806364C(???);
// ??? sub_80636D8(???);
// ??? sub_806376C(???);
// ??? sub_80637B0(???);
// ??? sub_80637F8(???);
// ??? sub_8063840(???);
// ??? sub_80638F0(???);
// ??? sub_8063948(???);
void StartSpellAnimLuna(struct Anim * anim);
// ??? sub_80639B0(???);
// ??? sub_8063B6C(???);
// ??? sub_8063BC8(???);
// ??? sub_8063C20(???);
// ??? sub_8063C40(???);
// ??? sub_8063CFC(???);
// ??? sub_8063D1C(???);
// ??? sub_8063D64(???);
// ??? sub_8063E58(???);
// ??? sub_8063E74(???);
// ??? sub_8063EA0(???);
// ??? sub_8063EE8(???);
// ??? sub_8063EF8(???);
// ??? sub_8063F3C(???);
// ??? sub_8063FC0(???);
// ??? sub_8064024(???);
// ??? sub_8064060(???);
// ??? sub_80640D0(???);
// ??? sub_806416C(???);
// ??? sub_80641F0(???);
// ??? sub_806428C(???);
// ??? sub_80642BC(???);
void sub_8064308(struct Anim * anim);
// ??? sub_8064344(???);
// ??? sub_80644E0(???);
// ??? sub_806454C(???);
// ??? sub_8064568(???);
// ??? sub_80645FC(???);
// ??? sub_806464C(???);
// ??? sub_806466C(???);
// ??? sub_80646B0(???);
// ??? sub_80646C0(???);
// ??? sub_80646FC(???);
// ??? sub_8064720(???);
// ??? sub_80647D0(???);
// ??? sub_80647F0(???);
// ??? sub_8064838(???);
// ??? sub_806491C(???);
// ??? sub_8064938(???);
// ??? sub_8064958(???);
// ??? sub_806499C(???);
// ??? sub_80649E4(???);
// ??? sub_8064AC8(???);
// ??? sub_8064AE4(???);
// ??? sub_8064B04(???);
// ??? sub_8064B48(???);
// ??? sub_8064B90(???);
// ??? sub_8064BFC(???);
// ??? sub_8064C28(???);
// ??? sub_8064C80(???);
void nullsub_51(struct Anim * anim);
// ??? sub_8064D00(???);
// ??? sub_8064DA8(???);
// ??? sub_8064DC4(???);
// ??? sub_8064DE4(???);
// ??? sub_8064E2C(???);
void StartSpellAnimAura(struct Anim * anim);
// ??? sub_8064EB0(???);
// ??? sub_8065008(???);
// ??? sub_806509C(???);
// ??? sub_8065130(???);
// ??? sub_80651C4(???);
// ??? sub_806521C(???);
// ??? sub_8065300(???);
// ??? sub_806531C(???);
// ??? sub_806533C(???);
// ??? sub_8065384(???);
// ??? sub_80653CC(???);
// ??? sub_806542C(???);
void sub_8065490(struct Anim * anim);
void nullsub_53(struct Anim * anim);
// ??? sub_8065498(???);
// ??? sub_80654F8(???);
// ??? sub_80655C4(???);
// ??? sub_8065624(???);
void sub_8065634(struct Anim * anim);
void sub_8065670(struct Anim * anim);
void sub_80656AC(struct Anim * anim);
void sub_80656E8(struct Anim * anim);
// ??? sub_8065724(???);
void StartSpellAnimIvaldi(struct Anim * anim);
// ??? Loop6C_efxIvaldi(???);
// ??? StartSpellBG_IvaldiBG1(???);
// ??? Loop6C_efxIvaldiBG1(???);
// ??? StartSpellBG_IvaldiBG2(???);
// ??? Loop6C_efxIvaldiBG2(???);
// ??? StartSpellBG_IvaldiBG3(???);
// ??? Loop6C_efxIvaldiBG3(???);
// ??? StartSpellBG_IvaldiBG4(???);
// ??? sub_8065CA0(???);
// ??? PrepareSomeIvaldiParticleGraphics(???);
// ??? StartSpellOBJ_IvaldiFall(???);
// ??? sub_8065DF8(???);
// ??? StartSpellOBJ_IvaldiSideWash(???);
// ??? Loop6C_efxIvaldiOBJSideWash(???);
// ??? sub_8066060(???);
// ??? sub_80660B4(???);
// ??? sub_8066258(???);
// ??? sub_806635C(???);
// ??? sub_8066390(???);
// ??? sub_8066434(???);
// ??? sub_8066470(???);
// ??? sub_80664A8(???);
void sub_8066514(struct Anim * anim);
// ??? sub_8066550(???);
// ??? sub_80666D0(???);
// ??? sub_8066758(???);
// ??? sub_80667E0(???);
// ??? sub_806683C(???);
// ??? sub_80668DC(???);
// ??? sub_8066914(???);
// ??? sub_806699C(???);
// ??? sub_8066A0C(???);
// ??? sub_8066A94(???);
// ??? sub_8066B14(???);
// ??? sub_8066B40(???);
// ??? sub_8066BBC(???);
// ??? sub_8066BD4(???);
// ??? sub_8066C1C(???);
// ??? sub_8066C74(???);
// ??? sub_8066C98(???);
// ??? sub_8066CB8(???);
// ??? sub_8066D7C(???);
// ??? sub_8066DB0(???);
// ??? sub_8066E74(???);
// ??? sub_8066EA8(???);
// ??? sub_8066EC8(???);
// ??? sub_8066F90(???);
// ??? sub_8066FC4(???);
// ??? sub_80670A8(???);
// ??? sub_80670DC(???);
// ??? sub_80671C0(???);
// ??? sub_80671F4(???);
// ??? sub_8067244(???);
// ??? sub_8067400(???);
// ??? sub_80674A0(???);
void StartSpellAnimStone(struct Anim * anim);
// ??? sub_8067510(???);
// ??? sub_80675D4(???);
// ??? sub_8067660(???);
// ??? sub_80676E4(???);
// ??? sub_8067764(???);
void StartSpellAnimEvilEye(struct Anim * anim);
// ??? sub_80677D4(???);
// ??? sub_806788C(???);
// ??? sub_8067914(???);
// ??? sub_8067984(???);
// ??? sub_8067A30(???);
// ??? sub_8067AA0(???);
// ??? sub_8067B48(???);
void StartSpellAnimNaglfar(struct Anim * anim);
// ??? Loop6C_efxNaglfar(???);
// ??? sub_8067DC4(???);
// ??? Loop6C_efxNaglfarBG(???);
// ??? sub_8067E98(???);
// ??? Loop6C_efxNaglfarBG2(???);
// ??? NewEkrTogiInitPROC(???);
// ??? sub_805B104(???);
// ??? sub_805B18C(???);
// ??? sub_805B200(???);
// ??? sub_805B264(???);
// ??? NewEkrTogiEndPROC(???);
// ??? sub_805B290(???);
// ??? sub_805B2BC(???);
// ??? sub_805B320(???);
// ??? NewEkrTogiColor(???);
// ??? EndEkrTogiColor(???);
// ??? sub_805B394(???);
// ??? sub_8067F64(???);
// ??? sub_8067FB8(???);
// ??? sub_8068028(???);
// ??? sub_806807C(???);
// ??? sub_80680EC(???);
// ??? sub_8068208(???);
// ??? sub_806823C(???);
// ??? sub_80682E0(???);
// ??? sub_8068314(???);
// ??? sub_8068348(???);
// ??? sub_8068614(???);
// ??? sub_8068638(???);
// ??? sub_8068680(???);
// ??? sub_8068738(???);
// ??? sub_80687D0(???);
void sub_80687E4(struct Anim * anim);
// ??? sub_806881C(???);
// ??? sub_80688C0(???);
// ??? sub_8068970(???);
// ??? sub_80689D4(???);
// ??? sub_8068A28(???);
// ??? sub_8068A60(???);
// ??? sub_8068A9C(???);
// ??? sub_8068AFC(???);
void sub_8068B80(struct Anim * anim);
// ??? sub_8068BB8(???);
// ??? sub_8068D20(???);
// ??? sub_8068D78(???);
// ??? sub_8068D9C(???);
// ??? sub_8068DD8(???);
// ??? sub_8068E14(???);
// ??? sub_8068E50(???);
// ??? sub_8068E8C(???);
// ??? sub_8068EC8(???);
// ??? sub_8068F04(???);
// ??? sub_8068F40(???);
// ??? sub_8068F7C(???);
// ??? sub_8068FB8(???);
// ??? sub_8068FF4(???);
// ??? sub_8069030(???);
// ??? sub_806906C(???);
// ??? sub_80690A8(???);
// ??? sub_80690E4(???);
// ??? sub_8069100(???);
// ??? sub_80692B0(???);
// ??? sub_806935C(???);
// ??? sub_80693CC(???);
// ??? sub_8069400(???);
// ??? sub_8069488(???);
// ??? sub_8069528(???);
// ??? sub_8069530(???);
// ??? sub_80696F0(???);
// ??? sub_8069704(???);
// ??? sub_806977C(???);
// ??? sub_80697F4(???);
// ??? sub_8069878(???);
// ??? sub_80699A8(???);
// ??? sub_8069AC4(???);
// ??? sub_8069AFC(???);
// ??? sub_8069B68(???);
// ??? sub_8069C18(???);
// ??? sub_8069CDC(???);
// ??? sub_8069E88(???);
void StartSpellAnimCrimsonEye(struct Anim * anim);
// ??? sub_8069F00(???);
// ??? sub_806A008(???);
// ??? sub_806A068(???);
// ??? sub_806A0CC(???);
// ??? sub_806A138(???);
// ??? sub_806A1EC(???);
// ??? sub_806A3CC(???);
// ??? sub_806A3F4(???);
// ??? sub_806A47C(???);
// ??? sub_806A4CC(???);
// ??? sub_806A560(???);
// ??? sub_806A578(???);
// ??? sub_806A590(???);
// ??? sub_806A634(???);
// ??? sub_806A64C(???);
// ??? sub_806A664(???);
// ??? sub_806A6C4(???);
// ??? sub_806A6FC(???);
// ??? sub_806A7C4(???);
// ??? sub_806A8E8(???);
// ??? sub_806A9C4(???);
// ??? sub_806AAA0(???);
// ??? sub_806ABCC(???);
void sub_806AEF4(struct Anim * anim);
// ??? sub_806AF30(???);
// ??? sub_806B088(???);
// ??? sub_806B0AC(???);
// ??? sub_806B11C(???);
// ??? sub_806B134(???);
// ??? sub_806B194(???);
// ??? sub_806B1E8(???);
// ??? sub_806B24C(???);
// ??? sub_806B2C0(???);
// ??? sub_806B33C(???);
// ??? sub_806B344(???);
// ??? sub_806B4E4(???);
void sub_806B4F8(struct Anim * anim);
