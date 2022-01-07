	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song743_1
song743_1:	@ 0x085834E4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 59
	.byte	VOL	, v060
	.byte	PAN	, c_v
	.byte	BEND	, c_v
	.byte		N12	, An3, v068
	.byte	W03
	.byte	BEND	, c_v-5
	.byte	W01
	.byte		c_v-10
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-48
	.byte	W01
	.byte		c_v-53
	.byte	W01
	.byte		c_v-58
	.byte	W01
	.byte		c_v-64
	.byte	FINE

	.align 2
	.global song743
song743:	@ 0x0858350C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song743_1		@ track
