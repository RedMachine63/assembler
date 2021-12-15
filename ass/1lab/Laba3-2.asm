%include "io.inc"
;8, 4, 29
section .text
global CMAIN
CMAIN:
    ;записываем числа в регистры
    MOV     AX, 0x08
    MOV     BX, 0x04
    MOV     CX, 0x1D 
    CMP     AX, BX ;сравниваем a и b
    JA      l1    ;если b меньше a, то нужно сравнить  b и c
    CMP     AX, CX ;сравниваем a и с 
    JB      l2     ;если а меньше и b, и c, то а самое маленькое число, иначе это с
l3:    
    PRINT_UDEC 2, CX ; выводим  c
    JMP     Quit
l1:    
    CMP     CX, BX ;сравниваем b и c
    JB      l3      ;если с<b<a, то с наименьшее, иначе это b
    PRINT_UDEC 2, BX ; выводим  b 
    JMP     Quit
l2:
    PRINT_UDEC 2, AX ; выводим  a 
Quit:    