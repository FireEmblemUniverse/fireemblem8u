#pragma once

#include "global.h"
#include "proc.h"

#define ApplyPalettesGameIntro(aSrc, aPalId, aPalCount) CopyToPalGameIntro((aSrc), 0x20 * (aPalId), 0x20 * (aPalCount))
#define ApplyPaletteGameIntro(aSrc, aPalId) ApplyPalettesGameIntro((aSrc), (aPalId), 1)

struct TitleScreenProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 unk_29; // maybe a flag for whether we are coming from the intro sequence?
    /* 2A */ u16 timer;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;

    /* 34 */ u8 _pad[0x4C-0x34];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e; // unused/pad?
    /* 50 */ s16 unk_50; // unused/pad?
    /* 52 */ u16 unk_52;
};

extern struct BgAffineDstData gGameIntroBgAffineDstData;

struct Struct02022188 {
    /* 00 */ u16 unk00;
    /* 02 */ u16 unk02;
    /* 04 */ u16 unk04;
    /* 06 */ u16 unk06;
    /* 08 */ u16 unk08;
    /* 0A */ s16 unk0A;
    /* 0C */ u16 unk0C;
};

extern struct Struct02022188 gUnknown_02022188;

struct ProcGameIntro {
    PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;
    /* 30 */ STRUCT_PAD(0x30, 0x34);
    /* 34 */ s16 unk34;
    /* 36 */ s16 unk36;
    /* 38 */ s16 unk38;
    /* 3A */ s16 unk3A;
    /* 3C */ s16 unk3C;
    /* 3E */ s16 unk3E;
    /* 40 */ STRUCT_PAD(0x40, 0x46);
    /* 46 */ u8 unk46;
};

struct ProcGameIntroFadeIn {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 cur;
    /* 4E */ STRUCT_PAD(0x4E, 0x64);
    /* 64 */ s16 max;
};

struct ProcGameIntroBLDALPHA {
    PROC_HEADER;

    /* 2A */ u16 timer;
};

extern CONST_DATA u16 Obj_08AA6BFA[];
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
extern CONST_DATA struct ProcCmd ProcScr_GameIntrofxTerminator[];
extern CONST_DATA struct ProcCmd ProcScr_GameIntroFadeIn[];
extern CONST_DATA struct ProcCmd ProcScr_GameIntroBLDALPHA[];
extern CONST_DATA struct ProcCmd ProcScr_08AA6D04[];
extern CONST_DATA u8 * imgs_08AA6D14[];
extern CONST_DATA u16 * tsas_08AA6EA4[];
// extern ??? gUnknown_08AA7034
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

void GameIntroPutObjCommon(int ix, int iy, u8 a, u8 b);
void GameIntrofxTerminatorMain(struct Proc * proc);
void NewGameIntrofxTerminator(ProcPtr parent);
void EndGameIntrofxTerminator(ProcPtr parent);
void CopyToPalGameIntro(const void * src, int offset, int size);
void CopyFirstPalDirectly(const u16 * src, u16 * dst);
void SetFirstPalDirectly(u16 * src, u16 * dst, u8 pal);
void ClearFirstPalDirectly(u16 * dst);
void TsaModifyFirstPalMaybe(s16 param_1, s16 param_2, u8 param_3, u16 bg, u16* src1, u16* src2, s8 param_7);
// ??? sub_80C689C(???);
void sub_80C69B0(u16 *, int, u16);
void Initialize6CIntroSequence(struct ProcGameIntro * proc);
void GameIntroAllBlack(struct ProcGameIntroFadeIn * proc);
void GameIntroFadeInMain(struct ProcGameIntroFadeIn * proc);
void NewProcGameIntroFadeIn(int max, ProcPtr parent);
void BgAffineSetGameIntro(int scaling_radio, int angle);
void GameIntroInitScreen(struct ProcGameIntro * proc);
void GameIntroBldAlphaInit(struct ProcGameIntroBLDALPHA * proc);
void GameIntroBldAlphaUpdateBgPalette(struct ProcGameIntroBLDALPHA * proc);
void GameIntroBldAlphaDelay(struct ProcGameIntroBLDALPHA * proc);
void GameIntroBldAlphaMain(struct ProcGameIntroBLDALPHA * proc);
bool GameIntroBldAlphaExists(void);
void GameIntroUpdateScreen1(struct ProcGameIntro * proc);
void sub_80C6F70(struct ProcGameIntro * proc);
void sub_80C7050(struct ProcGameIntro * proc);
void Proc08AA6D04Main(void);
void NewProc08AA6D04(void);
void EndProc08AA6D04(void);
void GameIntro1_UpdateScrollOneLine(s16 index);
void GameIntro1_UpdateScroll(int new, int old);
// ??? sub_80C72A4(???);
// ??? sub_80C73B0(???);
// ??? sub_80C7610(???);
// ??? sub_80C7618(???);
// ??? sub_80C7680(???);
// ??? sub_80C76C8(???);
// ??? sub_80C7844(???);
// ??? sub_80C78BC(???);
// ??? sub_80C7900(???);
// ??? sub_80C79F4(???);
// ??? sub_80C7A84(???);
// ??? sub_80C7AE8(???);
// ??? sub_80C7B80(???);
// ??? sub_80C7CF8(???);
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
// ??? sub_80CBDD8(???);
// ??? sub_80CBE0C(???);
// ??? sub_80CBEF8(???);
// ??? sub_80CBF9C(???);
// ??? sub_80CBFC0(???);
// ??? sub_80CC074(???);
// ??? sub_80CC098(???);
// ??? sub_80CC0FC(???);
// ??? sub_80CC13C(???);
// ??? sub_80CC1A0(???);
// ??? sub_80CC1E0(???);
// ??? sub_80CC1E8(???);
// ??? sub_80CC1F0(???);
// ??? PrepareHealthAndSafetyScreen(???);
// ??? sub_80CC2F4(???);
// ??? sub_80CC32C(???);
// ??? sub_80CC430(???);
