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
	.ascii	"Debug logs initialized!\000"
	.align	2
.LC1:
	.ascii	"%s\000"
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
	ldr	r3, .L4+4
	ldr	r1, .L4+8
	ldr	r0, .L4+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L4+16
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	mgba_printf
	.word	.LC0
	.word	.LC1
	.word	1027
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Frame count: %d\000"
	.text
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	ldr	r1, [r3]
	cmp	r1, #10
	push	{r4, lr}
	ble	.L12
	ldr	r0, .L13+4
	ldrh	r2, [r0]
	cmp	r2, #16384
	moveq	r2, #512
	moveq	r1, #1
	strheq	r2, [r0]	@ movhi
	beq	.L8
	cmp	r2, #512
	beq	.L10
.L12:
	add	r1, r1, #1
.L8:
	ldr	r0, .L13+8
	ldr	r2, .L13+12
	str	r1, [r3]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L10:
	mov	r2, #16384
	mov	r1, #1
	strh	r2, [r0]	@ movhi
	b	.L8
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC2
	.word	mgba_printf
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #10
	push	{r4, r5, lr}
	ldr	r4, .L17
	ldrh	r3, [r4]
	sub	sp, sp, #12
	mov	r0, r1
	str	r3, [sp]
	mov	r2, #40
	mov	r3, #30
	ldr	r5, .L17+4
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	mov	r2, #40
	mov	r1, #10
	mov	r0, #70
	ldr	r5, .L17+8
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4]
	mov	r3, #30
	str	r2, [sp]
	mov	r1, #60
	mov	r2, #45
	mov	r0, #70
	ldr	r5, .L17+12
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	mov	r2, #20
	mov	r1, #80
	mov	r0, #40
	ldr	r4, .L17+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR1
	.word	drawRectangle
	.word	drawRightTriangle
	.word	drawParallelogram
	.word	drawCircle
	.size	drawGame, .-drawGame
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
	push	{r4, lr}
	ldr	r3, .L22
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+4
	ldr	r1, .L22+8
	ldr	r0, .L22+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L22+16
	ldr	r6, .L22+20
	strh	r2, [r3]	@ movhi
	ldr	r5, .L22+24
	ldr	r4, .L22+28
.L20:
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	b	.L20
.L23:
	.align	2
.L22:
	.word	mgba_open
	.word	mgba_printf
	.word	.LC0
	.word	.LC1
	.word	1027
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.size	main, .-main
	.global	frameCount
	.global	flickeringColor
	.data
	.align	1
	.set	.LANCHOR1,. + 0
	.type	flickeringColor, %object
	.size	flickeringColor, 2
flickeringColor:
	.short	16384
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
