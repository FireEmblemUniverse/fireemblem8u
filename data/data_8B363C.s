    .section .data

	.global gChapterDataAssetTable
gChapterDataAssetTable:  @ 0x088B363C
@ replacing .incbin "baserom.gba", 0x008b363c, 0x3b0
    .word 0
	.word ObjectType1
	.word MapPalette1
	.word TileConfiguration1
	.word PrologueMap
	.word TileAnimations1
	.word PrologueMapChanges
	.word PrologueEvents
	.word Ch1Map
	.word Ch1MapChanges
	.word Ch1Events
	.word Ch2Map
	.word Ch2TileChanges
	.word Ch2Events
	.word ObjectType2
	.word MapPalette2
	.word TileConfiguration2
	.word Ch3Map
	.word TileAnimations2
	.word Ch3MapChanges
	.word Ch3Events
	.word Ch4Map
	.word Ch4MapChanges
	.word Ch4Events
	.word ObjectType3
	.word MapPalette3
	.word TileConfiguration3
	.word Ch5XMap
	.word TileAnimations3
	.word Ch5XMapChanges
	.word Ch5XEvents
	.word Ch5Map
	.word Ch5MapChanges
	.word Ch5EventData
	.word Ch6Map
	.word Ch6MapChanges
	.word Ch6Events
	.word Ch7Map
	.word Ch7MapChanges
	.word Ch7EventData
	.word Ch8Map
	.word Ch8MapChanges
	.word Ch8EventData
	.word Ch9EirikaMap
	.word Ch9EirikaMapChanges
	.word Ch9EirikaEvents
	.word ObjectType4
	.word MapPalette4
	.word TileConfiguration4
	.word Ch10EirikaMap
	.word Ch10EirikaMapChanges
	.word Ch10EirikaEvents
	.word MapPalette5
	.word Ch12EirikaMap
	.word Ch12EirikaMapChanges
	.word Ch12EirikaEventData
	.word MapPalette6
	.word Ch13EirikaMap
	.word Ch13EirikaMapChanges
	.word Ch13EirikaEvents
	.word ObjectType5
	.word MapPalette7
	.word TileConfiguration5
	.word Ch14EirikaMap
	.word Ch14EirikaMapChanges
	.word Ch14EirikaEvents
	.word ObjectType6
	.word MapPalette8
	.word TileConfiguration6
	.word Ch15Map
	.word Ch15MapChanges
	.word Ch15EirikaEvents
	.word MapPalette9
	.word Ch16Map
	.word Ch16MapChanges
	.word Ch16EirEvents
	.word MapPalette10
	.word Ch17Map
	.word Ch17MapChanges
	.word Ch17EirikaEvents
	.word ObjectType7
	.word MapPalette11
	.word TileConfiguration7
	.word Ch18Map
	.word TileAnimations4
	.word Ch18MapChanges
	.word Ch18EirikaEvents
	.word MapPalette12
	.word Ch19Map
	.word Ch19MapChanges
	.word Ch19EirikaEvents
	.word MapPalette13
	.word Ch20Map
	.word Ch20MapChanges
	.word Ch20EirikaEvents
	.word ObjectType8
	.word MapPalette14
	.word TileConfiguration8
	.word FinalChapterMap1
	.word FinalChapterMap1Changes
	.word FinalEirikaEvents1
	.word FinalChapterMap2
	.word FinalChapterMap2Changes
	.word FinalEirikaEvents2
	.word MapPalette15
	.word Ch9EphMap
	.word Ch9EphMapChanges
	.word Ch9Events
	.word ObjectType9
	.word MapPalette16
	.word TileConfiguration9
	.word Ch10EphraimMap
	.word Ch10EphraimMapChanges
	.word Ch10EphraimEvents
	.word MapPalette17
	.word Ch12EphraimMap
	.word Ch12EphraimMapChanges
	.word Ch12EphraimEvents
	.word Ch13EphraimMap
	.word Ch13EphraimMapChanges
	.word Ch13EphraimEventData
	.word ObjectType10
	.word MapPalette18
	.word TileConfiguration10
	.word Ch14EphraimMap
	.word TileAnimations5
	.word Ch14EphraimMapChanges
	.word Ch14EphraimEventData
	.word Ch15EphraimEventData
	.word Ch16EphraimEventData
	.word Ch17EphraimEventData
	.word Ch18EphraimEventData
	.word Ch19EphraimEventData
	.word Ch20EphraimEventData
	.word FinalEphraimEvents1
	.word FinalEphraimEvents2
	.word TowerOfValniObjectType
	.word TowerOfValniMapPalette
	.word TowerOfValniTileConfiguration
	.word TowerOfValni1Map
	.word TowerOfValni1MapChanges
	.word TowerOfValni1Events
	.word TowerOfValni2Map
	.word TowerOfValni2MapChanges
	.word TowerOfValni2Events
	.word TowerOfValni3Map
	.word TowerOfValni3MapChanges
	.word TowerOfValni3Events
	.word TowerOfValni4Map
	.word TowerOfValni4MapChanges
	.word TowerOfValni4Events
	.word TowerOfValni5Map
	.word TowerOfValni5MapChanges
	.word TowerOfValni5Events
	.word TowerOfValni6Map
	.word TowerOfValni6MapChanges
	.word TowerOfValni6Events
	.word TowerOfValni7Map
	.word TowerOfValni7MapChanges
	.word TowerOfValni7Events
	.word TowerOfValni8Map
	.word TowerOfValni8MapChanges
	.word TowerOfValni8Events
	.word LagdouRuinsPalette
	.word LagdouRuins1Map
	.word LagdouRuins1MapChanges
	.word LagdouRuins1Event
	.word LagdouRuins2Map
	.word LagdouRuins2MapChanges
	.word LagdouRuins2Event
	.word LagdouRuins3Map
	.word LagdouRuins3MapChanges
	.word LagdouRuins3Event
	.word LagdouRuins4Map
	.word LagdouRuins4MapChanges
	.word LagdouRuins4Event
	.word LagdouRuins5Map
	.word LagdouRuins5MapChanges
	.word LagdouRuins5Event
	.word LagdouRuins6Map
	.word LagdouRuins6MapChanges
	.word LagdouRuins6Event
	.word LagdouRuins7Map
	.word LagdouRuins7MapChanges
	.word LagdouRuins7Event
	.word LagdouRuins8Palette
	.word LagdouRuins8Map
	.word LagdouRuins8MapChanges
	.word LagdouRuins8Event
	.word LagdouRuins9Map
	.word LagdouRuins9MapChanges
	.word LagdouRuins9Event
	.word LagdouRuins10Map
	.word LagdouRuins10MapChanges
	.word LagdouRuins10Event
	.word LordsSplitMap
	.word LordsSplitMapChanges
	.word LordsSplitEvents
	.word MelkaenCoastMap
	.word MelkaenCoastMapChanges
	.word MelkaenCoastEvent
	.word LinkArenaMap
	.word AnInterestingMap
	.word AnInterestingMapEvents
	.word DebugMap
	.word DebugMapEvents
	.word MapPalette19
	.word Ch11EirikaMap
	.word Ch11EirikaMapChanges
	.word Ch11EirikaEvents
	.word Ch11EphraimMap
	.word Ch11EphraimTileAnimations
	.word Ch11EphraimMapChanges
	.word Ch11EphraimEvents
	.word GradoCastleMap
	.word RenaisCastleMap
	.word CaerPelynMap
	.word RenaisThroneMap
	.word RenaisThroneMapChanges
	.word RenaisAudienceMap
	.word RenvalGateMap
	.word GradoBordersMap
	.word GradoPrisonMap
	.word GradoPrisonMapChanges
	.word GradoShrineMapPast
	.word GradoShrineMapChangesPast
	.word RenaisShrineMap
	.word RenaisShrineMapChanges
	.word SomePathMap
	.word SomeBuildingMap
	.word AnotherShrinePalette
	.word AnotherShrineMap
	.word AnotherPathMap
	.word GradoShrineMapPresent
	.word Ch5TownPalettePast
	.word Ch5TownMapPast

	.global gUnknown_088B39EC
