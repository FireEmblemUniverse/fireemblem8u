@ AP (object/sprite animation) definition(s). Offset tables computed via assembler
@ label arithmetic; OAM/anim data uses the macros in include/ap.inc. See include/ap.h
@ / src/ap.c. Byte-identical to the original data.

	.include "ap.inc"

	.data
	.global SpriteAnim_PlayerRankFog
	.align 1, 0
	.type SpriteAnim_PlayerRankFog, %object
SpriteAnim_PlayerRankFog:
	.hword .LSpriteAnim_PlayerRankFog_ftab - SpriteAnim_PlayerRankFog, .LSpriteAnim_PlayerRankFog_atab - SpriteAnim_PlayerRankFog
.LSpriteAnim_PlayerRankFog_ftab:
	.hword .LSpriteAnim_PlayerRankFog_frame_0 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_1 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_2 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_3 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_4 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_5 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_6 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_7 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_8 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_9 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_10 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_11 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_12 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_13 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_14 - .LSpriteAnim_PlayerRankFog_ftab
	.hword .LSpriteAnim_PlayerRankFog_frame_15 - .LSpriteAnim_PlayerRankFog_ftab
.LSpriteAnim_PlayerRankFog_atab:
	.hword .LSpriteAnim_PlayerRankFog_anim_0 - .LSpriteAnim_PlayerRankFog_atab
	.hword .LSpriteAnim_PlayerRankFog_anim_1 - .LSpriteAnim_PlayerRankFog_atab
.LSpriteAnim_PlayerRankFog_frame_0:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 2
	ap_obj 0x81F0, 0x41F8, 0x0000
	ap_obj 0x81F0, 0x4000, 0x0003
.LSpriteAnim_PlayerRankFog_frame_1:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 1
	ap_obj 0x01F0, 0x81F0, 0x0000
.LSpriteAnim_PlayerRankFog_frame_2:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 3
	ap_obj 0x81F0, 0x81E8, 0x0000
	ap_obj 0x81F0, 0x8008, 0x0002
	ap_obj 0x81F0, 0x81F8, 0x0001
.LSpriteAnim_PlayerRankFog_frame_3:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 4
	ap_obj 0x81F0, 0x81E0, 0x0000
	ap_obj 0x81F0, 0x8010, 0x0002
	ap_obj 0x81F0, 0x8000, 0x0001
	ap_obj 0x81F0, 0x81F0, 0x0001
.LSpriteAnim_PlayerRankFog_frame_4:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 5
	ap_obj 0x81F0, 0x81D8, 0x0000
	ap_obj 0x81F0, 0x8018, 0x0002
	ap_obj 0x81F0, 0x8008, 0x0001
	ap_obj 0x81F0, 0x81F8, 0x0001
	ap_obj 0x81F0, 0x81E8, 0x0001
.LSpriteAnim_PlayerRankFog_frame_5:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 6
	ap_obj 0x81F0, 0x81D0, 0x0000
	ap_obj 0x81F0, 0x8020, 0x0002
	ap_obj 0x81F0, 0x8000, 0x0001
	ap_obj 0x81F0, 0x81F0, 0x0001
	ap_obj 0x81F0, 0x81E0, 0x0001
	ap_obj 0x81F0, 0x8010, 0x0001
.LSpriteAnim_PlayerRankFog_frame_6:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 7
	ap_obj 0x81F0, 0x81C8, 0x0000
	ap_obj 0x81F0, 0x8028, 0x0002
	ap_obj 0x81F0, 0x8008, 0x0001
	ap_obj 0x81F0, 0x81F8, 0x0001
	ap_obj 0x81F0, 0x81E8, 0x0001
	ap_obj 0x81F0, 0x81D8, 0x0001
	ap_obj 0x81F0, 0x8018, 0x0001
.LSpriteAnim_PlayerRankFog_frame_7:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 8
	ap_obj 0x81F0, 0x81C0, 0x0000
	ap_obj 0x81F0, 0x8030, 0x0002
	ap_obj 0x81F0, 0x8000, 0x0001
	ap_obj 0x81F0, 0x81F0, 0x0001
	ap_obj 0x81F0, 0x8020, 0x0001
	ap_obj 0x81F0, 0x81D0, 0x0001
	ap_obj 0x81F0, 0x81E0, 0x0001
	ap_obj 0x81F0, 0x8010, 0x0001
.LSpriteAnim_PlayerRankFog_frame_8:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 9
	ap_obj 0x81F0, 0x8038, 0x0002
	ap_obj 0x81F0, 0x81F8, 0x0001
	ap_obj 0x81F0, 0x81E8, 0x0001
	ap_obj 0x81F0, 0x8018, 0x0001
	ap_obj 0x81F0, 0x81C8, 0x0001
	ap_obj 0x81F0, 0x81D8, 0x0001
	ap_obj 0x81F0, 0x8008, 0x0001
	ap_obj 0x81F0, 0x81B8, 0x0000
	ap_obj 0x81F0, 0x8028, 0x0001
