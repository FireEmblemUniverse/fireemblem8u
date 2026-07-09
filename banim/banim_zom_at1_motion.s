@ vim:ft=armv4
	.global banim_zom_at1_script
	.global banim_zom_at1_oam_r
	.global banim_zom_at1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x9F
	.section .data.oam_l
banim_zom_at1_oam_l:
banim_zom_at1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -20, -16
	banim_frame_oam 0x0, 0x1000, 0x4, -4, -24
	banim_frame_end
banim_zom_at1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xE4, -20, 8
	banim_frame_oam 0x4000, 0x1000, 0x24, -4, -24
	banim_frame_end
banim_zom_at1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x6, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x45, -20, 8
	banim_frame_oam 0x0, 0x1000, 0x5, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0x44, 20, -8
	banim_frame_end
banim_zom_at1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x1000, 0x65, -20, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, 4, -24
	banim_frame_oam 0x8000, 0x9000, 0x86, 4, -16
	banim_frame_oam 0x8000, 0x5000, 0x88, -4, -16
	banim_frame_oam 0x8000, 0x1000, 0xC9, -12, 0
	banim_frame_end
banim_zom_at1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, 4, -16
	banim_frame_oam 0x8000, 0x5000, 0xC, -4, -16
	banim_frame_oam 0x0, 0x1000, 0xE5, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0xA4, 12, -24
	banim_frame_oam 0x0, 0x1000, 0xC4, 20, -16
	banim_frame_oam 0x0, 0x1000, 0xC5, 4, -24
	banim_frame_end
banim_zom_at1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x8A, 4, -16
	banim_frame_oam 0x8000, 0x5000, 0x8C, -4, -16
	banim_frame_oam 0x0, 0x1000, 0xA9, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 12, -24
	banim_frame_end
banim_zom_at1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, 4, -16
	banim_frame_oam 0x8000, 0x5000, 0x11, -4, -16
	banim_frame_oam 0x4000, 0x1000, 0x4D, 4, -24
	banim_frame_oam 0x0, 0x1000, 0xE, -12, 8
	banim_frame_oam 0x8000, 0x1000, 0xD, 20, -8
	banim_frame_end
banim_zom_at1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x2E, -12, 8
	banim_frame_oam 0x8000, 0x1000, 0x8D, -4, 0
	banim_frame_oam 0x4000, 0x1000, 0x6D, 12, -24
	banim_frame_oam 0x8000, 0x9000, 0x8F, 12, -16
	banim_frame_oam 0x8000, 0x5000, 0x91, 4, -16
	banim_frame_end
banim_zom_at1_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x65, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, 12, -24
	banim_frame_oam 0x8000, 0x9000, 0x86, 12, -16
	banim_frame_oam 0x8000, 0x5000, 0x88, 4, -16
	banim_frame_oam 0x8000, 0x1000, 0xC9, -4, 0
	banim_frame_end
banim_zom_at1_oam_frame_9_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, 12, -16
	banim_frame_oam 0x8000, 0x5000, 0xC, 4, -16
	banim_frame_oam 0x0, 0x1000, 0xE5, -4, 8
	banim_frame_oam 0x4000, 0x1000, 0xA4, 20, -24
	banim_frame_oam 0x0, 0x1000, 0xC4, 28, -16
	banim_frame_oam 0x0, 0x1000, 0xC5, 12, -24
	banim_frame_end
banim_zom_at1_oam_frame_10_l:
	banim_frame_oam 0x8000, 0x9000, 0x8A, 12, -16
	banim_frame_oam 0x8000, 0x5000, 0x8C, 4, -16
	banim_frame_oam 0x0, 0x1000, 0xA9, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 20, -24
	banim_frame_end
banim_zom_at1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0xF, 12, -16
	banim_frame_oam 0x8000, 0x5000, 0x11, 4, -16
	banim_frame_oam 0x4000, 0x1000, 0x4D, 12, -24
	banim_frame_oam 0x0, 0x1000, 0xE, -4, 8
	banim_frame_oam 0x8000, 0x1000, 0xD, 28, -8
	banim_frame_end
banim_zom_at1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x1000, 0x2E, -4, 8
	banim_frame_oam 0x8000, 0x1000, 0x8D, 4, 0
	banim_frame_oam 0x4000, 0x1000, 0x6D, 20, -24
	banim_frame_oam 0x8000, 0x9000, 0x8F, 20, -16
	banim_frame_oam 0x8000, 0x5000, 0x91, 12, -16
	banim_frame_end
banim_zom_at1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x1000, 0x65, -4, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, 20, -24
	banim_frame_oam 0x8000, 0x9000, 0x86, 20, -16
	banim_frame_oam 0x8000, 0x5000, 0x88, 12, -16
	banim_frame_oam 0x8000, 0x1000, 0xC9, 4, 0
	banim_frame_end
banim_zom_at1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0x9000, 0xA, 20, -16
	banim_frame_oam 0x8000, 0x5000, 0xC, 12, -16
	banim_frame_oam 0x0, 0x1000, 0xE5, 4, 8
	banim_frame_oam 0x4000, 0x1000, 0xA4, 28, -24
	banim_frame_oam 0x0, 0x1000, 0xC4, 36, -16
	banim_frame_oam 0x0, 0x1000, 0xC5, 20, -24
	banim_frame_end
banim_zom_at1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x8A, 20, -16
	banim_frame_oam 0x8000, 0x5000, 0x8C, 12, -16
	banim_frame_oam 0x0, 0x1000, 0xA9, 4, 8
	banim_frame_oam 0x0, 0x1000, 0x89, 28, -24
	banim_frame_end
banim_zom_at1_oam_frame_16_l:
	banim_frame_oam 0x4000, 0x1000, 0xCD, 20, -24
	banim_frame_oam 0x0, 0x1000, 0x8E, 4, 8
	banim_frame_oam 0x0, 0x1000, 0xAE, 12, -24
	banim_frame_oam 0x8000, 0x9000, 0x12, 20, -16
	banim_frame_oam 0x8000, 0x5000, 0x14, 12, -16
	banim_frame_end
banim_zom_at1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x1000, 0xED, 12, -24
	banim_frame_oam 0x8000, 0x9000, 0x92, 20, -16
	banim_frame_oam 0x8000, 0x5000, 0x94, 12, -16
	banim_frame_oam 0x0, 0x1000, 0xF5, 4, 8
	banim_frame_end
