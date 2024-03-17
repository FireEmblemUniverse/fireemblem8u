    .section .data

	.incbin "baserom.gba", 0xA3EFB4, 0x75C

	.global gPal_CharacterEndingMenu
gPal_CharacterEndingMenu:  @ 0x08A3F710
	.incbin "baserom.gba", 0xA3F710, 0x40

	.global gGfx_CharacterEndingMenu
gGfx_CharacterEndingMenu:  @ 0x08A3F750
	.incbin "baserom.gba", 0xA3F750, 0x89C

	.global gUnknown_08A3FFEC
gUnknown_08A3FFEC:  @ 0x08A3FFEC
    .incbin "baserom.gba", 0xA3FFEC, 0x7C

	.global gUnknown_08A40068
gUnknown_08A40068:  @ 0x08A40068
	.incbin "baserom.gba", 0xA40068, 0x7C

	.global gTsa_SoloEndingNameplate
gTsa_SoloEndingNameplate:  @ 0x08A400E4
	.incbin "baserom.gba", 0xA400E4, 0x120

	.global gTsa_SoloEndingWindow
gTsa_SoloEndingWindow:  @ 0x08A40204
	.incbin "baserom.gba", 0xA40204, 0x148

	.global gTsa_PairedEndingNameplates
gTsa_PairedEndingNameplates:  @ 0x08A4034C
	.incbin "baserom.gba", 0xA4034C, 0x124

	.global gTsa_PairedEndingWindow
gTsa_PairedEndingWindow:  @ 0x08A40470
	.incbin "baserom.gba", 0xA40470, 0x144

	.global gPal_FinScreen
gPal_FinScreen:  @ 0x08A405B4
	.incbin "baserom.gba", 0xA405B4, 0x20

	.global gGfx_FinScreen
gGfx_FinScreen:  @ 0x08A405D4
	.incbin "baserom.gba", 0xA405D4, 0x3FC

	.global gTsa_FinScreen
gTsa_FinScreen:  @ 0x08A409D0
	.incbin "baserom.gba", 0xA409D0, 0x104

	.global gUnknown_08A40AD4
gUnknown_08A40AD4:  @ 0x08A40AD4
    .incbin "baserom.gba", 0xA40AD4, 0x40

	.global gUnknown_08A40B14
gUnknown_08A40B14:  @ 0x08A40B14
	.incbin "baserom.gba", 0xA40B14, 0x4B4

	.global Pal_StaffReelEnt_08A40FC8
Pal_StaffReelEnt_08A40FC8:  @ 0x08A40FC8
	.incbin "baserom.gba", 0xA40FC8, 0x20    @ 0xA40FE8 - 0xA40FC8

	.global Img_StaffReelEnt_08A40FE8
Img_StaffReelEnt_08A40FE8:  @ 0x08A40FE8
	.incbin "baserom.gba", 0xA40FE8, 0xB48    @ 0xA41B30 - 0xA40FE8

	.global Img_StaffReelEnt_08A41B30
Img_StaffReelEnt_08A41B30:  @ 0x08A41B30
	.incbin "baserom.gba", 0xA41B30, 0xC18    @ 0xA42748 - 0xA41B30

	.global Img_StaffReelEnt_08A42748
Img_StaffReelEnt_08A42748:  @ 0x08A42748
	.incbin "baserom.gba", 0xA42748, 0xB78    @ 0xA432C0 - 0xA42748

	.global Img_StaffReelEnt_08A432C0
Img_StaffReelEnt_08A432C0:  @ 0x08A432C0
	.incbin "baserom.gba", 0xA432C0, 0x9FC    @ 0xA43CBC - 0xA432C0

	.global Img_StaffReelEnt_08A43CBC
Img_StaffReelEnt_08A43CBC:  @ 0x08A43CBC
	.incbin "baserom.gba", 0xA43CBC, 0x1494    @ 0xA45150 - 0xA43CBC

	.global Img_StaffReelEnt_08A45150
Img_StaffReelEnt_08A45150:  @ 0x08A45150
	.incbin "baserom.gba", 0xA45150, 0x4CC    @ 0xA4561C - 0xA45150

	.global Img_StaffReelEnt_08A4561C
Img_StaffReelEnt_08A4561C:  @ 0x08A4561C
	.incbin "baserom.gba", 0xA4561C, 0x93C    @ 0xA45F58 - 0xA4561C

	.global Img_StaffReelEnt_08A45F58
Img_StaffReelEnt_08A45F58:  @ 0x08A45F58
	.incbin "baserom.gba", 0xA45F58, 0xA30    @ 0xA46988 - 0xA45F58

	.global Img_StaffReelEnt_08A46988
Img_StaffReelEnt_08A46988:  @ 0x08A46988
	.incbin "baserom.gba", 0xA46988, 0x928    @ 0xA472B0 - 0xA46988

	.global Img_StaffReelEnt_08A472B0
Img_StaffReelEnt_08A472B0:  @ 0x08A472B0
	.incbin "baserom.gba", 0xA472B0, 0x1494    @ 0xA48744 - 0xA472B0

	.global Img_StaffReelEnt_08A48744
Img_StaffReelEnt_08A48744:  @ 0x08A48744
	.incbin "baserom.gba", 0xA48744, 0x1064    @ 0xA497A8 - 0xA48744

	.global Img_StaffReelEnt_08A497A8
Img_StaffReelEnt_08A497A8:  @ 0x08A497A8
	.incbin "baserom.gba", 0xA497A8, 0x122C    @ 0xA4A9D4 - 0xA497A8

	.global Img_StaffReelEnt_08A4A9D4
Img_StaffReelEnt_08A4A9D4:  @ 0x08A4A9D4
	.incbin "baserom.gba", 0xA4A9D4, 0x434    @ 0xA4AE08 - 0xA4A9D4

	.global Tsa_StaffReelEnt_08A4AE08
Tsa_StaffReelEnt_08A4AE08:  @ 0x08A4AE08
	.incbin "baserom.gba", 0xA4AE08, 0x288    @ 0xA4B090 - 0xA4AE08

	.global Tsa_StaffReelEnt_08A4B090
