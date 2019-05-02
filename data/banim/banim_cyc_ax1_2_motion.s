@ vim:ft=armv4
	.global banim_cyc_ax1_2_script
	.global banim_cyc_ax1_2_oam_r
	.global banim_cyc_ax1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xAE
	.section .data.oam_l
banim_cyc_ax1_2_oam_l:
banim_cyc_ax1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0xD000, 0x1, -20, -44
	banim_frame_oam 0x8000, 0x5000, 0x5, -28, -44
	banim_frame_oam 0x8000, 0x5000, 0x85, -28, -12
	banim_frame_oam 0x8000, 0x5000, 0x26, -36, -36
	banim_frame_oam 0x0, 0x1000, 0xA6, -36, -4
	banim_frame_oam 0x8000, 0x5000, 0x40, 12, -28
	banim_frame_oam 0x0, 0x1000, 0xC0, 12, 4
	banim_frame_oam 0x0, 0x1000, 0xE6, -36, 12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_1_l:
	banim_frame_oam 0x8000, 0xD000, 0x8, -28, -44
	banim_frame_oam 0x8000, 0x5000, 0x2C, -36, -36
	banim_frame_oam 0x0, 0x1000, 0xAC, -36, -4
	banim_frame_oam 0x0, 0x1000, 0xEC, -36, 12
	banim_frame_oam 0x8000, 0x5000, 0x27, 4, -36
	banim_frame_oam 0x8000, 0x1000, 0xA7, 4, -4
	banim_frame_oam 0x0, 0x1000, 0xE7, 4, 12
	banim_frame_oam 0x0, 0x1000, 0x6, 12, -4
	banim_frame_oam 0x0, 0x1000, 0x7, -44, -4
	banim_frame_oam 0x8000, 0x1000, 0x0, -44, -20
	banim_frame_end
banim_cyc_ax1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0xD000, 0xD, -20, -44
	banim_frame_oam 0x8000, 0x9000, 0x11, -36, -44
	banim_frame_oam 0x8000, 0x9000, 0x91, -36, -12
	banim_frame_oam 0x8000, 0x5000, 0x53, -44, -28
	banim_frame_end
banim_cyc_ax1_2_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x9000, 0xAD, -20, -4
	banim_frame_oam 0x4000, 0x5000, 0xED, -20, 12
	banim_frame_oam 0x4000, 0x1000, 0xF1, -36, 12
	banim_frame_oam 0x0, 0x9000, 0x14, -28, -44
	banim_frame_oam 0x8000, 0x5000, 0x18, -36, -44
	banim_frame_oam 0x4000, 0x5000, 0x94, -28, -12
	banim_frame_oam 0x0, 0x1000, 0x98, -36, -12
	banim_frame_oam 0x8000, 0x1000, 0xB4, -44, -28
	banim_frame_oam 0x0, 0x1000, 0xF4, -44, -12
	banim_frame_oam 0x8000, 0x1000, 0x13, 4, -20
	banim_frame_oam 0x8000, 0x1000, 0xD3, 4, -36
	banim_frame_oam 0x8000, 0x1000, 0xB1, -28, -4
	banim_frame_oam 0x0, 0x1000, 0xD2, -36, 4
	banim_frame_end
banim_cyc_ax1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0xB5, 20, -36
	banim_frame_oam 0x8000, 0x1000, 0xB7, 12, -36
	banim_frame_oam 0x4000, 0x1000, 0xF5, 20, -20
	banim_frame_oam 0x0, 0x1000, 0xF7, 12, -20
	banim_frame_oam 0x4000, 0x1000, 0xDE, 12, -12
	banim_frame_oam 0x8000, 0xD000, 0x19, -20, -44
	banim_frame_oam 0x8000, 0x5000, 0x1D, -28, -44
	banim_frame_oam 0x8000, 0x5000, 0x9D, -28, -12
	banim_frame_oam 0x0, 0x5000, 0x9E, -44, -12
	banim_frame_oam 0x0, 0x1000, 0xFE, -36, 12
	banim_frame_oam 0x8000, 0x5000, 0x1E, -36, -44
	banim_frame_oam 0x8000, 0x1000, 0x3F, -44, -36
	banim_frame_oam 0x0, 0x1000, 0x7F, -44, -20
	banim_frame_oam 0x0, 0x1000, 0xFF, -44, -44
	banim_frame_end
