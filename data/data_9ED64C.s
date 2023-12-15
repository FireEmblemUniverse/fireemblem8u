    .section .data

	.global EventScr_Ch2_BeginingScene
EventScr_Ch2_BeginingScene:
    .incbin "baserom.gba", 0x9F02A0, 0x9F36A0 - 0x9F02A0

	.global gUnknown_089F36A0
gUnknown_089F36A0:  @ 0x089F36A0
@ Replacing .incbin "baserom.gba", 0x9F36A0, 0xBDE0
    .4byte 0x00120806
    .4byte 0x00000001
    .4byte gUnknown_089EEA28 + 0x4c0c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000b0540
    .4byte 0x0014000c
    .4byte 0x002b2520
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x3e14
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x066a3a41
    .4byte 0x00080008
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5c
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x1e0
    .4byte 0x00000120
    .4byte 0x5f900820
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x3e8c
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x0014000b
    .4byte 0x00002f42
    .4byte 0x0002fffe
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x000b0540
    .4byte 0x0015000b
    .4byte 0x00533f41
    .4byte 0x0000ffff
    .4byte 0xfffe342f
    .4byte 0x000b0540
    .4byte 0x00140009
    .4byte 0x00002f40
    .4byte 0x1609fffe
    .4byte 0x000b0540
    .4byte 0x0014000d
    .4byte 0x00102f40
    .4byte 0x150dfffe
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x3eb4
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000501
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x000b0540
    .4byte 0x00160009
    .4byte 0x00803f41
    .4byte 0x0000ffff
    .4byte 0xfffe342f
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00000721
    .4byte 0x000b0540
    .4byte 0x0015000d
    .4byte 0x00813f41
    .4byte 0x0000ffff
    .4byte 0xfffe342f
    .4byte 0x00002f40
    .4byte 0x140a0080
    .4byte 0x00002f40
    .4byte 0x120d0081
    .4byte 0x000b0540
    .4byte 0x00130010
    .4byte 0x00002f40
    .4byte 0x0e13fffe
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x3f18
    .4byte 0x000b0540
    .4byte 0x00130006
    .4byte 0x00002f40
    .4byte 0x1807fffe
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x3ef0
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x000b0540
    .4byte 0x00180007
    .4byte 0x00823f41
    .4byte 0x0000ffff
    .4byte 0xfffe342f
    .4byte 0x00002f40
    .4byte 0x18050082
    .4byte 0x00102f40
    .4byte 0x11090053
    .4byte 0x001e0e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00000120
    .4byte 0x5f900820
    .4byte 0x040b2628
    .4byte 0x002e1420
    .4byte 0x00210e20
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x3f7c
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00020540
    .4byte 0x00000053
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x190
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0c0a1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00022f40
    .4byte 0x040a00c0
    .4byte 0x00003020
    .4byte 0x00102f40
    .4byte 0x040b0053
    .4byte 0x00003020
    .4byte 0x00c03b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0c0b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00010540
    .4byte 0x00000003
    .4byte 0x00c03425
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00000721
    .4byte 0x00533f41
    .4byte 0x000000c0
    .4byte 0x00c0342f
    .4byte 0x00002f42
    .4byte 0x00020044
    .4byte 0x00003020
    .4byte 0x00443b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0c0c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00041421
    .4byte 0x00041721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00000120
    .4byte 0x002e1220
    .4byte 0x00020540
    .4byte 0x00000a16
    .4byte 0x00030540
    .4byte 0x00000a17
    .4byte 0x00040540
    .4byte 0x00000a18
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x594
    .4byte 0x7fff1324
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00452520
    .4byte 0x00223320
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00223428
    .4byte 0x00000820
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00013428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0x48bc
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x4970
    .4byte 0x00003020
    .4byte 0x00002f42
    .4byte 0x00000001
    .4byte 0x00003020
    .4byte 0x00223b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00241220
    .4byte 0x00020540
    .4byte 0x0000001c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a191b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x00040012
    .4byte 0x000a2520
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x4684
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a1a1b20
    .4byte 0x00001d20
    .4byte 0x00001520
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x46d4
    .4byte 0x00003020
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002a1420
    .4byte 0x00210e20
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a1b1b20
    .4byte 0x00001d20
    .4byte 0x00041421
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00101720
    .4byte 0x00002f40
    .4byte 0x02090019
    .4byte 0x00100e22
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000091
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000089
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x0000001a
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000093
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000089
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x0000001c
    .4byte 0x00003020
    .4byte 0x0000342b
    .4byte 0x00102f42
    .4byte 0x00000001
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a1c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x040e2628
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x474c
    .4byte 0x00003020
    .4byte 0x00002f42
    .4byte 0x00000002
    .4byte 0x00003020
    .4byte 0x00c53b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00261220
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00030540
    .4byte 0x00000a1d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x4224
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x4404
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00101721
    .4byte 0x00c5342f
    .4byte 0x0000342a
    .4byte 0x00002c40
    .4byte gUnknown_088B3AD8 + 0x4134
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00223428
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00270620
    .4byte 0x00380620
    .4byte 0x00490620
    .4byte 0x00020540
    .4byte 0x0002000f
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x30
    .4byte 0x00002720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x4800
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x006b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00720620
    .4byte 0x00001a20
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00102f40
    .4byte 0x0a0d0069
    .4byte 0x00102f40
    .4byte 0x0a0f0043
    .4byte 0x00102f40
    .4byte 0x050d0053
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00010151
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0001014f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000057
    .4byte 0x00003020
    .4byte 0x0069342f
    .4byte 0x0043342f
    .4byte 0x006b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00820620
    .4byte 0x00001a20
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00102f40
    .4byte 0x0a0d0053
    .4byte 0x00102f40
    .4byte 0x0a0f0057
    .4byte 0x00102f40
    .4byte 0x050f0044
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x0001014b
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0001014d
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x0000001d
    .4byte 0x00003020
    .4byte 0x0053342f
    .4byte 0x0057342f
    .4byte 0x006b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00920620
    .4byte 0x00001a20
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00102f40
    .4byte 0x0a0d001d
    .4byte 0x00102f40
    .4byte 0x0a0f0044
    .4byte 0x000f0e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00000120
    .4byte 0x00321220
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a221b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002220
    .4byte 0x07142628
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x4774
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x4774
    .4byte 0x00003020
    .4byte 0x00002f42
    .4byte 0x000200a7
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00030540
    .4byte 0x00000a23
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x7fff1324
    .4byte 0x00102f42
    .4byte 0x00030002
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x000301d4
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00030014
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x000000a7
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00281220
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00030540
    .4byte 0x00000a24
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x47c4
    .4byte 0x00003020
    .4byte 0x00cc3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00261220
    .4byte 0x0a251b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00080321
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00090321
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a261b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x0000005b
    .4byte 0x00003720
    .4byte 0x00000820
    .4byte 0x00710229
    .4byte 0x000b2a21
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a281b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00123422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a271b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00123422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x002a1420
    .4byte 0x00210e20
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000a29
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00021421
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000060
    .4byte 0xffff3720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000a2a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000009
    .4byte 0xffff3720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00123322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00123325
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00122621
    .4byte 0x00123b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00141420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a1f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00182f40
    .4byte 0x17020012
    .4byte 0x00182f40
    .4byte 0x17020083
    .4byte 0x00182f40
    .4byte 0x17020084
    .4byte 0x00182f40
    .4byte 0x17020085
    .4byte 0x00003020
    .4byte 0x0012342f
    .4byte 0x0083342f
    .4byte 0x0084342f
    .4byte 0x0085342f
    .4byte 0x00001924
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x718
    .4byte 0x00000121
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x4490
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x44b8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x44f4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x4530
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x456c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x45a8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x45e4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00123b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00141420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a1e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x4648
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x002e1220
    .4byte 0x00020540
    .4byte 0x0002000f
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x30
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x5b68
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00102f42
    .4byte 0x00030069
    .4byte 0x00003020
    .4byte 0x006b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a2b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x0b092628
    .4byte 0x00022d20
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x5c08
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x000d0007
    .4byte 0xffff2720
    .4byte 0x00101720
    .4byte 0x00002720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x5c08
    .4byte 0x00003020
    .4byte 0x00002721
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x5c44
    .4byte 0x00003020
    .4byte 0x00693b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000c
    .4byte 0x00030540
    .4byte 0x00000a2c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x5c6c
    .4byte 0x00003020
    .4byte 0x00001520
    .4byte 0x00433b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a2d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002d20
    .4byte 0x000b0540
    .4byte 0x00100007
    .4byte 0x000b2520
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x4eb4
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x4b6c
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x4e28
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00101720
    .4byte 0x000b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00261220
    .4byte 0x00020540
    .4byte 0x00000026
    .4byte 0x00030540
    .4byte 0x00000a2e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00002620
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x506c
    .4byte 0x00200e22
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00013428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00023428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0x50a8
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00013428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00023428
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a2f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000d0229
    .4byte 0x000e0229
    .4byte 0x00000120
    .4byte 0x004f2621
    .4byte 0x004f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00141220
    .4byte 0x00001a20
    .4byte 0x0a301b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x01103b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00030540
    .4byte 0x00000a31
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x0000000b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x00070540
    .4byte 0x00000002
    .4byte 0x00143320
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00143322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01770621
    .4byte 0x00000820
    .4byte 0x00153320
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x00153322
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01770621
    .4byte 0x00010820
    .4byte 0x00020540
    .4byte 0x00000014
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x00020540
    .4byte 0x00000015
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x00020c40
    .4byte 0x00000007
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00143425
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00153425
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00143428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00153428
    .4byte 0x00143420
    .4byte 0x00153420
    .4byte 0x00020820
    .4byte 0x00020540
    .4byte 0x00000016
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x534
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x002e1220
    .4byte 0x1e002620
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x5184
    .4byte 0x00003020
    .4byte 0x00433b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00030540
    .4byte 0x00000a36
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00102f40
    .4byte 0x1e030043
    .4byte 0x000b0540
    .4byte 0x001b0002
    .4byte 0x00200e22
    .4byte 0x00102f40
    .4byte 0x1e02fffe
    .4byte 0x000b0540
    .4byte 0x001b0004
    .4byte 0x00102f40
    .4byte 0x1e04fffe
    .4byte 0x00101721
    .4byte 0x7fff1324
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00132620
    .4byte 0x00101720
    .4byte 0x010f3b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00311220
    .4byte 0x0a371b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00030c41
    .4byte 0x00000007
    .4byte 0x00020540
    .4byte 0x00000010
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a381b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00030820
    .4byte 0x00020540
    .4byte 0x00000002
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00153322
    .4byte 0x000a0c40
    .4byte 0x0000000c
    .4byte 0x00001520
    .4byte 0x0a391b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a3a1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x0a3b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0820
    .4byte 0x00101721
    .4byte 0x00720229
    .4byte 0x003d2a21
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a3c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x000b3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a3d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x000b3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a3e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00143422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a411b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00143422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a3f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00153422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a401b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00153422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a421b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00163422
    .4byte 0x000d0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001927
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00001922
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x0a002620
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x501c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00000820
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x4f40
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x4fb8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000a43
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000a44
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000a45
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x4f04
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000e0221
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x001d000d
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x001c000e
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x001d000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x001c0010
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x001d0011
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x001e000e
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x001e0010
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x001e0012
    .4byte 0x00000721
    .4byte 0x00020540
    .4byte 0x00010000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x5f4
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00162621
    .4byte 0x00163b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00141220
    .4byte 0x00001a20
    .4byte 0x0a321b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x004d1220
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x6348
    .4byte 0x00003020
    .4byte 0x00183b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a461b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00251220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x00153322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00153b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001e
    .4byte 0x00030540
    .4byte 0x00000a47
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00002f42
    .4byte 0x0001000b
    .4byte 0x00003020
    .4byte 0x000b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001e
    .4byte 0x00030540
    .4byte 0x00000a48
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00010820
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000086
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000085
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000018
    .4byte 0x00003020
    .4byte 0x0018342f
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0d0c2628
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x61f4
    .4byte 0x00003020
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a491b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x5eac
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00193322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x0a4a1b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0a4b1b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x00041720
    .4byte 0x0a4c1b20
    .4byte 0x00001d20
    .4byte 0x001a3322
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x0a4d1b21
    .4byte 0x00001d20
    .4byte 0x00020820
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x00000019
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x00020540
    .4byte 0x0000001a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x000a0000
    .4byte 0x00412520
    .4byte 0x00002920
    .4byte 0x004a1220
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x6540
    .4byte 0x00003020
    .4byte 0x0018342f
    .4byte 0x001e0e20
    .4byte 0x06023b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001520
    .4byte 0x0a4e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1328
    .4byte 0x00021721
    .4byte 0x00002220
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x643c
    .4byte 0x00003020
    .4byte 0x0069342f
    .4byte 0x0080342f
    .4byte 0x0081342f
    .4byte 0x00021720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x643c
    .4byte 0x00003020
    .4byte 0x00693b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002e1220
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a4f1b20
    .4byte 0x00001d20
    .4byte 0x00281220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x00002f40
    .4byte 0x000d0017
    .4byte 0x00003020
    .4byte 0x00102f40
    .4byte 0x000d000b
    .4byte 0x00102f40
    .4byte 0x000d0019
    .4byte 0x00102f40
    .4byte 0x000d0002
    .4byte 0x00102f40
    .4byte 0x000d0001
    .4byte 0x00003020
    .4byte 0x00102f40
    .4byte 0x05080069
    .4byte 0x00102f40
    .4byte 0x04070080
    .4byte 0x00102f40
    .4byte 0x04090081
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x64f0
    .4byte 0x00003020
    .4byte 0x00003020
    .4byte 0x00433b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002e1220
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a501b20
    .4byte 0x00001d20
    .4byte 0x00261220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x00002f42
    .4byte 0x00030043
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00020000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00016401
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00000721
    .4byte 0x00693f40
    .4byte 0x00000043
    .4byte 0x0069342d
    .4byte 0x0069342e
    .4byte 0x00433b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a521b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00020087
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00020083
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00020003
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000080
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00020101
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00020001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000081
    .4byte 0x000f0e22
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00020086
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00020083
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00020003
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000066
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00020101
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00020001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000067
    .4byte 0x00003020
    .4byte 0x00433b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a531b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00730229
    .4byte 0x000c2a22
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a541b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00193422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a551b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x001a3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6230
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00b43920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010500
    .4byte 0x00af3920
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00bc3920
    .4byte 0x00010540
    .4byte 0x00011200
    .4byte 0x00b83920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00ae3920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6258
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x62a8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x62f8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00471220
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x6b20
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a561b20
    .4byte 0x00001d20
    .4byte 0x7fff1326
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x140a2628
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x679c
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6bd4
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00251220
    .4byte 0x00001a20
    .4byte 0x0a571b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002c40
    .4byte gUnknown_088B3AD8 + 0x6698
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x7fff1324
    .4byte 0x15072628
    .4byte 0x00101720
    .4byte 0x00173b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x000a1220
    .4byte 0x00001a20
    .4byte 0x0a581b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x0b092628
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x6b98
    .4byte 0x00003020
    .4byte 0x00183b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a591b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x000002c9
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000309
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000305
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000018
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x000002cb
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x000002c9
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000309
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000306
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x000000c5
    .4byte 0x00003020
    .4byte 0x0018342f
    .4byte 0x001e0e20
    .4byte 0x00082f40
    .4byte 0x0c0700c5
    .4byte 0x00003020
    .4byte 0x0c053b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001520
    .4byte 0x0a5a1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00c5342f
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x6a1c
    .4byte 0x00003020
    .4byte 0x00070229
    .4byte 0x00080229
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00311220
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00183320
    .4byte 0x00020c41
    .4byte 0x0000000c
    .4byte 0x00173322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a5b1b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00153322
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a5c1b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00101721
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x6af8
    .4byte 0x00003020
    .4byte 0x00020820
    .4byte 0x00002220
    .4byte 0x040c2628
    .4byte 0x00101720
    .4byte 0x000f0e20
    .4byte 0x010c3b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00173322
    .4byte 0x000a0c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte 0x00000004
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a5d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x002b1220
    .4byte 0x0a5e1b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00200e23
    .4byte 0x00321220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00041721
    .4byte 0x00020540
    .4byte 0x00000003
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a5f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x00321220
    .4byte 0x00020540
    .4byte 0x00000003
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a601b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x002b1220
    .4byte 0x0a611b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00200e23
    .4byte 0x00321220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00041721
    .4byte 0x00020540
    .4byte 0x00000003
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a621b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0820
    .4byte 0x00740229
    .4byte 0x000d2a21
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00030540
    .4byte 0x00000a63
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000059
    .4byte 0xffff3720
    .4byte 0x00022720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00000820
    .4byte 0x00002e21
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00010c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000017
    .4byte 0x00020c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000015
    .4byte 0x00030c40
    .4byte 0x0007000c
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00030540
    .4byte 0x00000a67
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00090920
    .4byte 0x00010820
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00030540
    .4byte 0x00000a64
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00090920
    .4byte 0x00020820
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00030540
    .4byte 0x00000a65
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00090920
    .4byte 0x00030820
    .4byte 0x00020540
    .4byte 0x00000001
    .4byte 0x00030540
    .4byte 0x00000a66
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00090820
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x6af8
    .4byte 0x00003020
    .4byte 0x00032720
    .4byte 0x00021421
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00070221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6a44
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6cec
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00080221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6c60
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6d14
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6cb0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x6aa8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x30
    .4byte 0x00020540
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a681b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x003f2520
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x7e98
    .4byte 0x00003020
    .4byte 0x0000342c
    .4byte 0x040a3b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a691b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00492520
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x7eec
    .4byte 0x00003020
    .4byte 0x00cc342f
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x7eec
    .4byte 0x00003020
    .4byte 0x00cc3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00251220
    .4byte 0x0a6a1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00041721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a6b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x000b0540
    .4byte 0x00090012
    .4byte 0x000d2520
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x6f9c
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x7140
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00860321
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00123320
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x7438
    .4byte 0x00003020
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00070229
    .4byte 0x00010820
    .4byte 0x00101720
    .4byte 0x0b173b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002e1420
    .4byte 0x00210e20
    .4byte 0x00020540
    .4byte 0x00000026
    .4byte 0x00030540
    .4byte 0x00000a6c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x7460
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x6f74
    .4byte 0x00003020
    .4byte 0x0053342f
    .4byte 0x090d2628
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x7488
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00013428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00193428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x000b3428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00023428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0x74ec
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00013428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00193428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x000b3428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00023428
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00021421
    .4byte 0x0a6d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020321
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00512621
    .4byte 0x00513b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a751b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00020540
    .4byte 0x0000001b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a761b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342c
    .4byte 0x00002220
    .4byte 0x00172620
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x75a0
    .4byte 0x00003020
    .4byte 0x00c83b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x000f1220
    .4byte 0x00001a20
    .4byte 0x0a771b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012621
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a781b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x0000001b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00311420
    .4byte 0x00210e20
    .4byte 0x001a3322
    .4byte 0x000a0c40
    .4byte 0x0000000c
    .4byte 0x0a791b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00001388
    .4byte 0x00003721
    .4byte 0x0a7a1b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00261220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x0a7b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00001388
    .4byte 0x00003721
    .4byte 0x0a7c1b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00261220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x000b0820
    .4byte 0x00001b22
    .4byte 0x00041721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00020321
    .4byte 0x00630c41
    .4byte 0x0000000c
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x000f2520
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x7f80
    .4byte 0x00003020
    .4byte 0x00041720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x7fa8
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00513425
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x002e1220
    .4byte 0x0a7d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00000721
    .4byte 0x00533f41
    .4byte 0x00000051
    .4byte 0x00041721
    .4byte 0x00630820
    .4byte 0x00750229
    .4byte 0x000e2a21
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a281b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00123422
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a271b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00123422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a801b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x000e3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00141220
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x71cc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x72a8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x004f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a6e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x72e4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x7320
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x7370
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x73ac
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00141220
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x73e8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x000e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a6f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001a21
    .4byte 0x00352140
    .4byte 0x00000000
    .4byte 0x00801720
    .4byte 0x00021723
    .4byte 0x00142140
    .4byte 0x00000000
    .4byte 0x002c1328
    .4byte 0x00021722
    .4byte 0x02103a41
    .4byte 0x00080008
    .4byte 0x0a811b20
    .4byte 0x00001d20
    .4byte 0x7fff1328
    .4byte 0x00021723
    .4byte 0x00001b22
    .4byte 0x000b0540
    .4byte 0x0004000e
    .4byte 0x000f2520
    .4byte 0x004e1220
    .4byte 0x00021722
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x8878
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a821b20
    .4byte 0x00001d20
    .4byte 0x00251220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x00102f40
    .4byte 0x04090001
    .4byte 0x00102f40
    .4byte 0x04090002
    .4byte 0x00102f40
    .4byte 0x0409000b
    .4byte 0x00102f40
    .4byte 0x04090019
    .4byte 0x00140e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x0007000a
    .4byte 0x000e2520
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x81d4
    .4byte 0x00003020
    .4byte 0xffff2f40
    .4byte 0x07090052
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x8634
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00102f42
    .4byte 0x00030052
    .4byte 0x00003020
    .4byte 0x00523b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00261220
    .4byte 0x00001a20
    .4byte 0x0a831b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0xffff2f40
    .4byte 0x07080052
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00141220
    .4byte 0x001c2621
    .4byte 0x00101720
    .4byte 0x001c3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x0000002a
    .4byte 0x00030540
    .4byte 0x00000a84
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x000c0229
    .4byte 0x000e0229
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x07092628
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x865c
    .4byte 0x00003020
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00261220
    .4byte 0x00001a20
    .4byte 0x0a851b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f41
    .4byte 0x00cb0053
    .4byte 0x00003020
    .4byte 0x00082f42
    .4byte 0x000200cb
    .4byte 0x00002f42
    .4byte 0x00010052
    .4byte 0x00003020
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a861b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f42
    .4byte 0x00000052
    .4byte 0x00003020
    .4byte 0x00002f41
    .4byte 0x00cb0053
    .4byte 0x00003020
    .4byte 0x00cb342f
    .4byte 0x00100e20
    .4byte 0x00002f40
    .4byte 0x08090053
    .4byte 0x00003020
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a871b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f41
    .4byte 0x00400053
    .4byte 0x00003020
    .4byte 0x0040342f
    .4byte 0x00002f40
    .4byte 0x0b110053
    .4byte 0x00003020
    .4byte 0x0053342f
    .4byte 0x06092628
    .4byte 0x00002f40
    .4byte 0x05090052
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x8698
    .4byte 0x00003020
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x0000001c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x534
    .4byte 0x00261220
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x004a2520
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x8984
    .4byte 0x00003020
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00030540
    .4byte 0x00000a8b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00102f42
    .4byte 0x00030053
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00533f41
    .4byte 0x000000cb
    .4byte 0x00c0342f
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a8c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000053
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x190
    .4byte 0x00302f40
    .4byte 0x03060040
    .4byte 0x00003020
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a8d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x000b0540
    .4byte 0x0007000a
    .4byte 0x000e2520
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x8724
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a8e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x8724
    .4byte 0x00003020
    .4byte 0x00403242
    .4byte 0x00000000
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0809fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x000f0e20
    .4byte 0x00002f42
    .4byte 0x00020040
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002c1220
    .4byte 0x00001a20
    .4byte 0x0a8f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0040342f
    .4byte 0x7fff1324
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x8774
    .4byte 0x00003020
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0a901b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x879c
    .4byte 0x001e0e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00203322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x0a911b20
    .4byte 0x00001d20
    .4byte 0x00291326
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000091
    .4byte 0x00203720
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x0000003e
    .4byte 0x00203720
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0a941b20
    .4byte 0x00001d20
    .4byte 0x00291326
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000091
    .4byte 0x00013720
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x0000003e
    .4byte 0x00013720
    .4byte 0x00010820
    .4byte 0x7fff1326
    .4byte 0x00101721
    .4byte 0x00022720
    .4byte 0x00002220
    .4byte 0x00182620
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x87d8
    .4byte 0x00003020
    .4byte 0x00cd342f
    .4byte 0x00203322
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x00101720
    .4byte 0x00203b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00321220
    .4byte 0x0a921b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00020820
    .4byte 0x00101720
    .4byte 0x000f0e20
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x87d8
    .4byte 0x00003020
    .4byte 0x00cd3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00203322
    .4byte 0x000a0c40
    .4byte 0x0000000c
    .4byte 0x00261220
    .4byte 0x0a931b20
    .4byte 0x00001d20
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x00261220
    .4byte 0x0a951b20
    .4byte 0x00001d20
    .4byte 0x000b0820
    .4byte 0x002b2141
    .4byte 0x00040001
    .4byte 0x00001a21
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x0004000e
    .4byte 0x000f2520
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x89fc
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0a961b20
    .4byte 0x00001d20
    .4byte 0x00101721
    .4byte 0x00001b22
    .4byte 0x00760229
    .4byte 0x000f2a21
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0a971b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x001c3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000009
    .4byte 0x00030540
    .4byte 0x0000001c
    .4byte 0x00040540
    .4byte 0x000026fc
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000a98
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000a99
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000a9b
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000a9c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000a9d
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000a9a
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x84
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x8530
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x85e4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000c0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x8558
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x02000f21
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x85a8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000e0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000e0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00070008
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00070009
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0007000a
    .4byte 0x00000721
    .4byte 0x00020540
    .4byte 0x00010000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x5f4
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00261220
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x89fc
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b171b20
    .4byte 0x00001d20
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x15172620
    .4byte 0x00002220
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x8c3c
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00573242
    .4byte 0x00000000
    .4byte 0x00020540
    .4byte 0x00000057
    .4byte 0xffff2f48
    .4byte 0x1215fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00573b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b181b20
    .4byte 0x00001d20
    .4byte 0x00101721
    .4byte 0x00001b22
    .4byte 0x0057342f
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x8f70
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00251220
    .4byte 0x00090228
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x8ffc
    .4byte 0x00003020
    .4byte 0x00090220
    .4byte 0x000f3421
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x001d3428
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x001f3428
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00030540
    .4byte 0x00000b1b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x2de4
    .4byte 0x00770229
    .4byte 0x00102a21
    .4byte 0x00000120
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x0b271b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x0000004a
    .4byte 0x00013720
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000093
    .4byte 0x00013720
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0b281b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000091
    .4byte 0x000f3720
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x0000003e
    .4byte 0x000f3720
    .4byte 0x00010820
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x050c2628
    .4byte 0x00002220
    .4byte 0x00101720
    .4byte 0x08083b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b291b20
    .4byte 0x00001d20
    .4byte 0x002d1420
    .4byte 0x00210e20
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x0b2a1b21
    .4byte 0x00001d20
    .4byte 0x00041421
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00173322
    .4byte 0x00630c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x002b1220
    .4byte 0x0b2b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00630820
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000b36
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000088
    .4byte 0xffff3720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000b37
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000b38
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00271420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0b2c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b2d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b2e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b2f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b301b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b311b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x904c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x9088
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x90c4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x9100
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x9128
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x922c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00813920
    .4byte 0x00010540
    .4byte 0x00011200
    .4byte 0x00823920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x0000000f
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81b50c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81b50820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000062
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81c50c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81c50820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000089
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81d50c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81d50820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000054
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81e50c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81e50820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000048
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81f50c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81f50820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000063
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x82050c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x82050820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000073
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x82150c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x82150820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000031
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x82250c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x82250820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000051
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x82350c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x82350820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x33ec
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00102520
    .4byte 0x00002c40
    .4byte gUnknown_088B3AD8 + 0x9380
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x9484
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x96dc
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x0000342a
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000c0229
    .4byte 0x00000120
    .4byte 0x00471220
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00402520
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9b70
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b391b20
    .4byte 0x00001d20
    .4byte 0x00251220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00101720
    .4byte 0x00102f42
    .4byte 0x0003001e
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b3a1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x000c0000
    .4byte 0x00422520
    .4byte 0x00022d20
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9d38
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9d74
    .4byte 0x00003020
    .4byte 0x00b11620
    .4byte 0x00002720
    .4byte 0x00002f40
    .4byte 0x0607006d
    .4byte 0x00003020
    .4byte 0x00002721
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9d9c
    .4byte 0x00003020
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00010c41
    .4byte 0x0001000c
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b3b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00010820
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00020c40
    .4byte 0x0001000c
    .4byte 0x002e1220
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9dd8
    .4byte 0x00003020
    .4byte 0x00403420
    .4byte 0x00573420
    .4byte 0x00101720
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0b07fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00020540
    .4byte 0x00000057
    .4byte 0xffff2f48
    .4byte 0x0b08fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9dd8
    .4byte 0x00003020
    .4byte 0x00803b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000010
    .4byte 0x00030540
    .4byte 0x00000b3c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00102f42
    .4byte 0x00000080
    .4byte 0x00102f42
    .4byte 0x00010081
    .4byte 0x00003020
    .4byte 0x00020820
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00030c41
    .4byte 0x0001000c
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9dd8
    .4byte 0x00003020
    .4byte 0xffff2f42
    .4byte 0x00000080
    .4byte 0xffff2f42
    .4byte 0x00010081
    .4byte 0x00101720
    .4byte 0x00030820
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9e3c
    .4byte 0x00003020
    .4byte 0x00b11620
    .4byte 0x00002720
    .4byte 0x00102f40
    .4byte 0x05070040
    .4byte 0x00003020
    .4byte 0x00102f40
    .4byte 0x06080057
    .4byte 0x00003020
    .4byte 0x00002721
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9e78
    .4byte 0x00003020
    .4byte 0x00102f42
    .4byte 0x00010080
    .4byte 0x00003020
    .4byte 0x00102f42
    .4byte 0x00000081
    .4byte 0x00003020
    .4byte 0x002e1220
    .4byte 0x00803b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000010
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00040c41
    .4byte 0x0001000c
    .4byte 0x0b3d1b20
    .4byte 0x00001d20
    .4byte 0x00050920
    .4byte 0x00040820
    .4byte 0x0b3e1b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00050820
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00060c41
    .4byte 0x0001000c
    .4byte 0x0b3f1b20
    .4byte 0x00001d20
    .4byte 0x00070920
    .4byte 0x00060820
    .4byte 0x002d1220
    .4byte 0x0b401b20
    .4byte 0x00001d20
    .4byte 0x00070820
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00080c41
    .4byte 0x0001000c
    .4byte 0x00002220
    .4byte 0x00002620
    .4byte 0x002d1220
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9eb4
    .4byte 0x00003020
    .4byte 0x00573b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00030540
    .4byte 0x00000b41
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x00020540
    .4byte 0x00000057
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00080820
    .4byte 0x00002d20
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x37b0
    .4byte 0x00112a21
    .4byte 0x00000120
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00321220
    .4byte 0x00020540
    .4byte 0x0000000a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b491b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00422520
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9f30
    .4byte 0x00003020
    .4byte 0x00b11620
    .4byte 0x00002720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9f6c
    .4byte 0x00003020
    .4byte 0x00fb3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x7fff1324
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b4a1b20
    .4byte 0x00001d20
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x0004000e
    .4byte 0x00102520
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x98f8
    .4byte 0x00003020
    .4byte 0x00041720
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00311220
    .4byte 0x00001a20
    .4byte 0x0b4b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x98f8
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b4c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f40
    .4byte 0x0b0c0001
    .4byte 0x00002f40
    .4byte 0x0b0e000f
    .4byte 0x00002f40
    .4byte 0x0b0d0002
    .4byte 0x00140e22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00432520
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xa084
    .4byte 0x00003020
    .4byte 0x00951220
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xa020
    .4byte 0x00001a24
    .4byte 0x000b0540
    .4byte 0x00400008
    .4byte 0x0b4d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0540
    .4byte 0x00580030
    .4byte 0x0b4e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0540
    .4byte 0x00480060
    .4byte 0x0b4f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b501b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x003c0e20
    .4byte 0x000b0540
    .4byte 0x0004000e
    .4byte 0x00102520
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9948
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b511b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a061862
    .4byte 0x00800004
    .4byte 0x00800080
    .4byte 0x00000d41
    .4byte sub_8080014
    .4byte 0x000b0540
    .4byte 0x0003000d
    .4byte 0xffff2720
    .4byte 0x000b0540
    .4byte 0x0003000e
    .4byte 0xffff2720
    .4byte 0x0a061862
    .4byte 0x01000004
    .4byte 0x01000100
    .4byte 0x00060228
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9948
    .4byte 0x00140e20
    .4byte 0x00041721
    .4byte 0x00003020
    .4byte 0x00060220
    .4byte 0x0000342a
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00472520
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xa14c
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x002b1326
    .4byte 0x0b521b20
    .4byte 0x00001d20
    .4byte 0x7fff1326
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x00002220
    .4byte 0x00041720
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b531b20
    .4byte 0x00001d20
    .4byte 0x02eb1620
    .4byte 0x00041723
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3c7c
    .4byte 0x002b1326
    .4byte 0x00001a21
    .4byte 0x0b541b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00041720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xa1b0
    .4byte 0x00003020
    .4byte 0x00b11620
    .4byte 0x00002720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xa1d8
    .4byte 0x00003020
    .4byte 0x00b11620
    .4byte 0x00012720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xa200
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b551b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000092
    .4byte 0x000f3720
    .4byte 0x0b561b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000085
    .4byte 0x00013720
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x0b571b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0b581b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00101721
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x0004000e
    .4byte 0x00102520
    .4byte 0x000b0540
    .4byte 0x0003000d
    .4byte 0xffff2720
    .4byte 0x000b0540
    .4byte 0x0003000e
    .4byte 0xffff2720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x99d4
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9a24
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x0003000d
    .4byte 0xffff2721
    .4byte 0x000b0540
    .4byte 0x0003000e
    .4byte 0xffff2721
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00311220
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x000a0c41
    .4byte 0x0001000c
    .4byte 0x00001a20
    .4byte 0x0b591b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x00001a20
    .4byte 0x0b5a1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0820
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x9a74
    .4byte 0x00003020
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x00000120
    .4byte 0x002a0620
    .4byte 0x00352140
    .4byte 0x00000000
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a061862
    .4byte 0x02000000
    .4byte 0x02000200
    .4byte 0x00801722
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00041020
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3cd8
    .4byte 0x7fff1324
    .4byte 0x00001a21
    .4byte 0x00a20620
    .4byte 0xffff2140
    .4byte 0x00000000
    .4byte 0x00041722
    .4byte 0x00001020
    .4byte 0x00000120
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x00001a23
    .4byte 0x000b0540
    .4byte 0xffffffff
    .4byte 0x0b5b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3d50
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3dd0
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00001a23
    .4byte 0x000b0540
    .4byte 0xffffffff
    .4byte 0x0b5c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3dd0
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3d50
    .4byte 0x00010820
    .4byte 0x00101723
    .4byte 0x00000120
    .4byte 0x00001a23
    .4byte 0x000b0540
    .4byte 0xffffffff
    .4byte 0x0b5d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c41
    .4byte 0x0007000c
    .4byte 0x00101721
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x3c
    .4byte 0x00014040
    .4byte 0x00980004
    .4byte 0x00041020
    .4byte 0x00001a21
    .4byte 0x00352140
    .4byte 0x00000000
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a061862
    .4byte 0x02000000
    .4byte 0x02000200
    .4byte 0x00101720
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3e50
    .4byte 0x00010820
    .4byte 0x00000120
    .4byte 0x00001a23
    .4byte 0x000b0540
    .4byte 0xffffffff
    .4byte 0x0b5e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c41
    .4byte 0x0007000c
    .4byte 0x00101721
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x3c
    .4byte 0x000f4040
    .4byte 0x00990003
    .4byte 0x00041020
    .4byte 0x00001a21
    .4byte 0x00352140
    .4byte 0x00000000
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a061862
    .4byte 0x02000000
    .4byte 0x02000200
    .4byte 0x00101720
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3e84
    .4byte 0x00010820
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000098
    .4byte 0x00013720
    .4byte 0x00041020
    .4byte 0x00001a23
    .4byte 0x000b0540
    .4byte 0xffffffff
    .4byte 0x0b5f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000099
    .4byte 0x000f3720
    .4byte 0x00041020
    .4byte 0x00001a23
    .4byte 0x000b0540
    .4byte 0xffffffff
    .4byte 0x0b601b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x98a8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x008f3920
    .4byte 0x00010540
    .4byte 0x00010303
    .4byte 0x00903920
    .4byte 0x000c0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x9768
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x97e0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x1b132620
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x9830
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x9880
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x98d0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xa484
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3f80
    .4byte 0x000e0229
    .4byte 0x00000120
    .4byte 0x002c1326
    .4byte 0x002a0620
    .4byte 0x00001a21
    .4byte 0x00352140
    .4byte 0x00000000
    .4byte 0x00021723
    .4byte 0x000f2140
    .4byte 0x00000000
    .4byte 0x00021722
    .4byte 0x02103a41
    .4byte 0x00080008
    .4byte 0x0b611b20
    .4byte 0x00001d20
    .4byte 0x7fff1328
    .4byte 0x00021723
    .4byte 0x00001b22
    .4byte 0x00212140
    .4byte 0x00000000
    .4byte 0x00521220
    .4byte 0x00021722
    .4byte 0x0b621b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x418c
    .4byte 0x0b0d2628
    .4byte 0x00a20620
    .4byte 0x00012c40
    .4byte 0xffffffff
    .4byte 0x00003020
    .4byte 0xffff2f40
    .4byte 0x00000040
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xa68c
    .4byte 0x00003020
    .4byte 0x00f73b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000019
    .4byte 0x00030540
    .4byte 0x00000b64
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x0f0b2628
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xa9e8
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000019
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b651b20
    .4byte 0x00001d20
    .4byte 0x7fff1321
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00101720
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0e08fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x00020540
    .4byte 0x00000019
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b661b20
    .4byte 0x00001d20
    .4byte 0x002d1220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x7fff1321
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00261220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00020540
    .4byte 0x00000019
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b671b20
    .4byte 0x00001d20
    .4byte 0x002d1220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x7fff1321
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00261220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x00010820
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x060f2628
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0614fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x0000342a
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00112520
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x001e2520
    .4byte 0x00010820
    .4byte 0x00261220
    .4byte 0x08072628
    .4byte 0x00101720
    .4byte 0x00001a20
    .4byte 0x0b631b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xa844
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00001701
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00010f00
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00006401
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00000721
    .4byte 0x00c03f41
    .4byte 0x0000008d
    .4byte 0x00c0342f
    .4byte 0x00c1342d
    .4byte 0x00c1342e
    .4byte 0x00c1342d
    .4byte 0x00c1342e
    .4byte 0x00c1342d
    .4byte 0x00c1342e
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x0b0d2628
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xa8f8
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000500
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00016401
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00000721
    .4byte 0x00c03f41
    .4byte 0x0000008d
    .4byte 0x00c0342f
    .4byte 0x00c1342d
    .4byte 0x00c1342e
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x060f2628
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xa95c
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00016401
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00000721
    .4byte 0x00c03f41
    .4byte 0x0000008d
    .4byte 0x00c0342f
    .4byte 0x00c1342d
    .4byte 0x00c1342e
    .4byte 0x00c1342d
    .4byte 0x00c1342e
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x4334
    .4byte 0x00122a21
    .4byte 0x00000120
    .4byte 0x00070540
    .4byte 0x00000000
    .4byte 0x00213322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00f63322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00f73322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00f43322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00f53322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000820
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x00000021
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x080b2628
    .4byte 0x00101720
    .4byte 0x00403242
    .4byte 0x00000000
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x070cfffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00100e20
    .4byte 0x00042f42
    .4byte 0x00020040
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002d1220
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x000a0c41
    .4byte 0x0001000c
    .4byte 0x00020540
    .4byte 0x00000b6e
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x00020540
    .4byte 0x00000b70
    .4byte 0x000b0820
    .4byte 0x00001a20
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x0000424c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000428c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00100000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000040
    .4byte 0x001e0e22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xaa60
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000019
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00140c41
    .4byte 0x0001000c
    .4byte 0x0b6f1b20
    .4byte 0x00001d20
    .4byte 0x00150920
    .4byte 0x00140820
    .4byte 0x0b711b20
    .4byte 0x00001d20
    .4byte 0x00150820
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0040342f
    .4byte 0x00002f42
    .4byte 0x0002000f
    .4byte 0x00003020
    .4byte 0x7fff1324
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00261220
    .4byte 0x00001a20
    .4byte 0x0b721b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00041721
    .4byte 0x00020540
    .4byte 0x0000001f
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001520
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x001e0c41
    .4byte 0x0001000c
    .4byte 0x0b731b20
    .4byte 0x00001d20
    .4byte 0x001f0920
    .4byte 0x001e0820
    .4byte 0x0b741b20
    .4byte 0x00001d20
    .4byte 0x001f0820
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000094
    .4byte 0x00003720
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x0000008e
    .4byte 0x00003720
    .4byte 0x00340c40
    .4byte 0x00000007
    .4byte 0x00261220
    .4byte 0x00320e20
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x0000001f
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00320c41
    .4byte 0x0001000c
    .4byte 0x0b751b20
    .4byte 0x00001d20
    .4byte 0x00330920
    .4byte 0x00320820
    .4byte 0x0b761b20
    .4byte 0x00001d20
    .4byte 0x00330820
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000055
    .4byte 0x00003720
    .4byte 0x00340820
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0b771b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00213422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0b781b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00213422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0b791b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00213422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xa704
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xa790
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xa7cc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xa808
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x05000f21
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xa754
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000e0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000e0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x000c0013
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x000e0011
    .4byte 0x00000721
    .4byte 0x00020540
    .4byte 0x00011200
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x5f4
    .4byte 0x00010540
    .4byte 0x000d0012
    .4byte 0x00000721
    .4byte 0x00020540
    .4byte 0x00010e00
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x5f4
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xb614
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xb9fc
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x47cc
    .4byte 0x00000120
    .4byte 0x00491220
    .4byte 0x00020540
    .4byte 0x00000032
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x0b7a1b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x002c1220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0b7b1b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x002c1220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xb858
    .4byte 0x00003020
    .4byte 0x00491220
    .4byte 0x00c03b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000032
    .4byte 0x00030540
    .4byte 0x00000b7c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x0f0c2628
    .4byte 0x003c0e20
    .4byte 0x1b002620
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00251220
    .4byte 0x00020540
    .4byte 0x00000032
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b7d1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342b
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00080229
    .4byte 0x000a0229
    .4byte 0x000c0229
    .4byte 0x000e0229
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00491220
    .4byte 0x00101721
    .4byte 0x0e0e2628
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xb8f8
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00403242
    .4byte 0x00000000
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0b12fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b7e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f42
    .4byte 0x00010001
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x00002f40
    .4byte 0x0d100001
    .4byte 0x00100e22
    .4byte 0x00002f40
    .4byte 0x0d0e000f
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b7f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f40
    .4byte 0x09120001
    .4byte 0x00140e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x00162620
    .4byte 0x00002f40
    .4byte 0x04100001
    .4byte 0x00101720
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002c1324
    .4byte 0x00001a20
    .4byte 0x0b801b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0413fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00002f42
    .4byte 0x00010001
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b811b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00102f42
    .4byte 0x00010001
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b821b20
    .4byte 0x00001d20
    .4byte 0x7fff1322
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x002d1220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0113fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x190
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b831b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1326
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xb984
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00321220
    .4byte 0x00001a20
    .4byte 0x0b841b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00041721
    .4byte 0x00020540
    .4byte 0x00000032
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b8a1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00132a21
    .4byte 0x00000120
    .4byte 0x00060321
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00030229
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x48e8
    .4byte 0x00000121
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00080221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xba88
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000a0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xbac4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000c0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xbb00
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xbb50
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xbb78
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xbbb4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcb28
    .4byte 0x00030540
    .4byte gUnknown_088B3AD8 + 0xcb64
    .4byte 0x00040540
    .4byte gUnknown_088B3AD8 + 0xc920
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x4c5c
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00390620
    .4byte 0x004a0620
    .4byte 0x00241220
    .4byte 0x00012c40
    .4byte 0xffffffff
    .4byte 0x00003020
    .4byte 0x00002920
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xce0c
    .4byte 0x00003020
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b8b1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00010311
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00010291
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000019
    .4byte 0x00003020
    .4byte 0x00102f42
    .4byte 0x00030001
    .4byte 0x00102f42
    .4byte 0x0003000f
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b8c1b20
    .4byte 0x00001d20
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x00041720
    .4byte 0x00c83b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x0b8d1b20
    .4byte 0x00001d20
    .4byte 0x7fff1326
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0xffff2920
    .4byte 0x00001a21
    .4byte 0x000e2140
    .4byte 0x00000000
    .4byte 0x00041720
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x0b8e1b20
    .4byte 0x00001d20
    .4byte 0x00291220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00020920
    .4byte 0x00000820
    .4byte 0x00223322
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x0b8f1b20
    .4byte 0x00001d20
    .4byte 0x00291220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00020920
    .4byte 0x00010820
    .4byte 0x0b901b20
    .4byte 0x00001d20
    .4byte 0x00291220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00020820
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x18002620
    .4byte 0x00032d20
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xce84
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xceac
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xce84
    .4byte 0x00003020
    .4byte 0x00ce3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002e1220
    .4byte 0x00001a20
    .4byte 0x0b911b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000057
    .4byte 0xffff2f48
    .4byte 0x1508fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00020540
    .4byte 0x0000008d
    .4byte 0xffff2f48
    .4byte 0x1506fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00016400
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00000721
    .4byte 0x008d3f41
    .4byte 0x000000ce
    .4byte 0x00ce342f
    .4byte 0x00001a20
    .4byte 0x0b921b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00002d20
    .4byte 0x0000342c
    .4byte 0x0b102628
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xcee8
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xcf4c
    .4byte 0x00003020
    .4byte 0x00c03b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00261220
    .4byte 0x00001a20
    .4byte 0x0b931b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f40
    .4byte 0x111000c0
    .4byte 0x00003020
    .4byte 0x00c0342f
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xcee8
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x000a0c41
    .4byte 0x0001000c
    .4byte 0x00001a20
    .4byte 0x0b941b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x00001a20
    .4byte 0x0b951b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0820
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x00920620
    .4byte 0x00012c40
    .4byte 0xffffffff
    .4byte 0x00003020
    .4byte 0x00a20620
    .4byte 0x00012c40
    .4byte 0xffffffff
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x18002620
    .4byte 0x00181220
    .4byte 0x00101720
    .4byte 0x00001a20
    .4byte 0x0b961b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000120
    .4byte 0x00012621
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00111220
    .4byte 0x00020540
    .4byte 0x0000000b
    .4byte 0x00030540
    .4byte 0x00000b97
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x4fe8
    .4byte 0x00142a21
    .4byte 0x00000120
    .4byte 0x00001925
    .4byte 0x00c70620
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x0000000a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x0b9c1b20
    .4byte 0x00001d20
    .4byte 0x00030920
    .4byte 0x00000820
    .4byte 0x00070321
    .4byte 0x00020c41
    .4byte 0x0000000c
    .4byte 0x00223322
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x0b9d1b20
    .4byte 0x00001d20
    .4byte 0x00030920
    .4byte 0x00010820
    .4byte 0x0b9e1b20
    .4byte 0x00001d20
    .4byte 0x00030920
    .4byte 0x00020820
    .4byte 0x0b9f1b20
    .4byte 0x00001d20
    .4byte 0x00030820
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002920
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00482520
    .4byte 0x00041720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xd0b8
    .4byte 0x00003020
    .4byte 0x00b11620
    .4byte 0x00002720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xd0f4
    .4byte 0x00003020
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xd16c
    .4byte 0x00003020
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002f
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x002b1220
    .4byte 0x0ba01b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x000a0c41
    .4byte 0x0001000c
    .4byte 0x000b0540
    .4byte 0x00180000
    .4byte 0x00132520
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x000b0540
    .4byte 0x00180000
    .4byte 0x00202520
    .4byte 0x000b0820
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xcf74
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xd014
    .4byte 0x00003020
    .4byte 0x00c83b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000012
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00311220
    .4byte 0x0ba11b20
    .4byte 0x00001d20
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00140c41
    .4byte 0x0001000c
    .4byte 0x0ba21b21
    .4byte 0x00001d20
    .4byte 0x00150920
    .4byte 0x00140820
    .4byte 0x0ba31b21
    .4byte 0x00001d20
    .4byte 0x00150820
    .4byte 0x0ba41b21
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000087
    .4byte 0x00003720
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x0000008c
    .4byte 0x00003720
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00002710
    .4byte 0x00003721
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x001e0c41
    .4byte 0x0001000c
    .4byte 0x0ba51b20
    .4byte 0x00001d20
    .4byte 0x001f0920
    .4byte 0x001e0820
    .4byte 0x0ba61b20
    .4byte 0x00001d20
    .4byte 0x001f0820
    .4byte 0x00001b22
    .4byte 0x00080540
    .4byte 0x00000006
    .4byte 0x002a0c45
    .4byte 0x00080007
    .4byte 0x00020540
    .4byte 0x00000012
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00280c41
    .4byte 0x0001000c
    .4byte 0x0ba71b20
    .4byte 0x00001d20
    .4byte 0x00290920
    .4byte 0x00280820
    .4byte 0x0ba81b20
    .4byte 0x00001d20
    .4byte 0x00290820
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000010
    .4byte 0x00003720
    .4byte 0x002a0820
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcc18
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcc40
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcc68
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcca4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcce0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcd1c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcd58
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xcdbc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd418
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5428
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xd418
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xd7c4
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd7ec
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000a0229
    .4byte 0x000c0229
    .4byte 0x000e0229
    .4byte 0x00100229
    .4byte 0x00000120
    .4byte 0x002a0620
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xdb5c
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x002d1220
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000031
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x0ba91b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0baa1b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00001b22
    .4byte 0x7fff1326
    .4byte 0x00041721
    .4byte 0x00002220
    .4byte 0x141d2620
    .4byte 0x004d1220
    .4byte 0x00041720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xdb84
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000031
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00020c41
    .4byte 0x0001000c
    .4byte 0x0bab1b20
    .4byte 0x00001d20
    .4byte 0x00261220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00030920
    .4byte 0x00020820
    .4byte 0x0bac1b20
    .4byte 0x00001d20
    .4byte 0x00261220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00030820
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x0c0b2628
    .4byte 0x00a20620
    .4byte 0x00012c40
    .4byte 0xffffffff
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xd7c4
    .4byte 0x00003020
    .4byte 0x00413420
    .4byte 0x00101720
    .4byte 0x000f0e20
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a061862
    .4byte 0x00800008
    .4byte 0x00800080
    .4byte 0x00414320
    .4byte 0x0a061862
    .4byte 0x01000008
    .4byte 0x01000100
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000031
    .4byte 0x00030540
    .4byte 0x00000bad
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00102f40
    .4byte 0x0b0b0040
    .4byte 0x00003020
    .4byte 0x0040342f
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00000120
    .4byte 0x00572629
    .4byte 0x00151220
    .4byte 0x00573b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bae1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x562c
    .4byte 0x002d1220
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000034
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0bb61b20
    .4byte 0x00001d20
    .4byte 0x00101721
    .4byte 0x00001b22
    .4byte 0x00152a22
    .4byte 0x00000120
    .4byte 0x7fff1322
    .4byte 0x00020540
    .4byte 0x00000033
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0bb31b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002220
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xdc10
    .4byte 0x00003020
    .4byte 0x001e2629
    .4byte 0x00291328
    .4byte 0x00041720
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000031
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x0bb41b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0bb51b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x0012000c
    .4byte 0x00152520
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xdc54
    .4byte 0x00003020
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd83c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd878
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd8a0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd8dc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x03000f21
    .4byte 0x000a0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd904
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000a0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000a0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000c0221
    .4byte 0x06010f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x000c0221
    .4byte 0x00010f20
    .4byte 0x00070540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000003
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd940
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00010f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000c0229
    .4byte 0x00000820
    .4byte 0x00010f23
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000e0221
    .4byte 0x06020f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x000e0221
    .4byte 0x00020f20
    .4byte 0x00070540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000003
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd990
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000e0229
    .4byte 0x00000820
    .4byte 0x00020f23
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00100221
    .4byte 0x0d030f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00100221
    .4byte 0x00030f20
    .4byte 0x00070540
    .4byte 0x0000000b
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x0000000a
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000008
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000007
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000004
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000002
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x0b0b2628
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xd9e0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00030f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00100229
    .4byte 0x00000820
    .4byte 0x00030f23
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xda30
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xda80
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xdabc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xdae4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xdb0c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5aa4
    .4byte 0x006c3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002d1220
    .4byte 0x00001a20
    .4byte 0x0bbd1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x0000006c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x006c342f
    .4byte 0x00101721
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xde48
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000b0229
    .4byte 0x000c0229
    .4byte 0x000d0229
    .4byte 0x00000120
    .4byte 0x00001a21
    .4byte 0x00352140
    .4byte 0x00000000
    .4byte 0x00021723
    .4byte 0x00142140
    .4byte 0x00000000
    .4byte 0x00021722
    .4byte 0x002c1326
    .4byte 0x020f3a41
    .4byte 0x00080008
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x0bba1b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0bbb1b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00001b22
    .4byte 0x7fff1328
    .4byte 0x00021723
    .4byte 0x00002220
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xdc54
    .4byte 0x00003020
    .4byte 0x00021722
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xe2f8
    .4byte 0x00003020
    .4byte 0x00102f40
    .4byte 0x140b0000
    .4byte 0x00003020
    .4byte 0x00003b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x000a0c41
    .4byte 0x0001000c
    .4byte 0x00441220
    .4byte 0x00001a20
    .4byte 0x0bbc1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x00001a20
    .4byte 0x0bbe1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0820
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x7fff1326
    .4byte 0x0a061862
    .4byte 0x00800008
    .4byte 0x00800080
    .4byte 0x011d1862
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x4f0
    .4byte 0x0040342f
    .4byte 0x001e0e20
    .4byte 0x006c3242
    .4byte 0x00000000
    .4byte 0x011d1862
    .4byte 0x01000000
    .4byte 0x01000100
    .4byte 0x00020540
    .4byte 0x0000006c
    .4byte 0xffff2f48
    .4byte 0x120bfffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x4b4
    .4byte 0x0a061862
    .4byte 0x01000008
    .4byte 0x01000100
    .4byte 0x00000120
    .4byte 0x7fff1326
    .4byte 0x00041721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x040b2628
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xe370
    .4byte 0x00003020
    .4byte 0x00041720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xe370
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bc51b20
    .4byte 0x00001d20
    .4byte 0x00441326
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5c74
    .4byte 0x00162a23
    .4byte 0x00000120
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a061862
    .4byte 0x00000004
    .4byte 0x00000000
    .4byte 0x001e0e20
    .4byte 0x00022f42
    .4byte 0x00030040
    .4byte 0x00003020
    .4byte 0x001e0e22
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0040342f
    .4byte 0x00001a20
    .4byte 0x0bc71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001a24
    .4byte 0x000b0540
    .4byte 0x0080ffff
    .4byte 0x0bc81b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000b0221
    .4byte 0x01000f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xe12c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000b0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000b0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000c0221
    .4byte 0x01010f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xe1a4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00010f23
    .4byte 0x000c0221
    .4byte 0x00010f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000c0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000d0221
    .4byte 0x0a020f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xe208
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020f23
    .4byte 0x000d0221
    .4byte 0x00020f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000d0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00b13920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5e0c
    .4byte 0x00000120
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a061862
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00801720
    .4byte 0x00001a24
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c41
    .4byte 0x0001000c
    .4byte 0x000b0540
    .4byte 0x0068ffff
    .4byte 0x0bc91b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x000b0540
    .4byte 0x0068ffff
    .4byte 0x0bca1b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00001b22
    .4byte 0x00020320
    .4byte 0x00020c41
    .4byte 0x0000000c
    .4byte 0x00011020
    .4byte 0x00000d40
    .4byte sub_807F878
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xe5c0
    .4byte 0x00003020
    .4byte 0x0a061862
    .4byte 0x01000008
    .4byte 0x01000100
    .4byte 0x002f1220
    .4byte 0x00000d40
    .4byte sub_807FCC0
    .4byte 0x00001020
    .4byte 0x00030920
    .4byte 0x00020820
    .4byte 0x002f1220
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xe5c0
    .4byte 0x00003020
    .4byte 0x00030820
    .4byte 0x0a0b2628
    .4byte 0x00002c40
    .4byte gUnknown_088B3AD8 + 0xe46c
    .4byte 0x00003020
    .4byte 0x00003b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x000a0c41
    .4byte 0x0001000c
    .4byte 0x00001a20
    .4byte 0x0bcb1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0920
    .4byte 0x000a0820
    .4byte 0x00001a20
    .4byte 0x0bcc1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000b0820
    .4byte 0x0f0b2628
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xe4a8
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00013428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00193428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00023428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0xe4e4
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00013428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00193428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00023428
    .4byte 0x00003b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x000c0c41
    .4byte 0x0001000c
    .4byte 0x00001a20
    .4byte 0x0bcd1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000d0920
    .4byte 0x000c0820
    .4byte 0x00001a20
    .4byte 0x0bce1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x000d0820
    .4byte 0x00451220
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x000e0c41
    .4byte 0x0001000c
    .4byte 0x000f3322
    .4byte 0x809d0c40
    .4byte 0x0000000c
    .4byte 0x000f3323
    .4byte 0x809d0c40
    .4byte 0x0000000c
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd01b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x809d0820
    .4byte 0x000f0920
    .4byte 0x000e0820
    .4byte 0x00013322
    .4byte 0x80a10c40
    .4byte 0x0000000c
    .4byte 0x00013323
    .4byte 0x80a10c40
    .4byte 0x0000000c
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bcf1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80a10820
    .4byte 0x000f0820
    .4byte 0x00023322
    .4byte 0x80a40c40
    .4byte 0x0000000c
    .4byte 0x00023323
    .4byte 0x80a40c40
    .4byte 0x0000000c
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd11b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80a40820
    .4byte 0x00113322
    .4byte 0x80a50c40
    .4byte 0x0000000c
    .4byte 0x00113323
    .4byte 0x80a50c40
    .4byte 0x0000000c
    .4byte 0x00113b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bde1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80a50820
    .4byte 0x00103322
    .4byte 0x80a60c40
    .4byte 0x0000000c
    .4byte 0x00103323
    .4byte 0x80a60c40
    .4byte 0x0000000c
    .4byte 0x00103b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bdf1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80a60820
    .4byte 0x00043322
    .4byte 0x80a70c40
    .4byte 0x0000000c
    .4byte 0x00043323
    .4byte 0x80a70c40
    .4byte 0x0000000c
    .4byte 0x00043b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd21b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80a70820
    .4byte 0x000b3322
    .4byte 0x80a90c40
    .4byte 0x0000000c
    .4byte 0x000b3323
    .4byte 0x80a90c40
    .4byte 0x0000000c
    .4byte 0x000b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be11b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80a90820
    .4byte 0x00223322
    .4byte 0x80aa0c40
    .4byte 0x0000000c
    .4byte 0x00223323
    .4byte 0x80aa0c40
    .4byte 0x0000000c
    .4byte 0x00223b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be01b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80aa0820
    .4byte 0x00063322
    .4byte 0x80ab0c40
    .4byte 0x0000000c
    .4byte 0x00063323
    .4byte 0x80ab0c40
    .4byte 0x0000000c
    .4byte 0x00063b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd51b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80ab0820
    .4byte 0x00213322
    .4byte 0x80ac0c40
    .4byte 0x0000000c
    .4byte 0x00213323
    .4byte 0x80ac0c40
    .4byte 0x0000000c
    .4byte 0x00213b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bef1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80ac0820
    .4byte 0x00033322
    .4byte 0x80ad0c40
    .4byte 0x0000000c
    .4byte 0x00033323
    .4byte 0x80ad0c40
    .4byte 0x0000000c
    .4byte 0x00033b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd31b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80ad0820
    .4byte 0x00053322
    .4byte 0x80ae0c40
    .4byte 0x0000000c
    .4byte 0x00053323
    .4byte 0x80ae0c40
    .4byte 0x0000000c
    .4byte 0x00053b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd41b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80ae0820
    .4byte 0x001d3322
    .4byte 0x80b00c40
    .4byte 0x0000000c
    .4byte 0x001d3323
    .4byte 0x80b00c40
    .4byte 0x0000000c
    .4byte 0x001d3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bec1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b00820
    .4byte 0x001f3322
    .4byte 0x80b10c40
    .4byte 0x0000000c
    .4byte 0x001f3323
    .4byte 0x80b10c40
    .4byte 0x0000000c
    .4byte 0x001f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bee1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b10820
    .4byte 0x000d3322
    .4byte 0x80b20c40
    .4byte 0x0000000c
    .4byte 0x000d3323
    .4byte 0x80b20c40
    .4byte 0x0000000c
    .4byte 0x000d3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bdc1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b20820
    .4byte 0x000e3322
    .4byte 0x80b30c40
    .4byte 0x0000000c
    .4byte 0x000e3323
    .4byte 0x80b30c40
    .4byte 0x0000000c
    .4byte 0x000e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be91b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b30820
    .4byte 0x00123322
    .4byte 0x80b40c40
    .4byte 0x0000000c
    .4byte 0x00123323
    .4byte 0x80b40c40
    .4byte 0x0000000c
    .4byte 0x00123b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bea1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b40820
    .4byte 0x00143322
    .4byte 0x80b60c40
    .4byte 0x0000000c
    .4byte 0x00143323
    .4byte 0x80b60c40
    .4byte 0x0000000c
    .4byte 0x00143b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be21b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b60820
    .4byte 0x00153322
    .4byte 0x80b70c40
    .4byte 0x0000000c
    .4byte 0x00153323
    .4byte 0x80b70c40
    .4byte 0x0000000c
    .4byte 0x00153b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be31b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b70820
    .4byte 0x00163322
    .4byte 0x80b80c40
    .4byte 0x0000000c
    .4byte 0x00163323
    .4byte 0x80b80c40
    .4byte 0x0000000c
    .4byte 0x00163b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be41b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b80820
    .4byte 0x00203322
    .4byte 0x80b90c40
    .4byte 0x0000000c
    .4byte 0x00203323
    .4byte 0x80b90c40
    .4byte 0x0000000c
    .4byte 0x00203b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bdd1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80b90820
    .4byte 0x00173322
    .4byte 0x80bb0c40
    .4byte 0x0000000c
    .4byte 0x00173323
    .4byte 0x80bb0c40
    .4byte 0x0000000c
    .4byte 0x00173b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be51b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80bb0820
    .4byte 0x00183322
    .4byte 0x80bc0c40
    .4byte 0x0000000c
    .4byte 0x00183323
    .4byte 0x80bc0c40
    .4byte 0x0000000c
    .4byte 0x00183b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be61b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80bc0820
    .4byte 0x001e3322
    .4byte 0x80bd0c40
    .4byte 0x0000000c
    .4byte 0x001e3323
    .4byte 0x80bd0c40
    .4byte 0x0000000c
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bed1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80bd0820
    .4byte 0x000a3322
    .4byte 0x80bf0c40
    .4byte 0x0000000c
    .4byte 0x000a3323
    .4byte 0x80bf0c40
    .4byte 0x0000000c
    .4byte 0x000a3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd61b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80bf0820
    .4byte 0x00073322
    .4byte 0x80c00c40
    .4byte 0x0000000c
    .4byte 0x00073323
    .4byte 0x80c00c40
    .4byte 0x0000000c
    .4byte 0x00073b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80c00820
    .4byte 0x00093322
    .4byte 0x80c10c40
    .4byte 0x0000000c
    .4byte 0x00093323
    .4byte 0x80c10c40
    .4byte 0x0000000c
    .4byte 0x00093b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd81b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80c10820
    .4byte 0x00083322
    .4byte 0x80c20c40
    .4byte 0x0000000c
    .4byte 0x00083323
    .4byte 0x80c20c40
    .4byte 0x0000000c
    .4byte 0x00083b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd91b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80c20820
    .4byte 0x00133322
    .4byte 0x80c30c40
    .4byte 0x0000000c
    .4byte 0x00133323
    .4byte 0x80c30c40
    .4byte 0x0000000c
    .4byte 0x00133b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bda1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80c30820
    .4byte 0x000c3322
    .4byte 0x80c40c40
    .4byte 0x0000000c
    .4byte 0x000c3323
    .4byte 0x80c40c40
    .4byte 0x0000000c
    .4byte 0x000c3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bdb1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80c40820
    .4byte 0x00193322
    .4byte 0x80c60c40
    .4byte 0x0000000c
    .4byte 0x00193323
    .4byte 0x80c60c40
    .4byte 0x0000000c
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80c60820
    .4byte 0x001a3322
    .4byte 0x80c70c40
    .4byte 0x0000000c
    .4byte 0x001a3323
    .4byte 0x80c70c40
    .4byte 0x0000000c
    .4byte 0x001a3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0be81b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80c70820
    .4byte 0x001c3322
    .4byte 0x80c80c40
    .4byte 0x0000000c
    .4byte 0x001c3323
    .4byte 0x80c80c40
    .4byte 0x0000000c
    .4byte 0x001c3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0beb1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80c80820
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00100c41
    .4byte 0x0001000c
    .4byte 0x00013322
    .4byte 0x80cc0c40
    .4byte 0x0000000c
    .4byte 0x00013323
    .4byte 0x80cc0c40
    .4byte 0x0000000c
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bcf1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80cc0820
    .4byte 0x00110920
    .4byte 0x00100820
    .4byte 0x000f3322
    .4byte 0x80d00c40
    .4byte 0x0000000c
    .4byte 0x000f3323
    .4byte 0x80d00c40
    .4byte 0x0000000c
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bd01b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x80d00820
    .4byte 0x00110820
    .4byte 0x060b2628
    .4byte 0x00001a24
    .4byte 0x000b0540
    .4byte 0x0068001c
    .4byte 0x0bf01b20
    .4byte 0x00001d20
    .4byte 0x0a0b2628
    .4byte 0x00000d41
    .4byte sub_8080474
    .4byte 0x00003b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00120c41
    .4byte 0x0001000c
    .4byte 0x00001a20
    .4byte 0x0bf11b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00130920
    .4byte 0x00120820
    .4byte 0x00001a20
    .4byte 0x0bf21b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00130820
    .4byte 0x00020540
    .4byte 0x00000019
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x334
    .4byte 0x00020540
    .4byte 0x00000002
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x334
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x6880
    .4byte 0x00002a24
    .4byte 0x00000120
    .4byte 0x00411220
    .4byte 0x00020540
    .4byte 0x00000034
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0bf51b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00223322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00213322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00063322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00053322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00033322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x0bf61b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000820
    .4byte 0x00203322
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x00143322
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x00163322
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x00153322
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x0bf71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00010820
    .4byte 0x000d3322
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x00123322
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x001d3322
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x000e3322
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x001f3322
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x0bf81b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020820
    .4byte 0x001a3322
    .4byte 0x00030c40
    .4byte 0x0000000c
    .4byte 0x001c3322
    .4byte 0x00030c40
    .4byte 0x0000000c
    .4byte 0x0bf91b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00030820
    .4byte 0x00173322
    .4byte 0x00040c40
    .4byte 0x0000000c
    .4byte 0x00183322
    .4byte 0x00040c40
    .4byte 0x0000000c
    .4byte 0x0bfa1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00040820
    .4byte 0x000a3322
    .4byte 0x00050c40
    .4byte 0x0000000c
    .4byte 0x00073322
    .4byte 0x00050c40
    .4byte 0x0000000c
    .4byte 0x00093322
    .4byte 0x00050c40
    .4byte 0x0000000c
    .4byte 0x00083322
    .4byte 0x00050c40
    .4byte 0x0000000c
    .4byte 0x00133322
    .4byte 0x00050c40
    .4byte 0x0000000c
    .4byte 0x000c3322
    .4byte 0x00050c40
    .4byte 0x0000000c
    .4byte 0x0bfb1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00050820
    .4byte 0x00043322
    .4byte 0x00060c40
    .4byte 0x0000000c
    .4byte 0x00113322
    .4byte 0x00060c40
    .4byte 0x0000000c
    .4byte 0x00103322
    .4byte 0x00060c40
    .4byte 0x0000000c
    .4byte 0x0bfc1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00060820
    .4byte 0x00001920
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00070c41
    .4byte 0x0001000c
    .4byte 0x0bfd1b20
    .4byte 0x00001d20
    .4byte 0x00080920
    .4byte 0x00070820
    .4byte 0x0bfe1b20
    .4byte 0x00001d20
    .4byte 0x00080820
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x00193421
    .4byte 0x00023421
    .4byte 0x00000120
    .4byte 0x002e1220
    .4byte 0x00020540
    .4byte 0x00000a9e
    .4byte 0x00030540
    .4byte 0x00000a9f
    .4byte 0x00040540
    .4byte 0x00000aa0
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x594
    .4byte 0x09132628
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xeea8
    .4byte 0x00003020
    .4byte 0x001d3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aa11b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x000a0012
    .4byte 0x00172520
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xe8e0
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xedb8
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x0003000c
    .4byte 0xffff2720
    .4byte 0x7fff1324
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xed54
    .4byte 0x00003020
    .4byte 0x005a3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00251220
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aa21b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00020540
    .4byte 0x00000025
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aa31b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00002620
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xe8e0
    .4byte 0x00003020
    .4byte 0x00002b22
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xed90
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x000f3428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0xe7f0
    .4byte 0x00003020
    .4byte 0x0083342f
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xed90
    .4byte 0x00003020
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xe8e0
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xedb8
    .4byte 0x00003020
    .4byte 0x0a112628
    .4byte 0x00101720
    .4byte 0x00833b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002e1220
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00030540
    .4byte 0x00000aa4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00102f42
    .4byte 0x0002005a
    .4byte 0x00003020
    .4byte 0x005a3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00030540
    .4byte 0x00000aa5
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00102f42
    .4byte 0x0003005a
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000256
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000216
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000012
    .4byte 0x00003020
    .4byte 0x00123b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00030540
    .4byte 0x00000aa6
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00082f42
    .4byte 0x00020012
    .4byte 0x00003020
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00010215
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00010295
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00010296
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000083
    .4byte 0x00003020
    .4byte 0x00123b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00030540
    .4byte 0x00000aa7
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00102f40
    .4byte 0x0f170083
    .4byte 0x00102f40
    .4byte 0x0f170012
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xeb38
    .4byte 0x001e0e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xe8e0
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xeb38
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xebc4
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000c1220
    .4byte 0x04082628
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xec00
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x0003000c
    .4byte 0xffff2721
    .4byte 0x00223b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000017
    .4byte 0x00030540
    .4byte 0x00000aa8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00120229
    .4byte 0x000c0229
    .4byte 0x00100229
    .4byte 0x000e0229
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aac1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x00000012
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x534
    .4byte 0x00002220
    .4byte 0x09112628
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xedf4
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xedf4
    .4byte 0x00003020
    .4byte 0x00102f42
    .4byte 0x0002000f
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000027
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aad1b20
    .4byte 0x00001d20
    .4byte 0x7fff1322
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00321220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00041721
    .4byte 0x00020540
    .4byte 0x00000025
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aae1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000018
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00001520
    .4byte 0x0aaf1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00020540
    .4byte 0x0002000f
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x30
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xef28
    .4byte 0x00003020
    .4byte 0x002e1220
    .4byte 0x00101720
    .4byte 0x00002720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xef64
    .4byte 0x00003020
    .4byte 0x006b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ab01b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00710229
    .4byte 0x00182a21
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ab21b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00123422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ab11b20
    .4byte 0x00001d20
    .4byte 0x02d91620
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00123422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ab31b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00813920
    .4byte 0x01000f21
    .4byte 0x00120221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xec3c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00000f23
    .4byte 0x00120221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00120229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x02010f21
    .4byte 0x000c0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xec8c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00010f23
    .4byte 0x000c0221
    .4byte 0x00010f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000c0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x02020f21
    .4byte 0x00100221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xecb4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020f23
    .4byte 0x00100221
    .4byte 0x00020f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00100229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x01030f21
    .4byte 0x00001927
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00001922
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x03030f21
    .4byte 0x00000820
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xecf0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00030f23
    .4byte 0x000e0221
    .4byte 0x00030f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000e0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00251220
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x004c2520
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x10290
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00023428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0x101dc
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00023428
    .4byte 0x00cc3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001c
    .4byte 0x00030540
    .4byte 0x00000ab4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001520
    .4byte 0x01004220
    .4byte 0x00780e20
    .4byte 0x0000422f
    .4byte 0x00002f42
    .4byte 0x00020002
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ab51b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x000e000c
    .4byte 0x00182520
    .4byte 0x02222d20
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf348
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf690
    .4byte 0x00003020
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xf6f4
    .4byte 0x00003020
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xf71c
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x001d3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002e1220
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ab61b20
    .4byte 0x00001d20
    .4byte 0x7fff1322
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00261220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x0000342b
    .4byte 0x00222d20
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf4d8
    .4byte 0x00003020
    .4byte 0x00443b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ab71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xf6f4
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xf71c
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf294
    .4byte 0x00003020
    .4byte 0x00101721
    .4byte 0x00002d20
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf348
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf26c
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf294
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf578
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf4d8
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xf474
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00162620
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xf76c
    .4byte 0x00200e22
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00023428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0xf7a8
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00023428
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ab81b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00141220
    .4byte 0x0b0f2628
    .4byte 0x000f0e20
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf85c
    .4byte 0x00003020
    .4byte 0x0043342f
    .4byte 0x0b133b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000012
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ab91b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x0044342f
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf884
    .4byte 0x00003020
    .4byte 0x0044342f
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf8ac
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0xf320
    .4byte 0x00003020
    .4byte 0x00433b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0aba1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00102f40
    .4byte 0x0e170043
    .4byte 0x00003020
    .4byte 0x0043342f
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x000e3320
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x000e3325
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00141220
    .4byte 0x000e2621
    .4byte 0x000f0e20
    .4byte 0x000e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0abb1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x000e3320
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x000e3325
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00141220
    .4byte 0x000e2621
    .4byte 0x000f0e20
    .4byte 0x000e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0abc1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000820
    .4byte 0x00000120
    .4byte 0x00070540
    .4byte 0x00000000
    .4byte 0x00893322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x008a3322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x008b3322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000820
    .4byte 0x00020321
    .4byte 0x00010c41
    .4byte 0x0000000c
    .4byte 0x002e1220
    .4byte 0x005b2621
    .4byte 0x005b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000012
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ac01b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x534
    .4byte 0x0000342c
    .4byte 0x00101720
    .4byte 0x000f2621
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x0000001c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ac11b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00020920
    .4byte 0x00010820
    .4byte 0x00311220
    .4byte 0x00101721
    .4byte 0x00020820
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002220
    .4byte 0x0c0f2628
    .4byte 0x00101720
    .4byte 0x0d123b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000012
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ac21b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00281220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00030c40
    .4byte 0x00000007
    .4byte 0x0ac31b21
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000065
    .4byte 0x001d3720
    .4byte 0x00030820
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x13002620
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xf8d4
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00241220
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00030540
    .4byte 0x00000ac4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x0000342b
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xf8d4
    .4byte 0x00003020
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002a1420
    .4byte 0x00210e20
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00030540
    .4byte 0x00000ac5
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00041421
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00010387
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00010347
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0001034f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00002f43
    .4byte 0x00000019
    .4byte 0x00320e22
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00102f40
    .4byte 0x0d0f001a
    .4byte 0x00102f40
    .4byte 0x0d0f001c
    .4byte 0x00003020
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0xf94c
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ac61b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00720229
    .4byte 0x00192a21
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ac71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x001d3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ac81b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x000e3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ac91b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x000e3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000002
    .4byte 0x00030540
    .4byte 0x00000aca
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000056
    .4byte 0xffff3720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000002
    .4byte 0x00030540
    .4byte 0x00000acb
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000064
    .4byte 0xffff3720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000acc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000acd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xf53c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x7530
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x000e3920
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00833920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xf5c8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0xf654
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x002e1220
    .4byte 0x00002920
    .4byte 0x00020540
    .4byte 0x0002000f
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x30
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x10a44
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00443242
    .4byte 0x0000090e
    .4byte 0x00003020
    .4byte 0x00002720
    .4byte 0x00102f40
    .4byte 0x050e0044
    .4byte 0x00003020
    .4byte 0x00443b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ace1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x003e2520
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x107d8
    .4byte 0x00003020
    .4byte 0x004b1220
    .4byte 0x00041720
    .4byte 0x000f0e20
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000008
    .4byte 0x00030540
    .4byte 0x00000acf
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x10814
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000008
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ad01b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0xffff2920
    .4byte 0x00002720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x10468
    .4byte 0x00003020
    .4byte 0x00573242
    .4byte 0x00000d10
    .4byte 0x00101720
    .4byte 0x12142620
    .4byte 0x00573b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00261220
    .4byte 0x00001a20
    .4byte 0x0ad11b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000057
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0057342f
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00111220
    .4byte 0x000f2621
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000008
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ad21b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002721
    .4byte 0x00012720
    .4byte 0x00002220
    .4byte 0x09092628
    .4byte 0x00001a20
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x10580
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x10684
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00111220
    .4byte 0x09092628
    .4byte 0x01004220
    .4byte 0x001e0e20
    .4byte 0x00022720
    .4byte 0x001e0e20
    .4byte 0x0000422f
    .4byte 0x000f2621
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ad31b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00111220
    .4byte 0x000f2621
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000008
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ad41b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00032720
    .4byte 0x00002220
    .4byte 0x0a0c2628
    .4byte 0x00001a20
    .4byte 0x01004220
    .4byte 0x00101720
    .4byte 0x00200e20
    .4byte 0x0000422f
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x10544
    .4byte 0x00003020
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ad51b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x00000008
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ad61b20
    .4byte 0x00001d20
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x00101720
    .4byte 0x0ad71b20
    .4byte 0x00001d20
    .4byte 0x001a3322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x0ad81b21
    .4byte 0x00001d20
    .4byte 0x00000820
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x00000019
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x00020540
    .4byte 0x0000001a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x00730229
    .4byte 0x00192a22
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ad91b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00193422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ada1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x001a3422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1074c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x10788
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x10850
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1088c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x108c8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00b03920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x10918
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x10954
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x109b8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x109f4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00b93920
    .4byte 0x00010540
    .4byte 0x00011200
    .4byte 0x00ba3920
    .4byte 0x00010540
    .4byte 0x00010b00
    .4byte 0x00b13920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00241220
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x11234
    .4byte 0x00003020
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x11284
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000008
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0adb1b20
    .4byte 0x00001d20
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x00002220
    .4byte 0x07072628
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x112ac
    .4byte 0x00003020
    .4byte 0x00173b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00030540
    .4byte 0x00000adc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00102f40
    .4byte 0x0c080017
    .4byte 0x00003020
    .4byte 0x0017342f
    .4byte 0x00183b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0add1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00102f40
    .4byte 0x05050018
    .4byte 0x00003020
    .4byte 0x0018342f
    .4byte 0x00101721
    .4byte 0x00001521
    .4byte 0x11072628
    .4byte 0x00101720
    .4byte 0x00082f42
    .4byte 0x0003001e
    .4byte 0x00003020
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000008
    .4byte 0x00030540
    .4byte 0x00000ade
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x7fff1324
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x11234
    .4byte 0x00003020
    .4byte 0x001e342f
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x10ce4
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x11284
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00251220
    .4byte 0x00020540
    .4byte 0x00000008
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0adf1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0040342f
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00141220
    .4byte 0x00142620
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ae01b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00532621
    .4byte 0x00573242
    .4byte 0x00000000
    .4byte 0x00020540
    .4byte 0x00000057
    .4byte 0xffff2f48
    .4byte 0x0111fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00533b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ae11b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000057
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0057342f
    .4byte 0x00182f40
    .4byte 0x00110053
    .4byte 0x00003020
    .4byte 0x0053342f
    .4byte 0x00182f40
    .4byte 0x00100081
    .4byte 0x00182f40
    .4byte 0x00120082
    .4byte 0x00003020
    .4byte 0x0081342f
    .4byte 0x0082342f
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x11004
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x001e0e22
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x11090
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x001e0e22
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x110e0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x001e0e22
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1111c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x001e0e22
    .4byte 0x000f2621
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ae21b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00311220
    .4byte 0x00101721
    .4byte 0x000a0540
    .4byte 0x00000000
    .4byte 0x00163320
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00163325
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00010c40
    .4byte 0x0001000c
    .4byte 0x00183322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x000a0540
    .4byte 0x00000001
    .4byte 0x00020540
    .4byte 0x00000016
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x418
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00020540
    .4byte 0x00000016
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x534
    .4byte 0x00010820
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00142620
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x112e8
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x112e8
    .4byte 0x00003020
    .4byte 0x00023b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0ae31b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x0d0d2628
    .4byte 0x004b1220
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x11324
    .4byte 0x00003020
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00030540
    .4byte 0x00000ae4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00011120
    .4byte 0x00102f40
    .4byte 0x0c14001e
    .4byte 0x00041721
    .4byte 0x00001120
    .4byte 0x00003020
    .4byte 0x001e342f
    .4byte 0x00142620
    .4byte 0x00041720
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ae51b20
    .4byte 0x00001d20
    .4byte 0x00321220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x000a0c40
    .4byte 0x0000000a
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0ae61b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x000a0820
    .4byte 0x00740229
    .4byte 0x001a2a21
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0ae71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00163422
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000ae8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00021421
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x10fdc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000009
    .4byte 0x00030540
    .4byte 0x00000ae9
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1116c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x111a8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x111d0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x111f8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00531220
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x118a0
    .4byte 0x00003020
    .4byte 0x001e342f
    .4byte 0x0d113b20
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000002
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aea1b20
    .4byte 0x00001d20
    .4byte 0x002b1220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000002
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aeb1b20
    .4byte 0x00001d20
    .4byte 0x00291220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00251220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x0c0c2628
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x114f4
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x114cc
    .4byte 0x00003020
    .4byte 0x00443b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0aec1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002620
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x118c8
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00023428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00193428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0x11918
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00023428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00193428
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000021
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aed1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x11a30
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00152620
    .4byte 0x00251220
    .4byte 0x00101720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x117b0
    .4byte 0x00003020
    .4byte 0x00143b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aee1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x119cc
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00090228
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x119cc
    .4byte 0x00003020
    .4byte 0x00090220
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000021
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0aef1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x001e342f
    .4byte 0x00000120
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x0d0e2628
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x119f4
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x119f4
    .4byte 0x00003020
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00321220
    .4byte 0x00020540
    .4byte 0x00000021
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0af21b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00750229
    .4byte 0x001b2a21
    .4byte 0x00000120
    .4byte 0x00020321
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00020540
    .4byte 0x0000000f
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x114
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0af31b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020321
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00020540
    .4byte 0x0000001d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x114
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0af41b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00301420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0af51b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0af61b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0af71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000002
    .4byte 0x00030540
    .4byte 0x00000af8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000059
    .4byte 0xffff3720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000002
    .4byte 0x00030540
    .4byte 0x00000af9
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000061
    .4byte 0xffff3720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x117ec
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x11814
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1183c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x11878
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00803920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x004d1220
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x003f2520
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12de0
    .4byte 0x00003020
    .4byte 0x00082f42
    .4byte 0x0003000f
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0afa1b20
    .4byte 0x00001d20
    .4byte 0x00021723
    .4byte 0x00001b22
    .4byte 0x00001a21
    .4byte 0x000f2140
    .4byte 0x00000000
    .4byte 0x002c1328
    .4byte 0x00021722
    .4byte 0x02103a41
    .4byte 0x00080008
    .4byte 0x0afb1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1328
    .4byte 0x00021723
    .4byte 0x00002220
    .4byte 0x004d1326
    .4byte 0x00021722
    .4byte 0x00082f42
    .4byte 0x0003001e
    .4byte 0x00003020
    .4byte 0x00001a20
    .4byte 0x0afc1b20
    .4byte 0x00001d20
    .4byte 0x00030320
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x01004220
    .4byte 0x00780e20
    .4byte 0x0000422f
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00000820
    .4byte 0x00001b22
    .4byte 0x00082f40
    .4byte 0x040a000f
    .4byte 0x00100e22
    .4byte 0x00082f40
    .4byte 0x040a0002
    .4byte 0x00082f40
    .4byte 0x040a001e
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x0002000f
    .4byte 0x001b2520
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x125e8
    .4byte 0x00003020
    .4byte 0x00041720
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0afd1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00b11620
    .4byte 0x00002720
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x12b88
    .4byte 0x00003020
    .4byte 0x00833b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002e1220
    .4byte 0x00001a20
    .4byte 0x0afe1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f40
    .4byte 0x090e0083
    .4byte 0x00003020
    .4byte 0x00002721
    .4byte 0x0083342f
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0aff1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0040342f
    .4byte 0x00101721
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x12624
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000d0229
    .4byte 0x00100229
    .4byte 0x00000120
    .4byte 0x001c3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b001b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000120
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00020540
    .4byte 0x0000001c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x534
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002720
    .4byte 0x040e2628
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12bb0
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00001860
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0a061862
    .4byte 0x00800004
    .4byte 0x00800080
    .4byte 0x011d1862
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00d61620
    .4byte 0x00020540
    .4byte 0x0000006b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x4f0
    .4byte 0x006b342f
    .4byte 0x0a061862
    .4byte 0x01000008
    .4byte 0x01000100
    .4byte 0x00001861
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00102f42
    .4byte 0x0003000f
    .4byte 0x00003020
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b051b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00102f40
    .4byte 0x0a0e000f
    .4byte 0x00200e22
    .4byte 0x00102f40
    .4byte 0x0a0f0002
    .4byte 0x00100e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00462520
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x12f4c
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12f10
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000011
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b061b20
    .4byte 0x00001d20
    .4byte 0x002d1220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x23c
    .4byte 0x7fff1322
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0040342f
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b071b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12f74
    .4byte 0x00003020
    .4byte 0x00c03b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00321220
    .4byte 0x00001a20
    .4byte 0x0b081b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12f9c
    .4byte 0x000f0e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x0d1a2620
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12fec
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12fec
    .4byte 0x00003020
    .4byte 0x00b11620
    .4byte 0x00002720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x13050
    .4byte 0x00003020
    .4byte 0x000f0e20
    .4byte 0x001a2620
    .4byte 0x00082f42
    .4byte 0x0002001f
    .4byte 0x00003020
    .4byte 0x001f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000017
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b091b20
    .4byte 0x00001d20
    .4byte 0x7fff1328
    .4byte 0x00021723
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x004b2520
    .4byte 0x00042d20
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x1312c
    .4byte 0x00003020
    .4byte 0x00021722
    .4byte 0x020e3a41
    .4byte 0x00080008
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x13104
    .4byte 0x00003020
    .4byte 0x001f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002d1326
    .4byte 0x00020540
    .4byte 0x0000002d
    .4byte 0x00030540
    .4byte 0x00000b0a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x13168
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002d
    .4byte 0x00030540
    .4byte 0x00000b0b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x131a4
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x190
    .4byte 0x001f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b0c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1328
    .4byte 0x00021723
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00002d20
    .4byte 0x000b0540
    .4byte 0x0000001a
    .4byte 0x00462520
    .4byte 0x00002720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12fec
    .4byte 0x00003020
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x13050
    .4byte 0x00003020
    .4byte 0xffff2f42
    .4byte 0x0002001f
    .4byte 0x00321326
    .4byte 0x00021722
    .4byte 0x001f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000017
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b0d1b20
    .4byte 0x00001d20
    .4byte 0x00101721
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1296c
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x004d2520
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x131cc
    .4byte 0x00003020
    .4byte 0x001f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x0000002c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b0e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x0000002c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b0f1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x0000004a
    .4byte 0x000f3720
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000093
    .4byte 0x000f3720
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x000b0540
    .4byte 0x0004000e
    .4byte 0x001b2520
    .4byte 0x00002720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12c00
    .4byte 0x00003020
    .4byte 0x00261220
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x12ca0
    .4byte 0x00003020
    .4byte 0x00cc3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b101b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00760229
    .4byte 0x001c2a21
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x2afc
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000000a
    .4byte 0x00030540
    .4byte 0x0000001c
    .4byte 0x00040540
    .4byte 0x000026fc
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000b11
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000b12
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000b14
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000b15
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000b16
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000b13
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x84
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12994
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x89ac
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x129bc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12cc8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x129f8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12d04
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12a34
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12d40
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12a70
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12d7c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x02000f21
    .4byte 0x00001927
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00001922
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x04000f21
    .4byte 0x00000820
    .4byte 0x000d0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12aac
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000d0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000d0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12ae8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12b38
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x01010f21
    .4byte 0x00100221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12ae8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x12b38
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00010f23
    .4byte 0x00100221
    .4byte 0x00010f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00100229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x13440
    .4byte 0x00003020
    .4byte 0x00533420
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x13af8
    .4byte 0x00003020
    .4byte 0x15002620
    .4byte 0x00002220
    .4byte 0x00251220
    .4byte 0x00101720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x13a08
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00023428
    .4byte 0x00002c42
    .4byte gUnknown_088B3AD8 + 0x13a44
    .4byte 0x00003020
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x000f3428
    .4byte 0x00010540
    .4byte 0xffffffff
    .4byte 0x00023428
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b191b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00101721
    .4byte 0x00002220
    .4byte 0x00002620
    .4byte 0x00101720
    .4byte 0x00403242
    .4byte 0x00000017
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0205fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x002e1220
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00030540
    .4byte 0x00000b1a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0040342f
    .4byte 0x00002f42
    .4byte 0x00030066
    .4byte 0x00003020
    .4byte 0x00002f41
    .4byte 0x00530066
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1379c
    .4byte 0x00003020
    .4byte 0x00003020
    .4byte 0x00533421
    .4byte 0x0066342f
    .4byte 0x00101721
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x070c2628
    .4byte 0x00101720
    .4byte 0x00261220
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x137ec
    .4byte 0x00003020
    .4byte 0x00013421
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00013428
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x000b3428
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00173428
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000030
    .4byte 0x00030540
    .4byte 0x00000b1c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x2de4
    .4byte 0x00770229
    .4byte 0x001d2a21
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000b36
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00000088
    .4byte 0xffff3720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000b37
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00030540
    .4byte 0x00000b38
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00271420
    .4byte 0x00210e20
    .4byte 0x00001a20
    .4byte 0x0b2c1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00021421
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b321b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b331b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b341b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001520
    .4byte 0x00001a20
    .4byte 0x0b351b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00001521
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1383c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x13878
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x138b4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x13904
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x139cc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00813920
    .4byte 0x00010540
    .4byte 0x00011200
    .4byte 0x00823920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x0000000f
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81610c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81610820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000062
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81710c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81710820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000089
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81810c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81810820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000054
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81910c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81910820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000048
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81a10c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81a10820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000063
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81b10c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81b10820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000073
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81c10c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81c10820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000031
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81d10c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81d10820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0xffff3328
    .4byte 0x00c20620
    .4byte 0x00030540
    .4byte 0x00000051
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x594
    .4byte 0x81e10c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x81e10820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x33ec
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x001d2520
    .4byte 0x00002c40
    .4byte gUnknown_088B3AD8 + 0x9380
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x13c74
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x14124
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000e0229
    .4byte 0x000d0229
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x37b0
    .4byte 0x001e2a21
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x140d4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x140fc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00903920
    .4byte 0x01000f21
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x13fbc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x13f6c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000e0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000e0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x008f3920
    .4byte 0x00010540
    .4byte 0x00010303
    .4byte 0x00913920
    .4byte 0x01010f21
    .4byte 0x000d0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x14034
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x14070
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00010f23
    .4byte 0x000d0221
    .4byte 0x00010f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000d0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x142c8
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x3f80
    .4byte 0x000e0229
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x4334
    .4byte 0x001f2a21
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x460c
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x4634
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x465c
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x144d0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1455c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x14598
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x145d4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x05000f21
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x14520
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000e0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000e0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x000c0013
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x000e0011
    .4byte 0x00000721
    .4byte 0x00020540
    .4byte 0x00011200
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x5f4
    .4byte 0x00010540
    .4byte 0x000d0012
    .4byte 0x00000721
    .4byte 0x00020540
    .4byte 0x00010e00
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x5f4
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x15104
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1544c
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x47cc
    .4byte 0x00080229
    .4byte 0x000a0229
    .4byte 0x000c0229
    .4byte 0x000e0229
    .4byte 0x00000120
    .4byte 0x00491220
    .4byte 0x00101721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x0e0e2628
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x15348
    .4byte 0x00003020
    .4byte 0x00101720
    .4byte 0x00403242
    .4byte 0x00000000
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0b12fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b7e1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f42
    .4byte 0x0001000f
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x0040342f
    .4byte 0x00002f42
    .4byte 0x00010001
    .4byte 0x00002f40
    .4byte 0x0912000f
    .4byte 0x00140e22
    .4byte 0x00101721
    .4byte 0x00003020
    .4byte 0x00162620
    .4byte 0x00403242
    .4byte 0x00000113
    .4byte 0x00002f40
    .4byte 0x0413000f
    .4byte 0x00101720
    .4byte 0x00003020
    .4byte 0x002d1220
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b851b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00002f42
    .4byte 0x0003000f
    .4byte 0x00003020
    .4byte 0x000f4520
    .4byte 0x001e0e20
    .4byte 0x0000452f
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b861b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0xffff2f48
    .4byte 0x0213fffd
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x470
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b871b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x190
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b881b20
    .4byte 0x00001d20
    .4byte 0x7fff1322
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x002c1220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1326
    .4byte 0x00020540
    .4byte 0x00000040
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x153d4
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0b891b20
    .4byte 0x00001d20
    .4byte 0x00321220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00020540
    .4byte 0x00000032
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0b8a1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00202a21
    .4byte 0x00000120
    .4byte 0x00060321
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00030229
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x99c8
    .4byte 0x00000121
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00080221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x154d8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000a0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x15514
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000c0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x15550
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x155a0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x155c8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x15604
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1673c
    .4byte 0x00030540
    .4byte gUnknown_088B3AD8 + 0x169a8
    .4byte 0x00040540
    .4byte gUnknown_088B3AD8 + 0x16340
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x4c5c
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x000f2621
    .4byte 0x000f3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00111220
    .4byte 0x00020540
    .4byte 0x0000000b
    .4byte 0x00030540
    .4byte 0x00000b98
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x288
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x4fe8
    .4byte 0x00212a21
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x16548
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x16570
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x16598
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x165d4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x16610
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1664c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x16688
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x166ec
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x16ce0
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5428
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x16ce0
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1708c
    .4byte 0x00003020
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x174b0
    .4byte 0x00030540
    .4byte 0x00000001
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1c0
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000a0229
    .4byte 0x000c0229
    .4byte 0x000e0229
    .4byte 0x00100229
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x55c0
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x562c
    .4byte 0x001e0e20
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00021723
    .4byte 0x002c1328
    .4byte 0x00001a21
    .4byte 0x000f2140
    .4byte 0x00000000
    .4byte 0x00021722
    .4byte 0x020e3a41
    .4byte 0x00080008
    .4byte 0x0bb71b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101723
    .4byte 0x00001a21
    .4byte 0x000d2140
    .4byte 0x00000000
    .4byte 0x00101722
    .4byte 0x0bb81b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1328
    .4byte 0x00021723
    .4byte 0x00002220
    .4byte 0x00021722
    .4byte 0x002d1220
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00020540
    .4byte 0x00000034
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x0bb91b20
    .4byte 0x00001d20
    .4byte 0x00101721
    .4byte 0x00001b22
    .4byte 0x00222a22
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x170b4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x170f0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x17118
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x17154
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x03000f21
    .4byte 0x000a0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1717c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000a0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000a0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000c0221
    .4byte 0x06010f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x000c0221
    .4byte 0x00010f20
    .4byte 0x00070540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000003
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x171b8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00010f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000c0229
    .4byte 0x00000820
    .4byte 0x00010f23
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000e0221
    .4byte 0x06020f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x000e0221
    .4byte 0x00020f20
    .4byte 0x00070540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000003
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x17208
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000e0229
    .4byte 0x00000820
    .4byte 0x00020f23
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00100221
    .4byte 0x0d030f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00100221
    .4byte 0x00030f20
    .4byte 0x00070540
    .4byte 0x0000000b
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x0000000a
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000008
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000007
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000004
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000002
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x00070540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0007000c
    .4byte 0x0b0b2628
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x17258
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00030f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00100229
    .4byte 0x00000820
    .4byte 0x00030f23
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x01cc0625
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x172a8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x172f8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x17334
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1735c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x17384
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x214
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5aa4
    .4byte 0x00020540
    .4byte 0x0000006c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x494
    .4byte 0x006c342f
    .4byte 0x00101721
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1768c
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000b0229
    .4byte 0x000c0229
    .4byte 0x000d0229
    .4byte 0x00000120
    .4byte 0x7fff1326
    .4byte 0x00041721
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x040b2628
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x17b3c
    .4byte 0x00003020
    .4byte 0x00041720
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x17b3c
    .4byte 0x00003020
    .4byte 0x00403b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x0bc61b20
    .4byte 0x00001d20
    .4byte 0x00441326
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x7fff1324
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5c74
    .4byte 0x00232a23
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000b0221
    .4byte 0x01000f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x17970
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x000b0221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000b0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000c0221
    .4byte 0x01010f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x179e8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00010f23
    .4byte 0x000c0221
    .4byte 0x00010f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000c0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x000d0221
    .4byte 0x0a020f21
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x17a4c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020f23
    .4byte 0x000d0221
    .4byte 0x00020f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000d0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00b13920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x5e0c
    .4byte 0x00000120
    .4byte 0x00000a40
    .4byte gUnknown_089F36A0 + 0x6880
    .4byte 0x00002a24
    .4byte 0x00000120
    .4byte 0x00000d40
    .4byte sub_8085C4C
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x17ca4
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000071
    .4byte 0x00030540
    .4byte 0x00000024
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x868
    .4byte 0x00020540
    .4byte 0x00000024
    .4byte 0x00030540
    .4byte 0x00000025
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x17ef4
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00080229
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000072
    .4byte 0x00030540
    .4byte 0x00000024
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x868
    .4byte 0x00020540
    .4byte 0x00000024
    .4byte 0x00030540
    .4byte 0x00000026
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00b93920
    .4byte 0x00010540
    .4byte 0x00011200
    .4byte 0x00ba3920
    .4byte 0x00080221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x180fc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x18214
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000067
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0xfc
    .4byte 0x00020540
    .4byte 0x00000073
    .4byte 0x00030540
    .4byte 0x00000024
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x868
    .4byte 0x00020540
    .4byte 0x00000024
    .4byte 0x00030540
    .4byte 0x00000027
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x18500
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000074
    .4byte 0x00030540
    .4byte 0x00000024
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x868
    .4byte 0x00020540
    .4byte 0x00000024
    .4byte 0x00030540
    .4byte 0x00000028
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1876c
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000075
    .4byte 0x00030540
    .4byte 0x00000024
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x868
    .4byte 0x00020540
    .4byte 0x00000024
    .4byte 0x00030540
    .4byte 0x00000029
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x18ab4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x18ba4
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000069
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0xfc
    .4byte 0x00020540
    .4byte 0x00000076
    .4byte 0x00030540
    .4byte 0x00000024
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x868
    .4byte 0x00020540
    .4byte 0x00000024
    .4byte 0x00030540
    .4byte 0x0000002a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x18f94
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x000c0229
    .4byte 0x000d0229
    .4byte 0x000e0229
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000077
    .4byte 0x00030540
    .4byte 0x00000024
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x868
    .4byte 0x00020540
    .4byte 0x00000024
    .4byte 0x00030540
    .4byte 0x0000002b
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00aa3320
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x00000820
    .4byte 0x10092620
    .4byte 0x00002720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00ac3320
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x00010820
    .4byte 0x0d112620
    .4byte 0x00012720
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00b03320
    .4byte 0x00020c40
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x00020820
    .4byte 0x04172620
    .4byte 0x00022720
    .4byte 0x000c0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00b33320
    .4byte 0x00030c40
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x00030820
    .4byte 0x000c2620
    .4byte 0x00032720
    .4byte 0x000d0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00b73320
    .4byte 0x00040c40
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x14c
    .4byte 0x00040820
    .4byte 0x00052620
    .4byte 0x00042720
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x19228
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x19264
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x192a0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x19390
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000006e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0xfc
    .4byte 0x00020540
    .4byte 0x00000024
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x8f4
    .4byte 0x00000120
    .4byte 0x00000d40
    .4byte sub_8085C58
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1969c
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x0000002f
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x199e4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x19a20
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00b93920
    .4byte 0x00010540
    .4byte 0x00011200
    .4byte 0x00ba3920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x19b10
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x00000030
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00b93920
    .4byte 0x00010540
    .4byte 0x00011200
    .4byte 0x00ba3920
    .4byte 0x00010540
    .4byte 0x00010e06
    .4byte 0x00bd3920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x19fd4
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x00000031
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1a380
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1a3a8
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1a3e4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1a40c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1a434
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1a54c
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1a844
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1a86c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x00000032
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1a95c
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000068
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0xfc
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x00000033
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1abf0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1ac18
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1ac40
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1ad44
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x00000034
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b0b4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b0f0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b12c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b168
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1b29c
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00080229
    .4byte 0x000a0229
    .4byte 0x000c0229
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000006a
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0xfc
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x00000035
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b4e0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b508
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b544
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b56c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x03000f21
    .4byte 0x00080221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b594
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00000f23
    .4byte 0x00080221
    .4byte 0x00000f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00080229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x03010f21
    .4byte 0x000a0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b5bc
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00010f23
    .4byte 0x000a0221
    .4byte 0x00010f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000a0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x05020f21
    .4byte 0x000c0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b5e4
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00020f23
    .4byte 0x000c0221
    .4byte 0x00020f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000c0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1b60c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1b6fc
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00080229
    .4byte 0x000a0229
    .4byte 0x000c0229
    .4byte 0x000e0229
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x00000036
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x02030f21
    .4byte 0x00080221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1ba44
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00030f23
    .4byte 0x00080221
    .4byte 0x00030f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00080229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x02040f21
    .4byte 0x000a0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1ba6c
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00040f23
    .4byte 0x000a0221
    .4byte 0x00040f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000a0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x02050f21
    .4byte 0x000c0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1ba94
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00050f23
    .4byte 0x000c0221
    .4byte 0x00050f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000c0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010300
    .4byte 0x00bd3920
    .4byte 0x04060f21
    .4byte 0x000e0221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1bad0
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00060f23
    .4byte 0x000e0221
    .4byte 0x00060f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x000e0229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000a
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000014
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x14002620
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00002720
    .4byte 0x0c0c2628
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00072720
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000006
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x14002620
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00002721
    .4byte 0x0c0c2628
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00072721
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000008
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000e
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000014
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0a072628
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00012720
    .4byte 0x0a0a2628
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00052720
    .4byte 0x14132620
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00082720
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000b
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000011
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0a072628
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00012721
    .4byte 0x0a0a2628
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00052721
    .4byte 0x14132620
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00082721
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000d
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000014
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00002620
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00022720
    .4byte 0x14132620
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00092720
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000009
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000011
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00002620
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00022721
    .4byte 0x14132620
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00092721
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000003
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000007
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000b
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000013
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x14002620
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00032720
    .4byte 0x050a2628
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00062720
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000009
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000d
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000011
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x14002620
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00032721
    .4byte 0x050a2628
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00062721
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000009
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000d
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000011
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000014
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0f0a2628
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x00042720
    .4byte 0x060c2628
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x000a2720
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000003
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000007
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000b
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000013
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0f0a2628
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x00042721
    .4byte 0x060c2628
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x000a2721
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000006
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000c
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000012
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000014
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x14002620
    .4byte 0x000f0e20
    .4byte 0x00be1620
    .4byte 0x000b2720
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000007
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x0000000d
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00001923
    .4byte 0x00010540
    .4byte 0x00000013
    .4byte 0x00000c40
    .4byte 0x0001000c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x14002620
    .4byte 0x000f0e20
    .4byte 0x00bd1620
    .4byte 0x000b2721
    .4byte 0x00010820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1bbac
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00080229
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00030540
    .4byte 0x00000037
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x898
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x00010540
    .4byte 0x00010000
    .4byte 0x00bd3920
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x130
    .4byte 0x03070f21
    .4byte 0x00080221
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1bf30
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x1ec
    .4byte 0x00070f23
    .4byte 0x00080221
    .4byte 0x00070f20
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00080229
    .4byte 0x00000820
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1c00c
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000006d
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0xfc
    .4byte 0x00020540
    .4byte 0x0000002e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x8f4
    .4byte 0x00000120
    .4byte 0x00880321
    .4byte 0x801c0c40
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte gUnknown_089EEA28 + 0x49a8
    .4byte 0x801c0820
    .4byte 0x00311220
    .4byte 0x00020540
    .4byte 0x0000000e
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x260
    .4byte 0x00033322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x0bff1b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00321220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x0c001b20
    .4byte 0x00001d20
    .4byte 0x7fff1324
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00321220
    .4byte 0x00001c20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00001b22
    .4byte 0x00000a40
    .4byte gUnknown_08591F28 + 0x18
    .4byte 0x00030540
    .4byte 0x00001388
    .4byte 0x00003721
    .4byte 0x00041721
    .4byte 0x00001a21
    .4byte 0x00102140
    .4byte 0x00000000
    .4byte 0x00321220
    .4byte 0x00041720
    .4byte 0x0c011b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00101721
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x8f8
    .4byte 0x00003020
    .4byte 0x008a0229
    .4byte 0x00022a21
    .4byte 0x00000120
    .4byte 0x00000120
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1c1ec
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00002a21
    .4byte 0x00000120
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1d484
    .4byte 0x00003020
    .4byte 0x00012c40
    .4byte gUnknown_088B3AD8 + 0x1d560
    .4byte 0x00003020
    .4byte 0x00000120
    .4byte 0x00000120
    .4byte 0x003b2a21
    .4byte 0x00000120

	.global gUnknown_089FF480
