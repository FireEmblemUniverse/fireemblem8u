@ vim:ft=armv4
	.global banim_mcd_ax1_4_script
	.global banim_mcd_ax1_4_oam_r
	.global banim_mcd_ax1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB5
	.section .data.oam_l
banim_mcd_ax1_4_oam_l:
banim_mcd_ax1_4_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x4, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x84, -24, 0
	banim_frame_oam 0x4000, 0x5000, 0xC0, -32, -40
	banim_frame_oam 0x0, 0x5000, 0x5, 16, -16
	banim_frame_oam 0x4000, 0x1000, 0x45, 16, 0
	banim_frame_oam 0x0, 0x5000, 0x65, -40, -32
	banim_frame_oam 0x4000, 0x1000, 0xA5, -40, -16
	banim_frame_end
banim_mcd_ax1_4_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -32
	banim_frame_oam 0x8000, 0x5000, 0xD, -32, -32
	banim_frame_oam 0x4000, 0x9000, 0x87, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x8B, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x8D, -32, 0
	banim_frame_oam 0x0, 0x1000, 0xC7, 24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC8, -32, -40
	banim_frame_oam 0x8000, 0x1000, 0xCC, -40, -32
	banim_frame_end
banim_mcd_ax1_4_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0xE, -8, -32
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x8E, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x92, -24, 0
	banim_frame_oam 0x8000, 0x1000, 0x14, -32, -32
	banim_frame_oam 0x0, 0x1000, 0x54, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x74, -32, 0
	banim_frame_oam 0x8000, 0x1000, 0x94, -40, -32
	banim_frame_oam 0x0, 0x1000, 0xD2, 24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, -32, -40
	banim_frame_end
banim_mcd_ax1_4_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x15, -16, -40
	banim_frame_oam 0x8000, 0x9000, 0x19, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x95, -16, -8
	banim_frame_oam 0x0, 0x5000, 0x99, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xD5, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0xD9, -32, 8
	banim_frame_oam 0x0, 0x5000, 0x1B, -48, -40
	banim_frame_oam 0x0, 0x1000, 0xF5, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xF6, -40, 8
	banim_frame_oam 0x4000, 0x5000, 0xF7, -48, -48
	banim_frame_end
banim_mcd_ax1_4_oam_frame_4_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x5000, 0x2, -16, -40
	banim_frame_oam 0x0, 0x5000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x1000, 0x82, -16, -8
	banim_frame_oam 0x4000, 0x1000, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x1000, 0xC2, -16, 8
	banim_frame_oam 0x8000, 0x5000, 0x3, 8, -24
	banim_frame_oam 0x0, 0x1000, 0x83, 8, 8
	banim_frame_oam 0x4000, 0x9000, 0x4, -48, -48
	banim_frame_oam 0x0, 0x1000, 0x44, -24, -32
	banim_frame_oam 0x8000, 0x9000, 0x64, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xE0, -16, -48
	banim_frame_oam 0x0, 0x1000, 0xE1, -40, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x9000, 0x9, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0xB, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x89, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x8B, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC9, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xCB, -8, 8
	banim_frame_oam 0x8000, 0x9000, 0xC, -24, -48
	banim_frame_oam 0x8000, 0x9000, 0x8C, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x68, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xC7, -40, 8
	banim_frame_oam 0x0, 0x5000, 0x46, -40, -48
	banim_frame_oam 0x8000, 0x1000, 0x86, -48, -48
	banim_frame_end
banim_mcd_ax1_4_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0xE, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0x12, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0x14, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x8E, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x92, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x94, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xD2, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xD4, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xF1, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xEF, 32, -24
	banim_frame_oam 0x0, 0x1000, 0xF0, 32, -16
	banim_frame_end
banim_mcd_ax1_4_oam_frame_7_l:
	banim_frame_oam 0x8000, 0x9000, 0x19, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x1B, 8, -40
	banim_frame_oam 0x0, 0x5000, 0x99, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x9B, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0xD9, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xDB, 8, 8
	banim_frame_oam 0x8000, 0x5000, 0x18, 32, -24
	banim_frame_oam 0x0, 0x1000, 0x98, 32, 8
	banim_frame_oam 0x8000, 0x5000, 0x17, 40, -16
	banim_frame_oam 0x8000, 0x9000, 0x1C, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x9C, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x3E, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x7E, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x9E, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xBE, -32, -24
	banim_frame_oam 0x0, 0x5000, 0xB5, 56, -16
	banim_frame_oam 0x8000, 0x1000, 0x16, 48, -16
	banim_frame_oam 0x0, 0x1000, 0x56, 48, 0
	banim_frame_oam 0x4000, 0x1000, 0x75, 56, 8
	banim_frame_oam 0x0, 0x1000, 0x77, 48, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_8_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x6, 8, -40
	banim_frame_oam 0x0, 0x5000, 0x84, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x86, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, 8, 8
	banim_frame_oam 0x8000, 0x9000, 0x7, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x87, -8, 0
	banim_frame_oam 0x8000, 0x5000, 0x3, 32, -24
	banim_frame_oam 0x0, 0x1000, 0x83, 32, 8
	banim_frame_oam 0x8000, 0x5000, 0x2, 40, -16
	banim_frame_oam 0x0, 0x5000, 0xA0, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0xA3, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xA2, -16, -24
	banim_frame_oam 0x4000, 0x1000, 0x60, 56, 8
	banim_frame_oam 0x0, 0x1000, 0x62, 48, 8
	banim_frame_oam 0x4000, 0x1000, 0xE1, 56, -16
	banim_frame_oam 0x4000, 0x1000, 0xE3, 56, -8
	banim_frame_oam 0x8000, 0x1000, 0x1, 48, -16
	banim_frame_oam 0x0, 0x1000, 0x41, 48, 0
	banim_frame_end
