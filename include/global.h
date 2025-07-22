#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include <stdlib.h>
#include <stdint.h>
#include <limits.h>

#include "gba/gba.h"

#include "prelude.h"

#include "types.h"
#include "variables.h"
#include "functions.h"

// helper macros

#define EWRAM_ENTRY ((void *)__ewram_start)

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

#define RED_VALUE(color) ((color) & 0x1F)
#define GREEN_VALUE(color) (((color) >> 5) & 0x1F)
#define BLUE_VALUE(color) (((color) >> 10) & 0x1F)

#define RED_VALUE_(color) ((color) & 0x1F)
#define GREEN_VALUE_(color) ((color) & (0x1F << 5) >> 5)
#define BLUE_VALUE_(color) ((color) & (0x1F << 10) >> 10)

#define ABS(aValue) ((aValue) >= 0 ? (aValue) : -(aValue))

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
