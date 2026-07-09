@ vim:ft=armv4
	.global banim_necm_ro1_script
	.global banim_necm_ro1_oam_r
	.global banim_necm_ro1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9D
	.section .data.oam_l
banim_necm_ro1_oam_l:
banim_necm_ro1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x1, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x81, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x20, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x23, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x3, 8, -24
	banim_frame_end
banim_necm_ro1_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x5000, 0x25, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x29, -24, 8
	banim_frame_oam 0x4000, 0x5000, 0x4, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x8, -24, 0
	banim_frame_oam 0x4000, 0x9000, 0xC0, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC4, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xA0, 24, -8
	banim_frame_oam 0x0, 0x1000, 0xA4, 24, -16
	banim_frame_end
banim_necm_ro1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x46, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xC6, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xAA, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x65, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xA5, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0xC5, 24, -16
	banim_frame_end
banim_necm_ro1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0xA, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x4A, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x2E, -16, -16
	banim_frame_oam 0x4000, 0x9000, 0x6A, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x6E, -24, 0
	banim_frame_end
banim_necm_ro1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x2F, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x10, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0x13, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0xAF, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x73, -24, 0
	banim_frame_end
banim_necm_ro1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0xAB, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xEB, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xEF, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xB0, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xB4, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xF0, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xF2, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xF3, -24, -16
	banim_frame_end
banim_necm_ro1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x16, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x94, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x96, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x37, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xB5, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x1A, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x98, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x9A, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x3B, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xB6, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x9C, -8, 8
	banim_frame_oam 0x8000, 0x9000, 0x3E, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xD6, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xFD, -24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0xB7, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xF7, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xBB, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xFB, 8, 8
	banim_frame_end
banim_necm_ro1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x43, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x83, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x3, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xE6, -24, -16
	banim_frame_end
banim_necm_ro1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0xA1, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xA3, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0x4, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xC0, -24, -16
	banim_frame_end
banim_necm_ro1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x44, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xC4, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA8, -24, 0
	banim_frame_oam 0x0, 0x5000, 0x9, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xB, -8, -40
	banim_frame_end
banim_necm_ro1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x49, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x4B, -8, -40
	banim_frame_oam 0x4000, 0x1000, 0xC9, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xCB, -8, -8
	banim_frame_oam 0x8000, 0x9000, 0x4C, -24, -16
	banim_frame_oam 0x0, 0x5000, 0xC, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0xE, -8, 0
	banim_frame_end
banim_necm_ro1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x11, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x8F, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x91, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xCF, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xD1, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x4E, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xCE, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xEF, -24, 8
	banim_frame_end
banim_necm_ro1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x14, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x92, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x94, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xD2, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD4, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x15, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x55, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x95, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xB5, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xF1, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xF2, 8, -32
	banim_frame_end
banim_necm_ro1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x18, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x96, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x98, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xD6, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD8, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x59, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0xD9, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x19, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xF7, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xF8, 8, -32
	banim_frame_end
banim_necm_ro1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x1B, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x1D, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x9B, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x9D, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xDB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xDD, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x5E, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0xDE, -32, 8
	banim_frame_oam 0x0, 0x1000, 0x3E, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x1A, 8, -40
	banim_frame_end
banim_necm_ro1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0x80, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x64, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xA4, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x24, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x44, 8, 8
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -32
	banim_frame_oam 0x8000, 0x1000, 0x23, -24, -24
	banim_frame_oam 0x0, 0x1000, 0x63, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x3, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0xC4, 8, -40
	banim_frame_end
banim_necm_ro1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xC2, -16, -32
	banim_frame_oam 0x0, 0x1000, 0xE3, -24, -24
	banim_frame_oam 0x0, 0x9000, 0x5, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x29, -32, -8
	banim_frame_oam 0x0, 0x1000, 0x88, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x87, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x69, 8, -40
	banim_frame_end
banim_necm_ro1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x9000, 0x85, -8, -32
	banim_frame_oam 0x0, 0x5000, 0xC8, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0xA, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xE, -32, 0
	banim_frame_oam 0x0, 0x1000, 0x9, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xA7, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xE7, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x87, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x69, 8, -40
	banim_frame_end
banim_necm_ro1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x9000, 0x4A, -8, -32
	banim_frame_oam 0x0, 0x5000, 0xCA, -8, 0
	banim_frame_oam 0x8000, 0x9000, 0x4C, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xCC, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x87, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x69, 8, -40
	banim_frame_end
banim_necm_ro1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x11, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x8F, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x91, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xCE, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xCF, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xEF, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x87, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x69, 8, -40
	banim_frame_end
banim_necm_ro1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x1000, 0x94, -32, -8
	banim_frame_oam 0x4000, 0x9000, 0xD0, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xD4, 8, 8
	banim_frame_oam 0x0, 0x5000, 0x54, -24, -16
	banim_frame_oam 0x0, 0x5000, 0xBD, 16, -32
	banim_frame_oam 0x8000, 0x1000, 0xBF, 8, -32
	banim_frame_oam 0x4000, 0x1000, 0xFD, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xFF, 8, -16
	banim_frame_oam 0x0, 0x5000, 0x32, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x72, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x12, 0, -32
	banim_frame_oam 0x4000, 0x1000, 0x13, 8, -40
	banim_frame_oam 0x0, 0x1000, 0x15, 0, -40
	banim_frame_end
banim_necm_ro1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x96, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xB6, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xB8, -32, -8
	banim_frame_oam 0x8000, 0x5000, 0x19, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x7F, 24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x1A, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x9A, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xB9, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0xBB, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xF9, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x7F, 24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_26_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0x84, -32, 8
	banim_frame_end
banim_necm_ro1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0xD000, 0x8, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x88, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0x8C, -32, 8
	banim_frame_end
banim_necm_ro1_oam_frame_28_l:
	banim_frame_oam 0x4000, 0xD000, 0x10, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x90, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0x94, -32, 8
	banim_frame_end
banim_necm_ro1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x18, 0, -24
	banim_frame_oam 0x8000, 0x9000, 0x1C, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1E, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x98, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0x9C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9E, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x3F, -32, -16
	banim_frame_end
banim_necm_ro1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x9000, 0x1, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x81, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x25, -32, -16
	banim_frame_oam 0x8000, 0x5000, 0x20, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0xE2, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xE1, 24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x9000, 0xA2, -24, -24
	banim_frame_oam 0x0, 0x5000, 0xA0, 8, -24
	banim_frame_oam 0x4000, 0x9000, 0x6, -16, -8
	banim_frame_oam 0x0, 0x5000, 0xA, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x46, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xE1, 24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x68, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x6A, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xE8, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x87, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xC6, -32, -8
	banim_frame_oam 0x0, 0x1000, 0x4A, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xE1, 24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_33_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0xF, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x8D, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8F, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x2C, 8, -16
	banim_frame_oam 0x0, 0x5000, 0xAC, -32, -8
	banim_frame_oam 0x0, 0x1000, 0xEC, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xE1, 24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x91, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x30, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0xB0, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xF0, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xD1, -32, 0
	banim_frame_oam 0x4000, 0x1000, 0xE2, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xE1, 24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_35_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x17, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x95, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x97, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x34, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0xB2, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xF2, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xE1, 24, -24
	banim_frame_end
