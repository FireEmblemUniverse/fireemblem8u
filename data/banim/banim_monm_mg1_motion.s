@ vim:ft=armv4
	.global banim_monm_mg1_script
	.global banim_monm_mg1_oam_r
	.global banim_monm_mg1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x7C
	.section .data.oam_l
banim_monm_mg1_oam_l:
banim_monm_mg1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x1, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0x20, 4, -8
	banim_frame_oam 0x0, 0x1000, 0x60, 4, 8
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_oam 0x0, 0x5000, 0x3, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x5, -12, -8
	banim_frame_oam 0x0, 0x1000, 0x43, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x60, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x62, -12, 8
	banim_frame_end
banim_monm_mg1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x5000, 0x63, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x65, -12, -8
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x43, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x2, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x60, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x62, -12, 8
	banim_frame_end
banim_monm_mg1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x82, -12, -16
	banim_frame_oam 0x0, 0x5000, 0xA3, -4, 0
	banim_frame_oam 0x0, 0x1000, 0x81, 12, -8
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0xC0, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x82, -12, -16
	banim_frame_oam 0x0, 0x5000, 0xA3, -4, 0
	banim_frame_oam 0x0, 0x1000, 0x81, 12, -8
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_oam 0x0, 0x1000, 0xE4, 8, -3
	banim_frame_end
banim_monm_mg1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x1000, 0x66, 4, -16
	banim_frame_oam 0x0, 0x5000, 0x6, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x8, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x46, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x45, 12, -8
	banim_frame_oam 0x0, 0x1000, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0x1000, 0x66, 4, -16
	banim_frame_oam 0x0, 0x5000, 0x6, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x8, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x46, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x45, 12, -8
	banim_frame_oam 0x0, 0x1000, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_oam 0x0, 0x1000, 0xE4, 11, -7
	banim_frame_end
banim_monm_mg1_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0xE4, 12, -24
	banim_frame_oam 0x0, 0x1000, 0x68, 9, -18
	banim_frame_oam 0x4000, 0x1000, 0x66, 4, -16
	banim_frame_oam 0x0, 0x5000, 0x6, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x8, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x46, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -12, 8
	banim_frame_oam 0x0, 0x1000, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x45, 12, -8
	banim_frame_end
banim_monm_mg1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x1000, 0x66, 4, -16
	banim_frame_oam 0x0, 0x5000, 0x6, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x8, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x46, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -12, 8
	banim_frame_oam 0x0, 0x1000, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x45, 12, -8
	banim_frame_oam 0x0, 0x1000, 0xE5, 9, -18
	banim_frame_oam 0x0, 0x1000, 0xE4, 13, -13
	banim_frame_oam 0x0, 0x1000, 0xE4, 5, -23
	banim_frame_end
banim_monm_mg1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0x6, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x8, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x46, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x45, 12, -8
	banim_frame_oam 0x4000, 0x1000, 0x66, 4, -16
	banim_frame_oam 0x0, 0x1000, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x68, 9, -18
	banim_frame_oam 0x0, 0x1000, 0xE4, 12, -9
	banim_frame_oam 0x0, 0x1000, 0xE4, 14, -22
	banim_frame_oam 0x0, 0x1000, 0xE4, 5, -20
	banim_frame_end
banim_monm_mg1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x6, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x8, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x46, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x48, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0x66, 4, -16
	banim_frame_oam 0x0, 0x1000, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x82, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x0, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x45, 12, -8
	banim_frame_oam 0x0, 0x1000, 0xE4, 13, -19
	banim_frame_end
banim_monm_mg1_oam_frame_11_l:
	banim_frame_oam 0x8000, 0x9000, 0x86, -7, -16
	banim_frame_oam 0x8000, 0x5000, 0x88, -15, -16
	banim_frame_oam 0x8000, 0x1000, 0xA5, 9, -8
	banim_frame_oam 0x0, 0x1000, 0xC9, -7, -24
	banim_frame_end
banim_monm_mg1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0x9000, 0x9, -18, -17
	banim_frame_oam 0x0, 0x5000, 0x4A, -10, -1
	banim_frame_oam 0x8000, 0x1000, 0x4C, -18, -1
	banim_frame_oam 0x8000, 0x1000, 0x49, 14, -17
	banim_frame_end
banim_monm_mg1_oam_frame_13_l:
	banim_frame_oam 0x4000, 0x9000, 0xD, -18, -17
	banim_frame_oam 0x4000, 0x5000, 0x4D, -18, -1
	banim_frame_oam 0x4000, 0x1000, 0x6A, -10, 7
	banim_frame_oam 0x0, 0x1000, 0x6C, -18, 7
	banim_frame_end
banim_monm_mg1_oam_frame_14_l:
	banim_frame_oam 0x4000, 0x9000, 0x8C, -18, -9
	banim_frame_oam 0x4000, 0x5000, 0xCC, -18, 7
	banim_frame_oam 0x4000, 0x1000, 0x6D, -10, -17
	banim_frame_oam 0x0, 0x1000, 0x6F, -18, -17
	banim_frame_end
banim_monm_mg1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0x9000, 0x11, -10, -17
	banim_frame_oam 0x8000, 0x5000, 0x13, -18, -17
	banim_frame_oam 0x8000, 0x1000, 0x70, 6, -9
	banim_frame_oam 0x0, 0x1000, 0xB0, 6, 7
	banim_frame_end
banim_monm_mg1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0x9000, 0x14, -10, -17
	banim_frame_oam 0x8000, 0x5000, 0x16, -18, -17
	banim_frame_oam 0x8000, 0x1000, 0x91, 6, -2
	banim_frame_end