gUnknown_089FF480:  @ 0x089FF480
	.incbin "baserom.gba", 0x9FF480, 0x7B0

	.global gEvent_SkirmishCommonBeginning
gEvent_SkirmishCommonBeginning:  @ 0x089FFC30
@ Replacing .incbin "baserom.gba", 0x9FFC30, 0x134
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000004
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x120
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000007
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x1b0
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000b
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x228
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000d
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x2d0
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000011
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x33c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000012
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x3d8
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000018
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x448
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000001a
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x4fc
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000001e
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x33c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000001f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x3d8
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000039
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x58c
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte gUnknown_089FF480 + 0x78c
    .4byte 0xfffd2720
    .4byte 0x00012c43
    .4byte 0x00000000
    .4byte 0x00003020
    .4byte 0x00000a40
    .4byte gEvent_OpenChest + 0x30
    .4byte 0x00000120

	.global gEvent_SkirmishCommonEnd
gEvent_SkirmishCommonEnd:  @ 0x089FFD64
@ Replacing .incbin "baserom.gba", 0x9FFD64, 0x5F8
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000004
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x1a4
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000007
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x21c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000b
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x2c4
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000d
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x330
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000011
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x3cc
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000012
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x43c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000018
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x4f0
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000001a
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x580
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000001e
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x3cc
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000001f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x43c
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000039
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte gEvent_SkirmishCommonEnd + 0x5ec
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte gUnknown_089FF480 + 0x78c
    .4byte 0xffff2a21
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000721
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000007
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000000b
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000003
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000004
    .4byte 0x00000721
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000000d
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000011
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000003
    .4byte 0x00000721
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000012
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00002920
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000014
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000002
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000003
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000006
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000007
    .4byte 0x00000721
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x0000001a
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00010540
    .4byte 0x00000000
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000001
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000004
    .4byte 0x00000721
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000039
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000000
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7a0
    .4byte 0x000d0540
    .4byte 0x00000000
    .4byte 0x00010540
    .4byte 0x00000032
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000019
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x0000000f
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00010540
    .4byte 0x00000005
    .4byte 0x00000721
    .4byte 0x00000a40
    .4byte ProcScr_WorldFlush + 0x7c4
    .4byte 0x00000120
    .4byte 0x00020540
    .4byte 0x00000004
    .4byte 0x00000120

	.global gEvent_8A0035C
