@ vim:ft=armv4
	.global banim_lorm_sp1_script
	.global banim_lorm_sp1_oam_r
	.global banim_lorm_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x0
	.section .data.oam_l
banim_lorm_sp1_oam_l:
banim_lorm_sp1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x63, -24, 0
	banim_frame_oam 0x0, 0x5000, 0x3, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0x43, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -24, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -32, 8
	banim_frame_oam 0x0, 0x5000, 0xA, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0x4A, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x10, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x12, -32, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x9000, 0x13, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x15, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x32, -32, -8
	banim_frame_oam 0x8000, 0x9000, 0xC, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, 0, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x32, -32, -8
	banim_frame_oam 0x8000, 0x9000, 0xC, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, 0, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x19, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x1B, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x32, -32, -8
	banim_frame_oam 0x8000, 0x9000, 0xC, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, 0, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xA4, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xA6, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0xE0, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xE4, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xE6, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xC7, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xA7, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAB, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0xAD, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xB1, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0xED, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xF1, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xD3, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xC8, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xCC, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xC0, 16, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x97, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x9B, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD4, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xD5, 0, -24
	banim_frame_oam 0x0, 0x5000, 0x94, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0x96, 32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x7C, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0xFC, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x1D, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x1E, -8, 8
	banim_frame_oam 0x0, 0x5000, 0x3D, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x9000, 0x20, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x1, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x22, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x14, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x18, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x94, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0x96, 32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x99, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xB8, 24, 8
	banim_frame_oam 0x8000, 0x1000, 0x97, -16, -32
	banim_frame_end
banim_lorm_sp1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x9000, 0x5D, 0, -24
	banim_frame_oam 0x8000, 0x5000, 0x5F, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xDD, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xDF, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x3D, 24, -8
	banim_frame_oam 0x0, 0x1000, 0x3F, 16, -8
	banim_frame_oam 0x8000, 0x5000, 0x92, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xFE, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xFD, -8, -32
	banim_frame_end
banim_lorm_sp1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 0, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, -16
	banim_frame_oam 0x4000, 0x9000, 0xA2, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xA6, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE2, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE6, -16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0x88, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0xAC, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xB0, -16, 0
	banim_frame_oam 0x0, 0x1000, 0x8C, 16, -8
	banim_frame_oam 0x0, 0x1000, 0x8D, 8, 16
	banim_frame_end
banim_lorm_sp1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x1, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x60, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xA, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x86, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8A, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x11, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8D, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x91, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x6C, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_75_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x17, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x93, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x97, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x72, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_76_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x1A, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x98, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x9A, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xD8, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xDA, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xD7, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xB6, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_77_l:
	banim_frame_oam 0x0, 0x9000, 0x3C, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xBC, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xDE, -16, -40
	banim_frame_oam 0x0, 0x1000, 0x1D, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_78_l:
	banim_frame_oam 0x4000, 0x9000, 0xA1, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xE1, -16, -8
	banim_frame_oam 0x4000, 0x9000, 0xA5, -8, 0
	banim_frame_oam 0x0, 0x5000, 0xA9, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_79_l:
	banim_frame_oam 0x4000, 0x9000, 0xB0, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xB4, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xF0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF4, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xAC, -8, -32
	banim_frame_oam 0x8000, 0x1000, 0xAE, -16, -32
	banim_frame_oam 0x4000, 0x1000, 0xEC, -8, -16
	banim_frame_oam 0x0, 0x1000, 0xEE, -16, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_80_l:
	banim_frame_oam 0x0, 0x9000, 0x1, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x81, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xA0, 8, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x25, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x29, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xA5, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xA9, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x2A, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x2E, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xAA, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x2F, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x33, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xAF, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xB3, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x34, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x38, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xB4, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xB8, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x9000, 0x1, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x60, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xB, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x66, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x10, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x90, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x51, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x91, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0x16, -24, -48
	banim_frame_oam 0x4000, 0x9000, 0x92, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x96, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xD2, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xD6, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xF3, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0xD000, 0x19, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x98, 8, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, -8, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0xA4, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xE4, -8, 8
	banim_frame_oam 0x0, 0x5000, 0xA5, -24, -16
	banim_frame_oam 0x4000, 0x1000, 0xE5, -24, 0
	banim_frame_oam 0x4000, 0x1000, 0xA7, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x9000, 0xA9, 0, -24
	banim_frame_oam 0x0, 0x5000, 0xAD, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xAF, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xE9, 0, -8
	banim_frame_oam 0x4000, 0x1000, 0xED, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xEF, -24, -8
	banim_frame_oam 0x0, 0x5000, 0x3D, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x3F, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0x7D, 0, 16
	banim_frame_oam 0x0, 0x1000, 0x7F, -8, 16
	banim_frame_oam 0x0, 0x5000, 0x9D, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xB0, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -16, 0
	banim_frame_oam 0x4000, 0x5000, 0xC0, 0, 16
	banim_frame_oam 0x4000, 0x1000, 0xC4, -16, 16
	banim_frame_end
banim_lorm_sp1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x11, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x8D, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x91, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xCD, -8, 16
	banim_frame_oam 0x4000, 0x1000, 0xD1, -24, 16
	banim_frame_end