banim_monm_mg1_oam_frame_17_l:
	banim_frame_oam 0x4000, 0x9000, 0x92, -24, -19
	banim_frame_oam 0x4000, 0x5000, 0xD2, -24, -3
	banim_frame_oam 0x8000, 0x1000, 0x96, -32, -19
	banim_frame_oam 0x0, 0x1000, 0xD6, -32, -3
	banim_frame_oam 0x4000, 0x1000, 0xF1, -16, 5
	banim_frame_oam 0x0, 0x1000, 0xF3, -24, 5
	banim_frame_end
banim_monm_mg1_oam_frame_18_l:
	banim_frame_oam 0x4000, 0x9000, 0x17, -34, -19
	banim_frame_oam 0x4000, 0x5000, 0x57, -34, -3
	banim_frame_oam 0x4000, 0x1000, 0x77, -18, 5
	banim_frame_oam 0x0, 0x1000, 0x79, -26, 5
	banim_frame_end
banim_monm_mg1_oam_frame_19_l:
	banim_frame_oam 0x4000, 0x9000, 0x1B, -34, -19
	banim_frame_oam 0x4000, 0x5000, 0x5B, -34, -3
	banim_frame_oam 0x4000, 0x1000, 0x7B, -18, 5
	banim_frame_oam 0x0, 0x1000, 0x7D, -26, 5
	banim_frame_end
banim_monm_mg1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x9000, 0xDA, -34, -11
	banim_frame_oam 0x4000, 0x1000, 0xF7, -18, 5
	banim_frame_oam 0x0, 0x1000, 0xF9, -26, 5
	banim_frame_oam 0x4000, 0x1000, 0xBB, -18, -19
	banim_frame_oam 0x0, 0x1000, 0xBD, -26, -19
	banim_frame_oam 0x0, 0x1000, 0x9D, -34, -19
	banim_frame_end
banim_monm_mg1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -18, -19
	banim_frame_oam 0x8000, 0x5000, 0x2, -26, -19
	banim_frame_oam 0x0, 0x1000, 0x3, -34, -19
	banim_frame_end
banim_monm_mg1_oam_frame_22_l:
	banim_frame_oam 0x0, 0x5000, 0x23, -17, -11
	banim_frame_oam 0x8000, 0x1000, 0x25, -25, -11
	banim_frame_oam 0x4000, 0x1000, 0x63, -17, 5
	banim_frame_oam 0x0, 0x1000, 0x65, -25, 5
	banim_frame_oam 0x4000, 0x1000, 0x4, -17, -19
	banim_frame_oam 0x0, 0x1000, 0x6, -25, -19
	banim_frame_end
banim_monm_mg1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0x9000, 0x83, -10, -17
	banim_frame_oam 0x8000, 0x1000, 0x85, -18, -1
	banim_frame_oam 0x0, 0x1000, 0xE2, -5, -25
	banim_frame_end
banim_monm_mg1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0x9000, 0x26, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x7, 12, -16
	banim_frame_end
banim_monm_mg1_oam_frame_25_l:
	banim_frame_oam 0x8000, 0x9000, 0x26, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -4, -24
	banim_frame_oam 0x0, 0x1000, 0x7, 12, -16
	banim_frame_oam 0x0, 0x1000, 0xA7, 13, -18
	banim_frame_oam 0x0, 0x1000, 0xA6, 11, -23
	banim_frame_oam 0x0, 0x1000, 0xA6, 19, -15
	banim_frame_end
banim_monm_mg1_oam_frame_26_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0x89, -4, 8
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_end
banim_monm_mg1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, -4, -24
	banim_frame_oam 0x4000, 0x1000, 0x89, -4, 8
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xA7, 9, -27
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, -13
	banim_frame_oam 0x0, 0x1000, 0xA6, 12, -18
	banim_frame_oam 0x0, 0x1000, 0xA6, 2, -31
	banim_frame_end
banim_monm_mg1_oam_frame_28_l:
	banim_frame_oam 0x0, 0x5000, 0xA9, -4, -24
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_oam 0x0, 0x5000, 0x49, -4, -8
	banim_frame_oam 0x4000, 0x1000, 0x89, -4, 8
	banim_frame_end
banim_monm_mg1_oam_frame_29_l:
	banim_frame_oam 0x0, 0x5000, 0xA9, -4, -24
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_oam 0x0, 0x5000, 0x49, -4, -8
	banim_frame_oam 0x4000, 0x1000, 0x89, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xA8, 8, -27
	banim_frame_oam 0x0, 0x1000, 0xA7, 8, -13
	banim_frame_oam 0x0, 0x1000, 0xA6, 7, -18
	banim_frame_oam 0x0, 0x1000, 0xA6, 15, -22
	banim_frame_oam 0x0, 0x1000, 0xA6, 2, -34
	banim_frame_end
banim_monm_mg1_oam_frame_30_l:
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_oam 0x0, 0x5000, 0x49, -4, -8
	banim_frame_oam 0x4000, 0x1000, 0x89, -4, 8
	banim_frame_oam 0x0, 0x5000, 0xB, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_31_l:
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_oam 0x0, 0x5000, 0x49, -4, -8
	banim_frame_oam 0x4000, 0x1000, 0x89, -4, 8
	banim_frame_oam 0x0, 0x5000, 0xB, -4, -24
	banim_frame_oam 0x0, 0x1000, 0xA7, 8, -25
	banim_frame_oam 0x0, 0x1000, 0xA6, 11, -20
	banim_frame_oam 0x0, 0x1000, 0xA6, 15, -31
	banim_frame_end
