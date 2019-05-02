@ vim:ft=armv4
	.global banim_prim_ro1_2_script
	.global banim_prim_ro1_2_oam_r
	.global banim_prim_ro1_2_oam_l
	.include "../include/banim_sheet.inc"
    .include "../include/banim_code.inc"
	.include "../include/banim_code_frame.inc"
@ battle animation 0x7E
	.section .data.oam_l
banim_prim_ro1_2_oam_l:
banim_prim_ro1_2_oam_frame_0_l:
	banim_frame_oam 0x8000, 0x9000, 0x0, -5, -16
	banim_frame_oam 0x8000, 0x5000, 0x2, -13, -16
	banim_frame_oam 0x4000, 0x1000, 0x4, -7, -24
	banim_frame_end
banim_prim_ro1_2_oam_frame_1_l:
	banim_frame_oam 0x4000, 0x1000, 0x3, 1, -24
	banim_frame_oam 0x0, 0x1000, 0x5, -7, -24
	banim_frame_oam 0x4000, 0x9000, 0x23, -15, -16
	banim_frame_oam 0x4000, 0x5000, 0x63, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x84, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -15, 8
	banim_frame_end
banim_prim_ro1_2_oam_frame_2_l:
	banim_frame_oam 0x8000, 0x9000, 0x7, -7, -24
	banim_frame_oam 0x8000, 0x5000, 0x29, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x87, -7, 8
	banim_frame_oam 0x8000, 0x5000, 0x3, 9, -27
	banim_frame_oam 0x0, 0x1000, 0x6, -23, -5
	banim_frame_end
banim_prim_ro1_2_oam_frame_3_l:
	banim_frame_oam 0x0, 0x5000, 0xA, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0xC, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x4A, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x4C, -15, 0
	banim_frame_oam 0x0, 0x1000, 0x9, -23, -8
	banim_frame_oam 0x4000, 0x1000, 0x7, -7, -24
	banim_frame_oam 0x8000, 0x5000, 0x3, 9, -27
	banim_frame_oam 0x4000, 0x1000, 0x87, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -15, 8
	banim_frame_end
banim_prim_ro1_2_oam_frame_4_l:
	banim_frame_oam 0x0, 0x5000, 0xD, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0xF, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0x4D, -7, 0
	banim_frame_oam 0x0, 0x1000, 0x4F, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x7, -7, -24
	banim_frame_oam 0x8000, 0x5000, 0x3, 9, -27
	banim_frame_oam 0x4000, 0x1000, 0x87, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -15, 8
	banim_frame_oam 0x0, 0x1000, 0x83, -23, 0
	banim_frame_end
banim_prim_ro1_2_oam_frame_5_l:
	banim_frame_oam 0x0, 0x5000, 0x6A, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x6C, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xAA, -7, 0
	banim_frame_oam 0x0, 0x1000, 0xAC, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x7, -7, -24
	banim_frame_oam 0x8000, 0x5000, 0x3, 9, -27
	banim_frame_oam 0x4000, 0x1000, 0x87, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x89, -15, 8
	banim_frame_end
banim_prim_ro1_2_oam_frame_6_l:
	banim_frame_oam 0x0, 0x5000, 0x6D, -7, -16
	banim_frame_oam 0x8000, 0x1000, 0x6F, -15, -16
	banim_frame_oam 0x4000, 0x1000, 0xAD, -7, 0
	banim_frame_oam 0x0, 0x1000, 0xAF, -15, 0
	banim_frame_oam 0x4000, 0x1000, 0x4, -7, -24
	banim_frame_oam 0x8000, 0x5000, 0x3, 9, -24
	banim_frame_oam 0x4000, 0x1000, 0x84, -7, 8
	banim_frame_oam 0x0, 0x1000, 0x86, -15, 8
	banim_frame_end
