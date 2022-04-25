	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song760_1
song760_1:	@ 0x08583DB0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 76
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 7
	.byte	BEND	, c_v
	.byte		N06	, Ds4, v127
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N12	, Dn4, v076
	.byte	W04
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte		c_v-12
	.byte	W02
	.byte		c_v-16
	.byte	W01
	.byte		c_v-20
	.byte	W02
	.byte		c_v-24
	.byte	W01
	.byte		c_v-28
	.byte	W02
	.byte		c_v-32
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-40
	.byte	W06
	.byte		c_v
	.byte	FINE

	.align 2
	.global song760
song760:	@ 0x08583DE4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup036		@ voicegroup/tone

	.word	song760_1		@ track
