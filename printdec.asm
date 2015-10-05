; PRINTDEC - recursive routine to display an unsigned 16-bit integer in decimal
; on entry: ax = unsigned integer to print
; on exit: all registers preserved
; author: John Metcalf
; length: 27 bytes

printdec:
  push ax
  push cx
  push dx
  mov cx,10
  xor dx,dx
  div cx
  test ax,ax
  je pdbye
  call printdec

pdbye:
  xchg ax,dx
  add al,'0'
  call PUTCHAR
  pop dx
  pop cx
  pop ax
  ret

PUTCHAR:          ; placeholder routine
  xchg ax,dx
  mov ah,02
  int 021
  ret
