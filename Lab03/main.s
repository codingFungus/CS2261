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
	.ascii	"Debugger Opened\000"
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L4
	mov	r4, #0
	strh	r1, [r2]	@ movhi
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r1, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r5, #1
	mov	ip, #20
	mvn	r2, #59904
	ldr	lr, .L4+16
	str	r4, [lr]
	ldr	lr, .L4+20
	ldr	r6, .L4+24
	str	r4, [lr]
	ldr	r9, .L4+28
	ldr	r8, .L4+32
	ldr	r10, .L4+36
	ldr	fp, .L4+40
	ldr	r7, .L4+44
	ldr	r1, .L4+48
	ldr	lr, .L4+52
	mov	r0, r6
	ldr	r3, .L4+56
	str	r4, [r9]
	str	r4, [r8]
	str	r5, [r10]
	str	r5, [fp]
	str	ip, [lr]
	str	ip, [r7]
	strh	r2, [r1]	@ movhi
	mov	lr, pc
	bx	r3
	mov	ip, #992
	mvn	r2, #59904
	ldr	r1, .L4+48
	ldr	r0, .L4+60
	strh	r4, [r1]	@ movhi
	ldr	lr, .L4+64
	ldr	r1, .L4+68
	strh	r6, [lr]	@ movhi
	strh	r2, [r0]	@ movhi
	ldr	lr, .L4+72
	ldr	r2, .L4+76
	strh	ip, [r1]	@ movhi
	ldr	r4, .L4+80
	ldr	r1, .L4+84
	mov	r0, r6
	ldr	r3, .L4+56
	strh	r4, [r2]	@ movhi
	strh	r1, [lr]	@ movhi
	mov	lr, pc
	bx	r3
	mov	lr, #113
	mov	r3, #30
	mov	ip, #15
	mov	r0, #73
	mov	r1, #180
	mov	r2, #100
	str	r5, [fp]
	str	r5, [r10]
	str	lr, [r9]
	str	lr, [r8]
	ldr	r4, .L4+88
	ldr	r6, .L4+92
	ldr	r10, .L4+96
	ldr	r5, .L4+100
	ldr	r9, .L4+104
	ldr	r8, .L4+108
	ldr	fp, .L4+52
	ldr	lr, .L4+16
	str	ip, [r7]
	str	ip, [fp]
	ldr	r7, .L4+112
	ldr	fp, .L4+116
	str	r0, [lr]
	str	r3, [r4]
	ldr	lr, .L4+20
	str	r3, [r6]
	str	r3, [r10]
	str	r3, [r5]
	str	r3, [r9]
	str	r3, [r8]
	ldr	ip, .L4+120
	ldr	r3, .L4+124
	str	r0, [lr]
	str	r1, [r3]
	str	r1, [r7]
	str	r2, [fp]
	str	r2, [ip]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf_level
	.word	pY
	.word	pOldY
	.word	32767
	.word	pX
	.word	pOldX
	.word	pXVel
	.word	pYVel
	.word	pHeight
	.word	pColor
	.word	pWidth
	.word	fillScreen
	.word	r3Color
	.word	bgColor
	.word	r1Color
	.word	r4Color
	.word	r2Color
	.word	22707
	.word	32736
	.word	rHeight
	.word	rWidth
	.word	r1Y
	.word	r1X
	.word	r2Y
	.word	r4X
	.word	r3X
	.word	r3Y
	.word	r4Y
	.word	r2X
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Player has moved\000"
	.align	2
.LC2:
	.ascii	"%s\000"
	.align	2
