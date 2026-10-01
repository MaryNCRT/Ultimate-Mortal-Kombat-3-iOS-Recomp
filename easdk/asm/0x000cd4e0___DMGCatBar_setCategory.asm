========================================================================
-[DMGCatBar setCategory  0x000cd4e0  212 bytes   DMGCatBar.mm
========================================================================

000cd4e0  push    {r4, r5, r7, lr}
000cd4e2  add     r7, sp, #8
000cd4e4  ldr     r3, [pc, #0x88]
000cd4e6  ldr     r1, [pc, #0x8c]
000cd4e8  mov     r5, r0
000cd4ea  add     r3, pc ; -> 0x000f9804  OBJC_IVAR_$_DMGCatBar.parentController
000cd4ec  add     r1, pc ; -> 0x000fda68  'v\x15\x0f'
000cd4ee  ldr     r3, [r3]
000cd4f0  ldr     r1, [r1]
000cd4f2  mov     r4, r2
000cd4f4  ldr     r0, [r0, r3]
000cd4f6  blx     #0xddbfc ; -> objc_msgSend
000cd4fa  ldr     r3, [pc, #0x7c]
000cd4fc  add     r3, pc ; -> 0x0017fe64  
000cd4fe  cmp     r4, r3
000cd500  bne     #0xcd510
000cd502  ldr     r3, [pc, #0x78]
000cd504  ldr     r1, [pc, #0x78]
000cd506  add     r3, pc ; -> 0x000f97ec  OBJC_IVAR_$_DMGCatBar.buttonNew
000cd508  add     r1, pc ; -> 0x000fdb1c  "c'\x0f"
000cd50a  ldr     r0, [r3]
000cd50c  ldr     r0, [r5, r0]
000cd50e  b       #0xcd566
000cd510  ldr     r3, [pc, #0x70]
000cd512  add     r3, pc ; -> 0x00182b34  
000cd514  cmp     r4, r3
000cd516  bne     #0xcd526
000cd518  ldr     r3, [pc, #0x6c]
000cd51a  ldr     r1, [pc, #0x70]
000cd51c  add     r3, pc ; -> 0x000f97f0  OBJC_IVAR_$_DMGCatBar.buttonHot
000cd51e  add     r1, pc ; -> 0x000fdb1c  "c'\x0f"
000cd520  ldr     r0, [r3]
000cd522  ldr     r0, [r5, r0]
000cd524  b       #0xcd566
000cd526  ldr     r3, [pc, #0x68]
000cd528  add     r3, pc ; -> 0x00182b44  
000cd52a  cmp     r4, r3
000cd52c  bne     #0xcd53c
000cd52e  ldr     r3, [pc, #0x64]
000cd530  ldr     r1, [pc, #0x64]
000cd532  add     r3, pc ; -> 0x000f97f4  OBJC_IVAR_$_DMGCatBar.buttonYou
000cd534  add     r1, pc ; -> 0x000fdb1c  "c'\x0f"
000cd536  ldr     r0, [r3]
000cd538  ldr     r0, [r5, r0]
000cd53a  b       #0xcd566
000cd53c  ldr     r3, [pc, #0x5c]
000cd53e  add     r3, pc ; -> 0x00182b54  
000cd540  cmp     r4, r3
000cd542  bne     #0xcd552
000cd544  ldr     r3, [pc, #0x58]
000cd546  ldr     r1, [pc, #0x5c]
000cd548  add     r3, pc ; -> 0x000f97f8  OBJC_IVAR_$_DMGCatBar.buttonAll
000cd54a  add     r1, pc ; -> 0x000fdb1c  "c'\x0f"
000cd54c  ldr     r0, [r3]
000cd54e  ldr     r0, [r5, r0]
000cd550  b       #0xcd566
000cd552  ldr     r3, [pc, #0x54]
000cd554  add     r3, pc ; -> 0x00182b64  
000cd556  cmp     r4, r3
000cd558  bne     #0xcd56e
000cd55a  ldr     r3, [pc, #0x50]
000cd55c  ldr     r1, [pc, #0x50]
000cd55e  add     r3, pc ; -> 0x000f97fc  OBJC_IVAR_$_DMGCatBar.buttonSoon
000cd560  add     r1, pc ; -> 0x000fdb1c  "c'\x0f"
000cd562  ldr     r0, [r3]
000cd564  ldr     r0, [r5, r0]
000cd566  ldr     r1, [r1]
000cd568  movs    r2, #1
000cd56a  blx     #0xddbfc ; -> objc_msgSend
000cd56e  pop     {r4, r5, r7, pc}
000cd570  stm     r3!, {r1, r2, r4}
000cd572  movs    r2, r0
000cd574  lsls    r0, r7, #0x15
000cd576  movs    r3, r0
000cd578  cmp     r1, #0x64
000cd57a  movs    r3, r1
000cd57c  stm     r2!, {r1, r5, r6, r7}
000cd57e  movs    r2, r0
000cd580  lsls    r0, r2, #0x18
000cd582  movs    r3, r0
000cd584  ldrsb   r6, [r3, r0]
000cd586  movs    r3, r1
000cd588  stm     r2!, {r4, r6, r7}
000cd58a  movs    r2, r0
000cd58c  lsls    r2, r7, #0x17
000cd58e  movs    r3, r0
000cd590  ldrsb   r0, [r3, r0]
000cd592  movs    r3, r1
000cd594  stm     r2!, {r1, r2, r3, r4, r5, r7}
000cd596  movs    r2, r0
000cd598  lsls    r4, r4, #0x17
000cd59a  movs    r3, r0
000cd59c  ldrsb   r2, [r2, r0]
000cd59e  movs    r3, r1
000cd5a0  stm     r2!, {r2, r3, r5, r7}
000cd5a2  movs    r2, r0
000cd5a4  lsls    r6, r1, #0x17
000cd5a6  movs    r3, r0
000cd5a8  ldrsb   r4, [r1, r0]
000cd5aa  movs    r3, r1
000cd5ac  stm     r2!, {r1, r3, r4, r7}
000cd5ae  movs    r2, r0
000cd5b0  lsls    r0, r7, #0x16
000cd5b2  movs    r3, r0