banim_cyc_ax1_2_oam_frame_5_l:
	banim_frame_oam 0x8000, 0x5000, 0x40, -28, -36
	banim_frame_oam 0x8000, 0x1000, 0xC0, -28, -4
	banim_frame_oam 0x8000, 0x9000, 0x4, -12, -44
	banim_frame_oam 0x8000, 0x5000, 0x6, -20, -44
	banim_frame_oam 0x8000, 0x9000, 0x84, -12, -12
	banim_frame_oam 0x8000, 0x5000, 0x86, -20, -12
	banim_frame_oam 0x8000, 0x5000, 0x83, 4, -12
	banim_frame_oam 0x4000, 0x1000, 0xE1, 12, 12
	banim_frame_oam 0x4000, 0x1000, 0x62, -36, 12
	banim_frame_oam 0x0, 0x5000, 0x0, 20, -36
	banim_frame_oam 0x8000, 0x1000, 0x2, 12, -36
	banim_frame_oam 0x8000, 0x1000, 0x3, 4, -44
	banim_frame_oam 0x0, 0x1000, 0x43, 4, -28
	banim_frame_oam 0x0, 0x5000, 0x81, -44, -20
	banim_frame_oam 0x4000, 0x1000, 0xC1, -44, -4
	banim_frame_oam 0x8000, 0x1000, 0x41, -36, -36
	banim_frame_end
banim_cyc_ax1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0xA4, -12, -4
	banim_frame_oam 0x8000, 0x1000, 0xA6, -20, -4
	banim_frame_oam 0x4000, 0x1000, 0xE4, -12, 12
	banim_frame_oam 0x0, 0x1000, 0xE6, -20, 12
	banim_frame_oam 0x8000, 0x1000, 0x83, 4, -12
	banim_frame_oam 0x0, 0x1000, 0xC3, 4, 4
	banim_frame_oam 0x4000, 0x9000, 0x27, 4, -36
	banim_frame_oam 0x0, 0x9000, 0x67, -28, -44
	banim_frame_oam 0x4000, 0x5000, 0xE7, -28, -12
	banim_frame_oam 0x0, 0x1000, 0xA, 4, -44
	banim_frame_oam 0x4000, 0x1000, 0x7, 12, 12
	banim_frame_oam 0x0, 0x1000, 0x9, 4, 12
	banim_frame_oam 0x4000, 0x1000, 0x62, -36, 12
	banim_frame_oam 0x8000, 0x1000, 0xC0, -28, -4
	banim_frame_oam 0x8000, 0x9000, 0xB, -44, -36
	banim_frame_oam 0x4000, 0x1000, 0x8B, -44, -4
	banim_frame_end
banim_cyc_ax1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x5000, 0xAB, 20, -36
	banim_frame_oam 0x4000, 0x1000, 0xEB, 20, -20
	banim_frame_oam 0x8000, 0x5000, 0x8D, -44, -28
	banim_frame_oam 0x8000, 0x1000, 0x4D, 12, -28
	banim_frame_oam 0x8000, 0xD000, 0xE, -20, -44
	banim_frame_oam 0x8000, 0x9000, 0x12, -36, -44
	banim_frame_oam 0x8000, 0x9000, 0x92, -36, -12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_10_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -20, -44
	banim_frame_oam 0x8000, 0x9000, 0x4, -36, -44
	banim_frame_oam 0x8000, 0x9000, 0x84, -36, -12
	banim_frame_oam 0x8000, 0x1000, 0x46, -44, -28
	banim_frame_oam 0x0, 0x1000, 0x86, -44, -12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_11_l:
	banim_frame_oam 0x8000, 0xD000, 0x7, -20, -44
	banim_frame_oam 0x8000, 0x9000, 0xB, -36, -44
	banim_frame_oam 0x8000, 0x9000, 0x8B, -36, -12
	banim_frame_oam 0x8000, 0x1000, 0x46, -44, -28
	banim_frame_oam 0x0, 0x1000, 0x86, -44, -12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_12_l:
	banim_frame_oam 0x8000, 0xD000, 0xD, -20, -44
	banim_frame_oam 0x8000, 0x5000, 0x11, -28, -44
	banim_frame_oam 0x8000, 0x5000, 0x91, -28, -12
	banim_frame_oam 0x8000, 0x5000, 0x2C, -36, -36
	banim_frame_oam 0x8000, 0x1000, 0x46, -44, -28
	banim_frame_oam 0x0, 0x1000, 0x86, -44, -12
	banim_frame_oam 0x8000, 0x1000, 0xCC, -36, 4
	banim_frame_end
