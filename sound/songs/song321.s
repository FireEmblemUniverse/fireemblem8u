	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song321_1
song321_1:	@ 0x08580490
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 30
	.byte	VOL	, v000
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	VOL	, v005
	.byte	BEND	, c_v-61
	.byte		TIE	, Gs5, v016
	.byte	W01
	.byte	VOL	, v014
	.byte	BEND	, c_v-58
	.byte	W01
	.byte	VOL	, v020
	.byte	BEND	, c_v-55
	.byte	W01
	.byte	VOL	, v029
	.byte	BEND	, c_v-49
	.byte	W01
	.byte	VOL	, v039
	.byte	BEND	, c_v-46
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v-43
	.byte	W01
	.byte	VOL	, v054
	.byte	BEND	, c_v-37
	.byte	W01
	.byte	VOL	, v063
	.byte	BEND	, c_v-34
	.byte	W01
	.byte	VOL	, v069
	.byte	BEND	, c_v-31
	.byte	W01
	.byte	VOL	, v078
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v087
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v093
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v102
	.byte	BEND	, c_v-12
	.byte	W01
	.byte		c_v-9
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+18
	.byte	W01
	.byte		c_v+23
	.byte	W52
	.byte	VOL	, v102
	.byte	W23
	.byte	W96
	.byte	W96
	.byte	W78
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v082
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
	.byte		v067
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W02
	.byte		EOT	
	.byte	FINE

	@********************** Track  2 **********************@

	.global song321_2
song321_2:	@ 0x0858054B
	.byte	KEYSH	, 0
	.byte	VOICE	, 126
	.byte	MOD	, 0
	.byte	VOL	, v102
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	BEND	, c_v
	.byte	W03
	.byte		c_v+1
	.byte	W03
	.byte		c_v+2
	.byte	W03
	.byte		c_v+3
	.byte	W03
	.byte		c_v+4
	.byte	W03
	.byte		c_v+6
	.byte	W03
	.byte		c_v+7
	.byte	W03
	.byte		c_v+8
	.byte	W03
	.byte		c_v+9
	.byte	W03
	.byte		c_v+11
	.byte	W03
	.byte		c_v+12
	.byte	W03
	.byte		c_v+13
	.byte	W03
	.byte		c_v+14
	.byte	W03
	.byte		c_v+16
	.byte	W03
	.byte		c_v+17
	.byte	W03
	.byte		c_v+18
	.byte	W03
	.byte		c_v+19
	.byte	W03
	.byte		c_v+21
	.byte	W03
	.byte		c_v+22
	.byte	W03
	.byte		c_v+23
	.byte	W03
	.byte		c_v+24
	.byte	W03
	.byte		c_v+26
	.byte	W03
	.byte		c_v+27
	.byte	W03
	.byte		c_v+28
	.byte	W03
	.byte		c_v+29
	.byte	W03
	.byte		c_v+31
	.byte	W03
	.byte		c_v+32
	.byte	W03
	.byte		c_v+33
	.byte	W03
	.byte		c_v+34
	.byte	W03
	.byte		c_v+36
	.byte	W03
	.byte		c_v+37
	.byte	W03
	.byte		c_v+38
	.byte	W03
	.byte		c_v+39
	.byte	W03
	.byte		c_v+41
	.byte	W03
	.byte		c_v+42
	.byte	W03
	.byte		c_v+43
	.byte	W03
	.byte		c_v+44
	.byte	W03
	.byte		c_v+46
	.byte	W03
	.byte		c_v+47
	.byte	W03
	.byte		c_v+48
	.byte	W03
	.byte		c_v+49
	.byte	W03
	.byte		c_v+51
	.byte	W03
	.byte		c_v+52
	.byte	W03
	.byte		c_v+53
	.byte	W03
	.byte		c_v+54
	.byte	W03
	.byte		c_v+56
	.byte	W03
	.byte		c_v+57
	.byte	W03
	.byte		c_v+58
	.byte	W03
	.byte		c_v+59
	.byte	W03
	.byte		c_v+61
	.byte	W03
	.byte		c_v+62
	.byte	W01
	.byte		c_v+63
	.byte	W11
	.byte		N13	, Cn2, v127
	.byte	W15
	.byte			Cn2, v108
	.byte	W15
	.byte			Cn2, v064
	.byte	W13
	.byte	FINE

	@********************** Track  3 **********************@

	.global song321_3
song321_3:	@ 0x085805CB
	.byte	KEYSH	, 0
	.byte	VOICE	, 101
	.byte	MOD	, 0
	.byte	VOL	, v061
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	VOL	, v060
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v057
	.byte	W01
	.byte		v056
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
	.byte		v041
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v035
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
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v012
	.byte		TIE	, Fs2, v127
	.byte	W01
	.byte	VOL	, v013
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v057
	.byte	W18
	.byte	W96
	.byte	W96
	.byte	W04
	.byte		EOT	
	.byte	W01
	.byte		N12	, Fs2, v080
	.byte	W12
	.byte			Fs2, v060
	.byte	W12
	.byte			Fs2, v032
	.byte	W12
	.byte	FINE

	@********************** Track  4 **********************@

	.global song321_4
