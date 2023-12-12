    .section .data

    .incbin "baserom.gba", 0x9EE4a0, 0x9ee6f4 - 0x9EE4A0

.global EventScr_Prologue_Tutorial0_Exec
EventScr_Prologue_Tutorial0_Exec:
    .4byte 0x00001a23
    .4byte 0x00002e21
    .4byte 0x00020722
    .4byte 0x00000c41
    .4byte 0x0002000c
    .4byte 0xffff3120
    .4byte 0x000b0722
    .4byte 0xffff3b24
    .4byte 0x00120e20
    .4byte 0x00020722
    .4byte 0x000b0722
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00003b22
    .4byte 0x010a1120
    .4byte 0x000c0722
    .4byte 0x000c0722
    .4byte 0x00020722
    .4byte 0x00030b41
    .4byte 0xffffffff
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x000c0722
    .4byte 0x000c0722
    .4byte 0x000c0722
    .4byte 0xfffd3b25
    .4byte 0x00080e20
    .4byte 0xfffd3820
    .4byte 0x00020722
    .4byte 0x000b0722
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00003b22
    .4byte 0x000c0722
    .4byte 0x00020722
    .4byte 0x00020b41
    .4byte 0xffffffff
    .4byte 0x00010820
    .4byte 0x00001b22
    .4byte 0x00000120

.global EventScr_Prologue_Tutorial1_Exec
EventScr_Prologue_Tutorial1_Exec:
    .4byte 0x00003c20
    .4byte 0x000b0722
    .4byte 0x00000c41
    .4byte 0x000b000c
    .4byte 0x00000d40
    .4byte PlayPhaseForcePressAButtonInRangeDisp
    .4byte 0x000c0722
    .4byte 0x000c0722
    .4byte 0x00020722
    .4byte 0x00040b41
    .4byte 0xffffffff
    .4byte 0x000c0540
    .4byte 0x00000001
    .4byte 0x00020920
    .4byte 0x00000820
    .4byte 0xffff3c21
    .4byte 0xffff2620
    .4byte 0xffff3b24
    .4byte 0x00080e23
    .4byte 0x00001a23
    .4byte 0x00020722
    .4byte 0x000b0722
    .4byte 0x00010c40
    .4byte 0x00000002
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00010820
    .4byte 0x00003b22
    .4byte 0x000c0722
    .4byte 0x00020722
    .4byte 0x00030b41
    .4byte 0xffffffff
    .4byte 0x000c0540
    .4byte 0x00000000
    .4byte 0x00020820
    .4byte 0x00000120
    .4byte 0x00001922
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0xffff2b20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00002b20
    .4byte 0x00010820
    .4byte 0x00000120
    .4byte 0x00630420
    .4byte 0x00070540
    .4byte 0xffffffff
    .4byte 0x00080540
    .4byte 0x00000000
    .4byte 0x00000820
    .4byte 0x00090722
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01770620
    .4byte 0x09880620
    .4byte 0x00000c44
    .4byte 0x000c0008
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000028
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000003c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000050
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000064
    .4byte 0x00000721
    .4byte 0x00010820
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01770621
    .4byte 0x00020722
    .4byte 0x00010c44
    .4byte 0x00070000
    .4byte 0xffff2b21
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00000120
    .4byte 0xffff0321
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00000d40
    .4byte sub_8085C64
    .4byte 0x00320620
    .4byte 0xffff2a21
    .4byte 0x00000d40
    .4byte sub_8037D58
    .4byte 0x00000121
    .4byte 0x00000820
    .4byte 0x00000120
    .4byte 0x00041020
    .4byte 0x00000d40
    .4byte sub_8085C64
    .4byte 0x00001a23
    .4byte 0x000b0540
    .4byte 0xffffffff
    .4byte 0x08fd1b20
    .4byte 0x00001d20
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0xffff2a21
    .4byte 0x00000d40
    .4byte sub_8037D58
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00320620
    .4byte 0xffff2a23
    .4byte 0x00000d40
    .4byte UnlockPostgameAllyByEnemyCount
    .4byte 0x00010820
    .4byte 0x00000120
    .4byte 0x00000d40
    .4byte sub_8085C70
    .4byte 0x00000d40
    .4byte sub_80381F4
    .4byte 0x00000d40
    .4byte UnlockPostgameAllyByClearCount
    .4byte 0xffff2a21
    .4byte 0x00000120

	.global Obj_089EE99C
Obj_089EE99C:  @ 0x089EE99C
	.incbin "baserom.gba", 0x9EE99C, 0x14

	.global gUnknown_089EE9B0
gUnknown_089EE9B0:  @ 0x089EE9B0
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

	.global ProcScr_089EE9E0
ProcScr_089EE9E0:  @ 0x089EE9E0
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

    .incbin "baserom.gba", 0x9EEA58, 0x9EEBE8 - 0x9EEA58
