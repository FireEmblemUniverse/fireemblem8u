#include "global.h"
#include "functions.h"

extern struct Vec2 gUnknown_0203DDE8;

struct Unknown_0203DDEC {
    u8 x;
    u8 y;
    u8 uId;
    u8 tId;
    struct Unknown_0203DDEC* prev;
    struct Unknown_0203DDEC* next;
};

extern struct Unknown_0203DDEC gUnknown_0203DDEC[];

extern int gUnknown_0203E0EC;

void InitTargets(int xRoot, int yRoot) {
    gUnknown_0203DDE8.x = xRoot;
    gUnknown_0203DDE8.y = yRoot;
    gUnknown_0203E0EC = 0;
    return;
}

void AddTarget(int x, int y, int unitId, int tId) {
    gUnknown_0203DDEC[gUnknown_0203E0EC].x = x;
    gUnknown_0203DDEC[gUnknown_0203E0EC].y = y;
    gUnknown_0203DDEC[gUnknown_0203E0EC].uId = unitId;
    gUnknown_0203DDEC[gUnknown_0203E0EC].tId = tId;

    gUnknown_0203E0EC++;
    return;
}