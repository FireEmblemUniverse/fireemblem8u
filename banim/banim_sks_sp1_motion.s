@ vim:ft=armv4
	.global banim_sks_sp1_script
	.global banim_sks_sp1_oam_r
	.global banim_sks_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xA2
	.section .data.oam_l
banim_sks_sp1_oam_l:
banim_sks_sp1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x80, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0x82, -8, -24
	banim_frame_end
banim_sks_sp1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC2, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xC0, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0xA2, -8, -24
	banim_frame_end
banim_sks_sp1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x9, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xC4, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0xC3, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x84, 16, -16
	banim_frame_end
banim_sks_sp1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x1000, 0xC6, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x86, 16, -16
	banim_frame_oam 0x8000, 0x9000, 0xA, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0xC, -8, -16
	banim_frame_end
banim_sks_sp1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x1000, 0xE4, 0, -24
	banim_frame_oam 0x0, 0x5000, 0x88, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0xC7, -16, 0
	banim_frame_oam 0x8000, 0x9000, 0xD, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0xF, -8, -16
	banim_frame_end
banim_sks_sp1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0xE8, 8, -24
	banim_frame_oam 0x0, 0x1000, 0xE9, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xC8, 24, -8
	banim_frame_oam 0x0, 0x1000, 0xCA, 16, -8
	banim_frame_oam 0x8000, 0x9000, 0x10, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x12, -8, -16
	banim_frame_end
banim_sks_sp1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x1000, 0xEA, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0xAA, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x8A, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xCB, -8, 8
	banim_frame_oam 0x8000, 0x9000, 0x13, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x15, 0, -16
	banim_frame_end
banim_sks_sp1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x8B, 16, -24
	banim_frame_oam 0x4000, 0x1000, 0xEC, 32, -8
	banim_frame_oam 0x0, 0x1000, 0xCD, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCC, -8, -8
	banim_frame_oam 0x0, 0x9000, 0x16, 0, -16
	banim_frame_end
banim_sks_sp1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0xAC, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x8C, 32, -8
	banim_frame_oam 0x0, 0x1000, 0xAD, 32, 0
	banim_frame_oam 0x0, 0x9000, 0x1A, 0, -16
	banim_frame_end
banim_sks_sp1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x1000, 0xB2, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x92, -8, -8
	banim_frame_oam 0x8000, 0x9000, 0x8F, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x91, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0xAE, 32, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, 32, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, 40, -8
	banim_frame_end
banim_sks_sp1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x1000, 0xD2, 40, -8
	banim_frame_oam 0x0, 0x1000, 0x97, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xB7, 0, -8
	banim_frame_oam 0x0, 0x9000, 0x93, 8, -16
	banim_frame_end
banim_sks_sp1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x1000, 0xD7, 0, -16
	banim_frame_oam 0x0, 0x1000, 0x1E, -8, -16
	banim_frame_oam 0x0, 0x9000, 0x98, 8, -16
	banim_frame_end
banim_sks_sp1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x68, 8, 8
	banim_frame_end
banim_sks_sp1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x3, 24, -16
	banim_frame_oam 0x8000, 0x5000, 0x7, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x68, 8, 8
	banim_frame_end
banim_sks_sp1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x1000, 0x20, 64, -8
	banim_frame_oam 0x0, 0x1000, 0x22, 56, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x7, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x27, 16, -8
	banim_frame_oam 0x0, 0x1000, 0x67, 16, 8
	banim_frame_oam 0x8000, 0x9000, 0x4, 32, -16
	banim_frame_oam 0x8000, 0x5000, 0x6, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xA0, 64, 16
	banim_frame_oam 0x0, 0x1000, 0xC0, 64, 8
	banim_frame_oam 0x0, 0x5000, 0xA1, 48, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xE0, 56, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, 48, 8
	banim_frame_oam 0x0, 0x1000, 0x85, 48, 0
	banim_frame_oam 0x0, 0x1000, 0x84, 64, 16
	banim_frame_oam 0x0, 0x1000, 0xB, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x2B, 16, -8
	banim_frame_oam 0x0, 0x1000, 0x6B, 16, 8
	banim_frame_oam 0x8000, 0x9000, 0x8, 32, -16
	banim_frame_oam 0x8000, 0x5000, 0xA, 24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE3, 24, -8
	banim_frame_oam 0x0, 0x5000, 0x87, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0x89, 16, 0
	banim_frame_oam 0x4000, 0x9000, 0xA3, 40, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0xA3, 40, 8
	banim_frame_oam 0x4000, 0x1000, 0xA7, 24, 8
	banim_frame_oam 0x0, 0x1000, 0xA9, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xC7, 24, -8
	banim_frame_oam 0x0, 0x1000, 0xE9, 16, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0xA3, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xA9, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xC9, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, 24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0xE6, 32, -16
	banim_frame_oam 0x0, 0x5000, 0xCA, 32, -8
	banim_frame_oam 0x8000, 0x9000, 0xD, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0xF, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0x10, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x50, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x8D, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x8F, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xC, 0, -40
	banim_frame_oam 0x8000, 0x1000, 0x2C, 24, -24
	banim_frame_oam 0x0, 0x1000, 0x6C, 24, -8
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x12, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x14, -8, -40
	banim_frame_oam 0x0, 0x1000, 0x11, 24, -8
	banim_frame_oam 0x8000, 0x1000, 0x31, 16, -32
	banim_frame_oam 0x0, 0x1000, 0x71, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x70, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x92, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x94, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xEC, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x8C, 16, -16
	banim_frame_oam 0x0, 0x5000, 0xAC, 24, -8
	banim_frame_oam 0x0, 0x1000, 0xAE, 16, -8
	banim_frame_oam 0x0, 0x5000, 0xB0, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0xB2, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xF0, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xF2, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xD3, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x90, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xEC, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xB3, -16, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x1000, 0xCE, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xAF, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x15, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x19, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x1B, -16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x55, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xD4, 16, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xD6, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xD8, 0, -24
	banim_frame_oam 0x0, 0x9000, 0x59, -16, -16
	banim_frame_end
