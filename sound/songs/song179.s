	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song179_1
song179_1:	@ 0x0857E328
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 72
	.byte	VOL	, v127
	.byte		N24	, En2, v100
	.byte	W24
	.byte	VOICE	, 73
	.byte	W08
	.byte	BENDR	, 16
	.byte	BEND	, c_v
	.byte		N64	, Dn3, v036
	.byte	W03
	.byte	BEND	, c_v+3
	.byte	W03
	.byte		c_v+6
	.byte	W03
	.byte		c_v+9
	.byte	W03
	.byte		c_v+12
	.byte	W03
	.byte		c_v+15
	.byte	W01
	.byte	W02
	.byte		c_v+19
	.byte	W03
	.byte		c_v+22
	.byte	W03
	.byte		c_v+25
	.byte	W03
	.byte		c_v+28
	.byte	W03
	.byte		c_v+31
	.byte	W03
	.byte		c_v+35
	.byte	W03
	.byte		c_v+38
	.byte	W03
	.byte		c_v+41
	.byte	W01
	.byte	W02
	.byte		c_v+44
	.byte	W03
	.byte		c_v+47
	.byte	W03
	.byte		c_v+51
	.byte	W03
	.byte		c_v+54
	.byte	W03
	.byte		c_v+57
	.byte	W03
	.byte		c_v+60
	.byte	W03
	.byte		c_v+63
	.byte	W04
	.byte	FINE

	@********************** Track  2 **********************@

	.global song179_2
song179_2:	@ 0x0857E36B
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	BENDR	, 12
	.byte	VOL	, v127
	.byte	W24
	.byte	W08
	.byte	BEND	, c_v
	.byte		N64	, Cn6, v020
	.byte	W03
	.byte	BEND	, c_v+3
	.byte	W03
	.byte		c_v+6
	.byte	W03
	.byte		c_v+9
	.byte	W03
	.byte		c_v+12
	.byte	W03
	.byte		c_v+15
	.byte	W01
	.byte	W02
	.byte		c_v+19
	.byte	W03
	.byte		c_v+22
	.byte	W03
	.byte		c_v+25
	.byte	W03
	.byte		c_v+28
	.byte	W03
	.byte		c_v+31
	.byte	W03
	.byte		c_v+35
	.byte	W03
	.byte		c_v+38
	.byte	W03
	.byte		c_v+41
	.byte	W01
	.byte	W02
	.byte		c_v+44
	.byte	W03
	.byte		c_v+47
	.byte	W03
	.byte		c_v+51
	.byte	W03
	.byte		c_v+54
	.byte	W03
	.byte		c_v+57
	.byte	W03
	.byte		c_v+60
	.byte	W03
	.byte		c_v+63
	.byte	W04
	.byte	FINE

	.align 2
	.global song179
song179:	@ 0x0857E3A8
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup031		@ voicegroup/tone

	.word	song179_1		@ track
	.word	song179_2		@ track
