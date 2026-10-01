========================================================================
-[DMGCatBar receiveTouchPoint  0x000cdb70  288 bytes   DMGCatBar.mm
========================================================================

000cdb70  push    {r4, r5, r6, r7, lr}
000cdb72  add     r7, sp, #0xc
000cdb74  push.w  {r8, sl}
000cdb78  sub     sp, #0xc
000cdb7a  ldr     r1, [pc, #0xd8]
000cdb7c  vmov    s12, r2
000cdb80  mov     r6, r0
000cdb82  add     r1, pc ; -> 0x000f3310  DMG_BUTTON_WIDTH
000cdb84  ldr     r1, [r1]
000cdb86  vldr    s14, [r1]
000cdb8a  vdiv.f32 s14, s12, s14
000cdb8e  vcvt.s32.f32 s14, s14
000cdb92  vmov    r2, s14
000cdb96  cbnz    r2, #0xcdb9e
000cdb98  ldr     r4, [pc, #0xbc]
000cdb9a  add     r4, pc ; -> 0x00182b44  
000cdb9c  b       #0xcdbc4
000cdb9e  cmp     r2, #1
000cdba0  bne     #0xcdba8
000cdba2  ldr     r4, [pc, #0xb8]
000cdba4  add     r4, pc ; -> 0x0017fe64  
000cdba6  b       #0xcdbc4
000cdba8  cmp     r2, #2
000cdbaa  bne     #0xcdbb2
000cdbac  ldr     r4, [pc, #0xb0]
000cdbae  add     r4, pc ; -> 0x00182b34  
000cdbb0  b       #0xcdbc4
000cdbb2  cmp     r2, #3
000cdbb4  bne     #0xcdbbc
000cdbb6  ldr     r4, [pc, #0xac]
000cdbb8  add     r4, pc ; -> 0x00182b54  
000cdbba  b       #0xcdbc4
000cdbbc  cmp     r2, #4
000cdbbe  bne     #0xcdc34
000cdbc0  ldr     r4, [pc, #0xa4]
000cdbc2  add     r4, pc ; -> 0x00182b64  
000cdbc4  ldr     r3, [pc, #0xa4]
000cdbc6  add     r3, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000cdbc8  cmp     r4, r3
000cdbca  beq     #0xcdc34
000cdbcc  ldr     r5, [pc, #0xa0]
000cdbce  ldr     r1, [pc, #0xa4]
000cdbd0  mov     r2, r4
000cdbd2  add     r5, pc ; -> 0x000f9648  OBJC_IVAR_$_DMGCatBar.m_CurrCat
000cdbd4  add     r1, pc ; -> 0x000fd16c  
000cdbd6  ldr     r3, [r5]
000cdbd8  ldr     r1, [r1]
000cdbda  ldr     r0, [r6, r3]
000cdbdc  blx     #0xddbfc ; -> objc_msgSend
000cdbe0  cbz     r0, #0xcdc34
000cdbe2  ldr     r3, [pc, #0x94]
000cdbe4  ldr     r1, [pc, #0x94]
000cdbe6  add     r3, pc ; -> 0x000f9804  OBJC_IVAR_$_DMGCatBar.parentController
000cdbe8  add     r1, pc ; -> 0x000fd8e0  '\r\x15\x0f'
000cdbea  ldr     r0, [r3]
000cdbec  ldr.w   sl, [r1]
000cdbf0  ldr     r1, [pc, #0x8c]
000cdbf2  ldr.w   r8, [r6, r0]
000cdbf6  add     r1, pc ; -> 0x000fdb10  'I\x14\x0f'
000cdbf8  ldr     r1, [r1]
000cdbfa  mov     r0, r8
000cdbfc  blx     #0xddbfc ; -> objc_msgSend
000cdc00  movs    r3, #4
000cdc02  movw    r2, #0x7535
000cdc06  str     r3, [sp, #4]
000cdc08  mov     r1, sl
000cdc0a  adds    r3, #9
000cdc0c  str     r4, [sp]
000cdc0e  str     r0, [sp, #8]
000cdc10  mov     r0, r8
000cdc12  blx     #0xddbfc ; -> objc_msgSend
000cdc16  ldr     r1, [pc, #0x6c]
000cdc18  mov     r0, r6
000cdc1a  add     r1, pc ; -> 0x000fdb18  "\x1c'\x0f"
000cdc1c  ldr     r1, [r1]
000cdc1e  blx     #0xddbfc ; -> objc_msgSend
000cdc22  ldr     r1, [pc, #0x64]
000cdc24  ldr     r3, [r5]
000cdc26  mov     r0, r6
000cdc28  add     r1, pc ; -> 0x000fdb14  
000cdc2a  mov     r2, r4
000cdc2c  ldr     r1, [r1]
000cdc2e  str     r4, [r6, r3]
000cdc30  blx     #0xddbfc ; -> objc_msgSend
000cdc34  ldr     r1, [pc, #0x54]
000cdc36  movs    r4, #0
000cdc38  mov     r0, r6
000cdc3a  add     r1, pc ; -> 0x000fda90  
000cdc3c  mov     r2, r4
000cdc3e  ldr     r1, [r1]
000cdc40  mov     r3, r4
000cdc42  mov     r5, r4
000cdc44  blx     #0xddbfc ; -> objc_msgSend
000cdc48  sub.w   sp, r7, #0x14
000cdc4c  pop.w   {r8, sl}
000cdc50  pop     {r4, r5, r6, r7, pc}
000cdc52  nop     
000cdc54  ldrsb   r2, [r1, r6]
000cdc56  movs    r2, r0
000cdc58  ldr     r7, [pc, #0x298]
000cdc5a  movs    r3, r1
000cdc5c  movs    r2, #0xbc
000cdc5e  movs    r3, r1
000cdc60  ldr     r7, [pc, #0x208]
000cdc62  movs    r3, r1
000cdc64  ldr     r7, [pc, #0x260]
000cdc66  movs    r3, r1
000cdc68  ldr     r7, [pc, #0x278]
000cdc6a  movs    r3, r1
000cdc6c  lsls    r2, r5, #0x1c
000cdc6e  movs    r3, r1
000cdc70  rev16   r2, r6
000cdc72  movs    r2, r0
