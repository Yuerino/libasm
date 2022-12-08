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
            xor     eax, eax
.Lloop:
            cmp     byte [rdi + rax], 0x0
            je      .Lend
            inc     rax
            jmp     .Lloop
.Lend:
            ret
