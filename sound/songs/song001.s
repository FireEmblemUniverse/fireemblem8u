	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song001_1
song001_1:	@ 0x085451D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 56
	.byte	W48
	.byte	TEMPO	, 60
	.byte	W48
	.byte	W72
	.byte	VOICE	, 51
	.byte	W12
	.byte	VOL	, v046
	.byte	W06
	.byte	PAN	, c_v-24
	.byte	W06
	.byte	W72
	.byte		N04	, En4, v092
	.byte	W04
	.byte			Fs4
	.byte	W04
	.byte			Gs4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Bn4
	.byte	W04
	.byte			Cs5
	.byte	W04
	.byte	TEMPO	, 72
	.byte		N06	, Ds5
	.byte	W09
	.byte			Ds5, v032
	.byte	W84
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N32	, Fs4, v084
	.byte	W36
	.byte		N05	, En4, v096
	.byte	W06
	.byte			Ds4, v092
	.byte	W06
	.byte		N23	, Cs4
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte			En4
	.byte	W24
	.byte			Fs4
	.byte	W24
	.byte		N05	, Cs4, v127
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Fs3, v127
	.byte	W06
	.byte			Fs3, v060
	.byte	W06
	.byte			Cs4, v127
	.byte	W06
	.byte			Cs4, v060
	.byte	W06
	.byte			Fs3, v127
	.byte	W06
	.byte			Fs3, v060
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v060
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v060
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v060
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v060
	.byte	W06
	.byte			En4, v127
	.byte	W06
	.byte			En4, v060
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v060
	.byte	W06
	.byte			En4, v127
	.byte	W06
	.byte			En4, v060
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v060
	.byte	W06
	.byte			Cs3, v127
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Cs5
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v100
	.byte	W06
	.byte			Bn3, v127
	.byte	W06
	.byte			Bn3, v100
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs4, v127
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			Ds4, v127
	.byte	W06
	.byte			Ds4, v100
	.byte	W06
	.byte			Bn3, v127
	.byte	W06
	.byte			Bn3, v100
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs4, v127
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v100
	.byte	W06
	.byte			Cs4, v127
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs4, v127
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			Fn4, v127
	.byte	W06
	.byte			Fn4, v100
	.byte	W06
	.byte			Cs4, v127
	.byte	W06
	.byte			Cs4, v100
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs4, v127
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			En4, v127
	.byte	W06
	.byte			En4, v100
	.byte	W06
	.byte			Bn3, v127
	.byte	W06
	.byte			Bn3, v100
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs4, v127
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			En4, v127
	.byte	W06
	.byte			En4, v100
	.byte	W06
	.byte			Bn3, v127
	.byte	W06
	.byte			Bn3, v100
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Gs4, v127
	.byte	W06
	.byte			Gs4, v100
	.byte	W06
	.byte			En4, v127
	.byte	W06
	.byte			En4, v100
	.byte	W06
	.byte			Bn3, v127
	.byte	W06
	.byte			Bn3, v100
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Gs3, v100
	.byte	W06
	.byte			Bn2, v127
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Bn4
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			Bn4, v127
	.byte	W06
	.byte			Bn4, v100
	.byte	W06
	.byte			Fs4, v127
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Dn4, v127
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Bn4, v127
	.byte	W06
	.byte			Bn4, v100
	.byte	W06
	.byte			Fs4, v127
	.byte	W06
	.byte			Fs4, v100
	.byte	W06
	.byte			Dn4, v127
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			Bn3, v127
	.byte	W06
	.byte			Bn3, v100
	.byte	W06
	.byte			As4, v127
	.byte	W06
	.byte			As4, v100
	.byte	W06
	.byte			Gn4, v127
	.byte	W06
	.byte			Gn4, v100
	.byte	W06
	.byte			Dn4, v127
	.byte	W06
	.byte			Dn4, v100
	.byte	W06
	.byte			As3, v127
	.byte	W06
	.byte			As3, v100
	.byte	W06
	.byte			As4, v127
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		TIE	, Cs3
	.byte	W48
	.byte	TEMPO	, 68
	.byte	W48
	.byte	W96
	.byte	TEMPO	, 76
	.byte	W02
	.byte		EOT	
	.byte	W92
	.byte	W02
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N08	, Fn4, v100
	.byte	W08
	.byte			Gn4
	.byte	W08
	.byte			Gs4
	.byte	W08
	.byte			As4
	.byte	W08
	.byte			Cn5
	.byte	W08
	.byte			Dn5
	.byte	W08
	.byte		TIE	, Ds5, v096
	.byte	W02
	.byte	VOL	, v046
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v016
	.byte	W02
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W02
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W02
	.byte		v015
	.byte	W01
	.byte		v015
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W02
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W02
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W02
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W02
	.byte		v008
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W02
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W02
	.byte		v006
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W02
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W02
	.byte		v004
	.byte	W01
	.byte		v004
	.byte	W02
	.byte		v003
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W02
	.byte		v002
	.byte	W01
	.byte		v002
	.byte	W03
	.byte		v001
	.byte	W02
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v000
	.byte	FINE

	@********************** Track  2 **********************@

	.global song001_2
