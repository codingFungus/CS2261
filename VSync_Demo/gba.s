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
	.file	"gba.c"
	.text
	.align	2
	.global	drawHorizontalLine
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	str	lr, [sp, #-4]!
	ldr	lr, .L10
	rsb	ip, r1, r1, lsl #4
	add	r1, r2, ip, lsl #4
	ldr	r2, [lr]
	add	r1, r1, r0
	add	r0, r0, ip, lsl #4
	add	r1, r2, r1, lsl #1
	add	r2, r2, r0, lsl #1
.L3:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L3
	ldr	lr, [sp], #4
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawHorizontalLine, .-drawHorizontalLine
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
.L13:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L13
	mov	r2, #67108864
.L14:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L14
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
