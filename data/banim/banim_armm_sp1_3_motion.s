@ vim:ft=armv4
	.global banim_armm_sp1_3_script
	.global banim_armm_sp1_3_oam_r
	.global banim_armm_sp1_3_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x41
	.section .data.oam_l
banim_armm_sp1_3_oam_l:
banim_armm_sp1_3_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x81, -22, -16
	banim_frame_oam 0x4000, 0x5000, 0x61, -22, -24
	banim_frame_oam 0x8000, 0x5000, 0x80, 10, -16
	banim_frame_oam 0x0, 0x1000, 0x60, -30, -22
	banim_frame_oam 0x0, 0x5000, 0x20, 18, 0
	banim_frame_end
banim_armm_sp1_3_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x85, -21, -16
	banim_frame_oam 0x4000, 0x5000, 0x65, -21, -24
	banim_frame_oam 0x4000, 0x1000, 0x0, -35, -9
	banim_frame_oam 0x0, 0x1000, 0x23, 11, -16
	banim_frame_oam 0x4000, 0x1000, 0x42, 11, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x69, -15, -24
	banim_frame_oam 0x4000, 0x1000, 0x0, -31, -11
	banim_frame_oam 0x4000, 0x1000, 0x42, 14, -10
	banim_frame_oam 0x4000, 0x1000, 0xE9, 1, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, -7, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x6D, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x0, -12, -9
	banim_frame_oam 0x4000, 0x1000, 0x0, -28, -9
	banim_frame_oam 0x4000, 0x1000, 0x42, 17, -8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xF0, -8, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0x71, -8, -24
	banim_frame_oam 0x0, 0x1000, 0x0, -12, -9
	banim_frame_oam 0x4000, 0x1000, 0x0, -28, -9
	banim_frame_oam 0x4000, 0x1000, 0x42, 17, -8
	banim_frame_oam 0x4000, 0x1000, 0xEE, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xF0, -8, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x75, -7, -24
	banim_frame_oam 0x0, 0x1000, 0x0, -10, -10
	banim_frame_oam 0x4000, 0x1000, 0x0, -26, -10
	banim_frame_oam 0x4000, 0x1000, 0x42, 19, -9
	banim_frame_oam 0x4000, 0x1000, 0xF6, 1, 8
	banim_frame_oam 0x0, 0x1000, 0xF8, -7, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x79, 3, -23
	banim_frame_oam 0x4000, 0x1000, 0x42, 28, -9
	banim_frame_oam 0x0, 0x1000, 0x0, -1, -10
	banim_frame_oam 0x4000, 0x1000, 0x0, -17, -10
	banim_frame_oam 0x4000, 0x1000, 0xFA, 11, 9
	banim_frame_oam 0x0, 0x1000, 0xFC, 3, 9
	banim_frame_end
banim_armm_sp1_3_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0x24, 13, -16
	banim_frame_oam 0x0, 0x5000, 0x28, -3, -16
	banim_frame_oam 0x4000, 0x9000, 0x2A, 3, 0
	banim_frame_oam 0x0, 0x1000, 0xB, -5, 0
	banim_frame_oam 0x0, 0x1000, 0x9, -11, -16
	banim_frame_oam 0x0, 0x1000, 0xA, -11, -8
	banim_frame_oam 0x0, 0x1000, 0x4, 45, -7
	banim_frame_oam 0x4000, 0x5000, 0x5, 5, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 48, -7
	banim_frame_end
banim_armm_sp1_3_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -6, -15
	banim_frame_oam 0x0, 0x1000, 0xE, -14, -15
	banim_frame_oam 0x4000, 0x1000, 0x13, -8, -7
	banim_frame_oam 0x4000, 0x1000, 0x15, -6, 1
	banim_frame_oam 0x4000, 0x9000, 0x2F, 4, -16
	banim_frame_oam 0x4000, 0x5000, 0xF, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0x2E, 36, -16
	banim_frame_oam 0x0, 0x1000, 0x4, 44, -7
	banim_frame_oam 0x0, 0x1000, 0x3, 48, -7
	banim_frame_oam 0x4000, 0x5000, 0x33, 3, 0
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -6, -16
	banim_frame_oam 0x0, 0x1000, 0xE, -14, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x15, -6, 0
	banim_frame_oam 0x4000, 0x9000, 0x37, 4, -16
	banim_frame_oam 0x4000, 0x5000, 0x17, 4, -24
	banim_frame_oam 0x4000, 0x5000, 0x53, 4, 0
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x22, 36, -16
	banim_frame_oam 0x0, 0x1000, 0x4E, 36, -8
	banim_frame_oam 0x0, 0x1000, 0x4, 44, -7
	banim_frame_oam 0x0, 0x1000, 0x3, 48, -7
	banim_frame_end
banim_armm_sp1_3_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -6, -16
	banim_frame_oam 0x0, 0x1000, 0xE, -14, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x15, -6, 0
	banim_frame_oam 0x4000, 0x5000, 0x53, 4, 0
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x4E, 36, -8
	banim_frame_oam 0x0, 0x1000, 0x4, 44, -7
	banim_frame_oam 0x0, 0x1000, 0x3, 48, -7
	banim_frame_oam 0x0, 0x5000, 0x39, 4, -16
	banim_frame_oam 0x4000, 0x1000, 0x19, 4, -24
	banim_frame_oam 0x0, 0x5000, 0x3B, 20, -16
	banim_frame_oam 0x4000, 0x1000, 0x1B, 20, -24
	banim_frame_oam 0x0, 0x1000, 0xF9, 36, -16
	banim_frame_end
banim_armm_sp1_3_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -8, -15
	banim_frame_oam 0x0, 0x1000, 0xE, -16, -15
	banim_frame_oam 0x4000, 0x1000, 0x13, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0x15, -8, 1
	banim_frame_oam 0x8000, 0x9000, 0x1D, 20, -24
	banim_frame_oam 0x8000, 0x9000, 0x9D, 4, -24
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_oam 0x4000, 0x1000, 0x42, 36, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, -4, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0xEC, -6, -7
	banim_frame_oam 0x4000, 0x0, 0xC, -1, -13
	banim_frame_oam 0x0, 0x0, 0xE, 15, -13
	banim_frame_oam 0x4000, 0x0, 0x13, 1, -5
	banim_frame_oam 0x4000, 0x0, 0x15, -1, 3
	banim_frame_oam 0x4000, 0x1000, 0x42, 32, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 27, -9
	banim_frame_oam 0x8000, 0x9000, 0x1D, 20, -24
	banim_frame_oam 0x8000, 0x9000, 0x9D, 4, -24
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x1, -14, -9
	banim_frame_end
