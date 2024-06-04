.model small
.stack 100h
.data
    frequencies dw 1292, 1355, 1436, 1521, 1612, 1715, 1809, 1917, 2031, 2152, 2280, 2415, 2559
            dw 2711, 2873, 3043, 3225, 3619, 3834, 4063, 3043, 2280, 3043, 3619, 2711, 2415
            dw 2559, 2711, 3043, 1809, 1521, 1621, 1521, 1809, 2280, 2031, 2415
    freq dw 0
    aim db "aim.bin", 0
    aimbfr db 23*23 DUP (0)
    startPage db "aPage1.bin",0
    startBuffer db 43*196 DUP(0)
    acnP db "acn.bin",0
    udata db "adata.bin",0
    udatabfr db 2 DUP(0)
    anm db "anm.bin",0
    acnbfr db 7*152 DUP(0)
    arrow db "arr.bin",0
    arrowbfr db 7*8 DUP(0)
    scores db "adata.bin",0
    scoresbfr db 4 DUP(0)
    duckUp db "WU.bin",0
    duckUpBfr db 18*55 DUP(0)
    ;code data
    printWin db 'YOU WIN'
    printLose db 'YOU LOSE'
    printInputNameMsg db 'ENTER YOUR NAME'
    printName db 'NAME'
    printHighScore db 'HIGH SCORE'
    printInstruction db 'INSTRUCTION'
    printGameA db 'GAME A DUCK'
    printGameB db 'GAME B DUCKS'
    printSettings db 'SETTINGS'
    mainMenu db 'MAIN MENU'
    exitGame db 'EXIT GAME'
    instHead db 'INSTRUCTION'
    inst1 db '1) The game have 2 modes easy hard.'
    inst2 db '2) you can O/N sound in settings.'
    inst3 db '3) You can aim by movng cursor.'
    inst4 db '4) Shoot duck by pressing S.'
    inst5 db '5) Missing any duck health reduces.'
    pageNo db 0
    file dw 2 DUP(0)
    char db ?
    uName db 10 DUP(0)
    sizen dw 0
    rows dw ?
    turn db 0
    cols dw ?
    temp_c dw ?
    temp_r dw ?
    tempPosX dw ?
    tempPosY dw ?
    temp dw ?
    pos_x dw ?
    pos_y dw ?
    scanCode db 0
    cursorPosition dw 0
    color db 0
    boxLength dw 0
    boxWidth dw 0
    soundBool db 1
    onMsg db 'ON'
    offMsg db 'OFF'
    settingMsg db 'SOUND SETTING'
    numOfOpt db 0
    pauseArrow db 3h,3h,2dh,2dh,2dh,2dh,2dh,2dh
                db 3h,3h,3h,3h,2dh,2dh,2dh,2dh
                db 3h,3h,3h,3h,3h,3h,2dh,2dh
                db 3h,3h,3h,3h,3h,3h,3h,3h
                db 3h,3h,3h,3h,3h,3h,2dh,2dh
                db 3h,3h,3h,3h,2dh,2dh,2dh,2dh
                db 3h,3h,2dh,2dh,2dh,2dh,2dh,2dh
    shotImage db 0,18h,18h,0
            db 18h,18h,18h,18h
            db 18h,18h,18h,18h
            db 18h,18h,18h,18h
            db 18h,18h,18h,18h
            db 18h,18h,18h,18h
            db 18h,18h,18h,18h

    shotImageB db 0,2fh,2fh,0
            db 2fh,2fh,2fh,2fh
            db 2fh,2fh,2fh,2fh
            db 2fh,2fh,2fh,2fh
            db 2fh,2fh,2fh,2fh
            db 2fh,2fh,2fh,2fh
            db 2fh,2fh,2fh,2fh

     wing_up db 0h,0h,0h,010h,010h,010h,010h,0h,0h,0h,0h,0h,0h,0h,0h,0h
            db 0h,0h,010h,037h,037h,037h,035h,010h,010h,010h,0h,0h,010h,010h,010h,0h
            db 0h,010h,0bah,0bbh,010h,037h,036h,037h,037h,037h,010h,069h,037h,037h,010h
            db 010h,0bah,0bbh,0bbh,0bbh,037h,037h,037h,037h,037h,037h,010h,010,037h,010h,0h
            db 0h,010h,010h,010h,069h,069h,010h,035h,036h,037h,037h,037h,037h,010h,010h,010h,0h
            db 0h,0h,0h,010h,037h,037h,069h,010h,010h,036h,037h,037h,037h,037h,010h,0h
            db 0h,0h,0h,0h,010h,010h,037h,069h,069h,010h,036h,035h,037h,037h,010h,0h
            db 0h,0h,0h,0h,0h,0h,010h,010h,010h,010h,010h,036h,037h,037h,010h,0h
            db 0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,010h,036h,036h,037h,010h,0
            db 0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,010h,037h,037h,010h,0h
            db 0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,010h,010h,010h,0h,0


    boolImage db 0
    temp_X dw 0
    temp_Y dw 0
    score db '0000000100020003000400050006000700080009'
   
    shotMsg db 'SHOTS'
    hitMsg db 'HITTED'
    scoreMsg db 'SCORES'
    pauseMsg db 'PRESS p TO PAUSE'
    quitMsg db 'QUIT'
    restartMsg db 'RESTART'
    resumeMsg db 'RESUME'
    numOption db 0
    tempR db 0
    tempM db 0