banim_zom_at1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, 12, -24
	banim_frame_oam 0x8000, 0x5000, 0x18, 4, -24
	banim_frame_oam 0x4000, 0x1000, 0x96, 12, 8
	banim_frame_oam 0x0, 0x1000, 0x98, 4, 8
	banim_frame_oam 0x8000, 0x1000, 0x35, 28, -16
	banim_frame_oam 0x8000, 0x1000, 0xB5, 36, -16
	banim_frame_oam 0x0, 0x1000, 0x15, 12, -32
	banim_frame_oam 0x0, 0x1000, 0x95, 28, 8
	banim_frame_end
banim_zom_at1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x1000, 0xD8, 28, 8
	banim_frame_oam 0x0, 0x1000, 0xB8, 4, -8
	banim_frame_oam 0x0, 0x1000, 0xF8, 4, 8
	banim_frame_oam 0x0, 0x5000, 0xB6, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0xF6, 12, 8
	banim_frame_oam 0x4000, 0x9000, 0x19, 4, -32
	banim_frame_oam 0x4000, 0x5000, 0x59, 4, -16
	banim_frame_end
banim_zom_at1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x99, 4, -16
	banim_frame_oam 0x0, 0x5000, 0x7D, 12, -40
	banim_frame_oam 0x8000, 0x1000, 0x7F, 4, -40
	banim_frame_oam 0x4000, 0x1000, 0xBD, 12, -24
	banim_frame_oam 0x0, 0x1000, 0xBF, 4, -24
	banim_frame_end
banim_zom_at1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x9000, 0x1, 4, -40
	banim_frame_oam 0x0, 0x5000, 0x81, 4, -8
	banim_frame_oam 0x4000, 0x1000, 0xC1, 4, 8
	banim_frame_oam 0x8000, 0x5000, 0x20, 20, -32
	banim_frame_oam 0x8000, 0x1000, 0xA0, 20, 0
	banim_frame_oam 0x0, 0x1000, 0x0, 28, 8
	banim_frame_end
banim_zom_at1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 4, -40
	banim_frame_oam 0x0, 0x5000, 0x84, 4, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, 4, 8
	banim_frame_oam 0x8000, 0x5000, 0x23, 20, -32
	banim_frame_oam 0x8000, 0x1000, 0xA3, 20, 0
	banim_frame_oam 0x0, 0x1000, 0x3, 28, 8
	banim_frame_end
banim_zom_at1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x6, 28, -32
	banim_frame_oam 0x8000, 0x9000, 0xA, 12, -32
	banim_frame_oam 0x8000, 0x5000, 0xC, 4, -32
	banim_frame_oam 0x4000, 0x9000, 0x86, 28, 0
	banim_frame_oam 0x0, 0x5000, 0x8A, 12, 0
	banim_frame_oam 0x8000, 0x1000, 0x8C, 4, 0
	banim_frame_oam 0x4000, 0x1000, 0xE0, 12, -40
	banim_frame_end
banim_zom_at1_oam_frame_24_l:
	banim_frame_oam 0x4000, 0x5000, 0xE2, 12, -8
	banim_frame_oam 0x4000, 0x9000, 0xC8, 12, 0
	banim_frame_oam 0x0, 0x1000, 0xEC, 4, 8
	banim_frame_oam 0x4000, 0x1000, 0xE6, 44, 8
	banim_frame_end
banim_zom_at1_oam_frame_25_l:
	banim_frame_oam 0x4000, 0x1000, 0xC6, 44, 8
	banim_frame_oam 0x0, 0x1000, 0xCC, 44, 0
	banim_frame_oam 0x4000, 0x9000, 0xD, 12, -8
	banim_frame_oam 0x4000, 0x5000, 0x4D, 12, 8
	banim_frame_oam 0x0, 0x1000, 0x70, 4, 8
	banim_frame_end
banim_zom_at1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x9000, 0x6E, 20, -16
	banim_frame_oam 0x8000, 0x1000, 0x90, 12, -8
	banim_frame_oam 0x0, 0x1000, 0xD0, 12, 8
	banim_frame_oam 0x8000, 0x1000, 0x8D, 36, -8
	banim_frame_oam 0x0, 0x1000, 0xCD, 36, 8
	banim_frame_oam 0x0, 0x1000, 0xED, 4, 8
	banim_frame_oam 0x0, 0x1000, 0x6D, 44, 0
	banim_frame_oam 0x4000, 0x1000, 0xEE, 44, 8
	banim_frame_end
banim_zom_at1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, 20, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, 12, -24
	banim_frame_oam 0x4000, 0x1000, 0x91, 20, 8
	banim_frame_oam 0x0, 0x1000, 0x93, 12, 8
	banim_frame_oam 0x0, 0x1000, 0x94, 4, 8
	banim_frame_oam 0x8000, 0x1000, 0x14, 36, -8
	banim_frame_end
banim_zom_at1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x1000, 0x54, -4, 8
	banim_frame_oam 0x4000, 0x9000, 0xB1, 4, -8
	banim_frame_oam 0x4000, 0x5000, 0xF1, 4, 8
	banim_frame_oam 0x0, 0x5000, 0x15, 12, -24
	banim_frame_oam 0x8000, 0x1000, 0x17, 4, -24
	banim_frame_end
banim_zom_at1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x1000, 0xF7, -4, 8
	banim_frame_oam 0x8000, 0x9000, 0x55, 12, -24
	banim_frame_oam 0x8000, 0x5000, 0x57, 4, -24
	banim_frame_oam 0x4000, 0x1000, 0xD5, 12, 8
	banim_frame_oam 0x0, 0x1000, 0xD7, 4, 8
	banim_frame_oam 0x0, 0x1000, 0xF6, 28, 0
	banim_frame_oam 0x0, 0x1000, 0xF5, 28, -8
	banim_frame_end
banim_zom_at1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, 12, -24
	banim_frame_oam 0x8000, 0x5000, 0x1A, 4, -24
	banim_frame_oam 0x4000, 0x1000, 0x98, 12, 8
	banim_frame_oam 0x0, 0x1000, 0x9A, 4, 8
	banim_frame_oam 0x0, 0x1000, 0x3F, -4, 8
	banim_frame_end
