@ vim:ft=armv4
	.global banim_gog_mg1_script
	.global banim_gog_mg1_oam_r
	.global banim_gog_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xBB
	.section .data.oam_l
banim_gog_mg1_oam_l:
banim_gog_mg1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA4, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x0, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x1, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -24, -40
	banim_frame_end
banim_gog_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x25, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x29, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA5, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA9, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x5, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x6, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x8, -24, -40
	banim_frame_end
banim_gog_mg1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x4A, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x4E, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xCA, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, -32, 8
	banim_frame_oam 0x4000, 0x9000, 0xB, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0xA, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x9, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x2F, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x33, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xAF, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xB3, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xF, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x11, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x7F, 8, -32
	banim_frame_end
banim_gog_mg1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x1000, 0x13, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x14, 8, -24
	banim_frame_oam 0x0, 0x9000, 0x54, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x58, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xD4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD8, -32, 8
	banim_frame_oam 0x4000, 0x9000, 0x15, -32, -40
	banim_frame_end
banim_gog_mg1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x1000, 0xBF, 8, -16
	banim_frame_oam 0x0, 0x9000, 0x39, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x3D, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xB9, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xBD, -32, 0
	banim_frame_oam 0x4000, 0x1000, 0x1A, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x1C, -24, -40
	banim_frame_oam 0x0, 0x1000, 0x19, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA4, -32, 0
	banim_frame_oam 0x4000, 0x1000, 0x1, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -24, -40
	banim_frame_oam 0x0, 0x1000, 0x4, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x0, 8, -16
	banim_frame_end
banim_gog_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x25, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x29, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA5, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA9, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0x6, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x5, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 8, -16
	banim_frame_end
banim_gog_mg1_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x9000, 0x2E, -32, -32
	banim_frame_oam 0x0, 0x5000, 0xAE, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xE, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xA, 16, -16
	banim_frame_oam 0x8000, 0x9000, 0x2B, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x2D, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xAB, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xAD, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xCA, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x4A, 8, -24
	banim_frame_end
banim_gog_mg1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0x91, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xD1, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x75, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x30, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0x90, 16, -32
	banim_frame_oam 0x0, 0x1000, 0xD0, 8, 8
	banim_frame_oam 0x4000, 0x9000, 0x31, -24, -32
	banim_frame_oam 0x4000, 0x5000, 0x71, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -24, -40
	banim_frame_end
banim_gog_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0x36, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x3A, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xB6, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xBA, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x19, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x35, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x15, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xB, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x1B, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x9B, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xDB, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xBF, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0x8A, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x16, -32, -24
	banim_frame_oam 0x8000, 0x1000, 0x3F, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x1A, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x17, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x18, -32, -32
	banim_frame_end
banim_gog_mg1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA4, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x0, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x1, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xE0, 12, -20
	banim_frame_end
banim_gog_mg1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x25, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x29, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA5, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA9, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x5, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x6, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x8, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xE0, 12, -20
	banim_frame_end
banim_gog_mg1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0x4A, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x4E, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xCA, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, -32, 8
	banim_frame_oam 0x4000, 0x9000, 0xB, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0xA, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x9, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, 12, -20
	banim_frame_end
banim_gog_mg1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x2F, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x33, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xAF, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xB3, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xF, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x11, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x7F, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xE1, 12, -20
	banim_frame_end
banim_gog_mg1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x13, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x14, 8, -24
	banim_frame_oam 0x0, 0x9000, 0x54, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x58, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xD4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD8, -32, 8
	banim_frame_oam 0x4000, 0x9000, 0x15, -32, -40
	banim_frame_oam 0x4000, 0x1000, 0xF7, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xF9, 8, -16
	banim_frame_end
banim_gog_mg1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x1000, 0xBF, 8, -16
	banim_frame_oam 0x0, 0x9000, 0x39, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x3D, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xB9, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xBD, -32, 0
	banim_frame_oam 0x4000, 0x1000, 0x1A, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x1C, -24, -40
	banim_frame_oam 0x0, 0x1000, 0x19, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xFB, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xFD, 8, -16
	banim_frame_end
banim_gog_mg1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, 8, -32
	banim_frame_oam 0x4000, 0x5000, 0xE2, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0xE6, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xEA, 8, -8
	banim_frame_oam 0x0, 0x9000, 0x20, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA4, -32, 0
	banim_frame_oam 0x4000, 0x1000, 0x1, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -24, -40
	banim_frame_oam 0x0, 0x1000, 0x4, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x0, 8, -16
	banim_frame_end
banim_gog_mg1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x5000, 0xEC, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0xF0, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xF4, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0xF6, 8, -32
	banim_frame_oam 0x0, 0x9000, 0x25, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x29, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA5, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA9, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0x6, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x5, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 8, -16
	banim_frame_end