gEvent_8A0035C:  @ 0x08A0035C
	.incbin "baserom.gba", 0xA0035C, 0x8

	.global gEvent_8A00364
gEvent_8A00364:  @ 0x08A00364
@ Replacing .incbin "baserom.gba", 0xA00364, 0x18
    .4byte 0x00070228
    .4byte 0x00000120
    .4byte 0x00000d40
    .4byte StartCharacterEndings
    .4byte 0x00010e20
    .4byte 0x00000120

	.global gEvent_EirikaModeGameEnd
gEvent_EirikaModeGameEnd:  @ 0x08A0037C
@ Replacing .incbin "baserom.gba", 0xA0037C, 0x110
    .4byte 0x00021020
    .4byte 0x00331220
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1dce0
    .4byte 0x00030540
    .4byte 0x00000c19
    .4byte 0x00000a40
    .4byte gEvent_EphraimModeGameEnd + 0xb8
    .4byte 0x00203322
    .4byte 0x00000c40
    .4byte 0x0000000c
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x1ddbc
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x00000017
    .4byte 0x000f2520
    .4byte 0x00101720
    .4byte 0x065d3a41
    .4byte 0x00080008
    .4byte 0x00082f42
    .4byte 0x00020020
    .4byte 0x00003020
    .4byte 0x00203b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x0c1a1b20
    .4byte 0x00001d20
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x1deac
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x00000017
    .4byte 0x000f2520
    .4byte 0x00101720
    .4byte 0x065d3a41
    .4byte 0x00080008
    .4byte 0x00082f42
    .4byte 0x0002001e
    .4byte 0x00003020
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x0c1b1b20
    .4byte 0x00001d20
    .4byte 0x00010820
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1e168
    .4byte 0x00030540
    .4byte 0x00000c1c
    .4byte 0x00000a40
    .4byte gEvent_EphraimModeGameEnd + 0x128
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1e260
    .4byte 0x00030540
    .4byte 0x00000c1d
    .4byte 0x00000a40
    .4byte gEvent_EphraimModeGameEnd + 0x1a0
    .4byte 0x00000a40
    .4byte gEvent_EphraimModeGameEnd + 0x1f4
    .4byte 0x00000120

	.global gEvent_EphraimModeGameEnd
