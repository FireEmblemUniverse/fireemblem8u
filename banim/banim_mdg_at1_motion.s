@ vim:ft=armv4
	.global banim_mdg_at1_script
	.global banim_mdg_at1_oam_r
	.global banim_mdg_at1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xB0
	.section .data.oam_l
banim_mdg_at1_oam_l:
banim_mdg_at1_oam_frame_0_l:
	banim_frame_oam 0x0, 0x9000, 0x1, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x5, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0x20, 24, -8
	banim_frame_oam 0x0, 0x1000, 0x60, 24, 8
	banim_frame_oam 0x0, 0x1000, 0x0, 8, -24
	banim_frame_end
banim_mdg_at1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x80, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x84, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x86, -16, -24
	banim_frame_oam 0x0, 0x1000, 0xA6, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0xC6, 24, 0
	banim_frame_end
banim_mdg_at1_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xD, 24, 0
	banim_frame_oam 0x4000, 0x1000, 0x4D, -24, -24
	banim_frame_end
banim_mdg_at1_oam_frame_3_l:
	banim_frame_oam 0x0, 0x9000, 0x87, -8, -16
	banim_frame_oam 0x8000, 0x5000, 0x8B, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xAC, -24, -8
	banim_frame_oam 0x0, 0x1000, 0xEC, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0xCD, 24, 0
	banim_frame_oam 0x0, 0x5000, 0x8D, -24, -32
	banim_frame_oam 0x0, 0x1000, 0x8C, -24, -16
	banim_frame_end
banim_mdg_at1_oam_frame_4_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x13, -24, -16
	banim_frame_oam 0x0, 0x5000, 0x15, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0x55, 24, 0
	banim_frame_end
banim_mdg_at1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0x9000, 0xCF, 8, -8
	banim_frame_oam 0x4000, 0x9000, 0xD3, -24, -8
	banim_frame_oam 0x4000, 0x9000, 0x8F, 8, -24
	banim_frame_oam 0x0, 0x5000, 0x93, -8, -24
	banim_frame_oam 0x0, 0x5000, 0x95, 40, -16
	banim_frame_oam 0x0, 0x1000, 0xCE, 40, -24
	banim_frame_end
banim_mdg_at1_oam_frame_6_l:
	banim_frame_oam 0x0, 0x9000, 0x17, 16, -16
	banim_frame_oam 0x8000, 0x9000, 0x1B, 0, -16
	banim_frame_oam 0x8000, 0x5000, 0x1D, -8, -16
	banim_frame_oam 0x0, 0x5000, 0x9D, 32, -32
	banim_frame_oam 0x8000, 0x1000, 0x9F, 24, -32
	banim_frame_oam 0x0, 0x5000, 0x3E, 48, -24
	banim_frame_oam 0x4000, 0x1000, 0x7E, 48, -8
	banim_frame_end
banim_mdg_at1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0x9000, 0x0, 32, -40
	banim_frame_oam 0x4000, 0x5000, 0x40, 32, -24
	banim_frame_oam 0x0, 0x9000, 0x60, 24, -16
	banim_frame_oam 0x8000, 0x5000, 0x64, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x24, 56, -16
	banim_frame_oam 0x0, 0x1000, 0x4, 8, -8
	banim_frame_end
banim_mdg_at1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0x9000, 0x5, 32, -40
	banim_frame_oam 0x4000, 0x5000, 0x45, 32, -24
	banim_frame_oam 0x8000, 0x1000, 0x29, 24, -32
	banim_frame_oam 0x0, 0x9000, 0x65, 24, -16
	banim_frame_oam 0x8000, 0x5000, 0x69, 16, -16
	banim_frame_oam 0x0, 0x1000, 0x9, 8, -8
	banim_frame_end
banim_mdg_at1_oam_frame_9_l:
	banim_frame_oam 0x0, 0x9000, 0x6A, 24, -16
	banim_frame_oam 0x8000, 0x5000, 0x6E, 16, -16
	banim_frame_oam 0x4000, 0x9000, 0xB, 24, -40
	banim_frame_oam 0x4000, 0x5000, 0x4B, 24, -24
	banim_frame_oam 0x8000, 0x1000, 0x2A, 56, -32
	banim_frame_oam 0x0, 0x1000, 0xA, 8, 8
	banim_frame_end
