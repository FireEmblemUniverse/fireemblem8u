@ vim:ft=armv4
	.global banim_smnm_ro1_2_script
	.global banim_smnm_ro1_2_oam_r
	.global banim_smnm_ro1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x7B
	.section .data.oam_l
banim_smnm_ro1_2_oam_l:
banim_smnm_ro1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 10, -17
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x5000, 0x9F, 9, -20
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -29
	banim_frame_oam 0x0, 0x9000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x89, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
	banim_frame_oam 0x8000, 0x5000, 0x9F, 4, -30
	banim_frame_oam 0x0, 0x9000, 0xD, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x8D, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xE0, 20, -16
	banim_frame_oam 0x0, 0x1000, 0xA1, 20, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, -5, -21
	banim_frame_oam 0x0, 0x5000, 0xBD, 3, -5
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0xA3, 20, -32
	banim_frame_oam 0x0, 0x1000, 0xE3, 20, -16
	banim_frame_oam 0x0, 0x1000, 0xA1, 20, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, -4, -14
	banim_frame_oam 0x0, 0x5000, 0xBD, 4, 2
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xA4, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 12, -16
	banim_frame_oam 0x0, 0x1000, 0xA1, 20, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, -2, -14
	banim_frame_oam 0x0, 0x5000, 0xBD, 6, 2
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, -16
	banim_frame_oam 0x4000, 0x1000, 0xA1, 12, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA8, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE8, 12, 8
	banim_frame_oam 0x0, 0x5000, 0xBB, 1, -16
	banim_frame_oam 0x0, 0x5000, 0xBD, 9, 0
	banim_frame_oam 0x8000, 0x9000, 0x1D, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x9D, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x2, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xAA, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xEA, 12, 8
	banim_frame_oam 0x0, 0x5000, 0xBB, 2, -19
	banim_frame_oam 0x0, 0x5000, 0xBD, 10, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xAC, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xEC, 12, 8
	banim_frame_oam 0x0, 0x5000, 0xBB, 2, -19
	banim_frame_oam 0x0, 0x5000, 0xBD, 10, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xAE, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xEE, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xB0, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF0, 12, 8
	banim_frame_oam 0x0, 0x5000, 0xBB, 2, -19
	banim_frame_oam 0x0, 0x5000, 0xBD, 10, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xB2, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xF2, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xB4, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF4, 12, 8
	banim_frame_oam 0x0, 0x5000, 0xBB, 2, -19
	banim_frame_oam 0x0, 0x5000, 0xBD, 10, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0x9F, 8, -19
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -19
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -25
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -25
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -25
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA2, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE2, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9D, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xB2, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xF2, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xB4, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF4, 12, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA0, 13, -33
	banim_frame_oam 0x8000, 0x1000, 0xA2, 5, -33
	banim_frame_oam 0x4000, 0x1000, 0xE0, 13, -17
	banim_frame_oam 0x0, 0x1000, 0xE2, 5, -17
	banim_frame_oam 0x0, 0x5000, 0xA3, 13, -9
	banim_frame_oam 0x8000, 0x1000, 0xA5, 5, -9
	banim_frame_oam 0x4000, 0x1000, 0xE3, 13, 7
	banim_frame_oam 0x0, 0x1000, 0xE5, 5, 7
	banim_frame_oam 0x4000, 0x1000, 0xA6, 13, 15
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA9, 14, -34
	banim_frame_oam 0x8000, 0x1000, 0xAB, 6, -34
	banim_frame_oam 0x4000, 0x1000, 0xE9, 14, -18
	banim_frame_oam 0x0, 0x1000, 0xEB, 6, -18
	banim_frame_oam 0x0, 0x5000, 0xAC, 14, -10
	banim_frame_oam 0x8000, 0x1000, 0xAE, 6, -10
	banim_frame_oam 0x4000, 0x1000, 0xEC, 14, 6
	banim_frame_oam 0x0, 0x1000, 0xEE, 6, 6
	banim_frame_oam 0x4000, 0x1000, 0xAF, 14, 14
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x1D, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x9D, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0x7C, -19, -27
	banim_frame_oam 0x8000, 0x1000, 0x7E, -11, -11
	banim_frame_oam 0x0, 0x9000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x10, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x90, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_13_l:
	banim_frame_oam 0x0, 0x5000, 0x7C, -15, -26
	banim_frame_oam 0x8000, 0x1000, 0x7E, -7, -10
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x15, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x95, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_15_l:
	banim_frame_oam 0x4000, 0x9000, 0x1C, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x5C, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x60, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x64, -24, 0
	banim_frame_oam 0x0, 0x1000, 0x44, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x1A, 15, -23
	banim_frame_end
