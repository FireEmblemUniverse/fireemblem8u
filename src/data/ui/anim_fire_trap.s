@ AP (object/sprite animation) definition(s). Offset tables computed via assembler
@ label arithmetic; OAM/anim data uses the macros in include/ap.inc. See include/ap.h
@ / src/ap.c. Byte-identical to the original data.

	.include "ap.inc"

	.data
	.global SpriteAnim_FireTrap
	.align 1, 0
	.type SpriteAnim_FireTrap, %object
SpriteAnim_FireTrap:
	.hword .LSpriteAnim_FireTrap_ftab - SpriteAnim_FireTrap, .LSpriteAnim_FireTrap_atab - SpriteAnim_FireTrap
.LSpriteAnim_FireTrap_ftab:
	.hword .LSpriteAnim_FireTrap_frame_0 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_1 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_2 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_3 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_4 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_5 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_6 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_7 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_8 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_9 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_10 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_11 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_12 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_13 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_14 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_15 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_16 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_17 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_18 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_19 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_20 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_21 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_22 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_23 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_24 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_25 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_26 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_27 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_28 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_29 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_30 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_31 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_32 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_33 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_34 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_35 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_36 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_37 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_38 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_39 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_40 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_41 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_42 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_43 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_44 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_45 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_46 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_47 - .LSpriteAnim_FireTrap_ftab
	.hword .LSpriteAnim_FireTrap_frame_48 - .LSpriteAnim_FireTrap_ftab
.LSpriteAnim_FireTrap_atab:
	.hword .LSpriteAnim_FireTrap_anim_0 - .LSpriteAnim_FireTrap_atab
	.hword .LSpriteAnim_FireTrap_anim_1 - .LSpriteAnim_FireTrap_atab
	.hword .LSpriteAnim_FireTrap_anim_2 - .LSpriteAnim_FireTrap_atab
	.hword .LSpriteAnim_FireTrap_anim_3 - .LSpriteAnim_FireTrap_atab
	.hword .LSpriteAnim_FireTrap_anim_4 - .LSpriteAnim_FireTrap_atab
.LSpriteAnim_FireTrap_frame_0:
	ap_objs 3
	ap_obj 0x4000, 0x01F8, 0x0006
	ap_obj 0x00E0, 0x41F8, 0x0000
	ap_obj 0x00F0, 0x41F8, 0x000C
.LSpriteAnim_FireTrap_frame_1:
	ap_objs 3
	ap_obj 0x4000, 0x01F8, 0x0026
	ap_obj 0x00F0, 0x41F8, 0x000E
	ap_obj 0x00E0, 0x41F8, 0x0002
.LSpriteAnim_FireTrap_frame_2:
	ap_objs 3
	ap_obj 0x4000, 0x01F8, 0x0012
	ap_obj 0x00F0, 0x41F8, 0x0010
	ap_obj 0x00E0, 0x41F8, 0x0004
.LSpriteAnim_FireTrap_frame_3:
	ap_objs 1
	ap_obj 0x00F8, 0x41F8, 0x0008
.LSpriteAnim_FireTrap_frame_4:
	ap_objs 2
	ap_obj 0x00F8, 0x41F8, 0x0014
	ap_obj 0x40F0, 0x01F8, 0x0032
.LSpriteAnim_FireTrap_frame_5:
	ap_objs 2
	ap_obj 0x00F8, 0x41F8, 0x0016
	ap_obj 0x00E8, 0x41F8, 0x000A
.LSpriteAnim_FireTrap_frame_6:
	ap_objs 1
	ap_obj 0x00F5, 0x01F5, 0x0019
.LSpriteAnim_FireTrap_frame_7:
	ap_objs 2
	ap_obj 0x00F7, 0x01F5, 0x0019
	ap_obj 0x00F8, 0x01F8, 0x001A
.LSpriteAnim_FireTrap_frame_8:
	ap_objs 3
	ap_obj 0x00F8, 0x01F6, 0x0019
	ap_obj 0x00F9, 0x01F9, 0x001A
	ap_obj 0x00F5, 0x01F7, 0x0019
