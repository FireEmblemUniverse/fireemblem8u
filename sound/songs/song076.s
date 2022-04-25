	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song076_1
song076_1:	@ 0x08578B78
	.byte	KEYSH	, 0
	.byte	TEMPO	, 67
	.byte	VOICE	, 3
	.byte	VOL	, v090
	.byte	PAN	, c_v-22
	.byte	BEND	, c_v
	.byte	W24
	.byte		N44	, Bn2, v056
	.byte	W24
song076_1_1:
	.byte	W30
	.byte		N28	, En2, v036
	.byte	W18
	.byte	W18
	.byte			Dn2
	.byte	W48
	.byte	W02
	.byte			Dn2, v052
	.byte	W28
	.byte	W48
	.byte		N92	, Fn1, v072
	.byte	W48
	.byte	W42
	.byte		N28	, Cn3, v052
	.byte	W30
	.byte			Dn2
	.byte	W24
	.byte	W68
	.byte			Bn1, v056
	.byte	W28
	.byte	W32
	.byte		N44	, As2
	.byte	W64
	.byte	W24
	.byte	W02
	.byte		N28	, Dn2, v064
	.byte	W48
	.byte	W02
	.byte			Dn2, v052
	.byte	W20
	.byte	W48
	.byte		N80	, Gn1, v048
	.byte	W48
	.byte	W48
	.byte	GOTO	
		.word	song076_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song076_2
song076_2:	@ 0x08578BBF
	.byte	KEYSH	, 0
	.byte	VOICE	, 4
	.byte	VOL	, v090
	.byte	PAN	, c_v+29
	.byte	BEND	, c_v
	.byte	W12
	.byte		N23	, Fn2, v048
	.byte	W36
song076_2_1:
	.byte	W30
	.byte		N28	, Cn2, v052
	.byte	W18
	.byte	W48
	.byte		N28	
	.byte	W48
	.byte	W18
	.byte			Ds2, v044
	.byte	W06
	.byte	VOICE	, 5
	.byte	W18
	.byte		N17	, An2
	.byte	W02
	.byte	BEND	, c_v-7
	.byte	W04
	.byte		c_v-4
	.byte	W04
	.byte		c_v
	.byte	W04
	.byte		c_v+4
	.byte	W04
	.byte		c_v+7
	.byte		N17	
	.byte	W04
	.byte	BEND	, c_v+11
	.byte	W04
	.byte		c_v+15
	.byte	W04
	.byte		c_v+18
	.byte	W04
	.byte		c_v+22
	.byte	W02
	.byte		N23	
	.byte	W02
	.byte	BEND	, c_v+26
	.byte	W04
	.byte		c_v+29
	.byte	W04
	.byte		c_v+33
	.byte	W04
	.byte		c_v+37
	.byte	W04
	.byte	W96
	.byte		N17	
	.byte	W02
	.byte	BEND	, c_v-7
	.byte	W04
	.byte		c_v-4
	.byte	W04
	.byte		c_v
	.byte	W04
	.byte		c_v+4
	.byte	W04
	.byte		c_v+7
	.byte		N17	
	.byte	W04
	.byte	BEND	, c_v+11
	.byte	W04
	.byte		c_v+15
	.byte	W04
	.byte		c_v+18
	.byte	W04
	.byte		c_v+22
	.byte	W02
	.byte		N32	
	.byte	W02
	.byte	BEND	, c_v+26
	.byte	W04
	.byte		c_v+29
	.byte	W04
	.byte		c_v+33
	.byte	W04
	.byte		c_v+37
	.byte	W44
	.byte	W02
	.byte	W02
	.byte		N08	
	.byte	W12
	.byte		N08	
	.byte	W24
	.byte	W02
	.byte		N17	
	.byte	W02
	.byte	BEND	, c_v-7
	.byte	W04
	.byte		c_v-4
	.byte	W04
	.byte		c_v
	.byte	W04
	.byte		c_v+4
	.byte	W04
	.byte		c_v+7
	.byte	W02
	.byte		N15	
	.byte	W02
	.byte	BEND	, c_v+11
	.byte	W04
	.byte		c_v+15
	.byte	W04
	.byte		c_v+18
	.byte	W04
	.byte		c_v+22
	.byte	W02
	.byte		N23	
	.byte	W02
	.byte	BEND	, c_v+26
	.byte	W04
	.byte		c_v+29
	.byte	W04
	.byte		c_v+33
	.byte	W04
	.byte		c_v+37
	.byte	W06
	.byte	W56
	.byte	W02
	.byte		N08	
	.byte	W12
	.byte		N08	
	.byte	W24
	.byte		N17	
	.byte	W02
	.byte	BEND	, c_v-7
	.byte	W04
	.byte		c_v-4
	.byte	W04
	.byte		c_v
	.byte	W04
	.byte		c_v+4
	.byte	W04
	.byte		c_v+7
	.byte		N17	
	.byte	W04
	.byte	BEND	, c_v+11
	.byte	W04
	.byte		c_v+15
	.byte	W04
	.byte		c_v+18
	.byte	W04
	.byte		c_v+22
	.byte	W02
	.byte		N23	
	.byte	W02
	.byte	BEND	, c_v+26
	.byte	W04
	.byte		c_v+29
	.byte	W04
	.byte		c_v+33
	.byte	W16
	.byte	VOICE	, 4
	.byte	W36
	.byte	W24
	.byte		N23	, Fn2, v048
	.byte	W24
	.byte	GOTO	
		.word	song076_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song076_3
