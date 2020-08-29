.model tiny

.code
    org 100h

start:
    currRow dw 0
    currPos dw 0
    tempPos dw 0

    countOnes db 0
    countTens db 0
    countHund db 0
    countThou db 0

jmp REALSTART

clearscreen:
    mov ax,0b800h
    mov es,ax
    mov ax,0720h
    mov cx,80*25
	sub di,di
l1:	
	mov es:[di],ax
	add di,2
	loop l1
	ret

up1:
    mov di,currPos
    mov tempPos,di
    sub tempPos,640
    mov al,es:[di]
    mov ah,es:[di+2]
    mov di,tempPos
    mov bl,es:[di]
    mov bh,es:[di+2]
    mov es:[di],al
    mov es:[di+2],ah    
    mov di,currPos
    mov es:[di],bl
    mov es:[di+2],bh
    mov di,tempPos
    mov currPos,di
    ret
left1:
    mov di,currPos
    mov tempPos,di
    sub tempPos,20
    mov al,es:[di]
    mov ah,es:[di+2]
    mov di,tempPos
    mov bl,es:[di]
    mov bh,es:[di+2]
    mov es:[di],al
    mov es:[di+2],ah
    mov di,currPos
    mov es:[di],bl
    mov es:[di+2],bh
    mov di,tempPos
    mov currPos,di
    ret
right1:
    mov di,currPos
    mov tempPos,di
    add tempPos,20
    mov al,es:[di]
    mov ah,es:[di+2]
    mov di,tempPos
    mov bl,es:[di]
    mov bh,es:[di+2]
    mov es:[di],al
    mov es:[di+2],ah
    mov di,currPos
    mov es:[di],bl
    mov es:[di+2],bh
    mov di,tempPos
    mov currPos,di
    ret
down1:
    mov di,currPos
    mov tempPos,di
    add tempPos,640
    mov al,es:[di]
    mov ah,es:[di+2]
    mov di,tempPos
    mov bl,es:[di]
    mov bh,es:[di+2]
    mov es:[di],al
    mov es:[di+2],ah    
    mov di,currPos
    mov es:[di],bl
    mov es:[di+2],bh
    mov di,tempPos
    mov currPos,di
    ret
randNum:
   mov AH, 00h     
   int 1AH    
   mov  ax, dx
   xor  dx, dx
   mov  cx, 255
   div  cx
ret

shuffle:
    call randNum
    mov al,dl
    add al,48
    mov dh,1

    mov cx,dx
lpattern:      
    call up1
    call up1
    call up1
	call up1
    call left1
    call down1
    call down1
    call down1
	call down1
    call left1
    call up1
    call up1
    call up1
    call left1
    call down1
    call down1
    call down1
    call right1
    call right1
    call right1
    call up1
    call left1
    call left1
    call left1
    call up1
    call right1
    call right1
    call right1
    call up1
    call left1
    call left1
    call left1
    call down1
    call right1
    call up1
    call right1
    call down1
    call right1
    call up1
    call left1
    call left1
    call left1
    call down1
    call down1
    call right1
    call up1
    call up1
    call right1
    call down1
    call down1
    call right1
    call up1
    call up1
    call left1
    call left1
    call left1
    call down1
    call down1
    call down1
    call right1
    call right1
    call right1
    cmp cx,0
    je done3
    sub cx,1
    jmp lpattern
done3:  
    call left1
    call up1
    call right1
    call down1
    call left1
    call left1
    call up1
    call up1
    call right1
    call right1
    call down1
    call down1
    call left1
    call left1
    call left1
    call up1
    call up1
    call up1
	call up1
    call right1
    call right1
    call right1
    call down1
    call down1
    call down1
	call down1
    call left1
    call left1
    call left1
    call up1
    call right1
    call right1
    call right1
    call up1
    call left1
    call left1
    call left1
    call up1
    call right1
    call right1
    call right1
    call down1
    call down1
    call down1
    call left1
    call up1
    call up1
    call up1
    call left1
    call down1
    call down1
    call down1
    call left1
    call up1
    call up1
    call up1
	call up1
    call right1
    call down1
    call down1
	call down1
    call down1
    call right1
    call up1
    call up1
    call up1
    call right1
    call down1
    call down1
    call down1
    ret
setBoxBlue:
    mov ax, 1700h
    mov bx,0
    mov cx,7
l6:
l5:	
	mov es:[di],ax
	add di,2
	loop l5
    inc bx
    cmp bx,3
    je done1
    add di,146
    mov cx,8
    loop l6
done1:
    ret

setColor:
    mov ax,0b800h
    mov es,ax
    mov ax,0720h
    mov cx,80*25
	sub di,di