banim_armm_sp1_3_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x1000, 0xEC, -7, -7
	banim_frame_oam 0x4000, 0x0, 0xC, -2, -13
	banim_frame_oam 0x0, 0x0, 0xE, 14, -13
	banim_frame_oam 0x4000, 0x0, 0x13, 0, -5
	banim_frame_oam 0x4000, 0x0, 0x15, -2, 3
	banim_frame_oam 0x4000, 0x1000, 0x42, 33, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 27, -9
	banim_frame_oam 0x8000, 0x9000, 0x1D, 20, -24
	banim_frame_oam 0x8000, 0x9000, 0x9D, 4, -24
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x1, -13, -9
	banim_frame_end
banim_armm_sp1_3_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x0, 0xC, 4, -13
	banim_frame_oam 0x0, 0x0, 0xE, 20, -13
	banim_frame_oam 0x4000, 0x0, 0x13, 6, -5
	banim_frame_oam 0x4000, 0x0, 0x15, 4, 3
	banim_frame_oam 0x4000, 0x1000, 0x42, 30, -8
	banim_frame_oam 0x0, 0x1000, 0x0, 24, -9
	banim_frame_oam 0x4000, 0x1000, 0x4A, 19, 8
	banim_frame_oam 0x8000, 0x5000, 0x1F, 9, -16
	banim_frame_oam 0x8000, 0x5000, 0x9F, 1, -16
	banim_frame_oam 0x4000, 0x1000, 0x9D, 1, -24
	banim_frame_oam 0x0, 0x1000, 0xF4, -7, -16
	banim_frame_oam 0x4000, 0x1000, 0x0, -15, -9
	banim_frame_oam 0x0, 0x5000, 0x1D, 17, -24
	banim_frame_oam 0x4000, 0x1000, 0x5D, 17, -8
	banim_frame_oam 0x4000, 0x1000, 0xF1, 19, 0
	banim_frame_oam 0x0, 0x1000, 0xF3, 16, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x9000, 0x24, 13, -16
	banim_frame_oam 0x0, 0x5000, 0x28, -3, -16
	banim_frame_oam 0x4000, 0x9000, 0x2A, 3, 0
	banim_frame_oam 0x0, 0x1000, 0xB, -5, 0
	banim_frame_oam 0x0, 0x1000, 0x9, -11, -16
	banim_frame_oam 0x0, 0x1000, 0xA, -11, -8
	banim_frame_oam 0x0, 0x1000, 0x4, 45, -7
	banim_frame_oam 0x4000, 0x5000, 0x5, 5, -24
	banim_frame_oam 0x0, 0x1000, 0x3, 48, -7
	banim_frame_oam 0x4000, 0x1000, 0x42, 56, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -6, -15
	banim_frame_oam 0x0, 0x1000, 0xE, -14, -15
	banim_frame_oam 0x4000, 0x1000, 0x13, -8, -7
	banim_frame_oam 0x4000, 0x1000, 0x15, -6, 1
	banim_frame_oam 0x4000, 0x9000, 0x2F, 4, -16
	banim_frame_oam 0x4000, 0x5000, 0xF, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0x2E, 36, -16
	banim_frame_oam 0x0, 0x1000, 0x4, 44, -7
	banim_frame_oam 0x0, 0x1000, 0x3, 48, -7
	banim_frame_oam 0x4000, 0x5000, 0x33, 3, 0
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_oam 0x4000, 0x1000, 0x42, 55, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -6, -16
	banim_frame_oam 0x0, 0x1000, 0xE, -14, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x15, -6, 0
	banim_frame_oam 0x4000, 0x9000, 0x37, 4, -16
	banim_frame_oam 0x4000, 0x5000, 0x17, 4, -24
	banim_frame_oam 0x4000, 0x5000, 0x53, 4, 0
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x22, 36, -16
	banim_frame_oam 0x0, 0x1000, 0x4E, 36, -8
	banim_frame_oam 0x0, 0x1000, 0x4, 44, -7
	banim_frame_oam 0x0, 0x1000, 0x3, 48, -7
	banim_frame_oam 0x4000, 0x1000, 0x42, 55, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x1000, 0xC, -6, -16
	banim_frame_oam 0x0, 0x1000, 0xE, -14, -16
	banim_frame_oam 0x4000, 0x1000, 0x13, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0x15, -6, 0
	banim_frame_oam 0x4000, 0x5000, 0x53, 4, 0
	banim_frame_oam 0x4000, 0x5000, 0x4A, 3, 8
	banim_frame_oam 0x0, 0x1000, 0x4E, 36, -8
	banim_frame_oam 0x0, 0x1000, 0x4, 44, -7
	banim_frame_oam 0x0, 0x1000, 0x3, 48, -7
	banim_frame_oam 0x0, 0x5000, 0x39, 4, -16
	banim_frame_oam 0x4000, 0x1000, 0x19, 4, -24
	banim_frame_oam 0x0, 0x5000, 0x3B, 20, -16
	banim_frame_oam 0x4000, 0x1000, 0x1B, 20, -24
	banim_frame_oam 0x0, 0x1000, 0xF9, 36, -16
	banim_frame_oam 0x4000, 0x1000, 0x42, 55, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_17_l:
	banim_frame_oam 0x0, 0x9000, 0x60, -22, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -22, 8
	banim_frame_oam 0x4000, 0x1000, 0x41, -14, -32
	banim_frame_oam 0x0, 0x1000, 0x22, -14, -40
	banim_frame_oam 0x0, 0x1000, 0x21, -14, -48
	banim_frame_oam 0x8000, 0x1000, 0x20, 10, -18
	banim_frame_oam 0x4000, 0x1000, 0x0, 18, -6
	banim_frame_end
banim_armm_sp1_3_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, -18, -63
	banim_frame_oam 0x0, 0x1000, 0x89, -18, -31
	banim_frame_oam 0x8000, 0x1000, 0xC8, -2, -47
	banim_frame_oam 0x0, 0x1000, 0x88, -2, -63
	banim_frame_oam 0x0, 0x1000, 0xA8, 6, -56
	banim_frame_oam 0x8000, 0x1000, 0xC9, 7, -20
	banim_frame_oam 0x0, 0x9000, 0x44, -23, -30
	banim_frame_oam 0x0, 0x5000, 0xC5, -15, 2
	banim_frame_oam 0x8000, 0x1000, 0xC7, -23, 2
	banim_frame_oam 0x0, 0x1000, 0xC4, -1, -38
	banim_frame_oam 0x0, 0x1000, 0xE4, -31, 2
	banim_frame_oam 0x0, 0x5000, 0x4, -39, -14
	banim_frame_end
banim_armm_sp1_3_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0x44, -23, -30
	banim_frame_oam 0x0, 0x5000, 0xC5, -15, 2
	banim_frame_oam 0x8000, 0x1000, 0xC7, -23, 2
	banim_frame_oam 0x0, 0x1000, 0xC4, -1, -38
	banim_frame_oam 0x0, 0x1000, 0xE4, -31, 2
	banim_frame_oam 0x0, 0x5000, 0x4, -39, -14
	banim_frame_oam 0x0, 0x5000, 0xA, 10, -42
	banim_frame_oam 0x8000, 0x1000, 0x4A, 24, -26
	banim_frame_oam 0x0, 0x1000, 0x6B, 12, -50
	banim_frame_oam 0x0, 0x1000, 0x4B, 10, -58
	banim_frame_oam 0x0, 0x1000, 0xA9, 2, -34
	banim_frame_oam 0x4000, 0x2000, 0xEA, -21, -26
	banim_frame_end