banim_sks_sp1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sks_sp1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_sks_sp1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x60, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x62, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x2, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x42, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -48
	banim_frame_oam 0x0, 0x1000, 0x40, 8, -32
	banim_frame_end
banim_sks_sp1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x42, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xC1, 0, 0
	banim_frame_oam 0x0, 0x1000, 0x41, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC3, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x63, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xA3, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x4, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x44, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x3, 8, -48
	banim_frame_oam 0x0, 0x1000, 0x43, 8, -32
	banim_frame_end
banim_sks_sp1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0x7, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x27, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x5, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x85, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, 16, -24
	banim_frame_oam 0x8000, 0x1000, 0xC5, 16, -40
	banim_frame_oam 0x0, 0x1000, 0xC4, 24, -40
	banim_frame_oam 0x0, 0x1000, 0xA5, -16, -8
	banim_frame_end
banim_sks_sp1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x1000, 0xA, 16, -8
	banim_frame_oam 0x8000, 0x9000, 0x8, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x88, 0, 8
	banim_frame_oam 0x8000, 0x5000, 0x2A, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x4B, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x8B, -16, 8
	banim_frame_end
banim_sks_sp1_oam_frame_21_l:
	banim_frame_oam 0x4000, 0x1000, 0xA6, 0, 8
	banim_frame_oam 0x0, 0x5000, 0xA8, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xAA, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xC6, 16, -8
	banim_frame_oam 0x0, 0x1000, 0xAB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, -16, -8
	banim_frame_end
banim_sks_sp1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x8D, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x4C, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xC, 24, -24
	banim_frame_end
banim_sks_sp1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x74, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x14, 24, -8
	banim_frame_oam 0x0, 0x1000, 0x13, 24, -24
	banim_frame_oam 0x8000, 0x9000, 0x31, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x33, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0x11, 8, -24
	banim_frame_oam 0x8000, 0x1000, 0x34, -8, -16
	banim_frame_end
banim_sks_sp1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0xB4, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD3, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0xF3, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0xB0, 0, 0
	banim_frame_oam 0x0, 0x5000, 0xD0, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD2, -16, -16
	banim_frame_oam 0x4000, 0x9000, 0xAC, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0xEC, 8, -8
	banim_frame_end
banim_sks_sp1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x18, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0x98, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0x3C, 0, -16
	banim_frame_oam 0x0, 0x5000, 0x15, 48, -24
	banim_frame_oam 0x8000, 0x1000, 0x17, 40, -24
	banim_frame_end
banim_sks_sp1_oam_frame_27_l:
	banim_frame_oam 0x4000, 0x5000, 0xB7, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xBB, 0, 8
	banim_frame_oam 0x0, 0x5000, 0xB5, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0xF5, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x55, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0x57, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0x95, 24, 0
	banim_frame_oam 0x0, 0x1000, 0x97, 16, 0
	banim_frame_end
banim_sks_sp1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0xDA, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0xDC, 8, -16
	banim_frame_oam 0x0, 0x5000, 0xDD, 8, 0
	banim_frame_oam 0x0, 0x5000, 0xD8, 8, -32
	banim_frame_oam 0x0, 0x1000, 0xF7, 24, -24
	banim_frame_oam 0x8000, 0x9000, 0x1D, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x9D, -8, 0
	banim_frame_oam 0x8000, 0x5000, 0x3F, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xFF, -8, -40
	banim_frame_oam 0x0, 0x1000, 0xDF, 0, -40
	banim_frame_oam 0x0, 0x1000, 0xBF, 8, -40
	banim_frame_end
banim_sks_sp1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x20, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x24, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0xA0, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xA4, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xC4, 24, -8
	banim_frame_oam 0x8000, 0x1000, 0xA5, 24, -24
	banim_frame_oam 0x4000, 0x1000, 0x1, 0, -40
	banim_frame_oam 0x0, 0x1000, 0x3, -8, -40
	banim_frame_end
banim_sks_sp1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x1000, 0x0, 24, -8
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0xA, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x8A, -16, 0
	banim_frame_oam 0x8000, 0x5000, 0x2B, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x4, -8, -40
	banim_frame_end