banim_mdg_at1_oam_frame_10_l:
	banim_frame_oam 0x0, 0x9000, 0xF, 0, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, 0, 8
	banim_frame_oam 0x4000, 0x5000, 0xAF, 32, -24
	banim_frame_oam 0x4000, 0x1000, 0xCF, 40, 8
	banim_frame_oam 0x0, 0x1000, 0xD1, 32, 8
	banim_frame_oam 0x4000, 0x5000, 0xE5, 32, -32
	banim_frame_oam 0x4000, 0x1000, 0xE9, 16, -32
	banim_frame_oam 0x4000, 0x5000, 0xE1, 24, -40
	banim_frame_end
banim_mdg_at1_oam_frame_11_l:
	banim_frame_oam 0x0, 0x9000, 0x13, 0, -16
	banim_frame_oam 0x4000, 0x9000, 0x93, 16, -40
	banim_frame_oam 0x8000, 0x1000, 0x97, 8, -40
	banim_frame_oam 0x4000, 0x5000, 0xD3, 16, -24
	banim_frame_oam 0x0, 0x1000, 0xD7, 8, -24
	banim_frame_oam 0x4000, 0x1000, 0xF3, 32, 8
	banim_frame_oam 0x0, 0x1000, 0xF5, 24, -48
	banim_frame_oam 0x0, 0x1000, 0xF6, 48, -40
	banim_frame_end
banim_mdg_at1_oam_frame_12_l:
	banim_frame_oam 0x0, 0x9000, 0x18, 0, -40
	banim_frame_oam 0x4000, 0x9000, 0x98, 0, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, 0, 8
	banim_frame_oam 0x0, 0x1000, 0x17, 16, -48
	banim_frame_oam 0x4000, 0x1000, 0xF8, 32, -40
	banim_frame_oam 0x0, 0x1000, 0xFA, 32, -32
	banim_frame_oam 0x0, 0x1000, 0xFB, 32, 8
	banim_frame_end
banim_mdg_at1_oam_frame_13_l:
	banim_frame_oam 0x0, 0x9000, 0x0, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xA0, -8, -40
	banim_frame_oam 0x8000, 0x1000, 0xA2, -16, -40
	banim_frame_end
banim_mdg_at1_oam_frame_14_l:
	banim_frame_oam 0x0, 0x9000, 0x7, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0xB, -24, -16
	banim_frame_oam 0x0, 0x5000, 0xA3, -24, -32
	banim_frame_oam 0x8000, 0x1000, 0xA5, -32, -32
	banim_frame_oam 0x8000, 0x1000, 0x46, 24, 0
	banim_frame_end
banim_mdg_at1_oam_frame_15_l:
	banim_frame_oam 0x4000, 0xD000, 0x86, -32, -16
	banim_frame_end
banim_mdg_at1_oam_frame_19_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -8, -24
	banim_frame_oam 0x8000, 0x5000, 0x13, -16, -24
	banim_frame_oam 0x4000, 0x5000, 0x8F, -8, 8
	banim_frame_oam 0x0, 0x1000, 0x93, -16, 8
	banim_frame_oam 0x8000, 0x1000, 0x4E, 24, -8
	banim_frame_oam 0x0, 0x1000, 0x8E, 24, 8
	banim_frame_oam 0x8000, 0x1000, 0x14, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0x74, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xE, -32, -16
	banim_frame_end
banim_mdg_at1_oam_frame_20_l:
	banim_frame_oam 0x4000, 0x9000, 0xB1, -8, -8
	banim_frame_oam 0x0, 0x5000, 0xB5, -24, -8
	banim_frame_oam 0x4000, 0x5000, 0xF1, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0xF5, -24, 8
	banim_frame_oam 0x0, 0x5000, 0xAE, 8, -32
	banim_frame_oam 0x8000, 0x1000, 0xB0, 0, -32
	banim_frame_oam 0x4000, 0x1000, 0xEE, 8, -16
	banim_frame_oam 0x0, 0x1000, 0xF0, 0, -16
	banim_frame_oam 0x0, 0x5000, 0xD7, -24, -24
	banim_frame_oam 0x8000, 0x1000, 0xD9, -32, -24
	banim_frame_end
