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

	.global Img_DemonLightSprites_EyeFlash
Img_DemonLightSprites_EyeFlash:  @ 0x087A4EEC
	.incbin "baserom.gba", 0x7A4EEC, 0x22C

	.global Pal_DemonLightSprites_EyeFlash
Pal_DemonLightSprites_EyeFlash:  @ 0x087A5118
	.incbin "baserom.gba", 0x7A5118, 0x128

	.global gUnknown_087A5240
gUnknown_087A5240:  @ 0x087A5240
	.incbin "baserom.gba", 0x7A5240, 0x12C    @ 0x7A536C - 0x7A5240

	.global gUnknown_087A536C
gUnknown_087A536C:  @ 0x087A536C
	.incbin "baserom.gba", 0x7A536C, 0x24    @ 0x7A5390 - 0x7A536C

	.global Img_DemonLightSprites
Img_DemonLightSprites:  @ 0x087A5390
	.incbin "baserom.gba", 0x7A5390, 0x3BC

	.global Pal_DemonLightSprites
Pal_DemonLightSprites:  @ 0x087A574C
	.incbin "baserom.gba", 0x7A574C, 0x1f4

	.global gUnknown_087A5940
gUnknown_087A5940:  @ 0x087A5940
    .4byte Pal_DemonLightSprites + 0x22
    .4byte Pal_DemonLightSprites + 0x6a
    .4byte Pal_DemonLightSprites + 0x22
    .4byte Pal_DemonLightSprites + 0x6a
    .4byte Pal_DemonLightSprites + 0x112
    .4byte 0x81000000

	.global gUnknown_087A5958
gUnknown_087A5958:  @ 0x087A5958
    .4byte Pal_DemonLightSprites + 0xe2
    .4byte Pal_DemonLightSprites + 0x11e
    .4byte Pal_DemonLightSprites + 0x142
    .4byte Pal_DemonLightSprites + 0x166
    .4byte Pal_DemonLightSprites + 0x112
    .4byte 0x81000000

	.global gUnknown_087A5970
gUnknown_087A5970:  @ 0x087A5970
    .4byte Pal_DemonLightSprites + 0xfa
    .4byte Pal_DemonLightSprites + 0x18a
    .4byte Pal_DemonLightSprites + 0x1ae
    .4byte Pal_DemonLightSprites + 0x1d2
    .4byte Pal_DemonLightSprites + 0x112
    .4byte 0x81000000

	.global gUnknown_087A5988
gUnknown_087A5988:  @ 0x087A5988
    .incbin "baserom.gba", 0x7A5988, 0x1d4

	.global gUnknown_087A5B5C
gUnknown_087A5B5C:  @ 0x087A5B5C
	.incbin "baserom.gba", 0x7A5B5C, 0x18    @ 0x7A5B74 - 0x7A5B5C

	.global gUnknown_087A5B74
gUnknown_087A5B74:  @ 0x087A5B74
	.incbin "baserom.gba", 0x7A5B74, 0x18    @ 0x7A5B8C - 0x7A5B74

	.global gUnknown_087A5B8C
gUnknown_087A5B8C:  @ 0x087A5B8C
	.incbin "baserom.gba", 0x7A5B8C, 0x18    @ 0x7A5BA4 - 0x7A5B8C

	.global Img_DemonLightSprites_087A5BA4
Img_DemonLightSprites_087A5BA4:  @ 0x087A5BA4
	.incbin "baserom.gba", 0x7A5BA4, 0x2F8

	.global Img_DemonLightSprites_087A5E9C
Img_DemonLightSprites_087A5E9C:  @ 0x087A5E9C
	.incbin "baserom.gba", 0x7A5E9C, 0x350

	.global Pal_DemonLightSprites_087A61EC
Pal_DemonLightSprites_087A61EC:  @ 0x087A61EC
	.incbin "baserom.gba", 0x7A61EC, 0x488

	.global gUnknown_087A6674
gUnknown_087A6674:  @ 0x087A6674
	.incbin "baserom.gba", 0x7A6674, 0x478    @ 0x7A6AEC - 0x7A6674

	.global gUnknown_087A6AEC
gUnknown_087A6AEC:  @ 0x087A6AEC
	.incbin "baserom.gba", 0x7A6AEC, 0x478    @ 0x7A6F64 - 0x7A6AEC

	.global gUnknown_087A6F64
gUnknown_087A6F64:  @ 0x087A6F64
	.incbin "baserom.gba", 0x7A6F64, 0x47C    @ 0x7A73E0 - 0x7A6F64

	.global gUnknown_087A73E0
gUnknown_087A73E0:  @ 0x087A73E0
	.incbin "baserom.gba", 0x7A73E0, 0x14    @ 0x7A73F4 - 0x7A73E0

	.global Img_087A73F4
Img_087A73F4:  @ 0x087A73F4
	.incbin "baserom.gba", 0x7A73F4, 0xB44    @ 0x7A7F38 - 0x7A73F4

	.global Img_087A7F38
Img_087A7F38:  @ 0x087A7F38
	.incbin "baserom.gba", 0x7A7F38, 0xB3C    @ 0x7A8A74 - 0x7A7F38

	.global Img_087A8A74
Img_087A8A74:  @ 0x087A8A74
	.incbin "baserom.gba", 0x7A8A74, 0xB24    @ 0x7A9598 - 0x7A8A74

	.global Img_087A9598
Img_087A9598:  @ 0x087A9598
	.incbin "baserom.gba", 0x7A9598, 0xA94    @ 0x7AA02C - 0x7A9598

	.global Img_087AA02C
Img_087AA02C:  @ 0x087AA02C
	.incbin "baserom.gba", 0x7AA02C, 0xA7C    @ 0x7AAAA8 - 0x7AA02C

	.global Img_087AAAA8
Img_087AAAA8:  @ 0x087AAAA8
	.incbin "baserom.gba", 0x7AAAA8, 0xAB0    @ 0x7AB558 - 0x7AAAA8

	.global Img_087AB558
Img_087AB558:  @ 0x087AB558
	.incbin "baserom.gba", 0x7AB558, 0xA98    @ 0x7ABFF0 - 0x7AB558

	.global Img_087ABFF0
Img_087ABFF0:  @ 0x087ABFF0
	.incbin "baserom.gba", 0x7ABFF0, 0xAD8    @ 0x7ACAC8 - 0x7ABFF0

	.global Img_087ACAC8
Img_087ACAC8:  @ 0x087ACAC8
	.incbin "baserom.gba", 0x7ACAC8, 0xA84    @ 0x7AD54C - 0x7ACAC8

	.global Img_087AD54C
Img_087AD54C:  @ 0x087AD54C
	.incbin "baserom.gba", 0x7AD54C, 0xAA0    @ 0x7ADFEC - 0x7AD54C

	.global Img_087ADFEC
Img_087ADFEC:  @ 0x087ADFEC
	.incbin "baserom.gba", 0x7ADFEC, 0xA88    @ 0x7AEA74 - 0x7ADFEC

	.global Img_087AEA74
Img_087AEA74:  @ 0x087AEA74
	.incbin "baserom.gba", 0x7AEA74, 0xAA4    @ 0x7AF518 - 0x7AEA74

	.global Img_087AF518
Img_087AF518:  @ 0x087AF518
	.incbin "baserom.gba", 0x7AF518, 0xB58    @ 0x7B0070 - 0x7AF518

	.global Img_087B0070
Img_087B0070:  @ 0x087B0070
	.incbin "baserom.gba", 0x7B0070, 0xB90    @ 0x7B0C00 - 0x7B0070

	.global Img_087B0C00
Img_087B0C00:  @ 0x087B0C00
	.incbin "baserom.gba", 0x7B0C00, 0xB28    @ 0x7B1728 - 0x7B0C00

	.global Img_087B1728
