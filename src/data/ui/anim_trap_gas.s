@ AP (object/sprite animation) definition(s). Offset tables computed via assembler
@ label arithmetic; OAM/anim data uses the macros in include/ap.inc. See include/ap.h
@ / src/ap.c. Byte-identical to the original data.

	.include "ap.inc"

	.data
	.global SpriteAnim_GasTrapVertical
	.align 1, 0
	.type SpriteAnim_GasTrapVertical, %object
SpriteAnim_GasTrapVertical:
	.hword .LSpriteAnim_GasTrapVertical_ftab - SpriteAnim_GasTrapVertical, .LSpriteAnim_GasTrapVertical_atab - SpriteAnim_GasTrapVertical
.LSpriteAnim_GasTrapVertical_ftab:
	.hword .LSpriteAnim_GasTrapVertical_frame_0 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_1 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_2 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_3 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_4 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_5 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_6 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_7 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_8 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_9 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_10 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_11 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_12 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_13 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_14 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_15 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_16 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_17 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_18 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_19 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_20 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_21 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_22 - .LSpriteAnim_GasTrapVertical_ftab
	.hword .LSpriteAnim_GasTrapVertical_frame_23 - .LSpriteAnim_GasTrapVertical_ftab
.LSpriteAnim_GasTrapVertical_atab:
	.hword .LSpriteAnim_GasTrapVertical_anim_0 - .LSpriteAnim_GasTrapVertical_atab
	.hword .LSpriteAnim_GasTrapVertical_anim_1 - .LSpriteAnim_GasTrapVertical_atab
.LSpriteAnim_GasTrapVertical_frame_0:
	ap_objs 1
	ap_obj 0x00F0, 0x41F8, 0x0000
.LSpriteAnim_GasTrapVertical_frame_1:
	ap_objs 1
	ap_obj 0x00F0, 0x41F8, 0x0002
.LSpriteAnim_GasTrapVertical_frame_2:
	ap_objs 1
	ap_obj 0x00F0, 0x41F8, 0x0004
.LSpriteAnim_GasTrapVertical_frame_3:
	ap_objs 2
	ap_obj 0x00E8, 0x41F8, 0x0006
	ap_obj 0x00F8, 0x41F8, 0x0008
.LSpriteAnim_GasTrapVertical_frame_4:
	ap_objs 3
	ap_obj 0x00F8, 0x51F8, 0x0008
	ap_obj 0x00E0, 0x41F8, 0x000A
	ap_obj 0x00F0, 0x41F8, 0x000C
.LSpriteAnim_GasTrapVertical_frame_5:
	ap_objs 4
	ap_obj 0x00F8, 0x41F8, 0x0008
	ap_obj 0x00D2, 0x41F8, 0x000E
	ap_obj 0x00E2, 0x41F8, 0x0010
	ap_obj 0x00F2, 0x41F8, 0x0012
.LSpriteAnim_GasTrapVertical_frame_6:
	ap_objs 4
	ap_obj 0x00CC, 0x41F8, 0x0014
	ap_obj 0x00DC, 0x41F8, 0x0016
	ap_obj 0x00EC, 0x41F8, 0x0018
	ap_obj 0x00F8, 0x41F8, 0x0008
.LSpriteAnim_GasTrapVertical_frame_7:
	ap_objs 4
	ap_obj 0x00CB, 0x51F8, 0x0014
	ap_obj 0x00DB, 0x51F8, 0x0016
	ap_obj 0x00EB, 0x51F8, 0x0018
	ap_obj 0x00F8, 0x51F8, 0x0008
.LSpriteAnim_GasTrapVertical_frame_8:
	ap_objs 4
	ap_obj 0x00CA, 0x41F8, 0x0014
	ap_obj 0x00DA, 0x41F8, 0x0016
	ap_obj 0x00EA, 0x41F8, 0x0018
	ap_obj 0x00F8, 0x41F8, 0x0008
.LSpriteAnim_GasTrapVertical_frame_9:
	ap_objs 3
	ap_obj 0x00C9, 0x41F8, 0x001A
	ap_obj 0x00E9, 0x61F8, 0x001A
	ap_obj 0x00D9, 0x51F8, 0x001A
.LSpriteAnim_GasTrapVertical_frame_10:
	ap_objs 3
	ap_obj 0x00CA, 0x41F8, 0x001C
	ap_obj 0x00D9, 0x51F8, 0x001C
	ap_obj 0x00EA, 0x61F8, 0x001C
