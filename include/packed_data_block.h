// packer data block header
// used in battle animation, battle animation character palette, battle animation terrain
// data block format: header -> pointer table -> compressed data

typedef struct {
    unsigned int number;
    unsigned int size;
} DataBlockHead;

// extern char _banim_pal_start[];
// extern char _banim_pal_end[];
extern char _banim_pal_size[];
