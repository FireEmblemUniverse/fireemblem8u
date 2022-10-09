        .section .data

	.global gUnknown_0878D500
gUnknown_0878D500:  @ 0x0878D500
	.incbin "baserom.gba", 0x78D500, 0x18

	.global gUnknown_0878D518
gUnknown_0878D518:  @ 0x0878D518
	.incbin "baserom.gba", 0x78D518, 0x8

	.global gUnknown_0878D520
gUnknown_0878D520:  @ 0x0878D520
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e829c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BattlePopup_Wait16Frames
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWRankUp
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWRankUp
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWRankUp2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWRankUp2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWpnBroke
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWpnBroke
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_DrawWpnBroke2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_WaitWpnBroke2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_MarkEnd
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0878D588
gUnknown_0878D588:  @ 0x0878D588
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BattlePopup_Wait16Frames
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076250
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076290
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80762D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076290
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ekrPopup_MarkEnd
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0878D5F0
gUnknown_0878D5F0:  @ 0x0878D5F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82b4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076380
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80763E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076400
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076464
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0878D620
gUnknown_0878D620:  @ 0x0878D620
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82c8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076484
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80764B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076514
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0878D648
gUnknown_0878D648:  @ 0x0878D648
	.incbin "baserom.gba", 0x78D648, 0x3940

	.global gUnknown_08790F88
gUnknown_08790F88:  @ 0x08790F88
	.incbin "baserom.gba", 0x790F88, 0x1D4

	.global gUnknown_0879115C
gUnknown_0879115C:  @ 0x0879115C
	.incbin "baserom.gba", 0x79115C, 0xC00

	.global gUnknown_08791D5C
gUnknown_08791D5C:  @ 0x08791D5C
	.incbin "baserom.gba", 0x791D5C, 0x20

	.global gUnknown_08791D7C
gUnknown_08791D7C:  @ 0x08791D7C
	.incbin "baserom.gba", 0x791D7C, 0x20

	.global gUnknown_08791D9C
gUnknown_08791D9C:  @ 0x08791D9C
	.incbin "baserom.gba", 0x791D9C, 0x3F8

	.global gUnknown_08792194
gUnknown_08792194:  @ 0x08792194
	.incbin "baserom.gba", 0x792194, 0x794

	.global gUnknown_08792928
gUnknown_08792928:  @ 0x08792928
@ Replacing .incbin "baserom.gba", 0x792928, 0x30
    .4byte 0x10000000 + gUnknown_08792194 + 0x20
    .4byte 0x10000000 + gUnknown_08792194 + 0x38
    .4byte 0x10000000 + gUnknown_08792194 + 0x5C
    .4byte 0x10000000 + gUnknown_08792194 + 0x8C
    .4byte 0x10000000 + gUnknown_08792194 + 0xBC
    .4byte 0x10000000 + gUnknown_08792194 + 0xEC
    .4byte 0x10000000 + gUnknown_08792194 + 0x110
    .4byte 0x10000000 + gUnknown_08792194 + 0x134
    .4byte 0x10000000 + gUnknown_08792194 + 0x158
    .4byte 0x10000000 + gUnknown_08792194 + 0x170
    .4byte gUnknown_08792194 + 0x789
    .4byte 0x80000000

	.global gUnknown_08792958
gUnknown_08792958:  @ 0x08792958
@ Replacing .incbin "baserom.gba", 0x792958, 0x30
    .4byte 0x10000000 + gUnknown_08792194 + 0x188
    .4byte 0x10000000 + gUnknown_08792194 + 0x1a0
    .4byte 0x10000000 + gUnknown_08792194 + 0x1c4
    .4byte 0x10000000 + gUnknown_08792194 + 0x1f4
    .4byte 0x10000000 + gUnknown_08792194 + 0x230
    .4byte 0x10000000 + gUnknown_08792194 + 0x26c
    .4byte 0x10000000 + gUnknown_08792194 + 0x2a8
    .4byte 0x10000000 + gUnknown_08792194 + 0x2e4
    .4byte 0x10000000 + gUnknown_08792194 + 0x314
    .4byte 0x10000000 + gUnknown_08792194 + 0x338
    .4byte gUnknown_08792194 + 0x789
    .4byte 0x80000000

	.global gUnknown_08792988
gUnknown_08792988:  @ 0x08792988
@ Replacing .incbin "baserom.gba", 0x792988, 0x12564
    .4byte 0x10000000 + gUnknown_08792194 + 0x350
    .4byte 0x10000000 + gUnknown_08792194 + 0x3bc
    .4byte 0x10000000 + gUnknown_08792194 + 0x428
    .4byte 0x10000000 + gUnknown_08792194 + 0x494
    .4byte 0x10000000 + gUnknown_08792194 + 0x500
    .4byte 0x10000000 + gUnknown_08792194 + 0x56c
    .4byte 0x10000000 + gUnknown_08792194 + 0x5d8
    .4byte 0x10000000 + gUnknown_08792194 + 0x644
    .4byte 0x10000000 + gUnknown_08792194 + 0x6b0
    .4byte 0x10000000 + gUnknown_08792194 + 0x71c
    .4byte gUnknown_08792194 + 0x789
    .4byte 0x80000000

	.global gUnknown_087929B8
gUnknown_087929B8:  @ 0x087929B8
	.incbin "baserom.gba", 0x7929B8, 0x12534

	.global gUnknown_087A4EEC
gUnknown_087A4EEC:  @ 0x087A4EEC
	.incbin "baserom.gba", 0x7A4EEC, 0x22C

	.global gUnknown_087A5118
gUnknown_087A5118:  @ 0x087A5118
	.incbin "baserom.gba", 0x7A5118, 0x128

	.global gUnknown_087A5240
gUnknown_087A5240:  @ 0x087A5240
@ Replacing .incbin "baserom.gba", 0x7A5240, 0x150
    .4byte 0x10000000 + gUnknown_087A5118 + 0x20
    .4byte 0x10000000 + gUnknown_087A5118 + 0x38
    .4byte 0x10000000 + gUnknown_087A5118 + 0x68
    .4byte 0x10000000 + gUnknown_087A5118 + 0x8c
    .4byte 0x10000000 + gUnknown_087A5118 + 0xbc
    .4byte 0x10000000 + gUnknown_087A5118 + 0xe0
    .4byte 0x10000000 + gUnknown_087A5118 + 0x104
    .4byte gUnknown_087A5118 + 0x11e
    .4byte 0x81000000

    .4byte 0x10004000
    .4byte 0xfff00000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xfff00002
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xfff80023
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xffe80003
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffe80004
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xfff80006
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xfff80026
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffe80007
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffe00009
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xfff0000a
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0xffe0000b
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xfff00029
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0xffe0000d
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xffe0000f
    .4byte 0x00000010
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

    .4byte 0x10000000 + gUnknown_087A5240 + 0x24
    .4byte 0x10000000 + gUnknown_087A5240 + 0x3c
    .4byte 0x10000000 + gUnknown_087A5240 + 0x6c
    .4byte 0x10000000 + gUnknown_087A5240 + 0x90
    .4byte 0x10000000 + gUnknown_087A5240 + 0xc0
    .4byte 0x10000000 + gUnknown_087A5240 + 0xe4
    .4byte 0x10000000 + gUnknown_087A5240 + 0x108
    .4byte gUnknown_087A5240 + 0x122
    .4byte 0x81000000

	.global gUnknown_087A5390
gUnknown_087A5390:  @ 0x087A5390
	.incbin "baserom.gba", 0x7A5390, 0x3BC

	.global gUnknown_087A574C
gUnknown_087A574C:  @ 0x087A574C
	.incbin "baserom.gba", 0x7A574C, 0x1f4

	.global gUnknown_087A5940
gUnknown_087A5940:  @ 0x087A5940
    .4byte gUnknown_087A574C + 0x22
    .4byte gUnknown_087A574C + 0x6a
    .4byte gUnknown_087A574C + 0x22
    .4byte gUnknown_087A574C + 0x6a
    .4byte gUnknown_087A574C + 0x112
    .4byte 0x81000000
    .4byte gUnknown_087A574C + 0xe2
    .4byte gUnknown_087A574C + 0x11e
    .4byte gUnknown_087A574C + 0x142
    .4byte gUnknown_087A574C + 0x166
    .4byte gUnknown_087A574C + 0x112
    .4byte 0x81000000
    .4byte gUnknown_087A574C + 0xfa
    .4byte gUnknown_087A574C + 0x18a
    .4byte gUnknown_087A574C + 0x1ae
    .4byte gUnknown_087A574C + 0x1d2
    .4byte gUnknown_087A574C + 0x112
    .4byte 0x81000000

	.global gUnknown_087A5988
gUnknown_087A5988:  @ 0x087A5988
    .incbin "baserom.gba", 0x7A5988, 0x1d4

	.global gUnknown_087A5B5C
gUnknown_087A5B5C:  @ 0x087A5B5C
@ Replacing .incbin "baserom.gba", 0x7A5B5C, 0x48
    .4byte gUnknown_087A574C + 0x23e
    .4byte gUnknown_087A574C + 0x286
    .4byte gUnknown_087A574C + 0x23e
    .4byte gUnknown_087A574C + 0x286
    .4byte gUnknown_087A574C + 0x32e
    .4byte 0x81000000
    .4byte gUnknown_087A574C + 0x2fe
    .4byte gUnknown_087A574C + 0x33a
    .4byte gUnknown_087A574C + 0x35e
    .4byte gUnknown_087A574C + 0x382
    .4byte gUnknown_087A574C + 0x32e
    .4byte 0x81000000
    .4byte gUnknown_087A574C + 0x316
    .4byte gUnknown_087A574C + 0x3a6
    .4byte gUnknown_087A574C + 0x3ca
    .4byte gUnknown_087A574C + 0x3ee
    .4byte gUnknown_087A574C + 0x32e
    .4byte 0x81000000

	.global gUnknown_087A5BA4
gUnknown_087A5BA4:  @ 0x087A5BA4
	.incbin "baserom.gba", 0x7A5BA4, 0x2F8

	.global gUnknown_087A5E9C
gUnknown_087A5E9C:  @ 0x087A5E9C
	.incbin "baserom.gba", 0x7A5E9C, 0x350

	.global gUnknown_087A61EC
gUnknown_087A61EC:  @ 0x087A61EC
	.incbin "baserom.gba", 0x7A61EC, 0x488

	.global gUnknown_087A6674
