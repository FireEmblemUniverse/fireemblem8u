@ vim:ft=armv4
	.global banim_drum_mg1_2_script
	.global banim_drum_mg1_2_oam_r
	.global banim_drum_mg1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x77
	.section .data.oam_l
banim_drum_mg1_2_oam_l:
banim_drum_mg1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -21
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xFE, 11, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -21
	banim_frame_oam 0x0, 0x1000, 0xFE, 11, 11
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -21
	banim_frame_oam 0x0, 0x9000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0xE, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x8E, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xFE, 11, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_3_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -21
	banim_frame_oam 0x0, 0x1000, 0xFE, 11, 11
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -24, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -23
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xFD, 11, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -26
	banim_frame_oam 0x0, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x1D, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x99, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x9D, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD9, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xDD, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xFC, 11, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -24
	banim_frame_oam 0x0, 0x1000, 0xFC, 11, 11
	banim_frame_oam 0x4000, 0x9000, 0xA0, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xA4, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xE0, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xE4, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xAC, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x1D, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x5D, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xE5, -32, 0
	banim_frame_end
banim_drum_mg1_2_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -24
	banim_frame_oam 0x0, 0x1000, 0xFC, 11, 11
	banim_frame_oam 0x4000, 0x9000, 0xA6, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xAA, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xEA, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0xCC, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x1D, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x5D, -32, -24
	banim_frame_end
banim_drum_mg1_2_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x5000, 0x9F, 11, -24
	banim_frame_oam 0x0, 0x1000, 0xFC, 11, 11
	banim_frame_oam 0x4000, 0x9000, 0xB0, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xB4, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0xF0, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xF4, -32, 0
	banim_frame_oam 0x4000, 0x5000, 0xEC, -24, 8
	banim_frame_oam 0x4000, 0x9000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x1D, -32, -40
	banim_frame_oam 0x4000, 0x5000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x5D, -32, -24
	banim_frame_end
banim_drum_mg1_2_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x1000, 0xBB, 10, -24
	banim_frame_oam 0x8000, 0x1000, 0xBC, 10, -8
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, 10, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x1000, 0xBB, 7, -24
	banim_frame_oam 0x8000, 0x1000, 0xBC, 7, -8
	banim_frame_oam 0x0, 0x9000, 0x6, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xC, -40, -32
	banim_frame_oam 0x0, 0x1000, 0x4C, -40, -16
	banim_frame_oam 0x8000, 0x1000, 0x6C, -48, -32
	banim_frame_oam 0x0, 0x1000, 0xAC, -48, -16
	banim_frame_oam 0x0, 0x1000, 0xBD, 7, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0xD, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0x11, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x8D, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x91, -32, 0
	banim_frame_oam 0x0, 0x5000, 0x12, -48, -32
	banim_frame_oam 0x4000, 0x1000, 0x52, -48, -16
	banim_frame_oam 0x8000, 0x1000, 0x92, 8, -16
	banim_frame_oam 0x0, 0x1000, 0x72, -40, -8
	banim_frame_oam 0x8000, 0x1000, 0xBB, 10, -24
	banim_frame_oam 0x8000, 0x1000, 0xBC, 10, -8
	banim_frame_oam 0x0, 0x1000, 0xBD, 10, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x14, -16, -32
	banim_frame_oam 0x8000, 0x9000, 0x18, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x94, -16, 0
	banim_frame_oam 0x0, 0x5000, 0x98, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0xBB, 17, -24
	banim_frame_oam 0x8000, 0x1000, 0xBC, 17, -8
	banim_frame_oam 0x0, 0x1000, 0xBD, 17, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x1000, 0xBB, 16, -24
	banim_frame_oam 0x8000, 0x1000, 0xBC, 16, -8
	banim_frame_oam 0x0, 0x9000, 0x1A, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x1E, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x9A, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x9E, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xBF, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xBD, 16, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x1000, 0xBB, 14, -24
	banim_frame_oam 0x8000, 0x1000, 0xBC, 14, -8
	banim_frame_oam 0x4000, 0x9000, 0xC0, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xC4, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xE5, -24, -16
	banim_frame_oam 0x4000, 0x5000, 0xC5, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC9, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xE6, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xEB, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xEF, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xBD, 14, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0xBE, 13, 11
	banim_frame_oam 0x8000, 0x1000, 0xBB, 13, -23
	banim_frame_oam 0x8000, 0x1000, 0xBC, 13, -7
	banim_frame_oam 0x4000, 0x9000, 0xD1, -16, -24
	banim_frame_oam 0x8000, 0x1000, 0xD5, -24, -24
	banim_frame_oam 0x4000, 0x9000, 0xD6, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0xDA, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xFB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xFF, -24, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x5000, 0x76, 12, -22
	banim_frame_oam 0x0, 0x1000, 0xF6, 12, 12
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x84, -24, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_17_l:
	banim_frame_oam 0x8000, 0x5000, 0x76, 10, -21
	banim_frame_oam 0x0, 0x1000, 0xF6, 10, 11
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -24, 8
	banim_frame_oam 0x8000, 0x5000, 0xA, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x8A, -32, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x5000, 0x76, 8, -21
	banim_frame_oam 0x0, 0x1000, 0xF6, 8, 11
	banim_frame_oam 0x0, 0x9000, 0xB, -22, -24
	banim_frame_oam 0x8000, 0x5000, 0xF, -30, -24
	banim_frame_oam 0x4000, 0x5000, 0x8B, -22, 8
	banim_frame_oam 0x0, 0x1000, 0x8F, -30, 8
	banim_frame_end
	.section .data.oam_r
