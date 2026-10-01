========================================================================
tcf_1  0x0008e910  100 bytes   Mayhem.mm
========================================================================

0008e910  push    {r4, r7, lr}
0008e912  add     r7, sp, #4
0008e914  sub     sp, #4
0008e916  ldr     r3, [pc, #0x54]
0008e918  add     r3, pc ; -> 0x00379bfc  ZN6Mayhem4User16GET_STRING_ERRORE
0008e91a  ldr     r2, [r3]
0008e91c  ldr     r3, [pc, #0x50]
0008e91e  sub.w   r0, r2, #0xc
0008e922  add     r3, pc ; -> 0x000f3370  0x0
0008e924  ldr     r3, [r3]
0008e926  cmp     r0, r3
0008e928  bne     #0x8e930
0008e92a  sub.w   sp, r7, #4
0008e92e  pop     {r4, r7, pc}
0008e930  ldr     r3, [r2, #-0x4]
0008e934  subs    r1, r2, #4
0008e936  subs    r2, r3, #1
0008e938  dmb     ish
0008e93c  mov     ip, r3
0008e93e  ldrex   r4, [r1]
0008e942  cmp     r4, r3
0008e944  beq     #0x8e95a
0008e946  cmp     r4, ip
0008e948  mov     r3, r4
0008e94a  bne     #0x8e936
0008e94c  cmp     r4, #0
0008e94e  bgt     #0x8e92a
0008e950  add.w   r1, sp, #3
0008e954  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e958  b       #0x8e92a
0008e95a  strex   lr, r2, [r1]
0008e95e  cmp.w   lr, #0
0008e962  bne     #0x8e93e
0008e964  dmb     ish
0008e968  b       #0x8e946
0008e96a  nop     
0008e96c  uxtb    r0, r4
0008e96e  movs    r6, r5
0008e970  ldr     r2, [pc, #0x128]
0008e972  movs    r6, r0
