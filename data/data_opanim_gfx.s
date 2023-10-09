	.section .data

	.global pal_08AF47F0
pal_08AF47F0:  @ 0x08AF47F0
	.incbin "baserom.gba", 0xAF47F0, 0x80

	.global img_opanim1
img_opanim1:
	.incbin "baserom.gba", 0xAF4870, 0xAF4C9C - 0xAF4870

	.global tsa_opanim1
tsa_opanim1:
	.incbin "baserom.gba", 0xAF4C9C, 0xAF4CD8 - 0xAF4C9C

	.global img_opanim2
img_opanim2:
	.incbin "baserom.gba", 0xAF4CD8, 0xAF5100 - 0xAF4CD8

	.global tsa_opanim2
tsa_opanim2:
	.incbin "baserom.gba", 0xAF5100, 0xAF513C - 0xAF5100

	.global img_opanim3
img_opanim3:
	.incbin "baserom.gba", 0xAF513C, 0xAF5578 - 0xAF513C

	.global tsa_opanim3
tsa_opanim3:
	.incbin "baserom.gba", 0xAF5578, 0xAF55B4 - 0xAF5578

	.global img_opanim4
img_opanim4:
	.incbin "baserom.gba", 0xAF55B4, 0xAF59EC - 0xAF55B4

	.global tsa_opanim4
tsa_opanim4:
	.incbin "baserom.gba", 0xAF59EC, 0xAF5A28 - 0xAF59EC

	.global img_opanim5
img_opanim5:
	.incbin "baserom.gba", 0xAF5A28, 0xAF5E5C - 0xAF5A28

	.global tsa_opanim5
tsa_opanim5:
	.incbin "baserom.gba", 0xAF5E5C, 0xAF5E98 - 0xAF5E5C

	.global img_opanim6
img_opanim6:
	.incbin "baserom.gba", 0xAF5E98, 0xAF62CC - 0xAF5E98

	.global tsa_opanim6
tsa_opanim6:
	.incbin "baserom.gba", 0xAF62CC, 0xAF6308 - 0xAF62CC

	.global img_opanim7
img_opanim7:
	.incbin "baserom.gba", 0xAF6308, 0xAF6744 - 0xAF6308

	.global tsa_opanim7
tsa_opanim7:
	.incbin "baserom.gba", 0xAF6744, 0xAF6780 - 0xAF6744

	.global img_opanim8
img_opanim8:
	.incbin "baserom.gba", 0xAF6780, 0xAF6BBC - 0xAF6780

	.global tsa_opanim8
tsa_opanim8:
	.incbin "baserom.gba", 0xAF6BBC, 0xAF6BF8 - 0xAF6BBC

	.global img_opanim9
img_opanim9:
	.incbin "baserom.gba", 0xAF6BF8, 0xAF7034 - 0xAF6BF8

	.global tsa_opanim9
tsa_opanim9:
	.incbin "baserom.gba", 0xAF7034, 0xAF7070 - 0xAF7034

	.global img_opanim10
img_opanim10:
	.incbin "baserom.gba", 0xAF7070, 0xAF74AC - 0xAF7070

	.global tsa_opanim10
tsa_opanim10:
	.incbin "baserom.gba", 0xAF74AC, 0xAF74E8 - 0xAF74AC

	.global img_opanim11
img_opanim11:
	.incbin "baserom.gba", 0xAF74E8, 0xAF7924 - 0xAF74E8

	.global tsa_opanim11
tsa_opanim11:
	.incbin "baserom.gba", 0xAF7924, 0xAF7960 - 0xAF7924

	.global img_opanim12
img_opanim12:
	.incbin "baserom.gba", 0xAF7960, 0xAF7D98 - 0xAF7960

	.global tsa_opanim12
tsa_opanim12:
	.incbin "baserom.gba", 0xAF7D98, 0xAF7DD4 - 0xAF7D98

	.global img_opanim13
img_opanim13:
	.incbin "baserom.gba", 0xAF7DD4, 0xAF8210 - 0xAF7DD4

	.global tsa_opanim13
