#include "global.h"

#include <string.h>

#include "proc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "chapterdata.h"
#include "rng.h"
#include "ctc.h"
#include "mu.h"

#include "bmio.h"

// General Battle Map System Stuff, mostly low level hardware stuff but also more

struct WeatherParticle {
	/* 00 */ short xPosition;
	/* 02 */ short yPosition;

	/* 04 */ short xSpeed;
	/* 06 */ short ySpeed;

	/* 08 */ u8  gfxIndex;
	/* 09 */ u8  typeId;
};

union WeatherEffectData {
	/**
	 * Array of weather particles
	 */
	struct WeatherParticle particles[0x40];

	/**
	 * Buffer for cloud graphics
	 */
	u32 gfxData[0xC0];
};

union GradientEffectData {
	/**
	 * Buffer holding colors for vertical gradient.
	 */
	u16 lines[320];

	/**
	 * Buffer holding 8 different variations of the tileset palette
	 * Variations have increasing amounts of red; used for fire weather effect
	 */
	u16 fireGradient[8][0x40];
};

// TODO: figure out if those variables should really belong to EWRAM_DATA
EWRAM_DATA static union WeatherEffectData sWeatherEffect = {};
EWRAM_DATA static union GradientEffectData sGradientEffect = {};

// const data

extern const struct ProcCmd gUnknown_0859A1F0[]; // gProc_BMapMain

CONST_DATA struct ProcCmd gUnknown_0859D8B8[] = {
	PROC_SET_MARK(PROC_MARK_1),
	PROC_SET_DESTRUCTOR(GameVBlank6C_Destructor),

	PROC_SLEEP(0),

PROC_LABEL(0),
	PROC_CALL_ROUTINE(sub_803005C),
	PROC_CALL_ROUTINE(sub_80300A4),
	PROC_CALL_ROUTINE(SMS_FlushDirect),
	PROC_CALL_ROUTINE(UpdateWeatherGraphics),

	PROC_LOOP_ROUTINE(GameVBlank6C_Loop),

	PROC_END
}; // gProc_VBlankHandler

CONST_DATA struct ProcCmd gUnknown_0859D908[] = { // gProc_MapTask
	PROC_SET_NAME("MAPTASK"),
	PROC_END_DUPLICATES,
	PROC_SET_MARK(PROC_MARK_1),

	PROC_SLEEP(0),

PROC_LABEL(0),
	PROC_CALL_ROUTINE(SMS_DisplayAllFromInfoStructs),
	PROC_CALL_ROUTINE(sub_8030C0C),
	PROC_CALL_ROUTINE(sub_8019D28),

	PROC_SLEEP(0),
	PROC_GOTO(0)
};

// TODO: better repr?
CONST_DATA u16 sObj_1[] = {
	1, 0x0000, 0x0000, 0x102A
};

// TODO: better repr?
CONST_DATA u16 sObj_2[] = {
	1, 0x8000, 0x0000, 0x100A
};

CONST_DATA u16* gUnknown_0859D968[3] = { // Obj Data Lookup
	sObj_1, sObj_2, sObj_2
};

// TODO: better repr?
CONST_DATA u16 gUnknown_0859D974[] = { // Obj Data
	18,

	0x4000, 0xC000, 0,
	0x4000, 0xC030, 6,
	0x4000, 0xC070, 0,
	0x4000, 0xC0A0, 6,
	0x8000, 0x80E0, 0,
	0x0020, 0x8000, 10,
	0x4020, 0xC020, 0,
	0x4020, 0xC050, 6,
	0x4020, 0xC090, 0,
	0x4020, 0xC0C0, 6,
	0x4040, 0xC000, 0,
	0x4040, 0xC0B0, 0,
	0x4060, 0xC000, 4,
	0x4060, 0xC0B0, 4,
	0x4080, 0xC000, 0,
	0x4080, 0xC0B0, 0,
	0x40A0, 0xC000, 0,
	0x40A0, 0xC0B0, 0,
};

CONST_DATA struct ProcCmd gUnknown_0859D9E4[] = { // gProc_GameGfxUnblocker
	PROC_SLEEP(0),
	PROC_CALL_ROUTINE(UnblockGameGraphicsLogic),

	PROC_END
};

// external data (gfx, pals, tsas, ...)
extern const u8  gUnknown_085A3964[];
extern const u8  gUnknown_085A39EC[];
extern const u8  gUnknown_085A3A84[];
extern const u16 gUnknown_085A3AC0[];
extern const u8  gUnknown_085A3B00[];
extern const u16 gUnknown_085A401C[];

// rodata

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
};

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
		proc->tilePalAnimCurrent->colorStart + (0x10 * BM_BGPAL_6) + gPaletteBuffer,
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

