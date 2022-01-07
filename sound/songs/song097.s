	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song097_1
song097_1:	@ 0x0857D048
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 50
	.byte	BENDR	, 5
	.byte	VOL	, v060
	.byte	BEND	, c_v-64
	.byte		N06	, An5, v127
	.byte	W01
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte	VOICE	, 51
	.byte	BEND	, c_v-64
	.byte		N16	, Dn6, v112
	.byte	W01
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte	FINE

	.align 2
	.global song097
song097:	@ 0x0857D08C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song097_1		@ track
