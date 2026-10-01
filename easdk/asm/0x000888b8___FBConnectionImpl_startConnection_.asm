========================================================================
-[FBConnectionImpl startConnection]  0x000888b8  116 bytes   FBConnection.mm
========================================================================

000888b8  push    {r4, r7, lr}
000888ba  add     r7, sp, #4
000888bc  sub     sp, #4
000888be  mov     r4, r0
000888c0  ldr     r0, [pc, #0x48]
000888c2  add     r0, pc ; -> 0x00379bc8  session
000888c4  ldr     r0, [r0]
000888c6  cbz     r0, #0x888d8
000888c8  ldr     r1, [pc, #0x44]
000888ca  add     r1, pc ; -> 0x000fcda8  
000888cc  ldr     r1, [r1]
000888ce  blx     #0xddbfc ; -> objc_msgSend
000888d2  tst.w   r0, #0xff
000888d6  bne     #0x88906
000888d8  ldr     r0, [pc, #0x38]
000888da  ldr     r1, [pc, #0x3c]
000888dc  ldr     r2, [pc, #0x3c]
000888de  ldr     r3, [pc, #0x40]
000888e0  add     r0, pc ; -> 0x000fdbc0  
000888e2  add     r1, pc ; -> 0x000fcf74  'L?\x0e'
000888e4  add     r2, pc ; -> 0x00379bd8  m_APIKey
000888e6  add     r3, pc ; -> 0x00379bdc  m_APISecret
000888e8  ldr     r2, [r2]
000888ea  ldr     r3, [r3]
000888ec  ldr     r1, [r1]
000888ee  ldr     r0, [r0]
000888f0  str     r4, [sp]
000888f2  blx     #0xddbfc ; -> objc_msgSend
000888f6  ldr     r1, [pc, #0x2c]
000888f8  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000888fa  ldr     r1, [r1]
000888fc  blx     #0xddbfc ; -> objc_msgSend
00088900  ldr     r3, [pc, #0x24]
00088902  add     r3, pc ; -> 0x00379bc8  session
00088904  str     r0, [r3]
00088906  sub.w   sp, r7, #4
0008890a  pop     {r4, r7, pc}
0008890c  asrs    r2, r0, #0xc
0008890e  movs    r7, r5
00088910  add     sl, fp
00088912  movs    r7, r0
00088914  strh    r4, [r3, r3]
00088916  movs    r7, r0
00088918  mov     lr, r1
0008891a  movs    r7, r0
0008891c  asrs    r0, r6, #0xb
0008891e  movs    r7, r5
00088920  asrs    r2, r6, #0xb
00088922  movs    r7, r5
00088924  mvns    r4, r2
00088926  movs    r7, r0
00088928  asrs    r2, r0, #0xb
0008892a  movs    r7, r5