void sub_8030258(void) {
	int i;

	int gfxTileIndices[] = {
		0x29,
		0x09,
		0x08
	};

	SetupOAMSpliceForWeather(gUnknown_0202BCF0.chapterWeatherId);

	for (i = 0; i < 0x40; ++i) {
		unsigned templateIndex = (i & 0xF) * 3;

		sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
		sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

		sWeatherEffect.particles[i].xSpeed = gUnknown_080D7EEC[templateIndex + 0] * 2;
		sWeatherEffect.particles[i].ySpeed = gUnknown_080D7EEC[templateIndex + 1] * 2;
		sWeatherEffect.particles[i].typeId = gUnknown_080D7EEC[templateIndex + 2];

		sWeatherEffect.particles[i].gfxIndex = gfxTileIndices[gUnknown_080D7EEC[templateIndex + 2]];
	}
}

void sub_80302D0(void) {
	if (GetPrimaryOAMSize()) {
		struct { short x, y; } origins[3];
		int i;

		struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

		origins[0].x = (gUnknown_0202BCB0.xCameraReal * 12) / 16;
		origins[0].y = gUnknown_0202BCB0.yCameraReal;

		origins[1].x = gUnknown_0202BCB0.xCameraReal;
		origins[1].y = gUnknown_0202BCB0.yCameraReal;

		origins[2].x = (gUnknown_0202BCB0.xCameraReal * 20) / 16;
		origins[2].y = gUnknown_0202BCB0.yCameraReal;

		for (i = 0; i < 0x20; ++i) {
			it->xPosition += it->xSpeed;
			it->yPosition += it->ySpeed;

			CallARM_PushToPrimaryOAM(
				((it->xPosition >> 8) - origins[it->typeId].x) & 0xFF,
				((it->yPosition >> 8) - origins[it->typeId].y) & 0xFF,
				gUnknown_08590F44,
				(BM_OBJPAL_1 << 12) + it->gfxIndex
			);

			++it;
		}
	}
}

void sub_8030390(void) {
	int i;

	SetupOAMSpliceForWeather(gUnknown_0202BCF0.chapterWeatherId);

	for (i = 0; i < 0x40; ++i) {
		unsigned templateIndex = (i & 0xF) * 3;

		sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
		sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

		sWeatherEffect.particles[i].xSpeed   = gUnknown_080D7EEC[templateIndex + 0] * 6;
		sWeatherEffect.particles[i].ySpeed   = gUnknown_080D7EEC[templateIndex + 1] * 16;
		sWeatherEffect.particles[i].gfxIndex = gUnknown_080D7EEC[templateIndex + 2];
	}
}

void sub_80303F4(void) {
	if (GetPrimaryOAMSize()) {
		int i;

		struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

		for (i = 0; i < 0x20; ++i) {
			it->xPosition += it->xSpeed;
			it->yPosition += it->ySpeed;

			CallARM_PushToPrimaryOAM(
				((it->xPosition >> 8) - gUnknown_0202BCB0.xCameraReal) & 0xFF,
				((it->yPosition >> 8) - gUnknown_0202BCB0.yCameraReal) & 0xFF,
				gUnknown_0859D968[it->gfxIndex],
				0
			);

			++it;
		}
	}
}

void sub_8030474(void) {
	int i;

	SetupOAMSpliceForWeather(gUnknown_0202BCF0.chapterWeatherId);

	CopyDataWithPossibleUncomp(gUnknown_085A3964, gUnknown_02020188);
	CopyTileGfxForObj(gUnknown_02020188, OBJ_VRAM0 + 0x1C * 0x20, 4, 4);

	for (i = 0; i < 0x40; ++i) {
		sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
		sWeatherEffect.particles[i].yPosition = (AdvanceGetLCGRNValue() % 160 + 240) & 0xFF;

		sWeatherEffect.particles[i].xSpeed = (AdvanceGetLCGRNValue() & 0x7) - 32;
		sWeatherEffect.particles[i].ySpeed = 0;
	}
}

void sub_80304E4(void) {
	if (GetPrimaryOAMSize()) {
		int i;

		struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

		for (i = 0; i < 0x20; ++i) {
			it->xPosition += it->xSpeed;

			CallARM_PushToPrimaryOAM(
				((it->xPosition & 0xFF) - 0x10) & 0x1FF,
				it->yPosition,
				gUnknown_08590F54,
				(BM_OBJPAL_1 << 12) + 0x1C
			);

			++it;
		}
	}
}