Img_087B1728:  @ 0x087B1728
	.incbin "baserom.gba", 0x7B1728, 0xB08    @ 0x7B2230 - 0x7B1728

	.global Pal_087B2230
Pal_087B2230:  @ 0x087B2230
	.incbin "baserom.gba", 0x7B2230, 0x20    @ 0x7B2250 - 0x7B2230

	.global Pal_087B2250
Pal_087B2250:  @ 0x087B2250
	.incbin "baserom.gba", 0x7B2250, 0x20    @ 0x7B2270 - 0x7B2250

	.global Pal_087B2270
Pal_087B2270:  @ 0x087B2270
	.incbin "baserom.gba", 0x7B2270, 0x20    @ 0x7B2290 - 0x7B2270

	.global Pal_087B2290
Pal_087B2290:  @ 0x087B2290
	.incbin "baserom.gba", 0x7B2290, 0x20    @ 0x7B22B0 - 0x7B2290

	.global Pal_087B22B0
Pal_087B22B0:  @ 0x087B22B0
	.incbin "baserom.gba", 0x7B22B0, 0x20    @ 0x7B22D0 - 0x7B22B0

	.global Pal_087B22D0
Pal_087B22D0:  @ 0x087B22D0
	.incbin "baserom.gba", 0x7B22D0, 0x20    @ 0x7B22F0 - 0x7B22D0

	.global Pal_087B22F0
Pal_087B22F0:  @ 0x087B22F0
	.incbin "baserom.gba", 0x7B22F0, 0x20    @ 0x7B2310 - 0x7B22F0

	.global Pal_087B2310
Pal_087B2310:  @ 0x087B2310
	.incbin "baserom.gba", 0x7B2310, 0x20    @ 0x7B2330 - 0x7B2310

	.global Pal_087B2330
Pal_087B2330:  @ 0x087B2330
	.incbin "baserom.gba", 0x7B2330, 0x20    @ 0x7B2350 - 0x7B2330

	.global Pal_087B2350
Pal_087B2350:  @ 0x087B2350
	.incbin "baserom.gba", 0x7B2350, 0x20    @ 0x7B2370 - 0x7B2350

	.global Pal_087B2370
Pal_087B2370:  @ 0x087B2370
	.incbin "baserom.gba", 0x7B2370, 0x20    @ 0x7B2390 - 0x7B2370

	.global Pal_087B2390
Pal_087B2390:  @ 0x087B2390
	.incbin "baserom.gba", 0x7B2390, 0x20    @ 0x7B23B0 - 0x7B2390

	.global Pal_087B23B0
Pal_087B23B0:  @ 0x087B23B0
	.incbin "baserom.gba", 0x7B23B0, 0x20    @ 0x7B23D0 - 0x7B23B0

	.global Pal_087B23D0
Pal_087B23D0:  @ 0x087B23D0
	.incbin "baserom.gba", 0x7B23D0, 0x20    @ 0x7B23F0 - 0x7B23D0

	.global Pal_087B23F0
Pal_087B23F0:  @ 0x087B23F0
	.incbin "baserom.gba", 0x7B23F0, 0x20    @ 0x7B2410 - 0x7B23F0

	.global Pal_087B2410
Pal_087B2410:  @ 0x087B2410
	.incbin "baserom.gba", 0x7B2410, 0x20    @ 0x7B2430 - 0x7B2410

	.global Tsa_087B2430
Tsa_087B2430:  @ 0x087B2430
	.incbin "baserom.gba", 0x7B2430, 0x274    @ 0x7B26A4 - 0x7B2430

	.global Tsa_087B26A4
Tsa_087B26A4:  @ 0x087B26A4
	.incbin "baserom.gba", 0x7B26A4, 0x278    @ 0x7B291C - 0x7B26A4

	.global Tsa_087B291C
Tsa_087B291C:  @ 0x087B291C
	.incbin "baserom.gba", 0x7B291C, 0x274    @ 0x7B2B90 - 0x7B291C

	.global Tsa_087B2B90
Tsa_087B2B90:  @ 0x087B2B90
	.incbin "baserom.gba", 0x7B2B90, 0x274    @ 0x7B2E04 - 0x7B2B90

	.global Tsa_087B2E04
Tsa_087B2E04:  @ 0x087B2E04
	.incbin "baserom.gba", 0x7B2E04, 0x278    @ 0x7B307C - 0x7B2E04

	.global Tsa_087B307C
Tsa_087B307C:  @ 0x087B307C
	.incbin "baserom.gba", 0x7B307C, 0x274    @ 0x7B32F0 - 0x7B307C

	.global Tsa_087B32F0
Tsa_087B32F0:  @ 0x087B32F0
	.incbin "baserom.gba", 0x7B32F0, 0x278    @ 0x7B3568 - 0x7B32F0

	.global Tsa_087B3568
Tsa_087B3568:  @ 0x087B3568
	.incbin "baserom.gba", 0x7B3568, 0x274    @ 0x7B37DC - 0x7B3568

	.global Tsa_087B37DC
Tsa_087B37DC:  @ 0x087B37DC
	.incbin "baserom.gba", 0x7B37DC, 0x278    @ 0x7B3A54 - 0x7B37DC

	.global Tsa_087B3A54
Tsa_087B3A54:  @ 0x087B3A54
	.incbin "baserom.gba", 0x7B3A54, 0x274    @ 0x7B3CC8 - 0x7B3A54

	.global Tsa_087B3CC8
Tsa_087B3CC8:  @ 0x087B3CC8
	.incbin "baserom.gba", 0x7B3CC8, 0x278    @ 0x7B3F40 - 0x7B3CC8

	.global Tsa_087B3F40
Tsa_087B3F40:  @ 0x087B3F40
	.incbin "baserom.gba", 0x7B3F40, 0x274    @ 0x7B41B4 - 0x7B3F40

	.global Tsa_087B41B4
Tsa_087B41B4:  @ 0x087B41B4
	.incbin "baserom.gba", 0x7B41B4, 0x274    @ 0x7B4428 - 0x7B41B4

	.global Tsa_087B4428
Tsa_087B4428:  @ 0x087B4428
	.incbin "baserom.gba", 0x7B4428, 0x278    @ 0x7B46A0 - 0x7B4428

	.global Tsa_087B46A0
Tsa_087B46A0:  @ 0x087B46A0
	.incbin "baserom.gba", 0x7B46A0, 0x274    @ 0x7B4914 - 0x7B46A0

	.global Tsa_087B4914
Tsa_087B4914:  @ 0x087B4914
	.incbin "baserom.gba", 0x7B4914, 0x274    @ 0x7B4B88 - 0x7B4914

	.global Img_087B4B88
Img_087B4B88:  @ 0x087B4B88
	.incbin "baserom.gba", 0x7B4B88, 0xAF0    @ 0x7B5678 - 0x7B4B88

	.global Img_087B5678
Img_087B5678:  @ 0x087B5678
	.incbin "baserom.gba", 0x7B5678, 0xB20    @ 0x7B6198 - 0x7B5678

	.global Img_087B6198
Img_087B6198:  @ 0x087B6198
	.incbin "baserom.gba", 0x7B6198, 0xBBC    @ 0x7B6D54 - 0x7B6198

	.global Img_087B6D54
Img_087B6D54:  @ 0x087B6D54
	.incbin "baserom.gba", 0x7B6D54, 0xD98    @ 0x7B7AEC - 0x7B6D54

	.global Img_087B7AEC
Img_087B7AEC:  @ 0x087B7AEC
	.incbin "baserom.gba", 0x7B7AEC, 0xE7C    @ 0x7B8968 - 0x7B7AEC

	.global Img_087B8968