banim_mcd_ax1_4_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0xC, 8, -40
	banim_frame_oam 0x4000, 0x9000, 0x8C, 8, -8
	banim_frame_oam 0x4000, 0x5000, 0xCC, 8, 8
	banim_frame_oam 0x0, 0x5000, 0x9, 48, -24
	banim_frame_oam 0x8000, 0x1000, 0xB, 40, -24
	banim_frame_oam 0x4000, 0x1000, 0x49, 48, -8
	banim_frame_oam 0x0, 0x1000, 0x4B, 40, -8
	banim_frame_oam 0x4000, 0x1000, 0x69, 40, 8
	banim_frame_oam 0x0, 0x5000, 0x8A, -8, -32
	banim_frame_oam 0x4000, 0x1000, 0xCA, -8, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_10_l:
	banim_frame_oam 0x0, 0x5000, 0x10, 40, -32
	banim_frame_oam 0x4000, 0x1000, 0x50, 40, -16
	banim_frame_oam 0x4000, 0x9000, 0x70, 24, 0
	banim_frame_oam 0x0, 0x5000, 0x74, 8, 0
	banim_frame_oam 0x4000, 0x9000, 0x12, 8, -24
	banim_frame_oam 0x4000, 0x5000, 0x52, 8, -8
	banim_frame_oam 0x8000, 0x1000, 0x16, 0, -24
	banim_frame_oam 0x0, 0x5000, 0x17, -8, 0
	banim_frame_oam 0x8000, 0x1000, 0x19, -16, 0
	banim_frame_oam 0x4000, 0x9000, 0xB0, 0, -48
	banim_frame_oam 0x8000, 0x1000, 0xB4, -8, -48
	banim_frame_oam 0x4000, 0x5000, 0xF0, 0, -32
	banim_frame_oam 0x0, 0x1000, 0xF4, -8, -32
	banim_frame_oam 0x0, 0x5000, 0xB5, -24, -48
	banim_frame_end
banim_mcd_ax1_4_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x57, -8, -32
	banim_frame_oam 0x4000, 0x9000, 0xD7, -8, 0
	banim_frame_oam 0x4000, 0x9000, 0x1A, -24, -48
	banim_frame_oam 0x8000, 0x1000, 0x1E, -32, -48
	banim_frame_oam 0x0, 0x5000, 0x5B, -24, 0
	banim_frame_oam 0x0, 0x5000, 0x5D, 32, -8
	banim_frame_oam 0x8000, 0x1000, 0x5F, 24, -8
	banim_frame_oam 0x4000, 0x1000, 0x9D, 32, 8
	banim_frame_oam 0x0, 0x1000, 0x9F, 24, 8
	banim_frame_oam 0x4000, 0x9000, 0xDB, 24, -24
	banim_frame_end
banim_mcd_ax1_4_oam_frame_12_l:
	banim_frame_oam 0x8000, 0x9000, 0x5, 0, -40
	banim_frame_oam 0x8000, 0x5000, 0x7, -8, -40
	banim_frame_oam 0x0, 0x5000, 0x85, 0, -8
	banim_frame_oam 0x8000, 0x1000, 0x87, -8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC5, 0, 8
	banim_frame_oam 0x0, 0x1000, 0xC7, -8, 8
	banim_frame_oam 0x0, 0x9000, 0x0, -40, -48
	banim_frame_oam 0x8000, 0x5000, 0x4, -48, -48
	banim_frame_oam 0x4000, 0x1000, 0x80, -24, 8
	banim_frame_oam 0x4000, 0x1000, 0x82, 16, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, 24, -32
	banim_frame_oam 0x8000, 0x1000, 0xA2, 16, -32
	banim_frame_oam 0x4000, 0x1000, 0xE0, 24, -16
	banim_frame_oam 0x0, 0x1000, 0xE2, 16, -16
	banim_frame_end
banim_mcd_ax1_4_oam_frame_13_l:
	banim_frame_oam 0x8000, 0x9000, 0xD, 0, -32
	banim_frame_oam 0x8000, 0x5000, 0xF, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x8D, 0, 0
	banim_frame_oam 0x8000, 0x1000, 0x8F, -8, 0
	banim_frame_oam 0x0, 0x9000, 0x8, -40, -48
	banim_frame_oam 0x8000, 0x5000, 0xC, -48, -48
	banim_frame_oam 0x8000, 0x5000, 0x88, -16, -16
	banim_frame_oam 0x0, 0x1000, 0xE7, -24, 8
	banim_frame_oam 0x0, 0x1000, 0x8B, 16, 8
	banim_frame_oam 0x8000, 0x1000, 0xAC, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x8C, 16, -24
	banim_frame_end
banim_mcd_ax1_4_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0x10, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x14, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x90, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x94, -24, 0
	banim_frame_oam 0x0, 0x5000, 0x15, -40, -32
	banim_frame_oam 0x0, 0x5000, 0xD0, 16, -16
	banim_frame_oam 0x0, 0x1000, 0xEF, 16, 8
	banim_frame_oam 0x0, 0x5000, 0xD2, -24, -48
	banim_frame_oam 0x8000, 0x1000, 0xD4, -32, -48
	banim_frame_end
banim_mcd_ax1_4_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0x5, -16, -32
	banim_frame_oam 0x4000, 0x9000, 0x85, -16, 0
	banim_frame_oam 0x4000, 0x9000, 0x60, -8, -48
	banim_frame_oam 0x8000, 0x1000, 0x64, -16, -48
	banim_frame_oam 0x4000, 0x1000, 0xA2, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xA4, -40, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, -32, -16
	banim_frame_oam 0x4000, 0x1000, 0xE0, -32, 0
	banim_frame_oam 0x4000, 0x9000, 0x0, -48, -56
	banim_frame_oam 0x4000, 0x5000, 0x40, -48, -40
	banim_frame_end
