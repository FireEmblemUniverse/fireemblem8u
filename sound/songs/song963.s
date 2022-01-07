	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song963_1
song963_1:	@ 0x085864DC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 41
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	VOL	, v104
	.byte	BEND	, c_v+63
	.byte		N48	, Fn2, v127
	.byte	W01
	.byte	VOL	, v101
	.byte	BEND	, c_v+59
	.byte	W01
	.byte	VOL	, v100
	.byte	W01
	.byte		v097
	.byte	BEND	, c_v+54
	.byte	W01
	.byte	VOL	, v095
	.byte	BEND	, c_v+50
	.byte	W01
	.byte	VOL	, v093
	.byte	W01
	.byte		v090
	.byte	BEND	, c_v+45
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v+41
	.byte	W01
	.byte	VOL	, v086
	.byte	W01
	.byte		v084
	.byte	BEND	, c_v+36
	.byte	W01
	.byte	VOL	, v081
	.byte	BEND	, c_v+32
	.byte	W01
	.byte	VOL	, v080
	.byte	W01
	.byte		v078
	.byte	BEND	, c_v+27
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v+22
	.byte	W01
	.byte	VOL	, v074
	.byte	W01
	.byte		v071
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v069
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v067
	.byte	W01
	.byte		v065
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v061
	.byte	W01
	.byte		v058
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v056
	.byte	BEND	, c_v-5
	.byte	W01
	.byte	VOL	, v054
	.byte	W01
	.byte		v052
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v050
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v048
	.byte	W01
	.byte		v046
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v043
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v042
	.byte	W01
	.byte		v039
	.byte	BEND	, c_v-28
	.byte	W01
	.byte	VOL	, v037
	.byte	BEND	, c_v-32
	.byte	W01
	.byte	VOL	, v035
	.byte	W01
	.byte		v033
	.byte	BEND	, c_v-37
	.byte	W01
	.byte	VOL	, v030
	.byte	BEND	, c_v-42
	.byte	W01
	.byte	VOL	, v028
	.byte	W01
	.byte		v027
	.byte	BEND	, c_v-46
	.byte	W01
	.byte	VOL	, v024
	.byte	BEND	, c_v-51
	.byte	W01
	.byte	VOL	, v023
	.byte	W01
	.byte		v020
	.byte	BEND	, c_v-55
	.byte	W01
	.byte	VOL	, v018
	.byte	BEND	, c_v-60
	.byte	W01
	.byte	VOL	, v016
	.byte	BEND	, c_v-64
	.byte	W01
	.byte	VOL	, v014
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	FINE

	@********************** Track  2 **********************@

	.global song963_2
song963_2:	@ 0x085865A5
	.byte	KEYSH	, 0
	.byte	VOICE	, 50
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	W24
	.byte		N96	, Cn3, v127
	.byte	W72
	.byte	W24
	.byte	FINE

	.align 2
	.global song963
song963:	@ 0x085865B4
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song963_1		@ track
	.word	song963_2		@ track
