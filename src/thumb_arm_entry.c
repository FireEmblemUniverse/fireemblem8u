// Private handoffs: ARM bodies return directly to the original caller.
extern void ArmCall_Clear(void *dst, int count) __attribute__((noreturn));
__attribute__((matching_thumb_arm_entry("ArmCall_Clear")))
void ClearOAMBuffer(void *dst, int count) { ArmCall_Clear(dst, count); }

extern void ArmCall_Tsa(unsigned short *dst, const void *src, int ref) __attribute__((noreturn));
__attribute__((matching_thumb_arm_entry("ArmCall_Tsa")))
void CallARM_FillTileRect(unsigned short *dst, const void *src, int ref) { ArmCall_Tsa(dst, src, ref); }

extern void ArmCall_Fill(unsigned short *dst, int w, int h, int value) __attribute__((noreturn));
__attribute__((matching_thumb_arm_entry("ArmCall_Fill")))
void TileMap_FillRect(unsigned short *dst, int w, int h, int value) { ArmCall_Fill(dst, w, h, value); }

extern void ArmCall_Fade(void) __attribute__((noreturn));
__attribute__((matching_thumb_arm_entry("ArmCall_Fade")))
void CALLARM_ColorFadeTick(void) { ArmCall_Fade(); }

extern void ArmCall_Copy(unsigned short *src, unsigned short *dst, int w, int h) __attribute__((noreturn));
__attribute__((matching_thumb_arm_entry("ArmCall_Copy")))
void TileMap_CopyRect(unsigned short *src, unsigned short *dst, int w, int h) { ArmCall_Copy(src, dst, w, h); }

extern void ArmCall_Checksum(const unsigned *src, int size) __attribute__((noreturn));
__attribute__((matching_thumb_arm_entry("ArmCall_Checksum")))
unsigned ComputeChecksum32(const unsigned *src, int size) { ArmCall_Checksum(src, size); }
