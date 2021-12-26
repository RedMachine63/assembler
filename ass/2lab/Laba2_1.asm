%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    LEA     EBX, [A]    ;загружаем индекс первого элемента массиве
    MOV     ECX, 8      ;присваиваем счетчику значение длины массива
    MOV     DL, 1       ;вводим маску
next:
    MOV     AL, [EBX+ESI]   ;рассматриваем элемент массива
    AND     AL, DL          ;маскируем
    CMP     AL, 0           ;если последний бит числа 0, то оно четное
    JNZ skip        ;если последний бит 1, то число нечетное
    INC     AH      ;увеличиваем счетчик
skip:
    INC     ESI     ;увеличиваем индекс элемента
    LOOP next       ;вводим цикл
    PRINT_UDEC 1, AH    ;выводим результат
    ret
section .data    
A: DB 2, 13, 7, -3, 9, -6, 34, 27