@ vim:ft=armv4
	.global banim_smnm_ro1_script
	.global banim_smnm_ro1_oam_r
	.global banim_smnm_ro1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x7A
	.section .data.oam_l
banim_smnm_ro1_oam_l:
banim_smnm_ro1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x89, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0xE0, 20, -16
	banim_frame_oam 0x0, 0x1000, 0xA1, 20, -8
	banim_frame_oam 0x0, 0x9000, 0xD, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x8D, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x1000, 0xA1, 20, -8
	banim_frame_oam 0x8000, 0x1000, 0xA3, 20, -32
	banim_frame_oam 0x0, 0x1000, 0xE3, 20, -16
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0xA1, 20, -8
	banim_frame_oam 0x0, 0x5000, 0xA4, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 12, -16
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_26_l:
	banim_frame_oam 0x4000, 0x1000, 0xA1, 12, -8
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, -16
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA8, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE8, 12, 8
	banim_frame_oam 0x8000, 0x9000, 0x1D, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x9D, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x5000, 0xAA, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xEA, 12, 8
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, -16
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_32_l:
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xAC, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xEC, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0xAE, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xEE, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xB0, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF0, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_36_l:
	banim_frame_oam 0x0, 0x5000, 0xB2, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xF2, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xB4, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF4, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9D, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xB2, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xF2, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xB4, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF4, 12, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, 13, -33
	banim_frame_oam 0x8000, 0x1000, 0xA2, 5, -33
	banim_frame_oam 0x4000, 0x1000, 0xE0, 13, -17
	banim_frame_oam 0x0, 0x1000, 0xE2, 5, -17
	banim_frame_oam 0x0, 0x5000, 0xA3, 13, -9
	banim_frame_oam 0x8000, 0x1000, 0xA5, 5, -9
	banim_frame_oam 0x4000, 0x1000, 0xE3, 13, 7
	banim_frame_oam 0x0, 0x1000, 0xE5, 5, 7
	banim_frame_oam 0x4000, 0x1000, 0xA6, 13, 15
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x5000, 0xA9, 14, -34
	banim_frame_oam 0x8000, 0x1000, 0xAB, 6, -34
	banim_frame_oam 0x4000, 0x1000, 0xE9, 14, -18
	banim_frame_oam 0x0, 0x1000, 0xEB, 6, -18
	banim_frame_oam 0x0, 0x5000, 0xAC, 14, -10
	banim_frame_oam 0x8000, 0x1000, 0xAE, 6, -10
	banim_frame_oam 0x4000, 0x1000, 0xEC, 14, 6
	banim_frame_oam 0x0, 0x1000, 0xEE, 6, 6
	banim_frame_oam 0x4000, 0x1000, 0xAF, 14, 14
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9D, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x10, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x90, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x95, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x65, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xA, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x86, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8A, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x16, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1A, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x96, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9A, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x9000, 0xC5, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xC9, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9D, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x8D, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0x1D, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x9D, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x5000, 0xB6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xF6, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xB8, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF8, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0xA4, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x5000, 0xA4, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x5000, 0xA4, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, 8
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
	banim_frame_end
