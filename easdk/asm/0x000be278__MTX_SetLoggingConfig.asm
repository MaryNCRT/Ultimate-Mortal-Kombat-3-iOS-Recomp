========================================================================
MTX_SetLoggingConfig  0x000be278  340 bytes   EAMTX_Main.mm
========================================================================

000be278  push    {r7, lr}
000be27a  add     r7, sp, #0
000be27c  vpush   {d8, d9, d10}
000be280  vmov    d8, r0, r1
000be284  vmov    d9, r2, r3
000be288  vldr    d10, [sp, #0x20]
000be28c  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000be290  vmov.f64 d7, #1.000000e+01
000be294  vcmp.f64 d8, d7
000be298  vmrs    apsr_nzcv, fpscr
000be29c  blt     #0xbe2be
000be29e  vldr    d7, [pc, #0xd0]
000be2a2  vcmp.f64 d8, d7
000be2a6  vmrs    apsr_nzcv, fpscr
000be2aa  bpl     #0xbe2be
000be2ac  ldr     r0, [pc, #0xe0]
000be2ae  ldr     r1, [pc, #0xe4]
000be2b0  vmov    r2, r3, d8
000be2b4  add     r0, pc ; -> 0x0038c0e4  mtxController
000be2b6  add     r1, pc ; -> 0x000fd6cc  
000be2b8  ldr     r0, [r0]
000be2ba  ldr     r1, [r1]
000be2bc  b       #0xbe2ce
000be2be  ldr     r0, [pc, #0xd8]
000be2c0  ldr     r1, [pc, #0xd8]
000be2c2  ldr     r3, [pc, #0xdc]
000be2c4  add     r0, pc ; -> 0x0038c0e4  mtxController
000be2c6  add     r1, pc ; -> 0x000fd6cc  
000be2c8  ldr     r0, [r0]
000be2ca  ldr     r1, [r1]
000be2cc  movs    r2, #0
000be2ce  blx     #0xddbfc ; -> objc_msgSend
000be2d2  vmov.f64 d7, #-1.000000e+00
000be2d6  vcmp.f64 d9, d7
000be2da  vmrs    apsr_nzcv, fpscr
000be2de  beq     #0xbe2fc
000be2e0  vldr    d7, [pc, #0x94]
000be2e4  vcmp.f64 d9, d7
000be2e8  vmrs    apsr_nzcv, fpscr
000be2ec  ble     #0xbe30e
000be2ee  vldr    d7, [pc, #0x90]
000be2f2  vcmpe.f64 d9, d7
000be2f6  vmrs    apsr_nzcv, fpscr
000be2fa  bpl     #0xbe30e
000be2fc  ldr     r0, [pc, #0xa4]
000be2fe  ldr     r1, [pc, #0xa8]
000be300  vmov    r2, r3, d9
000be304  add     r0, pc ; -> 0x0038c0e4  mtxController
000be306  add     r1, pc ; -> 0x000fd6c8  
000be308  ldr     r0, [r0]
000be30a  ldr     r1, [r1]
000be30c  b       #0xbe31e
000be30e  ldr     r0, [pc, #0x9c]
000be310  ldr     r1, [pc, #0x9c]
000be312  ldr     r3, [pc, #0xa0]
000be314  add     r0, pc ; -> 0x0038c0e4  mtxController
000be316  add     r1, pc ; -> 0x000fd6c8  
000be318  ldr     r0, [r0]
000be31a  ldr     r1, [r1]
000be31c  movs    r2, #0
000be31e  blx     #0xddbfc ; -> objc_msgSend
000be322  vcmp.f64 d10, #0
000be326  vmrs    apsr_nzcv, fpscr
000be32a  ble     #0xbe34c
000be32c  vldr    d7, [pc, #0x58]
000be330  vcmp.f64 d10, d7
000be334  vmrs    apsr_nzcv, fpscr
000be338  bpl     #0xbe34c
000be33a  ldr     r0, [pc, #0x7c]
000be33c  ldr     r1, [pc, #0x7c]
000be33e  vmov    r2, r3, d10
000be342  add     r0, pc ; -> 0x0038c0e4  mtxController
000be344  add     r1, pc ; -> 0x000fd6c4  
000be346  ldr     r0, [r0]
000be348  ldr     r1, [r1]
000be34a  b       #0xbe35c
000be34c  ldr     r0, [pc, #0x70]
000be34e  ldr     r1, [pc, #0x74]
000be350  ldr     r3, [pc, #0x74]
000be352  add     r0, pc ; -> 0x0038c0e4  mtxController
000be354  add     r1, pc ; -> 0x000fd6c4  
000be356  ldr     r0, [r0]
000be358  ldr     r1, [r1]
000be35a  movs    r2, #0
000be35c  blx     #0xddbfc ; -> objc_msgSend
000be360  movs    r0, #1
000be362  sub.w   sp, r7, #0x18
000be366  vpop    {d8, d9, d10}
000be36a  sub.w   sp, r7, #0
000be36e  pop     {r7, pc}
000be370  movs    r0, r0
000be372  movs    r0, r0
000be374  strh    r0, [r0]
000be376  eors    r6, r4
000be378  movs    r0, r0
000be37a  movs    r0, r0