banim_zom_at1_oam_frame_31_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, 20, 0
	banim_frame_oam 0x8000, 0x1000, 0x1D, 12, 0
	banim_frame_oam 0x0, 0x1000, 0x3E, 4, 8
	banim_frame_oam 0x0, 0x5000, 0xB8, 20, -24
	banim_frame_oam 0x8000, 0x1000, 0xBA, 12, -24
	banim_frame_oam 0x4000, 0x1000, 0xF8, 20, -8
	banim_frame_oam 0x0, 0x1000, 0xFA, 12, -8
	banim_frame_oam 0x0, 0x1000, 0x1E, 4, -8
	banim_frame_end
banim_zom_at1_oam_frame_32_l:
	banim_frame_oam 0x8000, 0x9000, 0x5B, 12, -24
	banim_frame_oam 0x8000, 0x5000, 0x5D, 4, -24
	banim_frame_oam 0x4000, 0x1000, 0xDB, 12, 8
	banim_frame_oam 0x0, 0x1000, 0xDD, 4, 8
	banim_frame_oam 0x0, 0x1000, 0xDE, -4, 8
	banim_frame_oam 0x8000, 0x1000, 0x9E, 28, -8
	banim_frame_end
banim_zom_at1_oam_frame_33_l:
	banim_frame_oam 0x0, 0x1000, 0x2, -4, 8
	banim_frame_oam 0x8000, 0x5000, 0x22, 4, -16
	banim_frame_oam 0x8000, 0x9000, 0x0, 12, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, 12, 8
	banim_frame_end
banim_zom_at1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x9000, 0x3, -4, -24
	banim_frame_oam 0x4000, 0x5000, 0x83, -4, 8
	banim_frame_end
banim_zom_at1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, 12, 0
	banim_frame_oam 0x8000, 0x1000, 0x1D, 4, 0
	banim_frame_oam 0x0, 0x1000, 0x3E, -4, 8
	banim_frame_oam 0x0, 0x5000, 0xB8, 12, -24
	banim_frame_oam 0x8000, 0x1000, 0xBA, 4, -24
	banim_frame_oam 0x4000, 0x1000, 0xF8, 12, -8
	banim_frame_oam 0x0, 0x1000, 0xFA, 4, -8
	banim_frame_oam 0x0, 0x1000, 0x1E, -4, -8
	banim_frame_end
banim_zom_at1_oam_frame_36_l:
	banim_frame_oam 0x8000, 0x9000, 0x5B, 4, -24
	banim_frame_oam 0x8000, 0x5000, 0x5D, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0xDB, 4, 8
	banim_frame_oam 0x0, 0x1000, 0xDD, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xDE, -12, 8
	banim_frame_oam 0x8000, 0x1000, 0x9E, 20, -8
	banim_frame_end
banim_zom_at1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x1000, 0x2, -12, 8
	banim_frame_oam 0x8000, 0x5000, 0x22, -4, -16
	banim_frame_oam 0x8000, 0x9000, 0x0, 4, -24
	banim_frame_oam 0x4000, 0x1000, 0x80, 4, 8
	banim_frame_end
banim_zom_at1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x9000, 0x3, -12, -24
	banim_frame_oam 0x4000, 0x5000, 0x83, -12, 8
	banim_frame_end
banim_zom_at1_oam_frame_39_l:
	banim_frame_oam 0x0, 0x5000, 0x1B, 4, 0
	banim_frame_oam 0x8000, 0x1000, 0x1D, -4, 0
	banim_frame_oam 0x0, 0x1000, 0x3E, -12, 8
	banim_frame_oam 0x0, 0x5000, 0xB8, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0xBA, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0xF8, 4, -8
	banim_frame_oam 0x0, 0x1000, 0xFA, -4, -8
	banim_frame_oam 0x0, 0x1000, 0x1E, -12, -8
	banim_frame_end
banim_zom_at1_oam_frame_40_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -4, -24
	banim_frame_oam 0x8000, 0x5000, 0x9, -12, -24
	banim_frame_oam 0x4000, 0x1000, 0x87, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x8A, -20, 8
	banim_frame_oam 0x8000, 0x1000, 0xA, 12, -8
	banim_frame_end
banim_zom_at1_oam_frame_41_l:
	banim_frame_oam 0x0, 0x9000, 0xB, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0x8B, -20, 8
	banim_frame_oam 0x8000, 0x1000, 0x4A, 12, -8
	banim_frame_end
banim_zom_at1_oam_frame_42_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_zom_at1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_zom_at1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_zom_at1_oam_frame_45_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -20, 8
	banim_frame_end
banim_zom_at1_oam_frame_46_l:
	banim_frame_oam 0x0, 0x9000, 0x13, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0x93, -20, 8
	banim_frame_end
banim_zom_at1_oam_frame_47_l:
	banim_frame_oam 0x0, 0x9000, 0x17, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0x97, -20, 8
	banim_frame_end
banim_zom_at1_oam_frame_48_l:
	banim_frame_oam 0x4000, 0x9000, 0xA4, -20, 0
	banim_frame_oam 0x8000, 0x1000, 0xA8, -28, 0
	banim_frame_oam 0x4000, 0x9000, 0xA0, -20, -24
	banim_frame_oam 0x4000, 0x5000, 0xE0, -20, -8
	banim_frame_end
banim_zom_at1_oam_frame_49_l:
	banim_frame_oam 0x4000, 0x9000, 0xAC, -20, 0
	banim_frame_oam 0x8000, 0x1000, 0xB0, -28, 0
	banim_frame_oam 0x0, 0x5000, 0xA9, -12, -24
	banim_frame_oam 0x8000, 0x1000, 0xAB, -20, -24
	banim_frame_oam 0x4000, 0x1000, 0xE9, -12, -8
	banim_frame_oam 0x0, 0x1000, 0xEB, -20, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_zom_at1_oam_r:
banim_zom_at1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -12, -16
	banim_frame_oam 0x0, 0x0, 0x4, -4, -24
	banim_frame_end
banim_zom_at1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -20, -16
	banim_frame_oam 0x0, 0x0, 0xE4, 12, 8
	banim_frame_oam 0x4000, 0x0, 0x24, -12, -24
	banim_frame_end
