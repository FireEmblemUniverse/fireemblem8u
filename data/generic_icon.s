    .include "macro.inc"

    .section .data

    .global gUnknown_08599734
gUnknown_08599734:  @ 0x08599734
    .incbin "graphics/generic_icon/0.4bpp"

    .global gUnknown_08599934
gUnknown_08599934:  @ 0x08599934
    .incbin "graphics/generic_icon/1.4bpp"

    .global gUnknown_08599B34
gUnknown_08599B34:  @ 0x08599B34
    .incbin "graphics/generic_icon/2.4bpp"

    .global gUnknown_08599D34
gUnknown_08599D34:  @ 0x08599D34
    .incbin "graphics/generic_icon/3.4bpp"

    .global gUnknown_08599F34
gUnknown_08599F34:  @ 0x08599F34
    .incbin "graphics/generic_icon/0.gbapal" @ 1st team color [blue]

    .global gUnknown_08599F54
gUnknown_08599F54:  @ 0x08599F54
    .incbin "graphics/generic_icon/1.gbapal" @ 2nd team color [orange]

    .global gUnknown_08599F74
gUnknown_08599F74:  @ 0x08599F74
    .incbin "graphics/generic_icon/2.gbapal" @ 3rd team color [green]

    @ 4th team [purple] ends up being unused as there is no way to have generics in the arena, which is the only place where the 4th team exists.
    .incbin "graphics/generic_icon/3.gbapal"
