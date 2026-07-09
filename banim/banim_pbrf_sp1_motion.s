@ vim:ft=armv4
	.global banim_pbrf_sp1_script
	.global banim_pbrf_sp1_oam_r
	.global banim_pbrf_sp1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x95
	.section .data.oam_l
banim_pbrf_sp1_oam_l:
banim_pbrf_sp1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x1, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x81, -16, 0
	banim_frame_oam 0x8000, 0x5000, 0x40, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0xC0, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x5000, 0x43, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x3, -16, -40
	banim_frame_oam 0x0, 0x5000, 0xC1, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x81, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x22, -16, -24
	banim_frame_oam 0x0, 0x1000, 0x62, -16, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x87, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0xA5, 8, -24
	banim_frame_oam 0x0, 0x5000, 0xA3, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xE4, 8, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0x48, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x89, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x8B, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x2A, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xA, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x8, 16, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0xC6, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0xC8, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0xCB, -16, 0
	banim_frame_oam 0x0, 0x5000, 0xCC, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0xCE, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0xC, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0xE, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x8C, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x31, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x71, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x8F, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x91, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x11, 32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xCF, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0xD1, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x9000, 0x94, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xD2, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xB3, 32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_71_l:
	banim_frame_oam 0x4000, 0x9000, 0x15, 24, -8
	banim_frame_oam 0x4000, 0x9000, 0x19, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0x55, 24, 8
	banim_frame_oam 0x4000, 0x5000, 0x59, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0x75, 0, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_72_l:
	banim_frame_oam 0x0, 0x9000, 0x7A, 8, -16
	banim_frame_oam 0x0, 0x5000, 0x98, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xD8, 40, 8
	banim_frame_oam 0x0, 0x1000, 0x79, 0, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_73_l:
	banim_frame_oam 0x8000, 0x5000, 0x7D, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x7A, 32, -16
	banim_frame_oam 0x0, 0x5000, 0x98, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xD8, 40, 8
	banim_frame_oam 0x8000, 0x9000, 0x3E, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x79, 0, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_74_l:
	banim_frame_oam 0x8000, 0x5000, 0x7D, 8, -16
	banim_frame_oam 0x8000, 0x5000, 0x7A, 32, -16
	banim_frame_oam 0x0, 0x5000, 0x98, 40, -16
	banim_frame_oam 0x4000, 0x1000, 0xD8, 40, 8
	banim_frame_oam 0x0, 0x5000, 0xBE, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0xFE, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xFC, 16, 8
	banim_frame_oam 0x0, 0x1000, 0x79, 0, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x25, 8, -8
	banim_frame_oam 0x0, 0x1000, 0x65, 8, 8
	banim_frame_oam 0x0, 0x1000, 0x5, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x0, 40, -16
	banim_frame_oam 0x8000, 0x1000, 0x2, 32, -16
	banim_frame_oam 0x4000, 0x1000, 0x40, 40, 8
	banim_frame_oam 0x0, 0x1000, 0x42, 32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0x80, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x82, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0xE3, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xE5, 32, 8
	banim_frame_oam 0x0, 0x5000, 0xA3, 40, -24
	banim_frame_oam 0x8000, 0x1000, 0xA5, 32, -24
	banim_frame_oam 0x0, 0x1000, 0x83, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0x61, 8, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0x86, 8, 8
	banim_frame_oam 0x0, 0x5000, 0xA6, 16, -40
	banim_frame_oam 0x8000, 0x1000, 0xC8, 0, 0
	banim_frame_oam 0x0, 0x1000, 0x84, 24, -24
	banim_frame_oam 0x4000, 0x1000, 0xE6, 24, 8
	banim_frame_oam 0x0, 0x1000, 0x85, 0, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0x88, 0, 8
	banim_frame_oam 0x8000, 0x1000, 0xA, -8, -32
	banim_frame_oam 0x0, 0x1000, 0x4A, -8, -16
	banim_frame_oam 0x0, 0x1000, 0x6A, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x8A, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCA, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xAA, 24, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x5000, 0x6B, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x6D, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xAB, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xAD, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xB, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xC, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x2B, -8, -24
	banim_frame_oam 0x8000, 0x1000, 0xD, -16, -32
	banim_frame_oam 0x0, 0x1000, 0x4D, -16, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x9000, 0xE, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x10, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x8E, -24, -32
	banim_frame_oam 0x0, 0x1000, 0xB0, 8, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_19_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x13, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x91, -24, -32
	banim_frame_oam 0x0, 0x1000, 0x93, -24, -16
	banim_frame_oam 0x0, 0x1000, 0xB3, 8, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_20_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x94, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x16, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x56, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xD4, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xD5, -24, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x5000, 0xCB, -16, -32
	banim_frame_oam 0x0, 0x5000, 0xCD, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xCF, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0xD1, 0, -16
	banim_frame_oam 0x0, 0x5000, 0xD2, 0, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_25_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x22, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x62, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x80, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x82, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x5, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x83, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x85, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0x9000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x28, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x68, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x86, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x88, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_28_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0xB, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x89, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8B, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x2C, 0, -8
	banim_frame_oam 0x0, 0x1000, 0x6C, 0, 8
	banim_frame_oam 0x0, 0x5000, 0x8C, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x8E, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x11, -16, -16
	banim_frame_oam 0x0, 0x5000, 0x8F, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x91, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x9000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x34, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x74, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x92, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x94, 8, 0
	banim_frame_oam 0x0, 0x1000, 0x14, 32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x15, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x37, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x77, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x96, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xB5, 24, 8
	banim_frame_oam 0x0, 0x1000, 0x95, 32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_33_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x1A, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x9A, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xDA, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x99, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xB8, 32, 8
	banim_frame_oam 0x0, 0x1000, 0x98, -16, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_34_l:
	banim_frame_oam 0x4000, 0x5000, 0xC0, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0xC4, 8, -16
	banim_frame_oam 0x4000, 0x5000, 0xE3, 0, -8
	banim_frame_oam 0x4000, 0x1000, 0xE1, 8, -24
	banim_frame_oam 0x4000, 0x9000, 0xC7, -8, 0
	banim_frame_oam 0x4000, 0x5000, 0xCB, 24, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_35_l:
	banim_frame_oam 0x4000, 0x5000, 0xCF, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0xD3, 8, -16
	banim_frame_oam 0x4000, 0x5000, 0xF1, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xF5, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0xD6, -8, 0
	banim_frame_oam 0x4000, 0x1000, 0xEF, 8, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x5000, 0xC0, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0xC4, 8, -16
	banim_frame_oam 0x4000, 0x5000, 0xE2, 8, -8
	banim_frame_oam 0x0, 0x1000, 0xE6, 0, -8
	banim_frame_oam 0x0, 0x1000, 0xE1, 16, -24
	banim_frame_oam 0x0, 0x5000, 0xC7, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0xC9, 0, 0
	banim_frame_oam 0x4000, 0x5000, 0xEA, 24, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_37_l:
	banim_frame_oam 0x4000, 0x9000, 0x2, 16, -16
	banim_frame_oam 0x0, 0x5000, 0x6, 0, -16
	banim_frame_oam 0x4000, 0x9000, 0x44, 0, 0
	banim_frame_oam 0x4000, 0x5000, 0x40, 32, 8
	banim_frame_oam 0x4000, 0x1000, 0x62, 16, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x5000, 0x0, 48, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_38_l:
	banim_frame_oam 0x4000, 0x1000, 0x81, 24, -16
	banim_frame_oam 0x0, 0x1000, 0x83, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0xA4, 16, -8
	banim_frame_oam 0x0, 0x1000, 0xA6, 8, -8
	banim_frame_oam 0x0, 0x5000, 0x87, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x89, 8, 0
	banim_frame_oam 0x4000, 0x5000, 0xCA, 32, 8
	banim_frame_oam 0x4000, 0x1000, 0xA2, 32, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_48_l:
	banim_frame_oam 0x4000, 0x1000, 0xA0, 48, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0x9000, 0xA, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x2E, 8, -8
	banim_frame_oam 0x0, 0x5000, 0x48, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x4A, 8, 0
	banim_frame_oam 0x4000, 0x5000, 0x4B, 32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x5000, 0x8, 48, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0x6F, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x91, 8, -8
	banim_frame_oam 0x0, 0x5000, 0xAF, 24, 0
	banim_frame_oam 0x8000, 0x1000, 0xB1, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xAC, 48, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xEE, 8, 0
	banim_frame_oam 0x0, 0x5000, 0x6D, 32, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x5000, 0x6B, 48, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0x13, 16, -16
	banim_frame_oam 0x8000, 0x5000, 0x17, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0x71, 48, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_51_l:
	banim_frame_oam 0x0, 0x5000, 0x11, 48, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x94, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xD8, 8, 0
	banim_frame_oam 0x4000, 0x1000, 0xF2, 48, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_52_l:
	banim_frame_oam 0x0, 0x5000, 0x92, 48, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x9000, 0x1B, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0x9B, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0x98, 48, 8
	banim_frame_oam 0x0, 0x1000, 0x9A, 40, 8
	banim_frame_oam 0x8000, 0x1000, 0x3A, 40, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_53_l:
	banim_frame_oam 0x8000, 0x1000, 0x39, 48, -16
	banim_frame_oam 0x8000, 0x1000, 0x38, 56, -16
	banim_frame_end
	banim_frame_end
