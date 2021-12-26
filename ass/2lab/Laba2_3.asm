%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    LEA     EBX, [A] ; присваиваем регистру адрес первого элемента
    MOV     EDI, 9 ;задаем количество выполнений цикла (длина массива - 1)
turn:    
    MOV     ECX, EDI ;добавляем еще один счетчик чтобы знать сколько осталось проходов массива
next:    
    MOV     AL, [EBX + ESI]     ;вытаскиваем элемент массива
    MOV     DL, [EBX + ESI + 1] ;и следующий
    CMP     AL, DL ;сравниваем соседние элементы массива
    JNG skip ;если левый больше правого, то меняем их местами,а если нет, то пропускаем
    MOV     [EBX + ESI], DL
    MOV     [EBX + ESI + 1], AL
skip:
    INC     ESI ;переходим к следующей паре
    LOOP  next   
; по итогу первого выполнения самый большой элемент массива будет находится справа     
    DEC     EDI     ;уменьшаем диапозон сортировки в рамках одного прохода
    XOR     ESI, ESI     ;обнуляем индекс
    CMP     EDI, 0  ;проверяем пройден ли массив полностью
    JZ      quit
    MOV     ECX, EDI;присваиваем счетчику диапозон сортировки
    LOOP turn    
quit:
;выведем отсортированный массив    
    MOV     ECX, 10
    XOR     ESI, ESI
prar:    
    MOV     AL, [EBX + ESI]
    PRINT_DEC 2, AL 
    INC     ESI 
    LOOP    prar    
    ret
section .data
A: DB 6, 9, 7, 2, 3, 5, 1, 8, 0, 4  
    ret