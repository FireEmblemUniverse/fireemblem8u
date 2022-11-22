#include "global.h"
#include "bmsave.h"

extern u8 LoadAndVerifySecureHeaderSW(struct SecureSaveHeader* buf);
extern void SaveSecureHeader(struct SecureSaveHeader* header);

// unitID is CharacterData.number. Should I just use "number" as variable name?
void SetSomeUnitStatThingUnlockMaybeIdk(s32 unitID, struct SecureSaveHeader* buf)
{
  s32 boolLoadedSecureHeader = 0, groupID, unitIDInGroup;
  u8* loc;
  struct SecureSaveHeader tmp_header;
  
  if (unitID > 256) {
    return;
  }
  if (buf == NULL) {
    buf = &tmp_header;
    LoadAndVerifySecureHeaderSW(buf);
    boolLoadedSecureHeader = 1;
  }
  
  groupID = unitID >> 3; // Units are divided into 32 groups containing 8 units each.
  loc = &buf->unk40[0];
  loc += groupID;
  unitIDInGroup = unitID & 0x7; // First three bits.
  
  *loc |= 1 << unitIDInGroup; // Indicates specific unit is saved?
  
  if (boolLoadedSecureHeader) {
    SaveSecureHeader(buf);
  }
  return;
}