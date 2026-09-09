/* NONMATCHING research candidate; not included in the ROM build.
 * GNU ARM GCC 16.2.0 reproduces 12 of 14 original instructions.
 * The two remaining differences are MOV versus SUB-immediate-zero copies.
 * See docs/decomp-completion.md for reproduction and exact offsets.
 */
typedef unsigned int u32;
typedef unsigned short u16;
void TmFillRect(u16 * dstArg, u32 width, u32 height, u32 value)
{
 register u16 * dst asm("r0")=dstArg;
 register u16 * row asm("r4");
 register u32 x asm("r5");
 register u32 y asm("r6");
 asm("" ::: "r7");
 row=dst;
 asm("" : : "r"(row));
 y=height;
 asm("" : : "r"(y));
 do {
 x=width;
 asm("" : : "r"(x));
 do {
 *row=value;
 row++;
 asm("" : "+r"(row));
 } while((int)--x>=0);
 dst+=32;
 asm("" : "+r"(dst));
 row=dst;
 asm("" : : "r"(row));
 } while((int)--y>=0);
}
