========================================================================
-[FBRequest md5HexDigest  0x000864a0  140 bytes   FBRequest.m
========================================================================

000864a0  push    {r4, r5, r6, r7, lr}
000864a2  add     r7, sp, #0xc
000864a4  push.w  {r8, sl}
000864a8  sub     sp, #0x10
000864aa  ldr     r1, [pc, #0x6c]
000864ac  mov     r0, r2
000864ae  ldr.w   r8, [pc, #0x6c]
000864b2  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000864b4  mov     sl, sp
000864b6  ldr     r1, [r1]
000864b8  blx     #0xddbfc ; -> objc_msgSend
000864bc  add     r8, pc ; -> 0x0017ebf4  
000864be  mov     r4, r0
000864c0  blx     #0xdde0c ; -> strlen
000864c4  mov     r2, sp
000864c6  mov     r1, r0
000864c8  mov     r0, r4
000864ca  blx     #0xdd0c8 ; -> CC_MD5
000864ce  ldr     r0, [pc, #0x50]
000864d0  ldr     r1, [pc, #0x50]
000864d2  movs    r2, #0x20
000864d4  add     r0, pc ; -> 0x000fdbf8  
000864d6  add     r1, pc ; -> 0x000fcea0  
000864d8  ldr     r0, [r0]
000864da  ldr     r1, [r1]
000864dc  blx     #0xddbfc ; -> objc_msgSend
000864e0  ldr     r1, [pc, #0x44]
000864e2  ldrb.w  r3, [sp]
000864e6  mov     r2, r8
000864e8  add     r1, pc ; -> 0x000fce9c  
000864ea  movs    r4, #1
000864ec  ldr     r6, [r1]
000864ee  mov     r1, r6
000864f0  mov     r5, r0
000864f2  blx     #0xddbfc ; -> objc_msgSend
000864f6  ldrb.w  r3, [r4, sl]
000864fa  mov     r0, r5
000864fc  mov     r1, r6
000864fe  mov     r2, r8
00086500  adds    r4, #1
00086502  blx     #0xddbfc ; -> objc_msgSend
00086506  cmp     r4, #0x10
00086508  bne     #0x864f6
0008650a  mov     r0, r5
0008650c  sub.w   sp, r7, #0x14
00086510  pop.w   {r8, sl}
00086514  pop     {r4, r5, r6, r7, pc}
00086516  nop     
00086518  str     r2, [r5, #0x54]
0008651a  movs    r7, r0
0008651c  strh    r4, [r6, #0x38]
0008651e  movs    r7, r1
00086520  strb    r0, [r4, #0x1c]
00086522  movs    r7, r0
00086524  ldr     r6, [r0, #0x1c]
00086526  movs    r7, r0
00086528  ldr     r0, [r6, #0x18]
0008652a  movs    r7, r0