banim_monm_mg1_oam_frame_32_l:
	banim_frame_oam 0x4000, 0x1000, 0x4B, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x6C, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0x6B, 4, -8
	banim_frame_oam 0x0, 0x1000, 0x8, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0x4A, -4, -8
	banim_frame_oam 0x4000, 0x1000, 0x89, -4, 8
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_end
banim_monm_mg1_oam_frame_33_l:
	banim_frame_oam 0x4000, 0x1000, 0x4B, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x6C, 4, -24
	banim_frame_oam 0x8000, 0x1000, 0x6B, 4, -8
	banim_frame_oam 0x0, 0x1000, 0x8, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0x4A, -4, -8
	banim_frame_oam 0x4000, 0x1000, 0x89, -4, 8
	banim_frame_oam 0x8000, 0x5000, 0x28, -12, -16
	banim_frame_oam 0x0, 0x1000, 0xA6, 0, -25
	banim_frame_oam 0x0, 0x1000, 0xA6, 9, -18
	banim_frame_end
banim_monm_mg1_oam_frame_34_l:
	banim_frame_oam 0x0, 0x5000, 0xAB, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0xAD, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x86, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x88, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0xE9, -4, -16
	banim_frame_oam 0x0, 0x1000, 0xEB, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_35_l:
	banim_frame_oam 0x0, 0x5000, 0xAB, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0xAD, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x86, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x88, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0xE9, -4, -16
	banim_frame_oam 0x0, 0x1000, 0xEB, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -4, -24
	banim_frame_oam 0x0, 0x1000, 0xA6, 10, -13
	banim_frame_end
banim_monm_mg1_oam_frame_36_l:
	banim_frame_oam 0x4000, 0x1000, 0x2D, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xD, 4, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -4, -24
	banim_frame_oam 0x8000, 0x1000, 0x48, -12, -8
	banim_frame_oam 0x0, 0x1000, 0x88, -12, 8
	banim_frame_oam 0x0, 0x5000, 0x66, -4, 0
	banim_frame_oam 0x0, 0x1000, 0xE, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x28, -12, -16
	banim_frame_end
banim_monm_mg1_oam_frame_37_l:
	banim_frame_oam 0x0, 0x5000, 0x4D, -4, -16
	banim_frame_oam 0x8000, 0x1000, 0x4F, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0x8D, -4, 0
	banim_frame_oam 0x0, 0x1000, 0x8F, -12, 0
	banim_frame_oam 0x4000, 0x1000, 0xAE, -4, 8
	banim_frame_oam 0x0, 0x1000, 0xB0, -12, 8
	banim_frame_oam 0x0, 0x1000, 0x8C, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_38_l:
	banim_frame_oam 0x0, 0x5000, 0xF, -6, 0
	banim_frame_oam 0x8000, 0x1000, 0x11, -14, 0
	banim_frame_oam 0x0, 0x5000, 0x50, -6, -16
	banim_frame_oam 0x8000, 0x1000, 0x52, -14, -16
	banim_frame_oam 0x4000, 0x1000, 0xEE, -6, -24
	banim_frame_end
banim_monm_mg1_oam_frame_39_l:
	banim_frame_oam 0x4000, 0x5000, 0xF1, -20, 8
	banim_frame_oam 0x4000, 0x1000, 0x91, -11, -16
	banim_frame_oam 0x0, 0x1000, 0xF0, -4, -24
	banim_frame_oam 0x0, 0x5000, 0xB1, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0xB3, -12, -8
	banim_frame_oam 0x0, 0x1000, 0xD4, -20, 0
	banim_frame_end
banim_monm_mg1_oam_frame_40_l:
	banim_frame_oam 0x0, 0x5000, 0x34, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x74, -12, 8
	banim_frame_oam 0x8000, 0x1000, 0x53, 4, -8
	banim_frame_oam 0x0, 0x1000, 0x93, 4, 8
	banim_frame_oam 0x4000, 0x1000, 0x14, -10, -16
	banim_frame_oam 0x8000, 0x1000, 0x94, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xF0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_41_l:
	banim_frame_oam 0x8000, 0x9000, 0x16, -4, -16
	banim_frame_oam 0x8000, 0x5000, 0x18, -12, -16
	banim_frame_oam 0x8000, 0x1000, 0xD5, -20, 0
	banim_frame_oam 0x0, 0x1000, 0xF0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_42_l:
	banim_frame_oam 0x4000, 0x1000, 0xD6, -12, -16
	banim_frame_oam 0x4000, 0x1000, 0xF6, -4, -8
	banim_frame_oam 0x0, 0x1000, 0xF8, -12, -8
	banim_frame_oam 0x0, 0x5000, 0x19, -4, 0
	banim_frame_oam 0x8000, 0x1000, 0x1B, -12, 0
	banim_frame_oam 0x0, 0x1000, 0x8C, -4, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x59, -4, -8
	banim_frame_oam 0x8000, 0x1000, 0x5B, -12, -8
	banim_frame_oam 0x4000, 0x1000, 0x39, -4, 8
	banim_frame_oam 0x0, 0x1000, 0x3B, -12, 8
	banim_frame_oam 0x4000, 0x1000, 0xD6, -12, -16
	banim_frame_oam 0x0, 0x1000, 0x8, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_43_l:
	banim_frame_oam 0x0, 0x5000, 0x9A, -8, -9
	banim_frame_oam 0x8000, 0x1000, 0x9C, -16, -9
	banim_frame_oam 0x4000, 0x1000, 0xDA, -8, 7
	banim_frame_oam 0x0, 0x1000, 0xDC, -16, 7
	banim_frame_oam 0x4000, 0x1000, 0x98, -8, -17
	banim_frame_oam 0x0, 0x1000, 0x8, -5, -25
	banim_frame_end
