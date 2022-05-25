CC = gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -O2 -s -DPNG_SKIP_SETJMP_CHECK
CFLAGS += $(shell pkg-config --cflags libpng)

LIBS = -lpng -lz
LDFLAGS += $(shell pkg-config --libs-only-L libpng)

SRCS = main.c convert_png.c gfx.c jasc_pal.c lz.c rl.c util.c font.c

.PHONY: clean

gbagfx: $(SRCS) convert_png.h gfx.h global.h jasc_pal.h lz.h rl.h util.h font.h
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) $(LIBS)

clean:
	$(RM) gbagfx gbagfx.exe
