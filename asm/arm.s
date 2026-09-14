	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

@ ColorFadeTick and its preceding pool are generated from matching C.

@ ClearOam and Checksum32 are linked here from src/arm/.
	.section .text.after_checksum32, "ax", %progbits

@ TmFillRect is linked here from matching C.

@ TmCopyRect is linked here from matching C.

@ TmApplyTsa is linked here from src/arm/tm_apply_tsa.c.
	.section .text.after_tm_apply_tsa, "ax", %progbits

@ PutOamHi and its pointer pool are generated from matching C.
@ PutOamLo and its cursor pointer are generated from C.

@ DrawGlyph and its shift table/pointer pool are generated from matching C.
	.section .text.after_draw_glyph, "ax", %progbits

@ DecodeString and its preceding pointers are generated from matching C.

@ MapFloodCoreStep and its shared pointer pool are generated from C.
	.section .text.after_map_flood_step, "ax", %progbits

@ MapFloodCore and its prefix are generated from matching C.
