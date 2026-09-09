@ vim:ft=armv4
	.global banim_cyc_ax1_script
	.global banim_cyc_ax1_oam_r
	.global banim_cyc_ax1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xAD
	.section .data.oam_l
banim_cyc_ax1_oam_l:
banim_cyc_ax1_oam_frame_0_l:
	banim_frame_oam 0x8000, 0xD000, 0x1, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x5, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x85, -32, -12
	banim_frame_oam 0x8000, 0x5000, 0x46, -40, -28
	banim_frame_oam 0x0, 0x1000, 0xE6, -40, 12
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 12
	banim_frame_oam 0x8000, 0x1000, 0x0, 8, -44
	banim_frame_oam 0x0, 0x1000, 0x40, 8, -28
	banim_frame_oam 0x8000, 0x1000, 0x60, 16, -44
	banim_frame_oam 0x4000, 0x9000, 0x6, -32, -60
	banim_frame_end
banim_cyc_ax1_oam_frame_1_l:
	banim_frame_oam 0x8000, 0x9000, 0xE, -32, -44
	banim_frame_oam 0x8000, 0x9000, 0x8E, -32, -12
	banim_frame_oam 0x8000, 0x5000, 0x90, -40, -12
	banim_frame_oam 0x0, 0x5000, 0xA7, -24, -68
	banim_frame_oam 0x8000, 0x1000, 0xA9, -32, -68
	banim_frame_oam 0x4000, 0x1000, 0xE7, -24, -52
	banim_frame_oam 0x0, 0x1000, 0xE9, -32, -52
	banim_frame_oam 0x8000, 0x1000, 0x68, 16, -44
	banim_frame_oam 0x8000, 0x1000, 0x67, -8, -60
	banim_frame_oam 0x4000, 0x1000, 0x47, 0, -52
	banim_frame_oam 0x8000, 0x1000, 0x50, -40, -28
	banim_frame_oam 0x8000, 0x9000, 0xB, -8, -44
	banim_frame_oam 0x8000, 0x5000, 0xD, -16, -44
	banim_frame_oam 0x8000, 0x9000, 0x8B, -8, -12
	banim_frame_oam 0x8000, 0x5000, 0x8D, -16, -12
	banim_frame_oam 0x8000, 0x1000, 0xA, 8, -44
	banim_frame_oam 0x0, 0x1000, 0x4A, 8, -28
	banim_frame_oam 0x0, 0x1000, 0xEA, 8, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_2_l:
	banim_frame_oam 0x8000, 0xD000, 0x11, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x15, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x95, -32, -12
	banim_frame_oam 0x8000, 0x5000, 0x56, -40, -28
	banim_frame_oam 0x8000, 0x9000, 0x17, 0, -76
	banim_frame_oam 0x8000, 0x5000, 0x19, -8, -76
	banim_frame_oam 0x0, 0x5000, 0x97, 16, -44
	banim_frame_oam 0x8000, 0x1000, 0x99, 8, -44
	banim_frame_oam 0x4000, 0x1000, 0xD8, 8, -28
	banim_frame_oam 0x0, 0x1000, 0xD7, 8, 12
	banim_frame_oam 0x8000, 0x1000, 0x16, -16, -68
	banim_frame_oam 0x0, 0x1000, 0xD6, -16, -52
	banim_frame_end
banim_cyc_ax1_oam_frame_3_l:
	banim_frame_oam 0x8000, 0xD000, 0x1A, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x1E, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x9E, -24, -12
	banim_frame_oam 0x8000, 0x5000, 0x3F, -32, -36
	banim_frame_oam 0x8000, 0x1000, 0xBF, -32, -4
	banim_frame_oam 0x0, 0x1000, 0xFF, -32, 12
	banim_frame_oam 0x4000, 0x1000, 0xF7, 24, -28
	banim_frame_oam 0x0, 0x1000, 0xF9, 16, -28
	banim_frame_oam 0x0, 0x1000, 0x10, 24, -36
	banim_frame_oam 0x0, 0x1000, 0x30, 16, -36
	banim_frame_oam 0x0, 0x5000, 0x69, 16, -20
	banim_frame_end
banim_cyc_ax1_oam_frame_4_l:
	banim_frame_oam 0x8000, 0xD000, 0x1, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x85, -32, -12
	banim_frame_oam 0x8000, 0x1000, 0x20, 8, -36
	banim_frame_oam 0x8000, 0x1000, 0xA0, 8, -4
	banim_frame_oam 0x0, 0x1000, 0xE0, 8, 12
	banim_frame_oam 0x0, 0x1000, 0x60, -8, 20
	banim_frame_oam 0x0, 0x1000, 0x0, 0, 20
	banim_frame_oam 0x0, 0x1000, 0x80, -16, 20
	banim_frame_oam 0x8000, 0x1000, 0x25, -32, -36
	banim_frame_oam 0x0, 0x1000, 0x65, -32, -20
	banim_frame_end
banim_cyc_ax1_oam_frame_5_l:
	banim_frame_oam 0x8000, 0xD000, 0x6, -24, -44
	banim_frame_oam 0x0, 0x1000, 0x5, 8, 12
	banim_frame_oam 0x8000, 0x5000, 0x4A, -32, -28
	banim_frame_oam 0x8000, 0x1000, 0xCA, -32, 4
	banim_frame_oam 0x8000, 0x9000, 0x8B, -48, -12
	banim_frame_end
banim_cyc_ax1_oam_frame_6_l:
	banim_frame_oam 0x8000, 0xD000, 0xD, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x11, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x91, -32, -12
	banim_frame_oam 0x0, 0x5000, 0x12, -48, -44
	banim_frame_oam 0x4000, 0x1000, 0x52, -48, -28
	banim_frame_oam 0x8000, 0x1000, 0x14, -56, -44
	banim_frame_oam 0x0, 0x1000, 0xF2, -40, 12
	banim_frame_oam 0x4000, 0x1000, 0xB, -16, -52
	banim_frame_oam 0x4000, 0x1000, 0x2B, -48, -52
	banim_frame_oam 0x0, 0x1000, 0xA, 8, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_7_l:
	banim_frame_oam 0x8000, 0xD000, 0x15, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x19, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x99, -32, -12
	banim_frame_oam 0x0, 0x5000, 0xB2, -8, -60
	banim_frame_oam 0x8000, 0x1000, 0xB4, -16, -60
	banim_frame_oam 0x0, 0x5000, 0x72, -32, -60
	banim_frame_oam 0x8000, 0x1000, 0x74, -40, -60
	banim_frame_oam 0x0, 0x1000, 0x54, 8, 12
	banim_frame_oam 0x0, 0x1000, 0xF4, -40, -68
	banim_frame_oam 0x0, 0x1000, 0xF3, -40, -76
	banim_frame_oam 0x0, 0x5000, 0x4B, -32, -76
	banim_frame_end
banim_cyc_ax1_oam_frame_8_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x4, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x84, -32, -12
	banim_frame_oam 0x4000, 0x9000, 0x25, -24, -60
	banim_frame_oam 0x0, 0x5000, 0x29, -40, -60
	banim_frame_oam 0x4000, 0x1000, 0x8, -32, -68
	banim_frame_oam 0x0, 0x1000, 0xA, -40, -68
	banim_frame_oam 0x4000, 0x1000, 0x6, -32, -76
	banim_frame_oam 0x0, 0x1000, 0x5, 8, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x4B, -24, -28
	banim_frame_oam 0x8000, 0x5000, 0x4F, -32, -28
	banim_frame_oam 0x4000, 0x9000, 0xCB, -24, 4
	banim_frame_oam 0x8000, 0x1000, 0xCF, -32, 4
	banim_frame_oam 0x0, 0x1000, 0xEA, 8, 12
	banim_frame_oam 0x0, 0x9000, 0x85, -24, -60
	banim_frame_oam 0x8000, 0x5000, 0x89, -32, -60
	banim_frame_oam 0x8000, 0x1000, 0x6A, -40, -68
	banim_frame_oam 0x0, 0x1000, 0xAA, -40, -52
	banim_frame_oam 0x4000, 0x1000, 0x68, -32, -68
	banim_frame_oam 0x4000, 0x1000, 0x65, -32, -76
	banim_frame_oam 0x0, 0x1000, 0x67, -40, -76
	banim_frame_end