void sub_8030540(void) {
	int i;

	u8 typeLookup[] = { 0, 0, 0, 0, 0, 0, 1, 1 };

	SetupOAMSpliceForWeather(gUnknown_0202BCF0.chapterWeatherId);

	CopyDataWithPossibleUncomp(gUnknown_085A39EC, gUnknown_02020188);
	CopyTileGfxForObj(gUnknown_02020188, OBJ_VRAM0 + 0x18 * 0x20, 8, 4);

	for (i = 0; i < 0x40; ++i) {
		unsigned type = typeLookup[i & 7];

		sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
		sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

		sWeatherEffect.particles[i].ySpeed    = (AdvanceGetLCGRNValue() & 0x3FF) - 0x100;
		sWeatherEffect.particles[i].gfxIndex  = type;

		switch (type) {

		case 0:
			sWeatherEffect.particles[i].xSpeed = 0x700 + (AdvanceGetLCGRNValue() & 0x1FF);
			break;

		case 1:
			sWeatherEffect.particles[i].xSpeed = 0xA00 + (AdvanceGetLCGRNValue() & 0x1FF);
			break;

		} // switch(type)
	}
}

void sub_80305FC(void) {
	if (GetPrimaryOAMSize()) {
		int i;

		struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

		for (i = 0; i < 0x20; ++i) {
			it->xPosition += it->xSpeed;
			it->yPosition += it->ySpeed;

			CallARM_PushToPrimaryOAM(
				((it->xPosition >> 8) - gUnknown_0202BCB0.xCameraReal) & 0xFF,
				((it->yPosition >> 8) - gUnknown_0202BCB0.yCameraReal) & 0xFF,
				gUnknown_08590F54,
				(BM_OBJPAL_1 << 12) + 0x18 + (it->gfxIndex * 4)
			);

			++it;
		}

	}
}

void sub_8030674(void) {
	u16 nextLine = (REG_VCOUNT + 1);

	if (nextLine > 160)
		nextLine = 0;

	nextLine += gUnknown_0202BCB0.yCameraReal / 2;

	if (nextLine >= 320)
		((u16*)(PLTT))[0] = 0;
	else
		((u16*)(PLTT))[0] = nextLine[sGradientEffect.lines];
}

void sub_80306CC(void) {
	u16* palIt = sGradientEffect.lines;
	int i = 0;

	void(*handler)(void) = sub_8030674;

	for (; i < 320; ++i)
		*palIt++ = RGB(0, 0, (31 - i / 10));

	SetSecondaryHBlankHandler(handler);
}

void nullsub_12(void) {}

void sub_8030714(void) {
	const u16* src;
	u16* dst;

	u16 nextLine = (REG_VCOUNT + 1);

	if (nextLine < 96)
		return;

	if (nextLine >= 160)
		return;

	nextLine -= 96;

	src  = sGradientEffect.fireGradient[0];
	src += nextLine * 8;

	dst = ((u16*)(PLTT)) + 0x70 + (nextLine % 8) * 8;

	CpuFastCopy(src, dst, 8);
}

void sub_8030758(void) {
	int k, j, i;

	for (i = 0; i < 4; ++i) {
		for (j = 0; j < 0x10; ++j) {
			const int color = gPaletteBuffer[0x10 * (i + BM_BGPAL_TILESET_BASE) + j];

			int r = RED_VALUE(color);
			int g = GREEN_VALUE(color);
			int b = BLUE_VALUE(color);

			for (k = 0; k < 8; ++k) {
				r = r + 2;

				if (r > 31)
					r = 31;

				sGradientEffect.fireGradient[k][0x10 * i + j] = 
					(b << 10) + (g << 5) + r;
			}
		}
	}
}

void sub_80307D8(void) {
	int i, j, k;

	sub_8019974();

	for (i = 0; i < 4; ++i) {
		for (j = 0; j < 0x10; ++j) {
			const int color = gPaletteBuffer[0x10 * (i + BM_BGPAL_TILESET_BASE) + j];

			int r = RED_VALUE(color);
			int g = GREEN_VALUE(color);
			int b = BLUE_VALUE(color);

			for (k = 0; k < 8; ++k) {
				r = r + 2;

				if (r > 31)
					r = 31;

				sGradientEffect.fireGradient[k][0x10 * i + j] = 
					(b << 10) + (g << 5) + r;
			}
		}
	}

	SetSecondaryHBlankHandler(sub_8030714);
} // sub_80307D8

void sub_8030868(void) {
	int i;

	SetupOAMSpliceForWeather(gUnknown_0202BCF0.chapterWeatherId);
	CopyDataWithPossibleUncomp(gUnknown_085A3A84, OBJ_VRAM0 + 0x18 * 0x20);
	CopyToPaletteBuffer(gUnknown_085A3AC0, 0x340, 0x20);

	for (i = 0; i < 0x10; ++i) {
		sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
		sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

		sWeatherEffect.particles[i].xSpeed = -gUnknown_080D7EEC[i*3 + 0];
		sWeatherEffect.particles[i].ySpeed = -gUnknown_080D7EEC[i*3 + 1];
	}
}