banim_armm_sp1_3_oam_frame_20_l:
	banim_frame_oam 0x8000, 0xA000, 0x8, 11, -24
	banim_frame_oam 0x0, 0x2000, 0x89, 19, -32
	banim_frame_oam 0x8000, 0x2000, 0xC8, 3, -24
	banim_frame_oam 0x0, 0x2000, 0x88, 3, 0
	banim_frame_oam 0x0, 0x2000, 0xA8, -5, -7
	banim_frame_oam 0x8000, 0x2000, 0xC9, -6, -51
	banim_frame_oam 0x0, 0x9000, 0x44, -23, -30
	banim_frame_oam 0x0, 0x5000, 0xC5, -15, 2
	banim_frame_oam 0x8000, 0x1000, 0xC7, -23, 2
	banim_frame_oam 0x0, 0x1000, 0xC4, -1, -38
	banim_frame_oam 0x0, 0x1000, 0xE4, -31, 2
	banim_frame_oam 0x0, 0x5000, 0x4, -39, -14
	banim_frame_end
banim_armm_sp1_3_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0xCA, -12, -17
	banim_frame_oam 0x0, 0x1000, 0xCB, -16, -25
	banim_frame_oam 0x8000, 0x1000, 0x8B, -20, -41
	banim_frame_oam 0x0, 0x1000, 0xAA, -20, -49
	banim_frame_oam 0x0, 0x1000, 0x8A, -8, -9
	banim_frame_oam 0x0, 0x9000, 0x44, -23, -30
	banim_frame_oam 0x0, 0x5000, 0xC5, -15, 2
	banim_frame_oam 0x8000, 0x1000, 0xC7, -23, 2
	banim_frame_oam 0x0, 0x1000, 0xC4, -1, -38
	banim_frame_oam 0x0, 0x1000, 0xE4, -31, 2
	banim_frame_oam 0x0, 0x5000, 0x4, -39, -14
	banim_frame_oam 0x4000, 0x1000, 0xEA, 4, -38
	banim_frame_end
banim_armm_sp1_3_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -22, -24
	banim_frame_oam 0x4000, 0x1000, 0x8E, -22, 8
	banim_frame_oam 0x4000, 0x1000, 0xAE, -6, 8
	banim_frame_oam 0x8000, 0x1000, 0x8D, 10, -16
	banim_frame_oam 0x8000, 0x5000, 0x8C, 34, -23
	banim_frame_oam 0x4000, 0x1000, 0xCD, 18, -5
	banim_frame_oam 0x8000, 0x1000, 0xCF, 26, -31
	banim_frame_oam 0x0, 0x1000, 0xED, 24, -39
	banim_frame_oam 0x0, 0x1000, 0xEE, 24, -47
	banim_frame_end
banim_armm_sp1_3_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x70, -17, -24
	banim_frame_oam 0x4000, 0x5000, 0xF0, -17, 8
	banim_frame_oam 0x0, 0x1000, 0x52, -23, -30
	banim_frame_oam 0x0, 0x1000, 0x53, -24, -17
	banim_frame_oam 0x0, 0x5000, 0x30, 15, 0
	banim_frame_end
banim_armm_sp1_3_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x74, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0xF4, -20, 8
	banim_frame_oam 0x8000, 0x1000, 0x36, -28, -24
	banim_frame_oam 0x0, 0x5000, 0x34, 12, -4
	banim_frame_oam 0x0, 0x1000, 0x57, 28, 4
	banim_frame_end
banim_armm_sp1_3_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x60, -25, -25
	banim_frame_oam 0x4000, 0x5000, 0xE0, -25, 7
	banim_frame_oam 0x4000, 0x1000, 0x40, 7, -8
	banim_frame_oam 0x4000, 0x1000, 0x42, -41, -9
	banim_frame_end
banim_armm_sp1_3_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x84, -33, -23
	banim_frame_oam 0x4000, 0x1000, 0x42, -48, -9
	banim_frame_oam 0x4000, 0x1000, 0x40, -1, -8
	banim_frame_oam 0x4000, 0x1000, 0x2, -17, -31
	banim_frame_oam 0x4000, 0x1000, 0x22, -17, 9
	banim_frame_oam 0x0, 0x1000, 0x24, -25, 9
	banim_frame_end
banim_armm_sp1_3_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0x0, -25, -10
	banim_frame_oam 0x0, 0x9000, 0x84, -33, -23
	banim_frame_oam 0x4000, 0x1000, 0x42, -48, -9
	banim_frame_oam 0x4000, 0x1000, 0x40, -1, -8
	banim_frame_oam 0x4000, 0x1000, 0x2, -17, -31
	banim_frame_oam 0x4000, 0x1000, 0x22, -17, 9
	banim_frame_oam 0x0, 0x1000, 0x24, -25, 9
	banim_frame_end
banim_armm_sp1_3_oam_frame_28_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -33, -23
	banim_frame_oam 0x4000, 0x1000, 0x22, -17, 9
	banim_frame_oam 0x0, 0x1000, 0x24, -25, 9
	banim_frame_oam 0x4000, 0x1000, 0x42, -48, -9
	banim_frame_oam 0x4000, 0x1000, 0x40, -1, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x88, -18, -23
	banim_frame_oam 0x8000, 0x1000, 0x44, 14, -17
	banim_frame_oam 0x0, 0x1000, 0x4, 0, -31
	banim_frame_oam 0x4000, 0x1000, 0x9, -1, 9
	banim_frame_oam 0x4000, 0x1000, 0x29, -17, 9
	banim_frame_end
banim_armm_sp1_3_oam_frame_30_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -17, -23
	banim_frame_oam 0x4000, 0x1000, 0x8C, 0, 9
	banim_frame_oam 0x4000, 0x1000, 0xAC, -16, 9
	banim_frame_oam 0x0, 0x5000, 0x49, 15, -16
	banim_frame_end
banim_armm_sp1_3_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x8E, -17, -24
	banim_frame_oam 0x8000, 0x1000, 0xB2, -25, -16
	banim_frame_oam 0x0, 0x1000, 0xF2, -25, 0
	banim_frame_oam 0x4000, 0x1000, 0xCC, -1, 8
	banim_frame_oam 0x4000, 0x1000, 0xEC, -17, 8
	banim_frame_oam 0x0, 0x1000, 0x92, -25, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_32_l:
	banim_frame_oam 0x0, 0x9000, 0x98, -18, -28
	banim_frame_oam 0x4000, 0x1000, 0x58, -2, 4
	banim_frame_oam 0x4000, 0x1000, 0x78, -18, 4
	banim_frame_oam 0x8000, 0x5000, 0x1A, -26, -20
	banim_frame_oam 0x0, 0x5000, 0x18, 14, -26
	banim_frame_oam 0x0, 0x1000, 0x1C, -26, -28
	banim_frame_oam 0x4000, 0x1000, 0x3B, 14, 4
	banim_frame_oam 0x0, 0x1000, 0x1B, 14, -10
	banim_frame_end
