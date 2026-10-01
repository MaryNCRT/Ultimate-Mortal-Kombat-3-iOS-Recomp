========================================================================
-[FBDialog bounce2AnimationStopped]  0x00083470  140 bytes   FBDialog.m
========================================================================

00083470  push    {r4, r5, r6, r7, lr}
00083472  add     r7, sp, #0xc
00083474  sub     sp, #0x28
00083476  mov     r6, r0
00083478  ldr     r0, [pc, #0x64]
0008347a  ldr     r1, [pc, #0x68]
0008347c  movs    r2, #0
0008347e  add     r0, pc ; -> 0x000fdbb8  
00083480  add     r1, pc ; -> 0x000fcd3c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c4
00083482  ldr     r4, [r0]
00083484  mov     r3, r2
00083486  ldr     r1, [r1]
00083488  add     r5, sp, #0x10
0008348a  mov     r0, r4
0008348c  blx     #0xddbfc ; -> objc_msgSend
00083490  ldr     r1, [pc, #0x54]
00083492  mov     r0, r4
00083494  ldr     r3, [pc, #0x54]
00083496  add     r1, pc ; -> 0x000fcd38  'k.\x0e'
00083498  mov.w   r2, #0x40000000
0008349c  ldr     r1, [r1]
0008349e  blx     #0xddbfc ; -> objc_msgSend
000834a2  ldr     r2, [pc, #0x4c]
000834a4  add     r0, sp, #0x10
000834a6  mov     r1, r6
000834a8  add     r2, pc ; -> 0x000fcd48  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d0
000834aa  ldr     r2, [r2]
000834ac  blx     #0xddc14 ; -> objc_msgSend_stret
000834b0  ldr     r1, [pc, #0x40]
000834b2  add     r0, sp, #0x18
000834b4  add     r1, pc ; -> 0x000fcd54  '\x12}\x0e'
000834b6  ldr.w   ip, [r1]
000834ba  ldm     r0, {r0, r1, r2, r3}
000834bc  stm.w   sp, {r0, r1, r2, r3}
000834c0  mov     r0, r6
000834c2  mov     r1, ip
000834c4  ldm.w   r5, {r2, r3}
000834c8  blx     #0xddbfc ; -> objc_msgSend
000834cc  ldr     r1, [pc, #0x28]
000834ce  mov     r0, r4
000834d0  add     r1, pc ; -> 0x000fcd28  "'.\x0e"
000834d2  ldr     r1, [r1]
000834d4  blx     #0xddbfc ; -> objc_msgSend
000834d8  sub.w   sp, r7, #0xc
000834dc  pop     {r4, r5, r6, r7, pc}
000834de  nop     
000834e0  adr     r7, #0xd8
000834e2  movs    r7, r0
000834e4  ldr     r0, [sp, #0x2e0]
000834e6  movs    r7, r0
000834e8  ldr     r0, [sp, #0x278]
000834ea  movs    r7, r0
000834ec  adds    r3, #0x33
000834ee  subs    r7, #0xc3
000834f0  ldr     r0, [sp, #0x270]
000834f2  movs    r7, r0
000834f4  ldr     r0, [sp, #0x270]
000834f6  movs    r7, r0
000834f8  ldr     r0, [sp, #0x150]
000834fa  movs    r7, r0
