; -----------------------------------------------------------------------------
; The ft_strlen() function calculates the length of the string pointed to by
; str, excluding the terminating null byte ('\0').
;
;   size_t ft_strlen(const char *str)
;
; The strlen() function returns the number of bytes in the string pointed to by
; str.
; -----------------------------------------------------------------------------

            global ft_strlen

            section .text
ft_strlen:
            xor     eax, eax        ; set rax to 0 for return
.Lloop:
            mov     cl, [rdi + rax] ; set current char to cl
            test    cl, cl          ; test if current char is null
            je      .Lend           ; if null, break
            inc     rax             ; rax++
            jmp     .Lloop
.Lend:
            ret
