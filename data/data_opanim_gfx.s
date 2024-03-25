	.section .data

	.global Img_OpAnimWorldMap
Img_OpAnimWorldMap:  @ 0x08AB21D8
	#.incbin "graphics/op_anim/world_map.4bpp.lz"
	.incbin "baserom.gba", 0xAB21D8, 0x3BB8

	.global Tsa_OpAnimWorldMap
Tsa_OpAnimWorldMap:  @ 0x08AB5D90
	.incbin "baserom.gba", 0xAB5D90, 0x57C

	.global pal_08AB630C
pal_08AB630C:  @ 0x08AB630C
    .incbin "baserom.gba", 0xAB630C, 0x20

	.global Img_OpAnimWorldMapFog
Img_OpAnimWorldMapFog:  @ 0x08AB632C
	.incbin "baserom.gba", 0xAB632C, 0x1794

	.global Tsa_OpAnimWorldMapFog
Tsa_OpAnimWorldMapFog:  @ 0x08AB7AC0
	.incbin "baserom.gba", 0xAB7AC0, 0x2F0

	.global Pal_OpAnimWorldMapFog
Pal_OpAnimWorldMapFog:  @ 0x08AB7DB0
	.incbin "baserom.gba", 0xAB7DB0, 0x20

# graphics/op_anim/eph_eirika_bg.png

	.global Img_OpAnimCharacterBG
Img_OpAnimCharacterBG:  @ 0x08AB7DD0
	.incbin "baserom.gba", 0xAB7DD0, 0xA10

	.global Tsa_OpAnimCharacterBG
Tsa_OpAnimCharacterBG:  @ 0x08AB87E0
	.incbin "baserom.gba", 0xAB87E0, 0x4CC

	.global Pal_OpAnimCharacterBG
Pal_OpAnimCharacterBG:  @ 0x08AB8CAC
	.incbin "baserom.gba", 0xAB8CAC, 0x20

# graphics/op_anim/generic_character_bg.png

	.global Img_OpAnimGenericCharacterBG
Img_OpAnimGenericCharacterBG:  @ 0x08AB8CCC
	.incbin "baserom.gba", 0xAB8CCC, 0x760

	.global Tsa_OpAnimGenericCharacterBG
Tsa_OpAnimGenericCharacterBG:  @ 0x08AB942C
	.incbin "baserom.gba", 0xAB942C, 0x1D20

	.global Img_OpAnimEphraim
Img_OpAnimEphraim:  @ 0x08ABB14C
	.incbin "baserom.gba", 0xABB14C, 0xF28

	.global Tsa_OpAnimEphraim
Tsa_OpAnimEphraim:  @ 0x08ABC074
	.incbin "baserom.gba", 0xABC074, 0x1B8

	.global Img_OpAnimEphraimBlur1
Img_OpAnimEphraimBlur1:  @ 0x08ABC22C
	.incbin "baserom.gba", 0xABC22C, 0xF48

	.global Tsa_OpAnimEphraimBlur1
Tsa_OpAnimEphraimBlur1:  @ 0x08ABD174
	.incbin "baserom.gba", 0xABD174, 0x1D4

	.global Img_OpAnimEphraimBlur2
Img_OpAnimEphraimBlur2:  @ 0x08ABD348
	.incbin "baserom.gba", 0xABD348, 0xDD8

	.global Tsa_OpAnimEphraimBlur2
Tsa_OpAnimEphraimBlur2:  @ 0x0Tsa_OpAnimEphraimBlur2
	.incbin "baserom.gba", 0xABE120, 0x1E4

	.global Img_OpAnimEphraimBlur3
Img_OpAnimEphraimBlur3:  @ 0x08ABE304
	.incbin "baserom.gba", 0xABE304, 0xC6C

	.global Tsa_OpAnimEphraimBlur3
Tsa_OpAnimEphraimBlur3:  @ 0x08ABEF70
	.incbin "baserom.gba", 0xABEF70, 0x1F8

	.global Img_OpAnimEphraimClose1
Img_OpAnimEphraimClose1:  @ 0x08ABF168
	.incbin "baserom.gba", 0xABF168, 0x1A70

	.global Img_OpAnimEphraimClose2
Img_OpAnimEphraimClose2:  @ 0x08AC0BD8
	.incbin "baserom.gba", 0xAC0BD8, 0xCA0

	.global Tsa_OpAnimEphraimClose
Tsa_OpAnimEphraimClose:  @ 0x08AC1878
	.incbin "baserom.gba", 0xAC1878, 0x320

	.global Tsa_OpAnimEphraimClose2
Tsa_OpAnimEphraimClose2:  @ 0x08AC1B98
	.incbin "baserom.gba", 0xAC1B98, 0xF4

	.global Pal_OpAnimEphraimBlur
