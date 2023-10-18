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

extern struct BgAffineDstData gOpAnimBgAffineDstData;

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

struct ProcOpAnim {
    PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ u16 unk34;
    /* 36 */ u16 unk36;
    /* 38 */ s16 unk38;
    /* 3A */ s16 unk3A;
    /* 3C */ s16 unk3C;
    /* 3E */ s16 unk3E;
    /* 40 */ STRUCT_PAD(0x40, 0x46);
    /* 46 */ u8 unk46;
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

extern CONST_DATA u16 Obj_OpAnimEphEirikaName[];
extern CONST_DATA u16 Obj_08AA6C0E[];
extern CONST_DATA u16 Obj_08AA6C22[];
extern CONST_DATA u16 Obj_08AA6C36[];
extern CONST_DATA u16 Obj_08AA6C4A[];
extern CONST_DATA u16 Obj_08AA6C58[];
extern CONST_DATA u16 Obj_08AA6C58[];
extern CONST_DATA u16 Obj_08AA6C58[];
extern CONST_DATA u16 Obj_08AA6C66[];
extern CONST_DATA u16 Obj_08AA6C74[];
extern CONST_DATA u16 Obj_08AA6C82[];
extern CONST_DATA u16 Obj_08AA6C8A[];
extern CONST_DATA u16 Obj_08AA6C92[];
extern CONST_DATA u16 Obj_08AA6C9A[];
extern CONST_DATA struct ProcCmd ProcScr_OpAnimfxTerminator[];
extern CONST_DATA struct ProcCmd ProcScr_OpAnimFadeIn[];
extern CONST_DATA struct ProcCmd ProcScr_OpAnimBLDALPHA[];
extern CONST_DATA struct ProcCmd ProcScr_08AA6D04[];
extern CONST_DATA u8 * imgs_08AA6D14[100];
extern CONST_DATA u16 * tsas_08AA6EA4[100];
extern CONST_DATA struct ProcCmd ProcScr_OpAnimMergeBG[];
// extern ??? gUnknown_08AA705C
// extern ??? gUnknown_08AA707C
// extern ??? gUnknown_08AA709C
// extern ??? gUnknown_08AA70BC
// extern ??? gUnknown_08AA70DC
// extern ??? gUnknown_08AA70EA
// extern ??? gUnknown_08AA7116
// extern ??? gUnknown_08AA712A
// extern ??? gUnknown_08AA715C
// extern ??? gUnknown_08AA7194

extern CONST_DATA u16 * pal_08AF47F0[];
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
extern u16 pal_08B103D8[];

void OpAnimPutObjCommon(int ix, int iy, u8 a, u8 b);
void OpAnimfxTerminatorMain(struct Proc * proc);
void NewOpAnimfxTerminator(ProcPtr parent);
void EndOpAnimfxTerminator(ProcPtr parent);
void CopyToPalOpAnim(const void * src, int offset, int size);
void CopyFirstPalDirectly(const u16 * src, u16 * dst);
void SetFirstPalDirectly(u16 * src, u16 * dst, u8 pal);
void ClearFirstPalDirectly(u16 * dst);
void TsaModifyFirstPalMaybe(s16 end, s16 start, u8 unused, u16 bg, u16 * src1, u16 * src2, s8 flag);
void sub_80C689C(s16 end, s16 start, u8 unused, u16 bg, u16 * src1, u16 * src2, s8 flag);
void sub_80C69B0(u16 *, int, u16);
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
void sub_80C6F70(struct ProcOpAnim * proc);
void sub_80C7050(struct ProcOpAnim * proc);
void Proc08AA6D04Main(void);
void NewProc08AA6D04(void);
void EndProc08AA6D04(void);
void OpAnim1_UpdateScrollOneLine(s16 index);
void OpAnim1_UpdateScroll(int new, int old);
void sub_80C72A4(u8 type);
void OpAnimPreparefxEphraim(struct ProcOpAnim * proc);
void OpAnimMergeBGProcInit(struct Proc08AA7034 * proc);
void OpAnimMergeBGProcUpdateBgPalette(struct Proc08AA7034 * proc);
void OpAnimDrawSplitLine(int xOam1, int yOam0);
void OpAnimEphraimfxFlyIn(struct ProcOpAnim * proc);
void OpAnimHBlank1(void);
void OpAnimHBlank2(void);
void sub_80C7900(struct ProcOpAnim * proc);
void OpAnim1AdvanceSplitLine(struct ProcOpAnim * proc);
void OpAnimEphraimMergeShadow(struct ProcOpAnim * proc);
void OpAnimEphraimDisplayName(struct ProcOpAnim * proc);
void OpAnimEphraimExit(struct ProcOpAnim * proc);
// ??? OpAnimPreparefxEirika(???);
// ??? sub_80C7F90(???);
// ??? sub_80C8100(???);
// ??? sub_80C8184(???);
// ??? sub_80C8214(???);
// ??? sub_80C8278(???);
// ??? sub_80C835C(???);
// ??? sub_80C84D8(???);
// ??? sub_80C8554(???);
// ??? sub_80C8564(???);
// ??? sub_80C8580(???);
// ??? sub_80C85B0(???);
// ??? sub_80C85FC(???);
// ??? sub_80C8608(???);
// ??? sub_80C8638(???);
// ??? sub_80C8684(???);
// ??? sub_80C8690(???);
// ??? sub_80C883C(???);
// ??? sub_80C8934(???);
// ??? sub_80C8A20(???);
// ??? sub_80C8B0C(???);
// ??? sub_80C8BF8(???);
// ??? sub_80C8CE4(???);
// ??? sub_80C8D30(???);
// ??? sub_80C8ED4(???);
// ??? sub_80C9024(???);
// ??? sub_80C9100(???);
// ??? sub_80C9218(???);
// ??? sub_80C9330(???);
// ??? sub_80C940C(???);
// ??? sub_80C955C(???);
// ??? sub_80C9638(???);
// ??? sub_80C9750(???);
// ??? sub_80C98A0(???);
// ??? sub_80C99B8(???);
// ??? sub_80C9A94(???);
// ??? sub_80C9AFC(???);
// ??? sub_80C9B6C(???);
// ??? sub_80C9C08(???);
// ??? sub_80C9C5C(???);
// ??? sub_80C9CAC(???);
// ??? sub_80C9CFC(???);
// ??? sub_80C9D4C(???);
// ??? sub_80C9DA0(???);
// ??? sub_80C9DF0(???);
// ??? sub_80C9E6C(???);
// ??? sub_80C9EE8(???);
// ??? sub_80C9F7C(???);
// ??? sub_80C9FF8(???);
// ??? sub_80CA10C(???);
// ??? sub_80CA26C(???);
// ??? sub_80CA3B8(???);
// ??? sub_80CA4A4(???);
// ??? sub_80CA4DC(???);
// ??? sub_80CA92C(???);
// ??? sub_80CA940(???);
// ??? sub_80CA9F8(???);
// ??? sub_80CAA38(???);
// ??? sub_80CABB0(???);
// ??? sub_80CAE20(???);
// ??? sub_80CAF2C(???);
// ??? sub_80CB0A0(???);
// ??? sub_80CB20C(???);
// ??? sub_80CB320(???);
// ??? sub_80CB594(???);
// ??? sub_80CB6A0(???);
// ??? sub_80CB878(???);
// ??? sub_80CBA64(???);
// ??? sub_80CBC40(???);
// ??? sub_80CBD7C(???);

void TryTickHSScreenExit(struct ProcOpAnimHS * proc);
void GameIntroPrepareNintendofx(struct ProcOpAnimHS * proc);
void OpAnimHS_BrightenPalette(u16 * src, int palid, int line, int cur, int max);
void sub_80CBF9C(struct ProcOpAnimHS * proc);
void sub_80CBFC0(struct ProcOpAnimHS * proc);
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
