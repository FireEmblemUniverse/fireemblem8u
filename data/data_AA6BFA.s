    .section .data

	.incbin "baserom.gba", 0xAA6BB8, 0x42

	.global gUnknown_08AA6BFA
gUnknown_08AA6BFA:  @ 0x08AA6BFA
	.incbin "baserom.gba", 0xAA6BFA, 0x14

	.global gUnknown_08AA6C0E
gUnknown_08AA6C0E:  @ 0x08AA6C0E
	.incbin "baserom.gba", 0xAA6C0E, 0x14

	.global Obj_08AA6C22
Obj_08AA6C22:  @ 0x08AA6C22
	.incbin "baserom.gba", 0xAA6C22, 0x14

	.global Obj_08AA6C36
Obj_08AA6C36:  @ 0x08AA6C36
	.incbin "baserom.gba", 0xAA6C36, 0x14

	.global Obj_08AA6C4A
Obj_08AA6C4A:  @ 0x08AA6C4A
	.incbin "baserom.gba", 0xAA6C4A, 0xE

	.global Obj_08AA6C58
Obj_08AA6C58:  @ 0x08AA6C58
	.incbin "baserom.gba", 0xAA6C58, 0xE

	.global Obj_08AA6C66
Obj_08AA6C66:  @ 0x08AA6C66
	.incbin "baserom.gba", 0xAA6C66, 0xE

	.global Obj_08AA6C74
Obj_08AA6C74:  @ 0x08AA6C74
	.incbin "baserom.gba", 0xAA6C74, 0xE

	.global Obj_08AA6C82
Obj_08AA6C82:  @ 0x08AA6C82
	.incbin "baserom.gba", 0xAA6C82, 0x8

	.global Obj_08AA6C8A
Obj_08AA6C8A:  @ 0x08AA6C8A
	.incbin "baserom.gba", 0xAA6C8A, 0x8

	.global Obj_08AA6C92
Obj_08AA6C92:  @ 0x08AA6C92
	.incbin "baserom.gba", 0xAA6C92, 0x8

	.global Obj_08AA6C9A
Obj_08AA6C9A:  @ 0x08AA6C9A
	.incbin "baserom.gba", 0xAA6C9A, 0xA

	.global ProcScr_GameIntrofxTerminator