banim_mcd_ax1_4_oam_frame_20_l:
	banim_frame_oam 0x0, 0x9000, 0x9, -16, -40
	banim_frame_oam 0x4000, 0x9000, 0xD, -16, -8
	banim_frame_oam 0x4000, 0x5000, 0x4D, -16, 8
	banim_frame_oam 0x8000, 0x9000, 0x6F, -32, -16
	banim_frame_oam 0x0, 0x1000, 0xD1, -40, 8
	banim_frame_oam 0x4000, 0x5000, 0xE9, 0, -48
	banim_frame_oam 0x4000, 0x5000, 0xED, -32, -48
	banim_frame_oam 0x0, 0x1000, 0xF1, -40, -48
	banim_frame_oam 0x4000, 0x5000, 0xCA, -48, -56
	banim_frame_oam 0x0, 0x1000, 0xC9, 0, -56
	banim_frame_oam 0x4000, 0x1000, 0x89, -32, -40
	banim_frame_oam 0x0, 0x1000, 0x8B, -40, -40
	banim_frame_end
banim_mcd_ax1_4_oam_frame_21_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -40, 8
	banim_frame_oam 0x4000, 0xD000, 0x6, -24, -56
	banim_frame_oam 0x8000, 0x5000, 0xE, -32, -56
	banim_frame_end
banim_mcd_ax1_4_oam_frame_22_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -40, 8
	banim_frame_oam 0x4000, 0xD000, 0x86, -32, -56
	banim_frame_oam 0x8000, 0x5000, 0x8E, -40, -56
	banim_frame_end
banim_mcd_ax1_4_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -40, 8
	banim_frame_oam 0x4000, 0xD000, 0xF, -32, -56
	banim_frame_oam 0x8000, 0x5000, 0x17, -40, -56
	banim_frame_end
banim_mcd_ax1_4_oam_frame_24_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xA0, -40, 8
	banim_frame_oam 0x4000, 0xD000, 0x8F, -24, -56
	banim_frame_end
banim_mcd_ax1_4_oam_frame_28_l:
	banim_frame_oam 0x8000, 0x9000, 0x19, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x1B, 8, -40
	banim_frame_oam 0x0, 0x5000, 0x99, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x9B, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0xD9, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xDB, 8, 8
	banim_frame_oam 0x8000, 0x5000, 0x18, 32, -24
	banim_frame_oam 0x0, 0x1000, 0x98, 32, 8
	banim_frame_oam 0x8000, 0x9000, 0x15, 48, -16
	banim_frame_oam 0x8000, 0x5000, 0x17, 40, -16
	banim_frame_oam 0x8000, 0x9000, 0x1C, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x9C, -8, 0
	banim_frame_oam 0x0, 0x5000, 0x3E, -24, -40
	banim_frame_oam 0x4000, 0x1000, 0x7E, -24, -24
	banim_frame_oam 0x4000, 0x1000, 0x9E, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xBE, -32, -24
	banim_frame_oam 0x0, 0x1000, 0xF6, 64, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_29_l:
	banim_frame_oam 0x8000, 0x9000, 0x4, 16, -40
	banim_frame_oam 0x8000, 0x5000, 0x6, 8, -40
	banim_frame_oam 0x0, 0x5000, 0x84, 16, -8
	banim_frame_oam 0x8000, 0x1000, 0x86, 8, -8
	banim_frame_oam 0x4000, 0x1000, 0xC4, 16, 8
	banim_frame_oam 0x0, 0x1000, 0xC6, 8, 8
	banim_frame_oam 0x8000, 0x9000, 0x7, -8, -32
	banim_frame_oam 0x0, 0x5000, 0x87, -8, 0
	banim_frame_oam 0x8000, 0x5000, 0x3, 32, -24
	banim_frame_oam 0x0, 0x1000, 0x83, 32, 8
	banim_frame_oam 0x8000, 0x9000, 0x0, 48, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, 40, -16
	banim_frame_oam 0x0, 0x1000, 0x80, 64, -8
	banim_frame_oam 0x0, 0x5000, 0xA0, -24, -40
	banim_frame_oam 0x8000, 0x1000, 0xA3, -16, -8
	banim_frame_oam 0x0, 0x1000, 0xA2, -16, -24
	banim_frame_end
banim_mcd_ax1_4_oam_frame_25_l:
	banim_frame_oam 0x4000, 0xD000, 0x11, -32, -40
	banim_frame_oam 0x8000, 0x5000, 0x19, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x91, 0, -8
	banim_frame_oam 0x4000, 0x9000, 0x95, -32, -8
	banim_frame_oam 0x8000, 0x1000, 0x99, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xD1, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0xD5, -32, 8
	banim_frame_oam 0x0, 0x1000, 0xD9, -40, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0x21, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x25, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x27, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0xA1, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xA5, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0xA7, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xE1, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xE5, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE7, -32, 8
	banim_frame_oam 0x8000, 0x1000, 0x20, -40, -32
	banim_frame_oam 0x0, 0x1000, 0xA0, 24, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_27_l:
	banim_frame_oam 0x8000, 0xD000, 0x8, -8, -48
	banim_frame_oam 0x8000, 0x9000, 0xC, -24, -48
	banim_frame_oam 0x8000, 0x5000, 0xE, -32, -48
	banim_frame_oam 0x8000, 0x9000, 0x8C, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x8E, -32, -16
	banim_frame_oam 0x8000, 0x1000, 0x2F, -40, -40
	banim_frame_oam 0x0, 0x1000, 0x6F, -40, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -32
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -32
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -32
	banim_frame_oam 0x4000, 0x9000, 0x80, 0, 0
	banim_frame_oam 0x0, 0x5000, 0x84, -16, 0
	banim_frame_oam 0x8000, 0x1000, 0x86, -24, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x7, 0, -40
	banim_frame_oam 0x8000, 0x9000, 0xB, -16, -40
	banim_frame_oam 0x8000, 0x5000, 0xD, -24, -40
	banim_frame_oam 0x4000, 0x9000, 0x87, 0, -8
	banim_frame_oam 0x0, 0x5000, 0x8B, -16, -8
	banim_frame_oam 0x8000, 0x1000, 0x8D, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xC7, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0xCB, -16, 8
	banim_frame_oam 0x0, 0x1000, 0xCD, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xE8, -32, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0xE, -8, -40
	banim_frame_oam 0x8000, 0x9000, 0x12, -24, -40
	banim_frame_oam 0x8000, 0x5000, 0x14, -32, -40
	banim_frame_oam 0x4000, 0x9000, 0x8E, -8, -8
	banim_frame_oam 0x0, 0x5000, 0x92, -24, -8
	banim_frame_oam 0x8000, 0x1000, 0x94, -32, -8
	banim_frame_oam 0x4000, 0x5000, 0xCE, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xD2, -24, 8
	banim_frame_oam 0x0, 0x1000, 0xD4, -32, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_15_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_18_l:
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_mcd_ax1_4_oam_r:
banim_mcd_ax1_4_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x4, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x84, 16, 0
	banim_frame_oam 0x4000, 0x4000, 0xC0, 0, -40
	banim_frame_oam 0x0, 0x4000, 0x5, -32, -16
	banim_frame_oam 0x4000, 0x0, 0x45, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x65, 24, -32
	banim_frame_oam 0x4000, 0x0, 0xA5, 24, -16
	banim_frame_end
