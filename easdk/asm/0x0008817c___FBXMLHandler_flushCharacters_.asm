========================================================================
-[FBXMLHandler flushCharacters]  0x0008817c  412 bytes   FBXMLHandler.m
========================================================================

0008817c  push    {r4, r5, r6, r7, lr}
0008817e  add     r7, sp, #0xc
00088180  push.w  {r8, sl, fp}
00088184  sub     sp, #8
00088186  ldr     r1, [pc, #0x13c]
00088188  mov     r6, r0
0008818a  ldr     r0, [pc, #0x13c]
0008818c  add     r1, pc ; -> 0x000fcf28  
0008818e  movs    r4, #0
00088190  add     r0, pc ; -> 0x000fdc10  
00088192  ldr     r1, [r1]
00088194  ldr     r0, [r0]
00088196  blx     #0xddbfc ; -> objc_msgSend
0008819a  ldr     r1, [pc, #0x130]
0008819c  ldr     r3, [pc, #0x130]
0008819e  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000881a0  ldr.w   fp, [r1]
000881a4  ldr     r1, [pc, #0x12c]
000881a6  str     r3, [sp]
000881a8  add     r1, pc ; -> 0x000fcf24  
000881aa  ldr.w   sl, [r1]
000881ae  ldr     r1, [pc, #0x128]
000881b0  add     r1, pc ; -> 0x000fcf20  
000881b2  ldr.w   r8, [r1]
000881b6  str     r0, [sp, #4]
000881b8  b       #0x881d8
000881ba  ldr     r3, [r5]
000881bc  mov     r1, sl
000881be  mov     r2, r4
000881c0  ldr     r0, [r3, r6]
000881c2  blx     #0xddbfc ; -> objc_msgSend
000881c6  mov     r1, r8
000881c8  mov     r2, r0
000881ca  ldr     r0, [sp, #4]
000881cc  blx     #0xddbfc ; -> objc_msgSend
000881d0  tst.w   r0, #0xff
000881d4  beq     #0x8820c
000881d6  adds    r4, #1
000881d8  ldr     r5, [sp]
000881da  mov     r1, fp
000881dc  add     r5, pc
000881de  ldr     r3, [r5]
000881e0  ldr     r0, [r3, r6]
000881e2  blx     #0xddbfc ; -> objc_msgSend
000881e6  cmp     r0, r4
000881e8  bhi     #0x881ba
000881ea  ldr     r4, [pc, #0xf0]
000881ec  ldr     r1, [pc, #0xf0]
000881ee  add     r4, pc ; -> 0x000f6044  OBJC_IVAR_$_FBXMLHandler._chars
000881f0  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000881f2  ldr     r3, [r4]
000881f4  ldr     r1, [r1]
000881f6  ldr     r0, [r3, r6]
000881f8  blx     #0xddbfc ; -> objc_msgSend
000881fc  ldr     r3, [r4]
000881fe  movs    r2, #0
00088200  str     r2, [r3, r6]
00088202  sub.w   sp, r7, #0x18
00088206  pop.w   {r8, sl, fp}
0008820a  pop     {r4, r5, r6, r7, pc}
0008820c  ldr     r1, [pc, #0xd4]
0008820e  mov     r0, r6
00088210  add     r1, pc ; -> 0x000fcf1c  
00088212  ldr     r1, [r1]
00088214  blx     #0xddbfc ; -> objc_msgSend
00088218  ldr     r1, [pc, #0xcc]
0008821a  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
0008821c  ldr     r4, [r1]
0008821e  ldr     r1, [pc, #0xcc]
00088220  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
00088222  ldr     r1, [r1]
00088224  mov     r8, r0
00088226  ldr     r0, [pc, #0xc8]
00088228  add     r0, pc ; -> 0x000fdb70  
0008822a  ldr     r0, [r0]
0008822c  blx     #0xddbfc ; -> objc_msgSend
00088230  mov     r1, r4
00088232  mov     r2, r0
00088234  mov     r0, r8
00088236  blx     #0xddbfc ; -> objc_msgSend
0008823a  tst.w   r0, #0xff
0008823e  beq     #0x88296
00088240  ldr     r1, [pc, #0xb0]
00088242  ldr     r0, [pc, #0xb4]
00088244  ldr     r2, [r5]
00088246  add     r1, pc ; -> 0x000fcdec  '(5\x0e'
00088248  add     r0, pc ; -> 0x000fdb44  
0008824a  ldr.w   r8, [r1]
0008824e  ldr     r1, [pc, #0xac]
00088250  ldr.w   sl, [r0]
00088254  mov     r0, r6
00088256  add     r1, pc ; -> 0x000fcf18  
00088258  ldr     r4, [r2, r6]
0008825a  ldr     r1, [r1]
0008825c  blx     #0xddbfc ; -> objc_msgSend
00088260  mov     r1, r8
00088262  mov     r2, r4
00088264  mov     r3, r0
00088266  mov     r0, sl
00088268  blx     #0xddbfc ; -> objc_msgSend
0008826c  ldr     r3, [pc, #0x90]
0008826e  ldr     r1, [pc, #0x94]
00088270  add     r3, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
00088272  add     r1, pc ; -> 0x000fcf2c  
00088274  ldr     r5, [r1]
00088276  ldr     r1, [pc, #0x90]
00088278  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
0008827a  ldr     r1, [r1]
0008827c  mov     r8, r0
0008827e  ldr     r0, [r3]
00088280  ldr     r4, [r0, r6]
00088282  mov     r0, r4
00088284  blx     #0xddbfc ; -> objc_msgSend
00088288  mov     r1, r5
0008828a  mov     r3, r8
0008828c  subs    r2, r0, #1
0008828e  mov     r0, r4
00088290  blx     #0xddbfc ; -> objc_msgSend
00088294  b       #0x881ea
00088296  ldr     r3, [pc, #0x74]
00088298  ldr     r1, [pc, #0x74]
0008829a  add     r3, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
0008829c  add     r1, pc ; -> 0x000fcf2c  
0008829e  ldr     r0, [r3]
000882a0  ldr.w   r8, [r1]
000882a4  ldr     r1, [pc, #0x6c]
000882a6  ldr     r4, [r0, r6]
000882a8  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000882aa  ldr     r1, [r1]
000882ac  mov     r0, r4
000882ae  blx     #0xddbfc ; -> objc_msgSend
000882b2  ldr     r3, [r5]
000882b4  mov     r1, r8
000882b6  ldr     r3, [r3, r6]
000882b8  subs    r2, r0, #1
000882ba  mov     r0, r4
000882bc  blx     #0xddbfc ; -> objc_msgSend
000882c0  b       #0x881ea
000882c2  nop     
000882c4  ldr     r5, [pc, #0x260]
000882c6  movs    r7, r0
000882c8  ldrh    r4, [r7, r1]
000882ca  movs    r7, r0
000882cc  ldr     r0, [pc, #0x358]
000882ce  movs    r7, r0
000882d0  udf     #0x64
000882d2  movs    r6, r0
000882d4  ldr     r5, [pc, #0x1e0]
000882d6  movs    r7, r0
000882d8  ldr     r5, [pc, #0x1b0]
000882da  movs    r7, r0
000882dc  udf     #0x52
000882de  movs    r6, r0
000882e0  blx     r1
000882e2  movs    r7, r0
000882e4  ldr     r5, [pc, #0x20]
000882e6  movs    r7, r0
000882e8  ldr     r4, [pc, #0x188]
000882ea  movs    r7, r0
000882ec  blx     sp
000882ee  movs    r7, r0
000882f0  ldr     r4, [r0, r5]
000882f2  movs    r7, r0
000882f4  ldr     r3, [pc, #0x288]
000882f6  movs    r7, r0
000882f8  ldr     r0, [r7, r3]
000882fa  movs    r7, r0
000882fc  ldr     r4, [pc, #0x2f8]
000882fe  movs    r7, r0
00088300  ble     #0x88284
00088302  movs    r6, r0
00088304  ldr     r4, [pc, #0x2d8]
00088306  movs    r7, r0
00088308  ldr     r0, [pc, #0x10]
0008830a  movs    r7, r0
0008830c  ble     #0x8823c
0008830e  movs    r6, r0
00088310  ldr     r4, [pc, #0x230]
00088312  movs    r7, r0
00088314  blxns   sl
00088316  movs    r7, r0
