	.section .data

	.global gUnknown_089ED67C
gUnknown_089ED67C:  @ 0x089ED67C
	.incbin "baserom.gba", 0x9ED67C, 0x18

	.global gUnknown_089ED694
gUnknown_089ED694:  @ 0x089ED694
	.incbin "baserom.gba", 0x9ED694, 0x18

	.global gUnknown_089ED6AC
gUnknown_089ED6AC:  @ 0x089ED6AC
    .incbin "baserom.gba", 0x9ED6AC, 0x9ED7CC - 0x9ED6AC

	.global ShopList_Event_Ch2Armory
ShopList_Event_Ch2Armory:
	.short 0x02, 0x01, 0x15, 0x14, 0x1F
	.align 2, 0

	.global ShopList_Event_089ED7D8
ShopList_Event_089ED7D8:
	.incbin "baserom.gba", 0x9ED7D8, 0x9ED9A8 - 0x9ED7D8

	.global TrapData_Event_Prologue
TrapData_Event_Prologue:
	.incbin "baserom.gba", 0x9ED9A8, 0x9ED9AB - 0x9ED9A8

	.global TrapData_Event_Ch1
TrapData_Event_Ch1:
	.incbin "baserom.gba", 0x9ED9AB, 0x9ED9AC - 0x9ED9AB

	.global TrapData_Event_Ch2
TrapData_Event_Ch2:
	.incbin "baserom.gba", 0x9ED9AC, 0x9ED9AD - 0x9ED9AC

	.global TrapData_Event_Ch3
TrapData_Event_Ch3:
	.incbin "baserom.gba", 0x9ED9AD, 0x9EDE99 - 0x9ED9AD

	.global TrapData_Event_PrologueHard
TrapData_Event_PrologueHard:
	.incbin "baserom.gba", 0x9EDE99, 0x9EDE9C - 0x9EDE99

	.global TrapData_Event_Ch1Hard
TrapData_Event_Ch1Hard:
	.incbin "baserom.gba", 0x9EDE9C, 0x9EDE9D - 0x9EDE9C

	.global TrapData_Event_Ch2Hard
TrapData_Event_Ch2Hard:
	.incbin "baserom.gba", 0x9EDE9D, 0x9EDE9E - 0x9EDE9D

	.global TrapData_Event_Ch3Hard
TrapData_Event_Ch3Hard:
	.incbin "baserom.gba", 0x9EDE9E, 0x9EDF78 - 0x9EDE9E