Tsa_StaffReelEnt_08A4B090:  @ 0x08A4B090
	.incbin "baserom.gba", 0xA4B090, 0x264    @ 0xA4B2F4 - 0xA4B090

	.global Tsa_StaffReelEnt_08A4B2F4
Tsa_StaffReelEnt_08A4B2F4:  @ 0x08A4B2F4
	.incbin "baserom.gba", 0xA4B2F4, 0x264    @ 0xA4B558 - 0xA4B2F4

	.global Tsa_StaffReelEnt_08A4B558
Tsa_StaffReelEnt_08A4B558:  @ 0x08A4B558
	.incbin "baserom.gba", 0xA4B558, 0x230    @ 0xA4B788 - 0xA4B558

	.global Tsa_StaffReelEnt_08A4B788
Tsa_StaffReelEnt_08A4B788:  @ 0x08A4B788
	.incbin "baserom.gba", 0xA4B788, 0x3C8    @ 0xA4BB50 - 0xA4B788

	.global Tsa_StaffReelEnt_08A4BB50
Tsa_StaffReelEnt_08A4BB50:  @ 0x08A4BB50
	.incbin "baserom.gba", 0xA4BB50, 0x174    @ 0xA4BCC4 - 0xA4BB50

	.global Tsa_StaffReelEnt_08A4BCC4
Tsa_StaffReelEnt_08A4BCC4:  @ 0x08A4BCC4
	.incbin "baserom.gba", 0xA4BCC4, 0x1FC    @ 0xA4BEC0 - 0xA4BCC4

	.global Tsa_StaffReelEnt_08A4BEC0
Tsa_StaffReelEnt_08A4BEC0:  @ 0x08A4BEC0
	.incbin "baserom.gba", 0xA4BEC0, 0x224    @ 0xA4C0E4 - 0xA4BEC0

	.global Tsa_StaffReelEnt_08A4C0E4
Tsa_StaffReelEnt_08A4C0E4:  @ 0x08A4C0E4
	.incbin "baserom.gba", 0xA4C0E4, 0x224    @ 0xA4C308 - 0xA4C0E4

	.global Tsa_StaffReelEnt_08A4C308
Tsa_StaffReelEnt_08A4C308:  @ 0x08A4C308
	.incbin "baserom.gba", 0xA4C308, 0x3E4    @ 0xA4C6EC - 0xA4C308

	.global Tsa_StaffReelEnt_08A4C6EC
Tsa_StaffReelEnt_08A4C6EC:  @ 0x08A4C6EC
	.incbin "baserom.gba", 0xA4C6EC, 0x304    @ 0xA4C9F0 - 0xA4C6EC

	.global Tsa_StaffReelEnt_08A4C9F0
Tsa_StaffReelEnt_08A4C9F0:  @ 0x08A4C9F0
	.incbin "baserom.gba", 0xA4C9F0, 0x350    @ 0xA4CD40 - 0xA4C9F0

	.global Tsa_StaffReelEnt_08A4CD40
Tsa_StaffReelEnt_08A4CD40:  @ 0x08A4CD40
	.incbin "baserom.gba", 0xA4CD40, 0x1EC    @ 0xA4CF2C - 0xA4CD40

	.global gGfx_BrownTextBox
gGfx_BrownTextBox:  @ 0x08A4CF2C
	.incbin "baserom.gba", 0xA4CF2C, 0x1A0

	.global gPal_BrownTextBox
gPal_BrownTextBox:  @ 0x08A4D0CC
	.incbin "baserom.gba", 0xA4D0CC, 0x11C

	.align 2, 0
	.global cg_0_part_0_tiles
cg_0_part_0_tiles: @8a4d1e8
	.incbin "graphics/cg/cg_0_part_0.4bpp.lz"

	.align 2, 0
	.global cg_0_part_1_tiles
cg_0_part_1_tiles: @8a4d7b8
	.incbin "graphics/cg/cg_0_part_1.4bpp.lz"

	.align 2, 0
	.global cg_0_part_2_tiles
cg_0_part_2_tiles: @8a4dfb8
	.incbin "graphics/cg/cg_0_part_2.4bpp.lz"

	.align 2, 0
	.global cg_0_part_3_tiles
cg_0_part_3_tiles: @8a4e7dc
	.incbin "graphics/cg/cg_0_part_3.4bpp.lz"

	.align 2, 0
	.global cg_0_part_4_tiles
cg_0_part_4_tiles: @8a4f040
	.incbin "graphics/cg/cg_0_part_4.4bpp.lz"

	.align 2, 0
	.global cg_0_part_5_tiles
cg_0_part_5_tiles: @8a4f898
	.incbin "graphics/cg/cg_0_part_5.4bpp.lz"

	.align 2, 0
	.global cg_0_part_6_tiles
cg_0_part_6_tiles: @8a50118
	.incbin "graphics/cg/cg_0_part_6.4bpp.lz"

	.align 2, 0
	.global cg_0_part_7_tiles
cg_0_part_7_tiles: @8a50980
	.incbin "graphics/cg/cg_0_part_7.4bpp.lz"

	.align 2, 0
	.global cg_0_part_8_tiles
cg_0_part_8_tiles: @8a511f0
	.incbin "graphics/cg/cg_0_part_8.4bpp.lz"

	.align 2, 0
	.global cg_0_part_9_tiles
cg_0_part_9_tiles: @8a51a50
	.incbin "graphics/cg/cg_0_part_9.4bpp.lz"

	.align 2, 0
	.global cg_1_part_0_tiles
cg_1_part_0_tiles: @8a52258
	.incbin "graphics/cg/cg_1_part_0.4bpp.lz"

	.align 2, 0
	.global cg_1_part_1_tiles
cg_1_part_1_tiles: @8a529e4
	.incbin "graphics/cg/cg_1_part_1.4bpp.lz"

	.align 2, 0
	.global cg_1_part_2_tiles
