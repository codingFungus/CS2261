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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debug logs initialized!\000"
	.align	2
.LC1:
	.ascii	"%s\000"
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
	mov	r2, #67108864
	push	{r4, r5, lr}
	ldr	r1, .L4
	sub	sp, sp, #12
	strh	r1, [r2]	@ movhi
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r1, .L4+8
	ldr	r0, .L4+12
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	mov	r3, #10
	ldr	r4, .L4+20
	ldr	r5, .L4+24
	ldr	r0, .L4+28
	ldr	r2, .L4+32
	str	r3, [r4]
	str	r3, [r5]
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+36
	ldr	r0, [r4]
	mov	r2, #0
	str	r3, [sp]
	ldr	r1, [r5]
	mov	r3, #31
	ldr	r4, .L4+40
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	mgba_open
	.word	.LC0
	.word	.LC1
	.word	mgba_printf
	.word	pX
	.word	pY
	.word	32767
	.word	fillScreen
	.word	5727
	.word	drawMushroom
	.size	initialize, .-initialize
	.align	2
	.global	cleanupArea
	.syntax unified
	.arm
	.fpu softvfp
	.type	cleanupArea, %function
cleanupArea:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L8
	sub	sp, sp, #8
	str	ip, [sp]
	ldr	r4, .L8+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	32767
	.word	drawRectangle
	.size	cleanupArea, .-cleanupArea
	.align	2
	.global	processInputs
	.syntax unified
	.arm
	.fpu softvfp
	.type	processInputs, %function
processInputs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L44
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L41
	ldr	r2, .L44+4
