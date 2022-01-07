	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song736_1
song736_1:	@ 0x08583250
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 49
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte		N12	, Fn2, v112
	.byte	W12
	.byte		N03	, Fn2, v036
	.byte	W03
	.byte			Fn2, v028
	.byte	W03
	.byte			Fn2, v020
	.byte	W03
	.byte			Fn2, v008
	.byte	W03
	.byte	FINE

	@********************** Track  2 **********************@

	.global song736_2
song736_2:	@ 0x0858326C
	.byte	KEYSH	, 0
	.byte	VOICE	, 50
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte		N24	, As2, v100
	.byte	W24
	.byte	FINE

	.align 2
	.global song736
song736:	@ 0x0858327C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song736_1		@ track
	.word	song736_2		@ track