banim_cyc_ax1_oam_frame_10_l:
	banim_frame_oam 0x0, 0xD000, 0x0, 8, -44
	banim_frame_oam 0x8000, 0xD000, 0x8, -24, -44
	banim_frame_oam 0x8000, 0x1000, 0xCC, -32, 4
	banim_frame_oam 0x8000, 0x1000, 0xC, -32, -44
	banim_frame_oam 0x4000, 0x9000, 0x4D, 24, -60
	banim_frame_oam 0x8000, 0x1000, 0x51, 16, -60
	banim_frame_oam 0x0, 0x5000, 0xF, 24, -76
	banim_frame_oam 0x8000, 0x1000, 0x11, 16, -76
	banim_frame_oam 0x0, 0x1000, 0x2E, 40, -68
	banim_frame_oam 0x0, 0x9000, 0x8D, -16, -76
	banim_frame_oam 0x8000, 0x1000, 0xD1, -24, -60
	banim_frame_oam 0x0, 0x1000, 0xAC, -32, -52
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x8, -24, -44
	banim_frame_oam 0x8000, 0x1000, 0xCC, -32, 4
	banim_frame_oam 0x8000, 0x1000, 0xC, -32, -44
	banim_frame_oam 0x8000, 0x1000, 0x51, 16, -60
	banim_frame_oam 0x0, 0x5000, 0xF, 24, -76
	banim_frame_oam 0x8000, 0x1000, 0x11, 16, -76
	banim_frame_oam 0x0, 0x1000, 0x2E, 40, -68
	banim_frame_oam 0x0, 0x9000, 0x8D, -16, -76
	banim_frame_oam 0x8000, 0x1000, 0xD1, -24, -60
	banim_frame_oam 0x0, 0x1000, 0xAC, -32, -52
	banim_frame_oam 0x8000, 0xD000, 0x3, 16, -44
	banim_frame_oam 0x8000, 0x5000, 0x7, 8, -44
	banim_frame_oam 0x8000, 0x5000, 0x87, 8, -12
	banim_frame_oam 0x8000, 0x5000, 0x12, 48, -44
	banim_frame_oam 0x8000, 0x5000, 0x92, 48, -12
	banim_frame_oam 0x0, 0x5000, 0x4F, 24, -60
	banim_frame_oam 0x8000, 0x1000, 0xD, 40, -60
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x0, 56, -44
	banim_frame_oam 0x8000, 0x5000, 0x2, 48, -44
	banim_frame_oam 0x8000, 0x9000, 0x80, 56, -12
	banim_frame_oam 0x8000, 0x5000, 0x82, 48, -12
	banim_frame_oam 0x0, 0x5000, 0x4D, 40, -60
	banim_frame_end
banim_cyc_ax1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x53, -8, -28
	banim_frame_oam 0x8000, 0x5000, 0x57, -16, -28
	banim_frame_oam 0x4000, 0x9000, 0xD3, -8, 4
	banim_frame_oam 0x8000, 0x1000, 0xD7, -16, 4
	banim_frame_oam 0x8000, 0x5000, 0x98, -24, -12
	banim_frame_oam 0x0, 0x1000, 0x13, -32, 12
	banim_frame_oam 0x8000, 0x9000, 0x90, 32, -12
	banim_frame_oam 0x8000, 0x5000, 0x92, 24, -12
	banim_frame_oam 0x4000, 0x1000, 0x34, 0, -36
	banim_frame_oam 0x0, 0x1000, 0x36, -8, -36
	banim_frame_oam 0x8000, 0x9000, 0x10, 56, -12
	banim_frame_oam 0x8000, 0x5000, 0x12, 48, -12
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x53, -8, -28
	banim_frame_oam 0x8000, 0x5000, 0x57, -16, -28
	banim_frame_oam 0x4000, 0x9000, 0xD3, -8, 4
	banim_frame_oam 0x8000, 0x1000, 0xD7, -16, 4
	banim_frame_oam 0x8000, 0x5000, 0x98, -24, -12
	banim_frame_oam 0x0, 0x1000, 0x13, -32, 12
	banim_frame_oam 0x8000, 0x9000, 0x90, 32, -12
	banim_frame_oam 0x8000, 0x5000, 0x92, 24, -12
	banim_frame_oam 0x4000, 0x1000, 0x34, 0, -36
	banim_frame_oam 0x0, 0x1000, 0x36, -8, -36
	banim_frame_oam 0x8000, 0x5000, 0x18, 48, -12
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x10, 56, -12
	banim_frame_oam 0x8000, 0x5000, 0x12, 48, -12
	banim_frame_end
banim_cyc_ax1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x5A, -8, -28
	banim_frame_oam 0x8000, 0x5000, 0x5E, -16, -28
	banim_frame_oam 0x4000, 0x9000, 0xDA, -8, 4
	banim_frame_oam 0x8000, 0x1000, 0xDE, -16, 4
	banim_frame_oam 0x8000, 0x5000, 0x9F, -24, -12
	banim_frame_oam 0x8000, 0x5000, 0x99, 24, -12
	banim_frame_oam 0x4000, 0x1000, 0x14, 0, -36
	banim_frame_oam 0x0, 0x1000, 0x16, -8, -36
	banim_frame_oam 0x0, 0x1000, 0x13, -32, 12
	banim_frame_oam 0x4000, 0x9000, 0xB, 40, -12
	banim_frame_oam 0x8000, 0x1000, 0xF, 32, -12
	banim_frame_oam 0x4000, 0x9000, 0x19, 40, 4
	banim_frame_oam 0x0, 0x1000, 0x3D, 32, 12
	banim_frame_end
	banim_frame_oam 0x0, 0x9000, 0x5A, -8, -28
	banim_frame_oam 0x8000, 0x5000, 0x5E, -16, -28
	banim_frame_oam 0x4000, 0x9000, 0xDA, -8, 4
	banim_frame_oam 0x8000, 0x1000, 0xDE, -16, 4
	banim_frame_oam 0x8000, 0x5000, 0x9F, -24, -12
	banim_frame_oam 0x8000, 0x5000, 0x99, 24, -12
	banim_frame_oam 0x4000, 0x1000, 0x14, 0, -36
	banim_frame_oam 0x0, 0x1000, 0x16, -8, -36
	banim_frame_oam 0x0, 0x1000, 0x13, -32, 12
	banim_frame_oam 0x8000, 0x1000, 0xF, 32, -12
	banim_frame_oam 0x0, 0x1000, 0x3D, 32, 12
	banim_frame_oam 0x8000, 0x1000, 0x17, 48, -12
	banim_frame_oam 0x8000, 0x1000, 0x5F, 48, 4
	banim_frame_oam 0x8000, 0x1000, 0xE, 40, -12
	banim_frame_oam 0x8000, 0x1000, 0x1C, 40, 4
	banim_frame_end
	banim_frame_oam 0x0, 0x5000, 0x19, 56, 4
	banim_frame_oam 0x8000, 0x1000, 0x1B, 48, 4
	banim_frame_oam 0x0, 0x5000, 0xB, 56, -12
	banim_frame_oam 0x8000, 0x1000, 0xD, 48, -12
	banim_frame_end
