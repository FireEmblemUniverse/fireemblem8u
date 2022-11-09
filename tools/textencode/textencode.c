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

#include "textencode.h"
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// int useVanillaTree = 0;
// const char optionToUseVanillaTree[] = "--vanilla-tree";
// extern unsigned huffmanTableVanilla[];

unsigned * huffmanTable;

u32 freq[MAX_VALUE_NUM] = { 0 };

typedef enum Direction {
  LEFT,
  RIGHT,
} Direction_t;

int node_is_leaf(uint32_t node)
{
    uint16_t hipart = (uint16_t)(node >> 16);
    return hipart == 0xFFFF;
}

// searches tree for value
int search(uint32_t node, uint16_t value, Direction_t * out, int len) {
    // Amazingly, attempting to factor out this use of [hipart] and [lopart]
    // into helpers (e.g. [node_is_leaf]) causes a ~0.8x slowdown; presumably
    // there is some inlining and constant lifting that isn't firing. Alas.
    //
    // Changing this code to use the [HuffTree_t] performs even worse (0.5x),
    // probably because of the extra pointer indirections.
    uint16_t lopart = (uint16_t)node;
    uint16_t hipart = (uint16_t)(node >> 16);

    if (hipart == 0xFFFF) // leaf node
    {
        // leaf node
        // The upper 16 bits of a leaf node are always 0xFFFF.
        // The lower 16 bits are the output data.

        if (lopart == value)
            return len; // found the value
    }
    else
    {
        // non-leaf node
        // The upper 16 bits of the node are the right child index
        // The lower 16 bits of the node are the left child index

        // search left child
        int left_len = search(huffmanTable[lopart], value, out, len+1);
        if (left_len != -1)
        {
            out[len] = LEFT;
            return left_len;
        }

        int right_len = search(huffmanTable[hipart], value, out, len+1);
        if (right_len != -1)
        {
            out[len] = RIGHT;
            return right_len;
        }
    }

    // not found
    return -1;
}

typedef struct Entry {
    // XXX: The maximum tree depth in the FE8U corpus is 19 so we should be
    // okay fixing this value at 32, but it would be nice to be more general.
    u32 path;
    int len;
} Entry_t;

Entry_t cache[1<<16];

void write_from_cache(uint16_t value, uint8_t * output, unsigned int * bit)
{
    int len = cache[value].len;
    int path = cache[value].path;
    for (int i = 0; i < len ; i += 1, *bit += 1) {
        unsigned int byte = *bit / 8;
        unsigned int bit_ = *bit % 8;

        if (path & (1 << i)) {
            output[byte] |= (1 << bit_);
        }
        else {
            output[byte] &= ~(1 << bit_);
        }
    }
}

int compress_value(
    uint32_t node, uint16_t value, uint8_t * output, unsigned int * bit)
{
    if (cache[value].len > 0) {
        write_from_cache(value, output, bit);
        return 1;
    }

    Direction_t path[32] = { LEFT };
    int len = search(node, value, (Direction_t *) &path, 0);

    if (len == -1) { return 0; }

    cache[value].len = len;
    cache[value].path = 0;
    for (int i = 0; i < len; i += 1, *bit += 1) {
        unsigned int byte = *bit / 8;
        unsigned int bit_ = *bit % 8;

        if (path[i] == LEFT) {
            cache[value].path &= ~(1 << i);
            output[byte] &= ~(1 << bit_);
        }
        else {
            cache[value].path |= (1 << i);
            output[byte] |= (1 << bit_);
        }
    }

    return 1;
}

void count_freq(uint8_t * input)
{
    unsigned int value;

    while (1)
    {
        switch (*input)
        {
            case 0x80:
                // 1-byte
                value = *input++;
                freq[value]++;
                // 1-byte
                value = *input++;
                freq[value]++;
                break;
            case 0x10:
                // 1-byte
                value = *input++;
                freq[value]++;
                // 2-byte
                value = *input++;
                value |= *input++ << 8;
                freq[value]++;
                break;
            default:
                if (*input >= 0x20)
                {
                    // 2-byte
                    value = *input++;
                    value |= *input++ << 8;
                    freq[value]++;
                    break;
                }
                // else fall through
            case '#':
            case 0x7F:
            case 0xE9:
                // 1-byte
                value = *input++;
                freq[value]++;
                if (value == 0)
                    return;
                break;
        }
    }
}