.LSpriteAnim_FireTrap_frame_9:
	ap_objs 5
	ap_obj 0x00FA, 0x01F7, 0x0019
	ap_obj 0x00FB, 0x01FB, 0x001A
	ap_obj 0x00F7, 0x01F9, 0x0019
	ap_obj 0x00F5, 0x01F5, 0x0019
	ap_obj 0x00F8, 0x01F4, 0x0018
.LSpriteAnim_FireTrap_frame_10:
	ap_objs 5
	ap_obj 0x00FD, 0x01F8, 0x001A
	ap_obj 0x00F9, 0x01FB, 0x0019
	ap_obj 0x00FD, 0x01FD, 0x001B
	ap_obj 0x00F6, 0x01F6, 0x0019
	ap_obj 0x00FA, 0x01F6, 0x0019
.LSpriteAnim_FireTrap_frame_11:
	ap_objs 6
	ap_obj 0x0000, 0x01FA, 0x001A
	ap_obj 0x0000, 0x0001, 0x001B
	ap_obj 0x00F8, 0x01F8, 0x0019
	ap_obj 0x00FC, 0x01F8, 0x0019
	ap_obj 0x00FB, 0x01FD, 0x001A
	ap_obj 0x00F5, 0x01F4, 0x0018
.LSpriteAnim_FireTrap_frame_12:
	ap_objs 6
	ap_obj 0x00FA, 0x01F9, 0x001A
	ap_obj 0x0003, 0x0004, 0x001B
	ap_obj 0x00FE, 0x01FA, 0x0019
	ap_obj 0x00FD, 0x0000, 0x001A
	ap_obj 0x00F6, 0x01F6, 0x0019
	ap_obj 0x0002, 0x01FC, 0x001B
.LSpriteAnim_FireTrap_frame_13:
	ap_objs 7
	ap_obj 0x00FC, 0x01FB, 0x001A
	ap_obj 0x0006, 0x0006, 0x001B
	ap_obj 0x0000, 0x01FB, 0x0019
	ap_obj 0x00FF, 0x0002, 0x001A
	ap_obj 0x00F9, 0x01F8, 0x0019
	ap_obj 0x0005, 0x01FE, 0x001B
	ap_obj 0x00F5, 0x01F6, 0x0018
.LSpriteAnim_FireTrap_frame_14:
	ap_objs 7
	ap_obj 0x00FD, 0x01FD, 0x001A
	ap_obj 0x0001, 0x01FC, 0x0019
	ap_obj 0x0001, 0x0005, 0x001A
	ap_obj 0x00FA, 0x01F9, 0x0019
	ap_obj 0x0006, 0x01FF, 0x001B
	ap_obj 0x00F6, 0x01F7, 0x0018
	ap_obj 0x0007, 0x0008, 0x001A
.LSpriteAnim_FireTrap_frame_15:
	ap_objs 7
	ap_obj 0x00FF, 0x01FE, 0x001A
	ap_obj 0x0003, 0x01FD, 0x0019
	ap_obj 0x0002, 0x0006, 0x001A
	ap_obj 0x0007, 0x0000, 0x001A
	ap_obj 0x0008, 0x000A, 0x0019
	ap_obj 0x00F7, 0x01F9, 0x0019
	ap_obj 0x00FB, 0x01FA, 0x001A
.LSpriteAnim_FireTrap_frame_16:
	ap_objs 8
	ap_obj 0x0001, 0x0000, 0x001A
	ap_obj 0x0005, 0x01FF, 0x0019
	ap_obj 0x0004, 0x0008, 0x001A
	ap_obj 0x00F9, 0x01FA, 0x0019
	ap_obj 0x00FD, 0x01FC, 0x001A
	ap_obj 0x00F8, 0x01F5, 0x0018
	ap_obj 0x000A, 0x000B, 0x0018
	ap_obj 0x0009, 0x0002, 0x0019
.LSpriteAnim_FireTrap_frame_17:
	ap_objs 7
	ap_obj 0x0003, 0x0001, 0x001A
	ap_obj 0x0007, 0x0000, 0x0019
	ap_obj 0x00FB, 0x01FB, 0x0019
	ap_obj 0x00FF, 0x01FD, 0x001A
	ap_obj 0x00FA, 0x01F6, 0x0018
	ap_obj 0x000B, 0x0003, 0x0018
	ap_obj 0x0005, 0x0009, 0x0019
