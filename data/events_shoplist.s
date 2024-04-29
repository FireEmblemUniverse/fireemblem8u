	.section .data

	.global ShopList_Event_Ch2Armory
ShopList_Event_Ch2Armory:
	.short 0x02, 0x01, 0x15, 0x14, 0x1F
	.align 2, 0

	.global ShopList_Event_Ch5Armory
ShopList_Event_Ch5Armory:
	.incbin "baserom.gba", 0x9ED7D8, 0x9ED7EE - 0x9ED7D8

	.global ShopList_Event_Ch5Vendor
ShopList_Event_Ch5Vendor:
	.incbin "baserom.gba", 0x9ED7EE, 0x9ED7F8 - 0x9ED7EE

	.global ShopList_Event_Ch9aVendor
ShopList_Event_Ch9aVendor:
	.incbin "baserom.gba", 0x9ED7F8, 0x9ED80E - 0x9ED7F8

	.global ShopList_Event_Ch9aArmory
ShopList_Event_Ch9aArmory:
	.incbin "baserom.gba", 0x9ED80E, 0x9ED9A8 - 0x9ED80E
