	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song145_1
song145_1:	@ 0x0857DF20
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 46
	.byte	BENDR	, 2
	.byte	W17
	.byte	VOL	, v048
	.byte	PAN	, c_v-60
	.byte	BEND	, c_v+32
	.byte		N84	, Cn3, v127
	.byte	W02
	.byte	VOL	, v064
	.byte	W02
	.byte		v080
	.byte	PAN	, c_v-55
	.byte	BEND	, c_v+28
	.byte	W02
	.byte	VOL	, v096
	.byte	W01
	.byte	W01
	.byte		v112
	.byte	PAN	, c_v-49
	.byte	BEND	, c_v+25
	.byte	W02
	.byte	VOL	, v127
	.byte	W02
	.byte	PAN	, c_v-43
	.byte	BEND	, c_v+22
	.byte	W04
	.byte	PAN	, c_v-13
	.byte	BEND	, c_v+6
	.byte	W04
	.byte	PAN	, c_v-7
	.byte	BEND	, c_v+3
	.byte	W04
	.byte	PAN	, c_v-1
	.byte	BEND	, c_v
	.byte	W04
	.byte	PAN	, c_v+5
	.byte	BEND	, c_v-4
	.byte	W03
	.byte	W01
	.byte	PAN	, c_v+11
	.byte	BEND	, c_v-7
	.byte	W04
	.byte	PAN	, c_v+17
	.byte	BEND	, c_v-10
	.byte	W04
	.byte	PAN	, c_v+23
	.byte	BEND	, c_v-13
	.byte	W04
	.byte	PAN	, c_v+29
	.byte	BEND	, c_v-16
	.byte	W04
	.byte	PAN	, c_v+35
	.byte	BEND	, c_v-20
	.byte	W04
	.byte	PAN	, c_v+41
	.byte	BEND	, c_v-23
	.byte	W03
	.byte	W01
	.byte	PAN	, c_v+47
	.byte	BEND	, c_v-26
	.byte	W04
	.byte	PAN	, c_v+53
	.byte	BEND	, c_v-29
	.byte	W04
	.byte	PAN	, c_v+60
	.byte	BEND	, c_v-32
	.byte	W15
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song145_2
song145_2:	@ 0x0857DF96
	.byte	KEYSH	, 0
	.byte	VOICE	, 46
	.byte	BENDR	, 2
	.byte	W17
	.byte	PAN	, c_v+60
	.byte	VOL	, v048
	.byte	BEND	, c_v-32
	.byte		N84	, Cn3, v127
	.byte	W02
	.byte	VOL	, v064
	.byte	W02
	.byte	PAN	, c_v+52
	.byte	VOL	, v080
	.byte	BEND	, c_v-29
	.byte	W02
	.byte	VOL	, v096
	.byte	W01
	.byte	W01
	.byte	PAN	, c_v+45
	.byte	VOL	, v112
	.byte	BEND	, c_v-25
	.byte	W02
	.byte	VOL	, v127
	.byte	W02
	.byte	PAN	, c_v+37
	.byte	BEND	, c_v-21
	.byte	W04
	.byte	PAN	, c_v+30
	.byte	BEND	, c_v-17
	.byte	W04
	.byte	PAN	, c_v+22
	.byte	BEND	, c_v-13
	.byte	W04
	.byte	PAN	, c_v+15
	.byte	BEND	, c_v-9
	.byte	W04
	.byte	PAN	, c_v+7
	.byte	BEND	, c_v-5
	.byte	W03
	.byte	W01
	.byte	PAN	, c_v
	.byte	BEND	, c_v-1
	.byte	W04
	.byte	PAN	, c_v-8
	.byte	BEND	, c_v+3
	.byte	W04
	.byte	PAN	, c_v-15
	.byte	BEND	, c_v+7
	.byte	W04
	.byte	PAN	, c_v-23
	.byte	BEND	, c_v+11
	.byte	W04
	.byte	PAN	, c_v-30
	.byte	BEND	, c_v+15
	.byte	W04
	.byte	PAN	, c_v-38
	.byte	BEND	, c_v+19
	.byte	W03
	.byte	W01
	.byte	PAN	, c_v-45
	.byte	BEND	, c_v+23
	.byte	W04
	.byte	PAN	, c_v-53
	.byte	BEND	, c_v+27
	.byte	W04
	.byte	PAN	, c_v-60
	.byte	BEND	, c_v+32
	.byte	W15
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	FINE

	@********************** Track  3 **********************@

	.global song145_3
song145_3:	@ 0x0857E00C
	.byte	KEYSH	, 0
	.byte	VOICE	, 46
	.byte	VOL	, v127
	.byte	BENDR	, 2
	.byte	PAN	, c_v
	.byte	W01
	.byte		TIE	, Cn2, v127
	.byte	W23
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W24
	.byte	W08
	.byte		EOT	
	.byte	W16
	.byte	FINE

	.align 2
	.global song145
song145:	@ 0x0857E028
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup030		@ voicegroup/tone

	.word	song145_1		@ track
	.word	song145_2		@ track
	.word	song145_3		@ track