banim_mcd_ax1_4_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -32
	banim_frame_oam 0x8000, 0x4000, 0xD, 24, -32
	banim_frame_oam 0x4000, 0x8000, 0x87, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x8B, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x8D, 24, 0
	banim_frame_oam 0x0, 0x0, 0xC7, -32, -8
	banim_frame_oam 0x4000, 0x4000, 0xC8, 0, -40
	banim_frame_oam 0x8000, 0x0, 0xCC, 32, -32
	banim_frame_end
banim_mcd_ax1_4_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -24, -32
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -32
	banim_frame_oam 0x4000, 0x8000, 0x8E, -24, 0
	banim_frame_oam 0x0, 0x4000, 0x92, 8, 0
	banim_frame_oam 0x8000, 0x0, 0x14, 24, -32
	banim_frame_oam 0x0, 0x0, 0x54, 24, -16
	banim_frame_oam 0x0, 0x0, 0x74, 24, 0
	banim_frame_oam 0x8000, 0x0, 0x94, 32, -32
	banim_frame_oam 0x0, 0x0, 0xD2, -32, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, 0, -40
	banim_frame_end
banim_mcd_ax1_4_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x15, -16, -40
	banim_frame_oam 0x8000, 0x8000, 0x19, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x95, -16, -8
	banim_frame_oam 0x0, 0x4000, 0x99, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xD5, -16, 8
	banim_frame_oam 0x4000, 0x0, 0xD9, 16, 8
	banim_frame_oam 0x0, 0x4000, 0x1B, 32, -40
	banim_frame_oam 0x0, 0x0, 0xF5, -24, -16
	banim_frame_oam 0x0, 0x0, 0xF6, 32, 8
	banim_frame_oam 0x4000, 0x4000, 0xF7, 16, -48
	banim_frame_end
banim_mcd_ax1_4_oam_frame_4_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -8, -40
	banim_frame_oam 0x8000, 0x4000, 0x2, 8, -40
	banim_frame_oam 0x0, 0x4000, 0x80, -8, -8
	banim_frame_oam 0x8000, 0x0, 0x82, 8, -8
	banim_frame_oam 0x4000, 0x0, 0xC0, -8, 8
	banim_frame_oam 0x0, 0x0, 0xC2, 8, 8
	banim_frame_oam 0x8000, 0x4000, 0x3, -16, -24
	banim_frame_oam 0x0, 0x0, 0x83, -16, 8
	banim_frame_oam 0x4000, 0x8000, 0x4, 16, -48
	banim_frame_oam 0x0, 0x0, 0x44, 16, -32
	banim_frame_oam 0x8000, 0x8000, 0x64, 16, -16
	banim_frame_oam 0x0, 0x0, 0xE0, 8, -48
	banim_frame_oam 0x0, 0x0, 0xE1, 32, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x8000, 0x9, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0xB, 0, -40
	banim_frame_oam 0x0, 0x4000, 0x89, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x8B, 0, -8
	banim_frame_oam 0x4000, 0x0, 0xC9, -16, 8
	banim_frame_oam 0x0, 0x0, 0xCB, 0, 8
	banim_frame_oam 0x8000, 0x8000, 0xC, 8, -48
	banim_frame_oam 0x8000, 0x8000, 0x8C, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x68, 24, -16
	banim_frame_oam 0x0, 0x0, 0xC7, 32, 8
	banim_frame_oam 0x0, 0x4000, 0x46, 24, -48
	banim_frame_oam 0x8000, 0x0, 0x86, 40, -48
	banim_frame_end
banim_mcd_ax1_4_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0xE, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0x12, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0x14, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x8E, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x92, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x94, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xD2, 0, 8
	banim_frame_oam 0x0, 0x0, 0xD4, 16, 8
	banim_frame_oam 0x0, 0x0, 0xF1, 24, -24
	banim_frame_oam 0x0, 0x0, 0xEF, -40, -24
	banim_frame_oam 0x0, 0x0, 0xF0, -40, -16
	banim_frame_end
