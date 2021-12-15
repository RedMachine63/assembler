%include "io.inc"
;a/b+c
;8, 4, 29
section .text
global CMAIN
CMAIN:
    XOR     DX, DX ;обнуляем регистр DX, так как старшие биты делимого берутся из него 
    ;записываем числа в регистры          
    MOV     AX, 0x08
    MOV     BX, 0x04
    MOV     CX, 0x1D 
    DIV     BX   ;8/4, целая часть частного(2) в AX, а остаток(0) в DX                          
    ADD     AX, CX ;2+29
    PRINT_UDEC 2, AX ;выводим сумму c и целую часть от деления a на  b 
    NEWLINE
    PRINT_UDEC 2, DX ;выводим остаток от деления a  на b  
    ret