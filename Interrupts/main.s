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
	mov	r1, #0
	ldr	r3, .L18
	ldrh	r2, [r3, #2]
	tst	r2, #1
	strh	r1, [r3, #8]	@ movhi
	bne	.L17
	ldr	r3, .L18
	ldrh	r3, [r3, #2]
	tst	r3, #4096
	movne	r2, #1
	ldrne	r3, .L18+4
	strne	r2, [r3]
	ldr	r2, .L18
	ldrh	r3, [r2, #2]
	strh	r3, [r2, #2]	@ movhi
	bx	lr
.L17:
	ldr	r0, .L18+8
	ldr	r3, [r0]
	ldr	ip, .L18+12
	add	r3, r3, #1
	mov	r2, #1
	push	{r4, lr}
	str	r3, [r0]
	ldr	r3, .L18+16
	mov	r0, #120
	str	r1, [ip]
	mov	lr, pc
	bx	r3
	ldr	r3, .L18
	ldrh	r3, [r3, #2]
	tst	r3, #4096
	movne	r2, #1
	ldrne	r3, .L18+4
	strne	r2, [r3]
	ldr	r2, .L18
	ldrh	r3, [r2, #2]
	pop	{r4, lr}
	strh	r3, [r2, #2]	@ movhi
	bx	lr
.L19:
	.align	2
.L18:
	.word	67109376
	.word	log
	.word	vBlanks
	.word	waitingForVBlank
	.word	setPixel4
	.size	interruptHandler, .-interruptHandler
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
	mov	r2, #1
	str	lr, [sp, #-4]!
	mov	ip, #67108864
	mov	lr, #8
	ldr	r3, .L22
	ldr	r1, .L22+4
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L22+8
	ldr	r3, .L22+12
	ldr	r2, .L22+16
	strh	lr, [ip, #4]	@ movhi
	strh	r0, [r1, #50]	@ movhi
	ldr	lr, [sp], #4
	str	r2, [r3, #4092]
	bx	lr
.L23:
	.align	2
.L22:
	.word	67109376
	.word	67109120
	.word	16392
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
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
	mov	r3, #83886080
	mov	r4, #67108864
	ldr	r1, .L26
	ldr	r2, .L26+4
	strh	r1, [r4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L26+8
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r0, #8
	mov	r2, #1
	ldr	r3, .L26+12
	ldr	ip, .L26+16
	str	r1, [r3]
	str	r1, [ip]
	ldr	r3, .L26+20
	strh	r0, [r4, #4]	@ movhi
	ldr	lr, .L26+24
	ldr	ip, .L26+28
	ldr	r1, .L26+32
	ldr	r0, .L26+36
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [ip, #50]	@ movhi
	str	r0, [r1, #4092]
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	1028
	.word	32272
	.word	mgba_open
	.word	vBlanks
	.word	log
	.word	67109376
	.word	16392
	.word	67109120
	.word	50360320
	.word	interruptHandler
	.size	initialize, .-initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"vBlanks: %d\000"
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
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	mov	r10, #0
	ldr	r8, .L38+4
	ldr	r5, .L38+8
	ldr	r6, .L38+12
	ldr	r9, .L38+16
	ldr	r4, .L38+20
	ldr	r7, .L38+24
	ldr	fp, .L38+28
.L31:
	ldrh	r3, [r5]
	strh	r3, [r8]	@ movhi
	ldr	r1, [r6]
	ldrh	r3, [r7, #48]
	cmp	r1, #0
	strh	r3, [r5]	@ movhi
	bne	.L37
.L29:
	mov	r3, #1
	str	r3, [r4]
.L30:
	.syntax divided
@ 31 "main.c" 1
	swi 0x04 << 15
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L30
	b	.L31
.L37:
	mov	r0, fp
	ldr	r1, [r9]
	ldr	r3, .L38+32
	mov	lr, pc
	bx	r3
	str	r10, [r6]
	b	.L29
.L39:
	.align	2
.L38:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	log
	.word	vBlanks
	.word	waitingForVBlank
	.word	67109120
	.word	.LC0
	.word	mgba_printf
	.size	main, .-main
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	waitingForVBlank,4,4
	.comm	log,4,4
	.comm	vBlanks,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
