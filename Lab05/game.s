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
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #154
	str	lr, [sp, #-4]!
	mov	r2, #117
	mov	lr, #0
	mov	ip, #5
	mov	r0, #35
	ldr	r3, .L4
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	ldr	r1, .L4+4
	str	lr, [r3, #16]
	str	ip, [r3, #24]
	str	r0, [r3, #20]
	strh	r1, [r3, #28]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	19327
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBall, %function
initBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #150
	mov	r3, #128
	push	{r4, lr}
	ldr	r4, .L9
	ldr	r1, .L9+4
	str	r2, [r4, #4]
	str	r2, [r4, #12]
	str	r3, [r4]
	str	r3, [r4, #8]
	mov	lr, pc
	bx	r1
	ands	r0, r0, #1
	mov	r3, #3
	mvneq	r0, #0
	mvn	r1, #2
	ldr	r2, .L9+8
	str	r0, [r4, #16]
	str	r1, [r4, #20]
	strh	r2, [r4, #32]	@ movhi
	str	r3, [r4, #28]
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	ball
	.word	rand
	.word	28274
	.size	initBall, .-initBall
	.align	2
	.global	initBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBlocks, %function
initBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L32
	mov	fp, #0
	mov	r10, r8
	ldr	r7, .L32+4
	ldr	r6, .L32+8
	ldr	r5, .L32+12
	ldr	r4, .L32+16
	ldr	r9, .L32+20
.L19:
	mov	r2, #1
	mov	ip, #36
	mov	r1, #4
	umull	r0, r3, r5, fp
	lsr	r3, r3, #2
	add	r3, r3, r3, lsl r2
	lsl	r3, r3, r2
	add	r3, r3, #10
	str	r3, [r10, #4]
	str	r2, [r10, #32]
	mov	r0, #100
	str	ip, [r10, #20]
	str	r1, [r10, #24]
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	smull	r3, r2, r4, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L12
.L14:
	.word	.L18
	.word	.L17
	.word	.L16
	.word	.L15
	.word	.L13
.L13:
	strh	r9, [r10, #28]	@ movhi
.L12:
	add	fp, fp, #1
	cmp	fp, #30
	add	r10, r10, #40
	bne	.L19
	mov	r2, #0
	ldr	r1, .L32
.L20:
	ldr	r3, [r1, #20]
	lsl	r0, r2, #2
	mla	r3, r2, r3, r0
	add	r2, r2, #1
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r1], #40
	bne	.L20
	mov	r2, #0
	ldr	r1, .L32
.L21:
	ldr	r3, [r1, #260]
	lsl	r0, r2, #2
	mla	r3, r2, r3, r0
	add	r2, r2, #1
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r1, #240]
	add	r1, r1, #40
	bne	.L21
	mov	r2, #0
	ldr	r1, .L32
.L22:
	ldr	r3, [r1, #500]
	lsl	r0, r2, #2
	mla	r3, r2, r3, r0
	add	r2, r2, #1
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r1, #480]
	add	r1, r1, #40
	bne	.L22
	mov	r2, #0
	ldr	r1, .L32
.L23:
	ldr	r3, [r1, #740]
	lsl	r0, r2, #2
	mla	r3, r2, r3, r0
	add	r2, r2, #1
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r1, #720]
	add	r1, r1, #40
	bne	.L23
	mov	r2, #0
.L24:
	ldr	r3, [r8, #980]
	lsl	r1, r2, #2
	mla	r3, r2, r3, r1
	add	r2, r2, #1
	add	r3, r3, #2
	cmp	r2, #6
	str	r3, [r8, #960]
	add	r8, r8, #40
	bne	.L24
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	ldr	r3, .L32+24
	strh	r3, [r10, #28]	@ movhi
	b	.L12
.L16:
	ldr	r3, .L32+28
	strh	r3, [r10, #28]	@ movhi
	b	.L12
.L18:
	mov	r3, #16896
	strh	r3, [r10, #28]	@ movhi
	b	.L12
.L17:
	ldr	r3, .L32+32
	strh	r3, [r10, #28]	@ movhi
	b	.L12
.L33:
	.align	2
.L32:
	.word	blocks
	.word	srand
	.word	rand
	.word	-1431655765
	.word	1717986919
	.word	13619
	.word	13526
	.word	27295
	.word	21152
	.size	initBlocks, .-initBlocks
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, lr}
	mov	r1, #154
	mov	lr, #5
	mov	r2, #117
	mov	ip, #35
	ldr	r3, .L36
	str	r0, [r3]
	ldr	r3, .L36+4
	str	r0, [r3, #16]
	ldr	r0, .L36+8
	str	lr, [r3, #24]
	str	ip, [r3, #20]
	strh	r0, [r3, #28]	@ movhi
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3]
	str	r2, [r3, #8]
	bl	initBall
	pop	{r4, lr}
	b	initBlocks
.L37:
	.align	2
.L36:
	.word	score
	.word	player
	.word	19327
	.size	initGame, .-initGame
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
	@ link register save eliminated.
	ldr	r3, .L43
	ldrh	r1, [r3]
	ldr	r3, .L43+4
	tst	r1, #32
	ldr	r2, [r3]
	bne	.L39
	cmp	r2, #1
	mvngt	r0, #2
	strgt	r0, [r3, #16]
	addgt	r1, r2, r0
	bgt	.L40
.L39:
	tst	r1, #16
	beq	.L42
.L41:
	mov	r0, #0
	mov	r1, r2
	str	r0, [r3, #16]
.L40:
	str	r2, [r3, #8]
	str	r1, [r3]
	bx	lr
.L42:
	ldr	r1, [r3, #20]
	add	r1, r2, r1
	cmp	r1, #238
	bgt	.L41
	mov	r0, #3
	str	r0, [r3, #16]
	add	r1, r2, r0
	b	.L40
.L44:
	.align	2
.L43:
	.word	buttons
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L55
	ldr	r1, [r4, #4]
	cmp	r1, #1
	movle	r3, #2
	strle	r3, [r4, #20]
	ldr	r3, [r4, #28]
	add	r2, r1, r3
	cmp	r2, #158
	mvngt	r0, #0
	mvngt	ip, #1
	ldrgt	r2, .L55+4
	strgt	r0, [r2]
	ldr	r0, [r4]
	strgt	ip, [r4, #20]
	cmp	r0, #1
	movle	r2, #1
	strle	r2, [r4, #16]
	ldr	r2, [r4, #24]
	add	ip, r0, r2
	cmp	ip, #238
	mvngt	ip, #0
	ldr	r5, .L55+8
	strgt	ip, [r4, #16]
	ldr	ip, [r5, #20]
	add	ip, ip, ip, lsr #31
	sub	sp, sp, #16
	asr	ip, ip, #1
	ldr	r6, [r5, #24]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L55+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L50
	mvn	r2, #0
	ldr	r0, .L55+4
	ldr	r3, [r4, #20]
	ldr	r1, [r0]
	rsb	r3, r3, #0
	add	r1, r1, #1
	str	r1, [r0]
	str	r3, [r4, #20]
	str	r2, [r4, #16]
.L51:
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	add	r3, r0, r3
	add	r2, r1, r2
	str	r3, [r4, #4]
	str	r0, [r4, #12]
	str	r2, [r4]
	str	r1, [r4, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	ldr	r3, [r5, #20]
	ldr	r2, [r5]
	add	r3, r3, r3, lsr #31
	ldr	r0, [r5, #24]
	ldr	r1, [r5, #4]
	asr	r3, r3, #1
	add	r2, r3, r2
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	str	r3, [sp, #8]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L54
	mov	r0, #1
	ldr	ip, .L55+4
	ldr	r3, [r4, #20]
	ldr	r1, [ip]
	rsb	r3, r3, #0
	add	r1, r1, r0
	mov	r2, r0
	str	r1, [ip]
	str	r3, [r4, #20]
	str	r0, [r4, #16]
	b	.L51
.L54:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	b	.L51
.L56:
	.align	2
.L55:
	.word	ball
	.word	score
	.word	player
	.word	collision
	.size	updateBall, .-updateBall
	.align	2
	.global	updateBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBlocks, %function
updateBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L74
	ldr	r6, [r0, #24]
	ldr	ip, [r0, #20]
	sub	sp, sp, #16
	add	r2, r5, #24
	ldr	lr, [r0, #4]
	ldm	r2, {r2, r3}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldm	r5, {r0, r1}
	stm	sp, {ip, lr}
	ldr	r6, .L74+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L73
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	ldr	r3, [r4, #20]
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #4]
	ldr	r2, [r4]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	str	r2, [sp]
	str	r3, [sp, #8]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L61
	mvn	r2, #0
	ldr	r3, [r5, #20]
	rsb	r3, r3, #0
	str	r3, [r5, #20]
	str	r2, [r5, #16]
.L62:
	mov	r2, #0
	mov	r3, #67108864
	ldr	r0, .L74+8
	ldr	r1, .L74+12
	str	r2, [r4, #32]
	str	r2, [r4, #36]
	strh	r0, [r3, #104]	@ movhi
	strh	r1, [r3, #108]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	ldr	r3, [r4, #20]
	ldr	r2, [r4]
	add	r3, r3, r3, lsr #31
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #4]
	asr	r3, r3, #1
	add	r2, r3, r2
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	str	r3, [sp, #8]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, [r5, #20]
	rsbne	r3, r3, #0
	strne	r3, [r5, #20]
	strne	r2, [r5, #16]
	b	.L62
.L75:
	.align	2
.L74:
	.word	ball
	.word	collision
	.word	17024
	.word	-30804
	.size	updateBlocks, .-updateBlocks
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
	push	{r4, r5, r6, lr}
	ldr	r6, .L85
	bl	updatePlayer
	mov	r4, r6
	bl	updateBall
	add	r5, r6, #1200
.L77:
	mov	r0, r4
	add	r4, r4, #40
	bl	updateBlocks
	cmp	r4, r5
	bne	.L77
	ldr	r3, .L85+4
	ldr	r2, [r3]
	cmp	r2, #0
	ble	.L78
	ldr	r3, .L85+8
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #2
	cmp	r2, r3
	beq	.L84
.L78:
	mov	r2, #0
	ldr	r3, .L85+12
	str	r2, [r3]
.L76:
	pop	{r4, r5, r6, lr}
	bx	lr
.L84:
	ldr	r3, .L85+12
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L76
	mov	r1, #1
	ldr	r2, [r6, #32]
	cmp	r2, #0
	streq	r1, [r6, #32]
	streq	r2, [r6, #36]
	str	r1, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	blocks
	.word	score
	.word	1717986919
	.word	spawned
	.size	updateGame, .-updateGame
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
	ldr	r4, .L89
	ldr	ip, .L89+4
	sub	sp, sp, #12
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L89+8
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #20]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	player
	.word	31676
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L93
	ldr	ip, .L93+4
	sub	sp, sp, #12
	add	r2, r4, #24
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L93+8
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	ball
	.word	31676
	.word	drawRect
	.size	drawBall, .-drawBall
	.align	2
	.global	drawBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlocks, %function
drawBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L99
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L100
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L100:
	ldr	r2, .L101
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L101+4
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L99:
	ldr	r2, .L101
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L101+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	31676
	.word	drawRect
	.size	drawBlocks, .-drawBlocks
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
	bl	drawPlayer
	bl	drawBall
	ldr	r4, .L107
	add	r5, r4, #1200
.L104:
	mov	r0, r4
	add	r4, r4, #40
	bl	drawBlocks
	cmp	r4, r5
	bne	.L104
	pop	{r4, r5, r6, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	blocks
	.size	drawGame, .-drawGame
	.align	2
	.global	newBlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	newBlock, %function
newBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	ldr	r3, .L111
	ldr	r2, [r3, #32]
	ldr	r0, .L111+4
	cmp	r2, #0
	str	r1, [r0]
	streq	r1, [r3, #32]
	streq	r2, [r3, #36]
	bx	lr
.L112:
	.align	2
.L111:
	.word	blocks
	.word	spawned
	.size	newBlock, .-newBlock
	.comm	spawned,4,4
	.comm	score,4,4
	.comm	blocks,1200,4
	.comm	ball,36,4
	.comm	player,32,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