banim_armm_sp1_3_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x7C, -19, -27
	banim_frame_oam 0x4000, 0x5000, 0xFC, -19, 5
	banim_frame_oam 0x0, 0x1000, 0x5E, 13, -19
	banim_frame_oam 0x0, 0x1000, 0x5C, 29, -27
	banim_frame_oam 0x0, 0x1000, 0x5D, 21, -23
	banim_frame_oam 0x8000, 0x1000, 0x5B, -27, -11
	banim_frame_end
banim_armm_sp1_3_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x1000, 0x42, 72, -8
	banim_frame_oam 0x4000, 0x1000, 0x2, 56, -7
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_armm_sp1_3_oam_frame_15_l:
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
banim_armm_sp1_3_oam_r:
banim_armm_sp1_3_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x81, -10, -16
	banim_frame_oam 0x4000, 0x4000, 0x61, -10, -24
	banim_frame_oam 0x8000, 0x4000, 0x80, -18, -16
	banim_frame_oam 0x0, 0x0, 0x60, 22, -22
	banim_frame_oam 0x0, 0x4000, 0x20, -34, 0
	banim_frame_end
banim_armm_sp1_3_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x85, -11, -16
	banim_frame_oam 0x4000, 0x4000, 0x65, -11, -24
	banim_frame_oam 0x4000, 0x0, 0x0, 19, -9
	banim_frame_oam 0x0, 0x0, 0x23, -19, -16
	banim_frame_oam 0x4000, 0x0, 0x42, -27, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x69, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x0, 15, -11
	banim_frame_oam 0x4000, 0x0, 0x42, -30, -10
	banim_frame_oam 0x4000, 0x0, 0xE9, -17, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -1, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x6D, -24, -24
	banim_frame_oam 0x0, 0x0, 0x0, 4, -9
	banim_frame_oam 0x4000, 0x0, 0x0, 12, -9
	banim_frame_oam 0x4000, 0x0, 0x42, -33, -8
	banim_frame_oam 0x4000, 0x0, 0xEE, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF0, 0, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0x71, -24, -24
	banim_frame_oam 0x0, 0x0, 0x0, 4, -9
	banim_frame_oam 0x4000, 0x0, 0x0, 12, -9
	banim_frame_oam 0x4000, 0x0, 0x42, -33, -8
	banim_frame_oam 0x4000, 0x0, 0xEE, -16, 8
	banim_frame_oam 0x0, 0x0, 0xF0, 0, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x75, -25, -24
	banim_frame_oam 0x0, 0x0, 0x0, 2, -10
	banim_frame_oam 0x4000, 0x0, 0x0, 10, -10
	banim_frame_oam 0x4000, 0x0, 0x42, -35, -9
	banim_frame_oam 0x4000, 0x0, 0xF6, -17, 8
	banim_frame_oam 0x0, 0x0, 0xF8, -1, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x79, -35, -23
	banim_frame_oam 0x4000, 0x0, 0x42, -44, -9
	banim_frame_oam 0x0, 0x0, 0x0, -7, -10
	banim_frame_oam 0x4000, 0x0, 0x0, 1, -10
	banim_frame_oam 0x4000, 0x0, 0xFA, -27, 9
	banim_frame_oam 0x0, 0x0, 0xFC, -11, 9
	banim_frame_end
banim_armm_sp1_3_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0x24, -45, -16
	banim_frame_oam 0x0, 0x4000, 0x28, -13, -16
	banim_frame_oam 0x4000, 0x8000, 0x2A, -35, 0
	banim_frame_oam 0x0, 0x0, 0xB, -3, 0
	banim_frame_oam 0x0, 0x0, 0x9, 3, -16
	banim_frame_oam 0x0, 0x0, 0xA, 3, -8
	banim_frame_oam 0x0, 0x0, 0x4, -53, -7
	banim_frame_oam 0x4000, 0x4000, 0x5, -37, -24
	banim_frame_oam 0x0, 0x0, 0x3, -56, -7
	banim_frame_end
banim_armm_sp1_3_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -10, -15
	banim_frame_oam 0x0, 0x0, 0xE, 6, -15
	banim_frame_oam 0x4000, 0x0, 0x13, -8, -7
	banim_frame_oam 0x4000, 0x0, 0x15, -10, 1
	banim_frame_oam 0x4000, 0x8000, 0x2F, -36, -16
	banim_frame_oam 0x4000, 0x4000, 0xF, -36, -24
	banim_frame_oam 0x8000, 0x0, 0x2E, -44, -16
	banim_frame_oam 0x0, 0x0, 0x4, -52, -7
	banim_frame_oam 0x0, 0x0, 0x3, -56, -7
	banim_frame_oam 0x4000, 0x4000, 0x33, -35, 0
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -10, -16
	banim_frame_oam 0x0, 0x0, 0xE, 6, -16
	banim_frame_oam 0x4000, 0x0, 0x13, -8, -8
	banim_frame_oam 0x4000, 0x0, 0x15, -10, 0
	banim_frame_oam 0x4000, 0x8000, 0x37, -36, -16
	banim_frame_oam 0x4000, 0x4000, 0x17, -36, -24
	banim_frame_oam 0x4000, 0x4000, 0x53, -36, 0
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_oam 0x0, 0x0, 0x22, -44, -16
	banim_frame_oam 0x0, 0x0, 0x4E, -44, -8
	banim_frame_oam 0x0, 0x0, 0x4, -52, -7
	banim_frame_oam 0x0, 0x0, 0x3, -56, -7
	banim_frame_end
banim_armm_sp1_3_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -10, -16
	banim_frame_oam 0x0, 0x0, 0xE, 6, -16
	banim_frame_oam 0x4000, 0x0, 0x13, -8, -8
	banim_frame_oam 0x4000, 0x0, 0x15, -10, 0
	banim_frame_oam 0x4000, 0x4000, 0x53, -36, 0
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_oam 0x0, 0x0, 0x4E, -44, -8
	banim_frame_oam 0x0, 0x0, 0x4, -52, -7
	banim_frame_oam 0x0, 0x0, 0x3, -56, -7
	banim_frame_oam 0x0, 0x4000, 0x39, -20, -16
	banim_frame_oam 0x4000, 0x0, 0x19, -20, -24
	banim_frame_oam 0x0, 0x4000, 0x3B, -36, -16
	banim_frame_oam 0x4000, 0x0, 0x1B, -36, -24
	banim_frame_oam 0x0, 0x0, 0xF9, -44, -16
	banim_frame_end
