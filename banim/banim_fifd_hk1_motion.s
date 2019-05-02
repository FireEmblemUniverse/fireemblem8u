@ vim:ft=armv4
	.global banim_fifd_hk1_script
	.global banim_fifd_hk1_oam_r
	.global banim_fifd_hk1_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0xC5
	.section .data.oam_l
banim_fifd_hk1_oam_l:
banim_fifd_hk1_oam_frame_0_l:
	banim_frame_oam 0x4000, 0xD000, 0x1000, -29, -40
	banim_frame_oam 0x8000, 0x9000, 0x1008, -45, -40
	banim_frame_oam 0x8000, 0x5000, 0x100A, -53, -40
	banim_frame_oam 0x4000, 0x9000, 0x1080, 3, -8
	banim_frame_oam 0x4000, 0x9000, 0x1084, -29, -8
	banim_frame_oam 0x0, 0x5000, 0x1088, -45, -8
	banim_frame_oam 0x8000, 0x1000, 0x108A, -53, -8
	banim_frame_oam 0x4000, 0x5000, 0x10C0, 3, 8
	banim_frame_oam 0x4000, 0x5000, 0x10C4, -29, 8
	banim_frame_oam 0x4000, 0x1000, 0x10C8, -45, 8
	banim_frame_oam 0x0, 0x1000, 0x10CA, -53, 8
	banim_frame_oam 0x4000, 0x1000, 0x10E0, 19, -48
	banim_frame_oam 0x8000, 0x9000, 0x100B, -69, -48
	banim_frame_oam 0x8000, 0x5000, 0x100D, -77, -48
	banim_frame_oam 0x8000, 0x1000, 0x100E, -21, -56
	banim_frame_oam 0x4000, 0x9000, 0x108B, -53, -56
	banim_frame_oam 0x4000, 0x9000, 0x10CB, -13, -56
	banim_frame_oam 0x4000, 0x5000, 0x10E3, -21, 16
	banim_frame_oam 0x4000, 0x1000, 0x10E7, -37, 16
	banim_frame_oam 0x4000, 0x1000, 0x10E9, -53, 16
	banim_frame_end
banim_fifd_hk1_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x1022, -13, -32
	banim_frame_oam 0x8000, 0x9000, 0x1026, -29, -32
	banim_frame_oam 0x8000, 0x5000, 0x1028, -37, -32
	banim_frame_oam 0x4000, 0x9000, 0x10A2, -13, 0
	banim_frame_oam 0x0, 0x5000, 0x10A6, -29, 0
	banim_frame_oam 0x8000, 0x1000, 0x10A8, -37, 0
	banim_frame_oam 0x4000, 0x5000, 0x10E2, -13, 16
	banim_frame_oam 0x4000, 0x1000, 0x10E6, -29, 16
	banim_frame_oam 0x0, 0x1000, 0x10E8, -37, 16
	banim_frame_oam 0x8000, 0x5000, 0x1061, 19, -16
	banim_frame_oam 0x8000, 0x9000, 0x1009, -53, -40
	banim_frame_oam 0x8000, 0x9000, 0x1089, -53, -8
	banim_frame_oam 0x8000, 0x9000, 0x100B, -69, -48
	banim_frame_oam 0x8000, 0x5000, 0x100D, -77, -48
	banim_frame_oam 0x0, 0x1000, 0x1041, 19, -24
	banim_frame_oam 0x4000, 0x9000, 0x102F, -5, -48
	banim_frame_oam 0x4000, 0x9000, 0x1033, -37, -48
	banim_frame_oam 0x4000, 0x9000, 0x1037, -69, -48
	banim_frame_oam 0x4000, 0x5000, 0x1010, -13, -56
	banim_frame_oam 0x0, 0x1000, 0x1014, -21, -56
	banim_frame_oam 0x4000, 0x1000, 0x1016, -45, -56
	banim_frame_oam 0x0, 0x1000, 0x1018, -53, -56
	banim_frame_oam 0x8000, 0x1000, 0x104E, 27, -39
	banim_frame_oam 0x0, 0x1000, 0x1040, 27, -23
	banim_frame_oam 0x0, 0x1000, 0x100F, 19, -32
	banim_frame_end