Pal_OpAnimEphraimBlur:  @ 0x08AC1C8C
	.incbin "baserom.gba", 0xAC1C8C, 0x160

	.global Img_OpAnimEirika
Img_OpAnimEirika:  @ 0x08AC1DEC
	.incbin "baserom.gba", 0xAC1DEC, 0xD38

	.global Tsa_OpAnimEirika
Tsa_OpAnimEirika:  @ 0x08AC2B24
	.incbin "baserom.gba", 0xAC2B24, 0x190

	.global Img_OpAnimEirikaBlur1
Img_OpAnimEirikaBlur1:  @ 0x08AC2CB4
	.incbin "baserom.gba", 0xAC2CB4, 0xD78

	.global Tsa_OpAnimEirikaBlur1
Tsa_OpAnimEirikaBlur1:  @ 0x08AC3A2C
	.incbin "baserom.gba", 0xAC3A2C, 0x19C

	.global Img_OpAnimEirikaBlur2
Img_OpAnimEirikaBlur2:  @ 0x08AC3BC8
	.incbin "baserom.gba", 0xAC3BC8, 0xB98

	.global Tsa_OpAnimEirikaBlur2
Tsa_OpAnimEirikaBlur2:  @ 0x08AC4760
	.incbin "baserom.gba", 0xAC4760, 0x1C8

	.global Img_OpAnimEirikaBlur3
Img_OpAnimEirikaBlur3:  @ 0x08AC4928
	.incbin "baserom.gba", 0xAC4928, 0xAF8

	.global Tsa_OpAnimEirikaBlur3
Tsa_OpAnimEirikaBlur3:  @ 0x08AC5420
	.incbin "baserom.gba", 0xAC5420, 0x1F4

	.global Img_OpAnimEirikaClose1
Img_OpAnimEirikaClose1:  @ 0x08AC5614
	.incbin "baserom.gba", 0xAC5614, 0x1D60

	.global Img_OpAnimEirikaClose2
Img_OpAnimEirikaClose2:  @ 0x08AC7374
	.incbin "baserom.gba", 0xAC7374, 0x1A68

	.global Tsa_OpAnimEirikaClose
Tsa_OpAnimEirikaClose:  @ 0x08AC8DDC
	.incbin "baserom.gba", 0xAC8DDC, 0x41C

	.global Tsa_OpAnimEirikaClose2
Tsa_OpAnimEirikaClose2:  @ 0x08AC91F8
	.incbin "baserom.gba", 0xAC91F8, 0x144

	.global Pal_OpAnimEirikaBlur
Pal_OpAnimEirikaBlur:  @ 0x08AC933C
	.incbin "baserom.gba", 0xAC933C, 0x160

	.global Img_OpAnimJoshua
Img_OpAnimJoshua:  @ 0x08AC949C
	.incbin "baserom.gba", 0xAC949C, 0x1AD4

	.global Img_OpAnimJoshua2
Img_OpAnimJoshua2:  @ 0x08ACAF70
	.incbin "baserom.gba", 0xACAF70, 0xFE8

	.global Tsa_OpAnimJoshua2
Tsa_OpAnimJoshua2:  @ 0x08ACBF58
	.incbin "baserom.gba", 0xACBF58, 0x3E8

	.global gUnknown_08ACC340
gUnknown_08ACC340:  @ 0x08ACC340
	.incbin "baserom.gba", 0xACC340, 0xA0

	.global Pal_OpAnimJoshua
Pal_OpAnimJoshua:  @ 0x08ACC3E0
    .incbin "baserom.gba", 0xACC3E0, 0x160

	.global Img_OpAnimLArachel
Img_OpAnimLArachel:  @ 0x08ACC540
	.incbin "baserom.gba", 0xACC540, 0x1B78

	.global Img_OpAnimLArachel2
Img_OpAnimLArachel2:  @ 0x08ACE0B8
	.incbin "baserom.gba", 0xACE0B8, 0xE18

	.global Tsa_OpAnimLArachel
Tsa_OpAnimLArachel:  @ 0x08ACEED0
	.incbin "baserom.gba", 0xACEED0, 0x330

	.global Tsa_OpAnimLArachelLeft
Tsa_OpAnimLArachelLeft:  @ 0x08ACF200
	.incbin "baserom.gba", 0xACF200, 0x114

	.global Pal_OpAnimLArachel
Pal_OpAnimLArachel:  @ 0x08ACF314
	.incbin "baserom.gba", 0xACF314, 0x160

	.global Img_OpAnimCharacterSeth
Img_OpAnimCharacterSeth:  @ 0x08ACF474
	.incbin "baserom.gba", 0xACF474, 0x1BD4

	.global Img_OpAnimCharacterSeth2
