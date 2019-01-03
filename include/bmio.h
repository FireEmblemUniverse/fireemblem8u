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

struct GameCtrlProc {
	PROC_HEADER;
};

struct BMapMainProc {
	PROC_HEADER;

	/* 29 */ u8 pad29[0x54 - 0x29];
	/* 54 */ struct GameCtrlProc* gameCtrl;
};

void SetupGameVBlank6C(void);
void sub_8030174(void);
void BlockGameGraphicsLogic(void);
void UnblockGameGraphicsLogic(void);
void SetupOAMSpliceForWeather(unsigned weatherId);
void sub_8030758(void);
void sub_8030C24(void);
void sub_8030C40(void);
void SetupWeather(unsigned weatherId);

// this may have been two (or more?) source files
// if this is to be split, this the point.

u8 GetTextSpeed(void);
int sub_8030CC0(void);
void sub_8030CF4(int, s8);
void SetupChapter(struct GameCtrlProc* gameCtrl);
void sub_8030F48(void);
// void sub_8030FE4(struct GameCtrlProc* gameCtrl); // unused
// void sub_80310F8(void); // unused
// void sub_8031154(void); // unused
void sub_80311A8(void);
struct BMapMainProc* MakeBMAPMAIN(struct GameCtrlProc* gameCtrl);
void sub_80311F0(void);
void sub_8031214(void);
void sub_8031300(struct BMapMainProc* mapMain);
void sub_803133C(struct BMapMainProc* mapMain);
void sub_80313BC(struct BMapMainProc* mapMain);
void sub_80313F8(struct BMapMainProc* mapMain);
void sub_8031474(struct BMapMainProc* mapMain);
// void sub_80314B0(void); // unused
// void sub_80314D4(void); // unused
char* GetTacticianNameStringPtr(void);
void sub_80314EC(const char* newName);

#endif // GUARD_BMIO_H