cg_1_part_2_tiles: @8a531fc
	.incbin "graphics/cg/cg_1_part_2.4bpp.lz"

	.align 2, 0
	.global cg_1_part_3_tiles
cg_1_part_3_tiles: @8a53a10
	.incbin "graphics/cg/cg_1_part_3.4bpp.lz"

	.align 2, 0
	.global cg_1_part_4_tiles
cg_1_part_4_tiles: @8a5421c
	.incbin "graphics/cg/cg_1_part_4.4bpp.lz"

	.align 2, 0
	.global cg_1_part_5_tiles
cg_1_part_5_tiles: @8a54a30
	.incbin "graphics/cg/cg_1_part_5.4bpp.lz"

	.align 2, 0
	.global cg_1_part_6_tiles
cg_1_part_6_tiles: @8a55274
	.incbin "graphics/cg/cg_1_part_6.4bpp.lz"

	.align 2, 0
	.global cg_1_part_7_tiles
cg_1_part_7_tiles: @8a55a1c
	.incbin "graphics/cg/cg_1_part_7.4bpp.lz"

	.align 2, 0
	.global cg_1_part_8_tiles
cg_1_part_8_tiles: @8a56210
	.incbin "graphics/cg/cg_1_part_8.4bpp.lz"

	.align 2, 0
	.global cg_1_part_9_tiles
cg_1_part_9_tiles: @8a56a24
	.incbin "graphics/cg/cg_1_part_9.4bpp.lz"

	.align 2, 0
	.global cg_2_part_0_tiles
cg_2_part_0_tiles: @8a57200
	.incbin "graphics/cg/cg_2_part_0.4bpp.lz"

	.align 2, 0
	.global cg_2_part_1_tiles
cg_2_part_1_tiles: @8a57a30
	.incbin "graphics/cg/cg_2_part_1.4bpp.lz"

	.align 2, 0
	.global cg_2_part_2_tiles
cg_2_part_2_tiles: @8a58288
	.incbin "graphics/cg/cg_2_part_2.4bpp.lz"

	.align 2, 0
	.global cg_2_part_3_tiles
cg_2_part_3_tiles: @8a58ae4
	.incbin "graphics/cg/cg_2_part_3.4bpp.lz"

	.align 2, 0
	.global cg_2_part_4_tiles
cg_2_part_4_tiles: @8a59358
	.incbin "graphics/cg/cg_2_part_4.4bpp.lz"

	.align 2, 0
	.global cg_2_part_5_tiles
cg_2_part_5_tiles: @8a59bd8
	.incbin "graphics/cg/cg_2_part_5.4bpp.lz"

	.align 2, 0
	.global cg_2_part_6_tiles
cg_2_part_6_tiles: @8a5a434
	.incbin "graphics/cg/cg_2_part_6.4bpp.lz"

	.align 2, 0
	.global cg_2_part_7_tiles
cg_2_part_7_tiles: @8a5ac34
	.incbin "graphics/cg/cg_2_part_7.4bpp.lz"

	.align 2, 0
	.global cg_2_part_8_tiles
cg_2_part_8_tiles: @8a5b390
	.incbin "graphics/cg/cg_2_part_8.4bpp.lz"

	.align 2, 0
	.global cg_2_part_9_tiles
cg_2_part_9_tiles: @8a5bb54
	.incbin "graphics/cg/cg_2_part_9.4bpp.lz"

	.align 2, 0
	.global cg_3_part_0_tiles
cg_3_part_0_tiles: @8a5c350
	.incbin "graphics/cg/cg_3_part_0.4bpp.lz"

	.align 2, 0
	.global cg_3_part_1_tiles
cg_3_part_1_tiles: @8a5cb20
	.incbin "graphics/cg/cg_3_part_1.4bpp.lz"

	.align 2, 0
	.global cg_3_part_2_tiles
cg_3_part_2_tiles: @8a5d2f8
	.incbin "graphics/cg/cg_3_part_2.4bpp.lz"

	.align 2, 0
	.global cg_3_part_3_tiles
cg_3_part_3_tiles: @8a5da70
	.incbin "graphics/cg/cg_3_part_3.4bpp.lz"

	.align 2, 0
	.global cg_3_part_4_tiles
cg_3_part_4_tiles: @8a5e27c
	.incbin "graphics/cg/cg_3_part_4.4bpp.lz"

	.align 2, 0
	.global cg_3_part_5_tiles
cg_3_part_5_tiles: @8a5ea9c
	.incbin "graphics/cg/cg_3_part_5.4bpp.lz"

	.align 2, 0
	.global cg_3_part_6_tiles
cg_3_part_6_tiles: @8a5f2f0
	.incbin "graphics/cg/cg_3_part_6.4bpp.lz"

	.align 2, 0
	.global cg_3_part_7_tiles
cg_3_part_7_tiles: @8a5fb20
	.incbin "graphics/cg/cg_3_part_7.4bpp.lz"

	.align 2, 0
	.global cg_3_part_8_tiles
cg_3_part_8_tiles: @8a602ec
	.incbin "graphics/cg/cg_3_part_8.4bpp.lz"

	.align 2, 0
	.global cg_3_part_9_tiles
cg_3_part_9_tiles: @8a60b24
	.incbin "graphics/cg/cg_3_part_9.4bpp.lz"

	.align 2, 0
	.global cg_4_part_0_tiles
cg_4_part_0_tiles: @8a61388
	.incbin "graphics/cg/cg_4_part_0.4bpp.lz"

	.align 2, 0
	.global cg_4_part_1_tiles
cg_4_part_1_tiles: @8a61bc4
	.incbin "graphics/cg/cg_4_part_1.4bpp.lz"

	.align 2, 0
	.global cg_4_part_2_tiles
cg_4_part_2_tiles: @8a62428
	.incbin "graphics/cg/cg_4_part_2.4bpp.lz"

	.align 2, 0
	.global cg_4_part_3_tiles
cg_4_part_3_tiles: @8a62c8c
	.incbin "graphics/cg/cg_4_part_3.4bpp.lz"

	.align 2, 0
	.global cg_4_part_4_tiles
