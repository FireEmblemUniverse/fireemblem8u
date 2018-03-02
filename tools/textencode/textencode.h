#include <ctype.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define ARRAY_COUNT(arr) (sizeof(arr) / sizeof(arr[0]))

#define FATAL_ERROR(message, ...) \
do { \
    fprintf(stderr, message, ##__VA_ARGS__); \
    exit(1); \
} while (0)


struct String
{
    char *id;
    char *text;
};


extern struct String *gInputStrings;
extern int gInputStringsCount;


void read_input_file(const char *name);
