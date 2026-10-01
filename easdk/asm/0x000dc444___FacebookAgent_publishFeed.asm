========================================================================
-[FacebookAgent publishFeed  0x000dc444  272 bytes   FacebookAgent.mm
========================================================================

000dc444  push    {r4, r5, r6, r7, lr}
000dc446  add     r7, sp, #0xc
000dc448  str     r8, [sp, #-0x4]!
000dc44c  sub     sp, #0xc
000dc44e  mov     r4, r3
000dc450  ldr     r3, [pc, #0xbc]
000dc452  mov     lr, r2
000dc454  ldr.w   r8, [sp, #0x24]
000dc458  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc45a  movs    r2, #6
000dc45c  ldr     r3, [r3]
000dc45e  mov     r5, r0
000dc460  ldr     r1, [pc, #0xb0]
000dc462  ldr.w   ip, [pc, #0xb4]
000dc466  str     r2, [r0, r3]
000dc468  ldr     r0, [pc, #0xb0]
000dc46a  ldr     r2, [pc, #0xb4]
000dc46c  ldr     r3, [pc, #0xb4]
000dc46e  add     r0, pc ; -> 0x000fdbf4  
000dc470  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dc472  ldr     r0, [r0]
000dc474  add     r2, pc ; -> 0x001825d4  
000dc476  add     r3, pc ; -> 0x0017ed64  
000dc478  ldr     r1, [r1]
000dc47a  add     ip, pc ; -> 0x0017ed34  
000dc47c  str.w   lr, [sp]
000dc480  str.w   ip, [sp, #4]
000dc484  mov.w   ip, #0
000dc488  str.w   ip, [sp, #8]
000dc48c  blx     #0xddbfc ; -> objc_msgSend
000dc490  mov     r6, r0
000dc492  cbz     r4, #0xdc4bc
000dc494  ldr     r1, [pc, #0x90]
000dc496  ldr     r2, [pc, #0x94]
000dc498  mov     r0, r4
000dc49a  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000dc49c  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000dc49e  ldr     r1, [r1]
000dc4a0  blx     #0xddbfc ; -> objc_msgSend
000dc4a4  tst.w   r0, #0xff
000dc4a8  bne     #0xdc4bc
000dc4aa  ldr     r1, [pc, #0x84]
000dc4ac  ldr     r3, [pc, #0x84]
000dc4ae  mov     r0, r6
000dc4b0  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000dc4b2  add     r3, pc ; -> 0x0017ed44  
000dc4b4  ldr     r1, [r1]
000dc4b6  mov     r2, r4
000dc4b8  blx     #0xddbfc ; -> objc_msgSend
000dc4bc  cmp.w   r8, #0
000dc4c0  beq     #0xdc4ea
000dc4c2  ldr     r1, [pc, #0x74]
000dc4c4  ldr     r2, [pc, #0x74]
000dc4c6  mov     r0, r8
000dc4c8  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000dc4ca  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000dc4cc  ldr     r1, [r1]
000dc4ce  blx     #0xddbfc ; -> objc_msgSend
000dc4d2  tst.w   r0, #0xff
000dc4d6  bne     #0xdc4ea
000dc4d8  ldr     r1, [pc, #0x64]
000dc4da  ldr     r3, [pc, #0x68]
000dc4dc  mov     r0, r6
000dc4de  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000dc4e0  add     r3, pc ; -> 0x0017ed54  
000dc4e2  ldr     r1, [r1]
000dc4e4  mov     r2, r8
000dc4e6  blx     #0xddbfc ; -> objc_msgSend
000dc4ea  ldr     r3, [pc, #0x5c]
000dc4ec  ldr     r1, [pc, #0x5c]
000dc4ee  ldr     r2, [pc, #0x60]
000dc4f0  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc4f2  add     r1, pc ; -> 0x000fd9d0  '>\x1c\x0f'
000dc4f4  ldr     r3, [r3]
000dc4f6  add     r2, pc ; -> 0x001825e4  
000dc4f8  ldr     r1, [r1]
000dc4fa  str     r5, [sp]
000dc4fc  ldr     r0, [r5, r3]
000dc4fe  mov     r3, r6
000dc500  blx     #0xddbfc ; -> objc_msgSend
000dc504  sub.w   sp, r7, #0x10
000dc508  ldr     r8, [sp], #4
000dc50c  pop     {r4, r5, r6, r7, pc}
000dc50e  nop     
000dc510  lsls    r4, r5, #0x11
000dc512  movs    r2, r0
000dc514  lsls    r0, r1, #0x16
000dc516  movs    r2, r0
000dc518  cmp     r0, #0xb6
000dc51a  movs    r2, r1
000dc51c  asrs    r2, r0, #0x1e
000dc51e  movs    r2, r0
000dc520  str     r4, [r3, #0x14]
000dc522  movs    r2, r1
000dc524  cmp     r0, #0xea
000dc526  movs    r2, r1
000dc528  lsls    r6, r0, #0x1f
000dc52a  movs    r2, r0
000dc52c  subs    r4, r2, #1
000dc52e  movs    r2, r1
000dc530  lsls    r4, r4, #0x18
000dc532  movs    r2, r0
000dc534  cmp     r0, #0x8e
000dc536  movs    r2, r1
000dc538  lsls    r0, r3, #0x1e
000dc53a  movs    r2, r0
000dc53c  subs    r6, r4, #0
000dc53e  movs    r2, r1
000dc540  lsls    r6, r6, #0x17
000dc542  movs    r2, r0
000dc544  cmp     r0, #0x70
000dc546  movs    r2, r1
000dc548  lsls    r4, r0, #0xf
000dc54a  movs    r2, r0
000dc54c  asrs    r2, r3, #0x13
000dc54e  movs    r2, r0
000dc550  str     r2, [r5, #0xc]
000dc552  movs    r2, r1
