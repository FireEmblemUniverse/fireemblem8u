	.include "asm/macros/music_voice.inc"

	.section .rodata

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup010
voicegroup010:	@ 0x0820ACF8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820ACF8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD04
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD10
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD1C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD28
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD34
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD40
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD4C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD58
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD64
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD70
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD7C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD88
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AD94
	voice_directsound 60, 0, DirectSoundData_k_tubular_c4_13k_s, 255, 252, 0, 165	@0820ADA0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820ADAC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820ADB8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820ADC4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820ADD0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820ADDC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820ADE8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820ADF4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE00
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE0C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE18
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE24
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE30
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE3C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE48
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE54
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE60
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE6C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE78
	voice_directsound 60, 0, DirectSoundData_k_finbass2_c3_13k_s, 255, 0, 255, 178	@0820AE84
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE90
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AE9C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AEA8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AEB4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AEC0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AECC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AED8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AEE4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AEF0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AEFC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AF08
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AF14
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AF20
	voice_directsound 60, 0, DirectSoundData_k_timpani3_g3_13k_s, 255, 250, 0, 204	@0820AF2C
	voice_directsound 60, 0, DirectSoundData_k_strings_13k_c5, 51, 165, 255, 165	@0820AF38
	voice_directsound 60, 0, DirectSoundData_k_strings5_c3_13k, 51, 165, 255, 165	@0820AF44
	voice_directsound 60, 0, DirectSoundData_k_strings_13k_c4, 51, 165, 255, 165	@0820AF50
	voice_directsound 60, 0, DirectSoundData_k_synstrings1_c4_13k, 255, 0, 255, 178	@0820AF5C
	voice_directsound 60, 0, DirectSoundData_k_strings5_c5c4_13k, 255, 0, 255, 165	@0820AF68
	voice_directsound 60, 0, DirectSoundData_k_strings5_c5_13k, 51, 165, 255, 165	@0820AF74
	voice_directsound 60, 0, DirectSoundData_k_voice1_c4_13k_ss, 255, 0, 255, 178	@0820AF80
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AF8C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AF98
	voice_directsound 60, 0, DirectSoundData_k_brass3_c3_13k, 255, 0, 255, 165	@0820AFA4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AFB0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AFBC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AFC8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AFD4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AFE0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AFEC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820AFF8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B004
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B010
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B01C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B028
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B034
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B040
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B04C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B058
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B064
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B070
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B07C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B088
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B094
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B0A0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B0AC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B0B8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B0C4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B0D0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B0DC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B0E8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B0F4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B100
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B10C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B118
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B124
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B130
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B13C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B148
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B154
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B160
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B16C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B178
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B184
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B190
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B19C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B1A8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B1B4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B1C0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B1CC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B1D8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B1E4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B1F0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B1FC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B208
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B214
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B220
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B22C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B238
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B244
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B250
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B25C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B268
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B274
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B280
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B28C
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B298
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B2A4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B2B0
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B2BC
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B2C8
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B2D4
	voice_square_1 0, 2, 0, 0, 15, 0	@0820B2E0
	voice_keysplit_all voicegroup083	@0820B2EC
