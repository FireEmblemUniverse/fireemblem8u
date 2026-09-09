@ vim:ft=armv4
	.global banim_rogm_sw1_script
	.global banim_rogm_sw1_oam_r
	.global banim_rogm_sw1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x8E
	.section .data.oam_l
banim_rogm_sw1_oam_l:
banim_rogm_sw1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x84, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0xA0, -8, -16
	banim_frame_oam 0x4000, 0x9000, 0xA4, -16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0xA8, -8, -16
	banim_frame_oam 0x4000, 0x9000, 0xAC, -8, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0x5000, 0xE0, -8, -8
	banim_frame_oam 0x4000, 0x5000, 0xE4, 0, 0
	banim_frame_oam 0x4000, 0x1000, 0xE8, 0, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_5_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x9000, 0x8, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0x48, 16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0xC, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0xE, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x4C, 32, 8
	banim_frame_oam 0x0, 0x1000, 0x4E, 24, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x5000, 0x68, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0x6A, 24, -16
	banim_frame_oam 0x0, 0x5000, 0x6C, 32, 0
	banim_frame_oam 0x8000, 0x1000, 0x6E, 24, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0xF, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0x11, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x4F, 32, 8
	banim_frame_oam 0x0, 0x1000, 0x51, 24, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x12, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0x14, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x52, 32, 8
	banim_frame_oam 0x0, 0x1000, 0x54, 24, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x5000, 0x15, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0x17, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x55, 32, 8
	banim_frame_oam 0x0, 0x1000, 0x57, 24, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x70, 40, -24
	banim_frame_oam 0x8000, 0x5000, 0x72, 32, -24
	banim_frame_oam 0x0, 0x1000, 0x6F, 40, -32
	banim_frame_oam 0x0, 0x1000, 0x8F, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0xEF, 16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0x73, 40, -24
	banim_frame_oam 0x8000, 0x5000, 0x75, 32, -24
	banim_frame_oam 0x0, 0x1000, 0x6B, 40, -32
	banim_frame_oam 0x0, 0x1000, 0x8B, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0xEB, 16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x5000, 0x76, 40, -24
	banim_frame_oam 0x8000, 0x1000, 0x78, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xB6, 40, -8
	banim_frame_oam 0x0, 0x1000, 0xB8, 32, -8
	banim_frame_oam 0x0, 0x1000, 0x3F, 32, -32
	banim_frame_oam 0x4000, 0x9000, 0x18, 16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_15_l:
	banim_frame_oam 0x0, 0x5000, 0xD6, 40, -16
	banim_frame_oam 0x8000, 0x1000, 0xD8, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0x5F, 32, -32
	banim_frame_oam 0x4000, 0x9000, 0x18, 16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x9000, 0x18, 16, 0
	banim_frame_oam 0x0, 0x5000, 0xD9, 40, -16
	banim_frame_oam 0x8000, 0x1000, 0xDB, 32, -16
	banim_frame_oam 0x8000, 0x1000, 0x9F, 32, -32
	banim_frame_end
banim_rogm_sw1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x9000, 0x18, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x99, 40, -16
	banim_frame_oam 0x8000, 0x1000, 0x9B, 32, -16
	banim_frame_oam 0x0, 0x5000, 0x59, 24, -32
	banim_frame_end
banim_rogm_sw1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, 16, 0
	banim_frame_oam 0x4000, 0x9000, 0x0, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, 24, -24
	banim_frame_end
banim_rogm_sw1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x9000, 0x40, 16, 0
	banim_frame_oam 0x4000, 0x9000, 0x0, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x24, 24, -24
	banim_frame_end
