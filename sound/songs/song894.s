	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song894_1
song894_1:	@ 0x08584AFC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 80
	.byte	VOL	, v100
	.byte	BENDR	, 12
	.byte	BEND	, c_v
	.byte		N11	, As2, v127
	.byte	W12
	.byte		N17	, Cn3
	.byte	W18
	.byte		N11	, Dn3
	.byte	W05
	.byte	VOL	, v100
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v086
	.byte		N20	, Dn3, v084
	.byte	W01
	.byte	VOL	, v085
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	FINE

	@********************** Track  2 **********************@

	.global song894_2
song894_2:	@ 0x08584B85
	.byte	KEYSH	, 0
	.byte	VOICE	, 47
	.byte	VOL	, v100
	.byte	BENDR	, 12
	.byte	BEND	, c_v
	.byte		N88	, Cn2, v127
	.byte	W32
	.byte	W03
	.byte	VOL	, v099
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W14
	.byte	FINE

	.align 2
	.global song894
song894:	@ 0x08584BE8
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song894_1		@ track
	.word	song894_2		@ track