.LSpriteAnim_GasTrapVertical_frame_11:
	ap_objs 3
	ap_obj 0x00CA, 0x41F8, 0x001E
	ap_obj 0x00D9, 0x51F8, 0x001E
	ap_obj 0x00EA, 0x61F8, 0x001E
.LSpriteAnim_GasTrapVertical_frame_12:
	ap_objs 1
	ap_obj 0x0000, 0x61F8, 0x0000
.LSpriteAnim_GasTrapVertical_frame_13:
	ap_objs 1
	ap_obj 0x0000, 0x61F8, 0x0002
.LSpriteAnim_GasTrapVertical_frame_14:
	ap_objs 1
	ap_obj 0x0000, 0x61F8, 0x0004
.LSpriteAnim_GasTrapVertical_frame_15:
	ap_objs 2
	ap_obj 0x0008, 0x61F8, 0x0006
	ap_obj 0x00F8, 0x61F8, 0x0008
.LSpriteAnim_GasTrapVertical_frame_16:
	ap_objs 3
	ap_obj 0x00F8, 0x71F8, 0x0008
	ap_obj 0x0010, 0x61F8, 0x000A
	ap_obj 0x0000, 0x61F8, 0x000C
.LSpriteAnim_GasTrapVertical_frame_17:
	ap_objs 4
	ap_obj 0x00F8, 0x61F8, 0x0008
	ap_obj 0x001E, 0x61F8, 0x000E
	ap_obj 0x000E, 0x61F8, 0x0010
	ap_obj 0x00FE, 0x61F8, 0x0012
.LSpriteAnim_GasTrapVertical_frame_18:
	ap_objs 4
	ap_obj 0x0024, 0x61F8, 0x0014
	ap_obj 0x0014, 0x61F8, 0x0016
	ap_obj 0x0004, 0x61F8, 0x0018
	ap_obj 0x00F8, 0x61F8, 0x0008
.LSpriteAnim_GasTrapVertical_frame_19:
	ap_objs 4
	ap_obj 0x0025, 0x71F8, 0x0014
	ap_obj 0x0015, 0x71F8, 0x0016
	ap_obj 0x0005, 0x71F8, 0x0018
	ap_obj 0x00F8, 0x71F8, 0x0008
.LSpriteAnim_GasTrapVertical_frame_20:
	ap_objs 4
	ap_obj 0x0026, 0x61F8, 0x0014
	ap_obj 0x0016, 0x61F8, 0x0016
	ap_obj 0x0006, 0x61F8, 0x0018
	ap_obj 0x00F8, 0x61F8, 0x0008
.LSpriteAnim_GasTrapVertical_frame_21:
	ap_objs 3
	ap_obj 0x0027, 0x61F8, 0x001A
	ap_obj 0x0007, 0x41F8, 0x001A
	ap_obj 0x0017, 0x71F8, 0x001A
.LSpriteAnim_GasTrapVertical_frame_22:
	ap_objs 3
	ap_obj 0x0026, 0x61F8, 0x001C
	ap_obj 0x0017, 0x71F8, 0x001C
	ap_obj 0x0006, 0x41F8, 0x001C
.LSpriteAnim_GasTrapVertical_frame_23:
	ap_objs 3
	ap_obj 0x0026, 0x61F8, 0x001E
	ap_obj 0x0017, 0x71F8, 0x001E
	ap_obj 0x0006, 0x41F8, 0x001E
.LSpriteAnim_GasTrapVertical_anim_0:
	ap_anim 1, 0
	ap_anim 3, 1
	ap_anim 3, 2
	ap_anim 3, 1
	ap_anim 3, 2
	ap_anim 3, 1
	ap_anim 3, 2
	ap_anim 1, 3
	ap_anim 1, 4
	ap_anim 2, 5
	ap_anim 3, 6
	ap_anim 3, 7
	ap_anim 4, 8
	ap_anim 4, 7
	ap_anim 4, 8
	ap_anim 4, 7
	ap_anim 4, 8
	ap_anim 6, 9
	ap_anim 6, 10
	ap_anim 5, 11
	ap_anim_delete
	ap_anim_loop
.LSpriteAnim_GasTrapVertical_anim_1:
	ap_anim 1, 12
	ap_anim 3, 13
	ap_anim 3, 14
	ap_anim 3, 13
	ap_anim 3, 14
	ap_anim 3, 13
	ap_anim 3, 14
	ap_anim 1, 15
	ap_anim 1, 16
	ap_anim 2, 17
	ap_anim 3, 18
	ap_anim 3, 19
	ap_anim 4, 20
	ap_anim 4, 19
	ap_anim 4, 20
	ap_anim 4, 19
	ap_anim 4, 20
	ap_anim 6, 21
	ap_anim 6, 22
	ap_anim 5, 23
	ap_anim_delete
	ap_anim_loop
	.size SpriteAnim_GasTrapVertical, . - SpriteAnim_GasTrapVertical

	.data
	.global SpriteAnim_GasTrapHorizontal
	.align 1, 0
	.type SpriteAnim_GasTrapHorizontal, %object
