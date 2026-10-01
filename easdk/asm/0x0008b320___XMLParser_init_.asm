========================================================================
-[XMLParser init]  0x0008b320  84 bytes   Mayhem.mm
========================================================================

0008b320  push    {r4, r5, r7, lr}
0008b322  add     r7, sp, #8
0008b324  sub     sp, #8
0008b326  ldr     r3, [pc, #0x38]
0008b328  ldr     r1, [pc, #0x38]
0008b32a  mov     r4, r0
0008b32c  add     r3, pc ; -> 0x000fdd5c  
0008b32e  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0008b330  ldr     r3, [r3]
0008b332  str     r0, [sp]
0008b334  ldr     r1, [r1]
0008b336  mov     r0, sp
0008b338  str     r3, [sp, #4]
0008b33a  blx     #0xddc08 ; -> objc_msgSendSuper2
0008b33e  ldr     r0, [pc, #0x28]
0008b340  ldr     r1, [pc, #0x28]
0008b342  ldr     r3, [pc, #0x2c]
0008b344  add     r0, pc ; -> 0x000fdbf4  
0008b346  add     r1, pc ; -> 0x000fcfe8  
0008b348  add     r3, pc ; -> 0x000f642c  OBJC_IVAR_$_XMLParser.m_dictionary
0008b34a  ldr     r1, [r1]
0008b34c  ldr     r0, [r0]
0008b34e  ldr     r5, [r3]
0008b350  blx     #0xddbfc ; -> objc_msgSend
0008b354  str     r0, [r4, r5]
0008b356  mov     r0, r4
0008b358  sub.w   sp, r7, #8
0008b35c  pop     {r4, r5, r7, pc}
0008b35e  nop     
0008b360  cmp     r2, #0x2c
0008b362  movs    r7, r0
0008b364  asrs    r6, r1, #0x19
0008b366  movs    r7, r0
0008b368  cmp     r0, #0xac
0008b36a  movs    r7, r0
0008b36c  adds    r6, r3, #2
0008b36e  movs    r7, r0
0008b370  sub     sp, #0x180
0008b372  movs    r6, r0
