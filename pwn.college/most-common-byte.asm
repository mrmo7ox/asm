section .text
global _start

_start:
    test rdi, rdi
    jz _null_case

    xor eax, eax        
    xor ecx, ecx        

most_common_byte:
    push rbp
    mov rbp, rsp
    sub rsp, 512         
    

_done:
    ret