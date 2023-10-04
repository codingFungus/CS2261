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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	isOnLog.part.0, %function
isOnLog.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L7
	ldr	r3, .L7+4
	ldr	r0, [r2]
	ldr	r3, [r3]
	cmp	r0, r3
	ble	.L2
	add	r3, r3, #29
	cmp	r0, r3
	ble	.L4
.L2:
	ldr	r3, .L7+8
	ldr	r3, [r3]
	cmp	r0, r3
	ble	.L5
	add	r3, r3, #29
	cmp	r0, r3
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L5:
	mov	r0, #0
	bx	lr
.L4:
	mov	r0, #1
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.word	logs1
	.word	logs2
	.size	isOnLog.part.0, .-isOnLog.part.0
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #100
	ldr	r0, .L11
	str	r9, [r0]
	mov	r9, #155
	mov	r3, #3
	mov	r2, #10
	mov	r7, #5
	str	r9, [r0, #4]
	mov	r9, #6
	str	r7, [r0, #20]
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	str	r9, [r0, #16]
	str	r3, [r0, #24]
	ldr	r0, .L11+4
	mov	lr, #15
	mov	r6, #0
	mov	r8, #130
	str	r7, [r0, #20]
	str	r7, [r0, #44]
	mov	r10, #40
	str	r7, [r0, #68]
	mov	r7, #80
	mov	r1, #30
	mov	r5, #60
	mov	fp, #110
	stm	r0, {r6, r8}
	str	r2, [r0, #8]
	str	r2, [r0, #32]
	str	r8, [r0, #28]
	str	lr, [r0, #12]
	str	lr, [r0, #36]
	str	r2, [r0, #56]
	str	r8, [r0, #52]
	str	lr, [r0, #60]
	str	r10, [r0, #24]
	str	r7, [r0, #48]
	ldr	r0, .L11+8
	str	r6, [r0]
	str	r2, [r0, #8]
	str	lr, [r0, #12]
	str	r2, [r0, #32]
	str	lr, [r0, #36]
	str	fp, [r0, #4]
	str	fp, [r0, #28]
	str	r3, [r0, #20]
	str	r3, [r0, #44]
	str	r1, [r0, #24]
	str	r5, [r0, #48]
	str	fp, [r0, #52]
	str	r2, [r0, #56]
	str	lr, [r0, #60]
	ldr	r2, .L11+12
	str	r3, [r0, #68]
	ldr	r0, .L11+16
	mov	ip, #20
	mov	r4, #35
	str	r1, [r0, #8]
	str	r1, [r0, #32]
	str	r1, [r0, #56]
	str	r1, [r2, #8]
	str	r1, [r2, #32]
	str	r1, [r2, #56]
	mov	r1, #70
	str	r10, [r0, #24]
	str	r6, [r0]
	str	r7, [r0, #48]
	str	r6, [r2]
	str	r5, [r2, #4]
	str	r5, [r2, #28]
	str	r5, [r2, #52]
	str	r4, [r0, #4]
	str	r4, [r0, #28]
	str	r4, [r0, #52]
	str	r4, [r2, #24]
	str	r3, [r0, #16]
	str	r3, [r0, #40]
	str	r3, [r0, #64]
	str	r3, [r2, #16]
	str	r3, [r2, #40]
	str	r1, [r2, #48]
	str	ip, [r0, #12]
	str	ip, [r0, #36]
	str	ip, [r0, #60]
	str	ip, [r2, #12]
	str	ip, [r2, #36]
	str	ip, [r2, #60]
	str	r3, [r2, #64]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	player
	.word	cars1
	.word	cars2
	.word	logs2
	.word	logs1
	.size	initGame, .-initGame
	.align	2
	.global	isInRiver
	.syntax unified
	.arm
	.fpu softvfp
	.type	isInRiver, %function
isInRiver:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	ldr	r0, [r3, #4]
	sub	r0, r0, #31
	cmp	r0, #48
	movhi	r0, #0
	movls	r0, #1
	bx	lr
.L15:
	.align	2
.L14:
	.word	player
	.size	isInRiver, .-isInRiver
	.align	2
	.global	isOnLog
	.syntax unified
	.arm
	.fpu softvfp
	.type	isOnLog, %function
isOnLog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L21
	ldr	r3, [r3, #4]
	sub	r3, r3, #31
	cmp	r3, #48
	bls	.L20
	mov	r0, #0
	bx	lr
.L20:
	b	isOnLog.part.0
.L22:
	.align	2
.L21:
	.word	player
	.size	isOnLog, .-isOnLog
	.align	2
	.global	playerHit
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerHit, %function
playerHit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #100
	mov	r1, #150
	ldr	r3, .L24
	ldr	r2, [r3, #24]
	sub	r2, r2, #1
	stm	r3, {r0, r1}
	str	r2, [r3, #24]
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.size	playerHit, .-playerHit
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Lives remain: 3\000"
	.align	2
.LC1:
	.ascii	"Lives remain: 2\000"
	.align	2
.LC2:
	.ascii	"Lives remain: 1\000"
	.text
	.align	2
	.global	drawText
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawText, %function
drawText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L34
	ldr	r3, [r4, #24]
	cmp	r3, #3
	beq	.L31
	cmp	r3, #2
	beq	.L32
.L28:
	cmp	r3, #1
	beq	.L33
.L26:
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	mov	r3, #31
	mov	r1, #150
	mov	r0, #10
	ldr	r2, .L34+4
	ldr	r5, .L34+8
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #24]
	cmp	r3, #2
	bne	.L28
.L32:
	mov	r3, #31
	mov	r1, #150
	mov	r0, #10
	ldr	r2, .L34+12
	ldr	r5, .L34+8
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #24]
	cmp	r3, #1
	bne	.L26
.L33:
	ldr	r4, .L34+8
	mov	r3, #31
	mov	r1, #150
	mov	r0, #10
	ldr	r2, .L34+16
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.word	.LC0
	.word	drawString
	.word	.LC1
	.word	.LC2
	.size	drawText, .-drawText
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
	ldr	r3, .L41
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L37
	ldr	r1, .L41+4
	ldr	r2, [r1, #4]
	cmp	r2, #0
	ldrgt	r0, [r1, #20]
	subgt	r2, r2, r0
	strgt	r2, [r1, #4]
.L37:
	tst	r3, #128
	bne	.L38
	ldr	r2, .L41+4
	ldmib	r2, {r0, r1}
	rsb	r1, r1, #160
	cmp	r0, r1
	ldrlt	r1, [r2, #20]
	addlt	r0, r1, r0
	strlt	r0, [r2, #4]
.L38:
	tst	r3, #32
	bne	.L39
	ldr	r1, .L41+4
	ldr	r2, [r1]
	cmp	r2, #0
	ldrgt	r0, [r1, #16]
	subgt	r2, r2, r0
	strgt	r2, [r1]
.L39:
	tst	r3, #16
	bxne	lr
	ldr	r3, .L41+4
	ldr	r2, [r3, #12]
	ldr	r1, [r3]
	rsb	r2, r2, #240
	cmp	r1, r2
	ldrlt	r2, [r3, #16]
	addlt	r1, r2, r1
	strlt	r1, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	buttons
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateCars
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCars, %function
updateCars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L52
	ldr	r8, .L52+4
	mov	r5, r7
	mov	r6, r8
	ldr	r4, .L52+8
	ldr	r9, .L52+12
	ldr	fp, .L52+16
	sub	sp, sp, #20
	add	r10, r7, #72
.L49:
	ldr	r0, [r5]
	ldr	r3, [r7, #20]
	ldr	r1, [r6]
	ldr	r2, [r8, #20]
	add	r3, r0, r3
	add	r2, r1, r2
	cmp	r3, #239
	str	r3, [r5]
	str	r2, [r6]
	ble	.L44
	smull	r1, r0, fp, r3
	asr	r1, r3, #31
	add	r0, r0, r3
	rsb	r1, r1, r0, asr #7
	rsb	r1, r1, r1, lsl #4
	sub	r3, r3, r1, lsl #4
	str	r3, [r5]
.L44:
	cmp	r2, #239
	ble	.L45
	smull	r1, r0, fp, r2
	asr	r1, r2, #31
	add	r0, r0, r2
	rsb	r1, r1, r0, asr #7
	rsb	r1, r1, r1, lsl #4
	sub	r2, r2, r1, lsl #4
	str	r2, [r6]
.L45:
	add	r0, r5, #8
	ldm	r0, {r0, r1}
	ldr	r2, [r5, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L46
.L48:
	mov	r1, #100
	mov	r2, #150
	ldr	r3, [r4, #24]
	stm	r4, {r1, r2}
	sub	r3, r3, #1
	str	r3, [r4, #24]
.L47:
	add	r5, r5, #24
	cmp	r5, r10
	add	r6, r6, #24
	bne	.L49
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L46:
	add	r0, r6, #8
	ldm	r0, {r0, r1}
	ldr	r2, [r6, #4]
	ldr	r3, [r6]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L48
	b	.L47
.L53:
	.align	2
.L52:
	.word	cars1
	.word	cars2
	.word	player
	.word	collision
	.word	-2004318071
	.size	updateCars, .-updateCars
	.align	2
	.global	updateLog
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLog, %function
updateLog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L62
	ldr	r3, .L62+4
	mov	r1, r2
	mov	r4, r3
	mov	r9, #100
	mov	r8, #150
	ldr	fp, [r2, #16]
	ldr	r10, [r3, #16]
	ldr	r5, .L62+8
	ldr	r7, .L62+12
	add	r6, r2, #72
.L59:
	ldr	r2, [r1]
	ldr	r3, [r4]
	add	r2, fp, r2
	add	r3, r10, r3
	cmp	r2, #239
	str	r2, [r1]
	str	r3, [r4]
	ble	.L55
	smull	r0, ip, r7, r2
	asr	r0, r2, #31
	add	ip, ip, r2
	rsb	r0, r0, ip, asr #7
	rsb	r0, r0, r0, lsl #4
	sub	r2, r2, r0, lsl #4
	str	r2, [r1]
.L55:
	cmp	r3, #239
	ble	.L56
	smull	r2, r0, r7, r3
	asr	r2, r3, #31
	add	r0, r0, r3
	rsb	r2, r2, r0, asr #7
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #4
	str	r3, [r4]
.L56:
	ldr	r3, [r5, #4]
	sub	r3, r3, #31
	cmp	r3, #48
	bhi	.L57
	bl	isOnLog.part.0
	cmp	r0, #0
	ldrne	r3, [r5]
	ldreq	r3, [r5, #24]
	addne	r3, r3, #1
	subeq	r3, r3, #1
	strne	r3, [r5]
	streq	r9, [r5]
	streq	r8, [r5, #4]
	streq	r3, [r5, #24]
.L57:
	add	r1, r1, #24
	cmp	r1, r6
	add	r4, r4, #24
	bne	.L59
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	logs1
	.word	logs2
	.word	player
	.word	-2004318071
	.size	updateLog, .-updateLog
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
	bl	updateCars
	bl	updateLog
	pop	{r4, lr}
	b	updatePlayer
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
	mov	r3, #992
	push	{r4, lr}
	sub	sp, sp, #8
	str	r3, [sp]
	ldr	r0, .L68
	ldr	r4, .L68+4
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	player
	.word	drawRectangle
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawCars
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCars, %function
drawCars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r9, .L74
	ldr	r8, .L74+4
	mov	r4, r5
	mov	r7, r9
	mov	r6, r8
	mov	fp, #31
	ldr	r10, .L74+8
	sub	sp, sp, #12
.L71:
	ldr	r1, [r7, #4]
	ldr	r0, [r7], #24
	ldr	r3, [r9, #8]
	add	r0, r4, r0
	ldr	r2, [r9, #12]
	str	fp, [sp]
	mov	lr, pc
	bx	r10
	ldr	r1, [r6, #4]
	ldr	r0, [r6], #24
	ldr	r3, [r8, #8]
	add	r0, r5, r0
	str	fp, [sp]
	ldr	r2, [r8, #12]
	add	r4, r4, #20
	mov	lr, pc
	bx	r10
	cmp	r4, #60
	add	r5, r5, #30
	bne	.L71
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	cars1
	.word	cars2
	.word	drawRectangle
	.size	drawCars, .-drawCars
	.align	2
	.global	drawLogs
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLogs, %function
drawLogs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, #0
	mov	r4, r5
	ldr	r7, .L80
	ldr	r6, .L80+4
	ldr	r9, .L80+8
	ldr	r8, .L80+12
	sub	sp, sp, #12
.L77:
	ldr	r1, [r7, #4]
	ldr	r0, [r7], #24
	mov	r3, #20
	add	r0, r4, r0
	mov	r2, #30
	str	r8, [sp]
	mov	lr, pc
	bx	r9
	ldr	r1, [r6, #4]
	ldr	r0, [r6], #24
	mov	r3, #20
	add	r0, r5, r0
	mov	r2, #30
	str	r8, [sp]
	add	r4, r4, #30
	mov	lr, pc
	bx	r9
	cmp	r4, #90
	add	r5, r5, #20
	bne	.L77
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	logs1
	.word	logs2
	.word	drawRectangle
	.word	5460
	.size	drawLogs, .-drawLogs
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
	mov	r0, #0
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	bl	drawCars
	bl	drawLogs
	bl	drawPlayer
	bl	drawText
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	fillScreen
	.word	drawSafe
	.word	waitForVBlank
	.size	drawGame, .-drawGame
	.comm	player,28,4
	.comm	logs2,72,4
	.comm	logs1,72,4
	.comm	cars2,72,4
	.comm	cars1,72,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