gUnknown_087A6674:  @ 0x087A6674
    .4byte gUnknown_087A61EC + 0x22
    .4byte gUnknown_087A61EC + 0x1de
    .4byte gUnknown_087A61EC + 0x47e
    .4byte 0x81000000
    .4byte 0x50004000
    .4byte 0xffe00002
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffd00006
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffc80008
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xfff00022
    .4byte 0x00000028
    .4byte 0x50000000
    .4byte 0xffe80000
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0xffe80000
    .4byte 0x00000018
    .4byte 0x50000000
    .4byte 0xffd80000
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0xffd80000
    .4byte 0x00000018
    .4byte 0x10008000
    .4byte 0xffd00001
    .4byte 0x00000008
    .4byte 0x10008000
    .4byte 0xffd00001
    .4byte 0x00000018
    .4byte 0x10004000
    .4byte 0xffd00026
    .4byte 0x00000028
    .4byte 0x10004000
    .4byte 0xffe00020
    .4byte 0x00000028
    .4byte 0x10004000
    .4byte 0xffe00044
    .4byte 0x00000030
    .4byte 0x10000000
    .4byte 0xffc80062
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffc00063
    .4byte 0x00000010
    .4byte 0x10004000
    .4byte 0xffc00065
    .4byte 0x00000018
    .4byte 0x50008000
    .4byte 0xfff80009
    .4byte 0x00000008
    .4byte 0x10000000
    .4byte 0xfff00043
    .4byte 0x00000030
    .4byte 0x10000000
    .4byte 0xffc80042
    .4byte 0x00000020
    .4byte 0x50000000
    .4byte 0xffda0040
    .4byte 0x0000000c
    .4byte 0x50000000
    .4byte 0xffda0040
    .4byte 0x0000001c
    .4byte 0x50000000
    .4byte 0xffca0040
    .4byte 0x0000000c
    .4byte 0x50000000
    .4byte 0xffca0040
    .4byte 0x0000001c
    .4byte 0x10004000
    .4byte 0xffd20060
    .4byte 0x0000002c
    .4byte 0x10008000
    .4byte 0xffc20041
    .4byte 0x0000000c
    .4byte 0x10008000
    .4byte 0xffc20041
    .4byte 0x0000001c
    .4byte 0x50004000
    .4byte 0xffd20010
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xffc20014
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xffba0016
    .4byte 0x00000004
    .4byte 0x50008000
    .4byte 0xffea0017
    .4byte 0x0000000c
    .4byte 0x10004000
    .4byte 0xffb20071
    .4byte 0x00000014
    .4byte 0x10004000
    .4byte 0xffb20073
    .4byte 0x0000001c
    .4byte 0x10000000
    .4byte 0xffba0050
    .4byte 0x00000024
    .4byte 0x50004000
    .4byte 0xffca0051
    .4byte 0x00000034
    .4byte 0x10004000
    .4byte 0xffe20030
    .4byte 0x0000002c
    .4byte 0x10004000
    .4byte 0xffc20034
    .4byte 0x0000002c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff0000a
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xfff0004a
    .4byte 0x00000010
    .4byte 0x10004000
    .4byte 0xffe8006a
    .4byte 0x00000018
    .4byte 0x50000000
    .4byte 0xffe0000c
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0xffe0004c
    .4byte 0x00000020
    .4byte 0x10000000
    .4byte 0xffe0002b
    .4byte 0x00000018
    .4byte 0x50000000
    .4byte 0xffc80047
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xfff00028
    .4byte 0x00000020
    .4byte 0x10000000
    .4byte 0xffe0006e
    .4byte 0x00000030
    .4byte 0x10004000
    .4byte 0xffd0004e
    .4byte 0x00000020
    .4byte 0x10000000
    .4byte 0xffd0006f
    .4byte 0x00000028
    .4byte 0x10008000
    .4byte 0xffd8000e
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffba0055
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xffe20018
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xffe20058
    .4byte 0x00000014
    .4byte 0x10004000
    .4byte 0xffda0078
    .4byte 0x0000001c
    .4byte 0x50000000
    .4byte 0xffd2001a
    .4byte 0x0000000c
    .4byte 0x10008000
    .4byte 0xffca001c
    .4byte 0x00000014
    .4byte 0x10004000
    .4byte 0xffc2005c
    .4byte 0x00000024
    .4byte 0x10000000
    .4byte 0xffc2007d
    .4byte 0x0000002c
    .4byte 0x10000000
    .4byte 0xffd20039
    .4byte 0x0000001c
    .4byte 0x50000000
    .4byte 0xffd2005a
    .4byte 0x00000024
    .4byte 0x10000000
    .4byte 0xffe20036
    .4byte 0x00000024
    .4byte 0x10000000
    .4byte 0xffd2007c
    .4byte 0x00000034
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff00000
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xffe80002
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0xffd80040
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffc80044
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffd00005
    .4byte 0x00000020
    .4byte 0x10008000
    .4byte 0xffc80007
    .4byte 0x00000020
    .4byte 0x50000000
    .4byte 0xffe00003
    .4byte 0x00000020
    .4byte 0x10000000
    .4byte 0xffc8006c
    .4byte 0x00000030
    .4byte 0x50000000
    .4byte 0xffe20010
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xffda0012
    .4byte 0x00000004
    .4byte 0x90004000
    .4byte 0xffca0050
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xffba0054
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xffc20015
    .4byte 0x00000024
    .4byte 0x10008000
    .4byte 0xffba0017
    .4byte 0x00000024
    .4byte 0x50000000
    .4byte 0xffd20013
    .4byte 0x00000024
    .4byte 0x10000000
    .4byte 0xffba007c
    .4byte 0x00000034
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff00008
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0xffd80046
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffc0004a
    .4byte 0x00000028
    .4byte 0x10004000
    .4byte 0xffd0000a
    .4byte 0x00000020
    .4byte 0x10008000
    .4byte 0xffc8000c
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffe20018
    .4byte 0x00000004
    .4byte 0x90004000
    .4byte 0xffca0056
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xffb2005a
    .4byte 0x0000002c
    .4byte 0x10004000
    .4byte 0xffc2001a
    .4byte 0x00000024
    .4byte 0x10008000
    .4byte 0xffba001c
    .4byte 0x00000014
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff0000d
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffe2001d
    .4byte 0x00000004
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_087A6674 + 0x12
    .4byte gUnknown_087A6674 + 0x1ce
    .4byte gUnknown_087A6674 + 0x46e
    .4byte 0x80000000
    .4byte 0x40004000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00200006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00300008
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000022
    .4byte 0x00000028
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x00000008
    .4byte 0x40000000
    .4byte 0x00080000
    .4byte 0x00000018
    .4byte 0x40000000
    .4byte 0x00180000
    .4byte 0x00000008
    .4byte 0x40000000
    .4byte 0x00180000
    .4byte 0x00000018
    .4byte 0x00008000
    .4byte 0x00280001
    .4byte 0x00000008
    .4byte 0x00008000
    .4byte 0x00280001
    .4byte 0x00000018
    .4byte 0x00004000
    .4byte 0x00200026
    .4byte 0x00000028
    .4byte 0x00004000
    .4byte 0x00100020
    .4byte 0x00000028
    .4byte 0x00004000
    .4byte 0x00100044
    .4byte 0x00000030
    .4byte 0x00000000
    .4byte 0x00300062
    .4byte 0x00000008
    .4byte 0x00004000
    .4byte 0x00300063
    .4byte 0x00000010
    .4byte 0x00004000
    .4byte 0x00300065
    .4byte 0x00000018
    .4byte 0x40008000
    .4byte 0x00000009
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0x00080043
    .4byte 0x00000030
    .4byte 0x00000000
    .4byte 0x00300042
    .4byte 0x00000020
    .4byte 0x40000000
    .4byte 0x00160040
    .4byte 0x0000000c
    .4byte 0x40000000
    .4byte 0x00160040
    .4byte 0x0000001c
    .4byte 0x40000000
    .4byte 0x00260040
    .4byte 0x0000000c
    .4byte 0x40000000
    .4byte 0x00260040
    .4byte 0x0000001c
    .4byte 0x00004000
    .4byte 0x001e0060
    .4byte 0x0000002c
    .4byte 0x00008000
    .4byte 0x00360041
    .4byte 0x0000000c
    .4byte 0x00008000
    .4byte 0x00360041
    .4byte 0x0000001c
    .4byte 0x40004000
    .4byte 0x000e0010
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0x002e0014
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x003e0016
    .4byte 0x00000004
    .4byte 0x40008000
    .4byte 0x000e0017
    .4byte 0x0000000c
    .4byte 0x00004000
    .4byte 0x003e0071
    .4byte 0x00000014
    .4byte 0x00004000
    .4byte 0x003e0073
    .4byte 0x0000001c
    .4byte 0x00000000
    .4byte 0x003e0050
    .4byte 0x00000024
    .4byte 0x40004000
    .4byte 0x00160051
    .4byte 0x00000034
    .4byte 0x00004000
    .4byte 0x000e0030
    .4byte 0x0000002c
    .4byte 0x00004000
    .4byte 0x002e0034
    .4byte 0x0000002c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x0000004a
    .4byte 0x00000010
    .4byte 0x00004000
    .4byte 0x0008006a
    .4byte 0x00000018
    .4byte 0x40000000
    .4byte 0x0010000c
    .4byte 0x00000008
    .4byte 0x40000000
    .4byte 0x0010004c
    .4byte 0x00000020
    .4byte 0x00000000
    .4byte 0x0018002b
    .4byte 0x00000018
    .4byte 0x40000000
    .4byte 0x00280047
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x00080028
    .4byte 0x00000020
    .4byte 0x00000000
    .4byte 0x0018006e
    .4byte 0x00000030
    .4byte 0x00004000
    .4byte 0x0020004e
    .4byte 0x00000020
    .4byte 0x00000000
    .4byte 0x0028006f
    .4byte 0x00000028
    .4byte 0x00008000
    .4byte 0x0020000e
    .4byte 0x00000010
    .4byte 0x40000000
    .4byte 0x00360055
    .4byte 0x00000014
    .4byte 0x40000000
    .4byte 0x000e0018
    .4byte 0x00000004
    .4byte 0x00004000
    .4byte 0x000e0058
    .4byte 0x00000014
    .4byte 0x00004000
    .4byte 0x00160078
    .4byte 0x0000001c
    .4byte 0x40000000
    .4byte 0x001e001a
    .4byte 0x0000000c
    .4byte 0x00008000
    .4byte 0x002e001c
    .4byte 0x00000014
    .4byte 0x00004000
    .4byte 0x002e005c
    .4byte 0x00000024
    .4byte 0x00000000
    .4byte 0x0036007d
    .4byte 0x0000002c
    .4byte 0x00000000
    .4byte 0x00260039
    .4byte 0x0000001c
    .4byte 0x40000000
    .4byte 0x001e005a
    .4byte 0x00000024
    .4byte 0x00000000
    .4byte 0x00160036
    .4byte 0x00000024
    .4byte 0x00000000
    .4byte 0x0026007c
    .4byte 0x00000034
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00100002
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0x00080040
    .4byte 0x00000010
    .4byte 0x40000000
    .4byte 0x00280044
    .4byte 0x00000010
    .4byte 0x40000000
    .4byte 0x00200005
    .4byte 0x00000020
    .4byte 0x00008000
    .4byte 0x00300007
    .4byte 0x00000020
    .4byte 0x40000000
    .4byte 0x00100003
    .4byte 0x00000020
    .4byte 0x00000000
    .4byte 0x0030006c
    .4byte 0x00000030
    .4byte 0x40000000
    .4byte 0x000e0010
    .4byte 0x00000004
    .4byte 0x00008000
    .4byte 0x001e0012
    .4byte 0x00000004
    .4byte 0x80004000
    .4byte 0x00160050
    .4byte 0x00000014
    .4byte 0x40000000
    .4byte 0x00360054
    .4byte 0x00000014
    .4byte 0x40000000
    .4byte 0x002e0015
    .4byte 0x00000024
    .4byte 0x00008000
    .4byte 0x003e0017
    .4byte 0x00000024
    .4byte 0x40000000
    .4byte 0x001e0013
    .4byte 0x00000024
    .4byte 0x00000000
    .4byte 0x003e007c
    .4byte 0x00000034
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000008
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0x00080046
    .4byte 0x00000010
    .4byte 0x40000000
    .4byte 0x0030004a
    .4byte 0x00000028
    .4byte 0x00004000
    .4byte 0x0020000a
    .4byte 0x00000020
    .4byte 0x00008000
    .4byte 0x0030000c
    .4byte 0x00000010
    .4byte 0x40000000
    .4byte 0x000e0018
    .4byte 0x00000004
    .4byte 0x80004000
    .4byte 0x00160056
    .4byte 0x00000014
    .4byte 0x40000000
    .4byte 0x003e005a
    .4byte 0x0000002c
    .4byte 0x00004000
    .4byte 0x002e001a
    .4byte 0x00000024
    .4byte 0x00008000
    .4byte 0x003e001c
    .4byte 0x00000014
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x0000000d
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x0010001d
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_087A6674 + 0x771
    .4byte gUnknown_087A6674 + 0x83d
    .4byte gUnknown_087A6674 + 0x8c1
    .4byte gUnknown_087A6674 + 0x8e6
    .4byte 0x81000000
    .4byte 0x50004000
    .4byte 0xffe00002
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xffd00006
    .4byte 0x00000000
    .4byte 0x10000000
    .4byte 0xffc80008
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xfff00022
    .4byte 0x00000028
    .4byte 0x50000000
    .4byte 0xffe80000
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0xffe80000
    .4byte 0x00000018
    .4byte 0x50000000
    .4byte 0xffd80000
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0xffd80000
    .4byte 0x00000018
    .4byte 0x10008000
    .4byte 0xffd00001
    .4byte 0x00000008
    .4byte 0x10008000
    .4byte 0xffd00001
    .4byte 0x00000018
    .4byte 0x10004000
    .4byte 0xffd00026
    .4byte 0x00000028
    .4byte 0x10004000
    .4byte 0xffe00020
    .4byte 0x00000028
    .4byte 0x10004000
    .4byte 0xffe00044
    .4byte 0x00000030
    .4byte 0x10000000
    .4byte 0xffc80062
    .4byte 0x00000008
    .4byte 0x10004000
    .4byte 0xffc00063
    .4byte 0x00000010
    .4byte 0x10004000
    .4byte 0xffc00065
    .4byte 0x00000018
    .4byte 0x50008000
    .4byte 0xfff80009
    .4byte 0x00000008
    .4byte 0x10000000
    .4byte 0xfff00043
    .4byte 0x00000030
    .4byte 0x10000000
    .4byte 0xffc80042
    .4byte 0x00000020
    .4byte 0x50000000
    .4byte 0xffda0040
    .4byte 0x0000000c
    .4byte 0x50000000
    .4byte 0xffda0040
    .4byte 0x0000001c
    .4byte 0x50000000
    .4byte 0xffca0040
    .4byte 0x0000000c
    .4byte 0x50000000
    .4byte 0xffca0040
    .4byte 0x0000001c
    .4byte 0x10004000
    .4byte 0xffd20060
    .4byte 0x0000002c
    .4byte 0x10008000
    .4byte 0xffc20041
    .4byte 0x0000000c
    .4byte 0x10008000
    .4byte 0xffc20041
    .4byte 0x0000001c
    .4byte 0x50004000
    .4byte 0xffd20010
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xffc20014
    .4byte 0x00000004
    .4byte 0x10000000
    .4byte 0xffba0016
    .4byte 0x00000004
    .4byte 0x50008000
    .4byte 0xffea0017
    .4byte 0x0000000c
    .4byte 0x10004000
    .4byte 0xffb20071
    .4byte 0x00000014
    .4byte 0x10004000
    .4byte 0xffb20073
    .4byte 0x0000001c
    .4byte 0x10000000
    .4byte 0xffba0050
    .4byte 0x00000024
    .4byte 0x50004000
    .4byte 0xffca0051
    .4byte 0x00000034
    .4byte 0x10004000
    .4byte 0xffe20030
    .4byte 0x0000002c
    .4byte 0x10004000
    .4byte 0xffc20034
    .4byte 0x0000002c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff0000a
    .4byte 0x00000000
    .4byte 0x10004000
    .4byte 0xfff0004a
    .4byte 0x00000010
    .4byte 0x10004000
    .4byte 0xffe8006a
    .4byte 0x00000018
    .4byte 0x50000000
    .4byte 0xffe0000c
    .4byte 0x00000008
    .4byte 0x50000000
    .4byte 0xffe0004c
    .4byte 0x00000020
    .4byte 0x10000000
    .4byte 0xffe0002b
    .4byte 0x00000018
    .4byte 0x50000000
    .4byte 0xffc80047
    .4byte 0x00000010
    .4byte 0x10000000
    .4byte 0xfff00028
    .4byte 0x00000020
    .4byte 0x10000000
    .4byte 0xffe0006e
    .4byte 0x00000030
    .4byte 0x10004000
    .4byte 0xffd0004e
    .4byte 0x00000020
    .4byte 0x10000000
    .4byte 0xffd0006f
    .4byte 0x00000028
    .4byte 0x10008000
    .4byte 0xffd8000e
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffba0055
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xffe20018
    .4byte 0x00000004
    .4byte 0x10004000
    .4byte 0xffe20058
    .4byte 0x00000014
    .4byte 0x10004000
    .4byte 0xffda0078
    .4byte 0x0000001c
    .4byte 0x50000000
    .4byte 0xffd2001a
    .4byte 0x0000000c
    .4byte 0x10008000
    .4byte 0xffca001c
    .4byte 0x00000014
    .4byte 0x10004000
    .4byte 0xffc2005c
    .4byte 0x00000024
    .4byte 0x10000000
    .4byte 0xffc2007d
    .4byte 0x0000002c
    .4byte 0x10000000
    .4byte 0xffd20039
    .4byte 0x0000001c
    .4byte 0x50000000
    .4byte 0xffd2005a
    .4byte 0x00000024
    .4byte 0x10000000
    .4byte 0xffe20036
    .4byte 0x00000024
    .4byte 0x10000000
    .4byte 0xffd2007c
    .4byte 0x00000034
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff00000
    .4byte 0x00000000
    .4byte 0x10008000
    .4byte 0xffe80002
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0xffd80040
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffc80044
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffd00005
    .4byte 0x00000020
    .4byte 0x10008000
    .4byte 0xffc80007
    .4byte 0x00000020
    .4byte 0x50000000
    .4byte 0xffe00003
    .4byte 0x00000020
    .4byte 0x10000000
    .4byte 0xffc8006c
    .4byte 0x00000030
    .4byte 0x50000000
    .4byte 0xffe20010
    .4byte 0x00000004
    .4byte 0x10008000
    .4byte 0xffda0012
    .4byte 0x00000004
    .4byte 0x90004000
    .4byte 0xffca0050
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xffba0054
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xffc20015
    .4byte 0x00000024
    .4byte 0x10008000
    .4byte 0xffba0017
    .4byte 0x00000024
    .4byte 0x50000000
    .4byte 0xffd20013
    .4byte 0x00000024
    .4byte 0x10000000
    .4byte 0xffba007c
    .4byte 0x00000034
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff00008
    .4byte 0x00000000
    .4byte 0x90004000
    .4byte 0xffd80046
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffc0004a
    .4byte 0x00000028
    .4byte 0x10004000
    .4byte 0xffd0000a
    .4byte 0x00000020
    .4byte 0x10008000
    .4byte 0xffc8000c
    .4byte 0x00000010
    .4byte 0x50000000
    .4byte 0xffe20018
    .4byte 0x00000004
    .4byte 0x90004000
    .4byte 0xffca0056
    .4byte 0x00000014
    .4byte 0x50000000
    .4byte 0xffb2005a
    .4byte 0x0000002c
    .4byte 0x10004000
    .4byte 0xffc2001a
    .4byte 0x00000024
    .4byte 0x10008000
    .4byte 0xffba001c
    .4byte 0x00000014
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xfff0000d
    .4byte 0x00000000
    .4byte 0x50000000
    .4byte 0xffe0001d
    .4byte 0x00000008
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_087A6674 + 0xbed
    .4byte gUnknown_087A6674 + 0xcb9
    .4byte gUnknown_087A6674 + 0xd3d
    .4byte gUnknown_087A6674 + 0xd62
    .4byte 0x81000000

	.global gUnknown_087A73F4
gUnknown_087A73F4:  @ 0x087A73F4
	.incbin "baserom.gba", 0x7A73F4, 0x4C860

	.global gUnknown_087F3C54
gUnknown_087F3C54:  @ 0x087F3C54
	.incbin "baserom.gba", 0x7F3C54, 0x530

	.global gUnknown_087F4184
gUnknown_087F4184:  @ 0x087F4184
    .4byte gUnknown_087F3C54 + 0x3ee
    .4byte 0x70000000 + gUnknown_087F3C54 + 0x4a3
    .4byte 0x8400010d
    .4byte 0x80000000

	.global gUnknown_087F4194
gUnknown_087F4194:  @ 0x087F4194
	.incbin "baserom.gba", 0x7F4194, 0x180

	.global gUnknown_087F4314
gUnknown_087F4314:  @ 0x087F4314
    .4byte gUnknown_087F4194 + 0x2
    .4byte 0x70000000 + gUnknown_087F4194 + 0xc3
    .4byte 0x840001d5
    .4byte 0x80000000

	.global gUnknown_087F4324
gUnknown_087F4324:  @ 0x087F4324
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80765CC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80765E4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80766E4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076640
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807669C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076A84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076798
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80767F4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076818
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80768A0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80768F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0x7F4324 + 0x68, 0x8

	.global gUnknown_087F4394
gUnknown_087F4394:  @ 0x087F4394
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076934
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807699C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F43B4
gUnknown_087F43B4:  @ 0x087F43B4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e82f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076A10
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076A78
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F43D4
gUnknown_087F43D4:  @ 0x087F43D4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e8304
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807707C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F43EC
gUnknown_087F43EC:  @ 0x087F43EC
    .4byte gUnknown_087F798C
    .4byte gUnknown_087F7DC8 + 0x408
    .4byte gUnknown_087F7DC8

	.global gUnknown_087F43F8
gUnknown_087F43F8:  @ 0x087F43F8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8076C34
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8076C10
        @ PROC_SLEEP
        .short 0xe, 0xc
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x5a
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076C54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076D60
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076DE8
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076E00
        @ PROC_SLEEP
        .short 0xe, 0x16
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4458
gUnknown_087F4458:  @ 0x087F4458
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8076C34
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8076C10
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076C54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076D60
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076DE8
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076E00
        @ PROC_SLEEP
        .short 0xe, 0x16
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F44B0
gUnknown_087F44B0:  @ 0x087F44B0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8076F28
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8076F08
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076F48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076FD0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8076FD4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F44E0
gUnknown_087F44E0:  @ 0x087F44E0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80771E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F44F8
gUnknown_087F44F8:  @ 0x087F44F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077310
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077394
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4518
gUnknown_087F4518:  @ 0x087F4518
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80773BC
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08801810
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80773E4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077460
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4548
gUnknown_087F4548:  @ 0x087F4548
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83bc
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8077678
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807759C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80775E8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807766C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4578
gUnknown_087F4578:  @ 0x087F4578
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83d0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80777E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807789C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077AA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F45A0
gUnknown_087F45A0:  @ 0x087F45A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83e0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077AEC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077B5C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077BB4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077C24
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F45D0
gUnknown_087F45D0:  @ 0x087F45D0
	.incbin "baserom.gba", 0x7F45D0, 0x1C8

	.global gUnknown_087F4798
gUnknown_087F4798:  @ 0x087F4798
	.incbin "baserom.gba", 0x7F4798, 0x31F4

	.global gUnknown_087F798C
gUnknown_087F798C:  @ 0x087F798C
	.incbin "baserom.gba", 0x7F798C, 0x43C

	.global gUnknown_087F7DC8
gUnknown_087F7DC8:  @ 0x087F7DC8
	.incbin "baserom.gba", 0x7F7DC8, 0x814

	.global gUnknown_087F85DC
gUnknown_087F85DC:  @ 0x087F85DC
	.incbin "baserom.gba", 0x7F85DC, 0x6EAC

	.global gUnknown_087FF488
gUnknown_087FF488:  @ 0x087FF488
	.incbin "baserom.gba", 0x7FF488, 0x11C4

	.global gUnknown_0880064C
gUnknown_0880064C:  @ 0x0880064C
	.incbin "baserom.gba", 0x80064C, 0x1194

	.global gUnknown_088017E0
gUnknown_088017E0:  @ 0x088017E0
	.incbin "baserom.gba", 0x8017E0, 0x20

	.global gUnknown_08801800
gUnknown_08801800:  @ 0x08801800
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077D30
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077D38

	.global gUnknown_08801810
gUnknown_08801810:  @ 0x08801810
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8077E9C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077DC8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077E64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077E6C
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_08801840
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08801840
gUnknown_08801840:  @ 0x08801840
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077F04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077F10
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08801858
gUnknown_08801858:  @ 0x08801858
	.incbin "baserom.gba", 0x801858, 0x8

	.global gUnknown_08801860
gUnknown_08801860:  @ 0x08801860
	.incbin "baserom.gba", 0x801860, 0x8

	.global gUnknown_08801868
gUnknown_08801868:  @ 0x08801868
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8078078
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08801880
gUnknown_08801880:  @ 0x08801880
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e8400
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8078174
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807819C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_088018A0
gUnknown_088018A0:  @ 0x088018A0
@ Replacing .incbin "baserom.gba", 0x8018A0, 0x20C
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x20
    .4byte gUnknown_087F85DC + 0x4364
    .4byte gUnknown_087F85DC + 0x5938
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x2c4
    .4byte gUnknown_087F85DC + 0x4490
    .4byte gUnknown_087F85DC + 0x5a60
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x6ac
    .4byte gUnknown_087F85DC + 0x45dc
    .4byte gUnknown_087F85DC + 0x5ba0
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0xb70
    .4byte gUnknown_087F85DC + 0x4758
    .4byte gUnknown_087F85DC + 0x5cf8
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x1120
    .4byte gUnknown_087F85DC + 0x48dc
    .4byte gUnknown_087F85DC + 0x5e58
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x1714
    .4byte gUnknown_087F85DC + 0x4a74
    .4byte gUnknown_087F85DC + 0x5fd0
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x1c90
    .4byte gUnknown_087F85DC + 0x4bf8
    .4byte gUnknown_087F85DC + 0x6140
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x21f4
    .4byte gUnknown_087F85DC + 0x4d7c
    .4byte gUnknown_087F85DC + 0x62bc
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x26cc
    .4byte gUnknown_087F85DC + 0x4ef0
    .4byte gUnknown_087F85DC + 0x642c
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x2b0c
    .4byte gUnknown_087F85DC + 0x5048
    .4byte gUnknown_087F85DC + 0x6584
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x2eb4
    .4byte gUnknown_087F85DC + 0x518c
    .4byte gUnknown_087F85DC + 0x66c4
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x3254
    .4byte gUnknown_087F85DC + 0x52d4
    .4byte gUnknown_087F85DC + 0x680c
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x35b0
    .4byte gUnknown_087F85DC + 0x5410
    .4byte gUnknown_087F85DC + 0x6944
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x3908
    .4byte gUnknown_087F85DC + 0x5548
    .4byte gUnknown_087F85DC + 0x6a7c
    .4byte gUnknown_087F85DC + 0x6e6c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x3cac
    .4byte gUnknown_087F85DC + 0x569c
    .4byte gUnknown_087F85DC + 0x6bd0
    .4byte gUnknown_087F85DC + 0x6e8c
    .4byte 0x00000004
    .4byte gUnknown_087F85DC + 0x4014
    .4byte gUnknown_087F85DC + 0x57ec
    .4byte gUnknown_087F85DC + 0x6d1c
    .4byte gUnknown_087F85DC + 0x6e8c
    .4byte 0xffffffff
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000028
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x0000ffff
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x0000ffff
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x0000ffff
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x0000ffff
    .4byte 0x0005ffff
    .4byte 0x00020002
    .4byte 0xfffefffe
    .4byte 0x00010001
    .4byte 0xffffffff
    .4byte 0x00000000

	.global gUnknown_08801AAC
gUnknown_08801AAC:  @ 0x08801AAC
    .4byte gUnknown_088018A0 + 0x1f6
    .4byte gUnknown_088018A0 + 0x154

	.global gUnknown_08801AB4
gUnknown_08801AB4:  @ 0x08801AB4
@ Replacing .incbin "baserom.gba", 0x801AB4, 0x160
    .4byte gUnknown_08801AB4 + 0x60
    .4byte gUnknown_08801AB4 + 0x20
    .4byte gUnknown_08801AB4 + 0x20
    .4byte gUnknown_08801AB4 + 0x20
    .4byte gUnknown_08801AB4 + 0xa0
    .4byte gUnknown_08801AB4 + 0x60
    .4byte gUnknown_08801AB4 + 0x20
    .4byte gUnknown_08801AB4 + 0x20
    .4byte 0x35393237
    .4byte 0x343d363b
    .4byte 0x293e2d3f
    .4byte 0x2e312b33
    .4byte 0x24382c20
    .4byte 0x2228263c
    .4byte 0x272f1a2a
    .4byte 0x181b231f
    .4byte 0x121d3a11
    .4byte 0x30161019
    .4byte 0x1e1c0821
    .4byte 0x090a150e
    .4byte 0x1303070b
    .4byte 0x14060f02
    .4byte 0x05250d04
    .4byte 0x0017010c
    .4byte 0x0f161f36
    .4byte 0x3e372e26
    .4byte 0x1d173d15
    .4byte 0x2f353f25
    .4byte 0x0e343c07
    .4byte 0x2c061c27
    .4byte 0x2b051e13
    .4byte 0x0d333b04
    .4byte 0x0c233a22
    .4byte 0x0a242d12
    .4byte 0x39110b14
    .4byte 0x09021903
    .4byte 0x38321831
    .4byte 0x1b202a21
    .4byte 0x1a102900
    .4byte 0x28010830
    .4byte 0x1a102900
    .4byte 0x28010830
    .4byte 0x38321831
    .4byte 0x1b202a21
    .4byte 0x39110b14
    .4byte 0x09021903
    .4byte 0x0c233a22
    .4byte 0x0a242d12
    .4byte 0x2b051e13
    .4byte 0x0d333b04
    .4byte 0x0e343c07
    .4byte 0x2c061c27
    .4byte 0x1d173d15
    .4byte 0x2f353f25
    .4byte 0x0f161f36
    .4byte 0x3e372e26
    .4byte 0x02212b14
    .4byte 0x072e2511
    .4byte 0x1c193b33
    .4byte 0x0f270d2f
    .4byte 0x0a32051a
    .4byte 0x3d3f161b
    .4byte 0x10312a29
    .4byte 0x3e1f1e34
    .4byte 0x08000b3a
    .4byte 0x370e2d03
    .4byte 0x01301509
    .4byte 0x242c383c
    .4byte 0x22180c1d
    .4byte 0x17123626
    .4byte 0x39200423
    .4byte 0x06351328
    .4byte 0x03020100
    .4byte 0x07060504
    .4byte 0x0b0a0908
    .4byte 0x0f0e0d0c
    .4byte 0x13121110
    .4byte 0x17161514
    .4byte 0x1b1a1918
    .4byte 0x1f1e1d1c
    .4byte 0x23222120
    .4byte 0x27262524
    .4byte 0x2b2a2928
    .4byte 0x2f2e2d2c
    .4byte 0x33323130
    .4byte 0x37363534
    .4byte 0x3b3a3938
    .4byte 0x3f3e3d3c

	.global gUnknown_08801C14