Img_OpAnimCharacterSeth2:  @ 0x08AD1048
	.incbin "baserom.gba", 0xAD1048, 0x1024

	.global Tsa_OpAnimCharacterSeth
Tsa_OpAnimCharacterSeth:  @ 0x08AD206C
	.incbin "baserom.gba", 0xAD206C, 0x300

	.global gUnknown_08AD236C
gUnknown_08AD236C:  @ 0x08AD236C
	.incbin "baserom.gba", 0xAD236C, 0x148

	.global Pal_OpAnimCharacterSeth
Pal_OpAnimCharacterSeth:  @ 0x08AD24B4
	.incbin "baserom.gba", 0xAD24B4, 0x160

	.global Img_OpAnimMyrrh
Img_OpAnimMyrrh:  @ 0x08AD2614
	.incbin "baserom.gba", 0xAD2614, 0x1C28

	.global Img_OpAnimMyrrh2
Img_OpAnimMyrrh2:  @ 0x08AD423C
	.incbin "baserom.gba", 0xAD423C, 0xE58

	.global Tsa_OpAnimMyrrh2
Tsa_OpAnimMyrrh2:  @ 0x08AD5094
	.incbin "baserom.gba", 0xAD5094, 0x3A8

	.global gUnknown_08AD543C
gUnknown_08AD543C:  @ 0x08AD543C
	.incbin "baserom.gba", 0xAD543C, 0xA0

	.global Pal_OpAnimMyrrh2
Pal_OpAnimMyrrh2:  @ 0x08AD54DC
	.incbin "baserom.gba", 0xAD54DC, 0x160

	.global Img_OpAnimSaleh
Img_OpAnimSaleh:  @ 0x08AD563C
	.incbin "baserom.gba", 0xAD563C, 0x1CC0

	.global Img_OpAnimSaleh2
Img_OpAnimSaleh2:  @ 0x08AD72FC
	.incbin "baserom.gba", 0xAD72FC, 0x121C

	.global Tsa_OpAnimSaleh2
Tsa_OpAnimSaleh2:  @ 0x08AD8518
	.incbin "baserom.gba", 0xAD8518, 0x3BC

	.global gUnknown_08AD88D4
gUnknown_08AD88D4:  @ 0x08AD88D4
	.incbin "baserom.gba", 0xAD88D4, 0xD4

	.global Pal_OpAnimSaleh2
Pal_OpAnimSaleh2:  @ 0x08AD89A8
	.incbin "baserom.gba", 0xAD89A8, 0x160

	.global Img_OpAnimTethys
Img_OpAnimTethys:  @ 0x08AD8B08
	.incbin "baserom.gba", 0xAD8B08, 0x1814

	.global Img_OpAnimTethys2
Img_OpAnimTethys2:  @ 0x08ADA31C
	.incbin "baserom.gba", 0xADA31C, 0x14E8

	.global Tsa_OpAnimTethys
Tsa_OpAnimTethys:  @ 0x08ADB804
	.incbin "baserom.gba", 0xADB804, 0x408

	.global gUnknown_08ADBC0C
gUnknown_08ADBC0C:  @ 0x08ADBC0C
	.incbin "baserom.gba", 0xADBC0C, 0x10C

	.global Pal_OpAnimTethys
Pal_OpAnimTethys:  @ 0x08ADBD18
	.incbin "baserom.gba", 0xADBD18, 0x160

	.global gUnknown_08ADBE78
gUnknown_08ADBE78:  @ 0x08ADBE78
	.incbin "baserom.gba", 0xADBE78, 0x20

	.global Img_OpAnimFaceRennac
Img_OpAnimFaceRennac:  @ 0x08ADBE98
	.incbin "baserom.gba", 0xADBE98, 0x528

	.global Img_OpAnimFaceRennacShadow
Img_OpAnimFaceRennacShadow:  @ 0x08ADC3C0
	.incbin "baserom.gba", 0xADC3C0, 0x348

	.global Pal_OpAnimFaceRennac
Pal_OpAnimFaceRennac:  @ 0x08ADC708
	.incbin "baserom.gba", 0xADC708, 0x20

	.global Img_OpAnimFaceLArachel
Img_OpAnimFaceLArachel:  @ 0x08ADC728
	.incbin "baserom.gba", 0xADC728, 0x590

	.global Img_OpAnimFaceLArachelShadow
Img_OpAnimFaceLArachelShadow:  @ 0x08ADCCB8
	.incbin "baserom.gba", 0xADCCB8, 0x398

	.global Pal_OpAnimFaceLArachel
Pal_OpAnimFaceLArachel:  @ 0x08ADD050
	.incbin "baserom.gba", 0xADD050, 0x20

	.global Img_OpAnimFaceDozla
Img_OpAnimFaceDozla:  @ 0x08ADD070
	.incbin "baserom.gba", 0xADD070, 0x67C

	.global Img_OpAnimFaceDozlaShadow