banim_pbrf_sp1_oam_frame_54_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x5000, 0x2, 0, -16
	banim_frame_oam 0x8000, 0x1000, 0x82, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_55_l:
	banim_frame_oam 0x4000, 0x9000, 0xC0, -16, 0
	banim_frame_oam 0x0, 0x1000, 0xC4, -16, -8
	banim_frame_oam 0x8000, 0x5000, 0x43, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0x44, -16, -40
	banim_frame_oam 0x8000, 0x1000, 0x3, 0, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_56_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x7, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x85, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x87, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xA5, 8, -40
	banim_frame_oam 0x0, 0x1000, 0xE5, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xA7, 8, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_57_l:
	banim_frame_oam 0x8000, 0x9000, 0x8, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0xA, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x88, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x8A, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xA8, 16, -24
	banim_frame_oam 0x8000, 0x1000, 0xAA, 8, -16
	banim_frame_oam 0x4000, 0x1000, 0xE8, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xEA, 8, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_58_l:
	banim_frame_oam 0x4000, 0x5000, 0xB, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xF, -24, -24
	banim_frame_oam 0x0, 0x1000, 0x11, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x2B, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x2F, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x31, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x4B, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x4D, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x8B, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x8D, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_59_l:
	banim_frame_oam 0x4000, 0x5000, 0xAB, -8, -24
	banim_frame_oam 0x4000, 0x1000, 0xAF, -24, -24
	banim_frame_oam 0x0, 0x1000, 0xB1, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0xCB, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xCF, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD1, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x4E, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x50, -16, -16
	banim_frame_oam 0x4000, 0x1000, 0x8E, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x90, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_60_l:
	banim_frame_oam 0x4000, 0x5000, 0xEB, 0, -24
	banim_frame_oam 0x4000, 0x1000, 0xEF, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xF1, -24, -24
	banim_frame_oam 0x0, 0x9000, 0x12, -8, -16
	banim_frame_oam 0x4000, 0x1000, 0x92, -24, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_61_l:
	banim_frame_oam 0x4000, 0x9000, 0x16, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x56, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x58, -8, 0
	banim_frame_oam 0x0, 0x1000, 0x59, -16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_62_l:
	banim_frame_oam 0x4000, 0x9000, 0x94, 0, -24
	banim_frame_oam 0x8000, 0x1000, 0x98, -8, -24
	banim_frame_oam 0x0, 0x5000, 0xD2, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xD4, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xD5, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xF5, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xF7, 8, 8
	banim_frame_oam 0x0, 0x1000, 0xB9, -16, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_63_l:
	banim_frame_oam 0x8000, 0x9000, 0x1A, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x1C, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x9A, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x9C, -16, 8
	banim_frame_oam 0x0, 0x5000, 0xBA, 16, -24
	banim_frame_oam 0x8000, 0x1000, 0xBC, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xFA, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xFC, 8, 8
	banim_frame_oam 0x8000, 0x1000, 0xD9, -24, -8
	banim_frame_oam 0x0, 0x1000, 0x99, -24, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_64_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x82, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC2, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xE0, 24, -24
	banim_frame_oam 0x0, 0x5000, 0x3, 8, -40
	banim_frame_oam 0x4000, 0x1000, 0x43, 8, -24
	banim_frame_oam 0x0, 0x5000, 0x63, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_65_l:
	banim_frame_oam 0x0, 0x5000, 0xA3, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0xA5, 0, -32
	banim_frame_oam 0x4000, 0x1000, 0xE3, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xE5, 0, -16
	banim_frame_oam 0x4000, 0x9000, 0x5, -32, -24
	banim_frame_oam 0x8000, 0x1000, 0x9, -40, -24
	banim_frame_oam 0x0, 0x5000, 0x45, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x47, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0xE6, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xEA, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xEC, -32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_66_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, -8, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x8A, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, -16, 0
	banim_frame_oam 0x4000, 0x1000, 0xA8, 8, 8
	banim_frame_oam 0x4000, 0x1000, 0xC8, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x49, 8, -32
	banim_frame_oam 0x0, 0x1000, 0x89, -24, -32
	banim_frame_end
