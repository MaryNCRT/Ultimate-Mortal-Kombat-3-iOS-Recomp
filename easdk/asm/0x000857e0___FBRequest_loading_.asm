========================================================================
-[FBRequest loading]  0x000857e0  20 bytes   FBRequest.m
========================================================================

000857e0  ldr     r3, [pc, #0xc]
000857e2  add     r3, pc ; -> 0x000f59dc  OBJC_IVAR_$_FBRequest._connection
000857e4  ldr     r3, [r3]
000857e6  ldr     r0, [r0, r3]
000857e8  subs    r0, #0
000857ea  it      ne
000857ec  movne   r0, #1
000857ee  bx      lr
000857f0  lsls    r6, r6, #7
000857f2  movs    r7, r0
