	.file	"ej6.c"
	.text
	.globl	arr4
	.bss
	.align 32
	.type	arr4, @object
	.size	arr4, 80
arr4:
	.zero	80
	.globl	arr5
	.align 32
	.type	arr5, @object
	.size	arr5, 80
arr5:
	.zero	80
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	andl	$-16, %esp
	subl	$192, %esp
	.cfi_offset 7, -12
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	%gs:20, %eax
	movl	%eax, 188(%esp)
	xorl	%eax, %eax
	leal	28(%esp), %edx
	movl	$0, %eax
	movl	$20, %ecx
	movl	%edx, %edi
	rep stosl
	movl	$10, 148(%esp)
	movl	$0, %eax
	movl	188(%esp), %edx
	subl	%gs:20, %edx
	je	.L3
	call	__stack_chk_fail_local
.L3:
	movl	-4(%ebp), %edi
	leave
	.cfi_restore 5
	.cfi_restore 7
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB1:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE1:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
