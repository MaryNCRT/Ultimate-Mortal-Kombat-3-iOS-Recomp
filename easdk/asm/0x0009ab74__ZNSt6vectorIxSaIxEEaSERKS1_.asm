========================================================================
ZNSt6vectorIxSaIxEEaSERKS1_  0x0009ab74  168 bytes   Mayhem.mm
========================================================================

0009ab74  push    {r4, r5, r6, r7, lr}
0009ab76  add     r7, sp, #0xc
0009ab78  push.w  {r8, sl}
0009ab7c  cmp     r1, r0
0009ab7e  mov     r4, r0
0009ab80  mov     r5, r1
0009ab82  beq     #0x9abd2
0009ab84  ldr     r2, [r1, #4]
0009ab86  ldr     r6, [r1]
0009ab88  ldr     r0, [r0]
0009ab8a  ldr     r3, [r4, #8]
0009ab8c  rsb     r8, r6, r2
0009ab90  subs    r3, r3, r0
0009ab92  asr.w   sl, r8, #3
0009ab96  cmp.w   sl, r3, asr #3
0009ab9a  bhi     #0x9abe8
0009ab9c  ldr     r3, [r4, #4]
0009ab9e  rsb     r2, r0, r3
0009aba2  asrs    r2, r2, #3
0009aba4  cmp     sl, r2
0009aba6  bls     #0x9abda
0009aba8  lsls    r2, r2, #3
0009abaa  mov     r1, r6
0009abac  blx     #0xddba8 ; -> memmove
0009abb0  ldr     r0, [r4, #4]
0009abb2  ldr     r1, [r4]
0009abb4  ldr     r3, [r5]
0009abb6  ldr     r2, [r5, #4]
0009abb8  rsb     r1, r1, r0
0009abbc  bic     r1, r1, #7
0009abc0  adds    r1, r1, r3
0009abc2  subs    r2, r2, r1
0009abc4  blx     #0xddba8 ; -> memmove
0009abc8  lsl.w   r0, sl, #3
0009abcc  ldr     r3, [r4]
0009abce  adds    r0, r0, r3
0009abd0  str     r0, [r4, #4]
0009abd2  mov     r0, r4
0009abd4  pop.w   {r8, sl}
0009abd8  pop     {r4, r5, r6, r7, pc}
0009abda  mov     r1, r6
0009abdc  mov     r2, r8
0009abde  blx     #0xddba8 ; -> memmove
0009abe2  lsl.w   r0, sl, #3
0009abe6  b       #0x9abcc
0009abe8  cmp.w   sl, #0x20000000
0009abec  bhs     #0x9ac16
0009abee  lsl.w   sl, sl, #3
0009abf2  mov     r0, sl
0009abf4  blx     #0xdd5c0 ; -> Znwm
0009abf8  mov     r1, r6
0009abfa  mov     r2, r8
0009abfc  mov     r5, r0
0009abfe  blx     #0xddba8 ; -> memmove
0009ac02  ldr     r0, [r4]
0009ac04  cbz     r0, #0x9ac0a
0009ac06  blx     #0xdd5a8 ; -> ZdlPv
0009ac0a  add.w   r3, r5, sl
0009ac0e  str     r5, [r4]
0009ac10  mov     r0, sl
0009ac12  str     r3, [r4, #8]
0009ac14  b       #0x9abcc
0009ac16  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
0009ac1a  nop     
