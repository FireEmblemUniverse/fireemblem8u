@ AP (object/sprite animation) definition macros. The runtime parser is src/ap.c
@ (AP_LoadDefinition/AP_ExecFrame); fields documented in include/ap.h. A definition is:
@   .hword frametab-def, animtab-def         @ root: byte offsets to the two tables
@   <frame-offset table>  <anim-offset table> @ entries are label arithmetic
@   <frames>                                  @ each: [rotscale?][obj list][gfx?]
@   <anim sequences>                          @ each: ap_anim steps + a terminator

	.macro ap_objs count
	.hword \count
	.endm
	.macro ap_obj attr0, attr1, attr2
	.hword \attr0, \attr1, \attr2
	.endm
	.macro ap_gfx tile
	.hword \tile
	.endm
	.macro ap_rotscale count
	.hword 0x8000 | (\count)
	.endm
	.macro ap_affine angle, xscale, yscale
	.hword \angle, \xscale, \yscale
	.endm
	.macro ap_anim interval, frame
	.hword \interval, \frame
	.endm
	.macro ap_anim_loop
	.hword 0, 0xFFFF
	.endm
	.macro ap_anim_end
	.hword 0, 0
	.endm
	.macro ap_anim_delete
	.hword 0, 1
	.endm
