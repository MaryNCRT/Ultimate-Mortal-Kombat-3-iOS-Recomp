========================================================================
-[FBXMLHandler init]  0x00088554  192 bytes   FBXMLHandler.m
========================================================================

00088554  push    {r4, r5, r6, r7, lr}
00088556  add     r7, sp, #0xc
00088558  push.w  {r8, sl}
0008855c  sub     sp, #8
0008855e  ldr     r1, [pc, #0x8c]
00088560  ldr     r3, [pc, #0x8c]
00088562  str     r0, [sp]
00088564  add     r1, pc ; -> 0x000fc980  '$(\x0e'
00088566  add     r3, pc ; -> 0x000fdd54  
00088568  ldr     r5, [r1]
0008856a  ldr     r3, [r3]
0008856c  mov     r0, sp
0008856e  mov     r1, r5
00088570  str     r3, [sp, #4]
00088572  blx     #0xddc08 ; -> objc_msgSendSuper2
00088576  mov     r4, r0
00088578  cmp     r0, #0
0008857a  beq     #0x885e0
0008857c  ldr     r0, [pc, #0x74]
0008857e  ldr     r1, [pc, #0x78]
00088580  ldr     r3, [pc, #0x78]
00088582  add     r0, pc ; -> 0x000fdb70  
00088584  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00088586  ldr.w   sl, [r0]
0008858a  ldr     r6, [r1]
0008858c  add     r3, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
0008858e  mov     r0, sl
00088590  mov     r1, r6
00088592  ldr.w   r8, [r3]
00088596  blx     #0xddbfc ; -> objc_msgSend
0008859a  mov     r1, r5
0008859c  blx     #0xddbfc ; -> objc_msgSend
000885a0  ldr     r3, [pc, #0x5c]
000885a2  mov     r1, r6
000885a4  add     r3, pc ; -> 0x000f6038  OBJC_IVAR_$_FBXMLHandler._nameStack
000885a6  str.w   r0, [r4, r8]
000885aa  mov     r0, sl
000885ac  ldr.w   r8, [r3]
000885b0  blx     #0xddbfc ; -> objc_msgSend
000885b4  mov     r1, r5
000885b6  blx     #0xddbfc ; -> objc_msgSend
000885ba  ldr     r3, [pc, #0x48]
000885bc  movs    r2, #0
000885be  add     r3, pc ; -> 0x000f603c  OBJC_IVAR_$_FBXMLHandler._rootObject
000885c0  str.w   r0, [r4, r8]
000885c4  ldr     r3, [r3]
000885c6  str     r2, [r4, r3]
000885c8  ldr     r3, [pc, #0x3c]
000885ca  add     r3, pc ; -> 0x000f6040  OBJC_IVAR_$_FBXMLHandler._rootName
000885cc  ldr     r3, [r3]
000885ce  str     r2, [r4, r3]
000885d0  ldr     r3, [pc, #0x38]
000885d2  add     r3, pc ; -> 0x000f6044  OBJC_IVAR_$_FBXMLHandler._chars
000885d4  ldr     r3, [r3]
000885d6  str     r2, [r4, r3]
000885d8  ldr     r3, [pc, #0x34]
000885da  add     r3, pc ; -> 0x000f6048  OBJC_IVAR_$_FBXMLHandler._parseError
000885dc  ldr     r3, [r3]
000885de  str     r2, [r4, r3]
000885e0  mov     r0, r4
000885e2  sub.w   sp, r7, #0x14
000885e6  pop.w   {r8, sl}
000885ea  pop     {r4, r5, r6, r7, pc}
000885ec  add     r0, r3
000885ee  movs    r7, r0
000885f0  ldrsb   r2, [r5, r7]
000885f2  movs    r7, r0
000885f4  strb    r2, [r5, r7]
000885f6  movs    r7, r0
000885f8  mvns    r4, r7
000885fa  movs    r7, r0
000885fc  bge     #0x88548
000885fe  movs    r6, r0
00088600  bge     #0x88524
00088602  movs    r6, r0
00088604  bge     #0x886fc
00088606  movs    r6, r0
00088608  bge     #0x886f0
0008860a  movs    r6, r0
0008860c  bge     #0x886ec
0008860e  movs    r6, r0
00088610  bge     #0x886e8
00088612  movs    r6, r0
