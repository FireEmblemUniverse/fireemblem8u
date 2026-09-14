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


/* C recovery of the original four-bit-unrolled signed division algorithm; unsigned negation preserves INT_MIN behavior. */
extern void __div0(void);
unsigned runtime_sdiv(unsigned dividend, unsigned divisor)
{
    unsigned sign = dividend ^ divisor;
    unsigned result = 0;
    unsigned bit = 1;
    if (divisor == 0) {
        __div0();
        return 0;
    }
    if (divisor & 0x80000000u) divisor = 0u - divisor;
    if (dividend & 0x80000000u) dividend = 0u - dividend;
    if (dividend < divisor)
        return result;
    while (divisor < 0x10000000u && divisor < dividend) {
        divisor <<= 4;
        bit <<= 4;
    }
    while (divisor < 0x80000000u && divisor < dividend) {
        divisor <<= 1;
        bit <<= 1;
    }
    for (;;) {
        if (dividend >= divisor) { dividend -= divisor; result |= bit; }
        if (dividend >= (divisor >> 1)) { dividend -= divisor >> 1; result |= bit >> 1; }
        if (dividend >= (divisor >> 2)) { dividend -= divisor >> 2; result |= bit >> 2; }
        if (dividend >= (divisor >> 3)) { dividend -= divisor >> 3; result |= bit >> 3; }
        if (dividend == 0)
            break;
        bit >>= 4;
        if (bit == 0)
            break;
        divisor >>= 4;
    }
    return (sign & 0x80000000u) ? 0u - result : result;
}
