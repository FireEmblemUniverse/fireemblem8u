	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song895_1
song895_1:	@ 0x08584BF8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 7
	.byte	VOL	, v127
	.byte		N24	, Cn3, v072
	.byte	W24
	.byte		N02	
	.byte	W02
	.byte			Cn3, v076
	.byte	W02
	.byte		N01	, Cn3, v080
	.byte	W01
	.byte		N02	, Cn3, v084
	.byte	W02
	.byte		N03	, Cn3, v088
	.byte	W03
	.byte		N02	, Cn3, v100
	.byte	W02
	.byte		N01	, Cn3, v108
	.byte	W01
	.byte		N02	, Cn3, v100
	.byte	W02
	.byte			Cn3, v092
	.byte	W02
	.byte		N01	, Cn3, v084
	.byte	W01
	.byte		N15	, Cn3, v072
	.byte	W06
	.byte	W09
	.byte		N02	
	.byte	W02
	.byte		N02	
	.byte	W02
	.byte		N01	, Cn3, v076
	.byte	W01
	.byte		N02	
	.byte	W02
	.byte		N03	, Cn3, v080
	.byte	W03
	.byte		N02	, Cn3, v088
	.byte	W02
	.byte		N01	, Cn3, v096
	.byte	W01
	.byte		N02	, Cn3, v100
	.byte	W02
	.byte			Cn3, v108
	.byte	W02
	.byte		N01	, Cn3, v116
	.byte	W01
	.byte		N14	, Cn3, v127
	.byte	W14
	.byte	FINE

	.align 2
	.global song895
song895:	@ 0x08584C54
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup037		@ voicegroup/tone

	.word	song895_1		@ track