banim_fifd_hk1_oam_frame_2_l:
	banim_frame_oam 0x4000, 0x9000, 0x10D0, 3, -24
	banim_frame_oam 0x4000, 0xD000, 0x1060, -29, -16
	banim_frame_oam 0x8000, 0x9000, 0x1068, -45, -16
	banim_frame_oam 0x8000, 0x5000, 0x106A, -53, -16
	banim_frame_oam 0x4000, 0x5000, 0x10E3, -21, 16
	banim_frame_oam 0x4000, 0x5000, 0x10E7, -53, 16
	banim_frame_oam 0x4000, 0x9000, 0x106F, -5, -48
	banim_frame_oam 0x4000, 0x9000, 0x1073, -37, -48
	banim_frame_oam 0x4000, 0x9000, 0x1077, -69, -48
	banim_frame_oam 0x4000, 0x5000, 0x10AF, -5, -32
	banim_frame_oam 0x4000, 0x5000, 0x10B3, -37, -32
	banim_frame_oam 0x4000, 0x5000, 0x10B7, -69, -32
	banim_frame_oam 0x0, 0x1000, 0x1015, -45, -56
	banim_frame_oam 0x8000, 0x1000, 0x10CF, 27, -40
	banim_frame_oam 0x4000, 0x5000, 0x10D4, -29, -24
	banim_frame_oam 0x4000, 0x5000, 0x10F4, -61, -32
	banim_frame_oam 0x4000, 0x1000, 0x10D8, -45, -24
	banim_frame_oam 0x4000, 0x1000, 0x106B, -69, -24
	banim_frame_oam 0x8000, 0x1000, 0x102D, -77, -40
	banim_frame_oam 0x0, 0x1000, 0x106D, -77, -24
	banim_frame_end
banim_fifd_hk1_oam_frame_3_l:
	banim_frame_oam 0x4000, 0x1000, 0x10CB, -5, 16
	banim_frame_oam 0x0, 0x1000, 0x10CD, -13, 16
	banim_frame_oam 0x4000, 0x1000, 0x10AB, -29, 16
	banim_frame_oam 0x0, 0x1000, 0x10AD, -37, 16
	banim_frame_oam 0x4000, 0x1000, 0x108C, -53, 16
	banim_frame_oam 0x4000, 0xD000, 0x1000, -29, -48
	banim_frame_oam 0x0, 0x9000, 0x1008, -61, -48
	banim_frame_oam 0x8000, 0x9000, 0x100C, -77, -48
	banim_frame_oam 0x4000, 0xD000, 0x1081, -37, -16
	banim_frame_oam 0x8000, 0x9000, 0x1089, -53, -16
	banim_frame_oam 0x0, 0x1000, 0x108B, -61, -16
	banim_frame_oam 0x0, 0x1000, 0x1080, -45, -56
	banim_frame_end
banim_fifd_hk1_oam_frame_4_l:
	banim_frame_oam 0x4000, 0xD000, 0x1000, -28, -48
	banim_frame_oam 0x0, 0x9000, 0x1008, -60, -48
	banim_frame_oam 0x8000, 0x9000, 0x100C, -76, -48
	banim_frame_oam 0x4000, 0x5000, 0x1081, -4, -16
	banim_frame_oam 0x0, 0x1000, 0x1085, -12, -16
	banim_frame_oam 0x4000, 0x5000, 0x1013, -44, -16
	banim_frame_oam 0x0, 0x1000, 0x1017, -52, -16
	banim_frame_oam 0x4000, 0x9000, 0x102E, -4, -8
	banim_frame_oam 0x4000, 0x9000, 0x1032, -36, -8
	banim_frame_oam 0x0, 0x5000, 0x1036, -52, -8
	banim_frame_oam 0x4000, 0x5000, 0x106E, -4, 8
	banim_frame_oam 0x4000, 0x5000, 0x1072, -36, 8
	banim_frame_oam 0x4000, 0x1000, 0x1076, -52, 8
	banim_frame_oam 0x0, 0x1000, 0x10EB, -28, 16
	banim_frame_oam 0x0, 0x1000, 0x1080, -44, -56
	banim_frame_end
