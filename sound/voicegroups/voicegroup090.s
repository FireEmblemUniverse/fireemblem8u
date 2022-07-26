	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup090
voicegroup090:	@ 0x08223E8C
	voice_directsound 60, 0, DirectSoundData_y_yoru_1_13k8b, 255, 0, 255, 0	@08223E8C
	voice_directsound 60, 0, DirectSoundData_y_yoru_2_13k8b, 255, 0, 255, 0	@08223E98
	voice_directsound 60, 0, DirectSoundData_y_yoru_3_13k8b, 255, 0, 255, 0	@08223EA4
