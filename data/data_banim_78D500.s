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

	.global Pal_08791D7C
Pal_08791D7C:  @ 0x08791D7C
	.incbin "baserom.gba", 0x791D7C, 0x20

	.global Img_08791D9C
Img_08791D9C:  @ 0x08791D9C
	.incbin "baserom.gba", 0x791D9C, 0x3F8

	.global Pal_08792194
Pal_08792194:  @ 0x08792194
	.incbin "baserom.gba", 0x792194, 0x794

	.global BanimScr_08792928
BanimScr_08792928:  @ 0x08792928
@ Replacing .incbin "baserom.gba", 0x792928, 0x30
    .4byte 0x10000000 + Pal_08792194 + 0x20
    .4byte 0x10000000 + Pal_08792194 + 0x38
    .4byte 0x10000000 + Pal_08792194 + 0x5C
    .4byte 0x10000000 + Pal_08792194 + 0x8C
    .4byte 0x10000000 + Pal_08792194 + 0xBC
    .4byte 0x10000000 + Pal_08792194 + 0xEC
    .4byte 0x10000000 + Pal_08792194 + 0x110
    .4byte 0x10000000 + Pal_08792194 + 0x134
    .4byte 0x10000000 + Pal_08792194 + 0x158
    .4byte 0x10000000 + Pal_08792194 + 0x170
    .4byte Pal_08792194 + 0x789
    .4byte 0x80000000

	.global BanimScr_08792958
BanimScr_08792958:  @ 0x08792958
@ Replacing .incbin "baserom.gba", 0x792958, 0x30
    .4byte 0x10000000 + Pal_08792194 + 0x188
    .4byte 0x10000000 + Pal_08792194 + 0x1a0
    .4byte 0x10000000 + Pal_08792194 + 0x1c4
    .4byte 0x10000000 + Pal_08792194 + 0x1f4
    .4byte 0x10000000 + Pal_08792194 + 0x230
    .4byte 0x10000000 + Pal_08792194 + 0x26c
    .4byte 0x10000000 + Pal_08792194 + 0x2a8
    .4byte 0x10000000 + Pal_08792194 + 0x2e4
    .4byte 0x10000000 + Pal_08792194 + 0x314
    .4byte 0x10000000 + Pal_08792194 + 0x338
    .4byte Pal_08792194 + 0x789
    .4byte 0x80000000

	.global BanimScr_08792988
BanimScr_08792988:  @ 0x08792988
@ Replacing .incbin "baserom.gba", 0x792988, 0x12564
    .4byte 0x10000000 + Pal_08792194 + 0x350
    .4byte 0x10000000 + Pal_08792194 + 0x3bc
    .4byte 0x10000000 + Pal_08792194 + 0x428
    .4byte 0x10000000 + Pal_08792194 + 0x494
    .4byte 0x10000000 + Pal_08792194 + 0x500
    .4byte 0x10000000 + Pal_08792194 + 0x56c
    .4byte 0x10000000 + Pal_08792194 + 0x5d8
    .4byte 0x10000000 + Pal_08792194 + 0x644
    .4byte 0x10000000 + Pal_08792194 + 0x6b0
    .4byte 0x10000000 + Pal_08792194 + 0x71c
    .4byte Pal_08792194 + 0x789
    .4byte 0x80000000

	.global Img_87929B8
Img_87929B8:
	.incbin "baserom.gba", 0x7929B8, 0x7932CC - 0x7929B8

	.global Pal_87932CC
Pal_87932CC:
	.incbin "baserom.gba", 0x7932CC, 0x7932EC - 0x7932CC

	.global Tsa_87932EC
Tsa_87932EC:
	.incbin "baserom.gba", 0x7932EC, 0x793384 - 0x7932EC

	.global Tsa_8793384
Tsa_8793384:
	.incbin "baserom.gba", 0x793384, 0x793494 - 0x793384

	.global Tsa_8793494
Tsa_8793494:
	.incbin "baserom.gba", 0x793494, 0x7935B0 - 0x793494

	.global Tsa_87935B0
Tsa_87935B0:
	.incbin "baserom.gba", 0x7935B0, 0x7936C0 - 0x7935B0

	.global Tsa_87936C0
Tsa_87936C0:
	.incbin "baserom.gba", 0x7936C0, 0x7937D0 - 0x7936C0

	.global Tsa_87937D0
Tsa_87937D0:
	.incbin "baserom.gba", 0x7937D0, 0x7938EC - 0x7937D0

	.global Tsa_87938EC
Tsa_87938EC:
	.incbin "baserom.gba", 0x7938EC, 0x7939FC - 0x7938EC

	.global Img_87939FC
Img_87939FC:
	.incbin "baserom.gba", 0x7939FC, 0x794628 - 0x7939FC

	.global Img_8794628
Img_8794628:
	.incbin "baserom.gba", 0x794628, 0x7951D8 - 0x794628

	.global Img_87951D8
Img_87951D8:
	.incbin "baserom.gba", 0x7951D8, 0x795DF4 - 0x7951D8

	.global Img_8795DF4