banim_armm_sp1_3_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -8, -15
	banim_frame_oam 0x0, 0x0, 0xE, 8, -15
	banim_frame_oam 0x4000, 0x0, 0x13, -6, -7
	banim_frame_oam 0x4000, 0x0, 0x15, -8, 1
	banim_frame_oam 0x8000, 0x8000, 0x1D, -36, -24
	banim_frame_oam 0x8000, 0x8000, 0x9D, -20, -24
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_oam 0x4000, 0x0, 0x42, -52, -8
	banim_frame_oam 0x0, 0x0, 0xF5, -4, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0xEC, -10, -7
	banim_frame_oam 0x4000, 0x1000, 0xC, -15, -13
	banim_frame_oam 0x0, 0x1000, 0xE, -23, -13
	banim_frame_oam 0x4000, 0x1000, 0x13, -17, -5
	banim_frame_oam 0x4000, 0x1000, 0x15, -15, 3
	banim_frame_oam 0x4000, 0x0, 0x42, -48, -8
	banim_frame_oam 0x0, 0x0, 0x0, -35, -9
	banim_frame_oam 0x8000, 0x8000, 0x1D, -36, -24
	banim_frame_oam 0x8000, 0x8000, 0x9D, -20, -24
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_oam 0x0, 0x0, 0x1, 6, -9
	banim_frame_end
banim_armm_sp1_3_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x0, 0xEC, -9, -7
	banim_frame_oam 0x4000, 0x1000, 0xC, -14, -13
	banim_frame_oam 0x0, 0x1000, 0xE, -22, -13
	banim_frame_oam 0x4000, 0x1000, 0x13, -16, -5
	banim_frame_oam 0x4000, 0x1000, 0x15, -14, 3
	banim_frame_oam 0x4000, 0x0, 0x42, -49, -8
	banim_frame_oam 0x0, 0x0, 0x0, -35, -9
	banim_frame_oam 0x8000, 0x8000, 0x1D, -36, -24
	banim_frame_oam 0x8000, 0x8000, 0x9D, -20, -24
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_oam 0x0, 0x0, 0x1, 5, -9
	banim_frame_end
banim_armm_sp1_3_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x1000, 0xC, -20, -13
	banim_frame_oam 0x0, 0x1000, 0xE, -28, -13
	banim_frame_oam 0x4000, 0x1000, 0x13, -22, -5
	banim_frame_oam 0x4000, 0x1000, 0x15, -20, 3
	banim_frame_oam 0x4000, 0x0, 0x42, -46, -8
	banim_frame_oam 0x0, 0x0, 0x0, -32, -9
	banim_frame_oam 0x4000, 0x0, 0x4A, -35, 8
	banim_frame_oam 0x8000, 0x4000, 0x1F, -17, -16
	banim_frame_oam 0x8000, 0x4000, 0x9F, -9, -16
	banim_frame_oam 0x4000, 0x0, 0x9D, -17, -24
	banim_frame_oam 0x0, 0x0, 0xF4, -1, -16
	banim_frame_oam 0x4000, 0x0, 0x0, -1, -9
	banim_frame_oam 0x0, 0x4000, 0x1D, -33, -24
	banim_frame_oam 0x4000, 0x0, 0x5D, -33, -8
	banim_frame_oam 0x4000, 0x0, 0xF1, -35, 0
	banim_frame_oam 0x0, 0x0, 0xF3, -24, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x8000, 0x24, -45, -16
	banim_frame_oam 0x0, 0x4000, 0x28, -13, -16
	banim_frame_oam 0x4000, 0x8000, 0x2A, -35, 0
	banim_frame_oam 0x0, 0x0, 0xB, -3, 0
	banim_frame_oam 0x0, 0x0, 0x9, 3, -16
	banim_frame_oam 0x0, 0x0, 0xA, 3, -8
	banim_frame_oam 0x0, 0x0, 0x4, -53, -7
	banim_frame_oam 0x4000, 0x4000, 0x5, -37, -24
	banim_frame_oam 0x0, 0x0, 0x3, -56, -7
	banim_frame_oam 0x4000, 0x0, 0x42, -72, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -10, -15
	banim_frame_oam 0x0, 0x0, 0xE, 6, -15
	banim_frame_oam 0x4000, 0x0, 0x13, -8, -7
	banim_frame_oam 0x4000, 0x0, 0x15, -10, 1
	banim_frame_oam 0x4000, 0x8000, 0x2F, -36, -16
	banim_frame_oam 0x4000, 0x4000, 0xF, -36, -24
	banim_frame_oam 0x8000, 0x0, 0x2E, -44, -16
	banim_frame_oam 0x0, 0x0, 0x4, -52, -7
	banim_frame_oam 0x0, 0x0, 0x3, -56, -7
	banim_frame_oam 0x4000, 0x4000, 0x33, -35, 0
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_oam 0x4000, 0x0, 0x42, -71, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -10, -16
	banim_frame_oam 0x0, 0x0, 0xE, 6, -16
	banim_frame_oam 0x4000, 0x0, 0x13, -8, -8
	banim_frame_oam 0x4000, 0x0, 0x15, -10, 0
	banim_frame_oam 0x4000, 0x8000, 0x37, -36, -16
	banim_frame_oam 0x4000, 0x4000, 0x17, -36, -24
	banim_frame_oam 0x4000, 0x4000, 0x53, -36, 0
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_oam 0x0, 0x0, 0x22, -44, -16
	banim_frame_oam 0x0, 0x0, 0x4E, -44, -8
	banim_frame_oam 0x0, 0x0, 0x4, -52, -7
	banim_frame_oam 0x0, 0x0, 0x3, -56, -7
	banim_frame_oam 0x4000, 0x0, 0x42, -71, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x0, 0xC, -10, -16
	banim_frame_oam 0x0, 0x0, 0xE, 6, -16
	banim_frame_oam 0x4000, 0x0, 0x13, -8, -8
	banim_frame_oam 0x4000, 0x0, 0x15, -10, 0
	banim_frame_oam 0x4000, 0x4000, 0x53, -36, 0
	banim_frame_oam 0x4000, 0x4000, 0x4A, -35, 8
	banim_frame_oam 0x0, 0x0, 0x4E, -44, -8
	banim_frame_oam 0x0, 0x0, 0x4, -52, -7
	banim_frame_oam 0x0, 0x0, 0x3, -56, -7
	banim_frame_oam 0x0, 0x4000, 0x39, -20, -16
	banim_frame_oam 0x4000, 0x0, 0x19, -20, -24
	banim_frame_oam 0x0, 0x4000, 0x3B, -36, -16
	banim_frame_oam 0x4000, 0x0, 0x1B, -36, -24
	banim_frame_oam 0x0, 0x0, 0xF9, -44, -16
	banim_frame_oam 0x4000, 0x0, 0x42, -71, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_17_r:
	banim_frame_oam 0x0, 0x8000, 0x60, -10, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -10, 8
	banim_frame_oam 0x4000, 0x0, 0x41, -2, -32
	banim_frame_oam 0x0, 0x0, 0x22, 6, -40
	banim_frame_oam 0x0, 0x0, 0x21, 6, -48
	banim_frame_oam 0x8000, 0x0, 0x20, -18, -18
	banim_frame_oam 0x4000, 0x0, 0x0, -34, -6
	banim_frame_end