banim_smnm_ro1_2_oam_frame_16_l:
	banim_frame_oam 0x0, 0x5000, 0x1A, 15, -24
	banim_frame_oam 0x8000, 0x1000, 0xBE, 15, -8
	banim_frame_oam 0x0, 0x9000, 0x6, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x86, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x4A, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x8A, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x6B, -24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x1A, 15, -24
	banim_frame_oam 0x8000, 0x1000, 0xBE, 15, -8
	banim_frame_oam 0x0, 0x9000, 0x16, -8, -24
	banim_frame_oam 0x4000, 0x5000, 0x96, -8, 8
	banim_frame_oam 0x8000, 0x1000, 0x5A, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x9A, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x7B, -24, 0
	banim_frame_end
banim_smnm_ro1_2_oam_frame_17_l:
	banim_frame_oam 0x0, 0x5000, 0x1A, 9, -19
	banim_frame_oam 0x8000, 0x1000, 0xBE, 9, -3
	banim_frame_oam 0x0, 0x5000, 0xA0, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0xA2, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xE0, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xE2, -8, -8
	banim_frame_oam 0x0, 0x1000, 0xE3, -16, -8
	banim_frame_oam 0x4000, 0x9000, 0xC5, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xC9, -24, 0
	banim_frame_end
banim_smnm_ro1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 8, -19
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -19
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -25
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -25
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -25
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x1000, 0x3E, -7, -24
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x99, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x7D, -24, 0
	banim_frame_end
banim_smnm_ro1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -26
	banim_frame_oam 0x8000, 0x1000, 0xB8, -5, -10
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x5000, 0x9F, 4, -30
	banim_frame_oam 0x0, 0x9000, 0xD, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x8D, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, -5, -21
	banim_frame_oam 0x0, 0x5000, 0xBD, 3, -5
	banim_frame_oam 0x0, 0x9000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, -4, -14
	banim_frame_oam 0x0, 0x5000, 0xBD, 4, 2
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, -2, -14
	banim_frame_oam 0x0, 0x5000, 0xBD, 6, 2
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x64, -24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, 1, -16
	banim_frame_oam 0x0, 0x5000, 0xBD, 9, 0
	banim_frame_oam 0x8000, 0x9000, 0x1D, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x9D, 0, 8
	banim_frame_oam 0x8000, 0x9000, 0x2, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x82, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, 2, -19
	banim_frame_oam 0x0, 0x5000, 0xBD, 10, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, 2, -19
	banim_frame_oam 0x0, 0x5000, 0xBD, 10, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xBB, 2, -19
	banim_frame_oam 0x0, 0x5000, 0xBD, 10, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xB6, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xF6, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xB8, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF8, 12, 8
	banim_frame_oam 0x0, 0x5000, 0xBB, 2, -19
	banim_frame_oam 0x8000, 0x1000, 0xBE, 10, -3
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA4, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0x9F, 8, -19
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA4, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, 8
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0x9F, 8, -19
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0xA4, 12, -32
	banim_frame_oam 0x4000, 0x1000, 0xE4, 12, -16
	banim_frame_oam 0x0, 0x5000, 0xA6, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 12, 8
	banim_frame_oam 0x8000, 0x5000, 0x9F, 7, -25
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_end
	banim_frame_end
banim_smnm_ro1_2_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0xAA, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xAE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0xEA, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xEE, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0xCF, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xD3, -32, 0
	banim_frame_end
