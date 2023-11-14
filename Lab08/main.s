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
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #2048
	strh	r3, [r2]	@ movhi
	ldr	r4, .L4+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #131072
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	DMANow
	.word	backgroundTiles
	.word	backgroundPal
	.word	initGame
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
	ldr	r3, .L9
	mov	lr, pc
	bx	r3
	ldr	r9, .L9+4
	ldr	r4, .L9+8
	ldr	r8, .L9+12
	ldr	r7, .L9+16
	ldr	r6, .L9+20
	ldr	r5, .L9+24
.L7:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L7
.L10:
	.align	2
.L9:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	67109120
	.size	main, .-main
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