gUnknown_08801C14:  @ 0x08801C14
	.incbin "baserom.gba", 0x801C14, 0x368

	.global gUnknown_08801F7C
gUnknown_08801F7C:  @ 0x08801F7C
	.incbin "baserom.gba", 0x801F7C, 0x78

	.global gUnknown_08801FF4
gUnknown_08801FF4:  @ 0x08801FF4
	.incbin "baserom.gba", 0x801FF4, 0x50

	.global gUnknown_08802044
gUnknown_08802044:  @ 0x08802044
	.incbin "baserom.gba", 0x802044, 0x78

	.global gUnknown_088020BC
gUnknown_088020BC:  @ 0x088020BC
	.incbin "baserom.gba", 0x8020BC, 0x50

	.global gUnknown_0880210C
gUnknown_0880210C:  @ 0x0880210C
	.incbin "baserom.gba", 0x80210C, 0xB4

	.global gUnknown_088021C0
gUnknown_088021C0:  @ 0x088021C0
	.incbin "baserom.gba", 0x8021C0, 0xB4

	.global gUnknown_08802274
gUnknown_08802274:  @ 0x08802274
	.incbin "baserom.gba", 0x802274, 0xD4

	.global gUnknown_08802348
gUnknown_08802348:  @ 0x08802348
	.incbin "baserom.gba", 0x802348, 0xE0

	.global gUnknown_08802428
gUnknown_08802428:  @ 0x08802428
	.incbin "baserom.gba", 0x802428, 0xE0

	.global gUnknown_08802508
gUnknown_08802508:  @ 0x08802508
	.incbin "baserom.gba", 0x802508, 0x50

	.global gUnknown_08802558
gUnknown_08802558:  @ 0x08802558
	.incbin "baserom.gba", 0x802558, 0x80

	.global gUnknown_088025D8
gUnknown_088025D8:  @ 0x088025D8
	.incbin "baserom.gba", 0x8025D8, 0x9C

	.global gUnknown_08802674
gUnknown_08802674:  @ 0x08802674
	.incbin "baserom.gba", 0x802674, 0x24

	.global gUnknown_08802698
gUnknown_08802698:  @ 0x08802698
	.incbin "baserom.gba", 0x802698, 0x4C

	.global gUnknown_088026E4
gUnknown_088026E4:  @ 0x088026E4
	.incbin "baserom.gba", 0x8026E4, 0x1A0

	.global gUnknown_08802884
gUnknown_08802884:  @ 0x08802884
	.incbin "baserom.gba", 0x802884, 0x80

	.global gUnknown_08802904
gUnknown_08802904:  @ 0x08802904
	.incbin "baserom.gba", 0x802904, 0x200

	.global gUnknown_08802B04
gUnknown_08802B04:  @ 0x08802B04
	.incbin "baserom.gba", 0x802B04, 0x80

	.global gUnknown_08802B84
gUnknown_08802B84:  @ 0x08802B84
	.incbin "baserom.gba", 0x802B84, 0x40

	.global gUnknown_08802BC4
gUnknown_08802BC4:  @ 0x08802BC4
	.incbin "baserom.gba", 0x802BC4, 0xC0

	.global gUnknown_08802C84
gUnknown_08802C84:  @ 0x08802C84
	.incbin "baserom.gba", 0x802C84, 0xA0

	.global gUnknown_08802D24
gUnknown_08802D24:  @ 0x08802D24
	.incbin "baserom.gba", 0x802D24, 0x20

	.global gUnknown_08802D44
gUnknown_08802D44:  @ 0x08802D44
	.incbin "baserom.gba", 0x802D44, 0x380

	.global gUnknown_088030C4
gUnknown_088030C4:  @ 0x088030C4
	.incbin "baserom.gba", 0x8030C4, 0x300

	.global gUnknown_088033C4
gUnknown_088033C4:  @ 0x088033C4
	.incbin "baserom.gba", 0x8033C4, 0x160

	.global gUnknown_08803524
gUnknown_08803524:  @ 0x08803524
	.incbin "baserom.gba", 0x803524, 0x6C

	.global gUnknown_08803590
gUnknown_08803590:  @ 0x08803590
	.incbin "baserom.gba", 0x803590, 0x20

	.global gUnknown_088035B0
gUnknown_088035B0:  @ 0x088035B0
	.incbin "baserom.gba", 0x8035B0, 0x438

	.global gUnknown_088039E8
gUnknown_088039E8:  @ 0x088039E8
	.incbin "baserom.gba", 0x8039E8, 0x128

	.global gUnknown_08803B10
gUnknown_08803B10:  @ 0x08803B10
	.incbin "baserom.gba", 0x803B10, 0x20

	.global gUnknown_08803B30
gUnknown_08803B30:  @ 0x08803B30
	.incbin "baserom.gba", 0x803B30, 0xA0

	.global gUnknown_08803BD0
gUnknown_08803BD0:  @ 0x08803BD0
	.incbin "baserom.gba", 0x803BD0, 0xE0

	.global gUnknown_08803CB0
gUnknown_08803CB0:  @ 0x08803CB0
	.incbin "baserom.gba", 0x803CB0, 0x20

	.global gUnknown_08803CD0
gUnknown_08803CD0:  @ 0x08803CD0
	.incbin "baserom.gba", 0x803CD0, 0x94

	.global gCharacterData
gCharacterData:  @ 0x08803D64
@ Replacing .incbin "baserom.gba", 0x803D64, 0x3400
    .4byte 0x026e0212
    .4byte 0x00020201
    .4byte 0x01010600
    .4byte 0x00000000
    .4byte 0x00050000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x3c3c2846
    .4byte 0x003c1e1e
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xc06
    .4byte 0x00000007
    .4byte 0x026f0213
    .4byte 0x00040702
    .4byte 0x01030700
    .4byte 0x05090707
    .4byte 0x000d0503
    .4byte 0x0000b5b5
    .4byte 0x00000000
    .4byte 0x2d2d325a
    .4byte 0x00191e28
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xc36
    .4byte 0x00000003
    .4byte 0x02700214
    .4byte 0x00050903
    .4byte 0x04070200
    .4byte 0x03040408
    .4byte 0x01030300
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte 0x1e232d5a
    .4byte 0x001e1437
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xc66
    .4byte 0x00000004
    .4byte 0x02710215
    .4byte 0x00060504
    .4byte 0x01060600
    .4byte 0x02030200
    .4byte 0x00020100
    .4byte 0x00001f01
    .4byte 0x00000000
    .4byte 0x32282850
    .4byte 0x00281419
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xc4e
    .4byte 0x00000003
    .4byte 0x02720216
    .4byte 0x00074505
    .4byte 0x03080700
    .4byte 0x07050302
    .4byte 0x04010001
    .4byte 0x00000000
    .4byte 0x00000047
    .4byte 0x28322846
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xc7e
    .4byte 0x00000004
    .4byte 0x02730217
    .4byte 0x00084806
    .4byte 0x01090700
    .4byte 0x06020103
    .4byte 0x00040303
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte 0x3c372332
    .4byte 0x00321e14
    .4byte 0x00000000
    .4byte 0x00204000
    .4byte gUnknown_088ADFA6 + 0xc96
    .4byte 0x0000000a
    .4byte 0x02740218
    .4byte 0x00093d07
    .4byte 0x010a0100
    .4byte 0x02020201
    .4byte 0x00080002
    .4byte 0x00010000
    .4byte 0x00000000
    .4byte 0x1e233246
    .4byte 0x00281419
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xcc6
    .4byte 0x00000005
    .4byte 0x02750219
    .4byte 0x000a1a08
    .4byte 0x010b0100
    .4byte 0x02020100
    .4byte 0x00040200
    .4byte 0x1f000000
    .4byte 0x00000000
    .4byte 0x3c322d37
    .4byte 0x0032230f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xcf6
    .4byte 0x00000007
    .4byte 0x0276021a
    .4byte 0x000c0d09
    .4byte 0x020c0600
    .4byte 0x01030102
    .4byte 0x00080101
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x4128284b
    .4byte 0x002d1419
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xcde
    .4byte 0x00000000
    .4byte 0x0277021b
    .4byte 0x000e3f0a
    .4byte 0x040d0100
    .4byte 0x03050308
    .4byte 0x03030103
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte 0x14284150
    .4byte 0x00280f19
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xcae
    .4byte 0x00000001
    .4byte 0x0278021c
    .4byte 0x000f1b0b
    .4byte 0x01140400
    .4byte 0x0a07070a
    .4byte 0x010e0705
    .4byte 0xb5000000
    .4byte 0x00000000
    .4byte 0x2d28284b
    .4byte 0x002d1914
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xdb6
    .4byte 0x00000000
    .4byte 0x0279021d
    .4byte 0x0010260c
    .4byte 0x010f0700
    .4byte 0x05030501
    .4byte 0x00080101
    .4byte 0x00000000
    .4byte 0x00004700
    .4byte 0x2d1e412d
    .4byte 0x002d280f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xd26
    .4byte 0x00000007
    .4byte 0x027a021e
    .4byte 0x00114a0d
    .4byte 0x01100400
    .4byte 0x06020102
    .4byte 0x00060002
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x28193c32
    .4byte 0x003c370f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xd3e
    .4byte 0x0000000a
    .4byte 0x027b021f
    .4byte 0x00131f0e
    .4byte 0x091f0100
    .4byte 0x0506070a
    .4byte 0x01040204
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte 0x2d283755
    .4byte 0x00230f19
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xe76
    .4byte 0x00000000
    .4byte 0x027c0220
    .4byte 0x0014010f
    .4byte 0x04010100
    .4byte 0x04030205
    .4byte 0x00080201
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte 0x2d373750
    .4byte 0x00321923
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xc1e
    .4byte 0x00000003
    .4byte 0x027d0221
    .4byte 0x00160510
    .4byte 0x05050300
    .4byte 0x03060204
    .4byte 0x00070202
    .4byte 0x0000471f
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00231914
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xd86
    .4byte 0x00000003
    .4byte 0x027e0222
    .4byte 0x00180511
    .4byte 0x06040400
    .4byte 0x02040405
    .4byte 0x01060103
    .4byte 0x0000471f
    .4byte 0x00000000
    .4byte 0x2828325a
    .4byte 0x00141419
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xd6e
    .4byte 0x00000003
    .4byte 0x027f0223
    .4byte 0x00194712
    .4byte 0x01130200
    .4byte 0x03030103
    .4byte 0x00060202
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte 0x2828233c
    .4byte 0x00320f1e
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xe8e
    .4byte 0x00000007
    .4byte 0x02800224
    .4byte 0x001a4413
    .4byte 0x020e0400
    .4byte 0x06050501
    .4byte 0x00020101
    .4byte 0x00000000
    .4byte 0x00010000
    .4byte 0x28323237
    .4byte 0x0019370f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xd0e
    .4byte 0x00000000
    .4byte 0x02810225
    .4byte 0x001b0f14
    .4byte 0x0a150200
    .4byte 0x05050a0e
    .4byte 0x04080406
    .4byte 0x00000047
    .4byte 0x00000000
    .4byte 0x1e282d5a
    .4byte 0x001e1923
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xdce
    .4byte 0x00000004
    .4byte 0x02820226
    .4byte 0x001c4d15
    .4byte 0x01160100
    .4byte 0x05000004
    .4byte 0x010a0305
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x460a0555
    .4byte 0x00504b1e
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xde6
    .4byte 0x00000007
    .4byte 0x02830227
    .4byte 0x001e1416
    .4byte 0x05170400
    .4byte 0x03030408
    .4byte 0x00090203
    .4byte 0x0000001f
    .4byte 0x00000000
    .4byte 0x3c371e4b
    .4byte 0x0032190f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xdfe
    .4byte 0x0000000c
    .4byte 0x02840228
    .4byte 0x00202717
    .4byte 0x02180300
    .4byte 0x0a0e0b0a
    .4byte 0x010b0803
    .4byte 0x00000000
    .4byte 0x0079b547
    .4byte 0x28191e32
    .4byte 0x0028231e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xe16
    .4byte 0x00000006
    .4byte 0x02850229
    .4byte 0x00213e18
    .4byte 0x02190600
    .4byte 0x04020202
    .4byte 0x00050000
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0x23282d32
    .4byte 0x0032280f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xe2e
    .4byte 0x00000005
    .4byte 0x0286022a
    .4byte 0x00224b19
    .4byte 0x031b0600
    .4byte 0x07050503
    .4byte 0x000c0303
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x2d2d322d
    .4byte 0x0041320f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xe46
    .4byte 0x0000000b
    .4byte 0x0287022b
    .4byte 0x0023431a
    .4byte 0x011c0200
    .4byte 0x02050913
    .4byte 0x03040605
    .4byte 0x00790000
    .4byte 0x00000000
    .4byte 0x28233255
    .4byte 0x001e191e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xe5e
    .4byte 0x00000004
    .4byte 0x00000267
    .4byte 0x0000411b
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0288022d
    .4byte 0x0024331c
    .4byte 0x011d0500
    .4byte 0x080f070c
    .4byte 0x00050b07
    .4byte 0x00000079
    .4byte 0x00000000
    .4byte 0x3c2d1941
    .4byte 0x00191e19
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xea6
    .4byte 0x00000000
    .4byte 0x0289022e
    .4byte 0x0025351d
    .4byte 0x081e0700
    .4byte 0x06080914
    .4byte 0x02080606
    .4byte 0x00b5b5b5
    .4byte 0x00000000
    .4byte 0x1e283755
    .4byte 0x00141e2d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xebe
    .4byte 0x00000004
    .4byte 0x028a022f
    .4byte 0x00263c1e
    .4byte 0x01220300
    .4byte 0x03010303
    .4byte 0x00030500
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41555a82
    .4byte 0x001e1e96
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte gUnknown_088ADFA6 + 0xed6
    .4byte 0x0000000c
    .4byte 0x028b0230
    .4byte 0x00292d1f
    .4byte 0x09200500
    .4byte 0x06080a05
    .4byte 0x00000600
    .4byte 0x00000000
    .4byte 0x47000000
    .4byte 0x23283246
    .4byte 0x00142d0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xeee
    .4byte 0x00000003
    .4byte 0x028c0231
    .4byte 0x002a1320
    .4byte 0x05110300
    .4byte 0x05040408
    .4byte 0x00070203
    .4byte 0x00000047
    .4byte 0x00000000
    .4byte 0x37372350
    .4byte 0x001e1414
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xd56
    .4byte 0x00000003
    .4byte 0x028d0232
    .4byte 0x002b4921
    .4byte 0x01230200
    .4byte 0x08060607
    .4byte 0x010c0805
    .4byte 0x0000b547
    .4byte 0x00000000
    .4byte 0x3c322846
    .4byte 0x001e3214
    .4byte 0x00000000
    .4byte 0x00204000
    .4byte gUnknown_088ADFA6 + 0xf06
    .4byte 0x0000000a
    .4byte 0x028e0233
    .4byte 0x002c4822
    .4byte 0x04120300
    .4byte 0x08040306
    .4byte 0x00080503
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte 0x41282d41
    .4byte 0x003c1914
    .4byte 0x00000000
    .4byte 0x00204000
    .4byte gUnknown_088ADFA6 + 0xd9e
    .4byte 0x0000000a
    .4byte 0x028f0234
    .4byte 0x00464f23
    .4byte 0x0e240400
    .4byte 0x06090d1a
    .4byte 0x00040b0e
    .4byte 0x00000000
    .4byte 0xfb0000b5
    .4byte 0x37373255
    .4byte 0x001e372d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02910236
    .4byte 0x00450724
    .4byte 0x0d280500
    .4byte 0x070b0b19
    .4byte 0x01060806
    .4byte 0x0000b5b5
    .4byte 0x00000000
    .4byte 0x282d3750
    .4byte 0x00191e2d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a4024a
    .4byte 0x004b2125
    .4byte 0x0c270300
    .4byte 0x060c0b15
    .4byte 0x01070408
    .4byte 0x0000b5b5
    .4byte 0x00000000
    .4byte 0x2d322d55
    .4byte 0x00142823
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02930238
    .4byte 0x003f2a26
    .4byte 0x0b260200
    .4byte 0x0a080a13
    .4byte 0x000a0b08
    .4byte 0x00000000
    .4byte 0x0000b579
    .4byte 0x28372855
    .4byte 0x00191e14
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02920237
    .4byte 0x00422327
    .4byte 0x0d290400
    .4byte 0x090a0c19
    .4byte 0x01030b06
    .4byte 0x0000fb00
    .4byte 0x00000000
    .4byte 0x32372850
    .4byte 0x000f1414
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a00246
    .4byte 0x00482b28
    .4byte 0x102b0500
    .4byte 0x0f110a1c
    .4byte 0x00090a0d
    .4byte 0x00000000
    .4byte 0x00fb00b5
    .4byte 0x28322d4b
    .4byte 0x000f2d14
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x029f0244
    .4byte 0x00431129
    .4byte 0x0c2a0200
    .4byte 0x03050d19
    .4byte 0x020e0b07
    .4byte 0x00b500b5
    .4byte 0x00000000
    .4byte 0x2d2d3255
    .4byte 0x0014141e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b3025b
    .4byte 0x00510b2a
    .4byte 0x0b2c0100
    .4byte 0x090a0c19
    .4byte 0x03050805
    .4byte 0x00b5b5b5
    .4byte 0x00000000
    .4byte 0x1e283755
    .4byte 0x0019192d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b80260
    .4byte 0x0056162b
    .4byte 0x092e0300
    .4byte 0x0b090a0e
    .4byte 0x000c0c04
    .4byte 0x000000b5
    .4byte 0x00000000
    .4byte 0x373c1e4b
    .4byte 0x001e1914
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b4025c
    .4byte 0x00521d2c
    .4byte 0x0a2d0700
    .4byte 0x08080a10
    .4byte 0x01110906
    .4byte 0xb50000b5
    .4byte 0x00000000
    .4byte 0x2d2d2846
    .4byte 0x00281919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000412d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000412e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000412f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004130
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004131
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004132
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004133
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004134
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004135
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004136
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004137
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004138
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004139
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000413a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x033d02f1
    .4byte 0x0000073b
    .4byte 0x01250507
    .4byte 0x03020300
    .4byte 0x00140000
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte 0x1e2d3c00
    .4byte 0x003c0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x032e026d
    .4byte 0x0000313c
    .4byte 0x12000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x47000001
    .4byte 0x20231e32
    .4byte 0x002d2808
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x032e026c
    .4byte 0x0000313d
    .4byte 0x09000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x47000001
    .4byte 0x20231e32
    .4byte 0x002d2808
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x033d02f1
    .4byte 0x0000073e
    .4byte 0x01210507
    .4byte 0x02010200
    .4byte 0x000a0000
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte 0x28323200
    .4byte 0x00370000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x033d02f1
    .4byte 0x0000073f
    .4byte 0x011a0507
    .4byte 0x01020100
    .4byte 0x00000000
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte 0x14284600
    .4byte 0x00280000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x028f0234
    .4byte 0x004a4f40
    .4byte 0x0e000400
    .4byte 0x06090d1a
    .4byte 0x00040b0e
    .4byte 0x00000000
    .4byte 0xfb0000b5
    .4byte 0x37373255
    .4byte 0x001e372d
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02900235
    .4byte 0x00003b41
    .4byte 0x12000301
    .4byte 0x0b0a102a
    .4byte 0x00070703
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x465a6496
    .4byte 0x001e50a0
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02910236
    .4byte 0x00450742
    .4byte 0x03000500
    .4byte 0x0409080b
    .4byte 0x01040405
    .4byte 0x0000b5b5
    .4byte 0x00000000
    .4byte 0x282d3750
    .4byte 0x00191e2d
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02920237
    .4byte 0x00422343
    .4byte 0x0d000400
    .4byte 0x090a0c19
    .4byte 0x01030b06
    .4byte 0x0000fb00
    .4byte 0x00000000
    .4byte 0x32372850
    .4byte 0x000f1414
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02930238
    .4byte 0x003f2a44
    .4byte 0x0b000200
    .4byte 0x0a080a13
    .4byte 0x000a0b08
    .4byte 0x00000000
    .4byte 0x0000b579
    .4byte 0x28372855
    .4byte 0x00191e14
    .4byte 0x00000000
    .4byte 0x0000c000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02920237
    .4byte 0x00422345
    .4byte 0x05000400
    .4byte 0x0607060e
    .4byte 0x01020503
    .4byte 0x0000b500
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02940239
    .4byte 0x00310946
    .4byte 0x04000200
    .4byte 0x01000303
    .4byte 0x00020000
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0295023a
    .4byte 0x00324147
    .4byte 0x04000400
    .4byte 0x00030103
    .4byte 0x00000001
    .4byte 0x001f0000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0296023b
    .4byte 0x00334148
    .4byte 0x06000100
    .4byte 0x02040305
    .4byte 0x00010202
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005349
    .4byte 0x06000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0297023c
    .4byte 0x0034094a
    .4byte 0x08000700
    .4byte 0x0305060d
    .4byte 0x00040302
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0298023d
    .4byte 0x00362d4b
    .4byte 0x0a000100
    .4byte 0x0407080c
    .4byte 0x00070503
    .4byte 0x00000000
    .4byte 0x47000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0299023e
    .4byte 0x0037054c
    .4byte 0x0c000600
    .4byte 0x0507030c
    .4byte 0x00070601
    .4byte 0x00007947
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x029a023f
    .4byte 0x00380b4d
    .4byte 0x01000700
    .4byte 0x02040513
    .4byte 0x00020501
    .4byte 0x0079b579
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x029b0240
    .4byte 0x0039404e
    .4byte 0x05000500
    .4byte 0x0205080e
    .4byte 0x00030807
    .4byte 0x47790000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x029c0241
    .4byte 0x003a274f
    .4byte 0x07000400
    .4byte 0x08050810
    .4byte 0x00090c02
    .4byte 0x00000000
    .4byte 0x00477947
    .4byte 0x23193255
    .4byte 0x001e0f0f
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005e50
    .4byte 0x09000504
    .4byte 0x0206060f
    .4byte 0x00000804
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x029d0242
    .4byte 0x003b3551
    .4byte 0x0a000700
    .4byte 0x04070a19
    .4byte 0x010b0908
    .4byte 0x007979b5
    .4byte 0x00000000
    .4byte 0x23233255
    .4byte 0x001e0f19
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x029e0243
    .4byte 0x003c1552
    .4byte 0x0b000100
    .4byte 0x08060614
    .4byte 0x00080804
    .4byte 0x000000b5
    .4byte 0x00000000
    .4byte 0x0a0a4155
    .4byte 0x001e1414
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x029f0244
    .4byte 0x00431153
    .4byte 0x0c000200
    .4byte 0x03050d19
    .4byte 0x020e0b07
    .4byte 0x00fb00b5
    .4byte 0x00000000
    .4byte 0x2d2d3255
    .4byte 0x0014141e
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x029c0241
    .4byte 0x003a2754
    .4byte 0x07000400
    .4byte 0x0805080e
    .4byte 0x00090c02
    .4byte 0x00000000
    .4byte 0x00477947
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004155
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00006156
    .4byte 0x0f000504
    .4byte 0x070b0a19
    .4byte 0x00030c05
    .4byte 0x00000000
    .4byte 0xb5000000
    .4byte 0x28144155
    .4byte 0x001e280f
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a00246
    .4byte 0x00482b57
    .4byte 0x10000500
    .4byte 0x0f110a1c
    .4byte 0x00090a0d
    .4byte 0x00000000
    .4byte 0x00fb00b5
    .4byte 0x28322d4b
    .4byte 0x000f2d14
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004158
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004159
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a10247
    .4byte 0x003d405a
    .4byte 0x05000200
    .4byte 0x00030a11
    .4byte 0x03010508
    .4byte 0x1fb50000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a20248
    .4byte 0x003e1d5b
    .4byte 0x07000400
    .4byte 0x07070816
    .4byte 0x00060908
    .4byte 0xb5000079
    .4byte 0x00000000
    .4byte 0x23233255
    .4byte 0x001e0f19
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005a5c
    .4byte 0x09000504
    .4byte 0x03030712
    .4byte 0x00000a02
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x23233255
    .4byte 0x001e0f19
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x0000565d
    .4byte 0x08000504
    .4byte 0x070a050f
    .4byte 0x00010704
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x0000645e
    .4byte 0x08000504
    .4byte 0x0609050e
    .4byte 0x00000404
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x0000535f
    .4byte 0x01000504
    .4byte 0x01020207
    .4byte 0x00010202
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x23233255
    .4byte 0x001e0f0f
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004160
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004161
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004162
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004163
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02ac0250
    .4byte 0x00000d64
    .4byte 0x01000006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02ad024f
    .4byte 0x00004165
    .4byte 0x01000006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02ad024f
    .4byte 0x004c4166
    .4byte 0x01000206
    .4byte 0x02020202
    .4byte 0x00020202
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02ad024f
    .4byte 0x004d4167
    .4byte 0x01000006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a30249
    .4byte 0x00303f68
    .4byte 0x04000100
    .4byte 0x03020103
    .4byte 0x00000000
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a4024a
    .4byte 0x004b2169
    .4byte 0x0c000300
    .4byte 0x060c0b15
    .4byte 0x01070408
    .4byte 0x0000b579
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a5024b
    .4byte 0x00350f6a
    .4byte 0x08000600
    .4byte 0x01000507
    .4byte 0x00040602
    .4byte 0x00000047
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a6024c
    .4byte 0x00400b6b
    .4byte 0x0d000700
    .4byte 0x080a0d1f
    .4byte 0x02090907
    .4byte 0x00b5fbb5
    .4byte 0x00000000
    .4byte 0x0a0a3255
    .4byte 0x001e0f0a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a70234
    .4byte 0x004a4f6c
    .4byte 0x12000400
    .4byte 0x0a0f1437
    .4byte 0x00091517
    .4byte 0x00000000
    .4byte 0xfb0000b5
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a80236
    .4byte 0x0044076d
    .4byte 0x0d000500
    .4byte 0x070b0b19
    .4byte 0x01060806
    .4byte 0x0000b5b5
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000416e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000416f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004170
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004171
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004172
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004173
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004174
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004175
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004176
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004177
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004178
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004179
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000417a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000417b
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000417c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000417d
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000417e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x0000057f
    .4byte 0x01000003
    .4byte 0x02010203
    .4byte 0x00010002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00003f80
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00001981
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00003f82
    .4byte 0x01000003
    .4byte 0xfdff0002
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00004e83
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00000984
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00000585
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00001386
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00000f87
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00000d88
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00002589
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x0000448a
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00002d8b
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02a9024d
    .4byte 0x00004b8c
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02aa024e
    .4byte 0x0000098d
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02ae0254
    .4byte 0x0000418e
    .4byte 0x01000006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02aa024e
    .4byte 0x0000058f
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02aa024e
    .4byte 0x00002d90
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02aa024e
    .4byte 0x00002591
    .4byte 0x01000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004192
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004193
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004194
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004195
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004196
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004197
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004198
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x00004199
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000419a
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000419b
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000419c
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000419d
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000419e
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x0000419f
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041a0
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041a1
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041a2
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041a3
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041a4
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041a5
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041a6
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02ab0253
    .4byte 0x00000fa7
    .4byte 0x01000006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02af0251
    .4byte 0x00000fa8
    .4byte 0x01000006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b00252
    .4byte 0x00000fa9
    .4byte 0x01000006
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000052aa
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000053ab
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000054ac
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000055ad
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000056ae
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000057af
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000058b0
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000059b1
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005ab2
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005bb3
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005cb4
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005db5
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005eb6
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x00005fb7
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000060b8
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000061b9
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10256
    .4byte 0x000062ba
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000064
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000063bb
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000064bc
    .4byte 0x01000504
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b10255
    .4byte 0x000065bd
    .4byte 0x01000501
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b2025a
    .4byte 0x000066be
    .4byte 0x14000504
    .4byte 0x00000000
    .4byte 0x000a0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041bf
    .4byte 0x01000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02ba0262
    .4byte 0x000013c0
    .4byte 0x01000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02ba0262
    .4byte 0x000005c1
    .4byte 0x01000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041c2
    .4byte 0x01000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041c3
    .4byte 0x01000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041c4
    .4byte 0x01000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b3025b
    .4byte 0x005127c5
    .4byte 0x05000100
    .4byte 0x0806080d
    .4byte 0x030a0c02
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041c6
    .4byte 0x01000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b4025c
    .4byte 0x005273c7
    .4byte 0x01000700
    .4byte 0x00000000
    .4byte 0x01000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b5025e
    .4byte 0x00537ac8
    .4byte 0x11000600
    .4byte 0x02030b0b
    .4byte 0x00110805
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b6025d
    .4byte 0x00542bc9
    .4byte 0x01000700
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b7025f
    .4byte 0x00552fca
    .4byte 0x01000500
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b80260
    .4byte 0x005674cb
    .4byte 0x04000300
    .4byte 0x0b090a0e
    .4byte 0x000c0c04
    .4byte 0x000000b5
    .4byte 0x00000000
    .4byte 0x373c1e4b
    .4byte 0x001e1914
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02b90261
    .4byte 0x006948cc
    .4byte 0x01000300
    .4byte 0x05020203
    .4byte 0x00070200
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bb0263
    .4byte 0x000009cd
    .4byte 0x01000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bb0263
    .4byte 0x000009ce
    .4byte 0x01000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x2d322855
    .4byte 0x00141919
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041cf
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d1
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d2
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d3
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d5
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d6
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d7
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041d9
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041db
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041dc
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041dd
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041de
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041df
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e1
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e2
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e3
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e5
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e6
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e7
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041e9
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041ea
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041eb
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041ec
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041ed
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041ee
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041ef
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041f0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041f1
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041f2
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000267
    .4byte 0x000041f3
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bd0266
    .4byte 0x00006df4
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bd0266
    .4byte 0x00006ef5
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bd0266
    .4byte 0x00006ff6
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bd0266
    .4byte 0x000070f7
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bd0266
    .4byte 0x00006df8
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bc0265
    .4byte 0x00006ef9
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bc0265
    .4byte 0x000071fa
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x02bc0265
    .4byte 0x000072fb
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00004000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000264
    .4byte 0x000071fc
    .4byte 0x01000005
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c1955
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000003
    .4byte 0x00000267
    .4byte 0x000041fd
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000268
    .4byte 0x000041fe
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000269
    .4byte 0x000041ff
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00250025
    .4byte 0x00004100
    .4byte 0x01000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x00000000
    .4byte 0x231e143c
    .4byte 0x00190f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000

	.global gClassData
