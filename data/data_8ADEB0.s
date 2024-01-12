	.section .data

	.global gUnknown_088AF6F4
gUnknown_088AF6F4:
	.incbin "baserom.gba", 0x8AF6F4, 20

	.global gUnknown_088AF708
gUnknown_088AF708:
	.incbin "baserom.gba", 0x8AF708, 0x8AF834 - 0x8AF708

	.global gUnknown_088AF834
gUnknown_088AF834:  @ 0x088AF834
@ replacing .incbin "baserom.gba", 0x008af834, 0x4c
.4byte 0
.4byte gUnknown_088AF6F4
.4byte gUnknown_088AF708
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