banim_zom_at1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -20, -16
	banim_frame_oam 0x0, 0x0, 0x45, 12, 8
	banim_frame_oam 0x0, 0x0, 0x5, -12, -24
	banim_frame_oam 0x8000, 0x0, 0x44, -28, -8
	banim_frame_end
banim_zom_at1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x0, 0x65, 12, 8
	banim_frame_oam 0x4000, 0x0, 0x84, -20, -24
	banim_frame_oam 0x8000, 0x8000, 0x86, -20, -16
	banim_frame_oam 0x8000, 0x4000, 0x88, -4, -16
	banim_frame_oam 0x8000, 0x0, 0xC9, 4, 0
	banim_frame_end
banim_zom_at1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -20, -16
	banim_frame_oam 0x8000, 0x4000, 0xC, -4, -16
	banim_frame_oam 0x0, 0x0, 0xE5, 4, 8
	banim_frame_oam 0x4000, 0x0, 0xA4, -28, -24
	banim_frame_oam 0x0, 0x0, 0xC4, -28, -16
	banim_frame_oam 0x0, 0x0, 0xC5, -12, -24
	banim_frame_end
banim_zom_at1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x8A, -20, -16
	banim_frame_oam 0x8000, 0x4000, 0x8C, -4, -16
	banim_frame_oam 0x0, 0x0, 0xA9, 4, 8
	banim_frame_oam 0x0, 0x0, 0x89, -20, -24
	banim_frame_end
banim_zom_at1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -20, -16
	banim_frame_oam 0x8000, 0x4000, 0x11, -4, -16
	banim_frame_oam 0x4000, 0x0, 0x4D, -20, -24
	banim_frame_oam 0x0, 0x0, 0xE, 4, 8
	banim_frame_oam 0x8000, 0x0, 0xD, -28, -8
	banim_frame_end
banim_zom_at1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0x2E, 4, 8
	banim_frame_oam 0x8000, 0x0, 0x8D, -4, 0
	banim_frame_oam 0x4000, 0x0, 0x6D, -28, -24
	banim_frame_oam 0x8000, 0x8000, 0x8F, -28, -16
	banim_frame_oam 0x8000, 0x4000, 0x91, -12, -16
	banim_frame_end
banim_zom_at1_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x65, 4, 8
	banim_frame_oam 0x4000, 0x0, 0x84, -28, -24
	banim_frame_oam 0x8000, 0x8000, 0x86, -28, -16
	banim_frame_oam 0x8000, 0x4000, 0x88, -12, -16
	banim_frame_oam 0x8000, 0x0, 0xC9, -4, 0
	banim_frame_end
banim_zom_at1_oam_frame_9_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -28, -16
	banim_frame_oam 0x8000, 0x4000, 0xC, -12, -16
	banim_frame_oam 0x0, 0x0, 0xE5, -4, 8
	banim_frame_oam 0x4000, 0x0, 0xA4, -36, -24
	banim_frame_oam 0x0, 0x0, 0xC4, -36, -16
	banim_frame_oam 0x0, 0x0, 0xC5, -20, -24
	banim_frame_end
banim_zom_at1_oam_frame_10_r:
	banim_frame_oam 0x8000, 0x8000, 0x8A, -28, -16
	banim_frame_oam 0x8000, 0x4000, 0x8C, -12, -16
	banim_frame_oam 0x0, 0x0, 0xA9, -4, 8
	banim_frame_oam 0x0, 0x0, 0x89, -28, -24
	banim_frame_end
banim_zom_at1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0xF, -28, -16
	banim_frame_oam 0x8000, 0x4000, 0x11, -12, -16
	banim_frame_oam 0x4000, 0x0, 0x4D, -28, -24
	banim_frame_oam 0x0, 0x0, 0xE, -4, 8
	banim_frame_oam 0x8000, 0x0, 0xD, -36, -8
	banim_frame_end
banim_zom_at1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x0, 0x2E, -4, 8
	banim_frame_oam 0x8000, 0x0, 0x8D, -12, 0
	banim_frame_oam 0x4000, 0x0, 0x6D, -36, -24
	banim_frame_oam 0x8000, 0x8000, 0x8F, -36, -16
	banim_frame_oam 0x8000, 0x4000, 0x91, -20, -16
	banim_frame_end
banim_zom_at1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x0, 0x65, -4, 8
	banim_frame_oam 0x4000, 0x0, 0x84, -36, -24
	banim_frame_oam 0x8000, 0x8000, 0x86, -36, -16
	banim_frame_oam 0x8000, 0x4000, 0x88, -20, -16
	banim_frame_oam 0x8000, 0x0, 0xC9, -12, 0
	banim_frame_end
banim_zom_at1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0x8000, 0xA, -36, -16
	banim_frame_oam 0x8000, 0x4000, 0xC, -20, -16
	banim_frame_oam 0x0, 0x0, 0xE5, -12, 8
	banim_frame_oam 0x4000, 0x0, 0xA4, -44, -24
	banim_frame_oam 0x0, 0x0, 0xC4, -44, -16
	banim_frame_oam 0x0, 0x0, 0xC5, -28, -24
	banim_frame_end
banim_zom_at1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x8A, -36, -16
	banim_frame_oam 0x8000, 0x4000, 0x8C, -20, -16
	banim_frame_oam 0x0, 0x0, 0xA9, -12, 8
	banim_frame_oam 0x0, 0x0, 0x89, -36, -24
	banim_frame_end
banim_zom_at1_oam_frame_16_r:
	banim_frame_oam 0x4000, 0x0, 0xCD, -36, -24
	banim_frame_oam 0x0, 0x0, 0x8E, -12, 8
	banim_frame_oam 0x0, 0x0, 0xAE, -20, -24
	banim_frame_oam 0x8000, 0x8000, 0x12, -36, -16
	banim_frame_oam 0x8000, 0x4000, 0x14, -20, -16
	banim_frame_end
banim_zom_at1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x0, 0xED, -28, -24
	banim_frame_oam 0x8000, 0x8000, 0x92, -36, -16
	banim_frame_oam 0x8000, 0x4000, 0x94, -20, -16
	banim_frame_oam 0x0, 0x0, 0xF5, -12, 8
	banim_frame_end
