/* Private ARM continuations return to the original Thumb caller. */
extern void PayloadArmClear(void *, int) __attribute__((noreturn));
__attribute__((matching_thumb_arm_entry("PayloadArmClear")))
void ClearOam_thm(void *dst, int count) { PayloadArmClear(dst, count); }
extern void PayloadArmChecksum(const unsigned short *, int) __attribute__((noreturn));
__attribute__((matching_thumb_arm_entry("PayloadArmChecksum")))
unsigned Checksum32_thm(const unsigned short *src, int count) { PayloadArmChecksum(src, count); }
