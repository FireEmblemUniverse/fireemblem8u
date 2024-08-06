    .section .data
    .include "animscr.inc"
    .include "gba_sprites.inc"

    .global Img_EfxSkill1
Img_EfxSkill1:  @ 0x085C935C
    .incbin "baserom.gba", 0x5C935C, 0x5C9740 - 0x5C935C

    .global Img_EfxSkill2
Img_EfxSkill2:
    .incbin "baserom.gba", 0x5C9740, 0x5C9B38 - 0x5C9740

    .global Img_EfxSkill3
Img_EfxSkill3:
    .incbin "baserom.gba", 0x5C9B38, 0x5C9F48 - 0x5C9B38

    .global Img_EfxSkill4
Img_EfxSkill4:
    .incbin "baserom.gba", 0x5C9F48, 0x5CA380 - 0x5C9F48

    .global Img_EfxSkill5
Img_EfxSkill5:
    .incbin "baserom.gba", 0x5CA380, 0x5CA7FC - 0x5CA380

    .global Img_EfxSkill6
Img_EfxSkill6:
    .incbin "baserom.gba", 0x5CA7FC, 0x5CACF4 - 0x5CA7FC

    .global Img_EfxSkill7
Img_EfxSkill7:
    .incbin "baserom.gba", 0x5CACF4, 0x5CB2CC - 0x5CACF4

    .global Img_EfxSkill8
Img_EfxSkill8:
    .incbin "baserom.gba", 0x5CB2CC, 0x5CB9AC - 0x5CB2CC

    .global Img_EfxSkill9
Img_EfxSkill9:
    .incbin "baserom.gba", 0x5CB9AC, 0x5CC0E8 - 0x5CB9AC

    .global Img_EfxSkillA
Img_EfxSkillA:
    .incbin "baserom.gba", 0x5CC0E8, 0x5CC820 - 0x5CC0E8

    .global Img_EfxSkillB
Img_EfxSkillB:
    .incbin "baserom.gba", 0x5CC820, 0x5CCF14 - 0x5CC820

    .global Img_EfxSkillC
Img_EfxSkillC:
    .incbin "baserom.gba", 0x5CCF14, 0x5CD5A0 - 0x5CCF14

    .global Img_EfxSkillD
Img_EfxSkillD:
    .incbin "baserom.gba", 0x5CD5A0, 0x5CDC00 - 0x5CD5A0

    .global Img_EfxSkillE
Img_EfxSkillE:
    .incbin "baserom.gba", 0x5CDC00, 0x5CE200 - 0x5CDC00

    .global Img_EfxSkillF
Img_EfxSkillF:
    .incbin "baserom.gba", 0x5CE200, 0x5CE7C4 - 0x5CE200

    .global Img_EfxSkill10
Img_EfxSkill10:
    .incbin "baserom.gba", 0x5CE7C4, 0x5CEC6C - 0x5CE7C4

    .global Pal_EfxSkill1
Pal_EfxSkill1:
    .incbin "baserom.gba", 0x5CEC6C, 0x5CEC8C - 0x5CEC6C

    .global Pal_EfxSkill2
Pal_EfxSkill2:
    .incbin "baserom.gba", 0x5CEC8C, 0x5CECAC - 0x5CEC8C

    .global Pal_EfxSkill3
Pal_EfxSkill3:
    .incbin "baserom.gba", 0x5CECAC, 0x5CECCC - 0x5CECAC

    .global Pal_EfxSkill4
Pal_EfxSkill4:
    .incbin "baserom.gba", 0x5CECCC, 0x5CECEC - 0x5CECCC

    .global Pal_EfxSkill5
Pal_EfxSkill5:
    .incbin "baserom.gba", 0x5CECEC, 0x5CED0C - 0x5CECEC

    .global Pal_EfxSkill6
Pal_EfxSkill6:
    .incbin "baserom.gba", 0x5CED0C, 0x5CED2C - 0x5CED0C

    .global Pal_EfxSkill7
Pal_EfxSkill7:
    .incbin "baserom.gba", 0x5CED2C, 0x5CED4C - 0x5CED2C

    .global Pal_EfxSkill8
Pal_EfxSkill8:
    .incbin "baserom.gba", 0x5CED4C, 0x5CED6C - 0x5CED4C

    .global Pal_EfxSkill9
