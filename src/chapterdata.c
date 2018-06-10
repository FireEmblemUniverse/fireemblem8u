#include "global.h"
#include "chapterdata.h"
#include "agb_sram.h"

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