tsa_opanim13:
	.incbin "baserom.gba", 0xAF8210, 0xAF824C - 0xAF8210

	.global img_opanim14
img_opanim14:
	.incbin "baserom.gba", 0xAF824C, 0xAF8688 - 0xAF824C

	.global tsa_opanim14
tsa_opanim14:
	.incbin "baserom.gba", 0xAF8688, 0xAF86C4 - 0xAF8688

	.global img_opanim15
img_opanim15:
	.incbin "baserom.gba", 0xAF86C4, 0xAF8AFC - 0xAF86C4

	.global tsa_opanim15
tsa_opanim15:
	.incbin "baserom.gba", 0xAF8AFC, 0xAF8B38 - 0xAF8AFC

	.global img_opanim16
img_opanim16:
	.incbin "baserom.gba", 0xAF8B38, 0xAF8F74 - 0xAF8B38

	.global tsa_opanim16
tsa_opanim16:
	.incbin "baserom.gba", 0xAF8F74, 0xAF8FB0 - 0xAF8F74

	.global img_opanim17
img_opanim17:
	.incbin "baserom.gba", 0xAF8FB0, 0xAF93EC - 0xAF8FB0

	.global tsa_opanim17
tsa_opanim17:
	.incbin "baserom.gba", 0xAF93EC, 0xAF9428 - 0xAF93EC

	.global img_opanim18
img_opanim18:
	.incbin "baserom.gba", 0xAF9428, 0xAF9864 - 0xAF9428

	.global tsa_opanim18
tsa_opanim18:
	.incbin "baserom.gba", 0xAF9864, 0xAF98A0 - 0xAF9864

	.global img_opanim19
img_opanim19:
	.incbin "baserom.gba", 0xAF98A0, 0xAF9CDC - 0xAF98A0

	.global tsa_opanim19
tsa_opanim19:
	.incbin "baserom.gba", 0xAF9CDC, 0xAF9D18 - 0xAF9CDC

	.global img_opanim20
img_opanim20:
	.incbin "baserom.gba", 0xAF9D18, 0xAFA154 - 0xAF9D18

	.global tsa_opanim20
tsa_opanim20:
	.incbin "baserom.gba", 0xAFA154, 0xAFA190 - 0xAFA154

	.global img_opanim21
img_opanim21:
	.incbin "baserom.gba", 0xAFA190, 0xAFA5CC - 0xAFA190

	.global tsa_opanim21
tsa_opanim21:
	.incbin "baserom.gba", 0xAFA5CC, 0xAFA608 - 0xAFA5CC

	.global img_opanim22
img_opanim22:
	.incbin "baserom.gba", 0xAFA608, 0xAFAA44 - 0xAFA608

	.global tsa_opanim22
tsa_opanim22:
	.incbin "baserom.gba", 0xAFAA44, 0xAFAA80 - 0xAFAA44

	.global img_opanim23
img_opanim23:
	.incbin "baserom.gba", 0xAFAA80, 0xAFAEBC - 0xAFAA80

	.global tsa_opanim23
tsa_opanim23:
	.incbin "baserom.gba", 0xAFAEBC, 0xAFAEF8 - 0xAFAEBC

	.global img_opanim24
img_opanim24:
	.incbin "baserom.gba", 0xAFAEF8, 0xAFB334 - 0xAFAEF8

	.global tsa_opanim24
tsa_opanim24:
	.incbin "baserom.gba", 0xAFB334, 0xAFB370 - 0xAFB334

	.global img_opanim25
img_opanim25:
	.incbin "baserom.gba", 0xAFB370, 0xAFB7AC - 0xAFB370

	.global tsa_opanim25
tsa_opanim25:
	.incbin "baserom.gba", 0xAFB7AC, 0xAFB7E8 - 0xAFB7AC

	.global img_opanim26
img_opanim26:
	.incbin "baserom.gba", 0xAFB7E8, 0xAFBC24 - 0xAFB7E8

	.global tsa_opanim26