banim_pbrf_sp1_oam_frame_67_l:
	banim_frame_oam 0x4000, 0x9000, 0xD, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0x11, -40, -32
	banim_frame_oam 0x0, 0x5000, 0x51, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x53, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0x4D, -32, -16
	banim_frame_oam 0x4000, 0x5000, 0x8D, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x91, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_68_l:
	banim_frame_oam 0x4000, 0x9000, 0xAE, -32, -32
	banim_frame_oam 0x4000, 0x5000, 0xEE, -32, -16
	banim_frame_oam 0x0, 0x5000, 0xD5, 0, -24
	banim_frame_oam 0x0, 0x5000, 0xB2, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0xB4, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xF2, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xF4, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xB5, -32, 8
	banim_frame_oam 0x4000, 0x1000, 0x95, 8, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x82, -16, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x5, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x83, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x85, -16, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x8, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x86, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x88, -16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_69_l:
	banim_frame_oam 0x8000, 0x9000, 0x1A, -16, -32
	banim_frame_oam 0x0, 0x5000, 0x9A, -16, 0
	banim_frame_oam 0x8000, 0x9000, 0x58, 0, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_70_l:
	banim_frame_oam 0x8000, 0x9000, 0x1C, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x9C, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xDC, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x1E, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x5E, 0, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_24_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0x9000, 0x16, 16, -8
	banim_frame_oam 0x0, 0x5000, 0x1A, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x1C, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0x56, 16, 8
	banim_frame_oam 0x4000, 0x1000, 0x5A, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x5C, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x55, 48, 8
	banim_frame_oam 0x4000, 0x5000, 0x75, 0, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0x1000, 0xD8, 40, 8
	banim_frame_oam 0x0, 0x1000, 0x79, 0, 0
	banim_frame_oam 0x8000, 0x5000, 0x7A, 32, -16
	banim_frame_oam 0x8000, 0x5000, 0x7D, 8, -16
	banim_frame_oam 0x8000, 0x9000, 0x7B, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x99, 40, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0x1000, 0xD8, 40, 8
	banim_frame_oam 0x0, 0x1000, 0x79, 0, 0
	banim_frame_oam 0x8000, 0x5000, 0x7A, 32, -16
	banim_frame_oam 0x8000, 0x5000, 0x7D, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x99, 40, -16
	banim_frame_oam 0x8000, 0x9000, 0x3E, 16, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x1000, 0xD8, 40, 8
	banim_frame_oam 0x0, 0x1000, 0x79, 0, 0
	banim_frame_oam 0x8000, 0x5000, 0x7A, 32, -16
	banim_frame_oam 0x8000, 0x5000, 0x7D, 8, -16
	banim_frame_oam 0x8000, 0x1000, 0x99, 40, -16
	banim_frame_oam 0x0, 0x5000, 0xBE, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0xFE, 16, 0
	banim_frame_oam 0x4000, 0x1000, 0xFC, 16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x1000, 0x15, 48, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x1000, 0x98, 48, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x1B, -8, -16
	banim_frame_oam 0x8000, 0x1000, 0x3D, -16, -8
	banim_frame_oam 0x0, 0x1000, 0x7D, -16, 8
	banim_frame_oam 0x0, 0x5000, 0x9B, 16, 0
	banim_frame_oam 0x8000, 0x1000, 0x9D, 8, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_pbrf_sp1_oam_r:
