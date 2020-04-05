    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START ClearOAMBuffer
ClearOAMBuffer: @ 0x080D7498
	bx pc
	nop
	.ARM
	b ARM_MoveOBJsOffscreen

	THUMB_FUNC_END ClearOAMBuffer

	THUMB_FUNC_START CallARM_FillTileRect
CallARM_FillTileRect: @ 0x080D74A0
	bx pc
	nop
	.ARM
	b ARM_FillTileRect

	THUMB_FUNC_END CallARM_FillTileRect

	THUMB_FUNC_START TileMap_FillRect
TileMap_FillRect: @ 0x080D74A8
	bx pc
	nop
	.ARM
	b ARM_FillRect

	THUMB_FUNC_END TileMap_FillRect

	THUMB_FUNC_START sub_80D74B0
sub_80D74B0: @ 0x080D74B0
	bx pc
	nop
	.ARM
	b sub_8000234

	THUMB_FUNC_END sub_80D74B0

	THUMB_FUNC_START TileMap_CopyRect
TileMap_CopyRect: @ 0x080D74B8
	bx pc
	nop
	.ARM
	b ARM_CopyRect

	THUMB_FUNC_END TileMap_CopyRect

	THUMB_FUNC_START CalcSomeChecksum
CalcSomeChecksum: @ 0x080D74C0
	bx pc
    nop
	.ARM
	b ARM_CalcSomeChecksum

	THUMB_FUNC_END CalcSomeChecksum

	.align 2, 0
