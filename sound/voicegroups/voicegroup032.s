	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup032
voicegroup032:	@ 0x0821200C
	voice_directsound 60, 0, DirectSoundData_furu1_e_13k8b, 255, 0, 255, 0	@0821200C
	voice_directsound 60, 0, DirectSoundData_furu2_e1_13k8b, 255, 0, 255, 0	@08212018
	voice_directsound 60, 0, DirectSoundData_lance1_e1_13k8b, 255, 0, 255, 0	@08212024
	voice_directsound 60, 0, DirectSoundData_senko3_e4_10k8b, 255, 0, 255, 0	@08212030
	voice_noise 60, 0, 0, 1, 0, 1, 0, 0	@0821203C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212048
	voice_directsound 60, 0, DirectSoundData_axe2_e2_13k8b, 255, 0, 255, 0	@08212054
	voice_directsound 60, 0, DirectSoundData_furu4_e3_13k8b, 255, 0, 255, 0	@08212060
	voice_directsound 60, 0, DirectSoundData_ken_osameru2_e2_13k8b, 255, 0, 255, 0	@0821206C
	voice_directsound 60, 0, DirectSoundData_ken_osameru4_e2_13k8b, 255, 0, 255, 0	@08212078
	voice_directsound 60, 0, DirectSoundData_arrow1_e1_13k8b, 255, 0, 255, 0	@08212084
	voice_directsound 60, 0, DirectSoundData_bow1_e1_10k8b, 255, 0, 255, 0	@08212090
	voice_square_1 0, 2, 0, 0, 15, 0	@0821209C
	voice_directsound 60, 0, DirectSoundData_shooter_fire2_e2_10k8b, 255, 0, 255, 0	@082120A8
	voice_directsound 60, 0, DirectSoundData_furu1b_e5_13k8b, 255, 0, 255, 0	@082120B4
	voice_directsound 60, 0, DirectSoundData_furu2b_e6_13k8b, 255, 0, 255, 0	@082120C0
	voice_square_1 0, 2, 0, 0, 15, 0	@082120CC
	voice_square_1 0, 2, 0, 0, 15, 0	@082120D8
	voice_square_1 0, 2, 0, 0, 15, 0	@082120E4
	voice_square_1 0, 2, 0, 0, 15, 0	@082120F0
	voice_directsound 60, 0, DirectSoundData_dragon_in1b_e3_10k8b, 255, 0, 255, 0	@082120FC
	voice_directsound 60, 0, DirectSoundData_dragon_out1b_e3_10k8b, 255, 0, 255, 0	@08212108
	voice_noise 60, 0, 0, 0, 0, 0, 15, 0	@08212114
	voice_directsound 60, 0, DirectSoundData_elec1_e2_13k8b, 255, 0, 255, 89	@08212120
	voice_square_1 0, 2, 0, 0, 15, 0	@0821212C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212138
	voice_directsound 60, 0, DirectSoundData_miss1_m1_e3_10k8b, 255, 0, 255, 0	@08212144
	voice_directsound 60, 0, DirectSoundData_bow2_e2_10k8b, 255, 0, 255, 0	@08212150
	voice_directsound 60, 0, DirectSoundData_hyuun1_e3l_13k8b, 255, 0, 255, 0	@0821215C
	voice_directsound 60, 0, DirectSoundData_triangle1_e_10k8b, 255, 0, 255, 0	@08212168
	voice_square_1 0, 2, 0, 0, 15, 0	@08212174
	voice_square_1 0, 2, 0, 0, 15, 0	@08212180
	voice_directsound 60, 0, DirectSoundData_recover_efx2_m1_e4_13k8b, 255, 0, 255, 0	@0821218C
	voice_directsound 60, 0, DirectSoundData_m_dragon_out1_e_10k8b, 255, 0, 255, 0	@08212198
	voice_square_1 0, 2, 0, 0, 15, 0	@082121A4
	voice_square_1 0, 2, 0, 0, 15, 0	@082121B0
	voice_square_1 0, 2, 0, 0, 15, 0	@082121BC
	voice_square_1 0, 2, 0, 0, 15, 0	@082121C8
	voice_square_1 0, 2, 0, 0, 15, 0	@082121D4
	voice_square_1 0, 2, 0, 0, 15, 0	@082121E0
	voice_square_1 0, 2, 0, 0, 15, 0	@082121EC
	voice_square_1 0, 2, 0, 0, 15, 0	@082121F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08212204
	voice_square_1 0, 2, 0, 0, 15, 0	@08212210
	voice_square_1 0, 2, 0, 0, 15, 0	@0821221C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212228
	voice_square_1 0, 2, 0, 0, 15, 0	@08212234
	voice_square_1 0, 2, 0, 0, 15, 0	@08212240
	voice_square_1 0, 2, 0, 0, 15, 0	@0821224C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212258
	voice_square_1 0, 2, 0, 0, 15, 0	@08212264
	voice_square_1 0, 2, 0, 0, 15, 0	@08212270
	voice_square_1 0, 2, 0, 0, 15, 0	@0821227C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212288
	voice_square_1 0, 2, 0, 0, 15, 0	@08212294
	voice_square_1 0, 2, 0, 0, 15, 0	@082122A0
	voice_square_1 0, 2, 0, 0, 15, 0	@082122AC
	voice_square_1 0, 2, 0, 0, 15, 0	@082122B8
	voice_square_1 0, 2, 0, 0, 15, 0	@082122C4
	voice_square_1 0, 2, 0, 0, 15, 0	@082122D0
	voice_square_1 0, 2, 0, 0, 15, 0	@082122DC
	voice_square_1 0, 2, 0, 0, 15, 0	@082122E8
	voice_square_1 0, 2, 0, 0, 15, 0	@082122F4
	voice_square_1 0, 2, 0, 0, 15, 0	@08212300
	voice_square_1 0, 2, 0, 0, 15, 0	@0821230C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212318
	voice_square_1 0, 2, 0, 0, 15, 0	@08212324
	voice_square_1 0, 2, 0, 0, 15, 0	@08212330
	voice_square_1 0, 2, 0, 0, 15, 0	@0821233C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212348
	voice_square_1 0, 2, 0, 0, 15, 0	@08212354
	voice_square_1 0, 2, 0, 0, 15, 0	@08212360
	voice_square_1 0, 2, 0, 0, 15, 0	@0821236C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212378
	voice_square_1 0, 2, 0, 0, 15, 0	@08212384
	voice_square_1 0, 2, 0, 0, 15, 0	@08212390
	voice_square_1 0, 2, 0, 0, 15, 0	@0821239C
	voice_square_1 0, 2, 0, 0, 15, 0	@082123A8
	voice_square_1 0, 2, 0, 0, 15, 0	@082123B4
	voice_square_1 0, 2, 0, 0, 15, 0	@082123C0
	voice_square_1 0, 2, 0, 0, 15, 0	@082123CC
	voice_square_1 0, 2, 0, 0, 15, 0	@082123D8
	voice_square_1 0, 2, 0, 0, 15, 0	@082123E4
	voice_square_1 0, 2, 0, 0, 15, 0	@082123F0
	voice_square_1 0, 2, 0, 0, 15, 0	@082123FC
	voice_square_1 0, 2, 0, 0, 15, 0	@08212408
	voice_square_1 0, 2, 0, 0, 15, 0	@08212414
	voice_square_1 0, 2, 0, 0, 15, 0	@08212420
	voice_square_1 0, 2, 0, 0, 15, 0	@0821242C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212438
	voice_directsound 60, 0, DirectSoundData_dragon_scream1_e4_10k8b, 255, 0, 255, 0	@08212444
	voice_directsound 60, 0, DirectSoundData_scream1c_m_e2_10k8b, 255, 0, 255, 0	@08212450
	voice_square_1 0, 2, 0, 0, 15, 0	@0821245C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212468
	voice_square_1 0, 2, 0, 0, 15, 0	@08212474
	voice_square_1 0, 2, 0, 0, 15, 0	@08212480
	voice_directsound 60, 0, DirectSoundData_dragon_scream3_e6_10k8b, 255, 0, 255, 0	@0821248C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212498
	voice_square_1 0, 2, 0, 0, 15, 0	@082124A4
	voice_square_1 0, 2, 0, 0, 15, 0	@082124B0
	voice_square_1 0, 2, 0, 0, 15, 0	@082124BC
	voice_square_1 0, 2, 0, 0, 15, 0	@082124C8
	voice_square_1 0, 2, 0, 0, 15, 0	@082124D4
	voice_directsound 60, 0, DirectSoundData_fade_die_away1_e5_13k8b, 255, 0, 255, 0	@082124E0
	voice_square_1 0, 2, 0, 0, 15, 0	@082124EC
	voice_square_1 0, 2, 0, 0, 15, 0	@082124F8
	voice_square_1 0, 2, 0, 0, 15, 0	@08212504
	voice_square_1 0, 2, 0, 0, 15, 0	@08212510
	voice_square_1 0, 2, 0, 0, 15, 0	@0821251C
	voice_square_1 0, 2, 0, 0, 15, 0	@08212528
	voice_directsound 60, 0, DirectSoundData_damage_ud1_e3_13k8b, 255, 0, 255, 0	@08212534
	voice_directsound 60, 0, DirectSoundData_damage_du1_e4_13k8b, 255, 0, 255, 0	@08212540
	voice_directsound 60, 0, DirectSoundData_damage_tuki2_e3_13k8b, 255, 0, 255, 0	@0821254C
	voice_directsound 60, 0, DirectSoundData_damage_last1_e3_13k8b, 255, 0, 255, 0	@08212558
