	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song078_1
song078_1:	@ 0x08579F20
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 80
	.byte	BENDR	, 5
	.byte	VOL	, v020
	.byte		TIE	, Cn3, v100
	.byte	W06
	.byte	VOL	, v029
	.byte	W06
	.byte		v039
	.byte	W06
	.byte		v049
	.byte	W06
	.byte		v058
	.byte	W06
	.byte		v068
	.byte	W06
	.byte		v078
	.byte	W06
	.byte		v087
	.byte	W06
song078_1_1:
	.byte	VOL	, v097
	.byte	W06
	.byte		v107
	.byte	W06
	.byte		v117
	.byte	W06
	.byte		v127
	.byte	W30
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song078_1_1
	.byte	W44
	.byte	W03
	.byte		EOT	, Cn3
	.byte	W48
	.byte	W01
	.byte	FINE

	@********************** Track  2 **********************@

	.global song078_2
song078_2:	@ 0x08579F61
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	BENDR	, 5
	.byte	PAN	, c_v-32
	.byte	W48
song078_2_1:
	.byte	W24
	.byte	VOL	, v032
	.byte	BEND	, c_v
	.byte		TIE	, Cn3, v127
	.byte	W04
	.byte	VOL	, v039
	.byte	W04
	.byte		v047
	.byte	BEND	, c_v+3
	.byte	W04
	.byte	VOL	, v055
	.byte	W04
	.byte		v063
	.byte	BEND	, c_v+7
	.byte	W04
	.byte	VOL	, v071
	.byte	W04
	.byte		v079
	.byte	BEND	, c_v+11
	.byte	W04
	.byte	VOL	, v087
	.byte	W04
	.byte		v095
	.byte	BEND	, c_v+15
	.byte	W04
	.byte	VOL	, v103
	.byte	W04
	.byte		v111
	.byte	BEND	, c_v+19
	.byte	W04
	.byte	VOL	, v119
	.byte	W04
	.byte		v127
	.byte	BEND	, c_v+23
	.byte	W08
	.byte		c_v+27
	.byte	W08
	.byte		c_v+31
	.byte	W08
	.byte		c_v+35
	.byte	W08
	.byte		c_v+39
	.byte	W08
	.byte		c_v+43
	.byte	W08
	.byte		c_v+48
	.byte	W24
	.byte	W36
	.byte		c_v+48
	.byte	W08
	.byte		c_v+43
	.byte	W04
	.byte	VOL	, v127
	.byte	W04
	.byte	BEND	, c_v+39
	.byte	W04
	.byte	VOL	, v117
	.byte	W04
	.byte	BEND	, c_v+34
	.byte	W04
	.byte	VOL	, v108
	.byte	W04
	.byte	BEND	, c_v+30
	.byte	W04
	.byte	VOL	, v099
	.byte	W04
	.byte	BEND	, c_v+25
	.byte	W04
	.byte	VOL	, v090
	.byte	W04
	.byte	BEND	, c_v+21
	.byte	W04
	.byte	VOL	, v080
	.byte	W04
	.byte	BEND	, c_v+16
	.byte	W04
	.byte	VOL	, v071
	.byte	W04
	.byte	BEND	, c_v+12
	.byte	W04
	.byte	VOL	, v062
	.byte	W04
	.byte	BEND	, c_v+8
	.byte	W04
	.byte	VOL	, v053
	.byte	W08
	.byte		v043
	.byte	W08
	.byte		v034
	.byte	W08
	.byte		v025
	.byte	W08
	.byte		v016
	.byte	W04
	.byte		v000
	.byte	W36
	.byte		v010
	.byte	BEND	, c_v+16
	.byte	W02
	.byte		c_v+27
	.byte	W02
	.byte	VOL	, v025
	.byte	BEND	, c_v+39
	.byte	W02
	.byte		c_v+51
	.byte	W02
	.byte	PAN	, c_v-48
	.byte	VOL	, v040
	.byte	BEND	, c_v+63
	.byte	W04
	.byte	VOL	, v055
	.byte	W04
	.byte		v070
	.byte	BEND	, c_v+58
	.byte	W04
	.byte	VOL	, v085
	.byte	W04
	.byte		v100
	.byte	BEND	, c_v+53
	.byte	W08
	.byte		c_v+47
	.byte	W08
	.byte		c_v+42
	.byte	W08
	.byte		c_v+37
	.byte	W06
	.byte	VOL	, v096
	.byte	W02
	.byte	BEND	, c_v+32
	.byte	W03
	.byte	VOL	, v091
	.byte	W05
	.byte		v086
	.byte	BEND	, c_v+26
	.byte	W05
	.byte	VOL	, v081
	.byte	W03
	.byte	BEND	, c_v+21
	.byte	W02
	.byte	VOL	, v076
	.byte	W05
	.byte		v072
	.byte	W01
	.byte	BEND	, c_v+16
	.byte	W04
	.byte	VOL	, v067
	.byte	W04
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v062
	.byte	W05
	.byte		v056
	.byte	W02
	.byte	BEND	, c_v+5
	.byte	W03
	.byte	VOL	, v050
	.byte	W05
	.byte		v040
	.byte	BEND	, c_v
	.byte	W02
	.byte	VOL	, v030
	.byte	W01
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v020
	.byte	W02
	.byte		v010
	.byte	W02
	.byte		v000
	.byte	W16
	.byte		v016
	.byte	PAN	, c_v-16
	.byte	W08
	.byte	VOL	, v032
	.byte	W08
	.byte		v048
	.byte	W08
	.byte		v056
	.byte	W12
	.byte		v064
	.byte	W12
	.byte		v072
	.byte	W13
	.byte		v080
	.byte	W11
	.byte	BEND	, c_v
	.byte	W03
	.byte	VOL	, v088
	.byte	W05
	.byte	BEND	, c_v-2
	.byte	W08
	.byte		c_v-4
	.byte	W08
	.byte		c_v-6
	.byte	W01
	.byte	VOL	, v096
	.byte	W07
	.byte	BEND	, c_v-8
	.byte	W08
	.byte		c_v-10
	.byte	W08
	.byte	VOL	, v104
	.byte	BEND	, c_v-12
	.byte	W08
	.byte		c_v-14
	.byte	W08
	.byte		c_v-16
	.byte	W08
	.byte	VOL	, v112
	.byte	BEND	, c_v-18
	.byte	W08
	.byte		c_v-20
	.byte	W08
	.byte		c_v-22
	.byte	W08
	.byte	VOL	, v120
	.byte	BEND	, c_v-24
	.byte	W24
	.byte		c_v-24
	.byte	W04
	.byte		c_v-21
	.byte	W04
	.byte		c_v-18
	.byte	W04
	.byte	VOL	, v112
	.byte	BEND	, c_v-15
	.byte	W04
	.byte		c_v-11
	.byte	W04
	.byte		c_v-8
	.byte	W04
	.byte	VOL	, v104
	.byte	BEND	, c_v-5
	.byte	W04
	.byte		c_v-1
	.byte	W04
	.byte		c_v+2
	.byte	W04
	.byte	VOL	, v096
	.byte	BEND	, c_v+5
	.byte	W04
	.byte		c_v+9
	.byte	W04
	.byte		c_v+12
	.byte	W04
	.byte	VOL	, v088
	.byte	BEND	, c_v+16
	.byte	W12
	.byte	VOL	, v080
	.byte	W12
	.byte		v072
	.byte	W12
	.byte		v064
	.byte	W12
	.byte		v056
	.byte	W12
	.byte		v048
	.byte	W12
	.byte		v040
	.byte	W12
	.byte		v032
	.byte	W12
	.byte		v024
	.byte	W06
	.byte		v020
	.byte	W05
	.byte		v010
	.byte	W04
	.byte		v000
	.byte	W09
	.byte	W72
	.byte		v020
	.byte	PAN	, c_v-60
	.byte	BEND	, c_v-24
	.byte	W08
	.byte	VOL	, v030
	.byte	BEND	, c_v-19
	.byte	W08
	.byte	VOL	, v040
	.byte	BEND	, c_v-13
	.byte	W08
	.byte	VOL	, v050
	.byte	BEND	, c_v-7
	.byte	W08
	.byte	VOL	, v060
	.byte	BEND	, c_v-1
	.byte	W08
	.byte	VOL	, v070
	.byte	BEND	, c_v+5
	.byte	W08
	.byte	VOL	, v080
	.byte	BEND	, c_v+11
	.byte	W08
	.byte	VOL	, v090
	.byte	BEND	, c_v+17
	.byte	W08
	.byte	VOL	, v100
	.byte	BEND	, c_v+23
	.byte	W08
	.byte	VOL	, v110
	.byte	BEND	, c_v+29
	.byte	W08
	.byte	VOL	, v120
	.byte	BEND	, c_v+35
	.byte	W08
	.byte		c_v+41
	.byte	W08
	.byte		c_v+48
	.byte	W24
	.byte		c_v+48
	.byte	W08
	.byte		c_v+44
	.byte	W08
	.byte		c_v+41
	.byte	W08
	.byte	VOL	, v112
	.byte	BEND	, c_v+38
	.byte	W08
	.byte		c_v+35
	.byte	W04
	.byte	VOL	, v104
	.byte	W04
	.byte	BEND	, c_v+32
	.byte	W08
	.byte	VOL	, v096
	.byte	BEND	, c_v+28
	.byte	W08
	.byte		c_v+25
	.byte	W04
	.byte	VOL	, v088
	.byte	W04
	.byte	BEND	, c_v+22
	.byte	W08
	.byte	VOL	, v080
	.byte	BEND	, c_v+19
	.byte	W08
	.byte		c_v+16
	.byte	W04
	.byte	VOL	, v072
	.byte	W04
	.byte	BEND	, c_v+12
	.byte	W08
	.byte	VOL	, v064
	.byte	BEND	, c_v+9
	.byte	W08
	.byte		c_v+6
	.byte	W04
	.byte	VOL	, v056
	.byte	W04
	.byte	BEND	, c_v+3
	.byte	W08
	.byte	VOL	, v048
	.byte	BEND	, c_v
	.byte	W12
	.byte	VOL	, v040
	.byte	W12
	.byte		v032
	.byte	W12
	.byte		v024
	.byte	W12
	.byte		v014
	.byte	W12
	.byte		v000
	.byte	W12
	.byte	W96
	.byte		v048
	.byte	PAN	, c_v-24
	.byte	BEND	, c_v
	.byte	W05
	.byte		c_v+5
	.byte	W03
	.byte	VOL	, v056
	.byte	W02
	.byte	BEND	, c_v+11
	.byte	W05
	.byte		c_v+16
	.byte	W01
	.byte	VOL	, v064
	.byte	W04
	.byte	BEND	, c_v+22
	.byte	W04
	.byte	VOL	, v072
	.byte	W01
	.byte	BEND	, c_v+27
	.byte	W05
	.byte		c_v+33
	.byte	W02
	.byte	VOL	, v080
	.byte	W03
	.byte	BEND	, c_v+39
	.byte	W05
	.byte	VOL	, v088
	.byte	BEND	, c_v+44
	.byte	W05
	.byte		c_v+50
	.byte	W03
	.byte	VOL	, v098
	.byte	W02
	.byte	BEND	, c_v+56
	.byte	W05
	.byte	VOL	, v106
	.byte	W07
	.byte		v116
	.byte	W07
	.byte		v127
	.byte	W19
	.byte	BEND	, c_v+56
	.byte	W08
	.byte	VOL	, v120
	.byte	BEND	, c_v+51
	.byte	W08
	.byte	VOL	, v112
	.byte	BEND	, c_v+46
	.byte	W08
	.byte	VOL	, v104
	.byte	BEND	, c_v+42
	.byte	W08
	.byte	VOL	, v096
	.byte	BEND	, c_v+37
	.byte	W08
	.byte	VOL	, v088
	.byte	BEND	, c_v+32
	.byte	W08
	.byte	VOL	, v080
	.byte	BEND	, c_v+28
	.byte	W08
	.byte	VOL	, v072
	.byte	BEND	, c_v+23
	.byte	W08
	.byte	VOL	, v064
	.byte	BEND	, c_v+18
	.byte	W08
	.byte	VOL	, v054
	.byte	BEND	, c_v+14
	.byte	W07
	.byte	VOL	, v048
	.byte	W01
	.byte	BEND	, c_v+9
	.byte	W04
	.byte	VOL	, v040
	.byte	W04
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v030
	.byte	W04
	.byte		v020
	.byte	W03
	.byte		v000
	.byte	BEND	, c_v
	.byte	W03
	.byte		EOT	
	.byte	W05
	.byte	GOTO	
		.word	song078_2_1
	.byte	W96
	.byte	FINE

	@********************** Track  3 **********************@

	.global song078_3