ProcScr_GameIntrofxTerminator:  @ 0x08AA6CA4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word GameIntrofxTerminatorMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6CBC
gUnknown_08AA6CBC:  @ 0x08AA6CBC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C6B50
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6B8C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6CDC
gUnknown_08AA6CDC:  @ 0x08AA6CDC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80C6E14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6E1C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Until6C2AIs8Callback
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C6EB0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6D04
gUnknown_08AA6D04:  @ 0x08AA6D04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80C71B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08AA6D14
gUnknown_08AA6D14:  @ 0x08AA6D14
@ replacing .incbin "baserom.gba", 0x00aa6d14, 0x190
.4byte gUnknown_08AF47F0 + 0x80
.4byte gUnknown_08AF47F0 + 0x4e8
.4byte gUnknown_08AF47F0 + 0x94c
.4byte gUnknown_08AF47F0 + 0xdc4
.4byte gUnknown_08AF47F0 + 0x1238
.4byte gUnknown_08AF47F0 + 0x16a8
.4byte gUnknown_08AF47F0 + 0x1b18
.4byte gUnknown_08AF47F0 + 0x1f90
.4byte gUnknown_08AF47F0 + 0x2408
.4byte gUnknown_08AF47F0 + 0x2880
.4byte gUnknown_08AF47F0 + 0x2cf8
.4byte gUnknown_08AF47F0 + 0x3170
.4byte gUnknown_08AF47F0 + 0x35e4
.4byte gUnknown_08AF47F0 + 0x3a5c
.4byte gUnknown_08AF47F0 + 0x3ed4
.4byte gUnknown_08AF47F0 + 0x4348
.4byte gUnknown_08AF47F0 + 0x47c0
.4byte gUnknown_08AF47F0 + 0x4c38
.4byte gUnknown_08AF47F0 + 0x50b0
.4byte gUnknown_08AF47F0 + 0x5528
.4byte gUnknown_08AF47F0 + 0x59a0
.4byte gUnknown_08AF47F0 + 0x5e18
.4byte gUnknown_08AF47F0 + 0x6290
.4byte gUnknown_08AF47F0 + 0x6708
.4byte gUnknown_08AF47F0 + 0x6b80
.4byte gUnknown_08AF47F0 + 0x6ff8
.4byte gUnknown_08AF47F0 + 0x7470
.4byte gUnknown_08AF47F0 + 0x78e4
.4byte gUnknown_08AF47F0 + 0x7d58
.4byte gUnknown_08AF47F0 + 0x81c4
.4byte gUnknown_08AF47F0 + 0x8638
.4byte gUnknown_08AF47F0 + 0x8aac
.4byte gUnknown_08AF47F0 + 0x8f10
.4byte gUnknown_08AF47F0 + 0x9374
.4byte gUnknown_08AF47F0 + 0x97e4
.4byte gUnknown_08AF47F0 + 0x9c58
.4byte gUnknown_08AF47F0 + 0xa0cc
.4byte gUnknown_08AF47F0 + 0xa540
.4byte gUnknown_08AF47F0 + 0xa9b8
.4byte gUnknown_08AF47F0 + 0xae28
.4byte gUnknown_08AF47F0 + 0xb290
.4byte gUnknown_08AF47F0 + 0xb6f8
.4byte gUnknown_08AF47F0 + 0xbb68
.4byte gUnknown_08AF47F0 + 0xbfe0
.4byte gUnknown_08AF47F0 + 0xc458
.4byte gUnknown_08AF47F0 + 0xc8c8
.4byte gUnknown_08AF47F0 + 0xcd3c
.4byte gUnknown_08AF47F0 + 0xd1b4
.4byte gUnknown_08AF47F0 + 0xd628
.4byte gUnknown_08AF47F0 + 0xda90
.4byte gUnknown_08AF47F0 + 0xdf04
.4byte gUnknown_08AF47F0 + 0xe36c
.4byte gUnknown_08AF47F0 + 0xe7dc
.4byte gUnknown_08AF47F0 + 0xec48
.4byte gUnknown_08AF47F0 + 0xf0bc
.4byte gUnknown_08AF47F0 + 0xf52c
.4byte gUnknown_08AF47F0 + 0xf9a4
.4byte gUnknown_08AF47F0 + 0xfe1c
.4byte gUnknown_08AF47F0 + 0x10294
.4byte gUnknown_08AF47F0 + 0x10700
.4byte gUnknown_08AF47F0 + 0x10b74
.4byte gUnknown_08AF47F0 + 0x10fe0
.4byte gUnknown_08AF47F0 + 0x11448
.4byte gUnknown_08AF47F0 + 0x118bc
.4byte gUnknown_08AF47F0 + 0x11d34
.4byte gUnknown_08AF47F0 + 0x121ac
.4byte gUnknown_08AF47F0 + 0x12620
.4byte gUnknown_08AF47F0 + 0x12a90
.4byte gUnknown_08AF47F0 + 0x12f00
.4byte gUnknown_08AF47F0 + 0x13378
.4byte gUnknown_08AF47F0 + 0x137e0
.4byte gUnknown_08AF47F0 + 0x13c50
.4byte gUnknown_08AF47F0 + 0x140c8
.4byte gUnknown_08AF47F0 + 0x14540
.4byte gUnknown_08AF47F0 + 0x149ac
.4byte gUnknown_08AF47F0 + 0x14e1c
.4byte gUnknown_08AF47F0 + 0x15294
.4byte gUnknown_08AF47F0 + 0x15708
.4byte gUnknown_08AF47F0 + 0x15b80
.4byte gUnknown_08AF47F0 + 0x15ff4
.4byte gUnknown_08AF47F0 + 0x1646c
.4byte gUnknown_08AF47F0 + 0x168e4
.4byte gUnknown_08AF47F0 + 0x16d54
.4byte gUnknown_08AF47F0 + 0x171c8
.4byte gUnknown_08AF47F0 + 0x17640
.4byte gUnknown_08AF47F0 + 0x17ab4
.4byte gUnknown_08AF47F0 + 0x17f28
.4byte gUnknown_08AF47F0 + 0x18398
.4byte gUnknown_08AF47F0 + 0x1880c
.4byte gUnknown_08AF47F0 + 0x18c44
.4byte gUnknown_08AF47F0 + 0x190ac
.4byte gUnknown_08AF47F0 + 0x194f4
.4byte gUnknown_08AF47F0 + 0x19920
.4byte gUnknown_08AF47F0 + 0x19d94
.4byte gUnknown_08AF47F0 + 0x1a1f0
.4byte gUnknown_08AF47F0 + 0x1a664
.4byte gUnknown_08AF47F0 + 0x1aab0
.4byte gUnknown_08AF47F0 + 0x1af28
.4byte gUnknown_08AF47F0 + 0x1b32c
.4byte gUnknown_08AF47F0 + 0x1b77c

	.global gUnknown_08AA6EA4