banim_necm_ro1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0xB5, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xF5, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xD7, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xD4, 8, -16
	banim_frame_oam 0x4000, 0x9000, 0x18, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x1C, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0xF8, 16, -16
	banim_frame_end
banim_necm_ro1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x5000, 0xD8, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x7C, -24, -16
	banim_frame_oam 0x8000, 0x9000, 0x59, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x5B, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0x78, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xB8, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x1D, 16, -24
	banim_frame_oam 0x0, 0x1000, 0x1E, 8, -24
	banim_frame_end
banim_necm_ro1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x4, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x60, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0x9000, 0x6, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xA, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x46, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xA2, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xA5, 8, -24
	banim_frame_end
banim_necm_ro1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x66, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xAA, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0x84, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, -24
	banim_frame_end
banim_necm_ro1_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x8D, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x2F, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x4C, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x8C, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xC, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xAC, 8, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x55, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x95, -24, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0xB1, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xF1, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0x16, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x1A, -24, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x56, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x5A, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x96, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9A, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xB6, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xD8, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xD5, 8, -16
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x1B, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0x7C, -32, 8
	banim_frame_oam 0x4000, 0x9000, 0xB9, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xBD, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xBF, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0x5C, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x7E, 8, -24
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x6, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x46, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x60, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x64, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x66, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0xA0, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xA4, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xC6, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xE4, -32, -8
	banim_frame_oam 0x0, 0x1000, 0xC6, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x7, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xB, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xD, -32, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x47, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x4B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xC7, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x6D, -32, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xE, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8E, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x92, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x34, -32, -16
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0xAE, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xB2, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xEE, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xF2, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0xD4, -32, -16
	banim_frame_oam 0x4000, 0x9000, 0x15, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x19, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x1B, -32, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x55, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x59, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x5B, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x99, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x9B, -32, -8
	banim_frame_oam 0x4000, 0x9000, 0xB6, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xBA, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xD5, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x9C, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1C, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x1E, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xF5, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xF9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xFB, -32, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x26, -32, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8B, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x2D, -32, -16
	banim_frame_end
banim_necm_ro1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_necm_ro1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_necm_ro1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_necm_ro1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x4E, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x52, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x8E, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x92, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0xE, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0x2F, -20, -17
	banim_frame_oam 0x4000, 0x1000, 0x10, -12, -25
	banim_frame_oam 0x8000, 0x1000, 0x13, 12, -9
	banim_frame_oam 0x8000, 0x1000, 0xAF, -28, -17
	banim_frame_oam 0x8000, 0x1000, 0x73, -28, -1
	banim_frame_end
banim_necm_ro1_oam_frame_47_l:
	banim_frame_oam 0x4000, 0x9000, 0xAB, -20, -25
	banim_frame_oam 0x4000, 0x5000, 0xEB, -20, -9
	banim_frame_oam 0x0, 0x1000, 0xEF, -28, -9
	banim_frame_oam 0x4000, 0x9000, 0xB0, -20, -1
	banim_frame_oam 0x8000, 0x1000, 0xB4, -28, -1
	banim_frame_oam 0x0, 0x1000, 0xF0, -36, -1
	banim_frame_oam 0x0, 0x1000, 0xF2, -28, -25
	banim_frame_oam 0x0, 0x1000, 0xF3, -28, -17
	banim_frame_end
banim_necm_ro1_oam_frame_48_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, -12, -25
	banim_frame_oam 0x8000, 0x5000, 0x16, -20, -25
	banim_frame_oam 0x4000, 0x1000, 0x94, -12, 7
	banim_frame_oam 0x0, 0x1000, 0x96, -20, 7
	banim_frame_oam 0x8000, 0x5000, 0x37, -28, -17
	banim_frame_oam 0x8000, 0x1000, 0xB5, 4, -1
	banim_frame_oam 0x0, 0x1000, 0xF4, -28, -25
	banim_frame_end
banim_necm_ro1_oam_frame_49_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, -12, -25
	banim_frame_oam 0x8000, 0x5000, 0x1A, -20, -25
	banim_frame_oam 0x4000, 0x1000, 0x98, -12, 7
	banim_frame_oam 0x0, 0x1000, 0x9A, -20, 7
	banim_frame_oam 0x8000, 0x5000, 0x3B, -28, -17
	banim_frame_oam 0x8000, 0x1000, 0xB6, 4, -1
	banim_frame_oam 0x0, 0x1000, 0xF4, -28, -25
	banim_frame_end
banim_necm_ro1_oam_frame_50_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -12, -25
	banim_frame_oam 0x4000, 0x1000, 0x9C, -12, 7
	banim_frame_oam 0x8000, 0x9000, 0x3E, -28, -17
	banim_frame_oam 0x0, 0x1000, 0xD6, 4, 7
	banim_frame_oam 0x4000, 0x1000, 0xFD, -28, -25
	banim_frame_end
banim_necm_ro1_oam_frame_51_l:
	banim_frame_oam 0x4000, 0x9000, 0xB7, -28, -25
	banim_frame_oam 0x4000, 0x5000, 0xF7, -28, -9
	banim_frame_oam 0x4000, 0x9000, 0xBB, -28, -1
	banim_frame_oam 0x0, 0x1000, 0xFB, 4, 7
	banim_frame_end
banim_necm_ro1_oam_frame_52_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -12, -25
	banim_frame_oam 0x8000, 0x5000, 0x2, -20, -25
	banim_frame_oam 0x4000, 0x1000, 0x80, -12, 7
	banim_frame_oam 0x0, 0x1000, 0x82, -20, 7
	banim_frame_oam 0x8000, 0x1000, 0x43, -28, -9
	banim_frame_oam 0x0, 0x1000, 0x83, -28, 7
	banim_frame_oam 0x0, 0x1000, 0x3, 4, 7
	banim_frame_oam 0x0, 0x1000, 0xE5, -28, -25
	banim_frame_oam 0x0, 0x1000, 0xE6, -28, -17
	banim_frame_end
banim_necm_ro1_oam_frame_53_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x4, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x40, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x44, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x60, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_54_l:
	banim_frame_oam 0x4000, 0x9000, 0x6, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xA, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x46, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x4A, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xA2, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xA5, 8, -24
	banim_frame_end
banim_necm_ro1_oam_frame_55_l:
	banim_frame_oam 0x0, 0x9000, 0x66, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xAA, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0x84, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xE6, 8, -24
	banim_frame_end