l2:	
	mov es:[di],ax
	add di,2
	loop l2
	mov di,58
    mov ax,0420h;
    mov bx,0
    mov cx,41
l4:
l3:	
	mov es:[di],ax
	add di,2
	loop l3
    inc bx
    cmp bx,21
    je done
    add di,78
    mov cx,42
    loop l4
done:
    mov di,222
    call setBoxBlue
    mov di,242
    call setBoxBlue
    mov di,262
    call setBoxBlue
    mov di,282
    call setBoxBlue
    mov di,862
    call setBoxBlue
    mov di,882
    call setBoxBlue
    mov di,902
    call setBoxBlue
    mov di,922
    call setBoxBlue
    mov di,1502
    call setBoxBlue
    mov di,1522
    call setBoxBlue
    mov di,1542
    call setBoxBlue
    mov di,1562
    call setBoxBlue
    mov di,2142
    call setBoxBlue
    mov di,2162
    call setBoxBlue
    mov di,2182
    call setBoxBlue
    mov di,2202
    call setBoxBlue
	mov di,2782
    call setBoxBlue
    mov di,2802
    call setBoxBlue
    mov di,2822
    call setBoxBlue
    mov di,2842
    call setBoxBlue
    ret
nextrow:
    add currRow,160
    mov di,currRow
    ret
gridcol: 
    mov cx,5
lrow2:
    mov byte ptr es:[di],186
    add di,20
    loop lrow2
    ret
gridrow:
    mov cx,40
    mov byte ptr es:[di],204
lrow3:
    add di, 2
    mov byte ptr es:[di],205
    loop lrow3
    mov byte ptr es:[di],185; 
    mov byte ptr es:[di-60],206
    mov byte ptr es:[di-40],206
    mov byte ptr es:[di-20],206
    ret
fullrow:
    call nextrow; 
    call gridcol
    call nextrow
    call gridcol
    call nextrow
    call gridcol
    call nextrow 
    call gridrow
    ret
grid:
    mov di,494
    mov ax,0420h
    mov es:[di+24],ax
    mov es:[di+26],ax
    mov es:[di+28],ax
    mov es:[di+30],ax
    mov byte ptr es:[di],'M'
    mov byte ptr es:[di+2],'O'
    mov byte ptr es:[di+4],'V'
    mov byte ptr es:[di+6],'E'
    mov byte ptr es:[di+8],' '
    mov byte ptr es:[di+10],'C'
    mov byte ptr es:[di+12],'O'
    mov byte ptr es:[di+14],'U'
    mov byte ptr es:[di+16],'N'
    mov byte ptr es:[di+18],'T'
    mov byte ptr es:[di+20],':'
    mov byte ptr es:[di+22],' '
    mov byte ptr es:[di+24],'0'
    mov byte ptr es:[di+26],'0'
    mov byte ptr es:[di+28],'0'
    mov byte ptr es:[di+30],'0'
    mov di,1770
    mov ax,0420h
    mov es:[di],ax
    mov byte ptr es:[di],'S'
    mov byte ptr es:[di+2],' '
    mov byte ptr es:[di+4],'T'
    mov byte ptr es:[di+6],'O'
    mov byte ptr es:[di+8],' '
    mov byte ptr es:[di+10],'S'
    mov byte ptr es:[di+12],'H'
    mov byte ptr es:[di+14],'U'
    mov byte ptr es:[di+16],'F'
    mov byte ptr es:[di+18],'F'
    mov byte ptr es:[di+20],'L'
    mov byte ptr es:[di+22],'E'
    mov di,1930
    mov ax,0420h
    mov es:[di],ax
    mov byte ptr es:[di],'Q'
    mov byte ptr es:[di+2],' '
    mov byte ptr es:[di+4],'T'
    mov byte ptr es:[di+6],'O'
    mov byte ptr es:[di+8],' '
    mov byte ptr es:[di+10],'Q'
    mov byte ptr es:[di+12],'U'
    mov byte ptr es:[di+14],'I'
    mov byte ptr es:[di+16],'T'
    mov di,2090
    mov ax,0420h
    mov es:[di],ax
    mov byte ptr es:[di],'N'
    mov byte ptr es:[di+2],' '
    mov byte ptr es:[di+4],'S'
    mov byte ptr es:[di+6],'E'
    mov byte ptr es:[di+8],'E'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],'S'
    mov byte ptr es:[di+14],'O'
    mov byte ptr es:[di+16],'L'
	mov byte ptr es:[di+18],'V'
    mov byte ptr es:[di+20],'E'
    mov byte ptr es:[di+22],'D'
    mov byte ptr es:[di+24],' '
    mov byte ptr es:[di+26],'B'
    mov byte ptr es:[di+28],'O'
    mov byte ptr es:[di+30],'A'
    mov byte ptr es:[di+32],'R'
	mov byte ptr es:[di+34],'D'
    mov di,1130
    mov ax,0420h
    mov es:[di+12],ax
    mov byte ptr es:[di],'P'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],'E'
    mov byte ptr es:[di+6],'S'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],24
    mov di,1290
    mov ax,0420h
    mov es:[di+12],ax
    mov byte ptr es:[di],'P'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],'E'
    mov byte ptr es:[di+6],'S'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],25
    mov di,1450
    mov ax,0420h
    mov es:[di+12],ax
    mov byte ptr es:[di],'P'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],'E'
    mov byte ptr es:[di+6],'S'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],26
    mov di,1610
    mov ax,0420h
    mov es:[di+12],ax
    mov byte ptr es:[di],'P'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],'E'
    mov byte ptr es:[di+6],'S'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],27

  
    mov currRow, 58
    mov di,currRow
    mov cx,40
    mov byte ptr es:[di],201
