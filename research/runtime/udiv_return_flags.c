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


/* Fixed-register recovery; empty constraints keep live arithmetic state visible. */
extern void __div0(void);
#define LIVE() asm volatile("" : "+r"(dividend), "+r"(divisor), "+r"(result), "+r"(bit), "+r"(work))
#ifdef MATCHING_COPY_ADD_ZERO
__attribute__((matching_thumb_copy_add_zero_pair(0, 2)))
#endif
unsigned runtime_udiv(unsigned numerator, unsigned denominator)
{
    register unsigned dividend asm("r0") = numerator;
    register unsigned divisor asm("r1") = denominator;
    register unsigned result asm("r2");
    register unsigned bit asm("r3");
    register unsigned work asm("r4");
    if (divisor == 0) { __div0(); dividend = 0; asm volatile("" : "+r"(dividend)); return dividend; }
    bit = 1;
    result = 0;
    asm volatile("" : "+r"(dividend), "+r"(divisor), "+r"(result), "+r"(bit));
    if (dividend < divisor) goto done;
    work = 1;
    asm volatile("" : "+r"(work));
    work <<= 28;
    LIVE();
    while (divisor < work && divisor < dividend) {
        divisor <<= 4; bit <<= 4; LIVE();
    }
    LIVE();
    work <<= 3;
    LIVE();
    while (divisor < work && divisor < dividend) {
        divisor <<= 1; bit <<= 1; LIVE();
    }
    for (;;) {
        if (dividend >= divisor) { dividend -= divisor; result |= bit; LIVE(); }
        work = divisor >> 1; LIVE();
        if (dividend >= work) { dividend -= work; work = bit >> 1; result |= work; LIVE(); }
        work = divisor >> 2; LIVE();
        if (dividend >= work) { dividend -= work; work = bit >> 2; result |= work; LIVE(); }
        work = divisor >> 3; LIVE();
        if (dividend >= work) { dividend -= work; work = bit >> 3; result |= work; LIVE(); }
        if (dividend == 0) break;
        bit >>= 4; LIVE();
        if (bit == 0) break;
        divisor >>= 4; LIVE();
    }
done:
    dividend = result;
    asm volatile("" : "+r"(dividend));
    return dividend;
}