banim_fifd_hk1_oam_frame_5_l:
	banim_frame_oam 0x4000, 0xD000, 0x108E, -31, -43
	banim_frame_oam 0x8000, 0x9000, 0x1096, -47, -43
	banim_frame_oam 0x8000, 0x9000, 0x1098, -63, -43
	banim_frame_oam 0x4000, 0x9000, 0x1038, -7, -11
	banim_frame_oam 0x4000, 0x9000, 0x103C, -39, -11
	banim_frame_oam 0x4000, 0x5000, 0x1078, -7, 5
	banim_frame_oam 0x4000, 0x5000, 0x107C, -39, 5
	banim_frame_oam 0x0, 0x1000, 0x101C, -7, 13
	banim_frame_oam 0x8000, 0x1000, 0x109F, -47, -11
	banim_frame_oam 0x0, 0x1000, 0x10DF, -47, 5
	banim_frame_oam 0x4000, 0x1000, 0x101D, -23, 13
	banim_frame_end
banim_fifd_hk1_oam_frame_6_l:
	banim_frame_oam 0x4000, 0xD000, 0x1001, -35, -41
	banim_frame_oam 0x8000, 0x9000, 0x1009, -51, -41
	banim_frame_oam 0x4000, 0x9000, 0x1081, -3, -9
	banim_frame_oam 0x4000, 0x9000, 0x1085, -35, -9
	banim_frame_oam 0x0, 0x5000, 0x1089, -51, -9
	banim_frame_oam 0x4000, 0x5000, 0x10C1, -3, 7
	banim_frame_oam 0x4000, 0x5000, 0x10C5, -35, 7
	banim_frame_oam 0x4000, 0x1000, 0xC9, -51, 7
	banim_frame_end
banim_fifd_hk1_oam_frame_7_l:
	banim_frame_oam 0x4000, 0xD000, 0x100B, -37, -40
	banim_frame_oam 0x4000, 0x9000, 0x108B, -5, -8
	banim_frame_oam 0x4000, 0x9000, 0x108F, -37, -8
	banim_frame_end
banim_fifd_hk1_oam_frame_8_l:
	banim_frame_oam 0x4000, 0xD000, 0x1013, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x1093, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x1097, -40, -8
	banim_frame_end
banim_fifd_hk1_oam_frame_9_l:
	banim_frame_oam 0x4000, 0xD000, 0x0, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x80, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x84, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xC0, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0xC4, -40, 8
	banim_frame_end
banim_fifd_hk1_oam_frame_10_l:
	banim_frame_oam 0x4000, 0xD000, 0x8, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x88, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x8C, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xC8, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0xCC, -40, 8
	banim_frame_end
banim_fifd_hk1_oam_frame_11_l:
	banim_frame_oam 0x4000, 0xD000, 0x10, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x90, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x94, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xD0, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0xD4, -40, 8
	banim_frame_end
banim_fifd_hk1_oam_frame_12_l:
	banim_frame_oam 0x4000, 0xD000, 0x18, -40, -40
	banim_frame_oam 0x4000, 0x9000, 0x98, -8, -8
	banim_frame_oam 0x4000, 0x9000, 0x9C, -40, -8
	banim_frame_oam 0x4000, 0x5000, 0xD8, -8, 8
	banim_frame_oam 0x4000, 0x5000, 0xDC, -40, 8
	banim_frame_end
	.section .data.oam_r
banim_fifd_hk1_oam_r:
banim_fifd_hk1_oam_frame_0_r:
	banim_frame_oam 0x4000, 0xC000, 0x1000, -35, -40
	banim_frame_oam 0x8000, 0x8000, 0x1008, 29, -40
	banim_frame_oam 0x8000, 0x4000, 0x100A, 45, -40
	banim_frame_oam 0x4000, 0x8000, 0x1080, -35, -8
	banim_frame_oam 0x4000, 0x8000, 0x1084, -3, -8
	banim_frame_oam 0x0, 0x4000, 0x1088, 29, -8
	banim_frame_oam 0x8000, 0x0, 0x108A, 45, -8
	banim_frame_oam 0x4000, 0x4000, 0x10C0, -35, 8
	banim_frame_oam 0x4000, 0x4000, 0x10C4, -3, 8
	banim_frame_oam 0x4000, 0x0, 0x10C8, 29, 8
	banim_frame_oam 0x0, 0x0, 0x10CA, 45, 8
	banim_frame_oam 0x4000, 0x0, 0x10E0, -35, -48
	banim_frame_oam 0x8000, 0x8000, 0x100B, 53, -48
	banim_frame_oam 0x8000, 0x4000, 0x100D, 69, -48
	banim_frame_oam 0x8000, 0x0, 0x100E, 13, -56
	banim_frame_oam 0x4000, 0x8000, 0x108B, 21, -56
	banim_frame_oam 0x4000, 0x8000, 0x10CB, -19, -56
	banim_frame_oam 0x4000, 0x4000, 0x10E3, -11, 16
	banim_frame_oam 0x4000, 0x0, 0x10E7, 21, 16
	banim_frame_oam 0x4000, 0x0, 0x10E9, 37, 16
	banim_frame_end
