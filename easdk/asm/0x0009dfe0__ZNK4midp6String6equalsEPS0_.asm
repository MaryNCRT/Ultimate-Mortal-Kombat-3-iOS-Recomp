========================================================================
ZNK4midp6String6equalsEPS0_  0x0009dfe0  220 bytes   JString.cpp
========================================================================

0009dfe0  push    {r4, r5, r6, r7, lr}
0009dfe2  add     r7, sp, #0xc
0009dfe4  push.w  {r8, sl, fp}
0009dfe8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009dfec  sub     sp, #0x48
0009dfee  ldr     r3, [pc, #0xc0]
0009dff0  str     r0, [sp, #4]
0009dff2  add     r0, sp, #0x14
0009dff4  add     r3, pc ; -> 0x000f301c  0x0
0009dff6  str     r1, [sp]
0009dff8  ldr     r3, [r3]
0009dffa  str     r7, [sp, #0x34]
0009dffc  str.w   sp, [sp, #0x3c]
0009e000  str     r3, [sp, #0x2c]
0009e002  ldr     r3, [pc, #0xb0]
0009e004  add     r3, pc ; -> 0x000ee636  GCC_except_table19
0009e006  str     r3, [sp, #0x30]
0009e008  ldr     r3, [pc, #0xac]
0009e00a  add     r3, pc ; -> 0x0009e086  
0009e00c  orr     r3, r3, #1
0009e010  str     r3, [sp, #0x38]
0009e012  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009e016  ldr     r2, [sp]
0009e018  str     r2, [sp, #0x10]
0009e01a  cmp     r2, #0
0009e01c  beq     #0x9e082
0009e01e  ldr     r2, [sp, #0x10]
0009e020  ldr     r0, [sp, #0x10]
0009e022  ldr     r3, [r2]
0009e024  ldr     r2, [r3, #0xc]
0009e026  mov.w   r3, #-1
0009e02a  str     r3, [sp, #0x18]
0009e02c  blx     r2
0009e02e  ldr     r3, [sp, #4]
0009e030  ldr     r2, [sp, #0x10]
0009e032  cmp     r3, r2
0009e034  beq     #0x9e070
0009e036  ldr     r1, [r2, #8]
0009e038  movs    r3, #1
0009e03a  ldr     r0, [sp, #4]
0009e03c  str     r3, [sp, #0x18]
0009e03e  bl      #0x9da00 ; -> ZNK4midp6String6equalsEPK10__CFString
0009e042  str     r0, [sp, #8]
0009e044  ldr     r2, [sp, #0x10]
0009e046  ldr     r0, [sp, #0x10]
0009e048  ldr     r3, [r2]
0009e04a  ldr     r2, [r3, #8]
0009e04c  mov.w   r3, #-1
0009e050  str     r3, [sp, #0x18]
0009e052  blx     r2
0009e054  cbnz    r0, #0x9e076
0009e056  add     r0, sp, #0x14
0009e058  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009e05c  ldr     r0, [sp, #8]
0009e05e  sub.w   sp, r7, #0x58
0009e062  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009e066  sub.w   sp, r7, #0x18
0009e06a  pop.w   {r8, sl, fp}
0009e06e  pop     {r4, r5, r6, r7, pc}
0009e070  movs    r3, #1
0009e072  str     r3, [sp, #8]
0009e074  b       #0x9e044
0009e076  ldr     r2, [sp, #0x10]
0009e078  ldr     r3, [r2]
0009e07a  mov     r0, r2
0009e07c  ldr     r3, [r3, #4]
0009e07e  blx     r3
0009e080  b       #0x9e056
0009e082  str     r2, [sp, #8]
0009e084  b       #0x9e056
0009e086  ldr     r3, [sp, #0x1c]
0009e088  ldr     r2, [sp, #0x10]
0009e08a  ldr     r0, [sp, #0x10]
0009e08c  str     r3, [sp, #0xc]
0009e08e  ldr     r3, [r2]
0009e090  ldr     r2, [r3, #8]
0009e092  movs    r3, #0
0009e094  str     r3, [sp, #0x18]
0009e096  blx     r2
0009e098  cbz     r0, #0x9e0a4
0009e09a  ldr     r2, [sp, #0x10]
0009e09c  ldr     r3, [r2]
0009e09e  mov     r0, r2
0009e0a0  ldr     r3, [r3, #4]
0009e0a2  blx     r3
0009e0a4  ldr     r0, [sp, #0xc]
0009e0a6  mov.w   r3, #-1
0009e0aa  str     r3, [sp, #0x18]
0009e0ac  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009e0b0  str     r4, [r4, r0]
0009e0b2  movs    r5, r0
0009e0b4  lsls    r6, r5, #0x18
0009e0b6  movs    r5, r0
0009e0b8  lsls    r0, r7, #1
0009e0ba  movs    r0, r0
