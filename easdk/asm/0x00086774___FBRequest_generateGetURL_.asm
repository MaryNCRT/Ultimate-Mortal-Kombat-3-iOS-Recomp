========================================================================
-[FBRequest generateGetURL]  0x00086774  472 bytes   FBRequest.m
========================================================================

00086774  push    {r4, r5, r6, r7, lr}
00086776  add     r7, sp, #0xc
00086778  push.w  {r8, sl, fp}
0008677c  sub     sp, #0x94
0008677e  ldr     r3, [pc, #0x170]
00086780  str     r0, [sp, #0xc]
00086782  ldr     r1, [pc, #0x170]
00086784  add     r3, pc ; -> 0x000f59c8  OBJC_IVAR_$_FBRequest._url
00086786  ldr     r0, [pc, #0x170]
00086788  ldr     r3, [r3]
0008678a  ldr     r4, [sp, #0xc]
0008678c  add     r0, pc ; -> 0x000fdb64  
0008678e  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
00086790  ldr     r0, [r0]
00086792  ldr     r1, [r1]
00086794  ldr     r2, [r4, r3]
00086796  blx     #0xddbfc ; -> objc_msgSend
0008679a  ldr     r1, [pc, #0x160]
0008679c  add     r1, pc ; -> 0x000fcdb8  
0008679e  ldr     r1, [r1]
000867a0  blx     #0xddbfc ; -> objc_msgSend
000867a4  cmp     r0, #0
000867a6  beq.w   #0x868e8
000867aa  ldr     r2, [pc, #0x154]
000867ac  add     r2, pc ; -> 0x0017e8a4  
000867ae  str     r2, [sp, #0x28]
000867b0  ldr.w   r0, [pc, #0x150]
000867b4  ldr     r1, [pc, #0x150]
000867b6  add     r0, pc ; -> 0x000fdb70  
000867b8  add     r1, pc ; -> 0x000fcd24  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ac
000867ba  ldr     r0, [r0]
000867bc  ldr     r1, [r1]
000867be  blx     #0xddbfc ; -> objc_msgSend
000867c2  movs    r3, #0
000867c4  str     r3, [sp, #0x74]
000867c6  str     r3, [sp, #0x78]
000867c8  str     r3, [sp, #0x7c]
000867ca  str     r3, [sp, #0x80]
000867cc  str     r3, [sp, #0x84]
000867ce  str     r3, [sp, #0x88]
000867d0  str     r3, [sp, #0x8c]
000867d2  str     r3, [sp, #0x90]
000867d4  ldr     r3, [pc, #0x134]
000867d6  ldr     r1, [pc, #0x138]
000867d8  ldr     r4, [sp, #0xc]
000867da  add     r3, pc ; -> 0x000f59d0  OBJC_IVAR_$_FBRequest._params
000867dc  add     r1, pc ; -> 0x000fcd18  '^z\x0e'
000867de  ldr     r1, [r1]
000867e0  str     r0, [sp, #0x10]
000867e2  ldr     r0, [r3]
000867e4  ldr     r0, [r4, r0]
000867e6  str     r1, [sp, #0x18]
000867e8  str     r0, [sp, #0x14]
000867ea  blx     #0xddbfc ; -> objc_msgSend
000867ee  ldr     r1, [pc, #0x124]
000867f0  movs    r3, #0x10
000867f2  add     r2, sp, #0x74
000867f4  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000867f6  str     r3, [sp]
000867f8  ldr     r1, [r1]
000867fa  add     r3, sp, #0x34
000867fc  str     r1, [sp, #0x20]
000867fe  str     r0, [sp, #0x1c]
00086800  blx     #0xddbfc ; -> objc_msgSend
00086804  cmp     r0, #0
00086806  beq     #0x868a6
00086808  ldr     r1, [pc, #0x10c]
0008680a  ldr     r3, [sp, #0x7c]
0008680c  ldr     r4, [pc, #0x10c]
0008680e  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00086810  ldr     r2, [pc, #0x10c]
00086812  ldr     r1, [r1]
00086814  ldr     r3, [r3]
00086816  mov     r6, r0
00086818  add     r2, pc ; -> 0x0017e894  
0008681a  str     r1, [sp, #0x24]
0008681c  ldr     r1, [pc, #0x104]
0008681e  str     r3, [sp, #0x2c]
00086820  ldr     r3, [pc, #0x104]
00086822  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
00086824  str     r2, [sp, #0x30]
00086826  ldr.w   fp, [r1]
0008682a  ldr     r1, [pc, #0x100]
0008682c  add     r3, pc ; -> 0x000fdb5c  
0008682e  str     r4, [sp, #8]
00086830  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00086832  ldr.w   sl, [r3]
00086836  ldr.w   r8, [r1]
0008683a  ldr     r3, [sp, #0x2c]
0008683c  movs    r5, #0
0008683e  b       #0x86844
00086840  ldr     r3, [sp, #0x7c]
00086842  ldr     r3, [r3]
00086844  ldr     r2, [sp, #0x2c]
00086846  cmp     r2, r3
00086848  beq     #0x86856
0008684a  ldr     r1, [sp, #0x18]
0008684c  ldr     r0, [sp, #0x14]
0008684e  blx     #0xddbfc ; -> objc_msgSend
00086852  blx     #0xddbe4 ; -> objc_enumerationMutation
00086856  ldr     r3, [sp, #8]
00086858  ldr     r2, [sp, #0x78]
0008685a  ldr     r1, [sp, #0x24]
0008685c  add     r3, pc
0008685e  ldr.w   r4, [r2, r5, lsl #2]
00086862  ldr     r3, [r3]
00086864  ldr     r2, [sp, #0xc]
00086866  adds    r5, #1
00086868  ldr     r0, [r2, r3]
0008686a  mov     r2, r4
0008686c  blx     #0xddbfc ; -> objc_msgSend
00086870  mov     r1, r8
00086872  ldr     r2, [sp, #0x30]
00086874  mov     r3, r4
00086876  str     r0, [sp]
00086878  mov     r0, sl
0008687a  blx     #0xddbfc ; -> objc_msgSend
0008687e  mov     r1, fp
00086880  mov     r2, r0
00086882  ldr     r0, [sp, #0x10]
00086884  blx     #0xddbfc ; -> objc_msgSend
00086888  cmp     r6, r5
0008688a  bhi     #0x86840
0008688c  movs    r3, #0x10
0008688e  ldr     r0, [sp, #0x1c]
00086890  str     r3, [sp]
00086892  ldr     r1, [sp, #0x20]
00086894  add     r2, sp, #0x74
00086896  add     r3, sp, #0x34
00086898  blx     #0xddbfc ; -> objc_msgSend
0008689c  cbz     r0, #0x868a6
0008689e  ldr     r3, [sp, #0x7c]
000868a0  mov     r6, r0
000868a2  ldr     r3, [r3]
000868a4  b       #0x8683c
000868a6  ldr     r1, [pc, #0x88]
000868a8  ldr     r2, [pc, #0x88]
000868aa  ldr     r0, [sp, #0x10]
000868ac  add     r1, pc ; -> 0x000fcd1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a4
000868ae  add     r2, pc ; -> 0x0017e8a4  
000868b0  ldr     r1, [r1]
000868b2  blx     #0xddbfc ; -> objc_msgSend
000868b6  ldr     r3, [pc, #0x80]
000868b8  ldr     r4, [sp, #0xc]
000868ba  ldr     r1, [pc, #0x80]
000868bc  add     r3, pc ; -> 0x000f59c8  OBJC_IVAR_$_FBRequest._url
000868be  ldr     r2, [pc, #0x80]
000868c0  ldr     r3, [r3]
000868c2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000868c4  add     r2, pc ; -> 0x0017ec24  
000868c6  ldr     r1, [r1]
000868c8  ldr     r3, [r4, r3]
000868ca  ldr     r4, [sp, #0x28]
000868cc  str     r4, [sp]
000868ce  mov     ip, r0
000868d0  ldr     r0, [pc, #0x70]
000868d2  str.w   ip, [sp, #4]
000868d6  add     r0, pc ; -> 0x000fdb5c  
000868d8  ldr     r0, [r0]
000868da  blx     #0xddbfc ; -> objc_msgSend
000868de  sub.w   sp, r7, #0x18
000868e2  pop.w   {r8, sl, fp}
000868e6  pop     {r4, r5, r6, r7, pc}
000868e8  ldr     r3, [pc, #0x5c]
000868ea  add     r3, pc ; -> 0x0017ec14  
000868ec  str     r3, [sp, #0x28]
000868ee  b       #0x867b0
000868f0  movw    r0, #6
000868f4  str     r6, [r3, #0x40]
000868f6  movs    r7, r0
000868f8  strb    r4, [r2, #0xf]
000868fa  movs    r7, r0
000868fc  str     r0, [r3, #0x60]
000868fe  movs    r7, r0
00086900  strh    r4, [r6, #6]
00086902  movs    r7, r1
00086904  strb    r6, [r6, #0xe]
00086906  movs    r7, r0
00086908  str     r0, [r5, #0x54]
0008690a  movs    r7, r0