banim_cyc_ax1_2_oam_frame_13_l:
	banim_frame_oam 0x8000, 0xD000, 0x12, -36, -44
	banim_frame_oam 0x8000, 0x1000, 0x46, -44, -28
	banim_frame_oam 0x0, 0x1000, 0x86, -44, -12
	banim_frame_oam 0x8000, 0x9000, 0x0, -4, -44
	banim_frame_oam 0x8000, 0x9000, 0x80, -4, -12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_14_l:
	banim_frame_oam 0x8000, 0xD000, 0x1, -16, -44
	banim_frame_oam 0x8000, 0x9000, 0x5, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x7, -40, -44
	banim_frame_oam 0x8000, 0x9000, 0x85, -32, -12
	banim_frame_oam 0x8000, 0x5000, 0x87, -40, -12
	banim_frame_oam 0x8000, 0x5000, 0x60, 16, -20
	banim_frame_end
banim_cyc_ax1_2_oam_frame_15_l:
	banim_frame_oam 0x8000, 0xD000, 0x8, -16, -44
	banim_frame_oam 0x8000, 0x9000, 0xC, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0xE, -40, -44
	banim_frame_oam 0x8000, 0x9000, 0x8C, -32, -12
	banim_frame_oam 0x8000, 0x5000, 0x8E, -40, -12
	banim_frame_oam 0x8000, 0x1000, 0x0, 16, -28
	banim_frame_oam 0x0, 0x1000, 0xE0, -48, -12
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cyc_ax1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cyc_ax1_2_oam_frame_9_l:
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_cyc_ax1_2_oam_r:
banim_cyc_ax1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0xC000, 0x1, -12, -44
	banim_frame_oam 0x8000, 0x4000, 0x5, 20, -44
	banim_frame_oam 0x8000, 0x4000, 0x85, 20, -12
	banim_frame_oam 0x8000, 0x4000, 0x26, 28, -36
	banim_frame_oam 0x0, 0x0, 0xA6, 28, -4
	banim_frame_oam 0x8000, 0x4000, 0x40, -20, -28
	banim_frame_oam 0x0, 0x0, 0xC0, -20, 4
	banim_frame_oam 0x0, 0x0, 0xE6, 28, 12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_1_r:
	banim_frame_oam 0x8000, 0xC000, 0x8, -4, -44
	banim_frame_oam 0x8000, 0x4000, 0x2C, 28, -36
	banim_frame_oam 0x0, 0x0, 0xAC, 28, -4
	banim_frame_oam 0x0, 0x0, 0xEC, 28, 12
	banim_frame_oam 0x8000, 0x4000, 0x27, -12, -36
	banim_frame_oam 0x8000, 0x0, 0xA7, -12, -4
	banim_frame_oam 0x0, 0x0, 0xE7, -12, 12
	banim_frame_oam 0x0, 0x0, 0x6, -20, -4
	banim_frame_oam 0x0, 0x0, 0x7, 36, -4
	banim_frame_oam 0x8000, 0x0, 0x0, 36, -20
	banim_frame_end
banim_cyc_ax1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0xC000, 0xD, -12, -44
	banim_frame_oam 0x8000, 0x8000, 0x11, 20, -44
	banim_frame_oam 0x8000, 0x8000, 0x91, 20, -12
	banim_frame_oam 0x8000, 0x4000, 0x53, 36, -28
	banim_frame_end
