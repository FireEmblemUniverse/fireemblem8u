    .section .data

    .incbin "baserom.gba", 0x8B4008, 0x8B40A0 - 0x8B4008

	.global UnitDef_Event_Ch1Ally
UnitDef_Event_Ch1Ally:
    .incbin "baserom.gba", 0x8B40A0, 0x8B40DC - 0x8B40A0

	.global UnitDef_Event_Ch1Enemy
UnitDef_Event_Ch1Enemy:
    .incbin "baserom.gba", 0x8B40DC, 0x8B417C - 0x8B40DC

	.global UnitDef_Event_Ch1AllyReinforce
UnitDef_Event_Ch1AllyReinforce:
    .incbin "baserom.gba", 0x8B417C, 0x8B41B8 - 0x8B417C

	.global UnitDef_Event_Ch1EnemyReinforce
UnitDef_Event_Ch1EnemyReinforce:
    .incbin "baserom.gba", 0x8B41B8, 0x8B4208 - 0x8B41B8

	.global UnitDef_Event_Ch1NPC
UnitDef_Event_Ch1NPC:
    .incbin "baserom.gba", 0x8B4208, 0x8D1F54 - 0x8B4208

	.global gUnitDefSumDK
gUnitDefSumDK:  @ 0x088D1F54
	.incbin "baserom.gba", 0x8D1F54, 0x104
