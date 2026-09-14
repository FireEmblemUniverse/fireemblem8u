/* Copyright (C) 1995, 1996, 1998 Free Software Foundation, Inc.

This file is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

In addition to the permissions in the GNU General Public License, the
Free Software Foundation gives you unlimited permission to link the
compiled version of this file with other programs, and to distribute
those programs without any restriction coming from the use of this
file.  (The General Public License restrictions do apply in other
respects; for example, they cover modification of the file, and
distribution when not linked into another program.)

This file is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, write to
the Free Software Foundation, 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* As a special exception, if you link this library with other files,
   some of which are compiled with GCC, to produce an executable,
   this library does not by itself cause the resulting executable
   to be covered by the GNU General Public License.
   This exception does not however invalidate any other reasons why
   the executable file might be covered by the GNU General Public License.  */


/* Fixed-register state follows the legacy modulus helper; constraints emit no instructions. */
extern void __div0(void);
#define BASE() asm volatile("" : "+r"(dividend), "+r"(divisor), "+r"(bit))
#define LIVE() asm volatile("" : "+r"(dividend), "+r"(divisor), "+r"(bit), "+r"(work), "+r"(overdone))
#define SAVE() asm volatile("" : "+r"(saved))
static __attribute__((always_inline)) inline unsigned rotate(unsigned value, unsigned shift)
{
    return (value >> shift) | (value << ((32 - shift) & 31));
}
__attribute__((matching_leaf_frame))
unsigned runtime_smod(unsigned numerator, unsigned denominator)
{
    register unsigned dividend asm("r0") = numerator;
    register unsigned divisor asm("r1") = denominator;
    register unsigned overdone asm("r2");
    register unsigned bit asm("r3");
    register unsigned work asm("r4");
    register unsigned saved asm("r12");
    bit = 1; BASE();
    if (!divisor) __builtin_unreachable();
    if (divisor & 0x80000000u) { divisor = 0u-divisor; BASE(); }
    volatile unsigned sign = dividend;
    if (dividend & 0x80000000u) { dividend = 0u-dividend; BASE(); }
    if (dividend < divisor) goto done;
    work = 1; asm volatile("" : "+r"(work));
    work <<= 28; asm volatile("" : "+r"(work));
    while (divisor < work && divisor < dividend) {
        divisor <<= 4; bit <<= 4; BASE();
    }
    work <<= 3; asm volatile("" : "+r"(work));
    while (divisor < work && divisor < dividend) {
        divisor <<= 1; bit <<= 1; BASE();
    }
    for (;;) {
        overdone = 0; LIVE();
        if (dividend >= divisor) { dividend -= divisor; LIVE(); }
        work = divisor >> 1; LIVE();
        if (dividend >= work) {
            dividend -= work; saved = bit; SAVE();
            work = 1; LIVE();
            bit = rotate(bit, work); LIVE();
            overdone |= bit; LIVE();
            bit = saved; LIVE();
        }
        work = divisor >> 2; LIVE();
        if (dividend >= work) {
            dividend -= work; saved = bit; SAVE();
            work = 2; LIVE();
            bit = rotate(bit, work); LIVE();
            overdone |= bit; LIVE();
            bit = saved; LIVE();
        }
        work = divisor >> 3; LIVE();
        if (dividend >= work) {
            dividend -= work; saved = bit; SAVE();
            work = 3; LIVE();
            bit = rotate(bit, work); LIVE();
            overdone |= bit; LIVE();
            bit = saved; LIVE();
        }
        saved = bit; SAVE();
        if (!dividend) break;
        bit >>= 4;
        if (!bit) break;
        divisor >>= 4; LIVE();
    }
    work = 0xe; LIVE();
    work <<= 28; LIVE();
    overdone &= work;
    if (overdone) {
        bit = saved; work = 3; LIVE();
        bit = rotate(bit, work); LIVE();
        if (overdone & bit) { work = divisor >> 3; LIVE(); dividend += work; LIVE(); }
        bit = saved; work = 2; LIVE();
        bit = rotate(bit, work); LIVE();
        if (overdone & bit) { work = divisor >> 2; LIVE(); dividend += work; LIVE(); }
        bit = saved; work = 1; LIVE();
        bit = rotate(bit, work); LIVE();
        if (overdone & bit) { work = divisor >> 1; LIVE(); dividend += work; LIVE(); }
    }
done:
    work = sign; asm volatile("" : "+r"(work), "+r"(dividend));
    if (work & 0x80000000u) { dividend = 0u-dividend; asm volatile("" : "+r"(dividend)); }
    return dividend;
}
