========================================================================
ZN6Mayhem21GetLeaderboardRequestC2EPNS_5TokenERKSsiS4_ii  0x00097d3c  768 bytes   Mayhem.mm
========================================================================

00097d3c  push    {r4, r5, r6, r7, lr}
00097d3e  add     r7, sp, #0xc
00097d40  push.w  {r8, sl, fp}
00097d44  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00097d48  sub     sp, #0x88
00097d4a  str     r3, [sp, #4]
00097d4c  ldr     r3, [pc, #0x2d0]
00097d4e  str     r0, [sp, #0x10]
00097d50  add     r0, sp, #0x50
00097d52  add     r3, pc ; -> 0x000f3438  0x0
00097d54  str     r1, [sp, #0xc]
00097d56  ldr     r3, [r3]
00097d58  str     r2, [sp, #8]
00097d5a  str     r7, [sp, #0x70]
00097d5c  str.w   sp, [sp, #0x78]
00097d60  str     r3, [sp, #0x68]
00097d62  ldr     r3, [pc, #0x2c0]
00097d64  add     r3, pc ; -> 0x000ee556  GCC_except_table94
00097d66  str     r3, [sp, #0x6c]
00097d68  ldr     r3, [pc, #0x2bc]
00097d6a  add     r3, pc ; -> 0x00097e12  
00097d6c  orr     r3, r3, #1
00097d70  str     r3, [sp, #0x74]
00097d72  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00097d76  ldr     r0, [sp, #0x10]
00097d78  ldr     r1, [sp, #0xc]
00097d7a  mov.w   r3, #-1
00097d7e  str     r3, [sp, #0x54]
00097d80  bl      #0x8cb8c ; -> ZN6Mayhem7RequestC2EPNS_5TokenE
00097d84  ldr     r1, [sp, #0x10]
00097d86  ldr     r3, [pc, #0x2a4]
00097d88  add.w   r0, r1, #0x50
00097d8c  add     r3, pc ; -> 0x0017da2c  ZTVN6Mayhem21GetLeaderboardRequestE
00097d8e  adds    r3, #8
00097d90  str     r3, [r1]
00097d92  ldr     r1, [sp, #8]
00097d94  movs    r3, #5
00097d96  str     r3, [sp, #0x54]
00097d98  blx     #0xdd53c ; -> ZNSsC1ERKSs
00097d9c  ldr     r3, [sp, #4]
00097d9e  ldr     r2, [sp, #0x10]
00097da0  str     r3, [r2, #0x54]
00097da2  movs    r3, #0
00097da4  str     r3, [r2, #0x58]
00097da6  str     r3, [r2, #0x5c]
00097da8  str     r3, [r2, #0x60]
00097daa  ldr     r4, [sp, #0x10]
00097dac  add.w   r2, r4, #0x64
00097db0  str     r3, [r4, #0x64]
00097db2  str     r3, [r2, #4]
00097db4  str     r3, [r2, #8]
00097db6  add.w   r2, r4, #0x70
00097dba  str     r3, [r4, #0x70]
00097dbc  str     r3, [r2, #4]
00097dbe  str     r3, [r2, #8]
00097dc0  add.w   r2, r4, #0x7c
00097dc4  str     r3, [r4, #0x7c]
00097dc6  str     r3, [r2, #4]
00097dc8  str     r3, [r2, #8]
00097dca  add.w   r2, r4, #0x88
00097dce  str.w   r3, [r4, #0x88]
00097dd2  str     r3, [r2, #4]
00097dd4  str     r3, [r2, #8]
00097dd6  ldr     r3, [sp, #0xec]
00097dd8  add.w   r0, r4, #0x9c
00097ddc  str.w   r3, [r4, #0x94]
00097de0  ldr     r3, [sp, #0xf0]
00097de2  str.w   r3, [r4, #0x98]
00097de6  ldr     r1, [sp, #0xe8]
00097de8  movs    r3, #4
00097dea  str     r3, [sp, #0x54]
00097dec  blx     #0xdd53c ; -> ZNSsC1ERKSs
00097df0  movs    r3, #3
00097df2  ldr     r0, [sp, #0x10]
00097df4  str     r3, [sp, #0x54]
00097df6  bl      #0x8b6b8 ; -> ZN6Mayhem12MayhemThread5startEv
00097dfa  add     r0, sp, #0x50
00097dfc  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00097e00  sub.w   sp, r7, #0x58
00097e04  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00097e08  sub.w   sp, r7, #0x18
00097e0c  pop.w   {r8, sl, fp}
00097e10  pop     {r4, r5, r6, r7, pc}
00097e12  ldr     r3, [sp, #0x54]
00097e14  ldr     r2, [sp, #0x58]
00097e16  cmp     r3, #1
00097e18  str     r2, [sp]
00097e1a  beq.w   #0x97f4c
00097e1e  cmp     r3, #2
00097e20  beq     #0x97ebe
00097e22  cmp     r3, #3
00097e24  beq     #0x97eda
00097e26  cmp     r3, #4
00097e28  beq     #0x97ea8
00097e2a  ldr     r1, [sp, #0x34]
00097e2c  ldr     r0, [r1]
00097e2e  cbz     r0, #0x97e34
00097e30  blx     #0xdd5a8 ; -> ZdlPv
00097e34  ldr     r2, [sp, #0x10]
00097e36  ldr     r0, [r2, #0x70]
00097e38  cbz     r0, #0x97e3e
00097e3a  blx     #0xdd5a8 ; -> ZdlPv
00097e3e  ldr     r3, [sp, #0x10]
00097e40  ldr     r0, [r3, #0x64]
00097e42  cbz     r0, #0x97e48
00097e44  blx     #0xdd5a8 ; -> ZdlPv
00097e48  ldr     r4, [sp]
00097e4a  ldr     r3, [sp, #0x10]
00097e4c  ldr     r1, [sp, #0x10]
00097e4e  str     r4, [sp, #0x20]
00097e50  adds    r1, #0x58
00097e52  str     r1, [sp, #0x40]
00097e54  ldr     r2, [r3, #0x58]
00097e56  ldr     r4, [r3, #0x5c]
00097e58  cmp     r2, r4
00097e5a  str     r4, [sp, #0x44]
00097e5c  beq     #0x97e82
00097e5e  ldr     r3, [pc, #0x1d0]
00097e60  str     r2, [sp, #0x4c]
00097e62  add     r3, pc ; -> 0x000f3370  0x0
00097e64  ldr     r3, [r3]
00097e66  str     r3, [sp, #0x48]
00097e68  ldr     r1, [sp, #0x4c]
00097e6a  ldr     r2, [sp, #0x48]
00097e6c  ldr     r3, [r1]
00097e6e  sub.w   r0, r3, #0xc
00097e72  cmp     r0, r2
00097e74  bne     #0x97f22
00097e76  ldr     r1, [sp, #0x4c]
00097e78  ldr     r2, [sp, #0x44]
00097e7a  adds    r1, #4
00097e7c  cmp     r2, r1
00097e7e  str     r1, [sp, #0x4c]
00097e80  bne     #0x97e68
00097e82  ldr     r3, [sp, #0x40]
00097e84  ldr     r0, [r3]
00097e86  cbz     r0, #0x97e8c
00097e88  blx     #0xdd5a8 ; -> ZdlPv
00097e8c  ldr     r4, [sp, #0x20]
00097e8e  ldr     r2, [sp, #0x10]
00097e90  ldr     r3, [pc, #0x1a0]
00097e92  str     r4, [sp, #0x24]
00097e94  add     r3, pc ; -> 0x000f3370  0x0
00097e96  ldr     r1, [r2, #0x50]
00097e98  ldr     r3, [r3]
00097e9a  sub.w   r0, r1, #0xc
00097e9e  cmp     r0, r3
00097ea0  bne.w   #0x97fc4
00097ea4  ldr     r1, [sp, #0x24]
00097ea6  str     r1, [sp]
00097ea8  ldr     r0, [sp, #0x10]
00097eaa  movs    r3, #0
00097eac  str     r3, [sp, #0x54]
00097eae  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
00097eb2  ldr     r0, [sp]
00097eb4  mov.w   r3, #-1
00097eb8  str     r3, [sp, #0x54]
00097eba  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00097ebe  ldr     r1, [sp]
00097ec0  ldr     r2, [sp, #0x10]
00097ec2  ldr     r3, [pc, #0x174]
00097ec4  str     r1, [sp, #0x14]
00097ec6  add     r3, pc ; -> 0x000f3370  0x0
00097ec8  ldr.w   r1, [r2, #0x9c]
00097ecc  ldr     r3, [r3]
00097ece  sub.w   r0, r1, #0xc
00097ed2  cmp     r0, r3
00097ed4  bne     #0x97f9a
00097ed6  ldr     r1, [sp, #0x14]
00097ed8  str     r1, [sp]
00097eda  ldr     r2, [sp]
00097edc  ldr     r4, [sp, #0x10]
00097ede  ldr     r3, [sp, #0x10]
00097ee0  ldr     r1, [sp, #0x10]
00097ee2  str     r2, [sp, #0x18]
00097ee4  adds    r3, #0x88
00097ee6  str     r3, [sp, #0x28]
00097ee8  ldr.w   r4, [r4, #0x88]
00097eec  str     r4, [sp, #0x30]
00097eee  ldr.w   r1, [r1, #0x8c]
00097ef2  cmp     r4, r1
00097ef4  str     r1, [sp, #0x2c]
00097ef6  beq     #0x97f12
00097ef8  ldr     r2, [sp, #0x30]
00097efa  ldr     r0, [sp, #0x30]
00097efc  ldr     r3, [r2]
00097efe  ldr     r2, [r3]
00097f00  movs    r3, #2
00097f02  str     r3, [sp, #0x54]
00097f04  blx     r2
00097f06  ldr     r3, [sp, #0x30]
00097f08  ldr     r4, [sp, #0x2c]
00097f0a  adds    r3, #8
00097f0c  cmp     r4, r3
00097f0e  str     r3, [sp, #0x30]
00097f10  bne     #0x97ef8
00097f12  ldr     r1, [sp, #0x28]
00097f14  ldr     r0, [r1]
00097f16  cbz     r0, #0x97f1c
00097f18  blx     #0xdd5a8 ; -> ZdlPv
00097f1c  ldr     r2, [sp, #0x18]
00097f1e  str     r2, [sp]
00097f20  b       #0x97f56
00097f22  subs    r2, r3, #4
00097f24  ldr     r3, [r3, #-0x4]
00097f28  subs    r1, r3, #1
00097f2a  dmb     ish
00097f2e  mov     ip, r3
00097f30  ldrex   r4, [r2]
00097f34  cmp     r4, r3
00097f36  beq     #0x98000
00097f38  cmp     r4, ip
00097f3a  mov     r3, r4
00097f3c  bne     #0x97f28
00097f3e  cmp     r4, #0
00097f40  bgt     #0x97e76
00097f42  add.w   r1, sp, #0x86
00097f46  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00097f4a  b       #0x97e76
00097f4c  ldr     r3, [sp, #0x28]
00097f4e  ldr     r0, [r3]
00097f50  cbz     r0, #0x97f56
00097f52  blx     #0xdd5a8 ; -> ZdlPv
00097f56  ldr     r4, [sp]
00097f58  ldr     r2, [sp, #0x10]
00097f5a  ldr     r1, [sp, #0x10]
00097f5c  ldr     r3, [sp, #0x10]
00097f5e  str     r4, [sp, #0x1c]
00097f60  adds    r1, #0x7c
00097f62  str     r1, [sp, #0x34]
00097f64  ldr     r2, [r2, #0x7c]
00097f66  str     r2, [sp, #0x3c]
00097f68  ldr.w   r3, [r3, #0x80]
00097f6c  cmp     r2, r3
00097f6e  str     r3, [sp, #0x38]
00097f70  beq     #0x97f8a
00097f72  ldr     r4, [sp, #0x3c]
00097f74  ldr     r3, [r4]
00097f76  mov     r0, r4
00097f78  ldr     r2, [r3]
00097f7a  movs    r3, #1
00097f7c  str     r3, [sp, #0x54]
00097f7e  blx     r2
00097f80  ldr     r1, [sp, #0x38]
00097f82  adds    r4, #8
00097f84  str     r4, [sp, #0x3c]
00097f86  cmp     r1, r4
00097f88  bne     #0x97f72
00097f8a  ldr     r3, [sp, #0x34]
00097f8c  ldr     r0, [r3]
00097f8e  cbz     r0, #0x97f94
00097f90  blx     #0xdd5a8 ; -> ZdlPv
00097f94  ldr     r4, [sp, #0x1c]
00097f96  str     r4, [sp]
00097f98  b       #0x97e34
00097f9a  ldr     r3, [r1, #-0x4]
00097f9e  subs    r2, r1, #4
00097fa0  subs    r1, r3, #1
00097fa2  dmb     ish
00097fa6  mov     ip, r3
00097fa8  ldrex   r4, [r2]
00097fac  cmp     r4, r3
00097fae  beq     #0x97ff0
00097fb0  cmp     r4, ip
00097fb2  mov     r3, r4
00097fb4  bne     #0x97fa0
00097fb6  cmp     r4, #0
00097fb8  bgt     #0x97ed6
00097fba  add.w   r1, sp, #0x87
00097fbe  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00097fc2  b       #0x97ed6
00097fc4  ldr     r3, [r1, #-0x4]
00097fc8  subs    r2, r1, #4
00097fca  subs    r1, r3, #1
00097fcc  dmb     ish
00097fd0  mov     ip, r3
00097fd2  ldrex   r4, [r2]
00097fd6  cmp     r4, r3
00097fd8  beq     #0x98010
00097fda  cmp     r4, ip
00097fdc  mov     r3, r4
00097fde  bne     #0x97fca
00097fe0  cmp     r4, #0
00097fe2  bgt.w   #0x97ea4
00097fe6  add.w   r1, sp, #0x85
00097fea  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00097fee  b       #0x97ea4
00097ff0  strex   lr, r1, [r2]
00097ff4  cmp.w   lr, #0
00097ff8  bne     #0x97fa8
00097ffa  dmb     ish
00097ffe  b       #0x97fb0
00098000  strex   lr, r1, [r2]
00098004  cmp.w   lr, #0
00098008  bne     #0x97f30
0009800a  dmb     ish
0009800e  b       #0x97f38
00098010  strex   lr, r1, [r2]
00098014  cmp.w   lr, #0
00098018  bne     #0x97fd2
0009801a  dmb     ish
0009801e  b       #0x97fda