banim_lorm_sp1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x13, 8, -32
	banim_frame_oam 0x8000, 0x9000, 0x17, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x19, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x93, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x97, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x99, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x9A, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x3B, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x3F, -8, -40
	banim_frame_oam 0x4000, 0x9000, 0xBB, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0xBF, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xFB, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xFF, -8, 8
	banim_frame_oam 0x0, 0x5000, 0xD7, -24, -8
	banim_frame_oam 0x4000, 0x1000, 0xD9, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF9, 32, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x1, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x5, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x81, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x85, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC1, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xC5, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA0, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xB, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8B, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE7, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xE8, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xE9, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_44_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0xE, 8, -40
	banim_frame_oam 0x0, 0x5000, 0x8C, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x8E, 8, -8
	banim_frame_oam 0x0, 0x9000, 0xF, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x8F, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xCE, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_45_l:
	banim_frame_oam 0x8000, 0xD000, 0x13, 0, -48
	banim_frame_oam 0x8000, 0x9000, 0x17, -16, -48
	banim_frame_oam 0x8000, 0x9000, 0x97, -16, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0x19, 0, -48
	banim_frame_oam 0x8000, 0x9000, 0x1D, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x1F, -24, -48
	banim_frame_oam 0x4000, 0x5000, 0x99, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0x9D, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x9F, -24, -16
	banim_frame_oam 0x4000, 0x9000, 0xB9, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xBD, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xF9, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xFD, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_47_l:
	banim_frame_oam 0x8000, 0xD000, 0x1, -16, -48
	banim_frame_oam 0x8000, 0x5000, 0x5, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0x85, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x80, 16, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -40
	banim_frame_oam 0x4000, 0x5000, 0x86, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0xA6, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xA, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0xC, -32, -24
	banim_frame_oam 0x4000, 0x1000, 0x4A, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x4C, -32, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x9000, 0x8A, -16, -16
	banim_frame_oam 0x0, 0x9000, 0xD, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0x11, -24, -48
	banim_frame_end
banim_lorm_sp1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x8F, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x93, -32, -32
	banim_frame_oam 0x8000, 0x5000, 0x95, -40, -32
	banim_frame_oam 0x4000, 0x9000, 0x13, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x17, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0x19, -40, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_51_l:
	banim_frame_oam 0x8000, 0x9000, 0x1A, 0, -16
	banim_frame_oam 0x0, 0x9000, 0x56, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0xD6, -32, 0
	banim_frame_oam 0x8000, 0x5000, 0x9A, -40, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x8000, 0x5000, 0x26, -40, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_53_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0xB, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8B, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xC, -32, -32
	banim_frame_end
banim_lorm_sp1_oam_frame_54_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x11, -32, -32
	banim_frame_oam 0x8000, 0x5000, 0x13, -40, -32
	banim_frame_oam 0x4000, 0x9000, 0x8D, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x91, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0x93, -40, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_81_l:
	banim_frame_oam 0x0, 0x9000, 0x97, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x9B, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD4, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xD5, 0, -24
	banim_frame_oam 0x0, 0x5000, 0x94, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0x96, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0x93, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0x92, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_82_l:
	banim_frame_oam 0x0, 0x9000, 0x7C, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0xFC, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x1D, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x1E, -8, 8
	banim_frame_oam 0x0, 0x5000, 0x3D, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0x3F, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0x3C, 56, -8
	banim_frame_oam 0x0, 0x1000, 0xEC, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_83_l:
	banim_frame_oam 0x8000, 0x9000, 0x20, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x1, 0, -24
	banim_frame_oam 0x0, 0x1000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x22, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0xD3, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0xD7, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_84_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0xD3, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0xD7, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_85_l:
	banim_frame_oam 0x0, 0x9000, 0x8, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0xD3, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0xD7, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_86_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0xD3, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0xD7, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_87_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD9, 24, 0
	banim_frame_oam 0x0, 0x5000, 0xD4, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0xD6, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0xD3, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0xD7, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_88_l:
	banim_frame_oam 0x0, 0x9000, 0x14, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x18, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x94, 40, -8
	banim_frame_oam 0x8000, 0x1000, 0x96, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0x93, 56, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x1000, 0x93, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0x92, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_25_l:
	banim_frame_oam 0x8000, 0x1000, 0x3C, 56, -8
	banim_frame_oam 0x0, 0x1000, 0xEC, 64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x1000, 0xD3, 56, -8
	banim_frame_oam 0x0, 0x1000, 0xD7, 64, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_lorm_sp1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0x1000, 0x93, 56, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_55_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_69_l:
	banim_frame_oam 0x4000, 0x9000, 0x60, -24, 0
	banim_frame_oam 0x0, 0x5000, 0x2, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x42, -8, -8
	banim_frame_oam 0x0, 0x1000, 0x44, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_57_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_58_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xF, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8B, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8F, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_59_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x95, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_60_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1B, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9B, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_61_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, 24, -24
	banim_frame_oam 0x4000, 0x9000, 0xA4, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xA8, -24, -24
	banim_frame_oam 0x4000, 0x9000, 0xAA, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xAE, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xEA, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xEE, -16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_62_l:
	banim_frame_oam 0x4000, 0x9000, 0xAF, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xB3, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xEF, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xF3, -16, -8
	banim_frame_oam 0x4000, 0x9000, 0xB5, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xB9, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xB4, -24, -24
	banim_frame_end
