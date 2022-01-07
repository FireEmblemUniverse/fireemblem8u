	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song952_1
song952_1:	@ 0x0858612C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 47
	.byte	VOL	, v095
	.byte		TIE	, Cn3, v127
	.byte	W72
	.byte	W01
	.byte	VOL	, v094
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song952
song952:	@ 0x08586178
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song952_1		@ track
