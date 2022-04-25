	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song132_1
song132_1:	@ 0x0857D958
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 36
	.byte	VOL	, v080
	.byte		N14	, En5, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song132
song132:	@ 0x0857D968
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song132_1		@ track
