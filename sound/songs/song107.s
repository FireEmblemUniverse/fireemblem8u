	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song107_1
song107_1:	@ 0x0857D188
	.byte	VOL	, v055
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 4
	.byte	PRIO	, 10
	.byte		N04	, Fn5, v127
	.byte	W04
	.byte		N03	, Fn5, v080
	.byte	W03
	.byte			Fn5, v060
	.byte	W03
	.byte			Fn5, v052
	.byte	W03
	.byte			Fn5, v040
	.byte	W03
	.byte	PRIO	, 0
	.byte			Fn5, v032
	.byte	W03
	.byte			Fn5, v020
	.byte	W05
	.byte	FINE

	.align 2
	.global song107
song107:	@ 0x0857D1AC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	31		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song107_1		@ track
