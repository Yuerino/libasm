; -----------------------------------------------------------------------------
; The ft_strchr() function locates the first occurrence of c (converted to a
; char) in the string pointed to by s. The terminating null character is
; considered to be part of the string; therefore if c is `\0', the functions
; locate the terminating `\0'.
;
;   char *ft_strchr(const char *s, int c);
;
; The function ft_strchr() returns a pointer to the located character, or
; NULL if the character does not appear in the string.
; -----------------------------------------------------------------------------

            global ft_strchr

            section .text
ft_strchr:                          ; rax ft_strchr(rdi, esi);
            xor     eax, eax        ; zero-ed rax
.Lloop:
            movzx   ecx, byte [rdi] ; load char from rdi
            cmp     cl, sil         ; compare if char is equal to c
            je      .Lfound         ; if equal, jump to .Lfound
            add     rdi, 1          ; rdi++
            test    cl, cl          ; test if char is 0
            jnz     .Lloop          ; if not zero, jump to .Lloop
            ret
.Lfound:
            mov     rax, rdi        ; rax = rdi
            ret
