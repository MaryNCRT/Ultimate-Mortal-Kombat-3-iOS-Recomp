========================================================================
ZNSt6vectorIPN6Mayhem13UserStatTupleESaIS2_EE7reserveEm  0x0009a830  100 bytes   Mayhem.mm
========================================================================

0009a830  push    {r4, r5, r6, r7, lr}
0009a832  add     r7, sp, #0xc
0009a834  push.w  {r8, sl}
0009a838  cmp.w   r1, #0x40000000
0009a83c  mov     r4, r0
0009a83e  bhs     #0x9a886
0009a840  ldr     r5, [r0]
0009a842  ldr     r3, [r0, #8]
0009a844  subs    r3, r3, r5
0009a846  cmp.w   r1, r3, asr #2
0009a84a  bhi     #0x9a852
0009a84c  pop.w   {r8, sl}
0009a850  pop     {r4, r5, r6, r7, pc}
0009a852  ldr     r2, [r0, #4]
0009a854  lsl.w   sl, r1, #2
0009a858  mov     r0, sl
0009a85a  rsb     r8, r5, r2
0009a85e  blx     #0xdd5c0 ; -> Znwm
0009a862  mov     r1, r5
0009a864  mov     r2, r8
0009a866  mov     r6, r0
0009a868  blx     #0xddba8 ; -> memmove
0009a86c  ldr     r0, [r4]
0009a86e  cbz     r0, #0x9a874
0009a870  blx     #0xdd5a8 ; -> ZdlPv
0009a874  bic     r2, r8, #3
0009a878  add     r2, r6
0009a87a  add.w   r0, r6, sl
0009a87e  str     r6, [r4]
0009a880  str     r2, [r4, #4]
0009a882  str     r0, [r4, #8]
0009a884  b       #0x9a84c
0009a886  ldr     r0, [pc, #8]
0009a888  add     r0, pc ; -> 0x00175c08  'vector::reserve'
0009a88a  blx     #0xdd578 ; -> ZSt20__throw_length_errorPKc
0009a88e  nop     
0009a890  cbz     r4, #0x9a8f2
0009a892  movs    r5, r1