banim_monm_mg1_oam_frame_44_l:
	banim_frame_oam 0x0, 0x5000, 0x3C, -4, -1
	banim_frame_oam 0x8000, 0x1000, 0x3E, -12, -1
	banim_frame_oam 0x4000, 0x1000, 0x1C, -4, -9
	banim_frame_oam 0x0, 0x1000, 0x1E, -12, -9
	banim_frame_oam 0x4000, 0x1000, 0xFA, -12, -17
	banim_frame_oam 0x0, 0x1000, 0x8, -6, -25
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_monm_mg1_oam_r:
banim_monm_mg1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x1, -4, -16
	banim_frame_oam 0x8000, 0x0, 0x20, -12, -8
	banim_frame_oam 0x0, 0x0, 0x60, -12, 8
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_oam 0x0, 0x4000, 0x3, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x5, 4, -8
	banim_frame_oam 0x0, 0x0, 0x43, -4, -16
	banim_frame_oam 0x0, 0x0, 0x2, 4, -16
	banim_frame_oam 0x4000, 0x0, 0x60, -12, 8
	banim_frame_oam 0x0, 0x0, 0x62, 4, 8
	banim_frame_end
banim_monm_mg1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x4000, 0x63, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x65, 4, -8
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_oam 0x0, 0x0, 0x43, -4, -16
	banim_frame_oam 0x0, 0x0, 0x2, 4, -16
	banim_frame_oam 0x4000, 0x0, 0x60, -12, 8
	banim_frame_oam 0x0, 0x0, 0x62, 4, 8
	banim_frame_end
banim_monm_mg1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x82, 4, -16
	banim_frame_oam 0x0, 0x4000, 0xA3, -12, 0
	banim_frame_oam 0x0, 0x0, 0x81, -20, -8
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0xC0, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x82, 4, -16
	banim_frame_oam 0x0, 0x4000, 0xA3, -12, 0
	banim_frame_oam 0x0, 0x0, 0x81, -20, -8
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_oam 0x0, 0x0, 0xE4, -16, -3
	banim_frame_end
banim_monm_mg1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x0, 0x66, -20, -16
	banim_frame_oam 0x0, 0x4000, 0x6, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x8, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x46, -12, 8
	banim_frame_oam 0x0, 0x0, 0x48, 4, 8
	banim_frame_oam 0x0, 0x0, 0x45, -20, -8
	banim_frame_oam 0x0, 0x0, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x0, 0x82, 4, -16
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0x0, 0x66, -20, -16
	banim_frame_oam 0x0, 0x4000, 0x6, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x8, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x46, -12, 8
	banim_frame_oam 0x0, 0x0, 0x48, 4, 8
	banim_frame_oam 0x0, 0x0, 0x45, -20, -8
	banim_frame_oam 0x0, 0x0, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x0, 0x82, 4, -16
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_oam 0x0, 0x0, 0xE4, -19, -7
	banim_frame_end
banim_monm_mg1_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0xE4, -20, -24
	banim_frame_oam 0x0, 0x0, 0x68, -17, -18
	banim_frame_oam 0x4000, 0x0, 0x66, -20, -16
	banim_frame_oam 0x0, 0x4000, 0x6, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x8, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x46, -12, 8
	banim_frame_oam 0x0, 0x0, 0x48, 4, 8
	banim_frame_oam 0x0, 0x0, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x0, 0x82, 4, -16
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_oam 0x0, 0x0, 0x45, -20, -8
	banim_frame_end
banim_monm_mg1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x0, 0x66, -20, -16
	banim_frame_oam 0x0, 0x4000, 0x6, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x8, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x46, -12, 8
	banim_frame_oam 0x0, 0x0, 0x48, 4, 8
	banim_frame_oam 0x0, 0x0, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x0, 0x82, 4, -16
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_oam 0x0, 0x0, 0x45, -20, -8
	banim_frame_oam 0x0, 0x0, 0xE5, -17, -18
	banim_frame_oam 0x0, 0x0, 0xE4, -21, -13
	banim_frame_oam 0x0, 0x0, 0xE4, -13, -23
	banim_frame_end
banim_monm_mg1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0x6, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x8, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x46, -12, 8
	banim_frame_oam 0x0, 0x0, 0x48, 4, 8
	banim_frame_oam 0x0, 0x0, 0x45, -20, -8
	banim_frame_oam 0x4000, 0x0, 0x66, -20, -16
	banim_frame_oam 0x0, 0x0, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x0, 0x82, 4, -16
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_oam 0x0, 0x0, 0x68, -17, -18
	banim_frame_oam 0x0, 0x0, 0xE4, -20, -9
	banim_frame_oam 0x0, 0x0, 0xE4, -22, -22
	banim_frame_oam 0x0, 0x0, 0xE4, -13, -20
	banim_frame_end
banim_monm_mg1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x6, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x8, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x46, -12, 8
	banim_frame_oam 0x0, 0x0, 0x48, 4, 8
	banim_frame_oam 0x4000, 0x0, 0x66, -20, -16
	banim_frame_oam 0x0, 0x0, 0xC1, -4, -16
	banim_frame_oam 0x0, 0x0, 0x82, 4, -16
	banim_frame_oam 0x0, 0x0, 0x0, -4, -24
	banim_frame_oam 0x0, 0x0, 0x45, -20, -8
	banim_frame_oam 0x0, 0x0, 0xE4, -21, -19
	banim_frame_end
banim_monm_mg1_oam_frame_11_r:
	banim_frame_oam 0x8000, 0x8000, 0x86, -9, -16
	banim_frame_oam 0x8000, 0x4000, 0x88, 7, -16
	banim_frame_oam 0x8000, 0x0, 0xA5, -17, -8
	banim_frame_oam 0x0, 0x0, 0xC9, -1, -24
	banim_frame_end
banim_monm_mg1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0x8000, 0x9, -14, -17
	banim_frame_oam 0x0, 0x4000, 0x4A, -6, -1
	banim_frame_oam 0x8000, 0x0, 0x4C, 10, -1
	banim_frame_oam 0x8000, 0x0, 0x49, -22, -17
	banim_frame_end