song076_3:	@ 0x08578C81
	.byte	KEYSH	, 0
	.byte	VOICE	, 2
	.byte	VOL	, v007
	.byte	PAN	, c_v-30
	.byte	BEND	, c_v
	.byte		TIE	, Bn1, v036
	.byte	W01
	.byte	VOL	, v007
	.byte	W02
	.byte		v008
	.byte	W01
	.byte		v009
	.byte	W02
	.byte		v009
	.byte	W01
	.byte		v010
	.byte	W02
	.byte		v011
	.byte	W01
	.byte		v012
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v015
	.byte	W02
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W02
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W02
song076_3_1:
	.byte	VOL	, v031
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v053
	.byte	W06
	.byte	BEND	, c_v-10
	.byte	W04
	.byte		c_v-9
	.byte	W04
	.byte		c_v-8
	.byte	W04
	.byte		c_v-6
	.byte	W04
	.byte		c_v-5
	.byte	W04
	.byte		c_v-3
	.byte	W04
	.byte		c_v-2
	.byte	W04
	.byte		c_v
	.byte	W04
	.byte		c_v+1
	.byte	W04
	.byte		c_v+2
	.byte	W04
	.byte		c_v+4
	.byte	W04
	.byte		c_v+5
	.byte	W04
	.byte		c_v+7
	.byte	W04
	.byte		c_v+8
	.byte	W04
	.byte		c_v+10
	.byte	W04
	.byte		c_v+11
	.byte	W04
	.byte		c_v+13
	.byte	W04
	.byte		c_v+14
	.byte	W04
	.byte		c_v+15
	.byte	W04
	.byte		c_v+17
	.byte	W04
	.byte		c_v+18
	.byte	W04
	.byte		c_v+20
	.byte	W04
	.byte		c_v+21
	.byte	W04
	.byte		c_v+23
	.byte	W04
	.byte		c_v+24
	.byte	W04
	.byte		c_v+25
	.byte	W04
	.byte		c_v+27
	.byte	W04
	.byte		c_v+28
	.byte	W04
	.byte		c_v+30
	.byte	W04
	.byte		c_v+31
	.byte	W04
	.byte		c_v+33
	.byte	W04
	.byte		c_v+34
	.byte	W04
	.byte		c_v+36
	.byte	W04
	.byte		c_v+37
	.byte	W04
	.byte		c_v+38
	.byte	W04
	.byte		c_v+40
	.byte	W04
	.byte		c_v+41
	.byte	W04
	.byte		c_v+43
	.byte	W04
	.byte		c_v+44
	.byte	W04
	.byte		c_v+46
	.byte	W04
	.byte		c_v+47
	.byte	W04
	.byte		c_v+48
	.byte	W03
	.byte	VOL	, v053
	.byte	W01
	.byte		v051
	.byte	BEND	, c_v+50
	.byte	W02
	.byte	VOL	, v050
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	BEND	, c_v+51
	.byte	W02
	.byte	VOL	, v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v046
	.byte	BEND	, c_v+53
	.byte	W02
	.byte	VOL	, v046
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	BEND	, c_v+54
	.byte	W02
	.byte	VOL	, v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	BEND	, c_v+56
	.byte	W02
	.byte	VOL	, v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	BEND	, c_v+57
	.byte	W02
	.byte	VOL	, v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	BEND	, c_v+50
	.byte	W02
	.byte	VOL	, v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	BEND	, c_v+48
	.byte	W02
	.byte	VOL	, v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	BEND	, c_v+46
	.byte	W02
	.byte	VOL	, v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	BEND	, c_v+44
	.byte	W02
	.byte	VOL	, v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	BEND	, c_v+42
	.byte	W02
	.byte	VOL	, v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	BEND	, c_v+40
	.byte	W02
	.byte	VOL	, v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	BEND	, c_v+38
	.byte	W01
	.byte	VOL	, v023
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v019
	.byte	BEND	, c_v+36
	.byte	W04
	.byte	VOL	, v019
	.byte	BEND	, c_v+34
	.byte	W04
	.byte	VOL	, v020
	.byte	BEND	, c_v+32
	.byte	W02
	.byte	VOL	, v021
	.byte	W02
	.byte		v021
	.byte	BEND	, c_v+30
	.byte	W04
	.byte	VOL	, v022
	.byte	BEND	, c_v+28
	.byte	W04
	.byte	VOL	, v023
	.byte	BEND	, c_v+26
	.byte	W02
	.byte	VOL	, v024
	.byte	W02
	.byte		v024
	.byte	BEND	, c_v+24
	.byte	W04
	.byte	VOL	, v025
	.byte	BEND	, c_v+22
	.byte	W02
	.byte	VOL	, v026
	.byte	W02
	.byte		v026
	.byte	BEND	, c_v+20
	.byte	W04
	.byte	VOL	, v027
	.byte	BEND	, c_v+18
	.byte	W04
	.byte	VOL	, v028
	.byte	BEND	, c_v+16
	.byte	W02
	.byte	VOL	, v029
	.byte	W02
	.byte		v029
	.byte	BEND	, c_v+14
	.byte	W04
	.byte	VOL	, v030
	.byte	BEND	, c_v+12
	.byte	W02
	.byte	VOL	, v031
	.byte	W02
	.byte		v031
	.byte	BEND	, c_v+10
	.byte	W04
	.byte	VOL	, v032
	.byte	BEND	, c_v+8
	.byte	W04
	.byte	VOL	, v033
	.byte	BEND	, c_v+6
	.byte	W02
	.byte	VOL	, v034
	.byte	W02
	.byte		v034
	.byte	BEND	, c_v+4
	.byte	W04
	.byte	VOL	, v035
	.byte	BEND	, c_v+2
	.byte	W04
	.byte	VOL	, v036
	.byte	BEND	, c_v-1
	.byte	W02
	.byte	VOL	, v036
	.byte	W02
	.byte		v037
	.byte	BEND	, c_v-3
	.byte	W04
	.byte	VOL	, v038
	.byte	BEND	, c_v-5
	.byte	W02
	.byte	VOL	, v038
	.byte	W02
	.byte		v039
	.byte	BEND	, c_v-7
	.byte	W04
	.byte	VOL	, v040
	.byte	BEND	, c_v-9
	.byte	W04
	.byte	VOL	, v041
	.byte	BEND	, c_v-11
	.byte	W02
	.byte	VOL	, v041
	.byte	W02
	.byte		v042
	.byte	BEND	, c_v-13
	.byte	W04
	.byte	VOL	, v043
	.byte	BEND	, c_v-15
	.byte	W04
	.byte		c_v-17
	.byte	W03
	.byte	VOL	, v043
	.byte	W01
	.byte		v040
	.byte	BEND	, c_v-19
	.byte	W04
	.byte	VOL	, v039
	.byte	BEND	, c_v-21
	.byte	W04
	.byte	VOL	, v038
	.byte	BEND	, c_v-23
	.byte	W04
	.byte	VOL	, v038
	.byte	BEND	, c_v-25
	.byte	W04
	.byte	VOL	, v037
	.byte	BEND	, c_v-27
	.byte	W02
	.byte	VOL	, v036
	.byte	W02
	.byte		v036
	.byte	BEND	, c_v-29
	.byte	W04
	.byte	VOL	, v035
	.byte	BEND	, c_v-31
	.byte	W04
	.byte	VOL	, v034
	.byte	BEND	, c_v-33
	.byte	W04
	.byte	VOL	, v034
	.byte	BEND	, c_v-35
	.byte	W04
	.byte	VOL	, v033
	.byte	BEND	, c_v-37
	.byte	W02
	.byte	VOL	, v032
	.byte	W02
	.byte		v031
	.byte	BEND	, c_v-39
	.byte	W04
	.byte	VOL	, v031
	.byte	BEND	, c_v-41
	.byte	W04
	.byte	VOL	, v030
	.byte	BEND	, c_v-43
	.byte	W04
	.byte	VOL	, v029
	.byte	BEND	, c_v-45
	.byte	W04
	.byte	VOL	, v029
	.byte	BEND	, c_v-47
	.byte	W02
	.byte	VOL	, v028
	.byte	W02
	.byte		v027
	.byte	BEND	, c_v-49
	.byte	W04
	.byte	VOL	, v026
	.byte	W04
	.byte		v026
	.byte	W04
	.byte		v025
	.byte	W04
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v023
	.byte	W04
	.byte		v022
	.byte	W04
	.byte		v021
	.byte	W04
	.byte		v021
	.byte	W04
	.byte		v020
	.byte	W32
	.byte	W03
	.byte		v020
	.byte	W01
	.byte		v016
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v018
	.byte	W02
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v023
	.byte	BEND	, c_v-25
	.byte	W02
	.byte	VOL	, v024
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v026
	.byte	W01
	.byte	BEND	, c_v-24
	.byte	W01
	.byte	VOL	, v026
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v028
	.byte	W01
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v029
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W01
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W01
	.byte	BEND	, c_v-21
	.byte	W01
	.byte	VOL	, v033
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v035
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	BEND	, c_v-19
	.byte	W02
	.byte	VOL	, v038
	.byte	W04
	.byte	BEND	, c_v-18
	.byte	W06
	.byte		c_v-17
	.byte	W06
	.byte		c_v-16
	.byte	W06
	.byte		c_v-15
	.byte	W09
	.byte	VOL	, v039
	.byte	BEND	, c_v-14
	.byte	W06
	.byte		c_v-13
	.byte	W04
	.byte	VOL	, v038
	.byte	W02
	.byte	BEND	, c_v-12
	.byte	W02
	.byte	VOL	, v038
	.byte	W04
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v037
	.byte	W02
	.byte	W03
	.byte		v036
	.byte	BEND	, c_v-10
	.byte	W05
	.byte	VOL	, v036
	.byte	W04
	.byte		v035
	.byte	BEND	, c_v-9
	.byte	W05
	.byte	VOL	, v034
	.byte	W01
	.byte	BEND	, c_v-8
	.byte	W04
	.byte	VOL	, v034
	.byte	W02
	.byte	BEND	, c_v-7
	.byte	W03
	.byte	VOL	, v033
	.byte	W03
	.byte	BEND	, c_v-6
	.byte	W01
	.byte	VOL	, v032
	.byte	W05
	.byte		v031
	.byte	BEND	, c_v-5
	.byte	W05
	.byte	VOL	, v031
	.byte	W04
	.byte	BEND	, c_v-4
	.byte	W01
	.byte	VOL	, v030
	.byte	W04
	.byte		v029
	.byte	W01
	.byte	BEND	, c_v-3
	.byte	W04
	.byte	VOL	, v029
	.byte	W02
	.byte	BEND	, c_v-2
	.byte	W03
	.byte	VOL	, v028
	.byte	W03
	.byte	BEND	, c_v-1
	.byte	W02
	.byte	VOL	, v027
	.byte	W04
	.byte		v026
	.byte	BEND	, c_v
	.byte	W05
	.byte	VOL	, v026
	.byte	W04
	.byte	BEND	, c_v+1
	.byte	W01
	.byte	VOL	, v025
	.byte	W05
	.byte		v024
	.byte	BEND	, c_v+2
	.byte	W04
	.byte	VOL	, v024
	.byte	W02
	.byte	BEND	, c_v+3
	.byte	W03
	.byte	VOL	, v023
	.byte	W03
	.byte	BEND	, c_v+4
	.byte	W02
	.byte	VOL	, v022
	.byte	W04
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v021
	.byte	W04
	.byte		v021
	.byte	W04
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v020
	.byte	W05
	.byte		v019
	.byte	BEND	, c_v+7
	.byte	W05
	.byte	VOL	, v019
	.byte	W01
	.byte	BEND	, c_v+8
	.byte	W03
	.byte	VOL	, v018
	.byte	W03
	.byte	BEND	, c_v+9
	.byte	W02
	.byte	VOL	, v017
	.byte	W04
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v016
	.byte	W08
	.byte	GOTO	
		.word	song076_3_1
	.byte	BEND	, c_v+11
	.byte	W06
	.byte		c_v+12
	.byte	W06
	.byte		c_v+13
	.byte	W06
	.byte		c_v+14
	.byte	W06
	.byte		c_v+15
	.byte	W09
	.byte		c_v+16
	.byte	W06
	.byte		c_v+17
	.byte	W06
	.byte		c_v+18
	.byte	W02
	.byte		EOT	, Bn1
	.byte	W01
	.byte	W03
	.byte	BEND	, c_v+19
	.byte	W06
	.byte		c_v+20
	.byte	W09
	.byte		c_v+21
	.byte	W06
	.byte		c_v+22
	.byte	W06
	.byte		c_v+23
	.byte	W06
	.byte		c_v+24
	.byte	W06
	.byte		c_v+25
	.byte	W06
	.byte		c_v+26
	.byte	W09
	.byte		c_v+25
	.byte	W09
	.byte		c_v+24
	.byte	W06
	.byte		c_v+23
	.byte	W09
	.byte		c_v+22
	.byte	W09
	.byte		c_v+21
	.byte	W06
	.byte		c_v+20
	.byte	W09
	.byte		c_v+19
	.byte	W09
	.byte		c_v+18
	.byte	W06
	.byte		c_v+17
	.byte	W09
	.byte		c_v+16
	.byte	W09
	.byte		c_v+15
	.byte	W06
	.byte		c_v+14
	.byte	W09
	.byte		c_v+13
	.byte	W09
	.byte		c_v+12
	.byte	W06
	.byte		c_v+11
	.byte	W09
	.byte		c_v+10
	.byte	W09
	.byte		c_v+9
	.byte	W06
	.byte		c_v+8
	.byte	W09
	.byte		c_v+7
	.byte	W09
	.byte		c_v+6
	.byte	W06
	.byte		c_v+5
	.byte	W09
	.byte		c_v+4
	.byte	W09
	.byte		c_v+3
	.byte	W06
	.byte		c_v+2
	.byte	W09
	.byte		c_v+1
	.byte	W09
	.byte		c_v
	.byte	W06
	.byte		c_v-1
	.byte	W09
	.byte		c_v-2
	.byte	W09
	.byte		c_v-3
	.byte	W06
	.byte		c_v-4
	.byte	W09
	.byte		c_v-5
	.byte	W09
	.byte		c_v-6
	.byte	W06
	.byte		c_v-7
	.byte	W09
	.byte		c_v-8
	.byte	W09
	.byte		c_v-9
	.byte	W06
	.byte		c_v-10
	.byte	W09
	.byte		c_v-11
	.byte	W09
	.byte		c_v-12
	.byte	W06
	.byte		c_v-13
	.byte	W09
	.byte		c_v-14
	.byte	W09
	.byte		c_v-15
	.byte	W06
	.byte		c_v-16
	.byte	W09
	.byte		c_v-17
	.byte	W09
	.byte		c_v-18
	.byte	W06
	.byte		c_v-19
	.byte	W09
	.byte		c_v-20
	.byte	W09
	.byte		c_v-21
	.byte	W06
	.byte		c_v-22
	.byte	W09
	.byte		c_v-23
	.byte	W09
	.byte		c_v-24
	.byte	W06
	.byte		c_v-25
	.byte	W09
	.byte		c_v-26
	.byte	W09
	.byte		c_v-27
	.byte	W06
	.byte		c_v-40
	.byte	W09
	.byte		c_v-39
	.byte	W06
	.byte		c_v-38
	.byte	W06
	.byte		c_v-37
	.byte	W06
	.byte		c_v-36
	.byte	W06
	.byte		c_v-35
	.byte	W06
	.byte		c_v-34
	.byte	W09
	.byte		c_v-33
	.byte	W06
	.byte		c_v-32
	.byte	W06
	.byte		c_v-31
	.byte	W06
	.byte		c_v-30
	.byte	W06
	.byte		c_v-29
	.byte	W06
	.byte		c_v-28
	.byte	W06
	.byte		c_v-27
	.byte	W09
	.byte		c_v-26
	.byte	W03
	.byte	W03
	.byte		c_v-25
	.byte	W06
	.byte		c_v-24
	.byte	W06
	.byte		c_v-23
	.byte	W06
	.byte		c_v-22
	.byte	W06
	.byte		c_v-21
	.byte	W06
	.byte		c_v-20
	.byte	W09
	.byte		c_v-19
	.byte	W06
	.byte		c_v-18
	.byte	W06
	.byte		c_v-17
	.byte	W06
	.byte		c_v-16
	.byte	W06
	.byte		c_v-15
	.byte	W06
	.byte		c_v-14
	.byte	W09
	.byte		c_v-13
	.byte	W06
	.byte		c_v-12
	.byte	W06
	.byte		c_v-11
	.byte	W03
	.byte	W03
	.byte		c_v-10
	.byte	W06
	.byte		c_v-9
	.byte	W06
	.byte		c_v-8
	.byte	W06
	.byte		c_v-7
	.byte	W09
	.byte		c_v-6
	.byte	W06
	.byte		c_v-5
	.byte	W06
	.byte		c_v-4
	.byte	W06
	.byte		c_v-3
	.byte	W06
	.byte		c_v-2
	.byte	W06
	.byte		c_v-1
	.byte	W06
	.byte		c_v
	.byte	W09
	.byte		c_v+1
	.byte	W06
	.byte		c_v+2
	.byte	W06
	.byte		c_v+3
	.byte	W06
	.byte		c_v+4
	.byte	W03
	.byte	W03
	.byte		c_v+5
	.byte	W06
	.byte		c_v+6
	.byte	W09
	.byte		c_v+7
	.byte	W06
	.byte		c_v+8
	.byte	W06
	.byte		c_v+9
	.byte	W06
	.byte		c_v+10
	.byte	W06
	.byte		c_v+11
	.byte	W06
	.byte		c_v+12
	.byte	W06
	.byte		c_v+13
	.byte	W09
	.byte		c_v+14
	.byte	W06
	.byte		c_v+15
	.byte	W06
	.byte		c_v+16
	.byte	W06
	.byte		c_v+17
	.byte	W06
	.byte		c_v+18
	.byte	W06
	.byte		c_v+19
	.byte	W03
	.byte	W30
	.byte		c_v+11
	.byte	W03
	.byte		c_v+10
	.byte	W03
	.byte		c_v+9
	.byte	W03
	.byte		c_v+8
	.byte	W03
	.byte		c_v+7
	.byte	W03
	.byte		c_v+5
	.byte	W03
	.byte		c_v+4
	.byte	W03
	.byte		c_v+3
	.byte	W03
	.byte		c_v+2
	.byte	W03
	.byte		c_v
	.byte	W03
	.byte		c_v-1
	.byte	W03
	.byte		c_v-2
	.byte	W03
	.byte		c_v-3
	.byte	W03
	.byte		c_v-4
	.byte	W03
	.byte		c_v-6
	.byte	W03
	.byte		c_v-7
	.byte	W03
	.byte		c_v-8
	.byte	W03
	.byte		c_v-9
	.byte	W03
	.byte		c_v-11
	.byte	W03
	.byte		c_v-12
	.byte	W03
	.byte		c_v-13
	.byte	W03
	.byte		c_v-14
	.byte	W03
	.byte		c_v-15
	.byte	W03
	.byte		c_v-17
	.byte	W03
	.byte		c_v-18
	.byte	W03
	.byte		c_v-19
	.byte	W03
	.byte		c_v-20
	.byte	W03
	.byte		c_v-22
	.byte	W03
	.byte		c_v-23
	.byte	W03
	.byte		c_v-24
	.byte	W03
	.byte		c_v-25
	.byte	W03
	.byte		c_v-26
	.byte	W03
	.byte		c_v-28
	.byte	W03
	.byte		c_v-29
	.byte	W03
	.byte		c_v-30
	.byte	W03
	.byte		c_v-31
	.byte	W03
	.byte		c_v-33
	.byte	W03
	.byte		c_v-34
	.byte	W03
	.byte		c_v-35
	.byte	W03
	.byte		c_v-36
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v-39
	.byte	W03
	.byte		c_v-40
	.byte	W03
	.byte		c_v-41
	.byte	W03
	.byte		c_v-42
	.byte	W03
	.byte		c_v-44
	.byte	W03
	.byte		c_v-45
	.byte	W03
	.byte		c_v-46
	.byte	W03
	.byte		c_v-47
	.byte	W03
	.byte		c_v-48
	.byte	W03
	.byte		c_v-50
	.byte	W03
	.byte		c_v-51
	.byte	W03
	.byte		c_v-52
	.byte	W03
	.byte		c_v-53
	.byte	FINE

	.align 2
	.global song076
song076:	@ 0x0857916C
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	128		@ reverb

	.word	voicegroup085		@ voicegroup/tone

	.word	song076_1		@ track
	.word	song076_2		@ track
	.word	song076_3		@ track
