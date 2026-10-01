========================================================================
-[CXMLNode kind]  0x000d9d44  160 bytes   CXMLNode.m
========================================================================

000d9d44  push    {r4, r5, r6, r7, lr}
000d9d46  add     r7, sp, #0xc
000d9d48  push.w  {r8, sl}
000d9d4c  sub     sp, #0x20
000d9d4e  ldr     r3, [pc, #0x70]
000d9d50  mov     r5, r0
000d9d52  mov     r6, r1
000d9d54  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9d56  ldr     r3, [r3]
000d9d58  ldr     r4, [r0, r3]
000d9d5a  cbnz    r4, #0xd9dac
000d9d5c  ldr     r0, [pc, #0x64]
000d9d5e  ldr     r1, [pc, #0x68]
000d9d60  add     r0, pc ; -> 0x000fdcd4  
000d9d62  add     r1, pc ; -> 0x000fd860  
000d9d64  ldr     r0, [r0]
000d9d66  ldr     r1, [r1]
000d9d68  blx     #0xddbfc ; -> objc_msgSend
000d9d6c  ldr     r1, [pc, #0x5c]
000d9d6e  ldr     r2, [pc, #0x60]
000d9d70  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9d72  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9d74  ldr.w   r8, [r1]
000d9d78  ldr     r1, [pc, #0x58]
000d9d7a  add     r1, pc ; -> 0x000fd77c  
000d9d7c  ldr     r1, [r1]
000d9d7e  mov     sl, r0
000d9d80  ldr     r0, [pc, #0x54]
000d9d82  add     r0, pc ; -> 0x000fdb5c  
000d9d84  ldr     r0, [r0]
000d9d86  blx     #0xddbfc ; -> objc_msgSend
000d9d8a  ldr     r3, [pc, #0x50]
000d9d8c  movs    r2, #0x4c
000d9d8e  mov     r1, r8
000d9d90  add     r3, pc ; -> 0x00182684  
000d9d92  str     r2, [sp, #4]
000d9d94  str     r3, [sp, #8]
000d9d96  mov     r2, r6
000d9d98  mov     r3, r5
000d9d9a  str     r4, [sp, #0xc]
000d9d9c  str     r4, [sp, #0x10]
000d9d9e  str     r4, [sp, #0x14]
000d9da0  str     r4, [sp, #0x18]
000d9da2  str     r4, [sp, #0x1c]
000d9da4  str     r0, [sp]
000d9da6  mov     r0, sl
000d9da8  blx     #0xddbfc ; -> objc_msgSend
000d9dac  ldr     r3, [pc, #0x30]
000d9dae  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9db0  ldr     r0, [r3]
000d9db2  ldr     r0, [r5, r0]
000d9db4  ldr     r0, [r0, #4]
000d9db6  sub.w   sp, r7, #0x14
000d9dba  pop.w   {r8, sl}
000d9dbe  pop     {r4, r5, r6, r7, pc}
000d9dc0  movs    r2, #0xd0
000d9dc2  movs    r2, r0
000d9dc4  subs    r7, #0x70
000d9dc6  movs    r2, r0
000d9dc8  subs    r2, #0xfa
000d9dca  movs    r2, r0
000d9dcc  subs    r2, #0xe8
000d9dce  movs    r2, r0
000d9dd0  subs    r1, #0x8a
000d9dd2  movs    r1, r0
000d9dd4  subs    r1, #0xfe
000d9dd6  movs    r2, r0
000d9dd8  subs    r5, #0xd6
000d9dda  movs    r2, r0
000d9ddc  ldrh    r0, [r6, #6]
000d9dde  movs    r2, r1
000d9de0  movs    r2, #0x76
000d9de2  movs    r2, r0
