/* Standalone nonmatching ARM Huffman decoder reconstruction.
 * 31/35 instruction words match; all 640 valid-tree oracle cases pass.
 * The decoder assumes a valid internal root, bitstream and output capacity.
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern const u32 gMsgHuffmanTable[];
extern const u32 * gMsgHuffmanTableRoot;

void DecodeString(const u8 * inputArg, u8 * outputArg)
{
    register const u8 * input asm("r0") = inputArg;
    register u8 * output asm("r1") = outputArg;
    register u32 bits asm("r2");
    register u32 remaining asm("r3") = 0;
    register const u32 * node asm("r4");
    register const u32 * table asm("r5") = gMsgHuffmanTable;
    register u32 value asm("r6");
    register const u32 * root asm("r7");
    asm("" : "+r"(remaining), "+r"(table));
    {
        register const u32 ** address asm("r7") = &gMsgHuffmanTableRoot;
        asm("" : "+r"(address));
        root = *address;
        asm("" : "+r"(root));
    }
next_symbol:
    node = root;
    asm("" : "+r"(node));
next_bit:
    remaining--;
    if ((int)remaining < 0)
    {
        bits = *input;
        input++;
        asm("" : "+r"(input), "+r"(bits));
        remaining = 7;
    }
    asm("" : "+r"(remaining));
    if (bits & 1)
    {
        asm("" ::: "memory");
        value = ((const u16 *)node)[1];
    }
    else
    {
        asm("" ::: "memory");
        value = ((const u16 *)node)[0];
    }
    asm("" : "+r"(value));
    node = table + value;
    asm("" : "+r"(node));
    bits >>= 1;
    asm("" : "+r"(bits));
    value = *node;
    asm("" : "+r"(value));
    if ((int)value >= 0)
        goto next_bit;
    asm("" : "+r"(value));
    if (value & 0xff00)
    {
        output[0] = value;
        value >>= 8;
        asm("" : "+r"(value));
        output[1] = value;
        output += 2;
        asm("" : "+r"(output));
        goto next_symbol;
    }
    output[0] = value;
    if ((value & 255) == 0)
        goto end;
    asm("" : "+r"(value));
    output++;
    asm("" : "+r"(output));
    goto next_symbol;
end:
    return;
}