banim_mdg_at1_oam_frame_21_l:
	banim_frame_oam 0x8000, 0x9000, 0x18, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x1A, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x98, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x9A, 0, 0
	banim_frame_oam 0x8000, 0x9000, 0x35, -16, -16
	banim_frame_oam 0x8000, 0x5000, 0x37, -24, -16
	banim_frame_oam 0x0, 0x1000, 0x16, -32, -16
	banim_frame_oam 0x0, 0x1000, 0x15, -24, -24
	banim_frame_end
banim_mdg_at1_oam_frame_22_l:
	banim_frame_oam 0x8000, 0x9000, 0x1B, 8, -32
	banim_frame_oam 0x8000, 0x5000, 0x1D, 0, -32
	banim_frame_oam 0x0, 0x5000, 0x9B, 8, 0
	banim_frame_oam 0x8000, 0x1000, 0x9D, 0, 0
	banim_frame_oam 0x8000, 0x9000, 0x3E, -16, -16
	banim_frame_oam 0x8000, 0x1000, 0xBE, -24, -16
	banim_frame_oam 0x8000, 0x1000, 0xBF, -24, 0
	banim_frame_oam 0x0, 0x1000, 0xDD, -32, -16
	banim_frame_end
banim_mdg_at1_oam_frame_23_l:
	banim_frame_oam 0x0, 0x9000, 0x0, 0, -24
	banim_frame_oam 0x8000, 0x9000, 0x4, -16, -24
	banim_frame_oam 0x8000, 0x5000, 0x6, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x80, 0, 8
	banim_frame_oam 0x4000, 0x1000, 0x84, -16, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -24, 8
	banim_frame_oam 0x8000, 0x1000, 0x7, -32, -24
	banim_frame_oam 0x0, 0x1000, 0x47, -32, -8
	banim_frame_end
banim_mdg_at1_oam_frame_25_l:
	banim_frame_oam 0x0, 0x9000, 0x9, -8, -24
	banim_frame_oam 0x8000, 0x9000, 0xD, -24, -24
	banim_frame_oam 0x4000, 0x5000, 0x89, -8, 8
	banim_frame_oam 0x4000, 0x1000, 0x8D, -24, 8
	banim_frame_end
banim_mdg_at1_oam_frame_26_l:
	banim_frame_oam 0x0, 0x9000, 0xF, -8, -16
	banim_frame_oam 0x8000, 0x9000, 0x13, -24, -16
	banim_frame_oam 0x8000, 0x5000, 0x15, -32, -16
	banim_frame_end
banim_mdg_at1_oam_frame_16_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mdg_at1_oam_frame_17_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mdg_at1_oam_frame_18_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
banim_mdg_at1_oam_frame_24_l:
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_mdg_at1_oam_r:
banim_mdg_at1_oam_frame_0_r:
	banim_frame_oam 0x0, 0x8000, 0x1, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x5, 8, -16
	banim_frame_oam 0x8000, 0x0, 0x20, -32, -8
	banim_frame_oam 0x0, 0x0, 0x60, -32, 8
	banim_frame_oam 0x0, 0x0, 0x0, -16, -24
	banim_frame_end
banim_mdg_at1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x80, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x84, 8, -16
	banim_frame_oam 0x0, 0x0, 0x86, 8, -24
	banim_frame_oam 0x0, 0x0, 0xA6, 16, -24
	banim_frame_oam 0x8000, 0x0, 0xC6, -32, 0
	banim_frame_end
banim_mdg_at1_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xD, -32, 0
	banim_frame_oam 0x4000, 0x0, 0x4D, 8, -24
	banim_frame_end
banim_mdg_at1_oam_frame_3_r:
	banim_frame_oam 0x0, 0x8000, 0x87, -24, -16
	banim_frame_oam 0x8000, 0x4000, 0x8B, 8, -16
	banim_frame_oam 0x8000, 0x0, 0xAC, 16, -8
	banim_frame_oam 0x0, 0x0, 0xEC, 16, 8
	banim_frame_oam 0x8000, 0x0, 0xCD, -32, 0
	banim_frame_oam 0x0, 0x4000, 0x8D, 8, -32
	banim_frame_oam 0x0, 0x0, 0x8C, 16, -16
	banim_frame_end
