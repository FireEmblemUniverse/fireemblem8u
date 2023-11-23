@ anim script macros

@ by Mokha

.macro ANIM_SPRITE header, oam2, x, y
    .word \header
    .short \oam2
    .short \x
    .short \y
    .short 0
.endm

.macro ANIM_SPRITE_END
    ANIM_SPRITE 0x1, 0, 0, 0
.endm

.macro ANIMSCR_FORCE_SPRITE anim_sprite, duration
    .4byte \anim_sprite + \duration
.endm

.macro ANIMSCR_BLOCKED
    .4byte 0x80000000
.endm