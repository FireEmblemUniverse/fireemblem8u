#include "global.h"
#include "bmtrick.h"
#include "bmtrap.h"
#include "eventcall.h"
#include "constants/items.h"

CONST_DATA u8 TrapData_Event_Prologue[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Prologue_0[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch1_0[] = {
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

CONST_DATA u8 TrapData_Event_Ch3_0[] = {
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

CONST_DATA u8 TrapData_Event_Ch5x_0[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch5x_1[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch6_0[] = {
    TRAP_NONE
};

CONST_DATA u8 TrapData_Event_Ch6_1[] = {
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
CONST_DATA u8 TrapData_Event_Ch7_0[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C5
CONST_DATA u8 TrapData_Event_Ch8[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C6
CONST_DATA u8 TrapData_Event_Ch8_0[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C7
CONST_DATA u8 TrapData_Event_Ch8_1[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C8
CONST_DATA u8 TrapData_Event_Ch9a[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9C9
CONST_DATA u8 TrapData_Event_Ch8_2[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9CA
CONST_DATA u8 TrapData_Event_Ch8_3[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9CB
CONST_DATA u8 TrapData_Event_ch10a[] = {
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
CONST_DATA u8 TrapData_Event_Ch8_4[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9DF
CONST_DATA u8 TrapData_Event_Ch11a[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9E0
CONST_DATA u8 TrapData_Event_Ch8_5[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9E1
CONST_DATA u8 TrapData_Event_Ch12a[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9E2
CONST_DATA u8 TrapData_Event_Ch13a[] = {
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
CONST_DATA u8 TrapData_Event_Ch15A_19[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9F6
CONST_DATA u8 TrapData_Event_Ch15A_20[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9F7
CONST_DATA u8 TrapData_Event_Ch15A_2[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9F8
CONST_DATA u8 TrapData_Event_Ch14a[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9F9
CONST_DATA u8 TrapData_Event_Ch15A_3[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FA
CONST_DATA u8 TrapData_Event_Ch15A_4[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FB
CONST_DATA u8 TrapData_Event_Ch15A_5[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FC
CONST_DATA u8 TrapData_Event_Ch15A_0[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FD
CONST_DATA u8 TrapData_Event_Ch16A_0[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FE
CONST_DATA u8 TrapData_Event_Ch16A_6[] = {
    /* type */ TRAP_NONE
};

// 0x89ED9FF
CONST_DATA u8 TrapData_Event_Ch16A_7[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA00
CONST_DATA u8 TrapData_Event_Ch16A_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA01
CONST_DATA u8 TrapData_Event_Ch17A_4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA02
CONST_DATA u8 TrapData_Event_Ch17A_5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA03
CONST_DATA u8 TrapData_Event_Ch17A_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDA04
CONST_DATA u8 TrapData_Event_Ch18A_0[] = {
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
CONST_DATA u8 TrapData_Event_Ch19A_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB68
CONST_DATA u8 TrapData_Event_Ch19A_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB69
CONST_DATA u8 TrapData_Event_Ch20A_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6A
CONST_DATA u8 TrapData_Event_Ch20A_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6B
CONST_DATA u8 TrapData_Event_Ch21A_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6C
CONST_DATA u8 TrapData_Event_Ch21XA_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6D
CONST_DATA u8 TrapData_Event_Ch9B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6E
CONST_DATA u8 TrapData_Event_Ch9B_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB6F
CONST_DATA u8 TrapData_Event_Ch10B_4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB70
CONST_DATA u8 TrapData_Event_Ch10B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB71
CONST_DATA u8 TrapData_Event_Ch10B_5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB72
CONST_DATA u8 TrapData_Event_Ch11B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB73
CONST_DATA u8 TrapData_Event_Ch11B_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB74
CONST_DATA u8 TrapData_Event_Ch12B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB75
CONST_DATA u8 TrapData_Event_Ch13B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB76
CONST_DATA u8 TrapData_Event_Ch14B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB77
CONST_DATA u8 TrapData_Event_Ch14B_4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB78
CONST_DATA u8 TrapData_Event_Ch14B_5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB79
CONST_DATA u8 TrapData_Event_Ch15B_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB7A
CONST_DATA u8 TrapData_Event_Ch15B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB7B
CONST_DATA u8 TrapData_Event_Ch16B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB7C
CONST_DATA u8 TrapData_Event_Ch17B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDB7D
CONST_DATA u8 TrapData_Event_Ch18B_0[] = {
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
CONST_DATA u8 TrapData_Event_Ch19B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE1
CONST_DATA u8 TrapData_Event_Ch20B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE2
CONST_DATA u8 TrapData_Event_Ch21B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE3
CONST_DATA u8 TrapData_Event_Ch21XB_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE4
CONST_DATA u8 TrapData_Event_Tower1_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE5
CONST_DATA u8 TrapData_Event_Tower2_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE6
CONST_DATA u8 TrapData_Event_Tower3_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE7
CONST_DATA u8 TrapData_Event_Tower4_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE8
CONST_DATA u8 TrapData_Event_Tower5_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCE9
CONST_DATA u8 TrapData_Event_Tower6_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCEA
CONST_DATA u8 TrapData_Event_Tower7_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCEB
CONST_DATA u8 TrapData_Event_Tower8_0[] = {
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
CONST_DATA u8 TrapData_Event_Ruin1_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCF9
CONST_DATA u8 TrapData_Event_Ruin2_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCFA
CONST_DATA u8 TrapData_Event_Ruin3_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCFB
CONST_DATA u8 TrapData_Event_Ruin4_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDCFC
CONST_DATA u8 TrapData_Event_Ruin5_0[] = {
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
CONST_DATA u8 TrapData_Event_Ruin6_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDD7C
CONST_DATA u8 TrapData_Event_Ruin7_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDD7D
CONST_DATA u8 TrapData_Event_Ruin8_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDD7E
CONST_DATA u8 TrapData_Event_Ruin9_0[] = {
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
CONST_DATA u8 TrapData_Event_Ruin10_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE76
CONST_DATA u8 TrapData_Event_LordSplit_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE77
CONST_DATA u8 TrapData_Event_MelkaenCoast_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE78
CONST_DATA u8 TrapData_Event_Chunk3B_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE79
CONST_DATA u8 TrapData_Event_DebugMap_0[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7A
CONST_DATA u8 TrapData_Event_DebugMap_23[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7B
CONST_DATA u8 TrapData_Event_DebugMap_24[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7C
CONST_DATA u8 TrapData_Event_DebugMap_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7D
CONST_DATA u8 TrapData_Event_DebugMap_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7E
CONST_DATA u8 TrapData_Event_DebugMap_4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE7F
CONST_DATA u8 TrapData_Event_DebugMap_5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE80
CONST_DATA u8 TrapData_Event_DebugMap_6[] = {
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
CONST_DATA u8 TrapData_Event_DebugMap_7[] = {
    /* type */ TRAP_NONE
};

// 0x89EDE9B
CONST_DATA u8 TrapData_Event_DebugMap_8[] = {
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
CONST_DATA u8 TrapData_Event_DebugMap_9[] = {
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
CONST_DATA u8 TrapData_Event_DebugMap_10[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA4
CONST_DATA u8 TrapData_Event_DebugMap_11[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA5
CONST_DATA u8 TrapData_Event_DebugMap_12[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEA6
CONST_DATA u8 TrapData_Event_DebugMap_13[] = {
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
CONST_DATA u8 TrapData_Event_Ch15A_6[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAA
CONST_DATA u8 TrapData_Event_Ch8Hard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAB
CONST_DATA u8 TrapData_Event_Ch15A_7[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAC
CONST_DATA u8 TrapData_Event_Ch15A_8[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAD
CONST_DATA u8 TrapData_Event_Ch9aHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAE
CONST_DATA u8 TrapData_Event_Ch15A_9[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEAF
CONST_DATA u8 TrapData_Event_Ch15A_10[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB0
CONST_DATA u8 TrapData_Event_ch10aHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB1
CONST_DATA u8 TrapData_Event_Ch15A_11[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB2
CONST_DATA u8 TrapData_Event_Ch11aHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB3
CONST_DATA u8 TrapData_Event_Ch15A_12[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB4
CONST_DATA u8 TrapData_Event_Ch12aHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB5
CONST_DATA u8 TrapData_Event_Ch13aHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB6
CONST_DATA u8 TrapData_Event_Ch15A_13[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB7
CONST_DATA u8 TrapData_Event_Ch15A_14[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB8
CONST_DATA u8 TrapData_Event_Ch15A_15[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEB9
CONST_DATA u8 TrapData_Event_Ch14aHard[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBA
CONST_DATA u8 TrapData_Event_Ch15A_16[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBB
CONST_DATA u8 TrapData_Event_Ch15A_17[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBC
CONST_DATA u8 TrapData_Event_Ch15A_18[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBD
CONST_DATA u8 TrapData_Event_Ch15A_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBE
CONST_DATA u8 TrapData_Event_Ch16A_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEBF
CONST_DATA u8 TrapData_Event_Ch16A_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC0
CONST_DATA u8 TrapData_Event_Ch16A_4[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC1
CONST_DATA u8 TrapData_Event_Ch16A_5[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC2
CONST_DATA u8 TrapData_Event_Ch17A_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC3
CONST_DATA u8 TrapData_Event_Ch17A_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC4
CONST_DATA u8 TrapData_Event_Ch17A_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC5
CONST_DATA u8 TrapData_Event_Ch18A_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC6
CONST_DATA u8 TrapData_Event_Ch19A_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC7
CONST_DATA u8 TrapData_Event_Ch19A_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC8
CONST_DATA u8 TrapData_Event_Ch20A_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEC9
CONST_DATA u8 TrapData_Event_Ch20A_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECA
CONST_DATA u8 TrapData_Event_Ch21A_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECB
CONST_DATA u8 TrapData_Event_Ch21XA_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECC
CONST_DATA u8 TrapData_Event_Ch9B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECD
CONST_DATA u8 TrapData_Event_Ch9B_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECE
CONST_DATA u8 TrapData_Event_Ch10B_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDECF
CONST_DATA u8 TrapData_Event_Ch10B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED0
CONST_DATA u8 TrapData_Event_Ch10B_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED1
CONST_DATA u8 TrapData_Event_Ch11B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED2
CONST_DATA u8 TrapData_Event_Ch11B_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED3
CONST_DATA u8 TrapData_Event_Ch12B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED4
CONST_DATA u8 TrapData_Event_Ch13B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED5
CONST_DATA u8 TrapData_Event_Ch14B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED6
CONST_DATA u8 TrapData_Event_Ch14B_2[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED7
CONST_DATA u8 TrapData_Event_Ch14B_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED8
CONST_DATA u8 TrapData_Event_Ch15B_3[] = {
    /* type */ TRAP_NONE
};

// 0x89EDED9
CONST_DATA u8 TrapData_Event_Ch15B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDA
CONST_DATA u8 TrapData_Event_Ch16B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDB
CONST_DATA u8 TrapData_Event_Ch17B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDC
CONST_DATA u8 TrapData_Event_Ch18B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDD
CONST_DATA u8 TrapData_Event_Ch19B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDE
CONST_DATA u8 TrapData_Event_Ch20B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEDF
CONST_DATA u8 TrapData_Event_Ch21B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE0
CONST_DATA u8 TrapData_Event_Ch21XB_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE1
CONST_DATA u8 TrapData_Event_Tower1_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE2
CONST_DATA u8 TrapData_Event_Tower2_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE3
CONST_DATA u8 TrapData_Event_Tower3_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE4
CONST_DATA u8 TrapData_Event_Tower4_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE5
CONST_DATA u8 TrapData_Event_Tower5_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE6
CONST_DATA u8 TrapData_Event_Tower6_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE7
CONST_DATA u8 TrapData_Event_Tower7_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE8
CONST_DATA u8 TrapData_Event_Tower8_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEE9
CONST_DATA u8 TrapData_Event_Ruin1_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEA
CONST_DATA u8 TrapData_Event_Ruin2_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEB
CONST_DATA u8 TrapData_Event_Ruin3_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEC
CONST_DATA u8 TrapData_Event_Ruin4_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEED
CONST_DATA u8 TrapData_Event_Ruin5_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEE
CONST_DATA u8 TrapData_Event_Ruin6_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEEF
CONST_DATA u8 TrapData_Event_Ruin7_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEF0
CONST_DATA u8 TrapData_Event_Ruin8_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDEF1
CONST_DATA u8 TrapData_Event_Ruin9_1[] = {
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
CONST_DATA u8 TrapData_Event_Ruin10_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6B
CONST_DATA u8 TrapData_Event_LordSplit_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6C
CONST_DATA u8 TrapData_Event_MelkaenCoast_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6D
CONST_DATA u8 TrapData_Event_Chunk3B_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6E
CONST_DATA u8 TrapData_Event_DebugMap_1[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF6F
CONST_DATA u8 TrapData_Event_DebugMap_14[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF70
CONST_DATA u8 TrapData_Event_DebugMap_15[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF71
CONST_DATA u8 TrapData_Event_DebugMap_16[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF72
CONST_DATA u8 TrapData_Event_DebugMap_17[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF73
CONST_DATA u8 TrapData_Event_DebugMap_18[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF74
CONST_DATA u8 TrapData_Event_DebugMap_19[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF75
CONST_DATA u8 TrapData_Event_DebugMap_20[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF76
CONST_DATA u8 TrapData_Event_DebugMap_21[] = {
    /* type */ TRAP_NONE
};

// 0x89EDF77
CONST_DATA u8 TrapData_Event_DebugMap_22[] = {
    /* type */ TRAP_NONE
};