banim_pbrf_sp1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x1, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x81, 0, 0
	banim_frame_oam 0x8000, 0x4000, 0x40, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xC0, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x4000, 0x43, -8, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -8, -8
	banim_frame_oam 0x0, 0x4000, 0x3, 0, -40
	banim_frame_oam 0x0, 0x4000, 0xC1, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x81, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x22, 8, -24
	banim_frame_oam 0x0, 0x0, 0x62, 8, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x7, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x85, -8, 8
	banim_frame_oam 0x0, 0x0, 0x87, 8, 8
	banim_frame_oam 0x8000, 0x0, 0xA5, -16, -24
	banim_frame_oam 0x0, 0x4000, 0xA3, -24, -40
	banim_frame_oam 0x0, 0x0, 0xE4, -16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0x48, -16, -16
	banim_frame_oam 0x0, 0x4000, 0x89, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x8B, 8, 0
	banim_frame_oam 0x0, 0x0, 0xA8, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x2A, -32, 8
	banim_frame_oam 0x0, 0x0, 0xA, 0, -24
	banim_frame_oam 0x0, 0x4000, 0x8, -32, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0xC6, -8, -16
	banim_frame_oam 0x8000, 0x0, 0xC8, 8, -16
	banim_frame_oam 0x0, 0x4000, 0xC9, -8, 0
	banim_frame_oam 0x8000, 0x0, 0xCB, 8, 0
	banim_frame_oam 0x0, 0x4000, 0xCC, -32, 0
	banim_frame_oam 0x8000, 0x0, 0xCE, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0xC, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0xE, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x8C, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x31, 8, -8
	banim_frame_oam 0x0, 0x0, 0x71, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x8F, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x91, -16, 0
	banim_frame_oam 0x0, 0x0, 0x11, -40, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, 8, -16
	banim_frame_oam 0x0, 0x4000, 0xCF, -32, 0
	banim_frame_oam 0x8000, 0x0, 0xD1, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x8000, 0x94, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xD2, -32, 0
	banim_frame_oam 0x0, 0x0, 0xB3, -40, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_71_r:
	banim_frame_oam 0x4000, 0x8000, 0x15, -56, -8
	banim_frame_oam 0x4000, 0x8000, 0x19, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0x55, -56, 8
	banim_frame_oam 0x4000, 0x4000, 0x59, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0x75, -32, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_72_r:
	banim_frame_oam 0x0, 0x8000, 0x7A, -40, -16
	banim_frame_oam 0x0, 0x4000, 0x98, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xD8, -56, 8
	banim_frame_oam 0x0, 0x0, 0x79, -8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_73_r:
	banim_frame_oam 0x8000, 0x4000, 0x7D, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x7A, -40, -16
	banim_frame_oam 0x0, 0x4000, 0x98, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xD8, -56, 8
	banim_frame_oam 0x8000, 0x8000, 0x3E, -32, -16
	banim_frame_oam 0x0, 0x0, 0x79, -8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_74_r:
	banim_frame_oam 0x8000, 0x4000, 0x7D, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x7A, -40, -16
	banim_frame_oam 0x0, 0x4000, 0x98, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xD8, -56, 8
	banim_frame_oam 0x0, 0x4000, 0xBE, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xFE, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xFC, -32, 8
	banim_frame_oam 0x0, 0x0, 0x79, -8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x25, -16, -8
	banim_frame_oam 0x0, 0x0, 0x65, -16, 8
	banim_frame_oam 0x0, 0x0, 0x5, -8, 0
	banim_frame_oam 0x0, 0x4000, 0x0, -56, -16
	banim_frame_oam 0x8000, 0x0, 0x2, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x40, -56, 8
	banim_frame_oam 0x0, 0x0, 0x42, -40, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0x80, -32, -16
	banim_frame_oam 0x8000, 0x4000, 0x82, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xE3, -56, 8
	banim_frame_oam 0x0, 0x0, 0xE5, -40, 8
	banim_frame_oam 0x0, 0x4000, 0xA3, -56, -24
	banim_frame_oam 0x8000, 0x0, 0xA5, -40, -24
	banim_frame_oam 0x0, 0x0, 0x83, -8, 0
	banim_frame_oam 0x4000, 0x0, 0x61, -24, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -24, -24
	banim_frame_oam 0x4000, 0x0, 0x86, -24, 8
	banim_frame_oam 0x0, 0x4000, 0xA6, -32, -40
	banim_frame_oam 0x8000, 0x0, 0xC8, -8, 0
	banim_frame_oam 0x0, 0x0, 0x84, -32, -24
	banim_frame_oam 0x4000, 0x0, 0xE6, -40, 8
	banim_frame_oam 0x0, 0x0, 0x85, -8, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -16, -24
	banim_frame_oam 0x4000, 0x0, 0x88, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xA, 0, -32
	banim_frame_oam 0x0, 0x0, 0x4A, 0, -16
	banim_frame_oam 0x0, 0x0, 0x6A, 8, -32
	banim_frame_oam 0x0, 0x0, 0x8A, 0, 8
	banim_frame_oam 0x0, 0x0, 0xCA, -24, 8
	banim_frame_oam 0x0, 0x0, 0xAA, -32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x4000, 0x6B, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x6D, 0, -8
	banim_frame_oam 0x4000, 0x0, 0xAB, -16, 8
	banim_frame_oam 0x0, 0x0, 0xAD, 0, 8
	banim_frame_oam 0x0, 0x0, 0xB, -24, 8
	banim_frame_oam 0x0, 0x0, 0xC, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x2B, -8, -24
	banim_frame_oam 0x8000, 0x0, 0xD, 8, -32
	banim_frame_oam 0x0, 0x0, 0x4D, 8, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x8000, 0xE, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x10, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x8E, 8, -32
	banim_frame_oam 0x0, 0x0, 0xB0, -16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_19_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x13, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x91, 8, -32
	banim_frame_oam 0x0, 0x0, 0x93, 16, -16
	banim_frame_oam 0x0, 0x0, 0xB3, -16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_20_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x94, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x16, -8, -8
	banim_frame_oam 0x0, 0x0, 0x56, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD4, -16, 8
	banim_frame_oam 0x0, 0x0, 0xD5, 16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x4000, 0xCB, 0, -32
	banim_frame_oam 0x0, 0x4000, 0xCD, 0, -16
	banim_frame_oam 0x0, 0x4000, 0xCF, 0, 0
	banim_frame_oam 0x8000, 0x0, 0xD1, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xD2, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_25_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x22, 8, -8
	banim_frame_oam 0x0, 0x0, 0x62, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x80, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x82, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x5, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x83, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x85, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0x8000, 0x6, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x28, 8, -8
	banim_frame_oam 0x0, 0x0, 0x68, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x86, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x88, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_28_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0xB, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x89, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x8B, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x2C, -8, -8
	banim_frame_oam 0x0, 0x0, 0x6C, -8, 8
	banim_frame_oam 0x0, 0x4000, 0x8C, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x8E, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x4000, 0x11, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x8F, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x91, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x8000, 0x12, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x34, 8, -8
	banim_frame_oam 0x0, 0x0, 0x74, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x92, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x94, -16, 0
	banim_frame_oam 0x0, 0x0, 0x14, -40, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x15, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x37, 8, -8
	banim_frame_oam 0x0, 0x0, 0x77, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x96, -24, 0
	banim_frame_oam 0x0, 0x0, 0xB5, -32, 8
	banim_frame_oam 0x0, 0x0, 0x95, -40, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_33_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x1A, 0, -16
	banim_frame_oam 0x8000, 0x0, 0x9A, -24, 0
	banim_frame_oam 0x0, 0x0, 0xDA, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x99, -32, 0
	banim_frame_oam 0x0, 0x0, 0xB8, -40, 8
	banim_frame_oam 0x0, 0x0, 0x98, 8, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_34_r:
	banim_frame_oam 0x4000, 0x4000, 0xC0, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xC4, -24, -16
	banim_frame_oam 0x4000, 0x4000, 0xE3, -32, -8
	banim_frame_oam 0x4000, 0x0, 0xE1, -24, -24
	banim_frame_oam 0x4000, 0x8000, 0xC7, -24, 0
	banim_frame_oam 0x4000, 0x4000, 0xCB, -56, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_35_r:
	banim_frame_oam 0x4000, 0x4000, 0xCF, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xD3, -24, -16
	banim_frame_oam 0x4000, 0x4000, 0xF1, -40, -8
	banim_frame_oam 0x0, 0x0, 0xF5, -8, -8
	banim_frame_oam 0x4000, 0x8000, 0xD6, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xEF, -24, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x4000, 0xC0, -56, -16
	banim_frame_oam 0x4000, 0x0, 0xC4, -24, -16
	banim_frame_oam 0x4000, 0x4000, 0xE2, -40, -8
	banim_frame_oam 0x0, 0x0, 0xE6, -8, -8
	banim_frame_oam 0x0, 0x0, 0xE1, -24, -24
	banim_frame_oam 0x0, 0x4000, 0xC7, -24, 0
	banim_frame_oam 0x8000, 0x0, 0xC9, -8, 0
	banim_frame_oam 0x4000, 0x4000, 0xEA, -56, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_37_r:
	banim_frame_oam 0x4000, 0x8000, 0x2, -48, -16
	banim_frame_oam 0x0, 0x4000, 0x6, -16, -16
	banim_frame_oam 0x4000, 0x8000, 0x44, -32, 0
	banim_frame_oam 0x4000, 0x4000, 0x40, -64, 8
	banim_frame_oam 0x4000, 0x0, 0x62, -32, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x4000, 0x0, -64, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_38_r:
	banim_frame_oam 0x4000, 0x0, 0x81, -40, -16
	banim_frame_oam 0x0, 0x0, 0x83, -24, -16
	banim_frame_oam 0x4000, 0x0, 0xA4, -32, -8
	banim_frame_oam 0x0, 0x0, 0xA6, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x87, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x89, -16, 0
	banim_frame_oam 0x4000, 0x4000, 0xCA, -64, 8
	banim_frame_oam 0x4000, 0x0, 0xA2, -48, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_48_r:
	banim_frame_oam 0x4000, 0x0, 0xA0, -64, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0x8000, 0xA, -48, -16
	banim_frame_oam 0x0, 0x0, 0x2E, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x48, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x4A, -16, 0
	banim_frame_oam 0x4000, 0x4000, 0x4B, -64, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x4000, 0x8, -64, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0x6F, -32, -16
	banim_frame_oam 0x0, 0x0, 0x91, -16, -8
	banim_frame_oam 0x0, 0x4000, 0xAF, -40, 0
	banim_frame_oam 0x8000, 0x0, 0xB1, -24, 0
	banim_frame_oam 0x4000, 0x0, 0xAC, -64, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -48, 8
	banim_frame_oam 0x0, 0x0, 0xEE, -16, 0
	banim_frame_oam 0x0, 0x4000, 0x6D, -48, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x4000, 0x6B, -64, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -48, -16
	banim_frame_oam 0x8000, 0x4000, 0x17, -16, -16
	banim_frame_oam 0x4000, 0x0, 0x71, -64, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_51_r:
	banim_frame_oam 0x0, 0x4000, 0x11, -64, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x94, -48, -16
	banim_frame_oam 0x0, 0x0, 0xD8, -16, 0
	banim_frame_oam 0x4000, 0x0, 0xF2, -64, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_52_r:
	banim_frame_oam 0x0, 0x4000, 0x92, -64, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x8000, 0x1B, -40, -24
	banim_frame_oam 0x4000, 0x4000, 0x9B, -40, 8
	banim_frame_oam 0x4000, 0x0, 0x98, -64, 8
	banim_frame_oam 0x0, 0x0, 0x9A, -48, 8
	banim_frame_oam 0x8000, 0x0, 0x3A, -48, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_53_r:
	banim_frame_oam 0x8000, 0x0, 0x39, -56, -16
	banim_frame_oam 0x8000, 0x0, 0x38, -64, -16
	banim_frame_end
	banim_frame_end
