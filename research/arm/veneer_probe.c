extern void ClearOam(void), TmApplyTsa(void), TmFillRect(void), ColorFadeTick(void), TmCopyRect(void), Checksum32(void);
void probe(void) { ClearOam(); TmApplyTsa(); TmFillRect(); ColorFadeTick(); TmCopyRect(); Checksum32(); }
