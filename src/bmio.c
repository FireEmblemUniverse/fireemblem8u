#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "chapterdata.h"
#include "rng.h"

struct TileGfxAnim {
	u16         time;
	u16         size;
	const void* data;
};

struct TilePalAnim {
	const void* data;
	u8          time;
	u8          colorCount;
	u8          colorStart;
};

struct BMVSyncProc {
	PROC_HEADER;

	/* 2C */ const struct TileGfxAnim* tileGfxAnimStart;
	/* 30 */ const struct TileGfxAnim* tileGfxAnimCurrent;

	/* 34 */ short tileGfxAnimClock;
	/* 36 */ short tilePalAnimClock;

	/* 28 */ const struct TilePalAnim* tilePalAnimStart;
	/* 3C */ const struct TilePalAnim* tilePalAnimCurrent;
};

extern const struct ProcCmd gUnknown_0859D8B8[];

void SetSecondaryHBlankHandler(void(*)(void));

void sub_803005C(struct BMVSyncProc* proc) {
	if (!proc->tileGfxAnimStart)
		return;

	if (proc->tileGfxAnimClock) {
		proc->tileGfxAnimClock--;
		return;
	}

	proc->tileGfxAnimClock = proc->tileGfxAnimCurrent->time;

	CpuFastCopy(
		proc->tileGfxAnimCurrent->data,
		BG_TILE_ADDR(0x140),
		proc->tileGfxAnimCurrent->size
	);

	if ((++proc->tileGfxAnimCurrent)->time == 0)
		proc->tileGfxAnimCurrent = proc->tileGfxAnimStart;
}

void sub_80300A4(struct BMVSyncProc* proc) {
	if (!proc->tilePalAnimStart)
		return;

	if (proc->tilePalAnimClock) {
		proc->tilePalAnimClock--;
		return;
	}

	proc->tilePalAnimClock = proc->tilePalAnimCurrent->time;

	CpuCopy16(
		proc->tilePalAnimCurrent->data,
		proc->tilePalAnimCurrent->colorStart + (0x10 * 6) + gPaletteBuffer,
		proc->tilePalAnimCurrent->colorCount*2
	);

	EnablePaletteSync();

	if ((++proc->tilePalAnimCurrent)->time == 0)
		proc->tilePalAnimCurrent = proc->tilePalAnimStart;
}

void SetupGameVBlank6C_TileAnimations(struct BMVSyncProc* proc) {
	proc->tileGfxAnimClock = 0;
	proc->tilePalAnimClock = 0;

	proc->tileGfxAnimStart = proc->tileGfxAnimCurrent =
		gChapterDataAssetTable[GetROMChapterStruct(gUnknown_0202BCF0.chapterIndex)->mapTileAnim1Id];

	proc->tilePalAnimStart = proc->tilePalAnimCurrent =
		gChapterDataAssetTable[GetROMChapterStruct(gUnknown_0202BCF0.chapterIndex)->mapTileAnim2Id];
}

void GameVBlank6C_Destructor(struct BMVSyncProc* proc) {
	SetSecondaryHBlankHandler(NULL);
}

void GameVBlank6C_Loop(struct BMVSyncProc* proc) {
	Proc_GotoLabel((struct Proc*)(proc), 0);
}

void SetupWeatherGraphics_Maybe(void);

void SetupGameVBlank6C(void) {
	SetupGameVBlank6C_TileAnimations(
		(struct BMVSyncProc*) Proc_Create(gUnknown_0859D8B8, ROOT_PROC_0)
	);

	SetupWeatherGraphics_Maybe();
	gUnknown_0202BCB0.gameGfxSemaphore = 0;
}

void sub_8030174(void) {
	Proc_DeleteAllWithScript(gUnknown_0859D8B8);
}

void BlockGameGraphicsLogic(void) {
	if (++gUnknown_0202BCB0.gameGfxSemaphore > 1)
		return; // gfx was already blocked, nothing needs to be done.

	SetSecondaryHBlankHandler(NULL);
	gPaletteBuffer[0] = 0;
	EnablePaletteSync();
	Proc_BlockEachWithMark(1);
}

void UnblockGameGraphicsLogic(void) {
	struct Proc* proc;

	if (!gUnknown_0202BCB0.gameGfxSemaphore)
		return; // wasn't blocked

	if (--gUnknown_0202BCB0.gameGfxSemaphore)
		return; // still blocked

	Proc_UnblockEachWithMark(1);

	proc = Proc_Find(gUnknown_0859D8B8);

	if (proc) {
		// restart vblank proc
		Proc_Delete(proc);
		SetupGameVBlank6C();
	}
}

void SetupOAMSpliceForWeather(unsigned weatherId) {
	switch (weatherId) {

	case 1:
	case 2:
	case 4:
	case 6:
		SetupOAMBufferSplice(0x20);
		break;

	case 5:
		SetupOAMBufferSplice(0x10);
		break;

	default:
		SetupOAMBufferSplice(0);
		break;

	} // switch (weatherId)
}

void sub_8030240(void) {
	SetupOAMSpliceForWeather(gUnknown_0202BCF0.chapterWeatherId);
	SetSecondaryHBlankHandler(NULL);
}

struct Something {
	/* 00 */ u16 unk00;
	/* 02 */ u16 unk02;
	/* 04 */ u16 unk04;
	/* 06 */ u16 unk06;
	/* 08 */ u8  unk08;
	/* 09 */ u8  unk09;
};

extern struct Something gUnknown_020027DC[];

extern const u16 gUnknown_080D7EEC[];

/*
static const u16 gUnknown_080D7EEC[] = {
	0xB0,  0xC0,  0,
	0xB0,  0xD0,  0,
	0xB0,  0xE0,  0,
	0xB0,  0xF0,  0,
	0xB0,  0x100, 0,
	0xB0,  0x110, 0,

	0xF0,  0x140, 1,
	0xF0,  0x150, 1,
	0xF0,  0x160, 1,
	0xF0,  0x170, 1,
	0xF0,  0x180, 1,
	0xF0,  0x190, 1,
	0xF0,  0x1A0, 1,

	0x100, 0x200, 2,
	0xF0,  0x220, 2,
	0xE0,  0x240, 2,
}; //*/

void sub_8030258(void) {
	int i;

	int thing[] = { 41, 9, 8 };

	SetupOAMSpliceForWeather(gUnknown_0202BCF0.chapterWeatherId);

	for (i = 0; i < 0x40; ++i) {
		unsigned r4 = (i & 0xF) * 3;

		gUnknown_020027DC[i].unk00 = AdvanceGetLCGRNValue();
		gUnknown_020027DC[i].unk02 = AdvanceGetLCGRNValue();

		gUnknown_020027DC[i].unk04 = gUnknown_080D7EEC[r4 + 0] * 2;
		gUnknown_020027DC[i].unk06 = gUnknown_080D7EEC[r4 + 1] * 2;
		gUnknown_020027DC[i].unk09 = gUnknown_080D7EEC[r4 + 2];
		gUnknown_020027DC[i].unk08 = thing[gUnknown_080D7EEC[r4 + 2]];
	}
}

/*
void sub_80302D0(void) {
	struct Something* ptr;

	if (GetPrimaryOAMSize()) {
		ptr = gUnknown_020027DC + ((GetGameClock() % 2) * 0x20);
	}
} //*/

/*

*/