song001_2:	@ 0x085454C5
	.byte	KEYSH	, 0
	.byte	W24
	.byte	VOICE	, 33
	.byte	W24
	.byte	VOL	, v051
	.byte	W24
	.byte	PAN	, c_v
	.byte	W24
	.byte	W96
	.byte	W96
song001_2_1:
	.byte		N09	, Gs1, v127
	.byte	W36
	.byte		N09	
	.byte	W36
	.byte		N09	
	.byte	W24
	.byte	PEND
song001_2_2:
	.byte	W12
	.byte		N09	, Gs1, v127
	.byte	W36
	.byte		N09	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte		N09	, Fs2, v127
	.byte	W36
	.byte		N09	
	.byte	W36
	.byte		N09	
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			Dn2
	.byte	W36
	.byte		N09	
	.byte	W36
	.byte		N12	
	.byte	W12
	.byte		N06	, Cs2
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte	VOICE	, 54
	.byte	VOL	, v051
	.byte	PAN	, c_v+5
	.byte		TIE	, Cs1, v104
	.byte	W96
	.byte	W92
	.byte	W01
	.byte		EOT	
	.byte	W03
	.byte	VOICE	, 33
	.byte	VOL	, v051
	.byte	PAN	, c_v
	.byte		N12	, Cn2, v127
	.byte	W68
	.byte	W01
	.byte		N06	
	.byte	W19
	.byte		N06	
	.byte	W08
	.byte		N12	
	.byte	W72
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W48
	.byte		N12	
	.byte	W48
	.byte		N12	
	.byte	W48
	.byte		N12	
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		TIE	, Gn1, v124
	.byte	W48
	.byte	VOL	, v051
	.byte	W02
	.byte		v050
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W02
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W02
	.byte		v009
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W02
	.byte		v006
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W02
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W02
	.byte		EOT	
	.byte	VOL	, v000
	.byte	FINE

	@********************** Track  3 **********************@

	.global song001_3
