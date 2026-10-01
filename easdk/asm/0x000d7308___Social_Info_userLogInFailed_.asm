========================================================================
-[Social_Info userLogInFailed]  0x000d7308  260 bytes   Social_Info.mm
========================================================================

000d7308  push    {r4, r5, r6, r7, lr}
000d730a  add     r7, sp, #0xc
000d730c  str     r8, [sp, #-0x4]!
000d7310  ldr     r3, [pc, #0xb0]
000d7312  mov     r8, r0
000d7314  add     r3, pc ; -> 0x000fb778  OBJC_IVAR_$_Social_Info.renewToken
000d7316  ldr     r3, [r3]
000d7318  ldrsb   r3, [r0, r3]
000d731a  cmp     r3, #0
000d731c  bne     #0xd73bc
000d731e  ldr     r0, [pc, #0xa8]
000d7320  ldr     r1, [pc, #0xa8]
000d7322  ldr     r6, [pc, #0xac]
000d7324  add     r0, pc ; -> 0x000fdbf4  
000d7326  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d7328  ldr     r0, [r0]
000d732a  ldr     r1, [r1]
000d732c  blx     #0xddbfc ; -> objc_msgSend
000d7330  ldr     r1, [pc, #0xa0]
000d7332  add     r6, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d7334  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d7336  ldr     r1, [r1]
000d7338  blx     #0xddbfc ; -> objc_msgSend
000d733c  ldr     r1, [pc, #0x98]
000d733e  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000d7340  ldr     r1, [r1]
000d7342  blx     #0xddbfc ; -> objc_msgSend
000d7346  ldr     r1, [pc, #0x94]
000d7348  ldr     r2, [pc, #0x94]
000d734a  ldr     r3, [pc, #0x98]
000d734c  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000d734e  add     r2, pc ; -> 0x001804a4  
000d7350  ldr     r4, [r1]
000d7352  add     r3, pc ; -> 0x001801e4  
000d7354  mov     r1, r4
000d7356  mov     r5, r0
000d7358  blx     #0xddbfc ; -> objc_msgSend
000d735c  ldr     r3, [pc, #0x88]
000d735e  mov     r0, r5
000d7360  mov     r1, r4
000d7362  add     r3, pc ; -> 0x001801f4  
000d7364  mov     r2, r6
000d7366  blx     #0xddbfc ; -> objc_msgSend
000d736a  ldr     r0, [pc, #0x80]
000d736c  ldr     r1, [pc, #0x80]
000d736e  ldr     r2, [pc, #0x84]
000d7370  add     r0, pc ; -> 0x000fdb5c  
000d7372  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d7374  add     r2, pc ; -> 0x0017e5c4  
000d7376  ldr     r1, [r1]
000d7378  ldr     r3, [pc, #0x7c]
000d737a  ldr     r0, [r0]
000d737c  blx     #0xddbfc ; -> objc_msgSend
000d7380  ldr     r3, [pc, #0x78]
000d7382  mov     r1, r4
000d7384  add     r3, pc ; -> 0x00180204  
000d7386  mov     r2, r0
000d7388  mov     r0, r5
000d738a  blx     #0xddbfc ; -> objc_msgSend
000d738e  ldr     r3, [pc, #0x70]
000d7390  mov     r0, r5
000d7392  mov     r1, r4
000d7394  add     r3, pc ; -> 0x00180214  
000d7396  mov     r2, r6
000d7398  blx     #0xddbfc ; -> objc_msgSend
000d739c  ldr     r3, [pc, #0x64]
000d739e  mov     r0, r5
000d73a0  mov     r1, r4
000d73a2  add     r3, pc ; -> 0x00180224  
000d73a4  mov     r2, r6
000d73a6  blx     #0xddbfc ; -> objc_msgSend
000d73aa  ldr     r3, [pc, #0x5c]
000d73ac  mov     r2, r5
000d73ae  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d73b0  ldr     r0, [r3]
000d73b2  ldr.w   r1, [r8, r0]
000d73b6  movs    r0, #0x39
000d73b8  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d73bc  ldr     r8, [sp], #4
000d73c0  pop     {r4, r5, r6, r7, pc}
000d73c2  nop     
000d73c4  add     r0, ip
000d73c6  movs    r2, r0
000d73c8  ldr     r4, [r1, #0xc]
000d73ca  movs    r2, r0
000d73cc  ldrsb   r2, [r3, r1]
000d73ce  movs    r2, r0
000d73d0  ldr     r6, [r7, #0x78]
000d73d2  movs    r2, r1
000d73d4  ldrsb   r0, [r1, r1]
000d73d6  movs    r2, r0
000d73d8  ldrsb   r6, [r2, r4]
000d73da  movs    r2, r0
000d73dc  ldrsb   r0, [r1, r6]
000d73de  movs    r2, r0
000d73e0  str     r1, [sp, #0x148]
000d73e2  movs    r2, r1
000d73e4  ldrh    r6, [r1, #0x34]
000d73e6  movs    r2, r1
000d73e8  ldrh    r6, [r1, #0x34]
000d73ea  movs    r2, r1
000d73ec  str     r0, [r5, #0x7c]
000d73ee  movs    r2, r0
000d73f0  ldrsb   r2, [r5, r4]
000d73f2  movs    r2, r0
000d73f4  strb    r4, [r1, #9]
000d73f6  movs    r2, r1