gUnknown_088B39EC:  @ 0x088B39EC
@ replacing .incbin "baserom.gba", 0x008b39ec, 0xec
.4byte 0
.4byte gUnknown_08A3974C + 0x1c
.4byte gUnknown_08A3974C + 0x5c0
.4byte gUnknown_08A3974C + 0x5f8
.4byte gUnknown_08A3974C + 0x7d4
.4byte gUnknown_08A3974C + 0x970
.4byte gUnknown_08A3974C + 0x3144
.4byte gUnknown_08A3974C + 0xaa0
.4byte gUnknown_08A3974C + 0xd8c
.4byte gUnknown_08A3974C + 0xe78
.4byte gUnknown_08A3974C + 0xf64
.4byte gUnknown_08A3974C + 0xfe4
.4byte gUnknown_08A3974C + 0x1244
.4byte gUnknown_08A3974C + 0x1404
.4byte gUnknown_08A3974C + 0x1420
.4byte gUnknown_08A3974C + 0x1564
.4byte gUnknown_08A3974C + 0x1ddc
.4byte gUnknown_08A3974C + 0x1e48
.4byte gUnknown_08A3974C + 0x1fec
.4byte gUnknown_08A3974C + 0x219c
.4byte gUnknown_08A3974C + 0x2318
.4byte gUnknown_08A3974C + 0x2428
.4byte gUnknown_08A3974C + 0x260c
.4byte gUnknown_08A3974C + 0x314c
.4byte gUnknown_08A3974C + 0x170c
.4byte gUnknown_08A3974C + 0x1940
.4byte gUnknown_08A3974C + 0x1a8c
.4byte gUnknown_08A3974C + 0x1aa8
.4byte gUnknown_08A3974C + 0x1b90
.4byte gUnknown_08A3974C + 0x2628
.4byte gUnknown_08A3974C + 0x27dc
.4byte gUnknown_08A3974C + 0x2968
.4byte gUnknown_08A3974C + 0x2b14
.4byte gUnknown_08A3974C + 0x2c90
.4byte gUnknown_08A3974C + 0x2da0
.4byte gUnknown_08A3974C + 0x2f84
.4byte gUnknown_08A3974C + 0x3154
.4byte gUnknown_08A3974C + 0x1d18
.4byte gUnknown_08A3974C + 0x1d2c
.4byte gUnknown_08A3974C + 0x1d34
.4byte gUnknown_08A3974C + 0x1d3c
.4byte gUnknown_08A3974C + 0x1d44
.4byte gUnknown_08A3974C + 0x1d4c
.4byte gUnknown_08A3974C + 0x1d54
.4byte gUnknown_08A3974C + 0x1d5c
.4byte gUnknown_08A3974C + 0x1d74
.4byte gUnknown_08A3974C + 0x1d84
.4byte gUnknown_08A3974C + 0x1d8c
.4byte gUnknown_08A3974C + 0x1d94
.4byte gUnknown_08A3974C + 0x1d9c
.4byte gUnknown_08A3974C + 0x1da4
.4byte gUnknown_08A3974C + 0x1dac
.4byte gUnknown_08A3974C + 0x1db4
.4byte gUnknown_08A3974C + 0x1dbc
.4byte gUnknown_08A3974C + 0x1dc4
.4byte gUnknown_08A3974C + 0x3114
.4byte gUnknown_08A3974C + 0x1d10
.4byte gUnknown_08A3974C + 0x315c
.4byte gUnknown_08A3974C + 0x3284

	.global gUnknown_088B3AD8
gUnknown_088B3AD8:  @ 0x088B3AD8
    .incbin "baserom.gba", 0x8B3AD8, 0x8B3C14 - 0x8B3AD8

	.global UnitDef_Blue_Prologue
UnitDef_Blue_Prologue:
    .incbin "baserom.gba", 0x8B3C14, 0x8D1F54 - 0x8B3C14

	.global gUnitDefSumDK
gUnitDefSumDK:  @ 0x088D1F54
	.incbin "baserom.gba", 0x8D1F54, 0x104