.code   
MOVE_RIGHT_PIXEL PROC 
    mov al,color
    mov ah,0ch
    int 10h
    inc cx
    ret
MOVE_RIGHT_PIXEL ENDP
MOVE_LEFT_PIXEL PROC  
    mov al, color
    mov ah,0ch
    int 10h
    dec cx
    ret
MOVE_LEFT_PIXEL ENDP
MOVE_UP PROC    
    mov al, color
    mov ah,0ch
    int 10h
    dec dx 
    ret
MOVE_UP ENDP
MOVE_DOWN PROC  
    mov al, color 
    mov ah,0ch
    int 10h
    inc dx
    ret
MOVE_DOWN ENDP    
PRINT_HORIZENTAL_LINE_RIGHT PROC 
    mov bx,boxLength
    HORIZENTAL_RIGHT:
    call MOVE_RIGHT_PIXEL
    dec bx
    cmp bx,0
    jne HORIZENTAL_RIGHT 
    ret
PRINT_HORIZENTAL_LINE_RIGHT ENDP   
PRINT_HORIZENTAL_LINE_LEFT PROC 
    mov bx,boxLength
    HORIZENTAL_LEFT:
    call MOVE_LEFT_PIXEL
    dec bx
    cmp bx,0
    jne HORIZENTAL_LEFT 
    ret
PRINT_HORIZENTAL_LINE_LEFT ENDP 
PRINT_VERTICAL_LINE_UP PROC  
    mov bx,boxWidth
    VERTICAL_UP:
    call MOVE_UP
    dec bx
    cmp bx,0
    jne VERTICAL_UP 
    ret
PRINT_VERTICAL_LINE_UP ENDP     
PRINT_VERTICAL_LINE_DOWN PROC  
    mov bx,boxWidth
    VERTICAL_DOWN:
    call MOVE_DOWN
    dec bx
    cmp bx,0
    jne VERTICAL_DOWN 
    ret
PRINT_VERTICAL_LINE_DOWN ENDP
PRINT_BOX PROC  
    call PRINT_HORIZENTAL_LINE_RIGHT
    call PRINT_VERTICAL_LINE_DOWN 
    call PRINT_HORIZENTAL_LINE_LEFT
    call PRINT_VERTICAL_LINE_UP    
    ret
PRINT_BOX ENDP
GRAPHIC_MODE proc      
    mov ah, 0
    mov al, 13h  
    int 10h  
    ret
GRAPHIC_MODE endp
OPEN_FILE proc
    mov ah, 3Dh       
    mov al, 0            
    int 21h 
    mov bx, ax 
    ret
OPEN_FILE endp
READ_FILE proc
    mov ah, 3Fh           
    int 21h   
    ret
READ_FILE endp
CLOSE_FILE proc
    mov ah, 3Eh         
    int 21h  
    ret
CLOSE_FILE endp
LOAD_IMAGE PROC
    mov  dx, file
    call OPEN_FILE    
    mov dx, file+2
    call READ_FILE
    call CLOSE_FILE
    ret
LOAD_IMAGE endp
LOAD_IMAGES proc
    mov file,offset aim
    mov file+2,offset aimbfr 
    mov cx, 23*23 
    call LOAD_IMAGE
    mov file,offset startPage
    mov file+2,offset startBuffer 
    mov cx, 43*196 
    call LOAD_IMAGE
    mov file,offset acnP
    mov file+2,offset acnbfr
    mov cx,7*152
    call LOAD_IMAGE
    mov file,offset arrow
    mov file+2,offset arrowbfr
    mov cx,7*8
    call LOAD_IMAGE
    mov file,offset scores
    mov file+2,offset scoresbfr
    mov cx,4
    call LOAD_IMAGE
    mov file,offset duckUp
    mov file+2,offset duckUpBfr
    mov cx,18*55
    call LOAD_IMAGE
    ret
