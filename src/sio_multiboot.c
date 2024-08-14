#include "global.h"

// clang-format off

#define MULTIBOOT_MASTER_INFO            0x62
#define MULTIBOOT_CLIENT_INFO            0x72
#define MULTIBOOT_MASTER_START_PROBE     0x61
#define MULTIBOOT_MASTER_REQUEST_DLREADY 0x63
#define MULTIBOOT_CLIENT_DLREADY         0x73
#define MULTIBOOT_MASTER_START_DL        0x64
#define MULTIBOOT_MASTER_REQUEST_CRC     0x65
#define MULTIBOOT_CLIENT_CALC_CRC        0x74
#define MULTIBOOT_CLIENT_CRCREADY        0x75
#define MULTIBOOT_MASTER_VERIFY_CRC      0x66

// clang-format on

extern u16 gUnknown_03001864[MULTIBOOT_NCHILD];

void sub_804D9C4(struct MultiBootParam * mp);
int sub_804DDF0(struct MultiBootParam * mp, u16 data);
int sub_804DF24(struct MultiBootParam * mp);
int sub_804DF38(struct MultiBootParam * mp);
void sub_804DE3C(struct MultiBootParam * mp);
void sub_804E03C(void);

//! FE8U = 0x0804D9C4
void sub_804D9C4(struct MultiBootParam * mp)
{
    mp->client_bit = 0;
    mp->probe_count = 0;
    mp->response_bit = 0;

    mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT;
    mp->sendflag = 0;

    mp->handshake_timeout = 0;

    REG_RCNT = 0;
    REG_SIOCNT = SIO_MULTI_MODE | SIO_115200_BPS;
    REG_SIODATA8 = 0;
}

