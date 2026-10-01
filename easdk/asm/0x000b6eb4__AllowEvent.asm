========================================================================
AllowEvent  0x000b6eb4  176 bytes   EAMTX_Main.mm
========================================================================

000b6eb4  push    {r4, r5, r6, r7, lr}
000b6eb6  add     r7, sp, #0xc
000b6eb8  ldr     r4, [pc, #0x84]
000b6eba  ldr     r1, [pc, #0x88]
000b6ebc  mov     r5, r0
000b6ebe  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000b6ec0  add     r1, pc ; -> 0x000fd6bc  
000b6ec2  ldr     r0, [r4]
000b6ec4  ldr     r1, [r1]
000b6ec6  blx     #0xddbfc ; -> objc_msgSend
000b6eca  cmp     r0, #0
000b6ecc  bne     #0xb6f28
000b6ece  ldr     r1, [pc, #0x78]
000b6ed0  ldr     r0, [r4]
000b6ed2  add     r1, pc ; -> 0x000fd654  
000b6ed4  ldr     r1, [r1]
000b6ed6  blx     #0xddbfc ; -> objc_msgSend
000b6eda  cbz     r0, #0xb6f30
000b6edc  b       #0xb6f28
000b6ede  ldr     r1, [pc, #0x6c]
000b6ee0  add     r1, pc ; -> 0x000fd650  
000b6ee2  ldr     r4, [r1]
000b6ee4  mov     r1, r4
000b6ee6  blx     #0xddbfc ; -> objc_msgSend
000b6eea  cbz     r0, #0xb6f2c
000b6eec  ldr     r0, [pc, #0x60]
000b6eee  mov     r1, r4
000b6ef0  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000b6ef2  ldr     r0, [r0]
000b6ef4  blx     #0xddbfc ; -> objc_msgSend
000b6ef8  ldr     r1, [pc, #0x58]
000b6efa  mov     r2, r5
000b6efc  add     r1, pc ; -> 0x000fd0dc  'zz\x0e'
000b6efe  ldr     r4, [r1]
000b6f00  ldr     r1, [pc, #0x54]
000b6f02  add     r1, pc ; -> 0x000fd6d8  
000b6f04  ldr     r1, [r1]
000b6f06  mov     r6, r0
000b6f08  ldr     r0, [pc, #0x50]
000b6f0a  add     r0, pc ; -> 0x000fdb48  
000b6f0c  ldr     r0, [r0]
000b6f0e  blx     #0xddbfc ; -> objc_msgSend
000b6f12  mov     r1, r4
000b6f14  mov     r2, r0
000b6f16  mov     r0, r6
000b6f18  blx     #0xddbfc ; -> objc_msgSend
000b6f1c  tst.w   r0, #0xff
000b6f20  ite     ne
000b6f22  movne   r0, #0
000b6f24  moveq   r0, #1
000b6f26  b       #0xb6f3c
000b6f28  movs    r0, #0
000b6f2a  b       #0xb6f3c
000b6f2c  movs    r0, #1
000b6f2e  b       #0xb6f3c
000b6f30  ldr     r0, [pc, #0x2c]
000b6f32  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000b6f34  ldr     r0, [r0]
000b6f36  cmp     r0, #0
000b6f38  bne     #0xb6ede
000b6f3a  b       #0xb6f2c
000b6f3c  pop     {r4, r5, r6, r7, pc}
000b6f3e  nop     
000b6f40  strh    r6, [r4, r0]
000b6f42  movs    r5, r5
000b6f44  str     r0, [r7, #0x7c]
000b6f46  movs    r4, r0
000b6f48  str     r6, [r7, #0x74]
000b6f4a  movs    r4, r0
000b6f4c  str     r4, [r5, #0x74]
000b6f4e  movs    r4, r0
000b6f50  str     r4, [r6, r7]
000b6f52  movs    r5, r5
000b6f54  str     r4, [r3, #0x1c]
000b6f56  movs    r4, r0
000b6f58  str     r2, [r2, #0x7c]
000b6f5a  movs    r4, r0
000b6f5c  ldr     r2, [r7, #0x40]
000b6f5e  movs    r4, r0
000b6f60  str     r2, [r6, r6]
000b6f62  movs    r5, r5
