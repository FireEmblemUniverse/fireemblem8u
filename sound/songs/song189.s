	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song189_1
song189_1:	@ 0x0857E52C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 22
	.byte	VOL	, v127
	.byte	BENDR	, 4
	.byte	BEND	, c_v+55
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	BEND	, c_v+45
	.byte		N08	, Cn3, v080
	.byte	W08
	.byte	BEND	, c_v+34
	.byte		N07	, Cn3, v068
	.byte	W07
	.byte	BEND	, c_v+25
	.byte		N07	, Cn3, v056
	.byte	W01
	.byte	W06
	.byte	BEND	, c_v+16
	.byte		N06	, Cn3, v044
	.byte	W06
	.byte	BEND	, c_v+8
	.byte		N06	, Cn3, v032
	.byte	W06
	.byte	BEND	, c_v
	.byte		N14	, Cn3, v020
	.byte	W06
	.byte	W24
	.byte	FINE

	.align 2
	.global song189
song189:	@ 0x0857E564
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song189_1		@ track
