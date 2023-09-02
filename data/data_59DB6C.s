    .section .data

	.global gPathArrowOAMTable
gPathArrowOAMTable:  @ 0x0859DB6C
	.incbin "baserom.gba", 0x59DB6C, 0x34

	.global gUnknown_0859DBA0
gUnknown_0859DBA0:  @ 0x0859DBA0
@ replacing .incbin "baserom.gba", 0x0059dba0, 0x4
.4byte gUnknown_0203A974 + 0x1c