banim_cyc_ax1_oam_frame_13_l:
	banim_frame_oam 0x8000, 0xD000, 0x18, -8, -44
	banim_frame_oam 0x8000, 0x5000, 0x1C, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x9C, -16, -12
	banim_frame_oam 0x8000, 0x5000, 0x9D, -24, -12
	banim_frame_oam 0x0, 0x1000, 0xFE, -32, 12
	banim_frame_oam 0x8000, 0x1000, 0x77, 24, -20
	banim_frame_oam 0x0, 0x1000, 0xF7, 24, 12
	banim_frame_oam 0x0, 0x9000, 0x93, 32, -12
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x18, -8, -44
	banim_frame_oam 0x8000, 0x5000, 0x1C, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x9C, -16, -12
	banim_frame_oam 0x8000, 0x5000, 0x9D, -24, -12
	banim_frame_oam 0x0, 0x1000, 0xFE, -32, 12
	banim_frame_oam 0x8000, 0x1000, 0x77, 24, -20
	banim_frame_oam 0x0, 0x1000, 0xF7, 24, 12
	banim_frame_oam 0x8000, 0x9000, 0x95, 32, -12
	banim_frame_oam 0x8000, 0x5000, 0x13, 48, -12
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x93, 48, -12
	banim_frame_end
banim_cyc_ax1_oam_frame_14_l:
	banim_frame_oam 0x8000, 0xD000, 0x5, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x1, -24, -12
	banim_frame_oam 0x0, 0x1000, 0x4, -32, 12
	banim_frame_oam 0x8000, 0x5000, 0x24, 16, -36
	banim_frame_oam 0x8000, 0x1000, 0xC4, 16, 4
	banim_frame_oam 0x8000, 0x1000, 0x63, 24, -20
	banim_frame_oam 0x0, 0x1000, 0xE3, 24, 12
	banim_frame_oam 0x8000, 0x9000, 0x80, 40, -12
	banim_frame_oam 0x8000, 0x5000, 0x82, 32, -12
	banim_frame_oam 0x8000, 0x1000, 0x0, 56, -12
	banim_frame_oam 0x0, 0x1000, 0x40, 56, 4
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x5, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x1, -24, -12
	banim_frame_oam 0x0, 0x1000, 0x4, -32, 12
	banim_frame_oam 0x8000, 0x5000, 0x24, 16, -36
	banim_frame_oam 0x8000, 0x1000, 0xC4, 16, 4
	banim_frame_oam 0x8000, 0x1000, 0x63, 24, -20
	banim_frame_oam 0x0, 0x1000, 0xE3, 24, 12
	banim_frame_oam 0x8000, 0x5000, 0x82, 32, -12
	banim_frame_oam 0x8000, 0x5000, 0x81, 40, -12
	banim_frame_oam 0x8000, 0x5000, 0x2, 48, -12
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x80, 40, -12
	banim_frame_oam 0x8000, 0x1000, 0x0, 56, -12
	banim_frame_oam 0x0, 0x1000, 0x40, 56, 4
	banim_frame_end
banim_cyc_ax1_oam_frame_15_l:
	banim_frame_oam 0x8000, 0xD000, 0xF, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x33, -24, -36
	banim_frame_oam 0x8000, 0x1000, 0xB3, -24, -4
	banim_frame_oam 0x0, 0x1000, 0xF3, -24, 12
	banim_frame_oam 0x0, 0x1000, 0x13, -32, 12
	banim_frame_oam 0x8000, 0x5000, 0x4E, 16, -28
	banim_frame_oam 0x8000, 0x1000, 0xCE, 16, 4
	banim_frame_oam 0x8000, 0x1000, 0x6D, 24, -20
	banim_frame_oam 0x0, 0x1000, 0xED, 24, 12
	banim_frame_oam 0x0, 0x9000, 0x69, 32, -20
	banim_frame_oam 0x4000, 0x5000, 0xE9, 32, 12
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0xF, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x33, -24, -36
	banim_frame_oam 0x8000, 0x1000, 0xB3, -24, -4
	banim_frame_oam 0x0, 0x1000, 0xF3, -24, 12
	banim_frame_oam 0x0, 0x1000, 0x13, -32, 12
	banim_frame_oam 0x8000, 0x5000, 0x4E, 16, -28
	banim_frame_oam 0x8000, 0x1000, 0xCE, 16, 4
	banim_frame_oam 0x8000, 0x1000, 0x6D, 24, -20
	banim_frame_oam 0x0, 0x1000, 0xED, 24, 12
	banim_frame_oam 0x4000, 0x5000, 0xE9, 32, 12
	banim_frame_oam 0x8000, 0x9000, 0x6B, 32, -20
	banim_frame_oam 0x8000, 0x1000, 0xA, 48, -4
	banim_frame_oam 0x8000, 0x1000, 0x9, 48, -20
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x69, 48, -20
	banim_frame_oam 0x4000, 0x1000, 0xE9, 48, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_16_l:
	banim_frame_oam 0x8000, 0xD000, 0x1A, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x1E, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x9E, -24, -12
	banim_frame_oam 0x0, 0x1000, 0xFF, -32, 12
	banim_frame_oam 0x4000, 0x5000, 0xF6, 16, 12
	banim_frame_oam 0x4000, 0x9000, 0x34, 32, -36
	banim_frame_oam 0x0, 0x5000, 0x38, 16, -36
	banim_frame_oam 0x4000, 0x1000, 0x78, 16, -20
	banim_frame_oam 0x4000, 0x9000, 0x74, 32, -20
	banim_frame_end
	banim_frame_oam 0x8000, 0xD000, 0x1A, -16, -44
	banim_frame_oam 0x8000, 0x5000, 0x1E, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0x9E, -24, -12
	banim_frame_oam 0x0, 0x1000, 0xFF, -32, 12
	banim_frame_oam 0x4000, 0x5000, 0xF6, 16, 12
	banim_frame_oam 0x0, 0x5000, 0x38, 16, -36
	banim_frame_oam 0x4000, 0x1000, 0x78, 16, -20
	banim_frame_oam 0x8000, 0x9000, 0x36, 32, -36
	banim_frame_oam 0x8000, 0x1000, 0xC, 48, -20
	banim_frame_oam 0x8000, 0x1000, 0xB, 48, -36
	banim_frame_end
	banim_frame_oam 0x8000, 0x9000, 0x34, 48, -36
	banim_frame_end
banim_cyc_ax1_oam_frame_17_l:
	banim_frame_oam 0x8000, 0xD000, 0x3, -16, -44
	banim_frame_oam 0x8000, 0x9000, 0x7, -32, -44
	banim_frame_oam 0x8000, 0x9000, 0x87, -32, -12
	banim_frame_oam 0x4000, 0x1000, 0xE0, 24, 12
	banim_frame_oam 0x0, 0x1000, 0xE2, 16, 12
	banim_frame_oam 0x8000, 0x5000, 0x2, 16, -52
	banim_frame_oam 0x8000, 0x9000, 0x0, 24, -68
	banim_frame_oam 0x0, 0x5000, 0x81, 40, -68
	banim_frame_oam 0x4000, 0x1000, 0xC1, 40, -52
	banim_frame_oam 0x0, 0x1000, 0xC0, 40, -44
	banim_frame_end
banim_cyc_ax1_oam_frame_18_l:
	banim_frame_oam 0x8000, 0xD000, 0xA, -24, -44
	banim_frame_oam 0x8000, 0x5000, 0xE, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x8E, -32, -12
	banim_frame_oam 0x8000, 0x5000, 0x4F, -40, -28
	banim_frame_oam 0x0, 0x1000, 0xEF, -40, 12
	banim_frame_oam 0x0, 0x1000, 0xE9, 8, 12
	banim_frame_oam 0x8000, 0x1000, 0x9, 8, -44
	banim_frame_oam 0x0, 0x1000, 0x49, 8, -28
	banim_frame_oam 0x8000, 0x1000, 0x69, 16, -44
	banim_frame_oam 0x0, 0x1000, 0x30, 8, -52
	banim_frame_oam 0x0, 0x5000, 0x11, -16, -68
	banim_frame_oam 0x8000, 0x1000, 0x13, -24, -68
	banim_frame_oam 0x4000, 0x1000, 0x51, -16, -52
	banim_frame_oam 0x0, 0x1000, 0x53, -24, -52
	banim_frame_oam 0x8000, 0x1000, 0xF, -32, -60
	banim_frame_oam 0x0, 0x1000, 0x50, 0, -52
	banim_frame_end