.LSpriteAnim_PlayerRankFog_frame_9:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 10
	ap_obj 0x81F0, 0x8040, 0x0002
	ap_obj 0x81F0, 0x81F0, 0x0001
	ap_obj 0x81F0, 0x81E0, 0x0001
	ap_obj 0x81F0, 0x8010, 0x0001
	ap_obj 0x81F0, 0x81C0, 0x0001
	ap_obj 0x81F0, 0x81D0, 0x0001
	ap_obj 0x81F0, 0x8000, 0x0001
	ap_obj 0x81F0, 0x81B0, 0x0000
	ap_obj 0x81F0, 0x8020, 0x0001
	ap_obj 0x81F0, 0x8030, 0x0001
.LSpriteAnim_PlayerRankFog_frame_10:
	ap_rotscale 1
	ap_affine 256, 256, 25
	ap_objs 11
	ap_obj 0x81F0, 0x8048, 0x0002
	ap_obj 0x81F0, 0x81F8, 0x0001
	ap_obj 0x81F0, 0x81E8, 0x0001
	ap_obj 0x81F0, 0x8018, 0x0001
	ap_obj 0x81F0, 0x81C8, 0x0001
	ap_obj 0x81F0, 0x81D8, 0x0001
	ap_obj 0x81F0, 0x8008, 0x0001
	ap_obj 0x81F0, 0x81A8, 0x0000
	ap_obj 0x81F0, 0x8028, 0x0001
	ap_obj 0x81F0, 0x8038, 0x0001
	ap_obj 0x81F0, 0x81B8, 0x0001
.LSpriteAnim_PlayerRankFog_frame_11:
	ap_rotscale 1
	ap_affine 256, 256, 51
	ap_objs 12
	ap_obj 0x81F0, 0x8050, 0x0002
	ap_obj 0x81F0, 0x81F0, 0x0001
	ap_obj 0x81F0, 0x81E0, 0x0001
	ap_obj 0x81F0, 0x8010, 0x0001
	ap_obj 0x81F0, 0x81C0, 0x0001
	ap_obj 0x81F0, 0x81D0, 0x0001
	ap_obj 0x81F0, 0x8000, 0x0001
	ap_obj 0x81F0, 0x81A0, 0x0000
	ap_obj 0x81F0, 0x8020, 0x0001
	ap_obj 0x81F0, 0x8030, 0x0001
	ap_obj 0x81F0, 0x81B0, 0x0001
	ap_obj 0x81F0, 0x8040, 0x0001
.LSpriteAnim_PlayerRankFog_frame_12:
	ap_rotscale 1
	ap_affine 256, 256, 128
	ap_objs 12
	ap_obj 0x81F0, 0x8050, 0x0002
	ap_obj 0x81F0, 0x81F0, 0x0001
	ap_obj 0x81F0, 0x81E0, 0x0001
	ap_obj 0x81F0, 0x8010, 0x0001
	ap_obj 0x81F0, 0x81C0, 0x0001
	ap_obj 0x81F0, 0x81D0, 0x0001
	ap_obj 0x81F0, 0x8000, 0x0001
	ap_obj 0x81F0, 0x81A0, 0x0000
	ap_obj 0x81F0, 0x8020, 0x0001
	ap_obj 0x81F0, 0x8030, 0x0001
	ap_obj 0x81F0, 0x81B0, 0x0001
	ap_obj 0x81F0, 0x8040, 0x0001
.LSpriteAnim_PlayerRankFog_frame_13:
	ap_objs 12
	ap_obj 0x80F0, 0x8050, 0x0002
	ap_obj 0x80F0, 0x81F0, 0x0001
	ap_obj 0x80F0, 0x81E0, 0x0001
	ap_obj 0x80F0, 0x8010, 0x0001
	ap_obj 0x80F0, 0x81C0, 0x0001
	ap_obj 0x80F0, 0x81D0, 0x0001
	ap_obj 0x80F0, 0x8000, 0x0001
	ap_obj 0x80F0, 0x81A0, 0x0000
	ap_obj 0x80F0, 0x8020, 0x0001
	ap_obj 0x80F0, 0x8030, 0x0001
	ap_obj 0x80F0, 0x81B0, 0x0001
	ap_obj 0x80F0, 0x8040, 0x0001
.LSpriteAnim_PlayerRankFog_frame_14:
	ap_objs 0
.LSpriteAnim_PlayerRankFog_frame_15:
	ap_objs 2
	ap_obj 0x40F0, 0x01F0, 0x0004
	ap_obj 0x00F0, 0x0000, 0x0006
.LSpriteAnim_PlayerRankFog_anim_0:
	ap_anim 1, 0
	ap_anim 1, 1
	ap_anim 1, 2
	ap_anim 1, 3
	ap_anim 1, 4
	ap_anim 1, 5
	ap_anim 1, 6
	ap_anim 1, 7
	ap_anim 1, 8
	ap_anim 1, 9
	ap_anim 1, 10
	ap_anim 1, 11
	ap_anim 1, 12
	ap_anim 1, 13
	ap_anim_delete
	ap_anim_loop
.LSpriteAnim_PlayerRankFog_anim_1:
	ap_anim 4, 15
	ap_anim_loop
	.size SpriteAnim_PlayerRankFog, . - SpriteAnim_PlayerRankFog
