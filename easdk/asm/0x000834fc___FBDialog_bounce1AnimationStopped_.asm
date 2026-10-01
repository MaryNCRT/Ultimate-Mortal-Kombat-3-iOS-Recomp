========================================================================
-[FBDialog bounce1AnimationStopped]  0x000834fc  224 bytes   FBDialog.m
========================================================================

000834fc  push    {r4, r5, r6, r7, lr}
000834fe  add     r7, sp, #0xc
00083500  str     r8, [sp, #-0x4]!
00083504  sub     sp, #0x44
00083506  mov     r6, r0
00083508  ldr     r0, [pc, #0xa4]
0008350a  ldr     r1, [pc, #0xa8]
0008350c  movs    r2, #0
0008350e  add     r0, pc ; -> 0x000fdbb8  
00083510  add     r1, pc ; -> 0x000fcd3c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c4
00083512  ldr     r5, [r0]
00083514  mov     r3, r2
00083516  ldr     r1, [r1]
00083518  add     r4, sp, #0x14
0008351a  mov     r0, r5
0008351c  blx     #0xddbfc ; -> objc_msgSend
00083520  ldr     r1, [pc, #0x94]
00083522  ldr     r3, [pc, #0x98]
00083524  mov     r0, r5
00083526  add     r1, pc ; -> 0x000fcd38  'k.\x0e'
00083528  mov.w   r2, #0x40000000
0008352c  ldr     r1, [r1]
0008352e  blx     #0xddbfc ; -> objc_msgSend
00083532  ldr     r1, [pc, #0x8c]
00083534  mov     r0, r5
00083536  mov     r2, r6
00083538  add     r1, pc ; -> 0x000fcd34  'U.\x0e'
0008353a  add.w   r8, sp, #0x2c
0008353e  ldr     r1, [r1]
00083540  blx     #0xddbfc ; -> objc_msgSend
00083544  ldr     r1, [pc, #0x7c]
00083546  ldr     r2, [pc, #0x80]
00083548  mov     r0, r5
0008354a  add     r1, pc ; -> 0x000fcd2c  '8.\x0e'
0008354c  add     r2, pc ; -> 0x000fcd30  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3b8
0008354e  ldr     r1, [r1]
00083550  ldr     r2, [r2]
00083552  blx     #0xddbfc ; -> objc_msgSend
00083556  ldr     r2, [pc, #0x74]
00083558  add     r0, sp, #0x14
0008355a  mov     r1, r6
0008355c  add     r2, pc ; -> 0x000fcd48  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d0
0008355e  ldr     r2, [r2]
00083560  blx     #0xddc14 ; -> objc_msgSend_stret
00083564  ldr     r3, [pc, #0x68]
00083566  add     r0, sp, #0x20
00083568  str     r3, [sp, #0xc]
0008356a  str     r3, [sp, #0x10]
0008356c  ldm     r0, {r0, r1, r2}
0008356e  stm.w   sp, {r0, r1, r2}
00083572  add     r0, sp, #0x2c
00083574  ldm.w   r4, {r1, r2, r3}
00083578  blx     #0xdd224 ; -> CGAffineTransformScale
0008357c  ldr     r1, [pc, #0x54]
0008357e  add     r0, sp, #0x34
00083580  add     r1, pc ; -> 0x000fcd54  '\x12}\x0e'
00083582  ldr.w   ip, [r1]
00083586  ldm     r0, {r0, r1, r2, r3}
00083588  stm.w   sp, {r0, r1, r2, r3}
0008358c  mov     r0, r6
0008358e  mov     r1, ip
00083590  ldm.w   r8, {r2, r3}
00083594  blx     #0xddbfc ; -> objc_msgSend
00083598  ldr     r1, [pc, #0x3c]
0008359a  mov     r0, r5
0008359c  add     r1, pc ; -> 0x000fcd28  "'.\x0e"
0008359e  ldr     r1, [r1]
000835a0  blx     #0xddbfc ; -> objc_msgSend
000835a4  sub.w   sp, r7, #0x10
000835a8  ldr     r8, [sp], #4
000835ac  pop     {r4, r5, r6, r7, pc}
000835ae  nop     
000835b0  adr     r6, #0x298
000835b2  movs    r7, r0
000835b4  ldr     r0, [sp, #0xa0]
000835b6  movs    r7, r0
000835b8  ldr     r0, [sp, #0x38]
000835ba  movs    r7, r0
000835bc  adds    r3, #0x33
000835be  subs    r7, #0xc3
000835c0  str     r7, [sp, #0x3e0]
000835c2  movs    r7, r0
000835c4  str     r7, [sp, #0x378]
000835c6  movs    r7, r0
000835c8  str     r7, [sp, #0x380]
000835ca  movs    r7, r0
000835cc  str     r7, [sp, #0x3a0]
000835ce  movs    r7, r0
000835d0  str     r6, [r4, #0x64]
000835d2  subs    r7, #0x66
000835d4  str     r7, [sp, #0x340]
000835d6  movs    r7, r0
000835d8  str     r7, [sp, #0x220]
000835da  movs    r7, r0
