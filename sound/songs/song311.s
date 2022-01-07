	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song311_1
song311_1:	@ 0x0857FC3C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 28
	.byte	BENDR	, 12
	.byte	VOL	, v020
	.byte	BEND	, c_v+63
	.byte		N20	, Cn3, v127
	.byte	W01
	.byte	VOL	, v030
	.byte	BEND	, c_v+60
	.byte	W01
	.byte	VOL	, v041
	.byte	BEND	, c_v+57
	.byte	W01
	.byte	VOL	, v051
	.byte	BEND	, c_v+53
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v+50
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v+47
	.byte	W01
	.byte	VOL	, v083
	.byte	BEND	, c_v+43
	.byte	W01
	.byte	VOL	, v094
	.byte	BEND	, c_v+40
	.byte	W01
	.byte	VOL	, v105
	.byte	BEND	, c_v+37
	.byte	W01
	.byte	VOL	, v115
	.byte	BEND	, c_v+33
	.byte	W01
	.byte	VOL	, v127
	.byte	BEND	, c_v+30
	.byte	W01
	.byte		c_v+26
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+20
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte	VOL	, v120
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v110
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v085
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v030
	.byte	BEND	, c_v
	.byte	W05
	.byte	FINE

	.align 2
	.global song311
song311:	@ 0x0857FCA0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	0		@ reverb

	.word	voicegroup032		@ voicegroup/tone

	.word	song311_1		@ track