banim_monm_mg1_oam_frame_13_r:
	banim_frame_oam 0x4000, 0x8000, 0xD, -14, -17
	banim_frame_oam 0x4000, 0x4000, 0x4D, -14, -1
	banim_frame_oam 0x4000, 0x0, 0x6A, -6, 7
	banim_frame_oam 0x0, 0x0, 0x6C, 10, 7
	banim_frame_end
banim_monm_mg1_oam_frame_14_r:
	banim_frame_oam 0x4000, 0x8000, 0x8C, -14, -9
	banim_frame_oam 0x4000, 0x4000, 0xCC, -14, 7
	banim_frame_oam 0x4000, 0x0, 0x6D, -6, -17
	banim_frame_oam 0x0, 0x0, 0x6F, 10, -17
	banim_frame_end
banim_monm_mg1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0x8000, 0x11, -6, -17
	banim_frame_oam 0x8000, 0x4000, 0x13, 10, -17
	banim_frame_oam 0x8000, 0x0, 0x70, -14, -9
	banim_frame_oam 0x0, 0x0, 0xB0, -14, 7
	banim_frame_end
banim_monm_mg1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0x8000, 0x14, -6, -17
	banim_frame_oam 0x8000, 0x4000, 0x16, 10, -17
	banim_frame_oam 0x8000, 0x0, 0x91, -14, -2
	banim_frame_end
banim_monm_mg1_oam_frame_17_r:
	banim_frame_oam 0x4000, 0x8000, 0x92, -8, -19
	banim_frame_oam 0x4000, 0x4000, 0xD2, -8, -3
	banim_frame_oam 0x8000, 0x0, 0x96, 24, -19
	banim_frame_oam 0x0, 0x0, 0xD6, 24, -3
	banim_frame_oam 0x4000, 0x0, 0xF1, 0, 5
	banim_frame_oam 0x0, 0x0, 0xF3, 16, 5
	banim_frame_end
banim_monm_mg1_oam_frame_18_r:
	banim_frame_oam 0x4000, 0x8000, 0x17, 2, -19
	banim_frame_oam 0x4000, 0x4000, 0x57, 2, -3
	banim_frame_oam 0x4000, 0x0, 0x77, 2, 5
	banim_frame_oam 0x0, 0x0, 0x79, 18, 5
	banim_frame_end
banim_monm_mg1_oam_frame_19_r:
	banim_frame_oam 0x4000, 0x8000, 0x1B, 2, -19
	banim_frame_oam 0x4000, 0x4000, 0x5B, 2, -3
	banim_frame_oam 0x4000, 0x0, 0x7B, 2, 5
	banim_frame_oam 0x0, 0x0, 0x7D, 18, 5
	banim_frame_end
banim_monm_mg1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x8000, 0xDA, 2, -11
	banim_frame_oam 0x4000, 0x0, 0xF7, 2, 5
	banim_frame_oam 0x0, 0x0, 0xF9, 18, 5
	banim_frame_oam 0x4000, 0x0, 0xBB, 2, -19
	banim_frame_oam 0x0, 0x0, 0xBD, 18, -19
	banim_frame_oam 0x0, 0x0, 0x9D, 26, -19
	banim_frame_end
banim_monm_mg1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, 2, -19
	banim_frame_oam 0x8000, 0x4000, 0x2, 18, -19
	banim_frame_oam 0x0, 0x0, 0x3, 26, -19
	banim_frame_end
banim_monm_mg1_oam_frame_22_r:
	banim_frame_oam 0x0, 0x4000, 0x23, 1, -11
	banim_frame_oam 0x8000, 0x0, 0x25, 17, -11
	banim_frame_oam 0x4000, 0x0, 0x63, 1, 5
	banim_frame_oam 0x0, 0x0, 0x65, 17, 5
	banim_frame_oam 0x4000, 0x0, 0x4, 1, -19
	banim_frame_oam 0x0, 0x0, 0x6, 17, -19
	banim_frame_end
banim_monm_mg1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0x8000, 0x83, -6, -17
	banim_frame_oam 0x8000, 0x0, 0x85, 10, -1
	banim_frame_oam 0x0, 0x0, 0xE2, -3, -25
	banim_frame_end
banim_monm_mg1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0x8000, 0x26, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_oam 0x0, 0x0, 0x8, -4, -24
	banim_frame_oam 0x0, 0x0, 0x7, -20, -16
	banim_frame_end
banim_monm_mg1_oam_frame_25_r:
	banim_frame_oam 0x8000, 0x8000, 0x26, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_oam 0x0, 0x0, 0x8, -4, -24
	banim_frame_oam 0x0, 0x0, 0x7, -20, -16
	banim_frame_oam 0x0, 0x0, 0xA7, -21, -18
	banim_frame_oam 0x0, 0x0, 0xA6, -19, -23
	banim_frame_oam 0x0, 0x0, 0xA6, -27, -15
	banim_frame_end
banim_monm_mg1_oam_frame_26_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -12, -24
	banim_frame_oam 0x4000, 0x0, 0x89, -12, 8
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_end
banim_monm_mg1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -12, -24
	banim_frame_oam 0x4000, 0x0, 0x89, -12, 8
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_oam 0x0, 0x0, 0xA7, -17, -27
	banim_frame_oam 0x0, 0x0, 0xA8, -16, -13
	banim_frame_oam 0x0, 0x0, 0xA6, -20, -18
	banim_frame_oam 0x0, 0x0, 0xA6, -10, -31
	banim_frame_end
banim_monm_mg1_oam_frame_28_r:
	banim_frame_oam 0x0, 0x4000, 0xA9, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_oam 0x0, 0x4000, 0x49, -12, -8
	banim_frame_oam 0x4000, 0x0, 0x89, -12, 8
	banim_frame_end