.LSpriteAnim_FireTrap_frame_18:
	ap_objs 6
	ap_obj 0x0005, 0x0003, 0x001A
	ap_obj 0x0009, 0x0002, 0x0019
	ap_obj 0x00FD, 0x01FC, 0x0019
	ap_obj 0x0001, 0x01FF, 0x001A
	ap_obj 0x00FB, 0x01F8, 0x0018
	ap_obj 0x0007, 0x000A, 0x0018
.LSpriteAnim_FireTrap_frame_19:
	ap_objs 5
	ap_obj 0x0007, 0x0005, 0x001A
	ap_obj 0x00FF, 0x01FE, 0x0019
	ap_obj 0x0003, 0x0001, 0x001A
	ap_obj 0x00FD, 0x01FA, 0x0018
	ap_obj 0x000C, 0x0004, 0x0018
.LSpriteAnim_FireTrap_frame_20:
	ap_objs 4
	ap_obj 0x0001, 0x0000, 0x0019
	ap_obj 0x0005, 0x0003, 0x001A
	ap_obj 0x00FF, 0x01FC, 0x0018
	ap_obj 0x0009, 0x0007, 0x0019
.LSpriteAnim_FireTrap_frame_21:
	ap_objs 4
	ap_obj 0x0003, 0x0002, 0x0019
	ap_obj 0x0001, 0x01FE, 0x0018
	ap_obj 0x0007, 0x0005, 0x0019
	ap_obj 0x000B, 0x0008, 0x0018
.LSpriteAnim_FireTrap_frame_22:
	ap_objs 4
	ap_obj 0x0003, 0x0002, 0x0019
	ap_obj 0x0001, 0x01FE, 0x0018
	ap_obj 0x0007, 0x0005, 0x0019
	ap_obj 0x000B, 0x0008, 0x0018
.LSpriteAnim_FireTrap_frame_23:
	ap_objs 3
	ap_obj 0x0005, 0x0004, 0x0019
	ap_obj 0x0003, 0x0000, 0x0018
	ap_obj 0x000A, 0x0007, 0x0018
.LSpriteAnim_FireTrap_frame_24:
	ap_objs 2
	ap_obj 0x0004, 0x0002, 0x0018
	ap_obj 0x0007, 0x0006, 0x0018
.LSpriteAnim_FireTrap_frame_25:
	ap_objs 1
	ap_obj 0x0005, 0x0004, 0x0018
.LSpriteAnim_FireTrap_frame_26:
	ap_objs 1
	ap_obj 0x00FC, 0x01FB, 0x001C
.LSpriteAnim_FireTrap_frame_27:
	ap_objs 1
	ap_obj 0x00FC, 0x01FC, 0x001D
.LSpriteAnim_FireTrap_frame_28:
	ap_objs 1
	ap_obj 0x00FB, 0x01FC, 0x001F
.LSpriteAnim_FireTrap_frame_29:
	ap_objs 1
	ap_obj 0x00F5, 0x0003, 0x0019
.LSpriteAnim_FireTrap_frame_30:
	ap_objs 2
	ap_obj 0x00F7, 0x1003, 0x0019
	ap_obj 0x00F8, 0x1000, 0x001A
.LSpriteAnim_FireTrap_frame_31:
	ap_objs 3
	ap_obj 0x00F8, 0x1002, 0x0019
	ap_obj 0x00F9, 0x11FF, 0x001A
	ap_obj 0x00F5, 0x1001, 0x0019
.LSpriteAnim_FireTrap_frame_32:
	ap_objs 5
	ap_obj 0x00FA, 0x1001, 0x0019
	ap_obj 0x00FB, 0x11FD, 0x001A
	ap_obj 0x00F7, 0x11FF, 0x0019
	ap_obj 0x00F5, 0x1003, 0x0019
	ap_obj 0x00F8, 0x1004, 0x0018
.LSpriteAnim_FireTrap_frame_33:
	ap_objs 5
	ap_obj 0x00FD, 0x1000, 0x001A
	ap_obj 0x00F9, 0x11FD, 0x0019
	ap_obj 0x00FD, 0x11FB, 0x001B
	ap_obj 0x00F6, 0x1002, 0x0019
	ap_obj 0x00FA, 0x1002, 0x0019