ltoprow: 
    add di, 2
    mov byte ptr es:[di],205
    loop ltoprow
    mov byte ptr es:[di],187
    mov byte ptr es:[di-60],203
    mov byte ptr es:[di-40],203
    mov byte ptr es:[di-20],203
    call fullrow
    call fullrow
    call fullrow
    call fullrow
	call fullrow
    mov di,currRow
    mov cx,40
    mov byte ptr es:[di],200
lbottomrow:  
    add di, 2
    mov byte ptr es:[di],205
    loop lbottomrow
    mov byte ptr es:[di],188
    mov byte ptr es:[di-60],202
    mov byte ptr es:[di-40],202
    mov byte ptr es:[di-20],202
new:
    mov currPos,3008
    mov di,388
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],' ';
    mov di,408
    mov byte ptr es:[di],'2';
    mov byte ptr es:[di+2],' ';
    mov di,428
    mov byte ptr es:[di],'3';
    mov byte ptr es:[di+2],' ';
    mov di,448
    mov byte ptr es:[di],'4';
    mov byte ptr es:[di+2],' ';
    mov di,1028
    mov byte ptr es:[di],'5';
    mov byte ptr es:[di+2],' ';
    mov di,1048
    mov byte ptr es:[di],'6';
    mov byte ptr es:[di+2],' ';
    mov di,1068
    mov byte ptr es:[di],'7';
    mov byte ptr es:[di+2],' ';
    mov di,1088
    mov byte ptr es:[di],'8';
    mov byte ptr es:[di+2],' ';
    mov di,1668
    mov byte ptr es:[di],'9';
    mov byte ptr es:[di+2],' ';
    mov di,1688
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'0';
    mov di,1708
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'1';
    mov di,1728
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'2';
    mov di,2308
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'3';
    mov di,2328
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'4';
    mov di,2348
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'5';
    mov di,2368
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'6';
	mov di,2948
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'7';
	mov di,2968
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'8';
	mov di,2988
    mov byte ptr es:[di],'1';
    mov byte ptr es:[di+2],'9';	
	mov di,3008
    mov byte ptr es:[di],' ';
    mov byte ptr es:[di+2],' ';
    ret
counter:
    cmp countThou,10
    jge max
    inc countOnes
    cmp countOnes,10
    je carry1
    jmp displayCounter

carry1:
    mov countOnes,0
    inc countTens
    cmp countTens,10
    je carry2
    jmp displayCounter
carry2:
    mov countTens,0
    inc countHund
    cmp countHund,10
    je carry3
    jmp displayCounter
carry3:
    mov countHund,0
    inc countThou
    cmp countThou,10
    jge max
    jmp displayCounter
max:
    mov di, 1774
    mov byte ptr es:[di+24],'9'    
    mov byte ptr es:[di+26],'9'
    mov byte ptr es:[di+28],'9'    
    mov byte ptr es:[di+30],'9'
    mov byte ptr es:[di+32],'+'
    ret
displayCounter:
    mov di, 494
    mov es:[di+24],0420h
    mov es:[di+26],0420h
    mov es:[di+28],0420h
    mov es:[di+30],0420h

    mov al,[countThou]
    add al,48
    mov byte ptr es:[di+24],al
    mov al,[countHund]
    add al,48
    mov byte ptr es:[di+26],al
    mov al,[countTens]
    add al,48
    mov byte ptr es:[di+28],al
    mov al,[countOnes]
    add al,48
    mov byte ptr es:[di+30],al
    ret
