========================================================================
-[SBJsonParser scanRestOfNull  0x000d4108  112 bytes   SBJsonParser.mm
========================================================================

000d4108  push    {r4, r5, r6, r7, lr}
000d410a  add     r7, sp, #0xc
000d410c  str     r8, [sp, #-0x4]!
000d4110  ldr     r3, [pc, #0x4c]
000d4112  ldr     r1, [pc, #0x50]
000d4114  mov     r4, r0
000d4116  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d4118  mov     r8, r2
000d411a  ldr     r6, [r3]
000d411c  add     r1, pc ; -> 0x000ed114  'ull'
000d411e  movs    r2, #3
000d4120  ldr     r5, [r0, r6]
000d4122  mov     r0, r5
000d4124  blx     #0xdde18 ; -> strncmp
000d4128  cbnz    r0, #0xd4146
000d412a  adds    r0, r5, #3
000d412c  ldr     r1, [pc, #0x38]
000d412e  str     r0, [r4, r6]
000d4130  ldr     r0, [pc, #0x38]
000d4132  add     r1, pc ; -> 0x000fcf34  
000d4134  add     r0, pc ; -> 0x000fdc0c  
000d4136  ldr     r1, [r1]
000d4138  ldr     r0, [r0]
000d413a  blx     #0xddbfc ; -> objc_msgSend
000d413e  str.w   r0, [r8]
000d4142  movs    r0, #1
000d4144  b       #0xd415a
000d4146  ldr     r1, [pc, #0x28]
000d4148  ldr     r3, [pc, #0x28]
000d414a  mov     r0, r4
000d414c  add     r1, pc ; -> 0x000fd91c  
000d414e  add     r3, pc ; -> 0x00182404  
000d4150  ldr     r1, [r1]
000d4152  movs    r2, #3
000d4154  blx     #0xddbfc ; -> objc_msgSend
000d4158  movs    r0, #0
000d415a  ldr     r8, [sp], #4
000d415e  pop     {r4, r5, r6, r7, pc}
000d4160  ldr     r6, [r4, #0x20]
000d4162  movs    r2, r0
000d4164  ldrh    r4, [r6, #0x3e]
000d4166  movs    r1, r0
000d4168  ldrh    r6, [r7, #0x2e]
000d416a  movs    r2, r0
000d416c  ldr     r2, [sp, #0x350]
000d416e  movs    r2, r0
000d4170  str     r7, [sp, #0x330]
000d4172  movs    r2, r0
000d4174  b       #0xd46dc
000d4176  movs    r2, r1