banim_gog_mg1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x1000, 0xF8, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xFA, 8, -16
	banim_frame_oam 0x8000, 0x9000, 0x2E, -32, -32
	banim_frame_oam 0x0, 0x5000, 0xAE, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xE, -24, -40
	banim_frame_oam 0x0, 0x1000, 0xA, 16, -16
	banim_frame_oam 0x8000, 0x9000, 0x2B, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x2D, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xAB, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xAD, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x4A, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xCA, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x1000, 0xFE, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xFD, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x7F, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0x91, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xD1, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x75, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xD0, 8, 8
	banim_frame_oam 0x4000, 0x9000, 0x31, -24, -32
	banim_frame_oam 0x4000, 0x5000, 0x71, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x11, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xF, 8, -32
	banim_frame_end
banim_gog_mg1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA4, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x0, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x4, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x1, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0xE2, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE4, 8, -16
	banim_frame_end
banim_gog_mg1_oam_frame_23_l:
	banim_frame_oam 0x4000, 0x1000, 0xE6, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xE8, 0, -32
	banim_frame_oam 0x4000, 0x1000, 0xE9, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xEB, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xEC, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xEE, 8, -16
	banim_frame_oam 0x0, 0x9000, 0x25, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x29, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xA5, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA9, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x5, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x6, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x8, -24, -40
	banim_frame_end
banim_gog_mg1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x4, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0xE2, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE4, 8, -16
	banim_frame_oam 0x0, 0x9000, 0x4A, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x4E, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xCA, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, -32, 8
	banim_frame_oam 0x4000, 0x9000, 0xB, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0xA, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x9, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x1000, 0xF0, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xF2, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xF3, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xF5, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, 16, -8
	banim_frame_oam 0x0, 0x1000, 0xEF, 8, -32
	banim_frame_oam 0x0, 0x9000, 0x2F, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x33, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xAF, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xB3, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xF, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x11, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0x7F, 8, -32
	banim_frame_end
banim_gog_mg1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xE0, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE2, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xE4, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x9, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x85, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x89, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xC5, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xC9, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xE5, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xE7, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xE8, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0xE, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0x8E, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xCE, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xE9, 8, -32
	banim_frame_oam 0x4000, 0x1000, 0xEB, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xED, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xEF, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0xF0, 16, -8
	banim_frame_oam 0x0, 0x1000, 0xF2, 8, -8
	banim_frame_oam 0x4000, 0x9000, 0x8A, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xF3, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x13, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x8F, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x93, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCF, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xD3, -32, 8
	banim_frame_end
banim_gog_mg1_oam_frame_30_l:
	banim_frame_oam 0x4000, 0xD000, 0x15, -40, -40
	banim_frame_oam 0x8000, 0x9000, 0x1D, -56, -40
	banim_frame_oam 0x4000, 0x9000, 0x95, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x99, -40, -8
	banim_frame_oam 0x0, 0x5000, 0x9D, -56, -8
	banim_frame_oam 0x4000, 0x5000, 0xD5, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0xD9, -40, 8
	banim_frame_oam 0x4000, 0x1000, 0xDD, -56, 8
	banim_frame_end
banim_gog_mg1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x1, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x81, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xC1, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x80, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xC0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x20, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x0, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x40, -48, -24
	banim_frame_oam 0x8000, 0x5000, 0x25, -40, -32
	banim_frame_oam 0x0, 0x1000, 0xA5, -48, -8
	banim_frame_oam 0x0, 0x1000, 0xC5, -40, 8
	banim_frame_end
banim_gog_mg1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -40, -16
	banim_frame_oam 0x0, 0x5000, 0x2C, -56, -8
	banim_frame_oam 0x0, 0x5000, 0x26, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x66, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x6, -40, -24
	banim_frame_oam 0x0, 0x1000, 0xC, -48, -16
	banim_frame_end
banim_gog_mg1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -40, -16
	banim_frame_oam 0x0, 0x5000, 0x26, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x66, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x6, -40, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, -56, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, -56, 0
	banim_frame_oam 0x0, 0x1000, 0xC, -48, -16
	banim_frame_end
banim_gog_mg1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x9000, 0x87, -32, -16
	banim_frame_oam 0x8000, 0x5000, 0x8B, -40, -16
	banim_frame_oam 0x8000, 0x1000, 0xA6, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x86, 8, 8
	banim_frame_oam 0x8000, 0x9000, 0x8C, -56, -16
	banim_frame_end