banim_mdg_at1_oam_frame_4_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x13, 8, -16
	banim_frame_oam 0x0, 0x4000, 0x15, 8, -32
	banim_frame_oam 0x8000, 0x0, 0x55, -32, 0
	banim_frame_end
banim_mdg_at1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0x8000, 0xCF, -40, -8
	banim_frame_oam 0x4000, 0x8000, 0xD3, -8, -8
	banim_frame_oam 0x4000, 0x8000, 0x8F, -40, -24
	banim_frame_oam 0x0, 0x4000, 0x93, -8, -24
	banim_frame_oam 0x0, 0x4000, 0x95, -56, -16
	banim_frame_oam 0x0, 0x0, 0xCE, -48, -24
	banim_frame_end
banim_mdg_at1_oam_frame_6_r:
	banim_frame_oam 0x0, 0x8000, 0x17, -48, -16
	banim_frame_oam 0x8000, 0x8000, 0x1B, -16, -16
	banim_frame_oam 0x8000, 0x4000, 0x1D, 0, -16
	banim_frame_oam 0x0, 0x4000, 0x9D, -48, -32
	banim_frame_oam 0x8000, 0x0, 0x9F, -32, -32
	banim_frame_oam 0x0, 0x4000, 0x3E, -64, -24
	banim_frame_oam 0x4000, 0x0, 0x7E, -64, -8
	banim_frame_end
banim_mdg_at1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0x8000, 0x0, -64, -40
	banim_frame_oam 0x4000, 0x4000, 0x40, -64, -24
	banim_frame_oam 0x0, 0x8000, 0x60, -56, -16
	banim_frame_oam 0x8000, 0x4000, 0x64, -24, -16
	banim_frame_oam 0x0, 0x0, 0x24, -64, -16
	banim_frame_oam 0x0, 0x0, 0x4, -16, -8
	banim_frame_end
banim_mdg_at1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0x8000, 0x5, -64, -40
	banim_frame_oam 0x4000, 0x4000, 0x45, -64, -24
	banim_frame_oam 0x8000, 0x0, 0x29, -32, -32
	banim_frame_oam 0x0, 0x8000, 0x65, -56, -16
	banim_frame_oam 0x8000, 0x4000, 0x69, -24, -16
	banim_frame_oam 0x0, 0x0, 0x9, -16, -8
	banim_frame_end
banim_mdg_at1_oam_frame_9_r:
	banim_frame_oam 0x0, 0x8000, 0x6A, -56, -16
	banim_frame_oam 0x8000, 0x4000, 0x6E, -24, -16
	banim_frame_oam 0x4000, 0x8000, 0xB, -56, -40
	banim_frame_oam 0x4000, 0x4000, 0x4B, -56, -24
	banim_frame_oam 0x8000, 0x0, 0x2A, -64, -32
	banim_frame_oam 0x0, 0x0, 0xA, -16, 8
	banim_frame_end
banim_mdg_at1_oam_frame_10_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -32, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -32, 8
	banim_frame_oam 0x4000, 0x4000, 0xAF, -64, -24
	banim_frame_oam 0x4000, 0x0, 0xCF, -56, 8
	banim_frame_oam 0x0, 0x0, 0xD1, -40, 8
	banim_frame_oam 0x4000, 0x4000, 0xE5, -64, -32
	banim_frame_oam 0x4000, 0x0, 0xE9, -32, -32
	banim_frame_oam 0x4000, 0x4000, 0xE1, -56, -40
	banim_frame_end
banim_mdg_at1_oam_frame_11_r:
	banim_frame_oam 0x0, 0x8000, 0x13, -32, -16
	banim_frame_oam 0x4000, 0x8000, 0x93, -48, -40
	banim_frame_oam 0x8000, 0x0, 0x97, -16, -40
	banim_frame_oam 0x4000, 0x4000, 0xD3, -48, -24
	banim_frame_oam 0x0, 0x0, 0xD7, -16, -24
	banim_frame_oam 0x4000, 0x0, 0xF3, -48, 8
	banim_frame_oam 0x0, 0x0, 0xF5, -32, -48
	banim_frame_oam 0x0, 0x0, 0xF6, -56, -40
	banim_frame_end