banim_rogm_sw1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x9000, 0x80, 24, -24
	banim_frame_oam 0x4000, 0x5000, 0xC0, 24, -8
	banim_frame_oam 0x4000, 0x5000, 0xE0, 16, 0
	banim_frame_oam 0x4000, 0x5000, 0x18, 16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_58_l:
	banim_frame_oam 0x0, 0x9000, 0x84, 24, -24
	banim_frame_oam 0x8000, 0x1000, 0x44, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x45, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0x38, 24, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x1000, 0x6, 48, -8
	banim_frame_oam 0x4000, 0x5000, 0x58, 16, 8
	banim_frame_oam 0x4000, 0x9000, 0xA8, 16, -16
	banim_frame_oam 0x4000, 0x5000, 0xE8, 16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x1000, 0x65, 48, 0
	banim_frame_oam 0x8000, 0x9000, 0x7, 32, -16
	banim_frame_oam 0x4000, 0x1000, 0x5A, 16, 8
	banim_frame_oam 0x0, 0x5000, 0xAA, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0xEA, 16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, 32, -16
	banim_frame_oam 0x0, 0x1000, 0x46, 48, 0
	banim_frame_oam 0x4000, 0x1000, 0x5A, 16, 8
	banim_frame_oam 0x0, 0x5000, 0xAA, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0xEA, 16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0x66, 48, 0
	banim_frame_oam 0x8000, 0x9000, 0xB, 32, -16
	banim_frame_oam 0x4000, 0x1000, 0x5A, 16, 8
	banim_frame_oam 0x0, 0x5000, 0xAA, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0xEA, 16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x5000, 0xD, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x4D, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0x88, 16, 8
	banim_frame_oam 0x8000, 0x1000, 0x6D, 40, -8
	banim_frame_oam 0x0, 0x1000, 0xEB, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xAB, 16, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_27_l:
	banim_frame_oam 0x0, 0x5000, 0xD, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x4D, 24, 0
	banim_frame_oam 0x0, 0x1000, 0xEB, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xAB, 16, -16
	banim_frame_oam 0x4000, 0x5000, 0xAC, 16, 8
	banim_frame_oam 0x8000, 0x1000, 0x6E, 40, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0xD, 24, -16
	banim_frame_oam 0x4000, 0x1000, 0x4D, 24, 0
	banim_frame_oam 0x4000, 0x5000, 0xCC, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xEB, 16, 0
	banim_frame_oam 0x0, 0x1000, 0xAB, 16, -16
	banim_frame_oam 0x8000, 0x1000, 0x6F, 40, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x9000, 0x10, 16, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_30_l:
	banim_frame_oam 0x0, 0x9000, 0x90, 7, -40
	banim_frame_oam 0x0, 0x1000, 0xF, 39, -8
	banim_frame_oam 0x4000, 0x5000, 0xEC, 7, -8
	banim_frame_oam 0x4000, 0x9000, 0x78, 15, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_31_l:
	banim_frame_oam 0x4000, 0x1000, 0x3E, 8, 8
	banim_frame_oam 0x0, 0x9000, 0x14, 0, -48
	banim_frame_end
banim_rogm_sw1_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x1000, 0x3E, 5, 8
	banim_frame_oam 0x0, 0x9000, 0x94, 0, -48
	banim_frame_end
banim_rogm_sw1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -8, -48
	banim_frame_oam 0x4000, 0x1000, 0x3E, 3, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_34_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, 7, -45
	banim_frame_oam 0x8000, 0x5000, 0x2, -1, -45
	banim_frame_oam 0x4000, 0x1000, 0x3E, 0, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x9000, 0x3, -4, -44
	banim_frame_oam 0x0, 0x1000, 0x7F, -4, -12
	banim_frame_oam 0x4000, 0x1000, 0x5E, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x1E, 8, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x1000, 0x5E, -11, 8
	banim_frame_oam 0x0, 0x1000, 0x1E, 5, 8
	banim_frame_oam 0x0, 0x9000, 0x3, -6, -36
	banim_frame_oam 0x0, 0x1000, 0x7F, -6, -4
	banim_frame_end
banim_rogm_sw1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x7E, 16, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xBE, 16, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x9000, 0x84, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xFE, 16, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x9000, 0x88, -16, -16
	banim_frame_oam 0x0, 0x1000, 0x9F, 16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x9000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xBF, 16, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x1D, 16, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x5D, 16, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xFF, 16, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_48_l:
	banim_frame_oam 0x0, 0x9000, 0x90, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0x9D, 16, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_49_l:
	banim_frame_oam 0x0, 0x9000, 0x94, -16, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_50_l:
	banim_frame_oam 0x0, 0x9000, 0x98, -16, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_56_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0x40, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xC0, -24, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x4, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x6, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_55_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x87, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x2A, 8, 0
	banim_frame_oam 0x0, 0x1000, 0xA, -24, -8
	banim_frame_end
	banim_frame_oam 0x4000, 0x9000, 0x60, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xA0, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0xC2, -24, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x1000, 0x44, 16, 0
	banim_frame_oam 0x0, 0x1000, 0x45, 16, -8
	banim_frame_oam 0x4000, 0x5000, 0x38, 24, 8
	banim_frame_oam 0x8000, 0x9000, 0x5D, 40, -24
	banim_frame_oam 0x8000, 0x5000, 0x5F, 32, -24
	banim_frame_oam 0x8000, 0x1000, 0xA7, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xE7, 24, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_38_l:
	banim_frame_oam 0x8000, 0x5000, 0x5C, 48, -24
	banim_frame_oam 0x0, 0x5000, 0xDE, 32, -24
	banim_frame_end
