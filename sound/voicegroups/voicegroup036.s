	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup036
voicegroup036:	@ 0x08213170
	voice_square_1 0, 2, 0, 0, 15, 0	@08213170
	voice_square_1 0, 2, 0, 0, 15, 0	@0821317C
	voice_square_1 0, 2, 0, 0, 15, 0	@08213188
	voice_square_1 0, 2, 0, 0, 15, 0	@08213194
	voice_square_1 0, 2, 0, 0, 15, 0	@082131A0
	voice_square_1 0, 2, 0, 0, 15, 0	@082131AC
	voice_square_1 0, 2, 0, 0, 15, 0	@082131B8
	voice_square_1 0, 2, 0, 0, 15, 0	@082131C4
	voice_square_1 0, 2, 0, 0, 15, 0	@082131D0
	voice_square_1 0, 2, 0, 0, 15, 0	@082131DC
	voice_directsound 60, 0, DirectSoundData_h_shine_10k8b_l1, 255, 0, 255, 0	@082131E8
	voice_directsound 60, 0, DirectSoundData_h_luna_bf_01_13k8b, 255, 0, 255, 0	@082131F4
	voice_directsound 60, 0, DirectSoundData_h_luna_af_01_13_10k8b_l1, 255, 0, 255, 0	@08213200
	voice_directsound 60, 0, DirectSoundData_h_excb1_08_04_10k8b, 255, 0, 255, 0	@0821320C
	voice_directsound 60, 0, DirectSoundData_h_excb2_19_02_10k8b, 255, 0, 255, 0	@08213218
	voice_directsound 60, 0, DirectSoundData_h_oura1_03_03_10k8b, 255, 0, 255, 0	@08213224
	voice_directsound 60, 0, DirectSoundData_h_oura2_03_03_10k8b, 255, 0, 255, 0	@08213230
	voice_directsound 60, 0, DirectSoundData_h_oura3_07_02_10k8b, 255, 0, 255, 0	@0821323C
	voice_square_1 0, 2, 0, 0, 15, 0	@08213248
	voice_square_1 0, 2, 0, 0, 15, 0	@08213254
	voice_square_1 0, 2, 0, 0, 15, 0	@08213260
	voice_directsound 60, 0, DirectSoundData_eclipse1a_e_10k8b, 255, 0, 255, 0	@0821326C
	voice_directsound 60, 0, DirectSoundData_h_ges2_03_05_10k8b, 255, 0, 255, 0	@08213278
	voice_directsound 60, 0, DirectSoundData_h_ges3_03_03_10k8b, 255, 0, 255, 0	@08213284
	voice_square_1 0, 2, 0, 0, 15, 0	@08213290
	voice_square_1 0, 2, 0, 0, 15, 0	@0821329C
	voice_directsound 60, 0, DirectSoundData_h_live05_02_13k8b, 255, 0, 255, 0	@082132A8
	voice_directsound_no_resample 60, 0, DirectSoundData_h_levup05_03_13k8b, 255, 0, 255, 0	@082132B4
	voice_directsound 60, 0, DirectSoundData_h_nodamage02_13k8b, 255, 0, 255, 204	@082132C0
	voice_square_2 1, 0, 1, 0, 2	@082132CC
	voice_directsound 60, 0, DirectSoundData_h_sword_kaesu_01_13k8b, 255, 0, 255, 0	@082132D8
	voice_square_1 0, 3, 0, 3, 0, 0	@082132E4
	voice_square_1 0, 2, 0, 0, 15, 0	@082132F0
	voice_noise 60, 0, 0, 0, 0, 2, 0, 0	@082132FC
	voice_directsound 60, 0, DirectSoundData_h_hector_axe01_13k8b, 255, 0, 255, 0	@08213308
	voice_directsound 60, 0, DirectSoundData_op_kiran1_e4_13k8b, 255, 0, 255, 0	@08213314
	voice_square_1 0, 2, 0, 0, 15, 0	@08213320
	voice_square_1 0, 2, 0, 0, 15, 0	@0821332C
	voice_square_1 0, 2, 0, 0, 15, 0	@08213338
	voice_square_1 0, 2, 0, 0, 15, 0	@08213344
	voice_directsound_no_resample 60, 0, DirectSoundData_h_bridge_02_02_13k8b, 255, 0, 255, 0	@08213350
	voice_directsound_no_resample 60, 0, DirectSoundData_h_kekkai_02_13k8b, 255, 0, 255, 0	@0821335C
	voice_directsound_no_resample 60, 0, DirectSoundData_h_taoreru_05_13k8b, 255, 0, 255, 0	@08213368
	voice_directsound_no_resample 60, 0, DirectSoundData_h_sword_nuku_02_13k8b, 255, 0, 255, 0	@08213374
	voice_square_1 0, 2, 0, 0, 15, 0	@08213380
	voice_square_1 0, 2, 0, 0, 15, 0	@0821338C
	voice_directsound_no_resample 60, 0, DirectSoundData_h_monm_kiran_13k8b, 255, 0, 255, 0	@08213398
	voice_square_1 0, 2, 0, 0, 15, 0	@082133A4
	voice_square_1 0, 2, 0, 0, 15, 0	@082133B0
	voice_noise 60, 0, 0, 0, 0, 3, 0, 0	@082133BC
	voice_directsound 60, 0, DirectSoundData_h_hector_axe01_13k8b, 255, 0, 255, 0	@082133C8
	voice_directsound 60, 0, DirectSoundData_h_mysty7_p16l_10k8b, 255, 0, 255, 0	@082133D4
	voice_directsound 60, 0, DirectSoundData_elec1_e2_13k8b, 255, 0, 255, 89	@082133E0
	voice_directsound 60, 0, DirectSoundData_h_sdruid_01_02_13k8b, 255, 0, 255, 89	@082133EC
	voice_square_1 0, 2, 0, 0, 15, 0	@082133F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08213404
	voice_square_1 0, 2, 0, 0, 15, 0	@08213410
	voice_square_1 0, 2, 0, 0, 15, 0	@0821341C
	voice_square_2 0, 0, 1, 0, 0	@08213428
	voice_noise 60, 0, 0, 0, 1, 0, 0, 2	@08213434
	voice_noise 60, 0, 0, 0, 1, 0, 0, 1	@08213440
	voice_noise 60, 0, 0, 0, 0, 0, 0, 1	@0821344C
	voice_square_1 0, 2, 0, 0, 15, 0	@08213458
	voice_directsound 60, 0, DirectSoundData_h_whiteout_01_13k8b, 255, 0, 255, 231	@08213464
	voice_directsound 60, 0, DirectSoundData_nosferatu1a_el_10k8b, 26, 0, 255, 216	@08213470
	voice_square_1 0, 2, 7, 7, 0, 7	@0821347C
	voice_directsound 60, 0, DirectSoundData_rest2_e1l_p18_10k8b, 11, 0, 255, 204	@08213488
	voice_directsound 60, 0, DirectSoundData_mshield3_e_13k8b, 11, 0, 255, 204	@08213494
	voice_square_1 0, 2, 0, 0, 15, 0	@082134A0
	voice_directsound 60, 0, DirectSoundData_dragon_scream3_e6_10k8b, 255, 0, 255, 0	@082134AC
	voice_directsound 60, 0, DirectSoundData_dragon_scream1_e4_10k8b, 255, 0, 255, 0	@082134B8
	voice_noise 60, 0, 0, 0, 0, 0, 15, 0	@082134C4
	voice_directsound 60, 0, DirectSoundData_lfire2_e1_10k8b, 255, 0, 255, 0	@082134D0
	voice_directsound 60, 0, DirectSoundData_hu1_f1_stone1_m1_13k8b, 255, 0, 255, 0	@082134DC
	voice_directsound 60, 0, DirectSoundData_furu1_e_13k8b, 255, 0, 255, 0	@082134E8
	voice_directsound 60, 0, DirectSoundData_furu2_e1_13k8b, 255, 0, 255, 0	@082134F4
	voice_directsound 60, 0, DirectSoundData_nosferatu1a_el_10k8b, 255, 0, 255, 204	@08213500
	voice_directsound_no_resample 60, 0, DirectSoundData_h_bmp_bomb_fall_02_13k8b, 255, 0, 255, 0	@0821350C
	voice_directsound 60, 0, DirectSoundData_ice5_e_p26_13k8b, 255, 0, 255, 0	@08213518