banim_gog_mg1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x9000, 0x87, -32, -16
	banim_frame_oam 0x8000, 0x5000, 0x8B, -40, -16
	banim_frame_oam 0x8000, 0x1000, 0xA6, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x86, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xE, -56, -8
	banim_frame_oam 0x4000, 0x1000, 0x4E, -56, 8
	banim_frame_end
banim_gog_mg1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x9000, 0x8F, -32, -16
	banim_frame_oam 0x8000, 0x5000, 0x93, -40, -16
	banim_frame_oam 0x0, 0x5000, 0xB4, -56, -8
	banim_frame_oam 0x4000, 0x1000, 0xF4, -56, 8
	banim_frame_oam 0x8000, 0x1000, 0xAE, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x8F, -32, -16
	banim_frame_oam 0x8000, 0x5000, 0x93, -40, -16
	banim_frame_oam 0x8000, 0x1000, 0xAE, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, 8, 8
	banim_frame_oam 0x0, 0x5000, 0x10, -56, -8
	banim_frame_oam 0x4000, 0x1000, 0x50, -56, 8
	banim_frame_end
banim_gog_mg1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0xD000, 0x16, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x96, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0x9A, -32, -8
	banim_frame_oam 0x0, 0x5000, 0x9E, -48, -8
	banim_frame_oam 0x4000, 0x5000, 0xD6, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0xDA, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xDE, -48, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, -56, -16
	banim_frame_oam 0x0, 0x1000, 0xF7, -56, -8
	banim_frame_oam 0x0, 0x1000, 0xF8, -56, 0
	banim_frame_oam 0x0, 0x5000, 0x3E, -48, -32
	banim_frame_oam 0x4000, 0x1000, 0x7E, -48, -16
	banim_frame_end
banim_gog_mg1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x5000, 0xA4, 16, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xE3, 16, -8
	banim_frame_end
banim_gog_mg1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xA, -32, -8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -24, -24
	banim_frame_oam 0x0, 0x5000, 0x6A, 16, -24
	banim_frame_oam 0x4000, 0x1000, 0xAA, 16, -8
	banim_frame_end
banim_gog_mg1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x10, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xD0, 8, -24
	banim_frame_oam 0x0, 0x5000, 0x90, 16, -24
	banim_frame_end
banim_gog_mg1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x4, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x84, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xC4, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xE1, 8, -24
	banim_frame_end
banim_gog_mg1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x9, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x85, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x89, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xC5, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xC9, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xE7, 8, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x8A, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xCA, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x6E, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x2E, 16, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x10, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x90, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xD0, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x74, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0xF, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xE, 16, -8
	banim_frame_oam 0x0, 0x1000, 0x4F, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x16, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x1A, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x96, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x9A, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD6, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xDA, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xD5, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x75, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x15, 16, -16
	banim_frame_end
banim_gog_mg1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x9000, 0x1B, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x9B, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xDB, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x7F, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xFC, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0xFE, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xFB, 8, 8
	banim_frame_end
banim_gog_mg1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x24, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xA4, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -32, 8
	banim_frame_end
banim_gog_mg1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x9000, 0x26, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x2A, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0xA6, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xAA, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x8B, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x6B, -40, -8
	banim_frame_end
banim_gog_mg1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x9000, 0x2C, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x30, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0xAC, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xB0, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xF0, -32, 8
	banim_frame_end
banim_gog_mg1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_gog_mg1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_gog_mg1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_gog_mg1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_gog_mg1_oam_frame_53_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x84, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xC4, -32, 8
	banim_frame_end
banim_gog_mg1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0xA, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x86, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x8A, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xC6, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xCA, -32, 8
	banim_frame_end
banim_gog_mg1_oam_frame_55_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x10, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x90, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xD0, -32, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_gog_mg1_oam_r:
banim_gog_mg1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA4, 24, 0
	banim_frame_oam 0x0, 0x0, 0x0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x1, 0, -40
	banim_frame_oam 0x0, 0x0, 0x3, 16, -40
	banim_frame_end
banim_gog_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x25, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x29, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA5, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA9, 24, 0
	banim_frame_oam 0x0, 0x0, 0x5, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x6, 0, -40
	banim_frame_oam 0x0, 0x0, 0x8, 16, -40
	banim_frame_end
banim_gog_mg1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x4A, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x4E, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xCA, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCE, 24, 8
	banim_frame_oam 0x4000, 0x8000, 0xB, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xA, -16, -24
	banim_frame_oam 0x0, 0x0, 0x9, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x2F, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x33, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xAF, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xB3, 24, 0
	banim_frame_oam 0x0, 0x0, 0xF, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x11, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x7F, -16, -32
	banim_frame_end
