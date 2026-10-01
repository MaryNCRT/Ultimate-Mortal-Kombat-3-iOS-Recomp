========================================================================
-[DMGViewController loadView]  0x000d095c  208 bytes   DMGViewController.mm
========================================================================

000d095c  push    {r4, r5, r6, r7, lr}
000d095e  add     r7, sp, #0xc
000d0960  str     r8, [sp, #-0x4]!
000d0964  sub     sp, #0x18
000d0966  ldr     r1, [pc, #0x98]
000d0968  mov     r8, r0
000d096a  ldr     r0, [pc, #0x98]
000d096c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d096e  add     r4, sp, #8
000d0970  add     r0, pc ; -> 0x000fdbb8  
000d0972  ldr     r1, [r1]
000d0974  ldr     r0, [r0]
000d0976  blx     #0xddbfc ; -> objc_msgSend
000d097a  ldr     r1, [pc, #0x8c]
000d097c  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000d097e  ldr     r5, [r1]
000d0980  ldr     r1, [pc, #0x88]
000d0982  add     r1, pc ; -> 0x000fc9e4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x6c
000d0984  ldr     r1, [r1]
000d0986  mov     r6, r0
000d0988  ldr     r0, [pc, #0x84]
000d098a  add     r0, pc ; -> 0x000fdb54  
000d098c  ldr     r0, [r0]
000d098e  blx     #0xddbfc ; -> objc_msgSend
000d0992  ldr     r2, [pc, #0x80]
000d0994  add     r2, pc ; -> 0x000fcd70  'L2\x0e'
000d0996  ldr     r2, [r2]
000d0998  mov     r1, r0
000d099a  add     r0, sp, #8
000d099c  blx     #0xddc14 ; -> objc_msgSend_stret
000d09a0  add     r0, sp, #0x10
000d09a2  ldm     r0, {r0, r1}
000d09a4  stm.w   sp, {r0, r1}
000d09a8  mov     r1, r5
000d09aa  ldm.w   r4, {r2, r3}
000d09ae  mov     r0, r6
000d09b0  blx     #0xddbfc ; -> objc_msgSend
000d09b4  ldr     r1, [pc, #0x60]
000d09b6  movs    r2, #1
000d09b8  add     r1, pc ; -> 0x000fd1b8  ' }\x0e'
000d09ba  ldr     r1, [r1]
000d09bc  mov     r4, r0
000d09be  blx     #0xddbfc ; -> objc_msgSend
000d09c2  ldr     r1, [pc, #0x58]
000d09c4  mov     r2, r4
000d09c6  mov     r0, r8
000d09c8  add     r1, pc ; -> 0x000fd1b4  '\t}\x0e'
000d09ca  ldr     r1, [r1]
000d09cc  blx     #0xddbfc ; -> objc_msgSend
000d09d0  ldr     r1, [pc, #0x4c]
000d09d2  mov     r0, r8
000d09d4  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000d09d6  ldr     r1, [r1]
000d09d8  blx     #0xddbfc ; -> objc_msgSend
000d09dc  ldr     r1, [pc, #0x44]
000d09de  movs    r2, #1
000d09e0  add     r1, pc ; -> 0x000fccc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x348
000d09e2  ldr     r1, [r1]
000d09e4  blx     #0xddbfc ; -> objc_msgSend
000d09e8  ldr     r1, [pc, #0x3c]
000d09ea  mov     r0, r4
000d09ec  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d09ee  ldr     r1, [r1]
000d09f0  blx     #0xddbfc ; -> objc_msgSend
000d09f4  sub.w   sp, r7, #0x10
000d09f8  ldr     r8, [sp], #4
000d09fc  pop     {r4, r5, r6, r7, pc}
000d09fe  nop     
000d0a00  stm     r0!, {r2, r4}
000d0a02  movs    r2, r0
000d0a04  bhs     #0xd0a90
000d0a06  movs    r2, r0
000d0a08  stm     r3!, {r2, r4, r6}
000d0a0a  movs    r2, r0
000d0a0c  stm     r0!, {r1, r2, r3, r4, r6}
000d0a0e  movs    r2, r0
000d0a10  bne     #0xd09a0
000d0a12  movs    r2, r0
000d0a14  stm     r3!, {r3, r4, r6, r7}
000d0a16  movs    r2, r0
000d0a18  stm     r7!, {r2, r3, r4, r5, r6, r7}
000d0a1a  movs    r2, r0
000d0a1c  stm     r7!, {r3, r5, r6, r7}
000d0a1e  movs    r2, r0
000d0a20  stm     r1!, {r2, r3, r4, r6}
000d0a22  movs    r2, r0
000d0a24  stm     r2!, {r2, r3, r4, r6, r7}
000d0a26  movs    r2, r0
000d0a28  ite     hi
000d0a2a  movs    r2, r0