song001_3:	@ 0x08545661
	.byte	KEYSH	, 0
	.byte	W24
	.byte	VOICE	, 54
	.byte	W24
	.byte	VOL	, v024
	.byte	PAN	, c_v+5
	.byte	VOL	, v027
	.byte		TIE	, Gs0, v104
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v051
	.byte	W05
	.byte		v049
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v019
	.byte	W05
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v021
	.byte	W03
	.byte		v021
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W03
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W01
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W03
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W03
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W03
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W03
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W03
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W03
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v042
	.byte	W03
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W02
	.byte		v043
	.byte	W03
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W03
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W03
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W03
	.byte		v048
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v050
	.byte	W03
	.byte		v051
	.byte	W44
	.byte	W01
	.byte		EOT	
	.byte	W01
	.byte	VOICE	, 56
	.byte	VOL	, v040
	.byte	PAN	, c_v-10
	.byte		N24	, Gs2
	.byte	W30
	.byte		N06	
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte		N24	, Ds3
	.byte	W24
	.byte	W03
	.byte		N06	, Ds3, v032
	.byte	W09
	.byte			Gs3, v104
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte		N44	, Fs3, v104
	.byte	W48
	.byte		N24	, Fn3
	.byte	W24
	.byte		N06	, Fn3, v032
	.byte	W12
	.byte			Cs3, v104
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N44	, En3
	.byte	W48
	.byte		N60	, Bn2
	.byte	W48
	.byte	W15
	.byte		N06	, Bn2, v032
	.byte	W09
	.byte		N21	, Bn2, v104
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte		N32	, Fs3
	.byte	W36
	.byte		N05	, En3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N64	, Cs3
	.byte	W48
	.byte	W18
	.byte		N06	, Cs3, v032
	.byte	W06
	.byte		N17	, Bn2, v112
	.byte	W18
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte		N17	, Cs3, v112
	.byte	W18
	.byte		N06	, Cs3, v032
	.byte	W06
	.byte		N17	, Ds3, v120
	.byte	W18
	.byte		N06	, Ds3, v032
	.byte	W06
	.byte		N42	, Cs3, v096
	.byte	W42
	.byte		N06	, Cs3, v032
	.byte	W06
	.byte		N42	, Ds3, v104
	.byte	W42
	.byte		N06	, Ds3, v032
	.byte	W06
	.byte		N42	, En3, v112
	.byte	W42
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N42	, Fs3, v120
	.byte	W42
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 50
	.byte	VOL	, v018
	.byte	PAN	, c_v-30
	.byte		N05	, Cs2, v096
	.byte	W06
	.byte			Cs2, v080
	.byte	W03
	.byte	VOL	, v018
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v020
	.byte		N05	, Dn2, v096
	.byte	W01
	.byte	VOL	, v021
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte		N05	, Dn2, v080
	.byte	W01
	.byte	VOL	, v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte		N05	, Cs2, v096
	.byte	W01
	.byte	VOL	, v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte		N05	, Cs2, v080
	.byte	W01
	.byte	VOL	, v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte		N05	, Dn2, v096
	.byte	W01
	.byte	VOL	, v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte		N05	, Dn2, v080
	.byte	W01
	.byte	VOL	, v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v046
	.byte		N05	, Cs2, v096
	.byte	W01
	.byte	VOL	, v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte		N05	, Cs2, v080
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte			Dn2, v080
	.byte	W06
	.byte			Cs2, v096
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte			Dn2, v080
	.byte	W06
	.byte			Cs2, v096
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte			Dn2, v080
	.byte	W06
	.byte			Cs2, v096
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte			Dn2, v080
	.byte	W06
	.byte			Ds2, v096
	.byte	W06
	.byte			Ds2, v080
	.byte	W06
	.byte			En2, v096
	.byte	W06
	.byte			En2, v080
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte			Dn2, v080
	.byte	W06
	.byte			Cs2, v096
	.byte	W06
	.byte			Cs2, v080
	.byte	W06
	.byte	VOICE	, 59
	.byte	VOL	, v036
	.byte	PAN	, c_v
	.byte		N23	, Gn2, v088
	.byte		N23	, Cn3, v100
	.byte	W24
	.byte		N06	, Gn2, v088
	.byte		N06	, Cn3, v100
	.byte	W08
	.byte			As2, v088
	.byte		N06	, Dn3, v100
	.byte	W08
	.byte			Cn3, v088
	.byte		N06	, Ds3, v100
	.byte	W08
	.byte		N24	, Ds3, v088
	.byte		N24	, Gn3, v100
	.byte	W24
	.byte	W03
	.byte		N06	, Ds3, v040
	.byte		N06	, Gn3
	.byte	W13
	.byte			Gn3, v088
	.byte		N06	, Cn4, v100
	.byte	W08
	.byte		N44	, Fn3, v088
	.byte		N44	, As3, v100
	.byte	W48
	.byte		N24	, Ds3, v088
	.byte		N24	, An3, v100
	.byte	W24
	.byte		N06	, Ds3, v040
	.byte		N06	, An3
	.byte	W24
	.byte		N68	, Cs3, v084
	.byte		N68	, Fs3, v100
	.byte	W72
	.byte		N06	, Dn3, v076
	.byte		N06	, Gs3, v096
	.byte	W08
	.byte			Cs3, v068
	.byte		N06	, Fs3, v088
	.byte	W08
	.byte			Dn3, v072
	.byte		N06	, Gs3, v088
	.byte	W08
	.byte		N42	, Dn3, v080
	.byte		N42	, An3, v100
	.byte	W42
	.byte		N06	, Dn3, v040
	.byte		N06	, An3
	.byte	W06
	.byte	FINE

	@********************** Track  4 **********************@

	.global song001_4
