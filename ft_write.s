; -----------------------------------------------------------------------------
; ft_write() attempts to write nbyte of data to the object referenced by the
; descriptor fildes from the buffer pointed to by buf.
;
;   ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
;
; Upon successful completion the number of bytes which were written is returned.
; Otherwise, a -1 is returned and the global variable errno is set to indicate
; the error.
; -----------------------------------------------------------------------------

            global ft_write
            extern __errno_location

            section .text
ft_write:                                       ; rax ft_write(rdi, rsi, rdx)
            mov     rax, 1                      ; sys_write
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