banim_zom_at1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -28, -24
	banim_frame_oam 0x8000, 0x4000, 0x18, -12, -24
	banim_frame_oam 0x4000, 0x0, 0x96, -28, 8
	banim_frame_oam 0x0, 0x0, 0x98, -12, 8
	banim_frame_oam 0x8000, 0x0, 0x35, -36, -16
	banim_frame_oam 0x8000, 0x0, 0xB5, -44, -16
	banim_frame_oam 0x0, 0x0, 0x15, -20, -32
	banim_frame_oam 0x0, 0x0, 0x95, -36, 8
	banim_frame_end
banim_zom_at1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x0, 0xD8, -36, 8
	banim_frame_oam 0x0, 0x0, 0xB8, -12, -8
	banim_frame_oam 0x0, 0x0, 0xF8, -12, 8
	banim_frame_oam 0x0, 0x4000, 0xB6, -28, -8
	banim_frame_oam 0x4000, 0x0, 0xF6, -28, 8
	banim_frame_oam 0x4000, 0x8000, 0x19, -36, -32
	banim_frame_oam 0x4000, 0x4000, 0x59, -36, -16
	banim_frame_end
banim_zom_at1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x99, -36, -16
	banim_frame_oam 0x0, 0x4000, 0x7D, -28, -40
	banim_frame_oam 0x8000, 0x0, 0x7F, -12, -40
	banim_frame_oam 0x4000, 0x0, 0xBD, -28, -24
	banim_frame_oam 0x0, 0x0, 0xBF, -12, -24
	banim_frame_end
banim_zom_at1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x8000, 0x1, -20, -40
	banim_frame_oam 0x0, 0x4000, 0x81, -20, -8
	banim_frame_oam 0x4000, 0x0, 0xC1, -20, 8
	banim_frame_oam 0x8000, 0x4000, 0x20, -28, -32
	banim_frame_oam 0x8000, 0x0, 0xA0, -28, 0
	banim_frame_oam 0x0, 0x0, 0x0, -36, 8
	banim_frame_end
banim_zom_at1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -20, -40
	banim_frame_oam 0x0, 0x4000, 0x84, -20, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -20, 8
	banim_frame_oam 0x8000, 0x4000, 0x23, -28, -32
	banim_frame_oam 0x8000, 0x0, 0xA3, -28, 0
	banim_frame_oam 0x0, 0x0, 0x3, -36, 8
	banim_frame_end
banim_zom_at1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x6, -60, -32
	banim_frame_oam 0x8000, 0x8000, 0xA, -28, -32
	banim_frame_oam 0x8000, 0x4000, 0xC, -12, -32
	banim_frame_oam 0x4000, 0x8000, 0x86, -60, 0
	banim_frame_oam 0x0, 0x4000, 0x8A, -28, 0
	banim_frame_oam 0x8000, 0x0, 0x8C, -12, 0
	banim_frame_oam 0x4000, 0x0, 0xE0, -28, -40
	banim_frame_end
banim_zom_at1_oam_frame_24_r:
	banim_frame_oam 0x4000, 0x4000, 0xE2, -44, -8
	banim_frame_oam 0x4000, 0x8000, 0xC8, -44, 0
	banim_frame_oam 0x0, 0x0, 0xEC, -12, 8
	banim_frame_oam 0x4000, 0x0, 0xE6, -60, 8
	banim_frame_end
banim_zom_at1_oam_frame_25_r:
	banim_frame_oam 0x4000, 0x0, 0xC6, -60, 8
	banim_frame_oam 0x0, 0x0, 0xCC, -52, 0
	banim_frame_oam 0x4000, 0x8000, 0xD, -44, -8
	banim_frame_oam 0x4000, 0x4000, 0x4D, -44, 8
	banim_frame_oam 0x0, 0x0, 0x70, -12, 8
	banim_frame_end
banim_zom_at1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x8000, 0x6E, -36, -16
	banim_frame_oam 0x8000, 0x0, 0x90, -20, -8
	banim_frame_oam 0x0, 0x0, 0xD0, -20, 8
	banim_frame_oam 0x8000, 0x0, 0x8D, -44, -8
	banim_frame_oam 0x0, 0x0, 0xCD, -44, 8
	banim_frame_oam 0x0, 0x0, 0xED, -12, 8
	banim_frame_oam 0x0, 0x0, 0x6D, -52, 0
	banim_frame_oam 0x4000, 0x0, 0xEE, -60, 8
	banim_frame_end
banim_zom_at1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -36, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, -20, -24
	banim_frame_oam 0x4000, 0x0, 0x91, -36, 8
	banim_frame_oam 0x0, 0x0, 0x93, -20, 8
	banim_frame_oam 0x0, 0x0, 0x94, -12, 8
	banim_frame_oam 0x8000, 0x0, 0x14, -44, -8
	banim_frame_end
banim_zom_at1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x0, 0x54, -4, 8
	banim_frame_oam 0x4000, 0x8000, 0xB1, -36, -8
	banim_frame_oam 0x4000, 0x4000, 0xF1, -36, 8
	banim_frame_oam 0x0, 0x4000, 0x15, -28, -24
	banim_frame_oam 0x8000, 0x0, 0x17, -12, -24
	banim_frame_end
banim_zom_at1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x0, 0xF7, -4, 8
	banim_frame_oam 0x8000, 0x8000, 0x55, -28, -24
	banim_frame_oam 0x8000, 0x4000, 0x57, -12, -24
	banim_frame_oam 0x4000, 0x0, 0xD5, -28, 8
	banim_frame_oam 0x0, 0x0, 0xD7, -12, 8
	banim_frame_oam 0x0, 0x0, 0xF6, -36, 0
	banim_frame_oam 0x0, 0x0, 0xF5, -36, -8
	banim_frame_end
banim_zom_at1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -28, -24
	banim_frame_oam 0x8000, 0x4000, 0x1A, -12, -24
	banim_frame_oam 0x4000, 0x0, 0x98, -28, 8
	banim_frame_oam 0x0, 0x0, 0x9A, -12, 8
	banim_frame_oam 0x0, 0x0, 0x3F, -4, 8
	banim_frame_end
banim_zom_at1_oam_frame_31_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, -36, 0
	banim_frame_oam 0x8000, 0x0, 0x1D, -20, 0
	banim_frame_oam 0x0, 0x0, 0x3E, -12, 8
	banim_frame_oam 0x0, 0x4000, 0xB8, -36, -24
	banim_frame_oam 0x8000, 0x0, 0xBA, -20, -24
	banim_frame_oam 0x4000, 0x0, 0xF8, -36, -8
	banim_frame_oam 0x0, 0x0, 0xFA, -20, -8
	banim_frame_oam 0x0, 0x0, 0x1E, -12, -8
	banim_frame_end
