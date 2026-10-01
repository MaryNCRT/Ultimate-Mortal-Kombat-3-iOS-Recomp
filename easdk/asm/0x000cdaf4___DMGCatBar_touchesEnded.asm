========================================================================
-[DMGCatBar touchesEnded  0x000cdaf4  84 bytes   DMGCatBar.mm
========================================================================

000cdaf4  push    {r4, r7, lr}
000cdaf6  add     r7, sp, #4
000cdaf8  sub     sp, #8
000cdafa  ldr     r1, [pc, #0x3c]
000cdafc  mov     r4, r0
000cdafe  mov     r0, r3
000cdb00  add     r1, pc ; -> 0x000fdb04  "B'\x0f"
000cdb02  ldr     r1, [r1]
000cdb04  blx     #0xddbfc ; -> objc_msgSend
000cdb08  ldr     r1, [pc, #0x30]
000cdb0a  add     r1, pc ; -> 0x000fd1a4  
000cdb0c  ldr     r1, [r1]
000cdb0e  blx     #0xddbfc ; -> objc_msgSend
000cdb12  ldr     r2, [pc, #0x2c]
000cdb14  mov     r3, r4
000cdb16  add     r2, pc ; -> 0x000fc99c  '\\\x07\x0e'
000cdb18  ldr     r2, [r2]
000cdb1a  mov     r1, r0
000cdb1c  mov     r0, sp
000cdb1e  blx     #0xddc14 ; -> objc_msgSend_stret
000cdb22  ldr     r1, [pc, #0x20]
000cdb24  mov     r0, r4
000cdb26  ldm.w   sp, {r2, r3}
000cdb2a  add     r1, pc ; -> 0x000fdb00  
000cdb2c  ldr     r1, [r1]
000cdb2e  blx     #0xddbfc ; -> objc_msgSend
000cdb32  sub.w   sp, r7, #4
000cdb36  pop     {r4, r7, pc}
000cdb38  movs    r0, r0
000cdb3a  movs    r3, r0
