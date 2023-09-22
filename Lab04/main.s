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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame.part.0, %function
updateGame.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L4
	add	r0, r3, #32
	ldm	r0, {r0, r1}
	ldr	ip, [r3]
	str	lr, [sp, #-4]!
	ldrh	r2, [r3, #4]
	stm	r3, {r0, r1}
	add	r0, r3, #24
	ldm	r0, {r0, r1}
	ldr	lr, [r3, #8]
	str	ip, [r3, #32]
	ldrh	ip, [r3, #12]
	strh	r2, [r3, #36]	@ movhi
	add	r2, r3, #8
	stm	r2, {r0, r1}
	str	lr, [r3, #24]
	strh	ip, [r3, #28]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	axolotls
	.size	updateGame.part.0, .-updateGame.part.0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Resting Axolotls\000"
	.text
	.align	2
	.global	goToRest
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToRest, %function
goToRest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #20
	mov	r6, #0
	sub	sp, sp, #8
	mov	r0, r3
	mov	r2, #110
	mov	r1, #10
	str	r6, [sp]
	ldr	r4, .L8
	mov	lr, pc
	bx	r4
	mov	r1, #10
	mov	r0, #20
	ldr	r3, .L8+4
	ldr	r2, .L8+8
	ldr	r4, .L8+12
	mov	lr, pc
	bx	r4
	ldr	r5, .L8+16
	ldr	r2, .L8+20
	ldr	r3, .L8+24
	strb	r6, [r2]
	ldr	r4, .L8+28
	mov	lr, pc
	bx	r3
	mov	r1, r6
	mov	r0, r5
	mov	lr, pc
	bx	r4
	add	r0, r5, #8
	mov	r1, #1
	mov	lr, pc
	bx	r4
	add	r0, r5, #16
	mov	r1, #2
	mov	lr, pc
	bx	r4
	add	r0, r5, #24
	mov	r1, #3
	mov	lr, pc
	bx	r4
	mov	r1, #4
	add	r0, r5, #32
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	drawRect
	.word	1023
	.word	.LC0
	.word	drawString
	.word	axolotls
	.word	state
	.word	waitForVBlank
	.word	drawAxolotl
	.size	goToRest, .-goToRest
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
	mov	r3, #67108864
	ldr	r2, .L12
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	bl	goToRest
	mov	r1, #0
	ldr	r2, .L12+4
	ldr	r3, .L12+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	1027
	.word	frameCounter
	.word	initializeAxolotls
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Animated Axolotls!\000"
	.text
	.align	2
	.global	goToAnimate
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToAnimate, %function
goToAnimate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r3, #20
	mov	r4, #0
	sub	sp, sp, #12
	mov	r0, r3
	mov	r2, #97
	mov	r1, #10
	ldr	r5, .L18
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #992
	mov	r1, #10
	mov	r0, #20
	ldr	r2, .L18+4
	ldr	r5, .L18+8
	mov	lr, pc
	bx	r5
	mov	r0, #1
	ldr	r2, .L18+12
	ldr	r3, [r2]
	ldr	r1, .L18+16
	cmp	r3, #19
	add	r3, r3, r0
	strb	r0, [r1]
	strne	r3, [r2]
	streq	r4, [r2]
	bleq	updateGame.part.0
.L16:
	ldr	r3, .L18+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L18+24
	mov	r1, #0
	ldr	r0, .L18+28
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r0, .L18+32
	mov	lr, pc
	bx	r4
	mov	r1, #2
	ldr	r0, .L18+36
	mov	lr, pc
	bx	r4
	mov	r1, #3
	ldr	r0, .L18+40
	mov	lr, pc
	bx	r4
	mov	r1, #4
	ldr	r0, .L18+44
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	drawRect
	.word	.LC1
	.word	drawString
	.word	frameCounter
	.word	state
	.word	waitForVBlank
	.word	drawAxolotl
	.word	axolotls
	.word	axolotls+8
	.word	axolotls+16
	.word	axolotls+24
	.word	axolotls+32
	.size	goToAnimate, .-goToAnimate
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L21
	ldr	r3, .L29+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	ldr	r3, .L29+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	goToAnimate
.L21:
	cmp	r3, #1
	bxne	lr
	ldr	r3, .L29+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	ldr	r3, .L29+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	goToRest
.L30:
	.align	2
.L29:
	.word	state
	.word	buttons
	.word	oldButtons
	.size	gameState, .-gameState
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
	mov	r3, #67108864
	ldr	r2, .L38
	push	{r7, lr}
	ldr	r9, .L38+4
	strh	r2, [r3]	@ movhi
	mov	lr, pc
	bx	r9
	mov	r1, #0
	ldr	r2, .L38+8
	ldr	r3, .L38+12
	str	r1, [r2]
	ldr	r7, .L38+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L38+20
	ldr	r6, .L38+24
	ldr	r10, .L38+28
	ldr	r8, .L38+32
	ldr	r5, .L38+36
	b	.L35
.L37:
	cmp	r3, #1
	moveq	lr, pc
	bxeq	r10
.L34:
	mov	lr, pc
	bx	r8
.L35:
	ldrh	r3, [r4]
	strh	r3, [r7]	@ movhi
	ldrb	r3, [r6]	@ zero_extendqisi2
	ldrh	r2, [r5, #48]
	cmp	r3, #0
	strh	r2, [r4]	@ movhi
	bne	.L37
	mov	lr, pc
	bx	r9
	b	.L34
.L39:
	.align	2
.L38:
	.word	1027
	.word	goToRest
	.word	frameCounter
	.word	initializeAxolotls
	.word	oldButtons
	.word	buttons
	.word	state
	.word	goToAnimate
	.word	gameState
	.word	67109120
	.size	main, .-main
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
	@ link register save eliminated.
	ldr	r2, .L44
	ldr	r3, [r2]
	cmp	r3, #19
	add	r3, r3, #1
	beq	.L41
	str	r3, [r2]
	bx	lr
.L41:
	mov	r3, #0
	str	r3, [r2]
	b	updateGame.part.0
.L45:
	.align	2
.L44:
	.word	frameCounter
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L48
	ldr	r4, .L48+4
	mov	r0, r5
	mov	r1, #0
	mov	lr, pc
	bx	r4
	add	r0, r5, #8
	mov	r1, #1
	mov	lr, pc
	bx	r4
	add	r0, r5, #16
	mov	r1, #2
	mov	lr, pc
	bx	r4
	add	r0, r5, #24
	mov	r1, #3
	mov	lr, pc
	bx	r4
	add	r0, r5, #32
	mov	r1, #4
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	axolotls
	.word	drawAxolotl
	.size	drawGame, .-drawGame
	.align	2
	.global	reverseAxolotls
	.syntax unified
	.arm
	.fpu softvfp
	.type	reverseAxolotls, %function
reverseAxolotls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	add	r0, r3, #32
	ldm	r0, {r0, r1}
	ldr	ip, [r3]
	str	lr, [sp, #-4]!
	ldrh	r2, [r3, #4]
	stm	r3, {r0, r1}
	add	r0, r3, #24
	ldm	r0, {r0, r1}
	ldr	lr, [r3, #8]
	str	ip, [r3, #32]
	ldrh	ip, [r3, #12]
	strh	r2, [r3, #36]	@ movhi
	add	r2, r3, #8
	stm	r2, {r0, r1}
	str	lr, [r3, #24]
	strh	ip, [r3, #28]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L53:
	.align	2
.L52:
	.word	axolotls
	.size	reverseAxolotls, .-reverseAxolotls
	.align	2
	.global	swap
	.syntax unified
	.arm
	.fpu softvfp
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r1
	mov	r2, r0
	str	lr, [sp, #-4]!
	ldrh	ip, [r0, #4]
	ldr	lr, [r0]
	ldm	r1, {r0, r1}
	stm	r2, {r0, r1}
	str	lr, [r3]
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
	.size	swap, .-swap
	.comm	state,1,1
	.comm	frameCounter,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	axolotls,40,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