Img_087B8968:  @ 0x087B8968
	.incbin "baserom.gba", 0x7B8968, 0xF94    @ 0x7B98FC - 0x7B8968

	.global Img_087B98FC
Img_087B98FC:  @ 0x087B98FC
	.incbin "baserom.gba", 0x7B98FC, 0x1014    @ 0x7BA910 - 0x7B98FC

	.global Img_087BA910
Img_087BA910:  @ 0x087BA910
	.incbin "baserom.gba", 0x7BA910, 0x1194    @ 0x7BBAA4 - 0x7BA910

	.global Img_087BBAA4
Img_087BBAA4:  @ 0x087BBAA4
	.incbin "baserom.gba", 0x7BBAA4, 0x1234    @ 0x7BCCD8 - 0x7BBAA4

	.global Img_087BCCD8
Img_087BCCD8:  @ 0x087BCCD8
	.incbin "baserom.gba", 0x7BCCD8, 0x1234    @ 0x7BDF0C - 0x7BCCD8

	.global Img_087BDF0C
Img_087BDF0C:  @ 0x087BDF0C
	.incbin "baserom.gba", 0x7BDF0C, 0x1150    @ 0x7BF05C - 0x7BDF0C

	.global Img_087BF05C
Img_087BF05C:  @ 0x087BF05C
	.incbin "baserom.gba", 0x7BF05C, 0xE98    @ 0x7BFEF4 - 0x7BF05C

	.global Img_087BFEF4
Img_087BFEF4:  @ 0x087BFEF4
	.incbin "baserom.gba", 0x7BFEF4, 0xB24    @ 0x7C0A18 - 0x7BFEF4

	.global Img_087C0A18
Img_087C0A18:  @ 0x087C0A18
	.incbin "baserom.gba", 0x7C0A18, 0xBCC    @ 0x7C15E4 - 0x7C0A18

	.global Img_087C15E4
Img_087C15E4:  @ 0x087C15E4
	.incbin "baserom.gba", 0x7C15E4, 0xD24    @ 0x7C2308 - 0x7C15E4

	.global Img_087C2308
Img_087C2308:  @ 0x087C2308
	.incbin "baserom.gba", 0x7C2308, 0xA2C    @ 0x7C2D34 - 0x7C2308

	.global Pal_087C2D34
Pal_087C2D34:  @ 0x087C2D34
	.incbin "baserom.gba", 0x7C2D34, 0x20    @ 0x7C2D54 - 0x7C2D34

	.global Pal_087C2D54
Pal_087C2D54:  @ 0x087C2D54
	.incbin "baserom.gba", 0x7C2D54, 0x20    @ 0x7C2D74 - 0x7C2D54

	.global Pal_087C2D74
Pal_087C2D74:  @ 0x087C2D74
	.incbin "baserom.gba", 0x7C2D74, 0x20    @ 0x7C2D94 - 0x7C2D74

	.global Pal_087C2D94
Pal_087C2D94:  @ 0x087C2D94
	.incbin "baserom.gba", 0x7C2D94, 0x20    @ 0x7C2DB4 - 0x7C2D94

	.global Pal_087C2DB4
Pal_087C2DB4:  @ 0x087C2DB4
	.incbin "baserom.gba", 0x7C2DB4, 0x20    @ 0x7C2DD4 - 0x7C2DB4

	.global Pal_087C2DD4
Pal_087C2DD4:  @ 0x087C2DD4
	.incbin "baserom.gba", 0x7C2DD4, 0x20    @ 0x7C2DF4 - 0x7C2DD4

	.global Pal_087C2DF4
Pal_087C2DF4:  @ 0x087C2DF4
	.incbin "baserom.gba", 0x7C2DF4, 0x20    @ 0x7C2E14 - 0x7C2DF4

	.global Pal_087C2E14
Pal_087C2E14:  @ 0x087C2E14
	.incbin "baserom.gba", 0x7C2E14, 0x20    @ 0x7C2E34 - 0x7C2E14

	.global Pal_087C2E34
Pal_087C2E34:  @ 0x087C2E34
	.incbin "baserom.gba", 0x7C2E34, 0x20    @ 0x7C2E54 - 0x7C2E34

	.global Pal_087C2E54
Pal_087C2E54:  @ 0x087C2E54
	.incbin "baserom.gba", 0x7C2E54, 0x20    @ 0x7C2E74 - 0x7C2E54

	.global Pal_087C2E74
Pal_087C2E74:  @ 0x087C2E74
	.incbin "baserom.gba", 0x7C2E74, 0x20    @ 0x7C2E94 - 0x7C2E74

	.global Pal_087C2E94
Pal_087C2E94:  @ 0x087C2E94
	.incbin "baserom.gba", 0x7C2E94, 0x20    @ 0x7C2EB4 - 0x7C2E94

	.global Pal_087C2EB4
Pal_087C2EB4:  @ 0x087C2EB4
	.incbin "baserom.gba", 0x7C2EB4, 0x20    @ 0x7C2ED4 - 0x7C2EB4

	.global Pal_087C2ED4
Pal_087C2ED4:  @ 0x087C2ED4
	.incbin "baserom.gba", 0x7C2ED4, 0x20    @ 0x7C2EF4 - 0x7C2ED4

	.global Pal_087C2EF4
Pal_087C2EF4:  @ 0x087C2EF4
	.incbin "baserom.gba", 0x7C2EF4, 0x20    @ 0x7C2F14 - 0x7C2EF4

	.global Pal_087C2F14
Pal_087C2F14:  @ 0x087C2F14
	.incbin "baserom.gba", 0x7C2F14, 0x20    @ 0x7C2F34 - 0x7C2F14

	.global Tsa_087C2F34
Tsa_087C2F34:  @ 0x087C2F34
	.incbin "baserom.gba", 0x7C2F34, 0x270    @ 0x7C31A4 - 0x7C2F34

	.global Tsa_087C31A4
Tsa_087C31A4:  @ 0x087C31A4
	.incbin "baserom.gba", 0x7C31A4, 0x278    @ 0x7C341C - 0x7C31A4

	.global Tsa_087C341C
Tsa_087C341C:  @ 0x087C341C
	.incbin "baserom.gba", 0x7C341C, 0x278    @ 0x7C3694 - 0x7C341C

	.global Tsa_087C3694
Tsa_087C3694:  @ 0x087C3694
	.incbin "baserom.gba", 0x7C3694, 0x25C    @ 0x7C38F0 - 0x7C3694

	.global Tsa_087C38F0
Tsa_087C38F0:  @ 0x087C38F0
	.incbin "baserom.gba", 0x7C38F0, 0x248    @ 0x7C3B38 - 0x7C38F0

	.global Tsa_087C3B38
Tsa_087C3B38:  @ 0x087C3B38
	.incbin "baserom.gba", 0x7C3B38, 0x23C    @ 0x7C3D74 - 0x7C3B38

	.global Tsa_087C3D74
Tsa_087C3D74:  @ 0x087C3D74
	.incbin "baserom.gba", 0x7C3D74, 0x234    @ 0x7C3FA8 - 0x7C3D74

	.global Tsa_087C3FA8
Tsa_087C3FA8:  @ 0x087C3FA8
	.incbin "baserom.gba", 0x7C3FA8, 0x238    @ 0x7C41E0 - 0x7C3FA8

	.global Tsa_087C41E0
Tsa_087C41E0:  @ 0x087C41E0
	.incbin "baserom.gba", 0x7C41E0, 0x240    @ 0x7C4420 - 0x7C41E0

	.global Tsa_087C4420
Tsa_087C4420:  @ 0x087C4420
	.incbin "baserom.gba", 0x7C4420, 0x240    @ 0x7C4660 - 0x7C4420

	.global Tsa_087C4660
Tsa_087C4660:  @ 0x087C4660
	.incbin "baserom.gba", 0x7C4660, 0x24C    @ 0x7C48AC - 0x7C4660

	.global Tsa_087C48AC
