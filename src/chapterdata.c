#include "global.h"
#include "agb_sram.h"

struct ROMChapterData {
	/* 00 */ const char* internalName;

	/* 04 */ u8  mapObj1Id;
	/* 05 */ u8  mapObj2Id;
	/* 06 */ u8  mapPaletteId;
	/* 07 */ u8  mapTileConfigId;
	/* 08 */ u8  mapMainLayerId;
	/* 09 */ u8  mapTileAnim1Id;
	/* 0A */ u8  mapTileAnim2Id;
	/* 0B */ u8  mapChangeLayerId;

	/* 0C */ u8  initialFogLevel;
	/* 0D */ u8  _unk0D;

	/* 0E */ u8 _unk0E[0x12 - 0x0E];

	/* 12 */ u8 initialWeather;
	/* 13 */ u8 battleTileSet;

	/* 14 */ u8 _fill14[0x70 - 0x14];
	/* 70 */ u32 unk70;
	/* 74 */ u8 mapEventDataId;
	/* 75 */ u8 _fill75[0x94 - 0x75];
};

const u8* sub_80A6B70(void);
unsigned  sub_80A6B90(void);

extern const struct ROMChapterData gUnknown_088B0890[];
extern const void** gUnknown_08A1FB34;
extern const void* gUnknown_088B363C[];
extern u8 gUnknown_02020188[];

const struct ROMChapterData* GetROMChapterStruct(unsigned chIndex) {
	if (chIndex == 0x7F)
		return (const struct ROMChapterData*) gUnknown_08A1FB34[0];

	return gUnknown_088B0890 + chIndex;
}

const void* GetChapterMapPointer(unsigned chIndex) {
	if (chIndex != 0x7F)
		return gUnknown_088B363C[GetROMChapterStruct(chIndex)->mapMainLayerId];

	ReadSramFast(sub_80A6B70(), gUnknown_02020188, sub_80A6B90());
	return gUnknown_02020188;
}

const void* GetChapterMapChangesPointer(unsigned chIndex) {
	if (chIndex != 0x7F)
		return gUnknown_088B363C[GetROMChapterStruct(chIndex)->mapChangeLayerId];

	return gUnknown_08A1FB34[1];
}

const void* GetChapterEventDataPointer(unsigned chIndex) {
	if (chIndex != 0x7F)
		return gUnknown_088B363C[GetROMChapterStruct(chIndex)->mapEventDataId];

	return gUnknown_08A1FB34[2];
}

const char* sub_80346E0(unsigned chIndex) {
	if (chIndex != 0x7F)
		// ???????????????????
		return GetStringFromIndex((int)(&GetROMChapterStruct(chIndex)->unk70));

	return gUnknown_08A1FB34[3];
}

int GetSomethingRelatedToCurrentDifficulty(void) {
	u8 difficultState = gUnknown_0202BCF0.chapterStateBits & 0x40;
	return difficultState ? TRUE : FALSE;
}

/*

	THUMB_FUNC_START GetSomethingRelatedToCurrentDifficulty
GetSomethingRelatedToCurrentDifficulty: @ 0x08034704
	ldr r0, _08034718  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	negs r0, r0
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_08034718: .4byte gUnknown_0202BCF0

*/