Img_OpAnimFaceDozlaShadow:  @ 0x08ADD6EC
	.incbin "baserom.gba", 0xADD6EC, 0x368

	.global Pal_OpAnimFaceDozla
Pal_OpAnimFaceDozla:  @ 0x08ADDA54
@ Replacing .incbin "baserom.gba", 0xADDA54, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x264b28c9
    .4byte 0x15071586
    .4byte gUnknown_08B1FE7C + 0x62342
    .4byte 0x27ff10f1
    .4byte 0x7ffe7353

	.global Img_OpAnimFaceEwan
Img_OpAnimFaceEwan:  @ 0x08ADDA74
	.incbin "baserom.gba", 0xADDA74, 0x60C

	.global Img_OpAnimFaceEwanShadow
Img_OpAnimFaceEwanShadow:  @ 0x08ADE080
	.incbin "baserom.gba", 0xADE080, 0x3FC

	.global Pal_OpAnimFaceEwan
Pal_OpAnimFaceEwan:  @ 0x08ADE47C
@ Replacing .incbin "baserom.gba", 0xADE47C, 0x20
    .4byte 0x63ff4f34
    .4byte 0x2a7d3b5f
    .4byte 0x2d6e25d3
    .4byte 0x153d24a8
    .4byte Pal_OpAnimShiningRing + 0xc4c9
    .4byte 0x61627a08
    .4byte 0x6e4e7b35
    .4byte 0x7ffe3d8b

	.global Img_OpAnimFaceGerik
Img_OpAnimFaceGerik:  @ 0x08ADE49C
	.incbin "baserom.gba", 0xADE49C, 0x680

	.global Img_OpAnimFaceGerikShadow
Img_OpAnimFaceGerikShadow:  @ 0x08ADEB1C
	.incbin "baserom.gba", 0xADEB1C, 0x3B8

	.global Pal_OpAnimFaceGerik
Pal_OpAnimFaceGerik:  @ 0x08ADEED4
	.incbin "baserom.gba", 0xADEED4, 0x20

	.global Img_OpAnimFaceTethys
Img_OpAnimFaceTethys:  @ 0x08ADEEF4
	.incbin "baserom.gba", 0xADEEF4, 0x698

	.global Img_OpAnimFaceTethysShadow
Img_OpAnimFaceTethysShadow:  @ 0x08ADF58C
	.incbin "baserom.gba", 0xADF58C, 0x47C

	.global Pal_OpAnimFaceTethys
Pal_OpAnimFaceTethys:  @ 0x08ADFA08
@ Replacing .incbin "baserom.gba", 0xADFA08, 0x20
    .4byte 0x6fdf4f34
    .4byte 0x2e7d473f
    .4byte 0x2d6e25d3
    .4byte 0x14fd24a8
    .4byte 0x08900c79
    .4byte 0x31ff52ff
    .4byte 0x20ac27ff
    .4byte 0x67354e73

	.global Img_OpAnimFaceMarisa
Img_OpAnimFaceMarisa:  @ 0x08ADFA28
	.incbin "baserom.gba", 0xADFA28, 0x6BC

	.global Img_OpAnimFaceMarisaShadow
Img_OpAnimFaceMarisaShadow:  @ 0x08AE00E4
	.incbin "baserom.gba", 0xAE00E4, 0x3F0

	.global Pal_OpAnimFaceMarisa
Pal_OpAnimFaceMarisa:  @ 0x08AE04D4
	.incbin "baserom.gba", 0xAE04D4, 0x20

	.global Img_OpAnimFaceGarcia
Img_OpAnimFaceGarcia:  @ 0x08AE04F4
	.incbin "baserom.gba", 0xAE04F4, 0x554

	.global Img_OpAnimFaceGarciaShadow
Img_OpAnimFaceGarciaShadow:  @ 0x08AE0A48
	.incbin "baserom.gba", 0xAE0A48, 0x32C

	.global Pal_OpAnimFaceGarcia
Pal_OpAnimFaceGarcia:  @ 0x08AE0D74
	.incbin "baserom.gba", 0xAE0D74, 0x20

	.global Img_OpAnimFaceRoss
Img_OpAnimFaceRoss:  @ 0x08AE0D94
	.incbin "baserom.gba", 0xAE0D94, 0x528

	.global Img_OpAnimFaceRossShadow
Img_OpAnimFaceRossShadow:  @ 0x08AE12BC
	.incbin "baserom.gba", 0xAE12BC, 0x378

	.global Pal_OpAnimFaceRoss
Pal_OpAnimFaceRoss:  @ 0x08AE1634
	.incbin "baserom.gba", 0xAE1634, 0x20

	.global Img_OpAnimFaceVanessa