LOAD_IMAGES endp
PRINT_INPUT_NAME proc
    mov si,offset printInputNameMsg
    mov temp,15
    mov dl,12
    mov dh,15
    mov bl,0fh
    CALL PRINT_TEXT
    ret
PRINT_INPUT_NAME endp
PRINT_GAME_LOGO proc
    mov tempPosX,60
    mov tempPosY,50
    mov temp_c,196
    mov temp_r,43
    mov si,offset startBuffer
    mov al,0
    mov boolImage,al
    call PRINT_IMAGE
    ret
PRINT_GAME_LOGO endp
PRINT_PRESS_TO_CONT proc
    mov tempPosX,80
    mov tempPosY,170
    mov temp_c,152
    mov temp_r,7
    mov si,offset acnbfr
    mov al,0
    mov boolImage,al
    call PRINT_IMAGE
    ret
PRINT_PRESS_TO_CONT endp
WRITE_NAME_IN_FILE proc
    mov ah, 3Ch       
    mov cx, 2         
    mov dx,offset anm
    int 21h           
    mov bx, ax        
    mov ah, 40h       
    mov cx, sizen  
    mov dx, offset uName
    int 21h           
    ret
WRITE_NAME_IN_FILE endp
WRITE_DATA_IN_FILE proc
    mov ah, 3Ch       
    mov cx, 2         
    mov dx,offset udata
    int 21h           
    mov bx, ax        
    mov ah, 40h       
    mov cx, 2 
    mov dx, offset udatabfr
    int 21h 
    ret
WRITE_DATA_IN_FILE endp
TAKE_INPUT_NAME proc
    mov si,offset uName
    mov dl,15
    mov sizen,0
    TOUTER:
    mov ah,0
    int 16h
    mov scanCode,ah
    push ax
    cmp soundBool,1
    jne L1  
    mov freq,2031
    call SOUND
    L1:
    pop ax
    cmp scanCode,01ch
    je TEXIT
    mov char,al
    mov [si],al
    mov dh, 17 
    mov bl,0Ch ;row
    call PRINT_CHAR
    inc si
    inc sizen
    inc dl
    jmp TOUTER
    TEXIT:
    call WRITE_NAME_IN_FILE
    ret
TAKE_INPUT_NAME endp
INPUT_FIELD proc
    mov boxLength,120
    mov boxWidth,20
    mov al,0fh
    mov color,al
    mov cx,95
    mov dx,130
    call PRINT_BOX  
    ret
INPUT_FIELD endp
page1 proc
    mov al,9fh 
    mov color,al
    mov temp,15
    mov al,0
    mov boolImage,al
    call PAGE_2_DESIGN
    call PRINT_GAME_LOGO
    call INPUT_FIELD
    call PRINT_INPUT_NAME
    call TAKE_INPUT_NAME
    call PRINT_PRESS_TO_CONT
    mov ah,0
    int 16h
    ret
page1 endp
PAGE_2_OPTIONS PROC
    mov ah, 6
    mov al, 0
    mov bx,0700h
    mov cx,080Ch
    mov dx,101Ch
    int 10h
    mov ah, 6
    mov al, 0
    mov bx,0f00h
    mov cx,070Bh
    mov dx,0F1Bh
    int 10h
    mov bh,0
    mov si,offset printGameA
    mov temp,11
    mov dl,15
    mov dh,8
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset printGameB
    mov temp,12
    mov dl,15
    mov dh,10
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset printInstruction
    mov temp,11
    mov dl,15
    mov dh,12
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset printSettings
    mov temp,8
    mov dl,15
    mov dh,14
    mov bl,0ch
    CALL PRINT_TEXT
    ret
