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
.LC2:
	.ascii	"fall 2023\000"
	.align	2
.LC1:
	.ascii	"GAME BOY\000"
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L7
	sub	sp, sp, #28
	ldr	r3, .L7+4
	mov	lr, pc
	bx	r3
	mov	r2, sp
	ldr	r1, .L7+8
	ldr	r3, .L7+12
	ldm	r1, {r0, r1}
	mov	r6, r2
	stm	r2, {r0, r1}
	ldm	r3, {r0, r1, r2, r3}
	add	lr, sp, #8
	mov	r5, lr
	mov	r4, #72
	mov	ip, #71
	stm	lr, {r0, r1, r2, r3}
	ldr	r7, .L7+16
	b	.L3
.L6:
	ldrb	ip, [r6, #1]!	@ zero_extendqisi2
.L3:
	mov	r0, r4
	mov	r2, ip
	mov	r1, #70
	ldrh	r3, [r5], #2
	add	r4, r4, #12
	mov	lr, pc
	bx	r7
	cmp	r4, #168
	bne	.L6
	mov	r1, #96
	mov	r0, #84
	ldr	r3, .L7+20
	ldr	r2, .L7+24
	ldr	r4, .L7+28
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L7+32
	ldr	r2, .L7+36
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	28274
	.word	fillScreen
	.word	.LC1
	.word	.LANCHOR0
	.word	drawChar
	.word	15855
	.word	.LC2
	.word	drawString
	.word	state
	.word	rSeed
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
	mov	r0, #128
	mov	r1, #2
	mvn	ip, #170
	mov	r2, #0
	str	lr, [sp, #-4]!
	ldr	lr, .L11
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r0, .L11+4
	strh	r1, [r3, #130]	@ movhi
	ldr	r1, .L11+8
	ldrh	r0, [r0, #48]
	ldr	r3, .L11+12
	ldr	lr, [sp], #4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L12:
	.align	2
.L11:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"score: \000"
	.text
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
	push	{r4, lr}
	ldr	r0, .L15
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L15+8
	ldr	r3, .L15+12
	ldr	r2, .L15+16
	mov	r1, #1
	mov	r0, #180
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L15+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L16:
	.align	2
.L15:
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	21951
	.word	.LC3
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r4, .L24
	ldr	r3, [r4]
	ldr	r2, .L24+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L24+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L17
	ldr	r3, .L24+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L23
.L17:
	pop	{r4, lr}
	bx	lr
.L23:
	ldr	r0, [r4]
	ldr	r3, .L24+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L24+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	rSeed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"got too stressed?\000"
	.align	2
.LC5:
	.ascii	"you're paused now!\000"
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L28
	ldr	r0, .L28+4
	ldr	r3, .L28+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L28+12
	mov	r3, r5
	mov	r1, #8
	mov	r0, #136
	ldr	r2, .L28+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L28+20
	mov	r1, #18
	mov	r0, #130
	mov	lr, pc
	bx	r4
	ldr	r3, .L28+24
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L28+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L29:
	.align	2
.L28:
	.word	26437
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC4
	.word	.LC5
	.word	waitForVBlank
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
	ldr	r3, .L42
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L31
	ldr	r2, .L42+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L40
.L31:
	tst	r3, #4
	beq	.L30
	ldr	r3, .L42+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L41
.L30:
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToGame
.L41:
	pop	{r4, lr}
	b	goToStart
.L43:
	.align	2
.L42:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"omg you won!!!\000"
	.align	2
.LC7:
	.ascii	"press start to play again\000"
	.text
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
	ldr	r5, .L46
	ldr	r0, .L46+4
	ldr	r3, .L46+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L46+12
	mov	r3, r5
	mov	r1, #8
	mov	r0, #154
	ldr	r2, .L46+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L46+20
	mov	r1, #18
	mov	r0, #88
	mov	lr, pc
	bx	r4
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L46+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L47:
	.align	2
.L46:
	.word	26437
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC6
	.word	.LC7
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
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
	ldr	r3, .L55
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
	ldr	r3, .L55+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
.L48:
	pop	{r4, lr}
	bx	lr
.L54:
	pop	{r4, lr}
	b	goToStart
.L56:
	.align	2
.L55:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"you lost :(\000"
	.align	2
.LC9:
	.ascii	"better luck next time <3\000"
	.align	2
.LC10:
	.ascii	"press start to try again\000"
	.text
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
	ldr	r5, .L59
	ldr	r0, .L59+4
	ldr	r3, .L59+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L59+12
	mov	r3, r5
	mov	r1, #8
	mov	r0, #172
	ldr	r2, .L59+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #18
	mov	r0, #94
	ldr	r2, .L59+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L59+24
	mov	r1, #28
	mov	r0, #94
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L59+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L60:
	.align	2
.L59:
	.word	26437
	.word	31676
	.word	fillScreen
	.word	drawString
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"%i\000"
	.text
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
	push	{r4, r5, lr}
	ldr	r4, .L72
	sub	sp, sp, #12
	ldr	r3, .L72+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L72+8
	ldr	r3, .L72+12
	ldr	r0, .L72+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L72+24
	mov	r3, #8
	mov	r1, #1
	mov	r0, #220
	str	r2, [sp]
	ldr	r5, .L72+28
	mov	r2, #6
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	r0, #220
	ldr	r3, .L72+32
	ldr	r2, .L72+16
	ldr	r5, .L72+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L72+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
	ldr	r3, .L72+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L62:
	ldr	r3, [r4]
	cmn	r3, #1
	beq	.L70
.L63:
	cmp	r3, #30
	beq	.L71
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L71:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToWin
.L70:
	bl	goToLose
	ldr	r3, [r4]
	b	.L63
.L69:
	bl	goToPause
	b	.L62
.L73:
	.align	2
.L72:
	.word	score
	.word	updateGame
	.word	.LC11
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	31676
	.word	drawRect
	.word	28274
	.word	drawString
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.size	game, .-game
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
	mov	r3, #67108864
	mov	ip, #128
	mvn	r0, #170
	mov	r1, #2
	mov	r2, #0
	push	{r4, r7, fp, lr}
	ldr	lr, .L85
	ldr	r4, .L85+4
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #132]	@ movhi
	strh	r0, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	ldr	fp, .L85+8
	ldrh	r1, [r4, #48]
	ldr	r5, .L85+12
	ldr	r3, .L85+16
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L85+20
	ldr	r10, .L85+24
	ldr	r9, .L85+28
	ldr	r8, .L85+32
	ldr	r7, .L85+36
.L75:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L76:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L76
.L78:
	.word	.L81
	.word	.L80
	.word	.L79
	.word	.L77
	.word	.L77
.L77:
	mov	lr, pc
	bx	r7
	b	.L75
.L79:
	mov	lr, pc
	bx	r8
	b	.L75
.L80:
	mov	lr, pc
	bx	r9
	b	.L75
.L81:
	mov	lr, pc
	bx	r10
	b	.L75
.L86:
	.align	2
.L85:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	win
	.size	main, .-main
	.text
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
	b	win
	.size	lose, .-lose
	.comm	rSeed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	buffer,41,4
	.comm	NOTES,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	31
	.short	511
	.short	1023
	.short	992
	.short	31744
	.short	32736
	.short	16896
	.short	31775
	.ident	"GCC: (devkitARM release 53) 9.1.0"