tsa_opanim26:
	.incbin "baserom.gba", 0xAFBC24, 0xAFBC60 - 0xAFBC24

	.global img_opanim27
img_opanim27:
	.incbin "baserom.gba", 0xAFBC60, 0xAFC098 - 0xAFBC60

	.global tsa_opanim27
tsa_opanim27:
	.incbin "baserom.gba", 0xAFC098, 0xAFC0D4 - 0xAFC098

	.global img_opanim28
img_opanim28:
	.incbin "baserom.gba", 0xAFC0D4, 0xAFC50C - 0xAFC0D4

	.global tsa_opanim28
tsa_opanim28:
	.incbin "baserom.gba", 0xAFC50C, 0xAFC548 - 0xAFC50C

	.global img_opanim29
img_opanim29:
	.incbin "baserom.gba", 0xAFC548, 0xAFC978 - 0xAFC548

	.global tsa_opanim29
tsa_opanim29:
	.incbin "baserom.gba", 0xAFC978, 0xAFC9B4 - 0xAFC978

	.global img_opanim30
img_opanim30:
	.incbin "baserom.gba", 0xAFC9B4, 0xAFCDEC - 0xAFC9B4

	.global tsa_opanim30
tsa_opanim30:
	.incbin "baserom.gba", 0xAFCDEC, 0xAFCE28 - 0xAFCDEC

	.global img_opanim31
img_opanim31:
	.incbin "baserom.gba", 0xAFCE28, 0xAFD260 - 0xAFCE28

	.global tsa_opanim31
tsa_opanim31:
	.incbin "baserom.gba", 0xAFD260, 0xAFD29C - 0xAFD260

	.global img_opanim32
img_opanim32:
	.incbin "baserom.gba", 0xAFD29C, 0xAFD6C4 - 0xAFD29C

	.global tsa_opanim32
tsa_opanim32:
	.incbin "baserom.gba", 0xAFD6C4, 0xAFD700 - 0xAFD6C4

	.global img_opanim33
img_opanim33:
	.incbin "baserom.gba", 0xAFD700, 0xAFDB28 - 0xAFD700

	.global tsa_opanim33
tsa_opanim33:
	.incbin "baserom.gba", 0xAFDB28, 0xAFDB64 - 0xAFDB28

	.global img_opanim34
img_opanim34:
	.incbin "baserom.gba", 0xAFDB64, 0xAFDF98 - 0xAFDB64

	.global tsa_opanim34
tsa_opanim34:
	.incbin "baserom.gba", 0xAFDF98, 0xAFDFD4 - 0xAFDF98

	.global img_opanim35
img_opanim35:
	.incbin "baserom.gba", 0xAFDFD4, 0xAFE40C - 0xAFDFD4

	.global tsa_opanim35
tsa_opanim35:
	.incbin "baserom.gba", 0xAFE40C, 0xAFE448 - 0xAFE40C

	.global img_opanim36
img_opanim36:
	.incbin "baserom.gba", 0xAFE448, 0xAFE880 - 0xAFE448

	.global tsa_opanim36
tsa_opanim36:
	.incbin "baserom.gba", 0xAFE880, 0xAFE8BC - 0xAFE880

	.global img_opanim37
img_opanim37:
	.incbin "baserom.gba", 0xAFE8BC, 0xAFECF4 - 0xAFE8BC

	.global tsa_opanim37
tsa_opanim37:
	.incbin "baserom.gba", 0xAFECF4, 0xAFED30 - 0xAFECF4

	.global img_opanim38
img_opanim38:
	.incbin "baserom.gba", 0xAFED30, 0xAFF16C - 0xAFED30

	.global tsa_opanim38
tsa_opanim38:
	.incbin "baserom.gba", 0xAFF16C, 0xAFF1A8 - 0xAFF16C

	.global img_opanim39
img_opanim39:
	.incbin "baserom.gba", 0xAFF1A8, 0xAFF5DC - 0xAFF1A8

	.global tsa_opanim39