banim_necm_ro1_oam_frame_56_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x8D, -8, 8
	banim_frame_oam 0x8000, 0x5000, 0x2F, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x4C, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x8C, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xC, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xAC, 8, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_necm_ro1_oam_r:
banim_necm_ro1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x1, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x81, -8, 8
	banim_frame_oam 0x8000, 0x0, 0x44, 16, -8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x8000, 0x4000, 0x20, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x23, 8, -16
	banim_frame_oam 0x0, 0x0, 0x3, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x4000, 0x25, -16, 8
	banim_frame_oam 0x0, 0x0, 0x29, 16, 8
	banim_frame_oam 0x4000, 0x4000, 0x4, -24, 0
	banim_frame_oam 0x4000, 0x0, 0x8, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0xC0, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xC4, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x0, 0xA0, -32, -8
	banim_frame_oam 0x0, 0x0, 0xA4, -32, -16
	banim_frame_end
banim_necm_ro1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x46, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xC6, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xAA, 16, 0
	banim_frame_oam 0x8000, 0x0, 0x65, -24, -16
	banim_frame_oam 0x0, 0x0, 0xA5, -24, 0
	banim_frame_oam 0x8000, 0x0, 0xC5, -32, -16
	banim_frame_end
banim_necm_ro1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0xA, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x4A, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x2E, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0x6A, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x6E, 16, 0
	banim_frame_end
banim_necm_ro1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x2F, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x10, -8, -24
	banim_frame_oam 0x8000, 0x0, 0x13, -24, -8
	banim_frame_oam 0x8000, 0x0, 0xAF, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x73, 16, 0
	banim_frame_end
banim_necm_ro1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0xAB, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xEB, -16, -8
	banim_frame_oam 0x0, 0x0, 0xEF, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xB0, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xB4, 16, 0
	banim_frame_oam 0x0, 0x0, 0xF0, 24, 0
	banim_frame_oam 0x0, 0x0, 0xF2, 16, -24
	banim_frame_oam 0x0, 0x0, 0xF3, 16, -16
	banim_frame_end
banim_necm_ro1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x16, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x94, -8, 8
	banim_frame_oam 0x0, 0x0, 0x96, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x37, 16, -16
	banim_frame_oam 0x8000, 0x0, 0xB5, -16, 0
	banim_frame_oam 0x0, 0x0, 0xF4, 16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x1A, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x98, -8, 8
	banim_frame_oam 0x0, 0x0, 0x9A, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x3B, 16, -16
	banim_frame_oam 0x8000, 0x0, 0xB6, -16, 0
	banim_frame_oam 0x0, 0x0, 0xF4, 16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x9C, -8, 8
	banim_frame_oam 0x8000, 0x8000, 0x3E, 8, -16
	banim_frame_oam 0x0, 0x0, 0xD6, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xFD, 8, -24
	banim_frame_end
banim_necm_ro1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0xB7, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xF7, -8, -8
	banim_frame_oam 0x4000, 0x8000, 0xBB, -8, 0
	banim_frame_oam 0x0, 0x0, 0xFB, -16, 8
	banim_frame_end
banim_necm_ro1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x43, 16, -8
	banim_frame_oam 0x0, 0x0, 0x83, 16, 8
	banim_frame_oam 0x0, 0x0, 0x3, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE5, 16, -24
	banim_frame_oam 0x0, 0x0, 0xE6, 16, -16
	banim_frame_end
banim_necm_ro1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0xA1, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xA3, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, -8
	banim_frame_oam 0x0, 0x0, 0xE3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xE0, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE4, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0x4, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x8, 16, 0
	banim_frame_oam 0x0, 0x0, 0xC0, 16, -16
	banim_frame_end
banim_necm_ro1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x44, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xC4, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xA8, 16, 0
	banim_frame_oam 0x0, 0x4000, 0x9, -16, -40
	banim_frame_oam 0x8000, 0x0, 0xB, 0, -40
	banim_frame_end
banim_necm_ro1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x49, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x4B, 0, -40
	banim_frame_oam 0x4000, 0x0, 0xC9, -16, -8
	banim_frame_oam 0x0, 0x0, 0xCB, 0, -8
	banim_frame_oam 0x8000, 0x8000, 0x4C, 8, -16
	banim_frame_oam 0x0, 0x4000, 0xC, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xE, 0, 0
	banim_frame_end
banim_necm_ro1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x11, 0, -40
	banim_frame_oam 0x0, 0x4000, 0x8F, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x91, 0, -8
	banim_frame_oam 0x4000, 0x0, 0xCF, -16, 8
	banim_frame_oam 0x0, 0x0, 0xD1, 0, 8
	banim_frame_oam 0x8000, 0x4000, 0x4E, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xCE, 16, -8
	banim_frame_oam 0x0, 0x0, 0xEF, 16, 8
	banim_frame_end
banim_necm_ro1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x14, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x92, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x94, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xD2, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD4, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x15, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x55, 16, -8
	banim_frame_oam 0x0, 0x0, 0x95, 16, 8
	banim_frame_oam 0x0, 0x0, 0xB5, 24, 0
	banim_frame_oam 0x0, 0x0, 0xF1, -16, -40
	banim_frame_oam 0x0, 0x0, 0xF2, -16, -32
	banim_frame_end
banim_necm_ro1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x18, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x96, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x98, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xD6, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD8, 8, 8
	banim_frame_oam 0x8000, 0x8000, 0x59, 16, -24
	banim_frame_oam 0x4000, 0x0, 0xD9, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x19, -16, 0
	banim_frame_oam 0x0, 0x0, 0xF7, -16, -40
	banim_frame_oam 0x0, 0x0, 0xF8, -16, -32
	banim_frame_end
banim_necm_ro1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x1B, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x1D, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x9B, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x9D, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xDB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xDD, 8, 8
	banim_frame_oam 0x8000, 0x8000, 0x5E, 16, -24
	banim_frame_oam 0x4000, 0x0, 0xDE, 16, 8
	banim_frame_oam 0x0, 0x0, 0x3E, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x1A, -16, -40
	banim_frame_end
banim_necm_ro1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0x80, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x64, 24, -16
	banim_frame_oam 0x0, 0x0, 0xA4, 24, 0
	banim_frame_oam 0x0, 0x0, 0x24, 8, -40
	banim_frame_oam 0x0, 0x0, 0x44, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x23, 16, -24
	banim_frame_oam 0x0, 0x0, 0x63, 16, -8
	banim_frame_oam 0x0, 0x0, 0x3, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xC4, -16, -40
	banim_frame_end
banim_necm_ro1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xC2, 8, -32
	banim_frame_oam 0x0, 0x0, 0xE3, 16, -24
	banim_frame_oam 0x0, 0x8000, 0x5, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x29, 24, -8
	banim_frame_oam 0x0, 0x0, 0x88, -16, 8
	banim_frame_oam 0x0, 0x0, 0x87, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x69, -16, -40
	banim_frame_end