song001_4:	@ 0x085458F3
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W36
	.byte	W03
	.byte	VOICE	, 61
	.byte	W03
	.byte	VOL	, v046
	.byte	W03
	.byte	PAN	, c_v+17
	.byte	W48
	.byte	W03
	.byte	W96
song001_4_1:
	.byte		N24	, Ds2, v104
	.byte		N24	, Gs2
	.byte	W30
	.byte		N06	, Ds2
	.byte		N06	, Gs2
	.byte	W06
	.byte			Fs2
	.byte		N06	, As2
	.byte	W06
	.byte			Gs2
	.byte		N06	, Bn2
	.byte	W06
	.byte		N24	
	.byte		N24	, Ds3
	.byte	W24
	.byte	W03
	.byte		N06	, Ds3, v032
	.byte	W09
	.byte			Ds3, v104
	.byte		N06	, Gs3
	.byte	W06
	.byte			Gs3, v032
	.byte	W06
	.byte	PEND
song001_4_2:
	.byte		N44	, Cs3, v104
	.byte		N44	, Fs3
	.byte	W48
	.byte		N24	, Cs3
	.byte		N24	, Fn3
	.byte	W24
	.byte		N06	, Fn3, v032
	.byte	W12
	.byte			Gs2, v104
	.byte		N06	, Cs3
	.byte	W06
	.byte			As2
	.byte		N06	, Ds3
	.byte	W06
	.byte	PEND
song001_4_3:
	.byte		N44	, Bn2, v104
	.byte		N44	, En3
	.byte	W48
	.byte		N60	, En2
	.byte		N60	, Bn2
	.byte	W48
	.byte	PEND
	.byte	W12
	.byte		N06	, Bn2, v032
	.byte	W12
	.byte		N21	, Bn2, v104
	.byte	W24
	.byte			Cs3
	.byte	W24
	.byte			Ds3
	.byte	W24
	.byte		N32	, Cs3
	.byte		N32	, Fs3
	.byte	W36
	.byte		N05	, Bn2
	.byte		N05	, En3
	.byte	W06
	.byte			An2
	.byte		N05	, Ds3
	.byte	W06
	.byte		N64	, Gs2
	.byte		N64	, Cs3
	.byte	W48
	.byte	W18
	.byte		N06	, Cs3, v032
	.byte	W06
	.byte		N17	, Fs2, v112
	.byte		N17	, Bn2
	.byte	W18
	.byte		N06	, Bn2, v032
	.byte	W06
	.byte		N17	, Gs2, v112
	.byte		N17	, Cs3
	.byte	W18
	.byte		N06	, Cs3, v032
	.byte	W06
	.byte		N17	, An2, v120
	.byte		N17	, Ds3
	.byte	W18
	.byte		N06	, Ds3, v032
	.byte	W06
	.byte		N36	, As2, v088
	.byte		N42	, Cs3, v104
	.byte	W42
	.byte		N06	, Cs3, v032
	.byte	W06
	.byte		N36	, Bn2, v080
	.byte		N42	, Ds3, v096
	.byte	W42
	.byte		N06	, Ds3, v032
	.byte	W06
	.byte		N36	, Cs3, v100
	.byte		N42	, En3, v112
	.byte	W42
	.byte		N06	, En3, v032
	.byte	W06
	.byte		N36	, Ds3, v108
	.byte		N42	, Fs3, v124
	.byte	W42
	.byte		N06	, Fs3, v032
	.byte	W06
	.byte	PATT	
		.word	song001_4_1
	.byte	PATT	
		.word	song001_4_2
	.byte	PATT	
		.word	song001_4_3
	.byte	W12
	.byte		N06	, Bn2, v032
	.byte	W12
	.byte		N21	, Fs2, v104
	.byte		N21	, As2
	.byte	W24
	.byte			Gs2
	.byte		N21	, Bn2
	.byte	W24
	.byte			As2
	.byte		N21	, Cs3
	.byte	W24
	.byte		N44	, Bn2
	.byte		N32	, Dn3
	.byte	W36
	.byte		N05	, Cs3
	.byte	W06
	.byte		N06	, Dn3, v084
	.byte	W06
	.byte		N44	, Cs3, v104
	.byte		N48	, En3
	.byte	W48
	.byte		N44	, Dn3
	.byte		N32	, Fn3
	.byte	W36
	.byte		N06	, Gn3, v084
	.byte	W06
	.byte			Fn3, v092
	.byte	W06
	.byte		N36	, Dn3, v104
	.byte		N36	, Gn3, v096
	.byte	W36
	.byte		N04	, Fn3, v084
	.byte	W04
	.byte			Ds3, v080
	.byte	W04
	.byte			Dn3, v088
	.byte	W04
	.byte		TIE	, Cs3, v108
	.byte	W96
	.byte		N92	, An2
	.byte	W84
	.byte	W03
	.byte		EOT	, Cs3
	.byte	W09
	.byte		TIE	, Cn3, v076
	.byte		TIE	, Gn3, v096
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	, Cn3
	.byte	W01
	.byte		N92	, Cs3, v084
	.byte	W23
	.byte		EOT	, Gn3
	.byte	W01
	.byte		N06	, Gn3, v032
	.byte	W24
	.byte		N68	, Gs3, v100
	.byte	W48
	.byte		N92	, Dn3, v088
	.byte	W24
	.byte		N06	, Gs3, v032
	.byte	W24
	.byte		N44	, An3, v112
	.byte	W48
	.byte		TIE	, Ds3, v092
	.byte		TIE	, Fn3
	.byte		TIE	, As3, v104
	.byte	W02
	.byte	VOL	, v046
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W02
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W02
	.byte		v015
	.byte	W01
	.byte		v015
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W02
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W02
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W02
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W02
	.byte		v008
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W02
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W02
	.byte		v006
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W02
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W02
	.byte		v004
	.byte	W01
	.byte		v004
	.byte	W02
	.byte		v003
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W02
	.byte		v002
	.byte	W01
	.byte		v002
	.byte	W03
	.byte		v001
	.byte	W02
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		EOT	, Ds3
	.byte			Fn3
	.byte			As3
	.byte	VOL	, v000
	.byte	W01
	.byte		v000
	.byte	FINE

	@********************** Track  5 **********************@

	.global song001_5
