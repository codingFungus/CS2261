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
	.file	"dance.c"
	.text
	.align	2
	.global	initDancer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDancer, %function
initDancer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #100
	mov	r1, #64
	mov	ip, #50
	mov	r0, #1
	ldr	r3, .L4
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #20]
	str	r2, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	dancer
	.size	initDancer, .-initDancer
	.align	2
	.global	dance
	.syntax unified
	.arm
	.fpu softvfp
	.type	dance, %function
dance:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L9
	ldr	r3, [r2, #20]
	ldr	r1, .L9+4
	add	r3, r3, #1
	smull	ip, r0, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, r0, asr #2
	add	r1, r1, r1, lsl #2
	cmp	r3, r1, lsl #1
	push	{r4, lr}
	str	r3, [r2, #20]
	ldr	r3, [r2, #8]
	bne	.L7
	ldr	r1, .L9+8
	add	r0, r3, #1
	smull	r3, r1, r0, r1
	asr	r3, r0, #31
	add	r1, r1, r0
	rsb	r3, r3, r1, asr #3
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3
	str	r3, [r2, #8]
.L7:
	ldr	ip, [r2]
	lsl	ip, ip, #23
	lsr	ip, ip, #23
	mvn	ip, ip, lsl #18
	cmp	r3, #0
	add	r1, r3, #3
	movge	r1, r3
	mvn	ip, ip, lsr #18
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r3, r3, #3
	asr	r1, r1, #2
	rsbpl	r3, r0, #0
	add	r3, r3, r1, lsl #5
	ldr	r0, [r2, #12]
	ldr	r1, .L9+12
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	lsl	r3, r3, #3
	add	lr, r1, r0, lsl #3
	and	r3, r3, #1016
	lsl	r0, r0, #3
	strh	r3, [lr, #4]	@ movhi
	strh	r2, [r1, r0]	@ movhi
	strh	ip, [lr, #2]	@ movhi
	ldr	r4, .L9+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	dancer
	.word	1717986919
	.word	-2004318071
	.word	shadowOAM
	.word	DMANow
	.size	dance, .-dance
	.comm	dancer,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