cg_4_part_4_tiles: @8a634ec
	.incbin "graphics/cg/cg_4_part_4.4bpp.lz"

	.align 2, 0
	.global cg_4_part_5_tiles
cg_4_part_5_tiles: @8a63d64
	.incbin "graphics/cg/cg_4_part_5.4bpp.lz"

	.align 2, 0
	.global cg_4_part_6_tiles
cg_4_part_6_tiles: @8a645d0
	.incbin "graphics/cg/cg_4_part_6.4bpp.lz"

	.align 2, 0
	.global cg_4_part_7_tiles
cg_4_part_7_tiles: @8a64dec
	.incbin "graphics/cg/cg_4_part_7.4bpp.lz"

	.align 2, 0
	.global cg_4_part_8_tiles
cg_4_part_8_tiles: @8a6561c
	.incbin "graphics/cg/cg_4_part_8.4bpp.lz"

	.align 2, 0
	.global cg_4_part_9_tiles
cg_4_part_9_tiles: @8a65e34
	.incbin "graphics/cg/cg_4_part_9.4bpp.lz"

	.align 2, 0
	.global cg_5_part_0_tiles
cg_5_part_0_tiles: @8a66634
	.incbin "graphics/cg/cg_5_part_0.4bpp.lz"

	.align 2, 0
	.global cg_5_part_1_tiles
cg_5_part_1_tiles: @8a66de4
	.incbin "graphics/cg/cg_5_part_1.4bpp.lz"

	.align 2, 0
	.global cg_5_part_2_tiles
cg_5_part_2_tiles: @8a675c8
	.incbin "graphics/cg/cg_5_part_2.4bpp.lz"

	.align 2, 0
	.global cg_5_part_3_tiles
cg_5_part_3_tiles: @8a67dc0
	.incbin "graphics/cg/cg_5_part_3.4bpp.lz"

	.align 2, 0
	.global cg_5_part_4_tiles
cg_5_part_4_tiles: @8a685fc
	.incbin "graphics/cg/cg_5_part_4.4bpp.lz"

	.align 2, 0
	.global cg_5_part_5_tiles
cg_5_part_5_tiles: @8a68e38
	.incbin "graphics/cg/cg_5_part_5.4bpp.lz"

	.align 2, 0
	.global cg_5_part_6_tiles
cg_5_part_6_tiles: @8a69694
	.incbin "graphics/cg/cg_5_part_6.4bpp.lz"

	.align 2, 0
	.global cg_5_part_7_tiles
cg_5_part_7_tiles: @8a69ec4
	.incbin "graphics/cg/cg_5_part_7.4bpp.lz"

	.align 2, 0
	.global cg_5_part_8_tiles
cg_5_part_8_tiles: @8a6a6cc
	.incbin "graphics/cg/cg_5_part_8.4bpp.lz"

	.align 2, 0
	.global cg_5_part_9_tiles
cg_5_part_9_tiles: @8a6ae84
	.incbin "graphics/cg/cg_5_part_9.4bpp.lz"

	.align 2, 0
	.global cg_6_part_0_tiles
cg_6_part_0_tiles: @8a6b5c4
	.incbin "graphics/cg/cg_6_part_0.4bpp.lz"

	.align 2, 0
	.global cg_6_part_1_tiles
cg_6_part_1_tiles: @8a6bdd8
	.incbin "graphics/cg/cg_6_part_1.4bpp.lz"

	.align 2, 0
	.global cg_6_part_2_tiles
cg_6_part_2_tiles: @8a6c62c
	.incbin "graphics/cg/cg_6_part_2.4bpp.lz"

	.align 2, 0
	.global cg_6_part_3_tiles
cg_6_part_3_tiles: @8a6ce80
	.incbin "graphics/cg/cg_6_part_3.4bpp.lz"

	.align 2, 0
	.global cg_6_part_4_tiles
cg_6_part_4_tiles: @8a6d6dc
	.incbin "graphics/cg/cg_6_part_4.4bpp.lz"

	.align 2, 0
	.global cg_6_part_5_tiles
cg_6_part_5_tiles: @8a6df50
	.incbin "graphics/cg/cg_6_part_5.4bpp.lz"

	.align 2, 0
	.global cg_6_part_6_tiles
cg_6_part_6_tiles: @8a6e7cc
	.incbin "graphics/cg/cg_6_part_6.4bpp.lz"

	.align 2, 0
	.global cg_6_part_7_tiles
cg_6_part_7_tiles: @8a6f040
	.incbin "graphics/cg/cg_6_part_7.4bpp.lz"

	.align 2, 0
	.global cg_6_part_8_tiles
cg_6_part_8_tiles: @8a6f894
	.incbin "graphics/cg/cg_6_part_8.4bpp.lz"

	.align 2, 0
	.global cg_6_part_9_tiles
cg_6_part_9_tiles: @8a700e4
	.incbin "graphics/cg/cg_6_part_9.4bpp.lz"

	.align 2, 0
	.global cg_7_part_0_tiles
cg_7_part_0_tiles: @8a708f4
	.incbin "graphics/cg/cg_7_part_0.4bpp.lz"

	.align 2, 0
	.global cg_7_part_1_tiles
cg_7_part_1_tiles: @8a70f04
	.incbin "graphics/cg/cg_7_part_1.4bpp.lz"

	.align 2, 0
	.global cg_7_part_2_tiles
cg_7_part_2_tiles: @8a716e0
	.incbin "graphics/cg/cg_7_part_2.4bpp.lz"

	.align 2, 0
	.global cg_7_part_3_tiles
cg_7_part_3_tiles: @8a71ee4
	.incbin "graphics/cg/cg_7_part_3.4bpp.lz"

	.align 2, 0
	.global cg_7_part_4_tiles
cg_7_part_4_tiles: @8a72718
	.incbin "graphics/cg/cg_7_part_4.4bpp.lz"

	.align 2, 0
	.global cg_7_part_5_tiles
