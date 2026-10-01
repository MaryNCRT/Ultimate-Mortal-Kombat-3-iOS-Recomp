========================================================================
ZNSt6vectorIPN6Mayhem13UserStatTupleESaIS2_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS2_S4_EERKS2_  0x0009a8dc  212 bytes   Mayhem.mm
========================================================================

0009a8dc  push    {r4, r5, r6, r7, lr}
0009a8de  add     r7, sp, #0xc
0009a8e0  push.w  {r8, sl, fp}
0009a8e4  mov     sl, r2
0009a8e6  ldr     r3, [r0, #4]
0009a8e8  ldr     r2, [r0, #8]
0009a8ea  mov     r4, r0
0009a8ec  mov     r6, r1
0009a8ee  cmp     r3, r2
0009a8f0  beq     #0x9a91e
0009a8f2  cbz     r3, #0x9a8fc
0009a8f4  ldr     r2, [r3, #-0x4]
0009a8f8  str     r2, [r3]
0009a8fa  ldr     r3, [r0, #4]
0009a8fc  mov     r0, r3
0009a8fe  adds    r3, #4
0009a900  subs    r2, r0, #4
0009a902  str     r3, [r4, #4]
0009a904  ldr.w   r4, [sl]
0009a908  subs    r2, r2, r6
0009a90a  bic     r2, r2, #3
0009a90e  subs    r0, r0, r2
0009a910  mov     r1, r6
0009a912  blx     #0xddba8 ; -> memmove
0009a916  str     r4, [r6]
0009a918  pop.w   {r8, sl, fp}
0009a91c  pop     {r4, r5, r6, r7, pc}
0009a91e  ldr     r0, [r0]
0009a920  rsb     r0, r0, r3
0009a924  mvn     r3, #0xc0000000
0009a928  asrs    r0, r0, #2
0009a92a  cmp     r0, r3
0009a92c  beq     #0x9a99e
0009a92e  cbnz    r0, #0x9a98e
0009a930  movs    r3, #1
0009a932  cmp.w   r3, #0x40000000
0009a936  bhs     #0x9a9a6
0009a938  lsl.w   fp, r3, #2
0009a93c  lsls    r0, r3, #2
0009a93e  blx     #0xdd5c0 ; -> Znwm
0009a942  ldr     r1, [r4]
0009a944  rsb     r5, r1, r6
0009a948  mov     r2, r5
0009a94a  mov     r8, r0
0009a94c  blx     #0xddba8 ; -> memmove
0009a950  adds.w  r0, r8, r5
0009a954  mov     r1, r6
0009a956  it      ne
0009a958  ldrne.w r2, [sl]
0009a95c  add.w   sl, r0, #4
0009a960  mov     r0, sl
0009a962  it      ne
0009a964  strne.w r2, [r8, r5]
0009a968  ldr     r2, [r4, #4]
0009a96a  rsb     r5, r6, r2
0009a96e  mov     r2, r5
0009a970  blx     #0xddba8 ; -> memmove
0009a974  ldr     r0, [r4]
0009a976  cbz     r0, #0x9a97c
0009a978  blx     #0xdd5a8 ; -> ZdlPv
0009a97c  add.w   r0, sl, r5
0009a980  str     r0, [r4, #4]
0009a982  add.w   r0, r8, fp
0009a986  str.w   r8, [r4]
0009a98a  str     r0, [r4, #8]
0009a98c  b       #0x9a918
0009a98e  lsls    r3, r0, #1
0009a990  cmp     r3, r0
0009a992  itt     lo
0009a994  mvnlo   fp, #3
0009a998  movlo   r0, fp
0009a99a  blo     #0x9a93e
0009a99c  b       #0x9a932
0009a99e  ldr     r0, [pc, #0xc]
0009a9a0  add     r0, pc ; -> 0x00175c18  'vector::_M_insert_aux'
0009a9a2  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
0009a9a6  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
0009a9aa  nop     
0009a9ac  sxtb    r4, r6
0009a9ae  movs    r5, r1