banim_prim_ro1_2_oam_frame_8_l:
	banim_frame_oam 0x0, 0x5000, 0xA0, -6, -18
	banim_frame_oam 0x8000, 0x1000, 0xA2, -14, -18
	banim_frame_oam 0x4000, 0x1000, 0xE0, -6, -2
	banim_frame_oam 0x0, 0x1000, 0xE2, -14, -2
	banim_frame_oam 0x4000, 0x1000, 0xA6, -6, 6
	banim_frame_oam 0x0, 0x1000, 0xA8, -14, 6
	banim_frame_oam 0x4000, 0x1000, 0x4, -7, -26
	banim_frame_end
banim_prim_ro1_2_oam_frame_9_l:
	banim_frame_oam 0x0, 0x5000, 0xA3, -5, -19
	banim_frame_oam 0x8000, 0x1000, 0xA5, -13, -19
	banim_frame_oam 0x4000, 0x1000, 0xE3, -5, -3
	banim_frame_oam 0x0, 0x1000, 0xE5, -13, -3
	banim_frame_oam 0x4000, 0x1000, 0xC6, -5, 5
	banim_frame_oam 0x0, 0x1000, 0xC8, -13, 5
	banim_frame_oam 0x4000, 0x1000, 0x4, -8, -27
	banim_frame_end
banim_prim_ro1_2_oam_frame_7_l:
	banim_frame_oam 0x0, 0x1000, 0x1F, -8, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.oam_r
banim_prim_ro1_2_oam_r:
banim_prim_ro1_2_oam_frame_0_r:
	banim_frame_oam 0x8000, 0x8000, 0x0, -11, -16
	banim_frame_oam 0x8000, 0x4000, 0x2, 5, -16
	banim_frame_oam 0x4000, 0x0, 0x4, -9, -24
	banim_frame_end
banim_prim_ro1_2_oam_frame_1_r:
	banim_frame_oam 0x4000, 0x0, 0x3, -17, -24
	banim_frame_oam 0x0, 0x0, 0x5, -1, -24
	banim_frame_oam 0x4000, 0x8000, 0x23, -17, -16
	banim_frame_oam 0x4000, 0x4000, 0x63, -17, 0
	banim_frame_oam 0x4000, 0x0, 0x84, -9, 8
	banim_frame_oam 0x0, 0x0, 0x86, 7, 8
	banim_frame_end
banim_prim_ro1_2_oam_frame_2_r:
	banim_frame_oam 0x8000, 0x8000, 0x7, -9, -24
	banim_frame_oam 0x8000, 0x4000, 0x29, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x87, -9, 8
	banim_frame_oam 0x8000, 0x4000, 0x3, -17, -27
	banim_frame_oam 0x0, 0x0, 0x6, 15, -5
	banim_frame_end
banim_prim_ro1_2_oam_frame_3_r:
	banim_frame_oam 0x0, 0x4000, 0xA, -9, -16
	banim_frame_oam 0x8000, 0x0, 0xC, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x4A, -9, 0
	banim_frame_oam 0x0, 0x0, 0x4C, 7, 0
	banim_frame_oam 0x0, 0x0, 0x9, 15, -8
	banim_frame_oam 0x4000, 0x0, 0x7, -9, -24
	banim_frame_oam 0x8000, 0x4000, 0x3, -17, -27
	banim_frame_oam 0x4000, 0x0, 0x87, -9, 8
	banim_frame_oam 0x0, 0x0, 0x89, 7, 8
	banim_frame_end
banim_prim_ro1_2_oam_frame_4_r:
	banim_frame_oam 0x0, 0x4000, 0xD, -9, -16
	banim_frame_oam 0x8000, 0x0, 0xF, 7, -16
	banim_frame_oam 0x4000, 0x0, 0x4D, -9, 0
	banim_frame_oam 0x0, 0x0, 0x4F, 7, 0
	banim_frame_oam 0x4000, 0x0, 0x7, -9, -24
	banim_frame_oam 0x8000, 0x4000, 0x3, -17, -27
	banim_frame_oam 0x4000, 0x0, 0x87, -9, 8
	banim_frame_oam 0x0, 0x0, 0x89, 7, 8
	banim_frame_oam 0x0, 0x0, 0x83, 15, 0
	banim_frame_end
