.model small
.stack 100h
.data
    temp_loop db 1
    game_status db 0
    duck_status db 0
    AIM_POS_X dw 0
    AIM_POS_Y dw 0
    asciiCode db 0
    DUCK_POS dw 0
    numShots db 3
    numHitted db 2
    shotNum db 3
    duckNum db 3
    tempO dw 0
    tempN dw 0
    INCLUDE aa.asm
.code    

DUCK_TWO PROC

    mov boolImage,1
     mov rows,11
    mov cols,16
    mov ax,DUCK_POS
    mov pos_x,ax
    mov pos_y,100
    mov si, offset wing_up
    call RESTORE_POSITION
    call PRINT_IMAGE
    
    ret
DUCK_TWO ENDP


GAMEADUCK proc
    call GRAPHIC_MODE
    RESTART:
    mov numShots,5
    mov shotNum,5
    mov numHitted,3
    mov duckNum,3
    mov di,offset score
    call PAGE3_BACKGROUND
    mov AIM_POS_X,50
    mov AIM_POS_Y,50
    mov DUCK_POS , 260
    call UPDATE_DATA

    START:

            mov temp,0
            mov tempO,0
            mov tempN,0
            mov ax,0
            mov bx,0
            mov cx,0
            mov dx,0

        .IF ((numShots == 0) && (numHitted != 0))
            mov dl,16
            mov dh,11
            mov color,6
            mov bh,0
            mov bl,0ch
            mov temp,8
            mov si,offset printLose
            call PRINT_TEXT
            call PRINT_PRESS_TO_CONT_A
            mov ah,0
            int 16h
            jmp EXIT
        .ENDIF

         .IF (numHitted == 0)
            mov dl,16
            mov dh,11
            mov color,6
            mov bh,0
            mov bl,0ch
            mov temp,7
            mov si,offset printWin
            call PRINT_TEXT
            call PRINT_PRESS_TO_CONT_A
            mov ah,0
            int 16h
            jmp EXIT
        .ENDIF



        .IF (DUCK_POS < 35)
             mov DUCK_POS , 260
        .ENDIF

        dec DUCK_POS
        mov boolImage,0
        call PRINT_GAMEPAGE
        call DUCK_WING_UP
        
        mov temp_loop,10
        .WHILE (temp_loop > 0)
            mov boolImage,0
            call MOVE_AIM
            dec temp_loop
        .ENDW

        mov ah,1h   
        int 16h
        jz START
        mov ah,0
        int 16h  
       
        mov scanCode, ah 
        mov asciiCode, al
        
        .IF (scanCode == 048h)

            .IF (AIM_POS_Y > 48)
                dec AIM_POS_Y
                call MOVE_AIM
            .ENDIF

        .ELSEIF (scanCode == 04bh) 

            .IF (AIM_pos_X > 33)
                dec AIM_POS_X
                call MOVE_AIM
            .ENDIF

        .ELSEIF (scanCode == 04dh)

            .IF (AIM_POS_X < 264)
                inc AIM_POS_X
                call MOVE_AIM
            .ENDIF

        .ELSEIF (scanCode == 050h)

            .IF (AIM_POS_Y < 128)
                inc AIM_POS_Y
                call MOVE_AIM
            .ENDIF

        .ELSEIF (asciiCode == 070h)
            call PAUSE_MENUE
            .IF (pageNo == 2)
                jmp RESTART
            .ELSEIF (pageNo == 3)
                jmp EXIT
            .ENDIF



        .ELSEIF (asciiCode == 073h) 
            dec numShots
            call PRINT_SHOTS
            .IF (soundBool == 1)
                mov freq,10000
                call SOUND
            .ENDIF


            mov ax,DUCK_POS
            add ax,10
            mov temp,ax
            mov ax,AIM_POS_X
            add ax,70
            mov tempO,ax
            mov ax,AIM_POS_Y
            add ax,70
            mov tempN,ax
            mov ax,AIM_POS_X
            mov bx,AIM_POS_Y
            mov cx,tempO
            mov dx,tempN
            .IF ((temp > ax) && (temp > bx) && (temp < cx) && (temp < dx))
                dec numHitted
                call UPDATE_DATA
                mov DUCK_POS,260
            .ENDIF

            

        .ELSEIF (scanCode == 01Ch)
            JMP EXIT
        .ENDIF

    
    JMP START
    
    EXIT:
       
    
    ret