cg_7_part_5_tiles: @8a72f44
	.incbin "graphics/cg/cg_7_part_5.4bpp.lz"

	.align 2, 0
	.global cg_7_part_6_tiles
cg_7_part_6_tiles: @8a737a0
	.incbin "graphics/cg/cg_7_part_6.4bpp.lz"

	.align 2, 0
	.global cg_7_part_7_tiles
cg_7_part_7_tiles: @8a73ff0
	.incbin "graphics/cg/cg_7_part_7.4bpp.lz"

	.align 2, 0
	.global cg_7_part_8_tiles
cg_7_part_8_tiles: @8a7480c
	.incbin "graphics/cg/cg_7_part_8.4bpp.lz"

	.align 2, 0
	.global cg_7_part_9_tiles
cg_7_part_9_tiles: @8a74ff4
	.incbin "graphics/cg/cg_7_part_9.4bpp.lz"

	.align 2, 0
	.global cg_8_part_0_tiles
cg_8_part_0_tiles: @8a75838
	.incbin "graphics/cg/cg_8_part_0.4bpp.lz"

	.align 2, 0
	.global cg_8_part_1_tiles
cg_8_part_1_tiles: @8a75fb0
	.incbin "graphics/cg/cg_8_part_1.4bpp.lz"

	.align 2, 0
	.global cg_8_part_2_tiles
cg_8_part_2_tiles: @8a767fc
	.incbin "graphics/cg/cg_8_part_2.4bpp.lz"

	.align 2, 0
	.global cg_8_part_3_tiles
cg_8_part_3_tiles: @8a77070
	.incbin "graphics/cg/cg_8_part_3.4bpp.lz"

	.align 2, 0
	.global cg_8_part_4_tiles
cg_8_part_4_tiles: @8a778d8
	.incbin "graphics/cg/cg_8_part_4.4bpp.lz"

	.align 2, 0
	.global cg_8_part_5_tiles
cg_8_part_5_tiles: @8a780ec
	.incbin "graphics/cg/cg_8_part_5.4bpp.lz"

	.align 2, 0
	.global cg_8_part_6_tiles
cg_8_part_6_tiles: @8a7892c
	.incbin "graphics/cg/cg_8_part_6.4bpp.lz"

	.align 2, 0
	.global cg_8_part_7_tiles
cg_8_part_7_tiles: @8a79188
	.incbin "graphics/cg/cg_8_part_7.4bpp.lz"

	.align 2, 0
	.global cg_8_part_8_tiles
cg_8_part_8_tiles: @8a799ec
	.incbin "graphics/cg/cg_8_part_8.4bpp.lz"

	.align 2, 0
	.global cg_8_part_9_tiles
cg_8_part_9_tiles: @8a7a218
	.incbin "graphics/cg/cg_8_part_9.4bpp.lz"

	.align 2, 0
	.global cg_9_part_0_tiles
cg_9_part_0_tiles: @8a7aa0c
	.incbin "graphics/cg/cg_9_part_0.4bpp.lz"

	.align 2, 0
	.global cg_9_part_1_tiles
cg_9_part_1_tiles: @8a7b1f4
	.incbin "graphics/cg/cg_9_part_1.4bpp.lz"

	.align 2, 0
	.global cg_9_part_2_tiles
cg_9_part_2_tiles: @8a7ba2c
	.incbin "graphics/cg/cg_9_part_2.4bpp.lz"

	.align 2, 0
	.global cg_9_part_3_tiles
cg_9_part_3_tiles: @8a7c280
	.incbin "graphics/cg/cg_9_part_3.4bpp.lz"

	.align 2, 0
	.global cg_9_part_4_tiles
cg_9_part_4_tiles: @8a7cad0
	.incbin "graphics/cg/cg_9_part_4.4bpp.lz"

	.align 2, 0
	.global cg_9_part_5_tiles
cg_9_part_5_tiles: @8a7d324
	.incbin "graphics/cg/cg_9_part_5.4bpp.lz"

	.align 2, 0
	.global cg_9_part_6_tiles
cg_9_part_6_tiles: @8a7db70
	.incbin "graphics/cg/cg_9_part_6.4bpp.lz"

	.align 2, 0
	.global cg_9_part_7_tiles
cg_9_part_7_tiles: @8a7e3e0
	.incbin "graphics/cg/cg_9_part_7.4bpp.lz"

	.align 2, 0
	.global cg_9_part_8_tiles
cg_9_part_8_tiles: @8a7ec3c
	.incbin "graphics/cg/cg_9_part_8.4bpp.lz"

	.align 2, 0
	.global cg_9_part_9_tiles
cg_9_part_9_tiles: @8a7f494
	.incbin "graphics/cg/cg_9_part_9.4bpp.lz"

	.align 2, 0
	.global cg_0_map
cg_0_map: @8a7fcdc
	.incbin "graphics/cg/cg_0.bin"

	.align 2, 0
	.global cg_1_map
cg_1_map: @8a80190
	.incbin "graphics/cg/cg_1.bin"

	.align 2, 0
	.global cg_2_map
cg_2_map: @8a80644
	.incbin "graphics/cg/cg_2.bin"

	.align 2, 0
	.global cg_3_map
cg_3_map: @8a80af8
	.incbin "graphics/cg/cg_3.bin"

	.align 2, 0
	.global cg_4_map
cg_4_map: @8a80fac
	.incbin "graphics/cg/cg_4.bin"

	.align 2, 0
	.global cg_5_map
cg_5_map: @8a81460
	.incbin "graphics/cg/cg_5.bin"

	.align 2, 0
	.global cg_6_map
cg_6_map: @8a81914
	.incbin "graphics/cg/cg_6.bin"

	.align 2, 0
	.global cg_7_map
cg_7_map: @8a81dc8
	.incbin "graphics/cg/cg_7.bin"

	.align 2, 0
	.global cg_8_map
cg_8_map: @8a8227c
	.incbin "graphics/cg/cg_8.bin"

	.align 2, 0
	.global cg_9_map
cg_9_map: @8a82730
	.incbin "graphics/cg/cg_9.bin"

	.align 2, 0
	.global cg_0_palette
