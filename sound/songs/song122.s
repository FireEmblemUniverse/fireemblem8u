	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song122_1
song122_1:	@ 0x0857D6B0
	.byte	VOL	, v030
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 39
	.byte		N02	, En4, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song122
song122:	@ 0x0857D6C0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song122_1		@ track
