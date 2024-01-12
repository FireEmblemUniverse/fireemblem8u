	.section .data

	.incbin "baserom.gba", 0x8ADFAC, 0x8AEBAC - 0x8ADFAC

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