tsa_opanim39:
	.incbin "baserom.gba", 0xAFF5DC, 0xAFF618 - 0xAFF5DC

	.global img_opanim40
img_opanim40:
	.incbin "baserom.gba", 0xAFF618, 0xAFFA44 - 0xAFF618

	.global tsa_opanim40
tsa_opanim40:
	.incbin "baserom.gba", 0xAFFA44, 0xAFFA80 - 0xAFFA44

	.global img_opanim41
img_opanim41:
	.incbin "baserom.gba", 0xAFFA80, 0xAFFEAC - 0xAFFA80

	.global tsa_opanim41
tsa_opanim41:
	.incbin "baserom.gba", 0xAFFEAC, 0xAFFEE8 - 0xAFFEAC

	.global img_opanim42
img_opanim42:
	.incbin "baserom.gba", 0xAFFEE8, 0xB0031C - 0xAFFEE8

	.global tsa_opanim42
tsa_opanim42:
	.incbin "baserom.gba", 0xB0031C, 0xB00358 - 0xB0031C

	.global img_opanim43
img_opanim43:
	.incbin "baserom.gba", 0xB00358, 0xB00794 - 0xB00358

	.global tsa_opanim43
tsa_opanim43:
	.incbin "baserom.gba", 0xB00794, 0xB007D0 - 0xB00794

	.global img_opanim44
img_opanim44:
	.incbin "baserom.gba", 0xB007D0, 0xB00C0C - 0xB007D0

	.global tsa_opanim44
tsa_opanim44:
	.incbin "baserom.gba", 0xB00C0C, 0xB00C48 - 0xB00C0C

	.global img_opanim45
img_opanim45:
	.incbin "baserom.gba", 0xB00C48, 0xB0107C - 0xB00C48

	.global tsa_opanim45
tsa_opanim45:
	.incbin "baserom.gba", 0xB0107C, 0xB010B8 - 0xB0107C

	.global img_opanim46
img_opanim46:
	.incbin "baserom.gba", 0xB010B8, 0xB014F0 - 0xB010B8

	.global tsa_opanim46
tsa_opanim46:
	.incbin "baserom.gba", 0xB014F0, 0xB0152C - 0xB014F0

	.global img_opanim47
img_opanim47:
	.incbin "baserom.gba", 0xB0152C, 0xB01968 - 0xB0152C

	.global tsa_opanim47
tsa_opanim47:
	.incbin "baserom.gba", 0xB01968, 0xB019A4 - 0xB01968

	.global img_opanim48
img_opanim48:
	.incbin "baserom.gba", 0xB019A4, 0xB01DDC - 0xB019A4

	.global tsa_opanim48
tsa_opanim48:
	.incbin "baserom.gba", 0xB01DDC, 0xB01E18 - 0xB01DDC

	.global img_opanim49
img_opanim49:
	.incbin "baserom.gba", 0xB01E18, 0xB02244 - 0xB01E18

	.global tsa_opanim49
tsa_opanim49:
	.incbin "baserom.gba", 0xB02244, 0xB02280 - 0xB02244

	.global img_opanim50
img_opanim50:
	.incbin "baserom.gba", 0xB02280, 0xB026B8 - 0xB02280

	.global tsa_opanim50
tsa_opanim50:
	.incbin "baserom.gba", 0xB026B8, 0xB026F4 - 0xB026B8

	.global img_opanim51
img_opanim51:
	.incbin "baserom.gba", 0xB026F4, 0xB02B20 - 0xB026F4

	.global tsa_opanim51
tsa_opanim51:
	.incbin "baserom.gba", 0xB02B20, 0xB02B5C - 0xB02B20

	.global img_opanim52
img_opanim52:
	.incbin "baserom.gba", 0xB02B5C, 0xB02F90 - 0xB02B5C

	.global tsa_opanim52
tsa_opanim52:
	.incbin "baserom.gba", 0xB02F90, 0xB02FCC - 0xB02F90

	.global img_opanim53
img_opanim53:
	.incbin "baserom.gba", 0xB02FCC, 0xB033FC - 0xB02FCC

	.global tsa_opanim53
