.section .data

	.global SpriteAnim_WorldmapSkirmish
SpriteAnim_WorldmapSkirmish:  @ 0x08AA1C70
SpriteAnim_WorldmapSkirmish_motion:
	.2byte (SpriteAnim_WorldmapSkirmish_frame_list - SpriteAnim_WorldmapSkirmish_motion), (SpriteAnim_WorldmapSkirmish_anim_list - SpriteAnim_WorldmapSkirmish_motion) @ header

SpriteAnim_WorldmapSkirmish_frame_list: @ +$4
	.2byte (SpriteAnim_WorldmapSkirmish_frame_0 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_1 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_2 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_3 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_4 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_5 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_6 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_7 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_8 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_9 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_10 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_11 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_12 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_13 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_14 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_15 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_16 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_17 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_18 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_19 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_20 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_21 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_22 - SpriteAnim_WorldmapSkirmish_frame_list)
	.2byte (SpriteAnim_WorldmapSkirmish_frame_23 - SpriteAnim_WorldmapSkirmish_frame_list)

SpriteAnim_WorldmapSkirmish_anim_list: @ +$34
	.2byte (SpriteAnim_WorldmapSkirmish_anim_0 - SpriteAnim_WorldmapSkirmish_anim_list)

SpriteAnim_WorldmapSkirmish_frame_0: @ +$36
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x19
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81C9, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81E9, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x8009, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_1: @ +$52
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x4C
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81CC, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81EC, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x800C, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_2: @ +$6E
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x80
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81CE, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81EE, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x800E, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_3: @ +$8A
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xB3
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81CF, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81EF, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x800F, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_4: @ +$A6
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xE6
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81D0, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81F0, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x8010, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_5: @ +$C2
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x1E8, 0x1013 @ OAM Data #0
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #1
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #2
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #3

SpriteAnim_WorldmapSkirmish_frame_6: @ +$DC
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x1F0, 0x1032 @ OAM Data #0
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #1
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #2
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #3

SpriteAnim_WorldmapSkirmish_frame_7: @ +$F6
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x0, 0x1031 @ OAM Data #0
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #1
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #2
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #3

SpriteAnim_WorldmapSkirmish_frame_8: @ +$110
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x10, 0x1031 @ OAM Data #0
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #1
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #2
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #3

SpriteAnim_WorldmapSkirmish_frame_9: @ +$12A
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x20, 0x1032 @ OAM Data #0
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #1
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #2
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #3

SpriteAnim_WorldmapSkirmish_frame_10: @ +$144
	.2byte 4 @ oam entries
	.2byte 0xF8, 0x28, 0x1013 @ OAM Data #0
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #1
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #2
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #3

SpriteAnim_WorldmapSkirmish_frame_11: @ +$15E
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x33, 0x33
	.2byte 4 @ oam entries
	.2byte 0x1EC, 0x8020, 0x1000 @ OAM Data #0
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #1
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #2
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #3

SpriteAnim_WorldmapSkirmish_frame_12: @ +$180
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x59, 0x59
	.2byte 7 @ oam entries
	.2byte 0xF8, 0x2C, 0x1031 @ OAM Data #0
	.2byte 0xFC, 0x2C, 0x1011 @ OAM Data #1
	.2byte 0xF4, 0x2C, 0x1011 @ OAM Data #2
	.2byte 0x1EC, 0x8020, 0x1000 @ OAM Data #3
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #4
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #5
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #6

SpriteAnim_WorldmapSkirmish_frame_13: @ +$1B4
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x80, 0x80
	.2byte 8 @ oam entries
	.2byte 0xF8, 0x34, 0x1031 @ OAM Data #0
	.2byte 0xF8, 0x24, 0x1031 @ OAM Data #1
	.2byte 0x80EC, 0x2C, 0x1010 @ OAM Data #2
	.2byte 0x80FC, 0x2C, 0x1010 @ OAM Data #3
	.2byte 0x1EC, 0x8020, 0x1000 @ OAM Data #4
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #5
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #6
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #7

SpriteAnim_WorldmapSkirmish_frame_14: @ +$1EE
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0xB3, 0xB3
	.2byte 8 @ oam entries
	.2byte 0xF8, 0x20, 0x1032 @ OAM Data #0
	.2byte 0xF8, 0x38, 0x1032 @ OAM Data #1
	.2byte 0x8, 0x2C, 0x1011 @ OAM Data #2
	.2byte 0xE8, 0x2C, 0x1011 @ OAM Data #3
	.2byte 0x1EC, 0x8020, 0x1000 @ OAM Data #4
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #5
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #6
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #7

