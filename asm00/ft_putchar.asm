section .data
    char db 'test', 0x0A
    len equ $ - char

section .text
    global _start


_start:
    call ft_putchar
    jmp _exit


ft_putchar:
    mov rax, 1
    mov rdi, 1 
    mov rsi , char
    mov rdx, len 
    syscall

_exit:
    mov rax, 60
    mov rdi, 0
    syscall