banim_cyc_ax1_2_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x8000, 0xAD, -12, -4
	banim_frame_oam 0x4000, 0x4000, 0xED, -12, 12
	banim_frame_oam 0x4000, 0x0, 0xF1, 20, 12
	banim_frame_oam 0x0, 0x8000, 0x14, -4, -44
	banim_frame_oam 0x8000, 0x4000, 0x18, 28, -44
	banim_frame_oam 0x4000, 0x4000, 0x94, -4, -12
	banim_frame_oam 0x0, 0x0, 0x98, 28, -12
	banim_frame_oam 0x8000, 0x0, 0xB4, 36, -28
	banim_frame_oam 0x0, 0x0, 0xF4, 36, -12
	banim_frame_oam 0x8000, 0x0, 0x13, -12, -20
	banim_frame_oam 0x8000, 0x0, 0xD3, -12, -36
	banim_frame_oam 0x8000, 0x0, 0xB1, 20, -4
	banim_frame_oam 0x0, 0x0, 0xD2, 28, 4
	banim_frame_end
banim_cyc_ax1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0xB5, -36, -36
	banim_frame_oam 0x8000, 0x0, 0xB7, -20, -36
	banim_frame_oam 0x4000, 0x0, 0xF5, -36, -20
	banim_frame_oam 0x0, 0x0, 0xF7, -20, -20
	banim_frame_oam 0x4000, 0x0, 0xDE, -28, -12
	banim_frame_oam 0x8000, 0xC000, 0x19, -12, -44
	banim_frame_oam 0x8000, 0x4000, 0x1D, 20, -44
	banim_frame_oam 0x8000, 0x4000, 0x9D, 20, -12
	banim_frame_oam 0x0, 0x4000, 0x9E, 28, -12
	banim_frame_oam 0x0, 0x0, 0xFE, 28, 12
	banim_frame_oam 0x8000, 0x4000, 0x1E, 28, -44
	banim_frame_oam 0x8000, 0x0, 0x3F, 36, -36
	banim_frame_oam 0x0, 0x0, 0x7F, 36, -20
	banim_frame_oam 0x0, 0x0, 0xFF, 36, -44
	banim_frame_end
banim_cyc_ax1_2_oam_frame_5_r:
	banim_frame_oam 0x8000, 0x4000, 0x40, 20, -36
	banim_frame_oam 0x8000, 0x0, 0xC0, 20, -4
	banim_frame_oam 0x8000, 0x8000, 0x4, -4, -44
	banim_frame_oam 0x8000, 0x4000, 0x6, 12, -44
	banim_frame_oam 0x8000, 0x8000, 0x84, -4, -12
	banim_frame_oam 0x8000, 0x4000, 0x86, 12, -12
	banim_frame_oam 0x8000, 0x4000, 0x83, -12, -12
	banim_frame_oam 0x4000, 0x0, 0xE1, -28, 12
	banim_frame_oam 0x4000, 0x0, 0x62, 20, 12
	banim_frame_oam 0x0, 0x4000, 0x0, -36, -36
	banim_frame_oam 0x8000, 0x0, 0x2, -20, -36
	banim_frame_oam 0x8000, 0x0, 0x3, -12, -44
	banim_frame_oam 0x0, 0x0, 0x43, -12, -28
	banim_frame_oam 0x0, 0x4000, 0x81, 28, -20
	banim_frame_oam 0x4000, 0x0, 0xC1, 28, -4
	banim_frame_oam 0x8000, 0x0, 0x41, 28, -36
	banim_frame_end
banim_cyc_ax1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0xA4, -4, -4
	banim_frame_oam 0x8000, 0x0, 0xA6, 12, -4
	banim_frame_oam 0x4000, 0x0, 0xE4, -4, 12
	banim_frame_oam 0x0, 0x0, 0xE6, 12, 12
	banim_frame_oam 0x8000, 0x0, 0x83, -12, -12
	banim_frame_oam 0x0, 0x0, 0xC3, -12, 4
	banim_frame_oam 0x4000, 0x8000, 0x27, -36, -36
	banim_frame_oam 0x0, 0x8000, 0x67, -4, -44
	banim_frame_oam 0x4000, 0x4000, 0xE7, -4, -12
	banim_frame_oam 0x0, 0x0, 0xA, -12, -44
	banim_frame_oam 0x4000, 0x0, 0x7, -28, 12
	banim_frame_oam 0x0, 0x0, 0x9, -12, 12
	banim_frame_oam 0x4000, 0x0, 0x62, 20, 12
	banim_frame_oam 0x8000, 0x0, 0xC0, 20, -4
	banim_frame_oam 0x8000, 0x8000, 0xB, 28, -36
	banim_frame_oam 0x4000, 0x0, 0x8B, 28, -4
	banim_frame_end