tsa_opanim53:
	.incbin "baserom.gba", 0xB033FC, 0xB03438 - 0xB033FC

	.global img_opanim54
img_opanim54:
	.incbin "baserom.gba", 0xB03438, 0xB03870 - 0xB03438

	.global tsa_opanim54
tsa_opanim54:
	.incbin "baserom.gba", 0xB03870, 0xB038AC - 0xB03870

	.global img_opanim55
img_opanim55:
	.incbin "baserom.gba", 0xB038AC, 0xB03CE0 - 0xB038AC

	.global tsa_opanim55
tsa_opanim55:
	.incbin "baserom.gba", 0xB03CE0, 0xB03D1C - 0xB03CE0

	.global img_opanim56
img_opanim56:
	.incbin "baserom.gba", 0xB03D1C, 0xB04158 - 0xB03D1C

	.global tsa_opanim56
tsa_opanim56:
	.incbin "baserom.gba", 0xB04158, 0xB04194 - 0xB04158

	.global img_opanim57
img_opanim57:
	.incbin "baserom.gba", 0xB04194, 0xB045D0 - 0xB04194

	.global tsa_opanim57
tsa_opanim57:
	.incbin "baserom.gba", 0xB045D0, 0xB0460C - 0xB045D0

	.global img_opanim58
img_opanim58:
	.incbin "baserom.gba", 0xB0460C, 0xB04A48 - 0xB0460C

	.global tsa_opanim58
tsa_opanim58:
	.incbin "baserom.gba", 0xB04A48, 0xB04A84 - 0xB04A48

	.global img_opanim59
img_opanim59:
	.incbin "baserom.gba", 0xB04A84, 0xB04EB4 - 0xB04A84

	.global tsa_opanim59
tsa_opanim59:
	.incbin "baserom.gba", 0xB04EB4, 0xB04EF0 - 0xB04EB4

	.global img_opanim60
img_opanim60:
	.incbin "baserom.gba", 0xB04EF0, 0xB05328 - 0xB04EF0

	.global tsa_opanim60
tsa_opanim60:
	.incbin "baserom.gba", 0xB05328, 0xB05364 - 0xB05328

	.global img_opanim61
img_opanim61:
	.incbin "baserom.gba", 0xB05364, 0xB05794 - 0xB05364

	.global tsa_opanim61
tsa_opanim61:
	.incbin "baserom.gba", 0xB05794, 0xB057D0 - 0xB05794

	.global img_opanim62
img_opanim62:
	.incbin "baserom.gba", 0xB057D0, 0xB05BFC - 0xB057D0

	.global tsa_opanim62
tsa_opanim62:
	.incbin "baserom.gba", 0xB05BFC, 0xB05C38 - 0xB05BFC

	.global img_opanim63
img_opanim63:
	.incbin "baserom.gba", 0xB05C38, 0xB06070 - 0xB05C38

	.global tsa_opanim63
tsa_opanim63:
	.incbin "baserom.gba", 0xB06070, 0xB060AC - 0xB06070

	.global img_opanim64
img_opanim64:
	.incbin "baserom.gba", 0xB060AC, 0xB064E8 - 0xB060AC

	.global tsa_opanim64
tsa_opanim64:
	.incbin "baserom.gba", 0xB064E8, 0xB06524 - 0xB064E8

	.global img_opanim65
img_opanim65:
	.incbin "baserom.gba", 0xB06524, 0xB06960 - 0xB06524

	.global tsa_opanim65
tsa_opanim65:
	.incbin "baserom.gba", 0xB06960, 0xB0699C - 0xB06960

	.global img_opanim66
img_opanim66:
	.incbin "baserom.gba", 0xB0699C, 0xB06DD4 - 0xB0699C

	.global tsa_opanim66
tsa_opanim66:
	.incbin "baserom.gba", 0xB06DD4, 0xB06E10 - 0xB06DD4

	.global img_opanim67
