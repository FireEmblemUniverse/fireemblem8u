@ anim script macros
@ by Mokha

ANFMT_PTRINS = 0x40000000
ANFMT_PTRINS_FUNC  = ANFMT_PTRINS + 0x00000000
ANFMT_PTRINS_FRAME = ANFMT_PTRINS + 0x10000000

ANFMT_NOT_FORCESPRITE = 0x80000000

ANIM_INS_TYPE_STOP    = 0
ANIM_INS_TYPE_END     = 1
ANIM_INS_TYPE_LOOP    = 2
ANIM_INS_TYPE_MOVE    = 3
ANIM_INS_TYPE_WAIT    = 4
ANIM_INS_TYPE_COMMAND = 5
ANIM_INS_TYPE_FRAME   = 6
ANFMT_INS_TYPE_STOP    = (ANIM_INS_TYPE_STOP    << 24)
ANFMT_INS_TYPE_END     = (ANIM_INS_TYPE_END     << 24)
ANFMT_INS_TYPE_LOOP    = (ANIM_INS_TYPE_LOOP    << 24)
ANFMT_INS_TYPE_MOVE    = (ANIM_INS_TYPE_MOVE    << 24)
ANFMT_INS_TYPE_WAIT    = (ANIM_INS_TYPE_WAIT    << 24)
ANFMT_INS_TYPE_COMMAND = (ANIM_INS_TYPE_COMMAND << 24)
ANFMT_INS_TYPE_FRAME   = (ANIM_INS_TYPE_FRAME   << 24)

.macro ANIM_SPRITE oam0, oam1, oam2, x, y
    .short \oam0
    .short \oam1
    .short \oam2
    .short \x
    .short \y
    .short 0
.endm

.macro ANIM_SPRITE_XFLIP oam0, oam1, oam2, x, y
    .short \oam0
    .short \oam1 + ATTR1_FLIP_X
    .short \oam2
    .short \x
    .short \y
    .short 0
.endm

.macro ANIM_SPRITE_AFFIN cnt, pa, pb, pc, pd
    .short \cnt
    .short 0xFFFF
    .short \pa
    .short \pb
    .short \pc
    .short \pd
.endm

.macro ANIM_SPRITE_END
    ANIM_SPRITE 0x1, 0, 0, 0, 0
.endm

.macro ANIMSCR_FORCE_SPRITE anim_sprite, time
    .4byte \anim_sprite + (\time & 0x3) + ((\time & 0x1C) << 26)
.endm

.macro ANIMSCR_WAIT time
    .4byte ANFMT_NOT_FORCESPRITE + ANFMT_INS_TYPE_WAIT + \time
.endm

.macro ANIMSCR_BLOCKED
    .4byte ANFMT_NOT_FORCESPRITE + ANFMT_INS_TYPE_STOP
.endm