banim_gog_mg1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x0, 0x13, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x14, -16, -24
	banim_frame_oam 0x0, 0x8000, 0x54, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x58, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xD4, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD8, 24, 8
	banim_frame_oam 0x4000, 0x8000, 0x15, 0, -40
	banim_frame_end
banim_gog_mg1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x0, 0xBF, -16, -16
	banim_frame_oam 0x0, 0x8000, 0x39, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x3D, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xB9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xBD, 24, 0
	banim_frame_oam 0x4000, 0x0, 0x1A, 0, -40
	banim_frame_oam 0x0, 0x0, 0x1C, 16, -40
	banim_frame_oam 0x0, 0x0, 0x19, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA4, 24, 0
	banim_frame_oam 0x4000, 0x0, 0x1, 0, -40
	banim_frame_oam 0x0, 0x0, 0x3, 16, -40
	banim_frame_oam 0x0, 0x0, 0x4, -16, 8
	banim_frame_oam 0x0, 0x0, 0x0, -16, -16
	banim_frame_end
banim_gog_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x25, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x29, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA5, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA9, 24, 0
	banim_frame_oam 0x4000, 0x4000, 0x6, 0, -40
	banim_frame_oam 0x0, 0x0, 0x5, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, -16, -16
	banim_frame_end
banim_gog_mg1_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x8000, 0x2E, 16, -32
	banim_frame_oam 0x0, 0x4000, 0xAE, 16, 0
	banim_frame_oam 0x0, 0x0, 0xE, 16, -40
	banim_frame_oam 0x0, 0x0, 0xA, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x2B, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x2D, 8, -32
	banim_frame_oam 0x0, 0x4000, 0xAB, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xAD, 8, 0
	banim_frame_oam 0x0, 0x0, 0xCA, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x4A, -16, -24
	banim_frame_end
banim_gog_mg1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0x91, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD1, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x75, 24, -16
	banim_frame_oam 0x8000, 0x0, 0x30, -16, -32
	banim_frame_oam 0x8000, 0x0, 0x90, -24, -32
	banim_frame_oam 0x0, 0x0, 0xD0, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x31, -8, -32
	banim_frame_oam 0x4000, 0x4000, 0x71, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x13, 8, -40
	banim_frame_end
banim_gog_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0x36, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x3A, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xB6, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xBA, 24, 0
	banim_frame_oam 0x0, 0x0, 0x19, 16, -40
	banim_frame_oam 0x8000, 0x0, 0x35, -16, -24
	banim_frame_oam 0x0, 0x0, 0x15, -24, -16
	banim_frame_oam 0x0, 0x0, 0xB, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x1B, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x9B, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xDB, -8, 8
	banim_frame_oam 0x8000, 0x0, 0xBF, 24, 0
	banim_frame_oam 0x8000, 0x0, 0x8A, 24, -16
	banim_frame_oam 0x0, 0x0, 0x16, 24, -24
	banim_frame_oam 0x8000, 0x0, 0x3F, -16, -16
	banim_frame_oam 0x0, 0x0, 0x1A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x17, 24, -40
	banim_frame_oam 0x0, 0x0, 0x18, 24, -32
	banim_frame_end
banim_gog_mg1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA4, 24, 0
	banim_frame_oam 0x0, 0x0, 0x0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x1, 0, -40
	banim_frame_oam 0x0, 0x0, 0x3, 16, -40
	banim_frame_oam 0x0, 0x0, 0xE0, -20, -20
	banim_frame_end
banim_gog_mg1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x25, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x29, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA5, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA9, 24, 0
	banim_frame_oam 0x0, 0x0, 0x5, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x6, 0, -40
	banim_frame_oam 0x0, 0x0, 0x8, 16, -40
	banim_frame_oam 0x0, 0x0, 0xE0, -20, -20
	banim_frame_end
banim_gog_mg1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0x4A, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x4E, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xCA, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCE, 24, 8
	banim_frame_oam 0x4000, 0x8000, 0xB, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xA, -16, -24
	banim_frame_oam 0x0, 0x0, 0x9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE0, -20, -20
	banim_frame_end
banim_gog_mg1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x2F, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x33, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xAF, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xB3, 24, 0
	banim_frame_oam 0x0, 0x0, 0xF, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x11, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x7F, -16, -32
	banim_frame_oam 0x0, 0x0, 0xE1, -20, -20
	banim_frame_end
banim_gog_mg1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x13, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x14, -16, -24
	banim_frame_oam 0x0, 0x8000, 0x54, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x58, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xD4, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD8, 24, 8
	banim_frame_oam 0x4000, 0x8000, 0x15, 0, -40
	banim_frame_oam 0x4000, 0x0, 0xF7, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xF9, -24, -16
	banim_frame_end