banim_pbrf_sp1_oam_frame_54_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x80, 0, 0
	banim_frame_oam 0x8000, 0x4000, 0x2, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x82, -16, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_55_r:
	banim_frame_oam 0x4000, 0x8000, 0xC0, -16, 0
	banim_frame_oam 0x0, 0x0, 0xC4, 8, -8
	banim_frame_oam 0x8000, 0x4000, 0x43, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x44, 8, -40
	banim_frame_oam 0x8000, 0x0, 0x3, -8, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_56_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x7, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x85, -8, 8
	banim_frame_oam 0x0, 0x0, 0x87, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xA5, -24, -40
	banim_frame_oam 0x0, 0x0, 0xE5, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xA7, -16, -24
	banim_frame_end
banim_pbrf_sp1_oam_frame_57_r:
	banim_frame_oam 0x8000, 0x8000, 0x8, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0xA, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x88, -8, 8
	banim_frame_oam 0x0, 0x0, 0x8A, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xA8, -32, -24
	banim_frame_oam 0x8000, 0x0, 0xAA, -16, -16
	banim_frame_oam 0x4000, 0x0, 0xE8, -32, 8
	banim_frame_oam 0x0, 0x0, 0xEA, -16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_58_r:
	banim_frame_oam 0x4000, 0x4000, 0xB, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xF, 8, -24
	banim_frame_oam 0x0, 0x0, 0x11, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0x2B, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x2F, 8, 8
	banim_frame_oam 0x0, 0x0, 0x31, 24, 8
	banim_frame_oam 0x0, 0x4000, 0x4B, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x4D, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x8B, -8, 0
	banim_frame_oam 0x0, 0x0, 0x8D, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_59_r:
	banim_frame_oam 0x4000, 0x4000, 0xAB, -24, -24
	banim_frame_oam 0x4000, 0x0, 0xAF, 8, -24
	banim_frame_oam 0x0, 0x0, 0xB1, 24, -24
	banim_frame_oam 0x4000, 0x4000, 0xCB, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xCF, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD1, 24, 8
	banim_frame_oam 0x0, 0x4000, 0x4E, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x50, 8, -16
	banim_frame_oam 0x4000, 0x0, 0x8E, -8, 0
	banim_frame_oam 0x0, 0x0, 0x90, 8, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_60_r:
	banim_frame_oam 0x4000, 0x4000, 0xEB, -32, -24
	banim_frame_oam 0x4000, 0x0, 0xEF, 0, -24
	banim_frame_oam 0x0, 0x0, 0xF1, 16, -24
	banim_frame_oam 0x0, 0x8000, 0x12, -24, -16
	banim_frame_oam 0x4000, 0x0, 0x92, 8, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_61_r:
	banim_frame_oam 0x4000, 0x8000, 0x16, -24, -16
	banim_frame_oam 0x0, 0x4000, 0x56, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x58, 0, 0
	banim_frame_oam 0x0, 0x0, 0x59, 8, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_62_r:
	banim_frame_oam 0x4000, 0x8000, 0x94, -32, -24
	banim_frame_oam 0x8000, 0x0, 0x98, 0, -24
	banim_frame_oam 0x0, 0x4000, 0xD2, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xD4, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD5, -8, 8
	banim_frame_oam 0x4000, 0x0, 0xF5, -32, 8
	banim_frame_oam 0x0, 0x0, 0xF7, -16, 8
	banim_frame_oam 0x0, 0x0, 0xB9, 8, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_63_r:
	banim_frame_oam 0x8000, 0x8000, 0x1A, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x1C, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x9A, -8, 8
	banim_frame_oam 0x0, 0x0, 0x9C, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xBA, -32, -24
	banim_frame_oam 0x8000, 0x0, 0xBC, -16, -24
	banim_frame_oam 0x4000, 0x0, 0xFA, -32, 8
	banim_frame_oam 0x0, 0x0, 0xFC, -16, 8
	banim_frame_oam 0x8000, 0x0, 0xD9, 16, -8
	banim_frame_oam 0x0, 0x0, 0x99, 16, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_64_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x82, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC2, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE0, -32, -24
	banim_frame_oam 0x0, 0x4000, 0x3, -24, -40
	banim_frame_oam 0x4000, 0x0, 0x43, -24, -24
	banim_frame_oam 0x0, 0x4000, 0x63, -24, 0
	banim_frame_end