banim_cyc_ax1_oam_frame_19_l:
	banim_frame_oam 0x0, 0xD000, 0x14, -40, -44
	banim_frame_oam 0x4000, 0x9000, 0x70, -32, -60
	banim_frame_end
banim_cyc_ax1_oam_frame_20_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cyc_ax1_oam_frame_21_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cyc_ax1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_cyc_ax1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0xD000, 0x2, -24, -44
	banim_frame_oam 0x8000, 0x9000, 0x6, -40, -44
	banim_frame_oam 0x8000, 0x9000, 0x86, -40, -12
	banim_frame_oam 0x0, 0x1000, 0xE1, 8, 12
	banim_frame_oam 0x0, 0x5000, 0x0, 8, -44
	banim_frame_oam 0x4000, 0x1000, 0x40, 8, -28
	banim_frame_oam 0x4000, 0x1000, 0x60, 0, -52
	banim_frame_oam 0x4000, 0x9000, 0x8, -32, -68
	banim_frame_oam 0x4000, 0x5000, 0x48, -32, -52
	banim_frame_end
banim_cyc_ax1_oam_frame_23_l:
	banim_frame_oam 0x8000, 0xD000, 0xC, -24, -52
	banim_frame_oam 0x8000, 0x5000, 0x10, -32, -52
	banim_frame_oam 0x8000, 0x5000, 0x90, -32, -20
	banim_frame_oam 0x4000, 0x1000, 0x91, -8, 12
	banim_frame_oam 0x4000, 0x1000, 0xB1, -24, 12
	banim_frame_oam 0x0, 0x1000, 0xD1, -32, 12
	banim_frame_oam 0x8000, 0x9000, 0x11, -48, -52
	banim_frame_oam 0x8000, 0x1000, 0xCB, 8, -52
	banim_frame_oam 0x0, 0x5000, 0xC8, 0, -68
	banim_frame_oam 0x8000, 0x1000, 0xCA, -8, -68
	banim_frame_oam 0x0, 0x5000, 0x68, -24, -76
	banim_frame_oam 0x8000, 0x1000, 0x6A, -32, -76
	banim_frame_oam 0x4000, 0x1000, 0xA8, -24, -60
	banim_frame_oam 0x0, 0x1000, 0xAA, -32, -60
	banim_frame_oam 0x8000, 0x1000, 0x6B, -40, -76
	banim_frame_oam 0x0, 0x1000, 0xAB, 8, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_24_l:
	banim_frame_oam 0x8000, 0xD000, 0x14, -24, -52
	banim_frame_oam 0x8000, 0x5000, 0x18, -32, -52
	banim_frame_oam 0x8000, 0x5000, 0x98, -32, -20
	banim_frame_oam 0x0, 0x5000, 0x19, -48, -52
	banim_frame_oam 0x4000, 0x1000, 0x59, -48, -36
	banim_frame_oam 0x4000, 0x9000, 0xB9, -16, -76
	banim_frame_oam 0x0, 0x5000, 0xBD, -32, -76
	banim_frame_oam 0x8000, 0x1000, 0xBF, -40, -76
	banim_frame_oam 0x4000, 0x5000, 0xF9, -16, -60
	banim_frame_oam 0x4000, 0x1000, 0xFD, -32, -60
	banim_frame_oam 0x0, 0x1000, 0xFF, -40, -60
	banim_frame_oam 0x8000, 0x1000, 0x13, 8, -52
	banim_frame_oam 0x4000, 0x1000, 0x91, -8, 12
	banim_frame_oam 0x4000, 0x1000, 0xB1, -24, 12
	banim_frame_oam 0x0, 0x1000, 0xD1, -32, 12
	banim_frame_oam 0x0, 0x1000, 0xAB, 8, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_26_l:
	banim_frame_oam 0x0, 0xD000, 0x0, -40, -44
	banim_frame_oam 0x0, 0x5000, 0x8, -16, -60
	banim_frame_oam 0x8000, 0x1000, 0xA, -24, -60
	banim_frame_end
banim_cyc_ax1_oam_frame_27_l:
	banim_frame_oam 0x8000, 0xD000, 0xB, -16, -44
	banim_frame_oam 0x8000, 0x9000, 0xF, -32, -44
	banim_frame_oam 0x8000, 0x5000, 0x11, -40, -44
	banim_frame_oam 0x8000, 0x9000, 0x8F, -32, -12
	banim_frame_oam 0x8000, 0x5000, 0x91, -40, -12
	banim_frame_oam 0x0, 0x1000, 0x92, -48, -12
	banim_frame_oam 0x0, 0x5000, 0x48, -16, -60
	banim_frame_oam 0x8000, 0x1000, 0x4A, -24, -60
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_cyc_ax1_oam_r:
banim_cyc_ax1_oam_frame_0_r:
	banim_frame_oam 0x8000, 0xC000, 0x1, -8, -44
	banim_frame_oam 0x8000, 0x4000, 0x5, 24, -44
	banim_frame_oam 0x8000, 0x4000, 0x85, 24, -12
	banim_frame_oam 0x8000, 0x4000, 0x46, 32, -28
	banim_frame_oam 0x0, 0x0, 0xE6, 32, 12
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 12
	banim_frame_oam 0x8000, 0x0, 0x0, -16, -44
	banim_frame_oam 0x0, 0x0, 0x40, -16, -28
	banim_frame_oam 0x8000, 0x0, 0x60, -24, -44
	banim_frame_oam 0x4000, 0x8000, 0x6, 0, -60
	banim_frame_end
banim_cyc_ax1_oam_frame_1_r:
	banim_frame_oam 0x8000, 0x8000, 0xE, 16, -44
	banim_frame_oam 0x8000, 0x8000, 0x8E, 16, -12
	banim_frame_oam 0x8000, 0x4000, 0x90, 32, -12
	banim_frame_oam 0x0, 0x4000, 0xA7, 8, -68
	banim_frame_oam 0x8000, 0x0, 0xA9, 24, -68
	banim_frame_oam 0x4000, 0x0, 0xE7, 8, -52
	banim_frame_oam 0x0, 0x0, 0xE9, 24, -52
	banim_frame_oam 0x8000, 0x0, 0x68, -24, -44
	banim_frame_oam 0x8000, 0x0, 0x67, 0, -60
	banim_frame_oam 0x4000, 0x0, 0x47, -16, -52
	banim_frame_oam 0x8000, 0x0, 0x50, 32, -28
	banim_frame_oam 0x8000, 0x8000, 0xB, -8, -44
	banim_frame_oam 0x8000, 0x4000, 0xD, 8, -44
	banim_frame_oam 0x8000, 0x8000, 0x8B, -8, -12
	banim_frame_oam 0x8000, 0x4000, 0x8D, 8, -12
	banim_frame_oam 0x8000, 0x0, 0xA, -16, -44
	banim_frame_oam 0x0, 0x0, 0x4A, -16, -28
	banim_frame_oam 0x0, 0x0, 0xEA, -16, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_2_r:
	banim_frame_oam 0x8000, 0xC000, 0x11, -8, -44
	banim_frame_oam 0x8000, 0x4000, 0x15, 24, -44
	banim_frame_oam 0x8000, 0x4000, 0x95, 24, -12
	banim_frame_oam 0x8000, 0x4000, 0x56, 32, -28
	banim_frame_oam 0x8000, 0x8000, 0x17, -16, -76
	banim_frame_oam 0x8000, 0x4000, 0x19, 0, -76
	banim_frame_oam 0x0, 0x4000, 0x97, -32, -44
	banim_frame_oam 0x8000, 0x0, 0x99, -16, -44
	banim_frame_oam 0x4000, 0x0, 0xD8, -24, -28
	banim_frame_oam 0x0, 0x0, 0xD7, -16, 12
	banim_frame_oam 0x8000, 0x0, 0x16, 8, -68
	banim_frame_oam 0x0, 0x0, 0xD6, 8, -52
	banim_frame_end