banim_mdg_at1_oam_frame_12_r:
	banim_frame_oam 0x0, 0x8000, 0x18, -32, -40
	banim_frame_oam 0x4000, 0x8000, 0x98, -32, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -32, 8
	banim_frame_oam 0x0, 0x0, 0x17, -24, -48
	banim_frame_oam 0x4000, 0x0, 0xF8, -48, -40
	banim_frame_oam 0x0, 0x0, 0xFA, -40, -32
	banim_frame_oam 0x0, 0x0, 0xFB, -40, 8
	banim_frame_end
banim_mdg_at1_oam_frame_13_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xA0, -8, -40
	banim_frame_oam 0x8000, 0x0, 0xA2, 8, -40
	banim_frame_end
banim_mdg_at1_oam_frame_14_r:
	banim_frame_oam 0x0, 0x8000, 0x7, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0xB, 8, -16
	banim_frame_oam 0x0, 0x4000, 0xA3, 8, -32
	banim_frame_oam 0x8000, 0x0, 0xA5, 24, -32
	banim_frame_oam 0x8000, 0x0, 0x46, -32, 0
	banim_frame_end
banim_mdg_at1_oam_frame_15_r:
	banim_frame_oam 0x4000, 0xC000, 0x86, -32, -16
	banim_frame_end
banim_mdg_at1_oam_frame_19_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -24, -24
	banim_frame_oam 0x8000, 0x4000, 0x13, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x8F, -24, 8
	banim_frame_oam 0x0, 0x0, 0x93, 8, 8
	banim_frame_oam 0x8000, 0x0, 0x4E, -32, -8
	banim_frame_oam 0x0, 0x0, 0x8E, -32, 8
	banim_frame_oam 0x8000, 0x0, 0x14, 16, -24
	banim_frame_oam 0x8000, 0x0, 0x74, 16, 0
	banim_frame_oam 0x0, 0x0, 0xE, 24, -16
	banim_frame_end
banim_mdg_at1_oam_frame_20_r:
	banim_frame_oam 0x4000, 0x8000, 0xB1, -24, -8
	banim_frame_oam 0x0, 0x4000, 0xB5, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xF1, -24, 8
	banim_frame_oam 0x4000, 0x0, 0xF5, 8, 8
	banim_frame_oam 0x0, 0x4000, 0xAE, -24, -32
	banim_frame_oam 0x8000, 0x0, 0xB0, -8, -32
	banim_frame_oam 0x4000, 0x0, 0xEE, -24, -16
	banim_frame_oam 0x0, 0x0, 0xF0, -8, -16
	banim_frame_oam 0x0, 0x4000, 0xD7, 8, -24
	banim_frame_oam 0x8000, 0x0, 0xD9, 24, -24
	banim_frame_end
banim_mdg_at1_oam_frame_21_r:
	banim_frame_oam 0x8000, 0x8000, 0x18, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x1A, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x98, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x9A, -8, 0
	banim_frame_oam 0x8000, 0x8000, 0x35, 0, -16
	banim_frame_oam 0x8000, 0x4000, 0x37, 16, -16
	banim_frame_oam 0x0, 0x0, 0x16, 24, -16
	banim_frame_oam 0x0, 0x0, 0x15, 16, -24
	banim_frame_end
banim_mdg_at1_oam_frame_22_r:
	banim_frame_oam 0x8000, 0x8000, 0x1B, -24, -32
	banim_frame_oam 0x8000, 0x4000, 0x1D, -8, -32
	banim_frame_oam 0x0, 0x4000, 0x9B, -24, 0
	banim_frame_oam 0x8000, 0x0, 0x9D, -8, 0
	banim_frame_oam 0x8000, 0x8000, 0x3E, 0, -16
	banim_frame_oam 0x8000, 0x0, 0xBE, 16, -16
	banim_frame_oam 0x8000, 0x0, 0xBF, 16, 0
	banim_frame_oam 0x0, 0x0, 0xDD, 24, -16
	banim_frame_end