banim_sks_sp1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x9000, 0xC, 0, -24
	banim_frame_oam 0x0, 0x5000, 0x10, -16, -24
	banim_frame_oam 0x4000, 0x9000, 0xC5, 0, -8
	banim_frame_oam 0x0, 0x5000, 0xC9, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xCB, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAB, 24, -8
	banim_frame_oam 0x0, 0x1000, 0xB, -8, -32
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x4E, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xCE, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x6D, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0x6C, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x4C, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x4D, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xCD, 0, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x1000, 0xAC, -40, 0
	banim_frame_oam 0x8000, 0x9000, 0x50, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xD0, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x72, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x93, -32, -8
	banim_frame_oam 0x0, 0x1000, 0xD3, -32, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x12, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0x52, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x36, -40, 0
	banim_frame_oam 0x4000, 0x1000, 0xEF, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xF1, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xED, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xEC, -16, -32
	banim_frame_end
banim_sks_sp1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x29, 24, -16
	banim_frame_end
banim_sks_sp1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x14, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x90, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x94, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x2F, 24, -16
	banim_frame_end
banim_sks_sp1_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x9000, 0x16, 8, -8
	banim_frame_oam 0x0, 0x5000, 0x1A, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x1C, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0x56, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x5A, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x5C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x55, 40, 8
	banim_frame_end
banim_sks_sp1_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x9000, 0x76, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x7A, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x7C, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x95, 40, 8
	banim_frame_end
banim_sks_sp1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x9000, 0x80, 48, -16
	banim_frame_oam 0x4000, 0x9000, 0x84, 16, -16
	banim_frame_oam 0x4000, 0x5000, 0xC0, 48, 0
	banim_frame_oam 0x4000, 0x5000, 0xC4, 16, 0
	banim_frame_oam 0x4000, 0x5000, 0xE4, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, 8, 8
	banim_frame_end
banim_sks_sp1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x9000, 0x84, 16, -16
	banim_frame_oam 0x4000, 0x5000, 0xC4, 16, 0
	banim_frame_oam 0x4000, 0x5000, 0xE4, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xA3, 48, -8
	banim_frame_end
banim_sks_sp1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x1000, 0xA0, 64, -8
	banim_frame_oam 0x0, 0x1000, 0xA2, 56, -8
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
banim_sks_sp1_oam_r:
banim_sks_sp1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x80, -32, -16
	banim_frame_oam 0x4000, 0x0, 0x82, -8, -24
	banim_frame_end
banim_sks_sp1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x6, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xC2, 8, 0
	banim_frame_oam 0x0, 0x4000, 0xC0, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xA2, -8, -24
	banim_frame_end
banim_sks_sp1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x9, 0, -16
	banim_frame_oam 0x4000, 0x0, 0xC4, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xC3, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x84, -32, -16
	banim_frame_end
banim_sks_sp1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x0, 0xC6, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x86, -32, -16
	banim_frame_oam 0x8000, 0x8000, 0xA, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0xC, 0, -16
	banim_frame_end
banim_sks_sp1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x0, 0xE4, -16, -24
	banim_frame_oam 0x0, 0x4000, 0x88, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xC7, 8, 0
	banim_frame_oam 0x8000, 0x8000, 0xD, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0xF, 0, -16
	banim_frame_end
banim_sks_sp1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0xE8, -16, -24
	banim_frame_oam 0x0, 0x0, 0xE9, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xC8, -40, -8
	banim_frame_oam 0x0, 0x0, 0xCA, -24, -8
	banim_frame_oam 0x8000, 0x8000, 0x10, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x12, 0, -16
	banim_frame_end
banim_sks_sp1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x0, 0xEA, -40, -8
	banim_frame_oam 0x4000, 0x0, 0xAA, -24, -24
	banim_frame_oam 0x0, 0x0, 0x8A, 0, -8
	banim_frame_oam 0x0, 0x0, 0xCB, 0, 8
	banim_frame_oam 0x8000, 0x8000, 0x13, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0x15, -8, -16
	banim_frame_end
banim_sks_sp1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0x8B, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xEC, -48, -8
	banim_frame_oam 0x0, 0x0, 0xCD, 0, 8
	banim_frame_oam 0x0, 0x0, 0xCC, 0, -8
	banim_frame_oam 0x0, 0x8000, 0x16, -32, -16
	banim_frame_end
banim_sks_sp1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0xAC, 0, -8
	banim_frame_oam 0x4000, 0x0, 0x8C, -48, -8
	banim_frame_oam 0x0, 0x0, 0xAD, -40, 0
	banim_frame_oam 0x0, 0x8000, 0x1A, -32, -16
	banim_frame_end
banim_sks_sp1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x0, 0xB2, -8, -8
	banim_frame_oam 0x0, 0x0, 0x92, 0, -8
	banim_frame_oam 0x8000, 0x8000, 0x8F, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x91, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xAE, -40, -8
	banim_frame_oam 0x0, 0x0, 0xEE, -40, 8
	banim_frame_oam 0x0, 0x0, 0x8E, -48, -8
	banim_frame_end
banim_sks_sp1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x0, 0xD2, -48, -8
	banim_frame_oam 0x0, 0x0, 0x97, 0, -8
	banim_frame_oam 0x0, 0x0, 0xB7, -8, -8
	banim_frame_oam 0x0, 0x8000, 0x93, -40, -16
	banim_frame_end
