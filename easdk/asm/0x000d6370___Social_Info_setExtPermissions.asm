========================================================================
-[Social_Info setExtPermissions  0x000d6370  68 bytes   Social_Info.mm
========================================================================

000d6370  push    {r4, r5, r7, lr}
000d6372  add     r7, sp, #8
000d6374  mov     r4, r0
000d6376  cbz     r2, #0xd63a2
000d6378  ldr     r3, [pc, #0x28]
000d637a  add     r3, pc ; -> 0x000fae60  OBJC_IVAR_$_Social_Info.mFacebookAgent
000d637c  ldr     r0, [r3]
000d637e  ldr     r0, [r4, r0]
000d6380  cbz     r0, #0xd638e
000d6382  ldr     r1, [pc, #0x24]
000d6384  add     r1, pc ; -> 0x000fd7e8  '=\x0c\x0f'
000d6386  ldr     r1, [r1]
000d6388  blx     #0xddbfc ; -> objc_msgSend
000d638c  b       #0xd63a2
000d638e  ldr     r1, [pc, #0x1c]
000d6390  ldr     r3, [pc, #0x1c]
000d6392  mov     r0, r2
000d6394  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d6396  add     r3, pc ; -> 0x000fb77c  OBJC_IVAR_$_Social_Info.permissions
000d6398  ldr     r1, [r1]
000d639a  ldr     r5, [r3]
000d639c  blx     #0xddbfc ; -> objc_msgSend
000d63a0  str     r0, [r4, r5]
000d63a2  pop     {r4, r5, r7, pc}
000d63a4  ldr     r2, [pc, #0x388]
000d63a6  movs    r2, r0
000d63a8  strb    r0, [r4, #0x11]
000d63aa  movs    r2, r0
000d63ac  ldr     r0, [r7, #0x10]
000d63ae  movs    r2, r0
000d63b0  strh    r2, [r4, r7]
000d63b2  movs    r2, r0
