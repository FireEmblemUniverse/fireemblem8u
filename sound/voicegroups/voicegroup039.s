	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup039
voicegroup039:	@ 0x08213B84
	voice_directsound 60, 0, DirectSoundData_mon_zom_hand_up1_13k, 255, 0, 255, 0	@08213B84
	voice_directsound 60, 0, DirectSoundData_mon_zom_hand_down1_13k, 255, 0, 255, 0	@08213B90
	voice_directsound 60, 0, DirectSoundData_mon_zom_move_grass1_13k, 255, 0, 255, 0	@08213B9C
	voice_directsound 60, 0, DirectSoundData_mon_zom_move_water1_13k, 255, 0, 255, 0	@08213BA8
	voice_directsound 60, 0, DirectSoundData_mon_zom_move_dart1_13k, 255, 0, 255, 0	@08213BB4
	voice_directsound 60, 0, DirectSoundData_mon_zom_move_brid1_13k, 255, 0, 255, 0	@08213BC0
	voice_directsound 60, 0, DirectSoundData_mon_zom_move_ston1_13k, 255, 0, 255, 0	@08213BCC
	voice_directsound 60, 0, DirectSoundData_mon_sks_move_grass1_13k, 255, 0, 255, 0	@08213BD8
	voice_directsound 60, 0, DirectSoundData_mon_sks_move_water1_13k, 255, 0, 255, 0	@08213BE4
	voice_directsound 60, 0, DirectSoundData_mon_sks_move_dart1_13k, 255, 0, 255, 0	@08213BF0
	voice_directsound 60, 0, DirectSoundData_mon_sks_move_brid1_13k, 255, 0, 255, 0	@08213BFC
	voice_directsound 60, 0, DirectSoundData_mon_sks_move_ston1_13k, 255, 0, 255, 0	@08213C08
