#ifndef GUARD_ANIME_H
#define GUARD_ANIME_H

#include "global.h"
#include "bmbattle.h"
#include "fontgrp.h"

struct Anim {
    /* 00 */ u16 state;
    /* 02 */ short xPosition;
    /* 04 */ short yPosition;
    /* 06 */ short timer;
    /* 08 */ u16 oam2Base;
    /* 0A */ u16 drawLayerPriority;
    /* 0C */ u16 state2;
    /* 0E */ u16 nextRoundId;
    /* 10 */ u16 state3;
    /* 12 */ u8 currentRoundType;
    /* 13 */ u8 unk13;

    /* 14 */ u8 commandQueueSize;
    /* 15 */ u8 commandQueue[7];

    /* 1C */ u32 oamBase;

    /* 20 */ const u32* pScrCurrent;
    /* 24 */ const u32* pScrStart;
    /* 28 */ const void* pImgSheet;
    /* 2C */ const void* pUnk2C;
    /* 30 */ const void* pSpriteDataPool; // aka "OAM data"

    /* 34 */ struct Anim* pPrev;
    /* 38 */ struct Anim* pNext;

    /* 3C */ const void* pSpriteData;
    /* 40 */ const void* pUnk40;
    /* 44 */ const void* pUnk44;
};

enum state {
    ANIM_BIT_ENABLED = (1 << 0),
    ANIM_BIT_HIDDEN  = (1 << 1),
    ANIM_BIT_2       = (1 << 2),
    ANIM_BIT_FROZEN  = (1 << 3),
};

struct AnimRoundData {
    s16 type_identifier;
    u16 flags;
};

enum type_identifier {
    ANIM_ROUND_HIT_CLOSE,
    ANIM_ROUND_CRIT_CLOSE,
    ANIM_ROUND_NONCRIT_FAR,
    ANIM_ROUND_CRIT_FAR,
    ANIM_ROUND_TAKING_MISS_CLOSE,
    ANIM_ROUND_TAKING_MISS_FAR,
    ANIM_ROUND_TAKING_HIT_CLOSE,
    ANIM_ROUND_STANDING,
    ANIM_ROUND_TAKING_HIT_FAR,
    ANIM_ROUND_MISS_CLOSE,
};

struct AnimSpriteData {
    /* 00 */ u32 header;

    union {
        struct {
            /* 04 */ u16 pa;
            /* 06 */ u16 pb;
            /* 08 */ u16 pc;
            /* 0A */ u16 pd;
        } affine;

        struct {
            /* 04 */ u16 oam2;
            /* 06 */ short x;
            /* 08 */ short y;
        } object;
    } as;
};

enum {
    ANIM_MAX_COUNT = 50,
};

enum {
    // Animation Command Identifiers
    // TODO: complete during battle animation decomp

    ANIM_CMD_NOP     = 0x00,
    ANIM_CMD_WAIT_01 = 0x01, // wait for hp depletion
    ANIM_CMD_WAIT_02 = 0x02, // wait for dodge start, then dodge
    ANIM_CMD_WAIT_03 = 0x03, // wait for attack start
    ANIM_CMD_WAIT_04 = 0x04,
    ANIM_CMD_WAIT_05 = 0x05, // wait for spell animation?
    // TODO: more
    ANIM_CMD_WAIT_13 = 0x13, // unk
    ANIM_CMD_WAIT_18 = 0x18, // wait for dodge start, then forward dodge
    ANIM_CMD_WAIT_2D = 0x2D, // unk
    ANIM_CMD_WAIT_39 = 0x39, // unk
    ANIM_CMD_WAIT_52 = 0x52, // unk
};

// TODO: add macro helpers for writing animation scripts.

#define ANIM_IS_DISABLED(anim) ((anim)->state == 0)

#define ANINS_IS_NOT_FORCESPRITE(instruction) ((instruction) & 0x80000000)
#define ANINS_IS_PTRINS(instruction) ((instruction) & 0x40000000)

#define ANINS_FORCESPRITE_GET_ADDRESS(instruction) ((void*) ((instruction) &~ 0xF0000003))
#define ANINS_FORCESPRITE_GET_DELAY(instruction) ((((instruction) >> 26) & 0x1C) + ((instruction) & 3))

