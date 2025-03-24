#!/bin/python3

import json, os, sys

def main(args):
    try:
        path = args[1]
        outPath = args[2]
    except IndexError:
        sys.exit(f"Usage: {args[0]} .mar .bin")

    jsonPath  = path.replace(".mar", ".json")
    if not os.path.exists(jsonPath):
        raise FileNotFoundError("Map layout info not found: "+jsonPath)

    with open(jsonPath, "r", encoding="utf-8") as f:
        data = json.load(f)
    with open(path, "rb") as f:
        marData = f.read()    

    out = bytearray()
    out.append(data["width"])
    out.append(data["height"])
    out.extend(convert_from_mar(marData))    

    with open(outPath, "wb+") as f:
        f.write(out)

def convert_from_mar(data):
    # based on: https://github.com/FEBuilderGBA/FEBuilderGBA/blob/master/FEBuilderGBA/MapEditorForm.cs#L1293
    out = bytearray()
    for i in range(0, len(data), 2):
        value = int.from_bytes([data[i+1],data[i] ])
        value = value >> 3
        value = value.to_bytes(2)
        out.append(value[1])
        out.append(value[0])
    return out


if __name__ == '__main__':
    main(sys.argv)