song001_5:	@ 0x08545B74
	.byte	KEYSH	, 0
	.byte	W36
	.byte	VOICE	, 50
	.byte	VOL	, v024
	.byte	PAN	, c_v-30
	.byte	W12
	.byte	VOL	, v027
	.byte		TIE	, Gs1, v104
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v051
	.byte	W05
	.byte		v049
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v019
	.byte	W05
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v021
	.byte	W03
	.byte		v021
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W03
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W01
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W03
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W03
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W03
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W03
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W03
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v040
	.byte	W03
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v042
	.byte	W03
	.byte		v042
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W02
	.byte		v043
	.byte	W03
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W03
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v046
	.byte	W03
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v048
	.byte	W03
	.byte		v048
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v050
	.byte	W03
	.byte		v051
	.byte	W44
	.byte	W01
	.byte		EOT	
	.byte	W01
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
	.byte	VOICE	, 47
	.byte	W24
	.byte	VOL	, v051
	.byte	W24
	.byte	PAN	, c_v
	.byte	W24
	.byte		N06	, Gs2, v127
	.byte	W06
	.byte			Gs2, v076
	.byte	W06
	.byte			Gs2, v080
	.byte	W06
	.byte			Gs2, v108
	.byte	W06
	.byte		N24	, Gs2, v124
	.byte	W72
	.byte		N24	
	.byte	W24
	.byte	W48
	.byte		N06	, Gn2, v127
	.byte	W06
	.byte			Gn2, v076
	.byte	W06
	.byte			Gn2, v080
	.byte	W06
	.byte			Gn2, v108
	.byte	W06
	.byte			Gn2, v112
	.byte	W06
	.byte			Gn2, v104
	.byte	W06
	.byte			Gn2, v112
	.byte	W06
	.byte			Gn2, v124
	.byte	W06
	.byte		N24	, Cn3
	.byte	W72
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N24	
	.byte	W72
	.byte		N24	
	.byte	W24