cg_0_palette: @8a82be4
	.incbin "graphics/cg/cg_0.gbapal"

	.align 2, 0
	.global cg_1_palette
cg_1_palette: @8a82ca4
	.incbin "graphics/cg/cg_1.gbapal"

	.align 2, 0
	.global cg_2_palette
cg_2_palette: @8a82d64
	.incbin "graphics/cg/cg_2.gbapal"

	.align 2, 0
	.global cg_3_palette
cg_3_palette: @8a82e24
	.incbin "graphics/cg/cg_3.gbapal"

	.align 2, 0
	.global cg_4_palette
cg_4_palette: @8a82ee4
	.incbin "graphics/cg/cg_4.gbapal"

	.align 2, 0
	.global cg_5_palette
cg_5_palette: @8a82fa4
	.incbin "graphics/cg/cg_5.gbapal"

	.align 2, 0
	.global cg_6_palette
cg_6_palette: @8a83064
	.incbin "graphics/cg/cg_6.gbapal"

	.align 2, 0
	.global cg_7_palette
cg_7_palette: @8a83124
	.incbin "graphics/cg/cg_7.gbapal"

	.align 2, 0
	.global cg_8_palette
cg_8_palette: @8a831e4
	.incbin "graphics/cg/cg_8.gbapal"

	.align 2, 0
	.global cg_9_palette
cg_9_palette: @8a832a4
	.incbin "graphics/cg/cg_9.gbapal"

	.global gUnknown_08A83364
gUnknown_08A83364:  @ 0x08A83364
	.incbin "baserom.gba", 0xA83364, 0x12C00

	.global gUnknown_08A95F64
gUnknown_08A95F64:  @ 0x08A95F64
	.incbin "baserom.gba", 0xA95F64, 0x80

	.global gUnknown_08A95FE4
gUnknown_08A95FE4:  @ 0x08A95FE4
	.incbin "baserom.gba", 0xA95FE4, 0x80

	.global gUnknown_08A96064
gUnknown_08A96064:  @ 0x08A96064
	.incbin "baserom.gba", 0xA96064, 0x2A4

	.global Img_GmapNodes
Img_GmapNodes:  @ 0x08A96308
	.incbin "baserom.gba", 0xA96308, 0x1108

	.global Img_GmapCastleNodes
Img_GmapCastleNodes:  @ 0x08A97410
	.incbin "baserom.gba", 0xA97410, 0x630

	.global gUnknown_08A97A40
gUnknown_08A97A40:  @ 0x08A97A40
	.incbin "baserom.gba", 0xA97A40, 0x20

	.global gPal_GMapPI_ShopIcons
gPal_GMapPI_ShopIcons:  @ 0x08A97A60
	.incbin "baserom.gba", 0xA97A60, 0x20

	.global gGfx_GMapPI_ShopIcons
gGfx_GMapPI_ShopIcons:  @ 0x08A97A80
	.incbin "baserom.gba", 0xA97A80, 0x4C

	.global gPal_08A97ACC
gPal_08A97ACC:  @ 0x08A97ACC
	.incbin "baserom.gba", 0xA97ACC, 0x20

	.global Sprite_08A97AEC
Sprite_08A97AEC:  @ 0x08A97AEC
	.incbin "baserom.gba", 0xA97AEC, 0x1AC

	.global gImg_WorldmapNodeRevealEffect
gImg_WorldmapNodeRevealEffect:  @ 0x08A97C98
	.incbin "baserom.gba", 0xA97C98, 0x190

	.global gPal_WorldmapNodeRevealEffect
gPal_WorldmapNodeRevealEffect:  @ 0x08A97E28
	.incbin "baserom.gba", 0xA97E28, 0x20

	.global gUnknown_08A97E48
gUnknown_08A97E48:  @ 0x08A97E48
	.incbin "baserom.gba", 0xA97E48, 0x90

	.global Img_GmapPath
Img_GmapPath:  @ 0x08A97ED8
	.incbin "baserom.gba", 0xA97ED8, 0xCC

	.global gUnknown_08A97FA4
gUnknown_08A97FA4:  @ 0x08A97FA4
	.incbin "baserom.gba", 0xA97FA4, 0x20

	.global gUnknown_08A97FC4
gUnknown_08A97FC4:  @ 0x08A97FC4
	.incbin "baserom.gba", 0xA97FC4, 0x34

	.global gUnknown_08A97FF8
gUnknown_08A97FF8:  @ 0x08A97FF8
	.incbin "baserom.gba", 0xA97FF8, 0x38

	.global gUnknown_08A98030
gUnknown_08A98030:  @ 0x08A98030
	.incbin "baserom.gba", 0xA98030, 0x24

	.global gUnknown_08A98054
gUnknown_08A98054:  @ 0x08A98054
	.incbin "baserom.gba", 0xA98054, 0x18

	.global gUnknown_08A9806C
gUnknown_08A9806C:  @ 0x8A9806C
	.incbin "baserom.gba", 0xA9806C, 0x24

	.global gUnknown_08A98090
gUnknown_08A98090:  @ 0x8A98090
	.incbin "baserom.gba", 0xA98090, 0x24

	.global gUnknown_08A980B4
gUnknown_08A980B4:  @ 0x8A980B4
	.incbin "baserom.gba", 0xA980B4, 0x28

	.global gUnknown_08A980DC
gUnknown_08A980DC:  @ 0x8A980DC
	.incbin "baserom.gba", 0xA980DC, 0x28

	.global gUnknown_08A98104
gUnknown_08A98104:  @ 0x8A98104
	.incbin "baserom.gba", 0xA98104, 0x40

	.global gUnknown_08A98144
gUnknown_08A98144:  @ 0x8A98144
	.incbin "baserom.gba", 0xA98144, 0x24

	.global gUnknown_08A98168
gUnknown_08A98168:  @ 0x8A98168
	.incbin "baserom.gba", 0xA98168, 0x34

	.global gUnknown_08A9819C
