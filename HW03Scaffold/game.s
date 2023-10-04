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
	.type	updateEnemy.part.0, %function
updateEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, [r0]
	cmp	ip, #0
	mov	r5, r0
	ldr	r2, [r0, #20]
	sub	sp, sp, #20
	ldr	r0, [r0, #28]
	ble	.L2
	add	r3, ip, r2
	cmp	r3, #239
	bgt	.L2
.L3:
	ldr	lr, [r5, #4]
	cmp	lr, #20
	ldr	r3, [r5, #16]
	ldr	r1, [r5, #32]
	ble	.L4
	add	r4, lr, r3
	cmp	r4, #135
	bgt	.L4
.L5:
	ldr	r4, .L20
	add	r0, ip, r0
	add	r1, lr, r1
	stm	r5, {r0, r1}
	ldr	r7, .L20+4
	ldr	r8, .L20+8
	ldr	r10, .L20+12
	ldr	r9, .L20+16
	add	r6, r4, #900
	b	.L8
.L6:
	add	r4, r4, #36
	cmp	r4, r6
	beq	.L19
.L8:
	ldr	ip, [r4, #28]
	cmp	ip, #0
	beq	.L6
	ldr	ip, [r4, #16]
	ldr	fp, [r4, #4]
	ldr	lr, [r4]
	stmib	sp, {fp, ip}
	str	ip, [sp, #12]
	str	lr, [sp]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L7
	add	r4, r4, #36
	cmp	r4, r6
	ldm	r5, {r0, r1}
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	bne	.L8
.L19:
	stm	sp, {r0, r1, r2, r3}
	ldr	r4, .L20+20
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L1
	mov	r3, #67108864
	mov	r1, #1
	ldr	r0, .L20+12
	ldr	r2, .L20+24
	strh	r0, [r3, #104]	@ movhi
	str	r1, [r4, #36]
	strh	r2, [r3, #108]	@ movhi
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L2:
	rsb	r0, r0, #0
	str	r0, [r5, #28]
	b	.L3
.L4:
	rsb	r1, r1, #0
	str	r1, [r5, #32]
	b	.L5
.L7:
	mov	r2, #0
	mov	ip, #67108864
	ldr	r3, [r8]
	str	r2, [r4, #28]
	add	r3, r3, #1
	str	r2, [r5, #36]
	str	r3, [r8]
	ldm	r5, {r0, r1}
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	strh	r10, [ip, #104]	@ movhi
	strh	r9, [ip, #108]	@ movhi
	b	.L6
.L21:
	.align	2
.L20:
	.word	bullets
	.word	collision
	.word	score
	.word	17024
	.word	-30804
	.word	player
	.word	-30783
	.size	updateEnemy.part.0, .-updateEnemy.part.0
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
	mov	r0, #110
	push	{r4, lr}
	mov	r1, #80
	mov	r4, #8
	mov	lr, #10
	mov	r2, #3
	mov	ip, #0
	ldr	r3, .L24
	str	r0, [r3]
	str	r0, [r3, #8]
	ldr	r0, .L24+4
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	strh	r0, [r3, #32]	@ movhi
	str	ip, [r3, #36]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.word	31775
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r7, #2
	mvn	r6, #1
	mvn	r5, #2
	mvn	r4, #32768
	mov	lr, #1
	ldr	r1, .L30
	ldr	r3, .L30+4
	ldr	ip, [r1]
	ldr	r0, [r1, #4]
	add	r1, r3, #900
.L27:
	str	r7, [r3, #16]
	str	r6, [r3]
	str	r0, [r3, #12]
	str	r5, [r3, #20]
	strh	r4, [r3, #24]	@ movhi
	str	r2, [r3, #28]
	str	lr, [r3, #32]
	stmib	r3, {r2, ip}
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L27
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.word	bullets
	.size	initBullet, .-initBullet
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #10
	ldr	r4, .L36
	ldr	r5, .L36+4
	ldr	r10, .L36+8
	ldr	r8, .L36+12
	ldr	r7, .L36+16
	add	r6, r4, #440
.L33:
	mov	r3, #6
	str	r9, [r4, #20]
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r8, r0
	asr	r2, r0, #31
	rsb	r3, r2, r3, asr #5
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #3
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	ip, #992
	mov	r1, #0
	smull	r3, lr, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, lr, asr #2
	rsb	lr, r3, r3, lsl #3
	rsb	r3, r3, lr, lsl #3
	sub	r0, r0, r3, lsl r2
	ldr	lr, [r10]
	ldr	r3, [r10, #4]
	add	r0, r0, #15
	str	r0, [r4, #4]
	str	r2, [r4, #36]
	str	r2, [r4, #28]
	str	r2, [r4, #32]
	strh	ip, [r4, #24]	@ movhi
	str	r1, [r4, #40]
	str	lr, [r4, #8]
	str	r3, [r4, #12]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L33
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	enemies
	.word	rand
	.word	player
	.word	1195121335
	.word	156180629
	.size	initEnemy, .-initEnemy
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #1
	mov	r7, #2
	mvn	r6, #1
	mov	r4, #0
	mvn	r5, #2
	mvn	lr, #32768
	ldr	r8, .L42
	ldr	r3, .L42+4
	ldm	r8, {r0, r1}
	add	r2, r3, #900
.L39:
	str	r7, [r3, #16]
	str	r6, [r3]
	str	r4, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r5, [r3, #20]
	strh	lr, [r3, #24]	@ movhi
	str	r4, [r3, #28]
	str	ip, [r3, #32]
	add	r3, r3, #36
	cmp	r3, r2
	bne	.L39
	bl	initEnemy
	mov	r2, #80
	mov	r3, #3
	mov	r1, #110
	mov	ip, #8
	mov	r0, #10
	str	r2, [r8, #4]
	str	r2, [r8, #12]
	str	r3, [r8, #24]
	str	r3, [r8, #28]
	ldr	r2, .L42+8
	ldr	r3, .L42+12
	str	r4, [r8, #36]
	str	r1, [r8]
	str	r1, [r8, #8]
	str	ip, [r8, #16]
	str	r0, [r8, #20]
	strh	r2, [r8, #32]	@ movhi
	str	r4, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	player
	.word	bullets
	.word	31775
	.word	score
	.size	initGame, .-initGame
	.align	2
	.global	spawnBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnBullet, %function
spawnBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L54
	mov	r3, #0
	mov	r2, r0
	b	.L47
.L45:
	add	r3, r3, #1
	cmp	r3, #25
	add	r2, r2, #36
	bxeq	lr
.L47:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L45
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	r4, .L54+4
	add	r3, r3, r3, lsl #3
	ldr	r2, [r4, #20]
	ldr	r6, [r4]
	add	ip, r0, r3, lsl #2
	add	lr, r2, r2, lsr #31
	str	r6, [r0, r3, lsl #2]
	ldr	r2, [r4, #4]
	ldr	r3, [ip, #16]
	add	r2, r2, lr, asr r5
	add	r3, r3, r3, lsr #31
	sub	r3, r2, r3, asr r5
	str	r5, [ip, #28]
	str	r1, [ip, #32]
	str	r3, [ip, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	bullets
	.word	player
	.size	spawnBullet, .-spawnBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	ldrne	r2, [r0, #20]
	ldr	r3, [r0, #4]
	addne	r3, r3, r2
	push	{r4, r5, r6, lr}
	strne	r3, [r0, #4]
	cmp	r3, #14
	mov	r4, r0
	ble	.L64
.L58:
	ldr	r3, .L65
	ldr	r3, [r3]
	cmp	r3, #2
	movgt	r2, #3
	movgt	r3, #31
	strgt	r2, [r4, #16]
	strhgt	r3, [r4, #24]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r0, #32]
	str	r3, [r0, #28]
	add	r0, r0, #8
	ldm	r0, {r0, r1, r2}
	ldr	r5, .L65+4
	mov	lr, pc
	bx	r5
	b	.L58
.L66:
	.align	2
.L65:
	.word	score
	.word	drawCircle
	.size	updateBullet, .-updateBullet
	.align	2
	.global	inSlowZone
	.syntax unified
	.arm
	.fpu softvfp
	.type	inSlowZone, %function
inSlowZone:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L70
	ldr	r3, [r2, #4]
	sub	r3, r3, #1
	cmp	r3, #78
	bhi	.L69
	ldr	r0, [r2]
	cmp	r0, #239
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L69:
	mov	r0, #0
	bx	lr
.L71:
	.align	2
.L70:
	.word	player
	.size	inSlowZone, .-inSlowZone
	.align	2
	.global	inBorder
	.syntax unified
	.arm
	.fpu softvfp
	.type	inBorder, %function
inBorder:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L74
	ldr	r2, [r3]
	cmp	r2, #0
	bxlt	lr
	ldr	r1, [r3, #20]
	rsb	r1, r1, #240
	cmp	r2, r1
	bxgt	lr
	ldr	r2, [r3, #4]
	cmp	r2, #19
	bxle	lr
	ldr	r3, [r3, #16]
	rsb	r3, r3, #160
	cmp	r2, r3
	movle	r0, #1
	bx	lr
.L75:
	.align	2
.L74:
	.word	player
	.size	inBorder, .-inBorder
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
	ldr	r3, .L155
	ldrh	r1, [r3]
	push	{r4, r5, r6, lr}
	ldr	r4, .L155+4
	ands	lr, r1, #32
	ldr	r2, [r4]
	and	r0, r1, #16
	bne	.L77
	ldr	r3, [r4, #4]
	sub	ip, r3, #1
	cmp	ip, #78
	movhi	ip, #0
	movls	ip, #1
	cmp	r2, #239
	movgt	ip, #0
	cmp	ip, #0
	bne	.L150
.L77:
	cmp	r0, #0
	bne	.L80
	ldr	r3, [r4, #4]
	sub	r3, r3, #1
	cmp	r3, #78
	bhi	.L80
.L78:
	cmp	r2, #239
	ldrle	r3, [r4, #24]
	addle	r3, r3, r3, lsr #31
	addle	r2, r2, r3, asr #1
	strle	r2, [r4]
.L81:
	ands	r5, r1, #128
	and	ip, r1, #64
	bne	.L82
	ldr	r3, [r4, #4]
.L112:
	ldr	r2, [r4]
	cmp	r2, #239
	ble	.L151
	cmp	ip, #0
	movne	r5, #0
	bne	.L85
.L87:
	cmp	lr, #0
	movne	r5, ip
	movne	ip, #0
	bne	.L89
.L110:
	ldr	r3, [r4, #4]
.L90:
	ldr	r1, [r4, #24]
	sub	r2, r2, r1
	str	r2, [r4]
.L88:
	ldr	r1, [r4, #20]
	cmp	r2, #0
	addlt	r2, r2, #3
	rsb	r1, r1, #240
	strlt	r2, [r4]
	cmp	r1, r2
	sublt	r2, r2, #3
	strlt	r2, [r4]
	ldr	r2, [r4, #16]
	cmp	r3, #25
	addle	r3, r3, #3
	rsb	r2, r2, #160
	strle	r3, [r4, #4]
	cmp	r2, r3
	suble	r3, r3, #3
	strle	r3, [r4, #4]
	ldr	r3, .L155+8
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L76
	mov	r3, #4
	mov	r0, #15
	mov	r1, #12
	ldr	r2, .L155+12
	str	r0, [r4, #20]
	str	r1, [r4, #16]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	strh	r2, [r4, #32]	@ movhi
.L76:
	pop	{r4, r5, r6, lr}
	bx	lr
.L80:
	ands	r5, r1, #128
	and	ip, r1, #64
	bne	.L82
	ldr	r3, [r4, #4]
	sub	r2, r3, #1
	cmp	r2, #78
	bls	.L112
	cmp	ip, #0
	bne	.L85
.L86:
	cmp	lr, #0
	bne	.L111
	ldr	r2, [r4]
	b	.L90
.L151:
	mov	r5, #0
	ldr	r2, [r4, #28]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r2, asr #1
	str	r3, [r4, #4]
.L82:
	cmp	ip, #0
	bne	.L85
	ldr	r3, [r4, #4]
	sub	r2, r3, #1
	cmp	r2, #78
	bhi	.L86
	ldr	r2, [r4]
	cmp	r2, #239
	bgt	.L118
	ldr	r1, [r4, #28]
	add	r1, r1, r1, lsr #31
	sub	r3, r3, r1, asr #1
	str	r3, [r4, #4]
	b	.L88
.L85:
	cmp	lr, #0
	bne	.L89
	ldr	r3, [r4, #4]
	sub	r2, r3, #1
	cmp	r2, #78
	ldr	r2, [r4]
	bhi	.L90
	cmp	r2, #239
	bgt	.L110
	cmp	r0, #0
	beq	.L100
	cmp	r5, #0
	bne	.L100
.L95:
	ldr	r3, [r4, #4]
	sub	r2, r3, #1
	cmp	r2, #78
	ldr	r2, [r4]
	bhi	.L98
	cmp	r2, #239
	ble	.L100
.L98:
	ldr	r1, [r4, #28]
	add	r3, r3, r1
	str	r3, [r4, #4]
	b	.L88
.L89:
	cmp	r0, #0
	beq	.L152
	cmp	r5, #0
	beq	.L95
.L97:
	cmp	ip, #0
	bne	.L100
.L96:
	ldr	r3, [r4, #4]
	sub	r2, r3, #1
	cmp	r2, #78
	ldr	r2, [r4]
	bhi	.L101
	cmp	r2, #239
	ble	.L100
.L101:
	ldr	r1, [r4, #28]
	sub	r3, r3, r1
	str	r3, [r4, #4]
	b	.L88
.L152:
	ldr	r3, [r4, #4]
	sub	r2, r3, #1
	cmp	r2, #78
	ldr	r2, [r4]
	bhi	.L93
	cmp	r2, #239
	ble	.L94
.L93:
	ldr	r1, [r4, #24]
	add	r2, r2, r1
	str	r2, [r4]
	b	.L88
.L150:
	ldr	ip, [r4, #24]
	add	ip, ip, ip, lsr #31
	sub	r2, r2, ip, asr #1
	cmp	r0, #0
	str	r2, [r4]
	beq	.L78
	ands	r5, r1, #128
	and	ip, r1, #64
	beq	.L112
	b	.L82
.L118:
	mov	ip, r5
	b	.L87
.L94:
	cmp	r5, #0
	bne	.L97
.L100:
	tst	r1, #1
	bne	.L103
	ldr	r3, .L155+16
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L153
.L103:
	ldm	r4, {r2, r3}
	b	.L88
.L111:
	cmp	r0, #0
	ldmeq	r4, {r2, r3}
	beq	.L93
.L154:
	cmp	r5, #0
	beq	.L95
	b	.L96
.L153:
	bl	spawnBullet
	mov	r3, #67108864
	ldr	r2, .L155+20
	ldr	r1, .L155+24
	strh	r1, [r3, #104]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	ldm	r4, {r2, r3}
	b	.L88
.L156:
	.align	2
.L155:
	.word	buttons
	.word	player
	.word	score
	.word	32736
	.word	oldButtons
	.word	-30970
	.word	17024
	.size	updatePlayer, .-updatePlayer
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
	bl	updatePlayer
	ldr	r4, .L167
	add	r5, r4, #900
.L158:
	mov	r0, r4
	add	r4, r4, #36
	bl	updateBullet
	cmp	r4, r5
	bne	.L158
	ldr	r4, .L167+4
	add	r5, r4, #440
.L160:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	movne	r0, r4
	blne	updateEnemy.part.0
.L159:
	add	r4, r4, #44
	cmp	r5, r4
	bne	.L160
	pop	{r4, r5, r6, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	bullets
	.word	enemies
	.size	updateGame, .-updateGame
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy.part.0
	.size	updateEnemy, .-updateEnemy
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
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	r4, .L173
	sub	sp, sp, #12
	str	r3, [sp]
	add	r0, r4, #8
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldr	r5, .L173+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #20]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L174:
	.align	2
.L173:
	.word	player
	.word	drawRectangle
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	bne	.L179
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L180
.L177:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L180:
	add	r0, r0, #8
	ldm	r0, {r0, r1, r2}
	ldr	r5, .L181
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #32]
	b	.L177
.L179:
	add	r0, r0, #8
	ldm	r0, {r0, r1, r2}
	mov	r3, #0
	ldr	r5, .L181
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4, #24]
	ldr	r2, [r4, #16]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	b	.L177
.L182:
	.align	2
.L181:
	.word	drawCircle
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L187
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L188
.L185:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L188:
	str	r3, [sp]
	add	r0, r0, #8
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r5, .L189
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L185
.L187:
	mov	r2, #0
	ldr	r3, [r0, #16]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L189
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #24]
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	b	.L185
.L190:
	.align	2
.L189:
	.word	drawRectangle
	.size	drawEnemy, .-drawEnemy
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
	ldr	r4, .L197
	add	r5, r4, #900
.L192:
	mov	r0, r4
	add	r4, r4, #36
	bl	drawBullet
	cmp	r4, r5
	bne	.L192
	ldr	r4, .L197+4
	add	r5, r4, #440
.L193:
	mov	r0, r4
	add	r4, r4, #44
	bl	drawEnemy
	cmp	r5, r4
	bne	.L193
	pop	{r4, r5, r6, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	bullets
	.word	enemies
	.size	drawGame, .-drawGame
	.comm	score,4,4
	.comm	enemyToErase,4,4
	.comm	enemies,440,4
	.comm	bullets,900,4
	.comm	player,40,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