.LC3:
	.ascii	"Current Position: (%d, %d)\000"
	.text
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
	ldr	r3, .L41
	ldrh	r3, [r3]
	tst	r3, #1
	sub	sp, sp, #20
	beq	.L7
	ldr	r2, .L41+4
	ldrh	r2, [r2, #48]
	tst	r2, #1
	bne	.L7
.L8:
	ldr	r3, .L41+8
	ldr	r1, .L41+12
	ldrh	r2, [r3]
	cmp	r2, r1
	moveq	r2, #0
	mvn	r1, #64512
	strheq	r2, [r3]	@ movhi
	beq	.L9
	cmp	r2, #0
	strheq	r1, [r3]	@ movhi
.L9:
	ldr	r3, .L41+4
	ldr	r5, .L41+16
	ldrh	r3, [r3, #48]
	ldr	r0, [r5]
	lsr	r3, r3, #5
	eor	r3, r3, #1
	cmp	r0, #0
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	ldrne	r3, .L41+20
	ldr	r7, .L41+24
	ldrne	r3, [r3]
	str	r0, [r7]
	subne	r0, r0, r3
	ldr	r3, .L41+4
	ldr	r4, .L41+28
	ldrh	r3, [r3, #48]
	ldr	r1, [r4]
	ldr	r6, .L41+32
	ldr	r9, .L41+36
	strne	r0, [r5]
	tst	r3, #16
	str	r1, [r6]
	ldr	r3, [r9]
	bne	.L12
	add	r2, r3, r0
	cmp	r2, #239
	ldrle	r2, .L41+20
	ldrle	r2, [r2]
	addle	r0, r0, r2
	strle	r0, [r5]
.L12:
	ldr	r2, .L41+4
	ldrh	r2, [r2, #48]
	tst	r2, #128
	ldr	r2, .L41+40
	ldr	r2, [r2]
	bne	.L13
	add	ip, r1, r2
	cmp	ip, #159
	ldrle	ip, .L41+44
	ldrle	ip, [ip]
	addle	r1, r1, ip
	strle	r1, [r4]
.L13:
	ldr	ip, .L41+4
	ldrh	ip, [ip, #48]
	tst	ip, #64
	bne	.L14
	cmp	r1, #0
	ldrgt	ip, .L41+44
	ldrgt	ip, [ip]
	subgt	r1, r1, ip
	strgt	r1, [r4]
.L14:
	cmp	r0, #0
	movlt	ip, #0
	movlt	r0, ip
	strlt	ip, [r5]
	add	ip, r3, r0
	cmp	ip, #239
	rsbgt	r0, r3, #240
	strgt	r0, [r5]
	cmp	r1, #0
	movlt	ip, #0
	movlt	r1, ip
	ldr	fp, .L41+48
	strlt	ip, [r4]
	add	ip, r2, r1
	cmp	ip, #159
	ldr	r8, [fp]
	ldr	r10, .L41+52
	ldr	lr, .L41+56
	ldr	ip, .L41+60
	ldr	lr, [lr]
	ldr	ip, [ip]
	str	r8, [sp, #12]
	ldr	r8, [r10]
	rsbgt	r1, r2, #160
	str	r8, [sp, #8]
	str	lr, [sp, #4]
	str	ip, [sp]
	ldr	r8, .L41+64
	strgt	r1, [r4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L19
	ldr	r2, .L41+68
	ldr	r3, .L41+8
	ldrh	r2, [r2]
	strh	r2, [r3]	@ movhi
.L20:
	ldr	r2, [r6]
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L23
	ldr	r2, [r7]
	ldr	r3, [r5]
	cmp	r2, r3
	beq	.L6
.L23:
	mov	r0, #4
	ldr	r2, .L41+72
	ldr	r1, .L41+76
	ldr	r3, .L41+80
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, [r5]
	ldr	r0, .L41+84
	ldr	r3, .L41+88
	mov	lr, pc
	bx	r3
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	tst	r3, #2
	beq	.L9
	ldr	r3, .L41+4
	ldrh	r3, [r3, #48]
	tst	r3, #2
	bne	.L9
	b	.L8
.L19:
	ldr	r2, .L41+92
	ldr	r3, .L41+96
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r2, [fp]
	ldr	r3, [r10]
	str	r0, [sp, #4]
	str	r1, [sp]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, .L41+40
	ldr	r3, [r9]
	ldr	r2, [r2]
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L21
	ldr	r2, .L41+100
	ldr	r3, .L41+8
	ldrh	r2, [r2]
	strh	r2, [r3]	@ movhi
	b	.L20
.L21:
	ldr	r2, .L41+104
	ldr	r3, .L41+108
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r2, [fp]
	ldr	r3, [r10]
	str	r0, [sp, #4]
	str	r1, [sp]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, .L41+40
	ldr	r3, [r9]
	ldr	r2, [r2]
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L22
	ldr	r2, .L41+112
	ldr	r3, .L41+8
	ldrh	r2, [r2]
	strh	r2, [r3]	@ movhi
	b	.L20
.L22:
	ldr	r2, [fp]
	ldr	r3, [r10]
	ldr	r0, .L41+116
	ldr	r1, .L41+120
	ldr	r0, [r0]
	ldr	r1, [r1]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, .L41+40
	ldr	r3, [r9]
	ldr	r2, [r2]
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r0, [r5]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r2, .L41+124
	ldrne	r3, .L41+8
	ldrhne	r2, [r2]
	strhne	r2, [r3]	@ movhi
	b	.L20
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	67109120
	.word	pColor
	.word	1023
	.word	pX
	.word	pXVel
	.word	pOldX
	.word	pY
	.word	pOldY
	.word	pWidth
	.word	pHeight
	.word	pYVel
	.word	rWidth
	.word	rHeight
	.word	r1Y
	.word	r1X
	.word	collision
	.word	r1Color
	.word	.LC1
	.word	.LC2
	.word	mgba_printf_level
	.word	.LC3
	.word	mgba_printf
	.word	r2Y
	.word	r2X
	.word	r2Color
	.word	r3Y
	.word	r3X
	.word	r3Color
	.word	r4Y
	.word	r4X
	.word	r4Color
	.size	update, .-update
	.align	2
	.global	canMoveLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveLeft, %function
canMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L44
	ldr	r0, [r3]
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L45:
	.align	2
.L44:
	.word	pX
	.size	canMoveLeft, .-canMoveLeft
	.align	2
	.global	canMoveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveRight, %function
canMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L47
	ldr	r3, .L47+4
	ldr	r0, [r2]
	ldr	r3, [r3]
	add	r0, r0, r3
	cmp	r0, #239
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L48:
	.align	2
.L47:
	.word	pX
	.word	pWidth
	.size	canMoveRight, .-canMoveRight
	.align	2
	.global	canMoveDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveDown, %function
canMoveDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L50
	ldr	r3, .L50+4
	ldr	r0, [r2]
	ldr	r3, [r3]
	add	r0, r0, r3
	cmp	r0, #159
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L51:
	.align	2
.L50:
	.word	pY
	.word	pHeight
	.size	canMoveDown, .-canMoveDown
	.align	2
	.global	canMoveUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp, %function
canMoveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L53
	ldr	r0, [r3]
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L54:
	.align	2
.L53:
	.word	pY
	.size	canMoveUp, .-canMoveUp
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L59
	ldrh	r3, [r3, #48]
	ldr	r5, .L59+4
	ldr	r6, .L59+8
	tst	r3, #4
	ldr	r2, [r5]
	ldr	r3, [r6]
	sub	sp, sp, #8
	bne	.L56
	ldr	r1, .L59+12
	ldr	r8, .L59+16
	ldrh	r1, [r1]
	ldr	r7, .L59+20
	str	r1, [sp]
	ldr	r0, [r7]
	ldr	r1, [r8]
	ldr	r4, .L59+24
	mov	lr, pc
	bx	r4
	ldr	r10, .L59+28
	ldr	r9, .L59+32
.L57:
	ldr	r3, .L59+36
	ldrh	r3, [r3]
	ldr	r6, .L59+40
	str	r3, [sp]
	ldr	r5, .L59+44
	ldr	r1, .L59+48
	ldr	r0, .L59+52
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+56
	ldrh	r3, [r3]
	ldr	r1, .L59+60
	str	r3, [sp]
	ldr	r0, .L59+64
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+68
	ldrh	r3, [r3]
	ldr	r1, .L59+72
	str	r3, [sp]
	ldr	r0, .L59+76
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+80
	ldrh	ip, [r3]
	ldr	r2, [r5]
	ldr	r3, [r6]
	ldr	r1, .L59+84
	str	ip, [sp]
	ldr	r0, .L59+88
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r2, [r8]
	ldr	r3, [r7]
	str	r2, [r10]
	str	r3, [r9]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L56:
	ldr	ip, .L59+92
	ldr	r10, .L59+28
	ldr	r9, .L59+32
	ldr	r1, [r10]
	ldr	r0, [r9]
	str	ip, [sp]
	ldr	r4, .L59+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+12
	ldr	r8, .L59+16
	ldrh	r1, [r3]
	ldr	r7, .L59+20
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r0, [r7]
	str	r1, [sp]
	ldr	r1, [r8]
	mov	lr, pc
	bx	r4
	b	.L57
.L60:
	.align	2
.L59:
	.word	67109120
	.word	pWidth
	.word	pHeight
	.word	pColor
	.word	pY
	.word	pX
	.word	drawRect
	.word	pOldY
	.word	pOldX
	.word	r1Color
	.word	rHeight
	.word	rWidth
	.word	r1Y
	.word	r1X
	.word	r2Color
	.word	r2Y
	.word	r2X
	.word	r3Color
	.word	r3Y
	.word	r3X
	.word	r4Color
	.word	r4Y
	.word	r4X
	.word	32767
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
	ldr	r3, .L64
	mov	lr, pc
	bx	r3
	ldr	r9, .L64+4
	ldr	r4, .L64+8
	ldr	r8, .L64+12
	ldr	r7, .L64+16
	ldr	r6, .L64+20
	ldr	r5, .L64+24
.L62:
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
	b	.L62
.L65:
	.align	2
.L64:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	pColor,2,2
	.comm	pWidth,4,4
	.comm	pHeight,4,4
	.comm	pXVel,4,4
	.comm	pYVel,4,4
	.comm	pOldX,4,4
	.comm	pOldY,4,4
	.comm	pX,4,4
	.comm	pY,4,4
	.comm	r4Color,2,2
	.comm	r4X,4,4
	.comm	r4Y,4,4
	.comm	r3Color,2,2
	.comm	r3X,4,4
	.comm	r3Y,4,4
	.comm	r2Color,2,2
	.comm	r2X,4,4
	.comm	r2Y,4,4
	.comm	r1Color,2,2
	.comm	r1X,4,4
	.comm	r1Y,4,4
	.comm	rWidth,4,4
	.comm	rHeight,4,4
	.comm	bgColor,2,2
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
