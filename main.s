	.file	"main.c"
@ GNU C version 3.3.2 (arm-thumb-elf)
@	compiled by GNU C version 3.3.1 (cygming special).
@ GGC heuristics: --param ggc-min-expand=30 --param ggc-min-heapsize=4096
@ options passed:  -fpreprocessed -mthumb-interwork -mlong-calls
@ -auxbase-strip -O2 -Wall -fverbose-asm
@ options enabled:  -fdefer-pop -fomit-frame-pointer
@ -foptimize-sibling-calls -fcse-follow-jumps -fcse-skip-blocks
@ -fexpensive-optimizations -fthread-jumps -fstrength-reduce -fpeephole
@ -fforce-mem -ffunction-cse -fkeep-static-consts -fcaller-saves
@ -freg-struct-return -fgcse -fgcse-lm -fgcse-sm -floop-optimize
@ -fcrossjumping -fif-conversion -fif-conversion2 -frerun-cse-after-loop
@ -frerun-loop-opt -fdelete-null-pointer-checks -fschedule-insns
@ -fschedule-insns2 -fsched-interblock -fsched-spec -fbranch-count-reg
@ -freorder-blocks -freorder-functions -fcprop-registers -fcommon
@ -fverbose-asm -fgnu-linker -fregmove -foptimize-register-move
@ -fargument-alias -fstrict-aliasing -fmerge-constants
@ -fzero-initialized-in-bss -fident -fpeephole2 -fguess-branch-probability
@ -fmath-errno -ftrapping-math -mapcs -mapcs-frame -mapcs-32 -msoft-float
@ -mthumb-interwork -mlong-calls

	.global	SpriteData3
	.data
	.align	2
	.type	SpriteData3, %object
	.size	SpriteData3, 4
SpriteData3:
	.word	100745216
	.global	angle
	.bss
	.global	angle
	.align	2
	.type	angle, %object
	.size	angle, 4
angle:
	.space	4
	.global	angle2
	.global	angle2
	.align	2
	.type	angle2, %object
	.size	angle2, 4
angle2:
	.space	4
	.global	zoom
	.data
	.align	2
	.type	zoom, %object
	.size	zoom, 4
zoom:
	.word	256
	.global	rotData
	.align	2
	.type	rotData, %object
	.size	rotData, 4
rotData:
	.word	gamesprites
	.global	bg0map
	.align	2
	.type	bg0map, %object
	.size	bg0map, 4
bg0map:
	.word	100726784
	.global	FrontBuffer
	.align	2
	.type	FrontBuffer, %object
	.size	FrontBuffer, 4
FrontBuffer:
	.word	100663296
	.global	BackBuffer
	.align	2
	.type	BackBuffer, %object
	.size	BackBuffer, 4
BackBuffer:
	.word	100704256
	.global	ScanlineCounter
	.align	2
	.type	ScanlineCounter, %object
	.size	ScanlineCounter, 4
ScanlineCounter:
	.word	67108870
	.global	BUTTONS
	.align	2
	.type	BUTTONS, %object
	.size	BUTTONS, 4
BUTTONS:
	.word	67109168
	.text
	.align	2
	.global	keyPoll
	.type	keyPoll, %function
