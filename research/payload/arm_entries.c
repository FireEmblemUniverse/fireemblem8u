extern void ClearOam(void *, int);
extern unsigned Checksum32(const unsigned short *, int);
__attribute__((section(".text.payload_arm_clear")))
void PayloadArmClear(void *dst, int count) { ClearOam(dst, count); }
__attribute__((section(".text.payload_arm_checksum")))
unsigned PayloadArmChecksum(const unsigned short *src, int count) { return Checksum32(src, count); }