banim_mcd_ax1_4_oam_frame_7_r:
	banim_frame_oam 0x8000, 0x8000, 0x19, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x1B, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x99, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x9B, -16, -8
	banim_frame_oam 0x4000, 0x0, 0xD9, -32, 8
	banim_frame_oam 0x0, 0x0, 0xDB, -16, 8
	banim_frame_oam 0x8000, 0x4000, 0x18, -40, -24
	banim_frame_oam 0x0, 0x0, 0x98, -40, 8
	banim_frame_oam 0x8000, 0x4000, 0x17, -48, -16
	banim_frame_oam 0x8000, 0x8000, 0x1C, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x9C, -8, 0
	banim_frame_oam 0x0, 0x4000, 0x3E, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x7E, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x9E, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xBE, 24, -24
	banim_frame_oam 0x0, 0x4000, 0xB5, -72, -16
	banim_frame_oam 0x8000, 0x0, 0x16, -56, -16
	banim_frame_oam 0x0, 0x0, 0x56, -56, 0
	banim_frame_oam 0x4000, 0x0, 0x75, -72, 8
	banim_frame_oam 0x0, 0x0, 0x77, -56, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_8_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x6, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x84, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x86, -16, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -32, 8
	banim_frame_oam 0x0, 0x0, 0xC6, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x7, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x87, -8, 0
	banim_frame_oam 0x8000, 0x4000, 0x3, -40, -24
	banim_frame_oam 0x0, 0x0, 0x83, -40, 8
	banim_frame_oam 0x8000, 0x4000, 0x2, -48, -16
	banim_frame_oam 0x0, 0x4000, 0xA0, 8, -40
	banim_frame_oam 0x8000, 0x0, 0xA3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xA2, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x60, -72, 8
	banim_frame_oam 0x0, 0x0, 0x62, -56, 8
	banim_frame_oam 0x4000, 0x0, 0xE1, -72, -16
	banim_frame_oam 0x4000, 0x0, 0xE3, -72, -8
	banim_frame_oam 0x8000, 0x0, 0x1, -56, -16
	banim_frame_oam 0x0, 0x0, 0x41, -56, 0
	banim_frame_end
banim_mcd_ax1_4_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0xC, -40, -40
	banim_frame_oam 0x4000, 0x8000, 0x8C, -40, -8
	banim_frame_oam 0x4000, 0x4000, 0xCC, -40, 8
	banim_frame_oam 0x0, 0x4000, 0x9, -64, -24
	banim_frame_oam 0x8000, 0x0, 0xB, -48, -24
	banim_frame_oam 0x4000, 0x0, 0x49, -64, -8
	banim_frame_oam 0x0, 0x0, 0x4B, -48, -8
	banim_frame_oam 0x4000, 0x0, 0x69, -56, 8
	banim_frame_oam 0x0, 0x4000, 0x8A, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xCA, -8, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_10_r:
	banim_frame_oam 0x0, 0x4000, 0x10, -56, -32
	banim_frame_oam 0x4000, 0x0, 0x50, -56, -16
	banim_frame_oam 0x4000, 0x8000, 0x70, -56, 0
	banim_frame_oam 0x0, 0x4000, 0x74, -24, 0
	banim_frame_oam 0x4000, 0x8000, 0x12, -40, -24
	banim_frame_oam 0x4000, 0x4000, 0x52, -40, -8
	banim_frame_oam 0x8000, 0x0, 0x16, -8, -24
	banim_frame_oam 0x0, 0x4000, 0x17, -8, 0
	banim_frame_oam 0x8000, 0x0, 0x19, 8, 0
	banim_frame_oam 0x4000, 0x8000, 0xB0, -32, -48
	banim_frame_oam 0x8000, 0x0, 0xB4, 0, -48
	banim_frame_oam 0x4000, 0x4000, 0xF0, -32, -32
	banim_frame_oam 0x0, 0x0, 0xF4, 0, -32
	banim_frame_oam 0x0, 0x4000, 0xB5, 8, -48
	banim_frame_end
banim_mcd_ax1_4_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x57, -24, -32
	banim_frame_oam 0x4000, 0x8000, 0xD7, -24, 0
	banim_frame_oam 0x4000, 0x8000, 0x1A, -8, -48
	banim_frame_oam 0x8000, 0x0, 0x1E, 24, -48
	banim_frame_oam 0x0, 0x4000, 0x5B, 8, 0
	banim_frame_oam 0x0, 0x4000, 0x5D, -48, -8
	banim_frame_oam 0x8000, 0x0, 0x5F, -32, -8
	banim_frame_oam 0x4000, 0x0, 0x9D, -48, 8
	banim_frame_oam 0x0, 0x0, 0x9F, -32, 8
	banim_frame_oam 0x4000, 0x8000, 0xDB, -56, -24
	banim_frame_end
banim_mcd_ax1_4_oam_frame_12_r:
	banim_frame_oam 0x8000, 0x8000, 0x5, -16, -40
	banim_frame_oam 0x8000, 0x4000, 0x7, 0, -40
	banim_frame_oam 0x0, 0x4000, 0x85, -16, -8
	banim_frame_oam 0x8000, 0x0, 0x87, 0, -8
	banim_frame_oam 0x4000, 0x0, 0xC5, -16, 8
	banim_frame_oam 0x0, 0x0, 0xC7, 0, 8
	banim_frame_oam 0x0, 0x8000, 0x0, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0x4, 40, -48
	banim_frame_oam 0x4000, 0x0, 0x80, 8, 8
	banim_frame_oam 0x4000, 0x0, 0x82, -32, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, -40, -32
	banim_frame_oam 0x8000, 0x0, 0xA2, -24, -32
	banim_frame_oam 0x4000, 0x0, 0xE0, -40, -16
	banim_frame_oam 0x0, 0x0, 0xE2, -24, -16
	banim_frame_end
