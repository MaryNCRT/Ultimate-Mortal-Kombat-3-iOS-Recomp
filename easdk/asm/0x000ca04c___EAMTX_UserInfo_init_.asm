========================================================================
-[EAMTX_UserInfo init]  0x000ca04c  180 bytes   EAMTX_UserInfo.mm
========================================================================

000ca04c  push    {r4, r5, r6, r7, lr}
000ca04e  add     r7, sp, #0xc
000ca050  sub     sp, #8
000ca052  ldr     r3, [pc, #0x88]
000ca054  ldr     r1, [pc, #0x88]
000ca056  str     r0, [sp]
000ca058  add     r3, pc ; -> 0x000fdda0  
000ca05a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000ca05c  ldr     r3, [r3]
000ca05e  ldr     r1, [r1]
000ca060  mov     r0, sp
000ca062  str     r3, [sp, #4]
000ca064  blx     #0xddc08 ; -> objc_msgSendSuper2
000ca068  ldr     r1, [pc, #0x78]
000ca06a  movs    r2, #0
000ca06c  add     r1, pc ; -> 0x000fd6c0  
000ca06e  ldr     r1, [r1]
000ca070  mov     r6, r0
000ca072  blx     #0xddbfc ; -> objc_msgSend
000ca076  ldr     r1, [pc, #0x70]
000ca078  movs    r2, #0
000ca07a  mov     r0, r6
000ca07c  add     r1, pc ; -> 0x000fd4a8  
000ca07e  ldr     r1, [r1]
000ca080  blx     #0xddbfc ; -> objc_msgSend
000ca084  ldr     r0, [pc, #0x64]
000ca086  ldr     r1, [pc, #0x68]
000ca088  add     r0, pc ; -> 0x000fdb70  
000ca08a  add     r1, pc ; -> 0x000fcd24  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ac
000ca08c  ldr     r5, [r0]
000ca08e  ldr     r4, [r1]
000ca090  mov     r0, r5
000ca092  mov     r1, r4
000ca094  blx     #0xddbfc ; -> objc_msgSend
000ca098  ldr     r1, [pc, #0x58]
000ca09a  add     r1, pc ; -> 0x000fd7b0  '9\x07\x0f'
000ca09c  ldr     r1, [r1]
000ca09e  mov     r2, r0
000ca0a0  mov     r0, r6
000ca0a2  blx     #0xddbfc ; -> objc_msgSend
000ca0a6  mov     r1, r4
000ca0a8  mov     r0, r5
000ca0aa  blx     #0xddbfc ; -> objc_msgSend
000ca0ae  ldr     r1, [pc, #0x48]
000ca0b0  add     r1, pc ; -> 0x000fd7ac  'N\x07\x0f'
000ca0b2  ldr     r1, [r1]
000ca0b4  mov     r2, r0
000ca0b6  mov     r0, r6
000ca0b8  blx     #0xddbfc ; -> objc_msgSend
000ca0bc  mov     r1, r4
000ca0be  mov     r0, r5
000ca0c0  blx     #0xddbfc ; -> objc_msgSend
000ca0c4  ldr     r1, [pc, #0x34]
000ca0c6  add     r1, pc ; -> 0x000fd7a8  ']\x07\x0f'
000ca0c8  ldr     r1, [r1]
000ca0ca  mov     r2, r0
000ca0cc  mov     r0, r6
000ca0ce  blx     #0xddbfc ; -> objc_msgSend
000ca0d2  mov     r0, r6
000ca0d4  sub.w   sp, r7, #0xc
000ca0d8  pop     {r4, r5, r6, r7, pc}
000ca0da  nop     
000ca0dc  subs    r5, #0x44
000ca0de  movs    r3, r0
000ca0e0  cmp     r1, #0x22
000ca0e2  movs    r3, r0
000ca0e4  adds    r6, #0x50
000ca0e6  movs    r3, r0
000ca0e8  adds    r4, #0x28
000ca0ea  movs    r3, r0
000ca0ec  subs    r2, #0xe4
000ca0ee  movs    r3, r0
000ca0f0  cmp     r4, #0x96
000ca0f2  movs    r3, r0
000ca0f4  adds    r7, #0x12
000ca0f6  movs    r3, r0
000ca0f8  adds    r6, #0xf8
000ca0fa  movs    r3, r0
000ca0fc  adds    r6, #0xde
000ca0fe  movs    r3, r0