banim_armm_sp1_3_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, 2, -63
	banim_frame_oam 0x0, 0x0, 0x89, 10, -31
	banim_frame_oam 0x8000, 0x0, 0xC8, -6, -47
	banim_frame_oam 0x0, 0x0, 0x88, -6, -63
	banim_frame_oam 0x0, 0x0, 0xA8, -14, -56
	banim_frame_oam 0x8000, 0x0, 0xC9, -15, -20
	banim_frame_oam 0x0, 0x8000, 0x44, -9, -30
	banim_frame_oam 0x0, 0x4000, 0xC5, -1, 2
	banim_frame_oam 0x8000, 0x0, 0xC7, 15, 2
	banim_frame_oam 0x0, 0x0, 0xC4, -7, -38
	banim_frame_oam 0x0, 0x0, 0xE4, 23, 2
	banim_frame_oam 0x0, 0x4000, 0x4, 23, -14
	banim_frame_end
banim_armm_sp1_3_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0x44, -9, -30
	banim_frame_oam 0x0, 0x4000, 0xC5, -1, 2
	banim_frame_oam 0x8000, 0x0, 0xC7, 15, 2
	banim_frame_oam 0x0, 0x0, 0xC4, -7, -38
	banim_frame_oam 0x0, 0x0, 0xE4, 23, 2
	banim_frame_oam 0x0, 0x4000, 0x4, 23, -14
	banim_frame_oam 0x0, 0x4000, 0xA, -26, -42
	banim_frame_oam 0x8000, 0x0, 0x4A, -32, -26
	banim_frame_oam 0x0, 0x0, 0x6B, -20, -50
	banim_frame_oam 0x0, 0x0, 0x4B, -18, -58
	banim_frame_oam 0x0, 0x0, 0xA9, -10, -34
	banim_frame_oam 0x4000, 0x3000, 0xEA, 5, -26
	banim_frame_end
banim_armm_sp1_3_oam_frame_20_r:
	banim_frame_oam 0x8000, 0xB000, 0x8, -27, -24
	banim_frame_oam 0x0, 0x3000, 0x89, -27, -32
	banim_frame_oam 0x8000, 0x3000, 0xC8, -11, -24
	banim_frame_oam 0x0, 0x3000, 0x88, -11, 0
	banim_frame_oam 0x0, 0x3000, 0xA8, -3, -7
	banim_frame_oam 0x8000, 0x3000, 0xC9, -2, -51
	banim_frame_oam 0x0, 0x8000, 0x44, -9, -30
	banim_frame_oam 0x0, 0x4000, 0xC5, -1, 2
	banim_frame_oam 0x8000, 0x0, 0xC7, 15, 2
	banim_frame_oam 0x0, 0x0, 0xC4, -7, -38
	banim_frame_oam 0x0, 0x0, 0xE4, 23, 2
	banim_frame_oam 0x0, 0x4000, 0x4, 23, -14
	banim_frame_end
banim_armm_sp1_3_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0xCA, 4, -17
	banim_frame_oam 0x0, 0x0, 0xCB, 8, -25
	banim_frame_oam 0x8000, 0x0, 0x8B, 12, -41
	banim_frame_oam 0x0, 0x0, 0xAA, 12, -49
	banim_frame_oam 0x0, 0x0, 0x8A, 0, -9
	banim_frame_oam 0x0, 0x8000, 0x44, -9, -30
	banim_frame_oam 0x0, 0x4000, 0xC5, -1, 2
	banim_frame_oam 0x8000, 0x0, 0xC7, 15, 2
	banim_frame_oam 0x0, 0x0, 0xC4, -7, -38
	banim_frame_oam 0x0, 0x0, 0xE4, 23, 2
	banim_frame_oam 0x0, 0x4000, 0x4, 23, -14
	banim_frame_oam 0x4000, 0x0, 0xEA, -20, -38
	banim_frame_end
banim_armm_sp1_3_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -10, -24
	banim_frame_oam 0x4000, 0x0, 0x8E, 6, 8
	banim_frame_oam 0x4000, 0x0, 0xAE, -10, 8
	banim_frame_oam 0x8000, 0x0, 0x8D, -18, -16
	banim_frame_oam 0x8000, 0x4000, 0x8C, -42, -23
	banim_frame_oam 0x4000, 0x0, 0xCD, -34, -5
	banim_frame_oam 0x8000, 0x0, 0xCF, -34, -31
	banim_frame_oam 0x0, 0x0, 0xED, -32, -39
	banim_frame_oam 0x0, 0x0, 0xEE, -32, -47
	banim_frame_end
banim_armm_sp1_3_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x70, -15, -24
	banim_frame_oam 0x4000, 0x4000, 0xF0, -15, 8
	banim_frame_oam 0x0, 0x0, 0x52, 15, -30
	banim_frame_oam 0x0, 0x0, 0x53, 16, -17
	banim_frame_oam 0x0, 0x4000, 0x30, -31, 0
	banim_frame_end
banim_armm_sp1_3_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x74, -12, -24
	banim_frame_oam 0x4000, 0x4000, 0xF4, -12, 8
	banim_frame_oam 0x8000, 0x0, 0x36, 20, -24
	banim_frame_oam 0x0, 0x4000, 0x34, -28, -4
	banim_frame_oam 0x0, 0x0, 0x57, -36, 4
	banim_frame_end
banim_armm_sp1_3_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x60, -7, -25
	banim_frame_oam 0x4000, 0x4000, 0xE0, -7, 7
	banim_frame_oam 0x4000, 0x0, 0x40, -23, -8
	banim_frame_oam 0x4000, 0x0, 0x42, 25, -9
	banim_frame_end
banim_armm_sp1_3_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x84, 1, -23
	banim_frame_oam 0x4000, 0x0, 0x42, 32, -9
	banim_frame_oam 0x4000, 0x0, 0x40, -15, -8
	banim_frame_oam 0x4000, 0x0, 0x2, 1, -31
	banim_frame_oam 0x4000, 0x0, 0x22, 1, 9
	banim_frame_oam 0x0, 0x0, 0x24, 17, 9
	banim_frame_end
banim_armm_sp1_3_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0x0, 9, -10
	banim_frame_oam 0x0, 0x8000, 0x84, 1, -23
	banim_frame_oam 0x4000, 0x0, 0x42, 32, -9
	banim_frame_oam 0x4000, 0x0, 0x40, -15, -8
	banim_frame_oam 0x4000, 0x0, 0x2, 1, -31
	banim_frame_oam 0x4000, 0x0, 0x22, 1, 9
	banim_frame_oam 0x0, 0x0, 0x24, 17, 9
	banim_frame_end
