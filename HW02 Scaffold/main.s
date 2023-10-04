	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press START to begin\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #31744
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	ldr	r2, .L4+8
	mov	r1, #40
	mov	r0, #50
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	32767
	.word	waitForVBlank
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+4
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L6
	ldr	r3, .L13+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L12
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L13+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L14:
	.align	2
.L13:
	.word	waitForVBlank
	.word	buttons
	.word	oldButtons
	.word	initGame
	.word	state
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L16
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Congrats you win!\000"
	.align	2
.LC2:
	.ascii	"press START to try again\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L20
	ldr	r3, .L20+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L20+8
	mov	r3, #992
	mov	r1, #40
	mov	r0, #50
	ldr	r2, .L20+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L20+16
	mov	r3, #31744
	mov	r1, #60
	mov	r0, #50
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L20+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC1
	.word	.LC2
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L29
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+4
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L22
	ldr	r3, .L29+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L28
.L22:
	pop	{r4, lr}
	bx	lr
.L28:
	pop	{r4, lr}
	b	goToStart
.L30:
	.align	2
.L29:
	.word	waitForVBlank
	.word	buttons
	.word	oldButtons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Ahhh no game over\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #0
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	ldr	r4, .L33+4
	mov	r3, #31
	mov	r1, #40
	mov	r0, #50
	ldr	r2, .L33+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L33+12
	mov	r3, #31744
	mov	r1, #60
	mov	r0, #50
	mov	lr, pc
	bx	r4
	ldr	r3, .L33+16
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L33+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
	.word	fillScreen
	.word	drawString
	.word	.LC3
	.word	.LC2
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L41
	ldr	r4, .L41+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ble	.L39
.L36:
	ldr	r3, [r4, #4]
	cmp	r3, #19
	ble	.L40
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToWin
.L39:
	bl	goToLose
	b	.L36
.L42:
	.align	2
.L41:
	.word	updateGame
	.word	player
	.word	drawGame
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Debugger Opened\000"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L46
	push	{r4, lr}
	ldr	r3, .L46+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r1, .L46+8
	ldr	r3, .L46+12
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L46+16
	ldr	r1, .L46+20
	ldrh	r0, [r3, #48]
	ldr	r3, .L46+24
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L47:
	.align	2
.L46:
	.word	1027
	.word	mgba_open
	.word	.LC4
	.word	mgba_printf_level
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r6, .L57+4
	ldr	r10, .L57+8
	ldr	r5, .L57+12
	ldr	r9, .L57+16
	ldr	r8, .L57+20
	ldr	r7, .L57+24
	ldr	r4, .L57+28
.L49:
	ldr	r2, [r6]
	ldrh	r3, [r10]
.L55:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	cmp	r2, #3
	strh	r3, [r10]	@ movhi
	bgt	.L55
	cmp	r2, #1
	bgt	.L51
	cmp	r2, #0
	beq	.L52
	cmp	r2, #1
	bne	.L55
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r3, [r10]
	b	.L55
.L51:
	mov	lr, pc
	bx	r7
	b	.L49
.L52:
	mov	lr, pc
	bx	r9
	b	.L49
.L58:
	.align	2
.L57:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	win
	.word	67109120
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