gClassData:  @ 0x08807164
@ Replacing .incbin "baserom.gba", 0x807164, 0x29AC
    .4byte 0x030902bf
    .4byte 0x00000301
    .4byte 0x1201008b
    .4byte 0x06070606
    .4byte 0x3c050800
    .4byte 0x14141414
    .4byte 0x5a031414
    .4byte 0x0f2d282d
    .4byte 0x0000280f
    .4byte 0x00000000
    .4byte 0x20002000
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1032
    .4byte gItemData + 0x1cf8
    .4byte gUnknown_0880BC18 + 0x41
    .4byte gUnknown_0880BC18 + 0x451
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030a02bf
    .4byte 0x00010402
    .4byte 0x1001008b
    .4byte 0x03090804
    .4byte 0x3c050501
    .4byte 0x14141414
    .4byte 0x5a031414
    .4byte 0x0f2d282d
    .4byte 0x00002814
    .4byte 0x00000000
    .4byte 0x10022000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x103e
    .4byte gItemData + 0x1cf8
    .4byte gUnknown_0880BC18 + 0x41
    .4byte gUnknown_0880BC18 + 0x451
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030b02c0
    .4byte 0x00020103
    .4byte 0x1202008b
    .4byte 0x05040303
    .4byte 0x3c070a00
    .4byte 0x17181a1b
    .4byte 0x5a031917
    .4byte 0x0f2d282d
    .4byte 0x0204280f
    .4byte 0x05020203
    .4byte 0x20002503
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x104a
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030c02c0
    .4byte 0x00030204
    .4byte 0x1202008b
    .4byte 0x05040303
    .4byte 0x3c070700
    .4byte 0x161e1d18
    .4byte 0x5a031919
    .4byte 0x0f2d282d
    .4byte 0x02042814
    .4byte 0x05030102
    .4byte 0x10022503
    .4byte 0x00000047
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1056
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030d02c1
    .4byte 0x00040705
    .4byte 0x14200080
    .4byte 0x06050205
    .4byte 0x3c070900
    .4byte 0x14141414
    .4byte 0x4b031914
    .4byte 0x0f1c2823
    .4byte 0x00001e0f
    .4byte 0x00000000
    .4byte 0x00000403
    .4byte 0x00001f01
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1062
    .4byte gUnknown_0880B90C + 0x186
    .4byte gUnknown_0880BC18 + 0x2cb
    .4byte gUnknown_0880BC18 + 0x6db
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030d02c1
    .4byte 0x00040806
    .4byte 0x12200080
    .4byte 0x06030305
    .4byte 0x3c070900
    .4byte 0x14141414
    .4byte 0x4b031914
    .4byte 0x0f1c2823
    .4byte 0x00011e0f
    .4byte 0x02000202
    .4byte 0x00000403
    .4byte 0x00001f01
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1072
    .4byte gUnknown_0880B90C + 0x186
    .4byte gUnknown_0880BC18 + 0x2cb
    .4byte gUnknown_0880BC18 + 0x6db
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030e02c2
    .4byte 0x00050507
    .4byte 0x17210081
    .4byte 0x08070407
    .4byte 0x3c080b03
    .4byte 0x19181a19
    .4byte 0x46031919
    .4byte 0x0c121e19
    .4byte 0x01021914
    .4byte 0x01020101
    .4byte 0x00000503
    .4byte 0x00001f1f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1082
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030e02c2
    .4byte 0x00050608
    .4byte 0x17210081
    .4byte 0x070b0606
    .4byte 0x3c080906
    .4byte 0x18191b17
    .4byte 0x4603191a
    .4byte 0x0c192319
    .4byte 0x01011919
    .4byte 0x02010201
    .4byte 0x00000503
    .4byte 0x00001f1f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1092
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030f02c3
    .4byte 0x01060b09
    .4byte 0x110c0076
    .4byte 0x09000205
    .4byte 0x3c040d00
    .4byte 0x14141414
    .4byte 0x50031414
    .4byte 0x1c0f1e28
    .4byte 0x00001914
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x10a2
    .4byte gItemData + 0x1d7a
    .4byte gUnknown_0880BC18 + 0xc3
    .4byte gUnknown_0880BC18 + 0x4d3
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x030f02c3
    .4byte 0x01060c0a
    .4byte 0x100c0076
    .4byte 0x08010304
    .4byte 0x3c040a01
    .4byte 0x14141414
    .4byte 0x50031414
    .4byte 0x1c0f1e28
    .4byte 0x01021914
    .4byte 0x00020101
    .4byte 0x00000000
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x10ae
    .4byte gItemData + 0x1d7a
    .4byte gUnknown_0880BC18 + 0xc3
    .4byte gUnknown_0880BC18 + 0x4d3
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031002c4
    .4byte 0x0107090b
    .4byte 0x150d0077
    .4byte 0x0d030408
    .4byte 0x3c050f03
    .4byte 0x1e181b1d
    .4byte 0x4b031919
    .4byte 0x170a141e
    .4byte 0x02041419
    .4byte 0x03020302
    .4byte 0x00000100
    .4byte 0x00014701
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x10ba
    .4byte gItemData + 0x1d7a
    .4byte gUnknown_0880BC18 + 0xc3
    .4byte gUnknown_0880BC18 + 0x4d3
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031002c4
    .4byte 0x01070a0c
    .4byte 0x140d0077
    .4byte 0x0b050508
    .4byte 0x3c050b04
    .4byte 0x1d191c1b
    .4byte 0x4b03191a
    .4byte 0x170a191e
    .4byte 0x02031419
    .4byte 0x03030203
    .4byte 0x00000100
    .4byte 0x00014701
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x10da
    .4byte gItemData + 0x1d7a
    .4byte gUnknown_0880BC18 + 0xc3
    .4byte gUnknown_0880BC18 + 0x4d3
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031102c5
    .4byte 0x0008170d
    .4byte 0x1007008e
    .4byte 0x02090103
    .4byte 0x3c060600
    .4byte 0x14141414
    .4byte 0x32021414
    .4byte 0x05282d05
    .4byte 0x00002814
    .4byte 0x00000000
    .4byte 0x0000000c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x10fa
    .4byte gUnknown_0880B90C + 0xc3
    .4byte gUnknown_0880BC18 + 0x208
    .4byte gUnknown_0880BC18 + 0x618
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032302d7
    .4byte 0x00091f0e
    .4byte 0x0c1f008f
    .4byte 0x02020000
    .4byte 0x3c080502
    .4byte 0x14141414
    .4byte 0x5f021414
    .4byte 0x00141e28
    .4byte 0x0000190a
    .4byte 0x00000000
    .4byte 0x00040000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1106
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x031202c6
    .4byte 0x000a110f
    .4byte 0x12030090
    .4byte 0x04080804
    .4byte 0x3c050900
    .4byte 0x14141414
    .4byte 0x50031414
    .4byte 0x12202828
    .4byte 0x00001e14
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1112
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031202c6
    .4byte 0x000b1210
    .4byte 0x10030090
    .4byte 0x02060503
    .4byte 0x3c050800
    .4byte 0x14141414
    .4byte 0x50031414
    .4byte 0x12202828
    .4byte 0x00001e1e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x111e
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031302c7
    .4byte 0x000c0f11
    .4byte 0x16040091
    .4byte 0x080a0906
    .4byte 0x3c060b02
    .4byte 0x191a1e19
    .4byte 0x4b031916
    .4byte 0x14141e1e
    .4byte 0x01041914
    .4byte 0x02020202
    .4byte 0x00000100
    .4byte 0x001f0047
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x112a
    .4byte gItemData + 0x1cf8
    .4byte gUnknown_0880BC18 + 0x41
    .4byte gUnknown_0880BC18 + 0x451
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031302c7
    .4byte 0x000d1012
    .4byte 0x16040091
    .4byte 0x060b0a06
    .4byte 0x3c060903
    .4byte 0x181a1e18
    .4byte 0x4b031918
    .4byte 0x14141e1e
    .4byte 0x00001914
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0x001f0047
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1146
    .4byte gItemData + 0x1cf8
    .4byte gUnknown_0880BC18 + 0x41
    .4byte gUnknown_0880BC18 + 0x451
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031402c8
    .4byte 0x000e1513
    .4byte 0x10050072
    .4byte 0x02090904
    .4byte 0x3c050800
    .4byte 0x14141414
    .4byte 0x46031414
    .4byte 0x0f282823
    .4byte 0x00001e14
    .4byte 0x00000000
    .4byte 0x00020000
    .4byte 0x0000001f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1162
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031402c8
    .4byte 0x000f1614
    .4byte 0x0f050072
    .4byte 0x010a0903
    .4byte 0x3c050501
    .4byte 0x14141414
    .4byte 0x46031414
    .4byte 0x0f282823
    .4byte 0x00001e14
    .4byte 0x00000000
    .4byte 0x00020000
    .4byte 0x0000001f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x116e
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031502c9
    .4byte 0x00101315
    .4byte 0x15060073
    .4byte 0x050a0b06
    .4byte 0x3c060902
    .4byte 0x161e1d18
    .4byte 0x41031417
    .4byte 0x0f1e1e19
    .4byte 0x02051916
    .4byte 0x01020000
    .4byte 0x00020140
    .4byte 0x00000047
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x117a
    .4byte gItemData + 0x1cf8
    .4byte gUnknown_0880BC18 + 0x41
    .4byte gUnknown_0880BC18 + 0x451
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031502c9
    .4byte 0x00111416
    .4byte 0x13060073
    .4byte 0x040c0b06
    .4byte 0x3c060703
    .4byte 0x161e1d16
    .4byte 0x41031419
    .4byte 0x0f1e1e19
    .4byte 0x02041916
    .4byte 0x01020001
    .4byte 0x00020140
    .4byte 0x00000047
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1186
    .4byte gItemData + 0x1cf8
    .4byte gUnknown_0880BC18 + 0x41
    .4byte gUnknown_0880BC18 + 0x451
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031602ca
    .4byte 0x00120d17
    .4byte 0x1008008e
    .4byte 0x02090103
    .4byte 0x3c060800
    .4byte 0x141e1e14
    .4byte 0x32031414
    .4byte 0x05282d05
    .4byte 0x01032814
    .4byte 0x02020000
    .4byte 0x02020108
    .4byte 0x0000001f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1192
    .4byte gUnknown_0880B90C + 0xc3
    .4byte gUnknown_0880BC18 + 0x208
    .4byte gUnknown_0880BC18 + 0x618
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031602ca
    .4byte 0x00130d18
    .4byte 0x1008008e
    .4byte 0x02090103
    .4byte 0x3c060600
    .4byte 0x141e1e14
    .4byte 0x32031414
    .4byte 0x05282d05
    .4byte 0x01022814
    .4byte 0x01020101
    .4byte 0x02020108
    .4byte 0x0000001f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x119e
    .4byte gUnknown_0880B90C + 0xc3
    .4byte gUnknown_0880BC18 + 0x208
    .4byte gUnknown_0880BC18 + 0x618
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031702cb
    .4byte 0x00141b19
    .4byte 0x120a0078
    .4byte 0x03030304
    .4byte 0x3c050700
    .4byte 0x14141414
    .4byte 0x46031414
    .4byte 0x0f202823
    .4byte 0x0000230f
    .4byte 0x00000000
    .4byte 0x00000080
    .4byte 0x1f000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x11aa
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031702cb
    .4byte 0x00151c1a
    .4byte 0x110a0078
    .4byte 0x03040303
    .4byte 0x3c050500
    .4byte 0x14141414
    .4byte 0x46031414
    .4byte 0x0f202823
    .4byte 0x00002314
    .4byte 0x00000000
    .4byte 0x00000080
    .4byte 0x1f000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x11c2
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031802cc
    .4byte 0x0016191b
    .4byte 0x150b0079
    .4byte 0x05050607
    .4byte 0x3c060802
    .4byte 0x191c1e19
    .4byte 0x41031417
    .4byte 0x0f141e1e
    .4byte 0x01031e14
    .4byte 0x03020202
    .4byte 0x00000180
    .4byte 0x47000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x11da
    .4byte gItemData + 0x1cf8
    .4byte gUnknown_0880BC18 + 0x41
    .4byte gUnknown_0880BC18 + 0x451
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031802cc
    .4byte 0x00171a1c
    .4byte 0x130b0079
    .4byte 0x05070606
    .4byte 0x3c060603
    .4byte 0x181d1e18
    .4byte 0x41031418
    .4byte 0x0f141e1e
    .4byte 0x03041e19
    .4byte 0x02020101
    .4byte 0x00000180
    .4byte 0x47000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x11f2
    .4byte gItemData + 0x1cf8
    .4byte gUnknown_0880BC18 + 0x41
    .4byte gUnknown_0880BC18 + 0x451
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031902cd
    .4byte 0x0018191d
    .4byte 0x150c0097
    .4byte 0x06070607
    .4byte 0x3c070903
    .4byte 0x181e1c19
    .4byte 0x3c031917
    .4byte 0x0f231e19
    .4byte 0x0203190f
    .4byte 0x03030101
    .4byte 0x00000503
    .4byte 0x1f00001f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x120a
    .4byte gUnknown_0880B90C + 0x249
    .4byte gUnknown_0880BC18 + 0x38e
    .4byte gUnknown_0880BC18 + 0x79e
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031902cd
    .4byte 0x00181a1e
    .4byte 0x150c0097
    .4byte 0x05070606
    .4byte 0x3c070804
    .4byte 0x161e1c17
    .4byte 0x3c031919
    .4byte 0x0f231e19
    .4byte 0x02021914
    .4byte 0x03030102
    .4byte 0x00000503
    .4byte 0x1f00001f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x121a
    .4byte gUnknown_0880B90C + 0x249
    .4byte gUnknown_0880BC18 + 0x38e
    .4byte gUnknown_0880BC18 + 0x79e
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031a02ce
    .4byte 0x0019211f
    .4byte 0x140d0088
    .4byte 0x08050307
    .4byte 0x3c070a00
    .4byte 0x14141414
    .4byte 0x50031914
    .4byte 0x191e232d
    .4byte 0x0000190f
    .4byte 0x00000000
    .4byte 0x00000803
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x122a
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x031a02ce
    .4byte 0x001a2220
    .4byte 0x130d0088
    .4byte 0x07050506
    .4byte 0x3c070900
    .4byte 0x14141414
    .4byte 0x50031914
    .4byte 0x191e232d
    .4byte 0x00001911
    .4byte 0x00000000
    .4byte 0x00000803
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1236
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x031b02cf
    .4byte 0x001b1f21
    .4byte 0x190e0089
    .4byte 0x0a070509
    .4byte 0x3c080b01
    .4byte 0x1c17191b
    .4byte 0x4b031916
    .4byte 0x14141e28
    .4byte 0x02041411
    .4byte 0x00020002
    .4byte 0x00000903
    .4byte 0x0000471f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1242
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x031b02cf
    .4byte 0x001c2022
    .4byte 0x180e0089
    .4byte 0x09070708
    .4byte 0x3c080a02
    .4byte 0x1b181a19
    .4byte 0x4b031917
    .4byte 0x14141e28
    .4byte 0x00001411
    .4byte 0x00000000
    .4byte 0x00000903
    .4byte 0x0000471f
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1252
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x031c02d0
    .4byte 0x001d1f23
    .4byte 0x140f0093
    .4byte 0x07080707
    .4byte 0x3c080a01
    .4byte 0x181c1a19
    .4byte 0x41031916
    .4byte 0x0f1e1e23
    .4byte 0x01031911
    .4byte 0x01000302
    .4byte 0x00000903
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1262
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x031c02d0
    .4byte 0x001d2024
    .4byte 0x130f0093
    .4byte 0x06090806
    .4byte 0x3c080902
    .4byte 0x171d1b18
    .4byte 0x41031917
    .4byte 0x0f1e1e23
    .4byte 0x02031914
    .4byte 0x01010201
    .4byte 0x00000903
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x126e
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x031d02d1
    .4byte 0x001e2725
    .4byte 0x1012007c
    .4byte 0x03030201
    .4byte 0x3c050603
    .4byte 0x14141414
    .4byte 0x37031414
    .4byte 0x05232837
    .4byte 0x0001141e
    .4byte 0x02010201
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001f00
    .4byte gUnknown_088ADFA6 + 0x127a
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031d02d1
    .4byte 0x001f2826
    .4byte 0x1012007c
    .4byte 0x02020301
    .4byte 0x3c050304
    .4byte 0x14141414
    .4byte 0x37031414
    .4byte 0x05232837
    .4byte 0x00001428
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001f00
    .4byte gUnknown_088ADFA6 + 0x128e
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031e02d2
    .4byte 0x00202527
    .4byte 0x1413007d
    .4byte 0x05040405
    .4byte 0x3c060705
    .4byte 0x151a1e1c
    .4byte 0x2d031419
    .4byte 0x0a191e2d
    .4byte 0x01040f28
    .4byte 0x03030000
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte 0x001f471f
    .4byte gUnknown_088ADFA6 + 0x12a2
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031e02d2
    .4byte 0x00212628
    .4byte 0x1313007d
    .4byte 0x03050604
    .4byte 0x3c060406
    .4byte 0x151a1c1e
    .4byte 0x2d031419
    .4byte 0x0a191e2d
    .4byte 0x01030f28
    .4byte 0x03030001
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte 0x001f471f
    .4byte gUnknown_088ADFA6 + 0x12ba
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031f02d3
    .4byte 0x00222529
    .4byte 0x14140095
    .4byte 0x05050304
    .4byte 0x3c070805
    .4byte 0x18191a18
    .4byte 0x2d031919
    .4byte 0x0a281e28
    .4byte 0x02041e28
    .4byte 0x02020000
    .4byte 0x00000503
    .4byte 0x00000000
    .4byte 0x0000471f
    .4byte gUnknown_088ADFA6 + 0x12d2
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x031f02d3
    .4byte 0x0023262a
    .4byte 0x13140095
    .4byte 0x03060503
    .4byte 0x3c070606
    .4byte 0x18191819
    .4byte 0x2d03191c
    .4byte 0x0a281e28
    .4byte 0x02032828
    .4byte 0x02020001
    .4byte 0x00000503
    .4byte 0x00000000
    .4byte 0x0000471f
    .4byte gUnknown_088ADFA6 + 0x12ea
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032002d4
    .4byte 0x0024452b
    .4byte 0x1518007b
    .4byte 0x03040404
    .4byte 0x3c060708
    .4byte 0x16181a19
    .4byte 0x2d03141e
    .4byte 0x08161923
    .4byte 0x02032828
    .4byte 0x02030001
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte 0x001f0047
    .4byte gUnknown_088ADFA6 + 0x1302
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x208
    .4byte 0x032002d4
    .4byte 0x00254a2c
    .4byte 0x1318007b
    .4byte 0x02040504
    .4byte 0x3c060509
    .4byte 0x151a1919
    .4byte 0x2d03141e
    .4byte 0x08161923
    .4byte 0x01032832
    .4byte 0x02020102
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte 0x001f0047
    .4byte gUnknown_088ADFA6 + 0x131a
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x208
    .4byte 0x032c02e1
    .4byte 0x01262f2d
    .4byte 0x101b007e
    .4byte 0x02020102
    .4byte 0x3c050704
    .4byte 0x14141414
    .4byte 0x32031414
    .4byte 0x0a1e2032
    .4byte 0x0201141e
    .4byte 0x02010100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x1f000000
    .4byte gUnknown_088ADFA6 + 0x1332
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032c02e1
    .4byte 0x0126302e
    .4byte 0x0f1b007e
    .4byte 0x01010103
    .4byte 0x3c050305
    .4byte 0x14141414
    .4byte 0x32031414
    .4byte 0x0a1e202d
    .4byte 0x00001428
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x1f000000
    .4byte gUnknown_088ADFA6 + 0x1346
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032d02e2
    .4byte 0x01272d2f
    .4byte 0x131c007f
    .4byte 0x04040306
    .4byte 0x3c060806
    .4byte 0x151a1a1d
    .4byte 0x2d03141c
    .4byte 0x0a191e37
    .4byte 0x00041423
    .4byte 0x02020300
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte 0x47001f01
    .4byte gUnknown_088ADFA6 + 0x135a
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032d02e2
    .4byte 0x01272e30
    .4byte 0x111c007f
    .4byte 0x03040307
    .4byte 0x3c060407
    .4byte 0x141a1a1d
    .4byte 0x2d03141d
    .4byte 0x0a191e37
    .4byte 0x00001423
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte 0x47001f01
    .4byte gUnknown_088ADFA6 + 0x1372
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032e02e3
    .4byte 0x00282d31
    .4byte 0x121d007f
    .4byte 0x03040305
    .4byte 0x3c060805
    .4byte 0x141a1b1b
    .4byte 0x2d03141c
    .4byte 0x08191e32
    .4byte 0x00031423
    .4byte 0x03010301
    .4byte 0x08000100
    .4byte 0x00000000
    .4byte 0x47000001
    .4byte gUnknown_088ADFA6 + 0x138a
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032e02e3
    .4byte 0x00282e32
    .4byte 0x121d007f
    .4byte 0x03040305
    .4byte 0x3c060405
    .4byte 0x141a1b1b
    .4byte 0x2d03141c
    .4byte 0x08191e32
    .4byte 0x00001423
    .4byte 0x00000000
    .4byte 0x08000100
    .4byte 0x00000000
    .4byte 0x47000001
    .4byte gUnknown_088ADFA6 + 0x13a2
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032602db
    .4byte 0x00290d33
    .4byte 0x10090094
    .4byte 0x02090103
    .4byte 0x3c060700
    .4byte 0x141e1e14
    .4byte 0x32031414
    .4byte 0x05232d0a
    .4byte 0x01022814
    .4byte 0x02020001
    .4byte 0x0000010c
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x13ba
    .4byte gUnknown_0880B90C + 0xc3
    .4byte gUnknown_0880BC18 + 0x208
    .4byte gUnknown_0880BC18 + 0x618
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034c0300
    .4byte 0x002a0034
    .4byte 0x320000a6
    .4byte 0x0a000000
    .4byte 0x3c00060a
    .4byte 0x1e1e1e1e
    .4byte 0x64031e1e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032b02e0
    .4byte 0x012b0935
    .4byte 0x15220096
    .4byte 0x0b060408
    .4byte 0x3c060d03
    .4byte 0x1d18181c
    .4byte 0x46031919
    .4byte 0x150f141e
    .4byte 0x02031414
    .4byte 0x01020201
    .4byte 0x00000503
    .4byte 0x001f1f01
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x13c6
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032b02e0
    .4byte 0x012b0a36
    .4byte 0x14220096
    .4byte 0x09070606
    .4byte 0x3c060a03
    .4byte 0x1c191a1a
    .4byte 0x4603191a
    .4byte 0x1514191e
    .4byte 0x01031416
    .4byte 0x02020201
    .4byte 0x00000503
    .4byte 0x001f1f01
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x13e6
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033202da
    .4byte 0x002c3a37
    .4byte 0x1228008a
    .4byte 0x06030305
    .4byte 0x3c050600
    .4byte 0x14141414
    .4byte 0x4b031414
    .4byte 0x1928282d
    .4byte 0x01022823
    .4byte 0x01020101
    .4byte 0x00000000
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1406
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032402d8
    .4byte 0x002d7e38
    .4byte 0x1c270074
    .4byte 0x05060508
    .4byte 0x3c060800
    .4byte 0x171c1d1a
    .4byte 0x55031417
    .4byte 0x12202837
    .4byte 0x01042814
    .4byte 0x02020202
    .4byte 0x00000140
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1412
    .4byte gItemData + 0x1dbb
    .4byte gUnknown_0880BC18 + 0x104
    .4byte gUnknown_0880BC18 + 0x514
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032502d9
    .4byte 0x002e7f39
    .4byte 0x1429007c
    .4byte 0x05040405
    .4byte 0x3c060505
    .4byte 0x151b1c1d
    .4byte 0x3703141a
    .4byte 0x0a232837
    .4byte 0x0204281e
    .4byte 0x03030100
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte 0x1f014700
    .4byte gUnknown_088ADFA6 + 0x142a
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033202da
    .4byte 0x002c373a
    .4byte 0x1728008a
    .4byte 0x070b0606
    .4byte 0x3c060606
    .4byte 0x161d1e17
    .4byte 0x4b03141a
    .4byte 0x1928282d
    .4byte 0x02022823
    .4byte 0x01020101
    .4byte 0x00000140
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x143e
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032302d7
    .4byte 0x002f1f3b
    .4byte 0x141f00a9
    .4byte 0x01020000
    .4byte 0x3c031901
    .4byte 0x14141414
    .4byte 0x5f031914
    .4byte 0x00141e28
    .4byte 0x0000190a
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x144a
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x032302d7
    .4byte 0x0030203c
    .4byte 0x0c1f008f
    .4byte 0x02020000
    .4byte 0x3c060502
    .4byte 0x14141414
    .4byte 0x5f021414
    .4byte 0x00141e28
    .4byte 0x0000190a
    .4byte 0x00000000
    .4byte 0x00040000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1456
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x032402d8
    .4byte 0x002d003d
    .4byte 0x0e270074
    .4byte 0x01010003
    .4byte 0x3c040800
    .4byte 0x14141414
    .4byte 0x55011414
    .4byte 0x12202837
    .4byte 0x00002814
    .4byte 0x00000000
    .4byte 0x00080000
    .4byte 0x00010000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1462
    .4byte gItemData + 0x1dbb
    .4byte gUnknown_0880BC18 + 0x104
    .4byte gUnknown_0880BC18 + 0x514
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032502d9
    .4byte 0x002e003e
    .4byte 0x0d29007c
    .4byte 0x00010001
    .4byte 0x3c040503
    .4byte 0x14141414
    .4byte 0x37011414
    .4byte 0x0a232837
    .4byte 0x0000281e
    .4byte 0x00000000
    .4byte 0x00080000
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte gUnknown_088ADFA6 + 0x147a
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032702dc
    .4byte 0x0031403f
    .4byte 0x14230074
    .4byte 0x02040205
    .4byte 0x3c050b00
    .4byte 0x14141414
    .4byte 0x55031414
    .4byte 0x0f1e2337
    .4byte 0x02020f0f
    .4byte 0x01000001
    .4byte 0x00000000
    .4byte 0x001f0000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x148e
    .4byte gItemData + 0x1dbb
    .4byte gUnknown_0880BC18 + 0x104
    .4byte gUnknown_0880BC18 + 0x514
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032802dd
    .4byte 0x00323f40
    .4byte 0x1c250075
    .4byte 0x05060508
    .4byte 0x3c060d00
    .4byte 0x1a1a1c1e
    .4byte 0x50031916
    .4byte 0x1014192d
    .4byte 0x01030f11
    .4byte 0x03030002
    .4byte 0x00000100
    .4byte 0x01470000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x14a6
    .4byte gItemData + 0x1dbb
    .4byte gUnknown_0880BC18 + 0x104
    .4byte gUnknown_0880BC18 + 0x514
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032902de
    .4byte 0x00334341
    .4byte 0x1400008b
    .4byte 0x03050105
    .4byte 0x3c050c00
    .4byte 0x14141414
    .4byte 0x52031414
    .4byte 0x0a141e32
    .4byte 0x01020f0d
    .4byte 0x01010001
    .4byte 0x00000000
    .4byte 0x001f0000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x14c2
    .4byte gUnknown_0880B90C + 0x41
    .4byte gUnknown_0880BC18 + 0x186
    .4byte gUnknown_0880BC18 + 0x596
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x145
    .4byte 0x033a02ee
    .4byte 0x00344342
    .4byte 0x1324008c
    .4byte 0x03060204
    .4byte 0x3c050a00
    .4byte 0x14141414
    .4byte 0x4b031414
    .4byte 0x0a192332
    .4byte 0x02020f0d
    .4byte 0x00010100
    .4byte 0x00000000
    .4byte 0x001f0000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x14da
    .4byte gUnknown_0880B90C + 0x82
    .4byte gUnknown_0880BC18 + 0x1c7
    .4byte gUnknown_0880BC18 + 0x5d7
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x186
    .4byte 0x032a02df
    .4byte 0x00354243
    .4byte 0x1826008d
    .4byte 0x06070607
    .4byte 0x3c060d00
    .4byte 0x171c1d1e
    .4byte 0x4b031915
    .4byte 0x0a192332
    .4byte 0x01040f0d
    .4byte 0x02020101
    .4byte 0x00000140
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x14f2
    .4byte gUnknown_0880B90C
    .4byte gUnknown_0880BC18 + 0x145
    .4byte gUnknown_0880BC18 + 0x555
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x1c7
    .4byte 0x032f02e4
    .4byte 0x00360044
    .4byte 0x1217007a
    .4byte 0x01020101
    .4byte 0x3c050605
    .4byte 0x14141414
    .4byte 0x32031414
    .4byte 0x0820231e
    .4byte 0x00002d28
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00010000
    .4byte gUnknown_088ADFA6 + 0x150a
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x208
    .4byte 0x033002e6
    .4byte 0x00372745
    .4byte 0x1215007a
    .4byte 0x01020101
    .4byte 0x3c050505
    .4byte 0x14141414
    .4byte 0x32021414
    .4byte 0x0820231e
    .4byte 0x00002d32
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte gUnknown_088ADFA6 + 0x151e
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x208
    .4byte 0x033102e5
    .4byte 0x00380046
    .4byte 0x0e00008b
    .4byte 0x01070201
    .4byte 0x3c050600
    .4byte 0x181e0a0a
    .4byte 0x2d02141a
    .4byte 0x003c1e2d
    .4byte 0x0000460d
    .4byte 0x00000000
    .4byte 0x00000020
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033202da
    .4byte 0x002c0047
    .4byte 0x0d28008a
    .4byte 0x00010003
    .4byte 0x3c040601
    .4byte 0x14141414
    .4byte 0x4b011414
    .4byte 0x1928282d
    .4byte 0x00002823
    .4byte 0x00000000
    .4byte 0x00080000
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x152a
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033302e7
    .4byte 0x00394948
    .4byte 0x0e100086
    .4byte 0x03050504
    .4byte 0x3c070502
    .4byte 0x14141414
    .4byte 0x41031914
    .4byte 0x0c282823
    .4byte 0x00002323
    .4byte 0x00000000
    .4byte 0x00001003
    .4byte 0x00001f00
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1536
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x033402e8
    .4byte 0x003a4849
    .4byte 0x14110087
    .4byte 0x05070706
    .4byte 0x3c080604
    .4byte 0x171c1917
    .4byte 0x3c03191a
    .4byte 0x0c1e1e1e
    .4byte 0x02051e1e
    .4byte 0x02020200
    .4byte 0x00001103
    .4byte 0x00004701
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1542
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x033502e9
    .4byte 0x003b2c4a
    .4byte 0x1016007a
    .4byte 0x00020201
    .4byte 0x3c050406
    .4byte 0x14141414
    .4byte 0x32021414
    .4byte 0x0820231e
    .4byte 0x00002d32
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte gUnknown_088ADFA6 + 0x1552
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x208
    .4byte 0x033602ea
    .4byte 0x003c4c4b
    .4byte 0x0f190082
    .4byte 0x02030101
    .4byte 0x3c060505
    .4byte 0x14141414
    .4byte 0x32021914
    .4byte 0x0c372319
    .4byte 0x00002d28
    .4byte 0x00000000
    .4byte 0x00000403
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte gUnknown_088ADFA6 + 0x155e
    .4byte gUnknown_0880B90C + 0x186
    .4byte gUnknown_0880BC18 + 0x2cb
    .4byte gUnknown_0880BC18 + 0x6db
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033702eb
    .4byte 0x003d4b4c
    .4byte 0x131a0083
    .4byte 0x04050304
    .4byte 0x3c070608
    .4byte 0x18191819
    .4byte 0x2d03191c
    .4byte 0x0a2d1923
    .4byte 0x02032828
    .4byte 0x03020001
    .4byte 0x00000503
    .4byte 0x00000000
    .4byte 0x001f001f
    .4byte gUnknown_088ADFA6 + 0x156a
    .4byte gUnknown_0880B90C + 0x1c7
    .4byte gUnknown_0880BC18 + 0x30c
    .4byte gUnknown_0880BC18 + 0x71c
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033802ec
    .4byte 0x003e004d
    .4byte 0x0e2a008b
    .4byte 0x00070201
    .4byte 0x3c050401
    .4byte 0x181e0a0a
    .4byte 0x2d02141a
    .4byte 0x003c1e2d
    .4byte 0x0000460d
    .4byte 0x00000000
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1582
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033902ed
    .4byte 0x003f004e
    .4byte 0x1400008a
    .4byte 0x00010003
    .4byte 0x3c050600
    .4byte 0x14141414
    .4byte 0x50021414
    .4byte 0x0c141e32
    .4byte 0x0000190f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1596
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033b02ef
    .4byte 0x00402d4f
    .4byte 0x122b007f
    .4byte 0x03050409
    .4byte 0x50060708
    .4byte 0x1e19191e
    .4byte 0x2d03191e
    .4byte 0x0a191e37
    .4byte 0x00001423
    .4byte 0x00000000
    .4byte 0x08000100
    .4byte 0x00000000
    .4byte 0xfb0000fb
    .4byte gUnknown_088ADFA6 + 0x15a2
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033c02f0
    .4byte 0x00410050
    .4byte 0x13000092
    .4byte 0x05020101
    .4byte 0x3c031900
    .4byte 0x1e141414
    .4byte 0x4b031914
    .4byte 0x0f202823
    .4byte 0x00000f0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x47000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x82
    .4byte gUnknown_0880BC18 + 0x1c7
    .4byte gUnknown_0880BC18 + 0x5d7
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033d02f1
    .4byte 0x00420051
    .4byte 0x011e0098
    .4byte 0x00040205
    .4byte 0x01050b00
    .4byte 0x00141414
    .4byte 0x00031400
    .4byte 0x0f2d2337
    .4byte 0x0000320f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x033e02f2
    .4byte 0x00435352
    .4byte 0x19000099
    .4byte 0x00000002
    .4byte 0x3c040600
    .4byte 0x14141414
    .4byte 0x5f031414
    .4byte 0x0a141e32
    .4byte 0x00000a0d
    .4byte 0x00000000
    .4byte 0x00040000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x15ba
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x033f02f3
    .4byte 0x00445253
    .4byte 0x2300009a
    .4byte 0x00010003
    .4byte 0x50050600
    .4byte 0x18151619
    .4byte 0x55011916
    .4byte 0x0a111928
    .4byte 0x0000320d
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x15c6
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034002f4
    .4byte 0x00455654
    .4byte 0x1400009b
    .4byte 0x03030204
    .4byte 0x3c050700
    .4byte 0x14141414
    .4byte 0x50031414
    .4byte 0x0c141e32
    .4byte 0x00000a0f
    .4byte 0x00000000
    .4byte 0x00020000
    .4byte 0x00004747
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x15d2
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034002f4
    .4byte 0x00465755
    .4byte 0x1200009b
    .4byte 0x03020304
    .4byte 0x3c050600
    .4byte 0x14141414
    .4byte 0x46031414
    .4byte 0x0f202823
    .4byte 0x00000a0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x47000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x15e2
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034102f5
    .4byte 0x00475456
    .4byte 0x1500009c
    .4byte 0x05060507
    .4byte 0x3c060902
    .4byte 0x161a1c18
    .4byte 0x41031917
    .4byte 0x0f141919
    .4byte 0x00000a16
    .4byte 0x00000000
    .4byte 0x00020100
    .4byte 0x0000b5b5
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x15ee
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034102f5
    .4byte 0x00485557
    .4byte 0x1500009c
    .4byte 0x05050606
    .4byte 0x3c060802
    .4byte 0x191c1e19
    .4byte 0x41031417
    .4byte 0x0f141e1e
    .4byte 0x00000a14
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0xb5000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x15fe
    .4byte gItemData + 0x1d39
    .4byte gUnknown_0880BC18 + 0x82
    .4byte gUnknown_0880BC18 + 0x492
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034202f6
    .4byte 0x00495958
    .4byte 0x1900009d
    .4byte 0x06030306
    .4byte 0x3c050c01
    .4byte 0x1a1a1c1e
    .4byte 0x52031916
    .4byte 0x12141e32
    .4byte 0x00000f0d
    .4byte 0x00000000
    .4byte 0x00040000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x160a
    .4byte gUnknown_0880B90C + 0x41
    .4byte gUnknown_0880BC18 + 0x186
    .4byte gUnknown_0880BC18 + 0x596
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x145
    .4byte 0x034302f7
    .4byte 0x004a5859
    .4byte 0x2400009e
    .4byte 0x09050508
    .4byte 0x50060f04
    .4byte 0x1a1a1c1e
    .4byte 0x55031916
    .4byte 0x1514192d
    .4byte 0x00000a11
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1616
    .4byte gUnknown_0880B90C + 0x41
    .4byte gUnknown_0880BC18 + 0x186
    .4byte gUnknown_0880BC18 + 0x596
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x145
    .4byte 0x034402f8
    .4byte 0x004b095a
    .4byte 0x2800009f
    .4byte 0x0d060508
    .4byte 0x50051000
    .4byte 0x1e1c1d1d
    .4byte 0x5f031919
    .4byte 0x1819231e
    .4byte 0x00000a19
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0x00b50000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1622
    .4byte gItemData + 0x1dbb
    .4byte gUnknown_0880BC18 + 0x104
    .4byte gUnknown_0880BC18 + 0x514
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034502f9
    .4byte 0x004c5c5b
    .4byte 0x100000a0
    .4byte 0x020a0a04
    .4byte 0x3c070600
    .4byte 0x14141414
    .4byte 0x46031414
    .4byte 0x0f2d2d23
    .4byte 0x00001e14
    .4byte 0x00000000
    .4byte 0x00040000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x163a
    .4byte gUnknown_0880B90C + 0x208
    .4byte gUnknown_0880BC18 + 0x34d
    .4byte gUnknown_0880BC18 + 0x75d
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034602fa
    .4byte 0x004d5b5c
    .4byte 0x150000a1
    .4byte 0x050c0c06
    .4byte 0x3c080802
    .4byte 0x161e1d18
    .4byte 0x41031417
    .4byte 0x1023231c
    .4byte 0x00001916
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1646
    .4byte gUnknown_0880B90C + 0x249
    .4byte gUnknown_0880BC18 + 0x38e
    .4byte gUnknown_0880BC18 + 0x79e
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034702fb
    .4byte 0x004e5e5d
    .4byte 0x150000a2
    .4byte 0x07050206
    .4byte 0x3c070a00
    .4byte 0x14141414
    .4byte 0x50031414
    .4byte 0x0f1c2823
    .4byte 0x00000a0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00470000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1652
    .4byte gUnknown_0880B90C + 0x208
    .4byte gUnknown_0880BC18 + 0x34d
    .4byte gUnknown_0880BC18 + 0x75d
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034802fc
    .4byte 0x004f5d5e
    .4byte 0x190000a3
    .4byte 0x09070408
    .4byte 0x50080c03
    .4byte 0x19181a19
    .4byte 0x4b031919
    .4byte 0x0d121e1e
    .4byte 0x00000a14
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0xb5b50000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x166a
    .4byte gUnknown_0880B90C + 0x249
    .4byte gUnknown_0880BC18 + 0x38e
    .4byte gUnknown_0880BC18 + 0x79e
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034902fd
    .4byte 0x0050605f
    .4byte 0x0f0000a4
    .4byte 0x02020102
    .4byte 0x3c050404
    .4byte 0x14141414
    .4byte 0x32031414
    .4byte 0x0a1e202d
    .4byte 0x00001e1c
    .4byte 0x00000000
    .4byte 0x00040000
    .4byte 0x00000000
    .4byte 0x47000000
    .4byte gUnknown_088ADFA6 + 0x1686
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x034a02fe
    .4byte 0x00515f60
    .4byte 0x110000a5
    .4byte 0x03030306
    .4byte 0x3c060507
    .4byte 0x141a1a1d
    .4byte 0x2d03141d
    .4byte 0x0a191e37
    .4byte 0x0000141c
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0xb5000000
    .4byte gUnknown_088ADFA6 + 0x169a
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x034b02ff
    .4byte 0x00525f61
    .4byte 0x130000a6
    .4byte 0x05040308
    .4byte 0x3c060b07
    .4byte 0x151a1a1d
    .4byte 0x2d03191c
    .4byte 0x0a191e3c
    .4byte 0x00001e28
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0xb5000000
    .4byte gUnknown_088ADFA6 + 0x16ae
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034c0300
    .4byte 0x00530062
    .4byte 0x320000a6
    .4byte 0x0a000000
    .4byte 0x3c00060a
    .4byte 0x1e1e1e1e
    .4byte 0x64031e1e
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034d0301
    .4byte 0x00546463
    .4byte 0x130000a7
    .4byte 0x06060306
    .4byte 0x3c060800
    .4byte 0x14141414
    .4byte 0x50031414
    .4byte 0x1923232d
    .4byte 0x00000a0f
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00004700
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x16c2
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x034e0302
    .4byte 0x00556364
    .4byte 0x170000a8
    .4byte 0x09080508
    .4byte 0x3c070b01
    .4byte 0x1c17191b
    .4byte 0x4b031916
    .4byte 0x14191e28
    .4byte 0x00000a11
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0x0000b500
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x16ce
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x034f0303
    .4byte 0x00561f65
    .4byte 0x350000a9
    .4byte 0x00010001
    .4byte 0x64051903
    .4byte 0x32323232
    .4byte 0x55031932
    .4byte 0x1e141423
    .4byte 0x0000190a
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x16da
    .4byte gUnknown_0880BB96
    .4byte gUnknown_0880BC18 + 0x3cf
    .4byte gUnknown_0880BC18 + 0x7df
    .4byte gUnknown_0880C4BA + 0x82
    .4byte gUnknown_0880C4BA + 0xc3
    .4byte gUnknown_0880C4BA + 0x104
    .4byte 0x00000000
    .4byte 0x03500304
    .4byte 0x00571f66
    .4byte 0x780000aa
    .4byte 0x19121417
    .4byte 0x78021919
    .4byte 0x32323232
    .4byte 0x5f051932
    .4byte 0x14141e28
    .4byte 0x00001914
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x16e6
    .4byte gUnknown_0880BB96 + 0x41
    .4byte gUnknown_0880BB96 + 0x41
    .4byte gUnknown_0880BB96 + 0x41
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00580067
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00030000
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00590068
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x005a0069
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x005b006a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x005c006b
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x005d006c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03510305
    .4byte 0x015e006d
    .4byte RomHeaderNintendoLogo + 0x5a
    .4byte 0x00000001
    .4byte 0x3c050400
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03510305
    .4byte 0x015f006e
    .4byte 0x07000063
    .4byte 0x00000000
    .4byte 0x3c050301
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03510305
    .4byte 0x0160006f
    .4byte 0x0a000059
    .4byte 0x00000100
    .4byte 0x3c050602
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03510305
    .4byte 0x01610070
    .4byte 0x09000062
    .4byte 0x00000100
    .4byte 0x3c050401
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03510305
    .4byte 0x01600071
    .4byte 0x0c00005c
    .4byte 0x02000003
    .4byte 0x3c050700
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03510305
    .4byte 0x01610072
    .4byte 0x0a000061
    .4byte 0x01000100
    .4byte 0x3c050501
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x01620073
    .4byte 0x0a000001
    .4byte 0x00000000
    .4byte 0x3c050800
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03530307
    .4byte 0x01630074
    .4byte 0x0a000001
    .4byte 0x00000000
    .4byte 0x3c050500
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x01640075
    .4byte 0x0a000001
    .4byte 0x00000000
    .4byte 0x3c050700
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03530307
    .4byte 0x01650076
    .4byte 0x0a000001
    .4byte 0x00000000
    .4byte 0x3c050600
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00660077
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x01670078
    .4byte 0x0a000001
    .4byte 0x00000000
    .4byte 0x3c051900
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x01680079
    .4byte 0x0f000001
    .4byte 0x03030300
    .4byte 0x3c001900
    .4byte 0x14141414
    .4byte 0x0a011914
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00100200
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x03520306
    .4byte 0x0169007a
    .4byte 0x0a000001
    .4byte 0x00000000
    .4byte 0x3c050800
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x016a007b
    .4byte 0x0a000001
    .4byte 0x00000000
    .4byte 0x3c051900
    .4byte 0x14141414
    .4byte 0x0a011414
    .4byte 0x00000000
    .4byte 0x0000000a
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_0880B90C + 0x145
    .4byte gUnknown_0880BC18 + 0x28a
    .4byte gUnknown_0880BC18 + 0x69a
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034402f8
    .4byte 0x004b097c
    .4byte 0x2800009f
    .4byte 0x0d060508
    .4byte 0x50051000
    .4byte 0x1e1c1d1d
    .4byte 0x5f031919
    .4byte 0x1819231e
    .4byte 0x00000a19
    .4byte 0x00000000
    .4byte 0x00000100
    .4byte 0x00fb0000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x16fe
    .4byte gItemData + 0x1dbb
    .4byte gUnknown_0880BC18 + 0x104
    .4byte gUnknown_0880BC18 + 0x514
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x034302f7
    .4byte 0x004a587d
    .4byte 0x2400009e
    .4byte 0x09050508
    .4byte 0x50060f04
    .4byte 0x1a1a1c1e
    .4byte 0x55031916
    .4byte 0x1514192d
    .4byte 0x00000a11
    .4byte 0x00000000
    .4byte 0x00040100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1716
    .4byte gUnknown_0880B90C + 0x41
    .4byte gUnknown_0880BC18 + 0x186
    .4byte gUnknown_0880BC18 + 0x596
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte gUnknown_0880C4BA + 0x145
    .4byte 0x032402d8
    .4byte 0x002d387e
    .4byte 0x14270074
    .4byte 0x02040305
    .4byte 0x3c050801
    .4byte 0x14141414
    .4byte 0x55031414
    .4byte 0x12202837
    .4byte 0x00022814
    .4byte 0x02020002
    .4byte 0x00000000
    .4byte 0x001f0000
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0x1722
    .4byte gItemData + 0x1dbb
    .4byte gUnknown_0880BC18 + 0x104
    .4byte gUnknown_0880BC18 + 0x514
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000
    .4byte 0x032502d9
    .4byte 0x002e397f
    .4byte 0x1129007c
    .4byte 0x03030302
    .4byte 0x3c050503
    .4byte 0x14141414
    .4byte 0x37031414
    .4byte 0x0a232837
    .4byte 0x0102281e
    .4byte 0x02020001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001f00
    .4byte gUnknown_088ADFA6 + 0x173a
    .4byte gUnknown_0880B90C + 0x104
    .4byte gUnknown_0880BC18 + 0x249
    .4byte gUnknown_0880BC18 + 0x659
    .4byte gUnknown_0880C479
    .4byte gUnknown_0880C4BA
    .4byte gUnknown_0880C4BA + 0x41
    .4byte 0x00000000

	.global gItemData
