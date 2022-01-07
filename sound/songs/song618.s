	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song618_1
song618_1:	@ 0x085828E4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 26
	.byte	VOL	, v056
	.byte	MOD	, 24
	.byte	MODT	, 0
	.byte	LFOS	, 3
	.byte	BENDR	, 7
	.byte	BEND	, c_v+32
	.byte		TIE	, En2, v127
	.byte	W01
	.byte	BEND	, c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
song618_1_1:
	.byte	BEND	, c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte	PEND
	.byte	PATT	
		.word	song618_1_1
	.byte	PATT	
		.word	song618_1_1
	.byte	PATT	
		.word	song618_1_1
	.byte	GOTO	
		.word	song618_1_1
	.byte	W08
	.byte		EOT	, En2
	.byte	W16
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	.align 2
	.global song618
song618:	@ 0x0858297C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song618_1		@ track
