========================================================================
-[FBPermissionDialog webView  0x00085514  220 bytes   FBPermissionDialog.m
========================================================================

00085514  push    {r4, r5, r6, r7, lr}
00085516  add     r7, sp, #0xc
00085518  push.w  {r8, sl}
0008551c  sub     sp, #0xc
0008551e  ldr     r1, [pc, #0xa4]
00085520  mov     r8, r3
00085522  ldr     r3, [pc, #0xa4]
00085524  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
00085526  mov     sl, r2
00085528  add     r3, pc ; -> 0x000f5674  OBJC_IVAR_$_FBPermissionDialog._permission
0008552a  ldr     r4, [r1]
0008552c  ldr     r3, [r3]
0008552e  ldr     r2, [pc, #0x9c]
00085530  mov     r5, r0
00085532  mov     r1, r4
00085534  ldr     r0, [r0, r3]
00085536  add     r2, pc ; -> 0x0017eab4  
00085538  blx     #0xddbfc ; -> objc_msgSend
0008553c  tst.w   r0, #0xff
00085540  beq     #0x8556a
00085542  ldr     r1, [pc, #0x8c]
00085544  mov     r0, r8
00085546  add     r1, pc ; -> 0x000fcc5c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2e4
00085548  ldr     r1, [r1]
0008554a  blx     #0xddbfc ; -> objc_msgSend
0008554e  ldr     r1, [pc, #0x84]
00085550  add     r1, pc ; -> 0x000fcc58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2e0
00085552  ldr     r1, [r1]
00085554  mov     r6, r0
00085556  blx     #0xddbfc ; -> objc_msgSend
0008555a  ldr     r2, [pc, #0x7c]
0008555c  mov     r1, r4
0008555e  add     r2, pc ; -> 0x0017e7f4  
00085560  blx     #0xddbfc ; -> objc_msgSend
00085564  tst.w   r0, #0xff
00085568  bne     #0x85596
0008556a  ldr     r3, [pc, #0x70]
0008556c  ldr     r1, [pc, #0x70]
0008556e  add     r0, sp, #4
00085570  add     r3, pc ; -> 0x000fdd44  
00085572  add     r1, pc ; -> 0x000fcdf4  'x\x7f\x0e'
00085574  ldr     r3, [r3]
00085576  ldr     r1, [r1]
00085578  mov     r2, sl
0008557a  str     r5, [sp, #4]
0008557c  str     r3, [sp, #8]
0008557e  ldr     r3, [sp, #0x28]
00085580  str     r3, [sp]
00085582  mov     r3, r8
00085584  blx     #0xddc08 ; -> objc_msgSendSuper2
00085588  uxtb    r0, r0
0008558a  sxtb    r0, r0
0008558c  sub.w   sp, r7, #0x14
00085590  pop.w   {r8, sl}
00085594  pop     {r4, r5, r6, r7, pc}
00085596  ldr     r1, [pc, #0x4c]
00085598  mov     r0, r6
0008559a  add     r1, pc ; -> 0x000fcc54  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2dc
0008559c  ldr     r1, [r1]
0008559e  blx     #0xddbfc ; -> objc_msgSend
000855a2  ldr     r2, [pc, #0x44]
000855a4  mov     r1, r4
000855a6  add     r2, pc ; -> 0x0017eac4  
000855a8  blx     #0xddbfc ; -> objc_msgSend
000855ac  tst.w   r0, #0xff
000855b0  beq     #0x8556a
000855b2  ldr     r1, [pc, #0x38]
000855b4  mov     r0, r5
000855b6  add     r1, pc ; -> 0x000fcdf8  'x6\x0e'
000855b8  ldr     r1, [r1]
000855ba  blx     #0xddbfc ; -> objc_msgSend
000855be  movs    r0, #0
000855c0  b       #0x8558a
000855c2  nop     
000855c4  strb    r0, [r4, #0x17]
000855c6  movs    r7, r0
000855c8  lsls    r0, r1, #5
000855ca  movs    r7, r0
000855cc  str     r5, [sp, #0x1e8]
000855ce  movs    r7, r1
000855d0  strb    r2, [r2, #0x1c]
000855d2  movs    r7, r0
000855d4  strb    r4, [r0, #0x1c]
000855d6  movs    r7, r0
000855d8  str     r2, [sp, #0x248]
000855da  movs    r7, r1
000855dc  strh    r0, [r2, #0x3e]
000855de  movs    r7, r0
000855e0  ldrb    r6, [r7, #1]
000855e2  movs    r7, r0
000855e4  strb    r6, [r6, #0x1a]
000855e6  movs    r7, r0
000855e8  str     r5, [sp, #0x68]
000855ea  movs    r7, r1
000855ec  ldrb    r6, [r7]
000855ee  movs    r7, r0
