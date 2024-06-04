.model small
.stack 100h
.data
    INCLUDE aaa.asm
.code




moveFromP2 proc
 call GRAPHIC_MODE
   
    cmp pageNo,1
    je GA
    cmp pageNo,0
    je GA
    cmp pageNo,2
    je GB
    cmp pageNo,3
    je INST
    cmp pageNo,4
    je SND
    GA:
    call GAMEADUCK
    mov pageNo,0
    jmp EXIT
    GB:
    call GAMEBDUCKS
    mov pageNo,0
    jmp EXIT
    INST:
    call INSTRUCTION_PAGE
    mov pageNo,0
    jmp EXIT
    SND:
    call SETTING_PAGE
    mov pageNo,0
    jmp EXIT
    EXIT:
    call page2
    ret
moveFromP2 endp
GameStart proc
    call page1
    call GRAPHIC_MODE
    call page2
    mov ah,0
    int 16h
    ret
GameStart endp
main proc
    mov ax, @data    
    mov ds, ax  
    call LOAD_IMAGES
    call GRAPHIC_MODE
    call GameStart
    mov ah, 4ch     
    int 21h
main endp
end main