banim_cyc_ax1_oam_frame_3_r:
	banim_frame_oam 0x8000, 0xC000, 0x1A, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x1E, 16, -44
	banim_frame_oam 0x8000, 0x4000, 0x9E, 16, -12
	banim_frame_oam 0x8000, 0x4000, 0x3F, 24, -36
	banim_frame_oam 0x8000, 0x0, 0xBF, 24, -4
	banim_frame_oam 0x0, 0x0, 0xFF, 24, 12
	banim_frame_oam 0x4000, 0x0, 0xF7, -40, -28
	banim_frame_oam 0x0, 0x0, 0xF9, -24, -28
	banim_frame_oam 0x0, 0x0, 0x10, -32, -36
	banim_frame_oam 0x0, 0x0, 0x30, -24, -36
	banim_frame_oam 0x0, 0x4000, 0x69, -32, -20
	banim_frame_end
banim_cyc_ax1_oam_frame_4_r:
	banim_frame_oam 0x8000, 0xC000, 0x1, -8, -44
	banim_frame_oam 0x8000, 0x4000, 0x85, 24, -12
	banim_frame_oam 0x8000, 0x0, 0x20, -16, -36
	banim_frame_oam 0x8000, 0x0, 0xA0, -16, -4
	banim_frame_oam 0x0, 0x0, 0xE0, -16, 12
	banim_frame_oam 0x0, 0x0, 0x60, 0, 20
	banim_frame_oam 0x0, 0x0, 0x0, -8, 20
	banim_frame_oam 0x0, 0x0, 0x80, 8, 20
	banim_frame_oam 0x8000, 0x0, 0x25, 24, -36
	banim_frame_oam 0x0, 0x0, 0x65, 24, -20
	banim_frame_end
banim_cyc_ax1_oam_frame_5_r:
	banim_frame_oam 0x8000, 0xC000, 0x6, -8, -44
	banim_frame_oam 0x0, 0x0, 0x5, -16, 12
	banim_frame_oam 0x8000, 0x4000, 0x4A, 24, -28
	banim_frame_oam 0x8000, 0x0, 0xCA, 24, 4
	banim_frame_oam 0x8000, 0x8000, 0x8B, 32, -12
	banim_frame_end
banim_cyc_ax1_oam_frame_6_r:
	banim_frame_oam 0x8000, 0xC000, 0xD, -8, -44
	banim_frame_oam 0x8000, 0x4000, 0x11, 24, -44
	banim_frame_oam 0x8000, 0x4000, 0x91, 24, -12
	banim_frame_oam 0x0, 0x4000, 0x12, 32, -44
	banim_frame_oam 0x4000, 0x0, 0x52, 32, -28
	banim_frame_oam 0x8000, 0x0, 0x14, 48, -44
	banim_frame_oam 0x0, 0x0, 0xF2, 32, 12
	banim_frame_oam 0x4000, 0x0, 0xB, 0, -52
	banim_frame_oam 0x4000, 0x0, 0x2B, 32, -52
	banim_frame_oam 0x0, 0x0, 0xA, -16, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_7_r:
	banim_frame_oam 0x8000, 0xC000, 0x15, -8, -44
	banim_frame_oam 0x8000, 0x4000, 0x19, 24, -44
	banim_frame_oam 0x8000, 0x4000, 0x99, 24, -12
	banim_frame_oam 0x0, 0x4000, 0xB2, -8, -60
	banim_frame_oam 0x8000, 0x0, 0xB4, 8, -60
	banim_frame_oam 0x0, 0x4000, 0x72, 16, -60
	banim_frame_oam 0x8000, 0x0, 0x74, 32, -60
	banim_frame_oam 0x0, 0x0, 0x54, -16, 12
	banim_frame_oam 0x0, 0x0, 0xF4, 32, -68
	banim_frame_oam 0x0, 0x0, 0xF3, 32, -76
	banim_frame_oam 0x0, 0x4000, 0x4B, 16, -76
	banim_frame_end
banim_cyc_ax1_oam_frame_8_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -8, -44
	banim_frame_oam 0x8000, 0x4000, 0x4, 24, -44
	banim_frame_oam 0x8000, 0x4000, 0x84, 24, -12
	banim_frame_oam 0x4000, 0x8000, 0x25, -8, -60
	banim_frame_oam 0x0, 0x4000, 0x29, 24, -60
	banim_frame_oam 0x4000, 0x0, 0x8, 16, -68
	banim_frame_oam 0x0, 0x0, 0xA, 32, -68
	banim_frame_oam 0x4000, 0x0, 0x6, 16, -76
	banim_frame_oam 0x0, 0x0, 0x5, -16, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x4B, -8, -28
	banim_frame_oam 0x8000, 0x4000, 0x4F, 24, -28
	banim_frame_oam 0x4000, 0x8000, 0xCB, -8, 4
	banim_frame_oam 0x8000, 0x0, 0xCF, 24, 4
	banim_frame_oam 0x0, 0x0, 0xEA, -16, 12
	banim_frame_oam 0x0, 0x8000, 0x85, -8, -60
	banim_frame_oam 0x8000, 0x4000, 0x89, 24, -60
	banim_frame_oam 0x8000, 0x0, 0x6A, 32, -68
	banim_frame_oam 0x0, 0x0, 0xAA, 32, -52
	banim_frame_oam 0x4000, 0x0, 0x68, 16, -68
	banim_frame_oam 0x4000, 0x0, 0x65, 16, -76
	banim_frame_oam 0x0, 0x0, 0x67, 32, -76
	banim_frame_end
banim_cyc_ax1_oam_frame_10_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -72, -44
	banim_frame_oam 0x8000, 0xC000, 0x8, -8, -44
	banim_frame_oam 0x8000, 0x0, 0xCC, 24, 4
	banim_frame_oam 0x8000, 0x0, 0xC, 24, -44
	banim_frame_oam 0x4000, 0x8000, 0x4D, -56, -60
	banim_frame_oam 0x8000, 0x0, 0x51, -24, -60
	banim_frame_oam 0x0, 0x4000, 0xF, -40, -76
	banim_frame_oam 0x8000, 0x0, 0x11, -24, -76
	banim_frame_oam 0x0, 0x0, 0x2E, -48, -68
	banim_frame_oam 0x0, 0x8000, 0x8D, -16, -76
	banim_frame_oam 0x8000, 0x0, 0xD1, 16, -60
	banim_frame_oam 0x0, 0x0, 0xAC, 24, -52
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x8, -8, -44
	banim_frame_oam 0x8000, 0x0, 0xCC, 24, 4
	banim_frame_oam 0x8000, 0x0, 0xC, 24, -44
	banim_frame_oam 0x8000, 0x0, 0x51, -24, -60
	banim_frame_oam 0x0, 0x4000, 0xF, -40, -76
	banim_frame_oam 0x8000, 0x0, 0x11, -24, -76
	banim_frame_oam 0x0, 0x0, 0x2E, -48, -68
	banim_frame_oam 0x0, 0x8000, 0x8D, -16, -76
	banim_frame_oam 0x8000, 0x0, 0xD1, 16, -60
	banim_frame_oam 0x0, 0x0, 0xAC, 24, -52
	banim_frame_oam 0x8000, 0xC000, 0x3, -48, -44
	banim_frame_oam 0x8000, 0x4000, 0x7, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x87, -16, -12
	banim_frame_oam 0x8000, 0x4000, 0x12, -56, -44
	banim_frame_oam 0x8000, 0x4000, 0x92, -56, -12
	banim_frame_oam 0x0, 0x4000, 0x4F, -40, -60
	banim_frame_oam 0x8000, 0x0, 0xD, -48, -60
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x0, -72, -44
	banim_frame_oam 0x8000, 0x4000, 0x2, -56, -44
	banim_frame_oam 0x8000, 0x8000, 0x80, -72, -12
	banim_frame_oam 0x8000, 0x4000, 0x82, -56, -12
	banim_frame_oam 0x0, 0x4000, 0x4D, -56, -60
	banim_frame_end