Tsa_087C48AC:  @ 0x087C48AC
	.incbin "baserom.gba", 0x7C48AC, 0x244    @ 0x7C4AF0 - 0x7C48AC

	.global Tsa_087C4AF0
Tsa_087C4AF0:  @ 0x087C4AF0
	.incbin "baserom.gba", 0x7C4AF0, 0x1B0    @ 0x7C4CA0 - 0x7C4AF0

	.global Tsa_087C4CA0
Tsa_087C4CA0:  @ 0x087C4CA0
	.incbin "baserom.gba", 0x7C4CA0, 0x1C4    @ 0x7C4E64 - 0x7C4CA0

	.global Tsa_087C4E64
Tsa_087C4E64:  @ 0x087C4E64
	.incbin "baserom.gba", 0x7C4E64, 0x1D0    @ 0x7C5034 - 0x7C4E64

	.global Tsa_087C5034
Tsa_087C5034:  @ 0x087C5034
	.incbin "baserom.gba", 0x7C5034, 0x15C    @ 0x7C5190 - 0x7C5034

	.global Img_087C5190
Img_087C5190:  @ 0x087C5190
	.incbin "baserom.gba", 0x7C5190, 0x554    @ 0x7C56E4 - 0x7C5190

	.global Img_087C56E4
Img_087C56E4:  @ 0x087C56E4
	.incbin "baserom.gba", 0x7C56E4, 0xAB8    @ 0x7C619C - 0x7C56E4

	.global Img_087C619C
Img_087C619C:  @ 0x087C619C
	.incbin "baserom.gba", 0x7C619C, 0xB58    @ 0x7C6CF4 - 0x7C619C

	.global Img_087C6CF4
Img_087C6CF4:  @ 0x087C6CF4
	.incbin "baserom.gba", 0x7C6CF4, 0x984    @ 0x7C7678 - 0x7C6CF4

	.global Img_087C7678
Img_087C7678:  @ 0x087C7678
	.incbin "baserom.gba", 0x7C7678, 0xA94    @ 0x7C810C - 0x7C7678

	.global Img_087C810C
Img_087C810C:  @ 0x087C810C
	.incbin "baserom.gba", 0x7C810C, 0x5B0    @ 0x7C86BC - 0x7C810C

	.global Img_087C86BC
Img_087C86BC:  @ 0x087C86BC
	.incbin "baserom.gba", 0x7C86BC, 0x5C4    @ 0x7C8C80 - 0x7C86BC

	.global Img_087C8C80
Img_087C8C80:  @ 0x087C8C80
	.incbin "baserom.gba", 0x7C8C80, 0x610    @ 0x7C9290 - 0x7C8C80

	.global Pal_087C9290
Pal_087C9290:  @ 0x087C9290
	.incbin "baserom.gba", 0x7C9290, 0x20    @ 0x7C92B0 - 0x7C9290

	.global Pal_087C92B0
Pal_087C92B0:  @ 0x087C92B0
	.incbin "baserom.gba", 0x7C92B0, 0x20    @ 0x7C92D0 - 0x7C92B0

	.global Pal_087C92D0
Pal_087C92D0:  @ 0x087C92D0
	.incbin "baserom.gba", 0x7C92D0, 0x20    @ 0x7C92F0 - 0x7C92D0

	.global Pal_087C92F0
Pal_087C92F0:  @ 0x087C92F0
	.incbin "baserom.gba", 0x7C92F0, 0x20    @ 0x7C9310 - 0x7C92F0

	.global Pal_087C9310
Pal_087C9310:  @ 0x087C9310
	.incbin "baserom.gba", 0x7C9310, 0x20    @ 0x7C9330 - 0x7C9310

	.global Pal_087C9330
Pal_087C9330:  @ 0x087C9330
	.incbin "baserom.gba", 0x7C9330, 0x20    @ 0x7C9350 - 0x7C9330

	.global Pal_087C9350
Pal_087C9350:  @ 0x087C9350
	.incbin "baserom.gba", 0x7C9350, 0x20    @ 0x7C9370 - 0x7C9350

	.global Pal_087C9370
Pal_087C9370:  @ 0x087C9370
	.incbin "baserom.gba", 0x7C9370, 0x20    @ 0x7C9390 - 0x7C9370

	.global Tsa_087C9390
Tsa_087C9390:  @ 0x087C9390
	.incbin "baserom.gba", 0x7C9390, 0xD4    @ 0x7C9464 - 0x7C9390

	.global Tsa_087C9464
Tsa_087C9464:  @ 0x087C9464
	.incbin "baserom.gba", 0x7C9464, 0x19C    @ 0x7C9600 - 0x7C9464

	.global Tsa_087C9600
Tsa_087C9600:  @ 0x087C9600
	.incbin "baserom.gba", 0x7C9600, 0x218    @ 0x7C9818 - 0x7C9600

	.global Tsa_087C9818
Tsa_087C9818:  @ 0x087C9818
	.incbin "baserom.gba", 0x7C9818, 0x214    @ 0x7C9A2C - 0x7C9818

	.global Tsa_087C9A2C
Tsa_087C9A2C:  @ 0x087C9A2C
	.incbin "baserom.gba", 0x7C9A2C, 0x1C0    @ 0x7C9BEC - 0x7C9A2C

	.global Tsa_087C9BEC
Tsa_087C9BEC:  @ 0x087C9BEC
	.incbin "baserom.gba", 0x7C9BEC, 0x108    @ 0x7C9CF4 - 0x7C9BEC

	.global Tsa_087C9CF4
Tsa_087C9CF4:  @ 0x087C9CF4
	.incbin "baserom.gba", 0x7C9CF4, 0x110    @ 0x7C9E04 - 0x7C9CF4

	.global Tsa_087C9E04
Tsa_087C9E04:  @ 0x087C9E04
	.incbin "baserom.gba", 0x7C9E04, 0x114    @ 0x7C9F18 - 0x7C9E04

	.global Img_087C9F18
Img_087C9F18:  @ 0x087C9F18
	.incbin "baserom.gba", 0x7C9F18, 0x774    @ 0x7CA68C - 0x7C9F18

	.global Img_087CA68C
Img_087CA68C:  @ 0x087CA68C
	.incbin "baserom.gba", 0x7CA68C, 0x7D4    @ 0x7CAE60 - 0x7CA68C

	.global Img_087CAE60
Img_087CAE60:  @ 0x087CAE60
	.incbin "baserom.gba", 0x7CAE60, 0x7D0    @ 0x7CB630 - 0x7CAE60

	.global Img_087CB630
Img_087CB630:  @ 0x087CB630
	.incbin "baserom.gba", 0x7CB630, 0x7C4    @ 0x7CBDF4 - 0x7CB630

	.global Img_087CBDF4
Img_087CBDF4:  @ 0x087CBDF4
	.incbin "baserom.gba", 0x7CBDF4, 0x768    @ 0x7CC55C - 0x7CBDF4

	.global Pal_087CC55C
Pal_087CC55C:  @ 0x087CC55C
	.incbin "baserom.gba", 0x7CC55C, 0x20    @ 0x7CC57C - 0x7CC55C

	.global Pal_087CC57C
Pal_087CC57C:  @ 0x087CC57C
	.incbin "baserom.gba", 0x7CC57C, 0x20    @ 0x7CC59C - 0x7CC57C

	.global Pal_087CC59C
Pal_087CC59C:  @ 0x087CC59C
	.incbin "baserom.gba", 0x7CC59C, 0x20    @ 0x7CC5BC - 0x7CC59C

	.global Pal_087CC5BC
