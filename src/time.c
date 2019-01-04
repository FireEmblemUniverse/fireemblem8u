#include "global.h"

extern s8 gUnknown_0300000C;
extern u32 gGameClock;

void sub_8000D00() {
  gUnknown_0300000C = 1;
};

void sub_8000D0C() {
  gUnknown_0300000C = 0;
};

int sub_8000D18() {
  return gUnknown_0300000C;
};

u32 GetGameClock() {
  return gGameClock;
};

void SetGameClock(int newTime) {
  gGameClock = newTime;
};

void IncrementGameClock() {
  gGameClock++;
  if (gGameClock > 215999999) gGameClock = 213840000;
};

u8 ComputeDisplayTime(u32 frameTotal, u16* hours, u16* minutes, u16* seconds) {
  int framesPerMinute;
  int framesPerHour;
  
  *seconds = (frameTotal / 60) % 60;

  framesPerMinute = 3600;
  *minutes = (frameTotal / framesPerMinute) % 60;

  framesPerHour = 216000;
  *hours = frameTotal / framesPerHour;

  return (frameTotal / 30) & 1; // clock `:` on/off boolean
};