PAGE_2_OPTIONS ENDP
PAGE_2_BACKGROUND proc
    call PAGE_2_OPTIONS
    mov al,2fh
    mov color,al
    mov temp,15
    call PAGE_2_DESIGN
    mov ah, 6
    mov al, 0
    mov bx,0700h
    mov cx,1303h
    mov dx,1524h
    int 10h
    mov ah, 6
    mov al, 0
    mov bx,0700h
    mov cx,030eh
    mov dx,0518h
    int 10h
    mov bh,0
    mov si,offset printName
    mov temp,4
    mov dl,23
    mov dh,20
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset mainMenu
    mov temp,9
    mov dl,15
    mov dh,4
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset uName
    mov ax,sizen
    mov temp,ax
    mov dl,28
    mov dh,20
    mov bl,0eh
    CALL PRINT_TEXT
    mov si,offset printHighScore
    mov bh,0
    mov temp,10
    mov dl,4
    mov dh,20
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset scoresbfr
    mov temp,4
    mov dl,15
    mov dh,20
    mov bl,0eh
    CALL PRINT_TEXT
    cmp soundBool,1
    jne NEXT
    call PlaySOUND
    NEXT:
    ret
PAGE_2_BACKGROUND endp
RESTORE_POSITION proc
    mov ax,pos_x
    mov tempPosX,ax
    mov ax,pos_y
    mov tempPosY,ax
    mov ax,cols
    mov temp_c,ax
    mov ax,rows
    mov temp_r,ax
    ret
RESTORE_POSITION endp
ARROW_MOVEMENT proc
    mov si, offset arrowbfr
    cmp scanCode, 50h  
    je down_pressed
    jmp drawAroow
    down_pressed:
    cmp pageNo,3
    ja RN
    inc pageNo
    add pos_y,17
    call PRINT_IMAGE
    jmp exit
    RN:
    mov pos_x,100
    mov pos_y,63
    mov pageNo,0
    call RESTORE_POSITION
    drawAroow:
    call PRINT_IMAGE
    exit:
    mov al,pageNo
    add al,30h
    mov char,al
    mov dl,36
    mov dh,22
    mov bl,0fh
    call PRINT_CHAR
    ret
ARROW_MOVEMENT endp
page2 proc
    mov boolImage,0
    call GRAPHIC_MODE
    call PAGE_2_BACKGROUND
    mov rows,7
    mov cols,8
    mov pos_x,100
    mov pos_y,63
    START: 
    CALL PAGE_2_OPTIONS
    call RESTORE_POSITION
    call ARROW_MOVEMENT
    mov ah,0h   
    int 16h  
    mov scanCode, ah 
    cmp al,71h
    je NEXT
    cmp al ,0Dh
    je MOVE
    cmp soundBool,1
    jne L1  
    mov freq,2031
    call SOUND
    L1:
    cmp scanCode,48h
    jne HEAD
    mov scanCode, 50h
    HEAD:
    jmp START
    MOVE:
    call moveFromP2
    NEXT:

    ret
page2 endp
PRINT_TEXT PROC
    PRINT:
    mov al,[si]
    mov char,al 
    call PRINT_CHAR
    inc si
    inc dl
    dec temp
    cmp temp,0
    jne PRINT
    RET
PRINT_TEXT ENDP
PRINT_CHAR proc
    mov ah, 2
    int 10h
    mov al,char    ;ASCII code of Character 
    mov bh,0
    mov cx,1    
    mov ah,09h
    int 10h
    ret
PRINT_CHAR endp
PAGE_2_DESIGN proc
    mov boxLength,319
    mov boxWidth,199
    mov cx,0
    mov dx,0
    DRAW:
    call PRINT_BOX
    inc cx
    inc dx
    sub boxLength,2
    sub boxWidth,2
    dec color
    dec temp
    cmp temp,0
    jne DRAW
    ret
PAGE_2_DESIGN endp
SOUND proc

    mov     al, 182         
    out     43h, al        
    mov     ax, freq    
    out     42h, al        
    mov     al, ah         
    out     42h, al 
    in      al, 61h         
    or      al, 00000011b   
    out     61h, al         
    mov     bx, 25         
    pause1:
    mov     cx, 6550
    pause2:
    dec     cx
    jne     pause2
    dec     bx
    jne     pause1
    in      al, 61h         
    and     al, 11111100b   
    out     61h, al       
    RET
SOUND endp
PlaySOUND PROC
    mov temp,36
    mov si,offset frequencies
    SOUNDER:
    mov ax,[si]
    mov freq,ax
    call SOUND
	add si,2
	dec temp
    cmp temp,0
    jne SOUNDER
	RET
PlaySOUND endp
SETTING_PAGE_DESIGN PROC
      mov ah, 6
    mov al, 0
    mov bx,0700h
    mov cx,080Ch
    mov dx,101Ch
    int 10h
    mov ah, 6
    mov al, 0
    mov bx,0f00h
    mov cx,070Bh
    mov dx,0F1Bh
    int 10h
    mov bh,0
    mov si,offset settingMsg
    mov temp,13
    mov dl,13
    mov dh,09
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset onMsg
    mov temp,2
    mov dl,18
    mov dh,11
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset offMsg
    mov temp,3
    mov dl,18
    mov dh,13
    mov bl,0ch
    CALL PRINT_TEXT
    ret