banim_zom_at1_oam_frame_32_r:
	banim_frame_oam 0x8000, 0x8000, 0x5B, -28, -24
	banim_frame_oam 0x8000, 0x4000, 0x5D, -12, -24
	banim_frame_oam 0x4000, 0x0, 0xDB, -28, 8
	banim_frame_oam 0x0, 0x0, 0xDD, -12, 8
	banim_frame_oam 0x0, 0x0, 0xDE, -4, 8
	banim_frame_oam 0x8000, 0x0, 0x9E, -36, -8
	banim_frame_end
banim_zom_at1_oam_frame_33_r:
	banim_frame_oam 0x0, 0x0, 0x2, -4, 8
	banim_frame_oam 0x8000, 0x4000, 0x22, -12, -16
	banim_frame_oam 0x8000, 0x8000, 0x0, -28, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -28, 8
	banim_frame_end
banim_zom_at1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x8000, 0x3, -28, -24
	banim_frame_oam 0x4000, 0x4000, 0x83, -28, 8
	banim_frame_end
banim_zom_at1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, -28, 0
	banim_frame_oam 0x8000, 0x0, 0x1D, -12, 0
	banim_frame_oam 0x0, 0x0, 0x3E, -4, 8
	banim_frame_oam 0x0, 0x4000, 0xB8, -28, -24
	banim_frame_oam 0x8000, 0x0, 0xBA, -12, -24
	banim_frame_oam 0x4000, 0x0, 0xF8, -28, -8
	banim_frame_oam 0x0, 0x0, 0xFA, -12, -8
	banim_frame_oam 0x0, 0x0, 0x1E, -4, -8
	banim_frame_end
banim_zom_at1_oam_frame_36_r:
	banim_frame_oam 0x8000, 0x8000, 0x5B, -20, -24
	banim_frame_oam 0x8000, 0x4000, 0x5D, -4, -24
	banim_frame_oam 0x4000, 0x0, 0xDB, -20, 8
	banim_frame_oam 0x0, 0x0, 0xDD, -4, 8
	banim_frame_oam 0x0, 0x0, 0xDE, 4, 8
	banim_frame_oam 0x8000, 0x0, 0x9E, -28, -8
	banim_frame_end
banim_zom_at1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x0, 0x2, 4, 8
	banim_frame_oam 0x8000, 0x4000, 0x22, -4, -16
	banim_frame_oam 0x8000, 0x8000, 0x0, -20, -24
	banim_frame_oam 0x4000, 0x0, 0x80, -20, 8
	banim_frame_end
banim_zom_at1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x8000, 0x3, -20, -24
	banim_frame_oam 0x4000, 0x4000, 0x83, -20, 8
	banim_frame_end
banim_zom_at1_oam_frame_39_r:
	banim_frame_oam 0x0, 0x4000, 0x1B, -20, 0
	banim_frame_oam 0x8000, 0x0, 0x1D, -4, 0
	banim_frame_oam 0x0, 0x0, 0x3E, 4, 8
	banim_frame_oam 0x0, 0x4000, 0xB8, -20, -24
	banim_frame_oam 0x8000, 0x0, 0xBA, -4, -24
	banim_frame_oam 0x4000, 0x0, 0xF8, -20, -8
	banim_frame_oam 0x0, 0x0, 0xFA, -4, -8
	banim_frame_oam 0x0, 0x0, 0x1E, 4, -8
	banim_frame_end
banim_zom_at1_oam_frame_40_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x9, 4, -24
	banim_frame_oam 0x4000, 0x0, 0x87, -12, 8
	banim_frame_oam 0x0, 0x0, 0x89, 4, 8
	banim_frame_oam 0x0, 0x0, 0x8A, 12, 8
	banim_frame_oam 0x8000, 0x0, 0xA, -20, -8
	banim_frame_end
banim_zom_at1_oam_frame_41_r:
	banim_frame_oam 0x0, 0x8000, 0xB, -12, -24
	banim_frame_oam 0x4000, 0x4000, 0x8B, -12, 8
	banim_frame_oam 0x8000, 0x0, 0x4A, -20, -8
	banim_frame_end
banim_zom_at1_oam_frame_42_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_zom_at1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_zom_at1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_zom_at1_oam_frame_45_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -12, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -12, 8
	banim_frame_end
banim_zom_at1_oam_frame_46_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -12, -24
	banim_frame_oam 0x4000, 0x4000, 0x93, -12, 8
	banim_frame_end
banim_zom_at1_oam_frame_47_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -12, -24
	banim_frame_oam 0x4000, 0x4000, 0x97, -12, 8
	banim_frame_end
banim_zom_at1_oam_frame_48_r:
	banim_frame_oam 0x4000, 0x8000, 0xA4, -12, 0
	banim_frame_oam 0x8000, 0x0, 0xA8, 20, 0
	banim_frame_oam 0x4000, 0x8000, 0xA0, -12, -24
	banim_frame_oam 0x4000, 0x4000, 0xE0, -12, -8
	banim_frame_end
banim_zom_at1_oam_frame_49_r:
	banim_frame_oam 0x4000, 0x8000, 0xAC, -12, 0
	banim_frame_oam 0x8000, 0x0, 0xB0, 20, 0
	banim_frame_oam 0x0, 0x4000, 0xA9, -4, -24
	banim_frame_oam 0x8000, 0x0, 0xAB, 12, -24
	banim_frame_oam 0x4000, 0x0, 0xE9, -4, -8
	banim_frame_oam 0x0, 0x0, 0xEB, 12, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_zom_at1_script:
