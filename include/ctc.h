#ifndef GUARD_CTC_H

void sub_8005370(int id, int pa, int pb, int pc, int pd);
void ClearIntermediateOAMBuffers(void);
void RegisterObjectAttributes_SafeMaybe(int layer, int x, int y, const u16* object, int oam2);
void RegisterObjectAttributes(int layer, int xOam1, int yOam0, const u16* object, int oam2);
void FlushIntermediateOAMBuffer(int layer);

// ??? sub_80054B0(???);
// ??? sub_80054F4(???);

#endif  // GUARD_CTC_H
