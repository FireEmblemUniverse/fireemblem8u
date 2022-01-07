	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song720_1
song720_1:	@ 0x08582BA8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 31
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	W03
	.byte		N23	, As6, v084
	.byte	W23
	.byte	FINE

	@********************** Track  2 **********************@

	.global song720_2
song720_2:	@ 0x08582BB8
	.byte	KEYSH	, 0
	.byte	VOICE	, 35
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte		N24	, Gn3, v096
	.byte	W24
	.byte	W02
	.byte	FINE

	.align 2
	.global song720
song720:	@ 0x08582BC8
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song720_1		@ track
	.word	song720_2		@ track