banim_cyc_ax1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x53, -24, -28
	banim_frame_oam 0x8000, 0x4000, 0x57, 8, -28
	banim_frame_oam 0x4000, 0x8000, 0xD3, -24, 4
	banim_frame_oam 0x8000, 0x0, 0xD7, 8, 4
	banim_frame_oam 0x8000, 0x4000, 0x98, 16, -12
	banim_frame_oam 0x0, 0x0, 0x13, 24, 12
	banim_frame_oam 0x8000, 0x8000, 0x90, -48, -12
	banim_frame_oam 0x8000, 0x4000, 0x92, -32, -12
	banim_frame_oam 0x4000, 0x0, 0x34, -16, -36
	banim_frame_oam 0x0, 0x0, 0x36, 0, -36
	banim_frame_oam 0x8000, 0x8000, 0x10, -72, -12
	banim_frame_oam 0x8000, 0x4000, 0x12, -56, -12
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x53, -24, -28
	banim_frame_oam 0x8000, 0x4000, 0x57, 8, -28
	banim_frame_oam 0x4000, 0x8000, 0xD3, -24, 4
	banim_frame_oam 0x8000, 0x0, 0xD7, 8, 4
	banim_frame_oam 0x8000, 0x4000, 0x98, 16, -12
	banim_frame_oam 0x0, 0x0, 0x13, 24, 12
	banim_frame_oam 0x8000, 0x8000, 0x90, -48, -12
	banim_frame_oam 0x8000, 0x4000, 0x92, -32, -12
	banim_frame_oam 0x4000, 0x0, 0x34, -16, -36
	banim_frame_oam 0x0, 0x0, 0x36, 0, -36
	banim_frame_oam 0x8000, 0x4000, 0x18, -56, -12
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x10, -72, -12
	banim_frame_oam 0x8000, 0x4000, 0x12, -56, -12
	banim_frame_end
banim_cyc_ax1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x5A, -24, -28
	banim_frame_oam 0x8000, 0x4000, 0x5E, 8, -28
	banim_frame_oam 0x4000, 0x8000, 0xDA, -24, 4
	banim_frame_oam 0x8000, 0x0, 0xDE, 8, 4
	banim_frame_oam 0x8000, 0x4000, 0x9F, 16, -12
	banim_frame_oam 0x8000, 0x4000, 0x99, -32, -12
	banim_frame_oam 0x4000, 0x0, 0x14, -16, -36
	banim_frame_oam 0x0, 0x0, 0x16, 0, -36
	banim_frame_oam 0x0, 0x0, 0x13, 24, 12
	banim_frame_oam 0x4000, 0x8000, 0xB, -72, -12
	banim_frame_oam 0x8000, 0x0, 0xF, -40, -12
	banim_frame_oam 0x4000, 0x8000, 0x19, -72, 4
	banim_frame_oam 0x0, 0x0, 0x3D, -40, 12
	banim_frame_end
	banim_frame_oam 0x0, 0x8000, 0x5A, -24, -28
	banim_frame_oam 0x8000, 0x4000, 0x5E, 8, -28
	banim_frame_oam 0x4000, 0x8000, 0xDA, -24, 4
	banim_frame_oam 0x8000, 0x0, 0xDE, 8, 4
	banim_frame_oam 0x8000, 0x4000, 0x9F, 16, -12
	banim_frame_oam 0x8000, 0x4000, 0x99, -32, -12
	banim_frame_oam 0x4000, 0x0, 0x14, -16, -36
	banim_frame_oam 0x0, 0x0, 0x16, 0, -36
	banim_frame_oam 0x0, 0x0, 0x13, 24, 12
	banim_frame_oam 0x8000, 0x0, 0xF, -40, -12
	banim_frame_oam 0x0, 0x0, 0x3D, -40, 12
	banim_frame_oam 0x8000, 0x0, 0x17, -56, -12
	banim_frame_oam 0x8000, 0x0, 0x5F, -56, 4
	banim_frame_oam 0x8000, 0x0, 0xE, -48, -12
	banim_frame_oam 0x8000, 0x0, 0x1C, -48, 4
	banim_frame_end
	banim_frame_oam 0x0, 0x4000, 0x19, -72, 4
	banim_frame_oam 0x8000, 0x0, 0x1B, -56, 4
	banim_frame_oam 0x0, 0x4000, 0xB, -72, -12
	banim_frame_oam 0x8000, 0x0, 0xD, -56, -12
	banim_frame_end
banim_cyc_ax1_oam_frame_13_r:
	banim_frame_oam 0x8000, 0xC000, 0x18, -24, -44
	banim_frame_oam 0x8000, 0x4000, 0x1C, 8, -44
	banim_frame_oam 0x8000, 0x4000, 0x9C, 8, -12
	banim_frame_oam 0x8000, 0x4000, 0x9D, 16, -12
	banim_frame_oam 0x0, 0x0, 0xFE, 24, 12
	banim_frame_oam 0x8000, 0x0, 0x77, -32, -20
	banim_frame_oam 0x0, 0x0, 0xF7, -32, 12
	banim_frame_oam 0x0, 0x8000, 0x93, -64, -12
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x18, -24, -44
	banim_frame_oam 0x8000, 0x4000, 0x1C, 8, -44
	banim_frame_oam 0x8000, 0x4000, 0x9C, 8, -12
	banim_frame_oam 0x8000, 0x4000, 0x9D, 16, -12
	banim_frame_oam 0x0, 0x0, 0xFE, 24, 12
	banim_frame_oam 0x8000, 0x0, 0x77, -32, -20
	banim_frame_oam 0x0, 0x0, 0xF7, -32, 12
	banim_frame_oam 0x8000, 0x8000, 0x95, -48, -12
	banim_frame_oam 0x8000, 0x4000, 0x13, -56, -12
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x93, -64, -12
	banim_frame_end
banim_cyc_ax1_oam_frame_14_r:
	banim_frame_oam 0x8000, 0xC000, 0x5, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x1, 16, -12
	banim_frame_oam 0x0, 0x0, 0x4, 24, 12
	banim_frame_oam 0x8000, 0x4000, 0x24, -24, -36
	banim_frame_oam 0x8000, 0x0, 0xC4, -24, 4
	banim_frame_oam 0x8000, 0x0, 0x63, -32, -20
	banim_frame_oam 0x0, 0x0, 0xE3, -32, 12
	banim_frame_oam 0x8000, 0x8000, 0x80, -56, -12
	banim_frame_oam 0x8000, 0x4000, 0x82, -40, -12
	banim_frame_oam 0x8000, 0x0, 0x0, -64, -12
	banim_frame_oam 0x0, 0x0, 0x40, -64, 4
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x5, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x1, 16, -12
	banim_frame_oam 0x0, 0x0, 0x4, 24, 12
	banim_frame_oam 0x8000, 0x4000, 0x24, -24, -36
	banim_frame_oam 0x8000, 0x0, 0xC4, -24, 4
	banim_frame_oam 0x8000, 0x0, 0x63, -32, -20
	banim_frame_oam 0x0, 0x0, 0xE3, -32, 12
	banim_frame_oam 0x8000, 0x4000, 0x82, -40, -12
	banim_frame_oam 0x8000, 0x4000, 0x81, -48, -12
	banim_frame_oam 0x8000, 0x4000, 0x2, -56, -12
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x80, -56, -12
	banim_frame_oam 0x8000, 0x0, 0x0, -64, -12
	banim_frame_oam 0x0, 0x0, 0x40, -64, 4
	banim_frame_end
