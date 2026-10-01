========================================================================
+[PictureImageCache allocWithZone  0x000d5974  68 bytes   PictureImageCache.m
========================================================================

000d5974  push    {r7, lr}
000d5976  add     r7, sp, #0
000d5978  sub     sp, #8
000d597a  ldr     r3, [pc, #0x2c]
000d597c  add     r3, pc ; -> 0x006bc160  sharedPictureImageCache
000d597e  ldr     r3, [r3]
000d5980  cbz     r3, #0xd5986
000d5982  movs    r0, #0
000d5984  b       #0xd59a2
000d5986  ldr     r3, [pc, #0x24]
000d5988  ldr     r1, [pc, #0x24]
000d598a  str     r0, [sp]
000d598c  add     r3, pc ; -> 0x000fdde4  
000d598e  add     r1, pc ; -> 0x000fda00  
000d5990  ldr     r3, [r3]
000d5992  ldr     r1, [r1]
000d5994  mov     r0, sp
000d5996  str     r3, [sp, #4]
000d5998  blx     #0xddc08 ; -> objc_msgSendSuper2
000d599c  ldr     r3, [pc, #0x14]
000d599e  add     r3, pc ; -> 0x006bc160  sharedPictureImageCache
000d59a0  str     r0, [r3]
000d59a2  sub.w   sp, r7, #0
000d59a6  pop     {r7, pc}
000d59a8  str     r0, [r4, #0x7c]
000d59aa  lsls    r6, r3, #1
000d59ac  strh    r4, [r2, #0x22]
000d59ae  movs    r2, r0
000d59b0  strh    r6, [r5, #2]
000d59b2  movs    r2, r0
000d59b4  str     r6, [r7, #0x78]
000d59b6  lsls    r6, r3, #1