banim_gog_mg1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x0, 0xBF, -16, -16
	banim_frame_oam 0x0, 0x8000, 0x39, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x3D, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xB9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xBD, 24, 0
	banim_frame_oam 0x4000, 0x0, 0x1A, 0, -40
	banim_frame_oam 0x0, 0x0, 0x1C, 16, -40
	banim_frame_oam 0x0, 0x0, 0x19, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xFB, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xFD, -24, -16
	banim_frame_end
banim_gog_mg1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -24, -32
	banim_frame_oam 0x4000, 0x4000, 0xE2, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0xE6, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xEA, -24, -8
	banim_frame_oam 0x0, 0x8000, 0x20, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA4, 24, 0
	banim_frame_oam 0x4000, 0x0, 0x1, 0, -40
	banim_frame_oam 0x0, 0x0, 0x3, 16, -40
	banim_frame_oam 0x0, 0x0, 0x4, -16, 8
	banim_frame_oam 0x0, 0x0, 0x0, -16, -16
	banim_frame_end
banim_gog_mg1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x4000, 0xEC, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0xF0, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xF4, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xF6, -24, -32
	banim_frame_oam 0x0, 0x8000, 0x25, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x29, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA5, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA9, 24, 0
	banim_frame_oam 0x4000, 0x4000, 0x6, 0, -40
	banim_frame_oam 0x0, 0x0, 0x5, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, -16, -16
	banim_frame_end
banim_gog_mg1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x0, 0xF8, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xFA, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x2E, 16, -32
	banim_frame_oam 0x0, 0x4000, 0xAE, 16, 0
	banim_frame_oam 0x0, 0x0, 0xE, 16, -40
	banim_frame_oam 0x0, 0x0, 0xA, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x2B, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x2D, 8, -32
	banim_frame_oam 0x0, 0x4000, 0xAB, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xAD, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x4A, -16, -24
	banim_frame_oam 0x0, 0x0, 0xCA, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x0, 0xFE, -24, -16
	banim_frame_oam 0x0, 0x0, 0xFD, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x7F, -32, -24
	banim_frame_oam 0x4000, 0x8000, 0x91, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD1, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x75, 24, -16
	banim_frame_oam 0x0, 0x0, 0xD0, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x31, -8, -32
	banim_frame_oam 0x4000, 0x4000, 0x71, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x13, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x11, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xF, -24, -32
	banim_frame_end
banim_gog_mg1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA4, 24, 0
	banim_frame_oam 0x0, 0x0, 0x0, -16, 8
	banim_frame_oam 0x0, 0x0, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x1, 0, -40
	banim_frame_oam 0x0, 0x0, 0x3, 16, -40
	banim_frame_oam 0x4000, 0x0, 0xE2, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xE4, -24, -16
	banim_frame_end
banim_gog_mg1_oam_frame_23_r:
	banim_frame_oam 0x4000, 0x0, 0xE6, -24, -32
	banim_frame_oam 0x0, 0x0, 0xE8, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xE9, -24, -24
	banim_frame_oam 0x0, 0x0, 0xEB, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xEC, -32, -16
	banim_frame_oam 0x0, 0x0, 0xEE, -16, -16
	banim_frame_oam 0x0, 0x8000, 0x25, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x29, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xA5, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xA9, 24, 0
	banim_frame_oam 0x0, 0x0, 0x5, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x3F, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x6, 0, -40
	banim_frame_oam 0x0, 0x0, 0x8, 16, -40
	banim_frame_end
banim_gog_mg1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x4, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xE2, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xE4, -24, -16
	banim_frame_oam 0x0, 0x8000, 0x4A, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x4E, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xCA, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCE, 24, 8
	banim_frame_oam 0x4000, 0x8000, 0xB, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xA, -16, -24
	banim_frame_oam 0x0, 0x0, 0x9, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x0, 0xF0, -32, -24
	banim_frame_oam 0x0, 0x0, 0xF2, -16, -24
	banim_frame_oam 0x4000, 0x0, 0xF3, -24, -16
	banim_frame_oam 0x0, 0x0, 0xF5, -8, -16
	banim_frame_oam 0x0, 0x0, 0xF6, -24, -8
	banim_frame_oam 0x0, 0x0, 0xEF, -16, -32
	banim_frame_oam 0x0, 0x8000, 0x2F, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x33, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0xAF, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xB3, 24, 0
	banim_frame_oam 0x0, 0x0, 0xF, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x11, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x7F, -16, -32
	banim_frame_end