banim_monm_mg1_oam_frame_29_r:
	banim_frame_oam 0x0, 0x4000, 0xA9, -12, -24
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_oam 0x0, 0x4000, 0x49, -12, -8
	banim_frame_oam 0x4000, 0x0, 0x89, -12, 8
	banim_frame_oam 0x0, 0x0, 0xA8, -16, -27
	banim_frame_oam 0x0, 0x0, 0xA7, -16, -13
	banim_frame_oam 0x0, 0x0, 0xA6, -15, -18
	banim_frame_oam 0x0, 0x0, 0xA6, -23, -22
	banim_frame_oam 0x0, 0x0, 0xA6, -10, -34
	banim_frame_end
banim_monm_mg1_oam_frame_30_r:
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_oam 0x0, 0x4000, 0x49, -12, -8
	banim_frame_oam 0x4000, 0x0, 0x89, -12, 8
	banim_frame_oam 0x0, 0x4000, 0xB, -12, -24
	banim_frame_end
banim_monm_mg1_oam_frame_31_r:
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_oam 0x0, 0x4000, 0x49, -12, -8
	banim_frame_oam 0x4000, 0x0, 0x89, -12, 8
	banim_frame_oam 0x0, 0x4000, 0xB, -12, -24
	banim_frame_oam 0x0, 0x0, 0xA7, -16, -25
	banim_frame_oam 0x0, 0x0, 0xA6, -19, -20
	banim_frame_oam 0x0, 0x0, 0xA6, -23, -31
	banim_frame_end
banim_monm_mg1_oam_frame_32_r:
	banim_frame_oam 0x4000, 0x0, 0x4B, -12, -16
	banim_frame_oam 0x0, 0x0, 0x6C, -12, -24
	banim_frame_oam 0x8000, 0x0, 0x6B, -12, -8
	banim_frame_oam 0x0, 0x0, 0x8, -4, -24
	banim_frame_oam 0x8000, 0x0, 0x4A, -4, -8
	banim_frame_oam 0x4000, 0x0, 0x89, -12, 8
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_end
banim_monm_mg1_oam_frame_33_r:
	banim_frame_oam 0x4000, 0x0, 0x4B, -12, -16
	banim_frame_oam 0x0, 0x0, 0x6C, -12, -24
	banim_frame_oam 0x8000, 0x0, 0x6B, -12, -8
	banim_frame_oam 0x0, 0x0, 0x8, -4, -24
	banim_frame_oam 0x8000, 0x0, 0x4A, -4, -8
	banim_frame_oam 0x4000, 0x0, 0x89, -12, 8
	banim_frame_oam 0x8000, 0x4000, 0x28, 4, -16
	banim_frame_oam 0x0, 0x0, 0xA6, -8, -25
	banim_frame_oam 0x0, 0x0, 0xA6, -17, -18
	banim_frame_end
banim_monm_mg1_oam_frame_34_r:
	banim_frame_oam 0x0, 0x4000, 0xAB, -12, -8
	banim_frame_oam 0x8000, 0x0, 0xAD, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x86, -12, 8
	banim_frame_oam 0x0, 0x0, 0x88, 4, 8
	banim_frame_oam 0x4000, 0x0, 0xE9, -12, -16
	banim_frame_oam 0x0, 0x0, 0xEB, 4, -16
	banim_frame_oam 0x0, 0x0, 0x8, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_35_r:
	banim_frame_oam 0x0, 0x4000, 0xAB, -12, -8
	banim_frame_oam 0x8000, 0x0, 0xAD, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x86, -12, 8
	banim_frame_oam 0x0, 0x0, 0x88, 4, 8
	banim_frame_oam 0x4000, 0x0, 0xE9, -12, -16
	banim_frame_oam 0x0, 0x0, 0xEB, 4, -16
	banim_frame_oam 0x0, 0x0, 0x8, -4, -24
	banim_frame_oam 0x0, 0x0, 0xA6, -18, -13
	banim_frame_end
banim_monm_mg1_oam_frame_36_r:
	banim_frame_oam 0x4000, 0x0, 0x2D, -12, -8
	banim_frame_oam 0x0, 0x0, 0xD, -12, -16
	banim_frame_oam 0x0, 0x0, 0x8, -4, -24
	banim_frame_oam 0x8000, 0x0, 0x48, 4, -8
	banim_frame_oam 0x0, 0x0, 0x88, 4, 8
	banim_frame_oam 0x0, 0x4000, 0x66, -12, 0
	banim_frame_oam 0x0, 0x0, 0xE, -4, -16
	banim_frame_oam 0x0, 0x0, 0x28, 4, -16
	banim_frame_end
banim_monm_mg1_oam_frame_37_r:
	banim_frame_oam 0x0, 0x4000, 0x4D, -12, -16
	banim_frame_oam 0x8000, 0x0, 0x4F, 4, -16
	banim_frame_oam 0x4000, 0x0, 0x8D, -12, 0
	banim_frame_oam 0x0, 0x0, 0x8F, 4, 0
	banim_frame_oam 0x4000, 0x0, 0xAE, -12, 8
	banim_frame_oam 0x0, 0x0, 0xB0, 4, 8
	banim_frame_oam 0x0, 0x0, 0x8C, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_38_r:
	banim_frame_oam 0x0, 0x4000, 0xF, -10, 0
	banim_frame_oam 0x8000, 0x0, 0x11, 6, 0
	banim_frame_oam 0x0, 0x4000, 0x50, -10, -16
	banim_frame_oam 0x8000, 0x0, 0x52, 6, -16
	banim_frame_oam 0x4000, 0x0, 0xEE, -10, -24
	banim_frame_end