int compress_string(uint8_t * input, uint8_t * output)
{
    unsigned int value;
    unsigned int size;
    unsigned int bit = 0;

    // Root node is the last element of the table.
    const int rootNode = huffmanTable[g_node_count - 1];

    while (1)
    {
        switch (*input)
        {
            case 0x80:
                // 1-byte
                value = *input++;
                if (!compress_value(rootNode, value, output, &bit))
                    goto error;
                // 1-byte
                value = *input++;
                if (!compress_value(rootNode, value, output, &bit))
                    goto error;
                break;
            case 0x10:
                // 1-byte
                value = *input++;
                if (!compress_value(rootNode, value, output, &bit))
                    goto error;
                // 2-byte
                value = *input++;
                value |= *input++ << 8;
                if (!compress_value(rootNode, value, output, &bit))
                    goto error;
                break;
            default:
                if (*input >= 0x20)
                {
                    // 2-byte
                    value = *input++;
                    value |= *input++ << 8;
                    if (!compress_value(
                            rootNode, value, output, &bit))
                        goto error;
                    break;
                }
                // else fall through
            case '#':
            case 0x7F:
            case 0xE9:
                // 1-byte
                value = *input++;
                if (!compress_value(rootNode, value, output, &bit))
                    goto error;
                if (value == 0)
                    goto done;
                break;
        }
    }
done:
    size = bit / 8;
    // clear out any leftover remaining in the rest of partal byte
    if (bit % 8 != 0)
    {
        size++;
        output[bit / 8] &= (1 << (bit % 8)) - 1;
    }
    return size;

error:
    FATAL_ERROR("could not compress value 0x%X\n", value);
}

static void print_compressed_string(
    FILE * file, const char * id, const uint8_t * compressed,
    int compressedLength)
{
    int i;

    fprintf(file, "const u8 gCompressedText_%s[] = {", id);
    for (i = 0; i < compressedLength - 1; i++)
        fprintf(file, "0x%02X, ", compressed[i]);
    fprintf(file, "0x%02X};\n", compressed[i]);
}

void print_bytes(FILE * file, const uint8_t * bytes, int length)
{
    int i;

    for (i = 0; i < length - 1; i++)
        fprintf(file, "0x%02X, ", bytes[i]);
    fprintf(file, "0x%02X", bytes[i]);
}

static void write_c_file(const char * filename)
{
    FILE * outCFile;
    int i;
    uint8_t outputBuffer[10000] = {0}; // TODO: allocate this dynamically
    int size;

    outCFile = fopen(filename, "wb");
    if (outCFile == NULL)
        FATAL_ERROR("failed to open file '%s' for writing\n", filename);

    fputs("#include \"global.h\"\n\n", outCFile);

    for (i = 0; i < gInputStringsCount; i++)
    {
        count_freq((uint8_t *)gInputStrings[i].text);
    }

    BENCH_WAYPOINT(huffbuild);
    BuildHuffmanTree(freq);
    huffmanTable = BuildHuffmanTable();
    BENCH_REPORT(huffbuild, "initial tree build");

    //*
    // compressed string data
    BENCH_WAYPOINT(compress);
    for (i = 0; i < gInputStringsCount; i++)
    {
        size = compress_string((uint8_t *)gInputStrings[i].text, outputBuffer);

        print_compressed_string(
            outCFile, gInputStrings[i].id, outputBuffer, size);
    }
    BENCH_REPORT(compress, "compress and write out");
    fputs("\n", outCFile);

    // Huffman table
    fprintf(outCFile, "const u32 gMsgHuffmanTable[] =\n{");
    for (size_t i = 0; i < g_node_count; i++)
    {
        if (i % 8 == 0)
            fprintf(outCFile, "\n    ");

        fprintf(outCFile, "0x%08X, ", huffmanTable[i]);
    }

    fputs("\n};\n\n", outCFile);

    // pointer to root node of Huffman tree
    fprintf(
        outCFile,
        "const u32 *const gMsgHuffmanTableRoot = gMsgHuffmanTable + %d;\n\n",
        (int) g_node_count - 1);

    // string table
    fputs("const u8 *const gMsgStringTable[] =\n{\n", outCFile);
    for (i = 0; i < gInputStringsCount; i++)
        fprintf(outCFile, "    gCompressedText_%s,\n", gInputStrings[i].id);
    fputs("};\n", outCFile);

    fclose(outCFile);
}

void write_h_file(const char * filename)
{
    FILE * outHFile;
    int i;

    outHFile = fopen(filename, "wb");
    if (outHFile == NULL)
        FATAL_ERROR("failed to open file '%s' for writing\n", filename);

    for (i = 0; i < gInputStringsCount; i++)
        fprintf(outHFile, "#define %s %i\n", gInputStrings[i].id, i);

    fclose(outHFile);
}

int main(int argc, char ** argv)
{
    if (argc != 3)
        FATAL_ERROR("usage:\n%s STRING_LIST C_FILE\n", argv[0]);

    read_input_file(argv[1]);
    write_c_file(argv[2]);

    return 0;
}
