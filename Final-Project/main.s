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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7168
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L4
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #2048
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+20
	mov	r3, #16
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+36
	ldr	r2, .L4+40
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	100720640
	.word	startscreenMap
	.word	13296
	.word	startscreenTiles
	.word	startscreenPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	seed
	.word	state
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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r0, #4352
	mov	r1, #23552
	mov	r2, #0
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r0, .L8+8
	ldr	r1, .L8+12
	ldrh	r0, [r0, #48]
	ldr	r3, .L8+16
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	goToStart
.L9:
	.align	2
.L8:
	.word	mgba_open
	.word	hideSprites
	.word	67109120
	.word	buttons
	.word	.LANCHOR0
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction.part.0, %function
instruction.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	instruction.part.0, .-instruction.part.0
	.set	win.part.0,instruction.part.0
	.set	lose.part.0,instruction.part.0
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #23552
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	ldr	r2, .L16
	mov	lr, pc
	bx	r2
	ldr	r4, .L16+4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+8
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #14592
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L16+24
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	ldr	r2, .L16+32
	mov	r3, #16
	mov	r0, #3
	ldr	r1, .L16+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+40
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	DMANow
	.word	100720640
	.word	bg_tryMap
	.word	bg_tryTiles
	.word	bg_tryPal
	.word	100728832
	.word	catSpritesheetTiles
	.word	83886592
	.word	catSpritesheetPal
	.word	hideSprites
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #7168
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L20
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #1024
	ldr	r2, .L20+4
	ldr	r1, .L20+8
	mov	lr, pc
	bx	r4
	mov	r3, #1008
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L20+12
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+16
	mov	r3, #16
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L20+28
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L20+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	100720640
	.word	instructionsMap
	.word	instructionsTiles
	.word	instructionsPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r1, .L34
	ldr	r4, .L34+4
	ldr	r3, [r1]
	ldrh	r2, [r4]
	add	r3, r3, #1
	tst	r2, #8
	str	r3, [r1]
	beq	.L23
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L32
.L23:
	tst	r2, #4
	beq	.L22
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L33
.L22:
	pop	{r4, lr}
	bx	lr
.L33:
	pop	{r4, lr}
	b	goToInstruction
.L32:
	bl	goToGame
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4]
	b	.L23
.L35:
	.align	2
.L34:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L38
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instruction.part.0
.L39:
	.align	2
.L38:
	.word	oldButtons
	.size	instruction, .-instruction
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"paused\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #256
	mov	r2, #23552
	push	{r4, lr}
	ldr	r0, .L42
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L42+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L42+8
	mov	r3, #9600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L42+16
	ldr	r1, .L42+20
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L42+24
	mov	r3, #16
	mov	lr, pc
	bx	r4
	ldr	r3, .L42+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L42+36
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L42+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LC0
	.word	mgba_printf
	.word	DMANow
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	pauseScreenPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L54
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
	ldr	r2, .L54+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L53
.L45:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L53:
	b	goToGame
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #512
	mov	r1, #23552
	ldr	r4, .L58
	strh	r5, [r2]	@ movhi
	mov	r3, #1024
	strh	r1, [r2, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L58+4
	ldr	r1, .L58+8
	mov	lr, pc
	bx	r4
	mov	r3, #528
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L58+12
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L58+16
	mov	r3, #16
	mov	lr, pc
	bx	r4
	ldr	r3, .L58+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L58+28
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L58+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	DMANow
	.word	100720640
	.word	losebgMap
	.word	losebgTiles
	.word	losebgPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	instruction
	.size	lose, .-lose
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #512
	mov	r1, #23552
	ldr	r4, .L63
	strh	r5, [r2]	@ movhi
	mov	r3, #1024
	strh	r1, [r2, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L63+4
	ldr	r1, .L63+8
	mov	lr, pc
	bx	r4
	mov	r3, #448
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L63+12
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L63+16
	mov	r3, #16
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L63+28
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L63+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L64:
	.align	2
.L63:
	.word	DMANow
	.word	100720640
	.word	winbgMap
	.word	winbgTiles
	.word	winbgPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L82
	ldr	r4, .L82+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L82+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L66
	ldr	r2, .L82+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L79
.L66:
	tst	r3, #1
	beq	.L67
	ldr	r2, .L82+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L80
.L67:
	tst	r3, #2
	beq	.L65
	ldr	r3, .L82+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L81
.L65:
	pop	{r4, lr}
	bx	lr
.L81:
	pop	{r4, lr}
	b	goToLose
.L79:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L66
.L80:
	bl	goToWin
	ldrh	r3, [r4]
	b	.L67
.L83:
	.align	2
.L82:
	.word	updatePlayer
	.word	oldButtons
	.word	drawPlayer
	.word	buttons
	.size	game, .-game
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	instruction
	.size	win, .-win
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
	mov	r3, #67108864
	ldr	r2, .L87
	push	{r4, lr}
	ldrh	r0, [r2]
	ldrh	r1, [r2, #4]
	strh	r0, [r3, #16]	@ movhi
	ldr	r2, .L87+4
	strh	r1, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r4, .L87+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L87+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	draw, .-draw
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"State: %d\000"
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
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	ldr	r6, .L109+4
	ldr	r5, .L109+8
	ldr	r4, .L109+12
	ldr	r10, .L109+16
	ldr	fp, .L109+20
	ldr	r7, .L109+24
	ldr	r9, .L109+28
	ldr	r8, .L109+32
.L98:
	ldrh	r3, [r5]
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r9, #48]
	mov	r0, r8
	ldr	r1, [r4]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r10
	ldr	r3, [r4]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L90
.L92:
	.word	.L97
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L91
.L91:
	ldrh	r3, [r6]
	tst	r3, #8
	ldrne	r3, .L109+36
	movne	lr, pc
	bxne	r3
.L90:
	mov	lr, pc
	bx	r7
	b	.L98
.L93:
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L90
	ldr	r3, .L109+40
	mov	lr, pc
	bx	r3
	b	.L90
.L94:
	ldr	r3, .L109+44
	mov	lr, pc
	bx	r3
	b	.L90
.L95:
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L90
	ldr	r3, .L109+48
	mov	lr, pc
	bx	r3
	b	.L90
.L97:
	mov	lr, pc
	bx	fp
	b	.L90
.L96:
	ldr	r3, .L109+52
	mov	lr, pc
	bx	r3
	b	.L90
.L110:
	.align	2
.L109:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	mgba_printf
	.word	start
	.word	draw
	.word	67109120
	.word	.LC1
	.word	lose.part.0
	.word	win.part.0
	.word	pause
	.word	instruction.part.0
	.word	game
	.size	main, .-main
	.comm	player,52,4
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
