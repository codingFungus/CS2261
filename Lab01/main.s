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
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	push	{r7, lr}
	mvn	ip, #32768
	mov	r4, #100663296
	mov	r7, #31
	mov	r2, #31744
	mov	lr, #992
	ldr	r3, .L7
	mov	r8, r3
	ldr	r0, .L7+4
	ldr	r5, .L7+8
	strh	r0, [r1]	@ movhi
	ldr	r6, .L7+12
	strh	r0, [r1]	@ movhi
	ldr	r1, .L7+16
	strh	ip, [r4]	@ movhi
	ldr	r0, .L7+20
	strh	r7, [r5, #192]	@ movhi
	ldr	r7, .L7+24
	strh	r2, [r6, #128]	@ movhi
	add	r4, r4, #48128
	strh	lr, [r1, #64]	@ movhi
	add	r5, r5, #48384
	add	r1, r1, #49152
	strh	r2, [r4, #112]	@ movhi
	add	r0, r0, #256
	strh	r2, [r5, #48]	@ movhi
	strh	r2, [r0, #-16]	@ movhi
	strh	r2, [r7, #176]	@ movhi
	strh	r2, [r1, #112]	@ movhi
	strh	r2, [r0, #-16]	@ movhi
	strh	r2, [r0, #-12]	@ movhi
	strh	r2, [r0, #-8]	@ movhi
	strh	r2, [r0, #-4]	@ movhi
	strh	r2, [r4, #124]	@ movhi
	strh	r2, [r5, #60]	@ movhi
	strh	r2, [r0, #-4]	@ movhi
	strh	r2, [r7, #188]	@ movhi
	strh	r2, [r1, #124]	@ movhi
	strh	r2, [r4, #132]	@ movhi
	strh	r2, [r4, #136]	@ movhi
	strh	r2, [r4, #140]	@ movhi
	strh	r2, [r4, #132]	@ movhi
	strh	r2, [r5, #68]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r2, [r7, #196]	@ movhi
	strh	r2, [r1, #132]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	r2, [r0, #12]	@ movhi
	strh	r2, [r1, #132]	@ movhi
	strh	r2, [r1, #136]	@ movhi
	strh	r2, [r1, #140]	@ movhi
	strh	lr, [r4, #148]	@ movhi
	ldr	r2, .L7+28
	strh	lr, [r5, #84]	@ movhi
	strh	lr, [r0, #20]	@ movhi
	strh	lr, [r7, #212]	@ movhi
	strh	lr, [r1, #148]	@ movhi
	strh	lr, [r1, #148]	@ movhi
	strh	lr, [r1, #152]	@ movhi
	strh	lr, [r1, #156]	@ movhi
	strh	lr, [r4, #164]	@ movhi
	strh	lr, [r5, #100]	@ movhi
	strh	lr, [r0, #36]	@ movhi
	strh	lr, [r7, #228]	@ movhi
	strh	lr, [r1, #164]	@ movhi
	strh	lr, [r1, #164]	@ movhi
	strh	lr, [r1, #168]	@ movhi
	strh	lr, [r1, #172]	@ movhi
	ldr	lr, .L7+32
	strh	ip, [r4, #180]	@ movhi
	add	r6, r6, #46592
	strh	ip, [r5, #116]	@ movhi
	strh	ip, [r0, #52]	@ movhi
	strh	ip, [r7, #244]	@ movhi
	strh	ip, [r1, #180]	@ movhi
	strh	ip, [r4, #180]	@ movhi
	strh	ip, [r4, #184]	@ movhi
	strh	ip, [r4, #188]	@ movhi
	strh	ip, [r4, #188]	@ movhi
	add	r4, r4, #1280
	strh	ip, [r5, #124]	@ movhi
	strh	ip, [r0, #60]	@ movhi
	strh	ip, [r7, #252]	@ movhi
	strh	ip, [r1, #188]	@ movhi
	strh	ip, [r1, #180]	@ movhi
	strh	ip, [r1, #184]	@ movhi
	strh	ip, [r1, #188]	@ movhi
	strh	r3, [r6, #16]	@ movhi
	ldr	ip, .L7+36
	strh	r3, [r5, #208]	@ movhi
	strh	r3, [r0, #144]	@ movhi
	strh	r3, [lr, #80]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	strh	r3, [lr, #88]	@ movhi
	strh	r3, [r2, #28]	@ movhi
	strh	r3, [r6, #32]	@ movhi
	strh	r3, [r5, #224]	@ movhi
	strh	r3, [r0, #160]	@ movhi
	strh	r3, [lr, #96]	@ movhi
	strh	r3, [r6, #40]	@ movhi
	strh	r3, [r5, #232]	@ movhi
	strh	r3, [r0, #168]	@ movhi
	strh	r3, [lr, #104]	@ movhi
	strh	r3, [r2, #40]	@ movhi
	strh	r3, [r6, #44]	@ movhi
	strh	r3, [r2, #44]	@ movhi
	strh	r3, [r6, #48]	@ movhi
	strh	r3, [r5, #240]	@ movhi
	strh	r3, [r0, #176]	@ movhi
	strh	r3, [lr, #112]	@ movhi
	strh	r3, [r2, #48]	@ movhi
	strh	r3, [r6, #56]	@ movhi
	strh	r3, [r5, #248]	@ movhi
	strh	r3, [r0, #184]	@ movhi
	strh	r3, [lr, #120]	@ movhi
	strh	r3, [r2, #56]	@ movhi
	strh	r3, [r6, #60]	@ movhi
	strh	r3, [r0, #188]	@ movhi
	strh	r3, [r6, #64]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r3, [lr, #128]	@ movhi
	strh	r3, [r2, #64]	@ movhi
	strh	r3, [r6, #72]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r0, #200]	@ movhi
	strh	r3, [lr, #136]	@ movhi
	strh	r3, [r2, #72]	@ movhi
	strh	r3, [r2, #76]	@ movhi
	strh	r3, [r6, #84]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	strh	r3, [r0, #212]	@ movhi
	strh	r3, [lr, #148]	@ movhi
	strh	r3, [r2, #84]	@ movhi
	strh	r3, [r6, #88]	@ movhi
	strh	r3, [r2, #88]	@ movhi
	strh	r3, [r4, #28]	@ movhi
	strh	r3, [r0, #220]	@ movhi
	strh	r3, [lr, #156]	@ movhi
	add	r1, r1, #2192
.L2:
	strh	r8, [r1], #4	@ movhi
	cmp	r1, ip
	bne	.L2
.L3:
	b	.L3
.L8:
	.align	2
.L7:
	.word	5471
	.word	1027
	.word	100664064
	.word	100665088
	.word	100666112
	.word	100713216
	.word	100714240
	.word	100715520
	.word	100714496
	.word	100717540
	.size	main, .-main
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #2
	add	r0, r0, #100663296
	strh	r2, [r0]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	drawHorizontalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r2, r2, r1
	bxmi	lr
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	add	r0, r1, #25165824
	add	r0, r0, #1
	add	r0, r0, r2
	lsl	r1, r1, #2
	lsl	r0, r0, #2
	add	r2, r1, #100663296
.L12:
	strh	r3, [r2], #4	@ movhi
	cmp	r2, r0
	bne	.L12
	bx	lr
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
	@ link register save eliminated.
	subs	r2, r2, r1
	bxmi	lr
	add	ip, r2, r1
	rsb	r2, r1, r1, lsl #4
	add	r1, r0, #25165824
	rsb	ip, ip, ip, lsl #4
	add	r2, r0, r2, lsl #4
	add	r1, r1, #240
	lsl	r2, r2, #2
	add	r1, r1, ip, lsl #4
	add	r2, r2, #100663296
	lsl	r1, r1, #2
.L16:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #960
	cmp	r2, r1
	bne	.L16
	bx	lr
	.size	drawVerticalLine, .-drawVerticalLine
	.comm	videoBuffer,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
