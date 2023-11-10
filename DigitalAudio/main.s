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
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L17
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L17+4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L5
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	blt	.L5
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L15
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #2]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r1, #20]
.L5:
	ldr	r3, .L17+16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L3
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	blt	.L3
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L16
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #6]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r1, #32]
.L3:
	mov	r1, #1
	ldr	r3, .L17
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L15:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	b	.L5
.L16:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	b	.L3
.L18:
	.align	2
.L17:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #5120
	mov	r5, #67108864
	mov	r4, #0
	strh	r3, [r5]	@ movhi
	ldr	r3, .L21
	ldr	r0, .L21+4
	ldrh	lr, [r3, #48]
	ldr	ip, .L21+8
	strh	lr, [r0]	@ movhi
	ldr	r6, .L21+12
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L21+16
	ldr	r1, .L21+20
	strh	r4, [ip]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r2, .L21+24
	ldr	r1, .L21+28
	mov	r3, #16384
	mov	lr, pc
	bx	r6
	ldr	r3, .L21+32
	mov	lr, pc
	bx	r3
	mov	r2, #8
	mov	r7, #64
	mov	r6, #100
	mov	r0, #1
	mov	ip, #30
	ldr	r3, .L21+36
	strh	r2, [r5, #4]	@ movhi
	ldr	r1, .L21+40
	str	r2, [r3, #40]
	ldr	lr, .L21+44
	ldr	r2, .L21+48
	str	r4, [r3, #24]
	str	r4, [r3, #12]
	str	r4, [r3, #36]
	str	r4, [r3, #44]
	str	r4, [r3, #32]
	str	r4, [r3, #8]
	str	r4, [r3, #16]
	str	r7, [r3, #20]
	str	r6, [r3, #4]
	str	r0, [r3, #28]
	strh	r0, [r1, #8]	@ movhi
	strh	r2, [r1]	@ movhi
	str	r2, [lr, #4092]
	str	ip, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	DMANow
	.word	83886592
	.word	spritesPal
	.word	100728832
	.word	spritesTiles
	.word	setupSounds
	.word	banana
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	initialize, .-initialize
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #67108864
	mov	lr, #8
	mov	r0, #1
	ldr	r2, .L25
	ldr	r3, .L25+4
	ldr	r1, .L25+8
	strh	lr, [ip, #4]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	lr, [sp], #4
	str	r3, [r1, #4092]
	bx	lr
.L26:
	.align	2
.L25:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	initBanana
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBanana, %function
initBanana:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #1
	mov	lr, #64
	mov	ip, #8
	mov	r0, #100
	mov	r1, #30
	ldr	r3, .L29
	str	r4, [r3, #28]
	str	lr, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #12]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	str	r2, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	ip, [r3, #40]
	str	r0, [r3, #4]
	str	r1, [r3]
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	banana
	.size	initBanana, .-initBanana
	.global	__aeabi_idivmod
	.align	2
	.global	updateBanana
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBanana, %function
updateBanana:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L41
	ldr	r3, [r3, #12]
	push	{r4, r5, r6, lr}
	ldr	r5, .L41+4
	cmp	r3, #0
	ldr	r4, [r5, #24]
	beq	.L32
	ldr	r3, .L41+8
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blt	.L39
.L32:
	mov	r2, #0
	mov	r1, #16
	mov	ip, #512
	ldr	r3, .L41+12
	stm	r3, {r1, r2}
	str	r2, [r5, #28]
.L34:
	ldr	r2, [r5, #4]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	ldr	r0, .L41+16
	add	r3, r4, #1
	smull	r1, r0, r3, r0
	asr	r1, r3, #31
	add	r0, r0, r3
	rsb	r1, r1, r0, asr #2
	rsb	r1, r1, r1, lsl #3
	ldrb	r0, [r5]	@ zero_extendqisi2
	sub	r3, r3, r1
	ldr	r1, .L41+20
	str	r3, [r5, #24]
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	mov	r1, #1
	ldr	r2, .L41+16
	smull	r3, r2, r4, r2
	asr	r3, r4, #31
	add	r2, r2, r4
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	cmp	r4, r3
	str	r1, [r5, #28]
	bne	.L40
	ldr	r0, [r5, #36]
	ldr	r3, .L41+24
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	rsbs	r0, r1, #0
	and	r0, r0, #3
	and	r2, r1, #3
	rsbpl	r2, r0, #0
	cmp	r1, #0
	add	r3, r1, #3
	movge	r3, r1
	lsl	r2, r2, #3
	asr	r3, r3, #2
	ldr	r0, .L41+12
	add	ip, r2, r3, lsl #8
	lsl	ip, ip, #16
	lsl	r3, r3, #3
	str	r1, [r5, #36]
	str	r2, [r0, #4]
	str	r3, [r0]
	lsr	ip, ip, #16
	b	.L34
.L40:
	ldr	r3, .L41+12
	ldm	r3, {r2, ip}
	add	ip, ip, r2, lsl #5
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	b	.L34
.L42:
	.align	2
.L41:
	.word	soundA
	.word	banana
	.word	dma
	.word	.LANCHOR0
	.word	-1840700269
	.word	shadowOAM
	.word	__aeabi_idivmod
	.size	updateBanana, .-updateBanana
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r4, .L60+4
	ldr	r5, .L60+8
	ldr	r10, .L60+12
	ldr	r9, .L60+16
	ldr	r8, .L60+20
	ldr	r7, .L60+24
	ldr	fp, .L60+28
	ldr	r6, .L60+32
	b	.L48
.L44:
	tst	r3, #2
	beq	.L45
	ldrh	r2, [r4]
	tst	r2, #2
	beq	.L59
.L45:
	tst	r3, #8
	beq	.L46
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L46
	ldr	r3, [r10, #12]
	cmp	r3, #0
	ldrne	r3, .L60+36
	ldreq	r3, .L60+40
	mov	lr, pc
	bx	r3
.L46:
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r8
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r6
	mov	r0, #3
	mov	lr, pc
	bx	r7
.L48:
	ldrh	r3, [r4]
	ldr	r2, .L60+44
	strh	r3, [r5]	@ movhi
	ldrh	r2, [r2, #48]
	tst	r3, #1
	strh	r2, [r4]	@ movhi
	beq	.L44
	tst	r2, #1
	bne	.L44
	ldr	r3, .L60+48
	mov	r2, #1
	ldr	r1, [r3]
	mov	r0, fp
	ldr	r3, .L60+52
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L44
.L59:
	ldr	r3, .L60+56
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L60+60
	ldr	r3, .L60+64
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L45
.L61:
	.align	2
.L60:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	soundB
	.word	updateBanana
	.word	waitForVBlank
	.word	DMANow
	.word	funkytown_data
	.word	shadowOAM
	.word	pauseSounds
	.word	unpauseSounds
	.word	67109120
	.word	funkytown_length
	.word	playSoundA
	.word	vine_boom_length
	.word	vine_boom_data
	.word	playSoundB
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	banana,48,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	tilerow.4122, %object
	.size	tilerow.4122, 4
tilerow.4122:
	.space	4
	.type	tilecol.4121, %object
	.size	tilecol.4121, 4
tilecol.4121:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