banim_sks_sp1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x0, 0xD7, -8, -16
	banim_frame_oam 0x0, 0x0, 0x1E, 0, -16
	banim_frame_oam 0x0, 0x8000, 0x98, -40, -16
	banim_frame_end
banim_sks_sp1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -80, -16
	banim_frame_oam 0x0, 0x0, 0x68, -16, 8
	banim_frame_end
banim_sks_sp1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x3, -56, -16
	banim_frame_oam 0x8000, 0x4000, 0x7, -24, -16
	banim_frame_oam 0x0, 0x0, 0x68, -16, 8
	banim_frame_end
banim_sks_sp1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x0, 0x20, -80, -8
	banim_frame_oam 0x0, 0x0, 0x22, -64, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x7, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x27, -24, -8
	banim_frame_oam 0x0, 0x0, 0x67, -24, 8
	banim_frame_oam 0x8000, 0x8000, 0x4, -48, -16
	banim_frame_oam 0x8000, 0x4000, 0x6, -32, -16
	banim_frame_oam 0x0, 0x0, 0xA0, -72, 16
	banim_frame_oam 0x0, 0x0, 0xC0, -72, 8
	banim_frame_oam 0x0, 0x4000, 0xA1, -64, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xE0, -72, 8
	banim_frame_oam 0x0, 0x0, 0xE2, -56, 8
	banim_frame_oam 0x0, 0x0, 0x85, -56, 0
	banim_frame_oam 0x0, 0x0, 0x84, -72, 16
	banim_frame_oam 0x0, 0x0, 0xB, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x2B, -24, -8
	banim_frame_oam 0x0, 0x0, 0x6B, -24, 8
	banim_frame_oam 0x8000, 0x8000, 0x8, -48, -16
	banim_frame_oam 0x8000, 0x4000, 0xA, -32, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xE5, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xE3, -40, -8
	banim_frame_oam 0x0, 0x4000, 0x87, -40, 0
	banim_frame_oam 0x8000, 0x0, 0x89, -24, 0
	banim_frame_oam 0x4000, 0x8000, 0xA3, -72, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0xA3, -72, 8
	banim_frame_oam 0x4000, 0x0, 0xA7, -40, 8
	banim_frame_oam 0x0, 0x0, 0xA9, -24, 8
	banim_frame_oam 0x0, 0x0, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xC7, -40, -8
	banim_frame_oam 0x0, 0x0, 0xE9, -24, 0
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0xA3, -72, 8
	banim_frame_oam 0x0, 0x0, 0xA9, -24, 8
	banim_frame_oam 0x0, 0x0, 0xE5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC9, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, -40, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0xE6, -40, -16
	banim_frame_oam 0x0, 0x4000, 0xCA, -48, -8
	banim_frame_oam 0x8000, 0x8000, 0xD, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0xF, -8, -32
	banim_frame_oam 0x8000, 0x0, 0x10, 0, -32
	banim_frame_oam 0x0, 0x0, 0x50, 0, -16
	banim_frame_oam 0x4000, 0x0, 0x8D, -24, 0
	banim_frame_oam 0x0, 0x0, 0x8F, -8, 0
	banim_frame_oam 0x0, 0x0, 0xC, -8, -40
	banim_frame_oam 0x8000, 0x0, 0x2C, -32, -24
	banim_frame_oam 0x0, 0x0, 0x6C, -32, -8
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x12, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x14, 0, -40
	banim_frame_oam 0x0, 0x0, 0x11, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x31, -24, -32
	banim_frame_oam 0x0, 0x0, 0x71, -24, -16
	banim_frame_oam 0x0, 0x0, 0x70, -32, -16
	banim_frame_oam 0x4000, 0x0, 0x92, -16, -8
	banim_frame_oam 0x0, 0x0, 0x94, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x8C, -24, -16
	banim_frame_oam 0x0, 0x4000, 0xAC, -40, -8
	banim_frame_oam 0x0, 0x0, 0xAE, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xB0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xB2, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xF0, -16, -8
	banim_frame_oam 0x0, 0x0, 0xF2, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x90, -8, 0
	banim_frame_oam 0x4000, 0x0, 0xEC, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xB3, 0, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x0, 0xCE, -16, -8
	banim_frame_oam 0x0, 0x0, 0xAF, 0, -8
	banim_frame_oam 0x4000, 0x8000, 0x15, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x19, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x1B, 8, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x55, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xD4, -32, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xD6, -32, -16
	banim_frame_oam 0x0, 0x0, 0xD8, -8, -24
	banim_frame_oam 0x0, 0x8000, 0x59, -16, -16
	banim_frame_end
banim_sks_sp1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sks_sp1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_sks_sp1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x60, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x62, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x2, 8, -16
	banim_frame_oam 0x0, 0x0, 0x42, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -48
	banim_frame_oam 0x0, 0x0, 0x40, -16, -32
	banim_frame_end
