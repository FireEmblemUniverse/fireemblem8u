	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song131_1
song131_1:	@ 0x0857D928
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 35
	.byte	VOL	, v064
	.byte		N48	, Cs3, v127
	.byte	W05
	.byte	VOL	, v065
	.byte	W03
	.byte		v066
	.byte	W04
	.byte		v068
	.byte	W04
	.byte		v072
	.byte	W04
	.byte		v077
	.byte	W04
	.byte		v082
	.byte	W04
	.byte		v089
	.byte	W04
	.byte		v097
	.byte	W04
	.byte		v106
	.byte	W04
	.byte		v116
	.byte	W04
	.byte		v127
	.byte	W04
	.byte	FINE

	.align 2
	.global song131
song131:	@ 0x0857D94C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song131_1		@ track
