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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L19
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L12:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L12
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ands	r6, r0, #1
	mov	ip, r0
	and	lr, r2, #1
	beq	.L51
	cmp	lr, #0
	beq	.L32
	cmp	r2, #1
	ble	.L33
	cmp	r3, #0
	ble	.L21
	mov	r4, #0
	ldr	lr, .L52
	add	r3, r1, r3
	sub	r2, r2, #1
	rsb	r0, r1, r1, lsl #4
	asr	r7, r2, #1
	rsb	r3, r3, r3, lsl #4
	ldr	r6, [lr]
	ldr	r5, [lr, #4]
	orr	r7, r7, #-2130706432
	add	lr, ip, r3, lsl #4
	add	r0, ip, r0, lsl #4
	add	r1, sp, #32
.L34:
	add	r3, r0, #1
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	add	r3, r6, r3
	str	r4, [r5, #44]
	add	r2, r0, r0, lsr #31
	str	r1, [r5, #36]
	str	r3, [r5, #40]
	str	r7, [r5, #44]
	bic	r3, r2, #1
	ldrb	ip, [sp, #32]	@ zero_extendqisi2
	ldrb	r2, [r6, r3]	@ zero_extendqisi2
	add	r0, r0, #240
	orr	r2, r2, ip, lsl #8
	cmp	lr, r0
	strh	r2, [r6, r3]	@ movhi
	bne	.L34
.L21:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L51:
	cmp	lr, #0
	bne	.L23
	cmp	r3, #0
	ble	.L21
	ldr	r0, .L52
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	r5, r2, #1
	rsb	r1, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	r6, [r0]
	ldr	r2, [r0, #4]
	orr	r5, r5, #-2130706432
	add	r0, ip, r1, lsl #4
	add	r4, ip, r3, lsl #4
	add	r1, sp, #32
.L25:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r4, r0
	str	lr, [r2, #44]
	str	r1, [r2, #36]
	str	r3, [r2, #40]
	str	r5, [r2, #44]
	bne	.L25
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L23:
	cmp	r2, #1
	ble	.L27
	cmp	r3, #0
	ble	.L21
	ldr	lr, .L52
	add	r7, r0, r2
	add	r3, r1, r3
	rsb	r0, r1, r1, lsl #4
	sub	r7, r7, #1
	rsb	r3, r3, r3, lsl #4
	ldr	r5, [lr]
	ldr	r4, [lr, #4]
	add	r0, ip, r0, lsl #4
	add	lr, ip, r3, lsl #4
	add	r1, sp, #32
	and	ip, r7, #1
	orr	r7, r2, #-2130706432
	sub	r2, r2, #1
.L30:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r3, r5, r3
	str	r6, [r4, #44]
	str	r1, [r4, #36]
	str	r3, [r4, #40]
	add	r3, r2, r0
	str	r7, [r4, #44]
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldrh	r9, [r5, r3]
	ldrb	r8, [sp, #32]	@ zero_extendqisi2
	cmp	ip, #0
	and	r8, r8, #255
	and	r10, r9, #255
	add	r0, r0, #240
	andeq	r9, r9, #65280
	orrne	r8, r10, r8, lsl #8
	orreq	r8, r9, r8
	cmp	lr, r0
	strh	r8, [r5, r3]	@ movhi
	bne	.L30
	b	.L21
.L32:
	cmp	r2, #2
	ble	.L36
	cmp	r3, #0
	ble	.L21
	ldr	r5, .L52
	add	r8, r0, r2
	add	r3, r1, r3
	sub	r2, r2, #1
	rsb	r0, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	sub	r8, r8, #1
	asr	r9, r2, #1
	ldm	r5, {r4, r6}
	add	r3, ip, r3, lsl #4
	add	r0, ip, r0, lsl #4
	and	r8, r8, #1
	orr	r9, r9, #-2130706432
	add	r1, sp, #32
.L39:
	add	r5, r0, r0, lsr #31
	bic	r5, r5, #1
	add	ip, r0, #1
	ldrb	r10, [sp, #32]	@ zero_extendqisi2
	ldrb	r7, [r4, r5]	@ zero_extendqisi2
	add	ip, ip, ip, lsr #31
	bic	ip, ip, #1
	orr	r7, r7, r10, lsl #8
	add	ip, r4, ip
	strh	r7, [r4, r5]	@ movhi
	str	lr, [r6, #44]
	str	r1, [r6, #36]
	str	ip, [r6, #40]
	add	ip, r2, r0
	str	r9, [r6, #44]
	add	ip, ip, ip, lsr #31
	bic	ip, ip, #1
	ldrh	r7, [r4, ip]
	ldrb	r5, [sp, #32]	@ zero_extendqisi2
	cmp	r8, #0
	and	r5, r5, #255
	and	r10, r7, #255
	add	r0, r0, #240
	andeq	r7, r7, #65280
	orrne	r5, r10, r5, lsl #8
	orreq	r5, r7, r5
	cmp	r3, r0
	strh	r5, [r4, ip]	@ movhi
	bne	.L39
	b	.L21
.L36:
	bne	.L21
	cmp	r3, #0
	ble	.L21
	ldr	r0, .L52
	add	r3, r1, r3
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	r2, ip, #1
	ldr	lr, [r0]
	add	r3, ip, r3, lsl #4
	add	r0, ip, r1, lsl #4
	and	ip, r2, #1
.L42:
	add	r2, r0, r0, lsr #31
	bic	r2, r2, #1
	ldrb	r4, [sp, #32]	@ zero_extendqisi2
	ldrb	r1, [lr, r2]	@ zero_extendqisi2
	orr	r1, r1, r4, lsl #8
	strh	r1, [lr, r2]	@ movhi
	add	r2, r0, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	ldrh	r4, [lr, r2]
	ldrb	r1, [sp, #32]	@ zero_extendqisi2
	cmp	ip, #0
	and	r1, r1, #255
	and	r5, r4, #255
	add	r0, r0, #240
	andeq	r4, r4, #65280
	orrne	r1, r5, r1, lsl #8
	orreq	r1, r4, r1
	cmp	r3, r0
	strh	r1, [lr, r2]	@ movhi
	bne	.L42
	b	.L21
.L27:
	bne	.L21
	cmp	r3, #0
	ble	.L21
	ldr	r2, .L52
	add	r3, r1, r3
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	r4, [r2]
	add	lr, r0, r3, lsl #4
	add	r0, r0, r1, lsl #4
.L31:
	add	r3, r0, r0, lsr #31
	ldrb	r2, [sp, #32]	@ zero_extendqisi2
	add	r0, r0, #240
	bic	r3, r3, #1
	cmp	lr, r0
	strb	r2, [r4, r3]
	bne	.L31
	b	.L21
.L33:
	bne	.L21
	cmp	r3, #0
	ble	.L21
	ldr	r2, .L52
	add	r3, r1, r3
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	lr, [r2]
	add	r4, r0, r3, lsl #4
	add	r0, r0, r1, lsl #4
.L35:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	ldrb	r2, [lr, r3]	@ zero_extendqisi2
	ldrb	r1, [sp, #32]	@ zero_extendqisi2
	add	r0, r0, #240
	orr	r2, r2, r1, lsl #8
	cmp	r4, r0
	strh	r2, [lr, r3]	@ movhi
	bne	.L35
	b	.L21
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L56
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L56+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L57:
	.align	2
.L56:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L60
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldm	r1, {r0, r3}
	ldr	r1, .L60+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L61:
	.align	2
.L60:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r3, #0
	ble	.L62
	mov	r4, #0
	ldr	r6, .L68
	add	lr, r1, lr
	ldr	r3, [r6]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r5, r0, r1, lsl #4
	add	lr, r0, lr, lsl #4
	ldr	ip, [sp, #16]
	ldr	r1, [r6, #4]
	add	r0, r3, lr, lsl #1
	orr	lr, r2, #-2147483648
	add	r3, r3, r5, lsl #1
	lsl	r2, r2, #1
.L64:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	lr, [r1, #44]
	add	ip, ip, r2
	bne	.L64
.L62:
	pop	{r4, r5, r6, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L78
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r2, [r7, #4]
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L72:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L72
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L81
	ldr	r1, .L81+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L84
	ldr	r1, .L84+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L85:
	.align	2
.L84:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
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
.L87:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L87
	mov	r2, #67108864
.L88:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L88
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L95
	moveq	r2, #100663296
	ldr	r0, .L95+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L96:
	.align	2
.L95:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L99
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L100:
	.align	2
.L99:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L105
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L107
.L105:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L107:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L105
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