banim_sks_sp1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, 8
	banim_frame_oam 0x0, 0x0, 0x42, 8, 8
	banim_frame_oam 0x0, 0x0, 0xC1, -8, 0
	banim_frame_oam 0x0, 0x0, 0x41, 0, 0
	banim_frame_oam 0x8000, 0x0, 0xC3, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x63, -16, -24
	banim_frame_oam 0x4000, 0x0, 0xA3, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x4, 0, -24
	banim_frame_oam 0x0, 0x0, 0x44, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x3, -16, -48
	banim_frame_oam 0x0, 0x0, 0x43, -16, -32
	banim_frame_end
banim_sks_sp1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0x7, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x27, 0, -16
	banim_frame_oam 0x8000, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE4, -24, -24
	banim_frame_oam 0x8000, 0x0, 0xC5, -24, -40
	banim_frame_oam 0x0, 0x0, 0xC4, -32, -40
	banim_frame_oam 0x0, 0x0, 0xA5, 8, -8
	banim_frame_end
banim_sks_sp1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x0, 0xA, -32, -8
	banim_frame_oam 0x8000, 0x8000, 0x8, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x88, -16, 8
	banim_frame_oam 0x8000, 0x4000, 0x2A, 0, -16
	banim_frame_oam 0x0, 0x0, 0x4B, 8, -8
	banim_frame_oam 0x0, 0x0, 0x8B, 8, 8
	banim_frame_end
banim_sks_sp1_oam_frame_21_r:
	banim_frame_oam 0x4000, 0x0, 0xA6, -16, 8
	banim_frame_oam 0x0, 0x4000, 0xA8, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xAA, 0, -16
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 0, 0
	banim_frame_oam 0x0, 0x4000, 0xC6, -32, -8
	banim_frame_oam 0x0, 0x0, 0xAB, 0, 8
	banim_frame_oam 0x0, 0x0, 0xEB, 8, 8
	banim_frame_oam 0x0, 0x0, 0xCB, 8, -8
	banim_frame_end
banim_sks_sp1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x8D, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x4C, 8, -8
	banim_frame_oam 0x8000, 0x0, 0xC, -32, -24
	banim_frame_end
banim_sks_sp1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x74, 8, -8
	banim_frame_oam 0x0, 0x0, 0x14, -32, -8
	banim_frame_oam 0x0, 0x0, 0x13, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x31, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0x33, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x11, -24, -24
	banim_frame_oam 0x8000, 0x0, 0x34, 0, -16
	banim_frame_end
banim_sks_sp1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0xB4, 0, 8
	banim_frame_oam 0x4000, 0x0, 0xD3, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xF3, -16, 8
	banim_frame_oam 0x4000, 0x4000, 0xB0, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD0, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xD2, 8, -16
	banim_frame_oam 0x4000, 0x8000, 0xAC, -40, -24
	banim_frame_oam 0x4000, 0x4000, 0xEC, -40, -8
	banim_frame_end
banim_sks_sp1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -40, -24
	banim_frame_oam 0x4000, 0x4000, 0x98, -40, 8
	banim_frame_oam 0x8000, 0x0, 0x3C, -8, -16
	banim_frame_oam 0x0, 0x4000, 0x15, -64, -24
	banim_frame_oam 0x8000, 0x0, 0x17, -48, -24
	banim_frame_end
banim_sks_sp1_oam_frame_27_r:
	banim_frame_oam 0x4000, 0x4000, 0xB7, -40, 8
	banim_frame_oam 0x0, 0x0, 0xBB, -8, 8
	banim_frame_oam 0x0, 0x4000, 0xB5, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xF5, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x55, -40, -16
	banim_frame_oam 0x8000, 0x0, 0x57, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x95, -40, 0
	banim_frame_oam 0x0, 0x0, 0x97, -24, 0
	banim_frame_end
banim_sks_sp1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0xDA, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xDC, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xDD, -24, 0
	banim_frame_oam 0x0, 0x4000, 0xD8, -24, -32
	banim_frame_oam 0x0, 0x0, 0xF7, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x1D, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x9D, -8, 0
	banim_frame_oam 0x8000, 0x4000, 0x3F, 8, -24
	banim_frame_oam 0x0, 0x0, 0xFF, 0, -40
	banim_frame_oam 0x0, 0x0, 0xDF, -8, -40
	banim_frame_oam 0x0, 0x0, 0xBF, -16, -40
	banim_frame_end
banim_sks_sp1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x20, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x24, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0xA0, -24, 0
	banim_frame_oam 0x0, 0x0, 0xA4, 8, 0
	banim_frame_oam 0x0, 0x0, 0xC4, -32, -8
	banim_frame_oam 0x8000, 0x0, 0xA5, -32, -24
	banim_frame_oam 0x4000, 0x0, 0x1, -16, -40
	banim_frame_oam 0x0, 0x0, 0x3, 0, -40
	banim_frame_end
banim_sks_sp1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x0, 0x0, -32, -8
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0xA, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x8A, 8, 0
	banim_frame_oam 0x8000, 0x4000, 0x2B, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x4, -8, -40
	banim_frame_end