keyPoll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	ldr	r2, [r3, #0]	@  BUTTONS
	ldr	r1, [r2, #0]
	ldr	r2, .L2+4
	mvn	r1, r1
	ldrh	r0, [r2, #0]	@ movhi	@  curr_state
	ldr	r3, .L2+8
	bic	r1, r1, #64512
	@ lr needed for prologue
	strh	r0, [r3, #0]	@ movhi 	@  prev_state
	strh	r1, [r2, #0]	@ movhi 	@  curr_state
	bx	lr
.L3:
	.align	2
.L2:
	.word	BUTTONS
	.word	curr_state
	.word	prev_state
	.size	keyPoll, .-keyPoll
	.align	2
	.global	keyIsDown
	.type	keyIsDown, %function
keyIsDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	ldrh	r2, [r3, #0]	@  curr_state
	and	r2, r2, r0	@  key,  key
	mov	r0, r2	@  key
	@ lr needed for prologue
	bx	lr
.L6:
	.align	2
.L5:
	.word	curr_state
	.size	keyIsDown, .-keyIsDown
	.align	2
	.global	keyIsUp
	.type	keyIsUp, %function
keyIsUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldrh	r2, [r3, #0]	@  curr_state
	bic	r0, r0, r2	@  key,  key
	@ lr needed for prologue
	bx	lr
.L9:
	.align	2
.L8:
	.word	curr_state
	.size	keyIsUp, .-keyIsUp
	.align	2
	.global	keyWasDown
	.type	keyWasDown, %function
keyWasDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r2, [r3, #0]	@  prev_state
	and	r2, r2, r0	@  key,  key
	mov	r0, r2	@  key
	@ lr needed for prologue
	bx	lr
.L12:
	.align	2
.L11:
	.word	prev_state
	.size	keyWasDown, .-keyWasDown
	.align	2
	.global	keyWasUp
	.type	keyWasUp, %function
keyWasUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	ldrh	r2, [r3, #0]	@  prev_state
	bic	r0, r0, r2	@  key,  key
	@ lr needed for prologue
	bx	lr
.L15:
	.align	2
.L14:
	.word	prev_state
	.size	keyWasUp, .-keyWasUp
	.align	2
	.global	keyTransition
	.type	keyTransition, %function
keyTransition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	r1, .L17+4
	ldrh	r2, [r3, #0]	@  curr_state
	ldrh	r3, [r1, #0]	@  prev_state
	eor	r2, r2, r3
	and	r2, r2, r0	@  key,  key
	mov	r0, r2	@  key
	@ lr needed for prologue
	bx	lr
.L18:
	.align	2
.L17:
	.word	curr_state
	.word	prev_state
	.size	keyTransition, .-keyTransition
	.align	2
	.global	keyHeld
	.type	keyHeld, %function
keyHeld:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldr	r1, .L20+4
	ldrh	r2, [r3, #0]	@  curr_state
	ldrh	r3, [r1, #0]	@  prev_state
	and	r2, r2, r3
	and	r2, r2, r0	@  key,  key
	mov	r0, r2	@  key
	@ lr needed for prologue
	bx	lr
.L21:
	.align	2
.L20:
	.word	curr_state
	.word	prev_state
	.size	keyHeld, .-keyHeld
	.align	2
	.global	keyHit
	.type	keyHit, %function
keyHit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L23
	ldr	r1, .L23+4
	ldrh	r2, [r3, #0]	@  curr_state
	ldrh	r3, [r1, #0]	@  prev_state
	bic	r2, r2, r3
	and	r2, r2, r0	@  key,  key
	mov	r0, r2	@  key
	@ lr needed for prologue
	bx	lr
.L24:
	.align	2
.L23:
	.word	curr_state
	.word	prev_state
	.size	keyHit, .-keyHit
	.align	2
	.global	keyReleased
	.type	keyReleased, %function
keyReleased:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	ldr	r2, .L26+4
	ldrh	r1, [r3, #0]	@  curr_state
	ldrh	r3, [r2, #0]	@  prev_state
	bic	r3, r3, r1
	and	r3, r3, r0	@  key,  key
	mov	r0, r3	@  key
	@ lr needed for prologue
	bx	lr
.L27:
	.align	2
.L26:
	.word	curr_state
	.word	prev_state
	.size	keyReleased, .-keyReleased
	.align	2
	.global	WaitVBlank
	.type	WaitVBlank, %function
WaitVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L32
	ldr	r2, [r3, #0]	@  ScanlineCounter
	@ lr needed for prologue
.L29:
	ldrh	r3, [r2, #0]
	cmp	r3, #159
	bls	.L29
	bx	lr
.L33:
	.align	2
.L32:
	.word	ScanlineCounter
	.size	WaitVBlank, .-WaitVBlank
	.align	2
	.global	DMAFastCopy
	.type	DMAFastCopy, %function
DMAFastCopy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #67108864
	cmp	r3, #-2080374784	@  mode
	cmpne	r3, #-2147483648	@  mode
	orr	r2, r2, r3	@  count,  mode
	streq	r0, [ip, #212]	@  source
	@ lr needed for prologue
	streq	r1, [ip, #216]	@  dest
	streq	r2, [ip, #220]
	bx	lr
	.size	DMAFastCopy, .-DMAFastCopy
	.global	map_Palette
	.section	.rodata
	.align	1
	.type	map_Palette, %object
	.size	map_Palette, 512
map_Palette:
	.short	0
	.short	25464
	.short	136
	.short	268
	.short	272
	.short	388
	.short	904
	.short	924
	.short	8460
	.short	8588
	.short	8592
	.short	8984
	.short	24584
	.short	24856
	.short	25348
	.short	21140
	.short	31
	.short	32767
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.global	map_Tiles
	.type	map_Tiles, %object
	.size	map_Tiles, 5760
map_Tiles:
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	17
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	17
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	7
	.byte	7
	.byte	7
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	14
	.byte	14
	.byte	14
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	14
	.byte	14
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	14
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	1
	.byte	1
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	15
	.byte	15
	.byte	9
	.byte	15
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	4
	.byte	4
	.byte	4
	.byte	8
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	8
	.byte	4
	.byte	4
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	4
	.byte	4
	.byte	3
	.byte	8
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	8
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	3
	.byte	5
	.byte	5
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	8
	.byte	4
	.byte	5
	.byte	5
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	8
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	8
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	8
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	8
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	8
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	9
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	15
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	15
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	15
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	0
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	10
	.byte	10
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	16
	.byte	16
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	17
	.byte	17
	.byte	17
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.global	emptyTiles
	.data
	.align	2
	.type	emptyTiles, %object
	.size	emptyTiles, 112
emptyTiles:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.global	tilesFromTop
	.bss
	.global	tilesFromTop
	.align	2
	.type	tilesFromTop, %object
	.size	tilesFromTop, 4
tilesFromTop:
	.space	4
	.text
	.align	2
	.global	setMineral
	.type	setMineral, %function
setMineral:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L37
	ldr	r2, [r3, #0]	@  mapWidthTiles
	ldr	r3, .L37+4
	add	r2, r0, r2	@  position
	ldr	ip, [r3, #0]	@  material_Map
	mov	r2, r2, asl #1
	mov	r0, r0, asl #1	@  position
	add	r6, r1, #27	@  tile
	add	r4, r0, ip
	add	lr, r1, #1	@  tile
	add	r5, r2, ip
	add	r3, r1, #26	@  tile
	strh	r1, [r0, ip]	@ movhi 	@  tile
	strh	lr, [r4, #2]	@ movhi 
	strh	r3, [r2, ip]	@ movhi 
	strh	r6, [r5, #2]	@ movhi 
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	mapWidthTiles
	.word	material_Map
	.size	setMineral, .-setMineral
	.align	2
	.global	setDirt
	.type	setDirt, %function
setDirt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L40
	ldr	r2, .L40+4
	ldr	r1, [r3, #0]	@  mapWidthTiles
	ldr	r3, .L40+8
	ldr	r8, [r2, #0]	@  bg0map
	ldr	ip, [r3, #0]	@  map_Map
	add	r1, r0, r1	@  position
	mov	r3, #62	@  tile
	mov	r0, r0, asl #1	@  position
	mov	r1, r1, asl #1
	add	lr, r0, r8
	add	r6, r3, #1	@  tile
	add	r7, r3, #26	@  tile
	add	r5, r3, #27	@  tile
	add	r2, r0, ip
	add	r4, r1, ip
	strh	r3, [r0, ip]	@ movhi 	@  tile
	strh	r6, [r2, #2]	@ movhi 
	strh	r7, [r1, ip]	@ movhi 
	strh	r5, [r4, #2]	@ movhi 
	strh	r3, [r0, r8]	@ movhi 	@  tile
	strh	r5, [lr, #66]	@ movhi 
	strh	r6, [lr, #2]	@ movhi 
	strh	r7, [lr, #64]	@ movhi 
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	mapWidthTiles
	.word	bg0map
	.word	map_Map
	.size	setDirt, .-setDirt
	.align	2
	.global	blackoutMinerals
	.type	blackoutMinerals, %function
blackoutMinerals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	r3, .L58
	ldr	r4, .L58+4
	mov	r2, #0
	mov	r6, #636
	str	r2, [r4, #0]	@  yLoop
	ldr	r5, [r3, #0]	@  mapWidthTiles
	ldr	r7, .L58+8
	ldr	r8, .L58+12
	add	r6, r6, #3
.L52:
	cmp	r2, r5
	str	r2, [r7, #0]	@  xLoop
	bge	.L56
	ldr	r3, [r4, #0]	@  yLoop
	ldr	lr, [r8, #0]	@  material_Map
	mov	ip, r3, asl #5
	mov	r0, r5
	mov	r1, r2
.L51:
	add	r3, ip, r1
	add	r1, r1, #1
	mov	r3, r3, asl #1
	mov	sl, #36	@ movhi
	cmp	r1, r0
	strh	sl, [r3, lr]	@ movhi 
	blt	.L51
	str	r1, [r7, #0]	@  xLoop
.L56:
	ldr	r3, [r4, #0]	@  yLoop
	add	r3, r3, #1
	cmp	r3, r6
	str	r3, [r4, #0]	@  yLoop
	ble	.L52
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	mapWidthTiles
	.word	yLoop
	.word	xLoop
	.word	material_Map
	.size	blackoutMinerals, .-blackoutMinerals
	.align	2
	.global	addAllMinerals
	.type	addAllMinerals, %function
addAllMinerals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	ldr	r5, .L107
	mov	r3, #28
	str	r3, [r5, #0]	@  yLoop
	ldr	r4, .L107+4
	ldr	r7, .L107+8
	ldr	r6, .L107+12
	sub	fp, ip, #4
.L91:
	mov	r3, #0
	str	r3, [r4, #0]	@  xLoop
.L90:
	mov	lr, pc
	bx	r7
	ldr	r3, .L107+16
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r3, r2, r1, asr #5	@  r
	add	r3, r3, r3, asl #2	@  r,  r
	add	r3, r3, r3, asl #2
	sub	r3, r0, r3, asl #2	@  r
	cmp	r3, #0	@  r
	beq	.L97
	cmp	r3, #1	@  r
	beq	.L97
	cmp	r3, #2	@  r
	beq	.L98
	cmp	r3, #3	@  r
	beq	.L99
	cmp	r3, #4	@  r
	beq	.L100
	cmp	r3, #5	@  r
	beq	.L101
	cmp	r3, #6	@  r
	beq	.L102
	cmp	r3, #7	@  r
	beq	.L103
	cmp	r3, #8	@  r
	beq	.L104
	cmp	r3, #9	@  r
	beq	.L105
	cmp	r3, #10	@  r
	beq	.L106
.L67:
	ldr	r3, [r4, #0]	@  xLoop
	add	r3, r3, #2
	cmp	r3, #31
	str	r3, [r4, #0]	@  xLoop
	ble	.L90
	ldr	r3, [r5, #0]	@  yLoop
	add	r3, r3, #2
	cmp	r3, #640
	str	r3, [r5, #0]	@  yLoop
	blt	.L91
	ldmea	fp, {r4, r5, r6, r7, fp, sp, lr}
	bx	lr
.L106:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #60
.L96:
	bl	setMineral
	b	.L67
.L105:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #58
	b	.L96
.L104:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #56
	b	.L96
.L103:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #54
	b	.L96
.L102:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #52
	b	.L96
.L101:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #50
	b	.L96
.L100:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #48
	b	.L96
.L99:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #46
	b	.L96
.L98:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #44
	b	.L96
.L97:
	ldr	r1, [r5, #0]	@  yLoop
	ldr	r2, [r6, #0]	@  mapWidthTiles
	ldr	r3, [r4, #0]	@  xLoop
	mla	r0, r2, r1, r3
	mov	r1, #42
	b	.L96
.L108:
	.align	2
.L107:
	.word	yLoop
	.word	xLoop
	.word	rand
	.word	mapWidthTiles
	.word	1374389535
	.size	addAllMinerals, .-addAllMinerals
	.global	aboveGround
	.section	.rodata
	.align	1
	.type	aboveGround, %object
	.size	aboveGround, 2048
aboveGround:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	2
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	5
	.short	6
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	8
	.short	9
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	10
	.short	1034
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	10
	.short	1034
	.short	0
	.short	0
	.short	0
	.short	0
	.short	11
	.short	12
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	2
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	5
	.short	6
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	15
	.short	16
	.short	17
	.short	18
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	8
	.short	9
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	19
	.short	20
	.short	21
	.short	22
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	11
	.short	12
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	10
	.short	1034
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	10
	.short	1034
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	10
	.short	1034
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	15
	.short	16
	.short	17
	.short	18
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	19
	.short	20
	.short	21
	.short	22
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	15
	.short	16
	.short	17
	.short	18
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	19
	.short	20
	.short	21
	.short	22
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	10
	.short	1034
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	14
	.short	0
	.short	0
	.short	8
	.short	9
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	2
	.short	3
	.short	0
	.short	0
	.short	0
	.short	23
	.short	1047
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	11
	.short	12
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	5
	.short	6
	.short	7
	.short	0
	.short	0
	.short	2071
	.short	3095
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	15
	.short	16
	.short	17
	.short	18
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	19
	.short	20
	.short	21
	.short	22
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	24
	.short	25
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	26
	.short	26
	.short	27
	.short	27
	.short	1049
	.short	1048
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	24
	.short	25
	.short	27
	.short	27
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	26
	.short	28
	.short	29
	.short	28
	.short	29
	.short	28
	.short	29
	.short	30
	.short	31
	.short	30
	.short	31
	.short	30
	.short	31
	.short	30
	.short	31
	.short	30
	.short	31
	.short	30
	.short	31
	.short	30
	.short	31
	.short	30
	.short	31
	.short	30
	.short	31
	.short	28
	.short	29
	.short	28
	.short	29
	.short	28
	.short	29
	.short	28
	.short	29
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	32
	.short	33
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.short	34
	.short	35
	.space	192
	.text
	.align	2
	.global	generateMap
	.type	generateMap, %function
generateMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	ldr	lr, .L131
	sub	fp, ip, #4
	mov	r0, #892
	ldr	ip, .L131+4
	ldr	r1, [lr, #0]	@  map_Map
	mov	r2, #0	@  i
	add	r0, r0, #3
.L114:
	mov	r3, r2, asl #1	@  i
	ldrh	r4, [r3, ip]	@ movhi	@  aboveGround
	add	r2, r2, #1	@  i,  i
	cmp	r2, r0	@  i
	strh	r4, [r3, r1]	@ movhi 
	ble	.L114
	ldr	r3, .L131+8
	ldr	r6, [r3, #0]	@  mapWidthTiles
	ldr	ip, [lr, #0]	@  map_Map
	rsb	r3, r6, r6, asl #3
	mov	r4, r3, asl #2
	mov	r5, #28	@  yLoop
	mov	r7, r6, asl #1
.L124:
	add	r3, r4, r6
	mov	r0, r3, asl #1
	mov	lr, #0	@  xLoop
	mov	r1, r4, asl #1
.L123:
	mov	r8, #32	@ movhi
	strh	r8, [r1, ip]	@ movhi 
	add	r3, r1, ip
	mov	r8, #33	@ movhi
	add	lr, lr, #2	@  xLoop,  xLoop
	strh	r8, [r3, #2]	@ movhi 
	add	r2, r0, ip
	mov	r3, #34	@ movhi
	mov	r8, #35	@ movhi
	cmp	lr, #31	@  xLoop
	strh	r3, [r0, ip]	@ movhi 
	add	r1, r1, #4
	strh	r8, [r2, #2]	@ movhi 
	add	r0, r0, #4
	ble	.L123
	add	r5, r5, #2	@  yLoop,  yLoop
	cmp	r5, #640	@  yLoop
	add	r4, r4, r7
	ble	.L124
	bl	blackoutMinerals
	ldmea	fp, {r4, r5, r6, r7, r8, fp, sp, lr}
	b	addAllMinerals
.L132:
	.align	2
.L131:
	.word	map_Map
	.word	aboveGround
	.word	mapWidthTiles
	.size	generateMap, .-generateMap
	.align	2
	.global	loadStartingPosition
	.type	loadStartingPosition, %function
loadStartingPosition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r3, .L149
	ldr	r2, .L149+4
	ldr	r7, [r3, #0]	@  bg0map
	ldr	r2, [r2, #0]	@  mapWidthTiles
	ldr	r3, .L149+8
	sub	sp, sp, #4
	ldr	r8, .L149+12
	str	r2, [sp, #0]
	ldr	r6, [r3, #0]	@  map_Map
	ldr	r2, .L149+16
	ldr	r3, .L149+20
	mov	r1, #0
	str	r1, [r8, #0]	@  yLoop
	ldr	r5, [r2, #0]	@  bg1map
	ldr	r4, [r3, #0]	@  material_Map
	ldr	r9, .L149+24
.L143:
	ldr	r1, [r8, #0]	@  yLoop
	ldr	lr, [sp, #0]
	mul	lr, r1, lr
	mov	r3, #0
	str	r3, [r9, #0]	@  xLoop
	mov	ip, r1, asl #5
	mov	r0, r3
.L142:
	add	r3, r0, lr
	mov	r3, r3, asl #1
	ldrh	sl, [r3, r6]	@ movhi
	add	r2, ip, r0
	mov	r2, r2, asl #1
	strh	sl, [r2, r7]	@ movhi 
	add	r0, r0, #1
	ldrh	r3, [r3, r4]	@ movhi
	cmp	r0, #31
	strh	r3, [r2, r5]	@ movhi 
	ble	.L142
	add	r3, r1, #1
	cmp	r3, #31
	str	r0, [r9, #0]	@  xLoop
	str	r3, [r8, #0]	@  yLoop
	ble	.L143
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	bg0map
	.word	mapWidthTiles
	.word	map_Map
	.word	yLoop
	.word	bg1map
	.word	material_Map
	.word	xLoop
	.size	loadStartingPosition, .-loadStartingPosition
	.align	2
	.global	isTileOpen
	.type	isTileOpen, %function
isTileOpen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L160
	ldr	r2, [r3, #0]	@  map_Map
	mov	r0, r0, asl #1	@  tileToCheck
	ldrh	r1, [r0, r2]
	ldr	r0, .L160+4
	@ lr needed for prologue
	mov	r2, #0	@  i
.L157:
	ldr	r3, [r0, r2, asl #2]	@  emptyTiles
	cmp	r1, r3
	add	r2, r2, #1	@  i,  i
	moveq	r0, #1	@  tileToCheck
	bxeq	lr
	cmp	r2, #27	@  i
	movhi	r0, #0	@  tileToCheck
	bls	.L157
	bx	lr
.L161:
	.align	2
.L160:
	.word	map_Map
	.word	emptyTiles
	.size	isTileOpen, .-isTileOpen
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"top\000"
	.align	2
.LC1:
	.ascii	"right\000"
	.align	2
.LC2:
	.ascii	"bottom\000"
	.align	2
.LC3:
	.ascii	"left\000"
	.text
	.align	2
	.global	checkDirection
	.type	checkDirection, %function
checkDirection:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	ldr	r3, .L170
	ldr	r1, .L170+4
	mov	r2, #4
	sub	fp, ip, #4
	ldr	r6, .L170+8
	ldr	r4, [r3, #40]	@  tileToCompare,  bg.tileUnderPlayer
	mov	r5, r0	@  direction
	mov	lr, pc
	bx	r6
	mov	r3, r0	@  direction
	cmp	r3, #0	@  direction
	ldreq	r3, .L170+12
	mov	r2, #6
	ldreq	r2, [r3, #0]	@  mapWidthTiles
	ldr	r1, .L170+16
	mov	r0, r5	@  direction
	rsbeq	r4, r2, r4	@  tileToCompare,  tileToCompare
	beq	.L164
	mov	lr, pc
	bx	r6
	mov	r3, r0	@  direction
	cmp	r3, #0	@  direction
	mov	r0, r5	@  direction
	ldr	r1, .L170+20
	mov	r2, #7
	addeq	r4, r4, #2	@  tileToCompare,  tileToCompare
	beq	.L164
	mov	lr, pc
	bx	r6
	mov	r3, r0	@  direction
	cmp	r3, #0	@  direction
	ldreq	r3, .L170+12
	mov	r2, #5
	ldreq	r2, [r3, #0]	@  mapWidthTiles
	mov	r0, r5	@  direction
	ldr	r1, .L170+24
	addeq	r4, r4, r2	@  tileToCompare,  tileToCompare
	beq	.L164
	mov	lr, pc
	bx	r6
	cmp	r0, #0	@  direction
	subeq	r4, r4, #2	@  tileToCompare,  tileToCompare
.L164:
	mov	r0, r4	@  tileToCompare
	ldmea	fp, {r4, r5, r6, fp, sp, lr}
	b	isTileOpen
.L171:
	.align	2
.L170:
	.word	bg
	.word	.LC0
	.word	memcmp
	.word	mapWidthTiles
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	checkDirection, .-checkDirection
	.align	2
	.global	initbackgrounds
	.type	initbackgrounds, %function
initbackgrounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	mov	r0, #40960
	sub	fp, ip, #4
	ldr	r4, .L173+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L173+28
	mov	r2, r0
	str	r2, [r3, #0]	@  material_Map
	mov	r0, #40960
	mov	lr, pc
	bx	r4
	ldr	r3, .L173+32
	str	r0, [r3, #0]	@  map_Map
	ldr	r3, .L173+36
	mov	r2, #640
	str	r2, [r3, #0]	@  mapHeightTiles
	ldr	r3, .L173+40
	mov	r0, #240
	str	r0, [r3, #0]	@  screenWidth
	ldr	r3, .L173+44
	mov	r2, #16
	str	r2, [r3, #0]	@  playerXTile
	ldr	r3, .L173+48
	mov	r0, #10
	mov	lr, #100663296
	str	r0, [r3, #0]	@  playerYTile
	ldr	r3, .L173+52
	ldr	r1, .L173+56
	add	r6, lr, #63488
	add	lr, lr, #47104
	mov	r2, #2
	str	lr, [r3, #0]	@  bg0map
	ldr	r3, .L173+60
	mov	ip, #0
	str	r2, [r1, #72]	@  bg.maxRocketVelocity
	ldr	r2, .L173+64
	str	ip, [r3, #0]	@  x
	ldr	r3, .L173+68
	mov	r4, #32
	str	r6, [r2, #0]	@  bg1map
	ldr	r2, .L173+72
	mov	r7, #160
	str	r4, [r3, #0]	@  mapWidthTiles
	ldr	r3, .L173+76
	mov	r5, r7, asl #1
	str	ip, [r2, #0]	@  y
	ldr	r2, .L173+80
	add	r5, r5, #15
	str	ip, [r3, #0]	@  xLoop
	mov	r3, #31
	str	r3, [r1, #4]	@  bg.xBGBehind
	str	r4, [r1, #16]	@  bg.yMapAhead
	str	r5, [r1, #40]	@  bg.tileUnderPlayer
	mov	r3, #3
	str	r4, [r1, #8]	@  bg.xMapAhead
	str	r7, [r2, #0]	@  screenHeight
	adr	r4, .L173
	ldmia	r4, {r4-r5}
	ldr	r2, .L173+84
	str	r3, [r1, #68]	@  bg.terminalVelocity
	add	r3, r1, #44
	stmia	r3, {r4-r5}	@  bg.rocketPower
	str	ip, [r2, #0]	@  yLoop
	adr	r3, .L173+8
	ldmia	r3, {r3-r4}
	mov	r2, #30
	str	r2, [r1, #0]	@  bg.xBGAhead
	add	r2, r1, #52
	mvn	r8, #0
	stmia	r2, {r3-r4}	@  bg.gravity
	adr	r4, .L173+16
	ldmia	r4, {r4-r5}
	str	r8, [r1, #20]	@  bg.yMapBehind
	str	ip, [r1, #36]	@  bg.deltaY
	str	r8, [r1, #12]	@  bg.xMapBehind
	str	ip, [r1, #24]	@  bg.ulx
	str	ip, [r1, #28]	@  bg.uly
	str	ip, [r1, #32]	@  bg.deltaX
	add	r1, r1, #60
	stmia	r1, {r4-r5}	@  bg.playerVelocity
	ldmea	fp, {r4, r5, r6, r7, r8, fp, sp, lr}
	bx	lr
.L174:
	.align	2
.L173:
	.word	1069757235
	.word	858993459
	.word	1069128089
	.word	-1717986918
	.word	0
	.word	0
	.word	malloc
	.word	material_Map
	.word	map_Map
	.word	mapHeightTiles
	.word	screenWidth
	.word	playerXTile
	.word	playerYTile
	.word	bg0map
	.word	bg
	.word	x
	.word	bg1map
	.word	mapWidthTiles
	.word	y
	.word	xLoop
	.word	screenHeight
	.word	yLoop
	.size	initbackgrounds, .-initbackgrounds
	.align	2
	.global	loadBackground
	.type	loadBackground, %function
loadBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	r3, #6016
	mov	ip, sp
	mov	r2, #67108864
	add	r3, r3, #1
	stmfd	sp!, {fp, ip, lr, pc}
	strh	r3, [r2, #8]	@ movhi 
	mov	r3, #8064	@ movhi
	sub	fp, ip, #4
	strh	r3, [r2, #10]	@ movhi 
	ldr	r0, .L176
	mov	r1, #83886080
	mov	r2, #256
	mov	r3, #-2147483648
	bl	DMAFastCopy
	mov	r1, #100663296
	mov	r2, #3072
	ldr	r0, .L176+4
	mov	r3, #-2080374784
	bl	DMAFastCopy
	ldr	r3, .L176+8
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r2, .L176+12
	mov	lr, pc
	bx	r2
	bl	generateMap
	ldmea	fp, {fp, sp, lr}
	b	loadStartingPosition
.L177:
	.align	2
.L176:
	.word	map_Palette
	.word	map_Tiles
	.word	time
	.word	srand
	.size	loadBackground, .-loadBackground
	.global	__subdf3
	.global	__floatsidf
	.global	__ltdf2
	.global	__adddf3
	.global	__fixdfsi
	.global	__gtdf2
	.align	2
	.global	drawBackground
	.type	drawBackground, %function
drawBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	keyPoll
	bl	WaitVBlank
	mov	r0, #1
	bl	keyIsDown
	cmp	r0, #0
	bne	.L180
	mov	r0, #2
	bl	keyIsDown
	cmp	r0, #0
	bne	.L180
	mov	r0, #8
	bl	keyIsDown
	cmp	r0, #0
	bne	.L180
	mov	r0, #4
	bl	keyIsDown
	cmp	r0, #0
	bne	.L180
	mov	r0, #256
	bl	keyIsDown
	cmp	r0, #0
	bne	.L180
	mov	r0, #512
	bl	keyIsDown
	cmp	r0, #0
	ldreq	sl, .L216+8
	beq	.L179
.L180:
	ldr	sl, .L216+8
	ldr	r0, [sl, #40]	@  bg.tileUnderPlayer
	bl	setDirt
.L179:
	mov	r0, #64
	bl	keyIsDown
	cmp	r0, #0
	beq	.L181
	ldr	r1, .L216+12
	ldr	r6, [r1, #0]	@  y
	cmp	r6, #16
	ble	.L187
	ldr	r2, .L216+16
	ldr	r3, [r2, #0]	@  mapHeightTiles
	mov	r3, r3, asl #3
	sub	r3, r3, #16
	cmp	r6, r3
	bge	.L187
	ldr	r2, .L216+8
	ldr	r5, .L216+20
	add	r1, r2, #44
	ldmia	r1, {r2-r3}	@  bg.rocketPower
	ldr	ip, .L216+24
	ldmia	r5, {r0-r1}	@  bg.playerVelocity
	mov	lr, pc
	bx	ip
	ldr	ip, .L216+20
	mov	r5, r1
	mov	r4, r0
	ldr	r0, [sl, #72]	@  bg.maxRocketVelocity
	stmia	ip, {r4-r5}	@  bg.playerVelocity
	rsb	r0, r0, #0
	ldr	r9, .L216+28
	mov	lr, pc
	bx	r9
	mov	r8, r1
	mov	r7, r0
	mov	r3, r8
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	ldr	ip, .L216+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	blt	.L215
.L183:
	ldr	r5, .L216+20
	mov	r0, r6
	mov	lr, pc
	bx	r9
	ldr	r8, .L216+36
	ldmia	r5, {r2-r3}	@  bg.playerVelocity
	mov	lr, pc
	bx	r8
	ldr	r6, .L216+40
	mov	lr, pc
	bx	r6
	ldr	r7, .L216+44
	mov	lr, pc
	bx	r7
	ldr	ip, .L216+8
	ldr	r1, .L216+12
	ldr	r3, [ip, #36]	@  bg.deltaY
	str	r0, [r1, #0]	@  y
	mov	r0, r3
	mov	lr, pc
	bx	r9
	ldr	r2, .L216+20
	mov	r5, r1
	mov	r4, r0
	ldmia	r2, {r0-r1}	@  bg.playerVelocity
	mov	lr, pc
	bx	r6
	mov	r3, r1
	mov	r2, r0
	mov	r1, r5
	mov	r0, r4
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	ldr	r3, .L216+8
	str	r0, [r3, #36]	@  bg.deltaY
.L186:
	mov	r0, #32
	bl	keyIsDown
	cmp	r0, #0
	ldreq	r4, .L216+48
	beq	.L191
	ldr	r4, .L216+48
	ldr	r2, [r4, #0]	@  x
	cmp	r2, #0
	ldrgt	r3, [sl, #32]	@  bg.deltaX
	subgt	r2, r2, #1
	subgt	r3, r3, #1
	strgt	r2, [r4, #0]	@  x
	strgt	r3, [sl, #32]	@  bg.deltaX
.L191:
	mov	r0, #16
	bl	keyIsDown
	cmp	r0, #0
	beq	.L192
	ldr	r2, [r4, #0]	@  x
	cmp	r2, #15
	ldrle	r3, [sl, #32]	@  bg.deltaX
	addle	r2, r2, #1
	addle	r3, r3, #1
	strle	r2, [r4, #0]	@  x
	strle	r3, [sl, #32]	@  bg.deltaX
.L192:
	mov	r0, #128
	bl	keyIsDown
	cmp	r0, #0
	beq	.L193
	ldr	r3, .L216+16
	ldr	r2, [r3, #0]	@  mapHeightTiles
	ldr	r3, .L216+12
	ldr	r1, [r3, #0]	@  y
	cmp	r1, r2, asl #3
	bge	.L193
	ldr	r3, [sl, #36]	@  bg.deltaY
	ldr	r5, .L216+12
	add	r2, r1, #1
	add	r3, r3, #1
	str	r2, [r5, #0]	@  y
	str	r3, [sl, #36]	@  bg.deltaY
.L193:
	ldr	ip, .L216+12
	ldr	r0, [sl, #32]	@  bg.deltaX
	ldrh	r1, [r4, #0]	@  x
	ldrh	r3, [ip, #0]	@  y
	mov	r2, #67108864
	cmn	r0, #8
	strh	r3, [r2, #18]	@ movhi 
	strh	r3, [r2, #22]	@ movhi 
	strh	r1, [r2, #16]	@ movhi 
	strh	r1, [r2, #20]	@ movhi 
	ldr	r1, .L216+8
	bgt	.L194
	ldr	r3, [sl, #40]	@  bg.tileUnderPlayer
	mov	r2, #0
	sub	r3, r3, #1
	str	r2, [sl, #32]	@  bg.deltaX
	str	r3, [sl, #40]	@  bg.tileUnderPlayer
.L195:
	ldr	r6, [sl, #36]	@  bg.deltaY
	cmn	r6, #8
	ldr	r7, .L216+8
	bgt	.L197
	ldr	r5, .L216+52
	ldr	lr, [r5, #0]	@  tilesFromTop
	sub	lr, lr, #1
	sub	r1, lr, #1
	cmp	r1, #0
	rsblt	r1, r1, #0
	mov	r2, r1, asr #31
	add	r2, r1, r2, lsr #27
	ldr	r3, .L216+56
	bic	r2, r2, #31
	rsb	r1, r2, r1
	ldr	r8, .L216+60
	ldr	r4, [r3, #0]	@  mapWidthTiles
	mov	r3, r1, asl #5
	ldr	ip, [sl, #40]	@  bg.tileUnderPlayer
	str	r3, [r8, #0]	@  locationToPaste
	ldr	r3, .L216+64
	mov	r0, lr, asl #5
	add	r2, r6, #8
	str	lr, [r5, #0]	@  tilesFromTop
	ldr	r9, .L216+68
	ldr	r5, .L216+72
	rsb	ip, r4, ip
	sub	r0, r0, #32
	str	r2, [sl, #36]	@  bg.deltaY
	ldr	r4, [r3, #0]	@  bg0map
	ldr	r2, .L216+76
	ldr	r3, .L216+80
	cmp	r0, #0
	rsblt	r0, r0, #0
	str	ip, [sl, #40]	@  bg.tileUnderPlayer
	ldr	lr, [r9, #0]	@  map_Map
	ldr	ip, [r5, #0]	@  bg1map
	str	r0, [r2, #0]	@  tileToCopy
	mov	r1, r1, asl #6
	ldr	r2, [r3, #0]	@  material_Map
	mov	r0, r0, asl #1
	mov	r3, #31	@  loopMe
.L202:
	ldrh	r5, [r0, lr]	@ movhi
	strh	r5, [r1, r4]	@ movhi 
	ldrh	r5, [r0, r2]	@ movhi
	subs	r3, r3, #1	@  loopMe,  loopMe
	strh	r5, [r1, ip]	@ movhi 
	add	r0, r0, #2
	add	r1, r1, #2
	bpl	.L202
.L178:
	ldmea	fp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
	bx	lr
.L197:
	cmp	r6, #7
	ble	.L178
	ldr	r5, .L216+52
	ldr	r0, [r5, #0]	@  tilesFromTop
	add	lr, r0, #22
	mov	r2, lr, asr #31
	ldr	r3, .L216+56
	add	r2, lr, r2, lsr #27
	ldr	r4, [r3, #0]	@  mapWidthTiles
	bic	r2, r2, #31
	ldr	r1, [r7, #40]	@  bg.tileUnderPlayer
	add	r0, r0, #1
	rsb	lr, r2, lr
	ldr	r8, .L216+60
	sub	r2, r6, #8
	add	r1, r1, r4
	mov	r3, lr, asl #5
	str	r0, [r5, #0]	@  tilesFromTop
	ldr	r9, .L216+68
	str	r2, [r7, #36]	@  bg.deltaY
	ldr	r5, .L216+80
	ldr	r2, .L216+64
	mov	ip, r0, asl #5
	str	r1, [r7, #40]	@  bg.tileUnderPlayer
	str	r3, [r8, #0]	@  locationToPaste
	ldr	r1, .L216+76
	ldr	r3, .L216+72
	add	ip, ip, #672
	ldr	r4, [r2, #0]	@  bg0map
	ldr	r0, [r9, #0]	@  map_Map
	ldr	r2, [r5, #0]	@  material_Map
	str	ip, [r1, #0]	@  tileToCopy
	mov	lr, lr, asl #6
	ldr	r1, [r3, #0]	@  bg1map
	mov	ip, ip, asl #1
	mov	r3, #31	@  loopMe
.L209:
	ldrh	r5, [ip, r0]	@ movhi
	strh	r5, [lr, r4]	@ movhi 
	ldrh	r5, [ip, r2]	@ movhi
	subs	r3, r3, #1	@  loopMe,  loopMe
	strh	r5, [lr, r1]	@ movhi 
	add	ip, ip, #2
	add	lr, lr, #2
	bpl	.L209
	b	.L178
.L194:
	cmp	r0, #7
	ldrgt	r3, [r1, #40]	@  bg.tileUnderPlayer
	movgt	r2, #0
	addgt	r3, r3, #1
	strgt	r3, [r1, #40]	@  bg.tileUnderPlayer
	strgt	r2, [r1, #32]	@  bg.deltaX
	b	.L195
.L215:
	ldr	r1, .L216+20
	stmia	r1, {r7-r8}	@  bg.playerVelocity
	b	.L183
.L187:
	ldr	r3, .L216+20
	adr	r1, .L216
	ldmia	r1, {r1-r2}
	stmia	r3, {r1-r2}	@  bg.playerVelocity
	b	.L186
.L181:
	ldr	r0, .L216+84
	bl	checkDirection
	cmp	r0, #1
	bne	.L187
	ldr	r2, .L216+8
	add	r8, r2, #60
	add	r1, r2, #52
	ldmia	r1, {r2-r3}	@  bg.gravity
	ldr	r5, .L216+36
	ldmia	r8, {r0-r1}	@  bg.playerVelocity
	mov	lr, pc
	bx	r5
	mov	r5, r1
	mov	r4, r0
	ldr	r9, .L216+28
	ldr	r0, [sl, #68]	@  bg.terminalVelocity
	stmia	r8, {r4-r5}	@  bg.playerVelocity
	mov	lr, pc
	bx	r9
	mov	r7, r1
	mov	r6, r0
	mov	r3, r7
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	ldr	ip, .L216+88
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	stmgtia	r8, {r6-r7}	@  bg.playerVelocity
.L188:
	ldr	ip, .L216+12
	ldr	r0, [ip, #0]	@  y
	mov	lr, pc
	bx	r9
	ldr	r5, .L216+36
	ldmia	r8, {r2-r3}	@  bg.playerVelocity
	mov	lr, pc
	bx	r5
	ldr	r6, .L216+40
	mov	lr, pc
	bx	r6
	ldr	r7, .L216+44
	mov	lr, pc
	bx	r7
	ldr	ip, .L216+8
	ldr	r1, .L216+12
	ldr	r3, [ip, #36]	@  bg.deltaY
	str	r0, [r1, #0]	@  y
	mov	r0, r3
	mov	lr, pc
	bx	r9
	mov	r5, r1
	mov	r4, r0
	ldmia	r8, {r0-r1}	@  bg.playerVelocity
	mov	lr, pc
	bx	r6
	mov	r3, r1
	mov	r2, r0
	mov	r1, r5
	mov	r0, r4
	ldr	r5, .L216+36
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r7
	ldr	ip, .L216+8
	str	r0, [ip, #36]	@  bg.deltaY
	b	.L186
.L217:
	.align	2
.L216:
	.word	0
	.word	0
	.word	bg
	.word	y
	.word	mapHeightTiles
	.word	bg+60
	.word	__subdf3
	.word	__floatsidf
	.word	__ltdf2
	.word	__adddf3
	.word	floor
	.word	__fixdfsi
	.word	x
	.word	tilesFromTop
	.word	mapWidthTiles
	.word	locationToPaste
	.word	bg0map
	.word	map_Map
	.word	bg1map
	.word	tileToCopy
	.word	material_Map
	.word	.LC2
	.word	__gtdf2
	.size	drawBackground, .-drawBackground
	.align	2
	.global	DrawPixel4
	.type	DrawPixel4, %function
DrawPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	rsb	r1, r1, r1, asl #4	@  y,  y
	add	r1, r0, r1, asl #4	@  x
	ldr	r3, .L221
	bic	ip, r1, #-16777216
	ldr	lr, [r3, #0]	@  videoBuffer
	bic	ip, ip, #16646144
	bic	ip, ip, #1
	ldrsh	r3, [ip, lr]	@  pixel
	and	r2, r2, #255	@  color
	and	r1, r3, #65280	@  pixel
	and	r3, r3, #255	@  pixel
	tst	r0, #1	@  x
	add	r1, r1, r2	@  color
	add	r3, r3, r2, asl #8	@  color
	strneh	r3, [ip, lr]	@ movhi 
	streqh	r1, [ip, lr]	@ movhi 
	ldr	lr, [sp], #4
	bx	lr
.L222:
	.align	2
.L221:
	.word	videoBuffer
	.size	DrawPixel4, .-DrawPixel4
	.align	2
	.global	DrawBox4
	.type	DrawBox4, %function
DrawBox4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, fp, ip, lr, pc}
	cmp	r0, r2	@  x,  right
	sub	fp, ip, #4
	mov	sl, r2	@  right
	mov	r5, r0	@  x,  left
	mov	r8, r1	@  top
	mov	r6, r3	@  bottom
	ldrb	r7, [fp, #4]	@ zero_extendqisi2	@  color,  color
	bge	.L235
.L233:
	cmp	r8, r6	@  y,  bottom
	mov	r4, r8	@  y,  top
	blt	.L232
.L237:
	add	r5, r5, #1	@  x,  x
	cmp	r5, sl	@  x,  right
	blt	.L233
.L235:
	ldmea	fp, {r4, r5, r6, r7, r8, sl, fp, sp, lr}
	bx	lr
.L232:
	mov	r1, r4	@  y
	mov	r0, r5	@  x
	mov	r2, r7	@  color
	add	r4, r4, #1	@  y,  y
	bl	DrawPixel4
	cmp	r4, r6	@  y,  bottom
	blt	.L232
	b	.L237
	.size	DrawBox4, .-DrawBox4
	.align	2
	.global	FlipPage
	.type	FlipPage, %function
FlipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #67108864
	ldrh	r3, [r0, #0]
	tst	r3, #16
	ldrne	r3, .L242
	ldreq	r3, .L242+4
	ldrneh	r2, [r0, #0]
	ldreqh	r2, [r0, #0]
	ldrne	r1, [r3, #0]	@  BackBuffer
	ldreq	r1, [r3, #0]	@  FrontBuffer
	ldr	r3, .L242+8
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	@ lr needed for prologue
	strh	r2, [r0, #0]	@ movhi 
	str	r1, [r3, #0]	@  videoBuffer
	bx	lr
.L243:
	.align	2
.L242:
	.word	BackBuffer
	.word	FrontBuffer
	.word	videoBuffer
	.size	FlipPage, .-FlipPage
	.align	2
	.global	DrawPixel3
	.type	DrawPixel3, %function
DrawPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	sub	fp, ip, #4
	mov	r6, r2, asl #16
	mov	r5, r0	@  x
	mov	r4, r1	@  y
	bl	WaitVBlank
	ldr	r3, .L245
	rsb	r4, r4, r4, asl #4	@  y,  y
	add	r5, r5, r4, asl #4	@  x
	ldr	r2, [r3, #0]	@  videoBuffer
	mov	r6, r6, asr #16	@  c
	mov	r5, r5, asl #1
	strh	r6, [r5, r2]	@ movhi 	@  c
	ldmea	fp, {r4, r5, r6, fp, sp, lr}
	bx	lr
.L246:
	.align	2
.L245:
	.word	videoBuffer
	.size	DrawPixel3, .-DrawPixel3
	.align	2
	.global	DrawCircle3
	.type	DrawCircle3, %function
DrawCircle3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	mov	r9, #0	@  x
	mov	sl, r2	@  y,  radius
	cmp	r9, r2	@  x,  y
	mov	r2, r2, asl #1	@  y
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, r3, asl #16
	rsb	r2, r2, #3
	mov	r3, r3, asr #16	@  color
	str	r0, [fp, #-44]	@  xCenter
	str	r1, [fp, #-48]	@  yCenter
	str	r2, [fp, #-52]	@  p
	bgt	.L255
	mov	r3, r3, asl #16	@  color
	mov	r8, r3, lsr #16	@  radius
.L253:
	ldr	r1, [fp, #-44]	@  xCenter
	ldr	r2, [fp, #-48]	@  yCenter
	add	r6, r1, r9	@  xCenter,  x
	add	r4, r2, sl	@  yCenter,  y
	rsb	r7, r9, r1	@  xCenter,  x
	mov	r0, r6	@  xCenter
	mov	r1, r4	@  yCenter
	mov	r2, r8	@  radius
	bl	DrawPixel3
	ldr	r3, [fp, #-48]	@  yCenter
	mov	r1, r4	@  yCenter
	rsb	r5, sl, r3	@  yCenter,  y
	mov	r0, r7	@  xCenter
	mov	r2, r8	@  radius
	bl	DrawPixel3
	mov	r0, r6	@  xCenter
	mov	r1, r5	@  yCenter
	mov	r2, r8	@  radius
	bl	DrawPixel3
	ldr	r3, [fp, #-48]	@  yCenter
	add	r4, r3, r9	@  yCenter,  x
	ldr	r3, [fp, #-44]	@  xCenter
	mov	r0, r7	@  xCenter
	mov	r1, r5	@  yCenter
	mov	r2, r8	@  radius
	add	r6, r3, sl	@  xCenter,  y
	bl	DrawPixel3
	ldr	r1, [fp, #-44]	@  xCenter
	mov	r0, r6	@  xCenter
	rsb	r7, sl, r1	@  xCenter,  y
	mov	r2, r8	@  radius
	mov	r1, r4	@  yCenter
	bl	DrawPixel3
	ldr	r2, [fp, #-48]	@  yCenter
	mov	r1, r4	@  yCenter
	rsb	r5, r9, r2	@  yCenter,  x
	mov	r0, r7	@  xCenter
	mov	r2, r8	@  radius
	bl	DrawPixel3
	mov	r0, r6	@  xCenter
	mov	r1, r5	@  yCenter
	mov	r2, r8	@  radius
	bl	DrawPixel3
	mov	r1, r5	@  yCenter
	mov	r2, r8	@  radius
	mov	r0, r7	@  xCenter
	bl	DrawPixel3
	ldr	r1, [fp, #-52]	@  p
	rsb	r3, sl, r9	@  y,  x
	cmp	r1, #0
	add	r2, r1, r9, asl #2	@  x
	add	r3, r1, r3, asl #2
	addlt	r2, r2, #6
	addge	r3, r3, #10
	subge	sl, sl, #1	@  y,  y
	add	r9, r9, #1	@  x,  x
	strlt	r2, [fp, #-52]	@  p
	strge	r3, [fp, #-52]	@  p
	cmp	r9, sl	@  x,  y
	ble	.L253
.L255:
	ldmea	fp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
	bx	lr
	.size	DrawCircle3, .-DrawCircle3
	.align	2
	.global	DrawLine3
	.type	DrawLine3, %function
DrawLine3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	mov	r5, r3	@  y2
	mov	r4, r2	@  x2
	rsb	r3, r0, r2	@  x1,  x2
	rsb	r2, r1, r5	@  y1,  y2
	sub	fp, ip, #4
	sub	sp, sp, #16
	eor	lr, r3, r3, asr #31	@  deltax
	sub	lr, lr, r3, asr #31	@  deltax
	eor	ip, r2, r2, asr #31	@  deltay
	sub	ip, ip, r2, asr #31	@  deltay
	cmp	lr, ip	@  deltax,  deltay
	ldrsh	r8, [fp, #4]	@  color,  color
	blt	.L258
	mov	r3, ip, asl #1	@  dinc1,  deltay
	rsb	r2, lr, ip	@  deltax,  deltay
	mov	sl, #1	@  xinc2
	str	r3, [fp, #-44]	@  dinc1,  dinc1
	mov	r9, r2, asl sl	@  dinc2
	rsb	r7, lr, r3	@  d,  deltax,  dinc1
	add	r2, lr, sl	@  numpixels,  deltax
	mov	ip, sl	@  xinc1,  xinc2
	mov	r3, #0	@  yinc1
.L271:
	cmp	r0, r4	@  x1,  x2
	str	sl, [fp, #-48]	@  xinc2,  yinc2
	rsbgt	ip, ip, #0	@  xinc1,  xinc1
	mvngt	sl, #0	@  xinc2
	cmp	r1, r5	@  y1,  y2
	mvngt	lr, #0
	rsbgt	r3, r3, #0	@  yinc1,  yinc1
	strgt	lr, [fp, #-48]	@  yinc2
	cmp	r2, #1	@  numpixels
	mov	r6, r0	@  x,  x1
	mov	r5, r1	@  y,  y1
	ble	.L270
	mov	r8, r8, asl #16	@  color
	sub	r4, r2, #1	@  i,  numpixels
.L268:
	mov	r0, r6	@  x
	mov	r1, r5	@  y
	mov	r2, r8, lsr #16
	str	r3, [fp, #-52]
	str	ip, [fp, #-56]
	bl	DrawPixel3
	cmp	r7, #0	@  d
	ldrlt	r2, [fp, #-44]	@  dinc1
	ldrge	lr, [fp, #-48]	@  yinc2
	ldr	r3, [fp, #-52]
	ldr	ip, [fp, #-56]
	addlt	r7, r7, r2	@  d,  d
	addlt	r6, r6, ip	@  x,  x,  xinc1
	addlt	r5, r5, r3	@  y,  y,  yinc1
	addge	r7, r7, r9	@  d,  d,  dinc2
	addge	r6, r6, sl	@  x,  x,  xinc2
	addge	r5, r5, lr	@  y,  y
	subs	r4, r4, #1	@  i,  i
	bne	.L268
.L270:
	ldmea	fp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
	bx	lr
.L258:
	rsb	r2, ip, lr	@  deltay,  deltax
	mov	r3, lr, asl #1	@  dinc1,  deltax
	mov	sl, #1	@  xinc2
	rsb	r7, ip, r3	@  d,  deltay,  dinc1
	str	r3, [fp, #-44]	@  dinc1,  dinc1
	mov	r9, r2, asl sl	@  dinc2
	mov	r3, sl	@  yinc1,  xinc2
	add	r2, ip, sl	@  numpixels,  deltay
	mov	ip, #0	@  xinc1
	b	.L271
	.size	DrawLine3, .-DrawLine3
	.align	2
	.global	DrawBox3
	.type	DrawBox3, %function
DrawBox3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	cmp	r1, r3	@  y,  bottom
	sub	fp, ip, #4
	mov	sl, r3	@  bottom
	mov	r5, r1	@  y,  top
	mov	r8, r0	@  left
	mov	r7, r2	@  right
	ldrsh	r9, [fp, #4]	@  color,  color
	bge	.L284
.L282:
	cmp	r8, r7	@  x,  right
	mov	r4, r8	@  x,  left
	bge	.L286
	mov	r6, r9, asl #16	@  color
.L281:
	mov	r0, r4	@  x
	mov	r1, r5	@  y
	mov	r2, r6, lsr #16
	add	r4, r4, #1	@  x,  x
	bl	DrawPixel3
	cmp	r4, r7	@  x,  right
	blt	.L281
.L286:
	add	r5, r5, #1	@  y,  y
	cmp	r5, sl	@  y,  bottom
	blt	.L282
.L284:
	ldmea	fp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
	bx	lr
	.size	DrawBox3, .-DrawBox3
	.global	SIN
	.section	.rodata
	.align	2
	.type	SIN, %object
	.size	SIN, 2880
SIN:
	.word	0
	.word	0
	.word	1074913033
	.word	-1783957616
	.word	1075961431
	.word	1403251715
	.word	1076546502
	.word	-1477468750
	.word	1077009291
	.word	-1401877325
	.word	1077301208
	.word	-1381261482
	.word	1077592673
	.word	2082200145
	.word	1077883600
	.word	-446676599
	.word	1078055020
	.word	577243605
	.word	1078199818
	.word	-1504956541
	.word	1078344217
	.word	1697371075
	.word	1078488173
	.word	-975816570
	.word	1078631638
	.word	-1587419913
	.word	1078774575
	.word	-329853488
	.word	1078916939
	.word	-962072674
	.word	1079021692
	.word	-2068456250
	.word	1079092233
	.word	-728426453
	.word	1079162422
	.word	-487908285
	.word	1079232238
	.word	1663011337
	.word	1079301659
	.word	144310901
	.word	1079370663
	.word	-2034096511
	.word	1079439230
	.word	-1862297820
	.word	1079507340
	.word	2116559883
	.word	1079574970
	.word	1580547965
	.word	1079642095
	.word	-1649267442
	.word	1079708712
	.word	-171798692
	.word	1079774789
	.word	-1580547965
	.word	1079840292
	.word	-584115552
	.word	1079905239
	.word	171798692
	.word	1079969562
	.word	-1614907703
	.word	1080033280
	.word	0
	.word	1080064819
	.word	858993459
	.word	1080096022
	.word	-2027224564
	.word	1080126889
	.word	-68719477
	.word	1080157413
	.word	1614907703
	.word	1080187576
	.word	1374389535
	.word	1080217378
	.word	-790273982
	.word	1080246804
	.word	2061584302
	.word	1080275836
	.word	-309237645
	.word	1080304484
	.word	1511828488
	.word	1080332730
	.word	1580547965
	.word	1080360558
	.word	-1752346657
	.word	1080387969
	.word	103079215
	.word	1080414953
	.word	2027224564
	.word	1080441503
	.word	-1099511628
	.word	1080467611
	.word	-1511828488
	.word	1080493268
	.word	-34359738
	.word	1080518459
	.word	1683627180
	.word	1080543191
	.word	171798692
	.word	1080567447
	.word	-1924145349
	.word	1080591212
	.word	-1958505087
	.word	1080614494
	.word	893353198
	.word	1080637284
	.word	1511828488
	.word	1080659566
	.word	-1752346657
	.word	1080681332
	.word	-1133871366
	.word	1080702590
	.word	-103079215
	.word	1080723324
	.word	-309237645
	.word	1080743526
	.word	1717986918
	.word	1080763187
	.word	858993459
	.word	1080782315
	.word	-2061584302
	.word	1080800886
	.word	-927712936
	.word	1080818917
	.word	1614907703
	.word	1080836374
	.word	-2027224564
	.word	1080853282
	.word	-790273982
	.word	1080869609
	.word	2027224564
	.word	1080885370
	.word	-515396076
	.word	1080900550
	.word	-1477468750
	.word	1080915140
	.word	-1683627180
	.word	1080929148
	.word	-309237645
	.word	1080942559
	.word	996432413
	.word	1080955379
	.word	-1236950581
	.word	1080967602
	.word	755914244
	.word	1080979210
	.word	1030792151
	.word	1080990220
	.word	1236950581
	.word	1081000615
	.word	-274877907
	.word	1081010397
	.word	790273982
	.word	1081019564
	.word	137438953
	.word	1081028108
	.word	1236950581
	.word	1081036029
	.word	-206158430
	.word	1081043329
	.word	103079215
	.word	1081049997
	.word	1340029796
	.word	1081056034
	.word	-790273982
	.word	1081061449
	.word	-1168231105
	.word	1081066225
	.word	-1443109011
	.word	1081070370
	.word	-790273982
	.word	1081073876
	.word	-34359738
	.word	1081076744
	.word	824633721
	.word	1081078980
	.word	-1683627180
	.word	1081080578
	.word	206158430
	.word	1081081536
	.word	-2095944040
	.word	1081081856
	.word	0
	.word	1081081536
	.word	-2095944040
	.word	1081080578
	.word	206158430
	.word	1081078980
	.word	-1683627180
	.word	1081076744
	.word	824633721
	.word	1081073876
	.word	-34359738
	.word	1081070370
	.word	-790273982
	.word	1081066225
	.word	-1443109011
	.word	1081061449
	.word	-1168231105
	.word	1081056034
	.word	-790273982
	.word	1081049997
	.word	1340029796
	.word	1081043329
	.word	103079215
	.word	1081036029
	.word	-206158430
	.word	1081028108
	.word	1236950581
	.word	1081019564
	.word	137438953
	.word	1081010397
	.word	790273982
	.word	1081000615
	.word	-274877907
	.word	1080990220
	.word	1236950581
	.word	1080979218
	.word	1855425872
	.word	1080967602
	.word	755914244
	.word	1080955379
	.word	-1236950581
	.word	1080942567
	.word	1821066134
	.word	1080929148
	.word	-309237645
	.word	1080915140
	.word	-1683627180
	.word	1080900550
	.word	-1477468750
	.word	1080885370
	.word	-515396076
	.word	1080869609
	.word	2027224564
	.word	1080853282
	.word	-790273982
	.word	1080836382
	.word	-1202590843
	.word	1080818917
	.word	1614907703
	.word	1080800894
	.word	-103079215
	.word	1080782315
	.word	-2061584302
	.word	1080763195
	.word	1683627180
	.word	1080743526
	.word	1717986918
	.word	1080723324
	.word	-309237645
	.word	1080702590
	.word	-103079215
	.word	1080681340
	.word	-309237645
	.word	1080659566
	.word	-1752346657
	.word	1080637284
	.word	1511828488
	.word	1080614502
	.word	1717986918
	.word	1080591220
	.word	-1133871366
	.word	1080567447
	.word	-1924145349
	.word	1080543191
	.word	171798692
	.word	1080518467
	.word	-1786706395
	.word	1080493268
	.word	-34359738
	.word	1080467619
	.word	-687194767
	.word	1080441511
	.word	-274877907
	.word	1080414961
	.word	-1443109011
	.word	1080387977
	.word	927712936
	.word	1080360566
	.word	-927712936
	.word	1080332730
	.word	1580547965
	.word	1080304484
	.word	1511828488
	.word	1080275845
	.word	515396076
	.word	1080246804
	.word	2061584302
	.word	1080217378
	.word	-790273982
	.word	1080187584
	.word	-2095944040
	.word	1080157421
	.word	-1855425872
	.word	1080126898
	.word	755914244
	.word	1080096030
	.word	-1202590843
	.word	1080064819
	.word	858993459
	.word	1080033280
	.word	0
	.word	1079969579
	.word	34359738
	.word	1079905239
	.word	171798692
	.word	1079840309
	.word	1065151889
	.word	1079774806
	.word	68719477
	.word	1079708729
	.word	1477468750
	.word	1079642112
	.word	0
	.word	1079574986
	.word	-1065151889
	.word	1079507350
	.word	1388133430
	.word	1079439242
	.word	151182849
	.word	1079370673
	.word	1532444331
	.word	1079301668
	.word	-584115552
	.word	1079232248
	.word	934584884
	.word	1079162432
	.word	-1216334738
	.word	1079092245
	.word	1285054215
	.word	1079021703
	.word	-54975581
	.word	1078916959
	.word	1876041715
	.word	1078774598
	.word	-597859448
	.word	1078631661
	.word	-1855425872
	.word	1078488193
	.word	1862297820
	.word	1078344240
	.word	1429365116
	.word	1078199841
	.word	-1772962500
	.word	1078055043
	.word	309237645
	.word	1077883646
	.word	-982688517
	.word	1077592712
	.word	-831505669
	.word	1077301248
	.word	0
	.word	1077009337
	.word	-1937889244
	.word	1076546594
	.word	1745474709
	.word	1075961520
	.word	1957130697
	.word	1074913211
	.word	-676199651
	.word	1061569162
	.word	1908149653
	.word	-1072570793
	.word	1403251715
	.word	-1071522306
	.word	849372732
	.word	-1070937238
	.word	-405444913
	.word	-1070474396
	.word	1511828488
	.word	-1070182486
	.word	-845249564
	.word	-1069891021
	.word	-1676755232
	.word	-1069600087
	.word	-1827938081
	.word	-1069428651
	.word	845249564
	.word	-1069283853
	.word	-1236950581
	.word	-1069139454
	.word	1965377035
	.word	-1068995498
	.word	-707810610
	.word	-1068852030
	.word	-130567006
	.word	-1068709092
	.word	1126999418
	.word	-1068566732
	.word	-694066715
	.word	-1068461966
	.word	-1340029796
	.word	-1068391424
	.word	0
	.word	-1068321237
	.word	1793578343
	.word	-1068251422
	.word	-350469331
	.word	-1068182001
	.word	-1869169767
	.word	-1068112996
	.word	247390116
	.word	-1068044428
	.word	-1133871366
	.word	-1067976318
	.word	-1449980959
	.word	-1067908695
	.word	-68719477
	.word	-1067841553
	.word	-1649267442
	.word	-1067774936
	.word	-171798692
	.word	-1067708875
	.word	1065151889
	.word	-1067643356
	.word	-584115552
	.word	-1067578426
	.word	-1477468750
	.word	-1067514086
	.word	-1614907703
	.word	-1067450385
	.word	-1649267442
	.word	-1067418837
	.word	34359738
	.word	-1067387626
	.word	-2027224564
	.word	-1067356759
	.word	-68719477
	.word	-1067326235
	.word	1614907703
	.word	-1067296072
	.word	1374389535
	.word	-1067266278
	.word	-1614907703
	.word	-1067236852
	.word	1236950581
	.word	-1067207812
	.word	-309237645
	.word	-1067179172
	.word	687194767
	.word	-1067150926
	.word	755914244
	.word	-1067123098
	.word	1717986918
	.word	-1067095679
	.word	103079215
	.word	-1067068695
	.word	2027224564
	.word	-1067042145
	.word	-1099511628
	.word	-1067016037
	.word	-1511828488
	.word	-1066990388
	.word	-858993459
	.word	-1066965189
	.word	1683627180
	.word	-1066940466
	.word	-652835029
	.word	-1066916209
	.word	1546188227
	.word	-1066892436
	.word	-1958505087
	.word	-1066869154
	.word	893353198
	.word	-1066846372
	.word	687194767
	.word	-1066824090
	.word	1717986918
	.word	-1066802316
	.word	-1133871366
	.word	-1066781066
	.word	-927712936
	.word	-1066760332
	.word	-1133871366
	.word	-1066740130
	.word	893353198
	.word	-1066720461
	.word	858993459
	.word	-1066701341
	.word	1408749273
	.word	-1066682762
	.word	-927712936
	.word	-1066664739
	.word	790273982
	.word	-1066647274
	.word	-2027224564
	.word	-1066630374
	.word	-1614907703
	.word	-1066614039
	.word	2027224564
	.word	-1066598286
	.word	-1340029796
	.word	-1066583106
	.word	1992864825
	.word	-1066568508
	.word	-1683627180
	.word	-1066554500
	.word	-309237645
	.word	-1066541089
	.word	996432413
	.word	-1066528269
	.word	-1236950581
	.word	-1066516055
	.word	-68719477
	.word	-1066504438
	.word	1030792151
	.word	-1066493428
	.word	1236950581
	.word	-1066483033
	.word	-274877907
	.word	-1066473251
	.word	790273982
	.word	-1066464093
	.word	-687194767
	.word	-1066455540
	.word	1236950581
	.word	-1066447619
	.word	-206158430
	.word	-1066440328
	.word	-721554506
	.word	-1066433651
	.word	1340029796
	.word	-1066427614
	.word	-790273982
	.word	-1066422207
	.word	-1992864825
	.word	-1066417423
	.word	-1443109011
	.word	-1066413278
	.word	-790273982
	.word	-1066409772
	.word	-34359738
	.word	-1066406904
	.word	824633721
	.word	-1066404668
	.word	-1683627180
	.word	-1066403070
	.word	206158430
	.word	-1066402112
	.word	-2095944040
	.word	-1066401792
	.word	0
	.word	-1066402112
	.word	-2095944040
	.word	-1066403070
	.word	206158430
	.word	-1066404668
	.word	-1683627180
	.word	-1066406904
	.word	824633721
	.word	-1066409772
	.word	-34359738
	.word	-1066413278
	.word	-790273982
	.word	-1066417423
	.word	-1443109011
	.word	-1066422199
	.word	-1168231105
	.word	-1066427614
	.word	-790273982
	.word	-1066433651
	.word	1340029796
	.word	-1066440319
	.word	103079215
	.word	-1066447619
	.word	-206158430
	.word	-1066455540
	.word	1236950581
	.word	-1066464084
	.word	137438953
	.word	-1066473251
	.word	790273982
	.word	-1066483033
	.word	-274877907
	.word	-1066493428
	.word	1236950581
	.word	-1066504430
	.word	1855425872
	.word	-1066516046
	.word	755914244
	.word	-1066528261
	.word	-412316860
	.word	-1066541081
	.word	1821066134
	.word	-1066554500
	.word	-309237645
	.word	-1066568500
	.word	-858993459
	.word	-1066583098
	.word	-1477468750
	.word	-1066598278
	.word	-515396076
	.word	-1066614031
	.word	-1443109011
	.word	-1066630366
	.word	-790273982
	.word	-1066647266
	.word	-1202590843
	.word	-1066664731
	.word	1614907703
	.word	-1066682754
	.word	-103079215
	.word	-1066701333
	.word	-2061584302
	.word	-1066720453
	.word	1683627180
	.word	-1066740122
	.word	1717986918
	.word	-1066760324
	.word	-309237645
	.word	-1066781049
	.word	721554506
	.word	-1066802308
	.word	-309237645
	.word	-1066824082
	.word	-1752346657
	.word	-1066846364
	.word	1511828488
	.word	-1066869146
	.word	1717986918
	.word	-1066892428
	.word	-1133871366
	.word	-1066916201
	.word	-1924145349
	.word	-1066940449
	.word	996432413
	.word	-1066965181
	.word	-1786706395
	.word	-1066990371
	.word	790273982
	.word	-1067016029
	.word	-687194767
	.word	-1067042137
	.word	-274877907
	.word	-1067068687
	.word	-1443109011
	.word	-1067095671
	.word	927712936
	.word	-1067123082
	.word	-927712936
	.word	-1067150910
	.word	-1889785610
	.word	-1067179156
	.word	-1958505087
	.word	-1067207803
	.word	515396076
	.word	-1067236836
	.word	-1408749273
	.word	-1067266261
	.word	34359738
	.word	-1067296056
	.word	-1271310320
	.word	-1067326227
	.word	-1855425872
	.word	-1067356742
	.word	1580547965
	.word	-1067387618
	.word	-1202590843
	.word	-1067418821
	.word	1683627180
	.word	-1067450360
	.word	824633721
	.word	-1067514069
	.word	34359738
	.word	-1067578393
	.word	1821066134
	.word	-1067643323
	.word	-1580547965
	.word	-1067708842
	.word	68719477
	.word	-1067774919
	.word	1477468750
	.word	-1067841520
	.word	1649267442
	.word	-1067908662
	.word	-1065151889
	.word	-1067976287
	.word	-893353198
	.word	-1068044397
	.word	-577243605
	.word	-1068112964
	.word	-749042296
	.word	-1068181968
	.word	1429365116
	.word	-1068251389
	.word	-1346901744
	.word	-1068321204
	.word	797145930
	.word	-1068391393
	.word	556627762
	.word	-1068461935
	.word	-783402035
	.word	-1068566666
	.word	1608035756
	.word	-1068709030
	.word	-2054712354
	.word	-1068851964
	.word	-2123431831
	.word	-1068995432
	.word	1594291860
	.word	-1069139389
	.word	-27487791
	.word	-1069283787
	.word	1065151889
	.word	-1069428586
	.word	-1147615261
	.word	-1069599956
	.word	-1518700436
	.word	-1069890890
	.word	-1367517587
	.word	-1070182355
	.word	-536011919
	.word	-1070474265
	.word	1821066134
	.word	-1070936962
	.word	673450872
	.word	-1071522039
	.word	-1783957616
	.word	-1072570258
	.word	431558314
	.global	COS
	.align	2
	.type	COS, %object
	.size	COS, 2880
COS:
	.word	1081081856
	.word	0
	.word	1081081536
	.word	-2095944040
	.word	1081080578
	.word	206158430
	.word	1081078980
	.word	-1683627180
	.word	1081076744
	.word	824633721
	.word	1081073876
	.word	-34359738
	.word	1081070370
	.word	-790273982
	.word	1081066225
	.word	-1443109011
	.word	1081061449
	.word	-1168231105
	.word	1081056034
	.word	-790273982
	.word	1081049997
	.word	1340029796
	.word	1081043329
	.word	103079215
	.word	1081036029
	.word	-206158430
	.word	1081028108
	.word	1236950581
	.word	1081019564
	.word	137438953
	.word	1081010397
	.word	790273982
	.word	1081000615
	.word	-274877907
	.word	1080990220
	.word	1236950581
	.word	1080979210
	.word	1030792151
	.word	1080967602
	.word	755914244
	.word	1080955379
	.word	-1236950581
	.word	1080942567
	.word	1821066134
	.word	1080929148
	.word	-309237645
	.word	1080915140
	.word	-1683627180
	.word	1080900550
	.word	-1477468750
	.word	1080885370
	.word	-515396076
	.word	1080869609
	.word	2027224564
	.word	1080853282
	.word	-790273982
	.word	1080836382
	.word	-1202590843
	.word	1080818917
	.word	1614907703
	.word	1080800894
	.word	-103079215
	.word	1080782315
	.word	-2061584302
	.word	1080763187
	.word	858993459
	.word	1080743526
	.word	1717986918
	.word	1080723324
	.word	-309237645
	.word	1080702590
	.word	-103079215
	.word	1080681332
	.word	-1133871366
	.word	1080659566
	.word	-1752346657
	.word	1080637284
	.word	1511828488
	.word	1080614494
	.word	893353198
	.word	1080591212
	.word	-1958505087
	.word	1080567447
	.word	-1924145349
	.word	1080543191
	.word	171798692
	.word	1080518467
	.word	-1786706395
	.word	1080493268
	.word	-34359738
	.word	1080467611
	.word	-1511828488
	.word	1080441511
	.word	-274877907
	.word	1080414961
	.word	-1443109011
	.word	1080387977
	.word	927712936
	.word	1080360558
	.word	-1752346657
	.word	1080332730
	.word	1580547965
	.word	1080304484
	.word	1511828488
	.word	1080275836
	.word	-309237645
	.word	1080246804
	.word	2061584302
	.word	1080217378
	.word	-790273982
	.word	1080187584
	.word	-2095944040
	.word	1080157421
	.word	-1855425872
	.word	1080126898
	.word	755914244
	.word	1080096030
	.word	-1202590843
	.word	1080064819
	.word	858993459
	.word	1080033280
	.word	0
	.word	1079969562
	.word	-1614907703
	.word	1079905239
	.word	171798692
	.word	1079840309
	.word	1065151889
	.word	1079774789
	.word	-1580547965
	.word	1079708712
	.word	-171798692
	.word	1079642112
	.word	0
	.word	1079574970
	.word	1580547965
	.word	1079507345
	.word	1752346657
	.word	1079439235
	.word	2068456250
	.word	1079370668
	.word	1896657558
	.word	1079301663
	.word	-219902326
	.word	1079232243
	.word	1298798110
	.word	1079162427
	.word	-852121512
	.word	1079092238
	.word	-1092639680
	.word	1079021697
	.word	1862297820
	.word	1078916949
	.word	-1690499128
	.word	1078774589
	.word	130567006
	.word	1078631651
	.word	-1126999418
	.word	1078488183
	.word	-1704243023
	.word	1078344227
	.word	968944622
	.word	1078199828
	.word	2061584302
	.word	1078055029
	.word	-151182849
	.word	1077883627
	.word	474164389
	.word	1077592693
	.word	625347238
	.word	1077301228
	.word	1456852907
	.word	1077009317
	.word	-481036337
	.word	1076546541
	.word	-96207267
	.word	1075961475
	.word	-467292442
	.word	1074913122
	.word	-1230078634
	.word	1060520584
	.word	1274712209
	.word	-1072570704
	.word	1957130697
	.word	-1071522262
	.word	-1021171424
	.word	-1070937185
	.word	1436237064
	.word	-1070474376
	.word	54975581
	.word	-1070182466
	.word	1992864825
	.word	-1069891001
	.word	1161359157
	.word	-1069600067
	.word	1010176308
	.word	-1069428641
	.word	116823110
	.word	-1069283840
	.word	-776530087
	.word	-1069139441
	.word	-1869169767
	.word	-1068995488
	.word	-1436237064
	.word	-1068852020
	.word	-858993459
	.word	-1068709082
	.word	398572965
	.word	-1068566722
	.word	-1422493168
	.word	-1068461961
	.word	-1704243023
	.word	-1068391420
	.word	-364213227
	.word	-1068321231
	.word	-123695058
	.word	-1068251415
	.word	2027224564
	.word	-1068181994
	.word	508524128
	.word	-1068112990
	.word	-1669883285
	.word	-1068044423
	.word	-1498084593
	.word	-1067976313
	.word	-1814194186
	.word	-1067908678
	.word	1580547965
	.word	-1067841553
	.word	-1649267442
	.word	-1067774936
	.word	-171798692
	.word	-1067708859
	.word	-1580547965
	.word	-1067643356
	.word	-584115552
	.word	-1067578426
	.word	-1477468750
	.word	-1067514086
	.word	-1614907703
	.word	-1067450368
	.word	0
	.word	-1067418837
	.word	34359738
	.word	-1067387626
	.word	-2027224564
	.word	-1067356759
	.word	-68719477
	.word	-1067326235
	.word	1614907703
	.word	-1067296072
	.word	1374389535
	.word	-1067266270
	.word	-790273982
	.word	-1067236852
	.word	1236950581
	.word	-1067207812
	.word	-309237645
	.word	-1067179164
	.word	1511828488
	.word	-1067150926
	.word	755914244
	.word	-1067123090
	.word	-1752346657
	.word	-1067095679
	.word	103079215
	.word	-1067068695
	.word	2027224564
	.word	-1067042145
	.word	-1099511628
	.word	-1067016037
	.word	-1511828488
	.word	-1066990380
	.word	-34359738
	.word	-1066965189
	.word	1683627180
	.word	-1066940457
	.word	171798692
	.word	-1066916209
	.word	1546188227
	.word	-1066892436
	.word	-1958505087
	.word	-1066869154
	.word	893353198
	.word	-1066846372
	.word	687194767
	.word	-1066824090
	.word	1717986918
	.word	-1066802316
	.word	-1133871366
	.word	-1066781058
	.word	-103079215
	.word	-1066760332
	.word	-1133871366
	.word	-1066740130
	.word	893353198
	.word	-1066720461
	.word	858993459
	.word	-1066701333
	.word	-2061584302
	.word	-1066682762
	.word	-927712936
	.word	-1066664739
	.word	790273982
	.word	-1066647274
	.word	-2027224564
	.word	-1066630374
	.word	-1614907703
	.word	-1066614039
	.word	2027224564
	.word	-1066598278
	.word	-515396076
	.word	-1066583106
	.word	1992864825
	.word	-1066568508
	.word	-1683627180
	.word	-1066554500
	.word	-309237645
	.word	-1066541089
	.word	996432413
	.word	-1066528269
	.word	-1236950581
	.word	-1066516046
	.word	755914244
	.word	-1066504438
	.word	1030792151
	.word	-1066493428
	.word	1236950581
	.word	-1066483033
	.word	-274877907
	.word	-1066473251
	.word	790273982
	.word	-1066464084
	.word	137438953
	.word	-1066455540
	.word	1236950581
	.word	-1066447619
	.word	-206158430
	.word	-1066440328
	.word	-721554506
	.word	-1066433651
	.word	1340029796
	.word	-1066427614
	.word	-790273982
	.word	-1066422199
	.word	-1168231105
	.word	-1066417423
	.word	-1443109011
	.word	-1066413278
	.word	-790273982
	.word	-1066409772
	.word	-34359738
	.word	-1066406904
	.word	824633721
	.word	-1066404668
	.word	-1683627180
	.word	-1066403070
	.word	206158430
	.word	-1066402112
	.word	-2095944040
	.word	-1066401792
	.word	0
	.word	-1066402112
	.word	-2095944040
	.word	-1066403070
	.word	206158430
	.word	-1066404668
	.word	-1683627180
	.word	-1066406904
	.word	824633721
	.word	-1066409772
	.word	-34359738
	.word	-1066413278
	.word	-790273982
	.word	-1066417423
	.word	-1443109011
	.word	-1066422199
	.word	-1168231105
	.word	-1066427614
	.word	-790273982
	.word	-1066433651
	.word	1340029796
	.word	-1066440319
	.word	103079215
	.word	-1066447619
	.word	-206158430
	.word	-1066455540
	.word	1236950581
	.word	-1066464084
	.word	137438953
	.word	-1066473251
	.word	790273982
	.word	-1066483033
	.word	-274877907
	.word	-1066493428
	.word	1236950581
	.word	-1066504430
	.word	1855425872
	.word	-1066516046
	.word	755914244
	.word	-1066528261
	.word	-412316860
	.word	-1066541081
	.word	1821066134
	.word	-1066554500
	.word	-309237645
	.word	-1066568500
	.word	-858993459
	.word	-1066583098
	.word	-1477468750
	.word	-1066598278
	.word	-515396076
	.word	-1066614031
	.word	-1443109011
	.word	-1066630366
	.word	-790273982
	.word	-1066647266
	.word	-1202590843
	.word	-1066664731
	.word	1614907703
	.word	-1066682754
	.word	-103079215
	.word	-1066701333
	.word	-2061584302
	.word	-1066720453
	.word	1683627180
	.word	-1066740122
	.word	1717986918
	.word	-1066760324
	.word	-309237645
	.word	-1066781058
	.word	-103079215
	.word	-1066802308
	.word	-309237645
	.word	-1066824082
	.word	-1752346657
	.word	-1066846364
	.word	1511828488
	.word	-1066869146
	.word	1717986918
	.word	-1066892428
	.word	-1133871366
	.word	-1066916201
	.word	-1924145349
	.word	-1066940449
	.word	996432413
	.word	-1066965181
	.word	-1786706395
	.word	-1066990371
	.word	790273982
	.word	-1067016029
	.word	-687194767
	.word	-1067042137
	.word	-274877907
	.word	-1067068687
	.word	-1443109011
	.word	-1067095671
	.word	927712936
	.word	-1067123082
	.word	-927712936
	.word	-1067150918
	.word	1580547965
	.word	-1067179156
	.word	-1958505087
	.word	-1067207803
	.word	515396076
	.word	-1067236844
	.word	2061584302
	.word	-1067266261
	.word	34359738
	.word	-1067296064
	.word	-2095944040
	.word	-1067326227
	.word	-1855425872
	.word	-1067356750
	.word	755914244
	.word	-1067387618
	.word	-1202590843
	.word	-1067418821
	.word	1683627180
	.word	-1067450360
	.word	824633721
	.word	-1067514069
	.word	34359738
	.word	-1067578393
	.word	1821066134
	.word	-1067643339
	.word	1065151889
	.word	-1067708842
	.word	68719477
	.word	-1067774919
	.word	1477468750
	.word	-1067841536
	.word	0
	.word	-1067908662
	.word	-1065151889
	.word	-1067976292
	.word	-529139971
	.word	-1068044402
	.word	-213030378
	.word	-1068112970
	.word	1168231105
	.word	-1068181975
	.word	-948328779
	.word	-1068251394
	.word	-982688517
	.word	-1068321209
	.word	1161359157
	.word	-1068391398
	.word	920840988
	.word	-1068461940
	.word	-419188808
	.word	-1068566679
	.word	1147615261
	.word	-1068709040
	.word	-1326285901
	.word	-1068851977
	.word	1711114971
	.word	-1068995442
	.word	-1972248982
	.word	-1069139398
	.word	700938663
	.word	-1069283797
	.word	1793578343
	.word	-1069428596
	.word	-419188808
	.word	-1069599982
	.word	1855425872
	.word	-1069890909
	.word	89335320
	.word	-1070182374
	.word	920840988
	.word	-1070474285
	.word	-1017048256
	.word	-1070937015
	.word	-1168231105
	.word	-1071522083
	.word	86586541
	.word	-1072570348
	.word	-122320669
	.word	-1085230615
	.word	1906190324
	.word	1074912766
	.word	849372732
	.word	1075961298
	.word	-240518169
	.word	1076546371
	.word	-1786706395
	.word	1077009226
	.word	590987500
	.word	1077301136
	.word	-1766090552
	.word	1077592607
	.word	-219902326
	.word	1077883535
	.word	1546188227
	.word	1078054987
	.word	1573676017
	.word	1078199785
	.word	-508524128
	.word	1078344184
	.word	-1601163808
	.word	1078488141
	.word	20615843
	.word	1078631609
	.word	597859448
	.word	1078774543
	.word	666578924
	.word	1078916907
	.word	34359738
	.word	1079021676
	.word	577243605
	.word	1079092217
	.word	1917273401
	.word	1079162406
	.word	-2137175726
	.word	1079232222
	.word	13743895
	.word	1079301642
	.word	-1504956541
	.word	1079370647
	.word	611603343
	.word	1079439215
	.word	-769658139
	.word	1079507325
	.word	-1085767732
	.word	1079574953
	.word	-68719477
	.word	1079642095
	.word	-1649267442
	.word	1079708696
	.word	-1821066134
	.word	1079774773
	.word	1065151889
	.word	1079840292
	.word	-584115552
	.word	1079905222
	.word	-1477468750
	.word	1079969546
	.word	1030792151
	.word	1080033263
	.word	-1649267442
	.word	1080064811
	.word	34359738
	.word	1080096014
	.word	1443109011
	.word	1080126889
	.word	-68719477
	.word	1080157405
	.word	790273982
	.word	1080187576
	.word	1374389535
	.word	1080217370
	.word	-1614907703
	.word	1080246796
	.word	1236950581
	.word	1080275828
	.word	-1133871366
	.word	1080304476
	.word	687194767
	.word	1080332722
	.word	755914244
	.word	1080360550
	.word	1717986918
	.word	1080387969
	.word	103079215
	.word	1080414953
	.word	2027224564
	.word	1080441503
	.word	-1099511628
	.word	1080467603
	.word	1958505087
	.word	1080493260
	.word	-858993459
	.word	1080518459
	.word	1683627180
	.word	1080543182
	.word	-652835029
	.word	1080567439
	.word	1546188227
	.word	1080591212
	.word	-1958505087
	.word	1080614494
	.word	893353198
	.word	1080637276
	.word	687194767
	.word	1080659558
	.word	1717986918
	.word	1080681332
	.word	-1133871366
	.word	1080702582
	.word	-927712936
	.word	1080723316
	.word	-1133871366
	.word	1080743518
	.word	893353198
	.word	1080763187
	.word	858993459
	.word	1080782307
	.word	1408749273
	.word	1080800886
	.word	-927712936
	.word	1080818909
	.word	790273982
	.word	1080836374
	.word	-2027224564
	.word	1080853274
	.word	-1614907703
	.word	1080869609
	.word	2027224564
	.word	1080885362
	.word	-1340029796
	.word	1080900542
	.word	1992864825
	.word	1080915140
	.word	-1683627180
	.word	1080929148
	.word	-309237645
	.word	1080942559
	.word	996432413
	.word	1080955379
	.word	-1236950581
	.word	1080967593
	.word	-68719477
	.word	1080979210
	.word	1030792151
	.word	1080990220
	.word	1236950581
	.word	1081000615
	.word	-274877907
	.word	1081010397
	.word	790273982
	.word	1081019555
	.word	-687194767
	.word	1081028100
	.word	412316860
	.word	1081036029
	.word	-206158430
	.word	1081043320
	.word	-721554506
	.word	1081049997
	.word	1340029796
	.word	1081056034
	.word	-790273982
	.word	1081061441
	.word	-1992864825
	.word	1081066225
	.word	-1443109011
	.word	1081070362
	.word	-1614907703
	.word	1081073876
	.word	-34359738
	.word	1081076744
	.word	824633721
	.word	1081078980
	.word	-1683627180
	.word	1081080578
	.word	206158430
	.word	1081081536
	.word	-2095944040
	.global	RAD
	.align	2
	.type	RAD, %object
	.size	RAD, 2880
RAD:
	.word	0
	.word	0
	.word	1066524487
	.word	584335455
	.word	1067573063
	.word	584335455
	.word	1068158695
	.word	1497369910
	.word	1068621637
	.word	1968510643
	.word	1068914455
	.word	1040852682
	.word	1069207278
	.word	255636453
	.word	1069500090
	.word	-814463238
	.word	1069670211
	.word	-942281465
	.word	1069816626
	.word	-1955756308
	.word	1069963032
	.word	-343322506
	.word	1070109439
	.word	1269111296
	.word	1070255845
	.word	-1413422198
	.word	1070402260
	.word	1868070256
	.word	1070548666
	.word	-814463238
	.word	1070645584
	.word	-1748498366
	.word	1070718787
	.word	-942281465
	.word	1070791995
	.word	698464762
	.word	1070865198
	.word	1504681663
	.word	1070938401
	.word	-1984068732
	.word	1071011608
	.word	-343322506
	.word	1071084812
	.word	462894395
	.word	1071158015
	.word	1269111296
	.word	1071231218
	.word	2075328197
	.word	1071304425
	.word	-578892872
	.word	1071377629
	.word	227324029
	.word	1071450832
	.word	1033540930
	.word	1071524035
	.word	1839757831
	.word	1071597242
	.word	-814463238
	.word	1071657558
	.word	-4123169
	.word	1071694160
	.word	-1748498366
	.word	1071730764
	.word	1219358395
	.word	1071767365
	.word	-525016802
	.word	1071803967
	.word	2025575296
	.word	1071840569
	.word	281200099
	.word	1071877172
	.word	-1045910436
	.word	1071913774
	.word	1504681663
	.word	1071950375
	.word	-239693535
	.word	1071986979
	.word	-1566804070
	.word	1072023581
	.word	983788029
	.word	1072060182
	.word	-760587169
	.word	1072096784
	.word	1790004930
	.word	1072133388
	.word	462894395
	.word	1072169989
	.word	-1281480802
	.word	1072206591
	.word	1269111296
	.word	1072243192
	.word	-475263901
	.word	1072279796
	.word	-1802374436
	.word	1072316398
	.word	748217663
	.word	1072352999
	.word	-996157535
	.word	1072389603
	.word	1971699227
	.word	1072426205
	.word	227324029
	.word	1072462806
	.word	-1517051168
	.word	1072499408
	.word	1033540930
	.word	1072536011
	.word	-293569605
	.word	1072572613
	.word	-2037944802
	.word	1072609215
	.word	512647296
	.word	1072645818
	.word	-814463238
	.word	1072682420
	.word	1736128860
	.word	1072706134
	.word	-4123169
	.word	1072724432
	.word	-1502207761
	.word	1072742740
	.word	-913969041
	.word	1072761038
	.word	1882913663
	.word	1072779336
	.word	384829070
	.word	1072797644
	.word	973067791
	.word	1072815941
	.word	-525016802
	.word	1072834239
	.word	-2023101395
	.word	1072852547
	.word	-1434862674
	.word	1072870845
	.word	1362020029
	.word	1072889142
	.word	-136064564
	.word	1072907451
	.word	452174157
	.word	1072925748
	.word	-1045910436
	.word	1072944046
	.word	1750972267
	.word	1072962354
	.word	-1955756308
	.word	1072980652
	.word	841126395
	.word	1072998949
	.word	-656958198
	.word	1073017257
	.word	-68719477
	.word	1073035555
	.word	-1566804070
	.word	1073053853
	.word	1230078634
	.word	1073072161
	.word	1818317354
	.word	1073090459
	.word	320232762
	.word	1073108756
	.word	-1177851831
	.word	1073127064
	.word	-589613110
	.word	1073145362
	.word	-2087697703
	.word	1073163660
	.word	709185000
	.word	1073181968
	.word	1297423721
	.word	1073200265
	.word	-200660872
	.word	1073218563
	.word	-1698745465
	.word	1073236871
	.word	-1110506744
	.word	1073255169
	.word	1686375959
	.word	1073273467
	.word	188291366
	.word	1073291764
	.word	-1309793227
	.word	1073310072
	.word	-721554506
	.word	1073328370
	.word	2075328197
	.word	1073346668
	.word	577243605
	.word	1073364976
	.word	1165482325
	.word	1073383273
	.word	-332602267
	.word	1073401571
	.word	-1830686860
	.word	1073419879
	.word	-1242448139
	.word	1073438177
	.word	1554434564
	.word	1073456475
	.word	56349971
	.word	1073474783
	.word	644588692
	.word	1073493080
	.word	-853495901
	.word	1073511378
	.word	1943386802
	.word	1073529686
	.word	-1763341773
	.word	1073547984
	.word	1033540930
	.word	1073566281
	.word	-464543663
	.word	1073584590
	.word	123695058
	.word	1073602887
	.word	-1374389535
	.word	1073621185
	.word	1422493168
	.word	1073639493
	.word	2010731889
	.word	1073657791
	.word	512647296
	.word	1073676088
	.word	-985437296
	.word	1073694396
	.word	-397198576
	.word	1073712694
	.word	-1895283168
	.word	1073730992
	.word	901599535
	.word	1073745562
	.word	744919128
	.word	1073754710
	.word	-4123169
	.word	1073763859
	.word	-753165465
	.word	1073773013
	.word	-459046105
	.word	1073782162
	.word	-1208088401
	.word	1073791311
	.word	-1957130697
	.word	1073800465
	.word	-1663011337
	.word	1073809614
	.word	1882913663
	.word	1073818763
	.word	1133871366
	.word	1073827917
	.word	1427990727
	.word	1073837066
	.word	678948430
	.word	1073846214
	.word	-70093866
	.word	1073855369
	.word	224025494
	.word	1073864517
	.word	-525016802
	.word	1073873666
	.word	-1274059099
	.word	1073882820
	.word	-979939738
	.word	1073891969
	.word	-1728982035
	.word	1073901118
	.word	1816942965
	.word	1073910272
	.word	2111062325
	.word	1073919421
	.word	1362020029
	.word	1073928570
	.word	612977732
	.word	1073937724
	.word	907097093
	.word	1073946873
	.word	158054796
	.word	1073956021
	.word	-590987500
	.word	1073965175
	.word	-296868139
	.word	1073974324
	.word	-1045910436
	.word	1073983473
	.word	-1794952732
	.word	1073992627
	.word	-1500833372
	.word	1074001776
	.word	2045091628
	.word	1074010925
	.word	1296049331
	.word	1074020079
	.word	1590168692
	.word	1074029228
	.word	841126395
	.word	1074038377
	.word	92084099
	.word	1074047531
	.word	386203459
	.word	1074056679
	.word	-362838837
	.word	1074065828
	.word	-1111881134
	.word	1074074977
	.word	-1860923430
	.word	1074084131
	.word	-1566804070
	.word	1074093280
	.word	1979120930
	.word	1074102429
	.word	1230078634
	.word	1074111583
	.word	1524197994
	.word	1074120732
	.word	775155698
	.word	1074129881
	.word	26113401
	.word	1074139035
	.word	320232762
	.word	1074148183
	.word	-428809535
	.word	1074157332
	.word	-1177851831
	.word	1074166486
	.word	-883732471
	.word	1074175635
	.word	-1632774767
	.word	1074184784
	.word	1913150232
	.word	1074193938
	.word	-2087697703
	.word	1074203087
	.word	1458227296
	.word	1074212236
	.word	709185000
	.word	1074221390
	.word	1003304360
	.word	1074230539
	.word	254262064
	.word	1074239687
	.word	-494780232
	.word	1074248841
	.word	-200660872
	.word	1074257990
	.word	-949703168
	.word	1074267139
	.word	-1698745465
	.word	1074276293
	.word	-1404626104
	.word	1074285442
	.word	2141298895
	.word	1074294591
	.word	1392256599
	.word	1074303745
	.word	1686375959
	.word	1074312894
	.word	937333663
	.word	1074322043
	.word	188291366
	.word	1074331197
	.word	482410727
	.word	1074340345
	.word	-266631570
	.word	1074349494
	.word	-1015673866
	.word	1074358648
	.word	-721554506
	.word	1074367797
	.word	-1470596802
	.word	1074376946
	.word	2075328197
	.word	1074386100
	.word	-1925519738
	.word	1074395249
	.word	1620405261
	.word	1074404398
	.word	871362965
	.word	1074413552
	.word	1165482325
	.word	1074422701
	.word	416440029
	.word	1074431849
	.word	-332602267
	.word	1074441003
	.word	-38482907
	.word	1074450152
	.word	-787525203
	.word	1074459301
	.word	-1536567500
	.word	1074468455
	.word	-1242448139
	.word	1074477604
	.word	-1991490436
	.word	1074486753
	.word	1554434564
	.word	1074495907
	.word	1848553924
	.word	1074505056
	.word	1099511628
	.word	1074514205
	.word	350469331
	.word	1074523359
	.word	644588692
	.word	1074532507
	.word	-104453605
	.word	1074541656
	.word	-853495901
	.word	1074550810
	.word	-559376541
	.word	1074559959
	.word	-1308418837
	.word	1074569108
	.word	-2057461133
	.word	1074578262
	.word	-1763341773
	.word	1074587411
	.word	1782583227
	.word	1074596560
	.word	1033540930
	.word	1074605714
	.word	1327660291
	.word	1074614863
	.word	578617994
	.word	1074624011
	.word	-170424302
	.word	1074633160
	.word	-919466599
	.word	1074642314
	.word	-625347238
	.word	1074651463
	.word	-1374389535
	.word	1074660612
	.word	-2123431831
	.word	1074669766
	.word	-1829312471
	.word	1074678915
	.word	1716612529
	.word	1074688064
	.word	967570232
	.word	1074697218
	.word	1261689593
	.word	1074706367
	.word	512647296
	.word	1074715515
	.word	-236395000
	.word	1074724670
	.word	57724360
	.word	1074733818
	.word	-691317936
	.word	1074742967
	.word	-1440360232
	.word	1074752121
	.word	-1146240872
	.word	1074761270
	.word	-1895283168
	.word	1074770419
	.word	1650641831
	.word	1074779573
	.word	1944761192
	.word	1074788722
	.word	1195718895
	.word	1074794135
	.word	-1924145349
	.word	1074798712
	.word	-1777085668
	.word	1074803286
	.word	-4123169
	.word	1074807861
	.word	1768839331
	.word	1074812438
	.word	1915899011
	.word	1074817012
	.word	-606105785
	.word	1074821587
	.word	1166856715
	.word	1074826164
	.word	1313916395
	.word	1074830738
	.word	-1208088401
	.word	1074835313
	.word	564874099
	.word	1074839890
	.word	711933779
	.word	1074844464
	.word	-1810071017
	.word	1074849038
	.word	-37108517
	.word	1074853616
	.word	109951163
	.word	1074858190
	.word	1882913663
	.word	1074862764
	.word	-639091134
	.word	1074867341
	.word	-492031453
	.word	1074871916
	.word	1280931046
	.word	1074876490
	.word	-1241073750
	.word	1074881067
	.word	-1094014070
	.word	1074885642
	.word	678948430
	.word	1074890216
	.word	-1843056366
	.word	1074894793
	.word	-1695996686
	.word	1074899368
	.word	76965814
	.word	1074903942
	.word	1849928314
	.word	1074908519
	.word	1996987994
	.word	1074913093
	.word	-525016802
	.word	1074917668
	.word	1247945698
	.word	1074922245
	.word	1395005378
	.word	1074926819
	.word	-1126999418
	.word	1074931394
	.word	645963081
	.word	1074935971
	.word	793022762
	.word	1074940545
	.word	-1728982035
	.word	1074945120
	.word	43980465
	.word	1074949697
	.word	191040145
	.word	1074954271
	.word	1964002645
	.word	1074958845
	.word	-558002151
	.word	1074963422
	.word	-410942471
	.word	1074967997
	.word	1362020029
	.word	1074972571
	.word	-1159984767
	.word	1074977146
	.word	612977732
	.word	1074981723
	.word	760037413
	.word	1074986297
	.word	-1761967384
	.word	1074990872
	.word	10995116
	.word	1074995449
	.word	158054796
	.word	1075000023
	.word	1931017296
	.word	1075004597
	.word	-590987500
	.word	1075009174
	.word	-443927820
	.word	1075013749
	.word	1329034680
	.word	1075018323
	.word	-1192970116
	.word	1075022900
	.word	-1045910436
	.word	1075027475
	.word	727052064
	.word	1075032049
	.word	-1794952732
	.word	1075036626
	.word	-1647893052
	.word	1075041201
	.word	125069448
	.word	1075045775
	.word	1898031947
	.word	1075050352
	.word	2045091628
	.word	1075054926
	.word	-476913169
	.word	1075059501
	.word	1296049331
	.word	1075064078
	.word	1443109011
	.word	1075068652
	.word	-1078895785
	.word	1075073227
	.word	694066715
	.word	1075077804
	.word	841126395
	.word	1075082378
	.word	-1680878401
	.word	1075086953
	.word	92084099
	.word	1075091530
	.word	239143779
	.word	1075096104
	.word	2012106279
	.word	1075100678
	.word	-509898517
	.word	1075105255
	.word	-362838837
	.word	1075109830
	.word	1410123663
	.word	1075114404
	.word	-1111881134
	.word	1075118981
	.word	-964821453
	.word	1075123556
	.word	808141046
	.word	1075128130
	.word	-1713863750
	.word	1075132707
	.word	-1566804070
	.word	1075137282
	.word	206158430
	.word	1075141856
	.word	1979120930
	.word	1075146433
	.word	2126180610
	.word	1075151007
	.word	-395824186
	.word	1075155582
	.word	1377138314
	.word	1075160159
	.word	1524197994
	.word	1075164733
	.word	-997806802
	.word	1075169308
	.word	775155698
	.word	1075173885
	.word	922215378
	.word	1075178459
	.word	-1599789418
	.word	1075183034
	.word	173173081
	.word	1075187611
	.word	320232762
	.word	1075192185
	.word	2093195261
	.word	1075196759
	.word	-428809535
	.word	1075201336
	.word	-281749855
	.word	1075205911
	.word	1491212645
	.word	1075210485
	.word	-1030792151
	.word	1075215062
	.word	-883732471
	.word	1075219637
	.word	889230029
	.word	1075224211
	.word	-1632774767
	.word	1075228788
	.word	-1485715087
	.word	1075233363
	.word	287247413
	.word	1075237937
	.word	2060209913
	.word	1075242514
	.word	-2087697703
	.word	1075247088
	.word	-314735203
	.word	1075251663
	.word	1458227296
	.word	1075256237
	.word	-1063777500
	.word	1075260814
	.word	-916717820
	.word	1075265389
	.word	856244680
	.word	1075269963
	.word	-1665760116
	.word	1075274540
	.word	-1518700436
	.word	1075279115
	.word	254262064
	.word	1075283689
	.word	2027224564
	.word	1075288266
	.word	-2120683052
	.word	1075292840
	.word	-347720552
	.word	1075297415
	.word	1425241948
	.word	1075301992
	.word	1572301628
	.word	1075306566
	.word	-949703168
	.word	1075311141
	.word	823259331
	.word	1075315718
	.word	970319012
	.word	1075320292
	.word	-1551685785
	.word	1075324867
	.word	221276715
	.word	1075329444
	.word	368336395
	.word	1075334018
	.word	2141298895
	.word	1075338592
	.word	-380705901
	.word	1075343169
	.word	-233646221
	.word	1075347744
	.word	1539316279
	.word	1075352318
	.word	-982688517
	.word	1075356895
	.word	-835628837
	.word	1075361470
	.word	937333663
	.word	1075366044
	.word	-1584671134
	.word	1075370621
	.word	-1437611453
	.word	1075375196
	.word	335351046
	.word	1075379770
	.word	2108313546
	.word	1075384347
	.word	-2039594070
	.text
	.align	2
	.global	drawTitle
	.type	drawTitle, %function
drawTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	drawTitle, .-drawTitle
	.align	2
	.global	updateTitle
	.type	updateTitle, %function
updateTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	updateTitle, .-updateTitle
	.align	2
	.global	loadTitle
	.type	loadTitle, %function
loadTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	loadTitle, .-loadTitle
	.align	2
	.global	drawInventory
	.type	drawInventory, %function
drawInventory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	drawInventory, .-drawInventory
	.align	2
	.global	updateInventory
	.type	updateInventory, %function
updateInventory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	updateInventory, .-updateInventory
	.align	2
	.global	drawGameOver
	.type	drawGameOver, %function
drawGameOver:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	drawGameOver, .-drawGameOver
	.align	2
	.global	updateGameOver
	.type	updateGameOver, %function
updateGameOver:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	updateGameOver, .-updateGameOver
	.global	spriteData
	.section	.rodata
	.align	1
	.type	spriteData, %object
	.size	spriteData, 3328
spriteData:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	256
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	257
	.short	0
	.short	0
	.short	0
	.short	257
	.short	1
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	1280
	.short	1285
	.short	1285
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	512
	.short	518
	.short	518
	.short	0
	.short	512
	.short	518
	.short	518
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	1285
	.short	1285
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	518
	.short	518
	.short	0
	.short	0
	.short	518
	.short	518
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	256
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	257
	.short	0
	.short	0
	.short	0
	.short	257
	.short	1
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	1280
	.short	1285
	.short	1285
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	1536
	.short	1538
	.short	1538
	.short	0
	.short	1536
	.short	1538
	.short	1538
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	1285
	.short	1285
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	1538
	.short	1538
	.short	0
	.short	0
	.short	1538
	.short	1538
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	257
	.short	257
	.short	1
	.short	256
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	0
	.short	0
	.short	2
	.short	771
	.short	0
	.short	0
	.short	2
	.short	771
	.short	3
	.short	1
	.short	770
	.short	771
	.short	771
	.short	1
	.short	2
	.short	771
	.short	3
	.short	1
	.short	2
	.short	771
	.short	0
	.short	1
	.short	2
	.short	3
	.short	0
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	1285
	.short	1285
	.short	1285
	.short	1285
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	513
	.short	2
	.short	0
	.short	0
	.short	513
	.short	2
	.short	3
	.short	0
	.short	517
	.short	2
	.short	771
	.short	0
	.short	1
	.short	2
	.short	771
	.short	3
	.short	1
	.short	770
	.short	771
	.short	771
	.short	1
	.short	2
	.short	771
	.short	3
	.short	2
	.short	2
	.short	771
	.short	0
	.short	2
	.short	2
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1792
	.short	0
	.short	7
	.short	0
	.short	0
	.short	257
	.short	257
	.short	1
	.short	263
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	1795
	.short	1792
	.short	7
	.short	2
	.short	771
	.short	7
	.short	0
	.short	2
	.short	771
	.short	1795
	.short	1
	.short	770
	.short	771
	.short	771
	.short	1
	.short	2
	.short	771
	.short	1795
	.short	1
	.short	2
	.short	771
	.short	7
	.short	1
	.short	1794
	.short	1795
	.short	1792
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	1285
	.short	1285
	.short	1285
	.short	1285
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	518
	.short	518
	.short	518
	.short	518
	.short	518
	.short	518
	.short	518
	.short	518
	.short	513
	.short	2
	.short	7
	.short	0
	.short	513
	.short	2
	.short	1795
	.short	1792
	.short	517
	.short	1794
	.short	771
	.short	7
	.short	1
	.short	2
	.short	771
	.short	1795
	.short	1
	.short	770
	.short	771
	.short	771
	.short	1
	.short	2
	.short	771
	.short	1795
	.short	6
	.short	2
	.short	771
	.short	7
	.short	6
	.short	2
	.short	1795
	.short	1792
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	768
	.short	0
	.short	0
	.short	0
	.short	771
	.short	512
	.short	0
	.short	768
	.short	771
	.short	512
	.short	0
	.short	771
	.short	771
	.short	515
	.short	256
	.short	768
	.short	771
	.short	512
	.short	256
	.short	0
	.short	771
	.short	512
	.short	256
	.short	0
	.short	768
	.short	512
	.short	256
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	1
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	0
	.short	0
	.short	512
	.short	258
	.short	0
	.short	768
	.short	512
	.short	258
	.short	0
	.short	771
	.short	512
	.short	1282
	.short	768
	.short	771
	.short	512
	.short	256
	.short	771
	.short	771
	.short	515
	.short	256
	.short	768
	.short	771
	.short	512
	.short	256
	.short	0
	.short	771
	.short	512
	.short	512
	.short	0
	.short	768
	.short	512
	.short	512
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	1285
	.short	1285
	.short	1285
	.short	1285
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	518
	.short	518
	.short	518
	.short	518
	.short	518
	.short	518
	.short	518
	.short	518
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	775
	.short	1792
	.short	0
	.short	1792
	.short	771
	.short	512
	.short	1792
	.short	775
	.short	771
	.short	512
	.short	0
	.short	771
	.short	771
	.short	515
	.short	256
	.short	775
	.short	771
	.short	512
	.short	256
	.short	1792
	.short	771
	.short	519
	.short	256
	.short	7
	.short	775
	.short	512
	.short	256
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1792
	.short	0
	.short	7
	.short	0
	.short	256
	.short	257
	.short	257
	.short	1792
	.short	257
	.short	257
	.short	257
	.short	1
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	0
	.short	1792
	.short	519
	.short	258
	.short	7
	.short	775
	.short	512
	.short	258
	.short	1792
	.short	771
	.short	519
	.short	1282
	.short	775
	.short	771
	.short	512
	.short	256
	.short	771
	.short	771
	.short	515
	.short	256
	.short	775
	.short	771
	.short	512
	.short	256
	.short	1792
	.short	771
	.short	512
	.short	1536
	.short	7
	.short	775
	.short	512
	.short	1536
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	1285
	.short	1285
	.short	1285
	.short	1285
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	257
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	1538
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	256
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	1280
	.short	1285
	.short	1285
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	257
	.short	0
	.short	0
	.short	0
	.short	257
	.short	1
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	1285
	.short	1285
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	256
	.short	257
	.short	257
	.short	512
	.short	514
	.short	514
	.short	514
	.short	768
	.short	771
	.short	771
	.short	3
	.short	0
	.short	771
	.short	771
	.short	0
	.short	0
	.short	768
	.short	3
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	514
	.short	514
	.short	514
	.short	2
	.short	768
	.short	771
	.short	771
	.short	3
	.short	0
	.short	771
	.short	771
	.short	0
	.short	0
	.short	768
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1792
	.short	0
	.short	256
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	1792
	.short	256
	.short	257
	.short	257
	.short	7
	.short	256
	.short	257
	.short	257
	.short	1792
	.short	256
	.short	257
	.short	257
	.short	10
	.short	1280
	.short	1285
	.short	1285
	.short	0
	.short	256
	.short	257
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	257
	.short	0
	.short	1792
	.short	0
	.short	257
	.short	1
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	1792
	.short	257
	.short	257
	.short	1792
	.short	0
	.short	257
	.short	257
	.short	0
	.short	7
	.short	1285
	.short	1285
	.short	1792
	.short	0
	.short	257
	.short	257
	.short	0
	.short	2560
	.short	1792
	.short	256
	.short	257
	.short	257
	.short	10
	.short	256
	.short	257
	.short	257
	.short	1792
	.short	256
	.short	257
	.short	257
	.short	10
	.short	256
	.short	257
	.short	257
	.short	512
	.short	514
	.short	514
	.short	514
	.short	768
	.short	771
	.short	771
	.short	2563
	.short	2567
	.short	771
	.short	771
	.short	10
	.short	7
	.short	778
	.short	2563
	.short	2560
	.short	257
	.short	257
	.short	1792
	.short	0
	.short	257
	.short	257
	.short	0
	.short	1792
	.short	257
	.short	257
	.short	1792
	.short	0
	.short	257
	.short	257
	.short	0
	.short	2560
	.short	514
	.short	514
	.short	514
	.short	2
	.short	778
	.short	771
	.short	771
	.short	1795
	.short	2560
	.short	771
	.short	771
	.short	10
	.short	10
	.short	778
	.short	2563
	.short	1792
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	2049
	.short	2056
	.short	0
	.short	1024
	.short	1025
	.short	1028
	.short	0
	.short	2049
	.short	2052
	.short	2056
	.short	0
	.short	2052
	.short	1032
	.short	1028
	.short	2048
	.short	2056
	.short	1028
	.short	2056
	.short	256
	.short	1028
	.short	1028
	.short	1028
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	8
	.short	1
	.short	0
	.short	0
	.short	1032
	.short	260
	.short	0
	.short	0
	.short	2052
	.short	1032
	.short	0
	.short	0
	.short	2052
	.short	2056
	.short	2056
	.short	1
	.short	1032
	.short	1028
	.short	1028
	.short	8
	.short	2052
	.short	2052
	.short	1032
	.short	264
	.short	2048
	.short	1028
	.short	2052
	.short	2052
	.short	256
	.short	1032
	.short	2052
	.short	1028
	.short	1024
	.short	1028
	.short	260
	.short	260
	.short	1024
	.short	1032
	.short	257
	.short	260
	.short	1024
	.short	1032
	.short	1028
	.short	1025
	.short	1024
	.short	1028
	.short	1025
	.short	1028
	.short	0
	.short	0
	.short	1538
	.short	1538
	.short	0
	.short	0
	.short	1538
	.short	1538
	.short	1028
	.short	1028
	.short	1028
	.short	2056
	.short	1028
	.short	1032
	.short	1032
	.short	2056
	.short	260
	.short	260
	.short	1028
	.short	260
	.short	1028
	.short	1028
	.short	2052
	.short	4
	.short	1028
	.short	1025
	.short	2052
	.short	8
	.short	1025
	.short	1028
	.short	2049
	.short	4
	.short	1538
	.short	1538
	.short	2
	.short	0
	.short	1538
	.short	1538
	.short	2
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1024
	.short	0
	.short	0
	.short	4
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1024
	.short	1028
	.short	4
	.short	1024
	.short	4
	.short	0
	.short	1028
	.short	1024
	.short	1024
	.short	4
	.short	1024
	.short	1024
	.short	4
	.short	1024
	.short	0
	.short	4
	.short	4
	.short	1024
	.short	1028
	.short	260
	.short	1028
	.short	257
	.short	260
	.short	257
	.short	260
	.short	1025
	.short	260
	.short	1024
	.short	0
	.short	1540
	.short	1538
	.short	0
	.short	0
	.short	1026
	.short	1540
	.short	1024
	.short	4
	.short	0
	.short	4
	.short	4
	.short	4
	.short	1024
	.short	4
	.short	1024
	.short	1024
	.short	4
	.short	4
	.short	1028
	.short	1024
	.short	1028
	.short	1024
	.short	1025
	.short	260
	.short	260
	.short	1028
	.short	260
	.short	257
	.short	1028
	.short	260
	.short	1538
	.short	1540
	.short	2
	.short	4
	.short	1026
	.short	1026
	.short	2
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	256
	.short	0
	.short	0
	.short	0
	.short	257
	.short	512
	.short	514
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	1
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	1280
	.short	1285
	.short	1285
	.short	1285
	.short	0
	.short	1285
	.short	256
	.short	257
	.short	0
	.short	0
	.short	256
	.short	257
	.short	0
	.short	0
	.short	256
	.short	257
	.short	0
	.short	0
	.short	256
	.short	257
	.short	0
	.short	0
	.short	512
	.short	518
	.short	0
	.short	0
	.short	512
	.short	518
	.short	257
	.short	257
	.short	257
	.short	0
	.short	1285
	.short	1285
	.short	1285
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	518
	.short	518
	.short	518
	.short	0
	.short	518
	.short	518
	.short	518
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	256
	.short	0
	.short	0
	.short	0
	.short	257
	.short	512
	.short	514
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	1
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	1280
	.short	1285
	.short	1285
	.short	1285
	.short	0
	.short	1285
	.short	256
	.short	257
	.short	0
	.short	2313
	.short	256
	.short	257
	.short	2304
	.short	2305
	.short	256
	.short	257
	.short	256
	.short	265
	.short	256
	.short	257
	.short	2304
	.short	2305
	.short	512
	.short	518
	.short	0
	.short	0
	.short	512
	.short	518
	.short	257
	.short	257
	.short	257
	.short	0
	.short	1285
	.short	1285
	.short	1285
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	518
	.short	518
	.short	518
	.short	0
	.short	518
	.short	518
	.short	518
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	256
	.short	0
	.short	0
	.short	0
	.short	257
	.short	512
	.short	514
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.short	257
	.short	257
	.short	1
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	512
	.short	1542
	.short	258
	.short	257
	.short	1280
	.short	1285
	.short	1285
	.short	1285
	.short	0
	.short	1285
	.short	256
	.short	257
	.short	0
	.short	2313
	.short	256
	.short	257
	.short	2304
	.short	2305
	.short	256
	.short	257
	.short	265
	.short	265
	.short	256
	.short	257
	.short	2305
	.short	2305
	.short	512
	.short	518
	.short	265
	.short	265
	.short	512
	.short	518
	.short	257
	.short	257
	.short	257
	.short	0
	.short	1285
	.short	1285
	.short	1285
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	257
	.short	257
	.short	257
	.short	0
	.short	518
	.short	518
	.short	518
	.short	0
	.short	518
	.short	518
	.short	518
	.short	0
	.global	spritePalette
	.align	1
	.type	spritePalette, %object
	.size	spritePalette, 512
spritePalette:
	.short	32767
	.short	2556
	.short	1378
	.short	10570
	.short	3194
	.short	20516
	.short	1701
	.short	1296
	.short	27482
	.short	1086
	.short	203
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.global	stotal
	.data
	.align	2
	.type	stotal, %object
	.size	stotal, 4
stotal:
	.word	1664
	.text
	.align	2
	.global	UpdateSpriteMemory
	.type	UpdateSpriteMemory, %function
UpdateSpriteMemory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #508
	ldr	ip, .L302	@  temp
	@ lr needed for prologue
	mov	r1, #0	@  n
	add	r0, r0, #3
.L299:
	mov	r2, r1, asl #1	@  n
	add	r3, r2, #117440512
	add	r1, r1, #1	@  n,  n
	ldrh	r2, [r2, ip]	@ movhi	@ * temp
	cmp	r1, r0	@  n
	strh	r2, [r3, #0]	@ movhi 
	ble	.L299
	bx	lr
.L303:
	.align	2
.L302:
	.word	gamesprites
	.size	UpdateSpriteMemory, .-UpdateSpriteMemory
	.align	2
	.global	setSpriteInfo
	.type	setSpriteInfo, %function
setSpriteInfo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r3, r0, r0, asl #1	@  num,  num
	stmfd	sp!, {r4, lr}
	rsb	r0, r0, r3, asl #3	@  num
	ldr	lr, .L305
	mov	r0, r0, asl #2
	mov	r2, #240
	add	r3, r0, lr
	str	r2, [r0, lr]	@  <variable>.x
	mov	r2, #160
	str	r2, [r3, #4]	@  <variable>.y
	mov	r2, #8	@ movhi
	strh	r2, [r3, #10]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #16	@ movhi
	strh	r2, [r3, #12]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #24	@ movhi
	strh	r2, [r3, #14]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #32	@ movhi
	strh	r2, [r3, #16]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #40	@ movhi
	strh	r2, [r3, #18]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #48	@ movhi
	strh	r2, [r3, #20]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #56	@ movhi
	strh	r2, [r3, #22]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #64	@ movhi
	strh	r2, [r3, #24]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #72	@ movhi
	strh	r2, [r3, #26]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #80	@ movhi
	strh	r2, [r3, #28]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #88	@ movhi
	strh	r2, [r3, #30]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #96	@ movhi
	mov	r1, #1
	mov	ip, #0
	mov	r4, #50
	strh	r2, [r3, #32]	@ movhi 	@  <variable>.currentFrame
	mov	r2, #104	@ movhi
	str	ip, [r3, #36]	@  <variable>.activeFrame
	str	r1, [r3, #52]	@  <variable>.tankType
	str	r4, [r3, #68]	@  <variable>.gasLevel
	strh	ip, [r3, #8]	@ movhi 	@  <variable>.currentFrame
	str	r1, [r3, #40]	@  <variable>.alive
	str	r4, [r3, #56]	@  <variable>.hullType
	str	r1, [r3, #60]	@  <variable>.engineType
	str	r1, [r3, #72]	@  <variable>.Movespeed
	str	r1, [r3, #48]	@  <variable>.drillType
	str	ip, [r3, #64]	@  <variable>.money
	strh	r2, [r3, #34]	@ movhi 	@  <variable>.currentFrame
	ldmfd	sp!, {r4, lr}
	bx	lr
.L306:
	.align	2
.L305:
	.word	sprites
	.size	setSpriteInfo, .-setSpriteInfo
	.align	2
	.global	CopySpritePal
	.type	CopySpritePal, %function
CopySpritePal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #83886080
	ldr	r0, .L315
	@ lr needed for prologue
	mov	r2, #0	@  n
	add	r1, r1, #512
.L312:
	mov	r3, r2, asl #1	@  n
	ldrh	ip, [r3, r0]	@ movhi	@  spritePalette
	add	r2, r2, #1	@  n,  n
	cmp	r2, #255	@  n
	strh	ip, [r3, r1]	@ movhi 
	ble	.L312
	bx	lr
.L316:
	.align	2
.L315:
	.word	spritePalette
	.size	CopySpritePal, .-CopySpritePal
	.align	2
	.global	CopySpriteData
	.type	CopySpriteData, %function
CopySpriteData:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L325
	ldr	r3, [r3, #0]	@  stotal
	mov	r2, #0	@  n
	cmp	r2, r3	@  n
	bge	.L324
	mov	r0, #100663296
	ldr	ip, .L325+4
	mov	r1, r3
	add	r0, r0, #65536
.L322:
	mov	r3, r2, asl #1	@  n
	ldrh	lr, [r3, ip]	@ movhi	@  spriteData
	add	r2, r2, #1	@  n,  n
	cmp	r2, r1	@  n
	strh	lr, [r3, r0]	@ movhi 
	blt	.L322
.L324:
	ldr	lr, [sp], #4
	bx	lr
.L326:
	.align	2
.L325:
	.word	stotal
	.word	spriteData
	.size	CopySpriteData, .-CopySpriteData
	.align	2
	.global	initSprites
	.type	initSprites, %function
initSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, fp, ip, lr, pc}
	mov	r4, #0	@  n
	ldr	r5, .L335
	sub	fp, ip, #4
	mov	r6, r4	@  n,  n
.L332:
	mov	r0, r4	@  n
	bl	setSpriteInfo
	mov	r2, r4, asl #3	@  n
	mov	r1, #160	@ movhi
	add	r4, r4, #1	@  n,  n
	add	r3, r2, r5
	strh	r1, [r2, r5]	@ movhi 	@  <variable>.attribute0
	cmp	r4, #127	@  n
	mov	r2, #240	@ movhi
	strh	r6, [r3, #4]	@ movhi 	@  n,  <variable>.attribute2
	strh	r2, [r3, #2]	@ movhi 	@  <variable>.attribute1
	ble	.L332
	ldr	r2, .L335+4
	mov	r3, #70
	str	r3, [r2, #4]	@  <variable>.y
	str	r6, [r2, #0]	@  n,  <variable>.x
	ldmea	fp, {r4, r5, r6, fp, sp, lr}
	bx	lr
.L336:
	.align	2
.L335:
	.word	gamesprites
	.word	sprites
	.size	initSprites, .-initSprites
	.align	2
	.global	loadSprite
	.type	loadSprite, %function
loadSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	CopySpritePal
	bl	CopySpriteData
	ldr	r3, .L338
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldmea	fp, {fp, sp, lr}
	bx	lr
.L339:
	.align	2
.L338:
	.word	updateSprite
	.size	loadSprite, .-loadSprite
	.align	2
	.global	flipSprite
	.type	flipSprite, %function
flipSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L348
	cmp	r0, #0	@  flip
	add	r2, r3, r1, asl #3	@  num
	ldreqh	r3, [r2, #2]	@  <variable>.attribute1
	orreq	r3, r3, #4096
	@ lr needed for prologue
	streqh	r3, [r2, #2]	@ movhi 	@  <variable>.attribute1
	bxeq	lr
	ldr	r3, .L348
	cmp	r0, #1	@  flip
	add	r1, r3, r1, asl #3	@  num
	bxne	lr
	ldrh	r3, [r1, #2]	@  <variable>.attribute1
	bic	r3, r3, #4352
	bic	r3, r3, #16
	strh	r3, [r1, #2]	@ movhi 	@  <variable>.attribute1
	ldrh	r2, [r1, #2]	@  <variable>.attribute1
	orr	r2, r2, #4096
	strh	r2, [r1, #2]	@ movhi 	@  <variable>.attribute1
	ldrh	r3, [r1, #2]	@  <variable>.attribute1
	bic	r3, r3, #4352
	bic	r3, r3, #16
	strh	r3, [r1, #2]	@ movhi 	@  <variable>.attribute1
	bx	lr
.L349:
	.align	2
.L348:
	.word	gamesprites
	.size	flipSprite, .-flipSprite
	.global	__negdf2
	.align	2
	.global	RotateSprite
	.type	RotateSprite, %function
RotateSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	mov	r6, r1, asl #3	@  angle
	ldr	r1, .L351
	sub	fp, ip, #4
	sub	sp, sp, #4
	add	r1, r6, r1
	ldmia	r1, {r4-r5}	@  COS,  rotDataIndex
	mov	r7, r3	@  y_scale
	str	r0, [fp, #-44]	@  rotDataIndex
	ldr	r3, .L351+4
	mov	r1, r5	@  rotDataIndex
	mov	r0, r4	@  rotDataIndex
	mov	r9, r2	@  x_scale
	mov	lr, pc
	bx	r3
	ldr	r3, .L351+8
	add	r6, r6, r3
	ldmia	r6, {r4-r5}	@  SIN,  rotDataIndex
	mov	sl, r0	@  rotDataIndex
	mul	r8, r0, r9	@  rotDataIndex,  x_scale
	ldr	r3, .L351+4
	mov	r1, r5	@  rotDataIndex
	mov	r0, r4	@  rotDataIndex
	mov	lr, pc
	bx	r3
	ldr	r3, .L351+12
	mul	r6, r0, r7	@  rotDataIndex,  y_scale
	mov	r1, r5	@  rotDataIndex
	mov	r0, r4	@  rotDataIndex
	mov	lr, pc
	bx	r3
	ldr	r3, .L351+4
	mov	lr, pc
	bx	r3
	mul	r1, sl, r7	@  rotDataIndex,  y_scale
	mul	ip, r0, r9	@  rotDataIndex,  x_scale
	ldr	r3, .L351+16
	ldr	r2, [r3, #0]	@  rotData
	ldr	r3, [fp, #-44]	@  rotDataIndex
	mov	r8, r8, asr #8	@  pa
	add	r2, r2, r3, asl #5
	mov	r6, r6, asr #8	@  pb
	mov	ip, ip, asr #8	@  pc
	mov	r1, r1, asr #8	@  pd
	strh	r1, [r2, #30]	@ movhi 	@  pd,  <variable>.pd
	strh	r8, [r2, #6]	@ movhi 	@  pa,  <variable>.pa
	strh	r6, [r2, #14]	@ movhi 	@  pb,  <variable>.pb
	strh	ip, [r2, #22]	@ movhi 	@  pc,  <variable>.pc
	ldmea	fp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
	bx	lr
.L352:
	.align	2
.L351:
	.word	COS
	.word	__fixdfsi
	.word	SIN
	.word	__negdf2
	.word	rotData
	.size	RotateSprite, .-RotateSprite
	.align	2
	.global	updateSprite
	.type	updateSprite, %function
updateSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	add	r2, r0, r0, asl #1	@  num,  num
	rsb	r2, r0, r2, asl #3	@  num
	ldr	ip, .L354
	mov	r3, r2, asl #2
	add	lr, r3, ip
	ldrh	r4, [r3, ip]	@  <variable>.x
	ldr	r5, .L354+4
	ldr	r1, [lr, #36]	@  <variable>.activeFrame
	ldrh	r3, [lr, #4]	@  <variable>.y
	mov	r0, r0, asl #3	@  num
	add	r1, r1, r2, asl #1
	orr	r3, r3, #8192
	add	r2, r0, r5
	orr	r4, r4, #16384
	strh	r3, [r0, r5]	@ movhi 	@  <variable>.attribute0
	strh	r4, [r2, #2]	@ movhi 	@  <variable>.attribute1
	add	ip, ip, r1, asl #1
	ldrh	ip, [ip, #8]	@ movhi	@  <variable>.currentFrame
	strh	ip, [r2, #4]	@ movhi 	@  <variable>.attribute2
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L355:
	.align	2
.L354:
	.word	sprites
	.word	gamesprites
	.size	updateSprite, .-updateSprite
	.align	2
	.global	setHealth
	.type	setHealth, %function
setHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r1, r1, asl #1	@  num,  num
	ldr	r3, .L357
	rsb	r1, r1, r2, asl #3	@  num
	add	r3, r3, r1, asl #2
	@ lr needed for prologue
	str	r0, [r3, #44]	@  health,  <variable>.health
	bx	lr
.L358:
	.align	2
.L357:
	.word	sprites
	.size	setHealth, .-setHealth
	.align	2
	.global	setAlive
	.type	setAlive, %function
setAlive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, r0, asl #1	@  num,  num
	ldr	r3, .L360
	rsb	r0, r0, r2, asl #3	@  num
	add	r3, r3, r0, asl #2
	@ lr needed for prologue
	str	r1, [r3, #40]	@  life,  <variable>.alive
	bx	lr
.L361:
	.align	2
.L360:
	.word	sprites
	.size	setAlive, .-setAlive
	.align	2
	.global	setGas
	.type	setGas, %function
setGas:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, r0, asl #1	@  num,  num
	ldr	r3, .L363
	rsb	r0, r0, r2, asl #3	@  num
	add	r3, r3, r0, asl #2
	@ lr needed for prologue
	str	r1, [r3, #68]	@  gas,  <variable>.gasLevel
	bx	lr
.L364:
	.align	2
.L363:
	.word	sprites
	.size	setGas, .-setGas
	.align	2
	.global	setMoney
	.type	setMoney, %function
setMoney:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, r0, asl #1	@  num,  num
	ldr	r3, .L366
	rsb	r0, r0, r2, asl #3	@  num
	add	r3, r3, r0, asl #2
	@ lr needed for prologue
	str	r1, [r3, #64]	@  money,  <variable>.money
	bx	lr
.L367:
	.align	2
.L366:
	.word	sprites
	.size	setMoney, .-setMoney
	.align	2
	.global	setDrill
	.type	setDrill, %function
setDrill:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, r0, asl #1	@  num,  num
	ldr	r3, .L369
	rsb	r0, r0, r2, asl #3	@  num
	add	r3, r3, r0, asl #2
	@ lr needed for prologue
	str	r1, [r3, #48]	@  drill,  <variable>.drillType
	bx	lr
.L370:
	.align	2
.L369:
	.word	sprites
	.size	setDrill, .-setDrill
	.align	2
	.global	setSpeed
	.type	setSpeed, %function
setSpeed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, r0, asl #1	@  num,  num
	ldr	r3, .L372
	rsb	r0, r0, r2, asl #3	@  num
	add	r3, r3, r0, asl #2
	@ lr needed for prologue
	str	r1, [r3, #72]	@  speed,  <variable>.Movespeed
	bx	lr
.L373:
	.align	2
.L372:
	.word	sprites
	.size	setSpeed, .-setSpeed
	.align	2
	.global	setEngine
	.type	setEngine, %function
setEngine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, r0, asl #1	@  num,  num
	ldr	r3, .L375
	rsb	r0, r0, r2, asl #3	@  num
	add	r3, r3, r0, asl #2
	@ lr needed for prologue
	str	r1, [r3, #60]	@  Engine,  <variable>.engineType
	bx	lr
.L376:
	.align	2
.L375:
	.word	sprites
	.size	setEngine, .-setEngine
	.align	2
	.global	setTank
	.type	setTank, %function
setTank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, r0, asl #1	@  num,  num
	ldr	r3, .L378
	rsb	r0, r0, r2, asl #3	@  num
	add	r3, r3, r0, asl #2
	@ lr needed for prologue
	str	r1, [r3, #52]	@  tank,  <variable>.tankType
	bx	lr
.L379:
	.align	2
.L378:
	.word	sprites
	.size	setTank, .-setTank
	.align	2
	.global	setHull
	.type	setHull, %function
setHull:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, r0, asl #1	@  num,  num
	ldr	r3, .L381
	rsb	r0, r0, r2, asl #3	@  num
	add	r3, r3, r0, asl #2
	@ lr needed for prologue
	str	r1, [r3, #56]	@  hull,  <variable>.hullType
	bx	lr
.L382:
	.align	2
.L381:
	.word	sprites
	.size	setHull, .-setHull
	.align	2
	.global	PlaySprite
	.type	PlaySprite, %function
PlaySprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	mov	r5, r0	@  num
	mov	r6, r0, asl #1	@  num
	sub	fp, ip, #4
	bl	keyPoll
	ldr	r7, .L426
	bl	WaitVBlank
	add	r3, r6, r5	@  num
	rsb	r3, r5, r3, asl #3	@  num
	add	r4, r7, r3, asl #2
	ldr	r3, [r4, #40]	@  <variable>.alive
	cmp	r3, #1
	beq	.L424
	cmp	r3, #0
	bne	.L412
	ldr	r3, [r4, #36]	@  <variable>.activeFrame
	cmp	r3, #10
	moveq	r3, #11
	beq	.L423
	cmp	r3, #11
	movne	r3, #10
	beq	.L425
.L423:
	str	r3, [r4, #36]	@  <variable>.activeFrame
.L412:
	mov	r0, r5	@  num
	ldmea	fp, {r4, r5, r6, r7, fp, sp, lr}
	b	updateSprite
.L425:
	bl	drawGameOver
	b	.L412
.L424:
	mov	r0, #64
	bl	keyHeld
	cmp	r0, #0	@  num
	beq	.L385
	ldr	r3, [r4, #4]	@  <variable>.y
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #4]	@  <variable>.y
	ldr	r3, [r4, #36]	@  <variable>.activeFrame
	cmp	r3, #11
	moveq	r3, #12
	movne	r3, #11
	str	r3, [r4, #36]	@  <variable>.activeFrame
.L385:
	mov	r0, #128
	bl	keyHeld
	cmp	r0, #0	@  num
	beq	.L389
	add	r3, r6, r5	@  num
	rsb	r3, r5, r3, asl #3	@  num
	add	r2, r7, r3, asl #2
	ldr	r3, [r2, #4]	@  <variable>.y
	cmp	r3, #143
	addle	r3, r3, #1
	strle	r3, [r2, #4]	@  <variable>.y
	ldr	r3, [r2, #36]	@  <variable>.activeFrame
	cmp	r3, #6
	moveq	r3, #7
	movne	r3, #6
	str	r3, [r2, #36]	@  <variable>.activeFrame
.L389:
	mov	r0, #32
	bl	keyHeld
	cmp	r0, #0	@  num
	beq	.L393
	add	r3, r6, r5	@  num
	rsb	r3, r5, r3, asl #3	@  num
	mov	r2, r3, asl #2
	ldr	r3, [r2, r7]	@  <variable>.x
	cmp	r3, #0
	subgt	r3, r3, #1
	add	r1, r2, r7
	strgt	r3, [r2, r7]	@  <variable>.x
	ldr	r3, [r1, #4]	@  <variable>.y
	cmp	r3, #70
	bgt	.L395
	ldr	r3, [r1, #36]	@  <variable>.activeFrame
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
.L421:
	str	r3, [r1, #36]	@  <variable>.activeFrame
.L393:
	mov	r0, #16
	bl	keyHeld
	cmp	r0, #0	@  num
	beq	.L401
	add	r3, r6, r5	@  num
	rsb	r3, r5, r3, asl #3	@  num
	mov	r2, r3, asl #2
	ldr	r3, [r2, r7]	@  <variable>.x
	cmp	r3, #223
	addle	r3, r3, #1
	add	r1, r2, r7
	strle	r3, [r2, r7]	@  <variable>.x
	ldr	r3, [r1, #4]	@  <variable>.y
	cmp	r3, #70
	bgt	.L403
	ldr	r3, [r1, #36]	@  <variable>.activeFrame
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
.L422:
	str	r3, [r1, #36]	@  <variable>.activeFrame
.L401:
	mov	r0, #64
	bl	keyIsUp
	cmp	r0, #0	@  num
	beq	.L412
	add	r3, r6, r5	@  num
	rsb	r3, r5, r3, asl #3	@  num
	add	r2, r7, r3, asl #2
	ldr	r3, [r2, #4]	@  <variable>.y
	cmp	r3, #29
	bgt	.L412
	cmp	r3, #30
	beq	.L418
	add	r3, r3, #4
	cmp	r3, #30
	str	r3, [r2, #4]	@  <variable>.y
	bne	.L412
.L418:
	mov	r3, #0
	str	r3, [r2, #36]	@  <variable>.activeFrame
	b	.L412
.L403:
	ldr	r3, [r1, #36]	@  <variable>.activeFrame
	cmp	r3, #2
	moveq	r3, #3
	movne	r3, #2
	b	.L422
.L395:
	ldr	r3, [r1, #36]	@  <variable>.activeFrame
	cmp	r3, #4
	moveq	r3, #5
	movne	r3, #4
	b	.L421
.L427:
	.align	2
.L426:
	.word	sprites
	.size	PlaySprite, .-PlaySprite
	.align	2
	.global	Initialize
	.type	Initialize, %function
Initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	ldr	r3, .L429
	mov	ip, sp
	mov	r2, #1
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	str	r2, [r3, #0]	@  GameState
	bl	initSprites
	ldmea	fp, {fp, sp, lr}
	b	initbackgrounds
.L430:
	.align	2
.L429:
	.word	GameState
	.size	Initialize, .-Initialize
	.align	2
	.global	LoadContent
	.type	LoadContent, %function
LoadContent:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	ldr	r2, .L440
	ldr	r3, [r2, #0]	@  GameState
	sub	fp, ip, #4
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L431
	.p2align 2
.L439:
	.word	.L433
	.word	.L434
	.word	.L431
	.word	.L431
	.word	.L431
.L433:
	ldmea	fp, {fp, sp, lr}
	b	loadTitle
.L434:
	bl	loadBackground
	ldmea	fp, {fp, sp, lr}
	b	loadSprite
.L431:
	ldmea	fp, {fp, sp, lr}
	bx	lr
.L441:
	.align	2
.L440:
	.word	GameState
	.size	LoadContent, .-LoadContent
	.align	2
	.global	Update
	.type	Update, %function
Update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	ldr	r2, .L451
	ldr	r3, [r2, #0]	@  GameState
	sub	fp, ip, #4
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L442
	.p2align 2
.L450:
	.word	.L444
	.word	.L445
	.word	.L442
	.word	.L447
	.word	.L448
.L444:
	mov	r3, #67108864
	mov	r2, #260	@ movhi
	strh	r2, [r3, #0]	@ movhi 
	ldmea	fp, {fp, sp, lr}
	b	updateTitle
.L445:
	mov	r3, #67108864
	mov	r2, #4928	@ movhi
	strh	r2, [r3, #0]	@ movhi 
	bl	drawBackground
	mov	r0, #0
	ldmea	fp, {fp, sp, lr}
	b	PlaySprite
.L442:
	ldmea	fp, {fp, sp, lr}
	bx	lr
.L447:
	ldmea	fp, {fp, sp, lr}
	b	updateInventory
.L448:
	ldmea	fp, {fp, sp, lr}
	b	updateGameOver
.L452:
	.align	2
.L451:
	.word	GameState
	.size	Update, .-Update
	.align	2
	.global	Draw
	.type	Draw, %function
Draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	WaitVBlank
	ldr	r2, .L462
	ldr	r3, [r2, #0]	@  GameState
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L453
	.p2align 2
.L461:
	.word	.L455
	.word	.L456
	.word	.L453
	.word	.L458
	.word	.L459
.L455:
	ldmea	fp, {fp, sp, lr}
	b	drawTitle
.L456:
	bl	WaitVBlank
	ldmea	fp, {fp, sp, lr}
	b	UpdateSpriteMemory
.L453:
	ldmea	fp, {fp, sp, lr}
	bx	lr
.L458:
	ldmea	fp, {fp, sp, lr}
	b	drawInventory
.L459:
	ldmea	fp, {fp, sp, lr}
	b	drawGameOver
.L463:
	.align	2
.L462:
	.word	GameState
	.size	Draw, .-Draw
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	Initialize
	bl	LoadContent
.L472:
	bl	Update
	bl	Draw
	mov	r3, #29952	@  n
	add	r3, r3, #48	@  n,  n
.L471:
	sub	r3, r3, #1	@  n,  n
	cmp	r3, #0	@  n
	bgt	.L471
	b	.L472
	.size	main, .-main
	.comm	gamesprites, 1024, 32
	.comm	sprites, 11776, 32
	.comm	videoBuffer, 4, 32
	.comm	curr_state, 2, 16
	.comm	prev_state, 2, 16
	.comm	buttons, 20, 16
	.comm	map_Map, 4, 32
	.comm	material_Map, 4, 32
	.comm	bg, 76, 32
	.comm	tileToCopy, 4, 32
	.comm	locationToPaste, 4, 32
	.comm	x, 4, 32
	.comm	y, 4, 32
	.comm	mapWidthTiles, 4, 32
	.comm	mapHeightTiles, 4, 32
	.comm	screenWidth, 4, 32
	.comm	screenHeight, 4, 32
	.comm	playerXTile, 4, 32
	.comm	playerYTile, 4, 32
	.comm	bg1map, 4, 32
	.comm	xLoop, 4, 32
	.comm	yLoop, 4, 32
	.comm	GameState, 4, 32
	.ident	"GCC: (GNU) 3.3.2"