void sub_80308CC(void) {
	sub_80307D8();
	sub_8030868();
}

void sub_80308DC(void) {
	int i, j;

	CpuFastCopy(
		gPaletteBuffer + BM_BGPAL_TILESET_BASE * 0x10,
		((u16*)(PLTT)) + BM_BGPAL_TILESET_BASE * 0x10,

		0x20 * 4
	);

	for (i = 12; i < 16; ++i) {
		const int color = gPaletteBuffer[(BM_BGPAL_TILESET_BASE + 2) * 0x10 + i];

		int r = RED_VALUE(color);
		int g = GREEN_VALUE(color);
		int b = BLUE_VALUE(color);

		for (j = 0; j < 8; ++j) {
			r = r + 2;

			if (r > 31)
				r = 31;

			sGradientEffect.fireGradient[j][0x10 * 2 + i] = 
				(b << 10) + (g << 5) + r;
		}

	}
}

void sub_8030948(void) {
	struct WeatherParticle* it = sWeatherEffect.particles;

	if (GetPrimaryOAMSize()) {
		int i;

		for (i = 0; i < 0x10; ++i, ++it) {
			int yDisplay;
			int objTile;

			it->xPosition += it->xSpeed;
			it->yPosition += it->ySpeed;

			yDisplay = ((it->yPosition >> 8) - gUnknown_0202BCB0.yCameraReal) & 0xFF;

			if (yDisplay < 0x40)
				continue;

			if (yDisplay > 0xA0)
				continue;

			objTile = 31 - ((yDisplay - 0x40) / 8);

			if (objTile < 24)
				objTile = 24;

			CallARM_PushToPrimaryOAM(
				((it->xPosition >> 8) - gUnknown_0202BCB0.xCameraReal) & 0xFF,
				yDisplay,
				gUnknown_08590F44,
				(BM_OBJPAL_10 << 12) + objTile
			);
		}
	}
}

void sub_80309E0(void) {
	sub_80308DC();
	sub_8030948();
}

void sub_80309F0(u32* lines) {
	u32 lineBuf[8];
	int iy, ix;

	// What this function is doing is "shifting" a 14
	// tile wide 4bpp image one pixel to the right(?)

	// Remember: lowest nibble of any gfx data is the leftmost pixel

	// Saving the rightmost tile column for later
	for (iy = 0; iy < 8; ++iy)
		lineBuf[iy] = lines[iy + 0x68];

	// Shift all tiles right one pixel
	for (ix = (14 - 1); ix >= 0; --ix) {
		for (iy = 0; iy < 8; ++iy) {
			lines[(8*(ix - 1)) + iy + 8] =
				(lines[(8*(ix - 1)) + iy + 8] << 4) | (lines[(8*(ix - 1)) + iy] >> 28);
		}
	}

	// the leftmost pixel column now contains garbage
	// but that's only, we're fixing it now
	// this is why we needed the rightmost column to be saved
	for (iy = 0; iy < 8; ++iy) {
		lines[iy] &= ~0xF;
		lines[iy] = (lines[iy]) | (lineBuf[iy] >> 28);
	}
}

void sub_8030A58(void) {
	SetupOAMSpliceForWeather(0); // TODO: Weather Id Definition

	CopyDataWithPossibleUncomp(
		gUnknown_085A3B00,
		sWeatherEffect.gfxData
	);

	CopyToPaletteBuffer(
		gUnknown_085A401C,
		((0x10 + BM_OBJPAL_10) * 0x10 * sizeof(u16)),
		0x10 * sizeof(u16)
	);
}

void sub_8030A84(void) {
	u32* gfx = sWeatherEffect.gfxData;

	switch (GetGameClock() % 8) {

	case 0:
		sub_80309F0(gfx + 0 * (14 * 8));
		break;

	case 2:
		sub_80309F0(gfx + 1 * (14 * 8));
		break;

	case 4:
		sub_80309F0(gfx + 2 * (14 * 8));
		break;

	case 6:
		sub_80309F0(gfx + 3 * (14 * 8));
		break;

	case 7:
		CopyTileGfxForObj(gfx, OBJ_VRAM0 + (0x20 * 18), 14, 4);
		break;

	} // switch (GetGameClock() % 8)
}

void sub_8030B00(void) {
	int y = gUnknown_0202BCB0.yCameraReal;

	RegisterObjectAttributes_SafeMaybe(
		14,
		0, -(y / 5),
		gUnknown_0859D974,
		0xAC12
	);
}

