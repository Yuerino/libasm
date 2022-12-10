; -----------------------------------------------------------------------------
; ft_read() attempts to read nbyte bytes of data from the object referenced by
; the descriptor fildes into the buffer pointed to by buf.
;
;   ssize_t ft_read(int fildes, void *buf, size_t nbyte);
;
; If successful, the number of bytes actually read is returned. Upon reading
; end-of-file, zero is returned. Otherwise, a -1 is returned and the global
; variable errno is set to indicate the error.
; -----------------------------------------------------------------------------

            global ft_read
            extern __errno_location

            section .text
ft_read:                                        ; rax ft_read(rdi, rsi, rdx)
            mov     rax, 0                      ; sys_read
            syscall                             ; syscall write
            cmp     rax, 0                      ; check if rax == 0
            jl      .Lerror                     ; if negative, jmp to error
            ret
.Lerror:
            push    rax                         ; save -errno and align stack
            call    __errno_location wrt ..plt  ; get errno address
            pop     rcx                         ; restore -errno to rcx
            neg     rcx                         ; get errno
            mov     [rax], ecx                  ; set errno
            mov     rax, -1                     ; return -1
            ret
