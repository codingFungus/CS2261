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
	.global	startInterruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	startInterruptHandler, %function
startInterruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L7
	ldrh	r1, [r3, #2]
	tst	r1, #4096
	strh	r2, [r3, #8]	@ movhi
	movne	r2, #1
	mov	r1, #1
	ldrne	r3, .L7+4
	strne	r2, [r3]
	ldr	r3, .L7
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L8:
	.align	2
.L7:
	.word	67109376
	.word	switchToDance
	.size	startInterruptHandler, .-startInterruptHandler
	.align	2
	.global	danceInterruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	danceInterruptHandler, %function
danceInterruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L20
	ldrh	r1, [r3, #2]
	tst	r1, #4096
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L10
	ldr	r2, .L20+4
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r2]
.L10:
	ldr	r3, .L20
	ldrh	r3, [r3, #2]
	tst	r3, #1
	bne	.L19
.L11:
	mov	r1, #1
	ldr	r3, .L20
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r3, .L20+8
	mov	lr, pc
	bx	r3
	b	.L11
.L21:
	.align	2
.L20:
	.word	67109376
	.word	paused
	.word	dance
	.size	danceInterruptHandler, .-danceInterruptHandler
	.align	2
	.global	setupStartInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupStartInterrupts, %function
setupStartInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4096
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	r3, .L24
	ldr	r0, .L24+4
	strh	r1, [r3]	@ movhi
	ldr	ip, .L24+8
	ldr	r2, .L24+12
	ldr	r1, .L24+16
	strh	lr, [r3, #8]	@ movhi
	str	ip, [r0, #4092]
	ldr	lr, [sp], #4
	strh	r1, [r2, #50]	@ movhi
	bx	lr
.L25:
	.align	2
.L24:
	.word	67109376
	.word	50360320
	.word	startInterruptHandler
	.word	67109120
	.word	16392
	.size	setupStartInterrupts, .-setupStartInterrupts
	.align	2
	.global	setupDanceInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupDanceInterrupts, %function
setupDanceInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	str	lr, [sp, #-4]!
	mov	ip, #67108864
	mov	lr, #8
	ldr	r3, .L28
	ldr	r1, .L28+4
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L28+8
	ldr	r3, .L28+12
	ldr	r2, .L28+16
	strh	lr, [ip, #4]	@ movhi
	strh	r0, [r1, #50]	@ movhi
	ldr	lr, [sp], #4
	str	r2, [r3, #4092]
	bx	lr
.L29:
	.align	2
.L28:
	.word	67109376
	.word	67109120
	.word	16388
	.word	50360320
	.word	danceInterruptHandler
	.size	setupDanceInterrupts, .-setupDanceInterrupts
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L32
	push	{r4, lr}
	ldr	r3, .L32+4
	ldr	r4, .L32+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L32+12
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	mov	r3, #1104
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L32+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L32+24
	ldr	r1, .L32+28
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L32+32
	mov	lr, pc
	bx	r4
	mov	r1, #4096
	mov	lr, #1
	ldr	r3, .L32+36
	ldr	r0, .L32+40
	strh	r1, [r3]	@ movhi
	ldr	ip, .L32+44
	ldr	r2, .L32+48
	ldr	r1, .L32+52
	strh	lr, [r3, #8]	@ movhi
	str	ip, [r0, #4092]
	pop	{r4, lr}
	strh	r1, [r2, #50]	@ movhi
	bx	lr
.L33:
	.align	2
.L32:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	initDancer
	.word	startTiles
	.word	100720640
	.word	startMap
	.word	startPal
	.word	67109376
	.word	50360320
	.word	startInterruptHandler
	.word	67109120
	.word	16392
	.size	goToStart, .-goToStart
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
	mov	r1, #7168
	mov	r2, #4352
	push	{r4, r5, r6, lr}
	mov	r4, #0
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L36
	mov	lr, pc
	bx	r2
	ldr	lr, .L36+4
	ldr	ip, .L36+8
	ldr	r5, .L36+12
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L36+16
	ldr	r1, .L36+20
	str	r4, [lr]
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #32
	mov	r0, #3
	ldr	r2, .L36+24
	ldr	r1, .L36+28
	mov	lr, pc
	bx	r5
	ldr	r3, .L36+32
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	b	goToStart
.L37:
	.align	2
.L36:
	.word	mgba_open
	.word	switchToStart
	.word	switchToDance
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	paused
	.size	initialize, .-initialize
	.align	2
	.global	goToDance
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToDance, %function
goToDance:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	ip, .L40
	ldr	r5, .L40+4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L40+8
	ldr	r1, .L40+12
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L40+16
	ldr	r1, .L40+20
	mov	lr, pc
	bx	r5
	mov	r3, #512
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L40+24
	mov	lr, pc
	bx	r5
	mov	lr, #8
	mov	ip, #67108864
	ldr	r3, .L40+28
	ldr	r1, .L40+32
	strh	r4, [r3]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	ldr	r0, .L40+36
	ldr	r2, .L40+40
	ldr	r3, .L40+44
	strh	lr, [ip, #4]	@ movhi
	strh	r0, [r1, #50]	@ movhi
	pop	{r4, r5, r6, lr}
	str	r3, [r2, #4092]
	bx	lr
.L41:
	.align	2
.L40:
	.word	state
	.word	DMANow
	.word	5936
	.word	danceBGTiles
	.word	100720640
	.word	danceBGMap
	.word	danceBGPal
	.word	67109376
	.word	67109120
	.word	16388
	.word	50360320
	.word	danceInterruptHandler
	.size	goToDance, .-goToDance
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
	ldr	r3, .L51
	mov	lr, pc
	bx	r3
	mov	r8, #0
	ldr	r5, .L51+4
	ldr	r7, .L51+8
	ldr	r6, .L51+12
	ldr	r9, .L51+16
	b	.L45
.L50:
	mov	lr, pc
	bx	r7
	str	r8, [r5]
.L44:
	.syntax divided
@ 65 "main.c" 1
	swi 0x04 << 15
@ 0 "" 2
	.arm
	.syntax unified
.L45:
	ldr	r4, [r5]
	cmp	r4, #0
	bne	.L50
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L44
	mov	lr, pc
	bx	r9
	str	r4, [r6]
	b	.L44
.L52:
	.align	2
.L51:
	.word	initialize
	.word	switchToDance
	.word	goToDance
	.word	switchToStart
	.word	goToStart
	.size	main, .-main
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.comm	waitingForVBlank,4,4
	.comm	paused,4,4
	.comm	vBlanks,4,4
	.comm	state,4,4
	.comm	switchToDance,4,4
	.comm	switchToStart,4,4
	.comm	dancer,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
