#!/usr/bin/env python3

import tool
from enum import Enum

class AssetType(Enum):
    NONE=0
    OBJ=1
    PAL=2
    CONFIG=3
    ANIME=4
    MAP=5
    MAPCHANGE=6
    EVENT=7

keywords = {
    'none': AssetType.NONE,
    'object': AssetType.OBJ,
    'palette': AssetType.PAL,
    'configuration': AssetType.CONFIG,
    'animation': AssetType.ANIME,
    'change': AssetType.MAPCHANGE,
    'event': AssetType.EVENT,
}

def guessType(name):
    for keyword, type in keywords.items():
        if keyword in name:
            return type
    return AssetType.MAP

with open('chapter_assets.txt') as f:
    assets = []
    lines = f.readlines()
    for i, line in enumerate(lines):
        assets.append(
            {
                'id': i,
                'name': tool.PascalCase(line.strip()),
                'type': guessType(line.lower()),
            }
        )
    print(assets)
