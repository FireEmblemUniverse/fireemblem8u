    .INCLUDE "macro.inc"
    .SYNTAX unified

    .section .text.arm_entry_clear, "ax", %progbits
    THUMB_FUNC_START ClearOAMBuffer
ClearOAMBuffer:
    bx pc
    nop
    THUMB_FUNC_END ClearOAMBuffer

    .section .text.arm_entry_tsa, "ax", %progbits
    THUMB_FUNC_START CallARM_FillTileRect
CallARM_FillTileRect:
    bx pc
    nop
    THUMB_FUNC_END CallARM_FillTileRect

    .section .text.arm_entry_fill, "ax", %progbits
    THUMB_FUNC_START TileMap_FillRect
TileMap_FillRect:
    bx pc
    nop
    THUMB_FUNC_END TileMap_FillRect

    .section .text.arm_entry_fade, "ax", %progbits
    THUMB_FUNC_START CALLARM_ColorFadeTick
CALLARM_ColorFadeTick:
    bx pc
    nop
    THUMB_FUNC_END CALLARM_ColorFadeTick

    .section .text.arm_entry_copy, "ax", %progbits
    THUMB_FUNC_START TileMap_CopyRect
TileMap_CopyRect:
    bx pc
    nop
    THUMB_FUNC_END TileMap_CopyRect

    .section .text.arm_entry_checksum, "ax", %progbits
    THUMB_FUNC_START ComputeChecksum32
ComputeChecksum32:
    bx pc
    nop
    THUMB_FUNC_END ComputeChecksum32
