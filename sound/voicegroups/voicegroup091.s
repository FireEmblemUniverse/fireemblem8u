	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup091
voicegroup091:	@ 0x08223EB0
	voice_directsound 60, 0, DirectSoundData_y_boat_2_13k8b, 255, 0, 255, 0	@08223EB0
	voice_directsound 60, 0, DirectSoundData_y_sail_1_13k8b, 255, 0, 255, 0	@08223EBC
	voice_directsound 60, 0, DirectSoundData_y_sail_2_13k8b, 255, 0, 255, 0	@08223EC8
