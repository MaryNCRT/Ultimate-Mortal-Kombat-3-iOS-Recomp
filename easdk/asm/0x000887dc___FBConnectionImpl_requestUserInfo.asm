========================================================================
-[FBConnectionImpl requestUserInfo  0x000887dc  220 bytes   FBConnection.mm
========================================================================

000887dc  push    {r4, r5, r6, r7, lr}
000887de  add     r7, sp, #0xc
000887e0  push.w  {r8, sl, fp}
000887e4  sub     sp, #8
000887e6  ldr     r1, [pc, #0x98]
000887e8  str     r0, [sp, #4]
000887ea  ldr     r0, [pc, #0x98]
000887ec  add     r1, pc ; -> 0x000fcf60  
000887ee  mov     r4, r2
000887f0  add     r0, pc ; -> 0x000fdc14  
000887f2  ldr     r6, [r1]
000887f4  ldr.w   r8, [r0]
000887f8  mov     r5, r3
000887fa  ldr     r2, [pc, #0x8c]
000887fc  ldr     r3, [pc, #0x8c]
000887fe  mov     r1, r6
00088800  add     r2, pc ; -> 0x0017edc4  
00088802  add     r3, pc ; -> 0x0017edd4  
00088804  mov     r0, r8
00088806  mov.w   sl, #0
0008880a  str.w   sl, [sp]
0008880e  blx     #0xddbfc ; -> objc_msgSend
00088812  ldr     r1, [pc, #0x7c]
00088814  ldr     r2, [pc, #0x7c]
00088816  mov     r3, r4
00088818  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
0008881a  add     r2, pc ; -> 0x0017ede4  
0008881c  ldr     r1, [r1]
0008881e  str     r5, [sp]
00088820  mov     fp, r0
00088822  ldr     r0, [pc, #0x74]
00088824  add     r0, pc ; -> 0x000fdb5c  
00088826  ldr     r0, [r0]
00088828  blx     #0xddbfc ; -> objc_msgSend
0008882c  ldr     r3, [pc, #0x6c]
0008882e  mov     r1, r6
00088830  str.w   sl, [sp]
00088834  add     r3, pc ; -> 0x0017edf4  
00088836  mov     r2, r0
00088838  mov     r0, r8
0008883a  blx     #0xddbfc ; -> objc_msgSend
0008883e  ldr     r1, [pc, #0x60]
00088840  mov     r3, fp
00088842  add     r1, pc ; -> 0x000fcf5c  
00088844  ldr     r1, [r1]
00088846  mov     r2, r0
00088848  ldr     r0, [pc, #0x58]
0008884a  add     r0, pc ; -> 0x000fdb44  
0008884c  ldr     r0, [r0]
0008884e  blx     #0xddbfc ; -> objc_msgSend
00088852  ldr     r1, [pc, #0x54]
00088854  ldr     r2, [sp, #4]
00088856  add     r1, pc ; -> 0x000fcf70  
00088858  ldr     r1, [r1]
0008885a  mov     r4, r0
0008885c  ldr     r0, [pc, #0x4c]
0008885e  add     r0, pc ; -> 0x000fdbf0  
00088860  ldr     r0, [r0]
00088862  blx     #0xddbfc ; -> objc_msgSend
00088866  ldr     r1, [pc, #0x48]
00088868  ldr     r2, [pc, #0x48]
0008886a  mov     r3, r4
0008886c  add     r1, pc ; -> 0x000fcde4  '\x0c5\x0e'
0008886e  add     r2, pc ; -> 0x0017ee04  
00088870  ldr     r1, [r1]
00088872  blx     #0xddbfc ; -> objc_msgSend
00088876  sub.w   sp, r7, #0x18
0008887a  pop.w   {r8, sl, fp}
0008887e  pop     {r4, r5, r6, r7, pc}
00088880  bx      lr
00088882  movs    r7, r0
00088884  strb    r0, [r4, r0]
00088886  movs    r7, r0
00088888  str     r0, [r0, #0x5c]
0008888a  movs    r7, r1
0008888c  str     r6, [r1, #0x5c]
0008888e  movs    r7, r1
00088890  cmp     r4, r0
00088892  movs    r7, r0
00088894  str     r6, [r0, #0x5c]
00088896  movs    r7, r1
00088898  strh    r4, [r6, r4]
0008889a  movs    r7, r0
0008889c  str     r4, [r7, #0x58]
0008889e  movs    r7, r1
000888a0  bxns    r2
000888a2  movs    r7, r0
000888a4  strh    r6, [r6, r3]
000888a6  movs    r7, r0
000888a8  bxns    r2
000888aa  movs    r7, r0
000888ac  strh    r6, [r1, r6]
000888ae  movs    r7, r0
000888b0  cmp     r4, lr
000888b2  movs    r7, r0
000888b4  str     r2, [r2, #0x58]
000888b6  movs    r7, r1
