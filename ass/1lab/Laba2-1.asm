%include "io.inc"
;a/b+c
;15, 16, 11
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;заносим переменные в стек
    FLD DWORD [c]
    FLD DWORD [a]
    FLD DWORD [b]
    FDIV ;a/b
    FADD ;(a/b)+c
    FST DWORD [r] ;результат запишем в переменную r
    ret
section .data
a: DD 0x41700000
b: DD 0x41800000
c: DD 0x41300000
r: DD 0x00000000    