banim_cyc_ax1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x4000, 0xAB, -36, -36
	banim_frame_oam 0x4000, 0x0, 0xEB, -36, -20
	banim_frame_oam 0x8000, 0x4000, 0x8D, 36, -28
	banim_frame_oam 0x8000, 0x0, 0x4D, -20, -28
	banim_frame_oam 0x8000, 0xC000, 0xE, -12, -44
	banim_frame_oam 0x8000, 0x8000, 0x12, 20, -44
	banim_frame_oam 0x8000, 0x8000, 0x92, 20, -12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_10_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -12, -44
	banim_frame_oam 0x8000, 0x8000, 0x4, 20, -44
	banim_frame_oam 0x8000, 0x8000, 0x84, 20, -12
	banim_frame_oam 0x8000, 0x0, 0x46, 36, -28
	banim_frame_oam 0x0, 0x0, 0x86, 36, -12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_11_r:
	banim_frame_oam 0x8000, 0xC000, 0x7, -12, -44
	banim_frame_oam 0x8000, 0x8000, 0xB, 20, -44
	banim_frame_oam 0x8000, 0x8000, 0x8B, 20, -12
	banim_frame_oam 0x8000, 0x0, 0x46, 36, -28
	banim_frame_oam 0x0, 0x0, 0x86, 36, -12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_12_r:
	banim_frame_oam 0x8000, 0xC000, 0xD, -12, -44
	banim_frame_oam 0x8000, 0x4000, 0x11, 20, -44
	banim_frame_oam 0x8000, 0x4000, 0x91, 20, -12
	banim_frame_oam 0x8000, 0x4000, 0x2C, 28, -36
	banim_frame_oam 0x8000, 0x0, 0x46, 36, -28
	banim_frame_oam 0x0, 0x0, 0x86, 36, -12
	banim_frame_oam 0x8000, 0x0, 0xCC, 28, 4
	banim_frame_end
banim_cyc_ax1_2_oam_frame_13_r:
	banim_frame_oam 0x8000, 0xC000, 0x12, 4, -44
	banim_frame_oam 0x8000, 0x0, 0x46, 36, -28
	banim_frame_oam 0x0, 0x0, 0x86, 36, -12
	banim_frame_oam 0x8000, 0x8000, 0x0, -12, -44
	banim_frame_oam 0x8000, 0x8000, 0x80, -12, -12
	banim_frame_end
banim_cyc_ax1_2_oam_frame_14_r:
	banim_frame_oam 0x8000, 0xC000, 0x1, -16, -44
	banim_frame_oam 0x8000, 0x8000, 0x5, 16, -44
	banim_frame_oam 0x8000, 0x4000, 0x7, 32, -44
	banim_frame_oam 0x8000, 0x8000, 0x85, 16, -12
	banim_frame_oam 0x8000, 0x4000, 0x87, 32, -12
	banim_frame_oam 0x8000, 0x4000, 0x60, -24, -20
	banim_frame_end