banim_gog_mg1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xE0, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xE2, -24, -16
	banim_frame_oam 0x0, 0x0, 0xE4, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x9, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x85, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x89, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xC5, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC9, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xE5, -24, -24
	banim_frame_oam 0x0, 0x0, 0xE7, -16, -16
	banim_frame_oam 0x0, 0x0, 0xE8, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0xE, 24, -40
	banim_frame_oam 0x8000, 0x0, 0x8E, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCE, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xE9, -24, -32
	banim_frame_oam 0x4000, 0x0, 0xEB, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xED, -32, -16
	banim_frame_oam 0x0, 0x0, 0xEF, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xF0, -32, -8
	banim_frame_oam 0x0, 0x0, 0xF2, -16, -8
	banim_frame_oam 0x4000, 0x8000, 0x8A, -8, -8
	banim_frame_oam 0x0, 0x0, 0xF3, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x13, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x8F, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x93, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCF, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xD3, 16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_30_r:
	banim_frame_oam 0x4000, 0xC000, 0x15, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x1D, 40, -40
	banim_frame_oam 0x4000, 0x8000, 0x95, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x99, 8, -8
	banim_frame_oam 0x0, 0x4000, 0x9D, 40, -8
	banim_frame_oam 0x4000, 0x4000, 0xD5, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0xD9, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xDD, 40, 8
	banim_frame_end
banim_gog_mg1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x1, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x81, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xC1, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x80, -8, -8
	banim_frame_oam 0x0, 0x0, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x0, 0x20, -8, -24
	banim_frame_oam 0x0, 0x0, 0x0, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x40, 40, -24
	banim_frame_oam 0x8000, 0x4000, 0x25, 32, -32
	banim_frame_oam 0x0, 0x0, 0xA5, 40, -8
	banim_frame_oam 0x0, 0x0, 0xC5, 32, 8
	banim_frame_end
banim_gog_mg1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x8000, 0x8, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x2C, 40, -8
	banim_frame_oam 0x0, 0x4000, 0x26, -8, -8
	banim_frame_oam 0x4000, 0x0, 0x66, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x6, 24, -24
	banim_frame_oam 0x0, 0x0, 0xC, 40, -16
	banim_frame_end
banim_gog_mg1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x8, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x26, -8, -8
	banim_frame_oam 0x4000, 0x0, 0x66, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x6, 24, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, 40, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, 40, 0
	banim_frame_oam 0x0, 0x0, 0xC, 40, -16
	banim_frame_end
banim_gog_mg1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x8000, 0x87, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x8B, 32, -16
	banim_frame_oam 0x8000, 0x0, 0xA6, -8, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -8, 8
	banim_frame_oam 0x0, 0x0, 0x86, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x8C, 40, -16
	banim_frame_end
banim_gog_mg1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x8000, 0x87, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x8B, 32, -16
	banim_frame_oam 0x8000, 0x0, 0xA6, -8, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -8, 8
	banim_frame_oam 0x0, 0x0, 0x86, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xE, 40, -8
	banim_frame_oam 0x4000, 0x0, 0x4E, 40, 8
	banim_frame_end
banim_gog_mg1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x8000, 0x8F, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x93, 32, -16
	banim_frame_oam 0x0, 0x4000, 0xB4, 40, -8
	banim_frame_oam 0x4000, 0x0, 0xF4, 40, 8
	banim_frame_oam 0x8000, 0x0, 0xAE, -8, -8
	banim_frame_oam 0x0, 0x0, 0xEE, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8E, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x8F, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x93, 32, -16
	banim_frame_oam 0x8000, 0x0, 0xAE, -8, -8
	banim_frame_oam 0x0, 0x0, 0xEE, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8E, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x10, 40, -8
	banim_frame_oam 0x4000, 0x0, 0x50, 40, 8
	banim_frame_end
banim_gog_mg1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0xC000, 0x16, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0x96, -32, -8
	banim_frame_oam 0x4000, 0x8000, 0x9A, 0, -8
	banim_frame_oam 0x0, 0x4000, 0x9E, 32, -8
	banim_frame_oam 0x4000, 0x4000, 0xD6, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0xDA, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xDE, 32, 8
	banim_frame_oam 0x0, 0x0, 0xF6, 48, -16
	banim_frame_oam 0x0, 0x0, 0xF7, 48, -8
	banim_frame_oam 0x0, 0x0, 0xF8, 48, 0
	banim_frame_oam 0x0, 0x4000, 0x3E, 32, -32
	banim_frame_oam 0x4000, 0x0, 0x7E, 32, -16
	banim_frame_end
banim_gog_mg1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0xA4, -32, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -32, -16
	banim_frame_oam 0x0, 0x0, 0xE3, -24, -8
	banim_frame_end