Img_OpAnimFaceVanessa:  @ 0x08AE1654
	.incbin "baserom.gba", 0xAE1654, 0x6AC

	.global Img_OpAnimFaceVanessaShadow
Img_OpAnimFaceVanessaShadow:  @ 0x08AE1D00
	.incbin "baserom.gba", 0xAE1D00, 0x3C4

	.global Pal_OpAnimFaceVanessa
Pal_OpAnimFaceVanessa:  @ 0x08AE20C4
	.incbin "baserom.gba", 0xAE20C4, 0x20

	.global Img_OpAnimFaceTana
Img_OpAnimFaceTana:  @ 0x08AE20E4
	.incbin "baserom.gba", 0xAE20E4, 0x738

	.global Img_OpAnimFaceTanaShadow
Img_OpAnimFaceTanaShadow:  @ 0x08AE281C
	.incbin "baserom.gba", 0xAE281C, 0x3D8

	.global Pal_OpAnimFaceTana
Pal_OpAnimFaceTana:  @ 0x08AE2BF4
    .incbin "baserom.gba", 0xAE2BF4, 0x20

	.global Img_OpAnimFaceSyrene
Img_OpAnimFaceSyrene:  @ 0x08AE2C14
	.incbin "baserom.gba", 0xAE2C14, 0x7C0

	.global Img_OpAnimFaceSyreneShadow
Img_OpAnimFaceSyreneShadow:  @ 0x08AE33D4
	.incbin "baserom.gba", 0xAE33D4, 0x360

	.global Pal_OpAnimFaceSyrene
Pal_OpAnimFaceSyrene:  @ 0x08AE3734
	.incbin "baserom.gba", 0xAE3734, 0x20

	.global Img_OpAnimFaceGilliam
Img_OpAnimFaceGilliam:  @ 0x08AE3754
	.incbin "baserom.gba", 0xAE3754, 0x700

	.global Img_OpAnimFaceGilliamShadow
Img_OpAnimFaceGilliamShadow:  @ 0x08AE3E54
	.incbin "baserom.gba", 0xAE3E54, 0x390

	.global Pal_OpAnimFaceGilliam
Pal_OpAnimFaceGilliam:  @ 0x08AE41E4
	.incbin "baserom.gba", 0xAE41E4, 0x20

	.global Img_OpAnimFaceInnes
Img_OpAnimFaceInnes:  @ 0x08AE4204
	.incbin "baserom.gba", 0xAE4204, 0x73C

	.global Img_OpAnimFaceInnesShadow
Img_OpAnimFaceInnesShadow:  @ 0x08AE4940
	.incbin "baserom.gba", 0xAE4940, 0x3A8

	.global Pal_OpAnimFaceInnes
Pal_OpAnimFaceInnes:  @ 0x08AE4CE8
	.incbin "baserom.gba", 0xAE4CE8, 0x20

	.global Img_OpAnimFaceMoulder
Img_OpAnimFaceMoulder:  @ 0x08AE4D08
	.incbin "baserom.gba", 0xAE4D08, 0x6C0

	.global Img_OpAnimFaceMoulderShadow
Img_OpAnimFaceMoulderShadow:  @ 0x08AE53C8
	.incbin "baserom.gba", 0xAE53C8, 0x368

	.global Pal_OpAnimFaceMoulder
Pal_OpAnimFaceMoulder:  @ 0x08AE5730
	.incbin "baserom.gba", 0xAE5730, 0x20

	.global Img_OpAnimFaceColm
Img_OpAnimFaceColm:  @ 0x08AE5750
	.incbin "baserom.gba", 0xAE5750, 0x604

	.global Img_OpAnimFaceColmShadow
Img_OpAnimFaceColmShadow:  @ 0x08AE5D54
	.incbin "baserom.gba", 0xAE5D54, 0x35C

	.global Pal_OpAnimFaceColm
Pal_OpAnimFaceColm:  @ 0x08AE60B0
	.incbin "baserom.gba", 0xAE60B0, 0x20

	.global Img_OpAnimFaceNeimi
Img_OpAnimFaceNeimi:  @ 0x08AE60D0
	.incbin "baserom.gba", 0xAE60D0, 0x578

	.global Img_OpAnimFaceNeimiShadow
Img_OpAnimFaceNeimiShadow:  @ 0x08AE6648
	.incbin "baserom.gba", 0xAE6648, 0x3A4

	.global Pal_OpAnimFaceNeimi
Pal_OpAnimFaceNeimi:  @ 0x08AE69EC
	.incbin "baserom.gba", 0xAE69EC, 0x20

	.global Img_OpAnimFaceKnoll
Img_OpAnimFaceKnoll:  @ 0x08AE6A0C
	.incbin "baserom.gba", 0xAE6A0C, 0x59C

	.global Img_OpAnimFaceKnollShadow
