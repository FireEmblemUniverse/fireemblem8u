	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup088
voicegroup088:	@ 0x08223E44
	voice_directsound 60, 0, DirectSoundData_y_se_wind_3_e3_13k8b, 255, 0, 255, 0	@08223E44
	voice_directsound 60, 0, DirectSoundData_y_bird_1_13k8b, 255, 0, 255, 0	@08223E50
	voice_directsound 60, 0, DirectSoundData_y_bird_2_13k8b, 255, 0, 255, 0	@08223E5C
	voice_directsound 60, 0, DirectSoundData_y_bird_3_13k8b, 255, 0, 255, 0	@08223E68