void SetupWeatherGraphics_Maybe(void) {
	// TODO: USE WEATHER DEFINITIONS

	switch (gUnknown_0202BCF0.chapterWeatherId) {

	case 0:
		sub_8030240();
		break;

	case 1:
		sub_8030258();
		break;

	case 6:
		sub_8030474();
		break;

	case 2:
		sub_8030540();
		break;

	case 4:
		sub_8030390();
		break;

	case 3:
		sub_80306CC();
		break;

	case 5:
		sub_80308CC();
		break;

	case 7:
		sub_8030A58();
		break;

	} // switch (gUnknown_0202BCF0.chapterWeatherId)
}

void UpdateWeatherGraphics(void) {
	// TODO: USE WEATHER DEFINITIONS

	switch (gUnknown_0202BCF0.chapterWeatherId) {

	case 1:
		sub_80302D0();
		break;

	case 6:
		sub_80304E4();
		break;

	case 2:
		sub_80305FC();
		break;

	case 4:
		sub_80303F4();
		break;

	case 3:
		nullsub_12();
		break;

	case 5:
		sub_80309E0();
		break;

	case 7:
		sub_8030A84();
		break;

	} // switch (gUnknown_0202BCF0.chapterWeatherId)
}

void sub_8030C0C(void) {
	if (gUnknown_0202BCF0.chapterWeatherId == 7) // TODO: USE WEATHER DEFINITIONS
		sub_8030B00();
}

void sub_8030C24(void) {
	struct BMVSyncProc* proc = (struct BMVSyncProc*) Proc_Find(gUnknown_0859D8B8);

	if (proc)
		proc->tilePalAnimStart = NULL;
}

void sub_8030C40(void) {
	struct BMVSyncProc* proc = (struct BMVSyncProc*) Proc_Find(gUnknown_0859D8B8);

	if (proc)
		proc->tilePalAnimStart = proc->tilePalAnimCurrent =
			gChapterDataAssetTable[GetROMChapterStruct(gUnknown_0202BCF0.chapterIndex)->mapTileAnim2Id];
}

void SetupWeather(unsigned weatherId) {
	gUnknown_0202BCF0.chapterWeatherId = weatherId;

	SetupOAMSpliceForWeather(weatherId);
	SetupWeatherGraphics_Maybe();
}

u8 GetTextSpeed(void) {
	u8 speedLookup[4] = { 8, 4, 1, 0 };
	return speedLookup[gUnknown_0202BCF0.unk40_6];
}

int sub_8030CC0(void) {
	if (!sub_80A3870())
		return TRUE;

	if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_7)
		return FALSE;

	return gUnknown_0202BCF0.unk41_5;
}

void sub_8030CF4(int r5, s8 r6) {
	CpuFill16(0, &gUnknown_0202BCF0, sizeof(gUnknown_0202BCF0));

	gUnknown_0202BCF0.chapterIndex = 0;

	if (r5)
		gUnknown_0202BCF0.chapterStateBits |= CHAPTER_FLAG_DIFFICULT;

	// TODO: WHAT ARE THOSE

	gUnknown_0202BCF0.unk42_6 = r6;
	gUnknown_0202BCF0.unk42_2 = 0;
	gUnknown_0202BCF0.unk40_2 = 0;
	gUnknown_0202BCF0.unk40_3 = 0;
	gUnknown_0202BCF0.unk40_5 = 0;
	gUnknown_0202BCF0.unk40_6 = 1; // TODO: (DEFAULT?) TEXT SPEED DEFINITIONS
	gUnknown_0202BCF0.unk40_8 = 0;
	gUnknown_0202BCF0.unk41_1 = 0;
	gUnknown_0202BCF0.unk41_2 = 0;
	gUnknown_0202BCF0.unk41_3 = 0;
	gUnknown_0202BCF0.unk41_7 = 0;
	gUnknown_0202BCF0.unk41_8 = 0;
	gUnknown_0202BCF0.unk42_4 = 0;
	gUnknown_0202BCF0.unk42_8 = 0;
	gUnknown_0202BCF0.unk43_2 = 0;
	gUnknown_0202BCF0.unk40_1 = 0;
	gUnknown_0202BCF0.unk41_5 = 0;
}

void ResetGameState(void) {
	int logicLock = gUnknown_0202BCB0.gameLogicSemaphore;

	CpuFill16(0, &gUnknown_0202BCB0, sizeof(gUnknown_0202BCB0));
	gUnknown_0202BCB0.gameLogicSemaphore = logicLock;
}

