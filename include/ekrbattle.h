#pragma once

#include "global.h"
#include "proc.h"
#include "anime.h"

enum ekr_battle_unit_position {
    EKR_BATTLE_LEFT,
    EKR_BATTLE_RIGHT
};

struct ProcEkrBattleDeamon {
    PROC_HEADER;

    /* 29 */
};

struct ProcEkrBattle {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 _pad_2A[0x2C - 0x2A];
    /* 2C */ s16 timer;
    /* 30 */ u8 _pad_30[0x44 - 0x30];
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ u8 _pad_4C[0x54 - 0x4C];
    /* 54 */ int is_quote;
    /* 58 */ int unk58;
    /* 5C */ struct Anim *anim;
};

struct ProcEkrLvupFan {
    PROC_HEADER;

    /* 29 */
};

struct EkrGaugeStruct1 {
    u8 _pad_00[0x3C - 0x0];
    void *unk3C;
};

struct ProcEkrGauge {
    PROC_HEADER;

    /* 29 */ u8 battle_init;           /* 1 in battle-starting and 0 after battle started */
    /* 2A */ u8 unk2A;
    /* 2B */ u8 _pad_2B[0x32 - 0x2B];
    /* 32 */ s16 unk32;
    /* 34 */ u8 _pad_34[0x3A - 0x34];
    /* 3A */ s16 unk3A;
    /* 3C */ u8 _pad_3C[0x44 - 0x3C];
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;
    /* 50 */ int unk50;
    /* 54 */
};

struct ProcEkrBattleStarting {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x2C - 0x29];

    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;
    /* 30 */ u16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;

    /* 36 */ u8 _pad_36[0x3A - 0x36];

    /* 3A */ s16 unk3A;
    /* 3C */ s16 unk3C;
};

extern int gUnknown_02000018, gUnknown_0200001C;

extern u16 gBattleActorSide;
extern u16 gBattleInitSide;
extern struct AnimRoundData gAnimRoundData;

extern struct BattleUnit *gpEkrBattleUnitLeft;
extern struct BattleUnit *gpEkrBattleUnitRight;
extern struct Font gSomeFontStruct;

// extern ??? gUnknown_02000018
// extern ??? gUnknown_0200001C
extern u32 gUnknown_02000020;
extern u32 gUnknown_02000024;
// extern ??? gUnknown_02000028
// extern ??? gUnknown_0200002C
// extern ??? gUnknown_02000030
// extern ??? gUnknown_02000034
extern struct Vec2 gUnknown_02000038;
// extern ??? gUnknown_0200003C
// extern ??? gUnknown_02000044
// extern ??? gUnknown_0200004C
// extern ??? gUnknown_02000054
// extern ??? gUnknown_0200005C
// extern ??? gUnknown_02000060
extern struct ProcEkrBattle *gpProcEkrBattle;
extern struct ProcEkrGauge *gpProcEkrGauge;
// extern ??? gUnknown_0200006C
// extern ??? gUnknown_02000088

extern int gEkrEventFlagMaybe;
extern int gBattleDeamonActive;
extern struct ProcEkrBattleDeamon *gpProcEkrBattleDeamon;
extern short gUnknown_0203E0FC;
extern short gUnknown_0203E0FE;
extern short gUnknown_0203E100;
extern short gUnknown_0203E102;
extern short gUnknown_0203E104[];
// extern ??? gUnknown_0203E108
extern short gUnknown_0203E114[2];
// extern ??? gUnknown_0203E118
// extern ??? gUnknown_0203E11A
// extern ??? gUnknown_0203E11C
extern EWRAM_DATA s16 gUnknown_0203E120;
extern EWRAM_DATA s16 gUnknown_0203E122[4];
// extern ??? gAnimRoundData