Img_OpAnimFaceKnollShadow:  @ 0x08AE6FA8
	.incbin "baserom.gba", 0xAE6FA8, 0x320

	.global Pal_OpAnimFaceKnoll
Pal_OpAnimFaceKnoll:  @ 0x08AE72C8
	.incbin "baserom.gba", 0xAE72C8, 0x20

	.global Img_OpAnimFaceCormag
Img_OpAnimFaceCormag:  @ 0x08AE72E8
	.incbin "baserom.gba", 0xAE72E8, 0x5C8

	.global Img_OpAnimFaceCormagShadow
Img_OpAnimFaceCormagShadow:  @ 0x08AE78B0
	.incbin "baserom.gba", 0xAE78B0, 0x37C

	.global Pal_OpAnimFaceCormag
Pal_OpAnimFaceCormag:  @ 0x08AE7C2C
	.incbin "baserom.gba", 0xAE7C2C, 0x20

	.global Img_OpAnimFaceAmelia
Img_OpAnimFaceAmelia:  @ 0x08AE7C4C
	.incbin "baserom.gba", 0xAE7C4C, 0x550

	.global Img_OpAnimFaceAmeliaShadow
Img_OpAnimFaceAmeliaShadow:  @ 0x08AE819C
	.incbin "baserom.gba", 0xAE819C, 0x320

	.global Pal_OpAnimFaceAmelia
Pal_OpAnimFaceAmelia:  @ 0x08AE84BC
	.incbin "baserom.gba", 0xAE84BC, 0x20

	.global Img_OpAnimFaceNatasha
Img_OpAnimFaceNatasha:  @ 0x08AE84DC
	.incbin "baserom.gba", 0xAE84DC, 0x5DC

	.global Img_OpAnimFaceNatashaShadow
Img_OpAnimFaceNatashaShadow:  @ 0x08AE8AB8
	.incbin "baserom.gba", 0xAE8AB8, 0x2CC

	.global Pal_OpAnimFaceNatasha
Pal_OpAnimFaceNatasha:  @ 0x08AE8D84
	.incbin "baserom.gba", 0xAE8D84, 0x20

	.global Img_OpAnimFaceLute
Img_OpAnimFaceLute:  @ 0x08AE8DA4
	.incbin "baserom.gba", 0xAE8DA4, 0x5C0

	.global Img_OpAnimFaceLuteShadow
Img_OpAnimFaceLuteShadow:  @ 0x08AE9364
	.incbin "baserom.gba", 0xAE9364, 0x3BC

	.global Pal_OpAnimFaceLute
Pal_OpAnimFaceLute:  @ 0x08AE9720
	.incbin "baserom.gba", 0xAE9720, 0x20

	.global Img_OpAnimFaceArtur
Img_OpAnimFaceArtur:  @ 0x08AE9740
	.incbin "baserom.gba", 0xAE9740, 0x564

	.global Img_OpAnimFaceArturShadow
Img_OpAnimFaceArturShadow:  @ 0x08AE9CA4
	.incbin "baserom.gba", 0xAE9CA4, 0x388

	.global Pal_OpAnimFaceArtur
Pal_OpAnimFaceArtur:  @ 0x08AEA02C
    .incbin "baserom.gba", 0xAEA02C, 0x20

	.global Img_OpAnimFaceKyle
Img_OpAnimFaceKyle:  @ 0x08AEA04C
	.incbin "baserom.gba", 0xAEA04C, 0x75C

	.global Img_OpAnimFaceKyleShadow
Img_OpAnimFaceKyleShadow:  @ 0x08AEA7A8
	.incbin "baserom.gba", 0xAEA7A8, 0x3A8

	.global Pal_OpAnimFaceKyle
Pal_OpAnimFaceKyle:  @ 0x08AEAB50
	.incbin "baserom.gba", 0xAEAB50, 0x20

	.global Img_OpAnimFaceFranz
Img_OpAnimFaceFranz:  @ 0x08AEAB70
	.incbin "baserom.gba", 0xAEAB70, 0x648

	.global Img_OpAnimFaceFranzShadow
Img_OpAnimFaceFranzShadow:  @ 0x08AEB1B8
	.incbin "baserom.gba", 0xAEB1B8, 0x3B4

	.global Pal_OpAnimFaceFranz
Pal_OpAnimFaceFranz:  @ 0x08AEB56C
	.incbin "baserom.gba", 0xAEB56C, 0x20

	.global Img_OpAnimFaceForde
Img_OpAnimFaceForde:  @ 0x08AEB58C
	.incbin "baserom.gba", 0xAEB58C, 0x760

	.global Img_OpAnimFaceFordeShadow
Img_OpAnimFaceFordeShadow:  @ 0x08AEBCEC
	.incbin "baserom.gba", 0xAEBCEC, 0x35C

	.global Pal_OpAnimFaceForde