banim_drum_mg1_2_oam_r:
banim_drum_mg1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -21
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0xFE, -19, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -21
	banim_frame_oam 0x0, 0x0, 0xFE, -19, 11
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -21
	banim_frame_oam 0x0, 0x8000, 0xA, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0xE, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x8E, 16, 8
	banim_frame_oam 0x0, 0x0, 0xFE, -19, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_3_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -21
	banim_frame_oam 0x0, 0x0, 0xFE, -19, 11
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -16, 8
	banim_frame_oam 0x0, 0x0, 0x93, 16, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -23
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x94, -16, 8
	banim_frame_oam 0x0, 0x0, 0x98, 16, 8
	banim_frame_oam 0x0, 0x0, 0xFD, -19, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -26
	banim_frame_oam 0x0, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x1D, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x99, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x9D, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD9, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xDD, 16, 8
	banim_frame_oam 0x0, 0x0, 0xFC, -19, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -24
	banim_frame_oam 0x0, 0x0, 0xFC, -19, 11
	banim_frame_oam 0x4000, 0x8000, 0xA0, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xA4, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xE0, -16, 0
	banim_frame_oam 0x0, 0x0, 0xE4, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xAC, -8, 8
	banim_frame_oam 0x4000, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x1D, 16, -40
	banim_frame_oam 0x4000, 0x4000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x5D, 16, -24
	banim_frame_oam 0x0, 0x0, 0xE5, 24, 0
	banim_frame_end
banim_drum_mg1_2_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -24
	banim_frame_oam 0x0, 0x0, 0xFC, -19, 11
	banim_frame_oam 0x4000, 0x8000, 0xA6, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xAA, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xEA, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xCC, -8, 8
	banim_frame_oam 0x4000, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x1D, 16, -40
	banim_frame_oam 0x4000, 0x4000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x5D, 16, -24
	banim_frame_end
banim_drum_mg1_2_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x4000, 0x9F, -19, -24
	banim_frame_oam 0x0, 0x0, 0xFC, -19, 11
	banim_frame_oam 0x4000, 0x8000, 0xB0, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xB4, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xF0, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xF4, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xEC, -8, 8
	banim_frame_oam 0x4000, 0x8000, 0x19, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x1D, 16, -40
	banim_frame_oam 0x4000, 0x4000, 0x59, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x5D, 16, -24
	banim_frame_end
banim_drum_mg1_2_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x0, 0xBB, -18, -24
	banim_frame_oam 0x8000, 0x0, 0xBC, -18, -8
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 16, 0
	banim_frame_oam 0x0, 0x0, 0xBD, -18, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x0, 0xBB, -15, -24
	banim_frame_oam 0x8000, 0x0, 0xBC, -15, -8
	banim_frame_oam 0x0, 0x8000, 0x6, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xC, 32, -32
	banim_frame_oam 0x0, 0x0, 0x4C, 32, -16
	banim_frame_oam 0x8000, 0x0, 0x6C, 40, -32
	banim_frame_oam 0x0, 0x0, 0xAC, 40, -16
	banim_frame_oam 0x0, 0x0, 0xBD, -15, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0xD, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0x11, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x8D, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x91, 24, 0
	banim_frame_oam 0x0, 0x4000, 0x12, 32, -32
	banim_frame_oam 0x4000, 0x0, 0x52, 32, -16
	banim_frame_oam 0x8000, 0x0, 0x92, -16, -16
	banim_frame_oam 0x0, 0x0, 0x72, 32, -8
	banim_frame_oam 0x8000, 0x0, 0xBB, -18, -24
	banim_frame_oam 0x8000, 0x0, 0xBC, -18, -8
	banim_frame_oam 0x0, 0x0, 0xBD, -18, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x14, -16, -32
	banim_frame_oam 0x8000, 0x8000, 0x18, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x94, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x98, 16, 0
	banim_frame_oam 0x8000, 0x0, 0xBB, -25, -24
	banim_frame_oam 0x8000, 0x0, 0xBC, -25, -8
	banim_frame_oam 0x0, 0x0, 0xBD, -25, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x0, 0xBB, -24, -24
	banim_frame_oam 0x8000, 0x0, 0xBC, -24, -8
	banim_frame_oam 0x0, 0x8000, 0x1A, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x1E, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x9A, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x9E, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xBF, 24, 0
	banim_frame_oam 0x0, 0x0, 0xBD, -24, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x0, 0xBB, -22, -24
	banim_frame_oam 0x8000, 0x0, 0xBC, -22, -8
	banim_frame_oam 0x4000, 0x8000, 0xC0, -24, -24
	banim_frame_oam 0x8000, 0x0, 0xC4, 8, -24
	banim_frame_oam 0x0, 0x0, 0xE5, 16, -16
	banim_frame_oam 0x4000, 0x4000, 0xC5, -24, -8
	banim_frame_oam 0x4000, 0x0, 0xC9, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xE6, -16, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xEB, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xEF, 16, 8
	banim_frame_oam 0x0, 0x0, 0xBD, -22, 11
	banim_frame_end
