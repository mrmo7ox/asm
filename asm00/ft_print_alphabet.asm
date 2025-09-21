%define len 1
section .text
    global _start

_start:
    call _stack_frame
    call ft_print_alphabet
    jmp _exit

_stack_frame:
    push rbp
    mov rbp, rsp
    sub rsp, len
    mov byte [rbp - len], 'a'
    

ft_print_alphabet:
.loop:
    call ft_putchar

    inc byte [rbp - len]

    mov al, [rbp - len]
    cmp al, 'z' + 1
    jl .loop


    mov byte [rbp - len], 0x0A
    call ft_putchar
    jmp _exit

ft_putchar:
    mov rax, 1        
    mov rdi, 1        
    lea rsi, [rbp - len]  
    mov rdx, 1        
    syscall
    ret

_exit:
    mov rax, 60       
    xor rdi, rdi      
    syscall