banim_smnm_ro1_oam_frame_50_l:
	banim_frame_oam 0x4000, 0x9000, 0xAA, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xAE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xEA, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xCF, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xD3, -32, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_51_l:
	banim_frame_oam 0x4000, 0x9000, 0xB5, -21, -24
	banim_frame_oam 0x4000, 0x5000, 0xF5, -21, -8
	banim_frame_oam 0x4000, 0x9000, 0xD9, -21, 0
	banim_frame_oam 0x8000, 0x1000, 0xDD, -29, 0
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_smnm_ro1_oam_r:
banim_smnm_ro1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x0, 0xA1, -28, -8
	banim_frame_oam 0x0, 0x8000, 0xD, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8D, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x0, 0xA1, -28, -8
	banim_frame_oam 0x8000, 0x0, 0xA3, -28, -32
	banim_frame_oam 0x0, 0x0, 0xE3, -28, -16
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0xA1, -28, -8
	banim_frame_oam 0x0, 0x4000, 0xA4, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -28, -16
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_26_r:
	banim_frame_oam 0x4000, 0x0, 0xA1, -28, -8
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, -16
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA8, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE8, -28, 8
	banim_frame_oam 0x8000, 0x8000, 0x1D, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x9D, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x82, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x4000, 0xAA, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xEA, -28, 8
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, -16
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_32_r:
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xAC, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xEC, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0xAE, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xEE, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xB0, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF0, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_36_r:
	banim_frame_oam 0x0, 0x4000, 0xB2, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xF2, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xB4, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF4, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9D, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0xB2, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xF2, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xB4, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF4, -28, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -29, -33
	banim_frame_oam 0x8000, 0x0, 0xA2, -13, -33
	banim_frame_oam 0x4000, 0x0, 0xE0, -29, -17
	banim_frame_oam 0x0, 0x0, 0xE2, -13, -17
	banim_frame_oam 0x0, 0x4000, 0xA3, -29, -9
	banim_frame_oam 0x8000, 0x0, 0xA5, -13, -9
	banim_frame_oam 0x4000, 0x0, 0xE3, -29, 7
	banim_frame_oam 0x0, 0x0, 0xE5, -13, 7
	banim_frame_oam 0x4000, 0x0, 0xA6, -29, 15
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x4000, 0xA9, -30, -34
	banim_frame_oam 0x8000, 0x0, 0xAB, -14, -34
	banim_frame_oam 0x4000, 0x0, 0xE9, -30, -18
	banim_frame_oam 0x0, 0x0, 0xEB, -14, -18
	banim_frame_oam 0x0, 0x4000, 0xAC, -30, -10
	banim_frame_oam 0x8000, 0x0, 0xAE, -14, -10
	banim_frame_oam 0x4000, 0x0, 0xEC, -30, 6
	banim_frame_oam 0x0, 0x0, 0xEE, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xAF, -30, 14
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9D, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x10, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x0, 0x90, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x15, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -16, 8
	banim_frame_oam 0x0, 0x0, 0x95, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -24, 8
	banim_frame_oam 0x0, 0x0, 0x84, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x65, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xA, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x86, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8A, 8, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x16, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1A, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x96, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9A, 8, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, -8
	banim_frame_oam 0x4000, 0x8000, 0xC5, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xC9, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9D, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8D, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0x1D, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x9D, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x2, 0, -24
	banim_frame_oam 0x4000, 0x0, 0x82, 0, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x4000, 0xB6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xF6, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xB8, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF8, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0xA4, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x4000, 0xA4, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_smnm_ro1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x4000, 0xA4, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, 8
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
	banim_frame_end
banim_smnm_ro1_oam_frame_50_r:
	banim_frame_oam 0x4000, 0x8000, 0xAA, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xAE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xEA, -16, -8
	banim_frame_oam 0x0, 0x0, 0xEE, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xCF, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xD3, 16, 0
	banim_frame_end
