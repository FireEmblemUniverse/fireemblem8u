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

    /* 20 */ const u32 * pScrCurrent;
    /* 24 */ const u32 * pScrStart;
    /* 28 */ const void * pImgSheet;
    /* 2C */ void* pImgSheetBuf;
    /* 30 */ const void * pSpriteDataPool; // aka "OAM data"

    /* 34 */ struct Anim * pPrev;
    /* 38 */ struct Anim * pNext;

    /* 3C */ const void * pSpriteData;
    /* 40 */ const void * pUnk40;
    /* 44 */ const void * pUnk44;
};

enum Anim_state {
    ANIM_BIT_ENABLED = (1 << 0),
    ANIM_BIT_HIDDEN  = (1 << 1),
    ANIM_BIT_2       = (1 << 2),
    ANIM_BIT_FROZEN  = (1 << 3),
};

enum Anim_state2 {
    ANIM_BIT2_0001        = (1 << 0),
    ANIM_BIT2_0002        = (1 << 1),
    ANIM_BIT2_0004        = (1 << 2),
    ANIM_BIT2_0008        = (1 << 3),
    ANIM_BIT2_0010        = (1 << 4),
    ANIM_BIT2_0020        = (1 << 5),
    ANIM_BIT2_0040        = (1 << 6),
    ANIM_BIT2_0080        = (1 << 7),

    ANIM_BIT2_FRONT_FRAME = (1 << 8),
    ANIM_BIT2_BACK_FRAME  = (0 << 8),

    ANIM_BIT2_POS_RIGHT   = (1 << 9),
    ANIM_BIT2_POS_LEFT    = (0 << 9),

    ANIM_BIT2_0400        = (1 << 10),
    ANIM_BIT2_0800        = (1 << 11),
    ANIM_BIT2_COMMAND     = (1 << 12), /* 0x1000 */
    ANIM_BIT2_FRAME       = (1 << 13), /* 0x2000 */
    ANIM_BIT2_STOP        = (1 << 14), /* 0x4000 */
    ANIM_BIT2_8000        = (1 << 15), /* 0x8000 */
};

#define ANIM_BIT2_CMD_MASK (ANIM_BIT2_COMMAND | ANIM_BIT2_FRAME | ANIM_BIT2_STOP | ANIM_BIT2_8000)

enum Anim_state3 {
    ANIM_BIT3_TAKE_BACK_ENABLE   = (1 << 0),
    ANIM_BIT3_NEXT_ROUND_START   = (1 << 1),
    ANIM_BIT3_0004               = (1 << 2),
    ANIM_BIT3_HIT_EFFECT_APPLIED = (1 << 3),
    ANIM_BIT3_0010               = (1 << 4),
    ANIM_BIT3_BLOCKING           = (1 << 5),
    ANIM_BIT3_BLOCKEND           = (1 << 6),
    ANIM_BIT3_0080               = (1 << 7),
    ANIM_BIT3_0100               = (1 << 8),
    ANIM_BIT3_0200               = (1 << 9),
    ANIM_BIT3_0400               = (1 << 10),
    ANIM_BIT3_0800               = (1 << 11),
    ANIM_BIT3_1000               = (1 << 12),
    ANIM_BIT3_2000               = (1 << 13),
    ANIM_BIT3_4000               = (1 << 14),
    ANIM_BIT3_NEW_ROUND_START    = (1 << 15),
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

#define ANIM_SPRITE_END {.header = 1}

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

enum anim_inst_type {
    ANIM_INS_TYPE_STOP    = 0,
    ANIM_INS_TYPE_END     = 1,
    ANIM_INS_TYPE_LOOP    = 2,
    ANIM_INS_TYPE_MOVE    = 3,
    ANIM_INS_TYPE_WAIT    = 4,
    ANIM_INS_TYPE_COMMAND = 5,
    ANIM_INS_TYPE_FRAME   = 6,
};

#define ANFMT_FORCESPRITE 0x00000000
#define ANFMT_NOT_FORCESPRITE 0x80000000
#define ANFMT_PTRINS 0x40000000
#define ANFMT_INST_TYPE(type) (((type) & 0x3F) << 24)
#define ANIMFMT_OAM_DURATION(duration) (((duration) & 3) + ((duration & 0x3C) << 26))

#define ANINS_IS_NOT_FORCESPRITE(instruction) ((instruction) & ANFMT_NOT_FORCESPRITE)
#define ANINS_IS_PTRINS(instruction) ((instruction) & ANFMT_PTRINS)
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

/* Anim Script commands */
typedef u32 AnimScr;
#define ANIMSCR_FRAME(delay, img, oam2) \
    (ANFMT_NOT_FORCESPRITE + ANFMT_INST_TYPE(ANIM_INS_TYPE_FRAME) + ((delay) & 0xFFFF)), \
    (AnimScr)(img), \
    (AnimScr)(oam2)

#define ANIMSCR_BLOCKED \
    (ANFMT_NOT_FORCESPRITE + ANFMT_INST_TYPE(ANIM_INS_TYPE_STOP))

#define ANIMSCR_FORCE_SPRITE(anim_sprite, duration) \
    (ANFMT_FORCESPRITE + (AnimScr)(anim_sprite) + ANIMFMT_OAM_DURATION(duration))

void AnimUpdateAll(void);
void AnimClearAll(void);
struct Anim * AnimCreate_unused(const void * script);
struct Anim * AnimCreate(const void* script, u16 displayPriority);
void AnimSort(void);
void AnimDelete(struct Anim * anim);
void AnimDisplay(struct Anim * anim);

bool PrepareBattleGraphicsMaybe(void);
u16 sub_8057CAC(struct Unit * unit, const struct BattleAnimDef * pBattleAnimDef, u16, int * out);
s8 sub_8057DA8(u16, u16);
s8 sub_8057ED0(u16, u16);
// ??? GetSpellAnimId(???);
// ??? sub_80581A0(???);
void ParseBattleHitToBanimCmd(void);
u16 GetBattleAnimationId(struct Unit * unit, const struct BattleAnimDef * anim_def, u16 wpn, u32 * out);
// ??? sub_8058918(???);
// ??? sub_805893C(???);
u16 * FilterBattleAnimCharacterPalette(s16 banim_index, u16 item);
int GetAllegienceId(u32 faction);

#endif // GUARD_ANIME_H