banim_mcd_ax1_4_oam_frame_13_r:
	banim_frame_oam 0x8000, 0x8000, 0xD, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0xF, 0, -32
	banim_frame_oam 0x0, 0x4000, 0x8D, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x8F, 0, 0
	banim_frame_oam 0x0, 0x8000, 0x8, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0xC, 40, -48
	banim_frame_oam 0x8000, 0x4000, 0x88, 8, -16
	banim_frame_oam 0x0, 0x0, 0xE7, 16, 8
	banim_frame_oam 0x0, 0x0, 0x8B, -24, 8
	banim_frame_oam 0x8000, 0x0, 0xAC, -24, -16
	banim_frame_oam 0x0, 0x0, 0x8C, -24, -24
	banim_frame_end
banim_mcd_ax1_4_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0x10, -16, -32
	banim_frame_oam 0x8000, 0x4000, 0x14, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x90, -16, 0
	banim_frame_oam 0x8000, 0x0, 0x94, 16, 0
	banim_frame_oam 0x0, 0x4000, 0x15, 24, -32
	banim_frame_oam 0x0, 0x4000, 0xD0, -32, -16
	banim_frame_oam 0x0, 0x0, 0xEF, -24, 8
	banim_frame_oam 0x0, 0x4000, 0xD2, 8, -48
	banim_frame_oam 0x8000, 0x0, 0xD4, 24, -48
	banim_frame_end
banim_mcd_ax1_4_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0x5, -16, -32
	banim_frame_oam 0x4000, 0x8000, 0x85, -16, 0
	banim_frame_oam 0x4000, 0x8000, 0x60, -24, -48
	banim_frame_oam 0x8000, 0x0, 0x64, 8, -48
	banim_frame_oam 0x4000, 0x0, 0xA2, 16, 8
	banim_frame_oam 0x0, 0x0, 0xA4, 32, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, 16, -16
	banim_frame_oam 0x4000, 0x0, 0xE0, 16, 0
	banim_frame_oam 0x4000, 0x8000, 0x0, 16, -56
	banim_frame_oam 0x4000, 0x4000, 0x40, 16, -40
	banim_frame_end
banim_mcd_ax1_4_oam_frame_20_r:
	banim_frame_oam 0x0, 0x8000, 0x9, -16, -40
	banim_frame_oam 0x4000, 0x8000, 0xD, -16, -8
	banim_frame_oam 0x4000, 0x4000, 0x4D, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x6F, 16, -16
	banim_frame_oam 0x0, 0x0, 0xD1, 32, 8
	banim_frame_oam 0x4000, 0x4000, 0xE9, -32, -48
	banim_frame_oam 0x4000, 0x4000, 0xED, 0, -48
	banim_frame_oam 0x0, 0x0, 0xF1, 32, -48
	banim_frame_oam 0x4000, 0x4000, 0xCA, 16, -56
	banim_frame_oam 0x0, 0x0, 0xC9, -8, -56
	banim_frame_oam 0x4000, 0x0, 0x89, 16, -40
	banim_frame_oam 0x0, 0x0, 0x8B, 32, -40
	banim_frame_end
banim_mcd_ax1_4_oam_frame_21_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 32, 8
	banim_frame_oam 0x4000, 0xC000, 0x6, -40, -56
	banim_frame_oam 0x8000, 0x4000, 0xE, 24, -56
	banim_frame_end
banim_mcd_ax1_4_oam_frame_22_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 32, 8
	banim_frame_oam 0x4000, 0xC000, 0x86, -32, -56
	banim_frame_oam 0x8000, 0x4000, 0x8E, 32, -56
	banim_frame_end
banim_mcd_ax1_4_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 32, 8
	banim_frame_oam 0x4000, 0xC000, 0xF, -32, -56
	banim_frame_oam 0x8000, 0x4000, 0x17, 32, -56
	banim_frame_end
banim_mcd_ax1_4_oam_frame_24_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -16, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -16, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 16, 8
	banim_frame_oam 0x0, 0x0, 0xA0, 32, 8
	banim_frame_oam 0x4000, 0xC000, 0x8F, -40, -56
	banim_frame_end
banim_mcd_ax1_4_oam_frame_28_r:
	banim_frame_oam 0x8000, 0x8000, 0x19, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x1B, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x99, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x9B, -16, -8
	banim_frame_oam 0x4000, 0x0, 0xD9, -32, 8
	banim_frame_oam 0x0, 0x0, 0xDB, -16, 8
	banim_frame_oam 0x8000, 0x4000, 0x18, -40, -24
	banim_frame_oam 0x0, 0x0, 0x98, -40, 8
	banim_frame_oam 0x8000, 0x8000, 0x15, -64, -16
	banim_frame_oam 0x8000, 0x4000, 0x17, -48, -16
	banim_frame_oam 0x8000, 0x8000, 0x1C, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x9C, -8, 0
	banim_frame_oam 0x0, 0x4000, 0x3E, 8, -40
	banim_frame_oam 0x4000, 0x0, 0x7E, 8, -24
	banim_frame_oam 0x4000, 0x0, 0x9E, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xBE, 24, -24
	banim_frame_oam 0x0, 0x0, 0xF6, -72, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_29_r:
	banim_frame_oam 0x8000, 0x8000, 0x4, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x6, -16, -40
	banim_frame_oam 0x0, 0x4000, 0x84, -32, -8
	banim_frame_oam 0x8000, 0x0, 0x86, -16, -8
	banim_frame_oam 0x4000, 0x0, 0xC4, -32, 8
	banim_frame_oam 0x0, 0x0, 0xC6, -16, 8
	banim_frame_oam 0x8000, 0x8000, 0x7, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x87, -8, 0
	banim_frame_oam 0x8000, 0x4000, 0x3, -40, -24
	banim_frame_oam 0x0, 0x0, 0x83, -40, 8
	banim_frame_oam 0x8000, 0x8000, 0x0, -64, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, -48, -16
	banim_frame_oam 0x0, 0x0, 0x80, -72, -8
	banim_frame_oam 0x0, 0x4000, 0xA0, 8, -40
	banim_frame_oam 0x8000, 0x0, 0xA3, 8, -8
	banim_frame_oam 0x0, 0x0, 0xA2, 8, -24
	banim_frame_end