banim_rogm_sw1_oam_frame_51_l:
	banim_frame_oam 0x4000, 0x1000, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xE3, -16, 8
	banim_frame_oam 0x4000, 0x9000, 0xA7, -16, -16
	banim_frame_oam 0x0, 0x5000, 0xA5, -8, -40
	banim_frame_oam 0x4000, 0x1000, 0xE5, -8, -24
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0xE8, -8, 0
	banim_frame_oam 0x0, 0x1000, 0xEA, -16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_52_l:
	banim_frame_oam 0x8000, 0x9000, 0xB, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0xD, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x8B, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x8D, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xCD, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_53_l:
	banim_frame_oam 0x8000, 0x9000, 0xE, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x10, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x8E, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x90, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xCE, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD0, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_54_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x13, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x91, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x93, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xD1, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xD3, -16, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_rogm_sw1_oam_frame_57_l:
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_rogm_sw1_oam_r:
banim_rogm_sw1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x4, -16, -24
	banim_frame_oam 0x4000, 0x4000, 0x84, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0xA0, -24, -16
	banim_frame_oam 0x4000, 0x8000, 0xA4, -16, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0xA8, -24, -16
	banim_frame_oam 0x4000, 0x8000, 0xAC, -24, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0x4000, 0xE0, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0xE4, -32, 0
	banim_frame_oam 0x4000, 0x0, 0xE8, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_5_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x8000, 0x8, -48, -8
	banim_frame_oam 0x4000, 0x4000, 0x48, -48, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0xC, -48, -8
	banim_frame_oam 0x8000, 0x0, 0xE, -32, -8
	banim_frame_oam 0x4000, 0x0, 0x4C, -48, 8
	banim_frame_oam 0x0, 0x0, 0x4E, -32, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x4000, 0x68, -48, -16
	banim_frame_oam 0x8000, 0x0, 0x6A, -32, -16
	banim_frame_oam 0x0, 0x4000, 0x6C, -48, 0
	banim_frame_oam 0x8000, 0x0, 0x6E, -32, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0xF, -48, -8
	banim_frame_oam 0x8000, 0x0, 0x11, -32, -8
	banim_frame_oam 0x4000, 0x0, 0x4F, -48, 8
	banim_frame_oam 0x0, 0x0, 0x51, -32, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x12, -48, -8
	banim_frame_oam 0x8000, 0x0, 0x14, -32, -8
	banim_frame_oam 0x4000, 0x0, 0x52, -48, 8
	banim_frame_oam 0x0, 0x0, 0x54, -32, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x4000, 0x15, -48, -8
	banim_frame_oam 0x8000, 0x0, 0x17, -32, -8
	banim_frame_oam 0x4000, 0x0, 0x55, -48, 8
	banim_frame_oam 0x0, 0x0, 0x57, -32, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x70, -56, -24
	banim_frame_oam 0x8000, 0x4000, 0x72, -40, -24
	banim_frame_oam 0x0, 0x0, 0x6F, -48, -32
	banim_frame_oam 0x0, 0x0, 0x8F, -32, 0
	banim_frame_oam 0x4000, 0x4000, 0xEF, -48, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0x73, -56, -24
	banim_frame_oam 0x8000, 0x4000, 0x75, -40, -24
	banim_frame_oam 0x0, 0x0, 0x6B, -48, -32
	banim_frame_oam 0x0, 0x0, 0x8B, -32, 0
	banim_frame_oam 0x4000, 0x4000, 0xEB, -48, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x4000, 0x76, -56, -24
	banim_frame_oam 0x8000, 0x0, 0x78, -40, -24
	banim_frame_oam 0x4000, 0x0, 0xB6, -56, -8
	banim_frame_oam 0x0, 0x0, 0xB8, -40, -8
	banim_frame_oam 0x0, 0x0, 0x3F, -40, -32
	banim_frame_oam 0x4000, 0x8000, 0x18, -48, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_15_r:
	banim_frame_oam 0x0, 0x4000, 0xD6, -56, -16
	banim_frame_oam 0x8000, 0x0, 0xD8, -40, -16
	banim_frame_oam 0x8000, 0x0, 0x5F, -40, -32
	banim_frame_oam 0x4000, 0x8000, 0x18, -48, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x8000, 0x18, -48, 0
	banim_frame_oam 0x0, 0x4000, 0xD9, -56, -16
	banim_frame_oam 0x8000, 0x0, 0xDB, -40, -16
	banim_frame_oam 0x8000, 0x0, 0x9F, -40, -32
	banim_frame_end
