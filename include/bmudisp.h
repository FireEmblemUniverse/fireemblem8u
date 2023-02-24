#ifndef GUARD_BM_UDISP_H
#define GUARD_BM_UDISP_H

// ??? sub_8026618(???);
void SetupMapSpritesPalettes(void);
// ??? sub_8026670(???);
void ResetUnitSprites(void);
// ??? ResetUnitSpritesB(???);
int SMS_80266F0(int smsId, int frameId);
// ??? SMS_SomethingGmapUnit(???);
int UseUnitSprite(u32);
int ApplyUnitSpriteImage16x16(int, u32);
int SomethingSMS_16x16(int, u32);
int ApplyUnitSpriteImage16x32(int, u32);
int ApplyUnitSpriteImage32x32(int, u32);
void sub_8026C1C(struct Unit*, int);
void SyncUnitSpriteSheet(void);
void ForceSyncUnitSpriteSheet(void);
void sub_8026FF4(int id, u8* ptr);
void sub_8027068(int id, u8* ptr);
// ??? sub_80270DC(???);
// ??? GetUnitDisplayedSpritePalette(???);
int GetUnitSpritePalette(const struct Unit* unit);
void RefreshUnitSprites(void);
struct SMSHandle* AddUnitSprite(int);
void PutUnitSpritesOam(void);
// ??? PutChapterMarkedTileIconOam(???);
void PutUnitSpriteIconsOam(void);
// ??? sub_8027A30(???);
void ResetUnitSpriteHover(void);
void UnitSpriteHoverUpdate(void);
s8 IsUnitSpriteHoverEnabledAt(int, int);
void PutUnitSprite(int, int, int, struct Unit*);
void PutUnitSpriteForClassId(int layer, int x, int y, u16 oam2, int class);
// ??? sub_8027CFC(???);
void sub_8027DB4(int layer, int x, int y, u16 oam2base, int classId, int id);
void sub_8027E4C(int layer, int x, int y, int oam2, struct Unit* unit);
// ??? SMS_DisplayOne(???);
void PutBlendWindowUnitSprite(int, int, int, int, struct Unit*);
// ??? sub_8028100(???);
void HideUnitSprite(struct Unit* unit);
void ShowUnitSprite(struct Unit* unit);
u8 GetUnitSpriteHideFlag(struct Unit*);
// ??? sub_8028160(???);


#endif  // GUARD_BM_UDISP_H
