; ISQRT - calculates the square root of a 32-bit integer.
; on entry: dx:ax = integer to calculate root of
; on exit: ax = root, other registers preserved
; author: John Metcalf
; length: 25 bytes

isqrt:
  push cx
  mov cx,0FFFFh ; cx = first guess
  cmp dx,cx     ; if dx = 0FFFFh then square root = 0FFFFh
  jz isqrtdone
isqrtloop:
  push ax
  push dx
  div cx        ; divide by guess
  add cx,ax
  rcr cx,1      ; calculate average for new guess
  cmp ax,cx
  pop dx
  pop ax
  jc isqrtloop
isqrtdone:
  xchg ax,cx
  pop cx
  ret