SpriteAnim_WorldmapSkirmish_frame_15: @ +$228
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0xE6, 0xE6
	.2byte 8 @ oam entries
	.2byte 0xF8, 0x3A, 0x1013 @ OAM Data #0
	.2byte 0xF8, 0x1E, 0x1013 @ OAM Data #1
	.2byte 0x1EC, 0x8020, 0x1000 @ OAM Data #2
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #3
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #4
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #5
	.2byte 0xE4, 0x2C, 0x1012 @ OAM Data #6
	.2byte 0xC, 0x2C, 0x1012 @ OAM Data #7

SpriteAnim_WorldmapSkirmish_frame_16: @ +$262
	.2byte 8 @ oam entries
	.2byte 0xF8, 0x1C, 0x1013 @ OAM Data #0
	.2byte 0xEC, 0x8020, 0x1000 @ OAM Data #1
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #2
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #3
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #4
	.2byte 0xE2, 0x2C, 0x1013 @ OAM Data #5
	.2byte 0xE, 0x2C, 0x1013 @ OAM Data #6
	.2byte 0xF8, 0x3C, 0x1013 @ OAM Data #7

SpriteAnim_WorldmapSkirmish_frame_17: @ +$294
	.2byte 9 @ oam entries
	.2byte 0xEC, 0x4020, 0x1014 @ OAM Data #0
	.2byte 0xEC, 0x5030, 0x1014 @ OAM Data #1
	.2byte 0xFC, 0x7030, 0x1014 @ OAM Data #2
	.2byte 0xFC, 0x6020, 0x1014 @ OAM Data #3
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #4
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #5
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #6
	.2byte 0xE1, 0x2C, 0x1013 @ OAM Data #7
	.2byte 0xF, 0x2C, 0x1013 @ OAM Data #8

SpriteAnim_WorldmapSkirmish_frame_18: @ +$2CC
	.2byte 3 @ oam entries
	.2byte 0x40F0, 0x81D0, 0x1004 @ OAM Data #0
	.2byte 0x40F0, 0x81F0, 0x1008 @ OAM Data #1
	.2byte 0x40F0, 0x8010, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_19: @ +$2E0
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xE6
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81D0, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81F0, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x8010, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_20: @ +$2FC
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0xB3
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81D1, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81F1, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x8011, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_21: @ +$318
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x80
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81D2, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81F2, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x8012, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_22: @ +$334
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x4C
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81D4, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81F4, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x8014, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_frame_23: @ +$350
	.2byte (1 | 0x8000) @ rotscale entries
	.2byte 0x100, 0x100, 0x19
	.2byte 3 @ oam entries
	.2byte 0x41F0, 0x81D7, 0x1004 @ OAM Data #0
	.2byte 0x41F0, 0x81F7, 0x1008 @ OAM Data #1
	.2byte 0x41F0, 0x8017, 0x100C @ OAM Data #2

SpriteAnim_WorldmapSkirmish_anim_0: @ +$36C
	.2byte  1,  0
	.2byte  1,  1
	.2byte  1,  2
	.2byte  2,  3
	.2byte  1,  4
	.2byte  1,  5
	.2byte  2,  6
	.2byte  1,  7
	.2byte  1,  8
	.2byte  1,  9
	.2byte  1, 10
	.2byte  2, 11
	.2byte  2, 12
	.2byte  2, 13
	.2byte  2, 14
	.2byte  2, 15
	.2byte  1, 16
	.2byte  1, 17
	.2byte 60, 18
	.2byte  1, 19
	.2byte  2, 20
	.2byte  1, 21
	.2byte  1, 22
	.2byte  1, 23

	.2byte 0, 1 @ kill animated object

	.byte 0x00, 0x00, 0xFF, 0xFF  @ trailing anim data not decoded by apdump
.L_end_SpriteAnim_WorldmapSkirmish:
	.if (.L_end_SpriteAnim_WorldmapSkirmish - SpriteAnim_WorldmapSkirmish) != 980
	.error "SpriteAnim_WorldmapSkirmish size mismatch"
	.endif
