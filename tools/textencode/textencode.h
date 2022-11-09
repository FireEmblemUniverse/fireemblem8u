// Copyright(c) 2018 camthesaxman
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#ifndef TEXTENCODE_H
#define TEXTENCODE_H

#include <stdint.h>
#include <stdlib.h>

#define MAX_VALUE_NUM 0x10000
#define MAX_NODE_NUM 50000

#define ARRAY_COUNT(arr) (sizeof(arr) / sizeof(arr[0]))

#define RESIZE_ARRAY(ptr, nelems) ptr = realloc(ptr, (nelems) * sizeof(*ptr))

#define FATAL_ERROR(message, ...)                                              \
    do                                                                         \
    {                                                                          \
        fprintf(stderr, message, ##__VA_ARGS__);                               \
        exit(1);                                                               \
    } while (0)

#ifdef BENCHMARK

#include <time.h>

// TODO: somehow ensure that ids are unique
// XXX: This should probably be clock_gettime(CLOCK_MONOTONIC, ...) to be
// really accurate

#define PPCAT(A, B) A ## B

#define BENCH_WAYPOINT(name) double PPCAT(name, START) = (double) clock()/CLOCKS_PER_SEC;

#define BENCH_REPORT(name, msg)                                                \
  do                                                                           \
  {                                                                            \
      double PPCAT(name, END) = (double) clock()/CLOCKS_PER_SEC;               \
      fprintf(stderr, "%s: %.3fs\n", msg, PPCAT(name, END)-PPCAT(name, START));\
  } while (0)

#else

#define BENCH_WAYPOINT(name)

#define BENCH_REPORT(name, msg)

#endif

typedef uint32_t u32;

typedef void * HuffTree_t;

struct String
{
    char * id;
    char * text;
};

extern struct String * gInputStrings;
extern int gInputStringsCount;

extern u32 freq[];
extern size_t g_node_count;
extern int nodeNumVanilla;

HuffTree_t BuildHuffmanTree(u32 * freq_table);
void FreeHuffmanTree(HuffTree_t tree);
u32 * BuildHuffmanTable(void);

void read_input_file(const char * name);

#endif // TEXTENCODE_H