banim_cyc_ax1_2_oam_frame_15_r:
	banim_frame_oam 0x8000, 0xC000, 0x8, -16, -44
	banim_frame_oam 0x8000, 0x8000, 0xC, 16, -44
	banim_frame_oam 0x8000, 0x4000, 0xE, 32, -44
	banim_frame_oam 0x8000, 0x8000, 0x8C, 16, -12
	banim_frame_oam 0x8000, 0x4000, 0x8E, 32, -12
	banim_frame_oam 0x8000, 0x0, 0x0, -24, -28
	banim_frame_oam 0x0, 0x0, 0xE0, 40, -12
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cyc_ax1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cyc_ax1_2_oam_frame_9_r:
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_cyc_ax1_2_script:
banim_cyc_ax1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 4, banim_cyc_ax1_2_oam_frame_4_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 5, banim_cyc_ax1_2_oam_frame_5_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 6, banim_cyc_ax1_2_oam_frame_6_r - banim_cyc_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 7, banim_cyc_ax1_2_oam_frame_7_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 17, banim_cyc_ax1_2_oam_frame_9_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 17, banim_cyc_ax1_2_oam_frame_9_r - banim_cyc_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 17, banim_cyc_ax1_2_oam_frame_9_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_cyc_ax1_2_sheet_2, 8, banim_cyc_ax1_2_oam_frame_10_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_2, 9, banim_cyc_ax1_2_oam_frame_11_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_2, 10, banim_cyc_ax1_2_oam_frame_12_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_2, 11, banim_cyc_ax1_2_oam_frame_13_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 4, banim_cyc_ax1_2_oam_frame_4_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 5, banim_cyc_ax1_2_oam_frame_5_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 6, banim_cyc_ax1_2_oam_frame_6_r - banim_cyc_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 7, banim_cyc_ax1_2_oam_frame_7_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 17, banim_cyc_ax1_2_oam_frame_9_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 17, banim_cyc_ax1_2_oam_frame_9_r - banim_cyc_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 17, banim_cyc_ax1_2_oam_frame_9_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 16, banim_cyc_ax1_2_oam_frame_8_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 4, banim_cyc_ax1_2_oam_frame_4_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 5, banim_cyc_ax1_2_oam_frame_5_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 6, banim_cyc_ax1_2_oam_frame_6_r - banim_cyc_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 7, banim_cyc_ax1_2_oam_frame_7_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 2, banim_cyc_ax1_2_sheet_2, 8, banim_cyc_ax1_2_oam_frame_10_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_2, 9, banim_cyc_ax1_2_oam_frame_11_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_2, 10, banim_cyc_ax1_2_oam_frame_12_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_2, 11, banim_cyc_ax1_2_oam_frame_13_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 4, banim_cyc_ax1_2_oam_frame_4_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 5, banim_cyc_ax1_2_oam_frame_5_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 6, banim_cyc_ax1_2_oam_frame_6_r - banim_cyc_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 7, banim_cyc_ax1_2_oam_frame_7_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 12, banim_cyc_ax1_2_oam_frame_14_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 13, banim_cyc_ax1_2_oam_frame_15_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 12, banim_cyc_ax1_2_oam_frame_14_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 12, banim_cyc_ax1_2_oam_frame_14_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_3, 13, banim_cyc_ax1_2_oam_frame_15_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_2_sheet_3, 12, banim_cyc_ax1_2_oam_frame_14_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_2_mode_stand_close:
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_2_mode_stand:
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_2_mode_stand_range:
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_sound_axe_swing_short
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 4, banim_cyc_ax1_2_oam_frame_4_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 5, banim_cyc_ax1_2_oam_frame_5_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_1, 6, banim_cyc_ax1_2_oam_frame_6_r - banim_cyc_ax1_2_oam_r
	banim_code_range_attack
	banim_code_frame 2, banim_cyc_ax1_2_sheet_1, 7, banim_cyc_ax1_2_oam_frame_7_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 3, banim_cyc_ax1_2_sheet_0, 3, banim_cyc_ax1_2_oam_frame_3_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 16, banim_cyc_ax1_2_sheet_0, 2, banim_cyc_ax1_2_oam_frame_2_r - banim_cyc_ax1_2_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_cyc_ax1_2_sheet_0, 1, banim_cyc_ax1_2_oam_frame_1_r - banim_cyc_ax1_2_oam_r
	banim_code_frame 1, banim_cyc_ax1_2_sheet_0, 0, banim_cyc_ax1_2_oam_frame_0_r - banim_cyc_ax1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_cyc_ax1_2_mode_attack_close - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_attack_close_back - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_attack_close_critical - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_attack_close_critical_back - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_attack_range - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_attack_range_critical - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_dodge_close - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_dodge_range - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_stand_close - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_stand - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_stand_range - banim_cyc_ax1_2_script
	.word banim_cyc_ax1_2_mode_attack_miss - banim_cyc_ax1_2_script
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