banim_sks_sp1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x8000, 0xC, -32, -24
	banim_frame_oam 0x0, 0x4000, 0x10, 0, -24
	banim_frame_oam 0x4000, 0x8000, 0xC5, -32, -8
	banim_frame_oam 0x0, 0x4000, 0xC9, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xCB, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -24, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 8, 8
	banim_frame_oam 0x0, 0x0, 0xAB, -32, -8
	banim_frame_oam 0x0, 0x0, 0xB, 0, -32
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x4E, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xCE, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x6D, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x6C, -16, -16
	banim_frame_oam 0x0, 0x0, 0x4C, -24, -16
	banim_frame_oam 0x0, 0x0, 0x4D, 16, 0
	banim_frame_oam 0x0, 0x0, 0xCD, -8, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x0, 0xAC, 32, 0
	banim_frame_oam 0x8000, 0x8000, 0x50, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xD0, 0, 8
	banim_frame_oam 0x8000, 0x4000, 0x72, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x93, 24, -8
	banim_frame_oam 0x0, 0x0, 0xD3, 24, 8
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x12, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0x52, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x36, 32, 0
	banim_frame_oam 0x4000, 0x0, 0xEF, 8, -16
	banim_frame_oam 0x0, 0x0, 0xF1, 24, -16
	banim_frame_oam 0x4000, 0x0, 0xED, 8, -24
	banim_frame_oam 0x0, 0x0, 0xEC, 8, -32
	banim_frame_end
banim_sks_sp1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -24, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 8, 8
	banim_frame_oam 0x0, 0x0, 0x29, -32, -16
	banim_frame_end
banim_sks_sp1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x14, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x90, -24, 8
	banim_frame_oam 0x0, 0x0, 0x94, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x2F, -32, -16
	banim_frame_end
banim_sks_sp1_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x8000, 0x16, -40, -8
	banim_frame_oam 0x0, 0x4000, 0x1A, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x1C, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x56, -40, 8
	banim_frame_oam 0x4000, 0x0, 0x5A, -8, 8
	banim_frame_oam 0x0, 0x0, 0x5C, 8, 8
	banim_frame_oam 0x0, 0x0, 0x55, -48, 8
	banim_frame_end
banim_sks_sp1_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x8000, 0x76, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x7A, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x7C, 8, 0
	banim_frame_oam 0x0, 0x0, 0x95, -48, 8
	banim_frame_end
banim_sks_sp1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x8000, 0x80, -80, -16
	banim_frame_oam 0x4000, 0x8000, 0x84, -48, -16
	banim_frame_oam 0x4000, 0x4000, 0xC0, -80, 0
	banim_frame_oam 0x4000, 0x4000, 0xC4, -48, 0
	banim_frame_oam 0x4000, 0x4000, 0xE4, -48, 8
	banim_frame_oam 0x0, 0x0, 0xE8, -16, 8
	banim_frame_end
banim_sks_sp1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x8000, 0x84, -48, -16
	banim_frame_oam 0x4000, 0x4000, 0xC4, -48, 0
	banim_frame_oam 0x4000, 0x4000, 0xE4, -48, 8
	banim_frame_oam 0x0, 0x0, 0xE8, -16, 8
	banim_frame_oam 0x0, 0x0, 0xA3, -56, -8
	banim_frame_end
