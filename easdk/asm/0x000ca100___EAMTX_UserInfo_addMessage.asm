========================================================================
-[EAMTX_UserInfo addMessage  0x000ca100  268 bytes   EAMTX_UserInfo.mm
========================================================================

000ca100  push    {r4, r5, r6, r7, lr}
000ca102  add     r7, sp, #0xc
000ca104  push.w  {r8, sl, fp}
000ca108  sub     sp, #0x70
000ca10a  ldr     r1, [pc, #0xe0]
000ca10c  ldr     r3, [pc, #0xe0]
000ca10e  str     r0, [sp, #4]
000ca110  add     r1, pc ; -> 0x000fd0dc  'zz\x0e'
000ca112  add     r3, pc ; -> 0x000f8520  OBJC_IVAR_$_EAMTX_UserInfo.m_ExcludedMessageIds
000ca114  ldr     r4, [r1]
000ca116  ldr     r1, [pc, #0xdc]
000ca118  ldr     r0, [r3]
000ca11a  mov     sl, r2
000ca11c  add     r1, pc ; -> 0x000fd79c  
000ca11e  ldr     r2, [sp, #4]
000ca120  ldr     r6, [r1]
000ca122  ldr     r5, [r2, r0]
000ca124  mov     r1, r6
000ca126  mov     r0, sl
000ca128  blx     #0xddbfc ; -> objc_msgSend
000ca12c  mov     r1, r4
000ca12e  mov     r2, r0
000ca130  mov     r0, r5
000ca132  blx     #0xddbfc ; -> objc_msgSend
000ca136  uxtb    r0, r0
000ca138  cmp     r0, #0
000ca13a  bne     #0xca1e2
000ca13c  ldr     r3, [pc, #0xb8]
000ca13e  ldr     r1, [pc, #0xbc]
000ca140  str     r0, [sp, #0x50]
000ca142  add     r3, pc ; -> 0x000f851c  OBJC_IVAR_$_EAMTX_UserInfo.m_Messages
000ca144  str     r0, [sp, #0x54]
000ca146  str     r0, [sp, #0x58]
000ca148  str     r0, [sp, #0x5c]
000ca14a  str     r0, [sp, #0x60]
000ca14c  str     r0, [sp, #0x64]
000ca14e  str     r0, [sp, #0x68]
000ca150  str     r0, [sp, #0x6c]
000ca152  ldr     r0, [r3]
000ca154  ldr     r3, [sp, #4]
000ca156  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000ca158  add     r2, sp, #0x50
000ca15a  ldr     r1, [r1]
000ca15c  ldr     r0, [r3, r0]
000ca15e  movs    r3, #0x10
000ca160  str     r3, [sp]
000ca162  add     r3, sp, r3
000ca164  str     r0, [sp, #8]
000ca166  str     r1, [sp, #0xc]
000ca168  blx     #0xddbfc ; -> objc_msgSend
000ca16c  cmp     r0, #0
000ca16e  beq     #0xca1cc
000ca170  ldr     r3, [sp, #0x58]
000ca172  mov     r8, r0
000ca174  ldr.w   fp, [r3]
000ca178  b       #0xca17c
000ca17a  ldr     r3, [sp, #0x58]
000ca17c  movs    r5, #0
000ca17e  b       #0xca182
000ca180  ldr     r3, [sp, #0x58]
000ca182  ldr     r3, [r3]
000ca184  cmp     r3, fp
000ca186  beq     #0xca196
000ca188  ldr     r3, [pc, #0x74]
000ca18a  ldr     r2, [sp, #4]
000ca18c  add     r3, pc ; -> 0x000f851c  OBJC_IVAR_$_EAMTX_UserInfo.m_Messages
000ca18e  ldr     r3, [r3]
000ca190  ldr     r0, [r2, r3]
000ca192  blx     #0xddbe4 ; -> objc_enumerationMutation
000ca196  ldr     r3, [sp, #0x54]
000ca198  mov     r1, r6
000ca19a  ldr.w   r0, [r3, r5, lsl #2]
000ca19e  blx     #0xddbfc ; -> objc_msgSend
000ca1a2  mov     r1, r6
000ca1a4  mov     r4, r0
000ca1a6  mov     r0, sl
000ca1a8  blx     #0xddbfc ; -> objc_msgSend
000ca1ac  cmp     r4, r0
000ca1ae  beq     #0xca1e2
000ca1b0  adds    r5, #1
000ca1b2  cmp     r8, r5
000ca1b4  bhi     #0xca180
000ca1b6  movs    r3, #0x10
000ca1b8  ldr     r0, [sp, #8]
000ca1ba  str     r3, [sp]
000ca1bc  ldr     r1, [sp, #0xc]
000ca1be  add     r2, sp, #0x50
000ca1c0  add     r3, sp, r3
000ca1c2  blx     #0xddbfc ; -> objc_msgSend
000ca1c6  mov     r8, r0
000ca1c8  cmp     r0, #0
000ca1ca  bne     #0xca17a
000ca1cc  ldr     r3, [pc, #0x34]
000ca1ce  ldr     r1, [pc, #0x38]
000ca1d0  mov     r2, sl
000ca1d2  add     r3, pc ; -> 0x000f851c  OBJC_IVAR_$_EAMTX_UserInfo.m_Messages
000ca1d4  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000ca1d6  ldr     r0, [r3]
000ca1d8  ldr     r3, [sp, #4]
000ca1da  ldr     r1, [r1]
000ca1dc  ldr     r0, [r3, r0]
000ca1de  blx     #0xddbfc ; -> objc_msgSend
000ca1e2  sub.w   sp, r7, #0x18
000ca1e6  pop.w   {r8, sl, fp}
000ca1ea  pop     {r4, r5, r6, r7, pc}
000ca1ec  cmp     r7, #0xc8
000ca1ee  movs    r3, r0
000ca1f0  b       #0xc9a08
000ca1f2  movs    r2, r0
000ca1f4  adds    r6, #0x7c
000ca1f6  movs    r3, r0
000ca1f8  b       #0xca9a8
000ca1fa  movs    r2, r0
000ca1fc  cmp     r0, #0x3e
000ca1fe  movs    r3, r0
000ca200  b       #0xca91c
000ca202  movs    r2, r0
000ca204  b       #0xca894
000ca206  movs    r2, r0
000ca208  cmp     r0, #0xac
000ca20a  movs    r3, r0
