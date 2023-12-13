	.section .data

	.global gUnknown_089ED67C
gUnknown_089ED67C:  @ 0x089ED67C
	.incbin "baserom.gba", 0x9ED67C, 0x18

	.global gUnknown_089ED694
gUnknown_089ED694:  @ 0x089ED694
	.incbin "baserom.gba", 0x9ED694, 0x18

	.global gUnknown_089ED6AC
gUnknown_089ED6AC:  @ 0x089ED6AC
    .incbin "baserom.gba", 0x9ED6AC, 0x9ED9A8 - 0x9ED6AC

	.global TrapData_Event_Prologue
TrapData_Event_Prologue:
	.incbin "baserom.gba", 0x9ED9A8, 0x9ED9AB - 0x9ED9A8

	.global TrapData_Event_Ch1
TrapData_Event_Ch1:
	.incbin "baserom.gba", 0x9ED9AB, 0x9EDE99 - 0x9ED9AB

	.global TrapData_Event_PrologueHard
TrapData_Event_PrologueHard:
	.incbin "baserom.gba", 0x9EDE99, 0x9EDE9C - 0x9EDE99

	.global TrapData_Event_Ch1Hard
TrapData_Event_Ch1Hard:
	.incbin "baserom.gba", 0x9EDE9C, 0x9EDF78 - 0x9EDE9C
