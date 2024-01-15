    .section .data

	.global Obj_089EE99C
Obj_089EE99C:  @ 0x089EE99C
	.incbin "baserom.gba", 0x9EE99C, 0x14

	.global ImgLut_EventMapAnimMaskfx
ImgLut_EventMapAnimMaskfx:  @ 0x089EE9B0
@ replacing .incbin "baserom.gba", 0x009ee9b0, 0x18
.4byte Img_0899D6DC
.4byte Img_99E1A4
.4byte Img_99ED44
.4byte Img_99F7D4
.4byte Img_9A0154
.4byte Img_9A0864

	.global gUnknown_089EE9C8
gUnknown_089EE9C8:  @ 0x089EE9C8
@ replacing .incbin "baserom.gba", 0x009ee9c8, 0x18
.4byte TileSet_9A0E84
.4byte TileSet_9A1050
.4byte TileSet_9A1228
.4byte TileSet_9A13EC
.4byte TileSet_9A15B4
.4byte TileSet_9A174C

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