gItemData:  @ 0x08809B10
@ Replacing .incbin "baserom.gba", 0x809B10, 0x1DFC
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x04040354
    .4byte 0x00010000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x055a052e
    .4byte 0x000a1100
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x04050355
    .4byte 0x00020000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0264031e
    .4byte 0x00101105
    .4byte 0x00000101
    .4byte 0x00000001
    .4byte 0x04060356
    .4byte 0x00030000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a4b081e
    .4byte 0x00141100
    .4byte 0x0000021f
    .4byte 0x00000001
    .4byte 0x04070357
    .4byte 0x00040000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x08500d14
    .4byte 0x004b1100
    .4byte 0x000003b5
    .4byte 0x00000001
    .4byte 0x04080358
    .4byte 0x00050000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c460923
    .4byte 0x001c1100
    .4byte 0x0000041f
    .4byte 0x00000002
    .4byte 0x04090359
    .4byte 0x00060000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0e410b19
    .4byte 0x00321100
    .4byte 0x00000547
    .4byte 0x00000002
    .4byte 0x040a035a
    .4byte 0x00070000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0d3c0e0f
    .4byte 0x00781100
    .4byte 0x000006b5
    .4byte 0x00000002
    .4byte 0x040b035b
    .4byte 0x00080000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x06460328
    .4byte 0x00001100
    .4byte 0x0100071f
    .4byte 0x00000001
    .4byte 0x040c035c
    .4byte 0x00090000
    .4byte 0x00040011
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0x12
    .4byte 0x055f0728
    .4byte 0x0096110a
    .4byte 0x00000800
    .4byte 0x00000002
    .4byte 0x04ab0403
    .4byte 0x000a0000
    .4byte 0x00100011
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0x12
    .4byte 0x0350082d
    .4byte 0x00001114
    .4byte 0x00000900
    .4byte 0x00000002
    .4byte 0x040d035d
    .4byte 0x000b0000
    .4byte 0x00000021
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c4b091e
    .4byte 0x00fa1100
    .4byte 0x00000a79
    .4byte 0x00000001
    .4byte 0x040e035e
    .4byte 0x000c0000
    .4byte 0x00001001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x054b0814
    .4byte 0x003c1123
    .4byte 0x0000b21f
    .4byte 0x00000001
    .4byte 0x040f035f
    .4byte 0x000d0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x074b0914
    .4byte 0x0041111e
    .4byte 0x00000c47
    .4byte 0x00000001
    .4byte 0x04100360
    .4byte 0x000e0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0xb
    .4byte 0x0b500812
    .4byte 0x00461100
    .4byte 0x00000d1f
    .4byte 0x00000001
    .4byte 0x04110361
    .4byte 0x000f0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEF1 + 0x22
    .4byte 0x054b081e
    .4byte 0x00961100
    .4byte 0x00000e47
    .4byte 0x00000001
    .4byte 0x04120362
    .4byte 0x00100000
    .4byte 0x00000041
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x09460919
    .4byte 0x00321200
    .4byte 0x00000f47
    .4byte 0x00000001
    .4byte 0x04130363
    .4byte 0x00110000
    .4byte 0x00000041
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0b410c0f
    .4byte 0x00dc1200
    .4byte 0x020010b5
    .4byte 0x00000001
    .4byte 0x04140364
    .4byte 0x00120000
    .4byte 0x00000101
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x094b090f
    .4byte 0x00781105
    .4byte 0x00001147
    .4byte 0x00000002
    .4byte 0x04150365
    .4byte 0x00130000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0x30
    .4byte 0x0b550612
    .4byte 0x00461100
    .4byte 0x0000121f
    .4byte 0x00000001
    .4byte 0x04190369
    .4byte 0x01140000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0850072d
    .4byte 0x00081100
    .4byte 0x00001301
    .4byte 0x00000001
    .4byte 0x041a036a
    .4byte 0x01150000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0455041e
    .4byte 0x000f1105
    .4byte 0x00001401
    .4byte 0x00000001
    .4byte 0x041b036b
    .4byte 0x01160000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0d460a1e
    .4byte 0x00101100
    .4byte 0x0000151f
    .4byte 0x00000002
    .4byte 0x041c036c
    .4byte 0x01170000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a4b0e14
    .4byte 0x003c1100
    .4byte 0x000016b5
    .4byte 0x00000001
    .4byte 0x041d036d
    .4byte 0x01180000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x08410428
    .4byte 0x00001100
    .4byte 0x01001701
    .4byte 0x00000001
    .4byte 0x041e036e
    .4byte 0x01190000
    .4byte 0x00000021
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0e460a1e
    .4byte 0x00fa1100
    .4byte 0x00001879
    .4byte 0x00000001
    .4byte 0x041f036f
    .4byte 0x011a0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x09460a14
    .4byte 0x003c111e
    .4byte 0x00001947
    .4byte 0x00000001
    .4byte 0x04200370
    .4byte 0x011b0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0x30
    .4byte 0x0d460710
    .4byte 0x00411100
    .4byte 0x00001a1f
    .4byte 0x00000001
    .4byte 0x04210371
    .4byte 0x011c0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0b410614
    .4byte 0x00141200
    .4byte 0x00001b01
    .4byte 0x00000001
    .4byte 0x04220372
    .4byte 0x011d0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a460c0f
    .4byte 0x02581205
    .4byte 0x00001c79
    .4byte 0x00000001
    .4byte 0x04230373
    .4byte 0x011e0000
    .4byte 0x00000101
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0b460a0f
    .4byte 0x00821105
    .4byte 0x00001d47
    .4byte 0x00000002
    .4byte 0x042a037a
    .4byte 0x021f0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a4b082d
    .4byte 0x00061100
    .4byte 0x00001e01
    .4byte 0x00000001
    .4byte 0x042b037b
    .4byte 0x02200000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0f410b1e
    .4byte 0x000c1100
    .4byte 0x00001f01
    .4byte 0x00000002
    .4byte 0x042c037c
    .4byte 0x02210000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c460f14
    .4byte 0x00321100
    .4byte 0x000020b5
    .4byte 0x00000001
    .4byte 0x042d037d
    .4byte 0x02220000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a3c0428
    .4byte 0x00001100
    .4byte 0x0100211f
    .4byte 0x00000001
    .4byte 0x042e037e
    .4byte 0x02230000
    .4byte 0x00000021
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x10410a1e
    .4byte 0x00fa1100
    .4byte 0x00002279
    .4byte 0x00000001
    .4byte 0x042f037f
    .4byte 0x02240000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0b410b14
    .4byte 0x0032111e
    .4byte 0x00002347
    .4byte 0x00000001
    .4byte 0x04300380
    .4byte 0x02250000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0x30
    .4byte 0x0f3c0a12
    .4byte 0x002d1100
    .4byte 0x0000241f
    .4byte 0x00000001
    .4byte 0x04310381
    .4byte 0x02260000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0xb
    .4byte 0x0f370a14
    .4byte 0x00281100
    .4byte 0x0000251f
    .4byte 0x00000002
    .4byte 0x04320382
    .4byte 0x02270000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x12371214
    .4byte 0x002d1100
    .4byte 0x04002601
    .4byte 0x00000008
    .4byte 0x04330383
    .4byte 0x02280000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c3c0714
    .4byte 0x000f1200
    .4byte 0x00002701
    .4byte 0x00000001
    .4byte 0x04340384
    .4byte 0x02290000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0e410d0f
    .4byte 0x00c81200
    .4byte 0x000028b5
    .4byte 0x00000001
    .4byte 0x04350385
    .4byte 0x022a0000
    .4byte 0x00000101
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0d410b0f
    .4byte 0x008c1105
    .4byte 0x00002947
    .4byte 0x00000002
    .4byte 0x04360386
    .4byte 0x022b0000
    .4byte 0x00000101
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0x27
    .4byte 0x0d500b14
    .4byte 0x00641105
    .4byte 0x00002a47
    .4byte 0x00000001
    .4byte 0x043a038a
    .4byte 0x022c0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x05550432
    .4byte 0x00001200
    .4byte 0x0000b901
    .4byte 0x00000001
    .4byte 0x043b038b
    .4byte 0x032d0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x0555062d
    .4byte 0x000c2200
    .4byte 0x00002b01
    .4byte 0x00000001
    .4byte 0x043c038c
    .4byte 0x032e0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x0946091e
    .4byte 0x00182200
    .4byte 0x00002c1f
    .4byte 0x00000001
    .4byte 0x043d038d
    .4byte 0x032f0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x064b0d14
    .4byte 0x00502200
    .4byte 0x00002db5
    .4byte 0x00000001
    .4byte 0x043e038e
    .4byte 0x03300000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x05410428
    .4byte 0x00002200
    .4byte 0x01002e1f
    .4byte 0x00000001
    .4byte 0x043f038f
    .4byte 0x03310000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x074b0914
    .4byte 0x0046221e
    .4byte 0x00002f47
    .4byte 0x00000001
    .4byte 0x04400390
    .4byte 0x03320000
    .4byte 0x00000021
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x0c460a1e
    .4byte 0x00fa2200
    .4byte 0x00003079
    .4byte 0x00000001
    .4byte 0x04410391
    .4byte 0x03330000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x03550516
    .4byte 0x0050220a
    .4byte 0x0000311f
    .4byte 0x00000002
    .4byte 0x04420392
    .4byte 0x03340000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x0a410514
    .4byte 0x00642300
    .4byte 0x0000321f
    .4byte 0x00000001
    .4byte 0x04430393
    .4byte 0x03350000
    .4byte 0x00000081
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x143c0805
    .4byte 0x00003a00
    .4byte 0x00003301
    .4byte 0x00000004
    .4byte 0x04440394
    .4byte 0x03360000
    .4byte 0x00000081
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x143c0d05
    .4byte 0x00003f00
    .4byte 0x00003401
    .4byte 0x00000004
    .4byte 0x04450395
    .4byte 0x03370000
    .4byte 0x00000081
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x14410c05
    .4byte 0x00003a0a
    .4byte 0x00003501
    .4byte 0x00000004
    .4byte 0x045803a9
    .4byte 0x05380000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x045a0528
    .4byte 0x000e1200
    .4byte 0x00003601
    .4byte 0x00000001
    .4byte 0x045903aa
    .4byte 0x05390000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x06500823
    .4byte 0x00141205
    .4byte 0x0000371f
    .4byte 0x00000001
    .4byte 0x045a03ab
    .4byte 0x053a0000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a550a1e
    .4byte 0x00281200
    .4byte 0x00003847
    .4byte 0x00000002
    .4byte 0x045c03ad
    .4byte 0x053b0000
    .4byte 0x00000083
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x143c0c05
    .4byte 0x01f43a00
    .4byte 0x00003979
    .4byte 0x00000001
    .4byte 0x045d03ae
    .4byte 0x053c0000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c500d14
    .4byte 0x012c1200
    .4byte 0x00003ab5
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x053d0000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0b550e14
    .4byte 0x00001205
    .4byte 0x00003bfb
    .4byte 0x00000001
    .4byte 0x045e03af
    .4byte 0x053e0000
    .4byte 0x00000013
    .4byte gUnknown_088ADFA6 + 0xf1e
    .4byte gUnknown_088ADF39
    .4byte 0x0d5a121e
    .4byte 0x0000120a
    .4byte 0x00003cfb
    .4byte 0x00000001
    .4byte 0x045f03b0
    .4byte 0x063f0000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x065f0423
    .4byte 0x00121205
    .4byte 0x00003d01
    .4byte 0x00000001
    .4byte 0x046003b1
    .4byte 0x06400000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x085a061e
    .4byte 0x001e1208
    .4byte 0x00003e1f
    .4byte 0x00000002
    .4byte 0x046103b2
    .4byte 0x06410000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c550819
    .4byte 0x0064120a
    .4byte 0x00003f47
    .4byte 0x00000001
    .4byte 0x046203b3
    .4byte 0x06420000
    .4byte 0x00000083
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x144b0a05
    .4byte 0x02583a05
    .4byte 0x00004079
    .4byte 0x00000003
    .4byte 0x046303b4
    .4byte 0x06430000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0f550c14
    .4byte 0x0190120f
    .4byte 0x000041b5
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x06440000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte gUnknown_088ADEF1 + 0x22
    .4byte 0x0a550614
    .4byte 0x00c81200
    .4byte 0x00004279
    .4byte 0x00000003
    .4byte 0x046503b6
    .4byte 0x07450000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0850072d
    .4byte 0x00141200
    .4byte 0x0000431f
    .4byte 0x00000001
    .4byte 0x046603b7
    .4byte 0x07460000
    .4byte 0x00020003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c32001e
    .4byte 0x008c120a
    .4byte 0x00004447
    .4byte 0x00000001
    .4byte 0x046703b8
    .4byte 0x07470000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0e460a14
    .4byte 0x00a01200
    .4byte 0x02004547
    .4byte 0x00000001
    .4byte 0x046803b9
    .4byte 0x07480000
    .4byte 0x00000083
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c1eff05
    .4byte 0x03203a00
    .4byte 0x03004679
    .4byte 0x00000008
    .4byte 0x046903ba
    .4byte 0x07490000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x12460f14
    .4byte 0x01c21200
    .4byte 0x000047b5
    .4byte 0x00000001
    .4byte 0x046a03bb
    .4byte 0x074a0000
    .4byte 0x00000013
    .4byte gUnknown_088ADFA6 + 0xf2a
    .4byte 0x00000000
    .4byte 0x1450171e
    .4byte 0x00001200
    .4byte 0x0000bcfb
    .4byte 0x00000003
    .4byte 0x047103c2
    .4byte 0x044b04af
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0264001e
    .4byte 0x00141100
    .4byte 0x00014901
    .4byte 0x00000002
    .4byte 0x047203c3
    .4byte 0x044c04b0
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x04640014
    .4byte 0x00321100
    .4byte 0x00024a1f
    .4byte 0x00000003
    .4byte 0x047303c4
    .4byte 0x044d04b1
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0664000f
    .4byte 0x00961100
    .4byte 0x00034b47
    .4byte 0x00000003
    .4byte 0x047403c5
    .4byte 0x044e04b2
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0564000f
    .4byte 0x00fa1000
    .4byte 0x00044c79
    .4byte 0x00000003
    .4byte 0x047503c6
    .4byte 0x044f04b3
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x07640008
    .4byte 0x03e81000
    .4byte 0x00054db5
    .4byte 0x00000005
    .4byte 0x047603c7
    .4byte 0x045004b4
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0464000a
    .4byte 0x00c81100
    .4byte 0x00064e47
    .4byte 0x00000003
    .4byte 0x047703c8
    .4byte 0x045104b5
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x07460003
    .4byte 0x01901000
    .4byte 0x00074f79
    .4byte 0x00000005
    .4byte 0x047803c9
    .4byte 0x045204b6
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x08410003
    .4byte 0x01f41000
    .4byte 0x00085079
    .4byte 0x00000005
    .4byte 0x047903ca
    .4byte 0x045304b7
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x083c0003
    .4byte 0x02581000
    .4byte 0x00095179
    .4byte 0x00000005
    .4byte 0x047a03cb
    .4byte 0x045404b8
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x05640005
    .4byte 0x05dc1100
    .4byte 0x000a52b5
    .4byte 0x00000007
    .4byte 0x047b03cc
    .4byte 0x045504b9
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x06640003
    .4byte 0x02581000
    .4byte 0x000b5379
    .4byte 0x00000007
    .4byte 0x047c03cd
    .4byte 0x045604ba
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0564000a
    .4byte 0x00641000
    .4byte 0x000c541f
    .4byte 0x00000005
    .4byte 0x047d03ce
    .4byte 0x045704bb
    .4byte 0x00000204
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x07640003
    .4byte 0x02581100
    .4byte 0x000d5547
    .4byte 0x00000008
    .4byte 0x047e03cf
    .4byte 0x045804bc
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0764000a
    .4byte 0x00961200
    .4byte 0x000e561f
    .4byte 0x00000005
    .4byte 0x047f03d0
    .4byte 0x045904bd
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0464000f
    .4byte 0x00961100
    .4byte 0x000f5747
    .4byte 0x00000004
    .4byte 0x04370387
    .4byte 0x025a0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEF1 + 0x22
    .4byte 0x0b3c0c1e
    .4byte 0x00961100
    .4byte 0x00005847
    .4byte 0x00000001
    .4byte 0x048303d4
    .4byte 0x095b04c1
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf36
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00105900
    .4byte 0x00000000
    .4byte 0x048403d5
    .4byte 0x095c04c2
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf42
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00115a00
    .4byte 0x00000000
    .4byte 0x048503d6
    .4byte 0x095d04c3
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf4e
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00125b00
    .4byte 0x00000000
    .4byte 0x048603d7
    .4byte 0x095e04c4
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf5a
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00135c00
    .4byte 0x00000000
    .4byte 0x048703d8
    .4byte 0x095f04c5
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf66
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00145d00
    .4byte 0x00000000
    .4byte 0x048803d9
    .4byte 0x096004c6
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf72
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00155e00
    .4byte 0x00000000
    .4byte 0x048903da
    .4byte 0x096104c7
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf7e
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00165f00
    .4byte 0x00000000
    .4byte 0x048a03db
    .4byte 0x096204c8
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf8a
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00176000
    .4byte 0x00000000
    .4byte 0x048b03dc
    .4byte 0x096304c9
    .4byte 0x00000000
    .4byte gUnknown_088ADFA6 + 0xf96
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x1f401100
    .4byte 0x00186100
    .4byte 0x00000000
    .4byte 0x048c03dd
    .4byte 0x096404ca
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x27101100
    .4byte 0x00196200
    .4byte 0x00000000
    .4byte 0x048d03de
    .4byte 0x096504cb
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x27101100
    .4byte 0x001a6300
    .4byte 0x00000000
    .4byte 0x048e03df
    .4byte 0x096604cc
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x27101100
    .4byte 0x001b6400
    .4byte 0x00000000
    .4byte 0x048f03e0
    .4byte 0x096704cd
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x27101100
    .4byte 0x001c6500
    .4byte 0x00000000
    .4byte 0x049003e1
    .4byte 0x096804ce
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x27101100
    .4byte 0x001d6600
    .4byte 0x00000000
    .4byte 0x049103e2
    .4byte 0x096904cf
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x012c1100
    .4byte 0x001e6700
    .4byte 0x00000000
    .4byte 0x049203e3
    .4byte 0x096a04d0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00321100
    .4byte 0x001f6800
    .4byte 0x00000000
    .4byte 0x049303e4
    .4byte 0x096b04d1
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000f
    .4byte 0x00501100
    .4byte 0x00206900
    .4byte 0x00000000
    .4byte 0x049403e5
    .4byte 0x096c04d2
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000003
    .4byte 0x00641100
    .4byte 0x00216a00
    .4byte 0x00000000
    .4byte 0x049503e6
    .4byte 0x096d04d3
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000003
    .4byte 0x03e81100
    .4byte 0x00226b00
    .4byte 0x00000000
    .4byte 0x049603e7
    .4byte 0x096e04d4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000003
    .4byte 0x012c1100
    .4byte 0x00236c00
    .4byte 0x00000000
    .4byte 0x049703e8
    .4byte 0x096f04d5
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000003
    .4byte 0x00961100
    .4byte 0x00246d00
    .4byte 0x00000000
    .4byte 0x049803e9
    .4byte 0x097004d6
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte 0x00641100
    .4byte 0x00256e00
    .4byte 0x00000000
    .4byte 0x049903ea
    .4byte 0x097104d7
    .4byte 0x00004008
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x27101100
    .4byte 0x0000da00
    .4byte 0x00000000
    .4byte 0x049a03eb
    .4byte 0x097204d8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x17701100
    .4byte 0x00008400
    .4byte 0x00000000
    .4byte 0x049b03ec
    .4byte 0x097304d9
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x0fa01100
    .4byte 0x00008500
    .4byte 0x00000000
    .4byte 0x049e03ef
    .4byte 0x09740000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x4e201100
    .4byte 0x00008600
    .4byte 0x00000000
    .4byte 0x049f03f0
    .4byte 0x09750000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x27101100
    .4byte 0x00008700
    .4byte 0x00000000
    .4byte 0x04a003f1
    .4byte 0x09760000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x13881100
    .4byte 0x00008800
    .4byte 0x00000000
    .4byte 0x04a103f2
    .4byte 0x097704da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00001100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04240374
    .4byte 0x01780000
    .4byte 0x00080011
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0x12
    .4byte 0x08500a2d
    .4byte 0x00a0110a
    .4byte 0x0000b300
    .4byte 0x00000002
    .4byte 0x049103e2
    .4byte 0x097904cf
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte 0x012c1100
    .4byte 0x00266700
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x097a0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x01f41100
    .4byte 0x00278c00
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x097b0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x03201100
    .4byte 0x00288d00
    .4byte 0x00000000
    .4byte 0x04a403f3
    .4byte 0x097c04dd
    .4byte 0x00008008
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x13881100
    .4byte 0x0000db00
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x0c7d0000
    .4byte 0x00000200
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000f
    .4byte 0x00001100
    .4byte 0x00298f00
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x0c7e0000
    .4byte 0x00000200
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000f
    .4byte 0x00001100
    .4byte 0x002a9000
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x0c7f0000
    .4byte 0x00000200
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000f
    .4byte 0x00001100
    .4byte 0x002b9100
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x0c800000
    .4byte 0x00000200
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000000f
    .4byte 0x00001100
    .4byte 0x002c9200
    .4byte 0x00000000
    .4byte 0x045403a4
    .4byte 0x00810000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF39
    .4byte 0x055a053c
    .4byte 0x00001105
    .4byte 0x00009301
    .4byte 0x00000001
    .4byte 0x045503a5
    .4byte 0x01820000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF39
    .4byte 0x0850073c
    .4byte 0x00001105
    .4byte 0x00009401
    .4byte 0x00000001
    .4byte 0x045603a6
    .4byte 0x02830000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADF39
    .4byte 0x0a4b083c
    .4byte 0x00001105
    .4byte 0x00009501
    .4byte 0x00000001
    .4byte 0x045703a7
    .4byte 0x03840000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEF1
    .4byte 0x0555063c
    .4byte 0x00002205
    .4byte 0x00009601
    .4byte 0x00000001
    .4byte 0x04160366
    .4byte 0x00850000
    .4byte 0x00040011
    .4byte gUnknown_088ADFA6 + 0xfa2
    .4byte gUnknown_088ADF39
    .4byte 0x095a101e
    .4byte 0x00001100
    .4byte 0x0000b000
    .4byte 0x00000001
    .4byte 0x04390388
    .4byte 0x02860000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0f3c0d14
    .4byte 0x00321105
    .4byte 0x0000b879
    .4byte 0x00000001
    .4byte 0x046403b5
    .4byte 0x06870000
    .4byte 0x00000013
    .4byte gUnknown_088ADFA6 + 0xfae
    .4byte gUnknown_088ADF39
    .4byte 0x0a5a111e
    .4byte 0x00001205
    .4byte 0x0000bbfb
    .4byte 0x00000001
    .4byte 0x04a503f4
    .4byte 0x098804de
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x4e201100
    .4byte 0x002dd900
    .4byte 0x00000000
    .4byte 0x04a603f5
    .4byte 0x098904df
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00001100
    .4byte 0x002edc00
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x098a0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x4e201100
    .4byte 0x002f9c00
    .4byte 0x00000000
    .4byte 0x044d039d
    .4byte 0x0b8b0000
    .4byte 0x00000409
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0e410e00
    .4byte 0x00001100
    .4byte 0x0000d000
    .4byte 0x00000000
    .4byte 0x048003d1
    .4byte 0x048c04be
    .4byte 0x00000014
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x05640003
    .4byte 0x0000ff00
    .4byte 0x0000c3fb
    .4byte 0x00000001
    .4byte 0x04270377
    .4byte 0x018d0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEF1 + 0x22
    .4byte 0x08460298 + 0x786
    .4byte 0x00961100
    .4byte 0x0000b647
    .4byte 0x00000001
    .4byte 0x04260376
    .4byte 0x018e0000
    .4byte 0x00000011
    .4byte gUnknown_088ADFA6 + 0xfba
    .4byte gUnknown_088ADF39
    .4byte 0x0b550f1e
    .4byte 0x00001100
    .4byte 0x0000b5fb
    .4byte 0x00000001
    .4byte 0x046b03bc
    .4byte 0x078f0000
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x125f1900
    .4byte 0x00001200
    .4byte 0x0000bdfb
    .4byte 0x00000001
    .4byte 0x04470397
    .4byte 0x0b9004ac
    .4byte 0x00020409
    .4byte gUnknown_088ADFA6 + 0xfc6
    .4byte 0x00000000
    .4byte 0x00640a00
    .4byte 0x00001200
    .4byte 0x000079b5
    .4byte 0x00000000
    .4byte 0x04170367
    .4byte 0x00910000
    .4byte 0x00000011
    .4byte gUnknown_088ADFA6 + 0xfd2
    .4byte gUnknown_088ADF39
    .4byte 0x0955121e
    .4byte 0x00001100
    .4byte 0x0000b1fb
    .4byte 0x00000001
    .4byte 0x04250375
    .4byte 0x01920000
    .4byte 0x00080011
    .4byte gUnknown_088ADFA6 + 0xfde
    .4byte gUnknown_088ADF39
    .4byte 0x0b50111e
    .4byte 0x00001100
    .4byte 0x0000b400
    .4byte 0x00000001
    .4byte 0x04380389
    .4byte 0x02930000
    .4byte 0x00000011
    .4byte gUnknown_088ADFA6 + 0xfea
    .4byte gUnknown_088ADF39
    .4byte 0x0d4b141e
    .4byte 0x00001100
    .4byte 0x0000b7fb
    .4byte 0x00000001
    .4byte 0x04460396
    .4byte 0x03940000
    .4byte 0x00000011
    .4byte gUnknown_088ADFA6 + 0xff6
    .4byte gUnknown_088ADEF1
    .4byte 0x0750121e
    .4byte 0x00002200
    .4byte 0x0000bafb
    .4byte 0x00000001
    .4byte 0x04280378
    .4byte 0x01950000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte gUnknown_088ADEB0 + 0xb
    .4byte 0x0e460910
    .4byte 0x004b1100
    .4byte 0x0000a71f
    .4byte 0x00000001
    .4byte 0x04290379
    .4byte 0x01960000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c3c0912
    .4byte 0x00321200
    .4byte 0x0000a847
    .4byte 0x00000001
    .4byte 0x04a703f6
    .4byte 0x099704e0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x27101100
    .4byte 0x0030a900
    .4byte 0x00000000
    .4byte 0x04a803f7
    .4byte 0x099804e1
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00001100
    .4byte 0x0031d800
    .4byte 0x00000000
    .4byte 0x04a903f8
    .4byte 0x099904e2
    .4byte 0x00000010
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00001100
    .4byte 0x0032d700
    .4byte 0x00000000
    .4byte 0x04a103f9
    .4byte 0x099a04da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00011100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04a103fa
    .4byte 0x099b04da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00051100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04a103fb
    .4byte 0x099c04da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x000a1100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04a103fc
    .4byte 0x099d04da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00321100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04a103fd
    .4byte 0x099e04da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00641100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04a10400
    .4byte 0x099f04da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x0bb81100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04a10401
    .4byte 0x09a004da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x13881100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04180368
    .4byte 0x00a10000
    .4byte 0x00000041
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x09460928
    .4byte 0x00c81200
    .4byte 0x0000aa79
    .4byte 0x00000001
    .4byte 0x049403e5
    .4byte 0x09a204d2
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000003c
    .4byte 0x00641100
    .4byte 0x00336a00
    .4byte 0x00000000
    .4byte 0x049403e5
    .4byte 0x09a304d2
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000003c
    .4byte 0x00641100
    .4byte 0x0034ab00
    .4byte 0x00000000
    .4byte 0x049403e5
    .4byte 0x09a404d2
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000003c
    .4byte 0x00641100
    .4byte 0x0035ac00
    .4byte 0x00000000
    .4byte 0x048103d2
    .4byte 0x0ca504bf
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x044c039c
    .4byte 0x04a60000
    .4byte 0x00000004
    .4byte gUnknown_088ADFA6 + 0x1002
    .4byte 0x00000000
    .4byte 0x08460001
    .4byte 0x00001300
    .4byte 0x0000c700
    .4byte 0x00000000
    .4byte 0x04490399
    .4byte 0x0ba704ae
    .4byte 0x00000409
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00410a00
    .4byte 0x00001100
    .4byte 0x00008800
    .4byte 0x00000000
    .4byte 0x044a039a
    .4byte 0x0ba80000
    .4byte 0x00000409
    .4byte gUnknown_088ADFA6 + 0x100e
    .4byte 0x00000000
    .4byte 0x003c0f00
    .4byte 0x00001300
    .4byte 0x0000c500
    .4byte 0x00000000
    .4byte 0x044b039b
    .4byte 0x0ba90000
    .4byte 0x00000409
    .4byte gUnknown_088ADFA6 + 0x101a
    .4byte 0x00000000
    .4byte 0x00550f00
    .4byte 0x0000110a
    .4byte 0x0000c600
    .4byte 0x00000000
    .4byte 0x04480398
    .4byte 0x0baa04ad
    .4byte 0x00000411
    .4byte gUnknown_088ADFA6 + 0x1026
    .4byte gUnknown_088ADF39
    .4byte 0x00641032
    .4byte 0x0000110f
    .4byte 0x0000c400
    .4byte 0x00000000
    .4byte 0x046f03c0
    .4byte 0x07ab0000
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a500b00
    .4byte 0x00001200
    .4byte 0x0000c100
    .4byte 0x00000000
    .4byte 0x047003c1
    .4byte 0x07ac0000
    .4byte 0x00000083
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x14460d05
    .4byte 0x00003a05
    .4byte 0x0000c200
    .4byte 0x00000000
    .4byte 0x044e039e
    .4byte 0x0bad0000
    .4byte 0x00000409
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x08500700
    .4byte 0x00001100
    .4byte 0x0000d100
    .4byte 0x00000000
    .4byte 0x044f039f
    .4byte 0x0bae0000
    .4byte 0x00000409
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a4b0c00
    .4byte 0x00001100
    .4byte 0x0000d200
    .4byte 0x00000000
    .4byte 0x045003a0
    .4byte 0x0baf0000
    .4byte 0x00000409
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a410600
    .4byte 0x00001100
    .4byte 0x0100d300
    .4byte 0x00000000
    .4byte 0x045103a1
    .4byte 0x0bb00000
    .4byte 0x00000409
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0c3c0a00
    .4byte 0x00001100
    .4byte 0x0100d400
    .4byte 0x00000000
    .4byte 0x045203a2
    .4byte 0x0bb10000
    .4byte 0x00000409
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x055a0500
    .4byte 0x00001100
    .4byte 0x0000d500
    .4byte 0x00000000
    .4byte 0x045303a3
    .4byte 0x0bb20000
    .4byte 0x00000409
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x08500d00
    .4byte 0x00001100
    .4byte 0x0000d600
    .4byte 0x00000000
    .4byte 0x046d03be
    .4byte 0x07b30000
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x06550700
    .4byte 0x00001200
    .4byte 0x0000be00
    .4byte 0x00000000
    .4byte 0x046e03bf
    .4byte 0x07b40000
    .4byte 0x0000000b
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0d460e00
    .4byte 0x00001205
    .4byte 0x0000bf00
    .4byte 0x00000000
    .4byte 0x046c03bd
    .4byte 0x07b50000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x08410005
    .4byte 0x00001300
    .4byte 0x0500c000
    .4byte 0x00000005
    .4byte 0x045b03ac
    .4byte 0x05b60000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte gUnknown_088ADF2A
    .4byte 0x02550814
    .4byte 0x00371200
    .4byte 0x00003579
    .4byte 0x00000001
    .4byte 0x04aa0402
    .4byte 0x09b704e3
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00001100
    .4byte 0x0036dd00
    .4byte 0x00000000
    .4byte 0x04a103fe
    .4byte 0x09b804da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00961100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x04a103ff
    .4byte 0x09b904da
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00c81100
    .4byte 0x00008900
    .4byte 0x00000000
    .4byte 0x049d03ee
    .4byte 0x09ba0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x75301100
    .4byte 0x0000c800
    .4byte 0x00000000
    .4byte 0x049c03ed
    .4byte 0x09bb0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x9c401100
    .4byte 0x0000c900
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x00bc0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x02bd0000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x07be0000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a500b00
    .4byte 0x00001200
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x07bf0000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a500b00
    .4byte 0x00001200
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x00c00000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x09c10000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x00c20000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x01c30000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x02c40000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a500b00
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x02c50000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a500b00
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x00c60000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x03c70000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a500b00
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x01c80000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001100
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x06c90000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a500b00
    .4byte 0x00001200
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x07ca0000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001200
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x07cb0000
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001200
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x04ab0403
    .4byte 0x09cc0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00001100
    .4byte 0x00009d00
    .4byte 0x00000000
    .4byte 0x04ab0403
    .4byte 0x0ccd0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00001200
    .4byte 0x00000000
    .4byte 0x00000001
