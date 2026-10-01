========================================================================
MTX_RegisterHandler  0x000b753c  168 bytes   EAMTX_Main.mm
========================================================================

000b753c  push    {r4, r5, r7, lr}
000b753e  add     r7, sp, #8
000b7540  ldr     r4, [pc, #0x74]
000b7542  mov     r5, r0
000b7544  add     r4, pc ; -> 0x0038c0b0  m_Callbacks
000b7546  ldr     r3, [r4]
000b7548  cbnz    r3, #0xb7566
000b754a  ldr     r0, [pc, #0x70]
000b754c  ldr     r1, [pc, #0x70]
000b754e  add     r0, pc ; -> 0x000fdb70  
000b7550  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b7552  ldr     r0, [r0]
000b7554  ldr     r1, [r1]
000b7556  blx     #0xddbfc ; -> objc_msgSend
000b755a  ldr     r1, [pc, #0x68]
000b755c  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b755e  ldr     r1, [r1]
000b7560  blx     #0xddbfc ; -> objc_msgSend
000b7564  str     r0, [r4]
000b7566  ldr     r0, [pc, #0x60]
000b7568  ldr     r1, [pc, #0x60]
000b756a  mov     r2, r5
000b756c  add     r0, pc ; -> 0x000fdc64  
000b756e  add     r1, pc ; -> 0x000fd6e4  '\x13'
000b7570  ldr     r0, [r0]
000b7572  ldr     r1, [r1]
000b7574  blx     #0xddbfc ; -> objc_msgSend
000b7578  mov     r4, r0
000b757a  cbz     r5, #0xb7594
000b757c  ldr     r0, [pc, #0x50]
000b757e  ldr     r1, [pc, #0x54]
000b7580  mov     r2, r4
000b7582  add     r0, pc ; -> 0x0038c0b0  m_Callbacks
000b7584  add     r1, pc ; -> 0x000fd0dc  'zz\x0e'
000b7586  ldr     r0, [r0]
000b7588  ldr     r1, [r1]
000b758a  blx     #0xddbfc ; -> objc_msgSend
000b758e  tst.w   r0, #0xff
000b7592  beq     #0xb75a0
000b7594  ldr     r0, [pc, #0x40]
000b7596  add     r0, pc ; -> 0x001800f4  
000b7598  blx     #0xdd3e0 ; -> NSLog
000b759c  movs    r0, #0
000b759e  b       #0xb75b4
000b75a0  ldr     r0, [pc, #0x38]
000b75a2  ldr     r1, [pc, #0x3c]
000b75a4  mov     r2, r4
000b75a6  add     r0, pc ; -> 0x0038c0b0  m_Callbacks
000b75a8  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000b75aa  ldr     r0, [r0]
000b75ac  ldr     r1, [r1]
000b75ae  blx     #0xddbfc ; -> objc_msgSend
000b75b2  movs    r0, #1
000b75b4  pop     {r4, r5, r7, pc}
000b75b6  nop     
000b75b8  ldr     r3, [pc, #0x1a0]
000b75ba  movs    r5, r5
000b75bc  str     r6, [r3, #0x60]
000b75be  movs    r4, r0
000b75c0  strb    r0, [r6, r0]
000b75c2  movs    r4, r0
000b75c4  strb    r0, [r4, r0]
000b75c6  movs    r4, r0
000b75c8  str     r4, [r6, #0x6c]
000b75ca  movs    r4, r0
000b75cc  str     r2, [r6, #0x14]
000b75ce  movs    r4, r0
000b75d0  ldr     r3, [pc, #0xa8]
000b75d2  movs    r5, r5
000b75d4  ldrh    r4, [r2, r5]
000b75d6  movs    r4, r0
000b75d8  ldrh    r2, [r3, #0x1a]
000b75da  movs    r4, r1
000b75dc  ldr     r3, [pc, #0x18]
000b75de  movs    r5, r5
000b75e0  strb    r0, [r3, r3]
000b75e2  movs    r4, r0