banim_mdg_at1_oam_frame_23_r:
	banim_frame_oam 0x0, 0x8000, 0x0, -32, -24
	banim_frame_oam 0x8000, 0x8000, 0x4, 0, -24
	banim_frame_oam 0x8000, 0x4000, 0x6, 16, -24
	banim_frame_oam 0x4000, 0x4000, 0x80, -32, 8
	banim_frame_oam 0x4000, 0x0, 0x84, 0, 8
	banim_frame_oam 0x0, 0x0, 0x86, 16, 8
	banim_frame_oam 0x8000, 0x0, 0x7, 24, -24
	banim_frame_oam 0x0, 0x0, 0x47, 24, -8
	banim_frame_end
banim_mdg_at1_oam_frame_25_r:
	banim_frame_oam 0x0, 0x8000, 0x9, -24, -24
	banim_frame_oam 0x8000, 0x8000, 0xD, 8, -24
	banim_frame_oam 0x4000, 0x4000, 0x89, -24, 8
	banim_frame_oam 0x4000, 0x0, 0x8D, 8, 8
	banim_frame_end
banim_mdg_at1_oam_frame_26_r:
	banim_frame_oam 0x0, 0x8000, 0xF, -24, -16
	banim_frame_oam 0x8000, 0x8000, 0x13, 8, -16
	banim_frame_oam 0x8000, 0x4000, 0x15, 24, -16
	banim_frame_end
