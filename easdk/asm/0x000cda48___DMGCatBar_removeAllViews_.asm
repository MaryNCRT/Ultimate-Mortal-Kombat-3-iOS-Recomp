========================================================================
-[DMGCatBar removeAllViews]  0x000cda48  172 bytes   DMGCatBar.mm
========================================================================

000cda48  push    {r4, r5, r6, r7, lr}
000cda4a  add     r7, sp, #0xc
000cda4c  push.w  {r8, sl, fp}
000cda50  sub     sp, #0x6c
000cda52  ldr     r1, [pc, #0x94]
000cda54  movs    r3, #0
000cda56  mov     fp, r0
000cda58  add     r1, pc ; -> 0x000fda44  
000cda5a  str     r3, [sp, #0x4c]
000cda5c  ldr.w   sl, [r1]
000cda60  str     r3, [sp, #0x50]
000cda62  str     r3, [sp, #0x54]
000cda64  str     r3, [sp, #0x58]
000cda66  mov     r1, sl
000cda68  str     r3, [sp, #0x5c]
000cda6a  str     r3, [sp, #0x60]
000cda6c  str     r3, [sp, #0x64]
000cda6e  str     r3, [sp, #0x68]
000cda70  blx     #0xddbfc ; -> objc_msgSend
000cda74  ldr     r1, [pc, #0x74]
000cda76  movs    r3, #0x10
000cda78  add     r2, sp, #0x4c
000cda7a  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000cda7c  str     r3, [sp]
000cda7e  ldr     r1, [r1]
000cda80  add     r3, sp, #0xc
000cda82  str     r1, [sp, #8]
000cda84  str     r0, [sp, #4]
000cda86  blx     #0xddbfc ; -> objc_msgSend
000cda8a  cbz     r0, #0xcdade
000cda8c  ldr     r1, [pc, #0x60]
000cda8e  ldr     r3, [sp, #0x54]
000cda90  mov     r5, r0
000cda92  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000cda94  ldr.w   r8, [r3]
000cda98  ldr     r6, [r1]
000cda9a  b       #0xcda9e
000cda9c  ldr     r3, [sp, #0x54]
000cda9e  movs    r4, #0
000cdaa0  b       #0xcdaa4
000cdaa2  ldr     r3, [sp, #0x54]
000cdaa4  ldr     r3, [r3]
000cdaa6  cmp     r3, r8
000cdaa8  beq     #0xcdab6
000cdaaa  mov     r1, sl
000cdaac  mov     r0, fp
000cdaae  blx     #0xddbfc ; -> objc_msgSend
000cdab2  blx     #0xddbe4 ; -> objc_enumerationMutation
000cdab6  ldr     r3, [sp, #0x50]
000cdab8  mov     r1, r6
000cdaba  ldr.w   r0, [r3, r4, lsl #2]
000cdabe  adds    r4, #1
000cdac0  blx     #0xddbfc ; -> objc_msgSend
000cdac4  cmp     r5, r4
000cdac6  bhi     #0xcdaa2
000cdac8  movs    r3, #0x10
000cdaca  ldr     r0, [sp, #4]
000cdacc  str     r3, [sp]
000cdace  ldr     r1, [sp, #8]
000cdad0  add     r2, sp, #0x4c
000cdad2  add     r3, sp, #0xc
000cdad4  blx     #0xddbfc ; -> objc_msgSend
000cdad8  mov     r5, r0
000cdada  cmp     r0, #0
000cdadc  bne     #0xcda9c
000cdade  sub.w   sp, r7, #0x18
000cdae2  pop.w   {r8, sl, fp}
000cdae6  pop     {r4, r5, r6, r7, pc}
000cdae8  vaddl.u32 q8, d8, d2
000cdaec  vhadd.s16 d0, d10, d2