banim_smnm_ro1_oam_frame_51_r:
	banim_frame_oam 0x4000, 0x8000, 0xB5, -11, -24
	banim_frame_oam 0x4000, 0x4000, 0xF5, -11, -8
	banim_frame_oam 0x4000, 0x8000, 0xD9, -11, 0
	banim_frame_oam 0x8000, 0x0, 0xDD, 21, 0
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_smnm_ro1_script:
banim_smnm_ro1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_oam_frame_1_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_oam_frame_2_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_oam_frame_3_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_oam_frame_4_r - banim_smnm_ro1_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_oam_frame_5_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_oam_frame_5_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_oam_frame_6_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_oam_frame_7_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_oam_frame_8_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_oam_frame_14_r - banim_smnm_ro1_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_oam_frame_15_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_oam_frame_16_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_oam_frame_17_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_oam_frame_1_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_oam_frame_2_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_oam_frame_3_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_oam_frame_4_r - banim_smnm_ro1_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_oam_frame_5_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_oam_frame_5_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_oam_frame_6_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_oam_frame_7_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_oam_frame_8_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_oam_frame_14_r - banim_smnm_ro1_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_oam_frame_15_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_oam_frame_16_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_oam_frame_17_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_frame 5, banim_smnm_ro1_sheet_0, 1, banim_smnm_ro1_oam_frame_18_r - banim_smnm_ro1_oam_r
	banim_code_frame 5, banim_smnm_ro1_sheet_0, 2, banim_smnm_ro1_oam_frame_19_r - banim_smnm_ro1_oam_r
	banim_code_sound_magic_dark_spell
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 3, banim_smnm_ro1_oam_frame_20_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 40, banim_smnm_ro1_oam_frame_21_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 4, banim_smnm_ro1_oam_frame_22_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 41, banim_smnm_ro1_oam_frame_23_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 5, banim_smnm_ro1_oam_frame_24_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 42, banim_smnm_ro1_oam_frame_25_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 6, banim_smnm_ro1_oam_frame_26_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 43, banim_smnm_ro1_oam_frame_27_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 7, banim_smnm_ro1_oam_frame_28_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 44, banim_smnm_ro1_oam_frame_29_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 8, banim_smnm_ro1_oam_frame_30_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 45, banim_smnm_ro1_oam_frame_31_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 9, banim_smnm_ro1_oam_frame_32_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 46, banim_smnm_ro1_oam_frame_33_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 10, banim_smnm_ro1_oam_frame_34_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 47, banim_smnm_ro1_oam_frame_35_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 12, banim_smnm_ro1_oam_frame_38_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 49, banim_smnm_ro1_oam_frame_39_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 13, banim_smnm_ro1_oam_frame_40_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 50, banim_smnm_ro1_oam_frame_41_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 14, banim_smnm_ro1_oam_frame_42_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 51, banim_smnm_ro1_oam_frame_43_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 15, banim_smnm_ro1_oam_frame_44_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 16, banim_smnm_ro1_oam_frame_45_r - banim_smnm_ro1_oam_r
	banim_code_sound_whoosh
	banim_code_frame 5, banim_smnm_ro1_sheet_1, 17, banim_smnm_ro1_oam_frame_46_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 18, banim_smnm_ro1_oam_frame_47_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 19, banim_smnm_ro1_oam_frame_48_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 20, banim_smnm_ro1_oam_frame_49_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_oam_frame_14_r - banim_smnm_ro1_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_oam_frame_15_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_oam_frame_16_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_oam_frame_17_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_frame 5, banim_smnm_ro1_sheet_0, 1, banim_smnm_ro1_oam_frame_18_r - banim_smnm_ro1_oam_r
	banim_code_frame 5, banim_smnm_ro1_sheet_0, 2, banim_smnm_ro1_oam_frame_19_r - banim_smnm_ro1_oam_r
	banim_code_sound_magic_dark_spell
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 3, banim_smnm_ro1_oam_frame_20_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 40, banim_smnm_ro1_oam_frame_21_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 4, banim_smnm_ro1_oam_frame_22_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 41, banim_smnm_ro1_oam_frame_23_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 5, banim_smnm_ro1_oam_frame_24_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 42, banim_smnm_ro1_oam_frame_25_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 6, banim_smnm_ro1_oam_frame_26_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 43, banim_smnm_ro1_oam_frame_27_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 7, banim_smnm_ro1_oam_frame_28_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 44, banim_smnm_ro1_oam_frame_29_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 8, banim_smnm_ro1_oam_frame_30_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 45, banim_smnm_ro1_oam_frame_31_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 9, banim_smnm_ro1_oam_frame_32_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 46, banim_smnm_ro1_oam_frame_33_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 10, banim_smnm_ro1_oam_frame_34_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 47, banim_smnm_ro1_oam_frame_35_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 12, banim_smnm_ro1_oam_frame_38_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 49, banim_smnm_ro1_oam_frame_39_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 13, banim_smnm_ro1_oam_frame_40_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 50, banim_smnm_ro1_oam_frame_41_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 14, banim_smnm_ro1_oam_frame_42_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 51, banim_smnm_ro1_oam_frame_43_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 15, banim_smnm_ro1_oam_frame_44_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 16, banim_smnm_ro1_oam_frame_45_r - banim_smnm_ro1_oam_r
	banim_code_sound_whoosh
	banim_code_frame 5, banim_smnm_ro1_sheet_1, 17, banim_smnm_ro1_oam_frame_46_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 18, banim_smnm_ro1_oam_frame_47_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 19, banim_smnm_ro1_oam_frame_48_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 20, banim_smnm_ro1_oam_frame_49_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_oam_frame_14_r - banim_smnm_ro1_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_oam_frame_15_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_oam_frame_16_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_oam_frame_17_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_oam_frame_1_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_oam_frame_2_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_oam_frame_3_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_oam_frame_4_r - banim_smnm_ro1_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_oam_frame_5_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_oam_frame_5_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_oam_frame_6_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_oam_frame_7_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_oam_frame_8_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_oam_frame_14_r - banim_smnm_ro1_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_oam_frame_15_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_oam_frame_16_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_oam_frame_17_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_frame 5, banim_smnm_ro1_sheet_0, 1, banim_smnm_ro1_oam_frame_18_r - banim_smnm_ro1_oam_r
	banim_code_frame 5, banim_smnm_ro1_sheet_0, 2, banim_smnm_ro1_oam_frame_19_r - banim_smnm_ro1_oam_r
	banim_code_sound_magic_dark_spell
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 3, banim_smnm_ro1_oam_frame_20_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 40, banim_smnm_ro1_oam_frame_21_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 4, banim_smnm_ro1_oam_frame_22_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 41, banim_smnm_ro1_oam_frame_23_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 5, banim_smnm_ro1_oam_frame_24_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 42, banim_smnm_ro1_oam_frame_25_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 6, banim_smnm_ro1_oam_frame_26_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 43, banim_smnm_ro1_oam_frame_27_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 7, banim_smnm_ro1_oam_frame_28_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 44, banim_smnm_ro1_oam_frame_29_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 8, banim_smnm_ro1_oam_frame_30_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 45, banim_smnm_ro1_oam_frame_31_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 9, banim_smnm_ro1_oam_frame_32_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 46, banim_smnm_ro1_oam_frame_33_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_0, 10, banim_smnm_ro1_oam_frame_34_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 47, banim_smnm_ro1_oam_frame_35_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 11, banim_smnm_ro1_oam_frame_36_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_0, 48, banim_smnm_ro1_oam_frame_37_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 12, banim_smnm_ro1_oam_frame_38_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 49, banim_smnm_ro1_oam_frame_39_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 13, banim_smnm_ro1_oam_frame_40_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 50, banim_smnm_ro1_oam_frame_41_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_1, 14, banim_smnm_ro1_oam_frame_42_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 51, banim_smnm_ro1_oam_frame_43_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_1, 15, banim_smnm_ro1_oam_frame_44_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 16, banim_smnm_ro1_oam_frame_45_r - banim_smnm_ro1_oam_r
	banim_code_sound_whoosh
	banim_code_frame 5, banim_smnm_ro1_sheet_1, 17, banim_smnm_ro1_oam_frame_46_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 18, banim_smnm_ro1_oam_frame_47_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 19, banim_smnm_ro1_oam_frame_48_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_2, 20, banim_smnm_ro1_oam_frame_49_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_oam_frame_14_r - banim_smnm_ro1_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_oam_frame_15_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_oam_frame_16_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_oam_frame_17_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_oam_frame_50_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 54, banim_smnm_ro1_oam_frame_51_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_oam_frame_50_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_oam_frame_50_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 54, banim_smnm_ro1_oam_frame_51_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_oam_frame_50_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_mode_stand_close:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_mode_stand:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_mode_stand_range:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_oam_frame_1_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_oam_frame_2_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_oam_frame_3_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_oam_frame_4_r - banim_smnm_ro1_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_oam_frame_5_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_oam_frame_5_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_oam_frame_6_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_oam_frame_7_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_oam_frame_8_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_oam_frame_10_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_oam_frame_11_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_oam_frame_12_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_oam_frame_9_r - banim_smnm_ro1_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_oam_frame_14_r - banim_smnm_ro1_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_oam_frame_13_r - banim_smnm_ro1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_oam_frame_15_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_oam_frame_16_r - banim_smnm_ro1_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_oam_frame_17_r - banim_smnm_ro1_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_oam_frame_0_r - banim_smnm_ro1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_smnm_ro1_mode_attack_close - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_attack_close_back - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_attack_close_critical - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_attack_close_critical_back - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_attack_range - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_attack_range_critical - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_dodge_close - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_dodge_range - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_stand_close - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_stand - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_stand_range - banim_smnm_ro1_script
	.word banim_smnm_ro1_mode_attack_miss - banim_smnm_ro1_script
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