song321_4:	@ 0x0858068D
	.byte	KEYSH	, 0
	.byte	VOICE	, 30
	.byte	MOD	, 0
	.byte	VOL	, v102
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	VOL	, v101
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v099
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v095
	.byte	BEND	, c_v-1
	.byte	W01
	.byte	VOL	, v093
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v089
	.byte	BEND	, c_v-2
	.byte	W01
	.byte	VOL	, v088
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v084
	.byte	BEND	, c_v-4
	.byte	W01
	.byte	VOL	, v081
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v077
	.byte	BEND	, c_v-5
	.byte	W01
	.byte	VOL	, v076
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v073
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v070
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v066
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	VOL	, v065
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v061
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v059
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v055
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v053
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v049
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	VOL	, v047
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v042
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v036
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	BEND	, c_v-17
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v020
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v019
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v009
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v008
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v002
	.byte	W01
	.byte		v000
	.byte	W01
	.byte	BEND	, c_v-26
	.byte	W03
	.byte		c_v-28
	.byte	W03
	.byte		c_v-29
	.byte	W03
	.byte		c_v-30
	.byte	W03
	.byte		c_v-32
	.byte	W03
	.byte		c_v-33
	.byte	W03
	.byte		c_v-35
	.byte	W03
	.byte		c_v-36
	.byte	W03
	.byte		c_v-38
	.byte	W03
	.byte		c_v-39
	.byte	W03
	.byte		c_v-41
	.byte	W03
	.byte		c_v-42
	.byte	W03
	.byte		c_v-44
	.byte	W03
	.byte		c_v-45
	.byte	W03
	.byte		c_v-47
	.byte	W03
	.byte		c_v-48
	.byte	W03
	.byte		c_v-50
	.byte	W03
	.byte		c_v-51
	.byte	W03
	.byte		c_v-53
	.byte	W03
	.byte		c_v-54
	.byte	W03
	.byte		c_v-56
	.byte	W03
	.byte		c_v-57
	.byte	W03
	.byte		c_v-58
	.byte	W03
	.byte		c_v-60
	.byte	W03
	.byte		c_v-61
	.byte	W03
	.byte		c_v-63
	.byte	W01
	.byte	VOL	, v000
	.byte	BEND	, c_v-64
	.byte	W01
	.byte	VOL	, v001
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v085
	.byte	BEND	, c_v-64
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v-58
	.byte	W01
	.byte	VOL	, v082
	.byte	BEND	, c_v-44
	.byte	W01
	.byte	VOL	, v081
	.byte	BEND	, c_v-37
	.byte	W01
	.byte	VOL	, v079
	.byte	BEND	, c_v-30
	.byte		N13	, Cn6, v127
	.byte		N13	, Fn7
	.byte	W01
	.byte	VOL	, v077
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v-9
	.byte	W01
	.byte	VOL	, v074
	.byte	BEND	, c_v-2
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v+11
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v+25
	.byte	W01
	.byte	VOL	, v069
	.byte	BEND	, c_v+39
	.byte	W01
	.byte	VOL	, v067
	.byte	BEND	, c_v+46
	.byte	W01
	.byte	VOL	, v065
	.byte	BEND	, c_v+53
	.byte	W01
	.byte	VOL	, v065
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v063
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte		N13	, Cn6, v092
	.byte		N13	, Fn7
	.byte	W01
	.byte	VOL	, v056
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v034
	.byte		N13	, Cn6, v076
	.byte		N13	, Fn7
	.byte	W01
	.byte	VOL	, v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte		N13	, Cn6, v052
	.byte		N13	, Fn7
	.byte	W01
	.byte	VOL	, v010
	.byte	W01
	.byte		v008
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
	.byte	W08
	.byte		N13	, Cn6, v040
	.byte		N13	, Fn7
	.byte	W15
	.byte			Cn6, v024
	.byte		N13	, Fn7
	.byte	W10
	.byte	W04
	.byte	FINE

	@********************** Track  5 **********************@

	.global song321_5
song321_5:	@ 0x085808C2
	.byte	KEYSH	, 0
	.byte	VOICE	, 109
	.byte	MOD	, 0
	.byte	VOL	, v000
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	VOL	, v002
	.byte	BEND	, c_v
	.byte		TIE	, En3, v127
	.byte	W01
	.byte	VOL	, v006
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
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
	.byte	W02
	.byte	W22
	.byte		EOT	
	.byte	W72
	.byte	W02
	.byte	W72
	.byte		TIE	, Fn3
	.byte	W24
	.byte	VOL	, v000
	.byte	W60
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v001
	.byte	W01
	.byte		v000
	.byte	FINE

	.align 2
	.global song321
song321:	@ 0x08580A18
	.byte	5		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup038		@ voicegroup/tone

	.word	song321_1		@ track
	.word	song321_2		@ track
	.word	song321_3		@ track
	.word	song321_4		@ track
	.word	song321_5		@ track