banim_fifd_hk1_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x1022, -19, -32
	banim_frame_oam 0x8000, 0x8000, 0x1026, 13, -32
	banim_frame_oam 0x8000, 0x4000, 0x1028, 29, -32
	banim_frame_oam 0x4000, 0x8000, 0x10A2, -19, 0
	banim_frame_oam 0x0, 0x4000, 0x10A6, 13, 0
	banim_frame_oam 0x8000, 0x0, 0x10A8, 29, 0
	banim_frame_oam 0x4000, 0x4000, 0x10E2, -19, 16
	banim_frame_oam 0x4000, 0x0, 0x10E6, 13, 16
	banim_frame_oam 0x0, 0x0, 0x10E8, 29, 16
	banim_frame_oam 0x8000, 0x4000, 0x1061, -27, -16
	banim_frame_oam 0x8000, 0x8000, 0x1009, 37, -40
	banim_frame_oam 0x8000, 0x8000, 0x1089, 37, -8
	banim_frame_oam 0x8000, 0x8000, 0x100B, 53, -48
	banim_frame_oam 0x8000, 0x4000, 0x100D, 69, -48
	banim_frame_oam 0x0, 0x0, 0x1041, -27, -24
	banim_frame_oam 0x4000, 0x8000, 0x102F, -27, -48
	banim_frame_oam 0x4000, 0x8000, 0x1033, 5, -48
	banim_frame_oam 0x4000, 0x8000, 0x1037, 37, -48
	banim_frame_oam 0x4000, 0x4000, 0x1010, -19, -56
	banim_frame_oam 0x0, 0x0, 0x1014, 13, -56
	banim_frame_oam 0x4000, 0x0, 0x1016, 29, -56
	banim_frame_oam 0x0, 0x0, 0x1018, 45, -56
	banim_frame_oam 0x8000, 0x0, 0x104E, -35, -39
	banim_frame_oam 0x0, 0x0, 0x1040, -35, -23
	banim_frame_oam 0x0, 0x0, 0x100F, -27, -32
	banim_frame_end
banim_fifd_hk1_oam_frame_2_r:
	banim_frame_oam 0x4000, 0x8000, 0x10D0, -35, -24
	banim_frame_oam 0x4000, 0xC000, 0x1060, -35, -16
	banim_frame_oam 0x8000, 0x8000, 0x1068, 29, -16
	banim_frame_oam 0x8000, 0x4000, 0x106A, 45, -16
	banim_frame_oam 0x4000, 0x4000, 0x10E3, -11, 16
	banim_frame_oam 0x4000, 0x4000, 0x10E7, 21, 16
	banim_frame_oam 0x4000, 0x8000, 0x106F, -27, -48
	banim_frame_oam 0x4000, 0x8000, 0x1073, 5, -48
	banim_frame_oam 0x4000, 0x8000, 0x1077, 37, -48
	banim_frame_oam 0x4000, 0x4000, 0x10AF, -27, -32
	banim_frame_oam 0x4000, 0x4000, 0x10B3, 5, -32
	banim_frame_oam 0x4000, 0x4000, 0x10B7, 37, -32
	banim_frame_oam 0x0, 0x0, 0x1015, 37, -56
	banim_frame_oam 0x8000, 0x0, 0x10CF, -35, -40
	banim_frame_oam 0x4000, 0x4000, 0x10D4, -3, -24
	banim_frame_oam 0x4000, 0x4000, 0x10F4, 29, -32
	banim_frame_oam 0x4000, 0x0, 0x10D8, 29, -24
	banim_frame_oam 0x4000, 0x0, 0x106B, 53, -24
	banim_frame_oam 0x8000, 0x0, 0x102D, 69, -40
	banim_frame_oam 0x0, 0x0, 0x106D, 69, -24
	banim_frame_end