banim_necm_ro1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x8000, 0x85, -8, -32
	banim_frame_oam 0x0, 0x4000, 0xC8, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0xA, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xE, 24, 0
	banim_frame_oam 0x0, 0x0, 0x9, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xA7, 8, -24
	banim_frame_oam 0x0, 0x0, 0xE7, 8, -8
	banim_frame_oam 0x0, 0x0, 0x87, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x69, -16, -40
	banim_frame_end
banim_necm_ro1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x8000, 0x4A, -8, -32
	banim_frame_oam 0x0, 0x4000, 0xCA, -8, 0
	banim_frame_oam 0x8000, 0x8000, 0x4C, 8, -16
	banim_frame_oam 0x0, 0x0, 0xCC, -16, 8
	banim_frame_oam 0x0, 0x0, 0x87, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x69, -16, -40
	banim_frame_end
banim_necm_ro1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x11, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x8F, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x91, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xCE, 16, -8
	banim_frame_oam 0x0, 0x0, 0xCF, 16, 8
	banim_frame_oam 0x0, 0x0, 0xEF, -16, 8
	banim_frame_oam 0x0, 0x0, 0x87, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x69, -16, -40
	banim_frame_end
banim_necm_ro1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x0, 0x94, 24, -8
	banim_frame_oam 0x4000, 0x8000, 0xD0, -8, 0
	banim_frame_oam 0x0, 0x0, 0xD4, -16, 8
	banim_frame_oam 0x0, 0x4000, 0x54, 8, -16
	banim_frame_oam 0x0, 0x4000, 0xBD, -32, -32
	banim_frame_oam 0x8000, 0x0, 0xBF, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xFD, -32, -16
	banim_frame_oam 0x0, 0x0, 0xFF, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x32, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x72, -8, -8
	banim_frame_oam 0x0, 0x0, 0x12, -8, -32
	banim_frame_oam 0x4000, 0x0, 0x13, -24, -40
	banim_frame_oam 0x0, 0x0, 0x15, -8, -40
	banim_frame_end
banim_necm_ro1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x96, -8, 8
	banim_frame_oam 0x0, 0x0, 0x98, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xB6, -24, -16
	banim_frame_oam 0x0, 0x0, 0xF6, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xB8, 24, -8
	banim_frame_oam 0x8000, 0x4000, 0x19, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x7F, -32, -24
	banim_frame_end
banim_necm_ro1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x1A, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x9A, -8, 8
	banim_frame_oam 0x0, 0x4000, 0xB9, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xBB, 24, -16
	banim_frame_oam 0x0, 0x0, 0xF9, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x7F, -32, -24
	banim_frame_end
banim_necm_ro1_oam_frame_26_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0x84, 0, 8
	banim_frame_end
banim_necm_ro1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0xC000, 0x8, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0x88, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0x8C, 0, 8
	banim_frame_end
banim_necm_ro1_oam_frame_28_r:
	banim_frame_oam 0x4000, 0xC000, 0x10, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0x90, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0x94, 0, 8
	banim_frame_end
banim_necm_ro1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x1C, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0x1E, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x98, -32, 8
	banim_frame_oam 0x4000, 0x0, 0x9C, 0, 8
	banim_frame_oam 0x0, 0x0, 0x9E, 16, 8
	banim_frame_oam 0x8000, 0x4000, 0x3F, 24, -16
	banim_frame_end
banim_necm_ro1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0x81, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x25, 24, -16
	banim_frame_oam 0x8000, 0x4000, 0x20, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xE2, -32, -16
	banim_frame_oam 0x0, 0x0, 0xE1, -32, -24
	banim_frame_end
banim_necm_ro1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x8000, 0xA2, -8, -24
	banim_frame_oam 0x0, 0x4000, 0xA0, -24, -24
	banim_frame_oam 0x4000, 0x8000, 0x6, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xA, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0x46, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x4A, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, -32, -16
	banim_frame_oam 0x0, 0x0, 0xE1, -32, -24
	banim_frame_end
banim_necm_ro1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x68, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x6A, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xE8, -8, 8
	banim_frame_oam 0x0, 0x0, 0xEA, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x87, -16, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xC6, 16, -8
	banim_frame_oam 0x0, 0x0, 0x4A, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE2, -32, -16
	banim_frame_oam 0x0, 0x0, 0xE1, -32, -24
	banim_frame_end
banim_necm_ro1_oam_frame_33_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0xF, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x8D, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8F, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x2C, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xAC, 16, -8
	banim_frame_oam 0x0, 0x0, 0xEC, 16, 8
	banim_frame_oam 0x0, 0x0, 0x8C, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE2, -32, -16
	banim_frame_oam 0x0, 0x0, 0xE1, -32, -24
	banim_frame_end
banim_necm_ro1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x91, -8, 8
	banim_frame_oam 0x0, 0x0, 0x93, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x30, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xB0, 16, -8
	banim_frame_oam 0x0, 0x0, 0xF0, 16, 8
	banim_frame_oam 0x8000, 0x0, 0xD1, 24, 0
	banim_frame_oam 0x4000, 0x0, 0xE2, -32, -16
	banim_frame_oam 0x0, 0x0, 0xE1, -32, -24
	banim_frame_end
banim_necm_ro1_oam_frame_35_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x17, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x95, -8, 8
	banim_frame_oam 0x0, 0x0, 0x97, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x34, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xB2, 16, -8
	banim_frame_oam 0x0, 0x0, 0xF2, 16, 8
	banim_frame_oam 0x4000, 0x0, 0xE2, -32, -16
	banim_frame_oam 0x0, 0x0, 0xE1, -32, -24
	banim_frame_end
banim_necm_ro1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0xB5, -8, -24
	banim_frame_oam 0x4000, 0x0, 0xF5, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xD7, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xD4, -16, -16
	banim_frame_oam 0x4000, 0x8000, 0x18, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x1C, 16, 0
	banim_frame_oam 0x4000, 0x0, 0xF8, -32, -16
	banim_frame_end