gUnknown_08AA6EA4:  @ 0x08AA6EA4
@ replacing .incbin "baserom.gba", 0x00aa6ea4, 0x190
.4byte gUnknown_08AF47F0 + 0x4ac
.4byte gUnknown_08AF47F0 + 0x910
.4byte gUnknown_08AF47F0 + 0xd88
.4byte gUnknown_08AF47F0 + 0x11fc
.4byte gUnknown_08AF47F0 + 0x166c
.4byte gUnknown_08AF47F0 + 0x1adc
.4byte gUnknown_08AF47F0 + 0x1f54
.4byte gUnknown_08AF47F0 + 0x23cc
.4byte gUnknown_08AF47F0 + 0x2844
.4byte gUnknown_08AF47F0 + 0x2cbc
.4byte gUnknown_08AF47F0 + 0x3134
.4byte gUnknown_08AF47F0 + 0x35a8
.4byte gUnknown_08AF47F0 + 0x3a20
.4byte gUnknown_08AF47F0 + 0x3e98
.4byte gUnknown_08AF47F0 + 0x430c
.4byte gUnknown_08AF47F0 + 0x4784
.4byte gUnknown_08AF47F0 + 0x4bfc
.4byte gUnknown_08AF47F0 + 0x5074
.4byte gUnknown_08AF47F0 + 0x54ec
.4byte gUnknown_08AF47F0 + 0x5964
.4byte gUnknown_08AF47F0 + 0x5ddc
.4byte gUnknown_08AF47F0 + 0x6254
.4byte gUnknown_08AF47F0 + 0x66cc
.4byte gUnknown_08AF47F0 + 0x6b44
.4byte gUnknown_08AF47F0 + 0x6fbc
.4byte gUnknown_08AF47F0 + 0x7434
.4byte gUnknown_08AF47F0 + 0x78a8
.4byte gUnknown_08AF47F0 + 0x7d1c
.4byte gUnknown_08AF47F0 + 0x8188
.4byte gUnknown_08AF47F0 + 0x85fc
.4byte gUnknown_08AF47F0 + 0x8a70
.4byte gUnknown_08AF47F0 + 0x8ed4
.4byte gUnknown_08AF47F0 + 0x9338
.4byte gUnknown_08AF47F0 + 0x97a8
.4byte gUnknown_08AF47F0 + 0x9c1c
.4byte gUnknown_08AF47F0 + 0xa090
.4byte gUnknown_08AF47F0 + 0xa504
.4byte gUnknown_08AF47F0 + 0xa97c
.4byte gUnknown_08AF47F0 + 0xadec
.4byte gUnknown_08AF47F0 + 0xb254
.4byte gUnknown_08AF47F0 + 0xb6bc
.4byte gUnknown_08AF47F0 + 0xbb2c
.4byte gUnknown_08AF47F0 + 0xbfa4
.4byte gUnknown_08AF47F0 + 0xc41c
.4byte gUnknown_08AF47F0 + 0xc88c
.4byte gUnknown_08AF47F0 + 0xcd00
.4byte gUnknown_08AF47F0 + 0xd178
.4byte gUnknown_08AF47F0 + 0xd5ec
.4byte gUnknown_08AF47F0 + 0xda54
.4byte gUnknown_08AF47F0 + 0xdec8
.4byte gUnknown_08AF47F0 + 0xe330
.4byte gUnknown_08AF47F0 + 0xe7a0
.4byte gUnknown_08AF47F0 + 0xec0c
.4byte gUnknown_08AF47F0 + 0xf080
.4byte gUnknown_08AF47F0 + 0xf4f0
.4byte gUnknown_08AF47F0 + 0xf968
.4byte gUnknown_08AF47F0 + 0xfde0
.4byte gUnknown_08AF47F0 + 0x10258
.4byte gUnknown_08AF47F0 + 0x106c4
.4byte gUnknown_08AF47F0 + 0x10b38
.4byte gUnknown_08AF47F0 + 0x10fa4
.4byte gUnknown_08AF47F0 + 0x1140c
.4byte gUnknown_08AF47F0 + 0x11880
.4byte gUnknown_08AF47F0 + 0x11cf8
.4byte gUnknown_08AF47F0 + 0x12170
.4byte gUnknown_08AF47F0 + 0x125e4
.4byte gUnknown_08AF47F0 + 0x12a54
.4byte gUnknown_08AF47F0 + 0x12ec4
.4byte gUnknown_08AF47F0 + 0x1333c
.4byte gUnknown_08AF47F0 + 0x137a4
.4byte gUnknown_08AF47F0 + 0x13c14
.4byte gUnknown_08AF47F0 + 0x1408c
.4byte gUnknown_08AF47F0 + 0x14504
.4byte gUnknown_08AF47F0 + 0x14970
.4byte gUnknown_08AF47F0 + 0x14de0
.4byte gUnknown_08AF47F0 + 0x15258
.4byte gUnknown_08AF47F0 + 0x156cc
.4byte gUnknown_08AF47F0 + 0x15b44
.4byte gUnknown_08AF47F0 + 0x15fb8
.4byte gUnknown_08AF47F0 + 0x16430
.4byte gUnknown_08AF47F0 + 0x168a8
.4byte gUnknown_08AF47F0 + 0x16d18
.4byte gUnknown_08AF47F0 + 0x1718c
.4byte gUnknown_08AF47F0 + 0x17604
.4byte gUnknown_08AF47F0 + 0x17a78
.4byte gUnknown_08AF47F0 + 0x17eec
.4byte gUnknown_08AF47F0 + 0x1835c
.4byte gUnknown_08AF47F0 + 0x187d0
.4byte gUnknown_08AF47F0 + 0x18c08
.4byte gUnknown_08AF47F0 + 0x19070
.4byte gUnknown_08AF47F0 + 0x194b8
.4byte gUnknown_08AF47F0 + 0x198e4
.4byte gUnknown_08AF47F0 + 0x19d58
.4byte gUnknown_08AF47F0 + 0x1a1b4
.4byte gUnknown_08AF47F0 + 0x1a628
.4byte gUnknown_08AF47F0 + 0x1aa74
.4byte gUnknown_08AF47F0 + 0x1aeec
.4byte gUnknown_08AF47F0 + 0x1b2f0
.4byte gUnknown_08AF47F0 + 0x1b740
.4byte gUnknown_08AF47F0 + 0x1bbac

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