banim_lorm_sp1_oam_frame_63_l:
	banim_frame_oam 0x0, 0x5000, 0x5D, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x5F, 0, -16
	banim_frame_oam 0x4000, 0x1000, 0x9D, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x9F, 0, 0
	banim_frame_oam 0x0, 0x5000, 0xBE, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0xFE, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xF4, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xF6, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xF9, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xFD, -16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_64_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x5, -24, -24
	banim_frame_end
banim_lorm_sp1_oam_frame_65_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0xA, -24, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_66_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x10, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x90, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_67_l:
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x16, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x92, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x96, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_68_l:
	banim_frame_oam 0x0, 0x9000, 0x18, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1C, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x98, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9C, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_70_l:
	banim_frame_oam 0x0, 0x9000, 0x80, 0, -24
	banim_frame_oam 0x8000, 0x9000, 0x84, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x86, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0x8A, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA6, 32, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_71_l:
	banim_frame_oam 0x4000, 0x9000, 0xA7, 0, -32
	banim_frame_oam 0x8000, 0x1000, 0xAB, -8, -32
	banim_frame_oam 0x4000, 0x5000, 0xE7, 0, -16
	banim_frame_oam 0x0, 0x1000, 0xEB, -8, -16
	banim_frame_oam 0x4000, 0x9000, 0xAC, 0, -8
	banim_frame_oam 0x0, 0x5000, 0xB0, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xB2, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xEC, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xF0, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xF2, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_72_l:
	banim_frame_oam 0x4000, 0x9000, 0xB4, -16, -32
	banim_frame_oam 0x4000, 0x5000, 0xF4, -16, -16
	banim_frame_oam 0x4000, 0x9000, 0xB8, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xBC, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xF8, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xFC, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xBD, 24, -24
	banim_frame_oam 0x8000, 0x1000, 0xBF, 16, -24
	banim_frame_oam 0x4000, 0x1000, 0xFD, 24, -8
	banim_frame_oam 0x0, 0x1000, 0xFF, 16, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_73_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_74_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x87, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8B, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_56_l:
	banim_frame_oam 0x0, 0x9000, 0x39, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x3D, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xB9, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xBD, -24, 8
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_lorm_sp1_oam_r:
banim_lorm_sp1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x63, 16, 0
	banim_frame_oam 0x0, 0x4000, 0x3, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x43, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -8, 8
	banim_frame_oam 0x0, 0x0, 0x89, 24, 8
	banim_frame_oam 0x0, 0x4000, 0xA, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x4A, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x10, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x12, 24, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x8000, 0x13, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x15, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x32, 24, -8
	banim_frame_oam 0x8000, 0x8000, 0xC, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, -8, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x32, 24, -8
	banim_frame_oam 0x8000, 0x8000, 0xC, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, -8, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x19, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x1B, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x32, 24, -8
	banim_frame_oam 0x8000, 0x8000, 0xC, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, -8, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -24, -16
	banim_frame_oam 0x0, 0x4000, 0xA4, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xA6, 24, -16
	banim_frame_oam 0x4000, 0x4000, 0xE0, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xE4, 8, 0
	banim_frame_oam 0x0, 0x0, 0xE6, 24, 0
	banim_frame_oam 0x0, 0x0, 0xC7, 32, -8
	banim_frame_oam 0x4000, 0x4000, 0xA7, -16, 8
	banim_frame_oam 0x0, 0x0, 0xAB, 16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0xAD, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xB1, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xED, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xF1, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xD3, 32, -8
	banim_frame_oam 0x4000, 0x4000, 0xC8, -16, 8
	banim_frame_oam 0x0, 0x0, 0xCC, 16, 8
	banim_frame_oam 0x8000, 0x0, 0xC0, -24, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x97, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x9B, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xD4, 8, -8
	banim_frame_oam 0x0, 0x0, 0xF5, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xD5, -16, -24
	banim_frame_oam 0x0, 0x4000, 0x94, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x96, -40, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x7C, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0xFC, -32, 8
	banim_frame_oam 0x0, 0x0, 0x1D, 0, -16
	banim_frame_oam 0x0, 0x0, 0x1E, 0, 8
	banim_frame_oam 0x0, 0x4000, 0x3D, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x3F, -40, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x8000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x1, -16, -24
	banim_frame_oam 0x0, 0x0, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x22, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -24, 8
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x18, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x94, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x96, -40, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -24, -32
	banim_frame_oam 0x4000, 0x8000, 0x99, -24, 0
	banim_frame_oam 0x0, 0x0, 0xB8, -32, 8
	banim_frame_oam 0x8000, 0x0, 0x97, 8, -32
	banim_frame_end
banim_lorm_sp1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x8000, 0x5D, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5F, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xDD, -16, 8
	banim_frame_oam 0x0, 0x0, 0xDF, 0, 8
	banim_frame_oam 0x4000, 0x0, 0x3D, -40, -8
	banim_frame_oam 0x0, 0x0, 0x3F, -24, -8
	banim_frame_oam 0x8000, 0x4000, 0x92, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xFE, -32, 8
	banim_frame_oam 0x0, 0x0, 0xFD, 0, -32
	banim_frame_end
