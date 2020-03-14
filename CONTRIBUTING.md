# Contribution Guide

1. Register account on [GitHub](https://github.com/)
1. [Here](https://github.com/laqieer/fireemblem8u/tree/master/asm) are files to decompile. Select a file and click the pencil button to edit it.
1. Check the build status badge in `README.md` or [commit list](https://github.com/laqieer/fireemblem8u/commits/master).
1. Edit until the build status is green, and pull request. 

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)


# Decompiling Guide

Code starts out in `asm/`. When decompiled to C, it goes into `src/`. The goal is to decompile all the code.

Some of the code in `asm/` is handwritten assembly. It can't and shouldn't be decompiled. It's already commented, so there's no further work to do on these files.
* `asm/crt0.s`
* `asm/libagbsyscall.s`
* `asm/libgcnmultiboot.s`
* `asm/m4a_1.s`
* `asm/m4a_3.s`

The rest of the `.s` files in `asm/` are fair game.

The basic decompilation process is:
* Choose a file in `asm/`, i.e. `asm/x.s`. Create a C file called `src/x.c`.
* Translate the first function in `asm/x.s` to C in `src/x.c`.
* `make`, and tweak the function until it matches.
* Clean up the code and comment.
* Repeat for each function until `asm/x.s` is empty.


# For example, let's decompile `asm/cable_car.s`.


## 1. Create `src/cable_car.c`

```c
#include "global.h"
```

`global.h` contains typedefs for GBA programming and more.
It must be the first include in the file. Other includes will assume you have included it.


## 2. Include it in the rom

Include `src/cable_car.c` in the rom by adding `src/cable_car.o` to `ld_script.txt`:
```diff
         asm/battle_message.o(.text);
         asm/choose_party.o(.text);
+        src/cable_car.o(.text);
         asm/cable_car.o(.text);
         asm/roulette_util.o(.text);
```
Do not remove `asm/cable_car.o(.text)`. We want both `src/cable_car.c` and `asm/cable_car.s` in the rom.


## 3. Translate the function to C

Take the first function in `asm/cable_car.s`. Either comment it out or remove it, whichever is easier.

```asm
	thumb_func_start sub_81231EC
sub_81231EC: @ 81231EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08123210 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812320A
	ldr r0, _08123214 @ =sub_8123244
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0812320A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123210: .4byte gPaletteFade
_08123214: .4byte sub_8123244
	thumb_func_end sub_81231EC
```
---

Then, start translating the code to `src/cable_car.c`, bit by bit:

```asm
	lsls r0, 24
	lsrs r4, r0, 24
```
```c
void sub_81231EC(u8 r4) {
```
---
```asm
	ldr r0, _08123210 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
```
```c
	r0 = (u8 *)(&gPaletteFade + 7) & 0x80;
```
---

---
```asm
	cmp r0, 0
	bne _0812320A
```
```c
	if (!r0) {
```
---
```asm
	ldr r0, _08123214 @ =sub_8123244
	bl SetMainCallback2
```
```c
		SetMainCallback2(&sub_8123244);
```
---
```asm
	adds r0, r4, 0
	bl DestroyTask
```
```c
		DestroyTask(r4);
```
---
```asm
_0812320A:
```
```c
	}
```
---
```asm
	pop {r4}
	pop {r0}
	bx r0
```
```c
	return;
```
The type signature of the function depends on the return type.
* `bx r0`: `void`
* `bx r1`: `*`
* `bx lr`: `void`, `*`

You will need to look at the caller and the function prologue to determine the exact type if not void.

Since it used `bx r0`, it's `void` for sure.

---

Putting it all together, we get:
```c
void sub_81231EC(u8 r4) {
	r0 = (u8 *)(&gPaletteFade + 7) & 0x80;
	if (!r0) {
		SetMainCallback2(&sub_8123244);
		DestroyTask(r4);
	}
	return;
}
```


## 4. Simplify and document

This line doesn't look quite right.

```c
	r0 = (u8 *)(&gPaletteFade + 7) & 0x80;
```

What is `gPaletteFade`? You can find out where stuff is with `git grep`:

```sh
git grep "gPaletteFade" include/
```
```grep
include/palette.h:extern struct PaletteFadeControl gPaletteFade;
```

So it's a struct called `PaletteFadeControl`. Let's look in `palette.h`:

```c
struct PaletteFadeControl
{
    u32 multipurpose1;
    u8 delayCounter:6;
    u16 y:5; // blend coefficient
    u16 targetY:5; // target blend coefficient
    u16 blendColor:15;
    u16 active:1;
    u16 multipurpose2:6;
    u16 yDec:1; // whether blend coefficient is decreasing
    u16 bufferTransferDisabled:1;
    u16 mode:2;
    u16 shouldResetBlendRegisters:1;
    u16 hardwareFadeFinishing:1;
    u16 softwareFadeFinishingCounter:5;
    u16 softwareFadeFinishing:1;
    u16 objPaletteToggle:1;
    u8 deltaY:4; // rate of change of blend coefficient
};
```
---

What's the 7th byte in this struct?
```c
    u32 multipurpose1; // 0-3
    u8 delayCounter:6; // 4
    u16 y:5;           // 5
    u16 targetY:5;     // 5-6
    u16 blendColor:15; // 7
    u16 active:1;      // 7
```

Byte 7 has both `.blendColor` and `.active`.

---

Okay, what's 0x80 mean? It's `0b10000000`, which is the highest bit in a byte.

`.active` comes after, which means it's higher, but it's also only one bit, so it's a safe bet.

```c
	r0 = gPaletteFade.active;
```

Much better.

---

```c
void sub_81231EC(u8 r4) {
	r0 = gPaletteFade.active;
	if (!r0) {
		SetMainCallback2(&sub_8123244);
		DestroyTask(r4);
	}
	return;
}
```

Now the temp variable `r0` is a little pointless. We can simplify this to:

```c
void sub_81231EC(u8 taskId) {
	if (!gPaletteFade.active) {
		SetMainCallback2(&sub_8123244);
		DestroyTask(taskId);
	}
}
```

Looks done, right?
This function is pretty simple, so it doesn't need any comments right now.

But what about `sub_8123244`? It's still not obvious what that function does. We can find out by decompiling it later.


## 5. Build

```sh
make
```
```gcc
src/cable_car.c: In function `sub_81231EC':
src/cable_car.c:4: `gPaletteFade' undeclared (first use in this function)
src/cable_car.c:4: (Each undeclared identifier is reported only once for each function it appears in.)
src/cable_car.c:5: warning: implicit declaration of function `SetMainCallback2'
src/cable_car.c:5: `sub_8123244' undeclared (first use in this function)
src/cable_car.c:6: warning: implicit declaration of function `DestroyTask'
```

We got some errors. We need to tell the compiler what `gPaletteFade`, `SetMainCallback2`, `sub_8123244`, and `DestroyTask` are.

We know `gPaletteFade` is from `palette.h`. We can do the same with the others. Declare them above the function:
```c
#include "palette.h"
#include "main.h"
#include "task.h"
```
The odd one out is `sub_8123244`, which is in `asm/cable_car.s`! What then?
```c
void sub_8123244();
```
Normally, we would do `extern void sub_8123244();`, but it won't be `extern` when we're done this file.

---

Now our file looks like this:
```c
#include "global.h"
#include "palette.h"
#include "main.h"
#include "task.h"

void sub_8123244();

void sub_81231EC(u8 taskId) {
	if (!gPaletteFade.active) {
		SetMainCallback2(&sub_8123244);
		DestroyTask(taskId);
	}
}
```

---

Build again, and we get:
```sh
make
```
```sha1sum
pokeruby.gba: OK
```

This means the function matches. Congratulations!

---

If it doesn't match, you will get:
```sha1sum
pokeruby.gba: FAILED
sha1sum: WARNING: 1 computed checksum did NOT match
```

---

If you forgot to remove the function from `asm/cable_car.s`, you will get this error:
```gcc
asm/cable_car.o: In function `sub_81231EC':
(.text+0x0): multiple definition of `sub_81231EC'
src/cable_car.o:(.text+0x0): first defined here
```


## 6. Repeat until `asm/cable_car.s` is empty

Once you're done, you can delete `asm/cable_car.s`, and remove it from `ld_script.txt`.



# Decompiling Rule

* rule 1: when in doubt, scrub C
* rule 2: never assume it won't get optimized out.
* rule 3: when the answer is elusive, never rule out a typo.
* rule 4: always be prepared to cram a square peg into a circle hole.
* rule 5: if you still cant get it to match, its a combination that you think you tried before but you havent
* rule 6: volatile is a dangerous magic sauce that may explode
* rule 7: if you're afraid you need to use math, be
* rule 8: if you think you understand the compiler, the compiler will tell you you don't
* rule 10: rule 9 was optimized out


# Resources Collection

- [GitHub Help](https://help.github.com/en)
- [Compiler Explorer](https://cexplore.karathan.at/z/KhyRi3) [Source Code](https://github.com/SBird1337/cexplore)
- [Online Decompiler](https://feuniverse.us/t/use-free-online-service-to-assist-the-routine-analysis/3219) (Down now. Try [IDA](https://www.hex-rays.com/products/ida/) / [Ghidra](https://ghidra-sre.org/) / [RetDec](https://retdec.com/) instead.)
- [Decomp Permuter](https://github.com/laqieer/decomp-permuter-arm)
- [datadump & funchash](https://github.com/TwitchPlaysPokemon/pret3)
- [Pokemon Projects](https://github.com/pret/pokeemerald)
- [GCC online documentation](https://gcc.gnu.org/onlinedocs/)
- [GCC 2.95 Features](https://gcc.gnu.org/gcc-2.95/features.html)