gEvent_EphraimModeGameEnd:  @ 0x08A0048C
@ Replacing .incbin "baserom.gba", 0xA0048C, 0x258
    .4byte 0x00021020
    .4byte 0x00331220
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1dd44
    .4byte 0x00030540
    .4byte 0x00000c1e
    .4byte 0x00000a40
    .4byte gEvent_EphraimModeGameEnd + 0xb8
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x1df88
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x0008000c
    .4byte 0x000c2520
    .4byte 0x00101720
    .4byte 0x065b3a41
    .4byte 0x00080008
    .4byte 0x00001a20
    .4byte 0x00082f42
    .4byte 0x0002001e
    .4byte 0x00003020
    .4byte 0x001e3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x0c1f1b20
    .4byte 0x00001d20
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1e1b8
    .4byte 0x00030540
    .4byte 0x00000c20
    .4byte 0x00000a40
    .4byte gEvent_EphraimModeGameEnd + 0x128
    .4byte 0x00020540
    .4byte gUnknown_088B3AD8 + 0x1e29c
    .4byte 0x00030540
    .4byte 0x00000c21
    .4byte 0x00000a40
    .4byte gEvent_EphraimModeGameEnd + 0x1a0
    .4byte 0x00000a40
    .4byte gEvent_EphraimModeGameEnd + 0x1f4
    .4byte 0x00000120
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x1dc68
    .4byte 0x00003020
    .4byte 0x00012c41
    .4byte 0xffffffff
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x000c0011
    .4byte 0x00132520
    .4byte 0x00101720
    .4byte 0x06673a41
    .4byte 0x00080008
    .4byte 0x00082f42
    .4byte 0x00020019
    .4byte 0x00003020
    .4byte 0x00193b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x00320620
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00041721
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00000120
    .4byte 0x00002b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x1e0c8
    .4byte 0x00003020
    .4byte 0x00012c41
    .4byte 0xffffffff
    .4byte 0x00003020
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0x00402520
    .4byte 0x00101720
    .4byte 0x06643a41
    .4byte 0x00080008
    .4byte 0x000b3b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00320620
    .4byte 0x00001a20
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x00001b22
    .4byte 0x00012c41
    .4byte gUnknown_088B3AD8 + 0x1e0c8
    .4byte 0x00200e22
    .4byte 0x00041721
    .4byte 0x00003020
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00000120
    .4byte 0x000b0540
    .4byte 0x0005000e
    .4byte 0x00102520
    .4byte 0x00041720
    .4byte 0x00012c41
    .4byte 0xffffffff
    .4byte 0x00003020
    .4byte 0x00013b21
    .4byte 0x003c0e20
    .4byte 0x00003b22
    .4byte 0x00001a20
    .4byte 0x00320620
    .4byte 0xffff1b20
    .4byte 0x00001d20
    .4byte 0x7fff1328
    .4byte 0x00021721
    .4byte 0x00001b22
    .4byte 0x0000342a
    .4byte 0x0000342c
    .4byte 0x0000342b
    .4byte 0x00000120
    .4byte 0x00020220
    .4byte 0x00000d40
    .4byte BMapDispSuspend
    .4byte 0x00421220
    .4byte 0x00000d40
    .4byte sub_80C4878
    .4byte 0x005a0e20
    .4byte 0x00001a22
    .4byte 0x00002142
    .4byte 0x00020000
    .4byte 0x0c221b20
    .4byte 0x00001d20
    .4byte 0x7fff1328
    .4byte 0x00021721
    .4byte 0x00001b22
    .4byte 0x00020220
    .4byte 0x00780e20
    .4byte 0x00000d40
    .4byte StartEndingTurnRecordScreen
    .4byte 0x00010e20
    .4byte 0x00000a40
    .4byte gEvent_8A00364 + 0x8
    .4byte 0x005a0e20
    .4byte 0x00002a20
    .4byte 0x00000120