banim_zom_at1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 1, banim_zom_at1_oam_frame_1_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 3, banim_zom_at1_sheet_0, 2, banim_zom_at1_oam_frame_2_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 3, banim_zom_at1_oam_frame_3_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 4, banim_zom_at1_oam_frame_4_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 5, banim_zom_at1_oam_frame_5_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 6, banim_zom_at1_oam_frame_6_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 7, banim_zom_at1_oam_frame_7_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 8, banim_zom_at1_oam_frame_8_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 9, banim_zom_at1_oam_frame_9_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 10, banim_zom_at1_oam_frame_10_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 11, banim_zom_at1_oam_frame_11_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 12, banim_zom_at1_oam_frame_12_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 13, banim_zom_at1_oam_frame_13_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 14, banim_zom_at1_oam_frame_14_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 15, banim_zom_at1_oam_frame_15_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_0, 16, banim_zom_at1_oam_frame_16_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_1
	banim_code_frame 6, banim_zom_at1_sheet_0, 17, banim_zom_at1_oam_frame_17_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 18, banim_zom_at1_oam_frame_18_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 19, banim_zom_at1_oam_frame_19_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 20, banim_zom_at1_oam_frame_20_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 21, banim_zom_at1_oam_frame_21_r - banim_zom_at1_oam_r
	banim_code_frame 24, banim_zom_at1_sheet_1, 22, banim_zom_at1_oam_frame_22_r - banim_zom_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_revenant_2
	banim_code_frame 2, banim_zom_at1_sheet_1, 23, banim_zom_at1_oam_frame_23_r - banim_zom_at1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_zom_at1_sheet_1, 24, banim_zom_at1_oam_frame_24_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_zom_at1_sheet_1, 25, banim_zom_at1_oam_frame_25_r - banim_zom_at1_oam_r
	banim_code_frame 6, banim_zom_at1_sheet_1, 26, banim_zom_at1_oam_frame_26_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 27, banim_zom_at1_oam_frame_27_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 28, banim_zom_at1_oam_frame_28_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 29, banim_zom_at1_oam_frame_29_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 30, banim_zom_at1_oam_frame_30_r - banim_zom_at1_oam_r
	banim_code_frame 28, banim_zom_at1_sheet_1, 31, banim_zom_at1_oam_frame_31_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 32, banim_zom_at1_oam_frame_32_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 33, banim_zom_at1_oam_frame_33_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 34, banim_zom_at1_oam_frame_34_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 35, banim_zom_at1_oam_frame_35_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 36, banim_zom_at1_oam_frame_36_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 37, banim_zom_at1_oam_frame_37_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 38, banim_zom_at1_oam_frame_38_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 39, banim_zom_at1_oam_frame_39_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 40, banim_zom_at1_oam_frame_40_r - banim_zom_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_zom_at1_sheet_2, 41, banim_zom_at1_oam_frame_41_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_zom_at1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_1
	banim_code_frame 6, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 24, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_revenant_2
	banim_code_frame 2, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 1, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 6, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 28, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 1, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_zom_at1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_laugh
	banim_code_frame 4, banim_zom_at1_sheet_2, 46, banim_zom_at1_oam_frame_45_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 47, banim_zom_at1_oam_frame_46_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_laugh
	banim_code_frame 8, banim_zom_at1_sheet_2, 48, banim_zom_at1_oam_frame_47_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 46, banim_zom_at1_oam_frame_45_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 47, banim_zom_at1_oam_frame_46_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_2, 48, banim_zom_at1_oam_frame_47_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 46, banim_zom_at1_oam_frame_45_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_laugh
	banim_code_frame 4, banim_zom_at1_sheet_2, 47, banim_zom_at1_oam_frame_46_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_2, 48, banim_zom_at1_oam_frame_47_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 46, banim_zom_at1_oam_frame_45_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 47, banim_zom_at1_oam_frame_46_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_2, 48, banim_zom_at1_oam_frame_47_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 47, banim_zom_at1_oam_frame_46_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 46, banim_zom_at1_oam_frame_45_r - banim_zom_at1_oam_r
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 1, banim_zom_at1_oam_frame_1_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 3, banim_zom_at1_sheet_0, 2, banim_zom_at1_oam_frame_2_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 3, banim_zom_at1_oam_frame_3_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 4, banim_zom_at1_oam_frame_4_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 5, banim_zom_at1_oam_frame_5_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 6, banim_zom_at1_oam_frame_6_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 7, banim_zom_at1_oam_frame_7_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 8, banim_zom_at1_oam_frame_8_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 9, banim_zom_at1_oam_frame_9_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 10, banim_zom_at1_oam_frame_10_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 11, banim_zom_at1_oam_frame_11_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 12, banim_zom_at1_oam_frame_12_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 13, banim_zom_at1_oam_frame_13_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 14, banim_zom_at1_oam_frame_14_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 15, banim_zom_at1_oam_frame_15_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_0, 16, banim_zom_at1_oam_frame_16_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_1
	banim_code_frame 6, banim_zom_at1_sheet_0, 17, banim_zom_at1_oam_frame_17_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 18, banim_zom_at1_oam_frame_18_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 19, banim_zom_at1_oam_frame_19_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 20, banim_zom_at1_oam_frame_20_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 21, banim_zom_at1_oam_frame_21_r - banim_zom_at1_oam_r
	banim_code_frame 24, banim_zom_at1_sheet_1, 22, banim_zom_at1_oam_frame_22_r - banim_zom_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_revenant_2
	banim_code_frame 2, banim_zom_at1_sheet_1, 23, banim_zom_at1_oam_frame_23_r - banim_zom_at1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_3
	banim_code_frame 1, banim_zom_at1_sheet_1, 24, banim_zom_at1_oam_frame_24_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_zom_at1_sheet_1, 25, banim_zom_at1_oam_frame_25_r - banim_zom_at1_oam_r
	banim_code_frame 6, banim_zom_at1_sheet_1, 26, banim_zom_at1_oam_frame_26_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 27, banim_zom_at1_oam_frame_27_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 28, banim_zom_at1_oam_frame_28_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 29, banim_zom_at1_oam_frame_29_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 30, banim_zom_at1_oam_frame_30_r - banim_zom_at1_oam_r
	banim_code_frame 28, banim_zom_at1_sheet_1, 31, banim_zom_at1_oam_frame_31_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 32, banim_zom_at1_oam_frame_32_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 33, banim_zom_at1_oam_frame_33_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 34, banim_zom_at1_oam_frame_34_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 35, banim_zom_at1_oam_frame_35_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 36, banim_zom_at1_oam_frame_36_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 37, banim_zom_at1_oam_frame_37_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 38, banim_zom_at1_oam_frame_38_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 39, banim_zom_at1_oam_frame_39_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 40, banim_zom_at1_oam_frame_40_r - banim_zom_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_zom_at1_sheet_2, 41, banim_zom_at1_oam_frame_41_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_zom_at1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_laugh
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_laugh
	banim_code_frame 8, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_laugh
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 1, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_1
	banim_code_frame 6, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 24, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_revenant_2
	banim_code_frame 2, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_critical_3
	banim_code_frame 1, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 6, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 28, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 43, banim_zom_at1_oam_frame_43_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_zom_at1_sheet_2, 44, banim_zom_at1_oam_frame_44_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 1, banim_zom_at1_sheet_0, 42, banim_zom_at1_oam_frame_42_r - banim_zom_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_zom_at1_mode_attack_range:
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_zom_at1_mode_attack_range_critical:
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_zom_at1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_zom_at1_sheet_2, 49, banim_zom_at1_oam_frame_48_r - banim_zom_at1_oam_r
	banim_code_frame 1, banim_zom_at1_sheet_2, 50, banim_zom_at1_oam_frame_49_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_zom_at1_sheet_2, 49, banim_zom_at1_oam_frame_48_r - banim_zom_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_zom_at1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_zom_at1_sheet_2, 49, banim_zom_at1_oam_frame_48_r - banim_zom_at1_oam_r
	banim_code_frame 1, banim_zom_at1_sheet_2, 50, banim_zom_at1_oam_frame_49_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_zom_at1_sheet_2, 49, banim_zom_at1_oam_frame_48_r - banim_zom_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_zom_at1_mode_stand_close:
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_zom_at1_mode_stand:
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_zom_at1_mode_stand_range:
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_zom_at1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 1, banim_zom_at1_oam_frame_1_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 3, banim_zom_at1_sheet_0, 2, banim_zom_at1_oam_frame_2_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 3, banim_zom_at1_oam_frame_3_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 4, banim_zom_at1_oam_frame_4_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 5, banim_zom_at1_oam_frame_5_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 6, banim_zom_at1_oam_frame_6_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 7, banim_zom_at1_oam_frame_7_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 8, banim_zom_at1_oam_frame_8_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 9, banim_zom_at1_oam_frame_9_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 10, banim_zom_at1_oam_frame_10_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_0, 11, banim_zom_at1_oam_frame_11_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 4, banim_zom_at1_sheet_0, 12, banim_zom_at1_oam_frame_12_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 13, banim_zom_at1_oam_frame_13_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 14, banim_zom_at1_oam_frame_14_r - banim_zom_at1_oam_r
	banim_code_frame 12, banim_zom_at1_sheet_0, 15, banim_zom_at1_oam_frame_15_r - banim_zom_at1_oam_r
	banim_code_frame 8, banim_zom_at1_sheet_0, 16, banim_zom_at1_oam_frame_16_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_1
	banim_code_frame 6, banim_zom_at1_sheet_0, 17, banim_zom_at1_oam_frame_17_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_0, 18, banim_zom_at1_oam_frame_18_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 19, banim_zom_at1_oam_frame_19_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_0, 20, banim_zom_at1_oam_frame_20_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 21, banim_zom_at1_oam_frame_21_r - banim_zom_at1_oam_r
	banim_code_frame 24, banim_zom_at1_sheet_1, 22, banim_zom_at1_oam_frame_22_r - banim_zom_at1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_revenant_2
	banim_code_frame 2, banim_zom_at1_sheet_1, 23, banim_zom_at1_oam_frame_23_r - banim_zom_at1_oam_r
	banim_code_frame 1, banim_zom_at1_sheet_1, 24, banim_zom_at1_oam_frame_24_r - banim_zom_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_zom_at1_sheet_1, 25, banim_zom_at1_oam_frame_25_r - banim_zom_at1_oam_r
	banim_code_frame 6, banim_zom_at1_sheet_1, 26, banim_zom_at1_oam_frame_26_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 27, banim_zom_at1_oam_frame_27_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 28, banim_zom_at1_oam_frame_28_r - banim_zom_at1_oam_r
	banim_code_frame 5, banim_zom_at1_sheet_1, 29, banim_zom_at1_oam_frame_29_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 30, banim_zom_at1_oam_frame_30_r - banim_zom_at1_oam_r
	banim_code_frame 28, banim_zom_at1_sheet_1, 31, banim_zom_at1_oam_frame_31_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 32, banim_zom_at1_oam_frame_32_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 33, banim_zom_at1_oam_frame_33_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 34, banim_zom_at1_oam_frame_34_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 35, banim_zom_at1_oam_frame_35_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_1, 36, banim_zom_at1_oam_frame_36_r - banim_zom_at1_oam_r
	banim_code_frame 3, banim_zom_at1_sheet_2, 37, banim_zom_at1_oam_frame_37_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 38, banim_zom_at1_oam_frame_38_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 12, banim_zom_at1_sheet_1, 39, banim_zom_at1_oam_frame_39_r - banim_zom_at1_oam_r
	banim_code_frame 4, banim_zom_at1_sheet_2, 40, banim_zom_at1_oam_frame_40_r - banim_zom_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_zom_at1_sheet_2, 41, banim_zom_at1_oam_frame_41_r - banim_zom_at1_oam_r
	banim_code_sound_revenant_move
	banim_code_frame 1, banim_zom_at1_sheet_0, 0, banim_zom_at1_oam_frame_0_r - banim_zom_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_zom_at1_mode_attack_close - banim_zom_at1_script
	.word banim_zom_at1_mode_attack_close_back - banim_zom_at1_script
	.word banim_zom_at1_mode_attack_close_critical - banim_zom_at1_script
	.word banim_zom_at1_mode_attack_close_critical_back - banim_zom_at1_script
	.word banim_zom_at1_mode_attack_range - banim_zom_at1_script
	.word banim_zom_at1_mode_attack_range_critical - banim_zom_at1_script
	.word banim_zom_at1_mode_dodge_close - banim_zom_at1_script
	.word banim_zom_at1_mode_dodge_range - banim_zom_at1_script
	.word banim_zom_at1_mode_stand_close - banim_zom_at1_script
	.word banim_zom_at1_mode_stand - banim_zom_at1_script
	.word banim_zom_at1_mode_stand_range - banim_zom_at1_script
	.word banim_zom_at1_mode_attack_miss - banim_zom_at1_script
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

