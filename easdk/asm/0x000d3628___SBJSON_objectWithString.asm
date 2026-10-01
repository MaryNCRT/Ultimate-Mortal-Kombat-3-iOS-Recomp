========================================================================
-[SBJSON objectWithString  0x000d3628  184 bytes   SBJSON.m
========================================================================

000d3628  push    {r4, r5, r6, r7, lr}
000d362a  add     r7, sp, #0xc
000d362c  str     r8, [sp, #-0x4]!
000d3630  tst.w   r3, #0xff
000d3634  mov     r5, r0
000d3636  beq     #0xd3646
000d3638  ldr     r3, [pc, #0x7c]
000d363a  ldr     r1, [pc, #0x80]
000d363c  add     r3, pc ; -> 0x000fa888  OBJC_IVAR_$_SBJSON.jsonParser
000d363e  add     r1, pc ; -> 0x000fd760  'o\x04\x0f'
000d3640  ldr     r3, [r3]
000d3642  ldr     r0, [r0, r3]
000d3644  b       #0xd3652
000d3646  ldr     r3, [pc, #0x78]
000d3648  ldr     r1, [pc, #0x78]
000d364a  add     r3, pc ; -> 0x000fa888  OBJC_IVAR_$_SBJSON.jsonParser
000d364c  add     r1, pc ; -> 0x000fd4b4  
000d364e  ldr     r3, [r3]
000d3650  ldr     r0, [r0, r3]
000d3652  ldr     r1, [r1]
000d3654  blx     #0xddbfc ; -> objc_msgSend
000d3658  mov     r4, r0
000d365a  cbnz    r0, #0xd36ae
000d365c  ldr     r3, [pc, #0x68]
000d365e  ldr     r1, [pc, #0x6c]
000d3660  add     r3, pc ; -> 0x000f3320  OBJC_IVAR_$_SBJsonBase.errorTrace
000d3662  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d3664  ldr.w   r8, [r3]
000d3668  ldr     r1, [r1]
000d366a  ldr.w   r3, [r8]
000d366e  ldr     r0, [r5, r3]
000d3670  blx     #0xddbfc ; -> objc_msgSend
000d3674  ldr     r3, [pc, #0x58]
000d3676  ldr     r1, [pc, #0x5c]
000d3678  ldr.w   r6, [r8]
000d367c  add     r3, pc ; -> 0x000fa888  OBJC_IVAR_$_SBJSON.jsonParser
000d367e  add     r1, pc ; -> 0x000fd76c  
000d3680  ldr     r3, [r3]
000d3682  ldr     r1, [r1]
000d3684  ldr     r0, [r5, r3]
000d3686  blx     #0xddbfc ; -> objc_msgSend
000d368a  ldr     r1, [pc, #0x4c]
000d368c  add     r1, pc ; -> 0x000fcf10  'sF\x0e'
000d368e  ldr     r1, [r1]
000d3690  blx     #0xddbfc ; -> objc_msgSend
000d3694  ldr     r1, [sp, #0x18]
000d3696  str     r0, [r5, r6]
000d3698  cbz     r1, #0xd36ae
000d369a  ldr     r1, [pc, #0x40]
000d369c  ldr.w   r0, [r8]
000d36a0  add     r1, pc ; -> 0x000fcf38  '\x12G\x0e'
000d36a2  ldr     r0, [r5, r0]
000d36a4  ldr     r1, [r1]
000d36a6  blx     #0xddbfc ; -> objc_msgSend
000d36aa  ldr     r3, [sp, #0x18]
000d36ac  str     r0, [r3]
000d36ae  mov     r0, r4
000d36b0  ldr     r8, [sp], #4
000d36b4  pop     {r4, r5, r6, r7, pc}
000d36b6  nop     
000d36b8  strb    r0, [r1, #9]
000d36ba  movs    r2, r0
000d36bc  adr     r1, #0x78
000d36be  movs    r2, r0
000d36c0  strb    r2, [r7, #8]
000d36c2  movs    r2, r0
000d36c4  ldr     r6, [sp, #0x190]
000d36c6  movs    r2, r0
000d36c8  ldc2    p0, c0, [ip], #4
000d36cc  str     r3, [sp, #0x58]
000d36ce  movs    r2, r0
000d36d0  strb    r0, [r1, #8]
000d36d2  movs    r2, r0
000d36d4  adr     r0, #0x3a8
000d36d6  movs    r2, r0
000d36d8  ldr     r0, [sp, #0x200]
000d36da  movs    r2, r0
000d36dc  ldr     r0, [sp, #0x250]
000d36de  movs    r2, r0