banim_pbrf_sp1_oam_frame_65_r:
	banim_frame_oam 0x0, 0x4000, 0xA3, -24, -32
	banim_frame_oam 0x8000, 0x0, 0xA5, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xE3, -24, -16
	banim_frame_oam 0x0, 0x0, 0xE5, -8, -16
	banim_frame_oam 0x4000, 0x8000, 0x5, 0, -24
	banim_frame_oam 0x8000, 0x0, 0x9, 32, -24
	banim_frame_oam 0x0, 0x4000, 0x45, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x47, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xE6, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xEA, 8, 8
	banim_frame_oam 0x0, 0x0, 0xEC, 24, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_66_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -8, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x8A, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, 8, 0
	banim_frame_oam 0x4000, 0x0, 0xA8, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xC8, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x49, -16, -32
	banim_frame_oam 0x0, 0x0, 0x89, 16, -32
	banim_frame_end
banim_pbrf_sp1_oam_frame_67_r:
	banim_frame_oam 0x4000, 0x8000, 0xD, -24, -32
	banim_frame_oam 0x4000, 0x8000, 0x11, 8, -32
	banim_frame_oam 0x0, 0x4000, 0x51, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x53, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0x4D, 0, -16
	banim_frame_oam 0x4000, 0x4000, 0x8D, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x91, 8, 8
	banim_frame_oam 0x0, 0x0, 0x93, 24, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_68_r:
	banim_frame_oam 0x4000, 0x8000, 0xAE, 0, -32
	banim_frame_oam 0x4000, 0x4000, 0xEE, 0, -16
	banim_frame_oam 0x0, 0x4000, 0xD5, -16, -24
	banim_frame_oam 0x0, 0x4000, 0xB2, -8, -8
	banim_frame_oam 0x8000, 0x0, 0xB4, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xF2, -8, 8
	banim_frame_oam 0x0, 0x0, 0xF4, 8, 8
	banim_frame_oam 0x4000, 0x0, 0xB5, 16, 8
	banim_frame_oam 0x4000, 0x0, 0x95, -24, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -8, 8
	banim_frame_oam 0x0, 0x0, 0x82, 8, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x3, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x5, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x83, -8, 8
	banim_frame_oam 0x0, 0x0, 0x85, 8, 8
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x6, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x8, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x86, -8, 8
	banim_frame_oam 0x0, 0x0, 0x88, 8, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_69_r:
	banim_frame_oam 0x8000, 0x8000, 0x1A, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x9A, 0, 0
	banim_frame_oam 0x8000, 0x8000, 0x58, -16, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_70_r:
	banim_frame_oam 0x8000, 0x8000, 0x1C, 0, -40
	banim_frame_oam 0x0, 0x4000, 0x9C, 0, -8
	banim_frame_oam 0x4000, 0x0, 0xDC, 0, 8
	banim_frame_oam 0x0, 0x0, 0x1E, 16, 8
	banim_frame_oam 0x0, 0x0, 0x5E, -8, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_24_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0x8000, 0x16, -48, -8
	banim_frame_oam 0x0, 0x4000, 0x1A, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x1C, 0, -8
	banim_frame_oam 0x4000, 0x4000, 0x56, -48, 8
	banim_frame_oam 0x4000, 0x0, 0x5A, -16, 8
	banim_frame_oam 0x0, 0x0, 0x5C, 0, 8
	banim_frame_oam 0x0, 0x0, 0x55, -56, 8
	banim_frame_oam 0x4000, 0x4000, 0x75, -32, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0x0, 0xD8, -56, 8
	banim_frame_oam 0x0, 0x0, 0x79, -8, 0
	banim_frame_oam 0x8000, 0x4000, 0x7A, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x7D, -16, -16
	banim_frame_oam 0x8000, 0x8000, 0x7B, -32, -16
	banim_frame_oam 0x8000, 0x0, 0x99, -48, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0x0, 0xD8, -56, 8
	banim_frame_oam 0x0, 0x0, 0x79, -8, 0
	banim_frame_oam 0x8000, 0x4000, 0x7A, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x7D, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x99, -48, -16
	banim_frame_oam 0x8000, 0x8000, 0x3E, -32, -16
	banim_frame_end
banim_pbrf_sp1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x0, 0xD8, -56, 8
	banim_frame_oam 0x0, 0x0, 0x79, -8, 0
	banim_frame_oam 0x8000, 0x4000, 0x7A, -40, -16
	banim_frame_oam 0x8000, 0x4000, 0x7D, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x99, -48, -16
	banim_frame_oam 0x0, 0x4000, 0xBE, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xFE, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xFC, -32, 8
	banim_frame_end
banim_pbrf_sp1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x0, 0x15, -56, -8
	banim_frame_end