gUnknown_08A9819C:  @ 0x8A9819C
	.incbin "baserom.gba", 0xA9819C, 0x20

	.global gUnknown_08A981BC
gUnknown_08A981BC:  @ 0x8A981BC
	.incbin "baserom.gba", 0xA981BC, 0x38

	.global gUnknown_08A981F4
gUnknown_08A981F4:  @ 0x8A981F4
	.incbin "baserom.gba", 0xA981F4, 0x34

	.global gUnknown_08A98228
gUnknown_08A98228:  @ 0x8A98228
	.incbin "baserom.gba", 0xA98228, 0x54

	.global gUnknown_08A9827C
gUnknown_08A9827C:  @ 0x8A9827C
	.incbin "baserom.gba", 0xA9827C, 0x58

	.global gUnknown_08A982D4
gUnknown_08A982D4:  @ 0x8A982D4
	.incbin "baserom.gba", 0xA982D4, 0x40

	.global gUnknown_08A98314
gUnknown_08A98314:  @ 0x8A98314
	.incbin "baserom.gba", 0xA98314, 0x30

	.global gUnknown_08A98344
gUnknown_08A98344:  @ 0x8A98344
	.incbin "baserom.gba", 0xA98344, 0x28

	.global gUnknown_08A9836C
gUnknown_08A9836C:  @ 0x8A9836C
	.incbin "baserom.gba", 0xA9836C, 0x50

	.global gUnknown_08A983BC
gUnknown_08A983BC:  @ 0x8A983BC
	.incbin "baserom.gba", 0xA983BC, 0x34

	.global gUnknown_08A983F0
gUnknown_08A983F0:  @ 0x8A983F0
	.incbin "baserom.gba", 0xA983F0, 0x58

	.global gUnknown_08A98448
gUnknown_08A98448:  @ 0x8A98448
	.incbin "baserom.gba", 0xA98448, 0x34

	.global gUnknown_08A9847C
gUnknown_08A9847C:  @ 0x8A9847C
	.incbin "baserom.gba", 0xA9847C, 0x58

	.global gUnknown_08A984D4
gUnknown_08A984D4:  @ 0x8A984D4
	.incbin "baserom.gba", 0xA984D4, 0x38

	.global gUnknown_08A9850C
gUnknown_08A9850C:  @ 0x8A9850C
	.incbin "baserom.gba", 0xA9850C, 0x34

	.global gUnknown_08A98540
gUnknown_08A98540:  @ 0x8A98540
	.incbin "baserom.gba", 0xA98540, 0x28

	.global gUnknown_08A98568
gUnknown_08A98568:  @ 0x8A98568
	.incbin "baserom.gba", 0xA98568, 0x3C

	.global gUnknown_08A985A4
gUnknown_08A985A4:  @ 0x8A985A4
	.incbin "baserom.gba", 0xA985A4, 0x58

	.global gUnknown_08A985FC
gUnknown_08A985FC:  @ 0x8A985FC
	.incbin "baserom.gba", 0xA985FC, 0x40

	.global gUnknown_08A9863C
gUnknown_08A9863C:  @ 0x8A9863C
	.incbin "baserom.gba", 0xA9863C, 0x58

	.global gUnknown_08A98694
gUnknown_08A98694:  @ 0x8A98694
	.incbin "baserom.gba", 0xA98694, 0x2C

	.global gUnknown_08A986C0
gUnknown_08A986C0:  @ 0x08A986C0
	.incbin "baserom.gba", 0xA986C0, 0x538

	.global gUnknown_08A98BF8
gUnknown_08A98BF8:  @ 0x08A98BF8
	.incbin "baserom.gba", 0xA98BF8, 0x104

	.global gUnknown_08A98CFC
gUnknown_08A98CFC:  @ 0x08A98CFC
	.incbin "baserom.gba", 0xA98CFC, 0x5C

	.global gUnknown_08A98D58
gUnknown_08A98D58:  @ 0x08A98D58
	.incbin "baserom.gba", 0xA98D58, 0x30

	.global gUnknown_08A98D88
gUnknown_08A98D88:  @ 0x08A98D88
	.incbin "baserom.gba", 0xA98D88, 0x18

	.global gUnknown_08A98DA0
gUnknown_08A98DA0:  @ 0x08A98DA0
	.incbin "baserom.gba", 0xA98DA0, 0x18

	.global gUnknown_08A98DB8
gUnknown_08A98DB8:  @ 0x08A98DB8
	.incbin "baserom.gba", 0xA98DB8, 0x14

	.global gUnknown_08A98DCC
gUnknown_08A98DCC:  @ 0x08A98DCC
	.incbin "baserom.gba", 0xA98DCC, 0x60

	.global gUnknown_08A98E2C
gUnknown_08A98E2C:  @ 0x08A98E2C
	.incbin "baserom.gba", 0xA98E2C, 0x20

	.global gUnknown_08A98E4C
gUnknown_08A98E4C:  @ 0x08A98E4C
    .incbin "baserom.gba", 0xA98E4C, 0x20

	.global gUnknown_08A98E6C
gUnknown_08A98E6C:  @ 0x08A98E6C
	.incbin "baserom.gba", 0xA98E6C, 0x20

	.global gUnknown_08A98E8C
gUnknown_08A98E8C:  @ 0x08A98E8C
	.incbin "baserom.gba", 0xA98E8C, 0x20

	.global gUnknown_08A98EAC
gUnknown_08A98EAC:  @ 0x08A98EAC
	.incbin "baserom.gba", 0xA98EAC, 0x84

	.global gUnknown_08A98F30
gUnknown_08A98F30:  @ 0x08A98F30
	.incbin "baserom.gba", 0xA98F30, 0xEC

	.global gGfx_GMapPI_LevelNums
gGfx_GMapPI_LevelNums:  @ 0x08A9901C
	.incbin "baserom.gba", 0xA9901C, 0x104

	.global gPal_GMapPI_LevelNums
gPal_GMapPI_LevelNums:  @ 0x08A99120
	.incbin "baserom.gba", 0xA99120, 0x20

	.global Img_EventGmap