extern struct ProcCmd gProc_ekrBattleDeamon[];
extern struct ProcCmd gProc_ekrBattle[];
extern struct ProcCmd gProc_ekrLvupFan[];
extern struct ProcCmd gProc_ekrGauge[];
// extern ??? gUnknown_085B93D0
// extern ??? gUnknown_085B940C
// extern ??? gUnknown_085B9424
// extern ??? gUnknown_085B949C
// extern ??? gUnknown_085B94F0
// extern ??? gUnknown_085B9544
extern u16 gUnknown_085B955C[];
extern u16 gUnknown_085B9574[];
extern u16 gUnknown_085B958C[];
extern u16 gUnknown_085B95A4[];
extern u16 gUnknown_085B95BC[];
extern u16 gUnknown_085B95D4[];
extern struct ProcCmd gProc_ekrDispUP[];
extern struct ProcCmd gProc_efxHPBar[];
extern struct ProcCmd gProc_efxHPBarResire[];
extern struct ProcCmd gProc_efxAvoid[];
extern struct ProcCmd gProc_efxHPBarLive[];
extern struct ProcCmd gProc_efxNoDamage[];
extern struct ProcCmd gProc_efxNoDamageYure[];
extern struct ProcCmd gProc_efxStatusCHG[];
extern struct ProcCmd gProc_efxDeadEvent[];
extern struct ProcCmd gProc_efxDead[];
extern struct ProcCmd gProc_efxDeadPika[];
extern struct ProcCmd gProc_efxDeadAlpha[];
extern struct ProcCmd gProc_efxDeadDragonAlpha[];
extern struct ProcCmd gProc_efxFarAttack[];
extern struct ProcCmd gProc_efxQuakePure[];
// extern ??? gUnknown_085B9804
extern struct ProcCmd gProc_efxHitQuakePure[];
extern struct ProcCmd gProc_efxQuake[];
extern struct ProcCmd gProc_efxHitQuake[];
extern struct ProcCmd gProc_efxFlashBG[];
extern struct ProcCmd gProc_efxWhiteOUT[];
extern struct ProcCmd gProc_efxWhiteIN[];
extern struct ProcCmd gProc_efxBlackOUT[];
extern struct ProcCmd gProc_efxBlackIN[];
extern struct ProcCmd gProc_efxFlashHPBar[];
extern struct ProcCmd gProc_efxHPBarColorChange[];
extern struct ProcCmd gProc_efxFlashUnit[];
extern struct ProcCmd gProc_efxFlashUnitEffect[];
extern struct ProcCmd gProc_efxStatusUnit[];
extern struct ProcCmd gProc_efxWeaponIcon[];
extern struct ProcCmd gProc_efxSpellCast[];
extern struct ProcCmd gProc_efxspdquake[];
extern struct ProcCmd gProc_ekrBattleStarting[];
extern struct ProcCmd gProc_ekrbattleendin[];
// extern ??? gProc_EkrBaseKaiten
// extern ??? gUnknown_085B9B84
// extern ??? gUnknown_085B9BA4
// extern ??? gUnknown_085B9BC4
// extern ??? gUnknown_085B9BE4
// extern ??? gUnknown_085B9C04
// extern ??? gUnknown_085B9C24
// extern ??? gUnknown_085B9C44
// extern ??? gUnknown_085B9C64
// extern ??? gUnknown_085B9C84
// extern ??? gUnknown_085B9CA4
// extern ??? gUnknown_085B9CC4
// extern ??? ProcScr_ekrUnitKakudai
extern struct ProcCmd gProc_ekrWindowAppear[];
extern struct ProcCmd gProc_ekrNamewinAppear[];
extern struct ProcCmd gProc_ekrBaseAppear[];
// extern ??? gUnknown_085B9D5C
// extern ??? gUnknown_085B9D6C
extern struct ProcCmd gProc_ekrChienCHR[];
extern struct ProcCmd gProc_efxAnimeDrvProc[];
extern struct ProcCmd ProcScr_ekrUnitMainMini[];
extern struct ProcCmd gProc_ekrTogiInit[];
extern struct ProcCmd gProc_ekrTogiEnd[];
extern struct ProcCmd gProc_ekrTogiColor[];