banim_lorm_sp1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -16, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, -16
	banim_frame_oam 0x4000, 0x8000, 0xA2, -24, -8
	banim_frame_oam 0x8000, 0x0, 0xA6, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xE2, -24, 8
	banim_frame_oam 0x0, 0x0, 0xE6, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0x88, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0xAC, -24, 0
	banim_frame_oam 0x8000, 0x0, 0xB0, 8, 0
	banim_frame_oam 0x0, 0x0, 0x8C, -24, -8
	banim_frame_oam 0x0, 0x0, 0x8D, -16, 16
	banim_frame_end
banim_lorm_sp1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x60, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xA, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x86, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8A, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x11, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8D, -16, 8
	banim_frame_oam 0x0, 0x0, 0x91, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x6C, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_75_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x17, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x93, -16, 8
	banim_frame_oam 0x0, 0x0, 0x97, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x72, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_76_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x1A, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x98, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x9A, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xD8, -8, 8
	banim_frame_oam 0x0, 0x0, 0xDA, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD7, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xB6, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_77_r:
	banim_frame_oam 0x0, 0x8000, 0x3C, -8, -24
	banim_frame_oam 0x4000, 0x4000, 0xBC, -8, 8
	banim_frame_oam 0x8000, 0x0, 0xDE, 8, -40
	banim_frame_oam 0x0, 0x0, 0x1D, -16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_78_r:
	banim_frame_oam 0x4000, 0x8000, 0xA1, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE1, -16, -8
	banim_frame_oam 0x4000, 0x8000, 0xA5, -24, 0
	banim_frame_oam 0x0, 0x4000, 0xA9, 8, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_79_r:
	banim_frame_oam 0x4000, 0x8000, 0xB0, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xB4, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xF0, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF4, 16, 8
	banim_frame_oam 0x0, 0x4000, 0xAC, -8, -32
	banim_frame_oam 0x8000, 0x0, 0xAE, 8, -32
	banim_frame_oam 0x4000, 0x0, 0xEC, -8, -16
	banim_frame_oam 0x0, 0x0, 0xEE, 8, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_80_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x81, -8, 0
	banim_frame_oam 0x0, 0x0, 0xA0, -16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x25, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x29, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xA5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xA9, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x2A, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x2E, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAA, -16, 8
	banim_frame_oam 0x0, 0x0, 0xAE, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x2F, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x33, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xAF, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB3, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x34, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x38, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xB4, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB8, 16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x81, -16, 8
	banim_frame_oam 0x0, 0x0, 0x85, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x60, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xB, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8B, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x66, -24, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x10, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -24, 8
	banim_frame_oam 0x0, 0x0, 0x90, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x51, 16, -8
	banim_frame_oam 0x0, 0x0, 0x91, 16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x16, 8, -48
	banim_frame_oam 0x4000, 0x8000, 0x92, -24, -16
	banim_frame_oam 0x0, 0x4000, 0x96, 8, -16
	banim_frame_oam 0x4000, 0x4000, 0xD2, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xD6, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0xF3, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF7, 16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0xC000, 0x19, -8, -48
	banim_frame_oam 0x8000, 0x4000, 0x98, -16, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xA4, 0, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -16, 8
	banim_frame_oam 0x0, 0x0, 0xE4, 0, 8
	banim_frame_oam 0x0, 0x4000, 0xA5, 8, -16
	banim_frame_oam 0x4000, 0x0, 0xE5, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xA7, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x8000, 0xA9, -32, -24
	banim_frame_oam 0x0, 0x4000, 0xAD, 0, -24
	banim_frame_oam 0x8000, 0x0, 0xAF, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE9, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xED, 0, -8
	banim_frame_oam 0x0, 0x0, 0xEF, 16, -8
	banim_frame_oam 0x0, 0x4000, 0x3D, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x3F, 0, 0
	banim_frame_oam 0x4000, 0x0, 0x7D, -16, 16
	banim_frame_oam 0x0, 0x0, 0x7F, 0, 16
	banim_frame_oam 0x0, 0x4000, 0x9D, 8, 0
	banim_frame_oam 0x0, 0x4000, 0xB0, -32, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 0, 0
	banim_frame_oam 0x4000, 0x4000, 0xC0, -32, 16
	banim_frame_oam 0x4000, 0x0, 0xC4, 0, 16
	banim_frame_end
banim_lorm_sp1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x11, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8D, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x91, 8, 0
	banim_frame_oam 0x4000, 0x4000, 0xCD, -24, 16
	banim_frame_oam 0x4000, 0x0, 0xD1, 8, 16
	banim_frame_end
