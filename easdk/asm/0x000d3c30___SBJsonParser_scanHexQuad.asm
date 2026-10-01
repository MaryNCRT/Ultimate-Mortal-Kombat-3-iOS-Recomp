========================================================================
-[SBJsonParser scanHexQuad  0x000d3c30  144 bytes   SBJsonParser.mm
========================================================================

000d3c30  push    {r4, r7, lr}
000d3c32  add     r7, sp, #4
000d3c34  ldr     r4, [pc, #0x7c]
000d3c36  mov.w   sb, #0
000d3c3a  mov.w   r3, #0
000d3c3e  strh    r3, [r2]
000d3c40  mov     r3, r4
000d3c42  add     r3, pc
000d3c44  ldr.w   ip, [r3]
000d3c48  ldr.w   r3, [r0, ip]
000d3c4c  ldrsb   r1, [r3], #1
000d3c50  uxth.w  lr, r1
000d3c54  sub.w   r1, lr, #0x30
000d3c58  str.w   r3, [r0, ip]
000d3c5c  uxth    r3, r1
000d3c5e  cmp     r3, #9
000d3c60  bls     #0xd3c80
000d3c62  sub.w   r3, lr, #0x61
000d3c66  uxth    r3, r3
000d3c68  cmp     r3, #5
000d3c6a  it      ls
000d3c6c  subls.w r1, lr, #0x57
000d3c70  bls     #0xd3c80
000d3c72  sub.w   r3, lr, #0x41
000d3c76  uxth    r3, r3
000d3c78  cmp     r3, #5
000d3c7a  bhi     #0xd3c86
000d3c7c  sub.w   r1, lr, #0x37
000d3c80  cmp.w   r1, #-1
000d3c84  bne     #0xd3c9c
000d3c86  ldr     r1, [pc, #0x30]
000d3c88  ldr.w   r3, [pc, #0x30]
000d3c8c  movs    r2, #6
000d3c8e  add     r1, pc ; -> 0x000fd91c  
000d3c90  add     r3, pc ; -> 0x00182344  
000d3c92  ldr     r1, [r1]
000d3c94  blx     #0xddbfc ; -> objc_msgSend
000d3c98  movs    r0, #0
000d3c9a  b       #0xd3cb0
000d3c9c  ldrh    r3, [r2]
000d3c9e  add.w   sb, sb, #1
000d3ca2  lsls    r3, r3, #4
000d3ca4  cmp.w   sb, #4
000d3ca8  add     r3, r1
000d3caa  strh    r3, [r2]
000d3cac  bne     #0xd3c40
000d3cae  movs    r0, #1
000d3cb0  pop     {r4, r7, pc}
000d3cb2  nop     
000d3cb4  ldr     r2, [r7, #0x6c]
000d3cb6  movs    r2, r0
000d3cb8  ldr     r4, [sp, #0x228]
000d3cba  movs    r2, r0
000d3cbc  b       #0xd3a20 ; -> -[SBJsonBase addErrorWithCode:description:]
000d3cbe  movs    r2, r1
