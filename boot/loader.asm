bits 16
org 0x0

start: jmp main ; we are loaded at linear address 0x10000

; +---------------------------------------------------------------------------+
;                       Required Headers
; +---------------------------------------------------------------------------+
%include "print.asm"

; +---------------------------------------------------------------------------+
;                       Second Stage Bootloader entry point
; +---------------------------------------------------------------------------+
main:
    cli

    xor ax, ax
    xor bx, bx
    mov ds, ax
    mov es, ax

    push cs
    pop ds

    mov si, msg
    call PRINT

    hlt

; +---------------------------------------------------------------------------+
;                       Data Segment
; +---------------------------------------------------------------------------+
msg db "Welcome to HAOS...", 0

times 510 - ($ - $$) db 0