banim_mcd_ax1_4_oam_frame_25_r:
	banim_frame_oam 0x4000, 0xC000, 0x11, -32, -40
	banim_frame_oam 0x8000, 0x4000, 0x19, 32, -40
	banim_frame_oam 0x4000, 0x8000, 0x91, -32, -8
	banim_frame_oam 0x4000, 0x8000, 0x95, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x99, 32, -8
	banim_frame_oam 0x4000, 0x4000, 0xD1, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0xD5, 0, 8
	banim_frame_oam 0x0, 0x0, 0xD9, 32, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0x21, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x25, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x27, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0xA1, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xA5, 8, -8
	banim_frame_oam 0x8000, 0x0, 0xA7, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xE1, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xE5, 8, 8
	banim_frame_oam 0x0, 0x0, 0xE7, 24, 8
	banim_frame_oam 0x8000, 0x0, 0x20, 32, -32
	banim_frame_oam 0x0, 0x0, 0xA0, -32, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_27_r:
	banim_frame_oam 0x8000, 0xC000, 0x8, -24, -48
	banim_frame_oam 0x8000, 0x8000, 0xC, 8, -48
	banim_frame_oam 0x8000, 0x4000, 0xE, 24, -48
	banim_frame_oam 0x8000, 0x8000, 0x8C, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x8E, 24, -16
	banim_frame_oam 0x8000, 0x0, 0x2F, 32, -40
	banim_frame_oam 0x0, 0x0, 0x6F, 32, -24
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -32
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -32
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -32
	banim_frame_oam 0x4000, 0x8000, 0x80, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x84, 0, 0
	banim_frame_oam 0x8000, 0x0, 0x86, 16, 0
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x7, -32, -40
	banim_frame_oam 0x8000, 0x8000, 0xB, 0, -40
	banim_frame_oam 0x8000, 0x4000, 0xD, 16, -40
	banim_frame_oam 0x4000, 0x8000, 0x87, -32, -8
	banim_frame_oam 0x0, 0x4000, 0x8B, 0, -8
	banim_frame_oam 0x8000, 0x0, 0x8D, 16, -8
	banim_frame_oam 0x4000, 0x4000, 0xC7, -32, 8
	banim_frame_oam 0x4000, 0x0, 0xCB, 0, 8
	banim_frame_oam 0x0, 0x0, 0xCD, 16, 8
	banim_frame_oam 0x0, 0x0, 0xE8, 24, -16
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0xE, -24, -40
	banim_frame_oam 0x8000, 0x8000, 0x12, 8, -40
	banim_frame_oam 0x8000, 0x4000, 0x14, 24, -40
	banim_frame_oam 0x4000, 0x8000, 0x8E, -24, -8
	banim_frame_oam 0x0, 0x4000, 0x92, 8, -8
	banim_frame_oam 0x8000, 0x0, 0x94, 24, -8
	banim_frame_oam 0x4000, 0x4000, 0xCE, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xD2, 8, 8
	banim_frame_oam 0x0, 0x0, 0xD4, 24, 8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_15_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mcd_ax1_4_oam_frame_18_r:
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_mcd_ax1_4_script:
banim_mcd_ax1_4_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_0, 1, banim_mcd_ax1_4_oam_frame_1_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 2, banim_mcd_ax1_4_oam_frame_2_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 3, banim_mcd_ax1_4_oam_frame_3_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 12, banim_mcd_ax1_sheet_1, 4, banim_mcd_ax1_4_oam_frame_4_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_1, 5, banim_mcd_ax1_4_oam_frame_5_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_mcd_ax1_sheet_1, 6, banim_mcd_ax1_4_oam_frame_6_r - banim_mcd_ax1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 7, banim_mcd_ax1_4_oam_frame_7_r - banim_mcd_ax1_4_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_mcd_ax1_sheet_2, 8, banim_mcd_ax1_4_oam_frame_8_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 9, banim_mcd_ax1_4_oam_frame_9_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ax1_sheet_2, 10, banim_mcd_ax1_4_oam_frame_10_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 11, banim_mcd_ax1_4_oam_frame_11_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 12, banim_mcd_ax1_4_oam_frame_12_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 13, banim_mcd_ax1_4_oam_frame_13_r - banim_mcd_ax1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ax1_sheet_3, 14, banim_mcd_ax1_4_oam_frame_14_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_4_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 12, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_mcd_ax1_sheet_2, 31, banim_mcd_ax1_4_oam_frame_17_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 31, banim_mcd_ax1_4_oam_frame_17_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ax1_sheet_2, 31, banim_mcd_ax1_4_oam_frame_17_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 31, banim_mcd_ax1_4_oam_frame_17_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 32, banim_mcd_ax1_4_oam_frame_18_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 32, banim_mcd_ax1_4_oam_frame_18_r - banim_mcd_ax1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ax1_sheet_3, 32, banim_mcd_ax1_4_oam_frame_18_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_4_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_0, 1, banim_mcd_ax1_4_oam_frame_1_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 2, banim_mcd_ax1_4_oam_frame_2_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 3, banim_mcd_ax1_4_oam_frame_3_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_4, 15, banim_mcd_ax1_4_oam_frame_19_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_4, 16, banim_mcd_ax1_4_oam_frame_20_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 17, banim_mcd_ax1_4_oam_frame_21_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 18, banim_mcd_ax1_4_oam_frame_22_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 19, banim_mcd_ax1_4_oam_frame_23_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 20, banim_mcd_ax1_4_oam_frame_24_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 17, banim_mcd_ax1_4_oam_frame_21_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 18, banim_mcd_ax1_4_oam_frame_22_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 19, banim_mcd_ax1_4_oam_frame_23_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 20, banim_mcd_ax1_4_oam_frame_24_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 17, banim_mcd_ax1_4_oam_frame_21_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 18, banim_mcd_ax1_4_oam_frame_22_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 19, banim_mcd_ax1_4_oam_frame_23_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_5, 20, banim_mcd_ax1_4_oam_frame_24_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 8, banim_mcd_ax1_sheet_4, 16, banim_mcd_ax1_4_oam_frame_20_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 3, banim_mcd_ax1_sheet_4, 15, banim_mcd_ax1_4_oam_frame_19_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 16, banim_mcd_ax1_sheet_1, 4, banim_mcd_ax1_4_oam_frame_4_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_1, 5, banim_mcd_ax1_4_oam_frame_5_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_mcd_ax1_sheet_1, 6, banim_mcd_ax1_4_oam_frame_6_r - banim_mcd_ax1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 7, banim_mcd_ax1_4_oam_frame_7_r - banim_mcd_ax1_4_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_mcd_ax1_sheet_2, 8, banim_mcd_ax1_4_oam_frame_8_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 9, banim_mcd_ax1_4_oam_frame_9_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ax1_sheet_2, 10, banim_mcd_ax1_4_oam_frame_10_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 11, banim_mcd_ax1_4_oam_frame_11_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 12, banim_mcd_ax1_4_oam_frame_12_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 13, banim_mcd_ax1_4_oam_frame_13_r - banim_mcd_ax1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ax1_sheet_3, 14, banim_mcd_ax1_4_oam_frame_14_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_4_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 8, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 3, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 16, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 30, banim_mcd_ax1_4_oam_frame_16_r - banim_mcd_ax1_4_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood
	banim_code_frame 2, banim_mcd_ax1_sheet_2, 31, banim_mcd_ax1_4_oam_frame_17_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 31, banim_mcd_ax1_4_oam_frame_17_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ax1_sheet_2, 31, banim_mcd_ax1_4_oam_frame_17_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 31, banim_mcd_ax1_4_oam_frame_17_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 32, banim_mcd_ax1_4_oam_frame_18_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 32, banim_mcd_ax1_4_oam_frame_18_r - banim_mcd_ax1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ax1_sheet_3, 32, banim_mcd_ax1_4_oam_frame_18_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 29, banim_mcd_ax1_4_oam_frame_15_r - banim_mcd_ax1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_4_mode_attack_range:
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_end_mode
banim_mcd_ax1_4_mode_attack_range_critical:
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_end_mode
banim_mcd_ax1_4_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mcd_ax1_sheet_6, 23, banim_mcd_ax1_4_oam_frame_25_r - banim_mcd_ax1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_mcd_ax1_sheet_6, 24, banim_mcd_ax1_4_oam_frame_26_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_6, 25, banim_mcd_ax1_4_oam_frame_27_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_mcd_ax1_sheet_6, 24, banim_mcd_ax1_4_oam_frame_26_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_6, 23, banim_mcd_ax1_4_oam_frame_25_r - banim_mcd_ax1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_4_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mcd_ax1_sheet_6, 23, banim_mcd_ax1_4_oam_frame_25_r - banim_mcd_ax1_4_oam_r
	banim_code_start_dodge
	banim_code_frame 2, banim_mcd_ax1_sheet_6, 24, banim_mcd_ax1_4_oam_frame_26_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_6, 25, banim_mcd_ax1_4_oam_frame_27_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 2, banim_mcd_ax1_sheet_6, 24, banim_mcd_ax1_4_oam_frame_26_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_6, 23, banim_mcd_ax1_4_oam_frame_25_r - banim_mcd_ax1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mcd_ax1_4_mode_stand_close:
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_4_mode_stand:
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_4_mode_stand_range:
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mcd_ax1_4_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_0, 1, banim_mcd_ax1_4_oam_frame_1_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 2, banim_mcd_ax1_4_oam_frame_2_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_0, 3, banim_mcd_ax1_4_oam_frame_3_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 12, banim_mcd_ax1_sheet_1, 4, banim_mcd_ax1_4_oam_frame_4_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_1, 5, banim_mcd_ax1_4_oam_frame_5_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_down
	banim_code_frame 3, banim_mcd_ax1_sheet_1, 6, banim_mcd_ax1_4_oam_frame_6_r - banim_mcd_ax1_4_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_mcd_ax1_sheet_1, 21, banim_mcd_ax1_4_oam_frame_28_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 2, banim_mcd_ax1_sheet_2, 22, banim_mcd_ax1_4_oam_frame_29_r - banim_mcd_ax1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 9, banim_mcd_ax1_4_oam_frame_9_r - banim_mcd_ax1_4_oam_r
	banim_code_sound_step_light_horse_pitch_up_loud
	banim_code_frame 4, banim_mcd_ax1_sheet_2, 10, banim_mcd_ax1_4_oam_frame_10_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 6, banim_mcd_ax1_sheet_2, 11, banim_mcd_ax1_4_oam_frame_11_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 12, banim_mcd_ax1_4_oam_frame_12_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 4, banim_mcd_ax1_sheet_3, 13, banim_mcd_ax1_4_oam_frame_13_r - banim_mcd_ax1_4_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_mcd_ax1_sheet_3, 14, banim_mcd_ax1_4_oam_frame_14_r - banim_mcd_ax1_4_oam_r
	banim_code_frame 1, banim_mcd_ax1_sheet_0, 0, banim_mcd_ax1_4_oam_frame_0_r - banim_mcd_ax1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_mcd_ax1_4_mode_attack_close - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_attack_close_back - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_attack_close_critical - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_attack_close_critical_back - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_attack_range - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_attack_range_critical - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_dodge_close - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_dodge_range - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_stand_close - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_stand - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_stand_range - banim_mcd_ax1_4_script
	.word banim_mcd_ax1_4_mode_attack_miss - banim_mcd_ax1_4_script
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