Img_EventGmap:  @ 0x08A99140
	.incbin "baserom.gba", 0xA99140, 0x4E34

	.global Tsa_EventGmap
Tsa_EventGmap:  @ 0x08A9DF74
	.incbin "baserom.gba", 0xA9DF74, 0x550

	.global Pal_EventGmap
Pal_EventGmap:  @ 0x08A9E4C4
	.incbin "baserom.gba", 0xA9E4C4, 0x80

	.global gImg_08A9E544
gImg_08A9E544:  @ 0x08A9E544
	.incbin "baserom.gba", 0xA9E544, 0x78

	.global gPal_08A9E5BC
gPal_08A9E5BC:  @ 0x08A9E5BC
	.incbin "baserom.gba", 0xA9E5BC, 0x20

	.global gTsa_08A9E5DC
gTsa_08A9E5DC:  @ 0x08A9E5DC
	.incbin "baserom.gba", 0xA9E5DC, 0xAC

	.global Pal_WmHighLightNationMap
Pal_WmHighLightNationMap:  @ 0x08A9E688
	.incbin "baserom.gba", 0xA9E688, 0x40

    .global Img_WmHightLightMapFrecia
Img_WmHightLightMapFrecia:
    .incbin "graphics/world_map/nations/Gfx_WmNationFrecia.4bpp.lz"

    .global Ap_WmHightLightMapFrecia
Ap_WmHightLightMapFrecia:
    .incbin "baserom.gba", 0xA9EC24, 0xA9EC94 - 0xA9EC24

    .global Img_WmHightLightMap2
Img_WmHightLightMap2:
    .incbin "baserom.gba", 0xA9EC94, 0xA9F358 - 0xA9EC94

    .global Ap_WmHightLightMap2
Ap_WmHightLightMap2:
    .incbin "baserom.gba", 0xA9F358, 0xA9F494 - 0xA9F358

    .global Img_WmHightLightMap3
Img_WmHightLightMap3:
    .incbin "baserom.gba", 0xA9F494, 0xA9F9C8 - 0xA9F494

    .global Ap_WmHightLightMap3
Ap_WmHightLightMap3:
    .incbin "baserom.gba", 0xA9F9C8, 0xA9FA2C - 0xA9F9C8

    .global Img_WmHightLightMap4
Img_WmHightLightMap4:
    .incbin "baserom.gba", 0xA9FA2C, 0xA9FEA4 - 0xA9FA2C

    .global Ap_WmHightLightMap4
Ap_WmHightLightMap4:
    .incbin "baserom.gba", 0xA9FEA4, 0xA9FF00 - 0xA9FEA4

    .global Img_WmHightLightMap5
Img_WmHightLightMap5:
    .incbin "baserom.gba", 0xA9FF00, 0xAA020C - 0xA9FF00

    .global Ap_WmHightLightMap5
Ap_WmHightLightMap5:
    .incbin "baserom.gba", 0xAA020C, 0xAA0240 - 0xAA020C

    .global Img_WmHightLightMap6
Img_WmHightLightMap6:
    .incbin "baserom.gba", 0xAA0240, 0xAA0760 - 0xAA0240

    .global Ap_WmHightLightMap6
Ap_WmHightLightMap6:
    .incbin "baserom.gba", 0xAA0760, 0xAA07B0 - 0xAA0760

    .global Img_WmHightLightMap7
Img_WmHightLightMap7:
    .incbin "baserom.gba", 0xAA07B0, 0xAA0B90 - 0xAA07B0

    .global Ap_WmHightLightMap7
Ap_WmHightLightMap7:
    .incbin "baserom.gba", 0xAA0B90, 0xAA0BC8 - 0xAA0B90

    .global Img_WmHightLightMap8
Img_WmHightLightMap8:
    .incbin "baserom.gba", 0xAA0BC8, 0xAA10E4 - 0xAA0BC8

    .global Ap_WmHightLightMap8
Ap_WmHightLightMap8:
    .incbin "baserom.gba", 0xAA10E4, 0xAA114C - 0xAA10E4

	.global Img_WorldMapPlaceDot
Img_WorldMapPlaceDot:  @ 0x08AA114C
	.incbin "baserom.gba", 0xAA114C, 0x44

	.global Pal_WmPlaceDot_Highlight
Pal_WmPlaceDot_Highlight:  @ 0x08AA1190
	.incbin "baserom.gba", 0xAA1190, 0x20

	.global Pal_WmPlaceDot_Standard
Pal_WmPlaceDot_Standard:  @ 0x08AA11B0
	.incbin "baserom.gba", 0xAA11B0, 0x20

	.global gUnknown_08AA11D0
gUnknown_08AA11D0:  @ 0x08AA11D0
	.incbin "baserom.gba", 0xAA11D0, 0xB0

	.global Img_WorldmapMinimap
Img_WorldmapMinimap:  @ 0x08AA1280
	.incbin "baserom.gba", 0xAA1280, 0x60C

	.global Pal_WorldmapMinimap
Pal_WorldmapMinimap:  @ 0x08AA188C
	.incbin "baserom.gba", 0xAA188C, 0x20

	.global gUnknown_08AA18AC
gUnknown_08AA18AC:  @ 0x08AA18AC
	.incbin "baserom.gba", 0xAA18AC, 0x84

	.global gUnknown_08AA1930
gUnknown_08AA1930:  @ 0x08AA1930
	.incbin "baserom.gba", 0xAA1930, 0x20

	.global gUnknown_08AA1950
gUnknown_08AA1950:  @ 0x08AA1950
	.incbin "baserom.gba", 0xAA1950, 0x20

	.global gImg_WorldmapSkirmish
gImg_WorldmapSkirmish:  @ 0x08AA1970
	.incbin "baserom.gba", 0xAA1970, 0x300

	.global SpriteAnim_WorldmapSkirmish
SpriteAnim_WorldmapSkirmish:  @ 0x08AA1C70
	.incbin "baserom.gba", 0xAA1C70, 0x3D4
