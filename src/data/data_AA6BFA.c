#include "global.h"
#include "proc.h"

/* A single secondary-OAM object as consumed by PutSpriteExt / CallARM_PushToSecondaryOAM. */
struct OamObject
{
    u16 oam0;
    u16 oam1;
    u16 oam2;
} __attribute__((packed));

/* A sprite object list: a count followed by `count` packed OAM objects. */
struct OamObjectList
{
    u16 count;
    struct OamObject objects[0];
} __attribute__((packed));

void OpAnimScrollBg3Loop(struct Proc * proc);
void OpAnimDarkenBg2Init(struct Proc * proc);
void OpAnimDarkenBg2In(struct Proc * proc);
void OpAnimRestoreColorEffectsOnEnd(struct Proc * proc);
void OpAnimDarkenBg2OutInit(struct Proc * proc);
void OpAnimDarkenBg2Out(struct Proc * proc);
void OpAnimRestoreColorEffectsOnEnd2(struct Proc * proc);

struct ProcCmd ProcScr_OpAnimScrollBg3[] =
{
    PROC_REPEAT(OpAnimScrollBg3Loop),
    PROC_END,
};

struct ProcCmd ProcScr_OpAnimDarkenBg2In[] =
{
    PROC_SET_END_CB(OpAnimRestoreColorEffectsOnEnd),
    PROC_CALL(OpAnimDarkenBg2Init),
    PROC_REPEAT(OpAnimDarkenBg2In),
    PROC_END,
};

struct ProcCmd ProcScr_OpAnimDarkenBg2Out[] =
{
    PROC_SET_END_CB(OpAnimRestoreColorEffectsOnEnd2),
    PROC_CALL(OpAnimDarkenBg2OutInit),
    PROC_REPEAT(OpAnimDarkenBg2Out),
    PROC_END,
};

u16 Obj_OpanimClassReelUnitSprite[] = INCBIN_U16("graphics/misc/gUnknown_08AA709C.4bpp");

u16 Obj_OpanimTitleFlyInSeg1ObjWindow[] = INCBIN_U16("graphics/misc/gUnknown_08AA70BC.4bpp");

struct OamObjectList Obj_OpanimTitleFlyInSeg2ObjWindow =
{
    2,
    {
        { 0x0000, 0xC000, 0x03C0 },
        { 0x8000, 0xC040, 0x03C0 },
    },
};

struct OamObjectList Obj_OpanimTitleFlyInSeg3ObjWindow =
{
    7,
    {
        { 0x4000, 0xC000, 0x03C0 },
        { 0x0000, 0x8040, 0x03C0 },
        { 0x8000, 0x8060, 0x03C0 },
        { 0x4020, 0x8000, 0x03C0 },
        { 0x4020, 0x8020, 0x03C0 },
        { 0x4020, 0x8040, 0x03C0 },
        { 0x0020, 0x4060, 0x03C0 },
    },
};

struct OamObjectList Obj_OpanimTitleFlyInSeg4ObjWindow =
{
    3,
    {
        { 0x0000, 0xC000, 0x03C0 },
        { 0x4040, 0x8000, 0x03C0 },
        { 0x4040, 0x8020, 0x03C0 },
    },
};

struct OamObjectList Obj_OpanimTitleFlyInSeg10ObjWindow =
{
    8,
    {
        { 0x8000, 0xC000, 0x03C0 },
        { 0x8000, 0x8020, 0x03C0 },
        { 0x8020, 0x8020, 0x03C0 },
        { 0x8000, 0x4030, 0x03C0 },
        { 0x8020, 0x4030, 0x03C0 },
        { 0x4040, 0x8000, 0x03C0 },
        { 0x0040, 0x4020, 0x03C0 },
        { 0x8040, 0x0030, 0x03C0 },
    },
};

struct OamObjectList Obj_OpanimTitleFlyInSeg9ObjWindow =
{
    9,
    {
        { 0x4000, 0xC000, 0x03C0 },
        { 0x4000, 0xC040, 0x03C0 },
        { 0x4000, 0xC080, 0x03C0 },
        { 0x4020, 0x8000, 0x03C0 },
        { 0x4020, 0x8020, 0x03C0 },
        { 0x4020, 0x8040, 0x03C0 },
        { 0x4020, 0x8060, 0x03C0 },
        { 0x4020, 0x8080, 0x03C0 },
        { 0x4020, 0x80A0, 0x03C0 },
    },
};

struct
{
    u16 count;
    struct OamObject objects[8];
    u16 terminator;
} __attribute__((packed)) Obj_OpanimTitleFlyInSeg12ObjWindow =
{
    8,
    {
        { 0x0000, 0xC000, 0x03C0 },
        { 0x8000, 0xC040, 0x03C0 },
        { 0x8000, 0x8060, 0x03C0 },
        { 0x8020, 0x8060, 0x03C0 },
        { 0x4040, 0x8000, 0x03C0 },
        { 0x4040, 0x8020, 0x03C0 },
        { 0x4040, 0x8040, 0x03C0 },
        { 0x0040, 0x4060, 0x03C0 },
    },
    0x0000,
};