banim_lorm_sp1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -40, -32
	banim_frame_oam 0x8000, 0x8000, 0x17, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x19, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x93, -40, 0
	banim_frame_oam 0x0, 0x4000, 0x97, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x99, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x9A, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x3B, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x3F, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0xBB, -32, -8
	banim_frame_oam 0x8000, 0x0, 0xBF, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xFB, -32, 8
	banim_frame_oam 0x0, 0x0, 0xFF, 0, 8
	banim_frame_oam 0x0, 0x4000, 0xD7, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xD9, 8, 8
	banim_frame_oam 0x0, 0x0, 0xF9, -40, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x5, 0, -40
	banim_frame_oam 0x4000, 0x8000, 0x81, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x85, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0xC1, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xC5, 0, 8
	banim_frame_oam 0x8000, 0x0, 0xA0, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -40
	banim_frame_oam 0x8000, 0x4000, 0xB, 8, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -24, -8
	banim_frame_oam 0x8000, 0x0, 0x8B, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -24, 8
	banim_frame_oam 0x0, 0x0, 0xCB, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE7, -32, 0
	banim_frame_oam 0x0, 0x0, 0xE8, 16, 0
	banim_frame_oam 0x0, 0x0, 0xE9, 16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_44_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0xE, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x8C, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x8E, -16, -8
	banim_frame_oam 0x0, 0x8000, 0xF, -8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8F, -8, 0
	banim_frame_oam 0x0, 0x0, 0xCE, -16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_45_r:
	banim_frame_oam 0x8000, 0xC000, 0x13, -32, -48
	banim_frame_oam 0x8000, 0x8000, 0x17, 0, -48
	banim_frame_oam 0x8000, 0x8000, 0x97, 0, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -32, -48
	banim_frame_oam 0x8000, 0x8000, 0x1D, 0, -48
	banim_frame_oam 0x8000, 0x4000, 0x1F, 16, -48
	banim_frame_oam 0x4000, 0x4000, 0x99, -32, -16
	banim_frame_oam 0x4000, 0x0, 0x9D, 0, -16
	banim_frame_oam 0x0, 0x0, 0x9F, 16, -16
	banim_frame_oam 0x4000, 0x8000, 0xB9, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xBD, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xF9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xFD, 16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_47_r:
	banim_frame_oam 0x8000, 0xC000, 0x1, -16, -48
	banim_frame_oam 0x8000, 0x4000, 0x5, 16, -48
	banim_frame_oam 0x8000, 0x4000, 0x85, 16, -16
	banim_frame_oam 0x8000, 0x0, 0x80, -24, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -40
	banim_frame_oam 0x4000, 0x4000, 0x86, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0xA6, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xA, 8, -24
	banim_frame_oam 0x8000, 0x0, 0xC, 24, -24
	banim_frame_oam 0x4000, 0x0, 0x4A, 8, -8
	banim_frame_oam 0x0, 0x0, 0x4C, 24, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x8000, 0x8A, -16, -16
	banim_frame_oam 0x0, 0x8000, 0xD, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0x11, 8, -48
	banim_frame_end
banim_lorm_sp1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x8F, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x93, 16, -32
	banim_frame_oam 0x8000, 0x4000, 0x95, 32, -32
	banim_frame_oam 0x4000, 0x8000, 0x13, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x17, 16, 0
	banim_frame_oam 0x8000, 0x0, 0x19, 32, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_51_r:
	banim_frame_oam 0x8000, 0x8000, 0x1A, -16, -16
	banim_frame_oam 0x0, 0x8000, 0x56, 0, -32
	banim_frame_oam 0x4000, 0x8000, 0xD6, 0, 0
	banim_frame_oam 0x8000, 0x4000, 0x9A, 32, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x8000, 0x4000, 0x26, 32, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_53_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0xB, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x8B, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xC, 24, -32
	banim_frame_end