//! FE8U = 0x0804DA00
int sub_804DA00(struct MultiBootParam * mp)
{
    int i;
    int j;
    int k;

    if (sub_804DF24(mp))
    {
        return 0;
    }

    if (mp->check_wait > MULTIBOOT_CONNECTION_CHECK_WAIT)
    {
        mp->check_wait--;
        return 0;
    }

output_burst:
    if (mp->sendflag)
    {
        mp->sendflag = 0;

        i = REG_SIOCNT & (SIO_MULTI_BUSY | SIO_ERROR | SIO_ID | SIO_MULTI_SD | SIO_MULTI_SI);
        if (i != SIO_MULTI_SD)
        {
            sub_804D9C4(mp);
            return i ^ SIO_MULTI_SD;
        }
    }

    if (mp->probe_count >= 0xe0)
    {
        i = sub_804DF38(mp);
        if (i)
        {
            return i;
        }

        if (mp->server_type == MULTIBOOT_SERVER_TYPE_QUICK && mp->probe_count > 0xe1 && sub_804DF24(mp) == 0)
        {
            sub_804E03C();
            goto output_burst;
        }

        if (sub_804DF24(mp) == 0)
        {
            if (mp->handshake_timeout == 0)
            {
                sub_804D9C4(mp);
                return MULTIBOOT_ERROR_HANDSHAKE_FAILURE;
            }
            mp->handshake_timeout--;
        }

        return 0;
    }

    switch (mp->probe_count)
    {
        case 0:
            k = 0x0e;
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                if (REG_SIOMULTI(i) != 0xffff)
                {
                    break;
                }
                k >>= 1;
            }

            k &= 0x0e;
            mp->response_bit = k;

            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if (mp->client_bit & (1 << i))
                {
                    if (j != ((MULTIBOOT_CLIENT_INFO << 8) | (1 << i)))
                    {
                        k = 0;
                        break;
                    }
                }
            }

            mp->client_bit &= k;

            if (k == 0)
            {
                mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT;
            }

            if (mp->check_wait)
            {
                mp->check_wait--;
            }
            else
            {
                if (mp->response_bit != mp->client_bit)
                {
                    sub_804DE3C(mp);
                    goto case_1;
                }
            }

        output_master_info:
            return sub_804DDF0(mp, (MULTIBOOT_MASTER_INFO << 8) | mp->client_bit);

        case_1:
        case 1:
            mp->probe_target_bit = 0;
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if ((j >> 8) == MULTIBOOT_CLIENT_INFO)
                {
                    gUnknown_03001864[i - 1] = j;
                    j &= 0xff;
                    if (j == (1 << i))
                    {
                        mp->probe_target_bit |= j;
                    }
                }
            }

            if (mp->response_bit != mp->probe_target_bit)
            {
                goto output_master_info;
            }

            mp->probe_count = 2;
            return sub_804DDF0(mp, (MULTIBOOT_MASTER_START_PROBE << 8) | mp->probe_target_bit);

        case 2:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                if (mp->probe_target_bit & (1 << i))
                {
                    j = REG_SIOMULTI(i);
                    if (j != gUnknown_03001864[i - 1])
                    {
                        mp->probe_target_bit ^= 1 << i;
                    }
                }
            }
            goto output_header;

        case 0xd0:
            k = 1;
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                mp->client_data[i - 1] = j;
                if (mp->probe_target_bit & (1 << i))
                {
                    if ((j >> 8) != MULTIBOOT_CLIENT_INFO && (j >> 8) != MULTIBOOT_CLIENT_DLREADY)
                    {
                        sub_804D9C4(mp);
                        return MULTIBOOT_ERROR_NO_DLREADY;
                    }
                    if (j == gUnknown_03001864[i - 1])
                    {
                        k = 0;
                    }
                }
            }

            if (k == 0)
            {
                return sub_804DDF0(mp, (MULTIBOOT_MASTER_REQUEST_DLREADY << 8) | mp->palette_data);
            }

            mp->probe_count = 0xd1;

            k = 0x11;
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                k += mp->client_data[i - 1];
            }
            mp->handshake_data = k;
            return sub_804DDF0(mp, (MULTIBOOT_MASTER_START_DL << 8) | (k & 0xff));

        case 0xd1:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if (mp->probe_target_bit & (1 << i))
                {
                    if ((j >> 8) != MULTIBOOT_CLIENT_DLREADY)
                    {
                        sub_804D9C4(mp);
                        return MULTIBOOT_ERROR_NO_DLREADY;
                    }
                }
            }

            i = MultiBoot(mp);

            if (i == 0)
            {
                mp->probe_count = 0xe0;
                mp->handshake_timeout = MULTIBOOT_HANDSHAKE_TIMEOUT;
                return 0;
            }
            sub_804D9C4(mp);
            mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT * 2;
            return MULTIBOOT_ERROR_BOOT_FAILURE;

        default:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                if (mp->probe_target_bit & (1 << i))
                {
                    j = REG_SIOMULTI(i);
                    if ((j >> 8) != (MULTIBOOT_MASTER_START_PROBE + 1 - (mp->probe_count >> 1)) ||
                        ((j & 0xff) != (1 << i)))
                    {
                        mp->probe_target_bit ^= 1 << i;
                    }
                }
            }

            if (mp->probe_count == 0xc4)
            {
                mp->client_bit = mp->probe_target_bit & 0x0e;
                mp->probe_count = 0;
                goto output_master_info;
            }

        output_header:
            if (mp->probe_target_bit == 0)
            {
                sub_804D9C4(mp);
                return MULTIBOOT_ERROR_NO_PROBE_TARGET;
            }

            mp->probe_count += 2;
            if (mp->probe_count == 0xc4)
            {
                goto output_master_info;
            }
            i = sub_804DDF0(mp, (mp->masterp[mp->probe_count - 4 + 1] << 8) | mp->masterp[mp->probe_count - 4]);

            if (i)
            {
                return i;
            }
            if (mp->server_type == MULTIBOOT_SERVER_TYPE_QUICK)
            {
                sub_804E03C();
                goto output_burst;
            }
            return 0;
    }
}

//! FE8U = 0x0804DDF0
int sub_804DDF0(struct MultiBootParam * mp, u16 data)
{
    int i;

    i = REG_SIOCNT & (SIO_MULTI_BUSY | SIO_MULTI_SD | SIO_MULTI_SI);
    if (i != SIO_MULTI_SD)
    {
        sub_804D9C4(mp);
        return i ^ SIO_MULTI_SD;
    }

    REG_SIODATA8 = data;
    REG_SIOCNT = SIO_MULTI_MODE | SIO_START | SIO_115200_BPS;

    mp->sendflag = 1;
    return 0;
}