banim_necm_ro1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x4000, 0xD8, -16, 8
	banim_frame_oam 0x8000, 0x4000, 0x7C, 16, -16
	banim_frame_oam 0x8000, 0x8000, 0x59, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x5B, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x78, -16, -16
	banim_frame_oam 0x0, 0x0, 0xB8, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x1D, -24, -24
	banim_frame_oam 0x0, 0x0, 0x1E, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x4, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0x60, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0x8000, 0x6, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xA, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x46, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x4A, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xA2, 8, -24
	banim_frame_oam 0x8000, 0x0, 0xA5, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xAA, 16, 0
	banim_frame_oam 0x4000, 0x0, 0x84, -8, -24
	banim_frame_oam 0x0, 0x0, 0xE6, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x8D, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x2F, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x4C, -16, -8
	banim_frame_oam 0x0, 0x0, 0x8C, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xC, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xAC, -16, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x55, 16, -8
	banim_frame_oam 0x0, 0x0, 0x95, 16, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0xB1, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xF1, -16, -8
	banim_frame_oam 0x0, 0x0, 0xF5, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0x16, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x1A, 16, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x56, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x5A, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x96, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9A, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xB6, -8, -24
	banim_frame_oam 0x0, 0x0, 0xD8, 8, -16
	banim_frame_oam 0x0, 0x0, 0xD5, -16, -16
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x1B, -16, 0
	banim_frame_oam 0x4000, 0x0, 0x7C, 16, 8
	banim_frame_oam 0x4000, 0x8000, 0xB9, -24, -16
	banim_frame_oam 0x0, 0x4000, 0xBD, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xBF, 24, -16
	banim_frame_oam 0x4000, 0x0, 0x5C, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x7E, -24, -24
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x0, 0x4000, 0x4, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x6, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, -8
	banim_frame_oam 0x0, 0x0, 0x46, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0x60, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x64, 8, 8
	banim_frame_oam 0x0, 0x0, 0x66, 24, 8
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 0
	banim_frame_oam 0x0, 0x0, 0x82, 8, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0xA0, -24, -24
	banim_frame_oam 0x0, 0x4000, 0xA4, 8, -24
	banim_frame_oam 0x0, 0x0, 0xC6, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x0, 0xE4, 16, -8
	banim_frame_oam 0x0, 0x0, 0xC6, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x7, -24, 0
	banim_frame_oam 0x0, 0x4000, 0xB, 8, 0
	banim_frame_oam 0x8000, 0x0, 0xD, 24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x47, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x4B, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xC7, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xCB, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x6D, 24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xE, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8E, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x92, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x34, 24, -16
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0xAE, -24, -24
	banim_frame_oam 0x0, 0x4000, 0xB2, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xEE, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xF2, 8, -8
	banim_frame_oam 0x8000, 0x0, 0xD4, 24, -16
	banim_frame_oam 0x4000, 0x8000, 0x15, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x19, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x1B, 24, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x55, -24, -24
	banim_frame_oam 0x0, 0x4000, 0x59, 8, -24
	banim_frame_oam 0x8000, 0x0, 0x5B, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x99, 8, -8
	banim_frame_oam 0x0, 0x0, 0x9B, 24, -8
	banim_frame_oam 0x4000, 0x8000, 0xB6, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xBA, 16, 0
	banim_frame_oam 0x0, 0x0, 0xD5, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x9C, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1C, 8, -24
	banim_frame_oam 0x8000, 0x4000, 0x1E, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xF5, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xF9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xFB, 24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x26, 24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8B, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x2D, 24, -16
	banim_frame_end
banim_necm_ro1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_necm_ro1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_necm_ro1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_necm_ro1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x4E, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x52, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x8E, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x92, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xE, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0x2F, -12, -17
	banim_frame_oam 0x4000, 0x0, 0x10, -4, -25
	banim_frame_oam 0x8000, 0x0, 0x13, -20, -9
	banim_frame_oam 0x8000, 0x0, 0xAF, 20, -17
	banim_frame_oam 0x8000, 0x0, 0x73, 20, -1
	banim_frame_end
banim_necm_ro1_oam_frame_47_r:
	banim_frame_oam 0x4000, 0x8000, 0xAB, -12, -25
	banim_frame_oam 0x4000, 0x4000, 0xEB, -12, -9
	banim_frame_oam 0x0, 0x0, 0xEF, 20, -9
	banim_frame_oam 0x4000, 0x8000, 0xB0, -12, -1
	banim_frame_oam 0x8000, 0x0, 0xB4, 20, -1
	banim_frame_oam 0x0, 0x0, 0xF0, 28, -1
	banim_frame_oam 0x0, 0x0, 0xF2, 20, -25
	banim_frame_oam 0x0, 0x0, 0xF3, 20, -17
	banim_frame_end
banim_necm_ro1_oam_frame_48_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, -4, -25
	banim_frame_oam 0x8000, 0x4000, 0x16, 12, -25
	banim_frame_oam 0x4000, 0x0, 0x94, -4, 7
	banim_frame_oam 0x0, 0x0, 0x96, 12, 7
	banim_frame_oam 0x8000, 0x4000, 0x37, 20, -17
	banim_frame_oam 0x8000, 0x0, 0xB5, -12, -1
	banim_frame_oam 0x0, 0x0, 0xF4, 20, -25
	banim_frame_end
banim_necm_ro1_oam_frame_49_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -4, -25
	banim_frame_oam 0x8000, 0x4000, 0x1A, 12, -25
	banim_frame_oam 0x4000, 0x0, 0x98, -4, 7
	banim_frame_oam 0x0, 0x0, 0x9A, 12, 7
	banim_frame_oam 0x8000, 0x4000, 0x3B, 20, -17
	banim_frame_oam 0x8000, 0x0, 0xB6, -12, -1
	banim_frame_oam 0x0, 0x0, 0xF4, 20, -25
	banim_frame_end
banim_necm_ro1_oam_frame_50_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, -4, -25
	banim_frame_oam 0x4000, 0x0, 0x9C, -4, 7
	banim_frame_oam 0x8000, 0x8000, 0x3E, 12, -17
	banim_frame_oam 0x0, 0x0, 0xD6, -12, 7
	banim_frame_oam 0x4000, 0x0, 0xFD, 12, -25
	banim_frame_end
banim_necm_ro1_oam_frame_51_r:
	banim_frame_oam 0x4000, 0x8000, 0xB7, -4, -25
	banim_frame_oam 0x4000, 0x4000, 0xF7, -4, -9
	banim_frame_oam 0x4000, 0x8000, 0xBB, -4, -1
	banim_frame_oam 0x0, 0x0, 0xFB, -12, 7
	banim_frame_end
banim_necm_ro1_oam_frame_52_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -4, -25
	banim_frame_oam 0x8000, 0x4000, 0x2, 12, -25
	banim_frame_oam 0x4000, 0x0, 0x80, -4, 7
	banim_frame_oam 0x0, 0x0, 0x82, 12, 7
	banim_frame_oam 0x8000, 0x0, 0x43, 20, -9
	banim_frame_oam 0x0, 0x0, 0x83, 20, 7
	banim_frame_oam 0x0, 0x0, 0x3, -12, 7
	banim_frame_oam 0x0, 0x0, 0xE5, 20, -25
	banim_frame_oam 0x0, 0x0, 0xE6, 20, -17
	banim_frame_end
