#ifndef GUARD_BM_UDISP_H
#define GUARD_BM_UDISP_H

#define UNITSPRITE_MAX 0xD0
#define UNITSPRITE_ID_BITS 7

extern u16* sPoisonIconSprites[12];
extern u16* sSleepIconSprites[7];
extern u16* sBerserkIconSprites[9];
extern u16* sSilenceIconSprites[18];

extern u16 sSprite_Bmudisp_0[7];

// ??? RequestUnitSpriteSheetSync(???);
void ApplyUnitSpritePalettes(void);
// ??? ApplyUnitSpriteSepiaPalette(???);
void ResetUnitSprites(void);
// ??? ResetUnitSpritesB(???);
int StartUiSMS(int smsId, int frameId);
int StartWorldMapSMS(int smsId, int frameId, int slot);
int UseUnitSprite(u32);
int ApplyUnitSpriteUiImage16x16(int, u32);
int ApplyUnitSpriteImage16x16(int, u32);
int ApplyUnitSpriteImage16x32(int, u32);
int ApplyUnitSpriteImage32x32(int, u32);
void TornOutUnitSprite(struct Unit * unit, int time);
void SyncUnitSpriteSheet(void);
void ForceSyncUnitSpriteSheet(void);
void SetStandingMuFacingFast(int id, u8* ptr);
void SetStandingMuFacing(int id, u8* ptr);
void SetStandingMuFacingWM(int frameId, u8* dst);
int GetUnitDisplayedSpritePalette(const struct Unit * unit);
int GetUnitSpritePalette(const struct Unit* unit);
void RefreshUnitSprites(void);
struct SMSHandle * AddUnitSprite(int);
void PutUnitSpritesOam(void);
void PutChapterMarkedTileIconOam(void);
void PutUnitSpriteIconsOam(void);
// ??? ResetUnitSpriteHoverCursor(???);
void ResetUnitSpriteHover(void);
void UnitSpriteHoverUpdate(void);
s8 IsUnitSpriteHoverEnabledAt(int, int);
void PutUnitSprite(int, int, int, struct Unit*);
void PutUnitSpriteForClassId(int layer, int x, int y, u16 oam2, int class);
// ??? PutWindowUnitSpriteForClassId(???);
void PutStandingMuSprite(int layer, int x, int y, u16 oam2base, int classId, int id);
void PutUiUnitSprite(int layer, int x, int y, int oam2, struct Unit* unit);
// void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, s8 isBlend);
void PutBlendWindowUnitSprite(int, int, int, int, struct Unit*);
// ??? ClearUnitSpriteList(???);
void HideUnitSprite(struct Unit* unit);
void ShowUnitSprite(struct Unit* unit);
u8 GetUnitSpriteHideFlag(struct Unit*);
// ??? TornOutChr(???);


#endif  // GUARD_BM_UDISP_H