banim_smnm_ro1_2_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 1, -17
	banim_frame_oam 0x0, 0x5000, 0xB6, -13, -24
	banim_frame_oam 0x8000, 0x1000, 0xB8, -21, -24
	banim_frame_oam 0x4000, 0x1000, 0xF6, -13, -8
	banim_frame_oam 0x0, 0x1000, 0xF8, -21, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, 3, -8
	banim_frame_oam 0x4000, 0x9000, 0xD9, -21, 0
	banim_frame_oam 0x8000, 0x1000, 0xDD, -29, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_smnm_ro1_2_oam_r:
banim_smnm_ro1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -18, -17
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x4000, 0x9F, -17, -20
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -29
	banim_frame_oam 0x0, 0x8000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x89, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
	banim_frame_oam 0x8000, 0x4000, 0x9F, -12, -30
	banim_frame_oam 0x0, 0x8000, 0xD, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8D, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_oam 0x0, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x0, 0xA1, -28, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -11, -21
	banim_frame_oam 0x0, 0x4000, 0xBD, -19, -5
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xA3, -28, -32
	banim_frame_oam 0x0, 0x0, 0xE3, -28, -16
	banim_frame_oam 0x0, 0x0, 0xA1, -28, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -12, -14
	banim_frame_oam 0x0, 0x4000, 0xBD, -20, 2
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xA4, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -28, -16
	banim_frame_oam 0x0, 0x0, 0xA1, -28, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -14, -14
	banim_frame_oam 0x0, 0x4000, 0xBD, -22, 2
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, -16
	banim_frame_oam 0x4000, 0x0, 0xA1, -28, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA8, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE8, -28, 8
	banim_frame_oam 0x0, 0x4000, 0xBB, -17, -16
	banim_frame_oam 0x0, 0x4000, 0xBD, -25, 0
	banim_frame_oam 0x8000, 0x8000, 0x1D, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x9D, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x2, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x82, 0, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xAA, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xEA, -28, 8
	banim_frame_oam 0x0, 0x4000, 0xBB, -18, -19
	banim_frame_oam 0x0, 0x4000, 0xBD, -26, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xAC, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xEC, -28, 8
	banim_frame_oam 0x0, 0x4000, 0xBB, -18, -19
	banim_frame_oam 0x0, 0x4000, 0xBD, -26, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xAE, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xEE, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xB0, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF0, -28, 8
	banim_frame_oam 0x0, 0x4000, 0xBB, -18, -19
	banim_frame_oam 0x0, 0x4000, 0xBD, -26, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xB2, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xF2, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xB4, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF4, -28, 8
	banim_frame_oam 0x0, 0x4000, 0xBB, -18, -19
	banim_frame_oam 0x0, 0x4000, 0xBD, -26, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x8000, 0x4000, 0x9F, -16, -19
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -19
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -25
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -25
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -25
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA2, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE2, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9D, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x4000, 0xB2, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xF2, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xB4, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF4, -28, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA0, -29, -33
	banim_frame_oam 0x8000, 0x0, 0xA2, -13, -33
	banim_frame_oam 0x4000, 0x0, 0xE0, -29, -17
	banim_frame_oam 0x0, 0x0, 0xE2, -13, -17
	banim_frame_oam 0x0, 0x4000, 0xA3, -29, -9
	banim_frame_oam 0x8000, 0x0, 0xA5, -13, -9
	banim_frame_oam 0x4000, 0x0, 0xE3, -29, 7
	banim_frame_oam 0x0, 0x0, 0xE5, -13, 7
	banim_frame_oam 0x4000, 0x0, 0xA6, -29, 15
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA9, -30, -34
	banim_frame_oam 0x8000, 0x0, 0xAB, -14, -34
	banim_frame_oam 0x4000, 0x0, 0xE9, -30, -18
	banim_frame_oam 0x0, 0x0, 0xEB, -14, -18
	banim_frame_oam 0x0, 0x4000, 0xAC, -30, -10
	banim_frame_oam 0x8000, 0x0, 0xAE, -14, -10
	banim_frame_oam 0x4000, 0x0, 0xEC, -30, 6
	banim_frame_oam 0x0, 0x0, 0xEE, -14, 6
	banim_frame_oam 0x4000, 0x0, 0xAF, -30, 14
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x1D, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x0, 0x0, 0x9D, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0x7C, 3, -27
	banim_frame_oam 0x8000, 0x0, 0x7E, 3, -11
	banim_frame_oam 0x0, 0x8000, 0xC, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x10, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8C, -16, 8
	banim_frame_oam 0x0, 0x0, 0x90, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_13_r:
	banim_frame_oam 0x0, 0x4000, 0x7C, -1, -26
	banim_frame_oam 0x8000, 0x0, 0x7E, -1, -10
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x15, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -16, 8
	banim_frame_oam 0x0, 0x0, 0x95, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_15_r:
	banim_frame_oam 0x4000, 0x8000, 0x1C, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x5C, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x60, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x64, 8, 0
	banim_frame_oam 0x0, 0x0, 0x44, 8, -8
	banim_frame_oam 0x0, 0x4000, 0x1A, -31, -23
	banim_frame_end
