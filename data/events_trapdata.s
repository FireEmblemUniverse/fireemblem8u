	.section .data

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
	.incbin "baserom.gba", 0x9ED9AD, 0x9ED9AF - 0x9ED9AD

	.global TrapData_Event_Ch4
TrapData_Event_Ch4:
	.incbin "baserom.gba", 0x9ED9AF, 0x9ED9B0 - 0x9ED9AF

	.global TrapData_Event_Ch5
TrapData_Event_Ch5:
	.incbin "baserom.gba", 0x9ED9B0, 0x9ED9B1 - 0x9ED9B0

	.global TrapData_Event_Ch5x
TrapData_Event_Ch5x:
	.incbin "baserom.gba", 0x9ED9B1, 0x9ED9B6 - 0x9ED9B1

	.global TrapData_Event_Ch6
TrapData_Event_Ch6:
	.incbin "baserom.gba", 0x9ED9B6, 1

	.global TrapData_Event_Ch7
TrapData_Event_Ch7:
	.incbin "baserom.gba", 0x9ED9B7, 0x9ED9C5 - 0x9ED9B7

	.global TrapData_Event_Ch8
TrapData_Event_Ch8:
	.incbin "baserom.gba", 0x9ED9C5, 0x9ED9C8 - 0x9ED9C5

	.global TrapData_Event_Ch9a
TrapData_Event_Ch9a:
	.incbin "baserom.gba", 0x9ED9C8, 0x9EDE99 - 0x9ED9C8

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
	.incbin "baserom.gba", 0x9EDE9E, 0x9EDEA0 - 0x9EDE9E

	.global TrapData_Event_Ch4Hard
TrapData_Event_Ch4Hard:
	.incbin "baserom.gba", 0x9EDEA0, 1

	.global TrapData_Event_Ch5Hard
TrapData_Event_Ch5Hard:
	.incbin "baserom.gba", 0x9EDEA1, 1

	.global TrapData_Event_Ch5xHard
TrapData_Event_Ch5xHard:
	.incbin "baserom.gba", 0x9EDEA2, 5

	.global TrapData_Event_Ch6Hard
TrapData_Event_Ch6Hard:
	.incbin "baserom.gba", 0x9EDEA7, 1

	.global TrapData_Event_Ch7Hard
TrapData_Event_Ch7Hard:
	.incbin "baserom.gba", 0x9EDEA8, 2

	.global TrapData_Event_Ch8Hard
TrapData_Event_Ch8Hard:
	.incbin "baserom.gba", 0x9EDEAA, 0x9EDEAD - 0x9EDEAA

	.global TrapData_Event_Ch9aHard
TrapData_Event_Ch9aHard:
	.incbin "baserom.gba", 0x9EDEAD, 0x9EDF78 - 0x9EDEAD
