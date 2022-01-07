	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song742_1
song742_1:	@ 0x085834B0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 59
	.byte	VOL	, v070
	.byte	PAN	, c_v
	.byte	BEND	, c_v
	.byte		N12	, Cn4, v068
	.byte	W03
	.byte	BEND	, c_v+5
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+26
	.byte	W01
	.byte		c_v+31
	.byte	W01
	.byte		c_v+36
	.byte	W01
	.byte		c_v+47
	.byte	W01
	.byte		c_v+52
	.byte	W01
	.byte		c_v+57
	.byte	W01
	.byte		c_v+63
	.byte	FINE

	.align 2
	.global song742
song742:	@ 0x085834D8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song742_1		@ track