banim_smnm_ro1_2_oam_frame_16_r:
	banim_frame_oam 0x0, 0x4000, 0x1A, -31, -24
	banim_frame_oam 0x8000, 0x0, 0xBE, -23, -8
	banim_frame_oam 0x0, 0x8000, 0x6, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x86, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x4A, 8, -8
	banim_frame_oam 0x0, 0x0, 0x8A, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x6B, 16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x1A, -31, -24
	banim_frame_oam 0x8000, 0x0, 0xBE, -23, -8
	banim_frame_oam 0x0, 0x8000, 0x16, -24, -24
	banim_frame_oam 0x4000, 0x4000, 0x96, -24, 8
	banim_frame_oam 0x8000, 0x0, 0x5A, 8, -8
	banim_frame_oam 0x0, 0x0, 0x9A, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x7B, 16, 0
	banim_frame_end
banim_smnm_ro1_2_oam_frame_17_r:
	banim_frame_oam 0x0, 0x4000, 0x1A, -25, -19
	banim_frame_oam 0x8000, 0x0, 0xBE, -17, -3
	banim_frame_oam 0x0, 0x4000, 0xA0, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xA2, 0, -24
	banim_frame_oam 0x4000, 0x0, 0xE0, -16, -8
	banim_frame_oam 0x0, 0x0, 0xE2, 0, -8
	banim_frame_oam 0x0, 0x0, 0xE3, 8, -8
	banim_frame_oam 0x4000, 0x8000, 0xC5, -16, 0
	banim_frame_oam 0x8000, 0x0, 0xC9, 16, 0
	banim_frame_end
banim_smnm_ro1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -16, -19
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -19
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -25
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -25
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 16, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -25
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x0, 0x3E, -9, -24
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x99, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x7D, 16, 0
	banim_frame_end
banim_smnm_ro1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_smnm_ro1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -26
	banim_frame_oam 0x8000, 0x0, 0xB8, -3, -10
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x4000, 0x9F, -12, -30
	banim_frame_oam 0x0, 0x8000, 0xD, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8D, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -11, -21
	banim_frame_oam 0x0, 0x4000, 0xBD, -19, -5
	banim_frame_oam 0x0, 0x8000, 0x11, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x91, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -12, -14
	banim_frame_oam 0x0, 0x4000, 0xBD, -20, 2
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -14, -14
	banim_frame_oam 0x0, 0x4000, 0xBD, -22, 2
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x95, -16, 8
	banim_frame_oam 0x8000, 0x0, 0x64, 16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -17, -16
	banim_frame_oam 0x0, 0x4000, 0xBD, -25, 0
	banim_frame_oam 0x8000, 0x8000, 0x1D, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x9D, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x2, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x0, 0x82, 0, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -18, -19
	banim_frame_oam 0x0, 0x4000, 0xBD, -26, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -18, -19
	banim_frame_oam 0x0, 0x4000, 0xBD, -26, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xBB, -18, -19
	banim_frame_oam 0x0, 0x4000, 0xBD, -26, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xB6, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xF6, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xB8, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF8, -28, 8
	banim_frame_oam 0x0, 0x4000, 0xBB, -18, -19
	banim_frame_oam 0x8000, 0x0, 0xBE, -18, -3
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA4, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, 8
	banim_frame_oam 0x8000, 0x4000, 0x9F, -16, -19
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA4, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, 8
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_oam 0x8000, 0x4000, 0x9F, -16, -19
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0xA4, -28, -32
	banim_frame_oam 0x4000, 0x0, 0xE4, -28, -16
	banim_frame_oam 0x0, 0x4000, 0xA6, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xE6, -28, 8
	banim_frame_oam 0x8000, 0x4000, 0x9F, -15, -25
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_end
	banim_frame_end
