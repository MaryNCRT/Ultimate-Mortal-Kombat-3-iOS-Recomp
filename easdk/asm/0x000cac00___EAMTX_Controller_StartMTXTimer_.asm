========================================================================
-[EAMTX_Controller StartMTXTimer]  0x000cac00  148 bytes   EAMTX_Controller.mm
========================================================================

000cac00  push    {r4, r5, r7, lr}
000cac02  add     r7, sp, #8
000cac04  sub     sp, #0x10
000cac06  ldr     r1, [pc, #0x6c]
000cac08  mov     r5, r0
000cac0a  add     r1, pc ; -> 0x000fd78c  '\x16\x05\x0f'
000cac0c  ldr     r4, [r1]
000cac0e  mov     r1, r4
000cac10  blx     #0xddbfc ; -> objc_msgSend
000cac14  cbz     r0, #0xcac2e
000cac16  mov     r1, r4
000cac18  mov     r0, r5
000cac1a  blx     #0xddbfc ; -> objc_msgSend
000cac1e  ldr     r1, [pc, #0x58]
000cac20  add     r1, pc ; -> 0x000fd798  '\r\x07\x0f'
000cac22  ldr     r1, [r1]
000cac24  blx     #0xddbfc ; -> objc_msgSend
000cac28  tst.w   r0, #0xff
000cac2c  bne     #0xcac6c
000cac2e  ldr     r0, [pc, #0x4c]
000cac30  add     r0, pc ; -> 0x00181644  
000cac32  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cac36  ldr     r3, [pc, #0x48]
000cac38  ldr     r0, [pc, #0x48]
000cac3a  ldr     r1, [pc, #0x4c]
000cac3c  add     r3, pc ; -> 0x000fd794  
000cac3e  add     r0, pc ; -> 0x000fdb58  
000cac40  ldr     r3, [r3]
000cac42  add     r1, pc ; -> 0x000fc9b8  '~\x07\x0e'
000cac44  mov.w   r2, #0x55555555
000cac48  ldr     r1, [r1]
000cac4a  str     r3, [sp, #4]
000cac4c  movs    r3, #0
000cac4e  ldr     r0, [r0]
000cac50  str     r3, [sp, #8]
000cac52  adds    r3, #1
000cac54  str     r3, [sp, #0xc]
000cac56  ldr     r3, [pc, #0x34]
000cac58  str     r5, [sp]
000cac5a  blx     #0xddbfc ; -> objc_msgSend
000cac5e  ldr     r1, [pc, #0x30]
000cac60  add     r1, pc ; -> 0x000fd790  
000cac62  ldr     r1, [r1]
000cac64  mov     r2, r0
000cac66  mov     r0, r5
000cac68  blx     #0xddbfc ; -> objc_msgSend
000cac6c  sub.w   sp, r7, #8
000cac70  pop     {r4, r5, r7, pc}
000cac72  nop     
000cac74  cmp     r3, #0x7e
000cac76  movs    r3, r0
000cac78  cmp     r3, #0x74
000cac7a  movs    r3, r0
000cac7c  ldr     r0, [r2, #0x20]
000cac7e  movs    r3, r1
000cac80  cmp     r3, #0x54
000cac82  movs    r3, r0
000cac84  cmp     r7, #0x16
000cac86  movs    r3, r0
000cac88  adds    r2, r6, #5
000cac8a  movs    r3, r0
000cac8c  strb    r5, [r2, r5]
000cac8e  subs    r7, #0xc5
000cac90  cmp     r3, #0x2c
000cac92  movs    r3, r0
