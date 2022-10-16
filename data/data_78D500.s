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
