
    .section .data
    .INCLUDE "gba.inc"
    @ This part of data seems unused
    @ The data is just the same in FE7
    @ FE8U: 0xB1A0B8 ~ +0x567C
    @ FE7J: 0xDC4FBC ~ +0x567C

    .ARM

    b FE6SIO_Init

FE6_RomHeader: @ 0xB1A0BC
    .include "src/data/fe6_rom_header.inc"

FE6SIO_Init: @ 08B1A178
    b SerialReset
    .WORD 0
    .WORD 0
    .WORD 0
    .WORD 0
    .WORD 0
    .WORD 0
    .WORD 0

    @ Polling and reset instructions are generated from the serial C sources.
    .section .data.after_reset
    .ARM

    .space 0x100

    @ FE6 save-report multiboot program, built from the mgfembp source submodule.
    @ The bootstrap decompresses this to 0x02010000 before entering it.
FE6SIO_Payload:
	.incbin "fe6sio_payload.bin.lz"
