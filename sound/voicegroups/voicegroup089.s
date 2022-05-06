	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup089
voicegroup089:	@ 0x08223E74
	voice_directsound 60, 0, DirectSoundData_y_yougan_1_e_13k8b, 255, 0, 255, 0	@08223E74
	voice_directsound 60, 0, DirectSoundData_y_hibashira_1_13k8b, 255, 0, 255, 0	@08223E80
