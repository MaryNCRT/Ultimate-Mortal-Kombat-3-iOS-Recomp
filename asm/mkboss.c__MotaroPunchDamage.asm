========================================================================
MotaroPunchDamage  0x000a8560  44 bytes   mkboss.c
========================================================================

000a8560  ldr     r3, [pc, #0x24]
000a8562  add     r3, pc ; -> 0x000f3624  Destiny
000a8564  ldr     r3, [r3]
000a8566  ldr     r0, [r3]
000a8568  cbz     r0, #0xa857c
000a856a  cmp     r0, #1
000a856c  beq     #0xa8584
000a856e  cmp     r0, #2
000a8570  beq     #0xa8580
000a8572  cmp     r0, #3
000a8574  ite     ne
000a8576  movne   r0, #0x28
000a8578  moveq   r0, #0x20
000a857a  bx      lr
000a857c  adds    r0, #0xa
000a857e  b       #0xa857a
000a8580  adds    r0, #0x17
000a8582  b       #0xa857a
000a8584  adds    r0, #0x13
000a8586  b       #0xa857a
000a8588  sub     sp, #0xf8
000a858a  movs    r4, r0
