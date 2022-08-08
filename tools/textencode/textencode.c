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

#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "textencode.h"

int useVanillaTree = 0;
const char optionToUseVanillaTree[] = "--vanilla-tree";
extern unsigned huffmanTableVanilla[];
unsigned* huffmanTable;

int freq[MAX_VALUE_NUM] = {0};

// searches tree for value, and appends the Huffman to the output
int compress_value_recursive(uint32_t node, uint16_t value, uint8_t *output, unsigned int *bit)
{
    uint16_t lopart = (uint16_t)node;
    uint16_t hipart = (uint16_t)(node >> 16);

    if (hipart == 0xFFFF)  // leaf node
    {
        // leaf node
        // The upper 16 bits of a leaf node are always 0xFFFF.
        // The lower 16 bits are the output data.

        if (lopart == value)
            return 1;  // found the value
        else
            return 0;
    }
    else
    {
        unsigned int byte = *bit / 8;
        unsigned int bit_ = *bit % 8;

        // non-leaf node
        // The upper 16 bits of the node are the right child index
        // The lower 16 bits of the node are the left child index

        // search left child
        (*bit)++;
        if (compress_value_recursive(huffmanTable[lopart], value, output, bit))
        {
            // clear current output bit because value was found
            // in left subtree
            output[byte] &= ~(1 << bit_);
            return 1;
        }
        (*bit)--;

        // search right child
        (*bit)++;
        if (compress_value_recursive(huffmanTable[hipart], value, output, bit))
        {
            // set current output bit because value was found
            // in right subtree
            output[byte] |= (1 << bit_);
            return 1;
        }
        (*bit)--;

        // not found
        return 0;
    }
}

void count_freq(uint8_t *input)
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

int compress_string(uint8_t *input, uint8_t *output)
{
    unsigned int value;
    unsigned int size;
    unsigned int bit = 0;

    // Root node is the last element of the table.
    const int rootNode = huffmanTable[nodeNum - 1];

    while (1)
    {
        switch (*input)
        {
        case 0x80:
            // 1-byte
            value = *input++;
            if (!compress_value_recursive(rootNode, value, output, &bit))
                goto error;
            // 1-byte
            value = *input++;
            if (!compress_value_recursive(rootNode, value, output, &bit))
                goto error;
            break;
        case 0x10:
            // 1-byte
            value = *input++;
            if (!compress_value_recursive(rootNode, value, output, &bit))
                goto error;
            // 2-byte
            value = *input++;
            value |= *input++ << 8;
            if (!compress_value_recursive(rootNode, value, output, &bit))
                goto error;
            break;
        default:
            if (*input >= 0x20)
            {
                // 2-byte
                value = *input++;
                value |= *input++ << 8;
                if (!compress_value_recursive(rootNode, value, output, &bit))
                    goto error;
                break;
            }
            // else fall through
        case '#':
        case 0x7F:
        case 0xE9:
            // 1-byte
            value = *input++;
            if (!compress_value_recursive(rootNode, value, output, &bit))
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

static void print_compressed_string(FILE *file, const char *id, const uint8_t *compressed, int compressedLength)
{
    int i;

    fprintf(file, "const u8 gCompressedText_%s[] = {", id);
    for (i = 0; i < compressedLength - 1; i++)
        fprintf(file, "0x%02X, ", compressed[i]);
    fprintf(file, "0x%02X};\n", compressed[i]);
}

void print_bytes(FILE *file, const uint8_t *bytes, int length)
{
    int i;

    for (i = 0; i < length - 1; i++)
        fprintf(file, "0x%02X, ", bytes[i]);
    fprintf(file, "0x%02X", bytes[i]);
}

static void write_c_file(const char *filename)
{
    FILE *outCFile;
    int i;
    uint8_t outputBuffer[10000];  // TODO: allocate this dynamically
    int size;

    outCFile = fopen(filename, "wb");
    if (outCFile == NULL)
        FATAL_ERROR("failed to open file '%s' for writing\n", filename);

    fputs("#include \"global.h\"\n\n", outCFile);

    if (useVanillaTree) {
        huffmanTable = huffmanTableVanilla;
        nodeNum = nodeNumVanilla;
    } else {
        for (i = 0; i < gInputStringsCount; i++)
        {
            count_freq((uint8_t *)gInputStrings[i].text);
        }
        printHuffmanTree(buildHuffmanTree(), 0);
        huffmanTable = buildHuffmanTable();
    }

    // compressed string data
    for (i = 0; i < gInputStringsCount; i++)
    {
        size = compress_string((uint8_t *)gInputStrings[i].text, outputBuffer);
        print_compressed_string(outCFile, gInputStrings[i].id, outputBuffer, size);
    }
    fputs("\n", outCFile);

    // Huffman table
    fprintf(outCFile, "const u32 gMsgHuffmanTable[] =\n{");
    for (i = 0; i < (int)nodeNum; i++)
    {
        if (i % 8 == 0)
            fprintf(outCFile, "\n    ");
        fprintf(outCFile, "0x%08X, ", huffmanTable[i]);
    }
    fputs("\n};\n\n", outCFile);

    // pointer to root node of Huffman tree
    fprintf(outCFile, "const u32 *const gMsgHuffmanTableRoot = gMsgHuffmanTable + %d;\n\n", nodeNum - 1);

    // string table
    fputs("const u8 *const gMsgStringTable[] =\n{\n", outCFile);
    for (i = 0; i < gInputStringsCount; i++)
        fprintf(outCFile, "    gCompressedText_%s,\n", gInputStrings[i].id);
    fputs("};\n", outCFile);
    
    fclose(outCFile);
}

void write_h_file(const char *filename)
{
    FILE *outHFile;
    int i;
    
    outHFile = fopen(filename, "wb");
    if (outHFile == NULL)
        FATAL_ERROR("failed to open file '%s' for writing\n", filename);
    
    for (i = 0; i < gInputStringsCount; i++)
        fprintf(outHFile, "#define %s %i\n", gInputStrings[i].id, i);
    
    fclose(outHFile);
}

int main(int argc, char **argv)
{
    if (argc == 4 && strcmp(argv[3], optionToUseVanillaTree) == 0)
        useVanillaTree = 1;

    if ((useVanillaTree && argc != 4) || (!useVanillaTree && argc != 3))
        FATAL_ERROR("usage:\n%s STRING_LIST C_FILE [%s]\n", argv[0], optionToUseVanillaTree);

    read_input_file(argv[1]);
    write_c_file(argv[2]);

    return 0;
}
