#include "floatmultiply.h"

.data
output:
	.ascii "%lf multiplied by %lf is %lf\n\0"
input:
	.ascii "Enter a number: \0"
inputspec:
	.ascii "%lf\0"
	number1: .double 8
	number2: .double 8
	total1: .double 8

.text
.globl main
main:
	push %rbp
	mov %rsp, %rbp

	mov $0, %rax
	mov $input, %rdi
	call printf

	mov $0, %rax
	mov $inputspec, %rdi
	mov $number1, %rsi
	call scanf

	mov $0, %rax
	mov $input, %rdi
	call printf

	mov $0, %rax
	mov $inputspec, %rdi
	mov $number2, %rsi
	call scanf

	mov $2, %rax
	movq (number1), %xmm0
	movq (number2), %xmm1
	call multiplyvalue
	movq %xmm0, (total1)

	mov $3, %rax
	mov $output, %rdi
	movq (number1), %xmm0
	movq (number2), %xmm1
	movq (total1), %xmm2
	call printf

	mov %rbp, %rsp
	pop %rbp

	mov $0, %rax
	mov $0, %rdi
	call exit

