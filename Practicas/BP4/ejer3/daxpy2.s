	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Introduzca un num\n"
.LC2:
	.string	"\ny[0]: %d, y[%d]: %d\n"
.LC3:
	.string	"Tiempo: %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L13
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movslq	%eax, %r13
	movq	%rax, %r15
	leaq	18(,%r13,4), %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r14
	subq	%rax, %rsp
	leaq	3(%rsp), %r12
	shrq	$2, %r12
	testl	%r15d, %r15d
	leaq	0(,%r12,4), %rbx
	js	.L3
	movl	%r15d, %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	leal	(%rax,%rax), %edx
	movl	%eax, (%r14,%rax,4)
	movl	%edx, (%rbx,%rax,4)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L4
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	testl	%r15d, %r15d
	jle	.L5
	leal	-1(%r15), %eax
	leaq	8(,%rax,4), %rcx
	movl	$4, %eax
	.p2align 4,,10
	.p2align 3
.L6:
	imull	$150, (%r14,%rax), %edx
	addl	%edx, (%rbx,%rax)
	addq	$4, %rax
	cmpq	%rax, %rcx
	jne	.L6
.L5:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	-72(%rbp), %rax
	subq	-88(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	(%rbx,%r13,4), %r8d
	pxor	%xmm1, %xmm1
	movl	0(,%r12,4), %edx
	movl	%r15d, %ecx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	call	__printf_chk@PLT
	movsd	-104(%rbp), %xmm0
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L14
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L3:
	.cfi_restore_state
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	jmp	.L5
.L14:
	call	__stack_chk_fail@PLT
.L13:
	movq	stderr(%rip), %rcx
	leaq	.LC0(%rip), %rdi
	movl	$18, %edx
	movl	$1, %esi
	call	fwrite@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