Pal_087CC5BC:  @ 0x087CC5BC
	.incbin "baserom.gba", 0x7CC5BC, 0x20    @ 0x7CC5DC - 0x7CC5BC

	.global Pal_087CC5DC
Pal_087CC5DC:  @ 0x087CC5DC
	.incbin "baserom.gba", 0x7CC5DC, 0x20    @ 0x7CC5FC - 0x7CC5DC

	.global Tsa_087CC5FC
Tsa_087CC5FC:  @ 0x087CC5FC
	.incbin "baserom.gba", 0x7CC5FC, 0x138    @ 0x7CC734 - 0x7CC5FC

	.global Tsa_087CC734
Tsa_087CC734:  @ 0x087CC734
	.incbin "baserom.gba", 0x7CC734, 0x144    @ 0x7CC878 - 0x7CC734

	.global Tsa_087CC878
Tsa_087CC878:  @ 0x087CC878
	.incbin "baserom.gba", 0x7CC878, 0x140    @ 0x7CC9B8 - 0x7CC878

	.global Tsa_087CC9B8
Tsa_087CC9B8:  @ 0x087CC9B8
	.incbin "baserom.gba", 0x7CC9B8, 0x120    @ 0x7CCAD8 - 0x7CC9B8

	.global Tsa_087CCAD8
Tsa_087CCAD8:  @ 0x087CCAD8
	.incbin "baserom.gba", 0x7CCAD8, 0x120    @ 0x7CCBF8 - 0x7CCAD8

	.global Img_087CCBF8
Img_087CCBF8:  @ 0x087CCBF8
	.incbin "baserom.gba", 0x7CCBF8, 0xB40    @ 0x7CD738 - 0x7CCBF8

	.global Img_087CD738
Img_087CD738:  @ 0x087CD738
	.incbin "baserom.gba", 0x7CD738, 0xB3C    @ 0x7CE274 - 0x7CD738

	.global Img_087CE274
Img_087CE274:  @ 0x087CE274
	.incbin "baserom.gba", 0x7CE274, 0xB24    @ 0x7CED98 - 0x7CE274

	.global Img_087CED98
Img_087CED98:  @ 0x087CED98
	.incbin "baserom.gba", 0x7CED98, 0xA8C    @ 0x7CF824 - 0x7CED98

	.global Img_087CF824
Img_087CF824:  @ 0x087CF824
	.incbin "baserom.gba", 0x7CF824, 0xA74    @ 0x7D0298 - 0x7CF824

	.global Img_087D0298
Img_087D0298:  @ 0x087D0298
	.incbin "baserom.gba", 0x7D0298, 0xAA4    @ 0x7D0D3C - 0x7D0298

	.global Img_087D0D3C
Img_087D0D3C:  @ 0x087D0D3C
	.incbin "baserom.gba", 0x7D0D3C, 0xA84    @ 0x7D17C0 - 0x7D0D3C

	.global Img_087D17C0
Img_087D17C0:  @ 0x087D17C0
	.incbin "baserom.gba", 0x7D17C0, 0xAD4    @ 0x7D2294 - 0x7D17C0

	.global Img_087D2294
Img_087D2294:  @ 0x087D2294
	.incbin "baserom.gba", 0x7D2294, 0xA84    @ 0x7D2D18 - 0x7D2294

	.global Img_087D2D18
Img_087D2D18:  @ 0x087D2D18
	.incbin "baserom.gba", 0x7D2D18, 0xAA0    @ 0x7D37B8 - 0x7D2D18

	.global Img_087D37B8
Img_087D37B8:  @ 0x087D37B8
	.incbin "baserom.gba", 0x7D37B8, 0xA80    @ 0x7D4238 - 0x7D37B8

	.global Img_087D4238
Img_087D4238:  @ 0x087D4238
	.incbin "baserom.gba", 0x7D4238, 0xAAC    @ 0x7D4CE4 - 0x7D4238

	.global Img_087D4CE4
Img_087D4CE4:  @ 0x087D4CE4
	.incbin "baserom.gba", 0x7D4CE4, 0xB50    @ 0x7D5834 - 0x7D4CE4

	.global Img_087D5834
Img_087D5834:  @ 0x087D5834
	.incbin "baserom.gba", 0x7D5834, 0xB88    @ 0x7D63BC - 0x7D5834

	.global Img_087D63BC
Img_087D63BC:  @ 0x087D63BC
	.incbin "baserom.gba", 0x7D63BC, 0xB28    @ 0x7D6EE4 - 0x7D63BC

	.global Img_087D6EE4
Img_087D6EE4:  @ 0x087D6EE4
	.incbin "baserom.gba", 0x7D6EE4, 0xB04    @ 0x7D79E8 - 0x7D6EE4

	.global Pal_087D79E8
Pal_087D79E8:  @ 0x087D79E8
	.incbin "baserom.gba", 0x7D79E8, 0x20    @ 0x7D7A08 - 0x7D79E8

	.global Pal_087D7A08
Pal_087D7A08:  @ 0x087D7A08
	.incbin "baserom.gba", 0x7D7A08, 0x20    @ 0x7D7A28 - 0x7D7A08

	.global Pal_087D7A28
Pal_087D7A28:  @ 0x087D7A28
	.incbin "baserom.gba", 0x7D7A28, 0x20    @ 0x7D7A48 - 0x7D7A28

	.global Pal_087D7A48
Pal_087D7A48:  @ 0x087D7A48
	.incbin "baserom.gba", 0x7D7A48, 0x20    @ 0x7D7A68 - 0x7D7A48

	.global Pal_087D7A68
Pal_087D7A68:  @ 0x087D7A68
	.incbin "baserom.gba", 0x7D7A68, 0x20    @ 0x7D7A88 - 0x7D7A68

	.global Pal_087D7A88
Pal_087D7A88:  @ 0x087D7A88
	.incbin "baserom.gba", 0x7D7A88, 0x20    @ 0x7D7AA8 - 0x7D7A88

	.global Pal_087D7AA8
Pal_087D7AA8:  @ 0x087D7AA8
	.incbin "baserom.gba", 0x7D7AA8, 0x20    @ 0x7D7AC8 - 0x7D7AA8

	.global Pal_087D7AC8
Pal_087D7AC8:  @ 0x087D7AC8
	.incbin "baserom.gba", 0x7D7AC8, 0x20    @ 0x7D7AE8 - 0x7D7AC8

	.global Pal_087D7AE8
Pal_087D7AE8:  @ 0x087D7AE8
	.incbin "baserom.gba", 0x7D7AE8, 0x20    @ 0x7D7B08 - 0x7D7AE8

	.global Pal_087D7B08
Pal_087D7B08:  @ 0x087D7B08
	.incbin "baserom.gba", 0x7D7B08, 0x20    @ 0x7D7B28 - 0x7D7B08

	.global Pal_087D7B28
Pal_087D7B28:  @ 0x087D7B28
	.incbin "baserom.gba", 0x7D7B28, 0x20    @ 0x7D7B48 - 0x7D7B28

	.global Pal_087D7B48
Pal_087D7B48:  @ 0x087D7B48
	.incbin "baserom.gba", 0x7D7B48, 0x20    @ 0x7D7B68 - 0x7D7B48

	.global Pal_087D7B68
Pal_087D7B68:  @ 0x087D7B68
	.incbin "baserom.gba", 0x7D7B68, 0x20    @ 0x7D7B88 - 0x7D7B68

	.global Pal_087D7B88
Pal_087D7B88:  @ 0x087D7B88
	.incbin "baserom.gba", 0x7D7B88, 0x20    @ 0x7D7BA8 - 0x7D7B88

	.global Pal_087D7BA8
Pal_087D7BA8:  @ 0x087D7BA8
	.incbin "baserom.gba", 0x7D7BA8, 0x20    @ 0x7D7BC8 - 0x7D7BA8

	.global Pal_087D7BC8
