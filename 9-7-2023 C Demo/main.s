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
	.global	drawRect
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	r4, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L1
	ldr	lr, .L10
	add	r3, r1, r2
	rsb	r3, r3, r3, lsl #4
	ldr	r1, [lr]
	add	r3, r0, r3, lsl #4
	sub	lr, r2, r2, lsl #4
	add	r4, r4, r0
	add	r1, r1, r3, lsl #1
	lsl	lr, lr, #5
.L3:
	cmp	r2, #0
	addgt	r3, r1, lr
	ble	.L6
.L4:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L4
.L6:
	add	r0, r0, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L3
.L1:
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	setPixel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	add	r0, r0, #50331648
	lsl	r0, r0, #1
	strh	r2, [r0]	@ movhi
	bx	lr
	.size	setPixel3, .-setPixel3
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	r3, [r3]
	add	r2, r3, #76800
.L14:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L14
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L20:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L20
	mov	r2, #67108864
.L21:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L21
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
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
	mov	r1, #31
	ldr	r3, .L29
	ldr	r0, .L29+4
	ldr	r3, [r3]
	push	{r4, lr}
	strh	r0, [r2]	@ movhi
	add	r2, r3, #76800
.L26:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L26
	ldr	r3, .L29+8
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r1, .L29+12
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.word	1027
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf_level
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
	ldr	r3, .L38
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	mov	r1, #31744
	ldr	r3, .L38+4
	ldr	r3, [r3]
	add	r3, r3, #19200
	add	r2, r3, #40
	add	r0, r3, #80
.L32:
	sub	r3, r2, #9600
.L33:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L33
	add	r2, r3, #2
	cmp	r2, r0
	bne	.L32
.L34:
	b	.L34
.L39:
	.align	2
.L38:
	.word	initialize
	.word	.LANCHOR0
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
