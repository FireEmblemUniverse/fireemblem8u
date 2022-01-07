	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song144_1
song144_1:	@ 0x0857DE50
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 47
	.byte	VOL	, v008
	.byte	PAN	, c_v
	.byte		TIE	, An1, v127
	.byte	W04
	.byte	VOL	, v016
	.byte	W04
	.byte		v024
	.byte	W04
	.byte		v032
	.byte	W04
	.byte		v040
	.byte	W04
	.byte		v048
	.byte	W04
	.byte		v056
	.byte	W04
	.byte		v064
	.byte	W04
	.byte		v072
	.byte	W04
	.byte		v080
	.byte	W04
	.byte		v088
	.byte	W04
	.byte		v096
	.byte	W04
	.byte		v104
	.byte	W04
	.byte		v112
	.byte	W04
	.byte		v120
	.byte	W04
	.byte		v127
	.byte	W12
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W17
	.byte		v120
	.byte	W05
	.byte		v112
	.byte	W02
	.byte	W03
	.byte		v104
	.byte	W05
	.byte		v096
	.byte	W05
	.byte		v088
	.byte	W05
	.byte		v080
	.byte	W05
	.byte		v072
	.byte	W01
	.byte	W04
	.byte		v064
	.byte	W05
	.byte		v056
	.byte	W05
	.byte		v048
	.byte	W05
	.byte		v040
	.byte	W05
	.byte		v032
	.byte	W05
	.byte		v024
	.byte	W05
	.byte		v016
	.byte	W05
	.byte		v008
	.byte	W01
	.byte		EOT	
	.byte	W08
	.byte	FINE

	@********************** Track  2 **********************@

	.global song144_2
song144_2:	@ 0x0857DEAA
	.byte	KEYSH	, 0
	.byte	VOICE	, 47
	.byte	BENDR	, 1
	.byte	PAN	, c_v
	.byte	MODT	, 2
	.byte	LFOS	, 3
	.byte	MOD	, 60
	.byte	BEND	, c_v+5
	.byte	W03
	.byte	VOL	, v008
	.byte		TIE	, An1, v127
	.byte	W04
	.byte	VOL	, v016
	.byte	W04
	.byte		v024
	.byte	W04
	.byte		v032
	.byte	W04
	.byte		v040
	.byte	W04
	.byte		v048
	.byte	W01
	.byte	W03
	.byte		v056
	.byte	W04
	.byte		v064
	.byte	W04
	.byte		v072
	.byte	W04
	.byte		v080
	.byte	W04
	.byte		v088
	.byte	W04
	.byte		v096
	.byte	W01
	.byte	W03
	.byte		v104
	.byte	W04
	.byte		v112
	.byte	W04
	.byte		v120
	.byte	W04
	.byte		v127
	.byte	W09
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W20
	.byte		v120
	.byte	W04
	.byte	W01
	.byte		v112
	.byte	W05
	.byte		v104
	.byte	W05
	.byte		v096
	.byte	W05
	.byte		v088
	.byte	W05
	.byte		v080
	.byte	W03
	.byte	W02
	.byte		v072
	.byte	W05
	.byte		v064
	.byte	W05
	.byte		v056
	.byte	W05
	.byte		v048
	.byte	W05
	.byte		v040
	.byte	W02
	.byte	W03
	.byte		v032
	.byte	W05
	.byte		v024
	.byte	W05
	.byte		v016
	.byte	W05
	.byte		v008
	.byte	W01
	.byte		EOT	
	.byte	W05
	.byte	FINE

	.align 2
	.global song144
song144:	@ 0x0857DF10
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song144_1		@ track
	.word	song144_2		@ track
