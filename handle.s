	.file	"handle.c"
	.section	.rodata
.LC0:
	.string	"Nice try.\n"
.LC1:
	.string	"exiting.\n"
	.text
	.globl	handler
	.type	handler, @function
handler:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	cmpl	$2, -36(%rbp)
	jne	.L2
	movl	$1, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	$10, %edx
	movl	$.LC0, %esi
	movl	%eax, %edi
	call	write
	movq	%rax, -24(%rbp)
	cmpq	$10, -24(%rbp)
	je	.L2
	movl	$-999, %edi
	call	exit
.L2:
	cmpl	$10, -36(%rbp)
	jne	.L1
	movl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$10, %edx
	movl	$.LC1, %esi
	movl	%eax, %edi
	call	write
	movq	%rax, -16(%rbp)
	cmpq	$10, -16(%rbp)
	je	.L4
	movl	$-999, %edi
	call	exit
.L4:
	movl	$1, %edi
	call	exit
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	handler, .-handler
	.section	.rodata
.LC2:
	.string	"Process ID: %d\n"
.LC3:
	.string	"still here"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	call	getpid
	movl	%eax, %edx
	movl	$.LC2, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$handler, %esi
	movl	$2, %edi
	call	signal
	movl	$handler, %esi
	movl	$10, %edi
	call	signal
	movq	$1, -16(%rbp)
.L6:
	leaq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	nanosleep
	movl	$.LC3, %edi
	call	puts
	jmp	.L6
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