img_opanim67:
	.incbin "baserom.gba", 0xB06E10, 0xB07244 - 0xB06E10

	.global tsa_opanim67
tsa_opanim67:
	.incbin "baserom.gba", 0xB07244, 0xB07280 - 0xB07244

	.global img_opanim68
img_opanim68:
	.incbin "baserom.gba", 0xB07280, 0xB076B4 - 0xB07280

	.global tsa_opanim68
tsa_opanim68:
	.incbin "baserom.gba", 0xB076B4, 0xB076F0 - 0xB076B4

	.global img_opanim69
img_opanim69:
	.incbin "baserom.gba", 0xB076F0, 0xB07B2C - 0xB076F0

	.global tsa_opanim69
tsa_opanim69:
	.incbin "baserom.gba", 0xB07B2C, 0xB07B68 - 0xB07B2C

	.global img_opanim70
img_opanim70:
	.incbin "baserom.gba", 0xB07B68, 0xB07F94 - 0xB07B68

	.global tsa_opanim70
tsa_opanim70:
	.incbin "baserom.gba", 0xB07F94, 0xB07FD0 - 0xB07F94

	.global img_opanim71
img_opanim71:
	.incbin "baserom.gba", 0xB07FD0, 0xB08404 - 0xB07FD0

	.global tsa_opanim71
tsa_opanim71:
	.incbin "baserom.gba", 0xB08404, 0xB08440 - 0xB08404

	.global img_opanim72
img_opanim72:
	.incbin "baserom.gba", 0xB08440, 0xB0887C - 0xB08440

	.global tsa_opanim72
tsa_opanim72:
	.incbin "baserom.gba", 0xB0887C, 0xB088B8 - 0xB0887C

	.global img_opanim73
img_opanim73:
	.incbin "baserom.gba", 0xB088B8, 0xB08CF4 - 0xB088B8

	.global tsa_opanim73
tsa_opanim73:
	.incbin "baserom.gba", 0xB08CF4, 0xB08D30 - 0xB08CF4

	.global img_opanim74
img_opanim74:
	.incbin "baserom.gba", 0xB08D30, 0xB09160 - 0xB08D30

	.global tsa_opanim74
tsa_opanim74:
	.incbin "baserom.gba", 0xB09160, 0xB0919C - 0xB09160

	.global img_opanim75
img_opanim75:
	.incbin "baserom.gba", 0xB0919C, 0xB095D0 - 0xB0919C

	.global tsa_opanim75
tsa_opanim75:
	.incbin "baserom.gba", 0xB095D0, 0xB0960C - 0xB095D0

	.global img_opanim76
img_opanim76:
	.incbin "baserom.gba", 0xB0960C, 0xB09A48 - 0xB0960C

	.global tsa_opanim76
tsa_opanim76:
	.incbin "baserom.gba", 0xB09A48, 0xB09A84 - 0xB09A48

	.global img_opanim77
img_opanim77:
	.incbin "baserom.gba", 0xB09A84, 0xB09EBC - 0xB09A84

	.global tsa_opanim77
tsa_opanim77:
	.incbin "baserom.gba", 0xB09EBC, 0xB09EF8 - 0xB09EBC

	.global img_opanim78
img_opanim78:
	.incbin "baserom.gba", 0xB09EF8, 0xB0A334 - 0xB09EF8

	.global tsa_opanim78
tsa_opanim78:
	.incbin "baserom.gba", 0xB0A334, 0xB0A370 - 0xB0A334

	.global img_opanim79
img_opanim79:
	.incbin "baserom.gba", 0xB0A370, 0xB0A7A8 - 0xB0A370

	.global tsa_opanim79
tsa_opanim79:
	.incbin "baserom.gba", 0xB0A7A8, 0xB0A7E4 - 0xB0A7A8

	.global img_opanim80
img_opanim80:
	.incbin "baserom.gba", 0xB0A7E4, 0xB0AC20 - 0xB0A7E4

	.global tsa_opanim80
tsa_opanim80:
	.incbin "baserom.gba", 0xB0AC20, 0xB0AC5C - 0xB0AC20

	.global img_opanim81
