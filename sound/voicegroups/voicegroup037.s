	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup037
voicegroup037:	@ 0x08213524
	voice_directsound 60, 0, DirectSoundData_mon_zombie1_e2_p26_13k8b, 255, 0, 255, 0	@08213524
	voice_directsound 60, 0, DirectSoundData_mon_bone1_e2_p36_13k8b, 255, 0, 255, 0	@08213530
	voice_directsound 60, 0, DirectSoundData_biguru_step_29_e3_13k8b, 255, 0, 255, 0	@0821353C
	voice_directsound 60, 0, DirectSoundData_bmap_shooter_move1_13k, 22, 0, 255, 210	@08213548
	voice_square_1 0, 2, 0, 0, 15, 0	@08213554
	voice_directsound 60, 0, DirectSoundData_h_hector_axe01_13k8b, 255, 188, 0, 0	@08213560
	voice_directsound 60, 0, DirectSoundData_mon_sks_critical1_13k, 255, 0, 255, 0	@0821356C
	voice_directsound 60, 0, DirectSoundData_elec1_e2_13k8b, 255, 0, 255, 89	@08213578
