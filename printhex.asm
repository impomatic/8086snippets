; PRINTHEX - display an unsigned 16-bit integer in hexadecimal
; on entry: ax = unsigned integer to print
; on exit: all registers preserved
; author: John Metcalf
; length: 24 bytes

printhex:
  push cx
  mov cl,12

phloop:
  push ax

  ror ax,cl
  or al,0F0h
  cmp al,0FAh
  sbb al,0B9h
  das

  call PUTCHAR

  pop ax
  sub cl,4
  jnc phloop

  pop cx
  ret

PUTCHAR:          ; placeholder routine
  xchg ax,dx
  mov ah,02
  int 021
  ret