banim_rogm_sw1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x8000, 0x18, -48, 0
	banim_frame_oam 0x0, 0x4000, 0x99, -56, -16
	banim_frame_oam 0x8000, 0x0, 0x9B, -40, -16
	banim_frame_oam 0x0, 0x4000, 0x59, -40, -32
	banim_frame_end
banim_rogm_sw1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -48, 0
	banim_frame_oam 0x4000, 0x8000, 0x0, -56, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -40, -24
	banim_frame_end
banim_rogm_sw1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x8000, 0x40, -48, 0
	banim_frame_oam 0x4000, 0x8000, 0x0, -56, -16
	banim_frame_oam 0x4000, 0x0, 0x24, -40, -24
	banim_frame_end
banim_rogm_sw1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x8000, 0x80, -56, -24
	banim_frame_oam 0x4000, 0x4000, 0xC0, -56, -8
	banim_frame_oam 0x4000, 0x4000, 0xE0, -48, 0
	banim_frame_oam 0x4000, 0x4000, 0x18, -48, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_58_r:
	banim_frame_oam 0x0, 0x8000, 0x84, -56, -24
	banim_frame_oam 0x8000, 0x0, 0x44, -24, 0
	banim_frame_oam 0x0, 0x0, 0x45, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0x38, -56, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x0, 0x6, -56, -8
	banim_frame_oam 0x4000, 0x4000, 0x58, -48, 8
	banim_frame_oam 0x4000, 0x8000, 0xA8, -48, -16
	banim_frame_oam 0x4000, 0x4000, 0xE8, -48, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x0, 0x65, -56, 0
	banim_frame_oam 0x8000, 0x8000, 0x7, -48, -16
	banim_frame_oam 0x4000, 0x0, 0x5A, -32, 8
	banim_frame_oam 0x0, 0x4000, 0xAA, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xEA, -32, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -48, -16
	banim_frame_oam 0x0, 0x0, 0x46, -56, 0
	banim_frame_oam 0x4000, 0x0, 0x5A, -32, 8
	banim_frame_oam 0x0, 0x4000, 0xAA, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xEA, -32, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0x66, -56, 0
	banim_frame_oam 0x8000, 0x8000, 0xB, -48, -16
	banim_frame_oam 0x4000, 0x0, 0x5A, -32, 8
	banim_frame_oam 0x0, 0x4000, 0xAA, -32, -16
	banim_frame_oam 0x4000, 0x0, 0xEA, -32, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x4000, 0xD, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x4D, -40, 0
	banim_frame_oam 0x4000, 0x4000, 0x88, -48, 8
	banim_frame_oam 0x8000, 0x0, 0x6D, -48, -8
	banim_frame_oam 0x0, 0x0, 0xEB, -24, 0
	banim_frame_oam 0x0, 0x0, 0xAB, -24, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_27_r:
	banim_frame_oam 0x0, 0x4000, 0xD, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x4D, -40, 0
	banim_frame_oam 0x0, 0x0, 0xEB, -24, 0
	banim_frame_oam 0x0, 0x0, 0xAB, -24, -16
	banim_frame_oam 0x4000, 0x4000, 0xAC, -48, 8
	banim_frame_oam 0x8000, 0x0, 0x6E, -48, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0xD, -40, -16
	banim_frame_oam 0x4000, 0x0, 0x4D, -40, 0
	banim_frame_oam 0x4000, 0x4000, 0xCC, -48, 8
	banim_frame_oam 0x0, 0x0, 0xEB, -24, 0
	banim_frame_oam 0x0, 0x0, 0xAB, -24, -16
	banim_frame_oam 0x8000, 0x0, 0x6F, -48, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -48, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_30_r:
	banim_frame_oam 0x0, 0x8000, 0x90, -39, -40
	banim_frame_oam 0x0, 0x0, 0xF, -47, -8
	banim_frame_oam 0x4000, 0x4000, 0xEC, -39, -8
	banim_frame_oam 0x4000, 0x8000, 0x78, -47, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_31_r:
	banim_frame_oam 0x4000, 0x0, 0x3E, -24, 8
	banim_frame_oam 0x0, 0x8000, 0x14, -32, -48
	banim_frame_end
