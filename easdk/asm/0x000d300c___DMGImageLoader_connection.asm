========================================================================
-[DMGImageLoader connection  0x000d300c  36 bytes   DMGImageLoader.mm
========================================================================

000d300c  push    {r7, lr}
000d300e  add     r7, sp, #0
000d3010  ldr     r3, [pc, #0x14]
000d3012  ldr     r1, [pc, #0x18]
000d3014  movs    r2, #0
000d3016  add     r3, pc ; -> 0x000fa710  OBJC_IVAR_$_DMGImageLoader.loadedData
000d3018  add     r1, pc ; -> 0x000fd7b8  '\t\t\x0f'
000d301a  ldr     r3, [r3]
000d301c  ldr     r1, [r1]
000d301e  ldr     r0, [r0, r3]
000d3020  blx     #0xddbfc ; -> objc_msgSend
000d3024  pop     {r7, pc}
000d3026  nop     
000d3028  strb    r6, [r6, #0x1b]
000d302a  movs    r2, r0
000d302c  adr     r7, #0x270
000d302e  movs    r2, r0