Pal_OpAnimFaceForde:  @ 0x08AEC048
	.incbin "graphics/op_anim/FaceValterShadow.gbapal", 0x0, 0x20

	.global Img_OpAnimFaceSeth
Img_OpAnimFaceSeth:  @ 0x08AEC068
	.incbin "baserom.gba", 0xAEC068, 0x6BC

	.global Img_OpAnimFaceSethShadow
Img_OpAnimFaceSethShadow:  @ 0x08AEC724
	.incbin "baserom.gba", 0xAEC724, 0x39C

	.global Pal_OpAnimFaceSeth
Pal_OpAnimFaceSeth:  @ 0x08AECAC0
	.incbin "baserom.gba", 0xAECAC0, 0x20

	.global Img_OpAnimFaceDuessel
Img_OpAnimFaceDuessel:  @ 0x08AECAE0
	.incbin "baserom.gba", 0xAECAE0, 0x5C4

	.global Img_OpAnimFaceDuesselShadow
Img_OpAnimFaceDuesselShadow:  @ 0x08AED0A4
	.incbin "baserom.gba", 0xAED0A4, 0x344

	.global Pal_OpAnimFaceDuessel
Pal_OpAnimFaceDuessel:  @ 0x08AED3E8
	.incbin "baserom.gba", 0xAED3E8, 0x20

	.global Img_OpAnimFaceSelena
Img_OpAnimFaceSelena:  @ 0x08AED408
	.incbin "baserom.gba", 0xAED408, 0x554

	.global Img_OpAnimFaceSelenaShadow
Img_OpAnimFaceSelenaShadow:  @ 0x08AED95C
	.incbin "baserom.gba", 0xAED95C, 0x324

	.global Pal_OpAnimFaceSelena
Pal_OpAnimFaceSelena:  @ 0x08AEDC80
	.incbin "baserom.gba", 0xAEDC80, 0x20

	.global Img_OpAnimFaceGlen
Img_OpAnimFaceGlen:  @ 0x08AEDCA0
	.incbin "baserom.gba", 0xAEDCA0, 0x578

	.global Img_OpAnimFaceGlenShadow
Img_OpAnimFaceGlenShadow:  @ 0x08AEE218
	.incbin "baserom.gba", 0xAEE218, 0x34C

	.global Pal_OpAnimFaceGlen
Pal_OpAnimFaceGlen:  @ 0x08AEE564
	.incbin "baserom.gba", 0xAEE564, 0x20

	.global Img_OpAnimFaceValter
Img_OpAnimFaceValter:  @ 0x08AEE584
	.incbin "baserom.gba", 0xAEE584, 0x62C

	.global Img_OpAnimFaceValterShadow
Img_OpAnimFaceValterShadow:  @ 0x08AEEBB0
	.incbin "graphics/op_anim/FaceValterShadow.4bpp.lz"

	.global Pal_OpAnimFaceValter
Pal_OpAnimFaceValter:  @ 0x08AEEECC
	.incbin "baserom.gba", 0xAEEECC, 0x20

	.global Img_OpAnimFaceRiev
Img_OpAnimFaceRiev:  @ 0x08AEEEEC
	.incbin "baserom.gba", 0xAEEEEC, 0x694

	.global Img_OpAnimFaceRievShadow
Img_OpAnimFaceRievShadow:  @ 0x08AEF580
	.incbin "baserom.gba", 0xAEF580, 0x300

	.global Pal_OpAnimFaceRiev
Pal_OpAnimFaceRiev:  @ 0x08AEF880
	.incbin "baserom.gba", 0xAEF880, 0x20

	.global Img_OpAnimFaceCaellach
Img_OpAnimFaceCaellach:  @ 0x08AEF8A0
	.incbin "baserom.gba", 0xAEF8A0, 0x528

	.global Img_OpAnimFaceCaellachShadow
Img_OpAnimFaceCaellachShadow:  @ 0x08AEFDC8
	.incbin "baserom.gba", 0xAEFDC8, 0x368

	.global Pal_OpAnimFaceCaellach
Pal_OpAnimFaceCaellach:  @ 0x08AF0130
	.incbin "baserom.gba", 0xAF0130, 0x20

	.global Img_OpAnimFaceLyon
Img_OpAnimFaceLyon:  @ 0x08AF0150
	.incbin "baserom.gba", 0xAF0150, 0x894

	.global Img_OpAnimFaceLyonShadow
Img_OpAnimFaceLyonShadow:  @ 0x08AF09E4
	.incbin "baserom.gba", 0xAF09E4, 0x404

	.global Pal_OpAnimFaceLyon
Pal_OpAnimFaceLyon:  @ 0x08AF0DE8
	.incbin "baserom.gba", 0xAF0DE8, 0x20

	.global Img_OpAnimFaceVigarde
