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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	str	lr, [sp, #-4]!
	mov	r0, #1
	mov	lr, #120
	mov	r2, #16
	mov	ip, #60
	ldr	r3, .L4
	strb	r1, [r3, #48]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	car
	.size	initGame, .-initGame
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
	push	{r4, lr}
	mov	r4, #512
	ldr	r0, .L9
	ldr	r3, [r0]
	ldr	lr, [r0, #28]
	ldrb	r1, [r0, #48]	@ zero_extendqisi2
	ldr	r2, .L9+4
	lsl	r3, r3, #23
	ldrb	ip, [r0, #4]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r0, r2, r1, lsl #3
	cmp	lr, #1
	orr	r3, r3, #16384
	lsl	r1, r1, #3
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r2, r1]	@ movhi
	orreq	r3, r3, #4096
	add	r2, r2, r1
	strheq	r3, [r0, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	ldr	r3, .L9+8
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #117440512
	ldr	r4, .L9+12
	mov	r0, #3
	ldr	r1, .L9+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	car
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	initCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCar, %function
initCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	initGame
	.size	initCar, .-initCar
	.align	2
	.global	updateCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCar, %function
updateCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldreq	r3, .L17+4
	ldreq	r2, [r3, #4]
	ldreq	r1, [r3, #12]
	subeq	r2, r2, r1
	streq	r2, [r3, #4]
	ldr	r3, .L17
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldreq	r3, .L17+4
	ldreq	r2, [r3, #4]
	ldreq	r1, [r3, #12]
	addeq	r2, r2, r1
	streq	r2, [r3, #4]
	ldr	r3, .L17
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L15
	mov	r1, #1
	ldr	r3, .L17+4
	ldr	r2, [r3]
	ldr	r0, [r3, #8]
	sub	r2, r2, r0
	str	r2, [r3]
	str	r1, [r3, #28]
.L15:
	ldr	r3, .L17
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	bxne	lr
	ldr	r2, .L17+4
	ldr	r1, [r2]
	ldr	r0, [r2, #8]
	add	r1, r1, r0
	str	r3, [r2, #28]
	str	r1, [r2]
	bx	lr
.L18:
	.align	2
.L17:
	.word	67109120
	.word	car
	.size	updateCar, .-updateCar
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
	@ link register save eliminated.
	b	updateCar
	.size	updateGame, .-updateGame
	.align	2
	.global	drawCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCar, %function
drawCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r0, .L23
	ldr	r3, [r0]
	ldr	r2, .L23+4
	ldr	lr, [r0, #28]
	ldrb	r1, [r0, #48]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	cmp	lr, #1
	ldrb	ip, [r0, #4]	@ zero_extendqisi2
	add	r0, r2, r1, lsl #3
	strh	r3, [r0, #2]	@ movhi
	orreq	r3, r3, #4096
	strheq	r3, [r0, #2]	@ movhi
	mov	r3, #512
	lsl	r1, r1, #3
	strh	ip, [r2, r1]	@ movhi
	add	r2, r2, r1
	strh	r3, [r2, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	car
	.word	shadowOAM
	.size	drawCar, .-drawCar
	.comm	car,52,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
