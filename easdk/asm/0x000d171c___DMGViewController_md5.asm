========================================================================
-[DMGViewController md5  0x000d171c  200 bytes   DMGViewController.mm
========================================================================

000d171c  push    {r4, r7, lr}
000d171e  add     r7, sp, #4
000d1720  sub     sp, #0x4c
000d1722  ldr     r1, [pc, #0xb0]
000d1724  mov     r0, r2
000d1726  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000d1728  ldr     r1, [r1]
000d172a  blx     #0xddbfc ; -> objc_msgSend
000d172e  mov     r4, r0
000d1730  blx     #0xdde0c ; -> strlen
000d1734  add     r2, sp, #0x3c
000d1736  mov     r1, r0
000d1738  mov     r0, r4
000d173a  blx     #0xdd0c8 ; -> CC_MD5
000d173e  ldrb.w  ip, [sp, #0x3d]
000d1742  ldr     r0, [pc, #0x94]
000d1744  ldr     r1, [pc, #0x94]
000d1746  ldr     r2, [pc, #0x98]
000d1748  str.w   ip, [sp]
000d174c  ldrb.w  ip, [sp, #0x3e]
000d1750  add     r0, pc ; -> 0x000fdb5c  
000d1752  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d1754  add     r2, pc ; -> 0x001828d4  
000d1756  str.w   ip, [sp, #4]
000d175a  ldrb.w  ip, [sp, #0x3f]
000d175e  ldr     r1, [r1]
000d1760  ldrb.w  r3, [sp, #0x3c]
000d1764  ldr     r0, [r0]
000d1766  str.w   ip, [sp, #8]
000d176a  ldrb.w  ip, [sp, #0x40]
000d176e  str.w   ip, [sp, #0xc]
000d1772  ldrb.w  ip, [sp, #0x41]
000d1776  str.w   ip, [sp, #0x10]
000d177a  ldrb.w  ip, [sp, #0x42]
000d177e  str.w   ip, [sp, #0x14]
000d1782  ldrb.w  ip, [sp, #0x43]
000d1786  str.w   ip, [sp, #0x18]
000d178a  ldrb.w  ip, [sp, #0x44]
000d178e  str.w   ip, [sp, #0x1c]
000d1792  ldrb.w  ip, [sp, #0x45]
000d1796  str.w   ip, [sp, #0x20]
000d179a  ldrb.w  ip, [sp, #0x46]
000d179e  str.w   ip, [sp, #0x24]
000d17a2  ldrb.w  ip, [sp, #0x47]
000d17a6  str.w   ip, [sp, #0x28]
000d17aa  ldrb.w  ip, [sp, #0x48]
000d17ae  str.w   ip, [sp, #0x2c]
000d17b2  ldrb.w  ip, [sp, #0x49]
000d17b6  str.w   ip, [sp, #0x30]
000d17ba  ldrb.w  ip, [sp, #0x4a]
000d17be  str.w   ip, [sp, #0x34]
000d17c2  ldrb.w  ip, [sp, #0x4b]
000d17c6  str.w   ip, [sp, #0x38]
000d17ca  blx     #0xddbfc ; -> objc_msgSend
000d17ce  sub.w   sp, r7, #4
000d17d2  pop     {r4, r7, pc}
000d17d4  uxtb    r6, r6
000d17d6  movs    r2, r0
000d17d8  stm     r4!, {r3}
000d17da  movs    r2, r0
000d17dc  cbz     r2, #0xd1832
000d17de  movs    r2, r0
000d17e0  asrs    r4, r7, #5
000d17e2  movs    r3, r1
