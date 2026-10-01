========================================================================
-[FBDialog loadURL  0x00082728  560 bytes   FBDialog.m
========================================================================

00082728  push    {r4, r5, r6, r7, lr}
0008272a  add     r7, sp, #0xc
0008272c  push.w  {r8, sl, fp}
00082730  sub     sp, #0x1c
00082732  ldr     r1, [pc, #0x198]
00082734  mov     r6, r0
00082736  ldr     r0, [pc, #0x198]
00082738  add     r1, pc ; -> 0x000fcbf4  '\x04+\x0e'
0008273a  mov     fp, r2
0008273c  add     r0, pc ; -> 0x000fdbdc  
0008273e  ldr     r1, [r1]
00082740  ldr     r0, [r0]
00082742  mov     r8, r3
00082744  blx     #0xddbfc ; -> objc_msgSend
00082748  ldr.w   ip, [pc, #0x188]
0008274c  ldr     r1, [pc, #0x188]
0008274e  ldr     r3, [pc, #0x18c]
00082750  add     ip, pc ; -> 0x0017e774  
00082752  str.w   ip, [sp]
00082756  ldr.w   ip, [pc, #0x188]
0008275a  add     r1, pc ; -> 0x000fcbf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x278
0008275c  add     r3, pc ; -> 0x000f338c  0x0
0008275e  add     ip, pc ; -> 0x000f3394  0x0
00082760  ldr     r4, [r1]
00082762  ldr.w   ip, [ip]
00082766  ldr     r1, [pc, #0x17c]
00082768  ldr     r3, [r3]
0008276a  ldr     r2, [pc, #0x17c]
0008276c  ldr.w   ip, [ip]
00082770  ldr.w   lr, [pc, #0x178]
00082774  ldr.w   sb, [pc, #0x178]
00082778  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
0008277a  str.w   ip, [sp, #4]
0008277e  ldr.w   ip, [pc, #0x174]
00082782  ldr     r3, [r3]
00082784  add     r2, pc ; -> 0x0017e764  
00082786  add     ip, pc ; -> 0x000f3388  0x0
00082788  ldr     r1, [r1]
0008278a  ldr.w   ip, [ip]
0008278e  add     lr, pc ; -> 0x0017e784  
00082790  add     sb, pc ; -> 0x0017e794  
00082792  str.w   lr, [sp, #8]
00082796  ldr.w   ip, [ip]
0008279a  str.w   sb, [sp, #0x10]
0008279e  mov     sl, r0
000827a0  str.w   ip, [sp, #0xc]
000827a4  ldr.w   ip, [pc, #0x150]
000827a8  ldr     r0, [pc, #0x150]
000827aa  add     ip, pc ; -> 0x000f3398  0x0
000827ac  add     r0, pc ; -> 0x000fdbe0  
000827ae  ldr.w   ip, [ip]
000827b2  ldr     r5, [r0]
000827b4  ldr     r0, [pc, #0x148]
000827b6  ldr.w   ip, [ip]
000827ba  add     r0, pc ; -> 0x000fdb44  
000827bc  ldr     r0, [r0]
000827be  str.w   ip, [sp, #0x14]
000827c2  mov.w   ip, #0
000827c6  str.w   ip, [sp, #0x18]
000827ca  blx     #0xddbfc ; -> objc_msgSend
000827ce  mov     r1, r4
000827d0  ldr     r4, [pc, #0x130]
000827d2  add     r4, pc ; -> 0x000f51c4  OBJC_IVAR_$_FBDialog._loadingURL
000827d4  mov     r2, r0
000827d6  mov     r0, r5
000827d8  blx     #0xddbfc ; -> objc_msgSend
000827dc  ldr     r1, [pc, #0x128]
000827de  add     r1, pc ; -> 0x000fcbec  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x274
000827e0  ldr     r1, [r1]
000827e2  mov     r2, r0
000827e4  mov     r0, sl
000827e6  blx     #0xddbfc ; -> objc_msgSend
000827ea  ldr     r1, [pc, #0x120]
000827ec  ldr     r3, [r4]
000827ee  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000827f0  ldr     r0, [r6, r3]
000827f2  ldr     r1, [r1]
000827f4  blx     #0xddbfc ; -> objc_msgSend
000827f8  ldr     r1, [pc, #0x114]
000827fa  mov     r2, fp
000827fc  ldr     r3, [sp, #0x3c]
000827fe  add     r1, pc ; -> 0x000fcbe8  'y(\x0e'
00082800  mov     r0, r6
00082802  ldr     r1, [r1]
00082804  ldr     r5, [r4]
00082806  blx     #0xddbfc ; -> objc_msgSend
0008280a  ldr     r1, [pc, #0x108]
0008280c  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
0008280e  ldr     r1, [r1]
00082810  blx     #0xddbfc ; -> objc_msgSend
00082814  ldr     r1, [pc, #0x100]
00082816  add     r1, pc ; -> 0x000fcbe4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x26c
00082818  ldr     r1, [r1]
0008281a  str     r0, [r6, r5]
0008281c  ldr     r0, [pc, #0xfc]
0008281e  ldr     r3, [r4]
00082820  add     r0, pc ; -> 0x000fdbe4  
00082822  ldr     r2, [r6, r3]
00082824  ldr     r0, [r0]
00082826  blx     #0xddbfc ; -> objc_msgSend
0008282a  mov     r4, r0
0008282c  cmp.w   r8, #0
00082830  beq     #0x8285e
00082832  ldr     r1, [pc, #0xec]
00082834  mov     r2, r8
00082836  add     r1, pc ; -> 0x000fcbe0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x268
00082838  ldr     r1, [r1]
0008283a  blx     #0xddbfc ; -> objc_msgSend
0008283e  ldr     r1, [pc, #0xe4]
00082840  mov     r0, r8
00082842  add     r1, pc ; -> 0x000fcbb4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x23c
00082844  ldr     r1, [r1]
00082846  blx     #0xddbfc ; -> objc_msgSend
0008284a  ldr     r1, [pc, #0xdc]
0008284c  ldr     r2, [pc, #0xdc]
0008284e  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
00082850  add     r2, pc ; -> 0x0017e7a4  
00082852  ldr     r1, [r1]
00082854  blx     #0xddbfc ; -> objc_msgSend
00082858  tst.w   r0, #0xff
0008285c  bne     #0x8287c
0008285e  ldr     r3, [pc, #0xd0]
00082860  ldr     r1, [pc, #0xd0]
00082862  mov     r2, r4
00082864  add     r3, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
00082866  add     r1, pc ; -> 0x000fcbd0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x258
00082868  ldr     r0, [r3]
0008286a  ldr     r1, [r1]
0008286c  ldr     r0, [r6, r0]
0008286e  blx     #0xddbfc ; -> objc_msgSend
00082872  sub.w   sp, r7, #0x18
00082876  pop.w   {r8, sl, fp}
0008287a  pop     {r4, r5, r6, r7, pc}
0008287c  ldr     r0, [pc, #0xb8]
0008287e  ldr     r1, [pc, #0xbc]
00082880  ldr     r3, [pc, #0xbc]
00082882  ldr     r2, [pc, #0xc0]
00082884  add     r0, pc ; -> 0x000fdb5c  
00082886  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00082888  add     r3, pc ; -> 0x0017d9e0  kStringBoundary
0008288a  add     r2, pc ; -> 0x0017e7b4  
0008288c  ldr     r1, [r1]
0008288e  ldr     r3, [r3]
00082890  ldr     r0, [r0]
00082892  blx     #0xddbfc ; -> objc_msgSend
00082896  ldr     r1, [pc, #0xb0]
00082898  ldr     r3, [pc, #0xb0]
0008289a  add     r1, pc ; -> 0x000fcbdc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x264
0008289c  add     r3, pc ; -> 0x0017e7c4  
0008289e  ldr     r1, [r1]
000828a0  mov     r2, r0
000828a2  mov     r0, r4
000828a4  blx     #0xddbfc ; -> objc_msgSend
000828a8  ldr     r1, [pc, #0xa4]
000828aa  ldr     r2, [sp, #0x40]
000828ac  mov     r0, r6
000828ae  add     r1, pc ; -> 0x000fcbd8  'g(\x0e'
000828b0  ldr     r1, [r1]
000828b2  blx     #0xddbfc ; -> objc_msgSend
000828b6  mov     r2, r0
000828b8  cmp     r0, #0
000828ba  beq     #0x8285e
000828bc  ldr     r1, [pc, #0x94]
000828be  mov     r0, r4
000828c0  add     r1, pc ; -> 0x000fcbd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x25c
000828c2  ldr     r1, [r1]
000828c4  blx     #0xddbfc ; -> objc_msgSend
000828c8  b       #0x8285e
000828ca  nop     
000828cc  adr     r4, #0x2e0
000828ce  movs    r7, r0
000828d0  push    {r2, r3, r4, r7}
000828d2  movs    r7, r0
000828d4  stm     r0!, {r5}
000828d6  movs    r7, r1
000828d8  adr     r4, #0x248
000828da  movs    r7, r0
000828dc  lsrs    r4, r5, #0x10
000828de  movs    r7, r0
000828e0  lsrs    r2, r6, #0x10
000828e2  movs    r7, r0
000828e4  adr     r2, #0x200
000828e6  movs    r7, r0
000828e8  itt     le
000828ea  movs    r7, r1
000828ec  ittt    al
000828ee  movs    r7, r1