banim_sks_sp1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x0, 0xA0, -80, -8
	banim_frame_oam 0x0, 0x0, 0xA2, -64, -8
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
banim_sks_sp1_script:
banim_sks_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 1, banim_sks_sp1_oam_frame_1_r - banim_sks_sp1_oam_r
	banim_code_frame 5, banim_sks_sp1_sheet_0, 2, banim_sks_sp1_oam_frame_2_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 3, banim_sks_sp1_oam_frame_3_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 4, banim_sks_sp1_oam_frame_4_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 5, banim_sks_sp1_oam_frame_5_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 6, banim_sks_sp1_oam_frame_6_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sp1_sheet_0, 7, banim_sks_sp1_oam_frame_7_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 8, banim_sks_sp1_oam_frame_8_r - banim_sks_sp1_oam_r
	banim_code_frame 5, banim_sks_sp1_sheet_0, 9, banim_sks_sp1_oam_frame_9_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 10, banim_sks_sp1_oam_frame_10_r - banim_sks_sp1_oam_r
	banim_code_frame 18, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 2, banim_sks_sp1_sheet_1, 13, banim_sks_sp1_oam_frame_12_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_1, 52, banim_sks_sp1_oam_frame_13_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sks_sp1_sheet_1, 13, banim_sks_sp1_oam_frame_12_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 10, banim_sks_sp1_oam_frame_10_r - banim_sks_sp1_oam_r
	banim_code_frame 7, banim_sks_sp1_sheet_0, 9, banim_sks_sp1_oam_frame_9_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 6, banim_sks_sp1_sheet_0, 8, banim_sks_sp1_oam_frame_8_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 7, banim_sks_sp1_oam_frame_7_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 6, banim_sks_sp1_oam_frame_6_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 5, banim_sks_sp1_oam_frame_5_r - banim_sks_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_bonewalker_move
	banim_code_frame 3, banim_sks_sp1_sheet_0, 4, banim_sks_sp1_oam_frame_4_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 1, banim_sks_sp1_oam_frame_1_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 5, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 5, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 18, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 2, banim_sks_sp1_sheet_1, 14, banim_sks_sp1_oam_frame_15_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_1, 53, banim_sks_sp1_oam_frame_16_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sks_sp1_sheet_1, 14, banim_sks_sp1_oam_frame_15_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 7, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_bonewalker_move
	banim_code_frame 3, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 4, banim_sks_sp1_sheet_2, 30, banim_sks_sp1_oam_frame_17_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 31, banim_sks_sp1_oam_frame_18_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 30, banim_sks_sp1_oam_frame_17_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 31, banim_sks_sp1_oam_frame_18_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 30, banim_sks_sp1_oam_frame_17_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 31, banim_sks_sp1_oam_frame_18_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 30, banim_sks_sp1_oam_frame_17_r - banim_sks_sp1_oam_r
	banim_code_frame 5, banim_sks_sp1_sheet_2, 32, banim_sks_sp1_oam_frame_19_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_2, 33, banim_sks_sp1_oam_frame_20_r - banim_sks_sp1_oam_r
	banim_code_frame 20, banim_sks_sp1_sheet_2, 34, banim_sks_sp1_oam_frame_21_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 5, banim_sks_sp1_oam_frame_5_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 6, banim_sks_sp1_oam_frame_6_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 6, banim_sks_sp1_sheet_0, 7, banim_sks_sp1_oam_frame_7_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 8, banim_sks_sp1_oam_frame_8_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 9, banim_sks_sp1_oam_frame_9_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 10, banim_sks_sp1_oam_frame_10_r - banim_sks_sp1_oam_r
	banim_code_frame 16, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_sks_sp1_sheet_1, 13, banim_sks_sp1_oam_frame_12_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_1, 52, banim_sks_sp1_oam_frame_13_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sks_sp1_sheet_1, 13, banim_sks_sp1_oam_frame_12_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 10, banim_sks_sp1_oam_frame_10_r - banim_sks_sp1_oam_r
	banim_code_frame 7, banim_sks_sp1_sheet_0, 9, banim_sks_sp1_oam_frame_9_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 6, banim_sks_sp1_sheet_0, 8, banim_sks_sp1_oam_frame_8_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 7, banim_sks_sp1_oam_frame_7_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 6, banim_sks_sp1_oam_frame_6_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 5, banim_sks_sp1_oam_frame_5_r - banim_sks_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_bonewalker_move
	banim_code_frame 3, banim_sks_sp1_sheet_0, 4, banim_sks_sp1_oam_frame_4_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 1, banim_sks_sp1_oam_frame_1_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_critical
	banim_code_frame 4, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 5, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 20, banim_sks_sp1_sheet_2, 28, banim_sks_sp1_oam_frame_22_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 16, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_sks_sp1_sheet_1, 14, banim_sks_sp1_oam_frame_15_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_1, 53, banim_sks_sp1_oam_frame_16_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sks_sp1_sheet_1, 14, banim_sks_sp1_oam_frame_15_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 7, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 6, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_bonewalker_move
	banim_code_frame 3, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_0, 26, banim_sks_sp1_oam_frame_14_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sks_sp1_sheet_2, 35, banim_sks_sp1_oam_frame_23_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_2, 36, banim_sks_sp1_oam_frame_24_r - banim_sks_sp1_oam_r
	banim_code_frame 12, banim_sks_sp1_sheet_2, 37, banim_sks_sp1_oam_frame_25_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_2, 38, banim_sks_sp1_oam_frame_26_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sks_sp1_sheet_2, 39, banim_sks_sp1_oam_frame_27_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sks_sp1_sheet_0, 6, banim_sks_sp1_oam_frame_6_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 5, banim_sks_sp1_oam_frame_5_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sp1_sheet_0, 4, banim_sks_sp1_oam_frame_4_r - banim_sks_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_sks_sp1_sheet_0, 1, banim_sks_sp1_oam_frame_1_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_sks_sp1_sheet_2, 35, banim_sks_sp1_oam_frame_23_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_2, 36, banim_sks_sp1_oam_frame_24_r - banim_sks_sp1_oam_r
	banim_code_effect_dirt_wave_medium
	banim_code_frame 2, banim_sks_sp1_sheet_2, 40, banim_sks_sp1_oam_frame_28_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_3, 41, banim_sks_sp1_oam_frame_29_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_3, 42, banim_sks_sp1_oam_frame_30_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_3, 43, banim_sks_sp1_oam_frame_31_r - banim_sks_sp1_oam_r
	banim_code_frame 12, banim_sks_sp1_sheet_2, 36, banim_sks_sp1_oam_frame_24_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_2, 37, banim_sks_sp1_oam_frame_25_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_2, 38, banim_sks_sp1_oam_frame_26_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_call_spell_anim
	banim_code_frame 1, banim_sks_sp1_sheet_2, 39, banim_sks_sp1_oam_frame_27_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_sks_sp1_sheet_0, 6, banim_sks_sp1_oam_frame_6_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 5, banim_sks_sp1_oam_frame_5_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sp1_sheet_0, 4, banim_sks_sp1_oam_frame_4_r - banim_sks_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 5, banim_sks_sp1_sheet_0, 1, banim_sks_sp1_oam_frame_1_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sp1_mode_dodge_close:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_sks_sp1_sheet_1, 47, banim_sks_sp1_oam_frame_32_r - banim_sks_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sp1_sheet_1, 48, banim_sks_sp1_oam_frame_33_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_1, 49, banim_sks_sp1_oam_frame_34_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_1, 50, banim_sks_sp1_oam_frame_35_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sp1_sheet_1, 49, banim_sks_sp1_oam_frame_34_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_1, 48, banim_sks_sp1_oam_frame_33_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_1, 47, banim_sks_sp1_oam_frame_32_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sp1_mode_dodge_range:
	banim_code_dodge_to_before
	banim_code_frame 1, banim_sks_sp1_sheet_1, 47, banim_sks_sp1_oam_frame_32_r - banim_sks_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_sks_sp1_sheet_1, 48, banim_sks_sp1_oam_frame_33_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_1, 49, banim_sks_sp1_oam_frame_34_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_1, 50, banim_sks_sp1_oam_frame_35_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_sks_sp1_sheet_1, 49, banim_sks_sp1_oam_frame_34_r - banim_sks_sp1_oam_r
	banim_code_frame 2, banim_sks_sp1_sheet_1, 48, banim_sks_sp1_oam_frame_33_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_1, 47, banim_sks_sp1_oam_frame_32_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_sks_sp1_mode_stand_close:
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sp1_mode_stand:
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sp1_mode_stand_range:
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_sks_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 1, banim_sks_sp1_oam_frame_1_r - banim_sks_sp1_oam_r
	banim_code_frame 5, banim_sks_sp1_sheet_0, 2, banim_sks_sp1_oam_frame_2_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 3, banim_sks_sp1_oam_frame_3_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 4, banim_sks_sp1_oam_frame_4_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 5, banim_sks_sp1_oam_frame_5_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 6, banim_sks_sp1_oam_frame_6_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 4, banim_sks_sp1_sheet_0, 7, banim_sks_sp1_oam_frame_7_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 8, banim_sks_sp1_oam_frame_8_r - banim_sks_sp1_oam_r
	banim_code_frame 5, banim_sks_sp1_sheet_0, 9, banim_sks_sp1_oam_frame_9_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 10, banim_sks_sp1_oam_frame_10_r - banim_sks_sp1_oam_r
	banim_code_frame 18, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_sks_sp1_sheet_1, 12, banim_sks_sp1_oam_frame_36_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_1, 51, banim_sks_sp1_oam_frame_37_r - banim_sks_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_sks_sp1_sheet_1, 12, banim_sks_sp1_oam_frame_36_r - banim_sks_sp1_oam_r
	banim_code_frame 6, banim_sks_sp1_sheet_0, 11, banim_sks_sp1_oam_frame_11_r - banim_sks_sp1_oam_r
	banim_code_frame 8, banim_sks_sp1_sheet_0, 10, banim_sks_sp1_oam_frame_10_r - banim_sks_sp1_oam_r
	banim_code_frame 7, banim_sks_sp1_sheet_0, 9, banim_sks_sp1_oam_frame_9_r - banim_sks_sp1_oam_r
	banim_code_sound_bonewalker_move
	banim_code_frame 6, banim_sks_sp1_sheet_0, 8, banim_sks_sp1_oam_frame_8_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 7, banim_sks_sp1_oam_frame_7_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 6, banim_sks_sp1_oam_frame_6_r - banim_sks_sp1_oam_r
	banim_code_frame 4, banim_sks_sp1_sheet_0, 5, banim_sks_sp1_oam_frame_5_r - banim_sks_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_bonewalker_move
	banim_code_frame 3, banim_sks_sp1_sheet_0, 4, banim_sks_sp1_oam_frame_4_r - banim_sks_sp1_oam_r
	banim_code_frame 3, banim_sks_sp1_sheet_0, 1, banim_sks_sp1_oam_frame_1_r - banim_sks_sp1_oam_r
	banim_code_frame 1, banim_sks_sp1_sheet_0, 0, banim_sks_sp1_oam_frame_0_r - banim_sks_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_sks_sp1_mode_attack_close - banim_sks_sp1_script
	.word banim_sks_sp1_mode_attack_close_back - banim_sks_sp1_script
	.word banim_sks_sp1_mode_attack_close_critical - banim_sks_sp1_script
	.word banim_sks_sp1_mode_attack_close_critical_back - banim_sks_sp1_script
	.word banim_sks_sp1_mode_attack_range - banim_sks_sp1_script
	.word banim_sks_sp1_mode_attack_range_critical - banim_sks_sp1_script
	.word banim_sks_sp1_mode_dodge_close - banim_sks_sp1_script
	.word banim_sks_sp1_mode_dodge_range - banim_sks_sp1_script
	.word banim_sks_sp1_mode_stand_close - banim_sks_sp1_script
	.word banim_sks_sp1_mode_stand - banim_sks_sp1_script
	.word banim_sks_sp1_mode_stand_range - banim_sks_sp1_script
	.word banim_sks_sp1_mode_attack_miss - banim_sks_sp1_script
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

