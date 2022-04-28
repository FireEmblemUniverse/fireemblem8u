	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song116_1
song116_1:	@ 0x0857D448
	.byte	VOL	, v055
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 6
	.byte	BENDR	, 5
	.byte	BEND	, c_v
	.byte		TIE	, En4, v127
	.byte	W01
	.byte	BEND	, c_v+63
	.byte	W01
song116_1_2:
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
song116_1_1:
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte	PEND
	.byte	PATT	
		.word	song116_1_1
	.byte	PATT	
		.word	song116_1_1
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte	GOTO	
		.word	song116_1_2
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		EOT	, En4
	.byte	W18
	.byte	FINE

	.align 2
	.global song116
song116:	@ 0x0857D4DC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song116_1		@ track