.L11:
	tst	r3, #1
	beq	.L12
	ldr	r1, .L44+8
	ldrh	r1, [r1, #48]
	tst	r1, #1
	bne	.L12
.L13:
	ldr	r1, .L44+12
	ldrb	r0, [r2, #4]	@ zero_extendqisi2
	ldr	r1, [r1]
	add	r1, r1, r0
	and	r1, r1, #3
	strb	r1, [r2, #4]
.L15:
	tst	r3, #4
	beq	.L16
	ldr	r1, .L44+8
	ldrh	r1, [r1, #48]
	tst	r1, #4
	beq	.L43
.L17:
	ldr	r1, .L44+8
	ldrh	r1, [r1, #48]
	tst	r1, #4
	bne	.L16
	ldr	r1, .L44+12
	ldr	r0, [r1]
	cmn	r0, #1
	moveq	r0, #1
	streq	r0, [r2]
	streq	r0, [r1]
.L16:
	tst	r3, #32
	beq	.L18
	ldr	r1, .L44+8
	ldrh	r1, [r1, #48]
	ands	r1, r1, #32
	strbeq	r1, [r2, #4]
.L18:
	tst	r3, #16
	bxeq	lr
	ldr	r3, .L44+8
	ldrh	r3, [r3, #48]
	tst	r3, #16
	moveq	r3, #3
	strbeq	r3, [r2, #4]
	bx	lr
.L12:
	ldr	r1, [r2]
	cmp	r1, #0
	bne	.L13
	tst	r3, #2
	beq	.L15
	ldr	r1, .L44+8
	ldrh	r1, [r1, #48]
	tst	r1, #2
	bne	.L15
	ldr	r0, .L44+12
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	ldr	r0, [r0]
	sub	r1, r1, r0
	and	r1, r1, #3
	strb	r1, [r2, #4]
	b	.L15
.L41:
	ldr	r2, .L44+8
	ldrh	r2, [r2, #48]
	tst	r2, #8
	ldr	r2, .L44+4
	bne	.L11
	ldr	r1, [r2]
	rsbs	r1, r1, #1
	movcc	r1, #0
	str	r1, [r2]
	b	.L11
.L43:
	ldr	r1, .L44+12
	ldr	r0, [r1]
	cmp	r0, #1
	mvneq	ip, #0
	streq	r0, [r2]
	streq	ip, [r1]
	bne	.L17
	b	.L16
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	.LANCHOR0
	.word	67109120
	.word	.LANCHOR1
	.size	processInputs, .-processInputs
	.align	2
	.global	cleanupFrame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	cleanupFrame1, %function
cleanupFrame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #55
	push	{r4, lr}
	ldr	r2, .L48
	ldr	ip, .L48+4
	ldr	r0, [r2]
	ldr	r1, .L48+8
	sub	sp, sp, #8
	ldr	r1, [r1]
	mov	r2, r3
	str	ip, [sp]
	ldr	r4, .L48+12
	sub	r0, r0, #10
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	pX
	.word	32767
	.word	pY
	.word	drawRectangle
	.size	cleanupFrame1, .-cleanupFrame1
	.align	2
	.global	cleanupFrame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	cleanupFrame2, %function
cleanupFrame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #60
	push	{r4, lr}
	ldr	r2, .L52
	ldr	ip, .L52+4
	ldr	r0, [r2]
	ldr	r1, .L52+8
	sub	sp, sp, #8
	ldr	r1, [r1]
	mov	r2, r3
	str	ip, [sp]
	ldr	r4, .L52+12
	add	r0, r0, #50
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	pX
	.word	32767
	.word	pY
	.word	drawRectangle
	.size	cleanupFrame2, .-cleanupFrame2
	.align	2
	.global	cleanupFrame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	cleanupFrame3, %function
cleanupFrame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #55
	push	{r4, lr}
	ldr	r2, .L56
	ldr	r1, .L56+4
	ldr	r0, [r2]
	ldr	r1, [r1]
	ldr	ip, .L56+8
	sub	sp, sp, #8
	mov	r2, r3
	str	ip, [sp]
	ldr	r4, .L56+12
	add	r1, r1, #30
	add	r0, r0, #50
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	pX
	.word	pY
	.word	32767
	.word	drawRectangle
	.size	cleanupFrame3, .-cleanupFrame3
	.align	2
	.global	cleanupFrame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	cleanupFrame4, %function
cleanupFrame4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #55
	push	{r4, lr}
	ldr	r2, .L60
	ldr	r1, .L60+4
	ldr	r0, [r2]
	ldr	r1, [r1]
	ldr	ip, .L60+8
	sub	sp, sp, #8
	mov	r2, r3
	str	ip, [sp]
	ldr	r4, .L60+12
	add	r1, r1, #33
	sub	r0, r0, #10
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	pX
	.word	pY
	.word	32767
	.word	drawRectangle
	.size	cleanupFrame4, .-cleanupFrame4
	.align	2
	.global	drawFrame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame1, %function
drawFrame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L64
	ldr	r3, .L64+4
	ldr	r1, .L64+8
	sub	sp, sp, #8
	ldr	r0, [r2]
	ldr	r1, [r1]
	mov	r2, #0
	str	r3, [sp]
	ldr	r4, .L64+12
	mov	r3, #31
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	pX
	.word	5727
	.word	pY
	.word	drawMushroom
	.size	drawFrame1, .-drawFrame1
	.align	2
	.global	drawFrame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame2, %function
drawFrame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, #0
	ldr	r4, .L68
	ldr	r5, .L68+4
	ldr	r0, [r4]
	ldr	r3, .L68+8
	sub	sp, sp, #12
	mov	r2, r7
	ldr	r1, [r5]
	str	r3, [sp]
	ldr	r6, .L68+12
	ldr	r3, .L68+16
	add	r0, r0, #60
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r6, .L68+20
	mov	r3, #10
	mov	r2, #3
	str	r7, [sp]
	add	r1, r1, #21
	add	r0, r0, #61
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, [r4]
	mov	r3, #2
	mov	r2, #4
	str	r7, [sp]
	add	r1, r1, #25
	add	r0, r0, #59
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, [r4]
	mov	r3, #10
	mov	r2, #3
	str	r7, [sp]
	add	r1, r1, #21
	add	r0, r0, #67
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, [r4]
	mov	r3, #2
	mov	r2, #4
	str	r7, [sp]
	add	r1, r1, #25
	add	r0, r0, #68
	mov	lr, pc
	bx	r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	pX
	.word	pY
	.word	5727
	.word	drawMouth
	.word	22707
	.word	drawRectangle
	.size	drawFrame2, .-drawFrame2
	.align	2
	.global	drawFrame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame3, %function
drawFrame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, #0
	ldr	r5, .L72
	ldr	r4, .L72+4
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r3, .L72+8
	sub	sp, sp, #12
	mov	r2, r7
	str	r3, [sp]
	ldr	r6, .L72+12
	mov	r3, #992
	add	r1, r1, #30
	add	r0, r0, #60
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r6, .L72+16
	mov	r3, #10
	mov	r2, #3
	str	r7, [sp]
	add	r1, r1, #51
	add	r0, r0, #61
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, [r4]
	mov	r3, #2
	mov	r2, #4
	str	r7, [sp]
	add	r1, r1, #55
	add	r0, r0, #59
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, [r4]
	mov	r3, #10
	mov	r2, #3
	str	r7, [sp]
	add	r1, r1, #51
	add	r0, r0, #67
	mov	lr, pc
	bx	r6
	ldr	r1, [r5]
	ldr	r0, [r4]
	mov	r3, #2
	mov	r2, #4
	str	r7, [sp]
	add	r1, r1, #55
	add	r0, r0, #68
	mov	lr, pc
	bx	r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	pY
	.word	pX
	.word	5727
	.word	drawMushroom
	.word	drawRectangle
	.size	drawFrame3, .-drawFrame3
	.align	2
	.global	drawFrame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame4, %function
drawFrame4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L76
	ldr	r2, .L76+4
	ldr	r1, [r3]
	ldr	r3, .L76+8
	sub	sp, sp, #8
	ldr	r0, [r2]
	ldr	r4, .L76+12
	str	r3, [sp]
	ldr	r2, .L76+16
	mov	r3, #992
	add	r1, r1, #33
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	pY
	.word	pX
	.word	5727
	.word	drawMouth
	.word	22707
	.size	drawFrame4, .-drawFrame4
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
	push	{r4, r5, lr}
	ldr	r4, .L97
	sub	sp, sp, #12
	ldrb	r5, [r4, #4]	@ zero_extendqisi2
	bl	processInputs
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, r5
	beq	.L78
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L96
.L80:
	cmp	r5, #3
	ldrls	pc, [pc, r5, asl #2]
	b	.L81
.L83:
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L82
.L82:
	bl	cleanupFrame4
.L81:
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L78
.L88:
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L87
.L91:
	ldr	r2, .L97+4
	ldr	r3, .L97+8
	ldr	r1, .L97+12
	ldr	r0, [r2]
	ldr	r1, [r1]
	mov	r2, #0
	str	r3, [sp]
	ldr	r4, .L97+16
	mov	r3, #31
	mov	lr, pc
	bx	r4
.L78:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L96:
	mov	r0, #100
	ldr	r3, .L97+20
	mov	lr, pc
	bx	r3
	b	.L80
.L87:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawFrame4
.L86:
	bl	cleanupFrame1
	b	.L81
.L85:
	bl	cleanupFrame2
	b	.L81
.L84:
	bl	cleanupFrame3
	b	.L81
.L90:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawFrame2
.L89:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawFrame3
.L98:
	.align	2
.L97:
	.word	.LANCHOR0
	.word	pX
	.word	5727
	.word	pY
	.word	drawMushroom
	.word	delay
	.size	updateGame, .-updateGame
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
	ldr	r3, .L102
	mov	lr, pc
	bx	r3
	ldr	r8, .L102+4
	ldr	r4, .L102+8
	ldr	r7, .L102+12
	ldr	r6, .L102+16
	ldr	r5, .L102+20
.L100:
	ldrh	r3, [r4]
	strh	r3, [r8]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L100
.L103:
	.align	2
.L102:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	waitForVBlank
	.word	67109120
	.size	main, .-main
	.global	frameIncrement
	.global	isLooping
	.global	prevFrame
	.global	currentState
	.comm	pX,4,4
	.comm	pY,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	frameIncrement, %object
	.size	frameIncrement, 4
frameIncrement:
	.word	1
	.type	prevFrame, %object
	.size	prevFrame, 1
prevFrame:
	.byte	3
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	isLooping, %object
	.size	isLooping, 4
isLooping:
	.space	4
	.type	currentState, %object
	.size	currentState, 1
currentState:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
