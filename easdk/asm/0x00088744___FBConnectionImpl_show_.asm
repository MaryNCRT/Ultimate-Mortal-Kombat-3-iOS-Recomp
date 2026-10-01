========================================================================
-[FBConnectionImpl show]  0x00088744  152 bytes   FBConnection.mm
========================================================================

00088744  push    {r4, r5, r6, r7, lr}
00088746  add     r7, sp, #0xc
00088748  ldr     r4, [pc, #0x68]
0008874a  ldr     r1, [pc, #0x6c]
0008874c  mov     r6, r0
0008874e  add     r4, pc ; -> 0x00379bc8  session
00088750  add     r1, pc ; -> 0x000fcda8  
00088752  ldr     r0, [r4]
00088754  ldr     r1, [r1]
00088756  blx     #0xddbfc ; -> objc_msgSend
0008875a  tst.w   r0, #0xff
0008875e  bne     #0x88768
00088760  ldr     r5, [pc, #0x58]
00088762  add     r5, pc ; -> 0x00379be0  m_showing
00088764  ldrb    r3, [r5]
00088766  cbz     r3, #0x8876a
00088768  pop     {r4, r5, r6, r7, pc}
0008876a  ldr     r0, [pc, #0x54]
0008876c  ldr     r1, [pc, #0x54]
0008876e  add     r0, pc ; -> 0x000fdbec  
00088770  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00088772  ldr     r0, [r0]
00088774  ldr     r1, [r1]
00088776  blx     #0xddbfc ; -> objc_msgSend
0008877a  ldr     r1, [pc, #0x4c]
0008877c  ldr     r2, [r4]
0008877e  ldr     r4, [pc, #0x4c]
00088780  add     r1, pc ; -> 0x000fccd8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x360
00088782  ldr     r1, [r1]
00088784  blx     #0xddbfc ; -> objc_msgSend
00088788  ldr     r1, [pc, #0x44]
0008878a  add     r4, pc ; -> 0x00379bcc  m_dialog
0008878c  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
0008878e  ldr     r1, [r1]
00088790  blx     #0xddbfc ; -> objc_msgSend
00088794  ldr     r1, [pc, #0x3c]
00088796  mov     r2, r6
00088798  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
0008879a  ldr     r1, [r1]
0008879c  str     r0, [r4]
0008879e  blx     #0xddbfc ; -> objc_msgSend
000887a2  ldr     r1, [pc, #0x34]
000887a4  ldr     r0, [r4]
000887a6  add     r1, pc ; -> 0x000fcd8c  
000887a8  ldr     r1, [r1]
000887aa  blx     #0xddbfc ; -> objc_msgSend
000887ae  movs    r3, #1
000887b0  strb    r3, [r5]
000887b2  b       #0x88768
000887b4  asrs    r6, r6, #0x11
000887b6  movs    r7, r5
000887b8  mov     r4, sl
000887ba  movs    r7, r0
000887bc  asrs    r2, r7, #0x11
000887be  movs    r7, r5
000887c0  strb    r2, [r7, r1]
000887c2  movs    r7, r0
000887c4  tst     r0, r2
000887c6  movs    r7, r0
000887c8  cmp     r4, sl
000887ca  movs    r7, r0
000887cc  asrs    r6, r7, #0x10
000887ce  movs    r7, r5
000887d0  cmp     r0, r8
000887d2  movs    r7, r0
000887d4  add     ip, fp
000887d6  movs    r7, r0
000887d8  cmp     sl, ip
000887da  movs    r7, r0