banim_rogm_sw1_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x0, 0x3E, -21, 8
	banim_frame_oam 0x0, 0x8000, 0x94, -32, -48
	banim_frame_end
banim_rogm_sw1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -24, -48
	banim_frame_oam 0x4000, 0x0, 0x3E, -19, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_34_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -23, -45
	banim_frame_oam 0x8000, 0x4000, 0x2, -7, -45
	banim_frame_oam 0x4000, 0x0, 0x3E, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x8000, 0x3, -28, -44
	banim_frame_oam 0x0, 0x0, 0x7F, -4, -12
	banim_frame_oam 0x4000, 0x0, 0x5E, -8, 8
	banim_frame_oam 0x0, 0x0, 0x1E, -16, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x0, 0x5E, -5, 8
	banim_frame_oam 0x0, 0x0, 0x1E, -13, 8
	banim_frame_oam 0x0, 0x8000, 0x3, -26, -36
	banim_frame_oam 0x0, 0x0, 0x7F, -2, -4
	banim_frame_end
banim_rogm_sw1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x7E, -24, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xBE, -24, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x8000, 0x84, -16, -16
	banim_frame_oam 0x0, 0x0, 0xFE, -24, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x8000, 0x88, -16, -16
	banim_frame_oam 0x0, 0x0, 0x9F, -24, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x8000, 0x8C, -16, -16
	banim_frame_oam 0x8000, 0x0, 0xBF, -24, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x1D, -24, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x5D, -24, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -16, -16
	banim_frame_oam 0x0, 0x0, 0xFF, -24, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_48_r:
	banim_frame_oam 0x0, 0x8000, 0x90, -16, -16
	banim_frame_oam 0x8000, 0x0, 0x9D, -24, -8
	banim_frame_end
banim_rogm_sw1_oam_frame_49_r:
	banim_frame_oam 0x0, 0x8000, 0x94, -16, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_50_r:
	banim_frame_oam 0x0, 0x8000, 0x98, -16, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_56_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0x40, -8, 8
	banim_frame_oam 0x4000, 0x0, 0xC0, 8, -16
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x4, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x6, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x84, -8, 8
	banim_frame_oam 0x0, 0x0, 0x86, 8, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_55_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -8, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x87, -8, 8
	banim_frame_oam 0x0, 0x0, 0x89, 8, 8
	banim_frame_oam 0x0, 0x0, 0x2A, -16, 0
	banim_frame_oam 0x0, 0x0, 0xA, 16, -8
	banim_frame_end
	banim_frame_oam 0x4000, 0x8000, 0x60, -8, -8
	banim_frame_oam 0x4000, 0x4000, 0xA0, -8, 8
	banim_frame_oam 0x4000, 0x0, 0xC2, 8, -16
	banim_frame_end
banim_rogm_sw1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x0, 0x44, -24, 0
	banim_frame_oam 0x0, 0x0, 0x45, -24, -8
	banim_frame_oam 0x4000, 0x4000, 0x38, -56, 8
	banim_frame_oam 0x8000, 0x8000, 0x5D, -56, -24
	banim_frame_oam 0x8000, 0x4000, 0x5F, -40, -24
	banim_frame_oam 0x8000, 0x0, 0xA7, -32, -16
	banim_frame_oam 0x0, 0x0, 0xE7, -32, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_38_r:
	banim_frame_oam 0x8000, 0x4000, 0x5C, -56, -24
	banim_frame_oam 0x0, 0x4000, 0xDE, -48, -24
	banim_frame_end
banim_rogm_sw1_oam_frame_51_r:
	banim_frame_oam 0x4000, 0x0, 0xE1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xE3, 8, 8
	banim_frame_oam 0x4000, 0x8000, 0xA7, -16, -16
	banim_frame_oam 0x0, 0x4000, 0xA5, -8, -40
	banim_frame_oam 0x4000, 0x0, 0xE5, -8, -24
	banim_frame_oam 0x0, 0x0, 0xE0, 8, -24
	banim_frame_oam 0x4000, 0x0, 0xE8, -8, 0
	banim_frame_oam 0x0, 0x0, 0xEA, 8, 0
	banim_frame_end
