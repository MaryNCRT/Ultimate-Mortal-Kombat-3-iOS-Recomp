========================================================================
-[SBJsonWriter appendValue  0x000d4d40  532 bytes   SBJsonWriter.mm
========================================================================

000d4d40  push    {r4, r5, r6, r7, lr}
000d4d42  add     r7, sp, #0xc
000d4d44  push.w  {r8, sl, fp}
000d4d48  sub     sp, #8
000d4d4a  ldr     r1, [pc, #0x1a4]
000d4d4c  mov     sl, r0
000d4d4e  ldr     r0, [pc, #0x1a4]
000d4d50  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000d4d52  mov     r5, r2
000d4d54  ldr     r4, [r1]
000d4d56  ldr     r1, [pc, #0x1a0]
000d4d58  add     r0, pc ; -> 0x000fdb44  
000d4d5a  mov     r8, r3
000d4d5c  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000d4d5e  ldr     r0, [r0]
000d4d60  ldr     r6, [r1]
000d4d62  mov     r1, r6
000d4d64  blx     #0xddbfc ; -> objc_msgSend
000d4d68  mov     r1, r4
000d4d6a  mov     r2, r0
000d4d6c  mov     r0, r5
000d4d6e  blx     #0xddbfc ; -> objc_msgSend
000d4d72  tst.w   r0, #0xff
000d4d76  beq     #0xd4d7e
000d4d78  ldr     r1, [pc, #0x180]
000d4d7a  add     r1, pc ; -> 0x000fd914  '`\x17\x0f'
000d4d7c  b       #0xd4dc4
000d4d7e  ldr     r0, [pc, #0x180]
000d4d80  mov     r1, r6
000d4d82  add     r0, pc ; -> 0x000fdc14  
000d4d84  ldr     r0, [r0]
000d4d86  blx     #0xddbfc ; -> objc_msgSend
000d4d8a  mov     r1, r4
000d4d8c  mov     r2, r0
000d4d8e  mov     r0, r5
000d4d90  blx     #0xddbfc ; -> objc_msgSend
000d4d94  tst.w   r0, #0xff
000d4d98  beq     #0xd4da0
000d4d9a  ldr     r1, [pc, #0x168]
000d4d9c  add     r1, pc ; -> 0x000fd910  'w\x17\x0f'
000d4d9e  b       #0xd4dc4
000d4da0  ldr     r0, [pc, #0x164]
000d4da2  mov     r1, r6
000d4da4  add     r0, pc ; -> 0x000fdb5c  
000d4da6  ldr.w   fp, [r0]
000d4daa  mov     r0, fp
000d4dac  blx     #0xddbfc ; -> objc_msgSend
000d4db0  mov     r1, r4
000d4db2  mov     r2, r0
000d4db4  mov     r0, r5
000d4db6  blx     #0xddbfc ; -> objc_msgSend
000d4dba  tst.w   r0, #0xff
000d4dbe  beq     #0xd4ddc
000d4dc0  ldr     r1, [pc, #0x148]
000d4dc2  add     r1, pc ; -> 0x000fd90c  'M\x17\x0f'
000d4dc4  ldr     r1, [r1]
000d4dc6  mov     r0, sl
000d4dc8  mov     r2, r5
000d4dca  mov     r3, r8
000d4dcc  blx     #0xddbfc ; -> objc_msgSend
000d4dd0  tst.w   r0, #0xff
000d4dd4  ite     eq
000d4dd6  moveq   r0, #0
000d4dd8  movne   r0, #1
000d4dda  b       #0xd4ee6
000d4ddc  ldr     r0, [pc, #0x130]
000d4dde  mov     r1, r6
000d4de0  add     r0, pc ; -> 0x000fdb48  
000d4de2  ldr     r0, [r0]
000d4de4  blx     #0xddbfc ; -> objc_msgSend
000d4de8  mov     r1, r4
000d4dea  mov     r2, r0
000d4dec  mov     r0, r5
000d4dee  blx     #0xddbfc ; -> objc_msgSend
000d4df2  tst.w   r0, #0xff
000d4df6  beq     #0xd4e4a
000d4df8  ldr     r1, [pc, #0x118]
000d4dfa  mov     r0, r5
000d4dfc  add     r1, pc ; -> 0x000fd908  
000d4dfe  ldr     r1, [r1]
000d4e00  blx     #0xddbfc ; -> objc_msgSend
000d4e04  ldrsb.w r3, [r0]
000d4e08  cmp     r3, #0x63
000d4e0a  bne     #0xd4e30
000d4e0c  ldr     r1, [pc, #0x108]
000d4e0e  mov     r0, r5
000d4e10  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000d4e12  ldr     r4, [r1]
000d4e14  ldr     r1, [pc, #0x104]
000d4e16  add     r1, pc ; -> 0x000fd6d0  
000d4e18  ldr     r1, [r1]
000d4e1a  blx     #0xddbfc ; -> objc_msgSend
000d4e1e  tst.w   r0, #0xff
000d4e22  beq     #0xd4e2a
000d4e24  ldr     r2, [pc, #0xf8]
000d4e26  add     r2, pc ; -> 0x0017ed94  
000d4e28  b       #0xd4e44
000d4e2a  ldr     r2, [pc, #0xf8]
000d4e2c  add     r2, pc ; -> 0x001809c4  
000d4e2e  b       #0xd4e44
000d4e30  ldr     r1, [pc, #0xf4]
000d4e32  mov     r0, r5
000d4e34  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000d4e36  ldr     r4, [r1]
000d4e38  ldr     r1, [pc, #0xf0]
000d4e3a  add     r1, pc ; -> 0x000fd30c  
000d4e3c  ldr     r1, [r1]
000d4e3e  blx     #0xddbfc ; -> objc_msgSend
000d4e42  mov     r2, r0
000d4e44  mov     r0, r8
000d4e46  mov     r1, r4
000d4e48  b       #0xd4e72
000d4e4a  ldr     r0, [pc, #0xe4]
000d4e4c  mov     r1, r6
000d4e4e  add     r0, pc ; -> 0x000fdc0c  
000d4e50  ldr     r0, [r0]
000d4e52  blx     #0xddbfc ; -> objc_msgSend
000d4e56  mov     r1, r4
000d4e58  mov     r2, r0
000d4e5a  mov     r0, r5
000d4e5c  blx     #0xddbfc ; -> objc_msgSend
000d4e60  tst.w   r0, #0xff
000d4e64  beq     #0xd4e7a
000d4e66  ldr     r1, [pc, #0xcc]
000d4e68  ldr     r2, [pc, #0xcc]
000d4e6a  mov     r0, r8
000d4e6c  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000d4e6e  add     r2, pc ; -> 0x00182204  
000d4e70  ldr     r1, [r1]
000d4e72  blx     #0xddbfc ; -> objc_msgSend
000d4e76  movs    r0, #1
000d4e78  b       #0xd4ee6
000d4e7a  ldr     r1, [pc, #0xc0]
000d4e7c  mov     r0, r5
000d4e7e  add     r1, pc ; -> 0x000fd920  '$\x18\x0f'
000d4e80  ldr     r4, [r1]
000d4e82  ldr     r1, [pc, #0xbc]
000d4e84  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000d4e86  mov     r2, r4
000d4e88  ldr     r1, [r1]
000d4e8a  blx     #0xddbfc ; -> objc_msgSend
000d4e8e  uxtb    r0, r0
000d4e90  str     r0, [sp]
000d4e92  cbz     r0, #0xd4eb0
000d4e94  ldr     r1, [pc, #0xac]
000d4e96  mov     r0, r5
000d4e98  add     r1, pc ; -> 0x000fd924  
000d4e9a  ldr     r6, [r1]
000d4e9c  mov     r1, r4
000d4e9e  blx     #0xddbfc ; -> objc_msgSend
000d4ea2  mov     r3, r8
000d4ea4  mov     r1, r6
000d4ea6  mov     r2, r0
000d4ea8  mov     r0, sl
000d4eaa  blx     #0xddbfc ; -> objc_msgSend
000d4eae  b       #0xd4e76
000d4eb0  ldr     r1, [pc, #0x94]
000d4eb2  mov     r0, r5
000d4eb4  ldr     r4, [pc, #0x94]
000d4eb6  add     r1, pc ; -> 0x000fd91c  
000d4eb8  ldr     r1, [r1]
000d4eba  add     r4, pc ; -> 0x00182214  
000d4ebc  str     r1, [sp, #4]
000d4ebe  ldr     r1, [pc, #0x90]
000d4ec0  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d4ec2  ldr.w   r8, [r1]
000d4ec6  mov     r1, r6
000d4ec8  blx     #0xddbfc ; -> objc_msgSend
000d4ecc  mov     r2, r4
000d4ece  mov     r1, r8
000d4ed0  mov     r3, r0
000d4ed2  mov     r0, fp
000d4ed4  blx     #0xddbfc ; -> objc_msgSend
000d4ed8  ldr     r1, [sp, #4]
000d4eda  movs    r2, #1
000d4edc  mov     r3, r0
000d4ede  mov     r0, sl
000d4ee0  blx     #0xddbfc ; -> objc_msgSend
000d4ee4  ldr     r0, [sp]
000d4ee6  sub.w   sp, r7, #0x18
000d4eea  pop.w   {r8, sl, fp}
000d4eee  pop     {r4, r5, r6, r7, pc}
000d4ef0  strh    r4, [r5, #8]
000d4ef2  movs    r2, r0
000d4ef4  ldrh    r0, [r5, #0x2e]
000d4ef6  movs    r2, r0
000d4ef8  ldrb    r4, [r5, #0x12]
000d4efa  movs    r2, r0
000d4efc  ldrh    r6, [r2, #0x1c]
000d4efe  movs    r2, r0
000d4f00  ldrh    r6, [r1, #0x34]
000d4f02  movs    r2, r0
000d4f04  ldrh    r0, [r6, #0x1a]
000d4f06  movs    r2, r0
000d4f08  ldrh    r4, [r6, #0x2c]
000d4f0a  movs    r2, r0
000d4f0c  ldrh    r6, [r0, #0x1a]
000d4f0e  movs    r2, r0
000d4f10  ldrh    r4, [r4, #0x2a]
000d4f12  movs    r2, r0
000d4f14  ldrh    r0, [r1, #0x18]
000d4f16  movs    r2, r0
000d4f18  strh    r0, [r5, #2]
000d4f1a  movs    r2, r0
000d4f1c  ldrh    r6, [r6, #4]
000d4f1e  movs    r2, r0
000d4f20  ldr     r7, [sp, #0x1a8]
000d4f22  movs    r2, r1
000d4f24  cbnz    r4, #0xd4f8c
000d4f26  movs    r2, r1
000d4f28  strh    r4, [r0, #2]
000d4f2a  movs    r2, r0
000d4f2c  strh    r6, [r1, #0x26]
000d4f2e  movs    r2, r0
000d4f30  ldrh    r2, [r7, #0x2c]
000d4f32  movs    r2, r0
000d4f34  strh    r4, [r1]
000d4f36  movs    r2, r0
000d4f38  blo     #0xd4e60
000d4f3a  movs    r2, r1
000d4f3c  ldrh    r6, [r3, #0x14]
000d4f3e  movs    r2, r0
000d4f40  ldrb    r0, [r1, #0x18]
000d4f42  movs    r2, r0
000d4f44  ldrh    r0, [r1, #0x14]
000d4f46  movs    r2, r0
000d4f48  ldrh    r2, [r4, #0x12]
000d4f4a  movs    r2, r0
000d4f4c  blo     #0xd4ffc
000d4f4e  movs    r2, r1
000d4f50  ldrb    r4, [r3, #0xf]
000d4f52  movs    r2, r0
