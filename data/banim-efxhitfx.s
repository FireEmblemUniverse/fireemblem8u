	.section .data
    .include "animscr.inc"
    .include "gba_sprites.inc"

.global AnimSprite_NoDamage1
AnimSprite_NoDamage1:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x20 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x18 /* D */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage2
AnimSprite_NoDamage2:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x1F /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x17 /* D */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage3
AnimSprite_NoDamage3:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x1E /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x15 /* D */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage4
AnimSprite_NoDamage4:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x1B /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x20 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x13 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x18 /* A */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage5
AnimSprite_NoDamage5:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x17 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x1F /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x11 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x17 /* A */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage6
AnimSprite_NoDamage6:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x12 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x1D /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x15 /* A */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage7
AnimSprite_NoDamage7:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x1A /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x11 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x13 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x14 /* M */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage8
AnimSprite_NoDamage8:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x11 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x16 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x12 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x11 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x13 /* M */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage9
AnimSprite_NoDamage9:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x13 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x11 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x13 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x11 /* M */
    ANIM_SPRITE_END

.global AnimSprite_NoDamageA
AnimSprite_NoDamageA:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x15 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x10 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x13 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x11 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x14 /* A */
    ANIM_SPRITE_END

.global AnimSprite_NoDamageB
AnimSprite_NoDamageB:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x16 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x11 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x12 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x12 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x11 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x13 /* A */
    ANIM_SPRITE_END

.global AnimSprite_NoDamageC
AnimSprite_NoDamageC:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x16 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x13 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x11 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x13 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x12 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x11 /* A */
    ANIM_SPRITE_END

.global AnimSprite_NoDamageD
AnimSprite_NoDamageD:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x15 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x15 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x13 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x12 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x12 /* G */
    ANIM_SPRITE_END

.global AnimSprite_NoDamageE
AnimSprite_NoDamageE:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x13 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x16 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x12 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x11 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x11 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x11 /* G */
    ANIM_SPRITE_END

.global AnimSprite_NoDamageF
AnimSprite_NoDamageF:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x11 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x16 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x11 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x12 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x10 /* G */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage10
AnimSprite_NoDamage10:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x15 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x12 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x11
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x12 /* E */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage11
AnimSprite_NoDamage11:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x13 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x11 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x12 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x11 /* E */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage12
AnimSprite_NoDamage12:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x11 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x11 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x10 /* E */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage13
AnimSprite_NoDamage13:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x10 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x10 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x11 /* E */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x20, -0x12 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage14
AnimSprite_NoDamage14:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x10 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x11 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x12 /* E */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x20, -0x11 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage15
AnimSprite_NoDamage15:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x10 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x10 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x11 /* E */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x20, -0x10 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage16
AnimSprite_NoDamage16:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x10 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x10 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x10 /* E */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x20, -0x11 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage17
AnimSprite_NoDamage17:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x10 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x10 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x10 /* E */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x20, -0x12 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage18
AnimSprite_NoDamage18:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x10 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x10 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x10 /* E */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x20, -0x11 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage19
AnimSprite_NoDamage19:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000 / 0x20, -0x28, -0x10 /* N */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x020 / 0x20, -0x20, -0x10 /* O */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x040 / 0x20, -0x10, -0x10 /* D */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, -0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x080 / 0x20, -0x00, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x060 / 0x20, +0x08, -0x10 /* A */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0A0 / 0x20, +0x10, -0x10 /* G */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0C0 / 0x20, +0x18, -0x10 /* E */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x20, -0x10 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_NoDamage1A
AnimSprite_NoDamage1A:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x180 / 0x20, 0x0, -0x08
    ANIM_SPRITE_END

.global AnimSprite_Miss1
AnimSprite_Miss1:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x20 /* M */
    ANIM_SPRITE_END

.global AnimSprite_Miss2
AnimSprite_Miss2:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x1F /* M */
    ANIM_SPRITE_END

.global AnimSprite_Miss3
AnimSprite_Miss3:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x1D /* M */
    ANIM_SPRITE_END

.global AnimSprite_Miss4
AnimSprite_Miss4:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x1A /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x18 /* I */
    ANIM_SPRITE_END

.global AnimSprite_Miss5
AnimSprite_Miss5:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x16 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x17 /* I */
    ANIM_SPRITE_END

.global AnimSprite_Miss6
AnimSprite_Miss6:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x11 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x15 /* I */
    ANIM_SPRITE_END

.global AnimSprite_Miss7
AnimSprite_Miss7:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x12 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x14 /* S */
    ANIM_SPRITE_END

.global AnimSprite_Miss8
AnimSprite_Miss8:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x11 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x13 /* S */
    ANIM_SPRITE_END

.global AnimSprite_Miss9
AnimSprite_Miss9:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x13 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x11 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x11 /* S */
    ANIM_SPRITE_END

.global AnimSprite_MissA
AnimSprite_MissA:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x15 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x12 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x14 /* S */
    ANIM_SPRITE_END

.global AnimSprite_MissB
AnimSprite_MissB:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x16 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x12 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x11 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x13 /* S */
    ANIM_SPRITE_END

.global AnimSprite_MissC
AnimSprite_MissC:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x16 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x11 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x12 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x11 /* S */
    ANIM_SPRITE_END

.global AnimSprite_MissD
AnimSprite_MissD:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x15 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x11 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x0C, -0x14 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_MissE
AnimSprite_MissE:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x13 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x11 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x0C, -0x13 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_MissF
AnimSprite_MissF:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x11 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x12 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x0C, -0x11 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_Miss10
AnimSprite_Miss10:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x11 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x0C, -0x10 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_Miss11
AnimSprite_Miss11:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x0C, -0x11 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_Miss12
AnimSprite_Miss12:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x0C, -0x12 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_Miss13
AnimSprite_Miss13:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x0C, -0x11 /* ! */
    ANIM_SPRITE_END

.global AnimSprite_Miss14
AnimSprite_Miss14:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x100 / 0x20, -0x14, -0x10 /* M */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x120 / 0x20, -0x0C, -0x10 /* I */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, -0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x140 / 0x20, +0x04, -0x10 /* S */
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0E0 / 0x20, +0x0C, -0x10 /* ! */
    ANIM_SPRITE_END

	.global AnimScr_NoDamage
AnimScr_NoDamage:
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage1, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage2, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage3, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage4, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage5, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage6, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage7, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage8, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage9, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamageA, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamageB, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamageC, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamageD, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamageE, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamageF, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage10, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage11, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage12, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage13, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage14, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage15, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage16, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage17, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage18, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage19, 31
    ANIMSCR_WAIT 0x13
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage1A, 31
    ANIMSCR_WAIT 0x13
    ANIMSCR_BLOCKED

	.global AnimScr_Miss
AnimScr_Miss:
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss1, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss2, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss3, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss4, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss5, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss6, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss7, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss8, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss9, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_MissA, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_MissB, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_MissC, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_MissD, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_MissE, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_MissF, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss10, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss11, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss12, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss13, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_Miss14, 31
    ANIMSCR_WAIT 0x13
    ANIMSCR_FORCE_SPRITE AnimSprite_NoDamage1A, 31
    ANIMSCR_WAIT 0x13
    ANIMSCR_BLOCKED