banim_rogm_sw1_oam_frame_52_r:
	banim_frame_oam 0x8000, 0x8000, 0xB, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0xD, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x8B, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x8D, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xCB, -8, 8
	banim_frame_oam 0x0, 0x0, 0xCD, 8, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_53_r:
	banim_frame_oam 0x8000, 0x8000, 0xE, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x10, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x8E, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x90, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xCE, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD0, 8, 8
	banim_frame_end
banim_rogm_sw1_oam_frame_54_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x13, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x91, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x93, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xD1, -8, 8
	banim_frame_oam 0x0, 0x0, 0xD3, 8, 8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
banim_rogm_sw1_oam_frame_57_r:
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_rogm_sw1_script:
banim_rogm_sw1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 1, banim_rogm_sw1_oam_frame_1_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 2, banim_rogm_sw1_oam_frame_2_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_0, 3, banim_rogm_sw1_oam_frame_3_r - banim_rogm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 4, banim_rogm_sw1_oam_frame_4_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 9, banim_rogm_sw1_oam_frame_6_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 10, banim_rogm_sw1_oam_frame_7_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 11, banim_rogm_sw1_oam_frame_8_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 12, banim_rogm_sw1_oam_frame_9_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 13, banim_rogm_sw1_oam_frame_10_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 14, banim_rogm_sw1_oam_frame_11_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 15, banim_rogm_sw1_oam_frame_12_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 16, banim_rogm_sw1_oam_frame_13_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 17, banim_rogm_sw1_oam_frame_14_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 18, banim_rogm_sw1_oam_frame_15_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 19, banim_rogm_sw1_oam_frame_16_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 20, banim_rogm_sw1_oam_frame_17_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 21, banim_rogm_sw1_oam_frame_18_r - banim_rogm_sw1_oam_r
	banim_code_frame 8, banim_rogm_sw1_sheet_1, 22, banim_rogm_sw1_oam_frame_19_r - banim_rogm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 23, banim_rogm_sw1_oam_frame_20_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 55, banim_rogm_sw1_oam_frame_21_r - banim_rogm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_rogm_sw1_sheet_1, 25, banim_rogm_sw1_oam_frame_22_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_rogm_sw1_sheet_1, 26, banim_rogm_sw1_oam_frame_23_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_1, 27, banim_rogm_sw1_oam_frame_24_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 28, banim_rogm_sw1_oam_frame_25_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 29, banim_rogm_sw1_oam_frame_26_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 30, banim_rogm_sw1_oam_frame_27_r - banim_rogm_sw1_oam_r
	banim_code_frame 20, banim_rogm_sw1_sheet_1, 31, banim_rogm_sw1_oam_frame_28_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 32, banim_rogm_sw1_oam_frame_29_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 33, banim_rogm_sw1_oam_frame_30_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 34, banim_rogm_sw1_oam_frame_31_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 35, banim_rogm_sw1_oam_frame_32_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 36, banim_rogm_sw1_oam_frame_33_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 37, banim_rogm_sw1_oam_frame_34_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 38, banim_rogm_sw1_oam_frame_35_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 39, banim_rogm_sw1_oam_frame_36_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 2, banim_rogm_sw1_oam_frame_2_r - banim_rogm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 2, banim_rogm_sw1_oam_frame_2_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 1, banim_rogm_sw1_oam_frame_1_r - banim_rogm_sw1_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 8, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 56, banim_rogm_sw1_oam_frame_38_r - banim_rogm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 20, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 1, banim_rogm_sw1_oam_frame_1_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 40, banim_rogm_sw1_oam_frame_40_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 41, banim_rogm_sw1_oam_frame_41_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 42, banim_rogm_sw1_oam_frame_42_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 43, banim_rogm_sw1_oam_frame_43_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 40, banim_rogm_sw1_oam_frame_40_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 41, banim_rogm_sw1_oam_frame_41_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 42, banim_rogm_sw1_oam_frame_42_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 43, banim_rogm_sw1_oam_frame_43_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 44, banim_rogm_sw1_oam_frame_44_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 45, banim_rogm_sw1_oam_frame_45_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 46, banim_rogm_sw1_oam_frame_46_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 47, banim_rogm_sw1_oam_frame_47_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 48, banim_rogm_sw1_oam_frame_48_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 45, banim_rogm_sw1_oam_frame_45_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 46, banim_rogm_sw1_oam_frame_46_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 47, banim_rogm_sw1_oam_frame_47_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 48, banim_rogm_sw1_oam_frame_48_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_2, 49, banim_rogm_sw1_oam_frame_49_r - banim_rogm_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 24, banim_rogm_sw1_sheet_2, 50, banim_rogm_sw1_oam_frame_50_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_0, 3, banim_rogm_sw1_oam_frame_3_r - banim_rogm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 4, banim_rogm_sw1_oam_frame_4_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 9, banim_rogm_sw1_oam_frame_6_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 10, banim_rogm_sw1_oam_frame_7_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 11, banim_rogm_sw1_oam_frame_8_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 12, banim_rogm_sw1_oam_frame_9_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 13, banim_rogm_sw1_oam_frame_10_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 14, banim_rogm_sw1_oam_frame_11_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 15, banim_rogm_sw1_oam_frame_12_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 16, banim_rogm_sw1_oam_frame_13_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 17, banim_rogm_sw1_oam_frame_14_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 18, banim_rogm_sw1_oam_frame_15_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 19, banim_rogm_sw1_oam_frame_16_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 20, banim_rogm_sw1_oam_frame_17_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 21, banim_rogm_sw1_oam_frame_18_r - banim_rogm_sw1_oam_r
	banim_code_frame 8, banim_rogm_sw1_sheet_1, 22, banim_rogm_sw1_oam_frame_19_r - banim_rogm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 23, banim_rogm_sw1_oam_frame_20_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 55, banim_rogm_sw1_oam_frame_21_r - banim_rogm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_1
	banim_code_frame 1, banim_rogm_sw1_sheet_1, 25, banim_rogm_sw1_oam_frame_22_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_rogm_sw1_sheet_1, 26, banim_rogm_sw1_oam_frame_23_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_1, 27, banim_rogm_sw1_oam_frame_24_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 28, banim_rogm_sw1_oam_frame_25_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 29, banim_rogm_sw1_oam_frame_26_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 30, banim_rogm_sw1_oam_frame_27_r - banim_rogm_sw1_oam_r
	banim_code_frame 20, banim_rogm_sw1_sheet_1, 31, banim_rogm_sw1_oam_frame_28_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 32, banim_rogm_sw1_oam_frame_29_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 33, banim_rogm_sw1_oam_frame_30_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 34, banim_rogm_sw1_oam_frame_31_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 35, banim_rogm_sw1_oam_frame_32_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 36, banim_rogm_sw1_oam_frame_33_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 37, banim_rogm_sw1_oam_frame_34_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 38, banim_rogm_sw1_oam_frame_35_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 39, banim_rogm_sw1_oam_frame_36_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 2, banim_rogm_sw1_oam_frame_2_r - banim_rogm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 2, banim_rogm_sw1_oam_frame_2_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 1, banim_rogm_sw1_oam_frame_1_r - banim_rogm_sw1_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_sound_weapon_stance
	banim_code_frame 24, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 8, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 56, banim_rogm_sw1_oam_frame_38_r - banim_rogm_sw1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_1
	banim_code_frame 1, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 20, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 6, banim_rogm_sw1_oam_frame_37_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 7, banim_rogm_sw1_oam_frame_39_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_sound_step_heavy
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 57, banim_rogm_sw1_oam_frame_51_r - banim_rogm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 58, banim_rogm_sw1_oam_frame_52_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 57, banim_rogm_sw1_oam_frame_51_r - banim_rogm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 57, banim_rogm_sw1_oam_frame_51_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 58, banim_rogm_sw1_oam_frame_52_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 59, banim_rogm_sw1_oam_frame_53_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 60, banim_rogm_sw1_oam_frame_54_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 59, banim_rogm_sw1_oam_frame_53_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 60, banim_rogm_sw1_oam_frame_54_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 59, banim_rogm_sw1_oam_frame_53_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 60, banim_rogm_sw1_oam_frame_54_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 59, banim_rogm_sw1_oam_frame_53_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 60, banim_rogm_sw1_oam_frame_54_r - banim_rogm_sw1_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 58, banim_rogm_sw1_oam_frame_52_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_rogm_sw1_sheet_3, 57, banim_rogm_sw1_oam_frame_51_r - banim_rogm_sw1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 53, banim_rogm_sw1_oam_frame_55_r - banim_rogm_sw1_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 51, banim_rogm_sw1_oam_frame_56_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 64, banim_rogm_sw1_oam_frame_57_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_rogm_sw1_sheet_3, 53, banim_rogm_sw1_oam_frame_55_r - banim_rogm_sw1_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_3, 51, banim_rogm_sw1_oam_frame_56_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 64, banim_rogm_sw1_oam_frame_57_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_rogm_sw1_mode_stand_close:
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_rogm_sw1_mode_stand:
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_rogm_sw1_mode_stand_range:
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_rogm_sw1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 1, banim_rogm_sw1_oam_frame_1_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 2, banim_rogm_sw1_oam_frame_2_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_0, 3, banim_rogm_sw1_oam_frame_3_r - banim_rogm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 4, banim_rogm_sw1_oam_frame_4_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 5, banim_rogm_sw1_oam_frame_5_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 9, banim_rogm_sw1_oam_frame_6_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 10, banim_rogm_sw1_oam_frame_7_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 11, banim_rogm_sw1_oam_frame_8_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 12, banim_rogm_sw1_oam_frame_9_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 13, banim_rogm_sw1_oam_frame_10_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 14, banim_rogm_sw1_oam_frame_11_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 15, banim_rogm_sw1_oam_frame_12_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 16, banim_rogm_sw1_oam_frame_13_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 17, banim_rogm_sw1_oam_frame_14_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 18, banim_rogm_sw1_oam_frame_15_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 19, banim_rogm_sw1_oam_frame_16_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 20, banim_rogm_sw1_oam_frame_17_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 21, banim_rogm_sw1_oam_frame_18_r - banim_rogm_sw1_oam_r
	banim_code_frame 8, banim_rogm_sw1_sheet_1, 22, banim_rogm_sw1_oam_frame_19_r - banim_rogm_sw1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 23, banim_rogm_sw1_oam_frame_20_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 24, banim_rogm_sw1_oam_frame_58_r - banim_rogm_sw1_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_1, 25, banim_rogm_sw1_oam_frame_22_r - banim_rogm_sw1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 5, banim_rogm_sw1_sheet_1, 26, banim_rogm_sw1_oam_frame_23_r - banim_rogm_sw1_oam_r
	banim_code_frame 4, banim_rogm_sw1_sheet_1, 27, banim_rogm_sw1_oam_frame_24_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 28, banim_rogm_sw1_oam_frame_25_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 29, banim_rogm_sw1_oam_frame_26_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 30, banim_rogm_sw1_oam_frame_27_r - banim_rogm_sw1_oam_r
	banim_code_frame 20, banim_rogm_sw1_sheet_1, 31, banim_rogm_sw1_oam_frame_28_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_1, 32, banim_rogm_sw1_oam_frame_29_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 33, banim_rogm_sw1_oam_frame_30_r - banim_rogm_sw1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 34, banim_rogm_sw1_oam_frame_31_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_1, 35, banim_rogm_sw1_oam_frame_32_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 36, banim_rogm_sw1_oam_frame_33_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 37, banim_rogm_sw1_oam_frame_34_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_2, 38, banim_rogm_sw1_oam_frame_35_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_2, 39, banim_rogm_sw1_oam_frame_36_r - banim_rogm_sw1_oam_r
	banim_code_frame 2, banim_rogm_sw1_sheet_0, 2, banim_rogm_sw1_oam_frame_2_r - banim_rogm_sw1_oam_r
	banim_code_sound_wing_flap
	banim_code_start_opposite_turn
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 2, banim_rogm_sw1_oam_frame_2_r - banim_rogm_sw1_oam_r
	banim_code_frame 3, banim_rogm_sw1_sheet_0, 1, banim_rogm_sw1_oam_frame_1_r - banim_rogm_sw1_oam_r
	banim_code_frame 1, banim_rogm_sw1_sheet_0, 0, banim_rogm_sw1_oam_frame_0_r - banim_rogm_sw1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_rogm_sw1_mode_attack_close - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_attack_close_back - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_attack_close_critical - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_attack_close_critical_back - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_attack_range - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_attack_range_critical - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_dodge_close - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_dodge_range - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_stand_close - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_stand - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_stand_range - banim_rogm_sw1_script
	.word banim_rogm_sw1_mode_attack_miss - banim_rogm_sw1_script
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