banim_smnm_ro1_2_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0xAA, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xAE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0xEA, -16, -8
	banim_frame_oam 0x0, 0x0, 0xEE, 16, -8
	banim_frame_oam 0x4000, 0x8000, 0xCF, -16, 0
	banim_frame_oam 0x0, 0x4000, 0xD3, 16, 0
	banim_frame_end
banim_smnm_ro1_2_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -9, -17
	banim_frame_oam 0x0, 0x4000, 0xB6, -3, -24
	banim_frame_oam 0x8000, 0x0, 0xB8, 13, -24
	banim_frame_oam 0x4000, 0x0, 0xF6, -3, -8
	banim_frame_oam 0x0, 0x0, 0xF8, 13, -8
	banim_frame_oam 0x0, 0x0, 0xF5, -11, -8
	banim_frame_oam 0x4000, 0x8000, 0xD9, -11, 0
	banim_frame_oam 0x8000, 0x0, 0xDD, 21, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_smnm_ro1_2_script:
banim_smnm_ro1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_2_oam_frame_18_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 54, banim_smnm_ro1_2_oam_frame_19_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_2_oam_frame_18_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_2_oam_frame_18_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 54, banim_smnm_ro1_2_oam_frame_19_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_smnm_ro1_sheet_3, 53, banim_smnm_ro1_2_oam_frame_18_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_smnm_ro1_2_mode_stand_close:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_2_mode_stand:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_2_mode_stand_range:
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_smnm_ro1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 31, banim_smnm_ro1_2_oam_frame_1_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 32, banim_smnm_ro1_2_oam_frame_2_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 33, banim_smnm_ro1_2_oam_frame_3_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 34, banim_smnm_ro1_2_oam_frame_4_r - banim_smnm_ro1_2_oam_r
	banim_code_sound_whoosh
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_1, 36, banim_smnm_ro1_2_oam_frame_5_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 37, banim_smnm_ro1_2_oam_frame_6_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 38, banim_smnm_ro1_2_oam_frame_7_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 39, banim_smnm_ro1_2_oam_frame_8_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 3, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 22, banim_smnm_ro1_2_oam_frame_10_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 23, banim_smnm_ro1_2_oam_frame_11_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 2, banim_smnm_ro1_sheet_2, 24, banim_smnm_ro1_2_oam_frame_12_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_2, 21, banim_smnm_ro1_2_oam_frame_9_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 8, banim_smnm_ro1_sheet_3, 25, banim_smnm_ro1_2_oam_frame_14_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 26, banim_smnm_ro1_2_oam_frame_13_r - banim_smnm_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_sound_whoosh
	banim_code_frame 4, banim_smnm_ro1_sheet_3, 27, banim_smnm_ro1_2_oam_frame_15_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_3, 28, banim_smnm_ro1_2_oam_frame_16_r - banim_smnm_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_smnm_ro1_sheet_3, 30, banim_smnm_ro1_2_oam_frame_17_r - banim_smnm_ro1_2_oam_r
	banim_code_frame 1, banim_smnm_ro1_sheet_0, 0, banim_smnm_ro1_2_oam_frame_0_r - banim_smnm_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_smnm_ro1_2_mode_attack_close - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_attack_close_back - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_attack_close_critical - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_attack_close_critical_back - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_attack_range - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_attack_range_critical - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_dodge_close - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_dodge_range - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_stand_close - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_stand - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_stand_range - banim_smnm_ro1_2_script
	.word banim_smnm_ro1_2_mode_attack_miss - banim_smnm_ro1_2_script
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