@ Looks like items stop here probably
    .4byte 0x010101ff
    .4byte 0x010101ff
    .4byte 0x01020101
    .4byte 0x0201ff02
    .4byte 0x01ff0405
    .4byte 0x01ffffff
    .4byte 0xffffff01
    .4byte 0x01ff0201
    .4byte 0x01ff0101
    .4byte 0x02ff0201
    .4byte 0x01010202
    .4byte 0x01ff01ff
    .4byte 0xffffff01
    .4byte 0x01ffff01
    .4byte 0xffffff01
    .4byte 0xff01ffff
    .4byte 0x0101ffff
    .4byte 0x0101ff01
    .4byte 0x02010101
    .4byte 0x01ff0201
    .4byte 0xff04ff02
    .4byte 0xffffff01
    .4byte 0xffff0101
    .4byte 0xff0201ff
    .4byte 0xff010101
    .4byte 0xff020101
    .4byte 0x01020202
    .4byte 0xff01ff01
    .4byte 0xffff0101
    .4byte 0xffff01ff
    .4byte 0xffff0101
    .4byte 0x01ffffff
    .4byte 0x01ffffff
    .4byte 0x01ff0101
    .4byte 0x01010101
    .4byte 0xff020102
    .4byte 0xffff0301
    .4byte 0xffff01ff
    .4byte 0xff0101ff
    .4byte 0x0201ffff
    .4byte 0x010101ff
    .4byte 0x020101ff
    .4byte 0x020202ff
    .4byte 0x01ff0101
    .4byte 0xff0101ff
    .4byte 0xff01ffff
    .4byte 0xff0101ff
    .4byte 0xffffffff
    .4byte 0xffffff01
    .4byte 0xff010101
    .4byte 0x01010101
    .4byte 0x02010201
    .4byte 0xff0301ff
    .4byte 0xff01ff03
    .4byte 0x0101ffff
    .4byte 0x01ffffff
    .4byte 0x0101ff02
    .4byte 0x0101ff01
    .4byte 0x0202ff02
    .4byte 0xff010102
    .4byte 0x0101ff01
    .4byte 0x01ffffff
    .4byte 0x0101ffff
    .4byte 0xffffffff
    .4byte 0xffff01ff

	.global gUnknown_0880B90C
