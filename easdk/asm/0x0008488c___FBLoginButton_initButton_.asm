========================================================================
-[FBLoginButton initButton]  0x0008488c  264 bytes   FBLoginButton.m
========================================================================

0008488c  push    {r4, r5, r6, r7, lr}
0008488e  add     r7, sp, #0xc
00084890  sub     sp, #8
00084892  ldr     r3, [pc, #0xc0]
00084894  mov     r4, r0
00084896  movs    r2, #0
00084898  add     r3, pc ; -> 0x000f53e4  OBJC_IVAR_$_FBLoginButton._style
0008489a  ldr     r1, [pc, #0xbc]
0008489c  ldr     r3, [r3]
0008489e  ldr     r5, [pc, #0xbc]
000848a0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000848a2  str     r2, [r0, r3]
000848a4  ldr     r0, [pc, #0xb8]
000848a6  add     r5, pc ; -> 0x000f53ec  OBJC_IVAR_$_FBLoginButton._imageView
000848a8  ldr     r1, [r1]
000848aa  add     r0, pc ; -> 0x000fdbc8  
000848ac  ldr     r6, [r5]
000848ae  ldr     r0, [r0]
000848b0  blx     #0xddbfc ; -> objc_msgSend
000848b4  ldr     r2, [pc, #0xac]
000848b6  ldr     r1, [pc, #0xb0]
000848b8  add     r2, pc ; -> 0x000f3390  0x0
000848ba  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000848bc  ldr     r2, [r2]
000848be  ldr.w   ip, [r1]
000848c2  mov     lr, r0
000848c4  add.w   r0, r2, #8
000848c8  ldm     r2, {r2, r3}
000848ca  ldm     r0, {r0, r1}
000848cc  stm.w   sp, {r0, r1}
000848d0  mov     r1, ip
000848d2  mov     r0, lr
000848d4  blx     #0xddbfc ; -> objc_msgSend
000848d8  ldr     r1, [pc, #0x90]
000848da  movs    r2, #4
000848dc  add     r1, pc ; -> 0x000fccbc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x344
000848de  ldr     r1, [r1]
000848e0  str     r0, [r4, r6]
000848e2  ldr     r3, [r5]
000848e4  ldr     r0, [r4, r3]
000848e6  blx     #0xddbfc ; -> objc_msgSend
000848ea  ldr     r1, [pc, #0x84]
000848ec  ldr     r3, [r5]
000848ee  mov     r0, r4
000848f0  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000848f2  ldr     r2, [r4, r3]
000848f4  ldr     r1, [r1]
000848f6  blx     #0xddbfc ; -> objc_msgSend
000848fa  ldr     r0, [pc, #0x78]
000848fc  ldr     r1, [pc, #0x78]
000848fe  add     r0, pc ; -> 0x000fdbc4  
00084900  add     r1, pc ; -> 0x000fcccc  '%-\x0e'
00084902  ldr     r0, [r0]
00084904  ldr     r1, [r1]
00084906  blx     #0xddbfc ; -> objc_msgSend
0008490a  ldr     r1, [pc, #0x70]
0008490c  add     r1, pc ; -> 0x000fccc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x350
0008490e  ldr     r1, [r1]
00084910  mov     r2, r0
00084912  mov     r0, r4
00084914  blx     #0xddbfc ; -> objc_msgSend
00084918  ldr     r1, [pc, #0x64]
0008491a  ldr     r3, [pc, #0x68]
0008491c  movs    r2, #0x40
0008491e  add     r1, pc ; -> 0x000fcc98  'j2\x0e'
00084920  add     r3, pc ; -> 0x000fcd88  
00084922  str     r2, [sp]
00084924  ldr     r3, [r3]
00084926  mov     r2, r4
00084928  mov     r0, r4
0008492a  ldr     r1, [r1]
0008492c  blx     #0xddbfc ; -> objc_msgSend
00084930  ldr     r0, [pc, #0x54]
00084932  ldr     r1, [pc, #0x58]
00084934  add     r0, pc ; -> 0x000fdbc0  
00084936  add     r1, pc ; -> 0x000fccdc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x364
00084938  ldr     r0, [r0]
0008493a  ldr     r1, [r1]
0008493c  blx     #0xddbfc ; -> objc_msgSend
00084940  ldr     r1, [pc, #0x4c]
00084942  add     r1, pc ; -> 0x000fcd84  
00084944  ldr     r1, [r1]
00084946  mov     r2, r0
00084948  mov     r0, r4
0008494a  blx     #0xddbfc ; -> objc_msgSend
0008494e  sub.w   sp, r7, #0xc
00084952  pop     {r4, r5, r6, r7, pc}
00084954  lsrs    r0, r1, #0xd
00084956  movs    r7, r0
00084958  strh    r0, [r4, #6]
0008495a  movs    r7, r0
0008495c  lsrs    r2, r0, #0xd
0008495e  movs    r7, r0
00084960  str     r3, [sp, #0x68]
00084962  movs    r7, r0
