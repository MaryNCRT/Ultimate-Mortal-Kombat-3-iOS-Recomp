========================================================================
ZN6Mayhem21GetLeaderboardRequest15DumpLeaderboardEv  0x0008b480  192 bytes   Mayhem.mm
========================================================================

0008b480  push    {r4, r5, r6, r7, lr}
0008b482  add     r7, sp, #0xc
0008b484  push.w  {r8, sl, fp}
0008b488  sub     sp, #0x1c
0008b48a  ldr.w   r2, [r0, #0x80]
0008b48e  ldr     r3, [r0, #0x7c]
0008b490  mov     r5, r0
0008b492  rsb     r3, r3, r2
0008b496  lsrs    r3, r3, #3
0008b498  beq     #0x8b524
0008b49a  ldr     r3, [pc, #0x94]
0008b49c  ldr.w   fp, [pc, #0x94]
0008b4a0  movs    r4, #0
0008b4a2  str     r3, [sp]
0008b4a4  ldr.w   r3, [pc, #0x90]
0008b4a8  mov     sl, r4
0008b4aa  str     r3, [sp, #8]
0008b4ac  ldr     r3, [pc, #0x8c]
0008b4ae  str     r3, [sp, #4]
0008b4b0  ldr     r1, [r5, #0x70]
0008b4b2  add     r0, sp, #0x14
0008b4b4  ldr.w   r1, [r1, r4, lsl #2]
0008b4b8  ldr     r1, [r1]
0008b4ba  bl      #0x8ac74 ; -> ZN6Mayhem4UserC1ERKS0_
0008b4be  ldr     r3, [r5, #0x70]
0008b4c0  add     r0, sp, #0xc
0008b4c2  ldr.w   r3, [r3, r4, lsl #2]
0008b4c6  ldr     r1, [r3, #4]
0008b4c8  bl      #0x8ad3c ; -> ZN6Mayhem4StatC1ERKS0_
0008b4cc  add     r0, sp, #0x14
0008b4ce  bl      #0x8ac98 ; -> ZNK6Mayhem4User14GetDisplayNameEv
0008b4d2  ldr     r4, [r0]
0008b4d4  add     r0, sp, #0xc
0008b4d6  bl      #0x8ad64 ; -> ZNK6Mayhem4Stat7GetRankEv
0008b4da  mov     r6, r0
0008b4dc  add     r0, sp, #0xc
0008b4de  bl      #0x8ad5c ; -> ZNK6Mayhem4Stat8GetValueEv
0008b4e2  mov     r1, sl
0008b4e4  mov     r8, r0
0008b4e6  ldr     r0, [sp]
0008b4e8  add     r0, pc
0008b4ea  blx     #0xddc38 ; -> printf
0008b4ee  ldr     r0, [sp, #8]
0008b4f0  mov     r1, r4
0008b4f2  add.w   r4, sl, #1
0008b4f6  add     r0, pc
0008b4f8  blx     #0xddc38 ; -> printf
0008b4fc  ldr     r0, [sp, #4]
0008b4fe  mov     r1, r6
0008b500  add.w   sl, sl, #1
0008b504  add     r0, pc
0008b506  blx     #0xddc38 ; -> printf
0008b50a  mov     r0, fp
0008b50c  mov     r1, r8
0008b50e  add     r0, pc
0008b510  blx     #0xddc38 ; -> printf
0008b514  ldr.w   r2, [r5, #0x80]
0008b518  ldr     r3, [r5, #0x7c]
0008b51a  rsb     r3, r3, r2
0008b51e  cmp.w   r4, r3, asr #3
0008b522  blo     #0x8b4b0
0008b524  sub.w   sp, r7, #0x18
0008b528  pop.w   {r8, sl, fp}
0008b52c  pop     {r4, r5, r6, r7, pc}
0008b52e  nop     
0008b530  adr     r6, #0x3a0
0008b532  movs    r6, r1
0008b534  adr     r6, #0x368
0008b536  movs    r6, r1
0008b538  adr     r6, #0x388
0008b53a  movs    r6, r1
0008b53c  adr     r6, #0x370
0008b53e  movs    r6, r1