banim_gog_mg1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xA, 16, -8
	banim_frame_oam 0x4000, 0x0, 0x4A, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 16, -24
	banim_frame_oam 0x0, 0x4000, 0x6A, -32, -24
	banim_frame_oam 0x4000, 0x0, 0xAA, -32, -8
	banim_frame_end
banim_gog_mg1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x10, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xD0, -16, -24
	banim_frame_oam 0x0, 0x4000, 0x90, -32, -24
	banim_frame_end
banim_gog_mg1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x4, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x84, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC4, 24, 8
	banim_frame_oam 0x4000, 0x0, 0xE2, -24, -16
	banim_frame_oam 0x0, 0x0, 0xE1, -16, -24
	banim_frame_end
banim_gog_mg1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x9, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x85, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x89, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xC5, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC9, 24, 8
	banim_frame_oam 0x0, 0x0, 0xE5, -16, -16
	banim_frame_oam 0x0, 0x0, 0xE6, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE7, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0x8A, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCA, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x6E, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x2E, -24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x10, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x90, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD0, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x74, 24, -16
	banim_frame_oam 0x8000, 0x0, 0xF, -16, -16
	banim_frame_oam 0x0, 0x0, 0xE, -24, -8
	banim_frame_oam 0x0, 0x0, 0x4F, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x16, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x1A, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x96, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x9A, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xD6, -8, 8
	banim_frame_oam 0x0, 0x0, 0xDA, 24, 8
	banim_frame_oam 0x0, 0x0, 0xD5, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x75, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x15, -24, -16
	banim_frame_end
banim_gog_mg1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x8000, 0x1B, -8, -40
	banim_frame_oam 0x4000, 0x8000, 0x9B, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xDB, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x7F, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xFC, -24, -16
	banim_frame_oam 0x4000, 0x0, 0xFE, -24, -8
	banim_frame_oam 0x0, 0x0, 0xFB, -16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x24, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xA4, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE4, 16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x8000, 0x26, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x2A, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0xA6, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xAA, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 16, 8
	banim_frame_oam 0x8000, 0x4000, 0x8B, 24, -16
	banim_frame_oam 0x0, 0x0, 0x6B, 32, -8
	banim_frame_end
banim_gog_mg1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x8000, 0x2C, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x30, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0xAC, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xB0, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xF0, 16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_gog_mg1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_gog_mg1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_gog_mg1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_gog_mg1_oam_frame_53_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x84, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xC4, 16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0xA, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x86, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x8A, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC6, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xCA, 16, 8
	banim_frame_end