banim_monm_mg1_oam_frame_39_r:
	banim_frame_oam 0x4000, 0x4000, 0xF1, -12, 8
	banim_frame_oam 0x4000, 0x0, 0x91, -5, -16
	banim_frame_oam 0x0, 0x0, 0xF0, -4, -24
	banim_frame_oam 0x0, 0x4000, 0xB1, -12, -8
	banim_frame_oam 0x8000, 0x0, 0xB3, 4, -8
	banim_frame_oam 0x0, 0x0, 0xD4, 12, 0
	banim_frame_end
banim_monm_mg1_oam_frame_40_r:
	banim_frame_oam 0x0, 0x4000, 0x34, -4, -8
	banim_frame_oam 0x4000, 0x0, 0x74, -4, 8
	banim_frame_oam 0x8000, 0x0, 0x53, -12, -8
	banim_frame_oam 0x0, 0x0, 0x93, -12, 8
	banim_frame_oam 0x4000, 0x0, 0x14, -6, -16
	banim_frame_oam 0x8000, 0x0, 0x94, 12, 0
	banim_frame_oam 0x0, 0x0, 0xF0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_41_r:
	banim_frame_oam 0x8000, 0x8000, 0x16, -12, -16
	banim_frame_oam 0x8000, 0x4000, 0x18, 4, -16
	banim_frame_oam 0x8000, 0x0, 0xD5, 12, 0
	banim_frame_oam 0x0, 0x0, 0xF0, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_42_r:
	banim_frame_oam 0x4000, 0x0, 0xD6, -4, -16
	banim_frame_oam 0x4000, 0x0, 0xF6, -12, -8
	banim_frame_oam 0x0, 0x0, 0xF8, 4, -8
	banim_frame_oam 0x0, 0x4000, 0x19, -12, 0
	banim_frame_oam 0x8000, 0x0, 0x1B, 4, 0
	banim_frame_oam 0x0, 0x0, 0x8C, -4, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x59, -12, -8
	banim_frame_oam 0x8000, 0x0, 0x5B, 4, -8
	banim_frame_oam 0x4000, 0x0, 0x39, -12, 8
	banim_frame_oam 0x0, 0x0, 0x3B, 4, 8
	banim_frame_oam 0x4000, 0x0, 0xD6, -4, -16
	banim_frame_oam 0x0, 0x0, 0x8, -4, -24
	banim_frame_end
banim_monm_mg1_oam_frame_43_r:
	banim_frame_oam 0x0, 0x4000, 0x9A, -8, -9
	banim_frame_oam 0x8000, 0x0, 0x9C, 8, -9
	banim_frame_oam 0x4000, 0x0, 0xDA, -8, 7
	banim_frame_oam 0x0, 0x0, 0xDC, 8, 7
	banim_frame_oam 0x4000, 0x0, 0x98, -8, -17
	banim_frame_oam 0x0, 0x0, 0x8, -3, -25
	banim_frame_end
