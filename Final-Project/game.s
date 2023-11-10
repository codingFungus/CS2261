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
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	ip, #5
	mov	r0, #0
	mov	r1, #40
	mov	r2, #1
	mov	r4, #100
	mov	lr, #10
	ldr	r3, .L4+4
	str	ip, [r3]
	ldr	r3, .L4+8
	strb	r0, [r3, #44]
	str	r4, [r3, #4]
	str	lr, [r3, #24]
	str	ip, [r3, #40]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3]
	str	r2, [r3, #28]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	draw
	.word	lives
	.word	player
	.size	initGame, .-initGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #5
	mov	r0, #0
	push	{r4, lr}
	mov	r1, #40
	mov	r2, #1
	mov	r4, #100
	mov	lr, #10
	ldr	r3, .L8
	str	ip, [r3]
	ldr	r3, .L8+4
	strb	r0, [r3, #44]
	str	r4, [r3, #4]
	str	lr, [r3, #24]
	str	ip, [r3, #40]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3]
	str	r2, [r3, #28]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	lives
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r0, .L13
	ldr	r2, .L13+4
	ldr	r3, [r0]
	ldr	r1, [r2]
	ldr	r2, .L13+8
	sub	r3, r3, r1
	ldr	r5, [r2]
	ldr	r1, [r0, #4]
	ldr	lr, .L13+12
	ldr	r4, [r0, #28]
	ldr	r2, [r0, #36]
	ldrb	ip, [r0, #44]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	add	r0, lr, ip, lsl #3
	orr	r3, r3, #32768
	cmp	r4, #1
	sub	r1, r1, r5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	lsl	ip, ip, #3
	and	r1, r1, #255
	and	r2, r2, #1020
	orreq	r3, r3, #4096
	strh	r1, [lr, ip]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strheq	r3, [r0, #2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"move\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L31
	ldrh	r1, [r5]
	tst	r1, #64
	ldr	r4, .L31+4
	bne	.L16
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldrgt	r2, [r4, #12]
	subgt	r3, r3, r2
	strgt	r3, [r4, #4]
	ldr	r0, .L31+8
	ldr	r3, .L31+12
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
.L16:
	tst	r1, #128
	ldr	ip, [r4, #20]
	bne	.L18
	ldr	r3, [r4, #4]
	add	r2, r3, ip
	cmp	r2, #255
	ldrle	r2, [r4, #12]
	addle	r3, r2, r3
	strle	r3, [r4, #4]
.L18:
	ands	r2, r1, #32
	bne	.L20
	ldr	r3, [r4]
	cmp	r3, #0
	str	r2, [r4, #28]
	ldrgt	r2, [r4, #8]
	subgt	r3, r3, r2
	strgt	r3, [r4]
.L20:
	tst	r1, #16
	ldr	r0, [r4, #16]
	bne	.L23
	mov	r2, #1
	ldr	r3, [r4]
	add	lr, r3, r0
	cmp	lr, #512
	str	r2, [r4, #28]
	ldrlt	r2, [r4, #8]
	addlt	r3, r2, r3
	strlt	r3, [r4]
.L23:
	and	r1, r1, #240
	cmp	r1, #240
	beq	.L25
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L26
	ldr	r2, [r4, #36]
	ldr	r1, [r4, #40]
	add	r2, r2, #1
	cmp	r2, r1
	movge	r2, r3
	mov	r3, #10
	str	r2, [r4, #36]
	str	r3, [r4, #24]
.L26:
	ldm	r4, {r2, r3}
	add	ip, ip, ip, lsr #31
	sub	r2, r2, #120
	add	r0, r0, r0, lsr #31
	add	r2, r2, ip, asr #1
	sub	r3, r3, #80
	bic	r2, r2, r2, asr #31
	add	r3, r3, r0, asr #1
	bic	r3, r3, r3, asr #31
	cmp	r2, #272
	movge	r2, #272
	cmp	r3, #96
	movge	r3, #96
	ldr	r0, .L31+16
	ldr	r1, .L31+20
	str	r2, [r0]
	str	r3, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	mov	r2, #0
	mov	r3, #10
	str	r2, [r4, #36]
	str	r3, [r4, #24]
	b	.L26
.L32:
	.align	2
.L31:
	.word	buttons
	.word	player
	.word	.LC0
	.word	mgba_printf
	.word	hOff
	.word	vOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	playerAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerAttack, %function
playerAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	playerAttack, .-playerAttack
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	score,4,4
	.comm	player,52,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