outBound:
    call checkGridInput
checkBounds:
    mov dx,388
    cmp tempPos,dx
    jl outBound
    mov cx,5
    mov dx,368
leftBound:
    cmp tempPos,dx
    je outBound
    add dx,640
    loop leftBound    
    mov cx,4
    mov dx,468
rightBound:
    cmp tempPos,dx
    je outBound
    add dx,640
    loop rightBound  
    mov dx,3008
    cmp tempPos,dx
    jg outBound
    ret
up:
	mov di,678
    mov ax, 0220h
    mov es:[di],ax
    mov es:[di+2],ax    
    mov es:[di+4],ax
    mov es:[di+6],ax    
    mov es:[di+8],ax
    mov es:[di+10],ax
    mov es:[di+12],ax    
    mov es:[di+14],ax
    mov byte ptr es:[di+2],' '    
    mov byte ptr es:[di+4],' '
    mov byte ptr es:[di+6],' '    
    mov byte ptr es:[di+8],' '
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],' '    
    mov byte ptr es:[di+14],' '
    mov di,currPos
    mov tempPos,di
    sub tempPos,640
    call checkBounds
    mov al,es:[di]
    mov ah,es:[di+2]

    mov di,tempPos
    mov bl,es:[di]
    mov bh,es:[di+2]

    mov es:[di],al
    mov es:[di+2],ah
    
    mov di,currPos
    mov es:[di],bl
    mov es:[di+2],bh

    mov di,tempPos
    mov currPos,di
    call counter
    jmp checkGridInput

left: 
	mov di,678
    mov ax, 0220h
    mov es:[di],ax
    mov es:[di+2],ax    
    mov es:[di+4],ax
    mov es:[di+6],ax    
    mov es:[di+8],ax
    mov es:[di+10],ax
    mov es:[di+12],ax    
    mov es:[di+14],ax
    mov byte ptr es:[di+2],' '    
    mov byte ptr es:[di+4],' '
    mov byte ptr es:[di+6],' '    
    mov byte ptr es:[di+8],' '
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],' '    
    mov byte ptr es:[di+14],' '
    mov di,currPos
    mov tempPos,di
    sub tempPos,20
    call checkBounds

    mov al,es:[di]
    mov ah,es:[di+2]

    mov di,tempPos
    mov bl,es:[di]
    mov bh,es:[di+2]

    mov es:[di],al
    mov es:[di+2],ah
    
    mov di,currPos
    mov es:[di],bl
    mov es:[di+2],bh

    mov di,tempPos
    mov currPos,di
    call counter
    jmp checkGridInput

right:
	mov di,678
    mov ax, 0220h
    mov es:[di],ax
    mov es:[di+2],ax    
    mov es:[di+4],ax
    mov es:[di+6],ax    
    mov es:[di+8],ax
    mov es:[di+10],ax
    mov es:[di+12],ax    
    mov es:[di+14],ax
    mov byte ptr es:[di+2],' '    
    mov byte ptr es:[di+4],' '
    mov byte ptr es:[di+6],' '    
    mov byte ptr es:[di+8],' '
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],' '    
    mov byte ptr es:[di+14],' '
    mov di,currPos
    mov tempPos,di
    add tempPos,20
    call checkBounds
    mov al,es:[di]
    mov ah,es:[di+2]
    mov di,tempPos
    mov bl,es:[di]
    mov bh,es:[di+2]
    mov es:[di],al
    mov es:[di+2],ah
    mov di,currPos
    mov es:[di],bl
    mov es:[di+2],bh
    mov di,tempPos
    mov currPos,di
    call counter
    jmp checkGridInput

down:
	mov di,678
    mov ax, 0220h
    mov es:[di],ax
    mov es:[di+2],ax    
    mov es:[di+4],ax
    mov es:[di+6],ax    
    mov es:[di+8],ax
    mov es:[di+10],ax
    mov es:[di+12],ax    
    mov es:[di+14],ax
    mov byte ptr es:[di+2],' '    
    mov byte ptr es:[di+4],' '
    mov byte ptr es:[di+6],' '    
    mov byte ptr es:[di+8],' '
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],' '    
    mov byte ptr es:[di+14],' '
    mov di,currPos
    mov tempPos,di
    add tempPos,640
    call checkBounds

    mov al,es:[di]
    mov ah,es:[di+2]

    mov di,tempPos
    mov bl,es:[di]
    mov bh,es:[di+2]

    mov es:[di],al
    mov es:[di+2],ah
    
    mov di,currPos
    mov es:[di],bl
    mov es:[di+2],bh

    mov di,tempPos
    mov currPos,di
    call counter
    jmp checkGridInput

