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
	.global	drawRectangle
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	add	lr, r0, r2
	cmp	r0, lr
	ldrh	ip, [sp, #16]
	bge	.L1
	ldr	r2, .L10
	add	r5, r1, r3
	add	r3, r3, r1, lsl #1
	rsb	r6, r3, r3, lsl #4
	ldr	r2, [r2]
	sub	r3, r5, r5, lsl #4
	add	r6, r0, r6, lsl #3
	lsl	r3, r3, #5
	rsb	r4, r1, r1, lsl #4
	add	lr, lr, r0
	add	r2, r2, r6, lsl #2
	lsl	r0, r0, #1
	add	r4, r3, r4, lsl #5
.L3:
	cmp	r1, r5
	addlt	r3, r2, r4
	bge	.L6
.L4:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L4
.L6:
	add	r0, r0, #1
	cmp	r0, lr
	add	r2, r2, #2
	bne	.L3
.L1:
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	drawRightTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRightTriangle, %function
drawRightTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	ip, r0, r2
	cmp	r0, ip
	bxge	lr
	push	{r4, r5, lr}
	ldr	lr, .L24
	ldr	r4, [lr]
	mov	lr, #0
	rsb	ip, r1, r1, lsl #4
	add	r0, r0, ip, lsl #4
	add	r4, r4, r0, lsl #1
	add	r5, r2, r1
.L14:
	cmp	r5, r1
	movgt	r0, #0
	ble	.L18
.L16:
	cmp	r0, lr
	rsble	ip, r0, r0, lsl #4
	lslle	ip, ip, #5
	add	r0, r0, #1
	strhle	r3, [ip, r4]	@ movhi
	cmp	r2, r0
	bne	.L16
.L18:
	add	lr, lr, #1
	cmp	r2, lr
	add	r4, r4, #2
	bne	.L14
	pop	{r4, r5, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.size	drawRightTriangle, .-drawRightTriangle
	.align	2
	.global	drawParallelogram
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawParallelogram, %function
drawParallelogram:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	subs	r7, r3, #0
	ldrh	ip, [sp, #24]
	ble	.L26
	mov	r4, #0
	ldr	r3, .L37
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	lsl	r5, r1, #4
	add	r1, r2, r1, lsl #4
	add	lr, r1, r0
	add	r8, r5, #240
	add	r8, r8, r0
	add	r6, r3, r0, lsl #1
	add	r0, r3, lr, lsl #1
	mov	lr, r4
	add	r1, r3, #2
	add	r1, r1, r8, lsl #1
	add	r6, r6, #480
.L28:
	cmp	r2, #0
	subgt	r3, r1, #480
	subgt	r3, r3, #2
	ble	.L33
.L32:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L32
.L33:
	add	r4, r4, #1
	cmp	r7, r4
	beq	.L26
	add	r3, r6, r5, lsl #1
.L29:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L29
	add	r0, r0, #480
	add	r1, r1, #480
	add	r0, r0, #2
	add	r1, r1, #2
	add	r5, r5, #240
	b	.L28
.L26:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.size	drawParallelogram, .-drawParallelogram
	.align	2
	.global	drawCircle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCircle, %function
drawCircle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	add	ip, r0, r2
	sub	r5, r0, r2
	cmp	r5, ip
	bge	.L39
	mul	lr, r2, r2
	ldr	r4, .L50
	rsb	ip, r1, r1, lsl #4
	ldr	r4, [r4]
	add	ip, r5, ip, lsl #4
	add	r4, r4, ip, lsl #1
	sub	r5, r5, r0
	sub	r7, r1, r2
	add	r6, r2, r1
.L42:
	cmp	r6, r7
	mulgt	ip, r5, r5
	rsbgt	r1, r2, #0
	ble	.L46
.L45:
	mla	r0, r1, r1, ip
	cmp	lr, r0
	rsbge	r0, r1, r1, lsl #4
	lslge	r0, r0, #5
	add	r1, r1, #1
	strhge	r3, [r0, r4]	@ movhi
	cmp	r2, r1
	bne	.L45
.L46:
	add	r5, r5, #1
	cmp	r5, r2
	add	r4, r4, #2
	bne	.L42
.L39:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.size	drawCircle, .-drawCircle
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
.L53:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L53
	mov	r2, #67108864
.L54:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L54
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