SETTING_PAGE_DESIGN ENDP
SETTING_ARROW proc
    cmp scanCode, 50h  
    je down_pressed
    jmp drawAroow
    down_pressed:
    mov al,numOfOpt
    cmp pageNo,al
    ja RN
    inc pageNo
    add pos_y,17
    call PRINT_IMAGE
    jmp exit
    RN:
    mov ax,temp_X
    mov pos_x,ax
    mov ax,temp_Y
    mov pos_y,ax
    mov pageNo,0
    call RESTORE_POSITION
    drawAroow:
    call PRINT_IMAGE
    exit:
    mov al,pageNo
    add al,30h
    mov char,al
    mov dl,36
    mov dh,22
    mov bl,0fh
    call PRINT_CHAR
    ret
SETTING_ARROW endp
SETTING_PAGE proc
    call GRAPHIC_MODE
    mov al,0
    mov boolImage,al
    mov al,1
    mov numOfOpt,al
    mov temp,15
    mov al,6fh
    mov color,al
    call PAGE_2_DESIGN
    mov rows,7
    mov cols,8
    mov temp_X,125
    mov pos_x,125
    mov temp_y,88
    mov pos_y,88
    START: 
    CALL SETTING_PAGE_DESIGN
    call RESTORE_POSITION
    mov si, offset arrowbfr
    call SETTING_ARROW
    mov ah,0h   
    int 16h  
    mov scanCode, ah 
    cmp al ,0Dh
    je MOVE
    cmp soundBool,1
    jne L1  
    mov freq,2031
    call SOUND
    L1:
    cmp scanCode,48h
    jne HEAD
    mov scanCode, 50h
    HEAD:
    jmp START
    MOVE:
    cmp pageNo,1
    je GA
    cmp pageNo,0
    je GA
    cmp pageNo,2
    je GB
    GA:
    mov soundBool,1
    jmp exit
    GB:
    mov soundBool,0
    exit:
    call PRINT_PRESS_TO_CONT
    mov ah, 00h   
    int 16h
    ret
SETTING_PAGE endp
INSTRUCTION_PAGE proc
    call GRAPHIC_MODE
    mov temp,15
    mov al,7fh
    mov color,al
    call PAGE_2_DESIGN
    mov bh,0
    mov si,offset instHead
    mov temp,11
    mov dl,15
    mov dh,6
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset inst1
    mov temp,35
    mov dl,3
    mov dh,8
    mov bl,0ch
    CALL PRINT_TEXT
     mov si,offset inst2
    mov temp,33
    mov dl,3
    mov dh,10
    mov bl,0ch
    CALL PRINT_TEXT
     mov si,offset inst3
    mov temp,31
    mov dl,3
    mov dh,12
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset inst4
    mov temp,28
    mov dl,3
    mov dh,14
    mov bl,0ch
    CALL PRINT_TEXT
    mov si,offset inst5
    mov temp,35
    mov dl,3
    mov dh,16
    mov bl,0ch
    CALL PRINT_TEXT
    call PRINT_PRESS_TO_CONT
        mov ah, 00h   
        int 16h
    
    ret
INSTRUCTION_PAGE endp
PRINT_IMAGE proc
    mov dx,tempPosY
    OUTER_LOOP:
    mov cx,tempPosX
    mov ax,temp_c
    mov temp,ax
    INNER_LOOP:
    mov al,[si]
    cmp boolImage,1
    je LLP
    sub al,30h
    LLP:
    mov color,al
    cmp al,0
    jne L1
    inc cx
    jmp L2
    L1:      
    call MOVE_RIGHT_PIXEL   
    L2:
    inc si         
    dec temp
    cmp temp,0        
    jne INNER_LOOP 
    dec temp_r         
    mov cx,pos_x     
    inc dx  
    cmp temp_r,0        
    jne OUTER_LOOP   
    ret
PRINT_IMAGE endp