void SetupChapter(struct GameCtrlProc* gameCtrl) { // TODO: Proc type here is specifically GameCtrlProc
	int i;

	SetupBackgrounds(NULL);

	SetMainUpdateRoutine(SomeUpdateRoutine);
	SetInterrupt_LCDVBlank(GeneralVBlankHandler);

	ResetGameState();
	sub_80156D4();
	SetupMapSpritesPalettes();
	ClearLocalEvents();
	SMS_ClearUsageTable();
	ClearMenuRelatedList();
	ResetTraps();

	gUnknown_0202BCF0.chapterPhaseIndex = 0x40; // TODO: PHASE/ALLEGIANCE DEFINITIONS
	gUnknown_0202BCF0.chapterTurnNumber = 0;

	// TODO: BATTLE MAP/CHAPTER/OBJECTIVE TYPE DEFINITION (STORY/TOWER/SKIRMISH)
	// TODO: CHAPTER STATE BITS DEFINITIONS
	if (GetChapterThing() == 2) {
		if (!(gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_PREPSCREEN))
			gUnknown_0202BCF0.chapterVisionRange = 3 * (NextRN_100() & 1);
	} else {
		gUnknown_0202BCF0.chapterVisionRange =
			GetROMChapterStruct(gUnknown_0202BCF0.chapterIndex)->initialFogLevel;
	}

	gUnknown_0202BCF0.chapterWeatherId =
		GetROMChapterStruct(gUnknown_0202BCF0.chapterIndex)->initialWeather;

	SetupBackgroundForWeatherMaybe();
	InitChapterMap(gUnknown_0202BCF0.chapterIndex);
	AddSnagsAndWalls();

	gUnknown_0202BCF0.unk4 = GetGameClock();
	gUnknown_0202BCF0.chapterTotalSupportGain = 0;

	gUnknown_0202BCF0.unk48 = 0;
	gUnknown_0202BCF0.unk4A_1 = 0;
	gUnknown_0202BCF0.unk4B = 0;
	gUnknown_0202BCF0.unk4A_5 = 0;

	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (unit && unit->pCharacterData) {
			if (unit->state & US_BIT21)
				unit->state = unit->state | US_NOT_DEPLOYED;
			else
				unit->state = unit->state &~ US_NOT_DEPLOYED;
		}
	}

	sub_8018EB8();
	LoadChapterBallistae();

	if (gameCtrl)
		MakeBMAPMAIN(gameCtrl);

	// TODO: MACRO?
	gPaletteBuffer[0] = 0;
	EnablePaletteSync();

	sub_8001ED0(TRUE, TRUE, TRUE, TRUE, TRUE);
	sub_8001F48(TRUE);

	SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
}

void sub_8030F48(void) {
	SetupBackgrounds(NULL);

	SetMainUpdateRoutine(SomeUpdateRoutine);
	SetInterrupt_LCDVBlank(GeneralVBlankHandler);

	sub_80156D4();
	SetupMapSpritesPalettes();
	SMS_ClearUsageTable();

	ResetTraps();

	gUnknown_0202BCF0.chapterWeatherId =
		GetROMChapterStruct(gUnknown_0202BCF0.chapterIndex)->initialWeather;

	SetupBackgroundForWeatherMaybe();

	InitChapterMap(gUnknown_0202BCF0.chapterIndex);

	AddSnagsAndWalls();
	LoadChapterBallistae();
	sub_8030174();
	SetupGameVBlank6C();

	Proc_Create(gUnknown_0859D908, ROOT_PROC_4);

	// TODO: MACRO?
	gPaletteBuffer[0] = 0;
	EnablePaletteSync();

	gLCDControlBuffer.dispcnt.bg0_on = TRUE;
	gLCDControlBuffer.dispcnt.bg1_on = TRUE;
	gLCDControlBuffer.dispcnt.bg2_on = TRUE;
	gLCDControlBuffer.dispcnt.bg3_on = FALSE;
	gLCDControlBuffer.dispcnt.obj_on = FALSE;
}

/**
 * This is called after loading a suspended game
 * To get the game state back to where it was left off
 */
void sub_8030FE4(struct GameCtrlProc* gameCtrl) {
	struct BMapMainProc* mapMain;

	if (gUnknown_0202BCF0.chapterIndex == 0x7F) // TODO: CHAPTER_SPECIAL enum?
		sub_80A6C8C();

	SetupBackgrounds(NULL);

	SetMainUpdateRoutine(SomeUpdateRoutine);
	SetInterrupt_LCDVBlank(GeneralVBlankHandler);

	ResetGameState();

	SetCursorMapPosition(
		gUnknown_0202BCF0.xCursor,
		gUnknown_0202BCF0.yCursor
	);

	LoadGameCoreGfx();
	SetupMapSpritesPalettes();
	SMS_ClearUsageTable();

	InitChapterMap(gUnknown_0202BCF0.chapterIndex);

	gUnknown_0202BCB0.unk3C = TRUE;

	mapMain = MakeBMAPMAIN(gameCtrl);

	gUnknown_0202BCB0.xCameraReal = sub_8015A40(16 * gUnknown_0202BCB0.xPlayerCursor);
	gUnknown_0202BCB0.yCameraReal = sub_8015A6C(16 * gUnknown_0202BCB0.yPlayerCursor);

	switch (gUnknown_0203A958.suspendPointType) {

	case SUSPEND_POINT_1:
		sub_803133C(mapMain);
		break;

	case SUSPEND_POINT_0:
	case SUSPEND_POINT_2:
		sub_8031300(mapMain);
		break;

	case SUSPEND_POINT_3:
		sub_80313BC(mapMain);
		break;

	case SUSPEND_POINT_4:
		sub_80313F8(mapMain);
		break;

	case SUSPEND_POINT_9:
		sub_8031474(mapMain);
		break;

	} // switch (gUnknown_0203A958.suspendPointType)

	sub_8001ED0(TRUE, TRUE, TRUE, TRUE, TRUE);
	sub_8001F48(TRUE);

	SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
}

