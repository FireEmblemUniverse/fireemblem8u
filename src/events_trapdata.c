#include "global.h"
#include "bmtrick.h"
#include "bmtrap.h"
#include "eventcall.h"
#include "constants/items.h"

CONST_DATA u8 TrapData_Event_Prologue[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_089ED9A9[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_089ED9AA[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch1[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch2[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch3[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_089ED9AE[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch4[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch5[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch5x[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_089ED9B2[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_089ED9B3[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_089ED9B4[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_089ED9B5[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch6[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch7[] = {
    /* type */ TRAP_BALLISTA,
    /* xPos */ 17,
    /* yPos */ 8,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_BALLISTA,
    /* xPos */ 2,
    /* yPos */ 10,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_NONE
};

// 0x89ED9C4
CONST_DATA u8 TrapData_Event_089ED9C4[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C5
CONST_DATA u8 TrapData_Event_Ch8[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C6
CONST_DATA u8 TrapData_Event_089ED9C6[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C7
CONST_DATA u8 TrapData_Event_089ED9C7[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C8
CONST_DATA u8 TrapData_Event_Ch9a[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C9
CONST_DATA u8 TrapData_Event_089ED9C9[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9CA
CONST_DATA u8 TrapData_Event_089ED9CA[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9CB
CONST_DATA u8 TrapData_Event_089ED9CB[] = {
    /* type */ TRAP_BALLISTA,
    /* xPos */ 14,
    /* yPos */ 3,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_BALLISTA,
    /* xPos */ 16,
    /* yPos */ 3,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_BALLISTA,
    /* xPos */ 4,
    /* yPos */ 23,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_NONE
};

// 0x89ED9DE
CONST_DATA u8 TrapData_Event_089ED9DE[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9DF
CONST_DATA u8 TrapData_Event_089ED9DF[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9E0
CONST_DATA u8 TrapData_Event_089ED9E0[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9E1
CONST_DATA u8 TrapData_Event_089ED9E1[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9E2
CONST_DATA u8 TrapData_Event_089ED9E2[] = {
    /* type */ TRAP_BALLISTA,
    /* xPos */ 11,
    /* yPos */ 13,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_BALLISTA,
    /* xPos */ 17,
    /* yPos */ 7,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_BALLISTA,
    /* xPos */ 12,
    /* yPos */ 3,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_NONE
};

// 0x89ED9F5
CONST_DATA u8 TrapData_Event_089ED9F5[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9F6
CONST_DATA u8 TrapData_Event_089ED9F6[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9F7
CONST_DATA u8 TrapData_Event_089ED9F7[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9F8
CONST_DATA u8 TrapData_Event_089ED9F8[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9F9
CONST_DATA u8 TrapData_Event_089ED9F9[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FA
CONST_DATA u8 TrapData_Event_089ED9FA[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FB
CONST_DATA u8 TrapData_Event_089ED9FB[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FC
CONST_DATA u8 TrapData_Event_089ED9FC[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FD
CONST_DATA u8 TrapData_Event_089ED9FD[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FE
CONST_DATA u8 TrapData_Event_089ED9FE[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FF
CONST_DATA u8 TrapData_Event_089ED9FF[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA00
CONST_DATA u8 TrapData_Event_089EDA00[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA01
CONST_DATA u8 TrapData_Event_089EDA01[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA02
CONST_DATA u8 TrapData_Event_089EDA02[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA03
CONST_DATA u8 TrapData_Event_089EDA03[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA04
CONST_DATA u8 TrapData_Event_089EDA04[] = {
    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 7,
    /* yPos */ 13,
    /* subt */ 0,
    /* cnt  */ 3,
    /* turn */ 4,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 7,
    /* yPos */ 0,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 9,
    /* yPos */ 1,
    /* subt */ 0,
    /* cnt  */ 6,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 10,
    /* yPos */ 0,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 6,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 4,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 21,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 6,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 22,
    /* yPos */ 5,
    /* subt */ 0,
    /* cnt  */ 6,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 22,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 20,
    /* yPos */ 14,
    /* subt */ 0,
    /* cnt  */ 3,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 21,
    /* yPos */ 15,
    /* subt */ 0,
    /* cnt  */ 4,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 19,
    /* yPos */ 16,
    /* subt */ 0,
    /* cnt  */ 4,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 19,
    /* yPos */ 26,
    /* subt */ 0,
    /* cnt  */ 4,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 9,
    /* yPos */ 17,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 4,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 8,
    /* yPos */ 17,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 4,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 8,
    /* yPos */ 18,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 4,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 12,
    /* yPos */ 18,
    /* subt */ 0,
    /* cnt  */ 2,
    /* turn */ 4,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 19,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 17,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 18,
    /* yPos */ 11,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 19,
    /* yPos */ 14,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 19,
    /* yPos */ 15,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 20,
    /* yPos */ 15,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 20,
    /* yPos */ 16,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 22,
    /* yPos */ 21,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 21,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 22,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 15,
    /* yPos */ 21,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 16,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 14,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 14,
    /* yPos */ 23,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 9,
    /* yPos */ 12,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 8,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 6,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 8,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 20,
    /* yPos */ 25,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 21,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 20,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 18,
    /* yPos */ 6,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 14,
    /* yPos */ 20,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 15,
    /* yPos */ 23,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 17,
    /* yPos */ 23,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 16,
    /* yPos */ 24,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 21,
    /* yPos */ 23,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 22,
    /* yPos */ 19,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 21,
    /* yPos */ 20,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 9,
    /* yPos */ 11,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 18,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 18,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 19,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 7,
    /* yPos */ 2,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 13,
    /* yPos */ 3,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 4,
    /* yPos */ 1,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 13,
    /* yPos */ 5,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 7,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 20,
    /* yPos */ 26,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 8,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 21,
    /* yPos */ 5,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_NONE
};

// 0x89EDB67
CONST_DATA u8 TrapData_Event_089EDB67[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB68
CONST_DATA u8 TrapData_Event_089EDB68[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB69
CONST_DATA u8 TrapData_Event_089EDB69[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6A
CONST_DATA u8 TrapData_Event_089EDB6A[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6B
CONST_DATA u8 TrapData_Event_089EDB6B[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6C
CONST_DATA u8 TrapData_Event_089EDB6C[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6D
CONST_DATA u8 TrapData_Event_089EDB6D[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6E
CONST_DATA u8 TrapData_Event_089EDB6E[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6F
CONST_DATA u8 TrapData_Event_089EDB6F[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB70
CONST_DATA u8 TrapData_Event_089EDB70[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB71
CONST_DATA u8 TrapData_Event_089EDB71[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB72
CONST_DATA u8 TrapData_Event_089EDB72[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB73
CONST_DATA u8 TrapData_Event_089EDB73[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB74
CONST_DATA u8 TrapData_Event_089EDB74[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB75
CONST_DATA u8 TrapData_Event_089EDB75[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB76
CONST_DATA u8 TrapData_Event_089EDB76[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB77
CONST_DATA u8 TrapData_Event_089EDB77[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB78
CONST_DATA u8 TrapData_Event_089EDB78[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB79
CONST_DATA u8 TrapData_Event_089EDB79[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB7A
CONST_DATA u8 TrapData_Event_089EDB7A[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB7B
CONST_DATA u8 TrapData_Event_089EDB7B[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB7C
CONST_DATA u8 TrapData_Event_089EDB7C[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB7D
CONST_DATA u8 TrapData_Event_089EDB7D[] = {
    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 7,
    /* yPos */ 13,
    /* subt */ 0,
    /* cnt  */ 3,
    /* turn */ 4,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 7,
    /* yPos */ 0,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 9,
    /* yPos */ 1,
    /* subt */ 0,
    /* cnt  */ 6,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 10,
    /* yPos */ 0,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 6,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 4,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 21,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 6,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 22,
    /* yPos */ 5,
    /* subt */ 0,
    /* cnt  */ 6,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 22,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 20,
    /* yPos */ 14,
    /* subt */ 0,
    /* cnt  */ 3,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 21,
    /* yPos */ 15,
    /* subt */ 0,
    /* cnt  */ 4,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 19,
    /* yPos */ 16,
    /* subt */ 0,
    /* cnt  */ 4,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 19,
    /* yPos */ 26,
    /* subt */ 0,
    /* cnt  */ 4,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 9,
    /* yPos */ 17,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 4,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 8,
    /* yPos */ 17,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 4,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 8,
    /* yPos */ 18,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 4,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 12,
    /* yPos */ 18,
    /* subt */ 0,
    /* cnt  */ 2,
    /* turn */ 4,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 19,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 17,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 18,
    /* yPos */ 11,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 19,
    /* yPos */ 14,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 19,
    /* yPos */ 15,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 20,
    /* yPos */ 15,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 20,
    /* yPos */ 16,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 22,
    /* yPos */ 21,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 21,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 22,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 15,
    /* yPos */ 21,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 16,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 14,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 14,
    /* yPos */ 23,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 9,
    /* yPos */ 12,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 8,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 6,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 8,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 20,
    /* yPos */ 25,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 21,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 20,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 18,
    /* yPos */ 6,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 14,
    /* yPos */ 20,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 15,
    /* yPos */ 23,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 17,
    /* yPos */ 23,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 16,
    /* yPos */ 24,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 21,
    /* yPos */ 23,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 22,
    /* yPos */ 19,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 21,
    /* yPos */ 20,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 9,
    /* yPos */ 11,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 18,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 18,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 19,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 7,
    /* yPos */ 2,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 13,
    /* yPos */ 3,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 4,
    /* yPos */ 1,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 13,
    /* yPos */ 5,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 7,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 20,
    /* yPos */ 26,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 8,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 21,
    /* yPos */ 5,
    /* subt */ 0,
    /* cnt  */ 5,
    /* turn */ 5,

    /* type */ TRAP_NONE
};

// 0x89EDCE0
CONST_DATA u8 TrapData_Event_089EDCE0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE1
CONST_DATA u8 TrapData_Event_089EDCE1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE2
CONST_DATA u8 TrapData_Event_089EDCE2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE3
CONST_DATA u8 TrapData_Event_089EDCE3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE4
CONST_DATA u8 TrapData_Event_089EDCE4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE5
CONST_DATA u8 TrapData_Event_089EDCE5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE6
CONST_DATA u8 TrapData_Event_089EDCE6[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE7
CONST_DATA u8 TrapData_Event_089EDCE7[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE8
CONST_DATA u8 TrapData_Event_089EDCE8[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE9
CONST_DATA u8 TrapData_Event_089EDCE9[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCEA
CONST_DATA u8 TrapData_Event_089EDCEA[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCEB
CONST_DATA u8 TrapData_Event_089EDCEB[] = {
    /* type */ TRAP_LIGHTARROW,
    /* xPos */ 3,
    /* yPos */ 0,
    /* subt */ 0,
    /* cnt  */ 3,
    /* turn */ 2,

    /* type */ TRAP_LIGHTARROW,
    /* xPos */ 19,
    /* yPos */ 0,
    /* subt */ 0,
    /* cnt  */ 2,
    /* turn */ 2,

    /* type */ TRAP_NONE
};

// 0x89EDCF8
CONST_DATA u8 TrapData_Event_089EDCF8[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCF9
CONST_DATA u8 TrapData_Event_089EDCF9[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCFA
CONST_DATA u8 TrapData_Event_089EDCFA[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCFB
CONST_DATA u8 TrapData_Event_089EDCFB[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCFC
CONST_DATA u8 TrapData_Event_089EDCFC[] = {
    /* type */ TRAP_GAS,
    /* xPos */ 9,
    /* yPos */ 10,
    /* subt */ 3,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 7,
    /* yPos */ 15,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 4,
    /* yPos */ 11,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 8,
    /* yPos */ 10,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 7,
    /* yPos */ 5,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 16,
    /* yPos */ 12,
    /* subt */ 1,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 16,
    /* yPos */ 8,
    /* subt */ 1,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 18,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 19,
    /* yPos */ 16,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 0,
    /* yPos */ 10,
    /* subt */ 1,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 13,
    /* yPos */ 16,
    /* subt */ 3,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 14,
    /* yPos */ 19,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 0,
    /* yPos */ 12,
    /* subt */ 1,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 10,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 12,
    /* yPos */ 22,
    /* subt */ 3,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 7,
    /* yPos */ 1,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 9,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 2,
    /* yPos */ 6,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 10,
    /* yPos */ 3,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 12,
    /* yPos */ 3,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_GAS,
    /* xPos */ 14,
    /* yPos */ 3,
    /* subt */ 2,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_NONE
};

// 0x89EDD7B
CONST_DATA u8 TrapData_Event_089EDD7B[] = {
    /* type */ TRAP_NONE
};

// 0x89EDD7C
CONST_DATA u8 TrapData_Event_089EDD7C[] = {
    /* type */ TRAP_NONE
};

// 0x89EDD7D
CONST_DATA u8 TrapData_Event_089EDD7D[] = {
    /* type */ TRAP_NONE
};

// 0x89EDD7E
CONST_DATA u8 TrapData_Event_089EDD7E[] = {
    /* type */ TRAP_FIRETILE,
    /* xPos */ 12,
    /* yPos */ 3,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 13,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 12,
    /* yPos */ 5,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 11,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 12,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 12,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 12,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 11,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 17,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 16,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 16,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 15,
    /* yPos */ 9,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 14,
    /* yPos */ 8,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 14,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 16,
    /* yPos */ 12,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 11,
    /* yPos */ 15,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 13,
    /* yPos */ 16,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 13,
    /* yPos */ 19,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 13,
    /* yPos */ 20,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 15,
    /* yPos */ 19,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 16,
    /* yPos */ 20,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 17,
    /* yPos */ 21,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 15,
    /* yPos */ 21,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 12,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 11,
    /* yPos */ 21,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 9,
    /* yPos */ 21,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 22,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 14,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 6,
    /* yPos */ 13,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 5,
    /* yPos */ 13,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 0,
    /* yPos */ 12,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 1,
    /* yPos */ 11,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 0,
    /* yPos */ 10,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 0,
    /* yPos */ 7,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 1,
    /* yPos */ 6,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 3,
    /* yPos */ 6,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 4,
    /* yPos */ 6,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 10,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 5,
    /* yPos */ 6,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 2,
    /* yPos */ 6,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 6,
    /* yPos */ 1,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_NONE
};

// 0x89EDE75
CONST_DATA u8 TrapData_Event_089EDE75[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE76
CONST_DATA u8 TrapData_Event_089EDE76[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE77
CONST_DATA u8 TrapData_Event_089EDE77[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE78
CONST_DATA u8 TrapData_Event_089EDE78[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE79
CONST_DATA u8 TrapData_Event_089EDE79[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7A
CONST_DATA u8 TrapData_Event_089EDE7A[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7B
CONST_DATA u8 TrapData_Event_089EDE7B[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7C
CONST_DATA u8 TrapData_Event_089EDE7C[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7D
CONST_DATA u8 TrapData_Event_089EDE7D[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7E
CONST_DATA u8 TrapData_Event_089EDE7E[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7F
CONST_DATA u8 TrapData_Event_089EDE7F[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE80
CONST_DATA u8 TrapData_Event_089EDE80[] = {
    /* type */ TRAP_BALLISTA,
    /* xPos */ 12,
    /* yPos */ 0,
    /* subt */ ITEM_BALLISTA_REGULAR,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_BALLISTA,
    /* xPos */ 12,
    /* yPos */ 2,
    /* subt */ ITEM_BALLISTA_LONG,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_BALLISTA,
    /* xPos */ 12,
    /* yPos */ 4,
    /* subt */ ITEM_BALLISTA_KILLER,
    /* cnt  */ 0,
    /* turn */ 0,

    /* type */ TRAP_GORGON_EGG,
    /* xPos */ 7,
    /* yPos */ 19,
    /* subt */ 160,
    /* cnt  */ 3,
    /* turn */ 1,

    /* type */ TRAP_NONE
};

// 0x89EDE99
CONST_DATA u8 TrapData_Event_PrologueHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE9A
CONST_DATA u8 TrapData_Event_089EDE9A[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE9B
CONST_DATA u8 TrapData_Event_089EDE9B[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE9C
CONST_DATA u8 TrapData_Event_Ch1Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE9D
CONST_DATA u8 TrapData_Event_Ch2Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE9E
CONST_DATA u8 TrapData_Event_Ch3Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE9F
CONST_DATA u8 TrapData_Event_089EDE9F[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA0
CONST_DATA u8 TrapData_Event_Ch4Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA1
CONST_DATA u8 TrapData_Event_Ch5Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA2
CONST_DATA u8 TrapData_Event_Ch5xHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA3
CONST_DATA u8 TrapData_Event_089EDEA3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA4
CONST_DATA u8 TrapData_Event_089EDEA4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA5
CONST_DATA u8 TrapData_Event_089EDEA5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA6
CONST_DATA u8 TrapData_Event_089EDEA6[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA7
CONST_DATA u8 TrapData_Event_Ch6Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA8
CONST_DATA u8 TrapData_Event_Ch7Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA9
CONST_DATA u8 TrapData_Event_089EDEA9[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAA
CONST_DATA u8 TrapData_Event_Ch8Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAB
CONST_DATA u8 TrapData_Event_089EDEAB[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAC
CONST_DATA u8 TrapData_Event_089EDEAC[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAD
CONST_DATA u8 TrapData_Event_Ch9aHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAE
CONST_DATA u8 TrapData_Event_089EDEAE[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAF
CONST_DATA u8 TrapData_Event_089EDEAF[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB0
CONST_DATA u8 TrapData_Event_089EDEB0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB1
CONST_DATA u8 TrapData_Event_089EDEB1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB2
CONST_DATA u8 TrapData_Event_089EDEB2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB3
CONST_DATA u8 TrapData_Event_089EDEB3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB4
CONST_DATA u8 TrapData_Event_089EDEB4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB5
CONST_DATA u8 TrapData_Event_089EDEB5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB6
CONST_DATA u8 TrapData_Event_089EDEB6[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB7
CONST_DATA u8 TrapData_Event_089EDEB7[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB8
CONST_DATA u8 TrapData_Event_089EDEB8[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB9
CONST_DATA u8 TrapData_Event_089EDEB9[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBA
CONST_DATA u8 TrapData_Event_089EDEBA[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBB
CONST_DATA u8 TrapData_Event_089EDEBB[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBC
CONST_DATA u8 TrapData_Event_089EDEBC[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBD
CONST_DATA u8 TrapData_Event_089EDEBD[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBE
CONST_DATA u8 TrapData_Event_089EDEBE[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBF
CONST_DATA u8 TrapData_Event_089EDEBF[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC0
CONST_DATA u8 TrapData_Event_089EDEC0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC1
CONST_DATA u8 TrapData_Event_089EDEC1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC2
CONST_DATA u8 TrapData_Event_089EDEC2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC3
CONST_DATA u8 TrapData_Event_089EDEC3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC4
CONST_DATA u8 TrapData_Event_089EDEC4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC5
CONST_DATA u8 TrapData_Event_089EDEC5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC6
CONST_DATA u8 TrapData_Event_089EDEC6[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC7
CONST_DATA u8 TrapData_Event_089EDEC7[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC8
CONST_DATA u8 TrapData_Event_089EDEC8[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC9
CONST_DATA u8 TrapData_Event_089EDEC9[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECA
CONST_DATA u8 TrapData_Event_089EDECA[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECB
CONST_DATA u8 TrapData_Event_089EDECB[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECC
CONST_DATA u8 TrapData_Event_089EDECC[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECD
CONST_DATA u8 TrapData_Event_089EDECD[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECE
CONST_DATA u8 TrapData_Event_089EDECE[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECF
CONST_DATA u8 TrapData_Event_089EDECF[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED0
CONST_DATA u8 TrapData_Event_089EDED0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED1
CONST_DATA u8 TrapData_Event_089EDED1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED2
CONST_DATA u8 TrapData_Event_089EDED2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED3
CONST_DATA u8 TrapData_Event_089EDED3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED4
CONST_DATA u8 TrapData_Event_089EDED4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED5
CONST_DATA u8 TrapData_Event_089EDED5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED6
CONST_DATA u8 TrapData_Event_089EDED6[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED7
CONST_DATA u8 TrapData_Event_089EDED7[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED8
CONST_DATA u8 TrapData_Event_089EDED8[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED9
CONST_DATA u8 TrapData_Event_089EDED9[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDA
CONST_DATA u8 TrapData_Event_089EDEDA[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDB
CONST_DATA u8 TrapData_Event_089EDEDB[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDC
CONST_DATA u8 TrapData_Event_089EDEDC[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDD
CONST_DATA u8 TrapData_Event_089EDEDD[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDE
CONST_DATA u8 TrapData_Event_089EDEDE[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDF
CONST_DATA u8 TrapData_Event_089EDEDF[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE0
CONST_DATA u8 TrapData_Event_089EDEE0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE1
CONST_DATA u8 TrapData_Event_089EDEE1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE2
CONST_DATA u8 TrapData_Event_089EDEE2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE3
CONST_DATA u8 TrapData_Event_089EDEE3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE4
CONST_DATA u8 TrapData_Event_089EDEE4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE5
CONST_DATA u8 TrapData_Event_089EDEE5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE6
CONST_DATA u8 TrapData_Event_089EDEE6[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE7
CONST_DATA u8 TrapData_Event_089EDEE7[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE8
CONST_DATA u8 TrapData_Event_089EDEE8[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE9
CONST_DATA u8 TrapData_Event_089EDEE9[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEA
CONST_DATA u8 TrapData_Event_089EDEEA[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEB
CONST_DATA u8 TrapData_Event_089EDEEB[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEC
CONST_DATA u8 TrapData_Event_089EDEEC[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEED
CONST_DATA u8 TrapData_Event_089EDEED[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEE
CONST_DATA u8 TrapData_Event_089EDEEE[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEF
CONST_DATA u8 TrapData_Event_089EDEEF[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEF0
CONST_DATA u8 TrapData_Event_089EDEF0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEF1
CONST_DATA u8 TrapData_Event_089EDEF1[] = {
    /* type */ TRAP_FIRETILE,
    /* xPos */ 1,
    /* yPos */ 0,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 0,
    /* yPos */ 1,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 1,
    /* yPos */ 2,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 1,
    /* yPos */ 3,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 0,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 2,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 3,
    /* yPos */ 3,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 3,
    /* yPos */ 1,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 2,
    /* yPos */ 1,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 0,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 5,
    /* yPos */ 2,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 2,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 7,
    /* yPos */ 3,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 6,
    /* yPos */ 3,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 6,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 5,
    /* yPos */ 5,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 8,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 9,
    /* yPos */ 4,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 10,
    /* yPos */ 3,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_FIRETILE,
    /* xPos */ 11,
    /* yPos */ 2,
    /* subt */ 0,
    /* cnt  */ 1,
    /* turn */ 1,

    /* type */ TRAP_NONE
};

// 0x89EDF6A
CONST_DATA u8 TrapData_Event_089EDF6A[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6B
CONST_DATA u8 TrapData_Event_089EDF6B[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6C
CONST_DATA u8 TrapData_Event_089EDF6C[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6D
CONST_DATA u8 TrapData_Event_089EDF6D[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6E
CONST_DATA u8 TrapData_Event_089EDF6E[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6F
CONST_DATA u8 TrapData_Event_089EDF6F[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF70
CONST_DATA u8 TrapData_Event_089EDF70[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF71
CONST_DATA u8 TrapData_Event_089EDF71[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF72
CONST_DATA u8 TrapData_Event_089EDF72[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF73
CONST_DATA u8 TrapData_Event_089EDF73[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF74
CONST_DATA u8 TrapData_Event_089EDF74[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF75
CONST_DATA u8 TrapData_Event_089EDF75[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF76
CONST_DATA u8 TrapData_Event_089EDF76[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF77
CONST_DATA u8 TrapData_Event_089EDF77[] = {
    /* type */ TRAP_NONE
};
