	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song312_1
song312_1:	@ 0x0857FCAC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 15
	.byte	BENDR	, 12
	.byte	VOL	, v000
	.byte	LFOS	, 30
	.byte	MODT	, 0
	.byte	MOD	, 0
	.byte		TIE	, Cn3, v127
	.byte	W02
	.byte	VOL	, v008
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v059
	.byte	W02
	.byte		v068
	.byte	W02
	.byte		v076
	.byte	W02
	.byte		v085
	.byte	W02
	.byte		v094
	.byte	W02
	.byte		v104
	.byte	W02
	.byte	MOD	, 1
	.byte	W10
	.byte		2
	.byte	W06
	.byte		3
	.byte	W06
	.byte	W02
	.byte		4
	.byte	W04
	.byte		5
	.byte	W06
	.byte		6
	.byte	W04
	.byte		7
	.byte	W06
	.byte		8
	.byte	W02
	.byte	W02
	.byte		9
	.byte	W04
	.byte		10
	.byte	W04
	.byte		11
	.byte	W02
	.byte		12
	.byte	W04
	.byte		13
	.byte	W04
	.byte		14
	.byte	W02
	.byte		15
	.byte	W02
	.byte	W02
	.byte		16
	.byte	W02
	.byte		17
	.byte	BEND	, c_v
	.byte	W04
	.byte	MOD	, 18
	.byte	W02
	.byte		19
	.byte	W02
	.byte		20
	.byte	W04
	.byte		21
	.byte	W02
	.byte		22
	.byte	W02
	.byte		23
	.byte	W04
	.byte		24
	.byte	W02
	.byte		25
	.byte	W02
	.byte		26
	.byte	W02
	.byte		27
	.byte	W02
	.byte		28
	.byte	W02
	.byte		29
	.byte	W04
	.byte		30
	.byte	W02
	.byte		31
	.byte	W02
	.byte		32
	.byte	W02
	.byte		33
	.byte	W02
	.byte		34
	.byte	W02
	.byte		35
	.byte	W02
	.byte		36
	.byte	W02
	.byte		37
	.byte	W02
	.byte		38
	.byte	W02
	.byte		39
	.byte	W02
	.byte		40
	.byte	W02
	.byte		41
	.byte	W02
	.byte		42
	.byte	W02
	.byte		43
	.byte	W02
	.byte		45
	.byte	W02
	.byte		46
	.byte	W02
	.byte		47
	.byte	W02
	.byte		48
	.byte	W02
	.byte		49
	.byte	W02
	.byte		50
	.byte	W02
	.byte		51
	.byte	W02
	.byte		53
	.byte	W02
	.byte		54
	.byte	W02
	.byte		55
	.byte	W02
	.byte		56
	.byte	W02
	.byte		58
	.byte	W02
	.byte		59
	.byte	W02
	.byte		60
	.byte	W02
	.byte		61
	.byte	W02
	.byte		64
	.byte	VOL	, v098
	.byte	W02
	.byte		v090
	.byte	W02
	.byte		v083
	.byte	W02
	.byte		v076
	.byte	W02
	.byte		v069
	.byte	W02
	.byte		v063
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v018
	.byte	W02
	.byte		v016
	.byte	W02
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v007
	.byte	W02
	.byte		v006
	.byte	W04
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song312
song312:	@ 0x0857FD88
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup033		@ voicegroup/tone

	.word	song312_1		@ track