banim_drum_mg1_2_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0xBE, -21, 11
	banim_frame_oam 0x8000, 0x0, 0xBB, -21, -23
	banim_frame_oam 0x8000, 0x0, 0xBC, -21, -7
	banim_frame_oam 0x4000, 0x8000, 0xD1, -16, -24
	banim_frame_oam 0x8000, 0x0, 0xD5, 16, -24
	banim_frame_oam 0x4000, 0x8000, 0xD6, -16, -8
	banim_frame_oam 0x8000, 0x0, 0xDA, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xFB, -16, 8
	banim_frame_oam 0x0, 0x0, 0xFF, 16, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x4000, 0x76, -20, -22
	banim_frame_oam 0x0, 0x0, 0xF6, -20, 12
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x0, 0x0, 0x84, 16, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_17_r:
	banim_frame_oam 0x8000, 0x4000, 0x76, -18, -21
	banim_frame_oam 0x0, 0x0, 0xF6, -18, 11
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x85, -16, 8
	banim_frame_oam 0x0, 0x0, 0x89, 16, 8
	banim_frame_oam 0x8000, 0x4000, 0xA, 24, -24
	banim_frame_oam 0x0, 0x0, 0x8A, 24, 8
	banim_frame_end
banim_drum_mg1_2_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x4000, 0x76, -16, -21
	banim_frame_oam 0x0, 0x0, 0xF6, -16, 11
	banim_frame_oam 0x0, 0x8000, 0xB, -10, -24
	banim_frame_oam 0x8000, 0x4000, 0xF, 22, -24
	banim_frame_oam 0x4000, 0x4000, 0x8B, -10, 8
	banim_frame_oam 0x0, 0x0, 0x8F, 22, 8
	banim_frame_end
	.section .data.script
banim_drum_mg1_2_script:
banim_drum_mg1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_2_oam_frame_17_r - banim_drum_mg1_2_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_2_oam_frame_18_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_2_oam_frame_17_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_2_oam_frame_17_r - banim_drum_mg1_2_oam_r
	banim_code_frame 1, banim_drum_mg1_sheet_2, 18, banim_drum_mg1_2_oam_frame_18_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_drum_mg1_sheet_2, 17, banim_drum_mg1_2_oam_frame_17_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_drum_mg1_2_mode_stand_close:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_2_mode_stand:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_2_mode_stand_range:
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_drum_mg1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_drum_mg1_sheet_0, 0, banim_drum_mg1_2_oam_frame_0_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 1, banim_drum_mg1_2_oam_frame_1_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 2, banim_drum_mg1_2_oam_frame_2_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 3, banim_drum_mg1_2_oam_frame_3_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_0, 4, banim_drum_mg1_2_oam_frame_4_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 5, banim_drum_mg1_2_oam_frame_5_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 6, banim_drum_mg1_2_oam_frame_6_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_0, 7, banim_drum_mg1_2_oam_frame_7_r - banim_drum_mg1_2_oam_r
	banim_code_frame 12, banim_drum_mg1_sheet_0, 8, banim_drum_mg1_2_oam_frame_8_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 9, banim_drum_mg1_2_oam_frame_9_r - banim_drum_mg1_2_oam_r
	banim_code_frame 7, banim_drum_mg1_sheet_1, 10, banim_drum_mg1_2_oam_frame_10_r - banim_drum_mg1_2_oam_r
	banim_code_frame 3, banim_drum_mg1_sheet_1, 11, banim_drum_mg1_2_oam_frame_11_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 12, banim_drum_mg1_2_oam_frame_12_r - banim_drum_mg1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_drum_mg1_sheet_1, 13, banim_drum_mg1_2_oam_frame_13_r - banim_drum_mg1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_drum_mg1_sheet_1, 14, banim_drum_mg1_2_oam_frame_14_r - banim_drum_mg1_2_oam_r
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_drum_mg1_sheet_1, 15, banim_drum_mg1_2_oam_frame_15_r - banim_drum_mg1_2_oam_r
	banim_code_frame 4, banim_drum_mg1_sheet_2, 16, banim_drum_mg1_2_oam_frame_16_r - banim_drum_mg1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_drum_mg1_2_mode_attack_close - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_attack_close_back - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_attack_close_critical - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_attack_close_critical_back - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_attack_range - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_attack_range_critical - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_dodge_close - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_dodge_range - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_stand_close - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_stand - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_stand_range - banim_drum_mg1_2_script
	.word banim_drum_mg1_2_mode_attack_miss - banim_drum_mg1_2_script
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

