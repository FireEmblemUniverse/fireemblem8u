    .section .data

	.global Img_EfxDracoZombie
Img_EfxDracoZombie:  @ 0x0878D648
	.incbin "baserom.gba", 0x78D648, 0x3940

	.global Tsa_EfxDracoZombieBaseLeft
Tsa_EfxDracoZombieBaseLeft:  @ 0x08790F88
	.incbin "baserom.gba", 0x790F88, 0x1D4

	.global Tsa_EfxDracoZombieBaseRight
Tsa_EfxDracoZombieBaseRight:  @ 0x0879115C
	.incbin "baserom.gba", 0x79115C, 0x1E0

	.global Tsa_EfxDracoZombie2
Tsa_EfxDracoZombie2:
    .incbin "baserom.gba", 0x79133C, 0x1E4

	.global Tsa_EfxDracoZombie3
Tsa_EfxDracoZombie3:
    .incbin "baserom.gba", 0x791520, 0x218

	.global Tsa_EfxDracoZombie4
Tsa_EfxDracoZombie4:
    .incbin "baserom.gba", 0x791738, 0x210

	.global Tsa_EfxDracoZombie5
Tsa_EfxDracoZombie5:
    .incbin "baserom.gba", 0x791948, 0x1F4

	.global Tsa_EfxDracoZombie1
Tsa_EfxDracoZombie1:
    .incbin "baserom.gba", 0x791B3C, 0x220

	.global Pal_EfxDracoZombie
Pal_EfxDracoZombie:  @ 0x08791D5C
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