song001_5_1:
	.byte		N24	, Cn3, v124
	.byte	W48
	.byte		N24	
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song001_5_1
	.byte		N40	, Gn2, v124
	.byte	W40
	.byte		N04	, Gn2, v084
	.byte	W04
	.byte			Gn2, v092
	.byte	W04
	.byte			Gn2, v096
	.byte	W04
	.byte			Gn2, v108
	.byte	W04
	.byte			Gn2, v116
	.byte	W04
	.byte			Gn2, v124
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte			Gn2, v120
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte			Gn2, v116
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte			Gn2, v108
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte			Gn2, v104
	.byte	W04
	.byte			Gn2, v100
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte			Gn2, v096
	.byte	W04
	.byte			Gn2, v092
	.byte	W04
	.byte			Gn2, v088
	.byte	W04
	.byte			Gn2, v084
	.byte	W04
	.byte			Gn2, v080
	.byte	W04
	.byte		N24	, Gn2, v076
	.byte	W24
	.byte	FINE

	@********************** Track  6 **********************@

	.global song001_6
song001_6:	@ 0x08545CE1
	.byte	KEYSH	, 0
	.byte	W84
	.byte	VOICE	, 47
	.byte	W12
	.byte	W12
	.byte	VOL	, v051
	.byte	W24
	.byte	PAN	, c_v
	.byte	W60
	.byte	W64
	.byte		N04	, Gs2, v100
	.byte	W04
	.byte			Gs2, v088
	.byte	W04
	.byte			Gs2, v068
	.byte	W04
	.byte			Gs2, v080
	.byte	W04
	.byte			Gs2, v088
	.byte	W04
	.byte			Gs2, v100
	.byte	W04
	.byte			Gs2, v108
	.byte	W04
	.byte			Gs2, v116
	.byte	W04
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 68
	.byte	W24
	.byte	VOL	, v038
	.byte	W24
	.byte	PAN	, c_v-9
	.byte	W48
	.byte		N24	, Gs3, v104
	.byte	W30
	.byte		N06	
	.byte	W06
	.byte			As3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte		N36	, Ds4
	.byte	W36
	.byte		N06	, Gs4
	.byte	W06
	.byte			Gs4, v032
	.byte	W06
	.byte		N48	, Fs4, v104
	.byte	W48
	.byte		N24	, Fn4
	.byte	W24
	.byte	W03
	.byte		N06	, Fn4, v032
	.byte	W09
	.byte			Cs4, v104
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N48	, En4
	.byte	W48
	.byte		N60	, Bn3
	.byte	W48
	.byte	W15
	.byte		N06	, Bn3, v032
	.byte	W09
	.byte		N24	, As3, v104
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte			Cs4
	.byte	W24
	.byte		N32	, Dn4, v092
	.byte	W36
	.byte		N05	, Cs4
	.byte	W06
	.byte		N06	, Dn4, v068
	.byte	W06
	.byte		N48	, En4, v092
	.byte	W48
	.byte		N32	, Fn4
	.byte	W36
	.byte		N06	, En4, v068
	.byte	W06
	.byte			Fn4, v076
	.byte	W06
	.byte		N56	, Gn4, v084
	.byte	W36
	.byte	W02
	.byte	VOL	, v037
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W84
	.byte	W02
	.byte	W96
	.byte	FINE

	@********************** Track  7 **********************@

	.global song001_7
song001_7:	@ 0x08545D9B
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W48
	.byte	VOICE	, 48
	.byte	W24
	.byte	VOL	, v046
	.byte	W24
	.byte	PAN	, c_v+25
	.byte	W72
	.byte		N04	, Cs3, v092
	.byte	W04
	.byte			Ds3
	.byte	W04
	.byte			En3
	.byte	W04
	.byte			Fs3
	.byte	W04
	.byte			Gs3
	.byte	W04
	.byte			As3
	.byte	W04
	.byte		N06	, Ds3, v088
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Ds3, v068
	.byte	W06
	.byte			Ds3, v036
	.byte	W18
	.byte			Gs2, v092
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v072
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W18
	.byte			Gs2, v092
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v072
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
song001_7_1:
	.byte	W12
	.byte		N06	, Gs2, v092
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v072
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W18
	.byte			Gs2, v092
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v072
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v092
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v072
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte	PEND
song001_7_2:
	.byte		N06	, Bn2, v092
	.byte		N06	, En3, v088
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, En3, v068
	.byte	W06
	.byte			En3, v036
	.byte	W18
	.byte			Bn2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W18
	.byte			Bn2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte	PEND
