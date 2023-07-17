#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include <stdlib.h>

#include "gba/gba.h"

// this is for denoting objects that *should* be const, but weren't in the original source (resulting in them being emitted in the .data section)
#define CONST_DATA __attribute__((section(".data")))

// this is for denoting objects that *should* be const, but need to not be for functions to match.
#define SHOULD_BE_CONST

#define NAKEDFUNC __attribute__((naked))

// HACK: applying this macro seems to allow for bitpacked structs to have the same layout in agbcc and modern GCC
#define BITPACKED __attribute__((aligned(4), packed))

#include "types.h"
#include "variables.h"
#include "functions.h"

// helper macros

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

#define RED_VALUE(color) ((color) & 0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color) (((color) >> 10) & 0x1F)

#define RED_VALUE_(color) ((color) & 0x1F)
#define GREEN_VALUE_(color) ((color) & (0x1F << 5) >> 5)
#define BLUE_VALUE_(color) ((color) & (0x1F << 10) >> 10)

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))

#define SIN(aAngle) (gSinLookup[(aAngle&0xFF)])
#define COS(aAngle) (gSinLookup[0x40 + (aAngle&0xFF)])

#define RECT_DISTANCE(aXA, aYA, aXB, aYB) (ABS((aXA) - (aXB)) + ABS((aYA) - (aYB)))

#define LIMIT_AREA(num, min, max)   \
    if (num > max)                  \
        num = max;                  \
    if (num < min)                  \
        num = min;

#define LIMIT_AREA_(num, min, max)  \
    if (num < min)                  \
        num = min;                  \
    else if (num > max)             \
        num = max;

#if !defined(MODERN) || !MODERN
#  define STRUCT_PAD(from, to) unsigned char _pad_ ## from[(to) - (from)]
#else
#  define STRUCT_PAD(from, to)
#endif

#endif  // GUARD_GLOBAL_H
