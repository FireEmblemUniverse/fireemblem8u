	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song707_1
song707_1:	@ 0x08582AB0
	.byte	TEMPO	, 75
	.byte	VOL	, v115
	.byte	VOICE	, 17
	.byte	KEYSH	, 0
	.byte		TIE	, Cn3, v127
	.byte	W96
	.byte	W60
	.byte		EOT	, Cn3
	.byte	FINE

	.align 2
	.global song707
song707:	@ 0x08582AC0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song707_1		@ track
