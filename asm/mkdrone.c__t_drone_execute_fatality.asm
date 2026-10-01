========================================================================
t_drone_execute_fatality  0x000707cc  220 bytes   mkdrone.c
========================================================================

000707cc  push    {r4, r5, r7, lr}
000707ce  add     r7, sp, #8
000707d0  ldr.w   r3, [r0, #0xa4]
000707d4  mov     r4, r0
000707d6  adds    r3, #1
000707d8  ldr.w   r3, [r0, r3, lsl #3]
000707dc  cbz     r3, #0x707e4
000707de  mvn     r0, #2
000707e2  pop     {r4, r5, r7, pc}
000707e4  ldr     r3, [pc, #0xa8]
000707e6  add     r3, pc ; -> 0x000f357c  G
000707e8  ldr     r2, [r3]
000707ea  ldrsh.w r5, [r2, #0x45a]
000707ee  cbnz    r5, #0x70848
000707f0  bl      #0x586b0 ; -> random32
000707f4  ldr.w   r3, [pc, #0x9c]
000707f8  umull   r2, r3, r0, r3
000707fc  lsrs    r2, r3, #0xd
000707fe  movw    r3, #0x2710
00070802  mls     r0, r2, r3, r0
00070806  cmp.w   r0, #0x3e8
0007080a  bhs     #0x70848
0007080c  ldr     r3, [pc, #0x88]
0007080e  add     r3, pc ; -> 0x000f349c  H
00070810  ldr     r2, [r3]
00070812  ldr     r3, [r2]
00070814  cmp     r3, #0
00070816  ble     #0x70848
00070818  ldr     r3, [r2, #4]
0007081a  cmp     r3, #0
0007081c  ble     #0x70848
0007081e  movs    r0, #4
00070820  mov     r2, r5
00070822  mov     r3, r5
00070824  movs    r1, #0x45
00070826  bl      #0x31a28 ; -> MKEvent_Add
0007082a  ldr.w   r3, [r4, #0xa4]
0007082e  ldr.w   r2, [pc, #0x6c]
00070832  mov     r0, r5
00070834  lsls    r3, r3, #3
00070836  adds    r3, r3, r4
00070838  add     r2, pc ; -> 0x00069365  t_drone_mercy
0007083a  str     r2, [r3, #4]
0007083c  ldr.w   r3, [r4, #0xa4]
00070840  adds    r3, #1
00070842  str.w   r5, [r4, r3, lsl #3]
00070846  b       #0x707e2
00070848  blx     #0xddcbc ; -> rand
0007084c  ands    r0, r0, #0x80
00070850  beq     #0x70870
00070852  ldr.w   r3, [r4, #0xa4]
00070856  ldr.w   r2, [pc, #0x48]
0007085a  movs    r0, #0
0007085c  lsls    r3, r3, #3
0007085e  adds    r3, r3, r4
00070860  add     r2, pc ; -> 0x000694d5  t_drone_do_fatality1
00070862  str     r2, [r3, #4]
00070864  ldr.w   r3, [r4, #0xa4]
00070868  adds    r1, r3, #1
0007086a  str.w   r0, [r4, r1, lsl #3]
0007086e  b       #0x707e2
00070870  ldr.w   r1, [r4, #0xa4]
00070874  ldr.w   ip, [pc, #0x2c]
00070878  lsls    r1, r1, #3
0007087a  adds    r1, r1, r4
0007087c  add     ip, pc ; -> 0x000693e1  t_drone_do_fatality2
0007087e  str.w   ip, [r1, #4]
00070882  ldr.w   r1, [r4, #0xa4]
00070886  adds    r1, #1
00070888  str.w   r0, [r4, r1, lsl #3]
0007088c  b       #0x707e2
0007088e  nop     
00070890  cmp     r5, #0x92
00070892  movs    r0, r1
00070894  asrs    r1, r3, #0x1d
00070896  bne     #0x70808
00070898  cmp     r4, #0x8a
0007089a  movs    r0, r1
0007089c  ldrh    r1, [r5, #0x18]