GAMEADUCK endp
GAMEBDUCKS proc
    call GRAPHIC_MODE
    RESTART:
    mov numShots,10
    mov shotNum,10
    mov numHitted,6
    mov duckNum,6
    mov di,offset score
    call PAGE3_BACKGROUND
    mov AIM_POS_X,50
    mov AIM_POS_Y,50
    mov DUCK_POS , 260
    call UPDATE_DATA

    START:

            mov temp,0
            mov tempO,0
            mov tempN,0
            mov ax,0
            mov bx,0
            mov cx,0
            mov dx,0

        .IF ((numShots == 0) && (numHitted != 0))
            mov dl,16
            mov dh,11
            mov color,6
            mov bh,0
            mov bl,0ch
            mov temp,8
            mov si,offset printLose
            call PRINT_TEXT
            call PRINT_PRESS_TO_CONT_A
            jmp EXIT
        .ENDIF

         .IF (numHitted == 0)
            mov dl,16
            mov dh,11
            mov color,6
            mov bh,0
            mov bl,0ch
            mov temp,7
            mov si,offset printWin
            call PRINT_TEXT
            call PRINT_PRESS_TO_CONT_A
            jmp EXIT
        .ENDIF



        .IF (DUCK_POS < 35)
             mov DUCK_POS , 260
        .ENDIF

        dec DUCK_POS
        mov boolImage,0
        call PRINT_GAMEPAGE
        call DUCK_WING_UP
        call DUCK_TWO

        mov temp_loop,10
        .WHILE (temp_loop > 0)
            mov boolImage,0
            call MOVE_AIM
            dec temp_loop
        .ENDW

        mov ah,1h   
        int 16h
        jz START
        mov ah,0
        int 16h  
       
        mov scanCode, ah 
        mov asciiCode, al
        
        .IF (scanCode == 048h)

            .IF (AIM_POS_Y > 48)
                dec AIM_POS_Y
                call MOVE_AIM
            .ENDIF

        .ELSEIF (scanCode == 04bh) 

            .IF (AIM_pos_X > 33)
                dec AIM_POS_X
                call MOVE_AIM
            .ENDIF

        .ELSEIF (scanCode == 04dh)

            .IF (AIM_POS_X < 264)
                inc AIM_POS_X
                call MOVE_AIM
            .ENDIF

        .ELSEIF (scanCode == 050h)

            .IF (AIM_POS_Y < 128)
                inc AIM_POS_Y
                call MOVE_AIM
            .ENDIF

        .ELSEIF (asciiCode == 070h)
            call PAUSE_MENUE
            .IF (pageNo == 2)
                jmp RESTART
            .ELSEIF (pageNo == 3)
                jmp EXIT
            .ENDIF



        .ELSEIF (asciiCode == 073h) 
            dec numShots
            call PRINT_SHOTS
            .IF (soundBool == 1)
                mov freq,10000
                call SOUND
            .ENDIF


            mov ax,DUCK_POS
            add ax,10
            mov temp,ax
            mov ax,AIM_POS_X
            add ax,70
            mov tempO,ax
            mov ax,AIM_POS_Y
            add ax,70
            mov tempN,ax
            mov ax,AIM_POS_X
            mov bx,AIM_POS_Y
            mov cx,tempO
            mov dx,tempN
            .IF ((temp > ax) && (temp > bx) && (temp < cx) && (temp < dx))
                dec numHitted
                call UPDATE_DATA
                mov DUCK_POS,260
            .ENDIF

            

        .ELSEIF (scanCode == 01Ch)
            JMP EXIT
        .ENDIF

    
    JMP START
    
    EXIT:
       
    
    ret
GAMEBDUCKS endp

PRINT_PRESS_TO_CONT_A proc
    mov tempPosX,80
    mov tempPosY,120
    mov temp_c,152
    mov temp_r,7
    mov si,offset acnbfr
    mov al,0
    mov boolImage,al
    call PRINT_IMAGE
    ret
PRINT_PRESS_TO_CONT_A endp

PRINT_SCORE PROC
    mov temp,4
    mov dl,11
    mov dh,3
    mov bl,02fh
    L1:
    mov al,[di]
    mov char,al
    call PRINT_CHAR
    dec temp
    inc dl
    inc di
    cmp temp,0
    jne L1
    ret
PRINT_SCORE ENDP

UPDATE_DATA PROC
    mov bh,0
    call PRINT_SCORE
    call PRINT_SHOTS
    call PRINT_DUCKS
    ret
UPDATE_DATA ENDP
MOVE_AIM PROC
    mov rows,23
    mov cols,23
    mov ax,AIM_POS_X
    mov pos_x,ax
    mov ax,AIM_POS_Y
    mov pos_y,ax
    mov si, offset aimbfr
    call RESTORE_POSITION
    call PRINT_IMAGE
    RET
MOVE_AIM ENDP
DUCK_WING_UP PROC
    mov boolImage,1
     mov rows,11
    mov cols,16
    mov ax,DUCK_POS
    mov pos_x,ax
    mov pos_y,70
    mov si, offset wing_up
    call RESTORE_POSITION
    call PRINT_IMAGE
    ret
DUCK_WING_UP ENDP
PRINT_GAMEPAGE PROC
    mov ah, 6
    mov al, 0
    mov bx,4c00h
    mov cx,0604h
    mov dx,1223h
    int 10h 
    ret
PRINT_GAMEPAGE ENDP