#define ANINS_PTRINS_GET_TYPE(instruction) (0x3 & ((instruction) >> 28))
#define ANINS_PTRINS_GET_ADDRESS(instruction) ((void*) ((instruction) &~ 0xF0000000))

#define ANINS_GET_TYPE(instruction) (0x3F & ((instruction) >> 24))

#define ANINS_WAIT_GET_DELAY(instruction) ((instruction) & 0xFFFF)

#define ANINS_MOVE_GET_XOFF(instruction) (((int) ((instruction) << 24)) >> 24)
#define ANINS_MOVE_GET_YOFF(instruction) (((int) ((instruction) << 16)) >> 24)
#define ANINS_MOVE_GET_DELAY(instruction) (((instruction) >> 16) & 0xFF)

#define ANINS_COMMAND_GET_ID(instruction) (0xFF & (instruction))

#define ANINS_FRAME_GET_DELAY(instruction) ((instruction) & 0xFFFF)
#define ANINS_FRAME_GET_UNK(instruction) ((instruction) >> 16) & 0xFF

enum
{
    ANIM_INS_TYPE_STOP    = 0,
    ANIM_INS_TYPE_END     = 1,
    ANIM_INS_TYPE_LOOP    = 2,
    ANIM_INS_TYPE_MOVE    = 3,
    ANIM_INS_TYPE_WAIT    = 4,
    ANIM_INS_TYPE_COMMAND = 5,
    ANIM_INS_TYPE_FRAME   = 6,
};

void AnimUpdateAll(void);
void AnimClearAll(void);
struct Anim* AnimCreate_unused(const void* script);
struct Anim* AnimCreate(const void* script, u16 displayPriority);
void AnimSort(void);
void AnimDelete(struct Anim* anim);
void AnimDisplay(struct Anim* anim);

