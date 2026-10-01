========================================================================
t_sk_stupid  0x000a87fc  96 bytes   mkboss.c
========================================================================

000a87fc  ldr.w   r3, [r0, #0xa4]
000a8800  ldr.w   r2, [r0, #0x108]
000a8804  adds    r3, #1
000a8806  ldr.w   r1, [r0, r3, lsl #3]
000a880a  cbz     r1, #0xa8812
000a880c  mvn     r0, #2
000a8810  bx      lr
000a8812  ldr     r3, [pc, #0x40]
000a8814  add     r3, pc ; -> 0x0017b92c  funcs.5589
000a8816  str     r3, [r2, #0x68]
000a8818  movs    r3, #5
000a881a  str     r3, [r2, #0x64]
000a881c  ldr.w   r3, [r0, #0xa4]
000a8820  movw    r2, #0x3e3
000a8824  adds    r3, #1
000a8826  str.w   r2, [r0, r3, lsl #3]
000a882a  ldr.w   r3, [r0, #0xa4]
000a882e  adds    r2, r3, #1
000a8830  ldr     r3, [pc, #0x24]
000a8832  str.w   r2, [r0, #0xa4]
000a8836  add     r3, pc ; -> 0x000f3404  t_random_do
000a8838  ldr.w   ip, [r3]
000a883c  lsls    r3, r2, #3
000a883e  adds    r3, r3, r0
000a8840  str.w   ip, [r3, #4]
000a8844  ldr.w   r3, [r0, #0xa4]
000a8848  adds    r3, #1
000a884a  str.w   r1, [r0, r3, lsl #3]
000a884e  mov     r0, r1
000a8850  b       #0xa8810
000a8852  nop     
000a8854  adds    r1, #0x14
000a8856  movs    r5, r1
000a8858  add     r3, sp, #0x328
000a885a  movs    r4, r0
