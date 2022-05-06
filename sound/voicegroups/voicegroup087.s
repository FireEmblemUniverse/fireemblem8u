	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup087
voicegroup087:	@ 0x08223E38
	voice_directsound 60, 0, DirectSoundData_y_se_wind_3_e3_13k8b, 255, 0, 255, 0	@08223E38