banim_lorm_sp1_oam_frame_54_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x11, 16, -32
	banim_frame_oam 0x8000, 0x4000, 0x13, 32, -32
	banim_frame_oam 0x4000, 0x8000, 0x8D, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x91, 16, 0
	banim_frame_oam 0x8000, 0x0, 0x93, 32, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_81_r:
	banim_frame_oam 0x0, 0x8000, 0x97, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x9B, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xD4, 8, -8
	banim_frame_oam 0x0, 0x0, 0xF5, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xD5, -16, -24
	banim_frame_oam 0x0, 0x4000, 0x94, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x96, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x93, -64, -8
	banim_frame_oam 0x8000, 0x0, 0x92, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_82_r:
	banim_frame_oam 0x0, 0x8000, 0x7C, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0xFC, -32, 8
	banim_frame_oam 0x0, 0x0, 0x1D, 0, -16
	banim_frame_oam 0x0, 0x0, 0x1E, 0, 8
	banim_frame_oam 0x0, 0x4000, 0x3D, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x3F, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x3C, -64, -8
	banim_frame_oam 0x0, 0x0, 0xEC, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_83_r:
	banim_frame_oam 0x8000, 0x8000, 0x20, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x1, -16, -24
	banim_frame_oam 0x0, 0x0, 0x3, 0, -24
	banim_frame_oam 0x8000, 0x8000, 0x22, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_oam 0x8000, 0x0, 0xD3, -64, -8
	banim_frame_oam 0x8000, 0x0, 0xD7, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_84_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -24, 8
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_oam 0x8000, 0x0, 0xD3, -64, -8
	banim_frame_oam 0x8000, 0x0, 0xD7, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_85_r:
	banim_frame_oam 0x0, 0x8000, 0x8, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_oam 0x8000, 0x0, 0xD3, -64, -8
	banim_frame_oam 0x8000, 0x0, 0xD7, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_86_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_oam 0x8000, 0x0, 0xD3, -64, -8
	banim_frame_oam 0x8000, 0x0, 0xD7, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_87_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -24, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -32, -16
	banim_frame_oam 0x8000, 0x0, 0xD9, -32, 0
	banim_frame_oam 0x0, 0x4000, 0xD4, -56, -8
	banim_frame_oam 0x8000, 0x0, 0xD6, -40, -8
	banim_frame_oam 0x8000, 0x0, 0xD3, -64, -8
	banim_frame_oam 0x8000, 0x0, 0xD7, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_88_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x18, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x94, -56, -8
	banim_frame_oam 0x8000, 0x0, 0x96, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x93, -64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x0, 0x93, -64, -8
	banim_frame_oam 0x8000, 0x0, 0x92, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_25_r:
	banim_frame_oam 0x8000, 0x0, 0x3C, -64, -8
	banim_frame_oam 0x0, 0x0, 0xEC, -72, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x0, 0xD3, -64, -8
	banim_frame_oam 0x0, 0x0, 0xD7, -72, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_lorm_sp1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0x0, 0x93, -64, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_55_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_69_r:
	banim_frame_oam 0x4000, 0x8000, 0x60, -8, 0
	banim_frame_oam 0x0, 0x4000, 0x2, -8, -24
	banim_frame_oam 0x8000, 0x0, 0x4, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x42, -8, -8
	banim_frame_oam 0x0, 0x0, 0x44, 8, -8
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -8
	banim_frame_oam 0x4000, 0x0, 0x40, -24, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_57_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x9, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x89, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_58_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xF, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8B, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8F, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_59_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x15, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x95, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_60_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1B, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9B, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_61_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -56, -24
	banim_frame_oam 0x4000, 0x8000, 0xA4, -24, -24
	banim_frame_oam 0x0, 0x4000, 0xA8, 8, -24
	banim_frame_oam 0x4000, 0x8000, 0xAA, -24, -8
	banim_frame_oam 0x8000, 0x0, 0xAE, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xEA, -24, 8
	banim_frame_oam 0x0, 0x0, 0xEE, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_62_r:
	banim_frame_oam 0x4000, 0x8000, 0xAF, -24, -24
	banim_frame_oam 0x8000, 0x0, 0xB3, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xEF, -24, -8
	banim_frame_oam 0x0, 0x0, 0xF3, 8, -8
	banim_frame_oam 0x4000, 0x8000, 0xB5, -24, 0
	banim_frame_oam 0x8000, 0x0, 0xB9, 8, 0
	banim_frame_oam 0x0, 0x0, 0xB4, 16, -24
	banim_frame_end
banim_lorm_sp1_oam_frame_63_r:
	banim_frame_oam 0x0, 0x4000, 0x5D, -24, -16
	banim_frame_oam 0x8000, 0x0, 0x5F, -8, -16
	banim_frame_oam 0x4000, 0x0, 0x9D, -24, 0
	banim_frame_oam 0x0, 0x0, 0x9F, -8, 0
	banim_frame_oam 0x0, 0x4000, 0xBE, 0, -16
	banim_frame_oam 0x4000, 0x0, 0xFE, 0, 0
	banim_frame_oam 0x4000, 0x0, 0xF4, 0, -24
	banim_frame_oam 0x0, 0x0, 0xF6, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xF9, -24, 8
	banim_frame_oam 0x0, 0x0, 0xFD, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_64_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x5, 16, -24
	banim_frame_end
banim_lorm_sp1_oam_frame_65_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0xA, 8, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_66_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x10, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x90, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_67_r:
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x16, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x92, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x96, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_68_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1C, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x98, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9C, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_70_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x84, 0, -24
	banim_frame_oam 0x4000, 0x4000, 0x86, -32, 8
	banim_frame_oam 0x4000, 0x0, 0x8A, 0, 8
	banim_frame_oam 0x8000, 0x0, 0xA6, -40, -16
	banim_frame_end
banim_lorm_sp1_oam_frame_71_r:
	banim_frame_oam 0x4000, 0x8000, 0xA7, -32, -32
	banim_frame_oam 0x8000, 0x0, 0xAB, 0, -32
	banim_frame_oam 0x4000, 0x4000, 0xE7, -32, -16
	banim_frame_oam 0x0, 0x0, 0xEB, 0, -16
	banim_frame_oam 0x4000, 0x8000, 0xAC, -32, -8
	banim_frame_oam 0x0, 0x4000, 0xB0, 0, -8
	banim_frame_oam 0x8000, 0x0, 0xB2, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xF0, 0, 8
	banim_frame_oam 0x0, 0x0, 0xF2, 16, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_72_r:
	banim_frame_oam 0x4000, 0x8000, 0xB4, -16, -32
	banim_frame_oam 0x4000, 0x4000, 0xF4, -16, -16
	banim_frame_oam 0x4000, 0x8000, 0xB8, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xBC, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xF8, -16, 8
	banim_frame_oam 0x0, 0x0, 0xFC, 16, 8
	banim_frame_oam 0x0, 0x4000, 0xBD, -40, -24
	banim_frame_oam 0x8000, 0x0, 0xBF, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xFD, -40, -8
	banim_frame_oam 0x0, 0x0, 0xFF, -24, -8
	banim_frame_end
banim_lorm_sp1_oam_frame_73_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x86, 16, 0
	banim_frame_end
banim_lorm_sp1_oam_frame_74_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x87, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8B, 8, 8
	banim_frame_end
