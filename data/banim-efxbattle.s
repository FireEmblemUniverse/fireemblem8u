	.section .data

	.global TsaConf_BanimTmA1
TsaConf_BanimTmA1:  @ 0x085B9E58
	.incbin "baserom.gba", 0x5B9E58, 0x98    @ 0x5B9EF0 - 0x5B9E58

	.global TsaConf_BanimTmA2
TsaConf_BanimTmA2:  @ 0x085B9EF0
	.incbin "baserom.gba", 0x5B9EF0, 0x98    @ 0x5B9F88 - 0x5B9EF0

	.global TsaConf_BanimTmA3
TsaConf_BanimTmA3:  @ 0x085B9F88
	.incbin "baserom.gba", 0x5B9F88, 0x98    @ 0x5BA020 - 0x5B9F88

	.global TsaConf_BanimTmA4
TsaConf_BanimTmA4:  @ 0x085BA020
	.incbin "baserom.gba", 0x5BA020, 0x98    @ 0x5BA0B8 - 0x5BA020

	.global Img_NODAMGEMIS
Img_NODAMGEMIS:  @ 0x085BA0B8
	.incbin "baserom.gba", 0x5BA0B8, 0x228

	.global Pal_085BA2E0
Pal_085BA2E0:  @ 0x085BA2E0
	.incbin "baserom.gba", 0x5BA2E0, 0x20

	.global Pal_085BA300
Pal_085BA300:  @ 0x085BA300
	.incbin "baserom.gba", 0x5BA300, 0x20

	.global Pal_085BA320
Pal_085BA320:  @ 0x085BA320
	.incbin "baserom.gba", 0x5BA320, 0x20

/* This is unused, called in FE7 UnitKakudai1 (although is also unused in FE7) */
	.global Img_BanimArcherFBallistaIntro
Img_BanimArcherFBallistaIntro:  @ 0x085BA340
	.incbin "./graphics/efxbattle/Img_BanimSnipperFBallistaIntro.4bpp.lz"

	.global Img_BanimArcherMBallistaIntro
Img_BanimArcherMBallistaIntro:  @ 0x085BA7B4
	.incbin "./graphics/efxbattle/Img_BanimSnipperMBallistaIntro.4bpp.lz"

	.global Img_BanimSnipperFBallistaIntro
Img_BanimSnipperFBallistaIntro:  @ 0x085BA340
	.incbin "./graphics/efxbattle/Img_BanimSnipperFBallistaIntro.4bpp.lz"