gUnknown_0880B90C:  @ 0x0880B90C
	.incbin "baserom.gba", 0x80B90C, 0x28A

	.global gUnknown_0880BB96
gUnknown_0880BB96:  @ 0x0880BB96
	.incbin "baserom.gba", 0x80BB96, 0x82

	.global gUnknown_0880BC18
gUnknown_0880BC18:  @ 0x0880BC18
	.incbin "baserom.gba", 0x80BC18, 0x861

	.global gUnknown_0880C479
gUnknown_0880C479:  @ 0x0880C479
	.incbin "baserom.gba", 0x80C479, 0x41

	.global gUnknown_0880C4BA
gUnknown_0880C4BA:  @ 0x0880C4BA
	.incbin "baserom.gba", 0x80C4BA, 0x28A

	.global gUnknown_0880C744
gUnknown_0880C744:  @ 0x0880C744
	.incbin "baserom.gba", 0x80C744, 0x41

	.global gUnknown_0880C785
gUnknown_0880C785:  @ 0x0880C785
	.incbin "baserom.gba", 0x80C785, 0x41

	.global gUnknown_0880C7C6
gUnknown_0880C7C6:  @ 0x0880C7C6
	.incbin "baserom.gba", 0x80C7C6, 0x41

	.global gUnknown_0880C807