Pal_EfxSkill9:
    .incbin "baserom.gba", 0x5CED6C, 0x5CED8C - 0x5CED6C

    .global Pal_EfxSkillA
Pal_EfxSkillA:
    .incbin "baserom.gba", 0x5CED8C, 0x5CEDAC - 0x5CED8C

    .global Pal_EfxSkillB
Pal_EfxSkillB:
    .incbin "baserom.gba", 0x5CEDAC, 0x5CEDCC - 0x5CEDAC

    .global Pal_EfxSkillC
Pal_EfxSkillC:
    .incbin "baserom.gba", 0x5CEDCC, 0x5CEDEC - 0x5CEDCC

    .global Pal_EfxSkillD
Pal_EfxSkillD:
    .incbin "baserom.gba", 0x5CEDEC, 0x5CEE0C - 0x5CEDEC

    .global Pal_EfxSkillE
Pal_EfxSkillE:
    .incbin "baserom.gba", 0x5CEE0C, 0x5CEE2C - 0x5CEE0C

    .global Pal_EfxSkillF
Pal_EfxSkillF:
    .incbin "baserom.gba", 0x5CEE2C, 0x5CEE4C - 0x5CEE2C

    .global Pal_EfxSkill10
Pal_EfxSkill10:
    .incbin "baserom.gba", 0x5CEE4C, 0x5CEE6C - 0x5CEE4C

    .global Tsa_EfxSkill1
Tsa_EfxSkill1:
    .incbin "baserom.gba", 0x5CEE6C, 0x5CEF04 - 0x5CEE6C

    .global Tsa_EfxSkill2
Tsa_EfxSkill2:
    .incbin "baserom.gba", 0x5CEF04, 0x5CEFA4 - 0x5CEF04

    .global Tsa_EfxSkill3
Tsa_EfxSkill3:
    .incbin "baserom.gba", 0x5CEFA4, 0x5CF044 - 0x5CEFA4

    .global Tsa_EfxSkill4
Tsa_EfxSkill4:
    .incbin "baserom.gba", 0x5CF044, 0x5CF0E8 - 0x5CF044

    .global Tsa_EfxSkill5
Tsa_EfxSkill5:
    .incbin "baserom.gba", 0x5CF0E8, 0x5CF1A0 - 0x5CF0E8

    .global Tsa_EfxSkill6
Tsa_EfxSkill6:
    .incbin "baserom.gba", 0x5CF1A0, 0x5CF264 - 0x5CF1A0

    .global Tsa_EfxSkill7
Tsa_EfxSkill7:
    .incbin "baserom.gba", 0x5CF264, 0x5CF33C - 0x5CF264

    .global Tsa_EfxSkill8
Tsa_EfxSkill8:
    .incbin "baserom.gba", 0x5CF33C, 0x5CF440 - 0x5CF33C

    .global Tsa_EfxSkill9
Tsa_EfxSkill9:
    .incbin "baserom.gba", 0x5CF440, 0x5CF544 - 0x5CF440

    .global Tsa_EfxSkillA
Tsa_EfxSkillA:
    .incbin "baserom.gba", 0x5CF544, 0x5CF648 - 0x5CF544

    .global Tsa_EfxSkillB
Tsa_EfxSkillB:
    .incbin "baserom.gba", 0x5CF648, 0x5CF750 - 0x5CF648

    .global Tsa_EfxSkillC
Tsa_EfxSkillC:
    .incbin "baserom.gba", 0x5CF750, 0x5CF83C - 0x5CF750

    .global Tsa_EfxSkillD
Tsa_EfxSkillD:
    .incbin "baserom.gba", 0x5CF83C, 0x5CF91C - 0x5CF83C

    .global Tsa_EfxSkillE
Tsa_EfxSkillE:
    .incbin "baserom.gba", 0x5CF91C, 0x5CF9F4 - 0x5CF91C

    .global Tsa_EfxSkillF
Tsa_EfxSkillF:
    .incbin "baserom.gba", 0x5CF9F4, 0x5CFAC0 - 0x5CF9F4

    .global Tsa_EfxSkill10
Tsa_EfxSkill10:
    .incbin "baserom.gba", 0x5CFAC0, 0x5CFB70 - 0x5CFAC0
