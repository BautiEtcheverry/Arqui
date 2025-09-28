	.file	"ej10Main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Fibo(%d)=%lld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	subl	$24, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%ecx, %eax
	cmpl	$1, (%eax)
	jle	.L2
	movl	%eax, -28(%ebp)
	movl	4(%eax), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	atoi@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	fibo
	addl	$16, %esp
	movl	%eax, %esi
	movl	%edx, %edi
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	atoi@PLT
	addl	$16, %esp
	pushl	%edi
	pushl	%esi
	pushl	%eax
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	jmp	.L3
.L2:
	subl	$12, %esp
	pushl	$0
	call	fibo
	addl	$16, %esp
	pushl	%edx
	pushl	%eax
	pushl	$0
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
.L3:
	movl	$0, %eax
	leal	-16(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	fibo
	.type	fibo, @function
fibo:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	cmpl	$0, 8(%ebp)
	jne	.L6
	movl	$0, %eax
	movl	$0, %edx
	jmp	.L7
.L6:
	cmpl	$1, 8(%ebp)
	jne	.L8
	movl	$1, %eax
	movl	$0, %edx
	jmp	.L7
.L8:
	movl	$0, -32(%ebp)
	movl	$0, -28(%ebp)
	movl	$1, -24(%ebp)
	movl	$0, -20(%ebp)
	movl	$2, -36(%ebp)
	jmp	.L9
.L10:
	movl	-32(%ebp), %ecx
	movl	-28(%ebp), %ebx
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	addl	%ecx, %eax
	adcl	%ebx, %edx
	movl	%eax, -16(%ebp)
	movl	%edx, -12(%ebp)
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%eax, -32(%ebp)
	movl	%edx, -28(%ebp)
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	addl	$1, -36(%ebp)
.L9:
	movl	-36(%ebp), %eax
	cmpl	8(%ebp), %eax
	jbe	.L10
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
.L7:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	fibo, .-fibo
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB8:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE8:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB9:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE9:
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