.LSpriteAnim_FireTrap_frame_34:
	ap_objs 6
	ap_obj 0x0000, 0x11FE, 0x001A
	ap_obj 0x0000, 0x11F7, 0x001B
	ap_obj 0x00F8, 0x1000, 0x0019
	ap_obj 0x00FC, 0x1000, 0x0019
	ap_obj 0x00FB, 0x11FB, 0x001A
	ap_obj 0x00F5, 0x1004, 0x0018
.LSpriteAnim_FireTrap_frame_35:
	ap_objs 6
	ap_obj 0x00FA, 0x11FF, 0x001A
	ap_obj 0x0003, 0x11F4, 0x001B
	ap_obj 0x00FE, 0x11FE, 0x0019
	ap_obj 0x00FD, 0x11F8, 0x001A
	ap_obj 0x00F6, 0x1002, 0x0019
	ap_obj 0x0002, 0x11FC, 0x001B
.LSpriteAnim_FireTrap_frame_36:
	ap_objs 7
	ap_obj 0x00FC, 0x11FD, 0x001A
	ap_obj 0x0006, 0x11F2, 0x001B
	ap_obj 0x0000, 0x11FD, 0x0019
	ap_obj 0x00FF, 0x11F6, 0x001A
	ap_obj 0x00F9, 0x1000, 0x0019
	ap_obj 0x0005, 0x11FA, 0x001B
	ap_obj 0x00F5, 0x1002, 0x0018
.LSpriteAnim_FireTrap_frame_37:
	ap_objs 7
	ap_obj 0x00FD, 0x11FB, 0x001A
	ap_obj 0x0001, 0x11FC, 0x0019
	ap_obj 0x0001, 0x11F3, 0x001A
	ap_obj 0x00FA, 0x11FF, 0x0019
	ap_obj 0x0006, 0x11F9, 0x001B
	ap_obj 0x00F6, 0x1001, 0x0018
	ap_obj 0x0007, 0x11F0, 0x001A
.LSpriteAnim_FireTrap_frame_38:
	ap_objs 7
	ap_obj 0x00FF, 0x11FA, 0x001A
	ap_obj 0x0003, 0x11FB, 0x0019
	ap_obj 0x0002, 0x11F2, 0x001A
	ap_obj 0x0007, 0x11F8, 0x001A
	ap_obj 0x0008, 0x11EE, 0x0019
	ap_obj 0x00F7, 0x11FF, 0x0019
	ap_obj 0x00FB, 0x11FE, 0x001A
.LSpriteAnim_FireTrap_frame_39:
	ap_objs 8
	ap_obj 0x0001, 0x11F8, 0x001A
	ap_obj 0x0005, 0x11F9, 0x0019
	ap_obj 0x0004, 0x11F0, 0x001A
	ap_obj 0x00F9, 0x11FE, 0x0019
	ap_obj 0x00FD, 0x11FC, 0x001A
	ap_obj 0x00F8, 0x1003, 0x0018
	ap_obj 0x000A, 0x11ED, 0x0018
	ap_obj 0x0009, 0x11F6, 0x0019
.LSpriteAnim_FireTrap_frame_40:
	ap_objs 7
	ap_obj 0x0003, 0x11F7, 0x001A
	ap_obj 0x0007, 0x11F8, 0x0019
	ap_obj 0x00FB, 0x11FD, 0x0019
	ap_obj 0x00FF, 0x11FB, 0x001A
	ap_obj 0x00FA, 0x1002, 0x0018
	ap_obj 0x000B, 0x11F5, 0x0018
	ap_obj 0x0005, 0x11EF, 0x0019
.LSpriteAnim_FireTrap_frame_41:
	ap_objs 6
	ap_obj 0x0005, 0x11F5, 0x001A
	ap_obj 0x0009, 0x11F6, 0x0019
	ap_obj 0x00FD, 0x11FC, 0x0019
	ap_obj 0x0001, 0x11F9, 0x001A
	ap_obj 0x00FB, 0x1000, 0x0018
	ap_obj 0x0007, 0x11EE, 0x0018