banim_lorm_sp1_oam_frame_56_r:
	banim_frame_oam 0x0, 0x8000, 0x39, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x3D, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0xB9, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xBD, 8, 8
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_lorm_sp1_script:
banim_lorm_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 1, banim_lorm_sp1_oam_frame_1_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 2, banim_lorm_sp1_oam_frame_2_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 3, banim_lorm_sp1_oam_frame_3_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 4, banim_lorm_sp1_oam_frame_4_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_0, 5, banim_lorm_sp1_oam_frame_5_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 6, banim_lorm_sp1_oam_frame_6_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 7, banim_lorm_sp1_oam_frame_7_r - banim_lorm_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 8, banim_lorm_sp1_oam_frame_8_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 9, banim_lorm_sp1_oam_frame_9_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 10, banim_lorm_sp1_oam_frame_10_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 11, banim_lorm_sp1_oam_frame_11_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 12, banim_lorm_sp1_oam_frame_12_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 13, banim_lorm_sp1_oam_frame_13_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 14, banim_lorm_sp1_oam_frame_14_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 15, banim_lorm_sp1_oam_frame_15_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 16, banim_lorm_sp1_oam_frame_16_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 17, banim_lorm_sp1_oam_frame_17_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 18, banim_lorm_sp1_oam_frame_18_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 19, banim_lorm_sp1_oam_frame_19_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 20, banim_lorm_sp1_oam_frame_20_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 21, banim_lorm_sp1_oam_frame_21_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 22, banim_lorm_sp1_oam_frame_22_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 66, banim_lorm_sp1_oam_frame_24_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 67, banim_lorm_sp1_oam_frame_25_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 73, banim_lorm_sp1_oam_frame_27_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_3, 33, banim_lorm_sp1_oam_frame_30_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_3, 34, banim_lorm_sp1_oam_frame_31_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 35, banim_lorm_sp1_oam_frame_32_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 36, banim_lorm_sp1_oam_frame_33_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 37, banim_lorm_sp1_oam_frame_34_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_3, 38, banim_lorm_sp1_oam_frame_35_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 39, banim_lorm_sp1_oam_frame_36_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 40, banim_lorm_sp1_oam_frame_37_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 41, banim_lorm_sp1_oam_frame_38_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 42, banim_lorm_sp1_oam_frame_39_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 43, banim_lorm_sp1_oam_frame_40_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_4, 44, banim_lorm_sp1_oam_frame_41_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_5, 45, banim_lorm_sp1_oam_frame_42_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_5, 46, banim_lorm_sp1_oam_frame_43_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lorm_sp1_sheet_5, 47, banim_lorm_sp1_oam_frame_44_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_5, 48, banim_lorm_sp1_oam_frame_45_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_5, 49, banim_lorm_sp1_oam_frame_46_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 50, banim_lorm_sp1_oam_frame_47_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 51, banim_lorm_sp1_oam_frame_48_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 52, banim_lorm_sp1_oam_frame_49_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 53, banim_lorm_sp1_oam_frame_50_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 54, banim_lorm_sp1_oam_frame_51_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_7, 55, banim_lorm_sp1_oam_frame_52_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_7, 56, banim_lorm_sp1_oam_frame_53_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_7, 57, banim_lorm_sp1_oam_frame_54_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 54, banim_lorm_sp1_oam_frame_51_r - banim_lorm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 8, banim_lorm_sp1_oam_frame_8_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 9, banim_lorm_sp1_oam_frame_9_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 10, banim_lorm_sp1_oam_frame_10_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 11, banim_lorm_sp1_oam_frame_11_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 12, banim_lorm_sp1_oam_frame_12_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 13, banim_lorm_sp1_oam_frame_13_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 14, banim_lorm_sp1_oam_frame_14_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 15, banim_lorm_sp1_oam_frame_15_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 16, banim_lorm_sp1_oam_frame_16_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 17, banim_lorm_sp1_oam_frame_17_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 18, banim_lorm_sp1_oam_frame_18_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 19, banim_lorm_sp1_oam_frame_19_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 20, banim_lorm_sp1_oam_frame_20_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 21, banim_lorm_sp1_oam_frame_21_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 22, banim_lorm_sp1_oam_frame_22_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_3, 74, banim_lorm_sp1_oam_frame_23_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_6, 77, banim_lorm_sp1_oam_frame_55_r - banim_lorm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 66, banim_lorm_sp1_oam_frame_24_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 67, banim_lorm_sp1_oam_frame_25_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 68, banim_lorm_sp1_oam_frame_26_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 73, banim_lorm_sp1_oam_frame_27_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 75, banim_lorm_sp1_oam_frame_28_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 76, banim_lorm_sp1_oam_frame_29_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 79, banim_lorm_sp1_oam_frame_57_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_9, 80, banim_lorm_sp1_oam_frame_58_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_9, 81, banim_lorm_sp1_oam_frame_59_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 82, banim_lorm_sp1_oam_frame_60_r - banim_lorm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 83, banim_lorm_sp1_oam_frame_61_r - banim_lorm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 84, banim_lorm_sp1_oam_frame_62_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 85, banim_lorm_sp1_oam_frame_63_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 86, banim_lorm_sp1_oam_frame_64_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 87, banim_lorm_sp1_oam_frame_65_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 88, banim_lorm_sp1_oam_frame_66_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 89, banim_lorm_sp1_oam_frame_67_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 90, banim_lorm_sp1_oam_frame_68_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 79, banim_lorm_sp1_oam_frame_57_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_9, 78, banim_lorm_sp1_oam_frame_69_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 91, banim_lorm_sp1_oam_frame_70_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 92, banim_lorm_sp1_oam_frame_71_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 93, banim_lorm_sp1_oam_frame_72_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_11, 94, banim_lorm_sp1_oam_frame_73_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 91, banim_lorm_sp1_oam_frame_70_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 92, banim_lorm_sp1_oam_frame_71_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_10, 93, banim_lorm_sp1_oam_frame_72_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_11, 94, banim_lorm_sp1_oam_frame_73_r - banim_lorm_sp1_oam_r
	banim_code_frame 20, banim_lorm_sp1_sheet_11, 95, banim_lorm_sp1_oam_frame_74_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 79, banim_lorm_sp1_oam_frame_57_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_9, 80, banim_lorm_sp1_oam_frame_58_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_9, 81, banim_lorm_sp1_oam_frame_59_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 82, banim_lorm_sp1_oam_frame_60_r - banim_lorm_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 83, banim_lorm_sp1_oam_frame_61_r - banim_lorm_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 84, banim_lorm_sp1_oam_frame_62_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 85, banim_lorm_sp1_oam_frame_63_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 86, banim_lorm_sp1_oam_frame_64_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 87, banim_lorm_sp1_oam_frame_65_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 88, banim_lorm_sp1_oam_frame_66_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 89, banim_lorm_sp1_oam_frame_67_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_10, 90, banim_lorm_sp1_oam_frame_68_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_9, 79, banim_lorm_sp1_oam_frame_57_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_9, 78, banim_lorm_sp1_oam_frame_69_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 23, banim_lorm_sp1_oam_frame_75_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 24, banim_lorm_sp1_oam_frame_76_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_2, 25, banim_lorm_sp1_oam_frame_77_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 24, banim_lorm_sp1_oam_frame_76_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 23, banim_lorm_sp1_oam_frame_75_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 26, banim_lorm_sp1_oam_frame_78_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 27, banim_lorm_sp1_oam_frame_79_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 28, banim_lorm_sp1_oam_frame_80_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 27, banim_lorm_sp1_oam_frame_79_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_2, 26, banim_lorm_sp1_oam_frame_78_r - banim_lorm_sp1_oam_r
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_lorm_sp1_mode_stand_close:
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_mode_stand:
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_mode_stand_range:
	banim_code_frame 1, banim_lorm_sp1_sheet_8, 96, banim_lorm_sp1_oam_frame_56_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_lorm_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_lorm_sp1_sheet_0, 0, banim_lorm_sp1_oam_frame_0_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 1, banim_lorm_sp1_oam_frame_1_r - banim_lorm_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 2, banim_lorm_sp1_oam_frame_2_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 3, banim_lorm_sp1_oam_frame_3_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 4, banim_lorm_sp1_oam_frame_4_r - banim_lorm_sp1_oam_r
	banim_code_frame 15, banim_lorm_sp1_sheet_0, 5, banim_lorm_sp1_oam_frame_5_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 6, banim_lorm_sp1_oam_frame_6_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 7, banim_lorm_sp1_oam_frame_7_r - banim_lorm_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_lorm_sp1_sheet_0, 58, banim_lorm_sp1_oam_frame_81_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_0, 59, banim_lorm_sp1_oam_frame_82_r - banim_lorm_sp1_oam_r
	banim_code_frame 6, banim_lorm_sp1_sheet_1, 60, banim_lorm_sp1_oam_frame_83_r - banim_lorm_sp1_oam_r
	banim_code_frame 5, banim_lorm_sp1_sheet_1, 61, banim_lorm_sp1_oam_frame_84_r - banim_lorm_sp1_oam_r
	banim_code_frame 4, banim_lorm_sp1_sheet_1, 62, banim_lorm_sp1_oam_frame_85_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 63, banim_lorm_sp1_oam_frame_86_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 64, banim_lorm_sp1_oam_frame_87_r - banim_lorm_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 65, banim_lorm_sp1_oam_frame_88_r - banim_lorm_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 16, banim_lorm_sp1_oam_frame_16_r - banim_lorm_sp1_oam_r
	banim_code_frame 2, banim_lorm_sp1_sheet_1, 17, banim_lorm_sp1_oam_frame_17_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 18, banim_lorm_sp1_oam_frame_18_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_1, 19, banim_lorm_sp1_oam_frame_19_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 20, banim_lorm_sp1_oam_frame_20_r - banim_lorm_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 21, banim_lorm_sp1_oam_frame_21_r - banim_lorm_sp1_oam_r
	banim_code_frame 3, banim_lorm_sp1_sheet_2, 22, banim_lorm_sp1_oam_frame_22_r - banim_lorm_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_lorm_sp1_mode_attack_close - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_attack_close_back - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_attack_close_critical - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_attack_close_critical_back - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_attack_range - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_attack_range_critical - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_dodge_close - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_dodge_range - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_stand_close - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_stand - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_stand_range - banim_lorm_sp1_script
	.word banim_lorm_sp1_mode_attack_miss - banim_lorm_sp1_script
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

