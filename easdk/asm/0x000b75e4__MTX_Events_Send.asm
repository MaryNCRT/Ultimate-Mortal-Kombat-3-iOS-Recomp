========================================================================
MTX_Events_Send  0x000b75e4  200 bytes   EAMTX_Main.mm
========================================================================

000b75e4  push    {r4, r5, r6, r7, lr}
000b75e6  add     r7, sp, #0xc
000b75e8  push.w  {r8, sl, fp}
000b75ec  sub     sp, #0x70
000b75ee  str     r0, [sp, #4]
000b75f0  ldr     r0, [pc, #0xa4]
000b75f2  mov     fp, r1
000b75f4  mov     sl, r2
000b75f6  add     r0, pc ; -> 0x0038c0b0  m_Callbacks
000b75f8  ldr     r0, [r0]
000b75fa  str     r0, [sp, #8]
000b75fc  cbnz    r0, #0xb7608
000b75fe  ldr     r0, [pc, #0x9c]
000b7600  add     r0, pc ; -> 0x00180104  
000b7602  blx     #0xdd3e0 ; -> NSLog
000b7606  b       #0xb768e
000b7608  ldr     r1, [pc, #0x94]
000b760a  movs    r3, #0
000b760c  str     r3, [sp, #0x50]
000b760e  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000b7610  str     r3, [sp, #0x54]
000b7612  ldr     r1, [r1]
000b7614  str     r3, [sp, #0x58]
000b7616  str     r3, [sp, #0x5c]
000b7618  str     r3, [sp, #0x60]
000b761a  str     r3, [sp, #0x64]
000b761c  str     r3, [sp, #0x68]
000b761e  str     r3, [sp, #0x6c]
000b7620  adds    r3, #0x10
000b7622  ldr     r0, [sp, #8]
000b7624  str     r3, [sp]
000b7626  add     r2, sp, #0x50
000b7628  add     r3, sp, r3
000b762a  str     r1, [sp, #0xc]
000b762c  blx     #0xddbfc ; -> objc_msgSend
000b7630  cmp     r0, #0
000b7632  beq     #0xb768e
000b7634  ldr     r1, [pc, #0x6c]
000b7636  ldr     r3, [sp, #0x58]
000b7638  mov     r5, r0
000b763a  add     r1, pc ; -> 0x000fd648  
000b763c  ldr.w   r8, [r3]
000b7640  ldr     r6, [r1]
000b7642  b       #0xb7646
000b7644  ldr     r3, [sp, #0x58]
000b7646  movs    r4, #0
000b7648  b       #0xb764c
000b764a  ldr     r3, [sp, #0x58]
000b764c  ldr     r3, [r3]
000b764e  cmp     r3, r8
000b7650  beq     #0xb765c
000b7652  ldr     r0, [pc, #0x54]
000b7654  add     r0, pc ; -> 0x0038c0b0  m_Callbacks
000b7656  ldr     r0, [r0]
000b7658  blx     #0xddbe4 ; -> objc_enumerationMutation
000b765c  ldr     r3, [sp, #0x54]
000b765e  mov     r1, r6
000b7660  ldr.w   r0, [r3, r4, lsl #2]
000b7664  blx     #0xddbfc ; -> objc_msgSend
000b7668  adds    r4, #1
000b766a  mov     r1, fp
000b766c  mov     r2, sl
000b766e  mov     r3, r0
000b7670  ldr     r0, [sp, #4]
000b7672  blx     r3
000b7674  cmp     r5, r4
000b7676  bhi     #0xb764a
000b7678  movs    r3, #0x10
000b767a  ldr     r0, [sp, #8]
000b767c  str     r3, [sp]
000b767e  ldr     r1, [sp, #0xc]
000b7680  add     r2, sp, #0x50
000b7682  add     r3, sp, r3
000b7684  blx     #0xddbfc ; -> objc_msgSend
000b7688  mov     r5, r0
000b768a  cmp     r0, #0
000b768c  bne     #0xb7644
000b768e  sub.w   sp, r7, #0x18
000b7692  pop.w   {r8, sl, fp}
000b7696  pop     {r4, r5, r6, r7, pc}
000b7698  ldr     r2, [pc, #0x2d8]
000b769a  movs    r5, r5
000b769c  ldrh    r0, [r0, #0x18]
000b769e  movs    r4, r1
000b76a0  strh    r6, [r0, r6]
000b76a2  movs    r4, r0
000b76a4  str     r2, [r1]
000b76a6  movs    r4, r0
000b76a8  ldr     r2, [pc, #0x160]
000b76aa  movs    r5, r5
