@ vim:ft=armv4
	.global banim_genm_al1_4_script
	.global banim_genm_al1_4_oam_r
	.global banim_genm_al1_4_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x47
	.section .data.oam_l
banim_genm_al1_4_oam_l:
banim_genm_al1_4_oam_frame_0_l:
	banim_frame_oam 0x8000, 0xD000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x9000, 0x4, -32, -36
	banim_frame_oam 0x8000, 0x9000, 0x84, -32, -4
	banim_frame_oam 0x8000, 0x1000, 0xA, 0, -12
	banim_frame_end
banim_genm_al1_4_oam_frame_1_l:
	banim_frame_oam 0x0, 0x9000, 0x50, -12, -33
	banim_frame_oam 0x8000, 0x9000, 0x54, -28, -33
	banim_frame_oam 0x4000, 0x9000, 0xD0, -12, -1
	banim_frame_oam 0x0, 0x5000, 0xD4, -28, -1
	banim_frame_end
banim_genm_al1_4_oam_frame_2_l:
	banim_frame_oam 0x0, 0x9000, 0x56, -12, -33
	banim_frame_oam 0x8000, 0x9000, 0x5A, -28, -33
	banim_frame_oam 0x4000, 0x9000, 0xD6, -12, -1
	banim_frame_oam 0x0, 0x5000, 0xDA, -28, -1
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_genm_al1_4_oam_r:
banim_genm_al1_4_oam_frame_0_r:
	banim_frame_oam 0x8000, 0xC000, 0x0, -16, -36
	banim_frame_oam 0x8000, 0x8000, 0x4, 16, -36
	banim_frame_oam 0x8000, 0x8000, 0x84, 16, -4
	banim_frame_oam 0x8000, 0x0, 0xA, -8, -12
	banim_frame_end
banim_genm_al1_4_oam_frame_1_r:
	banim_frame_oam 0x0, 0x8000, 0x50, -20, -33
	banim_frame_oam 0x8000, 0x8000, 0x54, 12, -33
	banim_frame_oam 0x4000, 0x8000, 0xD0, -20, -1
	banim_frame_oam 0x0, 0x4000, 0xD4, 12, -1
	banim_frame_end
banim_genm_al1_4_oam_frame_2_r:
	banim_frame_oam 0x0, 0x8000, 0x56, -20, -33
	banim_frame_oam 0x8000, 0x8000, 0x5A, 12, -33
	banim_frame_oam 0x4000, 0x8000, 0xD6, -20, -1
	banim_frame_oam 0x0, 0x4000, 0xDA, 12, -1
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
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
banim_genm_al1_4_script:
banim_genm_al1_4_mode_attack_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_4_mode_attack_close_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_4_mode_attack_close_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_4_mode_attack_close_critical_back:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_4_mode_attack_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_4_mode_attack_range_critical:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_4_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_4_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_sound_armor_leap
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_sound_armor_leap
	banim_code_end_dodge
	banim_code_end_mode
banim_genm_al1_4_mode_stand_close:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_4_mode_stand:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_4_mode_stand_range:
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_genm_al1_4_mode_attack_miss:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_genm_al1_sheet_0, 0, banim_genm_al1_4_oam_frame_0_r - banim_genm_al1_4_oam_r
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_frame 1, banim_genm_al1_sheet_3, 2, banim_genm_al1_4_oam_frame_2_r - banim_genm_al1_4_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_genm_al1_sheet_3, 1, banim_genm_al1_4_oam_frame_1_r - banim_genm_al1_4_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_genm_al1_4_mode_attack_close - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_attack_close_back - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_attack_close_critical - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_attack_close_critical_back - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_attack_range - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_attack_range_critical - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_dodge_close - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_dodge_range - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_stand_close - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_stand - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_stand_range - banim_genm_al1_4_script
	.word banim_genm_al1_4_mode_attack_miss - banim_genm_al1_4_script
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

