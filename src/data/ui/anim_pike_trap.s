@ AP (object/sprite animation) definition(s). Offset tables computed via assembler
@ label arithmetic; OAM/anim data uses the macros in include/ap.inc. See include/ap.h
@ / src/ap.c. Byte-identical to the original data.

	.include "ap.inc"

	.data
	.global SpriteAnim_PikeTrap
	.align 1, 0
	.type SpriteAnim_PikeTrap, %object
SpriteAnim_PikeTrap:
	.hword .LSpriteAnim_PikeTrap_ftab - SpriteAnim_PikeTrap, .LSpriteAnim_PikeTrap_atab - SpriteAnim_PikeTrap
.LSpriteAnim_PikeTrap_ftab:
	.hword .LSpriteAnim_PikeTrap_frame_0 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_1 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_2 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_3 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_4 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_5 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_6 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_7 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_8 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_9 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_10 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_11 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_12 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_13 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_14 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_15 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_16 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_17 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_18 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_19 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_20 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_21 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_22 - .LSpriteAnim_PikeTrap_ftab
	.hword .LSpriteAnim_PikeTrap_frame_23 - .LSpriteAnim_PikeTrap_ftab
.LSpriteAnim_PikeTrap_atab:
	.hword .LSpriteAnim_PikeTrap_anim_0 - .LSpriteAnim_PikeTrap_atab
	.hword .LSpriteAnim_PikeTrap_anim_1 - .LSpriteAnim_PikeTrap_atab
	.hword .LSpriteAnim_PikeTrap_anim_2 - .LSpriteAnim_PikeTrap_atab
.LSpriteAnim_PikeTrap_frame_0:
	ap_objs 1
	ap_obj 0x80F8, 0x01F8, 0x0004
.LSpriteAnim_PikeTrap_frame_1:
	ap_objs 3
	ap_obj 0x00F0, 0x41EF, 0x0005
	ap_obj 0x0000, 0x41EF, 0x0007
	ap_obj 0x00F8, 0x41F8, 0x0003
.LSpriteAnim_PikeTrap_frame_2:
	ap_objs 2
	ap_obj 0x00F8, 0x41FC, 0x0003
	ap_obj 0x80F8, 0x01F8, 0x0002
.LSpriteAnim_PikeTrap_frame_3:
	ap_objs 2
	ap_obj 0x00F8, 0x41FA, 0x0000
	ap_obj 0x80F8, 0x01F8, 0x0002
.LSpriteAnim_PikeTrap_frame_4:
	ap_objs 1
	ap_obj 0x00F8, 0x41F8, 0x0000
.LSpriteAnim_PikeTrap_frame_5:
	ap_objs 2
	ap_obj 0x00F8, 0x41F9, 0x0000
	ap_obj 0x80F8, 0x01F8, 0x0002
.LSpriteAnim_PikeTrap_frame_6:
	ap_objs 2
	ap_obj 0x80F8, 0x01FC, 0x0001
	ap_obj 0x80F8, 0x01F8, 0x0000
.LSpriteAnim_PikeTrap_frame_7:
	ap_objs 1
	ap_obj 0x80F8, 0x01F8, 0x0001
.LSpriteAnim_PikeTrap_frame_8:
	ap_objs 1
	ap_obj 0x80F8, 0x1000, 0x0004
.LSpriteAnim_PikeTrap_frame_9:
	ap_objs 3
	ap_obj 0x00F0, 0x5001, 0x0005
	ap_obj 0x0000, 0x5001, 0x0007
	ap_obj 0x00F8, 0x51F8, 0x0003
.LSpriteAnim_PikeTrap_frame_10:
	ap_objs 2
	ap_obj 0x00F8, 0x51F4, 0x0003
	ap_obj 0x80F8, 0x1000, 0x0002
.LSpriteAnim_PikeTrap_frame_11:
	ap_objs 2
	ap_obj 0x00F8, 0x51F6, 0x0000
	ap_obj 0x80F8, 0x1000, 0x0002
