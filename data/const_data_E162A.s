	.section .rodata

	.global Img_TriPegasusKnightBG
Img_TriPegasusKnightBG:  @ 0x080E17C0
	.incbin "./graphics/efxbattle/Img_TriPegasusKnightBG.4bpp.lz"

	.global Img_TriFalconKnightLanceBG
Img_TriFalconKnightLanceBG:  @ 0x080E2164
	.incbin "./graphics/efxbattle/Img_TriFalconKnightLanceBG.4bpp.lz"

	.global Img_TriFalconKnightSwordBG
Img_TriFalconKnightSwordBG:  @ 0x080E2B54
	.incbin "./graphics/efxbattle/Img_TriFalconKnightSwordBG.4bpp.lz"

	.global Tsa_EkrTriPegagusRightBG1
Tsa_EkrTriPegagusRightBG1:  @ 0x080E3554
	.incbin "baserom.gba", 0xE3554, 0xE3668 - 0xE3554

	.global Tsa_EkrTriPegagusRightBG2
Tsa_EkrTriPegagusRightBG2:  @ 0x080E3668
	.incbin "baserom.gba", 0xE3668, 0xE378C - 0xE3668

	.global Tsa_EkrTriPegagusRightBG3
Tsa_EkrTriPegagusRightBG3:  @ 0x080E378C
	.incbin "baserom.gba", 0xE378C, 0xE3864 - 0xE378C

	.global Tsa_EkrTriPegagusLeftBG1
Tsa_EkrTriPegagusLeftBG1:  @ 0x080E3864
	.incbin "baserom.gba", 0xE3864, 0xE3980 - 0xE3864

	.global Tsa_EkrTriPegagusLeftBG2
Tsa_EkrTriPegagusLeftBG2:  @ 0x080E3980
	.incbin "baserom.gba", 0xE3980, 0xE3AA4 - 0xE3980

	.global Tsa_EkrTriPegagusLeftBG3
Tsa_EkrTriPegagusLeftBG3:  @ 0x080E3AA4
	.incbin "baserom.gba", 0xE3AA4, 0xE3B78 - 0xE3AA4

	.global Img_TriPegasusKnightOBJ
Img_TriPegasusKnightOBJ:  @ 0x080E3B78
	.incbin "./graphics/efxbattle/Img_TriPegasusKnightOBJ.4bpp.lz"

	.global Img_TriFalconKnightLanceOBJ
Img_TriFalconKnightLanceOBJ:  @ 0x080E4530
	.incbin "./graphics/efxbattle/Img_TriFalconKnightLanceOBJ.4bpp.lz"

	.global Img_TriFalconKnightSwordOBJ
Img_TriFalconKnightSwordOBJ:  @ 0x080E4EFC
	.incbin "./graphics/efxbattle/Img_TriFalconKnightSwordOBJ.4bpp.lz"

	.global Img_TriKnightOBJ
Img_TriKnightOBJ:  @ 0x080E58A4
	.incbin "./graphics/efxbattle/Img_TriKnightOBJ.4bpp.lz"

	.global Img_TriGenerialLanceOBJ
Img_TriGenerialLanceOBJ:  @ 0x080E5BC4
	.incbin "./graphics/efxbattle/Img_TriGenerialLanceOBJ.4bpp.lz"

	.global Img_TriGenerialAxeOBJ
Img_TriGenerialAxeOBJ:  @ 0x080E5F98
	.incbin "./graphics/efxbattle/Img_TriGenerialAxeOBJ.4bpp.lz"

	.global Img_TriGenerialHandAxeOBJ
Img_TriGenerialHandAxeOBJ:  @ 0x080E63CC
	.incbin "./graphics/efxbattle/Img_TriGenerialHandAxeOBJ.4bpp.lz"

	.global Img_TriKnightAtkOBJ
Img_TriKnightAtkOBJ:  @ 0x080E678C
	.incbin "./graphics/efxbattle/Img_TriKnightAtkOBJ.4bpp.lz"

	.global Img_TriGenerialLanceAtkOBJ
Img_TriGenerialLanceAtkOBJ:  @ 0x080E6CC4
	.incbin "./graphics/efxbattle/Img_TriGenerialLanceAtkOBJ.4bpp.lz"

	.global Img_TriGenerialAxeAtkOBJ
Img_TriGenerialAxeAtkOBJ:  @ 0x080E7400
	.incbin "./graphics/efxbattle/Img_TriGenerialAxeAtkOBJ.4bpp.lz"

	.global Img_TriGenerialHandAxeAtkOBJ
Img_TriGenerialHandAxeAtkOBJ:  @ 0x080E7B8C
	.incbin "./graphics/efxbattle/Img_TriGenerialHandAxeAtkOBJ.4bpp.lz"