banim_necm_ro1_oam_frame_53_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x4, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x40, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x44, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0x60, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_54_r:
	banim_frame_oam 0x4000, 0x8000, 0x6, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xA, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x46, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x4A, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xA2, 8, -24
	banim_frame_oam 0x8000, 0x0, 0xA5, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_55_r:
	banim_frame_oam 0x0, 0x8000, 0x66, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xAA, 16, 0
	banim_frame_oam 0x4000, 0x0, 0x84, -8, -24
	banim_frame_oam 0x0, 0x0, 0xE6, -16, -24
	banim_frame_end
banim_necm_ro1_oam_frame_56_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x8D, -8, 8
	banim_frame_oam 0x8000, 0x4000, 0x2F, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x4C, -16, -8
	banim_frame_oam 0x0, 0x0, 0x8C, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xC, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xAC, -16, -24
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_necm_ro1_script:
banim_necm_ro1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_frame 8, banim_necm_ro1_sheet_0, 1, banim_necm_ro1_oam_frame_1_r - banim_necm_ro1_oam_r
	banim_code_frame 10, banim_necm_ro1_sheet_0, 2, banim_necm_ro1_oam_frame_2_r - banim_necm_ro1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_necm_ro1_sheet_0, 3, banim_necm_ro1_oam_frame_3_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 4, banim_necm_ro1_oam_frame_4_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 5, banim_necm_ro1_oam_frame_5_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 6, banim_necm_ro1_oam_frame_6_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 7, banim_necm_ro1_oam_frame_7_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 8, banim_necm_ro1_oam_frame_8_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 9, banim_necm_ro1_oam_frame_9_r - banim_necm_ro1_oam_r
	banim_code_frame 30, banim_necm_ro1_sheet_1, 10, banim_necm_ro1_oam_frame_10_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 11, banim_necm_ro1_oam_frame_11_r - banim_necm_ro1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_necm_ro1_sheet_1, 12, banim_necm_ro1_oam_frame_12_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_1, 13, banim_necm_ro1_oam_frame_13_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 14, banim_necm_ro1_oam_frame_14_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 15, banim_necm_ro1_oam_frame_15_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_1, 16, banim_necm_ro1_oam_frame_16_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 17, banim_necm_ro1_oam_frame_17_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 18, banim_necm_ro1_oam_frame_18_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 19, banim_necm_ro1_oam_frame_19_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 20, banim_necm_ro1_oam_frame_20_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_2, 21, banim_necm_ro1_oam_frame_21_r - banim_necm_ro1_oam_r
	banim_code_frame 40, banim_necm_ro1_sheet_2, 22, banim_necm_ro1_oam_frame_22_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_2, 23, banim_necm_ro1_oam_frame_23_r - banim_necm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_necm_ro1_sheet_2, 24, banim_necm_ro1_oam_frame_24_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_2, 25, banim_necm_ro1_oam_frame_25_r - banim_necm_ro1_oam_r
	banim_code_cape_flowing
	banim_code_frame 2, banim_necm_ro1_sheet_3, 26, banim_necm_ro1_oam_frame_26_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 27, banim_necm_ro1_oam_frame_27_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 28, banim_necm_ro1_oam_frame_28_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 29, banim_necm_ro1_oam_frame_29_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_necm_ro1_sheet_4, 30, banim_necm_ro1_oam_frame_30_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 31, banim_necm_ro1_oam_frame_31_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 32, banim_necm_ro1_oam_frame_32_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 33, banim_necm_ro1_oam_frame_33_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 34, banim_necm_ro1_oam_frame_34_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 35, banim_necm_ro1_oam_frame_35_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 36, banim_necm_ro1_oam_frame_36_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 37, banim_necm_ro1_oam_frame_37_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 38, banim_necm_ro1_oam_frame_38_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 39, banim_necm_ro1_oam_frame_39_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 40, banim_necm_ro1_oam_frame_40_r - banim_necm_ro1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_necm_ro1_sheet_5, 41, banim_necm_ro1_oam_frame_41_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_necm_ro1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 8, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 10, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 30, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 40, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_cape_flowing
	banim_code_frame 2, banim_necm_ro1_sheet_3, 58, banim_necm_ro1_oam_frame_45_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 58, banim_necm_ro1_oam_frame_45_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 58, banim_necm_ro1_oam_frame_45_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 58, banim_necm_ro1_oam_frame_45_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_necm_ro1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_frame 8, banim_necm_ro1_sheet_0, 1, banim_necm_ro1_oam_frame_1_r - banim_necm_ro1_oam_r
	banim_code_frame 10, banim_necm_ro1_sheet_0, 2, banim_necm_ro1_oam_frame_2_r - banim_necm_ro1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_necm_ro1_sheet_0, 3, banim_necm_ro1_oam_frame_3_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 4, banim_necm_ro1_oam_frame_4_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 5, banim_necm_ro1_oam_frame_5_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 6, banim_necm_ro1_oam_frame_6_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 7, banim_necm_ro1_oam_frame_7_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 8, banim_necm_ro1_oam_frame_8_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 9, banim_necm_ro1_oam_frame_9_r - banim_necm_ro1_oam_r
	banim_code_frame 30, banim_necm_ro1_sheet_1, 10, banim_necm_ro1_oam_frame_10_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 11, banim_necm_ro1_oam_frame_11_r - banim_necm_ro1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_necm_ro1_sheet_1, 12, banim_necm_ro1_oam_frame_12_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_1, 13, banim_necm_ro1_oam_frame_13_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 14, banim_necm_ro1_oam_frame_14_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 15, banim_necm_ro1_oam_frame_15_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_1, 16, banim_necm_ro1_oam_frame_16_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 17, banim_necm_ro1_oam_frame_17_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 18, banim_necm_ro1_oam_frame_18_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 19, banim_necm_ro1_oam_frame_19_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 20, banim_necm_ro1_oam_frame_20_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_2, 21, banim_necm_ro1_oam_frame_21_r - banim_necm_ro1_oam_r
	banim_code_frame 40, banim_necm_ro1_sheet_2, 22, banim_necm_ro1_oam_frame_22_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_2, 23, banim_necm_ro1_oam_frame_23_r - banim_necm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_necm_ro1_sheet_2, 24, banim_necm_ro1_oam_frame_24_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_2, 25, banim_necm_ro1_oam_frame_25_r - banim_necm_ro1_oam_r
	banim_code_cape_flowing
	banim_code_frame 2, banim_necm_ro1_sheet_3, 26, banim_necm_ro1_oam_frame_26_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 27, banim_necm_ro1_oam_frame_27_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 28, banim_necm_ro1_oam_frame_28_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 29, banim_necm_ro1_oam_frame_29_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_necm_ro1_sheet_4, 30, banim_necm_ro1_oam_frame_30_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 31, banim_necm_ro1_oam_frame_31_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 32, banim_necm_ro1_oam_frame_32_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 33, banim_necm_ro1_oam_frame_33_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 34, banim_necm_ro1_oam_frame_34_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 35, banim_necm_ro1_oam_frame_35_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 36, banim_necm_ro1_oam_frame_36_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 37, banim_necm_ro1_oam_frame_37_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 38, banim_necm_ro1_oam_frame_38_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 39, banim_necm_ro1_oam_frame_39_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 40, banim_necm_ro1_oam_frame_40_r - banim_necm_ro1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_necm_ro1_sheet_5, 41, banim_necm_ro1_oam_frame_41_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_necm_ro1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 8, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 10, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 30, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 40, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_2, 57, banim_necm_ro1_oam_frame_44_r - banim_necm_ro1_oam_r
	banim_code_cape_flowing
	banim_code_frame 2, banim_necm_ro1_sheet_3, 58, banim_necm_ro1_oam_frame_45_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 58, banim_necm_ro1_oam_frame_45_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 58, banim_necm_ro1_oam_frame_45_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 58, banim_necm_ro1_oam_frame_45_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_necm_ro1_sheet_5, 56, banim_necm_ro1_oam_frame_43_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 55, banim_necm_ro1_oam_frame_42_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_necm_ro1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_frame 8, banim_necm_ro1_sheet_0, 1, banim_necm_ro1_oam_frame_1_r - banim_necm_ro1_oam_r
	banim_code_frame 10, banim_necm_ro1_sheet_0, 2, banim_necm_ro1_oam_frame_2_r - banim_necm_ro1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_necm_ro1_sheet_0, 3, banim_necm_ro1_oam_frame_3_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 4, banim_necm_ro1_oam_frame_4_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 5, banim_necm_ro1_oam_frame_5_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 6, banim_necm_ro1_oam_frame_6_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 7, banim_necm_ro1_oam_frame_7_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 8, banim_necm_ro1_oam_frame_8_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 9, banim_necm_ro1_oam_frame_9_r - banim_necm_ro1_oam_r
	banim_code_frame 30, banim_necm_ro1_sheet_1, 10, banim_necm_ro1_oam_frame_10_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 11, banim_necm_ro1_oam_frame_11_r - banim_necm_ro1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_necm_ro1_sheet_1, 12, banim_necm_ro1_oam_frame_12_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_1, 13, banim_necm_ro1_oam_frame_13_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 14, banim_necm_ro1_oam_frame_14_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 15, banim_necm_ro1_oam_frame_15_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_1, 16, banim_necm_ro1_oam_frame_16_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 17, banim_necm_ro1_oam_frame_17_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 18, banim_necm_ro1_oam_frame_18_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 19, banim_necm_ro1_oam_frame_19_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 20, banim_necm_ro1_oam_frame_20_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_2, 21, banim_necm_ro1_oam_frame_21_r - banim_necm_ro1_oam_r
	banim_code_frame 40, banim_necm_ro1_sheet_2, 22, banim_necm_ro1_oam_frame_22_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_2, 23, banim_necm_ro1_oam_frame_23_r - banim_necm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_necm_ro1_sheet_2, 24, banim_necm_ro1_oam_frame_24_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_2, 25, banim_necm_ro1_oam_frame_25_r - banim_necm_ro1_oam_r
	banim_code_cape_flowing
	banim_code_frame 2, banim_necm_ro1_sheet_3, 26, banim_necm_ro1_oam_frame_26_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 27, banim_necm_ro1_oam_frame_27_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 28, banim_necm_ro1_oam_frame_28_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 29, banim_necm_ro1_oam_frame_29_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_necm_ro1_sheet_4, 30, banim_necm_ro1_oam_frame_30_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 31, banim_necm_ro1_oam_frame_31_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 32, banim_necm_ro1_oam_frame_32_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 33, banim_necm_ro1_oam_frame_33_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 34, banim_necm_ro1_oam_frame_34_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 35, banim_necm_ro1_oam_frame_35_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 36, banim_necm_ro1_oam_frame_36_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 37, banim_necm_ro1_oam_frame_37_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 38, banim_necm_ro1_oam_frame_38_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 39, banim_necm_ro1_oam_frame_39_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 40, banim_necm_ro1_oam_frame_40_r - banim_necm_ro1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_necm_ro1_sheet_5, 41, banim_necm_ro1_oam_frame_41_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_necm_ro1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_frame 8, banim_necm_ro1_sheet_0, 1, banim_necm_ro1_oam_frame_1_r - banim_necm_ro1_oam_r
	banim_code_frame 10, banim_necm_ro1_sheet_0, 2, banim_necm_ro1_oam_frame_2_r - banim_necm_ro1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_necm_ro1_sheet_0, 3, banim_necm_ro1_oam_frame_3_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 4, banim_necm_ro1_oam_frame_4_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 5, banim_necm_ro1_oam_frame_5_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 6, banim_necm_ro1_oam_frame_6_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 7, banim_necm_ro1_oam_frame_7_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 8, banim_necm_ro1_oam_frame_8_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 9, banim_necm_ro1_oam_frame_9_r - banim_necm_ro1_oam_r
	banim_code_frame 30, banim_necm_ro1_sheet_1, 10, banim_necm_ro1_oam_frame_10_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 11, banim_necm_ro1_oam_frame_11_r - banim_necm_ro1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_necm_ro1_sheet_1, 12, banim_necm_ro1_oam_frame_12_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_1, 13, banim_necm_ro1_oam_frame_13_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 14, banim_necm_ro1_oam_frame_14_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 15, banim_necm_ro1_oam_frame_15_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_1, 16, banim_necm_ro1_oam_frame_16_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 17, banim_necm_ro1_oam_frame_17_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 18, banim_necm_ro1_oam_frame_18_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 19, banim_necm_ro1_oam_frame_19_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 20, banim_necm_ro1_oam_frame_20_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_2, 21, banim_necm_ro1_oam_frame_21_r - banim_necm_ro1_oam_r
	banim_code_frame 40, banim_necm_ro1_sheet_2, 22, banim_necm_ro1_oam_frame_22_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_2, 23, banim_necm_ro1_oam_frame_23_r - banim_necm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_necm_ro1_sheet_2, 24, banim_necm_ro1_oam_frame_24_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_2, 25, banim_necm_ro1_oam_frame_25_r - banim_necm_ro1_oam_r
	banim_code_cape_flowing
	banim_code_frame 2, banim_necm_ro1_sheet_3, 26, banim_necm_ro1_oam_frame_26_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 27, banim_necm_ro1_oam_frame_27_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 28, banim_necm_ro1_oam_frame_28_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 29, banim_necm_ro1_oam_frame_29_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_necm_ro1_sheet_4, 30, banim_necm_ro1_oam_frame_30_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 31, banim_necm_ro1_oam_frame_31_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 32, banim_necm_ro1_oam_frame_32_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 33, banim_necm_ro1_oam_frame_33_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 34, banim_necm_ro1_oam_frame_34_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 35, banim_necm_ro1_oam_frame_35_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 36, banim_necm_ro1_oam_frame_36_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 37, banim_necm_ro1_oam_frame_37_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 38, banim_necm_ro1_oam_frame_38_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 39, banim_necm_ro1_oam_frame_39_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 40, banim_necm_ro1_oam_frame_40_r - banim_necm_ro1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_necm_ro1_sheet_5, 41, banim_necm_ro1_oam_frame_41_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_necm_ro1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_necm_ro1_sheet_0, 60, banim_necm_ro1_oam_frame_46_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_0, 61, banim_necm_ro1_oam_frame_47_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 62, banim_necm_ro1_oam_frame_48_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 63, banim_necm_ro1_oam_frame_49_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 64, banim_necm_ro1_oam_frame_50_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 65, banim_necm_ro1_oam_frame_51_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_1, 66, banim_necm_ro1_oam_frame_52_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_necm_ro1_sheet_5, 67, banim_necm_ro1_oam_frame_53_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 68, banim_necm_ro1_oam_frame_54_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 69, banim_necm_ro1_oam_frame_55_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 70, banim_necm_ro1_oam_frame_56_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_necm_ro1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_necm_ro1_sheet_0, 60, banim_necm_ro1_oam_frame_46_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_0, 61, banim_necm_ro1_oam_frame_47_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 62, banim_necm_ro1_oam_frame_48_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 63, banim_necm_ro1_oam_frame_49_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 64, banim_necm_ro1_oam_frame_50_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 65, banim_necm_ro1_oam_frame_51_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_1, 66, banim_necm_ro1_oam_frame_52_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_necm_ro1_sheet_5, 67, banim_necm_ro1_oam_frame_53_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 68, banim_necm_ro1_oam_frame_54_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 69, banim_necm_ro1_oam_frame_55_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 70, banim_necm_ro1_oam_frame_56_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_necm_ro1_mode_stand_close:
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_necm_ro1_mode_stand:
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_necm_ro1_mode_stand_range:
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_necm_ro1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_frame 8, banim_necm_ro1_sheet_0, 1, banim_necm_ro1_oam_frame_1_r - banim_necm_ro1_oam_r
	banim_code_frame 10, banim_necm_ro1_sheet_0, 2, banim_necm_ro1_oam_frame_2_r - banim_necm_ro1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 4, banim_necm_ro1_sheet_0, 3, banim_necm_ro1_oam_frame_3_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 4, banim_necm_ro1_oam_frame_4_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_0, 5, banim_necm_ro1_oam_frame_5_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 6, banim_necm_ro1_oam_frame_6_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 7, banim_necm_ro1_oam_frame_7_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_0, 8, banim_necm_ro1_oam_frame_8_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_0, 9, banim_necm_ro1_oam_frame_9_r - banim_necm_ro1_oam_r
	banim_code_frame 30, banim_necm_ro1_sheet_1, 10, banim_necm_ro1_oam_frame_10_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 11, banim_necm_ro1_oam_frame_11_r - banim_necm_ro1_oam_r
	banim_code_effect_magic_rune_normal
	banim_code_sound_magic_sage
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_necm_ro1_sheet_1, 12, banim_necm_ro1_oam_frame_12_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_1, 13, banim_necm_ro1_oam_frame_13_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_1, 14, banim_necm_ro1_oam_frame_14_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 15, banim_necm_ro1_oam_frame_15_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_1, 16, banim_necm_ro1_oam_frame_16_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_1, 17, banim_necm_ro1_oam_frame_17_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 18, banim_necm_ro1_oam_frame_18_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 19, banim_necm_ro1_oam_frame_19_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_2, 20, banim_necm_ro1_oam_frame_20_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_2, 21, banim_necm_ro1_oam_frame_21_r - banim_necm_ro1_oam_r
	banim_code_frame 40, banim_necm_ro1_sheet_2, 22, banim_necm_ro1_oam_frame_22_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_2, 23, banim_necm_ro1_oam_frame_23_r - banim_necm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_necm_ro1_sheet_2, 24, banim_necm_ro1_oam_frame_24_r - banim_necm_ro1_oam_r
	banim_code_frame 3, banim_necm_ro1_sheet_2, 25, banim_necm_ro1_oam_frame_25_r - banim_necm_ro1_oam_r
	banim_code_cape_flowing
	banim_code_frame 2, banim_necm_ro1_sheet_3, 26, banim_necm_ro1_oam_frame_26_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 27, banim_necm_ro1_oam_frame_27_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 28, banim_necm_ro1_oam_frame_28_r - banim_necm_ro1_oam_r
	banim_code_frame 2, banim_necm_ro1_sheet_3, 29, banim_necm_ro1_oam_frame_29_r - banim_necm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_necm_ro1_sheet_4, 30, banim_necm_ro1_oam_frame_30_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 31, banim_necm_ro1_oam_frame_31_r - banim_necm_ro1_oam_r
	banim_code_frame 6, banim_necm_ro1_sheet_4, 32, banim_necm_ro1_oam_frame_32_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 33, banim_necm_ro1_oam_frame_33_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 34, banim_necm_ro1_oam_frame_34_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 35, banim_necm_ro1_oam_frame_35_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 36, banim_necm_ro1_oam_frame_36_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_4, 37, banim_necm_ro1_oam_frame_37_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 38, banim_necm_ro1_oam_frame_38_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 39, banim_necm_ro1_oam_frame_39_r - banim_necm_ro1_oam_r
	banim_code_frame 4, banim_necm_ro1_sheet_5, 40, banim_necm_ro1_oam_frame_40_r - banim_necm_ro1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_necm_ro1_sheet_5, 41, banim_necm_ro1_oam_frame_41_r - banim_necm_ro1_oam_r
	banim_code_frame 1, banim_necm_ro1_sheet_0, 0, banim_necm_ro1_oam_frame_0_r - banim_necm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_necm_ro1_mode_attack_close - banim_necm_ro1_script
	.word banim_necm_ro1_mode_attack_close_back - banim_necm_ro1_script
	.word banim_necm_ro1_mode_attack_close_critical - banim_necm_ro1_script
	.word banim_necm_ro1_mode_attack_close_critical_back - banim_necm_ro1_script
	.word banim_necm_ro1_mode_attack_range - banim_necm_ro1_script
	.word banim_necm_ro1_mode_attack_range_critical - banim_necm_ro1_script
	.word banim_necm_ro1_mode_dodge_close - banim_necm_ro1_script
	.word banim_necm_ro1_mode_dodge_range - banim_necm_ro1_script
	.word banim_necm_ro1_mode_stand_close - banim_necm_ro1_script
	.word banim_necm_ro1_mode_stand - banim_necm_ro1_script
	.word banim_necm_ro1_mode_stand_range - banim_necm_ro1_script
	.word banim_necm_ro1_mode_attack_miss - banim_necm_ro1_script
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