banim_monm_mg1_oam_frame_44_r:
	banim_frame_oam 0x0, 0x4000, 0x3C, -12, -1
	banim_frame_oam 0x8000, 0x0, 0x3E, 4, -1
	banim_frame_oam 0x4000, 0x0, 0x1C, -12, -9
	banim_frame_oam 0x0, 0x0, 0x1E, 4, -9
	banim_frame_oam 0x4000, 0x0, 0xFA, -4, -17
	banim_frame_oam 0x0, 0x0, 0x8, -2, -25
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_monm_mg1_script:
banim_monm_mg1_mode_attack_close:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 3, banim_monm_mg1_oam_frame_3_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 6, banim_monm_mg1_oam_frame_6_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 7, banim_monm_mg1_oam_frame_7_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 10, banim_monm_mg1_oam_frame_10_r - banim_monm_mg1_oam_r
	banim_code_frame 15, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 8, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_close_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 3, banim_monm_mg1_oam_frame_3_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 2, banim_monm_mg1_sheet_0, 6, banim_monm_mg1_oam_frame_6_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 7, banim_monm_mg1_oam_frame_7_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 10, banim_monm_mg1_oam_frame_10_r - banim_monm_mg1_oam_r
	banim_code_frame 15, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 8, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_close_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 1, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 24, banim_monm_mg1_oam_frame_24_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 25, banim_monm_mg1_oam_frame_25_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 26, banim_monm_mg1_oam_frame_26_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 27, banim_monm_mg1_oam_frame_27_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 29, banim_monm_mg1_oam_frame_29_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 30, banim_monm_mg1_oam_frame_30_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 31, banim_monm_mg1_oam_frame_31_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 32, banim_monm_mg1_oam_frame_32_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 33, banim_monm_mg1_oam_frame_33_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 34, banim_monm_mg1_oam_frame_34_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 35, banim_monm_mg1_oam_frame_35_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 36, banim_monm_mg1_oam_frame_36_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 42, banim_monm_mg1_oam_frame_42_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_close_critical_back:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 24, banim_monm_mg1_oam_frame_24_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 25, banim_monm_mg1_oam_frame_25_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 26, banim_monm_mg1_oam_frame_26_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 27, banim_monm_mg1_oam_frame_27_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 29, banim_monm_mg1_oam_frame_29_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 30, banim_monm_mg1_oam_frame_30_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 31, banim_monm_mg1_oam_frame_31_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 32, banim_monm_mg1_oam_frame_32_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 33, banim_monm_mg1_oam_frame_33_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 34, banim_monm_mg1_oam_frame_34_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 35, banim_monm_mg1_oam_frame_35_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 36, banim_monm_mg1_oam_frame_36_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 42, banim_monm_mg1_oam_frame_42_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_range:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 3, banim_monm_mg1_oam_frame_3_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 6, banim_monm_mg1_oam_frame_6_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 7, banim_monm_mg1_oam_frame_7_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 10, banim_monm_mg1_oam_frame_10_r - banim_monm_mg1_oam_r
	banim_code_frame 15, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 8, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_attack_range_critical:
	banim_code_start_attack_2
	banim_code_start_attack_1
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 1, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 24, banim_monm_mg1_oam_frame_24_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 25, banim_monm_mg1_oam_frame_25_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 26, banim_monm_mg1_oam_frame_26_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 27, banim_monm_mg1_oam_frame_27_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 29, banim_monm_mg1_oam_frame_29_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 28, banim_monm_mg1_oam_frame_28_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 30, banim_monm_mg1_oam_frame_30_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 31, banim_monm_mg1_oam_frame_31_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 32, banim_monm_mg1_oam_frame_32_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 33, banim_monm_mg1_oam_frame_33_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 34, banim_monm_mg1_oam_frame_34_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 35, banim_monm_mg1_oam_frame_35_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 36, banim_monm_mg1_oam_frame_36_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_1, 39, banim_monm_mg1_oam_frame_39_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 40, banim_monm_mg1_oam_frame_40_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_1, 41, banim_monm_mg1_oam_frame_41_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 38, banim_monm_mg1_oam_frame_38_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 37, banim_monm_mg1_oam_frame_37_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_1, 42, banim_monm_mg1_oam_frame_42_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_monm_mg1_sheet_1, 44, banim_monm_mg1_oam_frame_43_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 45, banim_monm_mg1_oam_frame_44_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_monm_mg1_sheet_1, 45, banim_monm_mg1_oam_frame_44_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_monm_mg1_sheet_1, 44, banim_monm_mg1_oam_frame_43_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 45, banim_monm_mg1_oam_frame_44_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_monm_mg1_sheet_1, 45, banim_monm_mg1_oam_frame_44_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_monm_mg1_mode_stand_close:
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_monm_mg1_mode_stand:
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_monm_mg1_mode_stand_range:
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_monm_mg1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_monm_mg1_sheet_0, 0, banim_monm_mg1_oam_frame_0_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 1, banim_monm_mg1_oam_frame_1_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 2, banim_monm_mg1_oam_frame_2_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 3, banim_monm_mg1_oam_frame_3_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 4, banim_monm_mg1_oam_frame_4_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_magic_monk
	banim_code_frame 2, banim_monm_mg1_sheet_0, 6, banim_monm_mg1_oam_frame_6_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 7, banim_monm_mg1_oam_frame_7_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 8, banim_monm_mg1_oam_frame_8_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 9, banim_monm_mg1_oam_frame_9_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 10, banim_monm_mg1_oam_frame_10_r - banim_monm_mg1_oam_r
	banim_code_frame 15, banim_monm_mg1_sheet_0, 5, banim_monm_mg1_oam_frame_5_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_shorter
	banim_code_frame 2, banim_monm_mg1_sheet_0, 11, banim_monm_mg1_oam_frame_11_r - banim_monm_mg1_oam_r
	banim_code_sound_step_heavy_quick
	banim_code_frame 5, banim_monm_mg1_sheet_0, 12, banim_monm_mg1_oam_frame_12_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_0, 13, banim_monm_mg1_oam_frame_13_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 14, banim_monm_mg1_oam_frame_14_r - banim_monm_mg1_oam_r
	banim_code_frame 2, banim_monm_mg1_sheet_0, 15, banim_monm_mg1_oam_frame_15_r - banim_monm_mg1_oam_r
	banim_code_frame 8, banim_monm_mg1_sheet_0, 16, banim_monm_mg1_oam_frame_16_r - banim_monm_mg1_oam_r
	banim_code_sound_sword_swing_short
	banim_code_frame 3, banim_monm_mg1_sheet_0, 17, banim_monm_mg1_oam_frame_17_r - banim_monm_mg1_oam_r
	banim_code_call_spell_anim
	banim_code_sound_step_heavy_quick
	banim_code_frame 6, banim_monm_mg1_sheet_0, 18, banim_monm_mg1_oam_frame_18_r - banim_monm_mg1_oam_r
	banim_code_frame 5, banim_monm_mg1_sheet_0, 19, banim_monm_mg1_oam_frame_19_r - banim_monm_mg1_oam_r
	banim_code_frame 3, banim_monm_mg1_sheet_0, 20, banim_monm_mg1_oam_frame_20_r - banim_monm_mg1_oam_r
	banim_code_frame 1, banim_monm_mg1_sheet_1, 21, banim_monm_mg1_oam_frame_21_r - banim_monm_mg1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 1, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 2, banim_monm_mg1_sheet_1, 22, banim_monm_mg1_oam_frame_22_r - banim_monm_mg1_oam_r
	banim_code_frame 4, banim_monm_mg1_sheet_1, 23, banim_monm_mg1_oam_frame_23_r - banim_monm_mg1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_monm_mg1_mode_attack_close - banim_monm_mg1_script
	.word banim_monm_mg1_mode_attack_close_back - banim_monm_mg1_script
	.word banim_monm_mg1_mode_attack_close_critical - banim_monm_mg1_script
	.word banim_monm_mg1_mode_attack_close_critical_back - banim_monm_mg1_script
	.word banim_monm_mg1_mode_attack_range - banim_monm_mg1_script
	.word banim_monm_mg1_mode_attack_range_critical - banim_monm_mg1_script
	.word banim_monm_mg1_mode_dodge_close - banim_monm_mg1_script
	.word banim_monm_mg1_mode_dodge_range - banim_monm_mg1_script
	.word banim_monm_mg1_mode_stand_close - banim_monm_mg1_script
	.word banim_monm_mg1_mode_stand - banim_monm_mg1_script
	.word banim_monm_mg1_mode_stand_range - banim_monm_mg1_script
	.word banim_monm_mg1_mode_attack_miss - banim_monm_mg1_script
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

