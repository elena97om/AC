	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Introduzca un num\n"
.LC4:
	.string	"\ny[0]: %d, y[%d]: %d\n"
.LC5:
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
	jle	.L31
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movslq	%eax, %r12
	movq	%rax, %r14
	leaq	18(,%r12,4), %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	leaq	3(%rsp), %rcx
	subq	%rax, %rsp
	leaq	3(%rsp), %rbx
	shrq	$2, %rcx
	shrq	$2, %rbx
	testl	%r14d, %r14d
	leaq	0(,%rcx,4), %r15
	leaq	0(,%rbx,4), %r13
	js	.L3
	movq	%r15, %rdx
	movl	$5, %esi
	leal	1(%r14), %r8d
	shrq	$2, %rdx
	negq	%rdx
	andl	$3, %edx
	leal	3(%rdx), %eax
	cmpl	$5, %eax
	cmovb	%esi, %eax
	cmpl	%eax, %r14d
	jb	.L16
	testl	%edx, %edx
	movl	$0, -104(%rbp)
	je	.L5
	cmpl	$1, %edx
	movl	$0, 0(,%rcx,4)
	movl	$0, 0(,%rbx,4)
	je	.L18
	cmpl	$3, %edx
	movl	$1, 4(,%rcx,4)
	movl	$2, 4(,%rbx,4)
	jne	.L19
	movl	$2, 8(,%rcx,4)
	movl	$4, 8(,%rbx,4)
	movl	$3, -104(%rbp)
.L5:
	movd	-104(%rbp), %xmm3
	subl	%edx, %r8d
	salq	$2, %rdx
	movl	%r8d, %edi
	movdqa	.LC2(%rip), %xmm2
	pshufd	$0, %xmm3, %xmm0
	leaq	(%r15,%rdx), %r9
	shrl	$2, %edi
	addq	%r13, %rdx
	xorl	%eax, %eax
	xorl	%esi, %esi
	paddd	.LC1(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L7:
	movdqa	%xmm0, %xmm1
	addl	$1, %esi
	movaps	%xmm0, (%r9,%rax)
	paddd	%xmm2, %xmm0
	pslld	$1, %xmm1
	movups	%xmm1, (%rdx,%rax)
	addq	$16, %rax
	cmpl	%esi, %edi
	ja	.L7
	movl	%r8d, %edx
	movl	-104(%rbp), %eax
	andl	$-4, %edx
	addl	%edx, %eax
	cmpl	%edx, %r8d
	je	.L8
.L4:
	leal	(%rax,%rax), %esi
	movslq	%eax, %rdx
	movl	%eax, (%r15,%rdx,4)
	movl	%esi, 0(%r13,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L8
	movslq	%edx, %rsi
	movl	%edx, (%r15,%rsi,4)
	addl	%edx, %edx
	movl	%edx, 0(%r13,%rsi,4)
	leal	2(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L8
	movslq	%edx, %rsi
	movl	%edx, (%r15,%rsi,4)
	addl	%edx, %edx
	movl	%edx, 0(%r13,%rsi,4)
	leal	3(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L8
	movslq	%edx, %rsi
	movl	%edx, (%r15,%rsi,4)
	addl	%edx, %edx
	movl	%edx, 0(%r13,%rsi,4)
	leal	4(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L8
	movslq	%edx, %rsi
	addl	$5, %eax
	movl	%edx, (%r15,%rsi,4)
	addl	%edx, %edx
	cmpl	%eax, %r14d
	movl	%edx, 0(%r13,%rsi,4)
	jl	.L8
	movslq	%eax, %rdx
	movl	%eax, (%r15,%rdx,4)
	addl	%eax, %eax
	movl	%eax, 0(%r13,%rdx,4)
.L8:
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	movq	%rcx, -104(%rbp)
	call	clock_gettime@PLT
	testl	%r14d, %r14d
	jle	.L9
	leaq	4(%r13), %rax
	leal	-1(%r14), %esi
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	%edx, %esi
	movl	$1, %esi
	jb	.L10
	testl	%eax, %eax
	je	.L11
	movq	-104(%rbp), %rcx
	imull	$150, 4(,%rcx,4), %edx
	addl	%edx, 4(%r13)
	cmpl	$1, %eax
	je	.L22
	imull	$150, 8(,%rcx,4), %edx
	addl	%edx, 8(%r13)
	cmpl	$3, %eax
	jne	.L23
	imull	$150, 12(,%rcx,4), %edx
	movl	$4, %esi
	addl	%edx, 12(%r13)
.L11:
	movl	%r14d, %r8d
	leaq	4(,%rax,4), %rcx
	xorl	%edx, %edx
	subl	%eax, %r8d
	xorl	%eax, %eax
	movl	%r8d, %edi
	leaq	(%r15,%rcx), %r9
	addq	%r13, %rcx
	shrl	$2, %edi
	.p2align 4,,10
	.p2align 3
.L13:
	movdqu	(%r9,%rax), %xmm0
	addl	$1, %edx
	movdqa	%xmm0, %xmm1
	pslld	$2, %xmm1
	paddd	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	pslld	$4, %xmm0
	psubd	%xmm1, %xmm0
	pslld	$1, %xmm0
	paddd	(%rcx,%rax), %xmm0
	movaps	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpl	%edi, %edx
	jb	.L13
	movl	%r8d, %eax
	andl	$-4, %eax
	addl	%eax, %esi
	cmpl	%eax, %r8d
	je	.L9
.L10:
	movslq	%esi, %rax
	imull	$150, (%r15,%rax,4), %edx
	addl	%edx, 0(%r13,%rax,4)
	leal	1(%rsi), %eax
	cmpl	%r14d, %eax
	jg	.L9
	cltq
	imull	$150, (%r15,%rax,4), %edx
	addl	%edx, 0(%r13,%rax,4)
	leal	2(%rsi), %eax
	cmpl	%eax, %r14d
	jl	.L9
	cltq
	imull	$150, (%r15,%rax,4), %edx
	addl	%edx, 0(%r13,%rax,4)
	leal	3(%rsi), %eax
	cmpl	%eax, %r14d
	jl	.L9
	cltq
	imull	$150, (%r15,%rax,4), %edx
	addl	%edx, 0(%r13,%rax,4)
	leal	4(%rsi), %eax
	cmpl	%eax, %r14d
	jl	.L9
	cltq
	imull	$150, (%r15,%rax,4), %edx
	addl	%edx, 0(%r13,%rax,4)
	leal	5(%rsi), %eax
	cmpl	%eax, %r14d
	jl	.L9
	cltq
	imull	$150, (%r15,%rax,4), %edx
	addl	%edx, 0(%r13,%rax,4)
.L9:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	-72(%rbp), %rax
	pxor	%xmm0, %xmm0
	subq	-88(%rbp), %rax
	pxor	%xmm1, %xmm1
	movl	0(,%rbx,4), %edx
	movl	0(%r13,%r12,4), %r8d
	leaq	.LC4(%rip), %rsi
	movl	%r14d, %ecx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	call	__printf_chk@PLT
	movsd	-104(%rbp), %xmm0
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L32
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
.L18:
	.cfi_restore_state
	movl	$1, -104(%rbp)
	jmp	.L5
.L22:
	movl	$2, %esi
	jmp	.L11
.L3:
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	jmp	.L9
.L19:
	movl	$2, -104(%rbp)
	jmp	.L5
.L23:
	movl	$3, %esi
	jmp	.L11
.L16:
	xorl	%eax, %eax
	jmp	.L4
.L32:
	call	__stack_chk_fail@PLT
.L31:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
