%include "io.inc"
;a/b+c
;15, 16, 11
section .text
global CMAIN
CMAIN:
    XOR     DX, DX ;обнуляем регистр DX, так как старшие биты делимого берутся из него 
    ;записываем числа в регистры
    MOV     AX, 0x0F
    MOV     BX, 0x10
    MOV     CX, 0x0B   
    DIV     BX  ;15/16, целая часть частного(0) записывается в AX, а остаток(15) в DX
    ADD     AX, CX ;0+11
    PRINT_UDEC 2, AX ;выводим сумму c и целую часть от деления a на  b 
    NEWLINE
    PRINT_UDEC 2, DX ;выводим остаток от деления a  на b  
    ret