img_opanim81:
	.incbin "baserom.gba", 0xB0AC5C, 0xB0B098 - 0xB0AC5C

	.global tsa_opanim81
tsa_opanim81:
	.incbin "baserom.gba", 0xB0B098, 0xB0B0D4 - 0xB0B098

	.global img_opanim82
img_opanim82:
	.incbin "baserom.gba", 0xB0B0D4, 0xB0B508 - 0xB0B0D4

	.global tsa_opanim82
tsa_opanim82:
	.incbin "baserom.gba", 0xB0B508, 0xB0B544 - 0xB0B508

	.global img_opanim83
img_opanim83:
	.incbin "baserom.gba", 0xB0B544, 0xB0B97C - 0xB0B544

	.global tsa_opanim83
tsa_opanim83:
	.incbin "baserom.gba", 0xB0B97C, 0xB0B9B8 - 0xB0B97C

	.global img_opanim84
img_opanim84:
	.incbin "baserom.gba", 0xB0B9B8, 0xB0BDF4 - 0xB0B9B8

	.global tsa_opanim84
tsa_opanim84:
	.incbin "baserom.gba", 0xB0BDF4, 0xB0BE30 - 0xB0BDF4

	.global img_opanim85
img_opanim85:
	.incbin "baserom.gba", 0xB0BE30, 0xB0C268 - 0xB0BE30

	.global tsa_opanim85
tsa_opanim85:
	.incbin "baserom.gba", 0xB0C268, 0xB0C2A4 - 0xB0C268

	.global img_opanim86
img_opanim86:
	.incbin "baserom.gba", 0xB0C2A4, 0xB0C6DC - 0xB0C2A4

	.global tsa_opanim86
tsa_opanim86:
	.incbin "baserom.gba", 0xB0C6DC, 0xB0C718 - 0xB0C6DC

	.global img_opanim87
img_opanim87:
	.incbin "baserom.gba", 0xB0C718, 0xB0CB4C - 0xB0C718

	.global tsa_opanim87
tsa_opanim87:
	.incbin "baserom.gba", 0xB0CB4C, 0xB0CB88 - 0xB0CB4C

	.global img_opanim88
img_opanim88:
	.incbin "baserom.gba", 0xB0CB88, 0xB0CFC0 - 0xB0CB88

	.global tsa_opanim88
tsa_opanim88:
	.incbin "baserom.gba", 0xB0CFC0, 0xB0CFFC - 0xB0CFC0

	.global img_opanim89
img_opanim89:
	.incbin "baserom.gba", 0xB0CFFC, 0xB0D3F8 - 0xB0CFFC

	.global tsa_opanim89
tsa_opanim89:
	.incbin "baserom.gba", 0xB0D3F8, 0xB0D434 - 0xB0D3F8

	.global img_opanim90
img_opanim90:
	.incbin "baserom.gba", 0xB0D434, 0xB0D860 - 0xB0D434

	.global tsa_opanim90
tsa_opanim90:
	.incbin "baserom.gba", 0xB0D860, 0xB0D89C - 0xB0D860

	.global img_opanim91
img_opanim91:
	.incbin "baserom.gba", 0xB0D89C, 0xB0DCA8 - 0xB0D89C

	.global tsa_opanim91
tsa_opanim91:
	.incbin "baserom.gba", 0xB0DCA8, 0xB0DCE4 - 0xB0DCA8

	.global img_opanim92
img_opanim92:
	.incbin "baserom.gba", 0xB0DCE4, 0xB0E0D4 - 0xB0DCE4

	.global tsa_opanim92
tsa_opanim92:
	.incbin "baserom.gba", 0xB0E0D4, 0xB0E110 - 0xB0E0D4

	.global img_opanim93
img_opanim93:
	.incbin "baserom.gba", 0xB0E110, 0xB0E548 - 0xB0E110

	.global tsa_opanim93
tsa_opanim93:
	.incbin "baserom.gba", 0xB0E548, 0xB0E584 - 0xB0E548

	.global img_opanim94
