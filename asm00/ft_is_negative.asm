%define stack_len 6
%define N_index 5
%define P_index 4
%define Number_index 0
%define number -2

section .text
    global _start

_start:
    call _stack_frame
    call ft_is_negative
    jmp _exit

_stack_frame:
    push rbp
    mov rbp, rsp
    sub rsp, stack_len
    mov dword [rbp - Number_index], number
    mov byte [rbp - N_index], 'N'
    mov byte [rbp - P_index], 'P'

ft_is_negative:
    mov eax, [rbp - Number_index]
    test eax, eax                  
    js .is_nega

    lea rsi, [rbp - P_index]   
    call ft_putchar
    jmp .done 

.is_nega:
    lea rsi, [rbp - N_index]       
    call ft_putchar

.done:
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