song001_7_3:
	.byte	W12
	.byte		N06	, Bn2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W18
	.byte			Bn2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Bn2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte	PEND
	.byte			An2, v092
	.byte		N06	, En3, v088
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			An2, v072
	.byte		N06	, En3, v068
	.byte	W06
	.byte			En3, v036
	.byte	W18
	.byte			An2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			An2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W18
	.byte			An2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			An2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte	W12
	.byte			An2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			An2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W18
	.byte			An2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			An2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			An2, v092
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			An2, v072
	.byte		N06	, En3
	.byte	W06
	.byte			En3, v036
	.byte	W06
	.byte			Fs2, v076
	.byte		N06	, Cs3, v072
	.byte	W12
	.byte			Fs2, v056
	.byte		N06	, Cs3, v052
	.byte	W24
	.byte			Fs2, v080
	.byte		N06	, Cs3, v076
	.byte	W12
	.byte			Fs2, v060
	.byte		N06	, Cs3
	.byte	W24
	.byte			Fs2, v092
	.byte		N06	, Cs3
	.byte	W12
	.byte			Fs2, v072
	.byte		N06	, Cs3
	.byte	W12
	.byte	W12
	.byte			Fs2, v092
	.byte		N06	, Cs3, v104
	.byte	W12
	.byte			Fs2, v068
	.byte		N06	, Cs3, v084
	.byte	W24
	.byte			Fs2, v100
	.byte		N06	, Cs3, v112
	.byte	W12
	.byte			Fs2, v076
	.byte		N06	, Cs3, v088
	.byte	W12
	.byte			Fs2, v108
	.byte		N06	, Cs3, v120
	.byte	W12
	.byte			Fs2, v084
	.byte		N06	, Cs3, v096
	.byte	W12
	.byte			Gs2, v092
	.byte		N06	, Ds3, v088
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v072
	.byte		N06	, Ds3, v068
	.byte	W06
	.byte			Ds3, v036
	.byte	W18
	.byte			Gs2, v092
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v072
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W18
	.byte			Gs2, v092
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Gs2, v072
	.byte		N06	, Ds3
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte	PATT	
		.word	song001_7_1
	.byte	PATT	
		.word	song001_7_2
	.byte	PATT	
		.word	song001_7_3
	.byte		N06	, Bn2, v092
	.byte		N06	, Fs3, v088
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, Fs3, v068
	.byte	W06
	.byte			Fs3, v036
	.byte	W18
	.byte			Bn2, v092
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W18
	.byte			Bn2, v092
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte			Bn2, v072
	.byte		N06	, Fs3
	.byte	W06
	.byte			Fs3, v036
	.byte	W06
	.byte	W12
	.byte			As2, v092
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gn3, v036
	.byte	W06
	.byte			As2, v072
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gn3, v036
	.byte	W18
	.byte			As2, v092
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			As2, v072
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Dn3, v092
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte			Dn3, v072
	.byte	W06
	.byte			Dn3, v036
	.byte	W06
	.byte	W96
	.byte	W92
	.byte	W03
	.byte	VOL	, v046
	.byte	W01
	.byte		v051
	.byte		N08	, Cn3, v080
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			Ds3
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Ds3
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte			Ds3
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			Gs3
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Fs3
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte			Gs3
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Bn3
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Gs3
	.byte	W08
	.byte			An3
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte			An3, v092
	.byte	W08
	.byte			As3
	.byte	W08
	.byte			Cn4
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			Ds4
	.byte	W08
	.byte			Fn4
	.byte	W08
	.byte		TIE	, Gn4, v096
	.byte	W03
	.byte	VOL	, v048
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v037
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v024
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W02
	.byte		v021
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v018
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W02
	.byte		v016
	.byte	W01
	.byte		v016
	.byte	W02
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W02
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W02
	.byte		v013
	.byte	W01
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W02
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W02
	.byte		v010
	.byte	W01
	.byte		v010
	.byte	W02
	.byte		v009
	.byte	W01
	.byte		v009
	.byte	W02
	.byte		v008
	.byte	W01
	.byte		v008
	.byte	W02
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W02
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W02
	.byte		v006
	.byte	W01
	.byte		v006
	.byte	W02
	.byte		v005
	.byte	W01
	.byte		v005
	.byte	W02
	.byte		v004
	.byte	W01
	.byte		v004
	.byte	W02
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W02
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W02
	.byte		v002
	.byte	W01
	.byte		v002
	.byte	W02
	.byte		v001
	.byte	W01
	.byte		v001
	.byte	W02
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W02
	.byte		EOT	
	.byte	VOL	, v000
	.byte	FINE

	@********************** Track  8 **********************@

	.global song001_8