void SetEkrEventFlagMaybe(int unk);
// ??? GetEkrEventFlagMaybe(???);
void NewEkrBattleDeamon(void);
// ??? EndEkrBattleDeamon(???);
int IsBattleDeamonActive(void); // battle?
// ??? ekrBattleDeamon_Destructor(???);
// ??? nullsub_35(???);
void NewEkrBattle(void);
void InBattleMainRoutine(void);
void MainUpdateEkrBattle(void);
// ??? nullsub_36(???);
// ??? ekrBattle_Init(???);
// ??? ekrBattleMain(???);
void ekrBattle_HandlePreEventMaybe(struct ProcEkrBattle *proc);
void ekrBattle_80500F0(struct ProcEkrBattle *proc);
void ekrBattle_8050134(struct ProcEkrBattle *proc);
void ekrBattle_8050158(struct ProcEkrBattle *proc);
void ekrBattle_8050174(struct ProcEkrBattle *proc);
void ekrBattle_8050224(struct ProcEkrBattle *proc);
void ekrBattle_8050244(struct ProcEkrBattle *proc);
void ekrBattle_8050290(struct ProcEkrBattle *proc);
void ekrBattle_80502B0(struct ProcEkrBattle *proc);
void ekrBattle_8050304(struct ProcEkrBattle *proc);
void ekrBattle_8050338(struct ProcEkrBattle *proc);
void ekrBattle_8050360(struct ProcEkrBattle *proc);
void ekrBattle_80503EC(struct ProcEkrBattle *proc);
void ekrBattle_8050400(struct ProcEkrBattle *proc);
void ekrBattle_8050440(struct ProcEkrBattle *proc);
void ekrBattle_805046C(struct ProcEkrBattle *proc);
void ekrBattle_80505EC(struct ProcEkrBattle *proc);
void ekrBattle_8050600(struct ProcEkrBattle *proc);
void ekrBattle_WaitForPostBattleAct(struct ProcEkrBattle *proc);
void ekrBattle_80506C8(struct ProcEkrBattle *proc);
void ekrBattle_80508F0(struct ProcEkrBattle *proc);
void ekrBattle_8050940(struct ProcEkrBattle *proc);
void ekrBattle_80509A8(struct ProcEkrBattle *proc);
void ekrBattle_8050A84(struct ProcEkrBattle *proc);
void ekrBattle_8050AB8(struct ProcEkrBattle *proc);
void ekrBattle_8050B08(struct ProcEkrBattle *proc);
void ekrBattle_CheckForLevelup_8050C34(struct ProcEkrBattle *proc);
void ekrBattle_WaitForLevelup_8050C6C(struct ProcEkrBattle *proc);
void ekrBattle_MakePopups(struct ProcEkrBattle *proc);
void ekrBattle_WaitForPopup(struct ProcEkrBattle *proc);
// ??? ekrBattle_8050CCC(???);
// ??? ekrBattle_8050CF8(???);
// ??? ekrBattle_8050D88(???);
// ??? ekrBattle_8050DA8(???);
// ??? nullsub_69(???);
// ??? NewEkrLvlupFan(???);
void EkrLvupFanMain(struct ProcEkrLvupFan *proc);
// ??? sub_8050E40(???);
// ??? ModDec(???);
void NewEkrGauge(void);
void EndEkrGauge(void);
void EkrGauge_Clr4C50(void);
void EkrGauge_Set4C50(void);
void EkrGauge_Set4C(void);
void EkrGauge_Set50(void);
void EkrGauge_Setup44(u16 val);
void EkrGauge_Clr323A(int x, int y);
void EkrGauge_Setxy323A(int x, int y);
// ??? EkrGauge_SetInitFlag(???);
void EkrGauge_ClrInitFlag(void);
void EkrGauge_Set2A(void);
void EkrGauge_Clr2A(void);
// ??? sub_8051238(???);
void ekrGaugeMain(struct ProcEkrGauge *proc);
void NewEkrDispUP(void);
// ??? sub_8051AF4(???);
// ??? sub_8051B08(???);
// ??? sub_8051B18(???);
void sub_8051B28(void);
void sub_8051B38(void);
// ??? EkrDispUP_8051B48(???);
// ??? sub_8051B5C(???);
// ??? sub_8051B70(???);
// ??? sub_8051B80(???);
void sub_8051B90(void);
void sub_8051BA0(void);
// ??? ekrDispUP_Loop(???);
void sub_8051CC4(void);
// ??? sub_8051E00(???);
void sub_8051F1C(void);
int sub_8052184(void);
// ??? sub_8052214(???);
void sub_8052220(void);
// ??? sub_80522CC(???);
short EkrEfxIsUnitHittedNow(enum ekr_battle_unit_position);
// ??? sub_8052304(???);
// ??? sub_80523EC(???);
// ??? sub_8052504(???);
// ??? sub_80525A4(???);
// ??? sub_80525E8(???);
// ??? sub_80526C8(???);
// ??? sub_8052788(???);
// ??? sub_805282C(???);
// ??? sub_8052978(???);
// ??? sub_80529F0(???);
// ??? sub_8052A0C(???);
// ??? sub_8052AE4(???);
// ??? sub_8052B98(???);
// ??? sub_8052C24(???);
// ??? sub_8052C7C(???);
// ??? sub_8052CA0(???);
// ??? sub_8052D8C(???);
// ??? sub_8052DB8(???);
// ??? sub_8052DD4(???);
// ??? sub_8052DFC(???);
// ??? sub_8052E7C(???);
// ??? sub_8052EAC(???);
// ??? sub_8052F24(???);
// ??? sub_8052F84(???);
// ??? sub_8052FAC(???);
// ??? sub_8052FEC(???);
// ??? sub_8053080(???);
// ??? sub_8053120(???);
// ??? sub_8053144(???);
// ??? sub_80531A4(???);
// ??? sub_805320C(???);
// ??? sub_805328C(???);
// ??? sub_8053368(???);
void sub_80533D0(struct Anim *anim, int arg);
// ??? sub_80534AC(???);
// ??? sub_80534E4(???);
// ??? sub_8053514(???);
// ??? sub_8053584(???);
// ??? sub_8053618(???);
// ??? sub_8053678(???);
// ??? sub_80536B8(???);
// ??? sub_8053718(???);
// ??? nullsub_56(???);
// ??? sub_8053730(???);
// ??? sub_805382C(???);
// ??? sub_80539DC(???);
// ??? sub_8053BBC(???);
// ??? StartSpellBG_FLASH(???);
// ??? sub_8053F4C(???);
// ??? sub_8053F8C(???);
// ??? sub_8053FC4(???);
// ??? sub_8053FE4(???);
// ??? sub_805401C(???);
// ??? sub_8054030(???);
// ??? sub_8054054(???);
// ??? sub_80540B0(???);
// ??? sub_8054120(???);
// ??? sub_8054134(???);
// ??? sub_8054158(???);
// ??? sub_80541B4(???);
// ??? sub_8054224(???);
// ??? sub_8054238(???);
// ??? sub_805425C(???);
// ??? sub_80542B8(???);
// ??? sub_8054328(???);
// ??? sub_805433C(???);
// ??? sub_8054360(???);
// ??? sub_80543BC(???);
// ??? sub_805442C(???);
// ??? sub_8054440(???);
// ??? sub_8054478(???);
// ??? sub_8054498(???);
// ??? sub_805452C(???);
void sub_80545C0(struct Anim *anim);
// ??? sub_80546B0(???);
// ??? sub_80546C4(???);
// ??? sub_80546D4(???);
// ??? sub_80546E4(???);
// ??? sub_80547DC(???);
// ??? sub_8054818(???);
// ??? sub_8054888(???);
// ??? sub_80548E0(???);
// ??? sub_8054930(???);
// ??? sub_80549BC(???);
void NewEfxStatusUnit(struct Anim *anim);
// ??? sub_8054B18(???);
// ??? DeleteEach6C_efxStatusUnit(???);
void sub_8054B64(struct Anim *anim);
// ??? sub_8054B84(???);
void sub_8054BA4(struct Anim *anim, void *unk44);
u32 sub_8054BD4(struct Anim *anim);
// ??? sub_8054BF0(???);
// ??? sub_8054C94(???);
// ??? sub_8054E4C(???);
void sub_8054E8C(s16 a, s16 b);
// ??? sub_8054ED4(???);
// ??? sub_8054EF0(???);
// ??? sub_8054F00(???);
// ??? sub_8054F10(???);
// ??? sub_8054F78(???);
void NewEfxSpellCast(void);
void sub_8055000(void);
// ??? sub_805501C(???);
// ??? sub_8055038(???);
// ??? sub_805509C(???);
// ??? sub_80550DC(???);
// ??? sub_805515C(???);
// ??? SetSomethingSpellFxToTrue(???);
// ??? SetSomethingSpellFxToFalse(???);
// ??? ClearBG1Setup(???);
// ??? ClearBG1(???);
// ??? sub_80551B0(???);
// ??? sub_805526C(???);
// ??? ThisMakesTheHPInSpellAnimGoAway(???);
// ??? sub_8055288(???);
// ??? sub_8055298(???);
// ??? sub_8055424(???);
// ??? sub_8055518(???);
// ??? sub_8055554(???);
// ??? sub_80555B0(???);
// ??? sub_805560C(???);
// ??? sub_8055670(???);
// ??? sub_80556F0(???);
// ??? sub_805576C(???);
// ??? SomeImageStoringRoutine_SpellAnim(???);
// ??? SomePaletteStoringRoutine_SpellAnim(???);
// ??? SomeImageStoringRoutine_SpellAnim2(???);
// ??? SomePaletteStoringRoutine_SpellAnim2(???);
// ??? sub_8055860(???);
// ??? sub_805588C(???);
// ??? sub_80558BC(???);
// ??? sub_80558F4(???);
// ??? sub_8055980(???);
// ??? GetAnimationStartFrameMaybe(???);
// ??? sub_80559B0(???);
// ??? sub_80559D0(???);
// ??? sub_80559F0(???);
// ??? sub_8055A28(???);
// ??? sub_8055A34(???);
// ??? sub_8055A40(???);
// ??? sub_8055A64(???);
// ??? sub_8055B38(???);
// ??? sub_8055BB4(???);
s8 sub_8055BC4(void);
void BeginAnimsOnBattleAnimations(void);
void sub_8055C38(void);
void MainUpdate_8055C68(void);
void NewEkrBattleStarting(void);
// ??? ekrBaStart_InitScreen(???);
// ??? ekrBaStart_SreenFailIn(???);
// ??? ekrBaStart_InitBattleScreen(???);
// ??? ekrBaStart_ExecEkrBattle6C(???);
// ??? ekrBaStart_8055FE8(???);
// ??? ekrBaStart_8056024(???);
// ??? ekrBaStart_8056078(???);
void sub_80560D8(void);
// ??? ekrBattleEnding_80560F0(???);
// ??? ekrBattleEnding_8056170(???);
// ??? ekrBattleEnding_80561C8(???);
// ??? ekrBattleEnding_8056228(???);
// ??? ekrBattleEnding_8056288(???);
// ??? ekrBattleEnding_8056310(???);
// ??? ekrBattleEnding_8056390(???);
// ??? ekrBattleEnding_8056484(???);
void sub_805649C(u32 val);
// ??? sub_8056864(???);
void sub_8056900(u32 val);
// ??? sub_8056974(???);
// ??? sub_8056B70(???);
// ??? sub_8056D18(???);
void NewEkrWindowAppear(int, int);
bool DoesEkrWindowAppearExist(void);
// ??? sub_8056D90(???);
void NewEkrNamewinAppear(int, int, int);
bool sub_8056E60(void);
// ??? sub_8056E7C(???);
// ??? sub_8056EA4(???);
void sub_8056F20(int, int);
// ??? sub_8056F68(???);
// ??? sub_8056F84(???);