banim_gog_mg1_oam_frame_55_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x10, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x90, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xD0, 16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_gog_mg1_script:
banim_gog_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_sound_gorgon_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 10, banim_gog_mg1_oam_frame_10_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 11, banim_gog_mg1_oam_frame_11_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 12, banim_gog_mg1_oam_frame_12_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 13, banim_gog_mg1_oam_frame_13_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_sound_gorgon_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_scream
	banim_code_frame 3, banim_gog_mg1_sheet_5, 46, banim_gog_mg1_oam_frame_48_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 47, banim_gog_mg1_oam_frame_49_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_6, 48, banim_gog_mg1_oam_frame_50_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 47, banim_gog_mg1_oam_frame_49_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 46, banim_gog_mg1_oam_frame_48_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_1
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_scream
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_1
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 54, banim_gog_mg1_oam_frame_46_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 52, banim_gog_mg1_oam_frame_47_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 53, banim_gog_mg1_oam_frame_45_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 51, banim_gog_mg1_oam_frame_44_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_sound_gorgon_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 10, banim_gog_mg1_oam_frame_10_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 11, banim_gog_mg1_oam_frame_11_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 12, banim_gog_mg1_oam_frame_12_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 13, banim_gog_mg1_oam_frame_13_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_scream
	banim_code_frame 3, banim_gog_mg1_sheet_5, 46, banim_gog_mg1_oam_frame_48_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 47, banim_gog_mg1_oam_frame_49_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_6, 48, banim_gog_mg1_oam_frame_50_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_6, 49, banim_gog_mg1_oam_frame_51_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_6, 50, banim_gog_mg1_oam_frame_52_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 47, banim_gog_mg1_oam_frame_49_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_5, 46, banim_gog_mg1_oam_frame_48_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_1
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_gog_mg1_sheet_7, 55, banim_gog_mg1_oam_frame_53_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_7, 56, banim_gog_mg1_oam_frame_54_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_gog_mg1_sheet_7, 57, banim_gog_mg1_oam_frame_55_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_gog_mg1_sheet_7, 55, banim_gog_mg1_oam_frame_53_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_7, 56, banim_gog_mg1_oam_frame_54_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_gog_mg1_sheet_7, 57, banim_gog_mg1_oam_frame_55_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_gog_mg1_mode_stand_close:
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gog_mg1_mode_stand:
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gog_mg1_mode_stand_range:
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_gog_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_sound_gorgon_1
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 5, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 4, banim_gog_mg1_sheet_1, 10, banim_gog_mg1_oam_frame_10_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_1, 11, banim_gog_mg1_oam_frame_11_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 12, banim_gog_mg1_oam_frame_12_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 13, banim_gog_mg1_oam_frame_13_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 14, banim_gog_mg1_oam_frame_14_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 15, banim_gog_mg1_oam_frame_15_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 16, banim_gog_mg1_oam_frame_16_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 4, banim_gog_mg1_oam_frame_4_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 17, banim_gog_mg1_oam_frame_17_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 5, banim_gog_mg1_oam_frame_5_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 18, banim_gog_mg1_oam_frame_18_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 6, banim_gog_mg1_oam_frame_6_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 19, banim_gog_mg1_oam_frame_19_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 7, banim_gog_mg1_oam_frame_7_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 20, banim_gog_mg1_oam_frame_20_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 8, banim_gog_mg1_oam_frame_8_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 21, banim_gog_mg1_oam_frame_21_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_1, 9, banim_gog_mg1_oam_frame_9_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 22, banim_gog_mg1_oam_frame_22_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 23, banim_gog_mg1_oam_frame_23_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 1, banim_gog_mg1_oam_frame_1_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 24, banim_gog_mg1_oam_frame_24_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 2, banim_gog_mg1_oam_frame_2_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 25, banim_gog_mg1_oam_frame_25_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_0, 3, banim_gog_mg1_oam_frame_3_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 26, banim_gog_mg1_oam_frame_26_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 27, banim_gog_mg1_oam_frame_27_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 28, banim_gog_mg1_oam_frame_28_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_2, 29, banim_gog_mg1_oam_frame_29_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_2
	banim_code_frame 2, banim_gog_mg1_sheet_2, 30, banim_gog_mg1_oam_frame_30_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 31, banim_gog_mg1_oam_frame_31_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 32, banim_gog_mg1_oam_frame_32_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 33, banim_gog_mg1_oam_frame_33_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 34, banim_gog_mg1_oam_frame_34_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 35, banim_gog_mg1_oam_frame_35_r - banim_gog_mg1_oam_r
	banim_code_frame 2, banim_gog_mg1_sheet_3, 36, banim_gog_mg1_oam_frame_36_r - banim_gog_mg1_oam_r
	banim_code_frame 8, banim_gog_mg1_sheet_3, 37, banim_gog_mg1_oam_frame_37_r - banim_gog_mg1_oam_r
	banim_code_sound_gorgon_3
	banim_code_frame 2, banim_gog_mg1_sheet_3, 38, banim_gog_mg1_oam_frame_38_r - banim_gog_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 3, banim_gog_mg1_sheet_4, 39, banim_gog_mg1_oam_frame_39_r - banim_gog_mg1_oam_r
	banim_code_frame 3, banim_gog_mg1_sheet_4, 40, banim_gog_mg1_oam_frame_40_r - banim_gog_mg1_oam_r
	banim_code_cape_flowing
	banim_code_frame 1, banim_gog_mg1_sheet_4, 41, banim_gog_mg1_oam_frame_41_r - banim_gog_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_gog_mg1_sheet_5, 42, banim_gog_mg1_oam_frame_42_r - banim_gog_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_gog_mg1_sheet_5, 43, banim_gog_mg1_oam_frame_43_r - banim_gog_mg1_oam_r
	banim_code_frame 1, banim_gog_mg1_sheet_0, 0, banim_gog_mg1_oam_frame_0_r - banim_gog_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_gog_mg1_mode_attack_close - banim_gog_mg1_script
	.word banim_gog_mg1_mode_attack_close_back - banim_gog_mg1_script
	.word banim_gog_mg1_mode_attack_close_critical - banim_gog_mg1_script
	.word banim_gog_mg1_mode_attack_close_critical_back - banim_gog_mg1_script
	.word banim_gog_mg1_mode_attack_range - banim_gog_mg1_script
	.word banim_gog_mg1_mode_attack_range_critical - banim_gog_mg1_script
	.word banim_gog_mg1_mode_dodge_close - banim_gog_mg1_script
	.word banim_gog_mg1_mode_dodge_range - banim_gog_mg1_script
	.word banim_gog_mg1_mode_stand_close - banim_gog_mg1_script
	.word banim_gog_mg1_mode_stand - banim_gog_mg1_script
	.word banim_gog_mg1_mode_stand_range - banim_gog_mg1_script
	.word banim_gog_mg1_mode_attack_miss - banim_gog_mg1_script
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0

