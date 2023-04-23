	.section .data

    .global gUnknown_088ADEB0
gUnknown_088ADEB0:  @ 0x088ADEB0
	.incbin "baserom.gba", 0x8ADEB0, 0x41

    .global gUnknown_088ADEF1
gUnknown_088ADEF1:  @ 0x088ADEF1
    .incbin "baserom.gba", 0x8ADEF1, 0x39

	.global gUnknown_088ADF2A
gUnknown_088ADF2A:  @ 0x088ADF2A
	.incbin "baserom.gba", 0x8ADF2A, 0xF

	.global gUnknown_088ADF39
gUnknown_088ADF39:  @ 0x088ADF39
	.incbin "baserom.gba", 0x8ADF39, 0x1E

	.global gItemUseJidList_HeroCrest
gItemUseJidList_HeroCrest:  @ 0x088ADF57
	.incbin "baserom.gba", 0x8ADF57, 0x7

	.global gItemUseJidList_KnightCrest
gItemUseJidList_KnightCrest:  @ 0x088ADF5E
	.incbin "baserom.gba", 0x8ADF5E, 0x6

	.global gItemUseJidList_OrionsBlot
gItemUseJidList_OrionsBlot:  @ 0x088ADF64
	.incbin "baserom.gba", 0x8ADF64, 0x3

	.global gItemUseJidList_ElysianWhip
gItemUseJidList_ElysianWhip:  @ 0x088ADF67
	.incbin "baserom.gba", 0x8ADF67, 0x4

	.global gItemUseJidList_GuidRing
gItemUseJidList_GuidRing:  @ 0x088ADF6B
	.incbin "baserom.gba", 0x8ADF6B, 0xB

	.global gItemUseJidList_MasterSeal
gItemUseJidList_MasterSeal:  @ 0x088ADF76
	.incbin "baserom.gba", 0x8ADF76, 0x20

	.global gItemUseJidList_HeavenSeal
gItemUseJidList_HeavenSeal:  @ 0x088ADF96
	.incbin "baserom.gba", 0x8ADF96, 0x8

	.global gItemUseJidList_OceanSeal
gItemUseJidList_OceanSeal:  @ 0x088ADF9E
	.incbin "baserom.gba", 0x8ADF9E, 0x5

	.global gItemUseJidList_C1
gItemUseJidList_C1:  @ 0x088ADFA3
	.incbin "baserom.gba", 0x8ADFA3, 0x1

	.global gItemUseJidList_LunarBrace
gItemUseJidList_LunarBrace:  @ 0x088ADFA4
	.incbin "baserom.gba", 0x8ADFA4, 0x2

	.global gItemUseJidList_SolarBrace
gItemUseJidList_SolarBrace:  @ 0x088ADFA6
	.incbin "baserom.gba", 0x8ADFA6, 0xC06

	.global gSupportData
gSupportData:		@ 0x088AEBAC
	.incbin "baserom.gba", 0x8AEBAC, 0x318

	.global gUnknown_088AEEC4
gUnknown_088AEEC4:  @ 0x088AEEC4
	.incbin "baserom.gba", 0x8AEEC4, 0x970

	.global gUnknown_088AF834
gUnknown_088AF834:  @ 0x088AF834
@ replacing .incbin "baserom.gba", 0x008af834, 0x4c
.4byte 0
.4byte gItemUseJidList_SolarBrace + 0x174e
.4byte gItemUseJidList_SolarBrace + 0x1762
.4byte gItemUseJidList_SolarBrace + 0x177a
.4byte gItemUseJidList_SolarBrace + 0x1792
.4byte gItemUseJidList_SolarBrace + 0x17aa
.4byte gItemUseJidList_SolarBrace + 0x17c2
.4byte gItemUseJidList_SolarBrace + 0x17ce
.4byte gItemUseJidList_SolarBrace + 0x17da
.4byte gItemUseJidList_SolarBrace + 0x17e6
.4byte gItemUseJidList_SolarBrace + 0x1802
.4byte gItemUseJidList_SolarBrace + 0x181a
.4byte gItemUseJidList_SolarBrace + 0x1826
.4byte gItemUseJidList_SolarBrace + 0x1832
.4byte gItemUseJidList_SolarBrace + 0x184a
.4byte gItemUseJidList_SolarBrace + 0x1856
.4byte gItemUseJidList_SolarBrace + 0x1862
.4byte gItemUseJidList_SolarBrace + 0x1876
.4byte gItemUseJidList_SolarBrace + 0x1882


