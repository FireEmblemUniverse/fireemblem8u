#!/bin/nash

# get the length of lz77 compressed data
# arg1: file path
# arg2: offset
get_lz_len(){
	python3 ./get_lz77_compressed_data_length.py $1 $2
}
