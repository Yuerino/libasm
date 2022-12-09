; -----------------------------------------------------------------------------
; The ft_strcpy() function copies the string pointed to by src, including the
; terminating null byte ('\0'), to the buffer pointed to by dest. The strings
; may not overlap, and the destination string dest must be large enough to
; receive the copy.
;
;   char *ft_strcpy(char *dest, const char *src);
;
; The ft_strcpy() function returns a pointer to the destination string dest.
; -----------------------------------------------------------------------------

            global ft_strcpy

            section .text
ft_strcpy:                                  ; rax ft_strcpy(rdi, rsi)
            mov     rax, rdi                ; set dest ptr to rax for return
            xor     edx, edx                ; set index to 0
.Lloop:
            movzx   ecx, byte [rsi + rdx]   ; set current char to ecx
            test    cl, cl                  ; test if current char is 0
            jz      .Lend                   ; if zero, break
            mov     [rdi + rdx], cl         ; add current char to dest
            add     rdx, 1                  ; index++
            jmp    .Lloop                   ; loop
.Lend:
            mov     byte [rdi + rdx], 0x0   ; null-terminate dest
            ret