Img_OpAnimFaceVigarde:  @ 0x08AF0E08
	.incbin "baserom.gba", 0xAF0E08, 0x8C4

	.global Img_OpAnimFaceVigardeShadow
Img_OpAnimFaceVigardeShadow:  @ 0x08AF16CC
	.incbin "baserom.gba", 0xAF16CC, 0x3FC

	.global Pal_OpAnimFaceVigarde
Pal_OpAnimFaceVigarde:  @ 0x08AF1AC8
	.incbin "baserom.gba", 0xAF1AC8, 0x20

	.global Img_OpAnimSplitLine
Img_OpAnimSplitLine:  @ 0x08AF1AE8
	.incbin "graphics/op_anim/split_line.4bpp.lz"

	.global Pal_OpAnimSplitLine
Pal_OpAnimSplitLine:  @ 0x08AF1B18
	.incbin "graphics/op_anim/split_line.gbapal", 0x0, 0x20

	.global Img_opanim_unk1
Img_opanim_unk1:  @ 0x08AF1B38
	.incbin "graphics/op_anim/opanim_08AF1B38.4bpp.lz"

	.global Pal_opanim_unk1
Pal_opanim_unk1:  @ 0x08AF1FB0
	.incbin "graphics/op_anim/opanim_08AF1B38.gbapal", 0x0, 0x20

	.global Img_OpAnimEphEirikaName
Img_OpAnimEphEirikaName:  @ 0x08AF1FD0
	.incbin "graphics/op_anim/eph_eirika_name.4bpp.lz"

	.global Pal_OpAnimEphEirikaName
Pal_OpAnimEphEirikaName:  @ 0x08AF2634
	.incbin "graphics/op_anim/eph_eirika_name.gbapal", 0x0, 0x20

	.global Img_OpAnimDivlEye
Img_OpAnimDivlEye:  @ 0x08AF2654
	.incbin "graphics/op_anim/devil_eye.4bpp.lz"

	.global Pal_OpAnimDivlEye
Pal_OpAnimDivlEye:  @ 0x08AF310C
	.incbin "graphics/op_anim/devil_eye.gbapal", 0x0, 0x20

	.global Img_OpAnimShiningRing
Img_OpAnimShiningRing:  @ 0x08AF312C
	.incbin "baserom.gba", 0xAF312C, 0xF20

	.global Tsa_OpAnimShiningRing
Tsa_OpAnimShiningRing:  @ 0x08AF404C
	.incbin "baserom.gba", 0xAF404C, 0x2E4

	.global Tsa_OpAnimShiningRingBlinking
Tsa_OpAnimShiningRingBlinking:  @ 0x08AF4330
	.incbin "baserom.gba", 0xAF4330, 0x4C0

	.global Pal_OpAnimShiningRing
Pal_OpAnimShiningRing:  @ 0x08AF47F0
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

	.global Tsa_GameIntroNintendo
Tsa_GameIntroNintendo:  @ 0x08B104D8
	.incbin "baserom.gba", 0xB104D8, 0x158

	.global Img_GameIntroNintendo
Img_GameIntroNintendo:  @ 0x08B10630
	.incbin "baserom.gba", 0xB10630, 0x48C

	.global Pal_GameIntroNintendo
Pal_GameIntroNintendo:  @ 0x08B10ABC
	.incbin "baserom.gba", 0xB10ABC, 0x20

	.global Tsa_IntelligentSystems
Tsa_IntelligentSystems:  @ 0x08B10ADC
	.incbin "baserom.gba", 0xB10ADC, 0x1C8

	.global Img_IntelligentSystems
Img_IntelligentSystems:  @ 0x08B10CA4
	.incbin "baserom.gba", 0xB10CA4, 0xBC0

	.global Pal_IntelligentSystems
Pal_IntelligentSystems:  @ 0x08B11864
	.incbin "baserom.gba", 0xB11864, 0x60

	.global Tsa_OpAnimHleathSafetyScreenBG1
Tsa_OpAnimHleathSafetyScreenBG1:  @ 0x08B118C4
	.incbin "baserom.gba", 0xB118C4, 0x348

	.global Tsa_OpAnimHleathSafetyScreenBG0
Tsa_OpAnimHleathSafetyScreenBG0:  @ 0x08B11C0C
	.incbin "baserom.gba", 0xB11C0C, 0x100

	.global Img_OpAnimHleathSafetyScreen
Img_OpAnimHleathSafetyScreen:  @ 0x08B11D0C
	.incbin "baserom.gba", 0xB11D0C, 0x8E8

	.global Pal_OpAnimHleathSafetyScreen
Pal_OpAnimHleathSafetyScreen:  @ 0x08B125F4
	.incbin "baserom.gba", 0xB125F4, 0x20
