%define stack_len 3

%define one_index 0
%define two_index 1
%define three_index 2

section .text
    global _start


_start:
    call _init

_init:
    push rbp
    mov rbp, rsp 
    sub rsp, stack_len
    mov byte [rbp - one_index], '0'
    mov byte [rbp - two_index], '1'
    mov byte [rbp - three_index], '2'
    call ft_print_comb

ft_print_comb:

    lea rsi, [rbp - one_index]
    
    call ft_putchar
    lea rsi, [rbp - two_index]
    call ft_putchar
    lea rsi, [rbp - three_index]
    call ft_putchar
    call _exit



ft_putchar:
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    ret

_exit:
    mov rax, 60
    xor rdi, rdi
    syscall