void sub_80310F8(void) {
	SetMainUpdateRoutine(SomeUpdateRoutine);
	SetInterrupt_LCDVBlank(GeneralVBlankHandler);

	LoadGameCoreGfx();
	SetupMapSpritesPalettes();

	ClearBG0BG1();

	gLCDControlBuffer.dispcnt.win0_on = FALSE;
	gLCDControlBuffer.dispcnt.win1_on = FALSE;
	gLCDControlBuffer.dispcnt.objWin_on = FALSE;

	SetDefaultColorEffects();

	RegisterBlankTile(0);
	BG_Fill(gBG2TilemapBuffer, 0);

	BG_EnableSyncByMask(1 << 2); // Enable bg2 sync
}

void sub_8031154(void) {
	LoadObjUIGfx();

	MU_Create(&gUnknown_0203A4EC.unit);
	MU_SetDefaultFacing_Auto();

	Proc_Create(gUnknown_0859D9E4, ROOT_PROC_3);
}

void LoadGameCoreGfx2(void) {
	LoadChapterMapGfx(gUnknown_0202BCF0.chapterIndex);
	SetupOAMSpliceForWeather(gUnknown_0202BCF0.chapterWeatherId);
	UpdateGameTilesGraphics();
	SMS_UpdateFromGameData();
	SetupMapSpritesPalettes();
	SMS_FlushIndirect();
	Font_LoadForUI();
}

void sub_80311A8(void) {
	SetupBackgrounds(NULL);

	LoadGameCoreGfx();
	LoadGameCoreGfx2();
}

struct BMapMainProc* MakeBMAPMAIN(struct GameCtrlProc* gameCtrl) {
	struct BMapMainProc* mapMain = (struct BMapMainProc*) Proc_Create(gUnknown_0859A1F0, ROOT_PROC_2);

	mapMain->gameCtrl = gameCtrl;
	gameCtrl->blockSemaphore++;

	SetupGameVBlank6C();
	Proc_Create(gUnknown_0859D908, ROOT_PROC_4);

	return mapMain;
}

void sub_80311F0(void) {
	struct BMapMainProc* mapMain;

	Proc_DeleteEachWithMark(PROC_MARK_1);

	mapMain = (struct BMapMainProc*) Proc_Find(gUnknown_0859A1F0);
	mapMain->gameCtrl->blockSemaphore--;

	Proc_Delete((struct Proc*)(mapMain));
}

void sub_8031214(void) { // ChapterEndUnitCleanup
	int i, j;

	// Clear phantoms
	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (unit && unit->pCharacterData)
			if (unit->pClassData->number == CLASS_PHANTOM)
				ClearUnitStruct(unit);
	}

	// Clear all non player units (green & red units)
	for (i = 0x41; i < 0xC0; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (unit && unit->pCharacterData)
			ClearUnitStruct(unit);
	}

	// Reset player unit "temporary" states (HP, status, some state flags, etc)
	for (j = 1; j < 0x40; ++j) {
		struct Unit* unit = GetUnitStruct(j);

		if (unit && unit->pCharacterData) {
			SetUnitHP(unit, GetUnitMaxHP(unit));
			SetUnitNewStatus(unit, UNIT_STATUS_NONE);

			unit->torchDuration = 0;
			unit->barrierDuration = 0;

			if (unit->state & US_NOT_DEPLOYED)
				unit->state = unit->state | US_BIT21;
			else
				unit->state = unit->state &~ US_BIT21;

			unit->state &= (
				US_DEAD | US_GROWTH_BOOST | US_SOLOANIM_1 | US_SOLOANIM_2 |
				US_BIT16 | US_BIT20 | US_BIT21 | US_BIT25 | US_BIT26
			);

			if (UNIT_ATTRIBUTES(unit) & CA_SUPPLY)
				unit->state = unit->state &~ US_DEAD;

			unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

			unit->rescueOtherUnit = 0;
			unit->supportBits = 0;
		}
	}

	gUnknown_0202BCF0.chapterStateBits = gUnknown_0202BCF0.chapterStateBits &~ CHAPTER_FLAG_PREPSCREEN;
}

