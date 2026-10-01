========================================================================
bossrandper  0x000ab6bc  44 bytes   mkboss.c
========================================================================

000ab6bc  push    {r7, lr}
000ab6be  add     r7, sp, #0
000ab6c0  ldr     r3, [r0, #0x1c]
000ab6c2  vmov    s12, r3
000ab6c6  vcvt.f64.s32 d7, s12
000ab6ca  vldr    d6, [pc, #0x14]
000ab6ce  vmul.f64 d7, d7, d6
000ab6d2  vcvt.s32.f64 s14, d7
000ab6d6  vstr    s14, [r0, #0x1c]
000ab6da  bl      #0x586dc ; -> randper
000ab6de  pop     {r7, pc}
000ab6e0  ldr     r1, [sp, #0x268]
000ab6e2  ldr     r1, [sp, #0x264]
000ab6e4  ldr     r1, [sp, #0x264]
000ab6e6  subs    r7, #0xc9
