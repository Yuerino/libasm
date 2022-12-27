; -----------------------------------------------------------------------------
; ft_atoi_base() function converts the initial portion of the string pointed
; to by str to int representation in the base specified by base.
;
;   int ft_atoi_base(const char *str, const char *base);
;
; If there’s an invalid argument, the function should return 0. Examples of
; invalid arguments :
;   ◦ base is empty or size of 1
;   ◦ base contains the same character twice
;   ◦ base contains + or - or whitespaces
; -----------------------------------------------------------------------------

            global ft_atoi_base
            extern ft_strlen
            extern ft_isspace
            extern ft_strchr

            section .text
ft_atoi_base:                       ; eax ft_atoi_base(rdi, rsi)
            push    rbx             ; save rbx callee-saved
            push    r12             ; save r12 callee-saved
            push    r13             ; save r13 callee-saved
            push    r14             ; save r14 callee-saved

            mov     r14, 1          ; r14 = 1
            movzx   ecx, byte [rdi] ; ecx = byte rdi
            cmp     cl, 43          ; if (byte rdi == '+')
            jne     .LcheckNeg      ; if not equal, jmp checkNeg
            add     rdi, 1          ; rdi++

.LcheckNeg:
            cmp     cl, 45          ; if (byte rdi == '-')
            jne     .LcheckSignEnd  ; if not equal, jmp skip
            add     rdi, 1          ; rdi++
            neg     r14d            ; r14 = -1

.LcheckSignEnd:
            push    rdi             ; save rdi
            push    rsi             ; save rsi
            mov     rbx, rsi        ; rbx = rsi
            mov     rdi, rsi        ; rdi = rsi
            sub     rsp, 8          ; align stack
            call    ft_strlen       ; rax = ft_strlen(rdi)
            cmp     rax, 1          ; if (ft_strlen(rdi) == 1)
            jl      .Lerror         ; jmp invalid
            mov     r13, rax        ; save rax to r12
.LbaseValidateLoop:
            movzx   edi, byte [rbx]         ; edi = byte rbx
            test    dil, dil                ; if dil == 0
            jz      .LbaseValidateLoopEnd   ; jmp end

            lea     ecx, [edi - 43]         ; edi -= 43, normalize '+' to 0
            and     ecx, -3                 ; if edi == '+' or '-'
            jz      .Lerror                 ; if zero, jmp error

            call    ft_isspace              ; eax = ft_isspace(edi)
            test    eax, eax                ; if (ft_isspace(edi))
            jnz     .Lerror                 ; jmp error

            lea     rdi, [rbx + 1]          ; rdi = rbx + 1
            test    dil, dil                ; if dil == 0
            jz      .LbaseValidateLoopEnd   ; jmp end
            movzx   esi, byte [rbx]         ; esi = byte rbx
            call    ft_strchr               ; rax = ft_strchr(rdi, esi)
            test    rax, rax                ; if (ft_strchr(rdi, esi))
            jnz     .Lerror                 ; if not zero, jmp error

            add     rbx, 1                  ; rbx++
            jmp     .LbaseValidateLoop      ; jmp loop

.LbaseValidateLoopEnd:
            add     rsp, 8                  ; restore stack
            xor     ecx, ecx                ; r13 = 0
            pop     rbx                     ; restore rsi to rbx
            pop     r12                     ; restore rdi to r12
.LAtoiLoop: ; r13 len of base, rbx base, r12 str
            push    rcx                     ; save rcx
            movzx   esi, byte [r12]         ; esi = byte rbx
            test    sil, sil                ; if sil == 0
            jz      .LEnd                   ; if zero, jmp end
            mov     rdi, rbx                ; rdi = rbx
            call    ft_strchr               ; rax = ft_strchr(rdi, esi)
            test    rax, rax                ; if (ft_strchr(rdi, esi))
            jz      .LEnd                   ; if zero, jmp end
            pop     rcx                     ; restore rcx
            sub     rax, rbx                ; rax -= rbx to get number
            imul    rcx, r13                ; rcx *= r13 (result *= base len)
            add     rcx, rax                ; rcx += number
            add     r12, 1                  ; rbx++
            jmp     .LAtoiLoop              ; jmp loop

.LEnd:
            pop     rax                     ; restore rcx to rax
            imul    rax, r14                ; rax *= r14 (result *= sign)
            pop     r14                     ; restore rsi
            pop     r13                     ; restore r13
            pop     r12                     ; restore r12
            pop     rbx                     ; restore rbx
            ret
.Lerror:
            xor     eax, eax                ; set eax 0
            pop     rsi                     ; restore rsi
            pop     rdi                     ; restore rdi
            pop     r14                     ; restore r14
            pop     r13                     ; restore r13
            pop     r12                     ; restore r12
            pop     rbx                     ; restore rbx
            ret