//! FE8U = 0x0804DE3C
void sub_804DE3C(struct MultiBootParam * mp)
{
    if (mp->probe_count != 0)
    {
        sub_804D9C4(mp);
        return;
    }
    mp->check_wait = 0;
    mp->client_bit = 0;
    mp->probe_count = 1;
}

//! FE8U = 0x0804DE60
void sub_804DE60(struct MultiBootParam * mp, const u8 * srcp, int length, u8 palette_color, s8 palette_speed)
{
    int i;

    if (mp->probe_count != 0 || mp->client_bit == 0 || mp->check_wait != 0)
    {
        sub_804D9C4(mp);
        return;
    }

    mp->boot_srcp = srcp;
    length = (length + 15) & ~15;
    if (length < MULTIBOOT_SEND_SIZE_MIN || length > MULTIBOOT_SEND_SIZE_MAX)
    {
        sub_804D9C4(mp);
        return;
    }

    mp->boot_endp = srcp + length;

    switch (palette_speed)
    {
        case -4:
        case -3:
        case -2:
        case -1:
            i = (palette_color << 3) | (3 - palette_speed);
            break;
        case 0:
            i = 0x38 | palette_color;
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            i = (palette_color << 3) | (palette_speed - 1);
            break;
    }

    mp->palette_data = ((i & 0x3f) << 1) | 0x81;
    mp->probe_count = 0xd0;
}

//! FE8U = 0x0804DF24
int sub_804DF24(struct MultiBootParam * mp)
{
    if (mp->probe_count == 0xe9)
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0804DF38
int sub_804DF38(struct MultiBootParam * mp)
{
    int i, j;

#define send_data (mp->system_work[0])
#define must_data (mp->system_work[1])

    switch (mp->probe_count)
    {
    case_0xe0:
    case 0xe0:
        mp->probe_count = 0xe1;
        must_data = 0x0000;
        send_data = 0x100000;
        return sub_804DDF0(mp, 0x0000);

        default:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if ((mp->client_bit & (1 << i)) && j != must_data)
                {
                    goto case_0xe0;
                }
            }
            mp->probe_count++;
            must_data = send_data & 0xffff;
            if (send_data == 0x0000)
            {
                must_data = mp->masterp[0xac] | (mp->masterp[0xad] << 8);
                send_data = must_data << 5;
            }
            send_data >>= 5;
        output_common:
            return sub_804DDF0(mp, send_data);

        case 0xe7:
        case 0xe8:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if ((mp->client_bit & (1 << i)) && j != must_data)
                {
                    sub_804D9C4(mp);
                    return MULTIBOOT_ERROR_HANDSHAKE_FAILURE;
                }
            }

            mp->probe_count++;
            if (mp->probe_count == 0xe9)
            {
                return 0;
            }

            send_data = mp->masterp[0xae] | (mp->masterp[0xaf] << 8);
            must_data = send_data;
            goto output_common;
    }

#undef send_data
#undef must_data
}

//! FE8U = 0x0804E024
NAKEDFUNC
void sub_804E024(u32 cycles)
{
    asm("\n\
        .syntax unified\n\
        mov r2, pc\n\
        lsrs r2, r2, #0x18\n\
        movs r1, #0xc\n\
        cmp r2, #2\n\
        beq _0804E036\n\
        movs r1, #0xd\n\
        cmp r2, #8\n\
        beq _0804E036\n\
        movs r1, #4\n\
    _0804E036:\n\
        subs r0, r0, r1\n\
        bgt _0804E036\n\
        bx lr\n\
        .syntax divided\n\
    ");
}

//! FE8U = 0x0804E03C
void sub_804E03C(void)
{
    int i;

    for (i = 0; i < 0x0000795D; i++)
    {
        if ((REG_SIOCNT & SIO_START) == 0)
        {
            break;
        }
    }

    sub_804E024(600);
}