Pal_087D7BC8:  @ 0x087D7BC8
	.incbin "baserom.gba", 0x7D7BC8, 0x20    @ 0x7D7BE8 - 0x7D7BC8

	.global Tsa_087D7BE8
Tsa_087D7BE8:  @ 0x087D7BE8
	.incbin "baserom.gba", 0x7D7BE8, 0x274    @ 0x7D7E5C - 0x7D7BE8

	.global Tsa_087D7E5C
Tsa_087D7E5C:  @ 0x087D7E5C
	.incbin "baserom.gba", 0x7D7E5C, 0x278    @ 0x7D80D4 - 0x7D7E5C

	.global Tsa_087D80D4
Tsa_087D80D4:  @ 0x087D80D4
	.incbin "baserom.gba", 0x7D80D4, 0x274    @ 0x7D8348 - 0x7D80D4

	.global Tsa_087D8348
Tsa_087D8348:  @ 0x087D8348
	.incbin "baserom.gba", 0x7D8348, 0x274    @ 0x7D85BC - 0x7D8348

	.global Tsa_087D85BC
Tsa_087D85BC:  @ 0x087D85BC
	.incbin "baserom.gba", 0x7D85BC, 0x278    @ 0x7D8834 - 0x7D85BC

	.global Tsa_087D8834
Tsa_087D8834:  @ 0x087D8834
	.incbin "baserom.gba", 0x7D8834, 0x274    @ 0x7D8AA8 - 0x7D8834

	.global Tsa_087D8AA8
Tsa_087D8AA8:  @ 0x087D8AA8
	.incbin "baserom.gba", 0x7D8AA8, 0x278    @ 0x7D8D20 - 0x7D8AA8

	.global Tsa_087D8D20
Tsa_087D8D20:  @ 0x087D8D20
	.incbin "baserom.gba", 0x7D8D20, 0x274    @ 0x7D8F94 - 0x7D8D20

	.global Tsa_087D8F94
Tsa_087D8F94:  @ 0x087D8F94
	.incbin "baserom.gba", 0x7D8F94, 0x278    @ 0x7D920C - 0x7D8F94

	.global Tsa_087D920C
Tsa_087D920C:  @ 0x087D920C
	.incbin "baserom.gba", 0x7D920C, 0x274    @ 0x7D9480 - 0x7D920C

	.global Tsa_087D9480
Tsa_087D9480:  @ 0x087D9480
	.incbin "baserom.gba", 0x7D9480, 0x278    @ 0x7D96F8 - 0x7D9480

	.global Tsa_087D96F8
Tsa_087D96F8:  @ 0x087D96F8
	.incbin "baserom.gba", 0x7D96F8, 0x274    @ 0x7D996C - 0x7D96F8

	.global Tsa_087D996C
Tsa_087D996C:  @ 0x087D996C
	.incbin "baserom.gba", 0x7D996C, 0x274    @ 0x7D9BE0 - 0x7D996C

	.global Tsa_087D9BE0
Tsa_087D9BE0:  @ 0x087D9BE0
	.incbin "baserom.gba", 0x7D9BE0, 0x278    @ 0x7D9E58 - 0x7D9BE0

	.global Tsa_087D9E58
Tsa_087D9E58:  @ 0x087D9E58
	.incbin "baserom.gba", 0x7D9E58, 0x274    @ 0x7DA0CC - 0x7D9E58

	.global Tsa_087DA0CC
Tsa_087DA0CC:  @ 0x087DA0CC
	.incbin "baserom.gba", 0x7DA0CC, 0x274    @ 0x7DA340 - 0x7DA0CC

	.global Img_087DA340
Img_087DA340:  @ 0x087DA340
	.incbin "baserom.gba", 0x7DA340, 0xB00    @ 0x7DAE40 - 0x7DA340

	.global Img_087DAE40
Img_087DAE40:  @ 0x087DAE40
	.incbin "baserom.gba", 0x7DAE40, 0xB20    @ 0x7DB960 - 0x7DAE40

	.global Img_087DB960
Img_087DB960:  @ 0x087DB960
	.incbin "baserom.gba", 0x7DB960, 0xBB8    @ 0x7DC518 - 0x7DB960

	.global Img_087DC518
Img_087DC518:  @ 0x087DC518
	.incbin "baserom.gba", 0x7DC518, 0xD70    @ 0x7DD288 - 0x7DC518

	.global Img_087DD288
Img_087DD288:  @ 0x087DD288
	.incbin "baserom.gba", 0x7DD288, 0xE40    @ 0x7DE0C8 - 0x7DD288

	.global Img_087DE0C8
Img_087DE0C8:  @ 0x087DE0C8
	.incbin "baserom.gba", 0x7DE0C8, 0xF68    @ 0x7DF030 - 0x7DE0C8

	.global Img_087DF030
Img_087DF030:  @ 0x087DF030
	.incbin "baserom.gba", 0x7DF030, 0xFFC    @ 0x7E002C - 0x7DF030

	.global Img_087E002C
Img_087E002C:  @ 0x087E002C
	.incbin "baserom.gba", 0x7E002C, 0x1164    @ 0x7E1190 - 0x7E002C

	.global Img_087E1190
Img_087E1190:  @ 0x087E1190
	.incbin "baserom.gba", 0x7E1190, 0x11FC    @ 0x7E238C - 0x7E1190

	.global Img_087E238C
Img_087E238C:  @ 0x087E238C
	.incbin "baserom.gba", 0x7E238C, 0x1200    @ 0x7E358C - 0x7E238C

	.global Img_087E358C
Img_087E358C:  @ 0x087E358C
	.incbin "baserom.gba", 0x7E358C, 0x10E0    @ 0x7E466C - 0x7E358C

	.global Img_087E466C
Img_087E466C:  @ 0x087E466C
	.incbin "baserom.gba", 0x7E466C, 0xE48    @ 0x7E54B4 - 0x7E466C

	.global Img_087E54B4
Img_087E54B4:  @ 0x087E54B4
	.incbin "baserom.gba", 0x7E54B4, 0xB20    @ 0x7E5FD4 - 0x7E54B4

	.global Img_087E5FD4
Img_087E5FD4:  @ 0x087E5FD4
	.incbin "baserom.gba", 0x7E5FD4, 0xBBC    @ 0x7E6B90 - 0x7E5FD4

	.global Img_087E6B90
Img_087E6B90:  @ 0x087E6B90
	.incbin "baserom.gba", 0x7E6B90, 0xD10    @ 0x7E78A0 - 0x7E6B90

	.global Img_087E78A0
Img_087E78A0:  @ 0x087E78A0
	.incbin "baserom.gba", 0x7E78A0, 0xA2C    @ 0x7E82CC - 0x7E78A0

	.global Pal_087E82CC
Pal_087E82CC:  @ 0x087E82CC
	.incbin "baserom.gba", 0x7E82CC, 0x20    @ 0x7E82EC - 0x7E82CC

	.global Pal_087E82EC
Pal_087E82EC:  @ 0x087E82EC
	.incbin "baserom.gba", 0x7E82EC, 0x20    @ 0x7E830C - 0x7E82EC

	.global Pal_087E830C
Pal_087E830C:  @ 0x087E830C
	.incbin "baserom.gba", 0x7E830C, 0x20    @ 0x7E832C - 0x7E830C

	.global Pal_087E832C
Pal_087E832C:  @ 0x087E832C
	.incbin "baserom.gba", 0x7E832C, 0x20    @ 0x7E834C - 0x7E832C

	.global Pal_087E834C
Pal_087E834C:  @ 0x087E834C
	.incbin "baserom.gba", 0x7E834C, 0x20    @ 0x7E836C - 0x7E834C

	.global Pal_087E836C
