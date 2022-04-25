	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song246_1
song246_1:	@ 0x0857ECD8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 26
	.byte	VOL	, v127
	.byte		N24	, Cn3, v048
	.byte	W24
	.byte		N02	, Cn3, v040
	.byte	W02
	.byte			Cn3, v044
	.byte	W02
	.byte		N01	, Cn3, v048
	.byte	W01
	.byte		N02	
	.byte	W02
	.byte		N03	, Cn3, v052
	.byte	W03
	.byte		N02	, Cn3, v056
	.byte	W02
	.byte		N01	, Cn3, v060
	.byte	W01
	.byte		N02	
	.byte	W02
	.byte			Cn3, v064
	.byte	W02
	.byte		N01	, Cn3, v068
	.byte	W01
	.byte		N02	
	.byte	W02
	.byte			Cn3, v072
	.byte	W02
	.byte		N01	, Cn3, v076
	.byte	W01
	.byte		N02	
	.byte	W01
	.byte	W01
	.byte		N03	, Cn3, v080
	.byte	W03
	.byte		N01	, Cn3, v084
	.byte	W01
	.byte		N02	, Cn3, v088
	.byte	W02
	.byte		N02	
	.byte	W02
	.byte		N01	, Cn3, v092
	.byte	W01
	.byte		N02	, Cn3, v096
	.byte	W02
	.byte		N02	
	.byte	W02
	.byte			Cn3, v100
	.byte	W02
	.byte		N01	, Cn3, v104
	.byte	W01
	.byte		N02	
	.byte	W02
	.byte			Cn3, v108
	.byte	W02
	.byte		N01	, Cn3, v112
	.byte	W01
	.byte		N02	
	.byte	W02
	.byte		N03	, Cn3, v116
	.byte	W03
	.byte		N01	, Cn3, v120
	.byte	W01
	.byte		N02	, Cn3, v124
	.byte	W02
	.byte			Cn3, v127
	.byte	W02
	.byte		N28	
	.byte	W16
	.byte	W24
	.byte	FINE

	.align 2
	.global song246
song246:	@ 0x0857ED50
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song246_1		@ track