banim_armm_sp1_3_oam_frame_28_r:
	banim_frame_oam 0x0, 0x8000, 0x5, 1, -23
	banim_frame_oam 0x4000, 0x0, 0x22, 1, 9
	banim_frame_oam 0x0, 0x0, 0x24, 17, 9
	banim_frame_oam 0x4000, 0x0, 0x42, 32, -9
	banim_frame_oam 0x4000, 0x0, 0x40, -15, -8
	banim_frame_end
banim_armm_sp1_3_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x88, -14, -23
	banim_frame_oam 0x8000, 0x0, 0x44, -22, -17
	banim_frame_oam 0x0, 0x0, 0x4, -8, -31
	banim_frame_oam 0x4000, 0x0, 0x9, -15, 9
	banim_frame_oam 0x4000, 0x0, 0x29, 1, 9
	banim_frame_end
banim_armm_sp1_3_oam_frame_30_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -15, -23
	banim_frame_oam 0x4000, 0x0, 0x8C, -16, 9
	banim_frame_oam 0x4000, 0x0, 0xAC, 0, 9
	banim_frame_oam 0x0, 0x4000, 0x49, -31, -16
	banim_frame_end
banim_armm_sp1_3_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x8E, -15, -24
	banim_frame_oam 0x8000, 0x0, 0xB2, 17, -16
	banim_frame_oam 0x0, 0x0, 0xF2, 17, 0
	banim_frame_oam 0x4000, 0x0, 0xCC, -15, 8
	banim_frame_oam 0x4000, 0x0, 0xEC, 1, 8
	banim_frame_oam 0x0, 0x0, 0x92, 17, 8
	banim_frame_end
banim_armm_sp1_3_oam_frame_32_r:
	banim_frame_oam 0x0, 0x8000, 0x98, -14, -28
	banim_frame_oam 0x4000, 0x0, 0x58, -14, 4
	banim_frame_oam 0x4000, 0x0, 0x78, 2, 4
	banim_frame_oam 0x8000, 0x4000, 0x1A, 18, -20
	banim_frame_oam 0x0, 0x4000, 0x18, -30, -26
	banim_frame_oam 0x0, 0x0, 0x1C, 18, -28
	banim_frame_oam 0x4000, 0x0, 0x3B, -30, 4
	banim_frame_oam 0x0, 0x0, 0x1B, -22, -10
	banim_frame_end
banim_armm_sp1_3_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x7C, -13, -27
	banim_frame_oam 0x4000, 0x4000, 0xFC, -13, 5
	banim_frame_oam 0x0, 0x0, 0x5E, -21, -19
	banim_frame_oam 0x0, 0x0, 0x5C, -37, -27
	banim_frame_oam 0x0, 0x0, 0x5D, -29, -23
	banim_frame_oam 0x8000, 0x0, 0x5B, 19, -11
	banim_frame_end