.LSpriteAnim_PikeTrap_frame_12:
	ap_objs 1
	ap_obj 0x00F8, 0x51F8, 0x0000
.LSpriteAnim_PikeTrap_frame_13:
	ap_objs 2
	ap_obj 0x00F8, 0x51F7, 0x0000
	ap_obj 0x80F8, 0x1000, 0x0002
.LSpriteAnim_PikeTrap_frame_14:
	ap_objs 2
	ap_obj 0x80F8, 0x11FC, 0x0001
	ap_obj 0x80F8, 0x1000, 0x0000
.LSpriteAnim_PikeTrap_frame_15:
	ap_objs 1
	ap_obj 0x80F8, 0x1000, 0x0001
.LSpriteAnim_PikeTrap_frame_16:
	ap_objs 1
	ap_obj 0x4000, 0x01F8, 0x000B
.LSpriteAnim_PikeTrap_frame_17:
	ap_objs 2
	ap_obj 0x4000, 0x81F0, 0x000F
	ap_obj 0x00F8, 0x41F8, 0x000B
.LSpriteAnim_PikeTrap_frame_18:
	ap_objs 2
	ap_obj 0x00F4, 0x41F8, 0x000B
	ap_obj 0x4000, 0x01F8, 0x002D
.LSpriteAnim_PikeTrap_frame_19:
	ap_objs 2
	ap_obj 0x00F6, 0x41F8, 0x0009
	ap_obj 0x4000, 0x01F8, 0x002D
.LSpriteAnim_PikeTrap_frame_20:
	ap_objs 1
	ap_obj 0x00F8, 0x41F8, 0x0009
.LSpriteAnim_PikeTrap_frame_21:
	ap_objs 2
	ap_obj 0x00F7, 0x41F8, 0x0009
	ap_obj 0x4000, 0x01F8, 0x002D
.LSpriteAnim_PikeTrap_frame_22:
	ap_objs 2
	ap_obj 0x40FC, 0x01F8, 0x0009
	ap_obj 0x4000, 0x01F8, 0x000D
.LSpriteAnim_PikeTrap_frame_23:
	ap_objs 1
	ap_obj 0x4000, 0x01F8, 0x0009
.LSpriteAnim_PikeTrap_anim_0:
	ap_anim 3, 0
	ap_anim 2, 1
	ap_anim 2, 2
	ap_anim 2, 3
	ap_anim 2, 4
	ap_anim 2, 3
	ap_anim 2, 4
	ap_anim 2, 3
	ap_anim 2, 4
	ap_anim 2, 5
	ap_anim 50, 4
	ap_anim 2, 6
	ap_anim 2, 7
	ap_anim_delete
	ap_anim_loop
.LSpriteAnim_PikeTrap_anim_1:
	ap_anim 3, 8
	ap_anim 2, 9
	ap_anim 2, 10
	ap_anim 2, 11
	ap_anim 2, 12
	ap_anim 2, 11
	ap_anim 2, 12
	ap_anim 2, 11
	ap_anim 2, 12
	ap_anim 2, 13
	ap_anim 50, 12
	ap_anim 2, 14
	ap_anim 2, 15
	ap_anim_delete
	ap_anim_loop
.LSpriteAnim_PikeTrap_anim_2:
	ap_anim 3, 16
	ap_anim 2, 17
	ap_anim 2, 18
	ap_anim 2, 19
	ap_anim 2, 20
	ap_anim 2, 19
	ap_anim 2, 20
	ap_anim 2, 19
	ap_anim 2, 20
	ap_anim 2, 21
	ap_anim 50, 20
	ap_anim 2, 22
	ap_anim 2, 23
	ap_anim_delete
	ap_anim_loop
	.size SpriteAnim_PikeTrap, . - SpriteAnim_PikeTrap