banim_cyc_ax1_oam_frame_15_r:
	banim_frame_oam 0x8000, 0xC000, 0xF, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x33, 16, -36
	banim_frame_oam 0x8000, 0x0, 0xB3, 16, -4
	banim_frame_oam 0x0, 0x0, 0xF3, 16, 12
	banim_frame_oam 0x0, 0x0, 0x13, 24, 12
	banim_frame_oam 0x8000, 0x4000, 0x4E, -24, -28
	banim_frame_oam 0x8000, 0x0, 0xCE, -24, 4
	banim_frame_oam 0x8000, 0x0, 0x6D, -32, -20
	banim_frame_oam 0x0, 0x0, 0xED, -32, 12
	banim_frame_oam 0x0, 0x8000, 0x69, -64, -20
	banim_frame_oam 0x4000, 0x4000, 0xE9, -64, 12
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0xF, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x33, 16, -36
	banim_frame_oam 0x8000, 0x0, 0xB3, 16, -4
	banim_frame_oam 0x0, 0x0, 0xF3, 16, 12
	banim_frame_oam 0x0, 0x0, 0x13, 24, 12
	banim_frame_oam 0x8000, 0x4000, 0x4E, -24, -28
	banim_frame_oam 0x8000, 0x0, 0xCE, -24, 4
	banim_frame_oam 0x8000, 0x0, 0x6D, -32, -20
	banim_frame_oam 0x0, 0x0, 0xED, -32, 12
	banim_frame_oam 0x4000, 0x4000, 0xE9, -64, 12
	banim_frame_oam 0x8000, 0x8000, 0x6B, -48, -20
	banim_frame_oam 0x8000, 0x0, 0xA, -56, -4
	banim_frame_oam 0x8000, 0x0, 0x9, -56, -20
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x69, -64, -20
	banim_frame_oam 0x4000, 0x0, 0xE9, -64, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_16_r:
	banim_frame_oam 0x8000, 0xC000, 0x1A, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x1E, 16, -44
	banim_frame_oam 0x8000, 0x4000, 0x9E, 16, -12
	banim_frame_oam 0x0, 0x0, 0xFF, 24, 12
	banim_frame_oam 0x4000, 0x4000, 0xF6, -48, 12
	banim_frame_oam 0x4000, 0x8000, 0x34, -64, -36
	banim_frame_oam 0x0, 0x4000, 0x38, -32, -36
	banim_frame_oam 0x4000, 0x0, 0x78, -32, -20
	banim_frame_oam 0x4000, 0x8000, 0x74, -64, -20
	banim_frame_end
	banim_frame_oam 0x8000, 0xC000, 0x1A, -16, -44
	banim_frame_oam 0x8000, 0x4000, 0x1E, 16, -44
	banim_frame_oam 0x8000, 0x4000, 0x9E, 16, -12
	banim_frame_oam 0x0, 0x0, 0xFF, 24, 12
	banim_frame_oam 0x4000, 0x4000, 0xF6, -48, 12
	banim_frame_oam 0x0, 0x4000, 0x38, -32, -36
	banim_frame_oam 0x4000, 0x0, 0x78, -32, -20
	banim_frame_oam 0x8000, 0x8000, 0x36, -48, -36
	banim_frame_oam 0x8000, 0x0, 0xC, -56, -20
	banim_frame_oam 0x8000, 0x0, 0xB, -56, -36
	banim_frame_end
	banim_frame_oam 0x8000, 0x8000, 0x34, -64, -36
	banim_frame_end
banim_cyc_ax1_oam_frame_17_r:
	banim_frame_oam 0x8000, 0xC000, 0x3, -16, -44
	banim_frame_oam 0x8000, 0x8000, 0x7, 16, -44
	banim_frame_oam 0x8000, 0x8000, 0x87, 16, -12
	banim_frame_oam 0x4000, 0x0, 0xE0, -40, 12
	banim_frame_oam 0x0, 0x0, 0xE2, -24, 12
	banim_frame_oam 0x8000, 0x4000, 0x2, -24, -52
	banim_frame_oam 0x8000, 0x8000, 0x0, -40, -68
	banim_frame_oam 0x0, 0x4000, 0x81, -56, -68
	banim_frame_oam 0x4000, 0x0, 0xC1, -56, -52
	banim_frame_oam 0x0, 0x0, 0xC0, -48, -44
	banim_frame_end
banim_cyc_ax1_oam_frame_18_r:
	banim_frame_oam 0x8000, 0xC000, 0xA, -8, -44
	banim_frame_oam 0x8000, 0x4000, 0xE, 24, -44
	banim_frame_oam 0x8000, 0x4000, 0x8E, 24, -12
	banim_frame_oam 0x8000, 0x4000, 0x4F, 32, -28
	banim_frame_oam 0x0, 0x0, 0xEF, 32, 12
	banim_frame_oam 0x0, 0x0, 0xE9, -16, 12
	banim_frame_oam 0x8000, 0x0, 0x9, -16, -44
	banim_frame_oam 0x0, 0x0, 0x49, -16, -28
	banim_frame_oam 0x8000, 0x0, 0x69, -24, -44
	banim_frame_oam 0x0, 0x0, 0x30, -16, -52
	banim_frame_oam 0x0, 0x4000, 0x11, 0, -68
	banim_frame_oam 0x8000, 0x0, 0x13, 16, -68
	banim_frame_oam 0x4000, 0x0, 0x51, 0, -52
	banim_frame_oam 0x0, 0x0, 0x53, 16, -52
	banim_frame_oam 0x8000, 0x0, 0xF, 24, -60
	banim_frame_oam 0x0, 0x0, 0x50, -8, -52
	banim_frame_end
banim_cyc_ax1_oam_frame_19_r:
	banim_frame_oam 0x0, 0xC000, 0x14, -24, -44
	banim_frame_oam 0x4000, 0x8000, 0x70, 0, -60
	banim_frame_end
banim_cyc_ax1_oam_frame_20_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cyc_ax1_oam_frame_21_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cyc_ax1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_cyc_ax1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0xC000, 0x2, -8, -44
	banim_frame_oam 0x8000, 0x8000, 0x6, 24, -44
	banim_frame_oam 0x8000, 0x8000, 0x86, 24, -12
	banim_frame_oam 0x0, 0x0, 0xE1, -16, 12
	banim_frame_oam 0x0, 0x4000, 0x0, -24, -44
	banim_frame_oam 0x4000, 0x0, 0x40, -24, -28
	banim_frame_oam 0x4000, 0x0, 0x60, -16, -52
	banim_frame_oam 0x4000, 0x8000, 0x8, 0, -68
	banim_frame_oam 0x4000, 0x4000, 0x48, 0, -52
	banim_frame_end
banim_cyc_ax1_oam_frame_23_r:
	banim_frame_oam 0x8000, 0xC000, 0xC, -8, -52
	banim_frame_oam 0x8000, 0x4000, 0x10, 24, -52
	banim_frame_oam 0x8000, 0x4000, 0x90, 24, -20
	banim_frame_oam 0x4000, 0x0, 0x91, -8, 12
	banim_frame_oam 0x4000, 0x0, 0xB1, 8, 12
	banim_frame_oam 0x0, 0x0, 0xD1, 24, 12
	banim_frame_oam 0x8000, 0x8000, 0x11, 32, -52
	banim_frame_oam 0x8000, 0x0, 0xCB, -16, -52
	banim_frame_oam 0x0, 0x4000, 0xC8, -16, -68
	banim_frame_oam 0x8000, 0x0, 0xCA, 0, -68
	banim_frame_oam 0x0, 0x4000, 0x68, 8, -76
	banim_frame_oam 0x8000, 0x0, 0x6A, 24, -76
	banim_frame_oam 0x4000, 0x0, 0xA8, 8, -60
	banim_frame_oam 0x0, 0x0, 0xAA, 24, -60
	banim_frame_oam 0x8000, 0x0, 0x6B, 32, -76
	banim_frame_oam 0x0, 0x0, 0xAB, -16, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_24_r:
	banim_frame_oam 0x8000, 0xC000, 0x14, -8, -52
	banim_frame_oam 0x8000, 0x4000, 0x18, 24, -52
	banim_frame_oam 0x8000, 0x4000, 0x98, 24, -20
	banim_frame_oam 0x0, 0x4000, 0x19, 32, -52
	banim_frame_oam 0x4000, 0x0, 0x59, 32, -36
	banim_frame_oam 0x4000, 0x8000, 0xB9, -16, -76
	banim_frame_oam 0x0, 0x4000, 0xBD, 16, -76
	banim_frame_oam 0x8000, 0x0, 0xBF, 32, -76
	banim_frame_oam 0x4000, 0x4000, 0xF9, -16, -60
	banim_frame_oam 0x4000, 0x0, 0xFD, 16, -60
	banim_frame_oam 0x0, 0x0, 0xFF, 32, -60
	banim_frame_oam 0x8000, 0x0, 0x13, -16, -52
	banim_frame_oam 0x4000, 0x0, 0x91, -8, 12
	banim_frame_oam 0x4000, 0x0, 0xB1, 8, 12
	banim_frame_oam 0x0, 0x0, 0xD1, 24, 12
	banim_frame_oam 0x0, 0x0, 0xAB, -16, 12
	banim_frame_end