song078_3:	@ 0x0857A1D8
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	BENDR	, 5
	.byte	PAN	, c_v+20
	.byte	W48
song078_3_1:
	.byte	W12
	.byte	VOL	, v020
	.byte	BEND	, c_v+12
	.byte		TIE	, Cn3, v127
	.byte	W04
	.byte	VOL	, v025
	.byte	BEND	, c_v+16
	.byte	W04
	.byte	VOL	, v030
	.byte	W04
	.byte		v035
	.byte	BEND	, c_v+18
	.byte	W04
	.byte	VOL	, v040
	.byte	W04
	.byte		v045
	.byte	BEND	, c_v+21
	.byte	W04
	.byte	VOL	, v050
	.byte	W04
	.byte		v055
	.byte	BEND	, c_v+23
	.byte	W04
	.byte	VOL	, v060
	.byte	W04
	.byte		v065
	.byte	BEND	, c_v+26
	.byte	W04
	.byte	VOL	, v070
	.byte	W04
	.byte		v075
	.byte	BEND	, c_v+29
	.byte	W04
	.byte	VOL	, v080
	.byte	W04
	.byte	BEND	, c_v+32
	.byte	W32
	.byte	VOL	, v072
	.byte	W08
	.byte		v064
	.byte	W08
	.byte		v056
	.byte	W08
	.byte		v048
	.byte	W08
	.byte		v040
	.byte	W08
	.byte		v032
	.byte	W08
	.byte		v024
	.byte	W08
	.byte		v016
	.byte	W08
	.byte		v008
	.byte	W08
	.byte		v000
	.byte	W08
	.byte	BEND	, c_v+28
	.byte	W08
	.byte		c_v+26
	.byte	W08
	.byte	VOL	, v020
	.byte	PAN	, c_v+50
	.byte	BEND	, c_v+24
	.byte	W06
	.byte	VOL	, v030
	.byte	W02
	.byte	BEND	, c_v+22
	.byte	W04
	.byte	VOL	, v040
	.byte	W04
	.byte	BEND	, c_v+21
	.byte	W02
	.byte	VOL	, v050
	.byte	W06
	.byte		v060
	.byte	BEND	, c_v+20
	.byte	W06
	.byte	VOL	, v070
	.byte	W02
	.byte	BEND	, c_v+19
	.byte	W04
	.byte	VOL	, v080
	.byte	W04
	.byte	BEND	, c_v+18
	.byte	W02
	.byte	VOL	, v090
	.byte	W06
	.byte	BEND	, c_v+17
	.byte	W08
	.byte		c_v+16
	.byte	W08
	.byte		c_v+15
	.byte	W08
	.byte		c_v+14
	.byte	W08
	.byte		c_v+13
	.byte	W08
	.byte		c_v+12
	.byte	W08
	.byte	VOL	, v090
	.byte	BEND	, c_v+11
	.byte	W06
	.byte	VOL	, v083
	.byte	W02
	.byte	BEND	, c_v+10
	.byte	W04
	.byte	VOL	, v077
	.byte	W04
	.byte	BEND	, c_v+9
	.byte	W02
	.byte	VOL	, v071
	.byte	W06
	.byte		v065
	.byte	BEND	, c_v+8
	.byte	W06
	.byte	VOL	, v059
	.byte	W02
	.byte	BEND	, c_v+7
	.byte	W04
	.byte	VOL	, v053
	.byte	W04
	.byte	BEND	, c_v+6
	.byte	W02
	.byte	VOL	, v047
	.byte	W06
	.byte		v041
	.byte	BEND	, c_v+5
	.byte	W06
	.byte	VOL	, v035
	.byte	W02
	.byte	BEND	, c_v+4
	.byte	W04
	.byte	VOL	, v029
	.byte	W04
	.byte	BEND	, c_v+3
	.byte	W02
	.byte	VOL	, v023
	.byte	W06
	.byte		v017
	.byte	BEND	, c_v+2
	.byte	W06
	.byte	VOL	, v011
	.byte	W02
	.byte	BEND	, c_v+1
	.byte	W04
	.byte	VOL	, v005
	.byte	W04
	.byte	BEND	, c_v
	.byte	W02
	.byte	VOL	, v000
	.byte	W42
	.byte		v020
	.byte	PAN	, c_v+30
	.byte	BEND	, c_v+8
	.byte	W04
	.byte	VOL	, v037
	.byte	BEND	, c_v+12
	.byte	W04
	.byte	VOL	, v055
	.byte	BEND	, c_v+16
	.byte	W04
	.byte	VOL	, v073
	.byte	BEND	, c_v+21
	.byte	W04
	.byte	VOL	, v091
	.byte	BEND	, c_v+25
	.byte	W04
	.byte	VOL	, v109
	.byte	BEND	, c_v+30
	.byte	W04
	.byte	VOL	, v127
	.byte	BEND	, c_v+34
	.byte	W04
	.byte		c_v+39
	.byte	W04
	.byte		c_v+43
	.byte	W04
	.byte		c_v+48
	.byte	W24
	.byte		c_v+48
	.byte	W08
	.byte		c_v+42
	.byte	W08
	.byte		c_v+37
	.byte	W08
	.byte	VOL	, v127
	.byte	BEND	, c_v+32
	.byte	W04
	.byte	VOL	, v119
	.byte	W04
	.byte		v112
	.byte	BEND	, c_v+26
	.byte	W04
	.byte	VOL	, v105
	.byte	W04
	.byte		v098
	.byte	BEND	, c_v+21
	.byte	W04
	.byte	VOL	, v091
	.byte	W04
	.byte		v084
	.byte	BEND	, c_v+16
	.byte	W04
	.byte	VOL	, v077
	.byte	W04
	.byte		v070
	.byte	BEND	, c_v+10
	.byte	W04
	.byte	VOL	, v063
	.byte	W04
	.byte		v056
	.byte	BEND	, c_v+5
	.byte	W04
	.byte	VOL	, v049
	.byte	W04
	.byte		v042
	.byte	BEND	, c_v
	.byte	W04
	.byte	VOL	, v035
	.byte	W04
	.byte		v028
	.byte	BEND	, c_v-6
	.byte	W04
	.byte	VOL	, v021
	.byte	W04
	.byte		v014
	.byte	BEND	, c_v-11
	.byte	W04
	.byte	VOL	, v007
	.byte	W04
	.byte		v000
	.byte	BEND	, c_v-16
	.byte	W48
	.byte	VOL	, v020
	.byte	PAN	, c_v+60
	.byte	BEND	, c_v+8
	.byte	W04
	.byte	VOL	, v030
	.byte	W04
	.byte		v040
	.byte	BEND	, c_v+9
	.byte	W04
	.byte	VOL	, v050
	.byte	W04
	.byte		v060
	.byte	BEND	, c_v+10
	.byte	W04
	.byte	VOL	, v070
	.byte	W04
	.byte		v080
	.byte	BEND	, c_v+11
	.byte	W08
	.byte		c_v+13
	.byte	W08
	.byte		c_v+14
	.byte	W08
	.byte		c_v+15
	.byte	W08
	.byte		c_v+17
	.byte	W08
	.byte		c_v+18
	.byte	W08
	.byte		c_v+19
	.byte	W08
	.byte		c_v+21
	.byte	W08
	.byte		c_v+22
	.byte	W08
	.byte		c_v+24
	.byte	W48
	.byte	VOL	, v080
	.byte	BEND	, c_v+24
	.byte	W04
	.byte		c_v+27
	.byte	W04
	.byte	VOL	, v086
	.byte	BEND	, c_v+30
	.byte	W04
	.byte		c_v+33
	.byte	W04
	.byte	VOL	, v093
	.byte	BEND	, c_v+37
	.byte	W04
	.byte		c_v+40
	.byte	W04
	.byte	VOL	, v099
	.byte	BEND	, c_v+43
	.byte	W04
	.byte		c_v+47
	.byte	W04
	.byte	VOL	, v106
	.byte	BEND	, c_v+50
	.byte	W04
	.byte		c_v+53
	.byte	W04
	.byte	VOL	, v113
	.byte	BEND	, c_v+57
	.byte	W04
	.byte		c_v+60
	.byte	W04
	.byte	VOL	, v120
	.byte	BEND	, c_v+63
	.byte	W48
	.byte	VOL	, v114
	.byte	BEND	, c_v+63
	.byte	W08
	.byte	VOL	, v104
	.byte	BEND	, c_v+59
	.byte	W08
	.byte	VOL	, v095
	.byte	BEND	, c_v+55
	.byte	W08
	.byte	VOL	, v085
	.byte	BEND	, c_v+51
	.byte	W08
	.byte	VOL	, v076
	.byte	BEND	, c_v+47
	.byte	W08
	.byte	VOL	, v066
	.byte	BEND	, c_v+43
	.byte	W08
	.byte	VOL	, v057
	.byte	BEND	, c_v+39
	.byte	W08
	.byte	VOL	, v047
	.byte	BEND	, c_v+35
	.byte	W08
	.byte	VOL	, v038
	.byte	BEND	, c_v+32
	.byte	W08
	.byte	VOL	, v028
	.byte	BEND	, c_v+28
	.byte	W08
	.byte	VOL	, v019
	.byte	BEND	, c_v+24
	.byte	W08
	.byte	VOL	, v009
	.byte	BEND	, c_v+20
	.byte	W08
	.byte	VOL	, v000
	.byte	BEND	, c_v+16
	.byte	W48
	.byte	VOL	, v010
	.byte	PAN	, c_v+40
	.byte	W04
	.byte	VOL	, v019
	.byte	W04
	.byte		v029
	.byte	W04
	.byte		v039
	.byte	W04
	.byte		v048
	.byte	W04
	.byte		v058
	.byte	W04
	.byte		v068
	.byte	W04
	.byte		v078
	.byte	W04
	.byte		v087
	.byte	W04
	.byte		v097
	.byte	W04
	.byte		v107
	.byte	W04
	.byte		v117
	.byte	W04
	.byte		v127
	.byte	BEND	, c_v+16
	.byte	W08
	.byte		c_v+18
	.byte	W08
	.byte		c_v+21
	.byte	W08
	.byte		c_v+23
	.byte	W08
	.byte		c_v+26
	.byte	W08
	.byte		c_v+29
	.byte	W08
	.byte		c_v+32
	.byte	W08
	.byte		c_v+30
	.byte	W08
	.byte		c_v+28
	.byte	W08
	.byte		c_v+26
	.byte	W08
	.byte		c_v+24
	.byte	W08
	.byte		c_v+22
	.byte	W08
	.byte		c_v+20
	.byte	W08
	.byte		c_v+18
	.byte	W08
	.byte		c_v+16
	.byte	W08
	.byte		c_v+14
	.byte	W08
	.byte		c_v+12
	.byte	W08
	.byte		c_v+10
	.byte	W08
	.byte	VOL	, v122
	.byte	BEND	, c_v+8
	.byte	W07
	.byte	VOL	, v117
	.byte	W08
	.byte		v112
	.byte	W08
	.byte		v107
	.byte	W07
	.byte		v102
	.byte	W08
	.byte		v097
	.byte	W08
	.byte		v092
	.byte	W07
	.byte		v087
	.byte	W08
	.byte		v083
	.byte	W08
	.byte		v078
	.byte	W07
	.byte		v073
	.byte	W08
	.byte		v068
	.byte	W08
	.byte		v063
	.byte	W04
	.byte	W03
	.byte		v058
	.byte	W08
	.byte		v053
	.byte	W08
	.byte		v048
	.byte	W07
	.byte		v044
	.byte	W08
	.byte		v039
	.byte	W08
	.byte		v034
	.byte	W07
	.byte		v029
	.byte	W08
	.byte		v024
	.byte	W08
	.byte		v019
	.byte	W07
	.byte		v014
	.byte	W08
	.byte		v009
	.byte	W08
	.byte		v005
	.byte	W08
	.byte		v000
	.byte	W96
	.byte		EOT	
	.byte	GOTO	
		.word	song078_3_1
	.byte	W96
	.byte	FINE

	.align 2
	.global song078
song078:	@ 0x0857A44C
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song078_1		@ track
	.word	song078_2		@ track
	.word	song078_3		@ track