banim_armm_sp1_3_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x0, 0x42, -88, -8
	banim_frame_oam 0x4000, 0x0, 0x2, -72, -7
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_armm_sp1_3_oam_frame_15_r:
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
banim_armm_sp1_3_script:
banim_armm_sp1_3_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 1, banim_armm_sp1_3_oam_frame_1_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_armm_sp1_sheet_0, 3, banim_armm_sp1_3_oam_frame_3_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_armm_sp1_sheet_0, 4, banim_armm_sp1_3_oam_frame_4_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_armm_sp1_sheet_0, 5, banim_armm_sp1_3_oam_frame_5_r - banim_armm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_armm_sp1_sheet_0, 6, banim_armm_sp1_3_oam_frame_6_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_armm_sp1_sheet_0, 7, banim_armm_sp1_3_oam_frame_7_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_armm_sp1_sheet_0, 7, banim_armm_sp1_3_oam_frame_7_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_armm_sp1_sheet_0, 8, banim_armm_sp1_3_oam_frame_8_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 9, banim_armm_sp1_3_oam_frame_9_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 10, banim_armm_sp1_3_oam_frame_10_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 11, banim_armm_sp1_3_oam_frame_11_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 12, banim_armm_sp1_3_oam_frame_12_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 13, banim_armm_sp1_3_oam_frame_13_r - banim_armm_sp1_3_oam_r
	banim_code_frame 10, banim_armm_sp1_sheet_0, 14, banim_armm_sp1_3_oam_frame_14_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 6, banim_armm_sp1_3_oam_frame_6_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 5, banim_armm_sp1_3_oam_frame_5_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_sound_step_heavy_quick
	banim_code_frame 10, banim_armm_sp1_sheet_0, 4, banim_armm_sp1_3_oam_frame_4_r - banim_armm_sp1_3_oam_r
	banim_code_frame 2, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 1, banim_armm_sp1_3_oam_frame_1_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_3_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 10, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_sound_step_heavy_quick
	banim_code_frame 10, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 2, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_3_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_sound_armor_leap
	banim_code_frame 5, banim_armm_sp1_sheet_1, 19, banim_armm_sp1_3_oam_frame_17_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 20, banim_armm_sp1_3_oam_frame_18_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 21, banim_armm_sp1_3_oam_frame_19_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 22, banim_armm_sp1_3_oam_frame_20_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 23, banim_armm_sp1_3_oam_frame_21_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_armm_sp1_sheet_1, 20, banim_armm_sp1_3_oam_frame_18_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 21, banim_armm_sp1_3_oam_frame_19_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 22, banim_armm_sp1_3_oam_frame_20_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 23, banim_armm_sp1_3_oam_frame_21_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 20, banim_armm_sp1_3_oam_frame_18_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_armm_sp1_sheet_1, 21, banim_armm_sp1_3_oam_frame_19_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 22, banim_armm_sp1_3_oam_frame_20_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 23, banim_armm_sp1_3_oam_frame_21_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 20, banim_armm_sp1_3_oam_frame_18_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 24, banim_armm_sp1_3_oam_frame_22_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_1, 25, banim_armm_sp1_3_oam_frame_23_r - banim_armm_sp1_3_oam_r
	banim_code_frame 5, banim_armm_sp1_sheet_1, 26, banim_armm_sp1_3_oam_frame_24_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 15, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 1, banim_armm_sp1_3_oam_frame_1_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 3, banim_armm_sp1_3_oam_frame_3_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 4, banim_armm_sp1_3_oam_frame_4_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 10, banim_armm_sp1_sheet_0, 5, banim_armm_sp1_3_oam_frame_5_r - banim_armm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_armm_sp1_sheet_0, 6, banim_armm_sp1_3_oam_frame_6_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_armm_sp1_sheet_0, 7, banim_armm_sp1_3_oam_frame_7_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_armm_sp1_sheet_0, 7, banim_armm_sp1_3_oam_frame_7_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_armm_sp1_sheet_0, 8, banim_armm_sp1_3_oam_frame_8_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 9, banim_armm_sp1_3_oam_frame_9_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 10, banim_armm_sp1_3_oam_frame_10_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 11, banim_armm_sp1_3_oam_frame_11_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 12, banim_armm_sp1_3_oam_frame_12_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 13, banim_armm_sp1_3_oam_frame_13_r - banim_armm_sp1_3_oam_r
	banim_code_frame 10, banim_armm_sp1_sheet_0, 14, banim_armm_sp1_3_oam_frame_14_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 6, banim_armm_sp1_3_oam_frame_6_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 5, banim_armm_sp1_3_oam_frame_5_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 10, banim_armm_sp1_sheet_0, 4, banim_armm_sp1_3_oam_frame_4_r - banim_armm_sp1_3_oam_r
	banim_code_frame 2, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 1, banim_armm_sp1_3_oam_frame_1_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_3_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_sound_armor_leap
	banim_code_frame 5, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 5, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 15, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 10, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_hit_critical_5
	banim_code_sound_hit_eliwood_promoted
	banim_code_frame 1, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 36, banim_armm_sp1_3_oam_frame_16_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 10, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 10, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_frame 2, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 43, banim_armm_sp1_3_oam_frame_15_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_3_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_2, 27, banim_armm_sp1_3_oam_frame_25_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_2, 28, banim_armm_sp1_3_oam_frame_26_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_2, 29, banim_armm_sp1_3_oam_frame_27_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 20, banim_armm_sp1_sheet_2, 30, banim_armm_sp1_3_oam_frame_28_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 31, banim_armm_sp1_3_oam_frame_29_r - banim_armm_sp1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_armm_sp1_sheet_2, 32, banim_armm_sp1_3_oam_frame_30_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_armm_sp1_sheet_2, 33, banim_armm_sp1_3_oam_frame_31_r - banim_armm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_3_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_sound_armor_leap
	banim_code_frame 5, banim_armm_sp1_sheet_1, 19, banim_armm_sp1_3_oam_frame_17_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 20, banim_armm_sp1_3_oam_frame_18_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 21, banim_armm_sp1_3_oam_frame_19_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 22, banim_armm_sp1_3_oam_frame_20_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 23, banim_armm_sp1_3_oam_frame_21_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_armm_sp1_sheet_1, 20, banim_armm_sp1_3_oam_frame_18_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 21, banim_armm_sp1_3_oam_frame_19_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 22, banim_armm_sp1_3_oam_frame_20_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 23, banim_armm_sp1_3_oam_frame_21_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 20, banim_armm_sp1_3_oam_frame_18_r - banim_armm_sp1_3_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_armm_sp1_sheet_1, 21, banim_armm_sp1_3_oam_frame_19_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 22, banim_armm_sp1_3_oam_frame_20_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 23, banim_armm_sp1_3_oam_frame_21_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 20, banim_armm_sp1_3_oam_frame_18_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_1, 24, banim_armm_sp1_3_oam_frame_22_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_1, 25, banim_armm_sp1_3_oam_frame_23_r - banim_armm_sp1_3_oam_r
	banim_code_frame 5, banim_armm_sp1_sheet_1, 26, banim_armm_sp1_3_oam_frame_24_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 15, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_2, 27, banim_armm_sp1_3_oam_frame_25_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_2, 28, banim_armm_sp1_3_oam_frame_26_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_2, 29, banim_armm_sp1_3_oam_frame_27_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_frame 40, banim_armm_sp1_sheet_2, 30, banim_armm_sp1_3_oam_frame_28_r - banim_armm_sp1_3_oam_r
	banim_code_frame 3, banim_armm_sp1_sheet_2, 31, banim_armm_sp1_3_oam_frame_29_r - banim_armm_sp1_3_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_armm_sp1_sheet_2, 32, banim_armm_sp1_3_oam_frame_30_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_armm_sp1_sheet_2, 33, banim_armm_sp1_3_oam_frame_31_r - banim_armm_sp1_3_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_3_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_armm_sp1_sheet_1, 34, banim_armm_sp1_3_oam_frame_32_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_armm_sp1_sheet_1, 35, banim_armm_sp1_3_oam_frame_33_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_1, 34, banim_armm_sp1_3_oam_frame_32_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_3_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_armm_sp1_sheet_1, 34, banim_armm_sp1_3_oam_frame_32_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_armm_sp1_sheet_1, 35, banim_armm_sp1_3_oam_frame_33_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_armm_sp1_sheet_1, 34, banim_armm_sp1_3_oam_frame_32_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_armm_sp1_3_mode_stand_close:
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_armm_sp1_3_mode_stand:
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_armm_sp1_3_mode_stand_range:
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_armm_sp1_3_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_armm_sp1_sheet_0, 0, banim_armm_sp1_3_oam_frame_0_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 1, banim_armm_sp1_3_oam_frame_1_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_armm_sp1_sheet_0, 3, banim_armm_sp1_3_oam_frame_3_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 4, banim_armm_sp1_sheet_0, 4, banim_armm_sp1_3_oam_frame_4_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 10, banim_armm_sp1_sheet_0, 5, banim_armm_sp1_3_oam_frame_5_r - banim_armm_sp1_3_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 4, banim_armm_sp1_sheet_0, 6, banim_armm_sp1_3_oam_frame_6_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_armm_sp1_sheet_0, 15, banim_armm_sp1_3_oam_frame_34_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_frame 1, banim_armm_sp1_sheet_0, 15, banim_armm_sp1_3_oam_frame_34_r - banim_armm_sp1_3_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_armm_sp1_sheet_0, 16, banim_armm_sp1_3_oam_frame_35_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 17, banim_armm_sp1_3_oam_frame_36_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 18, banim_armm_sp1_3_oam_frame_37_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 11, banim_armm_sp1_3_oam_frame_11_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 12, banim_armm_sp1_3_oam_frame_12_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 13, banim_armm_sp1_3_oam_frame_13_r - banim_armm_sp1_3_oam_r
	banim_code_frame 10, banim_armm_sp1_sheet_0, 14, banim_armm_sp1_3_oam_frame_14_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 6, banim_armm_sp1_3_oam_frame_6_r - banim_armm_sp1_3_oam_r
	banim_code_frame 4, banim_armm_sp1_sheet_0, 5, banim_armm_sp1_3_oam_frame_5_r - banim_armm_sp1_3_oam_r
	banim_code_shake_screnn_slightly
	banim_code_sound_armor_leap
	banim_code_sound_step_heavy_quick
	banim_code_frame 10, banim_armm_sp1_sheet_0, 4, banim_armm_sp1_3_oam_frame_4_r - banim_armm_sp1_3_oam_r
	banim_code_frame 2, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_armm_sp1_sheet_0, 2, banim_armm_sp1_3_oam_frame_2_r - banim_armm_sp1_3_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_shake_screnn_slightly
	banim_code_frame 4, banim_armm_sp1_sheet_0, 1, banim_armm_sp1_3_oam_frame_1_r - banim_armm_sp1_3_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_armm_sp1_3_mode_attack_close - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_attack_close_back - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_attack_close_critical - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_attack_close_critical_back - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_attack_range - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_attack_range_critical - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_dodge_close - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_dodge_range - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_stand_close - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_stand - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_stand_range - banim_armm_sp1_3_script
	.word banim_armm_sp1_3_mode_attack_miss - banim_armm_sp1_3_script
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