void sub_8031300(struct BMapMainProc* mapMain) {
	RefreshFogAndUnitMaps();
	SMS_UpdateFromGameData();

	gLCDControlBuffer.dispcnt.bg0_on = FALSE;
	gLCDControlBuffer.dispcnt.bg1_on = FALSE;
	gLCDControlBuffer.dispcnt.bg2_on = FALSE;
	gLCDControlBuffer.dispcnt.bg3_on = FALSE;
	gLCDControlBuffer.dispcnt.obj_on = FALSE;

	Proc_GotoLabel((struct Proc*)(mapMain), 4);
}

void sub_803133C(struct BMapMainProc* mapMain) {
	RefreshFogAndUnitMaps();
	SMS_UpdateFromGameData();

	gLCDControlBuffer.dispcnt.bg0_on = FALSE;
	gLCDControlBuffer.dispcnt.bg1_on = FALSE;
	gLCDControlBuffer.dispcnt.bg2_on = FALSE;
	gLCDControlBuffer.dispcnt.bg3_on = FALSE;
	gLCDControlBuffer.dispcnt.obj_on = FALSE;

	Proc_GotoLabel((struct Proc*)(mapMain), 6);

	gUnknown_03004E50 = GetUnitStruct(gUnknown_0203A958.subjectIndex);
	gUnknown_0202E4D8[gUnknown_03004E50->yPos][gUnknown_03004E50->xPos] = 0;

	HideUnitSMS(GetUnitStruct(gUnknown_0203A958.subjectIndex));

	MU_Create(gUnknown_03004E50);
	MU_SetDefaultFacing_Auto();
}

void sub_80313BC(struct BMapMainProc* mapMain) {
	RefreshFogAndUnitMaps();
	SMS_UpdateFromGameData();

	gLCDControlBuffer.dispcnt.bg0_on = FALSE;
	gLCDControlBuffer.dispcnt.bg1_on = FALSE;
	gLCDControlBuffer.dispcnt.bg2_on = FALSE;
	gLCDControlBuffer.dispcnt.bg3_on = FALSE;
	gLCDControlBuffer.dispcnt.obj_on = FALSE;

	Proc_GotoLabel((struct Proc*)(mapMain), 7);
}

void sub_80313F8(struct BMapMainProc* mapMain) {
	gUnknown_03004E50 = GetUnitStruct(gUnknown_0203A958.subjectIndex);

	PrepareArena2(gUnknown_03004E50);

	sub_802CD64(gUnknown_03004E50);
	BeginBattleAnimations();

	gLCDControlBuffer.dispcnt.bg0_on = FALSE;
	gLCDControlBuffer.dispcnt.bg1_on = FALSE;
	gLCDControlBuffer.dispcnt.bg2_on = FALSE;
	gLCDControlBuffer.dispcnt.bg3_on = FALSE;
	gLCDControlBuffer.dispcnt.obj_on = FALSE;

	RefreshFogAndUnitMaps();

	gUnknown_0202E4D8[gUnknown_0203A958.yMove][gUnknown_0203A958.xMove] = 0;

	SMS_UpdateFromGameData();

	Proc_GotoLabel((struct Proc*)(mapMain), 10);

	sub_80B578C();
}

void sub_8031474(struct BMapMainProc* mapMain) {
	RefreshFogAndUnitMaps();
	SMS_UpdateFromGameData();

	gLCDControlBuffer.dispcnt.bg0_on = FALSE;
	gLCDControlBuffer.dispcnt.bg1_on = FALSE;
	gLCDControlBuffer.dispcnt.bg2_on = FALSE;
	gLCDControlBuffer.dispcnt.bg3_on = FALSE;
	gLCDControlBuffer.dispcnt.obj_on = FALSE;

	Proc_GotoLabel((struct Proc*)(mapMain), 8);
}

void sub_80314B0(void) {
	RegisterChapterTimeAndTurnCount(&gUnknown_0202BCF0);

	sub_80B6504();
	sub_80A3DD8();

	gUnknown_0202BCF0.chapterStateBits |= CHAPTER_FLAG_5;
}

void sub_80314D4(void) {
	SetNextGameActionId(3); // TODO: GAME ACTION TYPE DEFINITIONS
	sub_80A4C14();
}

char* GetTacticianNameStringPtr(void) {
	return gUnknown_0202BCF0.playerName;
}

void sub_80314EC(const char* newName) {
	strcpy(gUnknown_0202BCF0.playerName, newName);
}