Pal_087E836C:  @ 0x087E836C
	.incbin "baserom.gba", 0x7E836C, 0x20    @ 0x7E838C - 0x7E836C

	.global Pal_087E838C
Pal_087E838C:  @ 0x087E838C
	.incbin "baserom.gba", 0x7E838C, 0x20    @ 0x7E83AC - 0x7E838C

	.global Pal_087E83AC
Pal_087E83AC:  @ 0x087E83AC
	.incbin "baserom.gba", 0x7E83AC, 0x20    @ 0x7E83CC - 0x7E83AC

	.global Pal_087E83CC
Pal_087E83CC:  @ 0x087E83CC
	.incbin "baserom.gba", 0x7E83CC, 0x20    @ 0x7E83EC - 0x7E83CC

	.global Pal_087E83EC
Pal_087E83EC:  @ 0x087E83EC
	.incbin "baserom.gba", 0x7E83EC, 0x20    @ 0x7E840C - 0x7E83EC

	.global Pal_087E840C
Pal_087E840C:  @ 0x087E840C
	.incbin "baserom.gba", 0x7E840C, 0x20    @ 0x7E842C - 0x7E840C

	.global Pal_087E842C
Pal_087E842C:  @ 0x087E842C
	.incbin "baserom.gba", 0x7E842C, 0x20    @ 0x7E844C - 0x7E842C

	.global Pal_087E844C
Pal_087E844C:  @ 0x087E844C
	.incbin "baserom.gba", 0x7E844C, 0x20    @ 0x7E846C - 0x7E844C

	.global Pal_087E846C
Pal_087E846C:  @ 0x087E846C
	.incbin "baserom.gba", 0x7E846C, 0x20    @ 0x7E848C - 0x7E846C

	.global Pal_087E848C
Pal_087E848C:  @ 0x087E848C
	.incbin "baserom.gba", 0x7E848C, 0x20    @ 0x7E84AC - 0x7E848C

	.global Pal_087E84AC
Pal_087E84AC:  @ 0x087E84AC
	.incbin "baserom.gba", 0x7E84AC, 0x20    @ 0x7E84CC - 0x7E84AC

	.global Tsa_087E84CC
Tsa_087E84CC:  @ 0x087E84CC
	.incbin "baserom.gba", 0x7E84CC, 0x270    @ 0x7E873C - 0x7E84CC

	.global Tsa_087E873C
Tsa_087E873C:  @ 0x087E873C
	.incbin "baserom.gba", 0x7E873C, 0x278    @ 0x7E89B4 - 0x7E873C

	.global Tsa_087E89B4
Tsa_087E89B4:  @ 0x087E89B4
	.incbin "baserom.gba", 0x7E89B4, 0x278    @ 0x7E8C2C - 0x7E89B4

	.global Tsa_087E8C2C
Tsa_087E8C2C:  @ 0x087E8C2C
	.incbin "baserom.gba", 0x7E8C2C, 0x25C    @ 0x7E8E88 - 0x7E8C2C

	.global Tsa_087E8E88
Tsa_087E8E88:  @ 0x087E8E88
	.incbin "baserom.gba", 0x7E8E88, 0x248    @ 0x7E90D0 - 0x7E8E88

	.global Tsa_087E90D0
Tsa_087E90D0:  @ 0x087E90D0
	.incbin "baserom.gba", 0x7E90D0, 0x244    @ 0x7E9314 - 0x7E90D0

	.global Tsa_087E9314
Tsa_087E9314:  @ 0x087E9314
	.incbin "baserom.gba", 0x7E9314, 0x240    @ 0x7E9554 - 0x7E9314

	.global Tsa_087E9554
Tsa_087E9554:  @ 0x087E9554
	.incbin "baserom.gba", 0x7E9554, 0x244    @ 0x7E9798 - 0x7E9554

	.global Tsa_087E9798
Tsa_087E9798:  @ 0x087E9798
	.incbin "baserom.gba", 0x7E9798, 0x248    @ 0x7E99E0 - 0x7E9798

	.global Tsa_087E99E0
Tsa_087E99E0:  @ 0x087E99E0
	.incbin "baserom.gba", 0x7E99E0, 0x248    @ 0x7E9C28 - 0x7E99E0

	.global Tsa_087E9C28
Tsa_087E9C28:  @ 0x087E9C28
	.incbin "baserom.gba", 0x7E9C28, 0x250    @ 0x7E9E78 - 0x7E9C28

	.global Tsa_087E9E78
Tsa_087E9E78:  @ 0x087E9E78
	.incbin "baserom.gba", 0x7E9E78, 0x248    @ 0x7EA0C0 - 0x7E9E78

	.global Tsa_087EA0C0
Tsa_087EA0C0:  @ 0x087EA0C0
	.incbin "baserom.gba", 0x7EA0C0, 0x1A8    @ 0x7EA268 - 0x7EA0C0

	.global Tsa_087EA268
Tsa_087EA268:  @ 0x087EA268
	.incbin "baserom.gba", 0x7EA268, 0x1B4    @ 0x7EA41C - 0x7EA268

	.global Tsa_087EA41C
Tsa_087EA41C:  @ 0x087EA41C
	.incbin "baserom.gba", 0x7EA41C, 0x1B4    @ 0x7EA5D0 - 0x7EA41C

	.global Tsa_087EA5D0
Tsa_087EA5D0:  @ 0x087EA5D0
	.incbin "baserom.gba", 0x7EA5D0, 0x15C    @ 0x7EA72C - 0x7EA5D0

	.global Img_087EA72C
Img_087EA72C:  @ 0x087EA72C
	.incbin "baserom.gba", 0x7EA72C, 0x554    @ 0x7EAC80 - 0x7EA72C

	.global Img_087EAC80
Img_087EAC80:  @ 0x087EAC80
	.incbin "baserom.gba", 0x7EAC80, 0xA84    @ 0x7EB704 - 0x7EAC80

	.global Img_087EB704
Img_087EB704:  @ 0x087EB704
	.incbin "baserom.gba", 0x7EB704, 0x950    @ 0x7EC054 - 0x7EB704

	.global Img_087EC054
Img_087EC054:  @ 0x087EC054
	.incbin "baserom.gba", 0x7EC054, 0x8F0    @ 0x7EC944 - 0x7EC054

	.global Img_087EC944
Img_087EC944:  @ 0x087EC944
	.incbin "baserom.gba", 0x7EC944, 0x96C    @ 0x7ED2B0 - 0x7EC944

	.global Img_087ED2B0
Img_087ED2B0:  @ 0x087ED2B0
	.incbin "baserom.gba", 0x7ED2B0, 0x578    @ 0x7ED828 - 0x7ED2B0

	.global Img_087ED828
Img_087ED828:  @ 0x087ED828
	.incbin "baserom.gba", 0x7ED828, 0x598    @ 0x7EDDC0 - 0x7ED828

	.global Img_087EDDC0
Img_087EDDC0:  @ 0x087EDDC0
	.incbin "baserom.gba", 0x7EDDC0, 0x5E0    @ 0x7EE3A0 - 0x7EDDC0

	.global Pal_087EE3A0
Pal_087EE3A0:  @ 0x087EE3A0
	.incbin "baserom.gba", 0x7EE3A0, 0x20    @ 0x7EE3C0 - 0x7EE3A0

	.global Pal_087EE3C0
Pal_087EE3C0:  @ 0x087EE3C0
	.incbin "baserom.gba", 0x7EE3C0, 0x20    @ 0x7EE3E0 - 0x7EE3C0

	.global Pal_087EE3E0
Pal_087EE3E0:  @ 0x087EE3E0
	.incbin "baserom.gba", 0x7EE3E0, 0x20    @ 0x7EE400 - 0x7EE3E0

	.global Pal_087EE400
