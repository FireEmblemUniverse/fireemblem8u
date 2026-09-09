/* Layer 3 backend: headless mGBA framebuffer oracle (links libmgba).
 *
 * The Python bindings aren't on PyPI for this environment, but libmgba + headers
 * are (apt: libmgba-dev). This runs two ROMs headless under an IDENTICAL scripted
 * input sequence and compares the VIDEO FRAMEBUFFER at checkpoints.
 *
 * Only the framebuffer is a valid oracle: the shifted ROM's RAM legitimately
 * differs (correctly-relocated pointers stored in RAM now hold shifted addresses),
 * but what is DRAWN must be identical regardless of where code/data live. A
 * framebuffer divergence therefore means a pointer did NOT relocate -- wrong
 * graphics, a crash, or a hang -- i.e. a shiftability bug.
 *
 * Usage: mgba_oracle <base.gba> <shifted.gba> [checkpoint_frame ...]
 * Exit:  0 = identical at every checkpoint; 1 = divergence; 2 = setup error.
 */
#include <mgba/core/core.h>
#include <mgba/core/interface.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* GBA key bit positions (mgba/internal/gba/input.h order). */
enum { K_A = 1 << 0, K_B = 1 << 1, K_SELECT = 1 << 2, K_START = 1 << 3,
       K_RIGHT = 1 << 4, K_LEFT = 1 << 5, K_UP = 1 << 6, K_DOWN = 1 << 7,
       K_R = 1 << 8, K_L = 1 << 9 };

static int cmp_int(const void* a, const void* b)
{
	int x = *(const int*) a, y = *(const int*) b;
	return (x > y) - (x < y);
}

static void* xmalloc(size_t n)
{
	void* p = malloc(n);
	if (!p) {
		fprintf(stderr, "mgba_oracle: out of memory\n");
		exit(2);
	}
	return p;
}

static uint64_t fnv1a(const void* data, size_t n)
{
	uint64_t h = 1469598103934665603ULL;
	const uint8_t* p = (const uint8_t*) data;
	for (size_t i = 0; i < n; i++) {
		h ^= p[i];
		h *= 1099511628211ULL;
	}
	return h;
}

/* Identical input for both ROMs: tap START then A in turn, briefly, every second,
 * to advance through title / intro / first menus. Deterministic in frame number. */
static uint32_t keys_for(int frame)
{
	if (frame >= 90 && ((frame - 90) % 60) < 6)
		return (((frame - 90) / 60) % 2) ? K_START : K_A;
	return 0;
}

static int run(const char* path, const int* cps, int ncps, uint64_t* out)
{
	struct mCore* core = mCoreFind(path);
	if (!core) {
		fprintf(stderr, "mgba_oracle: no core for %s\n", path);
		return 2;
	}
	core->init(core);
	mCoreInitConfig(core, NULL);
	if (!mCoreLoadFile(core, path)) {
		fprintf(stderr, "mgba_oracle: cannot load %s\n", path);
		return 2;
	}
	unsigned w, h;
	core->desiredVideoDimensions(core, &w, &h);
	color_t* buf = (color_t*) xmalloc((size_t) w * h * sizeof(color_t));
	core->setVideoBuffer(core, buf, w);
	core->reset(core);

	int maxf = cps[ncps - 1], ci = 0;
	for (int f = 0; f <= maxf; f++) {
		core->setKeys(core, keys_for(f));
		core->runFrame(core);
		while (ci < ncps && f == cps[ci]) {
			out[ci] = fnv1a(buf, (size_t) w * h * sizeof(color_t));
			ci++;
		}
	}
	free(buf);
	mCoreConfigDeinit(&core->config);
	core->deinit(core);
	return 0;
}

int main(int argc, char** argv)
{
	if (argc < 3) {
		fprintf(stderr, "usage: %s <base.gba> <shifted.gba> [frame ...]\n", argv[0]);
		return 2;
	}
	int default_cps[] = { 120, 300, 600, 900, 1200 };
	int ncps = argc > 3 ? argc - 3 : 5;
	int* cps = (int*) xmalloc(sizeof(int) * ncps);
	if (argc > 3)
		for (int i = 0; i < ncps; i++)
			cps[i] = atoi(argv[3 + i]);
	else
		memcpy(cps, default_cps, sizeof(default_cps));
	/* The frame loop runs to cps[ncps-1] and advances ci in order, so checkpoints
	 * must be ascending; sort user-supplied frames so out[] is always fully written. */
	qsort(cps, ncps, sizeof(int), cmp_int);

	uint64_t* a = (uint64_t*) xmalloc(sizeof(uint64_t) * ncps);
	uint64_t* b = (uint64_t*) xmalloc(sizeof(uint64_t) * ncps);
	int rc = run(argv[1], cps, ncps, a);
	if (rc) return rc;
	rc = run(argv[2], cps, ncps, b);
	if (rc) return rc;

	printf("======================================================================\n");
	printf("Layer 3 - mGBA framebuffer oracle (base vs shifted)\n");
	printf("======================================================================\n");
	int diverged = 0;
	for (int i = 0; i < ncps; i++) {
		int ok = a[i] == b[i];
		printf("  frame %5d: base fb=%016llx | shifted fb=%016llx  [%s]\n",
		       cps[i], (unsigned long long) a[i], (unsigned long long) b[i],
		       ok ? "OK" : "DIVERGE");
		if (!ok) diverged = 1;
	}
	printf("======================================================================\n");
	if (diverged) {
		printf("RESULT: DIVERGENCE -> the shifted ROM renders differently; a "
		       "hardcoded pointer is hit.\n");
		return 1;
	}
	printf("RESULT: identical at every checkpoint -> shiftable through this depth.\n");
	return 0;
}
