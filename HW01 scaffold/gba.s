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
	.global	drawHorizontalLine
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, r2
	bxgt	lr
	ldr	ip, .L10
	ldr	ip, [ip]
	rsb	r0, r0, r0, lsl #4
	str	lr, [sp, #-4]!
	add	lr, r1, r0, lsl #4
	add	r0, r2, r0, lsl #4
	add	r1, ip, #2
	add	r2, ip, lr, lsl #1
	add	r1, r1, r0, lsl #1
.L3:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L3
	ldr	lr, [sp], #4
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawVerticalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, r2
	bxgt	lr
	ldr	ip, .L20
	ldr	ip, [ip]
	rsb	r1, r1, r1, lsl #4
	str	lr, [sp, #-4]!
	rsb	lr, r2, r2, lsl #4
	add	r2, r0, r1, lsl #4
	add	r0, r0, lr, lsl #4
	add	r1, ip, #480
	add	r2, ip, r2, lsl #1
	add	r1, r1, r0, lsl #1
.L14:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L14
	ldr	lr, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	add	lr, r0, r2
	cmp	r0, lr
	ldrh	ip, [sp, #16]
	bge	.L22
	ldr	r2, .L30
	add	r5, r1, r3
	add	r3, r3, r1, lsl #1
	rsb	r6, r3, r3, lsl #4
	ldr	r2, [r2]
	sub	r3, r5, r5, lsl #4
	add	r6, r0, r6, lsl #3
	lsl	r3, r3, #5
	rsb	r4, r1, r1, lsl #4
	add	lr, lr, r0
	add	r2, r2, r6, lsl #2
	lsl	r0, r0, #1
	add	r4, r3, r4, lsl #5
.L24:
	cmp	r1, r5
	addlt	r3, r2, r4
	bge	.L27
.L25:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L25
.L27:
	add	r0, r0, #1
	cmp	r0, lr
	add	r2, r2, #2
	bne	.L24
.L22:
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	drawCircle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCircle, %function
drawCircle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	add	ip, r0, r2
	sub	r5, r0, r2
	cmp	r5, ip
	bge	.L32
	mul	lr, r2, r2
	ldr	r4, .L43
	rsb	ip, r1, r1, lsl #4
	ldr	r4, [r4]
	add	ip, r5, ip, lsl #4
	add	r4, r4, ip, lsl #1
	sub	r5, r5, r0
	sub	r7, r1, r2
	add	r6, r2, r1
.L35:
	cmp	r6, r7
	mulgt	ip, r5, r5
	rsbgt	r1, r2, #0
	ble	.L39
.L38:
	mla	r0, r1, r1, ip
	cmp	lr, r0
	rsbge	r0, r1, r1, lsl #4
	lslge	r0, r0, #5
	add	r1, r1, #1
	strhge	r3, [r0, r4]	@ movhi
	cmp	r2, r1
	bne	.L38
.L39:
	add	r5, r5, #1
	cmp	r5, r2
	add	r4, r4, #2
	bne	.L35
.L32:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.size	drawCircle, .-drawCircle
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
	ldr	r3, .L49
	ldr	r3, [r3]
	add	r2, r3, #76800
.L46:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L46
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.global	__aeabi_i2d
	.global	__aeabi_dsub
	.global	__aeabi_d2iz
	.global	__aeabi_dadd
	.align	2
	.global	drawMushroom
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMushroom, %function
drawMushroom:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, r1
	mov	r4, r3
	ldr	r3, .L223+8
	ldr	r10, [r3]
	sub	sp, sp, #76
	rsb	r3, r1, r1, lsl #4
	str	r0, [sp, #4]
	add	ip, r10, #40
	add	r0, r0, r3, lsl #4
	ldrh	r5, [sp, #112]
	lsl	r3, r3, #4
	str	r1, [sp, #20]
	str	r3, [sp, #28]
	lsl	r1, r0, #2
	add	r3, r10, r0, lsl #2
	add	ip, ip, r0, lsl #2
	lsl	r6, lr, #4
.L52:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r3, ip
	strh	r2, [r0]	@ movhi
	bne	.L52
	ldr	r3, [sp, #28]
	add	ip, r3, #240
	ldr	r3, [sp, #4]
	add	r0, r10, #960
	sub	r3, r3, #3
	add	r3, r3, ip
	add	r0, r0, #2
	add	r3, r10, r3, lsl #2
	add	r0, r0, r1
.L53:
	strh	r2, [r3]	@ movhi
	add	lr, r3, #480
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [lr]	@ movhi
	bne	.L53
	ldr	r3, [sp, #4]
	add	r0, r10, #1012
	add	r3, r3, #10
	add	r3, r3, ip
	add	r0, r0, #2
	add	r3, r10, r3, lsl #2
	add	r0, r0, r1
.L54:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r3, r0
	strh	r2, [r1]	@ movhi
	bne	.L54
	ldr	lr, [sp, #4]
	sub	r1, lr, #4
	lsl	r9, r1, #1
	mov	r0, r9
	ldr	r3, [sp, #20]
	sub	r3, r6, r3
	add	r3, r10, r3, lsl #6
	str	r3, [sp, #24]
	add	ip, r3, #1920
	sub	r3, lr, #1
	str	r3, [sp, #36]
	add	r7, r9, #3
.L55:
	mov	r3, #3
	add	r1, ip, r0, lsl #1
.L56:
	subs	r3, r3, #1
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L56
	add	r0, r0, #1
	cmp	r0, r7
	bne	.L55
	add	r3, r9, #34
	mov	r0, r3
	str	r3, [sp, #56]
	add	lr, r9, #37
.L58:
	mov	r3, #3
	add	r1, ip, r0, lsl #1
.L59:
	subs	r3, r3, #1
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L59
	add	r0, r0, #1
	cmp	r0, lr
	bne	.L58
	sub	fp, r9, #2
	mov	r0, fp
	ldr	r3, [sp, #20]
	sub	r6, r6, r3
	lsl	r3, r6, #5
	str	r3, [sp]
	ldr	r3, [sp, #4]
	sub	r8, r3, #5
	sub	r3, r3, #2
	add	r1, fp, r6, lsl #5
	add	ip, r10, #6720
	str	r3, [sp, #32]
	add	r1, ip, r1, lsl #1
.L61:
	sub	r3, r1, #3840
.L62:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L62
	cmp	r9, r0
	add	r1, r1, #2
	add	r0, r0, #1
	bne	.L61
	ldr	r3, [sp]
	add	r0, r9, #36
	add	r1, r0, r3
	add	r1, ip, r1, lsl #1
	add	ip, r9, #39
.L64:
	sub	r3, r1, #3840
.L65:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L65
	add	r0, r0, #1
	cmp	r0, ip
	add	r1, r3, #2
	bne	.L64
	ldr	r1, [sp]
	add	r3, r10, #13888
	add	r3, r3, #32
	sub	r0, r9, #4
	add	r1, r0, r1
	str	r3, [sp, #40]
	add	r1, r3, r1, lsl #1
	sub	ip, r9, #1
.L67:
	sub	r3, r1, #8128
	sub	r3, r3, #32
.L68:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L68
	add	r0, r0, #1
	cmp	r0, ip
	add	r1, r3, #2
	bne	.L67
	ldr	r3, [sp]
	add	r0, r9, #38
	add	r1, r0, r3
	ldr	r3, [sp, #40]
	str	r0, [sp, #44]
	add	r1, r3, r1, lsl #1
	add	ip, r9, #41
.L70:
	sub	r3, r1, #8128
	sub	r3, r3, #32
.L71:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L71
	add	r0, r0, #1
	cmp	r0, ip
	add	r1, r3, #2
	bne	.L70
	ldr	r3, [sp, #20]
	ldr	r1, [sp, #36]
	add	r3, r3, #13
	rsb	r3, r3, r3, lsl #4
	add	r0, r1, r3, lsl #4
	add	ip, r9, #6
	lsl	r3, r3, #4
	str	ip, [sp, #52]
	str	r3, [sp, #16]
	add	r0, r10, r0, lsl #2
	add	r6, r9, #30
.L73:
	mov	r1, r0
	mov	r3, #3
.L74:
	subs	r3, r3, #1
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L74
	add	ip, ip, #1
	cmp	ip, r6
	add	r0, r0, #2
	bne	.L73
	mov	r0, fp
	ldr	r3, [sp, #16]
	add	r3, r3, #240
	add	ip, r8, r3
	str	r3, [sp, #16]
	ldr	r3, [sp, #4]
	sub	r8, r3, #-2147483647
	add	ip, r10, ip, lsl #2
	lsl	r8, r8, #1
.L76:
	mov	r1, ip
	mov	r3, #3
.L77:
	subs	r3, r3, #1
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L77
	add	r0, r0, #1
	cmp	r0, r8
	add	ip, ip, #2
	bne	.L76
	mov	ip, r6
	ldr	r3, [sp, #4]
	add	r0, r3, #11
	ldr	r3, [sp, #16]
	ldr	r8, [sp, #44]
	add	r0, r0, r3
	add	r0, r10, r0, lsl #2
.L79:
	mov	r1, r0
	mov	r3, #3
.L80:
	subs	r3, r3, #1
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L80
	add	ip, ip, #1
	cmp	ip, r8
	add	r0, r0, #2
	bne	.L79
	mov	r0, r9
	ldr	r1, [sp]
	add	r3, r10, #18176
	add	r3, r3, #64
	add	r1, r9, r1
	str	r3, [sp, #48]
	add	r1, r3, r1, lsl #1
.L82:
	sub	r3, r1, #4800
.L83:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L83
	add	r0, r0, #1
	cmp	r0, r7
	add	r1, r3, #2
	bne	.L82
	ldr	r3, [sp]
	ldr	r0, [sp, #56]
	add	r1, r0, r3
	ldr	r3, [sp, #48]
	add	r1, r3, r1, lsl #1
.L84:
	sub	r3, r1, #4800
.L85:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L85
	add	r0, r0, #1
	cmp	r0, lr
	add	r1, r3, #2
	bne	.L84
	ldr	r3, [sp]
	add	ip, r9, #12
	add	r1, r10, #16640
	add	r0, ip, r3
	add	r1, r1, #160
	add	r0, r1, r0, lsl #1
	add	lr, r9, #15
.L87:
	sub	r3, r0, #4288
	sub	r3, r3, #32
.L88:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L88
	add	ip, ip, #1
	cmp	ip, lr
	add	r0, r3, #2
	bne	.L87
	ldr	r3, [sp]
	add	r0, r9, #20
	add	r3, r0, r3
	add	r1, r1, r3, lsl #1
	add	ip, r9, #23
.L90:
	sub	r3, r1, #4288
	sub	r3, r3, #32
.L91:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L91
	add	r0, r0, #1
	cmp	r0, ip
	add	r1, r3, #2
	bne	.L90
	ldr	r3, [sp, #24]
	add	r0, r3, #18176
	add	r0, r0, #64
	add	ip, r9, #2
	add	lr, r9, #5
.L93:
	mov	r3, #3
	add	r1, r0, ip, lsl #1
.L94:
	subs	r3, r3, #1
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L94
	add	ip, ip, #1
	cmp	ip, lr
	bne	.L93
	add	fp, r9, #32
	mov	ip, fp
	add	lr, r9, #35
	str	lr, [sp, #68]
.L96:
	mov	r3, #3
	add	r1, r0, ip, lsl #1
.L97:
	subs	r3, r3, #1
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L97
	add	ip, ip, #1
	cmp	ip, lr
	bne	.L96
	add	r8, r9, #4
	mov	ip, r8
	ldr	r3, [sp, #20]
	ldr	r1, [sp, #32]
	add	r3, r3, #20
	rsb	r3, r3, r3, lsl #4
	add	r0, r1, r3, lsl #4
	lsl	r3, r3, #4
	str	r3, [sp, #16]
	add	r0, r10, r0, lsl #2
.L99:
	mov	r1, r0
	mov	r3, #3
.L100:
	subs	r3, r3, #1
	strh	r2, [r1]	@ movhi
	add	r1, r1, #480
	bne	.L100
	add	ip, ip, #1
	cmp	ip, fp
	add	r0, r0, #2
	bne	.L99
	ldr	r2, [sp]
	add	r3, r9, #8
	mov	r1, r3
	str	r3, [sp, #60]
	add	r3, r3, r2
	add	r2, r10, #5760
	add	r2, r2, r3, lsl #1
	add	r7, r9, #24
.L103:
	sub	r3, r2, #4800
.L102:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L102
	add	r1, r1, #1
	cmp	r1, r7
	add	r2, r2, #2
	bne	.L103
	ldr	r3, [sp]
	ldr	r1, [sp, #52]
	add	r2, r1, r3
	add	r3, r10, #7680
	add	r2, r3, r2, lsl #1
	add	r0, r9, #9
.L104:
	sub	r3, r2, #2880
.L105:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L105
	add	r1, r1, #1
	cmp	r0, r1
	add	r2, r2, #2
	bne	.L104
	str	fp, [sp, #64]
	ldr	r3, .L223+24
	ldr	r0, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	fp, r0
	mov	ip, r1
	mov	r2, #0
	str	fp, [sp, #8]
	str	ip, [sp, #12]
	ldr	r3, .L223+12
	ldr	ip, .L223+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L223+48
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #16]
	sub	r3, r3, #3360
	lsl	r1, r0, #1
	add	r3, r3, r0
	ldr	fp, [sp, #64]
	add	r0, r10, r3, lsl #2
	add	ip, r1, #6
.L107:
	mov	r2, r0
	mov	r3, #3
.L108:
	subs	r3, r3, #1
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L108
	add	r1, r1, #1
	cmp	ip, r1
	add	r0, r0, #2
	bne	.L107
	ldr	r1, [sp, #4]
	mov	r0, r7
	add	ip, r1, #8
	mov	r1, r7
	ldr	r2, [sp]
	add	r3, r10, #7168
	add	r3, r3, #32
	add	r2, r7, r2
	add	r2, r3, r2, lsl #1
	add	lr, r9, #27
.L110:
	sub	r3, r2, #2400
.L111:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L111
	add	r1, r1, #1
	cmp	lr, r1
	add	r2, r2, #2
	bne	.L110
	ldr	r3, [sp, #16]
	sub	r1, r3, #3120
	add	r1, r1, ip
	add	r1, r10, r1, lsl #2
.L113:
	mov	r2, r1
	mov	r3, #3
.L114:
	subs	r3, r3, #1
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L114
	add	r0, r0, #1
	cmp	r0, fp
	add	r1, r1, #2
	bne	.L113
	mov	r1, r6
	ldr	r3, [sp]
	add	r2, r10, #9088
	add	r2, r2, #32
	add	r3, r6, r3
	add	r2, r2, r3, lsl #1
	add	r0, r9, #33
.L116:
	sub	r3, r2, #2400
.L117:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L117
	add	r1, r1, #1
	cmp	r0, r1
	add	r2, r3, #2
	bne	.L116
	ldr	ip, .L223+44
	mov	r2, #0
	ldr	r3, .L223+16
	add	r1, sp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	r3, .L223+48
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #16]
	sub	r3, r3, #2880
	lsl	r1, r0, #1
	add	r3, r3, r0
	add	r0, r10, r3, lsl #2
	add	ip, r1, #8
.L119:
	mov	r2, r0
	mov	r3, #3
.L120:
	subs	r3, r3, #1
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L120
	add	r1, r1, #1
	cmp	ip, r1
	add	r0, r0, #2
	bne	.L119
	ldr	r3, [sp]
	add	r1, r9, #26
	add	r3, r1, r3
	add	r2, r10, #11520
	str	r1, [sp, #64]
	add	r2, r2, r3, lsl #1
.L121:
	sub	r3, r2, #3840
.L122:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L122
	add	r1, r1, #1
	cmp	r6, r1
	add	r2, r2, #2
	bne	.L121
	ldr	r2, [sp]
	add	r3, r10, #12480
	add	r2, r7, r2
	str	r3, [sp, #4]
	add	r2, r3, r2, lsl #1
	add	fp, r9, #28
.L124:
	sub	r3, r2, #1920
.L125:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L125
	add	r7, r7, #1
	cmp	fp, r7
	add	r2, r2, #2
	bne	.L124
	ldr	r3, [sp]
	ldr	r1, [sp, #56]
	add	r2, r1, r3
	ldr	r3, [sp, #40]
	ldr	r0, [sp, #44]
	add	r2, r3, r2, lsl #1
.L128:
	sub	r3, r2, #2400
.L127:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L127
	add	r1, r1, #1
	cmp	r0, r1
	add	r2, r2, #2
	bne	.L128
	mov	r1, r8
	mov	ip, r8
	ldr	r3, [sp, #24]
	add	r0, r9, #7
	add	lr, r3, #6720
.L129:
	mov	r3, #3
	add	r2, lr, ip, lsl #1
.L130:
	subs	r3, r3, #1
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L130
	add	ip, ip, #1
	cmp	r0, ip
	bne	.L129
	mov	ip, r8
	ldr	r3, [sp]
	add	r2, r10, #10048
	add	r2, r2, #32
	add	r3, r8, r3
	add	r2, r2, r3, lsl #1
.L133:
	sub	r3, r2, #2400
.L132:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L132
	add	ip, ip, #1
	cmp	r0, ip
	add	r2, r2, #2
	bne	.L133
	ldr	r3, [sp, #24]
	ldr	ip, [sp, #60]
	add	r0, r3, #9600
.L134:
	mov	r3, #3
	add	r2, r0, r1, lsl #1
.L135:
	subs	r3, r3, #1
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L135
	add	r1, r1, #1
	cmp	ip, r1
	bne	.L134
	adr	r3, .L223
	ldmia	r3, {r2-r3}
	ldr	ip, .L223+32
	add	r1, sp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	r3, .L223+48
	mov	lr, pc
	bx	r3
	lsl	r1, r0, #1
	mov	ip, r1
	ldr	r3, [sp, #16]
	sub	r3, r3, #2160
	add	r3, r3, r0
	add	r0, r10, r3, lsl #2
	add	lr, r1, #6
.L137:
	mov	r2, r0
	mov	r3, #3
.L138:
	subs	r3, r3, #1
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L138
	add	ip, ip, #1
	cmp	lr, ip
	add	r0, r0, #2
	bne	.L137
	ldr	r0, [sp, #52]
	ldr	r3, [sp]
	ldr	r2, [sp, #4]
	add	r3, r0, r3
	add	r8, r2, r3, lsl #1
	mov	r2, r0
	ldr	ip, [sp, #60]
.L139:
	sub	r3, r8, #2880
.L140:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r8, r3
	bne	.L140
	add	r2, r2, #1
	cmp	ip, r2
	add	r8, r8, #2
	bne	.L139
	ldr	r3, [sp, #16]
	sub	ip, r3, #1920
	ldr	r3, [sp, #36]
	add	ip, ip, r3
	add	ip, r10, ip, lsl #2
.L143:
	mov	r2, ip
	mov	r3, #3
.L142:
	subs	r3, r3, #1
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L142
	add	r0, r0, #1
	cmp	r6, r0
	add	ip, ip, #2
	bne	.L143
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #32]
	sub	r3, r3, #1680
	add	r3, r3, r2
	add	r3, r10, r3, lsl #2
	mov	r2, #2
	b	.L144
.L224:
	.align	3
.L223:
	.word	1717986918
	.word	1074816614
	.word	.LANCHOR0
	.word	1074528256
	.word	1076297728
	.word	1074003968
	.word	__aeabi_i2d
	.word	1076822016
	.word	__aeabi_dsub
	.word	1071644672
	.word	1076690944
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
.L169:
	mov	r2, #1
.L144:
	cmp	r2, #1
	add	r2, r3, #480
	strh	r4, [r3]	@ movhi
	strh	r4, [r2]	@ movhi
	add	r3, r3, #2
	bne	.L169
	ldr	r3, [sp]
	add	r2, r1, r3
	add	r3, r10, #10560
	add	r2, r3, r2, lsl #1
	add	r0, r1, #3
.L145:
	sub	r3, r2, #2880
.L146:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L146
	add	r1, r1, #1
	cmp	r0, r1
	add	r2, r2, #2
	bne	.L145
	ldr	ip, .L223+32
	mov	r2, #0
	ldr	r3, .L223+20
	add	r1, sp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	r4, .L223+48
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L223+24
	ldr	r0, [sp, #20]
	str	r3, [sp, #20]
	mov	lr, pc
	bx	r2
	mov	r2, #0
	ldr	r3, .L223+28
	ldr	ip, .L223+44
	mov	r7, r0
	mov	r8, r1
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r4
	ldr	r3, [sp, #20]
	lsl	r4, r3, #1
	mov	r1, r4
	rsb	r0, r0, r0, lsl #4
	add	r3, r10, #2880
	add	r2, r4, r0, lsl #5
	str	r3, [sp, #4]
	add	r2, r3, r2, lsl #1
	add	r0, r4, #10
.L148:
	sub	r3, r2, #2880
.L149:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L149
	add	r1, r1, #1
	cmp	r0, r1
	add	r2, r2, #2
	bne	.L148
	mov	r2, #0
	ldr	ip, .L223+32
	ldr	r3, .L223+36
	add	r1, sp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	r3, .L223+48
	mov	lr, pc
	bx	r3
	mov	ip, r0
	mov	r2, #0
	mov	r0, r7
	mov	r1, r8
	ldr	r3, .L223+40
	mov	r8, ip
	ldr	ip, .L223+44
	mov	lr, pc
	bx	ip
	ldr	r3, .L223+48
	mov	lr, pc
	bx	r3
	mov	r7, r0
	rsb	r1, r0, r0, lsl #4
	add	r8, r8, r1, lsl #4
	add	r1, r10, #12
	add	r3, r10, r8, lsl #2
	add	r1, r1, r8, lsl #2
	lsl	r8, r0, #4
.L151:
	strh	r5, [r3]	@ movhi
	add	r2, r3, #480
	add	r3, r3, #2
	cmp	r1, r3
	strh	r5, [r2]	@ movhi
	bne	.L151
	ldr	r3, [sp, #16]
	sub	r1, r3, #480
	ldr	r3, [sp, #20]
	add	r1, r1, r3
	add	r1, r10, r1, lsl #2
	add	r0, r4, #6
.L152:
	mov	r2, r1
	mov	r3, #3
.L153:
	subs	r3, r3, #1
	strh	r5, [r2]	@ movhi
	add	r2, r2, #480
	bne	.L153
	add	r4, r4, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L152
	adr	r3, .L225
	ldmia	r3, {r2-r3}
	ldr	ip, .L225+8
	add	r1, sp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	r3, .L225+12
	mov	lr, pc
	bx	r3
	ldr	r1, [sp]
	ldr	r3, [sp, #28]
	add	r2, r10, #19200
	add	r3, r0, r3
	add	r0, r1, r0, lsl #1
	add	r1, r2, #56
	add	r1, r1, r3, lsl #2
	add	r2, r2, r0, lsl #1
.L155:
	sub	r3, r2, #2880
.L156:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L156
	add	r2, r2, #2
	cmp	r1, r2
	bne	.L155
	mov	r2, #0
	ldr	ip, .L225+16
	ldr	r3, .L225+20
	add	r1, sp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	r3, .L225+12
	mov	lr, pc
	bx	r3
	sub	r1, r8, r7
	ldr	r3, [sp, #4]
	lsl	r1, r1, #5
	add	r2, r1, r0, lsl #1
	lsl	r0, r0, #1
	add	r2, r3, r2, lsl #1
	add	ip, r0, #6
.L158:
	sub	r3, r2, #2880
.L159:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L159
	add	r0, r0, #1
	cmp	ip, r0
	add	r2, r2, #2
	bne	.L158
	ldr	r3, [sp, #4]
	add	r0, r9, #22
	add	r2, r1, r0
	add	r2, r3, r2, lsl #1
.L161:
	sub	r3, r2, #2880
.L162:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L162
	add	r0, r0, #1
	cmp	fp, r0
	add	r2, r2, #2
	bne	.L161
	ldr	r2, [sp, #64]
	ldr	r3, [sp, #4]
	add	r1, r1, r2
	add	r9, r3, r1, lsl #1
.L165:
	sub	r3, r9, #2880
.L164:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r9
	bne	.L164
	add	r2, r2, #1
	cmp	r6, r2
	add	r9, r3, #2
	bne	.L165
	ldr	r3, [sp]
	add	r2, r6, r3
	ldr	r3, [sp, #48]
	ldr	r1, [sp, #68]
	add	r2, r3, r2, lsl #1
.L166:
	sub	r3, r2, #3840
.L167:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L167
	add	r6, r6, #1
	cmp	r1, r6
	add	r2, r2, #2
	bne	.L166
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L226:
	.align	3
.L225:
	.word	3435973837
	.word	1073007820
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	__aeabi_dadd
	.word	1074528256
	.size	drawMushroom, .-drawMushroom
	.align	2
	.global	drawMouth
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMouth, %function
drawMouth:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, r0
	sub	sp, sp, #12
	ldrh	ip, [sp, #32]
	str	ip, [sp]
	mov	r6, r1
	bl	drawMushroom
	ldr	r2, .L235
	ldr	r3, .L235+4
	mov	r0, r5
	ldr	r4, [r2]
	ldr	r7, .L235+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L235+12
	mov	lr, pc
	bx	r7
	ldr	r3, .L235+16
	mov	lr, pc
	bx	r3
	mvn	ip, #32768
	rsb	r3, r6, r6, lsl #4
	lsl	r3, r3, #5
	add	r2, r4, #19968
	add	r3, r3, r0, lsl #1
	lsl	lr, r0, #1
	add	r2, r2, #192
	add	r2, r2, r3, lsl #1
	lsl	r0, r6, #4
	add	r1, lr, #8
.L228:
	sub	r3, r2, #1920
.L229:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L229
	add	lr, lr, #1
	cmp	lr, r1
	add	r2, r3, #2
	bne	.L228
	mov	r2, #31
	sub	r0, r0, r6
	add	r3, r6, #20
	add	r1, r5, #3
	rsb	r3, r3, r3, lsl #4
	add	r5, r5, r0, lsl #4
	add	r0, r4, #19200
	add	r3, r1, r3, lsl #4
	add	r0, r0, #20
	add	r3, r4, r3, lsl #2
	add	r0, r0, r5, lsl #2
.L231:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r0, r3
	strh	r2, [r1]	@ movhi
	bne	.L231
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L236:
	.align	2
.L235:
	.word	.LANCHOR0
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.word	1074003968
	.word	__aeabi_d2iz
	.size	drawMouth, .-drawMouth
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	lsl	r0, r0, #3
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L237
.L239:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L239
.L237:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
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
.L243:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L243
	mov	r2, #67108864
.L244:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L244
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