song001_8:	@ 0x08546144
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W06
	.byte	VOICE	, 126
	.byte	W24
	.byte	VOL	, v040
	.byte	W24
	.byte	PAN	, c_v
	.byte	W42
	.byte	W12
	.byte		N84	, En2, v104
	.byte	W48
	.byte	W03
	.byte		N32	, Ds1, v127
	.byte	W32
	.byte	W01
song001_8_1:
	.byte		N36	, Cs2, v127
	.byte	W24
	.byte		N06	, Dn1, v124
	.byte	W12
	.byte			Dn1, v127
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
song001_8_2:
	.byte		N06	, Dn1, v127
	.byte	W06
	.byte		N05	, Dn1, v084
	.byte	W06
	.byte		N05	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v127
	.byte	W24
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte	PEND
song001_8_3:
	.byte		N06	, Dn1, v127
	.byte	W12
	.byte		N05	, Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn1, v127
	.byte	W06
	.byte		N05	, Dn1, v084
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	, Dn1, v127
	.byte	W12
	.byte			Dn1, v084
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
song001_8_4:
	.byte		N06	, Dn1, v127
	.byte	W24
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N05	
	.byte	W18
	.byte		N06	, Dn1, v096
	.byte	W12
	.byte		N24	, Ds1, v108
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song001_8_1
	.byte	PATT	
		.word	song001_8_2
	.byte		N06	, Dn1, v096
	.byte	W12
	.byte		N05	, Dn1, v072
	.byte	W12
	.byte		N06	, Dn1, v076
	.byte	W12
	.byte			Dn1, v096
	.byte	W06
	.byte		N05	, Dn1, v072
	.byte	W18
	.byte		N06	, Dn1, v076
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	, Dn1, v108
	.byte	W12
	.byte			Dn1, v092
	.byte	W06
	.byte		N05	, Dn1, v104
	.byte	W06
	.byte		N06	, Dn1, v124
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N05	, Dn1, v116
	.byte	W18
	.byte		N06	, Dn1, v127
	.byte	W12
	.byte		N24	, Ds1
	.byte	W24
	.byte	PATT	
		.word	song001_8_1
	.byte	PATT	
		.word	song001_8_2
	.byte	PATT	
		.word	song001_8_3
	.byte	PATT	
		.word	song001_8_4
	.byte		N06	, Dn1, v127
	.byte	W06
	.byte		N05	, Dn1, v084
	.byte	W06
	.byte		N05	
	.byte	W12
	.byte		N06	, Dn1, v124
	.byte	W12
	.byte			Dn1, v127
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PATT	
		.word	song001_8_2
	.byte	W96
	.byte	W48
	.byte		N08	, Dn1, v108
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N23	, Ds1
	.byte	W24
	.byte		N07	, Cn1
	.byte	W48
	.byte			Cn2, v127
	.byte	W08
	.byte			An1
	.byte	W08
	.byte			Fn1
	.byte	W08
	.byte			Dn1, v108
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W48
	.byte			Cn2, v127
	.byte	W08
	.byte			An1
	.byte	W08
	.byte			Fn1
	.byte	W08
	.byte			Dn1, v108
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N23	, Gn2
	.byte	W24
	.byte		N07	, Fn1, v127
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Fn1
	.byte	W08
	.byte			An1
	.byte	W08
	.byte			Fn1
	.byte	W08
	.byte			Cn2
	.byte	W24
	.byte			An1
	.byte	W12
	.byte		TIE	, En2
	.byte	W12
	.byte		N07	, Cn2
	.byte	W08
	.byte			An1
	.byte	W08
	.byte			Fn1
	.byte	W08
	.byte			Dn1, v108
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte	W96
	.byte	W44
	.byte	W01
	.byte		EOT	, En2
	.byte	FINE

	.align 2
	.global song001
song001:	@ 0x08546288
	.byte	8		@ trackCount
	.byte	0		@ blockCount
	.byte	10		@ priority
	.byte	148		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song001_1		@ track
	.word	song001_2		@ track
	.word	song001_3		@ track
	.word	song001_4		@ track
	.word	song001_5		@ track
	.word	song001_6		@ track
	.word	song001_7		@ track
	.word	song001_8		@ track
