; -----------------------------------------------------------------------------
; The ft_isspace() function tests for the white-space characters. For any
; locale, this includes the following standard characters:
;   '\t', '\n', '\v', '\f', '\r', ' '
;
;   int ft_isspace(int c);
;
; The ft_isspace() function returns zero if the character tests false and
; returns non-zero if the character tests true.
; -----------------------------------------------------------------------------

            global ft_isspace

            section .text
ft_isspace:                         ; eax = ft_isspace(edi)
            mov     eax, 1          ; set eax to 1
            cmp     edi, 0x20       ; check if rdi == ' '
            je      .Lret           ; if equal, jump to .Lret
            sub     edi, 9          ; edi = edi - '\t', normalize '\t' to 0
            cmp     edi, 5          ; check if within range 0-4 for white-space characters
            setb    al              ; if greater, set al to 1
.Lret:
            ret
