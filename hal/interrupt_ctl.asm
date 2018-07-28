bits 32

global enable_interrupts
global disable_interrupts
extern interrupt_handler
extern irq_handler

segment .text

%macro ISR_NOERR 1
    global isr%1

    isr%1:
        cli

        xor ebx, ebx
        mov ebx, interrupt_handler

        push byte 0
        push byte %1
        jmp isr
%endmacro

%macro ISR_ERR 1
    global isr%1

    isr%1:
        cli

        xor ebx, ebx
        mov ebx, interrupt_handler

        push byte %1
        jmp isr
%endmacro

%macro IRQ 2
    global irq%1

    irq%1:
        cli

        xor ebx, ebx
        mov ebx, irq_handler

        push byte 0
        push byte %2
        jmp isr
%endmacro

enable_interrupts:
    sti
    ret

disable_interrupts:
    cli
    ret

isr:
    pusha

    mov ax, ds
    push eax

    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax

    call ebx

    pop eax
    mov ds, ax
    mov es, ax
    mov gs, ax
    mov fs, ax

    popa
    add esp, 8
    sti
    iret

ISR_NOERR 0
ISR_NOERR 1
ISR_NOERR 2
ISR_NOERR 3
ISR_NOERR 4
ISR_NOERR 5
ISR_NOERR 6
ISR_NOERR 7
ISR_ERR 8
ISR_NOERR 9
ISR_ERR 10
ISR_ERR 11
ISR_ERR 12
ISR_ERR 13
ISR_ERR 14
ISR_NOERR 15
ISR_NOERR 16
ISR_NOERR 17
ISR_NOERR 18
ISR_NOERR 19
ISR_NOERR 20
ISR_NOERR 21
ISR_NOERR 22
ISR_NOERR 23
ISR_NOERR 24
ISR_NOERR 25
ISR_NOERR 26
ISR_NOERR 27
ISR_NOERR 28
ISR_NOERR 29
ISR_NOERR 30
ISR_NOERR 31

IRQ 0, 32
IRQ 1, 33
IRQ 2, 34
IRQ 3, 35
IRQ 4, 36
IRQ 5, 37
IRQ 6, 38
IRQ 7, 39
IRQ 8, 40
IRQ 9, 41
IRQ 10, 42
IRQ 11, 43
IRQ 12, 44
IRQ 13, 45
IRQ 14, 46
IRQ 15, 47
