; TOUPPER - convert a string to uppercase
; on entry: ds:si = pointer to string, first word of string is length
; on exit: si & cx corrupt
; author: John Metcalf
; length: 27 bytes

toupper:
  mov cx,word[si]
  inc si
  inc si
touppernc:
  cmp byte[si],'a'
  jb touppernl
  cmp byte[si],'z'+1
  jnb touppernl
  sub byte[si],020h
touppernl:
  inc si
  loop touppernc
  ret