gUnknown_0880C807:  @ 0x0880C807
	.incbin "baserom.gba", 0x80C807, 0x41

	.global gUnknown_0880C848
gUnknown_0880C848:  @ 0x0880C848
	.incbin "baserom.gba", 0x80C848, 0x41

	.global gUnknown_0880C889
gUnknown_0880C889:  @ 0x0880C889
	.incbin "baserom.gba", 0x80C889, 0x41

	.global gUnknown_0880C8CA
gUnknown_0880C8CA:  @ 0x0880C8CA
	.incbin "baserom.gba", 0x80C8CA, 0x41

	.global gUnknown_0880C90B
gUnknown_0880C90B:  @ 0x0880C90B
	.incbin "baserom.gba", 0x80C90B, 0x41

	.global gUnknown_0880C94C
gUnknown_0880C94C:  @ 0x0880C94C
	.incbin "baserom.gba", 0x80C94C, 0x41

	.global gUnknown_0880C98D
gUnknown_0880C98D:  @ 0x0880C98D
	.incbin "baserom.gba", 0x80C98D, 0x41

	.global gUnknown_0880C9CE
gUnknown_0880C9CE:  @ 0x0880C9CE
	.incbin "baserom.gba", 0x80C9CE, 0x41

	.global gUnknown_0880CA0F
gUnknown_0880CA0F:  @ 0x0880CA0F
	.incbin "baserom.gba", 0x80CA0F, 0x41

	.global gUnknown_0880CA50
gUnknown_0880CA50:  @ 0x0880CA50
	.incbin "baserom.gba", 0x80CA50, 0x41

	.global gUnknown_0880CA91
gUnknown_0880CA91:  @ 0x0880CA91
	.incbin "baserom.gba", 0x80CA91, 0x41

	.global gUnknown_0880CAD2
gUnknown_0880CAD2:  @ 0x0880CAD2
	.incbin "baserom.gba", 0x80CAD2, 0x41

	.global gUnknown_0880CB13
gUnknown_0880CB13:  @ 0x0880CB13
	.incbin "baserom.gba", 0x80CB13, 0x41

	.global gUnknown_0880CB54
gUnknown_0880CB54:  @ 0x0880CB54
	.incbin "baserom.gba", 0x80CB54, 0x41

	.global gUnknown_0880CB95
gUnknown_0880CB95:  @ 0x0880CB95
	.incbin "baserom.gba", 0x80CB95, 0x41

	.global gUnknown_0880CBD6
gUnknown_0880CBD6:  @ 0x0880CBD6
	.incbin "baserom.gba", 0x80CBD6, 0x41

	.global gUnknown_0880CC17
gUnknown_0880CC17:  @ 0x0880CC17
	.incbin "baserom.gba", 0x80CC17, 0x41

	.global gUnknown_0880CC58
gUnknown_0880CC58:  @ 0x0880CC58
	.incbin "baserom.gba", 0x80CC58, 0x41

	.global gUnknown_0880CC99
gUnknown_0880CC99:  @ 0x0880CC99
	.incbin "baserom.gba", 0x80CC99, 0x41

	.global gUnknown_0880CCDA
gUnknown_0880CCDA:  @ 0x0880CCDA
	.incbin "baserom.gba", 0x80CCDA, 0x41

	.global gUnknown_0880CD1B
gUnknown_0880CD1B:  @ 0x0880CD1B
	.incbin "baserom.gba", 0x80CD1B, 0x41

	.global gUnknown_0880CD5C
gUnknown_0880CD5C:  @ 0x0880CD5C
	.incbin "baserom.gba", 0x80CD5C, 0x41

	.global gUnknown_0880CD9D
gUnknown_0880CD9D:  @ 0x0880CD9D
	.incbin "baserom.gba", 0x80CD9D, 0x41

	.global gUnknown_0880CDDE
gUnknown_0880CDDE:  @ 0x0880CDDE
	.incbin "baserom.gba", 0x80CDDE, 0x41

	.global gUnknown_0880CE1F
gUnknown_0880CE1F:  @ 0x0880CE1F
	.incbin "baserom.gba", 0x80CE1F, 0x41

	.global gUnknown_0880CE60
gUnknown_0880CE60:  @ 0x0880CE60
	.incbin "baserom.gba", 0x80CE60, 0x41

	.global gUnknown_0880CEA1
gUnknown_0880CEA1:  @ 0x0880CEA1
	.incbin "baserom.gba", 0x80CEA1, 0x41

	.global gUnknown_0880CEE2
gUnknown_0880CEE2:  @ 0x0880CEE2
	.incbin "baserom.gba", 0x80CEE2, 0x41

	.global gUnknown_0880CF23
gUnknown_0880CF23:  @ 0x0880CF23
	.incbin "baserom.gba", 0x80CF23, 0x41

	.global gUnknown_0880CF64
gUnknown_0880CF64:  @ 0x0880CF64
	.incbin "baserom.gba", 0x80CF64, 0x41

	.global gUnknown_0880CFA5
gUnknown_0880CFA5:  @ 0x0880CFA5
	.incbin "baserom.gba", 0x80CFA5, 0x41

	.global gUnknown_0880CFE6
gUnknown_0880CFE6:  @ 0x0880CFE6
	.incbin "baserom.gba", 0x80CFE6, 0x41

	.global gUnknown_0880D027
gUnknown_0880D027:  @ 0x0880D027
	.incbin "baserom.gba", 0x80D027, 0x41

	.global gUnknown_0880D068
gUnknown_0880D068:  @ 0x0880D068
	.incbin "baserom.gba", 0x80D068, 0x41

	.global gUnknown_0880D0A9
gUnknown_0880D0A9:  @ 0x0880D0A9
	.incbin "baserom.gba", 0x80D0A9, 0x41

	.global gUnknown_0880D0EA
gUnknown_0880D0EA:  @ 0x0880D0EA
	.incbin "baserom.gba", 0x80D0EA, 0x41

	.global gUnknown_0880D12B
gUnknown_0880D12B:  @ 0x0880D12B
	.incbin "baserom.gba", 0x80D12B, 0x41

	.global gUnknown_0880D16C
gUnknown_0880D16C:  @ 0x0880D16C
	.incbin "baserom.gba", 0x80D16C, 0x41

	.global gUnknown_0880D1AD
gUnknown_0880D1AD:  @ 0x0880D1AD
	.incbin "baserom.gba", 0x80D1AD, 0x41

	.global gUnknown_0880D1EE
gUnknown_0880D1EE:  @ 0x0880D1EE
	.incbin "baserom.gba", 0x80D1EE, 0x41

	.global gUnknown_0880D22F
gUnknown_0880D22F:  @ 0x0880D22F
	.incbin "baserom.gba", 0x80D22F, 0x145

	.global gUnknown_0880D374
gUnknown_0880D374:  @ 0x0880D374
	.incbin "baserom.gba", 0x80D374, 0x84