PAGE3_BACKGROUND PROC
    mov ax,15
    mov temp,ax
    mov al,2fh
    mov color,al
    call PAGE_2_DESIGN
    mov si,offset shotMsg
    mov bl,2fh
    mov dl,4
    mov dh,21
    mov temp,5
    call PRINT_TEXT
    mov boxLength,120
    mov boxWidth,21
    mov al,2fh
    mov color,al
    mov cx,24
    mov dx,160
    call PRINT_BOX     
    mov ax,15
    mov temp,ax
    mov al,2fh
    mov color,al
    call PAGE_2_DESIGN
    mov si,offset hitMsg
    mov bl,2fh
    mov dl,20
    mov dh,21
    mov temp,6
    call PRINT_TEXT
    mov boxLength,143
    mov boxWidth,21
    mov al,2fh
    mov color,al
    mov cx,152
    mov dx,160
    call PRINT_BOX  
    mov si,offset scoreMsg
    mov bl,2fh
    mov dl,4
    mov dh,3
    mov temp,6
    call PRINT_TEXT
    mov boxLength,110
    mov boxWidth,16
    mov al,2fh
    mov color,al
    mov cx,24
    mov dx,19
    call PRINT_BOX  
    mov si,offset pauseMsg
    mov bl,2fh
    mov dl,19
    mov dh,3
    mov temp,16
    call PRINT_TEXT
    mov boxLength,153
    mov boxWidth,16
    mov al,2fh
    mov color,al
    mov cx,142
    mov dx,19
    call PRINT_BOX  
ret
PAGE3_BACKGROUND ENDP
PRINT_SHOTS PROC
    mov boolImage,1
    mov al,shotNum
    mov tempR,al
    mov rows,7
    mov cols,4
    mov pos_x,80
    mov pos_y,168
    L1:
    mov si,offset shotImage
    call RESTORE_POSITION
    call PRINT_IMAGE
    dec tempR
    add pos_x,6
    cmp tempR,0
    jne L1

    mov al,numShots
    mov tempR,al
    mov rows,7
    mov cols,4
    mov pos_x,80
    mov pos_y,168
    L2:
    cmp tempR,0
    je exit
    mov si,offset shotImageB
    call RESTORE_POSITION
    call PRINT_IMAGE
    dec tempR
    add pos_x,6
    jmp L2
    exit:

    ret
PRINT_SHOTS ENDP
PRINT_DUCKS PROC
    mov boolImage,1
    mov al,duckNum
    mov tempR,al
    mov rows,7
    mov cols,4
    mov pos_x,217
    mov pos_y,168
    L1:
    mov si,offset shotImage
    call RESTORE_POSITION
    call PRINT_IMAGE
    dec tempR
    add pos_x,6
    cmp tempR,0
    jne L1

    mov al,numHitted
    mov tempR,al
    mov rows,7
    mov cols,4
    mov pos_x,217
    mov pos_y,168
    L2:
    cmp tempR,0
    je exit
    mov si,offset shotImageB
    call RESTORE_POSITION
    call PRINT_IMAGE
    dec tempR
    add pos_x,6
    jmp L2
    exit:
    ret
PRINT_DUCKS ENDP
PRINT_PAUSE_BOXES PROC
     mov ah, 6
    mov al, 0
    mov bx,2f00h
    mov cx,090Ch
    mov dx,0F1Ah
    int 10h
    mov ah, 6
    mov al, 0
    mov bx,2d00h
    mov cx,080Bh
    mov dx,0E19h
    int 10h
    mov bh,0
    mov si,offset resumeMsg
    mov temp,6
    mov dl,15
    mov dh,9
    mov bl,03h
    CALL PRINT_TEXT
    mov si,offset restartMsg
    mov temp,7
    mov dl,15
    mov dh,11
    mov bl,03h
    CALL PRINT_TEXT
    mov si,offset quitMsg
    mov temp,4
    mov dl,15
    mov dh,13
    mov bl,03h
    CALL PRINT_TEXT
    ret
PRINT_PAUSE_BOXES ENDP
PAUSE_MENUE PROC
    mov al,1
    mov boolImage,al
    mov al,2
    mov numOfOpt,al
    mov rows,7
    mov cols,8
    mov pos_x,100
    mov temp_X,100
    mov pos_y,71
    mov temp_Y,71
    START: 
    call PRINT_PAUSE_BOXES
    call RESTORE_POSITION
    mov si,offset pauseArrow
    call SETTING_ARROW
    mov ah,0h   
    int 16h  
    mov scanCode, ah 
    cmp al ,0Dh
    je exit
    cmp soundBool,1
    jne L1  
    mov freq,2031
    call SOUND
    L1:
    cmp scanCode,48h
    jne HEAD
    mov scanCode, 50h
    HEAD:
    jmp START
    exit:
    ret
PAUSE_MENUE ENDP