banim_prim_ro1_2_oam_frame_5_r:
	banim_frame_oam 0x0, 0x4000, 0x6A, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x6C, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xAA, -9, 0
	banim_frame_oam 0x0, 0x0, 0xAC, 7, 0
	banim_frame_oam 0x4000, 0x0, 0x7, -9, -24
	banim_frame_oam 0x8000, 0x4000, 0x3, -17, -27
	banim_frame_oam 0x4000, 0x0, 0x87, -9, 8
	banim_frame_oam 0x0, 0x0, 0x89, 7, 8
	banim_frame_end
banim_prim_ro1_2_oam_frame_6_r:
	banim_frame_oam 0x0, 0x4000, 0x6D, -9, -16
	banim_frame_oam 0x8000, 0x0, 0x6F, 7, -16
	banim_frame_oam 0x4000, 0x0, 0xAD, -9, 0
	banim_frame_oam 0x0, 0x0, 0xAF, 7, 0
	banim_frame_oam 0x4000, 0x0, 0x4, -9, -24
	banim_frame_oam 0x8000, 0x4000, 0x3, -17, -24
	banim_frame_oam 0x4000, 0x0, 0x84, -9, 8
	banim_frame_oam 0x0, 0x0, 0x86, 7, 8
	banim_frame_end
banim_prim_ro1_2_oam_frame_8_r:
	banim_frame_oam 0x0, 0x4000, 0xA0, -10, -18
	banim_frame_oam 0x8000, 0x0, 0xA2, 6, -18
	banim_frame_oam 0x4000, 0x0, 0xE0, -10, -2
	banim_frame_oam 0x0, 0x0, 0xE2, 6, -2
	banim_frame_oam 0x4000, 0x0, 0xA6, -10, 6
	banim_frame_oam 0x0, 0x0, 0xA8, 6, 6
	banim_frame_oam 0x4000, 0x0, 0x4, -9, -26
	banim_frame_end
banim_prim_ro1_2_oam_frame_9_r:
	banim_frame_oam 0x0, 0x4000, 0xA3, -11, -19
	banim_frame_oam 0x8000, 0x0, 0xA5, 5, -19
	banim_frame_oam 0x4000, 0x0, 0xE3, -11, -3
	banim_frame_oam 0x0, 0x0, 0xE5, 5, -3
	banim_frame_oam 0x4000, 0x0, 0xC6, -11, 5
	banim_frame_oam 0x0, 0x0, 0xC8, 5, 5
	banim_frame_oam 0x4000, 0x0, 0x4, -8, -27
	banim_frame_end
banim_prim_ro1_2_oam_frame_7_r:
	banim_frame_oam 0x0, 0x0, 0x1F, 0, -8
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	banim_frame_end
	.section .data.script