.LSpriteAnim_FireTrap_frame_42:
	ap_objs 5
	ap_obj 0x0007, 0x11F3, 0x001A
	ap_obj 0x00FF, 0x11FA, 0x0019
	ap_obj 0x0003, 0x11F7, 0x001A
	ap_obj 0x00FD, 0x11FE, 0x0018
	ap_obj 0x000C, 0x11F4, 0x0018
.LSpriteAnim_FireTrap_frame_43:
	ap_objs 4
	ap_obj 0x0001, 0x11F8, 0x0019
	ap_obj 0x0005, 0x11F5, 0x001A
	ap_obj 0x00FF, 0x11FC, 0x0018
	ap_obj 0x0009, 0x11F1, 0x0019
.LSpriteAnim_FireTrap_frame_44:
	ap_objs 4
	ap_obj 0x0003, 0x11F6, 0x0019
	ap_obj 0x0001, 0x11FA, 0x0018
	ap_obj 0x0007, 0x11F3, 0x0019
	ap_obj 0x000B, 0x11F0, 0x0018
.LSpriteAnim_FireTrap_frame_45:
	ap_objs 4
	ap_obj 0x0003, 0x11F6, 0x0019
	ap_obj 0x0001, 0x11FA, 0x0018
	ap_obj 0x0007, 0x11F3, 0x0019
	ap_obj 0x000B, 0x11F0, 0x0018
.LSpriteAnim_FireTrap_frame_46:
	ap_objs 3
	ap_obj 0x0005, 0x11F4, 0x0019
	ap_obj 0x0003, 0x11F8, 0x0018
	ap_obj 0x000A, 0x11F1, 0x0018
.LSpriteAnim_FireTrap_frame_47:
	ap_objs 2
	ap_obj 0x0004, 0x11F7, 0x0018
	ap_obj 0x0007, 0x11F3, 0x0018
.LSpriteAnim_FireTrap_frame_48:
	ap_objs 1
	ap_obj 0x0005, 0x01F3, 0x0018
.LSpriteAnim_FireTrap_anim_0:
	ap_anim 2, 3
	ap_anim 2, 4
	ap_anim 2, 5
	ap_anim 3, 0
	ap_anim 3, 1
	ap_anim 3, 2
	ap_anim 3, 0
	ap_anim 3, 1
	ap_anim 3, 2
	ap_anim 2, 5
	ap_anim 2, 4
	ap_anim 2, 3
	ap_anim_delete
	ap_anim_loop
.LSpriteAnim_FireTrap_anim_1:
	ap_anim 2, 6
	ap_anim 2, 7
	ap_anim 2, 8
	ap_anim 2, 9
	ap_anim 2, 10
	ap_anim 2, 11
	ap_anim 2, 12
	ap_anim 2, 13
	ap_anim 2, 14
	ap_anim 2, 15
	ap_anim 2, 16
	ap_anim 2, 17
	ap_anim 2, 18
	ap_anim 2, 19
	ap_anim 2, 20
	ap_anim 2, 21
	ap_anim 2, 22
	ap_anim 2, 23
	ap_anim 2, 24
	ap_anim 2, 25
	ap_anim_delete
	ap_anim_loop
.LSpriteAnim_FireTrap_anim_2:
	ap_anim 1, 26
	ap_anim 1, 28
	ap_anim_loop
.LSpriteAnim_FireTrap_anim_3:
	ap_anim 1, 26
	ap_anim 1, 27
	ap_anim_loop
.LSpriteAnim_FireTrap_anim_4:
	ap_anim 2, 29
	ap_anim 2, 30
	ap_anim 2, 31
	ap_anim 2, 32
	ap_anim 2, 33
	ap_anim 2, 34
	ap_anim 2, 35
	ap_anim 2, 36
	ap_anim 2, 37
	ap_anim 2, 38
	ap_anim 2, 39
	ap_anim 2, 40
	ap_anim 2, 41
	ap_anim 2, 42
	ap_anim 2, 43
	ap_anim 2, 44
	ap_anim 2, 45
	ap_anim 2, 46
	ap_anim 2, 47
	ap_anim 2, 48
	ap_anim_delete
	ap_anim_loop
	.size SpriteAnim_FireTrap, . - SpriteAnim_FireTrap