checkComplete:
    mov di,388
    mov al,'1'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jne return

    mov di,408
    mov al,'2'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jne return

    mov di,428
    mov al,'3'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jne return

    mov di,448
    mov al,'4'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jne return

    mov di,1028
    mov al,'5'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jne return

    mov di,1048
    mov al,'6'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jne return

    mov di,1068
    mov al,'7'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jmp chk1

return:
    ret

chk1:
    mov di,1088
    mov al,'8'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jne return
    
    mov di,1668
    mov al,'9'
    cmp es:[di],al
    jne return
    mov al,' '
    cmp es:[di+2],al
    jne return

    mov di,1688
    mov al,'1'
    cmp es:[di],al
    jne return
    mov al,'0'
    cmp es:[di+2],al
    jne return

    mov di,1708
    mov al,'1'
    cmp es:[di],al
    jne return
    mov al,'1'
    cmp es:[di+2],al
    jne return


    mov di,1728
    mov al,'1'
    cmp es:[di],al
    jne return
    mov al,'2'
    cmp es:[di+2],al
    jne return

    mov di,2308
    mov al,'1'
    cmp es:[di],al
    jne return
    mov al,'3'
    cmp es:[di+2],al
    jne return

    mov di,2328
    mov al,'1'
    cmp es:[di],al
    jne return
    mov al,'4'
    cmp es:[di+2],al
    jne return

    mov di,2348
    mov al,'1'
    cmp es:[di],al
    jne return1
    mov al,'5'
    cmp es:[di+2],al
    jne return1

    mov di,2368
    mov al,'1'
    cmp es:[di],al
    jne return1
    mov al,'6'
    cmp es:[di+2],al
    jne return1
    jmp chk2

return1:
    ret
	
chk2:
    mov di,2948
    mov al,'1'
    cmp es:[di],al
    jne returnlast
    mov al,'7'
    cmp es:[di+2],al
    jne returnlast
    
    mov di,2968
    mov al,'1'
    cmp es:[di],al
    jne returnlast
    mov al,'8'
    cmp es:[di+2],al
    jne returnlast

    mov di,2988
    mov al,'1'
    cmp es:[di],al
    jne returnlast
    mov al,'9'
    cmp es:[di+2],al
    jne returnlast

    mov di,3008
    mov al,' '
    cmp es:[di],al
    jne returnlast
    mov al,' '
    cmp es:[di+2],al
    jne returnlast
	jmp finsh
	
returnlast:
    ret

finsh:
    mov di,678
    mov ax, 0220h
    mov es:[di],ax
    mov es:[di+2],ax    
    mov es:[di+4],ax
    mov es:[di+6],ax    
    mov es:[di+8],ax
    mov es:[di+10],ax
    mov es:[di+12],ax    
    mov es:[di+14],ax
    mov byte ptr es:[di+2],'W'    
    mov byte ptr es:[di+4],'I'
    mov byte ptr es:[di+6],'N'    
    mov byte ptr es:[di+8],'N'
    mov byte ptr es:[di+10],'N'
    mov byte ptr es:[di+12],'E'    
    mov byte ptr es:[di+14],'R'
	ret
return2:
    ret
checkGridInput:
    call checkComplete
    mov ah,00h
    int 16h
    cmp al,'q'
    je quitGrid
    cmp al,'s'
    je restart
	cmp al,'n'
    je newl
    cmp ah,48h
    je INup
    cmp ah,4Bh
    je INleft
    cmp ah,4Dh
    je INright
    cmp ah,50h
    je INdown
    jmp checkGridInput
INup:
    call up
INleft:
    call left
INright:
    call right
INdown:
    call down
quitGrid:
    call clearscreen
    int 20h
restart:
    call clearscreen
    mov currRow,0
    mov currPos,0
    mov tempPos,0
    mov countThou,0
    mov countHund,0
    mov countTens,0
    mov countOnes,0
    sub di,di
    sub ax,ax
    sub bx,bx
    sub cx,cx
    sub dx,dx
    jmp REALSTART
newl:
    call clearscreen
    mov currRow,0
    mov currPos,0
    mov tempPos,0
    mov countThou,0
    mov countHund,0
    mov countTens,0
    mov countOnes,0
    sub di,di
    sub ax,ax
    sub bx,bx
    sub cx,cx
    sub dx,dx
    jmp REALSTART2
REALSTART2:
    call clearscreen
    call setColor
    call grid
    call checkGridInput
    int 20h
REALSTART:
    call clearscreen
    call setColor
    call grid
    call shuffle
    call checkGridInput
    int 20h
end start