banim_prim_ro1_2_script:
banim_prim_ro1_2_mode_attack_close:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_2_oam_frame_1_r - banim_prim_ro1_2_oam_r
	banim_code_frame 6, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_2_oam_frame_2_r - banim_prim_ro1_2_oam_r
	banim_code_frame 5, banim_prim_ro1_sheet_0, 3, banim_prim_ro1_2_oam_frame_3_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 4, banim_prim_ro1_2_oam_frame_4_r - banim_prim_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_prim_ro1_sheet_0, 5, banim_prim_ro1_2_oam_frame_5_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_prim_ro1_sheet_0, 6, banim_prim_ro1_2_oam_frame_6_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_2_mode_attack_close_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_frame 6, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_frame 5, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_2_mode_attack_close_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_2_oam_frame_1_r - banim_prim_ro1_2_oam_r
	banim_code_frame 6, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_2_oam_frame_2_r - banim_prim_ro1_2_oam_r
	banim_code_frame 5, banim_prim_ro1_sheet_0, 3, banim_prim_ro1_2_oam_frame_3_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 4, banim_prim_ro1_2_oam_frame_4_r - banim_prim_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_prim_ro1_sheet_0, 5, banim_prim_ro1_2_oam_frame_5_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_prim_ro1_sheet_0, 6, banim_prim_ro1_2_oam_frame_6_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_2_mode_attack_close_critical_back:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_frame 6, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_frame 5, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_prim_ro1_sheet_0, 9, banim_prim_ro1_2_oam_frame_7_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_2_mode_attack_range:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_2_oam_frame_1_r - banim_prim_ro1_2_oam_r
	banim_code_frame 6, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_2_oam_frame_2_r - banim_prim_ro1_2_oam_r
	banim_code_frame 5, banim_prim_ro1_sheet_0, 3, banim_prim_ro1_2_oam_frame_3_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 4, banim_prim_ro1_2_oam_frame_4_r - banim_prim_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_prim_ro1_sheet_0, 5, banim_prim_ro1_2_oam_frame_5_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_prim_ro1_sheet_0, 6, banim_prim_ro1_2_oam_frame_6_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_2_mode_attack_range_critical:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_2_oam_frame_1_r - banim_prim_ro1_2_oam_r
	banim_code_frame 6, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_2_oam_frame_2_r - banim_prim_ro1_2_oam_r
	banim_code_frame 5, banim_prim_ro1_sheet_0, 3, banim_prim_ro1_2_oam_frame_3_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 4, banim_prim_ro1_2_oam_frame_4_r - banim_prim_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_prim_ro1_sheet_0, 5, banim_prim_ro1_2_oam_frame_5_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_prim_ro1_sheet_0, 6, banim_prim_ro1_2_oam_frame_6_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_2_mode_dodge_close:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 7, banim_prim_ro1_2_oam_frame_8_r - banim_prim_ro1_2_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 8, banim_prim_ro1_2_oam_frame_9_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 7, banim_prim_ro1_2_oam_frame_8_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_2_mode_dodge_range:
	banim_code_dodge_to_back
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_start_dodge
	banim_code_frame 3, banim_prim_ro1_sheet_0, 7, banim_prim_ro1_2_oam_frame_8_r - banim_prim_ro1_2_oam_r
	banim_code_frame 1, banim_prim_ro1_sheet_0, 8, banim_prim_ro1_2_oam_frame_9_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 3, banim_prim_ro1_sheet_0, 7, banim_prim_ro1_2_oam_frame_8_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
banim_prim_ro1_2_mode_stand_close:
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_prim_ro1_2_mode_stand:
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_prim_ro1_2_mode_stand_range:
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_end_mode
banim_prim_ro1_2_mode_attack_miss:
	banim_code_start_attack_1
	banim_code_start_attack_2
	banim_code_frame 1, banim_prim_ro1_sheet_0, 0, banim_prim_ro1_2_oam_frame_0_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 1, banim_prim_ro1_2_oam_frame_1_r - banim_prim_ro1_2_oam_r
	banim_code_frame 6, banim_prim_ro1_sheet_0, 2, banim_prim_ro1_2_oam_frame_2_r - banim_prim_ro1_2_oam_r
	banim_code_frame 5, banim_prim_ro1_sheet_0, 3, banim_prim_ro1_2_oam_frame_3_r - banim_prim_ro1_2_oam_r
	banim_code_frame 4, banim_prim_ro1_sheet_0, 4, banim_prim_ro1_2_oam_frame_4_r - banim_prim_ro1_2_oam_r
	banim_code_call_spell_anim
	banim_code_frame 1, banim_prim_ro1_sheet_0, 5, banim_prim_ro1_2_oam_frame_5_r - banim_prim_ro1_2_oam_r
	banim_code_wait_hp_deplete
	banim_code_frame 4, banim_prim_ro1_sheet_0, 6, banim_prim_ro1_2_oam_frame_6_r - banim_prim_ro1_2_oam_r
	banim_code_end_dodge
	banim_code_end_mode
	.section .data.modes
	.word banim_prim_ro1_2_mode_attack_close - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_attack_close_back - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_attack_close_critical - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_attack_close_critical_back - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_attack_range - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_attack_range_critical - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_dodge_close - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_dodge_range - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_stand_close - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_stand - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_stand_range - banim_prim_ro1_2_script
	.word banim_prim_ro1_2_mode_attack_miss - banim_prim_ro1_2_script
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

