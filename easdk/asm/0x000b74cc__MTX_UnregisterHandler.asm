========================================================================
MTX_UnregisterHandler  0x000b74cc  112 bytes   EAMTX_Main.mm
========================================================================

000b74cc  push    {r4, r7, lr}
000b74ce  add     r7, sp, #4
000b74d0  ldr     r1, [pc, #0x4c]
000b74d2  mov     r2, r0
000b74d4  ldr     r0, [pc, #0x4c]
000b74d6  add     r1, pc ; -> 0x000fd6e4  '\x13'
000b74d8  add     r0, pc ; -> 0x000fdc64  
000b74da  ldr     r1, [r1]
000b74dc  ldr     r0, [r0]
000b74de  blx     #0xddbfc ; -> objc_msgSend
000b74e2  mov     r4, r0
000b74e4  ldr     r0, [pc, #0x40]
000b74e6  add     r0, pc ; -> 0x0038c0b0  m_Callbacks
000b74e8  ldr     r0, [r0]
000b74ea  cbz     r0, #0xb74fe
000b74ec  ldr     r1, [pc, #0x3c]
000b74ee  mov     r2, r4
000b74f0  add     r1, pc ; -> 0x000fd0dc  'zz\x0e'
000b74f2  ldr     r1, [r1]
000b74f4  blx     #0xddbfc ; -> objc_msgSend
000b74f8  tst.w   r0, #0xff
000b74fc  bne     #0xb750a
000b74fe  ldr     r0, [pc, #0x30]
000b7500  add     r0, pc ; -> 0x001800e4  
000b7502  blx     #0xdd3e0 ; -> NSLog
000b7506  movs    r0, #0
000b7508  b       #0xb751e
000b750a  ldr     r0, [pc, #0x28]
000b750c  ldr     r1, [pc, #0x28]
000b750e  mov     r2, r4
000b7510  add     r0, pc ; -> 0x0038c0b0  m_Callbacks
000b7512  add     r1, pc ; -> 0x000fcd7c  'lz\x0e'
000b7514  ldr     r0, [r0]
000b7516  ldr     r1, [r1]
000b7518  blx     #0xddbfc ; -> objc_msgSend
000b751c  movs    r0, #1
000b751e  pop     {r4, r7, pc}
000b7520  str     r2, [r1, #0x20]
000b7522  movs    r4, r0
000b7524  str     r0, [r1, #0x78]
000b7526  movs    r4, r0
000b7528  ldr     r3, [pc, #0x318]
000b752a  movs    r5, r5
000b752c  ldrh    r0, [r5, r7]
000b752e  movs    r4, r0
000b7530  ldrh    r0, [r4, #0x1e]
000b7532  movs    r4, r1
000b7534  ldr     r3, [pc, #0x270]
000b7536  movs    r5, r5
000b7538  ldr     r6, [r4, r1]
000b753a  movs    r4, r0