Img_8795DF4:
	.incbin "baserom.gba", 0x795DF4, 0x7969F4 - 0x795DF4

	.global Img_87969F4
Img_87969F4:
	.incbin "baserom.gba", 0x7969F4, 0x7970DC - 0x7969F4

	.global Img_87970DC
Img_87970DC:
	.incbin "baserom.gba", 0x7970DC, 0x797AC4 - 0x7970DC

	.global Img_8797AC4
Img_8797AC4:
	.incbin "baserom.gba", 0x797AC4, 0x798394 - 0x797AC4

	.global Img_8798394
Img_8798394:
	.incbin "baserom.gba", 0x798394, 0x798B6C - 0x798394

	.global Img_8798B6C
Img_8798B6C:
	.incbin "baserom.gba", 0x798B6C, 0x799228 - 0x798B6C

	.global Img_8799228
Img_8799228:
	.incbin "baserom.gba", 0x799228, 0x7997F8 - 0x799228

	.global Pal_87997F8
Pal_87997F8:
	.incbin "baserom.gba", 0x7997F8, 0x799818 - 0x7997F8

	.global Tsa_8799818
Tsa_8799818:
	.incbin "baserom.gba", 0x799818, 0x799ABC - 0x799818

	.global Tsa_8799ABC
Tsa_8799ABC:
	.incbin "baserom.gba", 0x799ABC, 0x799D64 - 0x799ABC

	.global Tsa_8799D64
Tsa_8799D64:
	.incbin "baserom.gba", 0x799D64, 0x79A008 - 0x799D64

	.global Tsa_879A008
Tsa_879A008:
	.incbin "baserom.gba", 0x79A008, 0x79A2A8 - 0x79A008

	.global Tsa_879A2A8
Tsa_879A2A8:
	.incbin "baserom.gba", 0x79A2A8, 0x79A444 - 0x79A2A8

	.global Tsa_879A444
Tsa_879A444:
	.incbin "baserom.gba", 0x79A444, 0x79A6A0 - 0x79A444

	.global Tsa_879A6A0
Tsa_879A6A0:
	.incbin "baserom.gba", 0x79A6A0, 0x79A87C - 0x79A6A0

	.global Tsa_879A87C
Tsa_879A87C:
	.incbin "baserom.gba", 0x79A87C, 0x79A9E8 - 0x79A87C

	.global Tsa_879A9E8
Tsa_879A9E8:
	.incbin "baserom.gba", 0x79A9E8, 0x79AB10 - 0x79A9E8

	.global Tsa_879AB10
Tsa_879AB10:
	.incbin "baserom.gba", 0x79AB10, 0x79AC08 - 0x79AB10

	.global Img_879AC08
Img_879AC08:
	.incbin "baserom.gba", 0x79AC08, 0x79B168 - 0x79AC08

	.global Img_879B168
Img_879B168:
	.incbin "baserom.gba", 0x79B168, 0x79B8F4 - 0x79B168

	.global Img_879B8F4
Img_879B8F4:
	.incbin "baserom.gba", 0x79B8F4, 0x79C1E4 - 0x79B8F4

	.global Img_879C1E4
Img_879C1E4:
	.incbin "baserom.gba", 0x79C1E4, 0x79CAB4 - 0x79C1E4

	.global Img_879CAB4
Img_879CAB4:
	.incbin "baserom.gba", 0x79CAB4, 0x79D1F8 - 0x79CAB4

	.global Img_879D1F8
Img_879D1F8:
	.incbin "baserom.gba", 0x79D1F8, 0x79DC10 - 0x79D1F8

	.global Img_879DC10
Img_879DC10:
	.incbin "baserom.gba", 0x79DC10, 0x79E5DC - 0x79DC10

	.global Img_879E5DC
Img_879E5DC:
	.incbin "baserom.gba", 0x79E5DC, 0x79EED0 - 0x79E5DC

	.global Img_879EED0
Img_879EED0:
	.incbin "baserom.gba", 0x79EED0, 0x79F698 - 0x79EED0

	.global Img_879F698
Img_879F698:
	.incbin "baserom.gba", 0x79F698, 0x79FD3C - 0x79F698

	.global Img_879FD3C
Img_879FD3C:
	.incbin "baserom.gba", 0x79FD3C, 0x7A0338 - 0x79FD3C

	.global Img_87A0338
Img_87A0338:
	.incbin "baserom.gba", 0x7A0338, 0x7A090C - 0x7A0338

	.global Img_87A090C
Img_87A090C:
	.incbin "baserom.gba", 0x7A090C, 0x7A0E78 - 0x7A090C

	.global Img_87A0E78
Img_87A0E78:
	.incbin "baserom.gba", 0x7A0E78, 0x7A13C0 - 0x7A0E78

	.global Img_87A13C0
Img_87A13C0:
	.incbin "baserom.gba", 0x7A13C0, 0x7A18D0 - 0x7A13C0

	.global Pal_87A18D0
Pal_87A18D0:
	.incbin "baserom.gba", 0x7A18D0, 0x7A18F0 - 0x7A18D0

	.global Tsa_87A18F0
