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
	ldr	r1, .L4
	push	{r4, lr}
	ldr	r3, .L4+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+12
	ldr	r2, .L4+16
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1044
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	initialize, .-initialize
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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L8+8
	ldr	r2, .L8+12
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
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
	beq	.L10
	ldr	r3, .L17+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
.L10:
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r0, [r4]
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L17+20
	ldr	r3, .L17+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
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
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L20
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Pause\000"
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
	mov	r0, #255
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+4
	ldr	r2, .L24+8
	mov	r1, #77
	mov	r0, #105
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L24+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	fillScreen4
	.word	drawString4
	.word	.LC0
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L36
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r2, .L36+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L27
	mov	r2, #1
	ldr	r3, .L36+12
	str	r2, [r3]
.L26:
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L36+8
	ldrh	r3, [r3]
	ands	r5, r3, #4
	bne	.L26
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+16
	mov	lr, pc
	bx	r3
	ldr	r2, .L36+12
	ldr	r3, .L36+20
	str	r5, [r2]
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.word	flipPage
	.word	seed
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Win\000"
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
	mov	r0, #252
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r4, .L40+4
	ldr	r2, .L40+8
	mov	r1, #77
	mov	r0, #111
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L40+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+16
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L40+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L49
	mov	lr, pc
	bx	r5
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L48
.L42:
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	mov	lr, pc
	bx	r5
	ldr	r3, .L49+12
	mov	lr, pc
	bx	r3
	ldr	r2, .L49+16
	ldr	r3, .L49+20
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	flipPage
	.word	state
	.word	seed
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Lose\000"
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
	mov	r0, #253
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+4
	ldr	r2, .L53+8
	mov	r1, #77
	mov	r0, #108
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+16
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L53+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Balls Remaining: %d\000"
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L69
	ldr	r4, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L69+12
	ldr	r3, .L69+16
	ldr	r0, .L69+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L69+24
	mov	r1, #145
	mov	r0, #5
	ldr	r2, .L69+20
	mov	r3, #254
	mov	lr, pc
	bx	r5
	ldr	r3, .L69+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r2, .L69+40
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L66
.L56:
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L67
	tst	r3, #2
	beq	.L55
	ldr	r3, .L69+40
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L68
.L55:
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L66:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L68:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L70:
	.align	2
.L69:
	.word	updateGame
	.word	ballsRemaining
	.word	drawGame
	.word	.LC3
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
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
	mov	r2, #67108864
	ldr	r1, .L82
	push	{r4, r7, fp, lr}
	ldr	r3, .L82+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L82+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L82+12
	ldr	r6, .L82+16
	str	r2, [r3]
	str	r2, [r6]
	ldr	fp, .L82+20
	ldr	r5, .L82+24
	ldr	r10, .L82+28
	ldr	r9, .L82+32
	ldr	r8, .L82+36
	ldr	r7, .L82+40
	ldr	r4, .L82+44
.L72:
	ldrh	r3, [fp]
.L73:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L73
.L75:
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L74
	.word	.L74
.L74:
	mov	lr, pc
	bx	r7
.L79:
	ldr	r2, [r6]
	b	.L72
.L76:
	mov	lr, pc
	bx	r8
	b	.L79
.L77:
	mov	lr, pc
	bx	r9
	b	.L79
.L78:
	mov	lr, pc
	bx	r10
	b	.L79
.L83:
	.align	2
.L82:
	.word	1044
	.word	waitForVBlank
	.word	flipPage
	.word	seed
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
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
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