bool PrepareBattleGraphicsMaybe(void);
// ??? sub_8057CAC(???);
s8 sub_8057DA8(u16, u16);
s8 sub_8057ED0(u16, u16);
// ??? GetSpellAnimId(???);
// ??? sub_80581A0(???);
void sub_80581EC(void);
int GetBattleAnimationId(struct Unit *unit, const void *anim, u16 wpn, u32 *out);
// ??? sub_8058918(???);
// ??? sub_805893C(???);
int SomethingFilterBattleAnimId(s16, u16 item);
int GetAllegienceId(u16);
void EkrPrepareBanimfx(struct Anim *anim, int);
// ??? GetSomeAISRelatedIndexMaybeByID(???);
u32 GetAnimRoundType(int);
s16 GetEfxHp(int pos_based_round);
// ??? GetEfxHpModMaybe(???);
// ??? IsItemDisplayedInBattle(???);
// ??? sub_8058AC8(???);
// ??? sub_8058B08(???);
// ??? sub_8058B24(???);
// ??? sub_8058B64(???);
void sub_8058B70(void);
bool sub_8058B7C(void);
// ??? sub_8058B98(???);
// ??? sub_8058BA8(???);
// ??? sub_8058BB8(???);
void BattleAIS_ExecCommands(void);
// ??? _08058BD4(???);
// ??? _080596E0(???);
void sub_80598CC(struct Anim *anim);
// ??? NewEkrChienCHR(???);
// ??? sub_8059924(???);
// ??? RegisterAISSheetGraphics(???);
// ??? sub_8059970(???);
// ??? sub_805999C(???);
void sub_80599E8(void);
void sub_8059D28(void);
// ??? sub_8059DB8(???);
// ??? sub_8059E18(???);
// ??? sub_8059F5C(???);
void BanimPrepareSpecificScript(struct Anim *anim, int);
int sub_805A154(struct Anim *anim);
int GetAISSubjectId(struct Anim *anim);
// ??? GetSomeBoolean(???);
// ??? sub_805A1D0(???);
int sub_805A21C(s16);
// ??? sub_805A268(???);
struct Anim *GetCoreAIStruct(struct Anim *anim);
// ??? sub_805A2D0(???);
s16 sub_805A2F0(struct Anim *anim);
// ??? GetSomeAISRelatedIndexMaybe(???);
// ??? sub_805A334(???);
void SetAnimStateHidden(int ais_id);
void SetAnimStateUnHidden(int ais_id);
// ??? sub_805A3DC(???);
// ??? sub_805A580(???);
// ??? sub_805A5A8(???);
// ??? sub_805A60C(???);
// ??? sub_805A7B4(???);
// ??? sub_805A930(???);
void sub_805A940(void*, u16, u16);
// ??? sub_805A95C(???);
// ??? sub_805A96C(???);
// ??? sub_805A990(???);
// ??? sub_805A9A4(???);
void NewEfxAnimeDrvProc(void);
void EndEfxAnimeDrvProc(void);
// ??? ExecAllAIS(???);
// ??? NewEkrUnitMainMini(???);
// ??? EkrUnitMainMiniMain(???);
void sub_805AA68(void *);
// ??? sub_805AE40(???);
// ??? sub_805AE58(???);
// ??? sub_805AFA0(???);
void SetBanimArenaFlag(int);
int GetBattleAnimArenaFlag(void);
// ??? sub_805B034(???);
void PlaySound8FForArenaMaybe(void);
void sub_805B094(void);
void BeginAnimsOnBattle_Arena(void);
void sub_805B0CC(void);
void sub_8070D04(void *ptr, u16 a, u16 b, int r3, int r4);
void FillBGRect(void *ptr, u16 a, u16 b, int r3, int r4);
// ??? sub_8070DBC(???);
// ??? sub_8070E24(???);
void sub_8070E94(void *ptr1, void *ptr2, u16 a, u16 b, int r4, int r5);
// ??? sub_8070EC4(???);
void sub_8070EF4(void *, int, void *, int, int, int, int, int);
void sub_8070FA4(void *, int, void *, int, int, int, int, int);
// ??? sub_8071068(???);
void sub_8071140(void *ptr, int);
// ??? sub_80711C0(???);
void EkrMaybePalFadeWithVal(void *pal_buf, int line, int length, int ref);
void sub_807132C(void *ptr, int, int, int);
// ??? sub_80713B0(???);
// ??? sub_8071468(???);
// ??? sub_80714DC(???);
// ??? sub_807151C(???);
// ??? sub_8071574(???);
// ??? sub_80715F4(???);
void EkrUpdateSomePalMaybe(int);
// ??? sub_80716B0(???);
// ??? NewEkrsubAnimeEmulator(???);
// ??? sub_8071714(???);
// ??? sub_80717D4(???);
// ??? sub_80717F0(???);
// ??? EkrEfxHandleUnitHittedEffect(???);
void SomePlaySound_8071990(int, int);
// ??? Loop6C_efxSoundSE(???);
void sub_8071A44(int);
// ??? sub_8071A54(???);
// ??? StopBGM1(???);
void sub_8071A8C(void);
// ??? sub_8071A98(???);
// ??? sub_8071AA4(???);
void M4aPlayWithPostionCtrl(int, int, int);
// ??? sub_8071B6C(???);
// ??? sub_8072258(???);
// ??? sub_80723A4(???);
// ??? sub_80723D4(???);
// ??? sub_8072400(???);
// ??? sub_8072450(???);
// ??? sub_8072504(???);
// ??? sub_8072548(???);
// ??? sub_8072570(???);
void sub_80726AC(void);
void sub_807289C(void);
// ??? sub_80728D0(???);
// ??? sub_807290C(???);
void EkrSoundSomeBark(int, int, int, int);
// ??? sub_80729C0(???);
bool EkrClasschgFinished(void);
void EndEkrClasschg(void);
void NewEkrClassChg(struct Anim *anim);
// ??? sub_8072A44(???);
// ??? sub_8072DC0(???);
// ??? EndEfxStatusUnit(???);
// ??? sub_8072DD8(???);
// ??? sub_8072E1C(???);
// ??? sub_8072E60(???);
// ??? NewEfxClasschgBGSE00(???);
// ??? sub_8072EF4(???);
// ??? NewEfxClasschgBGSE01(???);
// ??? sub_8072F74(???);
// ??? NewEfxClasschgOBJGain(???);
// ??? sub_8072FD0(???);
// ??? NewEfxClasschgOBJDrop(???);
// ??? sub_8073034(???);
// ??? NewEfxClasschgOBJDiffusion(???);
// ??? sub_80730AC(???);
// ??? NewEfxClasschgFIN(???);
// ??? sub_80731C8(???);
// ??? NewEfxClasschgCLONE(???);
// ??? sub_8073240(???);
// ??? sub_80732A4(???);
// ??? NewEfxBlackInOutUnit(???);
// ??? sub_80732E0(???);
// ??? NewEfxWhiteInOutUnit(???);
// ??? sub_80733C0(???);
// ??? NewEfxClasschgRST(???);
// ??? sub_80734AC(???);
// ??? sub_8074580(???);
// ??? sub_8074598(???);
// ??? nullsub_62(???);
// ??? sub_8074610(???);
// ??? sub_807461C(???);
// ??? sub_8074634(???);
// ??? sub_8074638(???);
// ??? sub_80746C0(???);
// ??? sub_807478C(???);
// ??? sub_8074798(???);
// ??? sub_80747A4(???);
// ??? sub_8074834(???);
// ??? sub_8074874(???);
void sub_80748C4(void *ais_main);
// ??? sub_807490C(???);
void sub_8074964(void *ais_main);
// ??? sub_80749B0(???);
void sub_80749F4(void *ais_main, int, int);
// ??? sub_8074A54(???);
void sub_8074A60(void *ais_main);
// ??? sub_8074A94(???);
// ??? sub_8074AFC(???);
// ??? sub_8074B38(???);
// ??? sub_8074B40(???);
// ??? sub_8074B90(???);
// ??? sub_8074BF4(???);
// ??? sub_8074C10(???);
// ??? sub_8074C78(???);
// ??? sub_8074D58(???);
// ??? sub_8074E6C(???);
// ??? sub_8074EDC(???);
// ??? sub_8074F14(???);
bool sub_8074F3C(void);
void nullsub_18(void);
void NewEkrTriangle(struct Anim *anim);
// ??? sub_8074F80(???);
// ??? sub_8075184(???);
// ??? sub_80751BC(???);
// ??? sub_807527C(???);
// ??? sub_8075308(???);
// ??? sub_8075350(???);
// ??? sub_80753FC(???);
// ??? sub_8075424(???);
// ??? sub_807545C(???);
// ??? sub_8075538(???);
// ??? sub_80756BC(???);
// ??? sub_8075718(???);
// ??? sub_8075828(???);
// ??? sub_8075874(???);
// ??? sub_807589C(???);
// ??? sub_80758D4(???);
// ??? sub_8075A50(???);
// ??? sub_8075A70(???);
void sub_8075AB4(int);
void sub_8075AD8(int);
bool CheckEkrPopupEnded(void);
void DeleteAnimsOnPopup(void);
// ??? sub_8075B58(???);
// ??? sub_8075B68(???);
// ??? MakeBattlePopupTileMapFromTSA(???);
// ??? DrawBattlePopup(???);
void NewEkrPopup(void);
// ??? BattlePopup_Wait16Frames(???);
// ??? ekrPopup_DrawWRankUp(???);
// ??? ekrPopup_WaitWRankUp(???);
// ??? ekrPopup_DrawWRankUp2(???);
// ??? ekrPopup_WaitWRankUp2(???);
// ??? ekrPopup_DrawWpnBroke(???);
// ??? ekrPopup_WaitWpnBroke(???);
// ??? ekrPopup_DrawWpnBroke2(???);
// ??? ekrPopup_WaitWpnBroke2(???);
// ??? ekrPopup_MarkEnd(???);
// ??? nullsub_68(???);
// ??? sub_8076250(???);
// ??? sub_8076290(???);
// ??? sub_80762D0(???);
int sub_8076310(void);
void BeginAnimsOnBattle_Hensei(void);
void sub_8076354(void);
// ??? NewEkrHenseiInitPROC(???);
// ??? sub_8076380(???);
// ??? sub_80763E0(???);
// ??? sub_8076400(???);
// ??? sub_8076464(???);
// ??? sub_8076470(???);
// ??? sub_8076484(???);
// ??? sub_80764B0(???);
// ??? sub_8076514(???);
void EfxDoDemonKingIntroAnim(struct Anim *anim);

#endif // GUARD_ANIME_H
