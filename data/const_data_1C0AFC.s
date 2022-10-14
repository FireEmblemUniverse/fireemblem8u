    .section .rodata

    .global gUnknown_081C0AFC
gUnknown_081C0AFC:  @ 081C0AFC
    .incbin "baserom.gba", 0x1C0AFC, (0x1C1EC0 - 0x1C0AFC)

    .global gUnknown_081C1EC0
gUnknown_081C1EC0:  @ 081C1EC0
    .incbin "baserom.gba", 0x1C1EC0, (0x1C32C8 - 0x1C1EC0)