banim_mdg_at1_oam_frame_16_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mdg_at1_oam_frame_17_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mdg_at1_oam_frame_18_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
banim_mdg_at1_oam_frame_24_r:
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
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_mdg_at1_script:
banim_mdg_at1_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_mdg_at1_sheet_0, 5, banim_mdg_at1_oam_frame_5_r - banim_mdg_at1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 4, banim_mdg_at1_sheet_0, 6, banim_mdg_at1_oam_frame_6_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 7, banim_mdg_at1_oam_frame_7_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_1, 8, banim_mdg_at1_oam_frame_8_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mdg_at1_sheet_1, 9, banim_mdg_at1_oam_frame_9_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_mdg_at1_sheet_1, 10, banim_mdg_at1_oam_frame_10_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_1, 11, banim_mdg_at1_oam_frame_11_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 12, banim_mdg_at1_oam_frame_12_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_2, 13, banim_mdg_at1_oam_frame_13_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_mdg_at1_sheet_2, 14, banim_mdg_at1_oam_frame_14_r - banim_mdg_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_mdg_at1_sheet_2, 15, banim_mdg_at1_oam_frame_15_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mdg_at1_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_hit_normal
	banim_code_frame 4, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mdg_at1_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_scream
	banim_code_frame 3, banim_mdg_at1_sheet_2, 16, banim_mdg_at1_oam_frame_19_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_2, 17, banim_mdg_at1_oam_frame_20_r - banim_mdg_at1_oam_r
	banim_code_frame 30, banim_mdg_at1_sheet_2, 18, banim_mdg_at1_oam_frame_21_r - banim_mdg_at1_oam_r
	banim_code_frame 3, banim_mdg_at1_sheet_2, 19, banim_mdg_at1_oam_frame_22_r - banim_mdg_at1_oam_r
	banim_code_frame 3, banim_mdg_at1_sheet_3, 20, banim_mdg_at1_oam_frame_23_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_mdg_at1_sheet_0, 5, banim_mdg_at1_oam_frame_5_r - banim_mdg_at1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_mdg_at1_sheet_0, 6, banim_mdg_at1_oam_frame_6_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 7, banim_mdg_at1_oam_frame_7_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_1, 8, banim_mdg_at1_oam_frame_8_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mdg_at1_sheet_1, 9, banim_mdg_at1_oam_frame_9_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_mdg_at1_sheet_1, 10, banim_mdg_at1_oam_frame_10_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_1, 11, banim_mdg_at1_oam_frame_11_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 12, banim_mdg_at1_oam_frame_12_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_2, 13, banim_mdg_at1_oam_frame_13_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_mdg_at1_sheet_2, 14, banim_mdg_at1_oam_frame_14_r - banim_mdg_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_mdg_at1_sheet_2, 15, banim_mdg_at1_oam_frame_15_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mdg_at1_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_scream
	banim_code_frame 3, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_frame 30, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_frame 3, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_frame 3, banim_mdg_at1_sheet_3, 26, banim_mdg_at1_oam_frame_24_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_hit_critical_3
	banim_code_sound_hit_eliwood_promoted_durandal
	banim_code_frame 4, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 24, banim_mdg_at1_oam_frame_17_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_mdg_at1_sheet_2, 25, banim_mdg_at1_oam_frame_18_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_0, 23, banim_mdg_at1_oam_frame_16_r - banim_mdg_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mdg_at1_mode_attack_range:
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mdg_at1_mode_attack_range_critical:
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mdg_at1_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mdg_at1_sheet_3, 21, banim_mdg_at1_oam_frame_25_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_3, 22, banim_mdg_at1_oam_frame_26_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mdg_at1_sheet_3, 21, banim_mdg_at1_oam_frame_25_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mdg_at1_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_mdg_at1_sheet_3, 21, banim_mdg_at1_oam_frame_25_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_3, 22, banim_mdg_at1_oam_frame_26_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_mdg_at1_sheet_3, 21, banim_mdg_at1_oam_frame_25_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_mdg_at1_mode_stand_close:
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mdg_at1_mode_stand:
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mdg_at1_mode_stand_range:
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_mdg_at1_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_1
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 1, banim_mdg_at1_oam_frame_1_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 2, banim_mdg_at1_oam_frame_2_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 3, banim_mdg_at1_oam_frame_3_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_0, 4, banim_mdg_at1_oam_frame_4_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_2
	banim_code_prepare_hp_deplete
	banim_code_frame 2, banim_mdg_at1_sheet_0, 5, banim_mdg_at1_oam_frame_5_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_0, 6, banim_mdg_at1_oam_frame_6_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 7, banim_mdg_at1_oam_frame_7_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_1, 8, banim_mdg_at1_oam_frame_8_r - banim_mdg_at1_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_mdg_at1_sheet_1, 9, banim_mdg_at1_oam_frame_9_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 2, banim_mdg_at1_sheet_1, 10, banim_mdg_at1_oam_frame_10_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_1, 11, banim_mdg_at1_oam_frame_11_r - banim_mdg_at1_oam_r
	banim_code_frame 2, banim_mdg_at1_sheet_1, 12, banim_mdg_at1_oam_frame_12_r - banim_mdg_at1_oam_r
	banim_code_frame 4, banim_mdg_at1_sheet_2, 13, banim_mdg_at1_oam_frame_13_r - banim_mdg_at1_oam_r
	banim_code_sound_mauthedoog_3
	banim_code_frame 4, banim_mdg_at1_sheet_2, 14, banim_mdg_at1_oam_frame_14_r - banim_mdg_at1_oam_r
	banim_code_start_opposite_turn
	banim_code_frame 4, banim_mdg_at1_sheet_2, 15, banim_mdg_at1_oam_frame_15_r - banim_mdg_at1_oam_r
	banim_code_frame 1, banim_mdg_at1_sheet_0, 0, banim_mdg_at1_oam_frame_0_r - banim_mdg_at1_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_mdg_at1_mode_attack_close - banim_mdg_at1_script
	.word banim_mdg_at1_mode_attack_close_back - banim_mdg_at1_script
	.word banim_mdg_at1_mode_attack_close_critical - banim_mdg_at1_script
	.word banim_mdg_at1_mode_attack_close_critical_back - banim_mdg_at1_script
	.word banim_mdg_at1_mode_attack_range - banim_mdg_at1_script
	.word banim_mdg_at1_mode_attack_range_critical - banim_mdg_at1_script
	.word banim_mdg_at1_mode_dodge_close - banim_mdg_at1_script
	.word banim_mdg_at1_mode_dodge_range - banim_mdg_at1_script
	.word banim_mdg_at1_mode_stand_close - banim_mdg_at1_script
	.word banim_mdg_at1_mode_stand - banim_mdg_at1_script
	.word banim_mdg_at1_mode_stand_range - banim_mdg_at1_script
	.word banim_mdg_at1_mode_attack_miss - banim_mdg_at1_script
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

