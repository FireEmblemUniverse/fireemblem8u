#ifndef GUARD_BMIO_H
#define GUARD_BMIO_H

enum {
	BM_BGPAL_6 = 6,
	BM_BGPAL_TILESET_BASE = 7,
};

enum {
	BM_OBJPAL_1  = 1,
	BM_OBJPAL_10 = 10,
};

struct TileGfxAnim {
	/* 00 */ u16         time;
	/* 02 */ u16         size;
	/* 04 */ const void* data;
};

struct TilePalAnim {
	/* 00 */ const void* data;
	/* 04 */ u8          time;
	/* 05 */ u8          colorCount;
	/* 06 */ u8          colorStart;
};

struct BMVSyncProc {
	PROC_HEADER;

	/* 2C */ const struct TileGfxAnim* tileGfxAnimStart;
	/* 30 */ const struct TileGfxAnim* tileGfxAnimCurrent;

	/* 34 */ short tileGfxAnimClock;
	/* 36 */ short tilePalAnimClock;

	/* 38 */ const struct TilePalAnim* tilePalAnimStart;
	/* 3C */ const struct TilePalAnim* tilePalAnimCurrent;
};

struct GameCtrlProc {
	PROC_HEADER;
};

struct BMapMainProc {
	PROC_HEADER;

	/* 29 */ u8 pad29[0x54 - 0x29];
	/* 54 */ struct GameCtrlProc* gameCtrl;
};

void sub_803005C(struct BMVSyncProc* proc);
void sub_80300A4(struct BMVSyncProc* proc);
// ??? SetupGameVBlank6C_TileAnimations(???);
void GameVBlank6C_Destructor(struct BMVSyncProc* proc);
void GameVBlank6C_Loop(struct BMVSyncProc* proc);
// ??? SetupGameVBlank6C(???);
// ??? sub_8030174(???);
// ??? BlockGameGraphicsLogic(???);
void UnblockGameGraphicsLogic(void);
// ??? SetupOAMSpliceForWeather(???);
// ??? sub_8030240(???);
// ??? sub_8030258(???);
// ??? sub_80302D0(???);
// ??? sub_8030390(???);
// ??? sub_80303F4(???);
// ??? sub_8030474(???);
// ??? sub_80304E4(???);
// ??? sub_8030540(???);
// ??? sub_80305FC(???);
// ??? sub_8030674(???);
// ??? sub_80306CC(???);
// ??? nullsub_12(???);
// ??? sub_8030714(???);
// ??? sub_8030758(???);
// ??? sub_80307D8(???);
// ??? sub_8030868(???);
// ??? sub_80308CC(???);
// ??? sub_80308DC(???);
// ??? sub_8030948(???);
// ??? sub_80309E0(???);
// ??? sub_80309F0(???);
// ??? sub_8030A58(???);
// ??? sub_8030A84(???);
// ??? sub_8030B00(???);
// ??? SetupWeatherGraphics_Maybe(???);
void UpdateWeatherGraphics(void);
void sub_8030C0C(void);
// ??? sub_8030C24(???);
// ??? sub_8030C40(???);
// ??? SetupWeather(???);
// ??? GetTextSpeed(???);
int sub_8030CC0(void);
// ??? sub_8030CF4(???);
// ??? ResetGameState(???);
// ??? SetupChapter(???);
// ??? sub_8030F48(???);
// ??? sub_8030FE4(???);
// ??? sub_80310F8(???);
// ??? sub_8031154(???);
// ??? LoadGameCoreGfx2(???);
// ??? sub_80311A8(???);
struct BMapMainProc* MakeBMAPMAIN(struct GameCtrlProc* gameCtrl);
void sub_80311F0(void); // bm?
// ??? sub_8031214(???);
void sub_8031300(struct BMapMainProc* mapMain);
void sub_803133C(struct BMapMainProc* mapMain);
void sub_80313BC(struct BMapMainProc* mapMain);
void sub_80313F8(struct BMapMainProc* mapMain);
void sub_8031474(struct BMapMainProc* mapMain);
// ??? sub_80314B0(???);
// ??? sub_80314D4(???);
char *GetTacticianNameStringPtr(void);
// ??? sub_80314EC(???);

#endif // GUARD_BMIO_H
