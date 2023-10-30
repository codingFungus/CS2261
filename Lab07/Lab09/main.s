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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #56320
	strh	r3, [r2]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #2016
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	r6, #16
	mov	r5, #21
	mov	r4, #200
	mov	lr, #150
	mov	r2, #1
	mov	ip, #3
	mov	r0, #0
	mov	r1, #10
	ldr	r3, .L4+44
	stm	r3, {r4, lr}
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	ip, [r3, #40]
	str	r0, [r3, #24]
	str	r1, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	littleroot_townTiles
	.word	100720640
	.word	littleroot_townMap
	.word	littleroot_townPal
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	player
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r3, .L60
	ldr	ip, .L60+4
	ldr	lr, [r3]
	ldr	r0, [r3, #16]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #20]
	ldrh	ip, [ip]
	add	r4, r0, lr
	add	r6, r2, r1
	tst	ip, #32
	str	r5, [r3, #28]
	sub	r4, r4, #1
	sub	r5, r6, #1
	bne	.L8
	mov	r8, #3
	mov	r7, #1
	cmp	lr, #0
	str	r8, [r3, #24]
	str	r7, [r3, #28]
	ble	.L8
	ldr	r7, [r3, #8]
	ldr	r9, .L60+8
	sub	r7, lr, r7
	add	r8, r7, r1, lsl #9
	ldrb	r8, [r9, r8, lsl #1]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L55
.L8:
	tst	ip, #16
	bne	.L11
	mov	r9, #2
	mov	r8, #1
	ldr	r7, [r3]
	cmp	r7, #512
	str	r9, [r3, #24]
	str	r8, [r3, #28]
	blt	.L56
.L11:
	ands	r7, ip, #128
	bne	.L14
	mov	r8, #1
	cmp	r6, #512
	str	r7, [r3, #24]
	str	r8, [r3, #28]
	blt	.L57
.L14:
	tst	ip, #64
	bne	.L17
	mov	r5, #1
	ldr	r6, [r3, #4]
	cmp	r6, #0
	str	r5, [r3, #24]
	str	r5, [r3, #28]
	ble	.L17
	ldr	r7, [r3, #12]
	ldr	r5, .L60+8
	sub	r1, r1, r7
	add	lr, lr, r1, lsl #9
	ldrb	lr, [r5, lr, lsl #1]	@ zero_extendqisi2
	cmp	lr, #0
	lsl	r1, r1, #9
	bne	.L58
.L17:
	and	ip, ip, #240
	cmp	ip, #240
	beq	.L19
	ldr	lr, [r3, #32]
	ldr	r1, [r3, #36]
	sub	lr, lr, #1
	cmp	lr, #0
	str	lr, [r3, #32]
	lslne	lr, r1, #6
	beq	.L59
.L21:
	ldm	r3, {r1, ip}
	add	r5, r2, r2, lsr #31
	sub	r2, r1, #120
	add	r2, r2, r5, asr #1
	ldr	r6, .L60+12
	cmp	r2, #0
	str	r2, [r6]
	movlt	r2, #0
	add	r4, r0, r0, lsr #31
	ldr	r5, .L60+16
	sub	r0, ip, #80
	add	r0, r0, r4, asr #1
	str	r0, [r5]
	strlt	r2, [r6]
	blt	.L25
	cmp	r2, #272
	movgt	r4, #272
	movgt	r2, r4
	lslle	r2, r2, #16
	strgt	r4, [r6]
	lsrle	r2, r2, #16
.L25:
	cmp	r0, #0
	movlt	r0, #0
	strlt	r0, [r5]
	blt	.L28
	cmp	r0, #352
	movgt	r4, #352
	movgt	r0, r4
	lslle	r0, r0, #16
	strgt	r4, [r5]
	lsrle	r0, r0, #16
.L28:
	sub	r2, r1, r2
	ldr	r1, [r3, #24]
	ldr	r4, .L60+20
	ldrb	r3, [r3, #48]	@ zero_extendqisi2
	sub	r0, ip, r0
	add	lr, lr, r1
	ldr	ip, .L60+24
	ldr	r1, .L60+28
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	and	r0, r0, #255
	orr	r2, r2, ip
	orr	r0, r0, ip
	and	lr, r1, lr, lsl #1
	add	ip, r4, r3, lsl #3
	lsl	r3, r3, #3
	strh	r0, [r4, r3]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L59:
	ldr	ip, [r3, #40]
	add	r1, r1, #1
	cmp	r1, ip
	str	r1, [r3, #36]
	lsllt	lr, r1, #6
	mov	r1, #10
	strge	lr, [r3, #36]
	str	r1, [r3, #32]
	b	.L21
.L56:
	ldr	r10, [r3, #8]
	ldr	r9, .L60+8
	add	r8, r10, r4
	add	fp, r8, r1, lsl #9
	ldrb	fp, [r9, fp, lsl #1]	@ zero_extendqisi2
	cmp	fp, #0
	beq	.L11
	add	r8, r8, r5, lsl #9
	ldrb	r8, [r9, r8, lsl #1]	@ zero_extendqisi2
	cmp	r8, #0
	addne	r7, r7, r10
	strne	r7, [r3]
	b	.L11
.L57:
	ldr	r6, [r3, #12]
	ldr	r7, .L60+8
	add	r5, r6, r5
	add	r8, lr, r5, lsl #9
	ldrb	r8, [r7, r8, lsl #1]	@ zero_extendqisi2
	cmp	r8, #0
	lsl	r5, r5, #9
	beq	.L14
	add	r5, r4, r5
	ldrb	r5, [r7, r5, lsl #1]	@ zero_extendqisi2
	cmp	r5, #0
	addne	r5, r6, r1
	strne	r5, [r3, #4]
	b	.L14
.L19:
	mov	r1, #0
	mov	ip, #10
	mov	lr, r1
	str	r1, [r3, #36]
	str	ip, [r3, #32]
	b	.L21
.L55:
	add	r8, r7, r5, lsl #9
	ldrb	r8, [r9, r8, lsl #1]	@ zero_extendqisi2
	cmp	r8, #0
	strne	r7, [r3]
	b	.L8
.L58:
	add	r1, r4, r1
	ldrb	r1, [r5, r1, lsl #1]	@ zero_extendqisi2
	cmp	r1, #0
	subne	r6, r6, r7
	strne	r6, [r3, #4]
	b	.L17
.L61:
	.align	2
.L60:
	.word	player
	.word	buttons
	.word	collisionmapBitmap
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	-32768
	.word	1022
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L64
	push	{r4, lr}
	ldrh	r1, [r3]
	ldr	r3, .L64+4
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L64+8
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L64+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	draw, .-draw
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
	push	{r7, lr}
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r9, .L69+4
	ldr	r4, .L69+8
	ldr	r8, .L69+12
	ldr	r7, .L69+16
	ldr	r6, .L69+20
	ldr	r5, .L69+24
.L67:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L67
.L70:
	.align	2
.L69:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	player,52,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
