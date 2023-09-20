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
	mov	r3, #67108864
	ldr	r2, .L4+4
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	1027
	.size	initialize, .-initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
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
	push	{r4, lr}
	ldr	r4, .L12
	ldr	r1, [r4]
	cmp	r1, #60
	ble	.L7
	ldr	r3, .L12+4
	ldr	r2, .L12+8
	ldrh	r0, [r3]
	cmp	r0, r2
	beq	.L11
.L8:
	mvn	r2, #64512
	strh	r2, [r3]	@ movhi
.L9:
	ldr	r3, .L12+12
	ldr	r0, .L12+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	pop	{r4, lr}
	bx	lr
.L7:
	cmp	r1, #30
	ble	.L9
	ldr	r3, .L12+4
	b	.L8
.L11:
	mvn	r2, #32768
	mov	r1, #0
	strh	r2, [r3]	@ movhi
	str	r1, [r4]
	b	.L9
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	1023
	.word	mgba_printf
	.word	.LC0
	.size	updateGame, .-updateGame
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
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L17+4
	ldr	r7, .L17+8
	strh	r2, [r3]	@ movhi
	ldr	r6, .L17+12
	ldr	r5, .L17+16
	ldr	r4, .L17+20
.L15:
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	mov	r1, #0
	mov	r2, #240
	mov	r0, r1
	ldrh	r3, [r5]
	mov	lr, pc
	bx	r4
	b	.L15
.L18:
	.align	2
.L17:
	.word	mgba_open
	.word	1027
	.word	updateGame
	.word	waitForVBlank
	.word	.LANCHOR1
	.word	drawHorizontalLine
	.size	main, .-main
	.text
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
	mov	r1, #0
	push	{r4, lr}
	ldr	r3, .L21
	ldr	r4, .L21+4
	mov	r0, r1
	mov	r2, #240
	ldrh	r3, [r3]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR1
	.word	drawHorizontalLine
	.size	drawGame, .-drawGame
	.global	frameCount
	.global	flickeringColor
	.data
	.align	1
	.set	.LANCHOR1,. + 0
	.type	flickeringColor, %object
	.size	flickeringColor, 2
flickeringColor:
	.short	1023
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
