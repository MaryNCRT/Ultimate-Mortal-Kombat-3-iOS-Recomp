========================================================================
-[DMGImageLoader downloadImage]  0x000d3054  228 bytes   DMGImageLoader.mm
========================================================================

000d3054  push    {r4, r5, r6, r7, lr}
000d3056  add     r7, sp, #0xc
000d3058  sub     sp, #8
000d305a  ldr     r3, [pc, #0xa0]
000d305c  ldr     r1, [pc, #0xa0]
000d305e  mov     r6, r0
000d3060  add     r3, pc ; -> 0x000fa704  OBJC_IVAR_$_DMGImageLoader.imgURL
000d3062  add     r1, pc ; -> 0x000fcd20  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a8
000d3064  ldr     r3, [r3]
000d3066  ldr     r1, [r1]
000d3068  movs    r2, #4
000d306a  ldr     r0, [r0, r3]
000d306c  blx     #0xddbfc ; -> objc_msgSend
000d3070  ldr     r1, [pc, #0x90]
000d3072  add     r1, pc ; -> 0x000fce34  
000d3074  ldr     r4, [r1]
000d3076  ldr     r1, [pc, #0x90]
000d3078  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000d307a  ldr     r1, [r1]
000d307c  mov     r2, r0
000d307e  ldr     r0, [pc, #0x8c]
000d3080  add     r0, pc ; -> 0x000fdbe4  
000d3082  ldr     r5, [r0]
000d3084  ldr     r0, [pc, #0x88]
000d3086  add     r0, pc ; -> 0x000fdb64  
000d3088  ldr     r0, [r0]
000d308a  blx     #0xddbfc ; -> objc_msgSend
000d308e  ldr     r1, [pc, #0x84]
000d3090  movs    r3, #0
000d3092  mov     r2, r0
000d3094  movs    r0, #0
000d3096  stm.w   sp, {r0, r1}
000d309a  mov     r1, r4
000d309c  mov     r0, r5
000d309e  blx     #0xddbfc ; -> objc_msgSend
000d30a2  ldr     r3, [pc, #0x74]
000d30a4  ldr     r1, [pc, #0x74]
000d30a6  movs    r5, #1
000d30a8  add     r3, pc ; -> 0x000fa70c  OBJC_IVAR_$_DMGImageLoader.requestStarted
000d30aa  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d30ac  ldr     r3, [r3]
000d30ae  ldr     r1, [r1]
000d30b0  strb    r5, [r6, r3]
000d30b2  mov     r4, r0
000d30b4  ldr     r0, [pc, #0x68]
000d30b6  add     r0, pc ; -> 0x000fdc08  
000d30b8  ldr     r0, [r0]
000d30ba  blx     #0xddbfc ; -> objc_msgSend
000d30be  ldr     r1, [pc, #0x64]
000d30c0  mov     r2, r4
000d30c2  mov     r3, r6
000d30c4  add     r1, pc ; -> 0x000fd7c0  'Z\t\x0f'
000d30c6  str     r5, [sp]
000d30c8  ldr     r1, [r1]
000d30ca  blx     #0xddbfc ; -> objc_msgSend
000d30ce  cbz     r0, #0xd30f4
000d30d0  ldr     r0, [pc, #0x54]
000d30d2  ldr     r1, [pc, #0x58]
000d30d4  ldr     r3, [pc, #0x58]
000d30d6  add     r0, pc ; -> 0x000fdbbc  
000d30d8  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000d30da  add     r3, pc ; -> 0x000fa710  OBJC_IVAR_$_DMGImageLoader.loadedData
000d30dc  ldr     r1, [r1]
000d30de  ldr     r0, [r0]
000d30e0  ldr     r4, [r3]
000d30e2  blx     #0xddbfc ; -> objc_msgSend
000d30e6  ldr     r1, [pc, #0x4c]
000d30e8  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d30ea  ldr     r1, [r1]
000d30ec  blx     #0xddbfc ; -> objc_msgSend
000d30f0  str     r0, [r6, r4]
000d30f2  mov     r0, r5
000d30f4  sub.w   sp, r7, #0xc
000d30f8  pop     {r4, r5, r6, r7, pc}
000d30fa  nop     
000d30fc  strb    r0, [r4, #0x1a]
000d30fe  movs    r2, r0
000d3100  ldr     r4, [sp, #0x2e8]
000d3102  movs    r2, r0
000d3104  ldr     r5, [sp, #0x2f8]
000d3106  movs    r2, r0
000d3108  ldr     r3, [sp, #0xd0]
000d310a  movs    r2, r0
000d310c  add     r3, sp, #0x180
000d310e  movs    r2, r0
000d3110  add     r2, sp, #0x368
000d3112  movs    r2, r0
000d3114  movs    r0, r0
000d3116  eors    r6, r3
000d3118  strb    r0, [r4, #0x19]
000d311a  movs    r2, r0
000d311c  ldr     r0, [sp, #0x358]
000d311e  movs    r2, r0
000d3120  add     r3, sp, #0x138
000d3122  movs    r2, r0
000d3124  adr     r6, #0x3e0
000d3126  movs    r2, r0
000d3128  add     r2, sp, #0x388
000d312a  movs    r2, r0
000d312c  ldr     r4, [sp, #0xe0]
000d312e  movs    r2, r0
000d3130  strb    r2, [r6, #0x18]
000d3132  movs    r2, r0
000d3134  ldr     r3, [sp, #0x390]
000d3136  movs    r2, r0
