#!/usr/bin/env python3

import os
import json
import tool
from enum import Enum
from warnings import warn

class AssetType(Enum):
    NONE=0
    OBJ=1
    PAL=2
    CONFIG=3
    OBJANIME=4
    PALANIME=5
    MAP=6
    MAPCHANGE=7
    EVENT=8
    FRAME=9
    TILES=10

table_addr = 0x8B363C
output_dir = 'out'

labels = []

assets = [
    {'id': 0, 'name': '', 'type': AssetType.NONE, 'addr':0},
    {'id': 1, 'name': 'ObjectType1', 'type': AssetType.OBJ},
    {'id': 2, 'name': 'MapPalette1', 'type': AssetType.PAL},
    {'id': 3, 'name': 'TileConfiguration1', 'type': AssetType.CONFIG},
    {'id': 4, 'name': 'PrologueMap', 'type': AssetType.MAP},
    {'id': 5, 'name': 'TileAnimations1', 'type': AssetType.OBJANIME},
    {'id': 6, 'name': 'PrologueMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 7, 'name': 'PrologueEvents', 'type': AssetType.EVENT},
    {'id': 8, 'name': 'Ch1Map', 'type': AssetType.MAP},
    {'id': 9, 'name': 'Ch1MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 10, 'name': 'Ch1Events', 'type': AssetType.EVENT},
    {'id': 11, 'name': 'Ch2Map', 'type': AssetType.MAP},
    {'id': 12, 'name': 'Ch2TileChanges', 'type': AssetType.MAPCHANGE},
    {'id': 13, 'name': 'Ch2Events', 'type': AssetType.EVENT},
    {'id': 14, 'name': 'ObjectType2', 'type': AssetType.OBJ},
    {'id': 15, 'name': 'MapPalette2', 'type': AssetType.PAL},
    {'id': 16, 'name': 'TileConfiguration2', 'type': AssetType.CONFIG},
    {'id': 17, 'name': 'Ch3Map', 'type': AssetType.MAP},
    {'id': 18, 'name': 'TileAnimations2', 'type': AssetType.OBJANIME},
    {'id': 19, 'name': 'Ch3MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 20, 'name': 'Ch3Events', 'type': AssetType.EVENT},
    {'id': 21, 'name': 'Ch4Map', 'type': AssetType.MAP},
    {'id': 22, 'name': 'Ch4MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 23, 'name': 'Ch4Events', 'type': AssetType.EVENT},
    {'id': 24, 'name': 'ObjectType3', 'type': AssetType.OBJ},
    {'id': 25, 'name': 'MapPalette3', 'type': AssetType.PAL},
    {'id': 26, 'name': 'TileConfiguration3', 'type': AssetType.CONFIG},
    {'id': 27, 'name': 'Ch5XMap', 'type': AssetType.MAP},
    {'id': 28, 'name': 'TileAnimations3', 'type': AssetType.OBJANIME},
    {'id': 29, 'name': 'Ch5XMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 30, 'name': 'Ch5XEvents', 'type': AssetType.EVENT},
    {'id': 31, 'name': 'Ch5Map', 'type': AssetType.MAP},
    {'id': 32, 'name': 'Ch5MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 33, 'name': 'Ch5EventData', 'type': AssetType.EVENT},
    {'id': 34, 'name': 'Ch6Map', 'type': AssetType.MAP},
    {'id': 35, 'name': 'Ch6MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 36, 'name': 'Ch6Events', 'type': AssetType.EVENT},
    {'id': 37, 'name': 'Ch7Map', 'type': AssetType.MAP},
    {'id': 38, 'name': 'Ch7MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 39, 'name': 'Ch7EventData', 'type': AssetType.EVENT},
    {'id': 40, 'name': 'Ch8Map', 'type': AssetType.MAP},
    {'id': 41, 'name': 'Ch8MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 42, 'name': 'Ch8EventData', 'type': AssetType.EVENT},
    {'id': 43, 'name': 'Ch9EirikaMap', 'type': AssetType.MAP},
    {'id': 44, 'name': 'Ch9EirikaMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 45, 'name': 'Ch9EirikaEvents', 'type': AssetType.EVENT},
    {'id': 46, 'name': 'ObjectType4', 'type': AssetType.OBJ},
    {'id': 47, 'name': 'MapPalette4', 'type': AssetType.PAL},
    {'id': 48, 'name': 'TileConfiguration4', 'type': AssetType.CONFIG},
    {'id': 49, 'name': 'Ch10EirikaMap', 'type': AssetType.MAP},
    {'id': 50, 'name': 'Ch10EirikaMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 51, 'name': 'Ch10EirikaEvents', 'type': AssetType.EVENT},
    {'id': 52, 'name': 'MapPalette5', 'type': AssetType.PAL},
    {'id': 53, 'name': 'Ch12EirikaMap', 'type': AssetType.MAP},
    {'id': 54, 'name': 'Ch12EirikaMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 55, 'name': 'Ch12EirikaEventData', 'type': AssetType.EVENT},
    {'id': 56, 'name': 'MapPalette6', 'type': AssetType.PAL},
    {'id': 57, 'name': 'Ch13EirikaMap', 'type': AssetType.MAP},
    {'id': 58, 'name': 'Ch13EirikaMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 59, 'name': 'Ch13EirikaEvents', 'type': AssetType.EVENT},
    {'id': 60, 'name': 'ObjectType5', 'type': AssetType.OBJ},
    {'id': 61, 'name': 'MapPalette7', 'type': AssetType.PAL},
    {'id': 62, 'name': 'TileConfiguration5', 'type': AssetType.CONFIG},
    {'id': 63, 'name': 'Ch14EirikaMap', 'type': AssetType.MAP},
    {'id': 64, 'name': 'Ch14EirikaMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 65, 'name': 'Ch14EirikaEvents', 'type': AssetType.EVENT},
    {'id': 66, 'name': 'ObjectType6', 'type': AssetType.OBJ},
    {'id': 67, 'name': 'MapPalette8', 'type': AssetType.PAL},
    {'id': 68, 'name': 'TileConfiguration6', 'type': AssetType.CONFIG},
    {'id': 69, 'name': 'Ch15Map', 'type': AssetType.MAP},
    {'id': 70, 'name': 'Ch15MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 71, 'name': 'Ch15EirikaEvents', 'type': AssetType.EVENT},
    {'id': 72, 'name': 'MapPalette9', 'type': AssetType.PAL},
    {'id': 73, 'name': 'Ch16Map', 'type': AssetType.MAP},
    {'id': 74, 'name': 'Ch16MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 75, 'name': 'Ch16EirEvents', 'type': AssetType.EVENT},
    {'id': 76, 'name': 'MapPalette10', 'type': AssetType.PAL},
    {'id': 77, 'name': 'Ch17Map', 'type': AssetType.MAP},
    {'id': 78, 'name': 'Ch17MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 79, 'name': 'Ch17EirikaEvents', 'type': AssetType.EVENT},
    {'id': 80, 'name': 'ObjectType7', 'type': AssetType.OBJ},
    {'id': 81, 'name': 'MapPalette11', 'type': AssetType.PAL},
    {'id': 82, 'name': 'TileConfiguration7', 'type': AssetType.CONFIG},
    {'id': 83, 'name': 'Ch18Map', 'type': AssetType.MAP},
    {'id': 84, 'name': 'TileAnimations4', 'type': AssetType.PALANIME},
    {'id': 85, 'name': 'Ch18MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 86, 'name': 'Ch18EirikaEvents', 'type': AssetType.EVENT},
    {'id': 87, 'name': 'MapPalette12', 'type': AssetType.PAL},
    {'id': 88, 'name': 'Ch19Map', 'type': AssetType.MAP},
    {'id': 89, 'name': 'Ch19MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 90, 'name': 'Ch19EirikaEvents', 'type': AssetType.EVENT},
    {'id': 91, 'name': 'MapPalette13', 'type': AssetType.PAL},
    {'id': 92, 'name': 'Ch20Map', 'type': AssetType.MAP},
    {'id': 93, 'name': 'Ch20MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 94, 'name': 'Ch20EirikaEvents', 'type': AssetType.EVENT},
    {'id': 95, 'name': 'ObjectType8', 'type': AssetType.OBJ},
    {'id': 96, 'name': 'MapPalette14', 'type': AssetType.PAL},
    {'id': 97, 'name': 'TileConfiguration8', 'type': AssetType.CONFIG},
    {'id': 98, 'name': 'FinalChapterMap1', 'type': AssetType.MAP},
    {'id': 99, 'name': 'FinalChapterMap1Changes', 'type': AssetType.MAPCHANGE},
    {'id': 100, 'name': 'FinalEirikaEvents1', 'type': AssetType.EVENT},
    {'id': 101, 'name': 'FinalChapterMap2', 'type': AssetType.MAP},
    {'id': 102, 'name': 'FinalChapterMap2Changes', 'type': AssetType.MAPCHANGE},
    {'id': 103, 'name': 'FinalEirikaEvents2', 'type': AssetType.EVENT},
    {'id': 104, 'name': 'MapPalette15', 'type': AssetType.PAL},
    {'id': 105, 'name': 'Ch9EphMap', 'type': AssetType.MAP},
    {'id': 106, 'name': 'Ch9EphMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 107, 'name': 'Ch9Events', 'type': AssetType.EVENT},
    {'id': 108, 'name': 'ObjectType9', 'type': AssetType.OBJ},
    {'id': 109, 'name': 'MapPalette16', 'type': AssetType.PAL},
    {'id': 110, 'name': 'TileConfiguration9', 'type': AssetType.CONFIG},
    {'id': 111, 'name': 'Ch10EphraimMap', 'type': AssetType.MAP},
    {'id': 112, 'name': 'Ch10EphraimMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 113, 'name': 'Ch10EphraimEvents', 'type': AssetType.EVENT},
    {'id': 114, 'name': 'MapPalette17', 'type': AssetType.PAL},
    {'id': 115, 'name': 'Ch12EphraimMap', 'type': AssetType.MAP},
    {'id': 116, 'name': 'Ch12EphraimMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 117, 'name': 'Ch12EphraimEvents', 'type': AssetType.EVENT},
    {'id': 118, 'name': 'Ch13EphraimMap', 'type': AssetType.MAP},
    {'id': 119, 'name': 'Ch13EphraimMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 120, 'name': 'Ch13EphraimEventData', 'type': AssetType.EVENT},
    {'id': 121, 'name': 'ObjectType10', 'type': AssetType.OBJ},
    {'id': 122, 'name': 'MapPalette18', 'type': AssetType.PAL},
    {'id': 123, 'name': 'TileConfiguration10', 'type': AssetType.CONFIG},
    {'id': 124, 'name': 'Ch14EphraimMap', 'type': AssetType.MAP},
    {'id': 125, 'name': 'TileAnimations5', 'type': AssetType.OBJANIME},
    {'id': 126, 'name': 'Ch14EphraimMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 127, 'name': 'Ch14EphraimEventData', 'type': AssetType.EVENT},
    {'id': 128, 'name': 'Ch15EphraimEventData', 'type': AssetType.EVENT},
    {'id': 129, 'name': 'Ch16EphraimEventData', 'type': AssetType.EVENT},
    {'id': 130, 'name': 'Ch17EphraimEventData', 'type': AssetType.EVENT},
    {'id': 131, 'name': 'Ch18EphraimEventData', 'type': AssetType.EVENT},
    {'id': 132, 'name': 'Ch19EphraimEventData', 'type': AssetType.EVENT},
    {'id': 133, 'name': 'Ch20EphraimEventData', 'type': AssetType.EVENT},
    {'id': 134, 'name': 'FinalEphraimEvents1', 'type': AssetType.EVENT},
    {'id': 135, 'name': 'FinalEphraimEvents2', 'type': AssetType.EVENT},
    {'id': 136, 'name': 'TowerOfValniObjectType', 'type': AssetType.OBJ},
    {'id': 137, 'name': 'TowerOfValniMapPalette', 'type': AssetType.PAL},
    {'id': 138, 'name': 'TowerOfValniTileConfiguration', 'type': AssetType.CONFIG},
    {'id': 139, 'name': 'TowerOfValni1Map', 'type': AssetType.MAP},
    {'id': 140, 'name': 'TowerOfValni1MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 141, 'name': 'TowerOfValni1Events', 'type': AssetType.EVENT},
    {'id': 142, 'name': 'TowerOfValni2Map', 'type': AssetType.MAP},
    {'id': 143, 'name': 'TowerOfValni2MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 144, 'name': 'TowerOfValni2Events', 'type': AssetType.EVENT},
    {'id': 145, 'name': 'TowerOfValni3Map', 'type': AssetType.MAP},
    {'id': 146, 'name': 'TowerOfValni3MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 147, 'name': 'TowerOfValni3Events', 'type': AssetType.EVENT},
    {'id': 148, 'name': 'TowerOfValni4Map', 'type': AssetType.MAP},
    {'id': 149, 'name': 'TowerOfValni4MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 150, 'name': 'TowerOfValni4Events', 'type': AssetType.EVENT},
    {'id': 151, 'name': 'TowerOfValni5Map', 'type': AssetType.MAP},
    {'id': 152, 'name': 'TowerOfValni5MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 153, 'name': 'TowerOfValni5Events', 'type': AssetType.EVENT},
    {'id': 154, 'name': 'TowerOfValni6Map', 'type': AssetType.MAP},
    {'id': 155, 'name': 'TowerOfValni6MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 156, 'name': 'TowerOfValni6Events', 'type': AssetType.EVENT},
    {'id': 157, 'name': 'TowerOfValni7Map', 'type': AssetType.MAP},
    {'id': 158, 'name': 'TowerOfValni7MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 159, 'name': 'TowerOfValni7Events', 'type': AssetType.EVENT},
    {'id': 160, 'name': 'TowerOfValni8Map', 'type': AssetType.MAP},
    {'id': 161, 'name': 'TowerOfValni8MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 162, 'name': 'TowerOfValni8Events', 'type': AssetType.EVENT},
    {'id': 163, 'name': 'LagdouRuinsPalette', 'type': AssetType.PAL},
    {'id': 164, 'name': 'LagdouRuins1Map', 'type': AssetType.MAP},
    {'id': 165, 'name': 'LagdouRuins1MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 166, 'name': 'LagdouRuins1Event', 'type': AssetType.EVENT},
    {'id': 167, 'name': 'LagdouRuins2Map', 'type': AssetType.MAP},
    {'id': 168, 'name': 'LagdouRuins2MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 169, 'name': 'LagdouRuins2Event', 'type': AssetType.EVENT},
    {'id': 170, 'name': 'LagdouRuins3Map', 'type': AssetType.MAP},
    {'id': 171, 'name': 'LagdouRuins3MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 172, 'name': 'LagdouRuins3Event', 'type': AssetType.EVENT},
    {'id': 173, 'name': 'LagdouRuins4Map', 'type': AssetType.MAP},
    {'id': 174, 'name': 'LagdouRuins4MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 175, 'name': 'LagdouRuins4Event', 'type': AssetType.EVENT},
    {'id': 176, 'name': 'LagdouRuins5Map', 'type': AssetType.MAP},
    {'id': 177, 'name': 'LagdouRuins5MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 178, 'name': 'LagdouRuins5Event', 'type': AssetType.EVENT},
    {'id': 179, 'name': 'LagdouRuins6Map', 'type': AssetType.MAP},
    {'id': 180, 'name': 'LagdouRuins6MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 181, 'name': 'LagdouRuins6Event', 'type': AssetType.EVENT},
    {'id': 182, 'name': 'LagdouRuins7Map', 'type': AssetType.MAP},
    {'id': 183, 'name': 'LagdouRuins7MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 184, 'name': 'LagdouRuins7Event', 'type': AssetType.EVENT},
    {'id': 185, 'name': 'LagdouRuins8Palette', 'type': AssetType.PAL},
    {'id': 186, 'name': 'LagdouRuins8Map', 'type': AssetType.MAP},
    {'id': 187, 'name': 'LagdouRuins8MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 188, 'name': 'LagdouRuins8Event', 'type': AssetType.EVENT},
    {'id': 189, 'name': 'LagdouRuins9Map', 'type': AssetType.MAP},
    {'id': 190, 'name': 'LagdouRuins9MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 191, 'name': 'LagdouRuins9Event', 'type': AssetType.EVENT},
    {'id': 192, 'name': 'LagdouRuins10Map', 'type': AssetType.MAP},
    {'id': 193, 'name': 'LagdouRuins10MapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 194, 'name': 'LagdouRuins10Event', 'type': AssetType.EVENT},
    {'id': 195, 'name': 'LordsSplitMap', 'type': AssetType.MAP},
    {'id': 196, 'name': 'LordsSplitMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 197, 'name': 'LordsSplitEvents', 'type': AssetType.EVENT},
    {'id': 198, 'name': 'MelkaenCoastMap', 'type': AssetType.MAP},
    {'id': 199, 'name': 'MelkaenCoastMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 200, 'name': 'MelkaenCoastEvent', 'type': AssetType.EVENT},
    {'id': 201, 'name': 'LinkArenaMap', 'type': AssetType.MAP},
    {'id': 202, 'name': 'AnInterestingMap', 'type': AssetType.MAP},
    {'id': 203, 'name': 'AnInterestingMapEvents', 'type': AssetType.EVENT},
    {'id': 204, 'name': 'DebugMap', 'type': AssetType.MAP},
    {'id': 205, 'name': 'DebugMapEvents', 'type': AssetType.EVENT},
    {'id': 206, 'name': 'MapPalette19', 'type': AssetType.PAL},
    {'id': 207, 'name': 'Ch11EirikaMap', 'type': AssetType.MAP},
    {'id': 208, 'name': 'Ch11EirikaMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 209, 'name': 'Ch11EirikaEvents', 'type': AssetType.EVENT},
    {'id': 210, 'name': 'Ch11EphraimMap', 'type': AssetType.MAP},
    {'id': 211, 'name': 'Ch11EphraimTileAnimations', 'type': AssetType.OBJANIME},
    {'id': 212, 'name': 'Ch11EphraimMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 213, 'name': 'Ch11EphraimEvents', 'type': AssetType.EVENT},
    {'id': 214, 'name': 'GradoCastleMap', 'type': AssetType.MAP},
    {'id': 215, 'name': 'RenaisCastleMap', 'type': AssetType.MAP},
    {'id': 216, 'name': 'CaerPelynMap', 'type': AssetType.MAP},
    {'id': 217, 'name': 'RenaisThroneMap', 'type': AssetType.MAP},
    {'id': 218, 'name': 'RenaisThroneMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 219, 'name': 'RenaisAudienceMap', 'type': AssetType.MAP},
    {'id': 220, 'name': 'RenvalGateMap', 'type': AssetType.MAP},
    {'id': 221, 'name': 'GradoBordersMap', 'type': AssetType.MAP},
    {'id': 222, 'name': 'GradoPrisonMap', 'type': AssetType.MAP},
    {'id': 223, 'name': 'GradoPrisonMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 224, 'name': 'GradoShrineMapPast', 'type': AssetType.MAP},
    {'id': 225, 'name': 'GradoShrineMapChangesPast', 'type': AssetType.MAPCHANGE},
    {'id': 226, 'name': 'RenaisShrineMap', 'type': AssetType.MAP},
    {'id': 227, 'name': 'RenaisShrineMapChanges', 'type': AssetType.MAPCHANGE},
    {'id': 228, 'name': 'SomePathMap', 'type': AssetType.MAP},
    {'id': 229, 'name': 'SomeBuildingMap', 'type': AssetType.MAP},
    {'id': 230, 'name': 'AnotherShrinePalette', 'type': AssetType.PAL},
    {'id': 231, 'name': 'AnotherShrineMap', 'type': AssetType.MAP},
    {'id': 232, 'name': 'AnotherPathMap', 'type': AssetType.MAP},
    {'id': 233, 'name': 'GradoShrineMapPresent', 'type': AssetType.MAP},
    {'id': 234, 'name': 'Ch5TownPalettePast', 'type': AssetType.PAL},
    {'id': 235, 'name': 'Ch5TownMapPast', 'type': AssetType.MAP},
    {'id': 236, 'name': 'TileAnimationsUnused1', 'type': AssetType.OBJANIME, 'addr': 0x59d5f0},
    {'id': 237, 'name': 'TileAnimationsUnused2', 'type': AssetType.OBJANIME, 'addr': 0x59d6b0},
    {'id': 238, 'name': 'TileAnimationsUnused3', 'type': AssetType.PALANIME, 'addr': 0x59d740},
    {'id': 239, 'name': 'TileAnimationsUnused4', 'type': AssetType.PALANIME, 'addr': 0x59d788},
    {'id': 240, 'name': 'TileAnimationsUnused5', 'type': AssetType.PALANIME, 'addr': 0x59d880},
    {'id': 241, 'name': 'UnusedMapChanges1', 'type': AssetType.MAPCHANGE, 'addr': 0xa1efd0},
    {'id': 242, 'name': 'UnusedMapChanges2', 'type': AssetType.MAPCHANGE, 'addr': 0xa1eff8},
    {'id': 243, 'name': 'UnusedMapChanges3', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f04c},
    {'id': 244, 'name': 'UnusedMapChanges4', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f070},
    {'id': 245, 'name': 'UnusedMapChanges5', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f088},
    {'id': 246, 'name': 'UnusedMapChanges6', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f0d0},
    {'id': 247, 'name': 'UnusedMapChanges7', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f0dc},
    {'id': 248, 'name': 'UnusedMapChanges8', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f0e8},
    {'id': 249, 'name': 'UnusedMapChanges9', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f3a8},
    {'id': 250, 'name': 'UnusedMapChanges10', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f3b4},
    {'id': 251, 'name': 'UnusedMapChanges11', 'type': AssetType.MAPCHANGE, 'addr': 0xa1f970},
]

def dumpOBJ(fp, addr, name):
    tool.decomp_image(fp, addr, comp_type_img=tool.lz77, name=name)

def dumpPAL(fp, addr, name):
    tool.dump_palette(fp, addr, color_number=16 * 10, name=name)

def dumpCONFIG(fp, addr, name):
    tool.dump_binary(fp, addr, comp_type=tool.lz77, name=name)

def dumpOBJANIME(fp, addr, name):
    frames = []
    i = 0
    while True:
        fp.seek(addr + 8 * i)
        frame = {}
        frame['id'] = i
        frame['duration'] = tool.read_u16_here(fp)
        if frame['duration'] == 0:
            break
        frame['size'] = tool.read_u16_here(fp)
        if frame['size'] == 0:
            break
        offset = tool.read_rom_offset_here(fp)
        if offset is None:
            break
        frame['gfx'] = f'{os.path.basename(name)}_frame_{i}'
        size = frame['size']
        if os.path.basename(name) in ('TileAnimations3' ,'TileAnimations5'):
            size //= 2
        width = 32
        if os.path.basename(name) == 'TileAnimationsUnused2':
            width //= 4
        height=size//(width * 32)
        tool.decomp_image(fp, offset, comp_type_img='NoComp', width=width, height=height, name=f'{name}_frame_{i}')
        frames.append(frame)
        labels.append({'addr': offset, 'name': frame['gfx'], 'type': AssetType.FRAME})
        i += 1
    outfile = open(name + '.json', 'w')
    json.dump({'name': os.path.basename(name), 'frames': frames}, outfile, indent=2)
    outfile.close()

def dumpPALANIME(fp, addr, name):
    frames = []
    i = 0
    while True:
        fp.seek(addr + 8 * i)
        frame = {}
        frame['id'] = i
        offset = tool.read_rom_offset_here(fp)
        if offset is None:
            break
        frame['duration'] = tool.read_u8_here(fp)
        if frame['duration'] == 0:
            break
        frame['colorNum'] = tool.read_u8_here(fp)
        if frame['colorNum'] == 0:
            break
        frame['colorPos'] = tool.read_u8_here(fp)
        frame['pal'] = f'{os.path.basename(name)}_frame_{i}'
        tool.dump_palette(fp, offset, name=f'{name}_frame_{i}', color_number=frame['colorNum'])
        frames.append(frame)
        labels.append({'addr': offset, 'name': frame['pal'], 'type': AssetType.PAL})
        i += 1
    outfile = open(name + '.json', 'w')
    json.dump({'name': os.path.basename(name), 'frames': frames}, outfile, indent=2)
    outfile.close()

def dumpMAP(fp, addr, name):
    tool.dump_binary(fp, addr, comp_type=tool.lz77, name=name)

def dumpMAPCHANGE(fp, addr, name):
    changes = []
    i = 0
    while True:
        fp.seek(addr + 12 * i)
        change = {}
        change['id'] = tool.read_u8_here(fp)
        if change['id'] == 0xff:
            break
        change['x'] = tool.read_u8_here(fp)
        change['y'] = tool.read_u8_here(fp)
        change['w'] = tool.read_u8_here(fp)
        change['h'] = tool.read_u8_here(fp)
        change['tiles'] = f'{os.path.basename(name)}_change_{i}'
        fp.read(3) # paddings[3]
        offset = tool.read_rom_offset_here(fp)
        if offset is None:
            break
        tool.dump_binary(fp, offset, size=2 * change['w'] * change['h'], name=f'{name}_change_{i}')
        changes.append(change)
        labels.append({'addr': offset, 'name': change['tiles'], 'type': AssetType.TILES})
        i += 1
    outfile = open(name + '.json', 'w')
    json.dump({'name': os.path.basename(name), 'changes': changes}, outfile, indent=2)
    outfile.close()

def dumpEVENT(fp, addr, name):
    #TODO: dump event scripts
    #NOTE:
    # 1. each event type has different formats
    # 2. each event command has different lengths
    # 3. they may have inner or external pointers
    # 4. character based events must align to 32?
    # 5. traps don't have alignment
    # they are not shiftable until full dump
    pass

dumpers = {
    AssetType.OBJ: dumpOBJ,
    AssetType.PAL: dumpPAL,
    AssetType.CONFIG: dumpCONFIG,
    AssetType.OBJANIME: dumpOBJANIME,
    AssetType.PALANIME: dumpPALANIME,
    AssetType.MAP: dumpMAP,
    AssetType.MAPCHANGE: dumpMAPCHANGE,
    AssetType.EVENT: dumpEVENT,
}

def printOBJ(i):
    print(f'\t.incbin "graphics/map/{labels[i]["name"]}.4bpp.lz"\n')

def printPAL(i):
    print(f'\t.incbin "graphics/map/{labels[i]["name"]}.gbapal"\n')

def printCONFIG(i):
    print(f'\t.incbin "graphics/map/{labels[i]["name"]}.bin.lz"\n')

def printOBJANIME(i):
    print(f'\t.include "src/data/map/obj_anim/{labels[i]["name"]}.inc"\n')

def printPALANIME(i):
    print(f'\t.include "src/data/map/pal_anim/{labels[i]["name"]}.inc"\n')

def printMAP(i):
    print(f'\t.incbin "graphics/map/{labels[i]["name"]}.bin.lz"\n')

def printMAPCHANGE(i):
    print(f'\t.include "src/data/map/change/{labels[i]["name"]}.inc"\n')

def printEVENT(i):
    print(f'\t.incbin "baserom.gba", 0x{labels[i]["addr"]:06x}, 0x{labels[i+1]["addr"]:x} - 0x{labels[i]["addr"]:x}\n')

def printFRAME(i):
    print(f'\t.incbin "graphics/map/{labels[i]["name"]}.4bpp"\n')

def printTILES(i):
    print(f'\t.incbin "graphics/map/{labels[i]["name"]}.bin"\n')

printers = {
    AssetType.OBJ: printOBJ,
    AssetType.PAL: printPAL,
    AssetType.CONFIG: printCONFIG,
    AssetType.OBJANIME: printOBJANIME,
    AssetType.PALANIME: printPALANIME,
    AssetType.MAP: printMAP,
    AssetType.MAPCHANGE: printMAPCHANGE,
    AssetType.EVENT: printEVENT,
    AssetType.FRAME: printFRAME,
    AssetType.TILES: printTILES,
}

with open('../baserom.gba', 'rb') as f:
    f.seek(table_addr + 4)
    for i in range(1, len(assets)):
        if 'addr' not in assets[i]:
            assets[i]['addr'] = tool.read_rom_offset_here(f)
        labels.append({'addr': assets[i]['addr'], 'name': assets[i]['name'], 'type': assets[i]['type']})
    for i in range(1, len(assets)):
        if assets[i]['type'] in dumpers:
            dumpers[assets[i]['type']](f, assets[i]['addr'], os.path.join(output_dir, assets[i]['name']))
        else:
            warn('no dumper defined for asset type: ' + assets[i]['type'].name)

labels.sort(key=lambda x:x['addr'])

print('\t.section .data\n')

for i, label in enumerate(labels):
    if label['type'] != AssetType.TILES:
        print('\t.align 2, 0')
    print(f'\t.global {label["name"]}')
    print(f'{label["name"]}: @0x8{label["addr"]:06x}')
    if label['type'] in printers:
        printers[label['type']](i)
    else:
        warn('no printer defined for asset type: ' + label['type'])

for i, asset in enumerate(assets):
    print('\t.word ' + asset['name'])