banim_fifd_hk1_oam_frame_3_r:
	banim_frame_oam 0x4000, 0x0, 0x10CB, -11, 16
	banim_frame_oam 0x0, 0x0, 0x10CD, 5, 16
	banim_frame_oam 0x4000, 0x0, 0x10AB, 13, 16
	banim_frame_oam 0x0, 0x0, 0x10AD, 29, 16
	banim_frame_oam 0x4000, 0x0, 0x108C, 37, 16
	banim_frame_oam 0x4000, 0xC000, 0x1000, -35, -48
	banim_frame_oam 0x0, 0x8000, 0x1008, 29, -48
	banim_frame_oam 0x8000, 0x8000, 0x100C, 61, -48
	banim_frame_oam 0x4000, 0xC000, 0x1081, -27, -16
	banim_frame_oam 0x8000, 0x8000, 0x1089, 37, -16
	banim_frame_oam 0x0, 0x0, 0x108B, 53, -16
	banim_frame_oam 0x0, 0x0, 0x1080, 37, -56
	banim_frame_end
banim_fifd_hk1_oam_frame_4_r:
	banim_frame_oam 0x4000, 0xC000, 0x1000, -36, -48
	banim_frame_oam 0x0, 0x8000, 0x1008, 28, -48
	banim_frame_oam 0x8000, 0x8000, 0x100C, 60, -48
	banim_frame_oam 0x4000, 0x4000, 0x1081, -28, -16
	banim_frame_oam 0x0, 0x0, 0x1085, 4, -16
	banim_frame_oam 0x4000, 0x4000, 0x1013, 12, -16
	banim_frame_oam 0x0, 0x0, 0x1017, 44, -16
	banim_frame_oam 0x4000, 0x8000, 0x102E, -28, -8
	banim_frame_oam 0x4000, 0x8000, 0x1032, 4, -8
	banim_frame_oam 0x0, 0x4000, 0x1036, 36, -8
	banim_frame_oam 0x4000, 0x4000, 0x106E, -28, 8
	banim_frame_oam 0x4000, 0x4000, 0x1072, 4, 8
	banim_frame_oam 0x4000, 0x0, 0x1076, 36, 8
	banim_frame_oam 0x0, 0x0, 0x10EB, 20, 16
	banim_frame_oam 0x0, 0x0, 0x1080, 36, -56
	banim_frame_end
banim_fifd_hk1_oam_frame_5_r:
	banim_frame_oam 0x4000, 0xC000, 0x108E, -33, -43
	banim_frame_oam 0x8000, 0x8000, 0x1096, 31, -43
	banim_frame_oam 0x8000, 0x8000, 0x1098, 47, -43
	banim_frame_oam 0x4000, 0x8000, 0x1038, -25, -11
	banim_frame_oam 0x4000, 0x8000, 0x103C, 7, -11
	banim_frame_oam 0x4000, 0x4000, 0x1078, -25, 5
	banim_frame_oam 0x4000, 0x4000, 0x107C, 7, 5
	banim_frame_oam 0x0, 0x0, 0x101C, -1, 13
	banim_frame_oam 0x8000, 0x0, 0x109F, 39, -11
	banim_frame_oam 0x0, 0x0, 0x10DF, 39, 5
	banim_frame_oam 0x4000, 0x0, 0x101D, 7, 13
	banim_frame_end
banim_fifd_hk1_oam_frame_6_r:
	banim_frame_oam 0x4000, 0xC000, 0x1001, -29, -41
	banim_frame_oam 0x8000, 0x8000, 0x1009, 35, -41
	banim_frame_oam 0x4000, 0x8000, 0x1081, -29, -9
	banim_frame_oam 0x4000, 0x8000, 0x1085, 3, -9
	banim_frame_oam 0x0, 0x4000, 0x1089, 35, -9
	banim_frame_oam 0x4000, 0x4000, 0x10C1, -29, 7
	banim_frame_oam 0x4000, 0x4000, 0x10C5, 3, 7
	banim_frame_oam 0x4000, 0x0, 0xC9, 35, 7
	banim_frame_end
banim_fifd_hk1_oam_frame_7_r:
	banim_frame_oam 0x4000, 0xC000, 0x100B, -27, -40
	banim_frame_oam 0x4000, 0x8000, 0x108B, -27, -8
	banim_frame_oam 0x4000, 0x8000, 0x108F, 5, -8
	banim_frame_end