Tsa_87A18F0:
	.incbin "baserom.gba", 0x7A18F0, 0x7A19EC - 0x7A18F0

	.global Tsa_87A19EC
Tsa_87A19EC:
	.incbin "baserom.gba", 0x7A19EC, 0x7A1B68 - 0x7A19EC

	.global Tsa_87A1B68
Tsa_87A1B68:
	.incbin "baserom.gba", 0x7A1B68, 0x7A1D74 - 0x7A1B68

	.global Tsa_87A1D74
Tsa_87A1D74:
	.incbin "baserom.gba", 0x7A1D74, 0x7A1F9C - 0x7A1D74

	.global Tsa_87A1F9C
Tsa_87A1F9C:
	.incbin "baserom.gba", 0x7A1F9C, 0x7A2134 - 0x7A1F9C

	.global Tsa_87A2134
Tsa_87A2134:
	.incbin "baserom.gba", 0x7A2134, 0x7A2384 - 0x7A2134

	.global Tsa_87A2384
Tsa_87A2384:
	.incbin "baserom.gba", 0x7A2384, 0x7A2584 - 0x7A2384

	.global Tsa_87A2584
Tsa_87A2584:
	.incbin "baserom.gba", 0x7A2584, 0x7A2748 - 0x7A2584

	.global Tsa_87A2748
Tsa_87A2748:
	.incbin "baserom.gba", 0x7A2748, 0x7A28A8 - 0x7A2748

	.global Tsa_87A28A8
Tsa_87A28A8:
	.incbin "baserom.gba", 0x7A28A8, 0x7A29DC - 0x7A28A8

	.global Tsa_87A29DC
Tsa_87A29DC:
	.incbin "baserom.gba", 0x7A29DC, 0x7A2AE8 - 0x7A29DC

	.global Tsa_87A2AE8
Tsa_87A2AE8:
	.incbin "baserom.gba", 0x7A2AE8, 0x7A2BE4 - 0x7A2AE8

	.global Tsa_87A2BE4
Tsa_87A2BE4:
	.incbin "baserom.gba", 0x7A2BE4, 0x7A2CCC - 0x7A2BE4

	.global Tsa_87A2CCC
Tsa_87A2CCC:
	.incbin "baserom.gba", 0x7A2CCC, 0x7A2DB8 - 0x7A2CCC

	.global Tsa_87A2DB8
Tsa_87A2DB8:
	.incbin "baserom.gba", 0x7A2DB8, 0x7A2EA0 - 0x7A2DB8

	.global Img_87A2EA0
Img_87A2EA0:
	.incbin "baserom.gba", 0x7A2EA0, 0x7A3400 - 0x7A2EA0

	.global Img_87A3400
Img_87A3400:
	.incbin "baserom.gba", 0x7A3400, 0x7A39A0 - 0x7A3400

	.global Img_87A39A0
Img_87A39A0:
	.incbin "baserom.gba", 0x7A39A0, 0x7A3F38 - 0x7A39A0

	.global Img_87A3F38
Img_87A3F38:
	.incbin "baserom.gba", 0x7A3F38, 0x7A44D8 - 0x7A3F38

	.global Img_87A44D8
Img_87A44D8:
	.incbin "baserom.gba", 0x7A44D8, 0x7A4A68 - 0x7A44D8

	.global Pal_87A4A68
Pal_87A4A68:
	.incbin "baserom.gba", 0x7A4A68, 0x7A4A88 - 0x7A4A68

	.global Tsa_87A4A88
Tsa_87A4A88:
	.incbin "baserom.gba", 0x7A4A88, 0x7A4B68 - 0x7A4A88

	.global Tsa_87A4B68
Tsa_87A4B68:
	.incbin "baserom.gba", 0x7A4B68, 0x7A4C44 - 0x7A4B68

	.global Tsa_87A4C44
Tsa_87A4C44:
	.incbin "baserom.gba", 0x7A4C44, 0x7A4D2C - 0x7A4C44

	.global Tsa_87A4D2C
Tsa_87A4D2C:
	.incbin "baserom.gba", 0x7A4D2C, 0x7A4E0C - 0x7A4D2C

	.global Tsa_87A4E0C
Tsa_87A4E0C:
	.incbin "baserom.gba", 0x7A4E0C, 0x7A4EEC - 0x7A4E0C

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

	.global BanimScr_DemoKingTunkFace
BanimScr_DemoKingTunkFace:  @ 0x087F4184
    .4byte gUnknown_087F3C54 + 0x3ee
    .4byte 0x70000000 + gUnknown_087F3C54 + 0x4a3
    .4byte 0x8400010d
    .4byte 0x80000000

	.global gUnknown_087F4194
gUnknown_087F4194:  @ 0x087F4194
	.incbin "baserom.gba", 0x7F4194, 0x180

	.global BanimScr_087F4314
BanimScr_087F4314:  @ 0x087F4314
    .4byte gUnknown_087F4194 + 0x2
    .4byte 0x70000000 + gUnknown_087F4194 + 0xc3
    .4byte 0x840001d5
    .4byte 0x80000000
