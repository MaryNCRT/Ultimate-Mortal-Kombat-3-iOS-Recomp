========================================================================
tcf_3  0x0008e8ac  100 bytes   Mayhem.mm
========================================================================

0008e8ac  push    {r4, r7, lr}
0008e8ae  add     r7, sp, #4
0008e8b0  sub     sp, #4
0008e8b2  ldr     r3, [pc, #0x54]
0008e8b4  add     r3, pc ; -> 0x00379c18  ZN6Mayhem4Stat16GET_STRING_ERRORE
0008e8b6  ldr     r2, [r3]
0008e8b8  ldr     r3, [pc, #0x50]
0008e8ba  sub.w   r0, r2, #0xc
0008e8be  add     r3, pc ; -> 0x000f3370  0x0
0008e8c0  ldr     r3, [r3]
0008e8c2  cmp     r0, r3
0008e8c4  bne     #0x8e8cc
0008e8c6  sub.w   sp, r7, #4
0008e8ca  pop     {r4, r7, pc}
0008e8cc  ldr     r3, [r2, #-0x4]
0008e8d0  subs    r1, r2, #4
0008e8d2  subs    r2, r3, #1
0008e8d4  dmb     ish
0008e8d8  mov     ip, r3
0008e8da  ldrex   r4, [r1]
0008e8de  cmp     r4, r3
0008e8e0  beq     #0x8e8f6
0008e8e2  cmp     r4, ip
0008e8e4  mov     r3, r4
0008e8e6  bne     #0x8e8d2
0008e8e8  cmp     r4, #0
0008e8ea  bgt     #0x8e8c6
0008e8ec  add.w   r1, sp, #3
0008e8f0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008e8f4  b       #0x8e8c6
0008e8f6  strex   lr, r2, [r1]
0008e8fa  cmp.w   lr, #0
0008e8fe  bne     #0x8e8da
0008e900  dmb     ish
0008e904  b       #0x8e8e2
0008e906  nop     
0008e908  cbz     r0, #0x8e964
0008e90a  movs    r6, r5
0008e90c  ldr     r2, [pc, #0x2b8]
0008e90e  movs    r6, r0