SpriteAnim_GasTrapHorizontal:
	.hword .LSpriteAnim_GasTrapHorizontal_ftab - SpriteAnim_GasTrapHorizontal, .LSpriteAnim_GasTrapHorizontal_atab - SpriteAnim_GasTrapHorizontal
.LSpriteAnim_GasTrapHorizontal_ftab:
	.hword .LSpriteAnim_GasTrapHorizontal_frame_0 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_1 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_2 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_3 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_4 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_5 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_6 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_7 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_8 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_9 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_10 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_11 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_12 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_13 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_14 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_15 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_16 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_17 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_18 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_19 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_20 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_21 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_22 - .LSpriteAnim_GasTrapHorizontal_ftab
	.hword .LSpriteAnim_GasTrapHorizontal_frame_23 - .LSpriteAnim_GasTrapHorizontal_ftab
.LSpriteAnim_GasTrapHorizontal_atab:
	.hword .LSpriteAnim_GasTrapHorizontal_anim_0 - .LSpriteAnim_GasTrapHorizontal_atab
	.hword .LSpriteAnim_GasTrapHorizontal_anim_1 - .LSpriteAnim_GasTrapHorizontal_atab
.LSpriteAnim_GasTrapHorizontal_frame_0:
	ap_objs 1
	ap_obj 0x00F8, 0x4000, 0x0000
.LSpriteAnim_GasTrapHorizontal_frame_1:
	ap_objs 1
	ap_obj 0x00F8, 0x4000, 0x0002
.LSpriteAnim_GasTrapHorizontal_frame_2:
	ap_objs 1
	ap_obj 0x00F8, 0x4000, 0x0004
.LSpriteAnim_GasTrapHorizontal_frame_3:
	ap_objs 2
	ap_obj 0x00F8, 0x4000, 0x0006
	ap_obj 0x80F8, 0x0010, 0x0008
.LSpriteAnim_GasTrapHorizontal_frame_4:
	ap_objs 3
	ap_obj 0x80F8, 0x2000, 0x0006
	ap_obj 0x00F8, 0x4008, 0x0009
	ap_obj 0x80F8, 0x0018, 0x000B
.LSpriteAnim_GasTrapHorizontal_frame_5:
	ap_objs 3
	ap_obj 0x80F8, 0x0000, 0x0006
	ap_obj 0x40F8, 0x8006, 0x000C
	ap_obj 0x80F8, 0x0026, 0x0010
.LSpriteAnim_GasTrapHorizontal_frame_6:
	ap_objs 3
	ap_obj 0x80F8, 0x0000, 0x0006
	ap_obj 0x40F8, 0x8004, 0x0011
	ap_obj 0x00F8, 0x4024, 0x0015
.LSpriteAnim_GasTrapHorizontal_frame_7:
	ap_objs 3
	ap_obj 0x80F8, 0x2000, 0x0006
	ap_obj 0x40F8, 0xA005, 0x0011
	ap_obj 0x00F8, 0x6025, 0x0015
.LSpriteAnim_GasTrapHorizontal_frame_8:
	ap_objs 3
	ap_obj 0x80F8, 0x0000, 0x0006
	ap_obj 0x40F8, 0x8006, 0x0011
	ap_obj 0x00F8, 0x4026, 0x0015
.LSpriteAnim_GasTrapHorizontal_frame_9:
	ap_objs 3
	ap_obj 0x00F8, 0x4027, 0x0017
	ap_obj 0x00F8, 0x6017, 0x0017
	ap_obj 0x00F8, 0x5007, 0x0017
.LSpriteAnim_GasTrapHorizontal_frame_10:
	ap_objs 3
	ap_obj 0x00F8, 0x5006, 0x0019
	ap_obj 0x00F8, 0x6017, 0x0019
	ap_obj 0x00F8, 0x4026, 0x0019
.LSpriteAnim_GasTrapHorizontal_frame_11:
	ap_objs 3
	ap_obj 0x00F8, 0x5006, 0x001B
	ap_obj 0x00F8, 0x6017, 0x001B
	ap_obj 0x00F8, 0x4026, 0x001B
