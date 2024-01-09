    .section .data

	.global Obj_089EE99C
Obj_089EE99C:  @ 0x089EE99C
	.incbin "baserom.gba", 0x9EE99C, 0x14

	.global ImgLut_EventMapAnimMaskfx
ImgLut_EventMapAnimMaskfx:  @ 0x089EE9B0
@ replacing .incbin "baserom.gba", 0x009ee9b0, 0x18
.4byte gUnknown_0899D6DC
.4byte gUnknown_0899D6DC + 0x0AC8
.4byte gUnknown_0899D6DC + 0x1668
.4byte gUnknown_0899D6DC + 0x20F8
.4byte gUnknown_0899D6DC + 0x2A78
.4byte gUnknown_0899D6DC + 0x3188

	.global gUnknown_089EE9C8
gUnknown_089EE9C8:  @ 0x089EE9C8
@ replacing .incbin "baserom.gba", 0x009ee9c8, 0x18
.4byte gUnknown_0899D6DC + 0x37A8
.4byte gUnknown_0899D6DC + 0x3974
.4byte gUnknown_0899D6DC + 0x3B4C
.4byte gUnknown_0899D6DC + 0x3D10
.4byte gUnknown_0899D6DC + 0x3ED8
.4byte gUnknown_0899D6DC + 0x4070

	.global ProcScr_EventMapAnim
ProcScr_EventMapAnim:  @ 0x089EE9E0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8085E48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8085E94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_30
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8085F88
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808609C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8086100
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089EEA28
gUnknown_089EEA28:  @ 0x089EEA28
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8086134
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808613C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808622C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80862C4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808635C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global EventScr_9EEA58
EventScr_9EEA58:
    .incbin "baserom.gba", 0x9EEA58, 0x9EEAAC - 0x9EEA58

	.global EventScr_9EEAAC
EventScr_9EEAAC:
    .incbin "baserom.gba", 0x9EEAAC, 0x9EEB00 - 0x9EEAAC

	.global EventScr_9EEB00
EventScr_9EEB00:
    .incbin "baserom.gba", 0x9EEB00, 0x9EEBB8 - 0x9EEB00

	.global EventScr_9EEBB8
EventScr_9EEBB8:
    .incbin "baserom.gba", 0x9EEBB8, 0x9EEBE8 - 0x9EEBB8
