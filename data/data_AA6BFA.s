    .section .data

	.global tsas_08AA6EA4
tsas_08AA6EA4:  @ 0x08AA6EA4
@ replacing .incbin "baserom.gba", 0x00aa6ea4, 0x190
.4byte tsa_gameintro1
.4byte tsa_gameintro2
.4byte tsa_gameintro3
.4byte tsa_gameintro4
.4byte tsa_gameintro5
.4byte tsa_gameintro6
.4byte tsa_gameintro7
.4byte tsa_gameintro8
.4byte tsa_gameintro9
.4byte tsa_gameintro10
.4byte tsa_gameintro11
.4byte tsa_gameintro12
.4byte tsa_gameintro13
.4byte tsa_gameintro14
.4byte tsa_gameintro15
.4byte tsa_gameintro16
.4byte tsa_gameintro17
.4byte tsa_gameintro18
.4byte tsa_gameintro19
.4byte tsa_gameintro20
.4byte tsa_gameintro21
.4byte tsa_gameintro22
.4byte tsa_gameintro23
.4byte tsa_gameintro24
.4byte tsa_gameintro25
.4byte tsa_gameintro26
.4byte tsa_gameintro27
.4byte tsa_gameintro28
.4byte tsa_gameintro29
.4byte tsa_gameintro30
.4byte pal_08AF47F0 + 0x8a70
.4byte pal_08AF47F0 + 0x8ed4
.4byte pal_08AF47F0 + 0x9338
.4byte pal_08AF47F0 + 0x97a8
.4byte pal_08AF47F0 + 0x9c1c
.4byte pal_08AF47F0 + 0xa090
.4byte pal_08AF47F0 + 0xa504
.4byte pal_08AF47F0 + 0xa97c
.4byte pal_08AF47F0 + 0xadec
.4byte pal_08AF47F0 + 0xb254
.4byte pal_08AF47F0 + 0xb6bc
.4byte pal_08AF47F0 + 0xbb2c
.4byte pal_08AF47F0 + 0xbfa4
.4byte pal_08AF47F0 + 0xc41c
.4byte pal_08AF47F0 + 0xc88c
.4byte pal_08AF47F0 + 0xcd00
.4byte pal_08AF47F0 + 0xd178
.4byte pal_08AF47F0 + 0xd5ec
.4byte pal_08AF47F0 + 0xda54
.4byte pal_08AF47F0 + 0xdec8
.4byte pal_08AF47F0 + 0xe330
.4byte pal_08AF47F0 + 0xe7a0
.4byte pal_08AF47F0 + 0xec0c
.4byte pal_08AF47F0 + 0xf080
.4byte pal_08AF47F0 + 0xf4f0
.4byte pal_08AF47F0 + 0xf968
.4byte pal_08AF47F0 + 0xfde0
.4byte pal_08AF47F0 + 0x10258
.4byte pal_08AF47F0 + 0x106c4
.4byte pal_08AF47F0 + 0x10b38
.4byte pal_08AF47F0 + 0x10fa4
.4byte pal_08AF47F0 + 0x1140c
.4byte pal_08AF47F0 + 0x11880
.4byte pal_08AF47F0 + 0x11cf8
.4byte pal_08AF47F0 + 0x12170
.4byte pal_08AF47F0 + 0x125e4
.4byte pal_08AF47F0 + 0x12a54
.4byte pal_08AF47F0 + 0x12ec4
.4byte pal_08AF47F0 + 0x1333c
.4byte pal_08AF47F0 + 0x137a4
.4byte pal_08AF47F0 + 0x13c14
.4byte pal_08AF47F0 + 0x1408c
.4byte pal_08AF47F0 + 0x14504
.4byte pal_08AF47F0 + 0x14970
.4byte pal_08AF47F0 + 0x14de0
.4byte pal_08AF47F0 + 0x15258
.4byte pal_08AF47F0 + 0x156cc
.4byte pal_08AF47F0 + 0x15b44
.4byte pal_08AF47F0 + 0x15fb8
.4byte pal_08AF47F0 + 0x16430
.4byte pal_08AF47F0 + 0x168a8
.4byte pal_08AF47F0 + 0x16d18
.4byte pal_08AF47F0 + 0x1718c
.4byte pal_08AF47F0 + 0x17604
.4byte pal_08AF47F0 + 0x17a78
.4byte pal_08AF47F0 + 0x17eec
.4byte pal_08AF47F0 + 0x1835c
.4byte pal_08AF47F0 + 0x187d0
.4byte pal_08AF47F0 + 0x18c08
.4byte pal_08AF47F0 + 0x19070
.4byte pal_08AF47F0 + 0x194b8
.4byte pal_08AF47F0 + 0x198e4
.4byte pal_08AF47F0 + 0x19d58
.4byte pal_08AF47F0 + 0x1a1b4
.4byte pal_08AF47F0 + 0x1a628
.4byte pal_08AF47F0 + 0x1aa74
.4byte pal_08AF47F0 + 0x1aeec
.4byte pal_08AF47F0 + 0x1b2f0
.4byte pal_08AF47F0 + 0x1b740
.4byte pal_08AF47F0 + 0x1bbac

	.global gUnknown_08AA7034
gUnknown_08AA7034:  @ 0x08AA7034
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C7610
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C7618
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08AA704C
gUnknown_08AA704C:  @ 0x08AA704C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8554
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08AA705C
gUnknown_08AA705C:  @ 0x08AA705C
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C85FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8580
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C85B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA707C
gUnknown_08AA707C:  @ 0x08AA707C
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80C8684
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C8608
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C8638
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA709C
gUnknown_08AA709C:  @ 0x08AA709C
	.incbin "baserom.gba", 0xAA709C, 0x20

	.global gUnknown_08AA70BC
gUnknown_08AA70BC:  @ 0x08AA70BC
	.incbin "baserom.gba", 0xAA70BC, 0x20

	.global gUnknown_08AA70DC
gUnknown_08AA70DC:  @ 0x08AA70DC
	.incbin "baserom.gba", 0xAA70DC, 0xE

	.global gUnknown_08AA70EA
gUnknown_08AA70EA:  @ 0x08AA70EA
	.incbin "baserom.gba", 0xAA70EA, 0x2C

	.global gUnknown_08AA7116
gUnknown_08AA7116:  @ 0x08AA7116
	.incbin "baserom.gba", 0xAA7116, 0x14

	.global gUnknown_08AA712A
gUnknown_08AA712A:  @ 0x08AA712A
	.incbin "baserom.gba", 0xAA712A, 0x32

	.global gUnknown_08AA715C
gUnknown_08AA715C:  @ 0x08AA715C
	.incbin "baserom.gba", 0xAA715C, 0x38

	.global gUnknown_08AA7194
gUnknown_08AA7194:  @ 0x08AA7194
	.incbin "baserom.gba", 0xAA7194, 0x34