.LSpriteAnim_GasTrapHorizontal_frame_12:
	ap_objs 1
	ap_obj 0x00F8, 0x51F0, 0x0000
.LSpriteAnim_GasTrapHorizontal_frame_13:
	ap_objs 1
	ap_obj 0x00F8, 0x51F0, 0x0002
.LSpriteAnim_GasTrapHorizontal_frame_14:
	ap_objs 1
	ap_obj 0x00F8, 0x51F0, 0x0004
.LSpriteAnim_GasTrapHorizontal_frame_15:
	ap_objs 2
	ap_obj 0x00F8, 0x51F0, 0x0006
	ap_obj 0x80F8, 0x11E8, 0x0008
.LSpriteAnim_GasTrapHorizontal_frame_16:
	ap_objs 3
	ap_obj 0x80F8, 0x31F8, 0x0006
	ap_obj 0x00F8, 0x51E8, 0x0009
	ap_obj 0x80F8, 0x11E0, 0x000B
.LSpriteAnim_GasTrapHorizontal_frame_17:
	ap_objs 3
	ap_obj 0x80F8, 0x11F8, 0x0006
	ap_obj 0x40F8, 0x91DA, 0x000C
	ap_obj 0x80F8, 0x11D2, 0x0010
.LSpriteAnim_GasTrapHorizontal_frame_18:
	ap_objs 3
	ap_obj 0x80F8, 0x11F8, 0x0006
	ap_obj 0x40F8, 0x91DC, 0x0011
	ap_obj 0x00F8, 0x51CC, 0x0015
.LSpriteAnim_GasTrapHorizontal_frame_19:
	ap_objs 3
	ap_obj 0x80F8, 0x31F8, 0x0006
	ap_obj 0x40F8, 0xB1DB, 0x0011
	ap_obj 0x00F8, 0x71CB, 0x0015
.LSpriteAnim_GasTrapHorizontal_frame_20:
	ap_objs 3
	ap_obj 0x80F8, 0x11F8, 0x0006
	ap_obj 0x40F8, 0x91DA, 0x0011
	ap_obj 0x00F8, 0x51CA, 0x0015
.LSpriteAnim_GasTrapHorizontal_frame_21:
	ap_objs 3
	ap_obj 0x00F8, 0x51C9, 0x0017
	ap_obj 0x00F8, 0x71D9, 0x0017
	ap_obj 0x00F8, 0x41E9, 0x0017
.LSpriteAnim_GasTrapHorizontal_frame_22:
	ap_objs 3
	ap_obj 0x00F8, 0x41EA, 0x0019
	ap_obj 0x00F8, 0x71D9, 0x0019
	ap_obj 0x00F8, 0x51CA, 0x0019
.LSpriteAnim_GasTrapHorizontal_frame_23:
	ap_objs 3
	ap_obj 0x00F8, 0x41EA, 0x001B
	ap_obj 0x00F8, 0x71D9, 0x001B
	ap_obj 0x00F8, 0x51CA, 0x001B
.LSpriteAnim_GasTrapHorizontal_anim_0:
	ap_anim 1, 0
	ap_anim 3, 1
	ap_anim 3, 2
	ap_anim 3, 1
	ap_anim 3, 2
	ap_anim 3, 1
	ap_anim 3, 2
	ap_anim 1, 3
	ap_anim 1, 4
	ap_anim 2, 5
	ap_anim 3, 6
	ap_anim 3, 7
	ap_anim 4, 8
	ap_anim 4, 7
	ap_anim 4, 8
	ap_anim 4, 7
	ap_anim 4, 8
	ap_anim 6, 9
	ap_anim 6, 10
	ap_anim 5, 11
	ap_anim_delete
	ap_anim_loop
.LSpriteAnim_GasTrapHorizontal_anim_1:
	ap_anim 1, 12
	ap_anim 3, 13
	ap_anim 3, 14
	ap_anim 3, 13
	ap_anim 3, 14
	ap_anim 3, 13
	ap_anim 3, 14
	ap_anim 1, 15
	ap_anim 1, 16
	ap_anim 2, 17
	ap_anim 3, 18
	ap_anim 3, 19
	ap_anim 4, 20
	ap_anim 4, 19
	ap_anim 4, 20
	ap_anim 4, 19
	ap_anim 4, 20
	ap_anim 6, 21
	ap_anim 6, 22
	ap_anim 5, 23
	ap_anim_delete
	ap_anim_loop
	.size SpriteAnim_GasTrapHorizontal, . - SpriteAnim_GasTrapHorizontal