banim_pbrf_sp1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x0, 0x98, -56, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x1B, -8, -16
	banim_frame_oam 0x8000, 0x0, 0x3D, 8, -8
	banim_frame_oam 0x0, 0x0, 0x7D, 8, 8
	banim_frame_oam 0x0, 0x4000, 0x9B, -32, 0
	banim_frame_oam 0x8000, 0x0, 0x9D, -16, 0
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_pbrf_sp1_script:
banim_pbrf_sp1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 1, banim_pbrf_sp1_oam_frame_1_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 2, banim_pbrf_sp1_oam_frame_2_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 3, banim_pbrf_sp1_oam_frame_3_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 4, banim_pbrf_sp1_oam_frame_4_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 5, banim_pbrf_sp1_oam_frame_5_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 6, banim_pbrf_sp1_oam_frame_6_r - banim_pbrf_sp1_oam_r
	banim_code_frame 16, banim_pbrf_sp1_sheet_0, 7, banim_pbrf_sp1_oam_frame_7_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 8, banim_pbrf_sp1_oam_frame_8_r - banim_pbrf_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 2, banim_pbrf_sp1_sheet_0, 73, banim_pbrf_sp1_oam_frame_9_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 74, banim_pbrf_sp1_oam_frame_10_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 75, banim_pbrf_sp1_oam_frame_11_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 76, banim_pbrf_sp1_oam_frame_12_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 13, banim_pbrf_sp1_oam_frame_13_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 14, banim_pbrf_sp1_oam_frame_14_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 15, banim_pbrf_sp1_oam_frame_15_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 16, banim_pbrf_sp1_oam_frame_16_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 17, banim_pbrf_sp1_oam_frame_17_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 18, banim_pbrf_sp1_oam_frame_18_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 19, banim_pbrf_sp1_oam_frame_19_r - banim_pbrf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 20, banim_pbrf_sp1_oam_frame_20_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbrf_sp1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 16, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_sound_hit_eliwood_promoted
	banim_code_prepare_hp_deplete
	banim_code_hit_normal
	banim_code_frame 2, banim_pbrf_sp1_sheet_0, 77, banim_pbrf_sp1_oam_frame_22_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 78, banim_pbrf_sp1_oam_frame_23_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 78, banim_pbrf_sp1_oam_frame_23_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 78, banim_pbrf_sp1_oam_frame_23_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbrf_sp1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_0, 1, banim_pbrf_sp1_oam_frame_1_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 2, banim_pbrf_sp1_oam_frame_2_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 3, banim_pbrf_sp1_oam_frame_3_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 22, banim_pbrf_sp1_oam_frame_25_r - banim_pbrf_sp1_oam_r
	banim_code_frame 8, banim_pbrf_sp1_sheet_2, 23, banim_pbrf_sp1_oam_frame_26_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 24, banim_pbrf_sp1_oam_frame_27_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 25, banim_pbrf_sp1_oam_frame_28_r - banim_pbrf_sp1_oam_r
	banim_code_frame 30, banim_pbrf_sp1_sheet_2, 26, banim_pbrf_sp1_oam_frame_29_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_2, 27, banim_pbrf_sp1_oam_frame_30_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 28, banim_pbrf_sp1_oam_frame_31_r - banim_pbrf_sp1_oam_r
	banim_code_frame 30, banim_pbrf_sp1_sheet_2, 29, banim_pbrf_sp1_oam_frame_32_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_2, 30, banim_pbrf_sp1_oam_frame_33_r - banim_pbrf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 4, banim_pbrf_sp1_sheet_2, 31, banim_pbrf_sp1_oam_frame_34_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 32, banim_pbrf_sp1_oam_frame_35_r - banim_pbrf_sp1_oam_r
	banim_code_frame 8, banim_pbrf_sp1_sheet_3, 33, banim_pbrf_sp1_oam_frame_36_r - banim_pbrf_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_frame 2, banim_pbrf_sp1_sheet_3, 34, banim_pbrf_sp1_oam_frame_37_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_3, 36, banim_pbrf_sp1_oam_frame_38_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_3, 38, banim_pbrf_sp1_oam_frame_39_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbrf_sp1_sheet_3, 40, banim_pbrf_sp1_oam_frame_40_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_3, 42, banim_pbrf_sp1_oam_frame_41_r - banim_pbrf_sp1_oam_r
	banim_code_frame 12, banim_pbrf_sp1_sheet_3, 44, banim_pbrf_sp1_oam_frame_42_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_pbrf_sp1_sheet_3, 46, banim_pbrf_sp1_oam_frame_43_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 15, banim_pbrf_sp1_oam_frame_15_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 16, banim_pbrf_sp1_oam_frame_16_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 17, banim_pbrf_sp1_oam_frame_17_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 18, banim_pbrf_sp1_oam_frame_18_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 19, banim_pbrf_sp1_oam_frame_19_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 20, banim_pbrf_sp1_oam_frame_20_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 21, banim_pbrf_sp1_oam_frame_44_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbrf_sp1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 8, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 30, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 30, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 4, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_2, 71, banim_pbrf_sp1_oam_frame_45_r - banim_pbrf_sp1_oam_r
	banim_code_frame 8, banim_pbrf_sp1_sheet_3, 72, banim_pbrf_sp1_oam_frame_46_r - banim_pbrf_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_swing_shorter
	banim_code_sound_hit_eliwood_promoted
	banim_code_hit_critical_5
	banim_code_frame 2, banim_pbrf_sp1_sheet_3, 35, banim_pbrf_sp1_oam_frame_47_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_3, 37, banim_pbrf_sp1_oam_frame_48_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_3, 39, banim_pbrf_sp1_oam_frame_49_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 2, banim_pbrf_sp1_sheet_3, 41, banim_pbrf_sp1_oam_frame_50_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_3, 43, banim_pbrf_sp1_oam_frame_51_r - banim_pbrf_sp1_oam_r
	banim_code_frame 12, banim_pbrf_sp1_sheet_3, 45, banim_pbrf_sp1_oam_frame_52_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_pbrf_sp1_sheet_3, 47, banim_pbrf_sp1_oam_frame_53_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 70, banim_pbrf_sp1_oam_frame_24_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 69, banim_pbrf_sp1_oam_frame_21_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbrf_sp1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbrf_sp1_sheet_4, 49, banim_pbrf_sp1_oam_frame_54_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_4, 50, banim_pbrf_sp1_oam_frame_55_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_4, 51, banim_pbrf_sp1_oam_frame_56_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_4, 52, banim_pbrf_sp1_oam_frame_57_r - banim_pbrf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 12, banim_pbrf_sp1_sheet_4, 53, banim_pbrf_sp1_oam_frame_58_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_4, 54, banim_pbrf_sp1_oam_frame_59_r - banim_pbrf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbrf_sp1_sheet_4, 55, banim_pbrf_sp1_oam_frame_60_r - banim_pbrf_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_pbrf_sp1_sheet_4, 56, banim_pbrf_sp1_oam_frame_61_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbrf_sp1_sheet_4, 57, banim_pbrf_sp1_oam_frame_62_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_4, 58, banim_pbrf_sp1_oam_frame_63_r - banim_pbrf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 59, banim_pbrf_sp1_oam_frame_64_r - banim_pbrf_sp1_oam_r
	banim_code_frame 2, banim_pbrf_sp1_sheet_4, 49, banim_pbrf_sp1_oam_frame_54_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbrf_sp1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbrf_sp1_sheet_4, 49, banim_pbrf_sp1_oam_frame_54_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_4, 50, banim_pbrf_sp1_oam_frame_55_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_4, 51, banim_pbrf_sp1_oam_frame_56_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_4, 52, banim_pbrf_sp1_oam_frame_57_r - banim_pbrf_sp1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 4, banim_pbrf_sp1_sheet_4, 53, banim_pbrf_sp1_oam_frame_58_r - banim_pbrf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 60, banim_pbrf_sp1_oam_frame_65_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 61, banim_pbrf_sp1_oam_frame_66_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 62, banim_pbrf_sp1_oam_frame_67_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 63, banim_pbrf_sp1_oam_frame_68_r - banim_pbrf_sp1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 60, banim_pbrf_sp1_oam_frame_65_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 61, banim_pbrf_sp1_oam_frame_66_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 62, banim_pbrf_sp1_oam_frame_67_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 63, banim_pbrf_sp1_oam_frame_68_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_4, 53, banim_pbrf_sp1_oam_frame_58_r - banim_pbrf_sp1_oam_r
	banim_code_frame 8, banim_pbrf_sp1_sheet_4, 54, banim_pbrf_sp1_oam_frame_59_r - banim_pbrf_sp1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_pbrf_sp1_sheet_4, 55, banim_pbrf_sp1_oam_frame_60_r - banim_pbrf_sp1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_pbrf_sp1_sheet_4, 56, banim_pbrf_sp1_oam_frame_61_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbrf_sp1_sheet_4, 57, banim_pbrf_sp1_oam_frame_62_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_4, 58, banim_pbrf_sp1_oam_frame_63_r - banim_pbrf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 59, banim_pbrf_sp1_oam_frame_64_r - banim_pbrf_sp1_oam_r
	banim_code_frame 2, banim_pbrf_sp1_sheet_4, 49, banim_pbrf_sp1_oam_frame_54_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbrf_sp1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbrf_sp1_sheet_4, 49, banim_pbrf_sp1_oam_frame_54_r - banim_pbrf_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 67, banim_pbrf_sp1_oam_frame_69_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_5, 68, banim_pbrf_sp1_oam_frame_70_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 67, banim_pbrf_sp1_oam_frame_69_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_4, 49, banim_pbrf_sp1_oam_frame_54_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbrf_sp1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_pbrf_sp1_sheet_4, 49, banim_pbrf_sp1_oam_frame_54_r - banim_pbrf_sp1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 67, banim_pbrf_sp1_oam_frame_69_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_5, 68, banim_pbrf_sp1_oam_frame_70_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_pbrf_sp1_sheet_5, 67, banim_pbrf_sp1_oam_frame_69_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_4, 49, banim_pbrf_sp1_oam_frame_54_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_pbrf_sp1_mode_stand_close:
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbrf_sp1_mode_stand:
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbrf_sp1_mode_stand_range:
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_pbrf_sp1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 1, banim_pbrf_sp1_oam_frame_1_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 2, banim_pbrf_sp1_oam_frame_2_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 3, banim_pbrf_sp1_oam_frame_3_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 4, banim_pbrf_sp1_oam_frame_4_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 5, banim_pbrf_sp1_oam_frame_5_r - banim_pbrf_sp1_oam_r
	banim_code_frame 3, banim_pbrf_sp1_sheet_0, 6, banim_pbrf_sp1_oam_frame_6_r - banim_pbrf_sp1_oam_r
	banim_code_frame 16, banim_pbrf_sp1_sheet_0, 7, banim_pbrf_sp1_oam_frame_7_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 8, banim_pbrf_sp1_oam_frame_8_r - banim_pbrf_sp1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_sword_slash_air
	banim_code_frame 2, banim_pbrf_sp1_sheet_0, 9, banim_pbrf_sp1_oam_frame_71_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 10, banim_pbrf_sp1_oam_frame_72_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_0, 11, banim_pbrf_sp1_oam_frame_73_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 12, banim_pbrf_sp1_oam_frame_74_r - banim_pbrf_sp1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 13, banim_pbrf_sp1_oam_frame_13_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 14, banim_pbrf_sp1_oam_frame_14_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 15, banim_pbrf_sp1_oam_frame_15_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 16, banim_pbrf_sp1_oam_frame_16_r - banim_pbrf_sp1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 17, banim_pbrf_sp1_oam_frame_17_r - banim_pbrf_sp1_oam_r
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 18, banim_pbrf_sp1_oam_frame_18_r - banim_pbrf_sp1_oam_r
	banim_code_frame 6, banim_pbrf_sp1_sheet_1, 19, banim_pbrf_sp1_oam_frame_19_r - banim_pbrf_sp1_oam_r
	banim_code_start_opposite_turn
	banim_code_sound_step_heavy_quick
	banim_code_frame 4, banim_pbrf_sp1_sheet_1, 20, banim_pbrf_sp1_oam_frame_20_r - banim_pbrf_sp1_oam_r
	banim_code_frame 1, banim_pbrf_sp1_sheet_0, 0, banim_pbrf_sp1_oam_frame_0_r - banim_pbrf_sp1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_pbrf_sp1_mode_attack_close - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_attack_close_back - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_attack_close_critical - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_attack_close_critical_back - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_attack_range - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_attack_range_critical - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_dodge_close - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_dodge_range - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_stand_close - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_stand - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_stand_range - banim_pbrf_sp1_script
	.word banim_pbrf_sp1_mode_attack_miss - banim_pbrf_sp1_script
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