Pal_087EE400:  @ 0x087EE400
	.incbin "baserom.gba", 0x7EE400, 0x20    @ 0x7EE420 - 0x7EE400

	.global Pal_087EE420
Pal_087EE420:  @ 0x087EE420
	.incbin "baserom.gba", 0x7EE420, 0x20    @ 0x7EE440 - 0x7EE420

	.global Pal_087EE440
Pal_087EE440:  @ 0x087EE440
	.incbin "baserom.gba", 0x7EE440, 0x20    @ 0x7EE460 - 0x7EE440

	.global Pal_087EE460
Pal_087EE460:  @ 0x087EE460
	.incbin "baserom.gba", 0x7EE460, 0x20    @ 0x7EE480 - 0x7EE460

	.global Pal_087EE480
Pal_087EE480:  @ 0x087EE480
	.incbin "baserom.gba", 0x7EE480, 0x20    @ 0x7EE4A0 - 0x7EE480

	.global Tsa_087EE4A0
Tsa_087EE4A0:  @ 0x087EE4A0
	.incbin "baserom.gba", 0x7EE4A0, 0xD8    @ 0x7EE578 - 0x7EE4A0

	.global Tsa_087EE578
Tsa_087EE578:  @ 0x087EE578
	.incbin "baserom.gba", 0x7EE578, 0x198    @ 0x7EE710 - 0x7EE578

	.global Tsa_087EE710
Tsa_087EE710:  @ 0x087EE710
	.incbin "baserom.gba", 0x7EE710, 0x1E8    @ 0x7EE8F8 - 0x7EE710

	.global Tsa_087EE8F8
Tsa_087EE8F8:  @ 0x087EE8F8
	.incbin "baserom.gba", 0x7EE8F8, 0x1FC    @ 0x7EEAF4 - 0x7EE8F8

	.global Tsa_087EEAF4
Tsa_087EEAF4:  @ 0x087EEAF4
	.incbin "baserom.gba", 0x7EEAF4, 0x1B4    @ 0x7EECA8 - 0x7EEAF4

	.global Tsa_087EECA8
Tsa_087EECA8:  @ 0x087EECA8
	.incbin "baserom.gba", 0x7EECA8, 0x104    @ 0x7EEDAC - 0x7EECA8

	.global Tsa_087EEDAC
Tsa_087EEDAC:  @ 0x087EEDAC
	.incbin "baserom.gba", 0x7EEDAC, 0x104    @ 0x7EEEB0 - 0x7EEDAC

	.global Tsa_087EEEB0
Tsa_087EEEB0:  @ 0x087EEEB0
	.incbin "baserom.gba", 0x7EEEB0, 0x10C    @ 0x7EEFBC - 0x7EEEB0

	.global Img_087EEFBC
Img_087EEFBC:  @ 0x087EEFBC
	.incbin "baserom.gba", 0x7EEFBC, 0x774    @ 0x7EF730 - 0x7EEFBC

	.global Img_087EF730
Img_087EF730:  @ 0x087EF730
	.incbin "baserom.gba", 0x7EF730, 0x7D4    @ 0x7EFF04 - 0x7EF730

	.global Img_087EFF04
Img_087EFF04:  @ 0x087EFF04
	.incbin "baserom.gba", 0x7EFF04, 0x7D0    @ 0x7F06D4 - 0x7EFF04

	.global Img_087F06D4
Img_087F06D4:  @ 0x087F06D4
	.incbin "baserom.gba", 0x7F06D4, 0x7C4    @ 0x7F0E98 - 0x7F06D4

	.global Img_087F0E98
Img_087F0E98:  @ 0x087F0E98
	.incbin "baserom.gba", 0x7F0E98, 0x768    @ 0x7F1600 - 0x7F0E98

	.global Pal_087F1600
Pal_087F1600:  @ 0x087F1600
	.incbin "baserom.gba", 0x7F1600, 0x20    @ 0x7F1620 - 0x7F1600

	.global Pal_087F1620
Pal_087F1620:  @ 0x087F1620
	.incbin "baserom.gba", 0x7F1620, 0x20    @ 0x7F1640 - 0x7F1620

	.global Pal_087F1640
Pal_087F1640:  @ 0x087F1640
	.incbin "baserom.gba", 0x7F1640, 0x20    @ 0x7F1660 - 0x7F1640

	.global Pal_087F1660
Pal_087F1660:  @ 0x087F1660
	.incbin "baserom.gba", 0x7F1660, 0x20    @ 0x7F1680 - 0x7F1660

	.global Pal_087F1680
Pal_087F1680:  @ 0x087F1680
	.incbin "baserom.gba", 0x7F1680, 0x20    @ 0x7F16A0 - 0x7F1680

	.global Tsa_087F16A0
Tsa_087F16A0:  @ 0x087F16A0
	.incbin "baserom.gba", 0x7F16A0, 0x138    @ 0x7F17D8 - 0x7F16A0

	.global Tsa_087F17D8
Tsa_087F17D8:  @ 0x087F17D8
	.incbin "baserom.gba", 0x7F17D8, 0x144    @ 0x7F191C - 0x7F17D8

	.global Tsa_087F191C
Tsa_087F191C:  @ 0x087F191C
	.incbin "baserom.gba", 0x7F191C, 0x138    @ 0x7F1A54 - 0x7F191C

	.global Tsa_087F1A54
Tsa_087F1A54:  @ 0x087F1A54
	.incbin "baserom.gba", 0x7F1A54, 0x120    @ 0x7F1B74 - 0x7F1A54

	.global Tsa_087F1B74
Tsa_087F1B74:  @ 0x087F1B74
	.incbin "baserom.gba", 0x7F1B74, 0x120    @ 0x7F1C94 - 0x7F1B74

	.global Img_087F1C94
Img_087F1C94:  @ 0x087F1C94
	.incbin "baserom.gba", 0x7F1C94, 0x7D0    @ 0x7F2464 - 0x7F1C94

	.global Img_087F2464
Img_087F2464:  @ 0x087F2464
	.incbin "baserom.gba", 0x7F2464, 0x9DC    @ 0x7F2E40 - 0x7F2464

	.global Img_087F2E40
Img_087F2E40:  @ 0x087F2E40
	.incbin "baserom.gba", 0x7F2E40, 0xDD4    @ 0x7F3C14 - 0x7F2E40

	.global Pal_087F3C14
Pal_087F3C14:  @ 0x087F3C14
	.incbin "baserom.gba", 0x7F3C14, 0x20    @ 0x7F3C34 - 0x7F3C14

	.global Pal_087F3C34
Pal_087F3C34:  @ 0x087F3C34
	.incbin "baserom.gba", 0x7F3C34, 0x20    @ 0x7F3C54 - 0x7F3C34

	.global Pal_087F3C54
Pal_087F3C54:  @ 0x087F3C54
	.incbin "baserom.gba", 0x7F3C54, 0x20    @ 0x7F3C74 - 0x7F3C54

	.global Tsa_087F3C74
Tsa_087F3C74:  @ 0x087F3C74
	.incbin "baserom.gba", 0x7F3C74, 0xEC    @ 0x7F3D60 - 0x7F3C74

	.global Tsa_087F3D60
Tsa_087F3D60:  @ 0x087F3D60
	.incbin "baserom.gba", 0x7F3D60, 0x128    @ 0x7F3E88 - 0x7F3D60

	.global Tsa_087F3E88
Tsa_087F3E88:  @ 0x087F3E88
	.incbin "baserom.gba", 0x7F3E88, 0x2FC    @ 0x7F4184 - 0x7F3E88

	.global BanimScr_DemoKingTunkFace
BanimScr_DemoKingTunkFace:  @ 0x087F4184
    .4byte Pal_087F3C54 + 0x3ee
    .4byte 0x70000000 + Pal_087F3C54 + 0x4a3
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
