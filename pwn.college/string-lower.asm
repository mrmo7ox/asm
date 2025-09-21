section .text
global _start

_start:
    test rdi, rdi
    jz _null_case

    xor eax, eax        
    xor ecx, ecx        

_loop:
    mov cl, [rdi]       
    test cl, cl         
    jz _done
    
    cmp cl, 0x5A        
    ja _next_char       
    
    push rax
    push rdi
    movzx edi, cl       
    mov rax, 0x403000   
    call rax            
    pop rdi
    pop rcx             
    
    mov [rdi], al       
    mov rax, rcx        
    inc rax             
    
_next_char:
    inc rdi             
    jmp _loop

_null_case:
    xor eax, eax 
_done:
    ret