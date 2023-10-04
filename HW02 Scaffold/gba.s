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
	push	{r4, lr}
	subs	r4, r2, #0
	ldrh	ip, [sp, #8]
	ble	.L1
	ldr	lr, .L10
	add	r2, r1, r3
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [lr]
	add	r2, r0, r2, lsl #4
	sub	lr, r3, r3, lsl #4
	add	r4, r4, r0
	add	r1, r1, r2, lsl #1
	lsl	lr, lr, #5
.L3:
	cmp	r3, #0
	addgt	r2, r1, lr
	ble	.L6
.L4:
	strh	ip, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
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
	.size	drawRectangle, .-drawRectangle
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
	ldr	r3, .L16
	ldr	r3, [r3]
	add	r2, r3, #76800
.L13:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L13
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	drawSafe
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSafe, %function
drawSafe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	mvn	r0, #64512
	ldr	r3, .L31
	ldr	r2, [r3]
	add	r1, r2, #76800
.L19:
	sub	r3, r1, #7168
	sub	r3, r3, #32
.L20:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L20
	add	ip, ip, #1
	cmp	ip, #240
	add	r1, r3, #2
	bne	.L19
	mov	ip, #0
	mvn	r0, #64512
	add	r1, r2, #45568
	add	r1, r1, #32
.L23:
	sub	r3, r1, #7168
	sub	r3, r3, #32
.L22:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L22
	add	ip, ip, #1
	cmp	ip, #240
	add	r1, r3, #2
	bne	.L23
	mov	r0, #0
	mov	r1, #31744
	add	r2, r2, #14400
.L24:
	sub	r3, r2, #14400
.L25:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L25
	add	r0, r0, #1
	cmp	r0, #240
	add	r2, r2, #2
	bne	.L24
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	drawSafe, .-drawSafe
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
.L34:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L34
	mov	r2, #67108864
.L35:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L35
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L49
	rsb	r1, r1, r1, lsl #4
	ldr	lr, [ip]
	ldr	ip, .L49+4
	add	r1, r0, r1, lsl #4
	add	r2, r2, r2, lsl #1
	add	lr, lr, r1, lsl #1
	add	ip, ip, r2, lsl #4
.L40:
	mov	r1, lr
	sub	r2, ip, #48
.L42:
	ldrb	r0, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	r0, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, ip
	add	r1, r1, #480
	bne	.L42
	add	r4, r4, #1
	cmp	r4, #6
	add	ip, r2, #1
	add	lr, lr, #2
	bne	.L40
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	fontdata+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L51
	mov	r6, r1
	mov	r4, r0
.L53:
	mov	r0, r4
	mov	r1, r6
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L53
.L51:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L63
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L65
.L63:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L65:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L63
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
