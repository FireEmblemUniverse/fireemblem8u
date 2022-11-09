CC = gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -O2 -s -DBENCHMARK

.PHONY: clean

SRCS = textencode.h textencode.c inputfile.c huffman.c

textencode: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) textencode textencode.exe
