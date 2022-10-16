#!/usr/bin/env python3

import json
import tool

table_address = 0x8B0890
table_entries = 79

chapters = []

weather = ('fine', 'snow', 'snowstorm', '3', 'rain', 'flames', 'sandstorm', 'clouds')
goal = ('seize', 'defeat_all', 'defense', 'defeat_boss', 'special')

with open('../baserom.gba', 'rb') as f_rom:
    f_rom.seek(table_address)
    for i in range(table_entries):
        chapter = {}
        chapter['internalName'] = tool.read_pointer_here(f_rom)
        chapter['map'] = {}
        chapter['map']['obj1Id'] = tool.read_u8_here(f_rom)
        chapter['map']['obj2Id'] = tool.read_u8_here(f_rom)
        chapter['map']['paletteId'] = tool.read_u8_here(f_rom)
        chapter['map']['tileConfigId'] = tool.read_u8_here(f_rom)
        chapter['map']['mainLayerId'] = tool.read_u8_here(f_rom)
        chapter['map']['objAnimId'] = tool.read_u8_here(f_rom)
        chapter['map']['paletteAnimId'] = tool.read_u8_here(f_rom)
        chapter['map']['changeLayerId'] = tool.read_u8_here(f_rom)
        chapter['initialFogLevel'] = tool.read_u8_here(f_rom)
        chapter['hasPrepScreen'] = tool.read_bool8_here(f_rom)
        chapter['chapTitleId'] = tool.read_u8_here(f_rom)
        chapter['chapTitleIdInHectorStory'] = tool.read_u8_here(f_rom)
        chapter['initialPosX'] = tool.read_u8_here(f_rom)
        chapter['initialPosY'] = tool.read_u8_here(f_rom)
        chapter['initialWeather'] = weather[tool.read_u8_here(f_rom)]
        chapter['battleTileSet'] = tool.read_u8_here(f_rom)
        level = tool.read_u16_here(f_rom)
        chapter['easyModeLevelMalus'] = level & 0xf
        chapter['difficultModeLevelBonus'] = (level >> 4) & 0xf
        chapter['normalModeLevelMalus'] = (level >> 8) & 0xf
        chapter['bgm'] = {}
        chapter['bgm']['bluePhase'] = tool.read_u16_here(f_rom)
        chapter['bgm']['redPhase'] = tool.read_u16_here(f_rom)
        chapter['bgm']['greenPhase'] = tool.read_u16_here(f_rom)
        chapter['bgm']['bluePhaseInHectorStory'] = tool.read_u16_here(f_rom)
        chapter['bgm']['redPhaseInHectorStory'] = tool.read_u16_here(f_rom)
        chapter['bgm']['greenPhaseInHectorStory'] = tool.read_u16_here(f_rom)
        chapter['bgm']['blueGreenPhaseAlt'] = tool.read_u16_here(f_rom)
        chapter['bgm']['redPhaseAlt'] = tool.read_u16_here(f_rom)
        chapter['bgm']['prologueInLynStory'] = tool.read_u16_here(f_rom)
        chapter['bgm']['prologue'] = tool.read_u16_here(f_rom)
        chapter['bgm']['prologueInHectorStory'] = tool.read_u16_here(f_rom)
        chapter['mapCrackedWallHeath'] = tool.read_u8_here(f_rom)
        chapter['rank'] = {}
        chapter['rank']['tactics'] = {}
        chapter['rank']['tactics']['A'] = {}
        chapter['rank']['tactics']['A']['EliwoodStory'] = {}
        chapter['rank']['tactics']['A']['EliwoodStory']['Normal'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['A']['EliwoodStory']['Hard'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['A']['HectorStory'] = {}
        chapter['rank']['tactics']['A']['HectorStory']['Normal'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['A']['HectorStory']['Hard'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['B'] = {}
        chapter['rank']['tactics']['B']['EliwoodStory'] = {}
        chapter['rank']['tactics']['B']['EliwoodStory']['Normal'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['B']['EliwoodStory']['Hard'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['B']['HectorStory'] = {}
        chapter['rank']['tactics']['B']['HectorStory']['Normal'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['B']['HectorStory']['Hard'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['C'] = {}
        chapter['rank']['tactics']['C']['EliwoodStory'] = {}
        chapter['rank']['tactics']['C']['EliwoodStory']['Normal'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['C']['EliwoodStory']['Hard'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['C']['HectorStory'] = {}
        chapter['rank']['tactics']['C']['HectorStory']['Normal'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['C']['HectorStory']['Hard'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['D'] = {}
        chapter['rank']['tactics']['D']['EliwoodStory'] = {}
        chapter['rank']['tactics']['D']['EliwoodStory']['Normal'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['D']['EliwoodStory']['Hard'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['D']['HectorStory'] = {}
        chapter['rank']['tactics']['D']['HectorStory']['Normal'] = tool.read_u8_here(f_rom)
        chapter['rank']['tactics']['D']['HectorStory']['Hard'] = tool.read_u8_here(f_rom)
        chapter['unk3D'] = tool.read_u8_here(f_rom)
        chapter['rank']['exp'] = {}
        chapter['rank']['exp']['A'] = {}
        chapter['rank']['exp']['A']['EliwoodStory'] = {}
        chapter['rank']['exp']['A']['EliwoodStory']['Normal'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['A']['EliwoodStory']['Hard'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['A']['HectorStory'] = {}
        chapter['rank']['exp']['A']['HectorStory']['Normal'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['A']['HectorStory']['Hard'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['B'] = {}
        chapter['rank']['exp']['B']['EliwoodStory'] = {}
        chapter['rank']['exp']['B']['EliwoodStory']['Normal'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['B']['EliwoodStory']['Hard'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['B']['HectorStory'] = {}
        chapter['rank']['exp']['B']['HectorStory']['Normal'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['B']['HectorStory']['Hard'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['C'] = {}
        chapter['rank']['exp']['C']['EliwoodStory'] = {}
        chapter['rank']['exp']['C']['EliwoodStory']['Normal'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['C']['EliwoodStory']['Hard'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['C']['HectorStory'] = {}
        chapter['rank']['exp']['C']['HectorStory']['Normal'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['C']['HectorStory']['Hard'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['D'] = {}
        chapter['rank']['exp']['D']['EliwoodStory'] = {}
        chapter['rank']['exp']['D']['EliwoodStory']['Normal'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['D']['EliwoodStory']['Hard'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['D']['HectorStory'] = {}
        chapter['rank']['exp']['D']['HectorStory']['Normal'] = tool.read_u16_here(f_rom)
        chapter['rank']['exp']['D']['HectorStory']['Hard'] = tool.read_u16_here(f_rom)
        chapter['unk5E'] = tool.read_u16_here(f_rom)
        chapter['rank']['funds'] = {}
        chapter['rank']['funds']['EliwoodStory'] = {}
        chapter['rank']['funds']['EliwoodStory']['Normal'] = tool.read_u32_here(f_rom)
        chapter['rank']['funds']['EliwoodStory']['Hard'] = tool.read_u32_here(f_rom)
        chapter['rank']['funds']['HectorStory'] = {}
        chapter['rank']['funds']['HectorStory']['Normal'] = tool.read_u32_here(f_rom)
        chapter['rank']['funds']['HectorStory']['Hard'] = tool.read_u32_here(f_rom)
        chapter['chapTitleTextId'] = tool.read_u16_here(f_rom)
        chapter['chapTitleTextIdInHectorStory'] = tool.read_u16_here(f_rom)
        chapter['mapEventDataId'] = tool.read_u8_here(f_rom)
        chapter['gmapEventId'] = tool.read_u8_here(f_rom)
        chapter['divination'] = {}
        chapter['divination']['text'] = {}
        chapter['divination']['text']['beginning'] = tool.read_u16_here(f_rom)
        chapter['divination']['text']['EliwoodStory'] = tool.read_u16_here(f_rom)
        chapter['divination']['text']['HectorStory'] = tool.read_u16_here(f_rom)
        chapter['divination']['text']['ending'] = tool.read_u16_here(f_rom)
        chapter['divination']['portrait'] = tool.read_u8_here(f_rom)
        chapter['divination']['fee'] = tool.read_u8_here(f_rom)
        chapter['prepScreenNumber'] = tool.read_u8_here(f_rom)
        chapter['prepScreenNumberInHectorStory'] = tool.read_u8_here(f_rom)
        chapter['merchantPosX'] = tool.read_u8_here(f_rom)
        chapter['merchantPosXInHectorStory'] = tool.read_u8_here(f_rom)
        chapter['merchantPosY'] = tool.read_u8_here(f_rom)
        chapter['merchantPosYInHectorStory'] = tool.read_u8_here(f_rom)
        chapter['victorySongEnemyThreshold'] = tool.read_u8_here(f_rom)
        chapter['fadeToBlack'] = tool.read_u8_here(f_rom)
        chapter['goal'] = {}
        chapter['goal']['statusObjectiveTextId'] = tool.read_u16_here(f_rom)
        chapter['goal']['windowTextId'] = tool.read_u16_here(f_rom)
        chapter['goal']['windowDataType'] = goal[tool.read_u8_here(f_rom)]
        chapter['goal']['windowEndTurnNumber'] = tool.read_u8_here(f_rom)
        chapter['goal']['protectCharacterIndex'] = tool.read_u8_here(f_rom)
        chapter['goal']['destPosX'] = tool.read_u8_here(f_rom)
        chapter['goal']['destPosY'] = tool.read_u8_here(f_rom)
        chapter['unk91'] = tool.read_u8_here(f_rom)
        chapter['unk92'] = tool.read_u8_here(f_rom)
        chapter['unk93'] = tool.read_u8_here(f_rom)
        chapters.append(chapter)
    for i in range(table_entries):
        if chapters[i]['internalName'] > 0:
            f_rom.seek(chapters[i]['internalName'] - 0x8000000)
            chapters[i]['internalName'] = tool.read_ascii_here(f_rom)

out_file = open("../src/data/chapter_settings.json", "w")
json.dump({'chapters': chapters}, out_file, indent=2)
out_file.close()
