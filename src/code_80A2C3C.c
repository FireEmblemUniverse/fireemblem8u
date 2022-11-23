#include "global.h"
#include "bmsave.h"

extern u8 LoadAndVerifySecureHeaderSW(struct SecureSaveHeader* buf);
extern void SaveSecureHeader(struct SecureSaveHeader* header);

// unitID is CharacterData.number. Should I just use "number" as variable name?
void SetSavedCharacterKnownFlag(s32 charId, struct SecureSaveHeader* buf)
{
  s32 boolLoadedSecureHeader = 0;
  struct SecureSaveHeader tmp_header;
  
  if (charId > 256) {
    return;
  }
  if (buf == NULL) {
    buf = &tmp_header;
    LoadAndVerifySecureHeaderSW(buf);
    boolLoadedSecureHeader = 1;
  }
  
  buf->charKnownFlags[charId >> 3] |= 1 << (charId & 7);
  
  if (boolLoadedSecureHeader) {
    SaveSecureHeader(buf);
  }
}