banim_cyc_ax1_oam_frame_26_r:
	banim_frame_oam 0x0, 0xC000, 0x0, -24, -44
	banim_frame_oam 0x0, 0x4000, 0x8, 0, -60
	banim_frame_oam 0x8000, 0x0, 0xA, 16, -60
	banim_frame_end
banim_cyc_ax1_oam_frame_27_r:
	banim_frame_oam 0x8000, 0xC000, 0xB, -16, -44
	banim_frame_oam 0x8000, 0x8000, 0xF, 16, -44
	banim_frame_oam 0x8000, 0x4000, 0x11, 32, -44
	banim_frame_oam 0x8000, 0x8000, 0x8F, 16, -12
	banim_frame_oam 0x8000, 0x4000, 0x91, 32, -12
	banim_frame_oam 0x0, 0x0, 0x92, 40, -12
	banim_frame_oam 0x0, 0x4000, 0x48, 0, -60
	banim_frame_oam 0x8000, 0x0, 0x4A, 16, -60
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_cyc_ax1_script:
banim_cyc_ax1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 1, banim_cyc_ax1_oam_frame_1_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 2, banim_cyc_ax1_oam_frame_2_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 3, banim_cyc_ax1_oam_frame_3_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 4, banim_cyc_ax1_oam_frame_4_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 5, banim_cyc_ax1_oam_frame_5_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_1, 6, banim_cyc_ax1_oam_frame_6_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_1, 7, banim_cyc_ax1_oam_frame_7_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_2, 8, banim_cyc_ax1_oam_frame_8_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 9, banim_cyc_ax1_oam_frame_9_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_3, 10, banim_cyc_ax1_oam_frame_10_r - banim_cyc_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_3, 19, banim_cyc_ax1_oam_frame_13_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_4, 22, banim_cyc_ax1_oam_frame_14_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_4, 25, banim_cyc_ax1_oam_frame_15_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_4, 28, banim_cyc_ax1_oam_frame_16_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 31, banim_cyc_ax1_oam_frame_17_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 32, banim_cyc_ax1_oam_frame_18_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 33, banim_cyc_ax1_oam_frame_19_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_hit_normal
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 38, banim_cyc_ax1_oam_frame_22_r - banim_cyc_ax1_oam_r
	banim_code_sound_mauthedoog_roar
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 40, banim_cyc_ax1_oam_frame_24_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 40, banim_cyc_ax1_oam_frame_24_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 40, banim_cyc_ax1_oam_frame_24_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 40, banim_cyc_ax1_oam_frame_24_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_6, 39, banim_cyc_ax1_oam_frame_23_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 2, banim_cyc_ax1_oam_frame_2_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 3, banim_cyc_ax1_oam_frame_3_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 4, banim_cyc_ax1_oam_frame_4_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 5, banim_cyc_ax1_oam_frame_5_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_1, 6, banim_cyc_ax1_oam_frame_6_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_1, 7, banim_cyc_ax1_oam_frame_7_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_2, 8, banim_cyc_ax1_oam_frame_8_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 9, banim_cyc_ax1_oam_frame_9_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_3, 10, banim_cyc_ax1_oam_frame_10_r - banim_cyc_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_3, 19, banim_cyc_ax1_oam_frame_13_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_4, 22, banim_cyc_ax1_oam_frame_14_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_4, 25, banim_cyc_ax1_oam_frame_15_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_4, 28, banim_cyc_ax1_oam_frame_16_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 31, banim_cyc_ax1_oam_frame_17_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 32, banim_cyc_ax1_oam_frame_18_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 33, banim_cyc_ax1_oam_frame_19_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_sound_mauthedoog_roar
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 4, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_6, 36, banim_cyc_ax1_oam_frame_25_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 35, banim_cyc_ax1_oam_frame_21_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 34, banim_cyc_ax1_oam_frame_20_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_attack_range:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_attack_range_critical:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_cyc_ax1_sheet_7, 41, banim_cyc_ax1_oam_frame_26_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_7, 42, banim_cyc_ax1_oam_frame_27_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_sheet_7, 41, banim_cyc_ax1_oam_frame_26_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_cyc_ax1_sheet_7, 41, banim_cyc_ax1_oam_frame_26_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_7, 42, banim_cyc_ax1_oam_frame_27_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_cyc_ax1_sheet_7, 41, banim_cyc_ax1_oam_frame_26_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_cyc_ax1_mode_stand_close:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_stand:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_stand_range:
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_cyc_ax1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 1, banim_cyc_ax1_oam_frame_1_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_0, 2, banim_cyc_ax1_oam_frame_2_r - banim_cyc_ax1_oam_r
	banim_code_sound_axe_swing_long
	banim_code_frame 4, banim_cyc_ax1_sheet_0, 3, banim_cyc_ax1_oam_frame_3_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 4, banim_cyc_ax1_oam_frame_4_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_1, 5, banim_cyc_ax1_oam_frame_5_r - banim_cyc_ax1_oam_r
	banim_code_sound_sword_spear_spin_heavy
	banim_code_frame 4, banim_cyc_ax1_sheet_1, 6, banim_cyc_ax1_oam_frame_6_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_1, 7, banim_cyc_ax1_oam_frame_7_r - banim_cyc_ax1_oam_r
	banim_code_frame 16, banim_cyc_ax1_sheet_2, 8, banim_cyc_ax1_oam_frame_8_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 9, banim_cyc_ax1_oam_frame_9_r - banim_cyc_ax1_oam_r
	banim_code_prepare_hp_deplete
	banim_code_sound_axe_swing_long
	banim_code_frame 2, banim_cyc_ax1_sheet_3, 10, banim_cyc_ax1_oam_frame_10_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 8, banim_cyc_ax1_sheet_2, 13, banim_cyc_ax1_oam_frame_11_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_2, 16, banim_cyc_ax1_oam_frame_12_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_3, 19, banim_cyc_ax1_oam_frame_13_r - banim_cyc_ax1_oam_r
	banim_code_frame 10, banim_cyc_ax1_sheet_4, 22, banim_cyc_ax1_oam_frame_14_r - banim_cyc_ax1_oam_r
	banim_code_frame 7, banim_cyc_ax1_sheet_4, 25, banim_cyc_ax1_oam_frame_15_r - banim_cyc_ax1_oam_r
	banim_code_frame 5, banim_cyc_ax1_sheet_4, 28, banim_cyc_ax1_oam_frame_16_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 31, banim_cyc_ax1_oam_frame_17_r - banim_cyc_ax1_oam_r
	banim_code_frame 3, banim_cyc_ax1_sheet_5, 32, banim_cyc_ax1_oam_frame_18_r - banim_cyc_ax1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 6, banim_cyc_ax1_sheet_5, 33, banim_cyc_ax1_oam_frame_19_r - banim_cyc_ax1_oam_r
	banim_code_frame 1, banim_cyc_ax1_sheet_0, 0, banim_cyc_ax1_oam_frame_0_r - banim_cyc_ax1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_cyc_ax1_mode_attack_close - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_attack_close_back - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_attack_close_critical - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_attack_close_critical_back - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_attack_range - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_attack_range_critical - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_dodge_close - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_dodge_range - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_stand_close - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_stand - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_stand_range - banim_cyc_ax1_script
	.word banim_cyc_ax1_mode_attack_miss - banim_cyc_ax1_script
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

