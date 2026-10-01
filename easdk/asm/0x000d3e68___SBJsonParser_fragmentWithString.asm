========================================================================
-[SBJsonParser fragmentWithString  0x000d3e68  308 bytes   SBJsonParser.mm
========================================================================

000d3e68  push    {r4, r5, r6, r7, lr}
000d3e6a  add     r7, sp, #0xc
000d3e6c  push.w  {r8, sl, fp}
000d3e70  sub     sp, #0x24
000d3e72  mov     r8, r1
000d3e74  ldr     r1, [pc, #0xe0]
000d3e76  mov     r6, r2
000d3e78  mov     r5, r0
000d3e7a  add     r1, pc ; -> 0x000fd928  
000d3e7c  ldr     r1, [r1]
000d3e7e  blx     #0xddbfc ; -> objc_msgSend
000d3e82  cbnz    r6, #0xd3e9a
000d3e84  ldr     r1, [pc, #0xd4]
000d3e86  ldr     r3, [pc, #0xd8]
000d3e88  mov     r0, r5
000d3e8a  add     r1, pc ; -> 0x000fd91c  
000d3e8c  add     r3, pc ; -> 0x001823a4  
000d3e8e  ldr     r1, [r1]
000d3e90  movs    r2, #0xc
000d3e92  blx     #0xddbfc ; -> objc_msgSend
000d3e96  mov     r0, r6
000d3e98  b       #0xd3f4c
000d3e9a  ldr     r3, [pc, #0xc8]
000d3e9c  ldr     r1, [pc, #0xc8]
000d3e9e  movs    r2, #0
000d3ea0  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d3ea2  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000d3ea4  ldr     r3, [r3]
000d3ea6  ldr     r1, [r1]
000d3ea8  mov     r0, r6
000d3eaa  ldr     r3, [r3]
000d3eac  str     r2, [r5, r3]
000d3eae  ldr     r3, [pc, #0xbc]
000d3eb0  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d3eb2  ldr     r4, [r3]
000d3eb4  blx     #0xddbfc ; -> objc_msgSend
000d3eb8  ldr     r1, [pc, #0xb4]
000d3eba  add     r2, sp, #0x20
000d3ebc  add     r1, pc ; -> 0x000fd968  '\x15\x19\x0f'
000d3ebe  ldr     r1, [r1]
000d3ec0  str     r0, [r5, r4]
000d3ec2  mov     r0, r5
000d3ec4  blx     #0xddbfc ; -> objc_msgSend
000d3ec8  uxtb    r0, r0
000d3eca  cmp     r0, #0
000d3ecc  beq     #0xd3f4c
000d3ece  ldr     r1, [pc, #0xa4]
000d3ed0  mov     r0, r5
000d3ed2  add     r1, pc ; -> 0x000fd964  'u\x18\x0f'
000d3ed4  ldr     r1, [r1]
000d3ed6  blx     #0xddbfc ; -> objc_msgSend
000d3eda  uxtb    r4, r0
000d3edc  cbnz    r4, #0xd3ef2
000d3ede  ldr     r1, [pc, #0x98]
000d3ee0  ldr     r3, [pc, #0x98]
000d3ee2  mov     r0, r5
000d3ee4  add     r1, pc ; -> 0x000fd91c  
000d3ee6  add     r3, pc ; -> 0x001823b4  
000d3ee8  ldr     r1, [r1]
000d3eea  movs    r2, #0xa
000d3eec  blx     #0xddbfc ; -> objc_msgSend
000d3ef0  b       #0xd3f4a
000d3ef2  ldr     r4, [sp, #0x20]
000d3ef4  cmp     r4, #0
000d3ef6  bne     #0xd3f4a
000d3ef8  ldr     r0, [pc, #0x84]
000d3efa  ldr     r1, [pc, #0x88]
000d3efc  add     r0, pc ; -> 0x000fdcd4  
000d3efe  add     r1, pc ; -> 0x000fd860  
000d3f00  ldr     r0, [r0]
000d3f02  ldr     r1, [r1]
000d3f04  blx     #0xddbfc ; -> objc_msgSend
000d3f08  ldr     r1, [pc, #0x7c]
000d3f0a  ldr     r2, [pc, #0x80]
000d3f0c  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d3f0e  add     r2, pc ; -> 0x000ed048  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/JSON/SBJsonParser.mm'
000d3f10  ldr.w   sl, [r1]
000d3f14  ldr     r1, [pc, #0x78]
000d3f16  add     r1, pc ; -> 0x000fd77c  
000d3f18  ldr     r1, [r1]
000d3f1a  mov     fp, r0
000d3f1c  ldr     r0, [pc, #0x74]
000d3f1e  add     r0, pc ; -> 0x000fdb5c  
000d3f20  ldr     r0, [r0]
000d3f22  blx     #0xddbfc ; -> objc_msgSend
000d3f26  ldr     r3, [pc, #0x70]
000d3f28  movs    r2, #0x60
000d3f2a  mov     r1, sl
000d3f2c  add     r3, pc ; -> 0x001823c4  
000d3f2e  str     r2, [sp, #4]
000d3f30  str     r3, [sp, #8]
000d3f32  mov     r2, r8
000d3f34  mov     r3, r5
000d3f36  str     r4, [sp, #0x10]
000d3f38  str     r4, [sp, #0x14]
000d3f3a  str     r4, [sp, #0x18]
000d3f3c  str     r4, [sp, #0x1c]
000d3f3e  str     r6, [sp, #0xc]
000d3f40  str     r0, [sp]
000d3f42  mov     r0, fp
000d3f44  blx     #0xddbfc ; -> objc_msgSend
000d3f48  ldr     r4, [sp, #0x20]
000d3f4a  mov     r0, r4
000d3f4c  sub.w   sp, r7, #0x18
000d3f50  pop.w   {r8, sl, fp}
000d3f54  pop     {r4, r5, r6, r7, pc}
000d3f56  nop     
000d3f58  ldr     r2, [sp, #0x2a8]
000d3f5a  movs    r2, r0
000d3f5c  ldr     r2, [sp, #0x238]
000d3f5e  movs    r2, r0
000d3f60  b       #0xd398c
000d3f62  movs    r2, r1
000d3f64  bics    r0, r8, #0x810000
000d3f68  ldrh    r2, [r7, #0x1a]
000d3f6a  movs    r2, r0
000d3f6c  ldr     r4, [r1, #0x48]
000d3f6e  movs    r2, r0
000d3f70  ldr     r2, [sp, #0x2a0]
000d3f72  movs    r2, r0
000d3f74  ldr     r2, [sp, #0x238]
000d3f76  movs    r2, r0
000d3f78  ldr     r2, [sp, #0xd0]
000d3f7a  movs    r2, r0
000d3f7c  b       #0xd3914
000d3f7e  movs    r2, r1
000d3f80  ldr     r5, [sp, #0x350]
000d3f82  movs    r2, r0
000d3f84  ldr     r1, [sp, #0x178]
000d3f86  movs    r2, r0
000d3f88  ldr     r1, [sp, #0x130]
000d3f8a  movs    r2, r0
000d3f8c  str     r1, [sp, #0xd8]
000d3f8e  movs    r1, r0
000d3f90  ldr     r0, [sp, #0x188]
000d3f92  movs    r2, r0
000d3f94  ldr     r4, [sp, #0xe8]
000d3f96  movs    r2, r0
000d3f98  b       #0xd38c4
000d3f9a  movs    r2, r1