banim_fifd_hk1_oam_frame_8_r:
	banim_frame_oam 0x4000, 0xC000, 0x1013, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x1093, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x1097, 8, -8
	banim_frame_end
banim_fifd_hk1_oam_frame_9_r:
	banim_frame_oam 0x4000, 0xC000, 0x0, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x80, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x84, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC0, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0xC4, 8, 8
	banim_frame_end
banim_fifd_hk1_oam_frame_10_r:
	banim_frame_oam 0x4000, 0xC000, 0x8, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x88, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x8C, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xC8, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0xCC, 8, 8
	banim_frame_end
banim_fifd_hk1_oam_frame_11_r:
	banim_frame_oam 0x4000, 0xC000, 0x10, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x90, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x94, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD0, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0xD4, 8, 8
	banim_frame_end
banim_fifd_hk1_oam_frame_12_r:
	banim_frame_oam 0x4000, 0xC000, 0x18, -24, -40
	banim_frame_oam 0x4000, 0x8000, 0x98, -24, -8
	banim_frame_oam 0x4000, 0x8000, 0x9C, 8, -8
	banim_frame_oam 0x4000, 0x4000, 0xD8, -24, 8
	banim_frame_oam 0x4000, 0x4000, 0xDC, 8, 8
	banim_frame_end
	.section .data.script
banim_fifd_hk1_script:
banim_fifd_hk1_mode_attack_close:
	banim_code_frame 9, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 1, banim_fifd_hk1_oam_frame_1_r - banim_fifd_hk1_oam_r
	banim_code_frame 2, banim_fifd_hk1_sheet_0, 2, banim_fifd_hk1_oam_frame_2_r - banim_fifd_hk1_oam_r
	banim_code_frame 2, banim_fifd_hk1_sheet_1, 3, banim_fifd_hk1_oam_frame_3_r - banim_fifd_hk1_oam_r
	banim_code_frame 3, banim_fifd_hk1_sheet_1, 4, banim_fifd_hk1_oam_frame_4_r - banim_fifd_hk1_oam_r
	banim_code_frame 3, banim_fifd_hk1_sheet_1, 5, banim_fifd_hk1_oam_frame_5_r - banim_fifd_hk1_oam_r
	banim_code_frame 3, banim_fifd_hk1_sheet_2, 6, banim_fifd_hk1_oam_frame_6_r - banim_fifd_hk1_oam_r
	banim_code_frame 2, banim_fifd_hk1_sheet_2, 7, banim_fifd_hk1_oam_frame_7_r - banim_fifd_hk1_oam_r
	banim_code_frame 2, banim_fifd_hk1_sheet_2, 8, banim_fifd_hk1_oam_frame_8_r - banim_fifd_hk1_oam_r
	banim_code_frame 2, banim_fifd_hk1_sheet_3, 9, banim_fifd_hk1_oam_frame_9_r - banim_fifd_hk1_oam_r
	banim_code_frame 2, banim_fifd_hk1_sheet_3, 10, banim_fifd_hk1_oam_frame_10_r - banim_fifd_hk1_oam_r
	banim_code_frame 2, banim_fifd_hk1_sheet_3, 11, banim_fifd_hk1_oam_frame_11_r - banim_fifd_hk1_oam_r
	banim_code_frame 1, banim_fifd_hk1_sheet_3, 12, banim_fifd_hk1_oam_frame_12_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_attack_close_back:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_attack_close_critical:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_attack_close_critical_back:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_attack_range:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_attack_range_critical:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_dodge_close:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_dodge_range:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_stand_close:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_stand:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_stand_range:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
banim_fifd_hk1_mode_attack_miss:
	banim_code_frame 4, banim_fifd_hk1_sheet_0, 0, banim_fifd_hk1_oam_frame_0_r - banim_fifd_hk1_oam_r
	banim_code_end_mode
	.section .data.modes
	.word banim_fifd_hk1_mode_attack_close - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_attack_close_back - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_attack_close_critical - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_attack_close_critical_back - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_attack_range - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_attack_range_critical - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_dodge_close - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_dodge_range - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_stand_close - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_stand - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_stand_range - banim_fifd_hk1_script
	.word banim_fifd_hk1_mode_attack_miss - banim_fifd_hk1_script
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

