	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song190_1
song190_1:	@ 0x0857E570
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 22
	.byte	VOL	, v127
	.byte	BENDR	, 4
	.byte	BEND	, c_v
	.byte		N08	, Cn3, v127
	.byte	W08
	.byte	BEND	, c_v+10
	.byte		N08	, Cn3, v080
	.byte	W08
	.byte	BEND	, c_v+21
	.byte		N07	, Cn3, v068
	.byte	W07
	.byte	BEND	, c_v+30
	.byte		N07	, Cn3, v056
	.byte	W01
	.byte	W06
	.byte	BEND	, c_v+39
	.byte		N06	, Cn3, v044
	.byte	W06
	.byte	BEND	, c_v+47
	.byte		N06	, Cn3, v032
	.byte	W06
	.byte	BEND	, c_v+55
	.byte		N10	, Cn3, v020
	.byte	W06
	.byte	W24
	.byte	FINE

	.align 2
	.global song190
song190:	@ 0x0857E5A8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song190_1		@ track
