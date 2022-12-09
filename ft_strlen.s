; -----------------------------------------------------------------------------
; The ft_strlen() function calculates the length of the string pointed to by
; str, excluding the terminating null byte ('\0').
;
;   size_t ft_strlen(const char *str)
;
; The ft_strlen() function returns the number of bytes in the string pointed to by
; str.
; -----------------------------------------------------------------------------

            global ft_strlen

            section .text
ft_strlen:
            xor     eax, eax                ; set rax to 0 for return
.Lloop:
            movzx   ecx, byte [rdi + rax]   ; set current char to ecx
            test    cl, cl                  ; test if current char is 0
            jz      .Lend                   ; if zero, break
            add     rax, 1                  ; rax++
            jmp     .Lloop                  ; loop
.Lend:
            ret
