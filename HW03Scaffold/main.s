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
	.ascii	"press START to begin\000"
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
	push	{r4, r5, r6, lr}
	mov	r0, #31744
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r1, #50
	mov	r4, #0
	ldr	ip, .L4+4
	ldr	r3, .L4+8
	ldr	r5, .L4+12
	mov	r0, r1
	ldr	r2, .L4+16
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+20
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	fillScreen
	.word	state
	.word	31775
	.word	drawString
	.word	.LC0
	.word	seed
	.size	goToStart, .-goToStart
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Score: \000"
	.align	2
.LC2:
	.ascii	"You only live once!\000"
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
	mov	r0, #0
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+4
	mov	r1, #5
	mov	r0, #140
	ldr	r3, .L8+8
	ldr	r2, .L8+12
	mov	lr, pc
	bx	r4
	mov	r1, #5
	ldr	r3, .L8+16
	mov	r0, r1
	ldr	r2, .L8+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	ip, #1
	ldr	r0, .L8+24
	ldr	r1, .L8+28
	ldr	r2, .L8+32
	str	ip, [r0]
	pop	{r4, lr}
	strh	r1, [r3, #104]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC1
	.word	32736
	.word	.LC2
	.word	state
	.word	17024
	.word	-30919
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
	ldr	r4, .L17
	ldr	r3, [r4]
	ldr	r2, .L17+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L17+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L10
	ldr	r3, .L17+12
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L16
.L10:
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r0, [r4]
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	seed
	.word	waitForVBlank
	.word	buttons
	.word	oldButtons
	.word	srand
	.word	initGame
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Pause\000"
	.align	2
.LC4:
	.ascii	"press SELECT to start again\000"
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
	push	{r4, lr}
	ldr	r0, .L21
	ldr	r3, .L21+4
	mov	lr, pc
	bx	r3
	mov	r1, #50
	ldr	r4, .L21+8
	mov	r0, r1
	mov	r3, #31744
	ldr	r2, .L21+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L21+16
	ldr	r2, .L21+20
	mov	r1, #70
	mov	r0, #50
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L21+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
	.word	15855
	.word	fillScreen
	.word	drawString
	.word	.LC3
	.word	32736
	.word	.LC4
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
	push	{r4, lr}
	ldr	r4, .L35
	ldr	r3, .L35+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	bne	.L24
	ldr	r2, .L35+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L33
.L24:
	tst	r3, #4
	bne	.L23
	ldr	r3, .L35+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L34
.L23:
	pop	{r4, lr}
	bx	lr
.L34:
	pop	{r4, lr}
	b	goToStart
.L33:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L24
.L36:
	.align	2
.L35:
	.word	buttons
	.word	waitForVBlank
	.word	oldButtons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"You Win!\000"
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
	push	{r4, lr}
	ldr	r0, .L39
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	mov	r1, #50
	ldr	r3, .L39+8
	mov	r0, r1
	ldr	r2, .L39+12
	ldr	r4, .L39+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	ip, #3
	ldr	r0, .L39+20
	ldr	r1, .L39+24
	ldr	r2, .L39+28
	str	ip, [r0]
	pop	{r4, lr}
	strh	r1, [r3, #104]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	bx	lr
.L40:
	.align	2
.L39:
	.word	31775
	.word	fillScreen
	.word	1023
	.word	.LC5
	.word	drawString
	.word	state
	.word	17024
	.word	-30783
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
	ldr	r3, .L48
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L41
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L47
.L41:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToStart
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	buttons
	.word	oldButtons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"You Lose, good luck next time\000"
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
	push	{r4, lr}
	ldr	r0, .L52
	ldr	r3, .L52+4
	mov	lr, pc
	bx	r3
	mov	r1, #50
	mov	r3, #0
	ldr	r2, .L52+8
	ldr	r4, .L52+12
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L52+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	15855
	.word	fillScreen
	.word	.LC6
	.word	drawString
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"%u\000"
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
	ldr	r4, .L65
	sub	sp, sp, #12
	ldr	r3, .L65+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L65+8
	ldr	r3, .L65+12
	ldr	r0, .L65+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, #8
	mov	r1, #5
	mov	r0, #180
	str	r2, [sp]
	ldr	r5, .L65+28
	mov	r2, #6
	mov	lr, pc
	bx	r5
	mov	r3, #31744
	mov	r1, #5
	mov	r0, #180
	ldr	r2, .L65+16
	ldr	r5, .L65+32
	mov	lr, pc
	bx	r5
	ldr	r3, .L65+36
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L55
	ldr	r3, .L65+40
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L62
.L55:
	ldr	r3, [r4]
	cmp	r3, #7
	beq	.L63
	ldr	r3, .L65+44
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bne	.L64
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L64:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L62:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToPause
.L63:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToWin
.L66:
	.align	2
.L65:
	.word	score
	.word	updateGame
	.word	.LC7
	.word	sprintf
	.word	buffer1
	.word	waitForVBlank
	.word	drawGame
	.word	drawRectangle
	.word	drawString
	.word	buttons
	.word	oldButtons
	.word	player
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
	ldr	lr, .L78
	ldr	r4, .L78+4
	strh	lr, [r3]	@ movhi
	strh	ip, [r3, #132]	@ movhi
	strh	r0, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	ldr	fp, .L78+8
	ldrh	r1, [r4, #48]
	ldr	r5, .L78+12
	ldr	r3, .L78+16
	strh	r1, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L78+20
	ldr	r10, .L78+24
	ldr	r9, .L78+28
	ldr	r8, .L78+32
	ldr	r7, .L78+36
.L68:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L69:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L69
.L71:
	.word	.L74
	.word	.L73
	.word	.L72
	.word	.L70
	.word	.L70
.L70:
	mov	lr, pc
	bx	r7
	b	.L68
.L72:
	mov	lr, pc
	bx	r8
	b	.L68
.L73:
	mov	lr, pc
	bx	r9
	b	.L68
.L74:
	mov	lr, pc
	bx	r10
	b	.L68
.L79:
	.align	2
.L78:
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
	ldr	lr, .L83
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r0, .L83+4
	strh	r1, [r3, #130]	@ movhi
	ldr	r1, .L83+8
	ldrh	r0, [r0, #48]
	ldr	r3, .L83+12
	ldr	lr, [sp], #4
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L84:
	.align	2
.L83:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.comm	buffer1,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
