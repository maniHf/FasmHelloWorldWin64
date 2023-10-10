# FasmHelloWorldWin64
Это моя первая программа на языке ассемблере fasm / This is my first program in assembly language, namely FASM

хочу описать что делает каждая строчка файла 

format PE Console здесь мы выбирает формат под который пишем и компилируем проект  
entry Start точка фхода программы но мы её ещё не использовали 
include 'win32a.inc'  Подключает к проекту файл

section '.code' code readable executable
        Start:
                push HD
                call [print]
                call [_getch]
                call [ExitProcess]        

Это секция кода 
.code название просто название которое может состоять из 7 символов или же 4 байта или же 2 машинных слова 

code readable executable это показывает и говорит ассемблеру что делать с этой секцией 
он говорит что это секция кода что она исполняемая и что её нужно читать 

Start: это объявление начала программы 
Перед тем как продолжить стоит рассказать что 
есть секции данных 

section '.data' data readable writeable
        HD db 'Hello World!', 0 
        
в которых хранятся данные 
и секция импорта 

section '.idata' import data readable
  library \
    kernel, 'KERNEL32.DLL',\
    msvcrt, 'msvcrt.dll'
  import kernel,\
    ExitProcess, 'ExitProcess'
  import msvcrt,\
    print,'printf',\
    _getch,'_getch' 


которая производит импорт всех нужных длл (библиотек)

дальше сам код 

push HD  закидываем в стек HD 
call [print]  вызывем функцию (подпрограмму) print (мы используем ввод ввывод из Си )
call [_getch] вызываем функцию getch которая ждёт нажатия на кнопку в нашем случае 
call [ExitProcess]  завершает программу 

весь код и компилятор есть выше 
если нашли ошибку то пиши попытаюсь исправить 