img_opanim94:
	.incbin "baserom.gba", 0xB0E584, 0xB0E9A4 - 0xB0E584

	.global tsa_opanim94
tsa_opanim94:
	.incbin "baserom.gba", 0xB0E9A4, 0xB0E9E0 - 0xB0E9A4

	.global img_opanim95
img_opanim95:
	.incbin "baserom.gba", 0xB0E9E0, 0xB0EE18 - 0xB0E9E0

	.global tsa_opanim95
tsa_opanim95:
	.incbin "baserom.gba", 0xB0EE18, 0xB0EE54 - 0xB0EE18

	.global img_opanim96
img_opanim96:
	.incbin "baserom.gba", 0xB0EE54, 0xB0F264 - 0xB0EE54

	.global tsa_opanim96
tsa_opanim96:
	.incbin "baserom.gba", 0xB0F264, 0xB0F2A0 - 0xB0F264

	.global img_opanim97
img_opanim97:
	.incbin "baserom.gba", 0xB0F2A0, 0xB0F6DC - 0xB0F2A0

	.global tsa_opanim97
tsa_opanim97:
	.incbin "baserom.gba", 0xB0F6DC, 0xB0F718 - 0xB0F6DC

	.global img_opanim98
img_opanim98:
	.incbin "baserom.gba", 0xB0F718, 0xB0FAE0 - 0xB0F718

	.global tsa_opanim98
tsa_opanim98:
	.incbin "baserom.gba", 0xB0FAE0, 0xB0FB1C - 0xB0FAE0

	.global img_opanim99
img_opanim99:
	.incbin "baserom.gba", 0xB0FB1C, 0xB0FF30 - 0xB0FB1C

	.global tsa_opanim99
tsa_opanim99:
	.incbin "baserom.gba", 0xB0FF30, 0xB0FF6C - 0xB0FF30

	.global img_opanim100
img_opanim100:
	.incbin "baserom.gba", 0xB0FF6C, 0xB1039C - 0xB0FF6C

	.global tsa_opanim100
tsa_opanim100:
	.incbin "baserom.gba", 0xB1039C, 0xB103D8 - 0xB1039C

	.global pal_08B103D8
pal_08B103D8:  @ 0x08B103D8
	.incbin "baserom.gba", 0xB103D8, 0x100

	.global gUnknown_08B104D8
gUnknown_08B104D8:  @ 0x08B104D8
	.incbin "baserom.gba", 0xB104D8, 0x158

	.global gUnknown_08B10630
gUnknown_08B10630:  @ 0x08B10630
	.incbin "baserom.gba", 0xB10630, 0x48C

	.global gUnknown_08B10ABC
gUnknown_08B10ABC:  @ 0x08B10ABC
	.incbin "baserom.gba", 0xB10ABC, 0x20

	.global gUnknown_08B10ADC
gUnknown_08B10ADC:  @ 0x08B10ADC
	.incbin "baserom.gba", 0xB10ADC, 0x1C8

	.global gUnknown_08B10CA4
gUnknown_08B10CA4:  @ 0x08B10CA4
	.incbin "baserom.gba", 0xB10CA4, 0xBC0

	.global gUnknown_08B11864
gUnknown_08B11864:  @ 0x08B11864
	.incbin "baserom.gba", 0xB11864, 0x60

	.global gUnknown_08B118C4
gUnknown_08B118C4:  @ 0x08B118C4
	.incbin "baserom.gba", 0xB118C4, 0x348

	.global gUnknown_08B11C0C
gUnknown_08B11C0C:  @ 0x08B11C0C
	.incbin "baserom.gba", 0xB11C0C, 0x100

	.global gUnknown_08B11D0C
gUnknown_08B11D0C:  @ 0x08B11D0C
	.incbin "baserom.gba", 0xB11D0C, 0x8E8

	.global gUnknown_08B125F4
gUnknown_08B125F4:  @ 0x08B125F4
	.incbin "baserom.gba", 0xB125F4, 0x20
