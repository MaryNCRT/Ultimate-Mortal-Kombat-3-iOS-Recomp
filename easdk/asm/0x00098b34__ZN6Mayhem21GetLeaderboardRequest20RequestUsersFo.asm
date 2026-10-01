========================================================================
ZN6Mayhem21GetLeaderboardRequest20RequestUsersForStatsEv  0x00098b34  1032 bytes   Mayhem.mm
========================================================================

00098b34  push    {r4, r5, r6, r7, lr}
00098b36  add     r7, sp, #0xc
00098b38  push.w  {r8, sl, fp}
00098b3c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00098b40  sub     sp, #0xbc
00098b42  ldr     r3, [pc, #0x3dc]
00098b44  str     r0, [sp, #4]
00098b46  add     r0, sp, #0x68
00098b48  add     r3, pc ; -> 0x000f3438  0x0
00098b4a  str     r7, [sp, #0x88]
00098b4c  ldr     r3, [r3]
00098b4e  str.w   sp, [sp, #0x90]
00098b52  str     r3, [sp, #0x80]
00098b54  ldr     r3, [pc, #0x3cc]
00098b56  add     r3, pc ; -> 0x000ee594  GCC_except_table107
00098b58  str     r3, [sp, #0x84]
00098b5a  ldr     r3, [pc, #0x3cc]
00098b5c  add     r3, pc ; -> 0x00098e0a  
00098b5e  orr     r3, r3, #1
00098b62  str     r3, [sp, #0x8c]
00098b64  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00098b68  ldr     r0, [sp, #4]
00098b6a  movs    r1, #0
00098b6c  str     r1, [sp, #0x9c]
00098b6e  str     r1, [sp, #0xa0]
00098b70  str     r1, [sp, #0xa4]
00098b72  ldr     r3, [r0, #0x7c]
00098b74  ldr.w   r2, [r0, #0x80]
00098b78  add     r0, sp, #0x9c
00098b7a  subs    r2, r2, r3
00098b7c  ldr     r3, [pc, #0x3ac]
00098b7e  asrs    r2, r2, #3
00098b80  add     r3, pc ; -> 0x000f3370  0x0
00098b82  ldr     r3, [r3]
00098b84  str     r3, [sp, #0x24]
00098b86  adds    r3, #0xc
00098b88  str     r3, [sp, #0xb0]
00098b8a  movs    r3, #4
00098b8c  str     r3, [sp, #0x6c]
00098b8e  add     r3, sp, #0xb0
00098b90  bl      #0x9cda0 ; -> ZNSt6vectorISsSaISsEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPSsS1_EEmRKSs
00098b94  ldr     r3, [sp, #0xb0]
00098b96  ldr     r1, [sp, #0x24]
00098b98  sub.w   r0, r3, #0xc
00098b9c  cmp     r1, r0
00098b9e  bne.w   #0x98db4
00098ba2  ldr     r0, [sp, #4]
00098ba4  ldr.w   r2, [r0, #0x80]
00098ba8  ldr     r3, [r0, #0x7c]
00098baa  rsb     r3, r3, r2
00098bae  lsrs    r3, r3, #3
00098bb0  beq     #0x98bf4
00098bb2  movs    r1, #0
00098bb4  str     r1, [sp, #0x10]
00098bb6  ldr     r2, [sp, #0x9c]
00098bb8  lsls    r3, r1, #2
00098bba  adds    r3, r3, r2
00098bbc  str     r3, [sp, #0x2c]
00098bbe  ldr     r3, [sp, #4]
00098bc0  ldr     r2, [sp, #4]
00098bc2  adds    r2, #0x7c
00098bc4  str     r2, [sp, #0x28]
00098bc6  ldr     r0, [r3, #0x7c]
00098bc8  lsls    r3, r1, #3
00098bca  adds    r0, r0, r3
00098bcc  bl      #0x8ad48 ; -> ZNK6Mayhem4Stat11GetMayhemIDEv
00098bd0  movs    r3, #5
00098bd2  str     r3, [sp, #0x6c]
00098bd4  mov     r1, r0
00098bd6  ldr     r0, [sp, #0x2c]
00098bd8  blx     #0xdd518 ; -> ZNSs6assignERKSs
00098bdc  ldr     r4, [sp, #0x10]
00098bde  ldr     r0, [sp, #0x28]
00098be0  adds    r1, r4, #1
00098be2  adds    r4, #1
00098be4  str     r4, [sp, #0x10]
00098be6  ldr     r4, [sp, #4]
00098be8  ldr     r3, [r0, #4]
00098bea  ldr     r2, [r4, #0x7c]
00098bec  subs    r3, r3, r2
00098bee  cmp.w   r1, r3, asr #3
00098bf2  blo     #0x98bb6
00098bf4  movs    r3, #5
00098bf6  movs    r0, #0x78
00098bf8  str     r3, [sp, #0x6c]
00098bfa  blx     #0xdd5c0 ; -> Znwm
00098bfe  movs    r3, #3
00098c00  str     r0, [sp, #0xc]
00098c02  str     r0, [sp, #8]
00098c04  str     r3, [sp, #0x6c]
00098c06  add     r1, sp, #0x9c
00098c08  bl      #0x98b28 ; -> ZN6Mayhem29GetUserListRequestNonThreadedC1ERKSt6vectorISsSaISsEE
00098c0c  ldr     r0, [sp, #8]
00098c0e  ldr     r1, [sp, #0xc]
00098c10  str     r0, [sp, #0x34]
00098c12  cmp     r1, #0
00098c14  beq.w   #0x98de0
00098c18  adds.w  r2, r0, #0x10
00098c1c  str     r2, [sp, #0x38]
00098c1e  beq     #0x98c2c
00098c20  ldr     r3, [r0, #0x10]
00098c22  ldr     r0, [sp, #0x38]
00098c24  ldr     r2, [r3, #0xc]
00098c26  movs    r3, #5
00098c28  str     r3, [sp, #0x6c]
00098c2a  blx     r2
00098c2c  movs    r3, #2
00098c2e  ldr     r0, [sp, #0x38]
00098c30  str     r3, [sp, #0x6c]
00098c32  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
00098c36  cmp     r0, #1
00098c38  beq     #0x98cb0
00098c3a  movs    r0, #2
00098c3c  movs    r1, #2
00098c3e  str     r0, [sp, #0x6c]
00098c40  ldr     r0, [sp, #4]
00098c42  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00098c46  ldr     r1, [sp, #0xc]
00098c48  cbz     r1, #0x98c64
00098c4a  ldr     r2, [sp, #0x34]
00098c4c  adds    r2, #0x10
00098c4e  str     r2, [sp, #0x4c]
00098c50  beq     #0x98c64
00098c52  ldr     r4, [sp, #0x34]
00098c54  ldr     r0, [sp, #0x4c]
00098c56  ldr     r3, [r4, #0x10]
00098c58  ldr     r2, [r3, #8]
00098c5a  movs    r3, #5
00098c5c  str     r3, [sp, #0x6c]
00098c5e  blx     r2
00098c60  cmp     r0, #0
00098c62  bne     #0x98d58
00098c64  ldr     r3, [sp, #0x9c]
00098c66  ldr.w   lr, [sp, #0xa0]
00098c6a  cmp     r3, lr
00098c6c  str.w   lr, [sp, #0x54]
00098c70  it      ne
00098c72  strne   r3, [sp, #0x5c]
00098c74  beq     #0x98c90
00098c76  ldr     r4, [sp, #0x5c]
00098c78  ldr     r1, [sp, #0x24]
00098c7a  ldr     r3, [r4]
00098c7c  sub.w   r0, r3, #0xc
00098c80  cmp     r1, r0
00098c82  bne     #0x98d62
00098c84  ldr     r0, [sp, #0x5c]
00098c86  ldr     r1, [sp, #0x54]
00098c88  adds    r0, #4
00098c8a  cmp     r1, r0
00098c8c  str     r0, [sp, #0x5c]
00098c8e  bne     #0x98c76
00098c90  ldr     r0, [sp, #0x9c]
00098c92  cbz     r0, #0x98c98
00098c94  blx     #0xdd5a8 ; -> ZdlPv
00098c98  add     r0, sp, #0x68
00098c9a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00098c9e  sub.w   sp, r7, #0x58
00098ca2  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00098ca6  sub.w   sp, r7, #0x18
00098caa  pop.w   {r8, sl, fp}
00098cae  pop     {r4, r5, r6, r7, pc}
00098cb0  ldr     r4, [sp, #4]
00098cb2  add     r0, sp, #0xa8
00098cb4  ldr.w   r2, [r4, #0x80]
00098cb8  ldr     r3, [r4, #0x7c]
00098cba  rsb     r3, r3, r2
00098cbe  asrs    r3, r3, #3
00098cc0  str     r3, [sp, #0x3c]
00098cc2  bl      #0x8ac54 ; -> ZN6Mayhem4UserC1Ev
00098cc6  ldr.w   r1, [r4, #0x8c]
00098cca  ldr.w   r2, [r4, #0x88]
00098cce  add.w   r0, r4, #0x88
00098cd2  ldr     r4, [sp, #0x3c]
00098cd4  rsb     r3, r2, r1
00098cd8  asrs    r3, r3, #3
00098cda  cmp     r4, r3
00098cdc  bhs     #0x98d8c
00098cde  lsls    r3, r4, #3
00098ce0  adds    r2, r2, r3
00098ce2  cmp     r2, r1
00098ce4  str     r2, [sp, #0x44]
00098ce6  str     r0, [sp, #0x60]
00098ce8  str     r1, [sp, #0x40]
00098cea  beq     #0x98d06
00098cec  str     r2, [sp, #0x64]
00098cee  ldr     r0, [sp, #0x64]
00098cf0  ldr     r3, [r0]
00098cf2  ldr     r2, [r3]
00098cf4  movs    r3, #1
00098cf6  str     r3, [sp, #0x6c]
00098cf8  blx     r2
00098cfa  ldr     r1, [sp, #0x64]
00098cfc  ldr     r2, [sp, #0x40]
00098cfe  adds    r1, #8
00098d00  cmp     r2, r1
00098d02  str     r1, [sp, #0x64]
00098d04  bne     #0x98cee
00098d06  ldr     r1, [sp, #0x44]
00098d08  ldr     r0, [sp, #0x60]
00098d0a  str     r1, [r0, #4]
00098d0c  ldr     r3, [sp, #4]
00098d0e  ldr.w   r2, [r3, #0x8c]
00098d12  ldr.w   r3, [r3, #0x88]
00098d16  rsb     r3, r3, r2
00098d1a  lsrs    r3, r3, #3
00098d1c  beq     #0x98c46
00098d1e  movs    r1, #0
00098d20  str     r1, [sp, #0x14]
00098d22  ldr     r4, [sp, #4]
00098d24  ldr     r2, [sp, #4]
00098d26  lsls    r1, r1, #3
00098d28  adds    r4, #0x88
00098d2a  str     r4, [sp, #0x30]
00098d2c  ldr     r4, [sp, #0x34]
00098d2e  ldr.w   r0, [r2, #0x88]
00098d32  ldr     r3, [r4, #4]
00098d34  adds    r0, r0, r1
00098d36  adds    r1, r1, r3
00098d38  bl      #0x8ac80 ; -> ZN6Mayhem4UseraSERKS0_
00098d3c  ldr     r2, [sp, #0x30]
00098d3e  ldr     r4, [sp, #4]
00098d40  ldr     r0, [sp, #0x14]
00098d42  adds    r1, r0, #1
00098d44  adds    r0, #1
00098d46  str     r0, [sp, #0x14]
00098d48  ldr     r3, [r2, #4]
00098d4a  ldr.w   r2, [r4, #0x88]
00098d4e  subs    r3, r3, r2
00098d50  cmp.w   r1, r3, asr #3
00098d54  blo     #0x98d22
00098d56  b       #0x98c46
00098d58  ldr     r3, [r4, #0x10]
00098d5a  ldr     r0, [sp, #0x4c]
00098d5c  ldr     r3, [r3, #4]
00098d5e  blx     r3
00098d60  b       #0x98c64
00098d62  subs    r2, r3, #4
00098d64  ldr     r3, [r3, #-0x4]
00098d68  subs    r1, r3, #1
00098d6a  dmb     ish
00098d6e  mov     ip, r3
00098d70  ldrex   r4, [r2]
00098d74  cmp     r4, r3
00098d76  beq     #0x98da4
00098d78  cmp     r4, ip
00098d7a  mov     r3, r4
00098d7c  bne     #0x98d68
00098d7e  cmp     r4, #0
00098d80  bgt     #0x98c84
00098d82  add.w   r1, sp, #0xb7
00098d86  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00098d8a  b       #0x98c84
00098d8c  ldr     r4, [sp, #4]
00098d8e  ldr.w   r1, [r4, #0x8c]
00098d92  ldr     r4, [sp, #0x3c]
00098d94  rsb     r2, r3, r4
00098d98  movs    r3, #2
00098d9a  str     r3, [sp, #0x6c]
00098d9c  add     r3, sp, #0xa8
00098d9e  bl      #0x9aec4 ; -> ZNSt6vectorIN6Mayhem4UserESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
00098da2  b       #0x98d0c
00098da4  strex   lr, r1, [r2]
00098da8  cmp.w   lr, #0
00098dac  bne     #0x98d70
00098dae  dmb     ish
00098db2  b       #0x98d78
00098db4  subs    r2, r3, #4
00098db6  ldr     r3, [r3, #-0x4]
00098dba  subs    r1, r3, #1
00098dbc  dmb     ish
00098dc0  mov     ip, r3
00098dc2  ldrex   r4, [r2]
00098dc6  cmp     r4, r3
00098dc8  beq     #0x98dfa
00098dca  cmp     r4, ip
00098dcc  mov     r3, r4
00098dce  bne     #0x98dba
00098dd0  cmp     r4, #0
00098dd2  bgt.w   #0x98ba2
00098dd6  add.w   r1, sp, #0xb9
00098dda  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00098dde  b       #0x98ba2
00098de0  ldr     r0, [pc, #0x14c]
00098de2  ldr     r1, [pc, #0x150]
00098de4  ldr.w   r3, [pc, #0x150]
00098de8  movs    r2, #2
00098dea  add     r0, pc ; -> 0x000e5920  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem18GetUserListRequestEEptEvE8__func__
00098dec  str     r2, [sp, #0x6c]
00098dee  add     r1, pc ; -> 0x001759e4  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00098df0  add     r3, pc ; -> 0x00175a58  'm_obj'
00098df2  movw    r2, #0x109
00098df6  blx     #0xdd5cc ; -> assert_rtn
00098dfa  strex   lr, r1, [r2]
00098dfe  cmp.w   lr, #0
00098e02  bne     #0x98dc2
00098e04  dmb     ish
00098e08  b       #0x98dca
00098e0a  ldr     r3, [sp, #0x6c]
00098e0c  ldr     r4, [sp, #0x70]
00098e0e  cmp     r3, #1
00098e10  str     r4, [sp]
00098e12  beq     #0x98e20
00098e14  cmp     r3, #2
00098e16  beq     #0x98ea4
00098e18  cmp     r3, #3
00098e1a  beq     #0x98e8e
00098e1c  cmp     r3, #4
00098e1e  beq     #0x98e4c
00098e20  ldr     r1, [sp]
00098e22  ldr     r2, [sp, #0xc]
00098e24  str     r1, [sp, #0x1c]
00098e26  cbz     r2, #0x98e48
00098e28  ldr     r3, [sp, #0x34]
00098e2a  adds    r3, #0x10
00098e2c  str     r3, [sp, #0x48]
00098e2e  beq     #0x98e48
00098e30  ldr     r4, [sp, #0x34]
00098e32  ldr     r0, [sp, #0x48]
00098e34  ldr     r3, [r4, #0x10]
00098e36  ldr     r2, [r3, #8]
00098e38  movs    r3, #0
00098e3a  str     r3, [sp, #0x6c]
00098e3c  blx     r2
00098e3e  cbz     r0, #0x98e48
00098e40  ldr     r3, [r4, #0x10]
00098e42  ldr     r0, [sp, #0x48]
00098e44  ldr     r3, [r3, #4]
00098e46  blx     r3
00098e48  ldr     r0, [sp, #0x1c]
00098e4a  str     r0, [sp]
00098e4c  ldr     r2, [sp, #0xa0]
00098e4e  ldr     r3, [sp, #0x9c]
00098e50  ldr     r1, [sp]
00098e52  cmp     r3, r2
00098e54  str     r2, [sp, #0x50]
00098e56  str     r1, [sp, #0x20]
00098e58  beq     #0x98e76
00098e5a  str     r3, [sp, #0x58]
00098e5c  ldr     r4, [sp, #0x58]
00098e5e  ldr     r1, [sp, #0x24]
00098e60  ldr     r3, [r4]
00098e62  sub.w   r0, r3, #0xc
00098e66  cmp     r1, r0
00098e68  bne     #0x98ed6
00098e6a  ldr     r0, [sp, #0x58]
00098e6c  ldr     r1, [sp, #0x50]
00098e6e  adds    r0, #4
00098e70  cmp     r1, r0
00098e72  str     r0, [sp, #0x58]
00098e74  bne     #0x98e5c
00098e76  ldr     r0, [sp, #0x9c]
00098e78  cbz     r0, #0x98e7e
00098e7a  blx     #0xdd5a8 ; -> ZdlPv
00098e7e  ldr     r2, [sp, #0x20]
00098e80  mov.w   r3, #-1
00098e84  str     r3, [sp, #0x6c]
00098e86  mov     r0, r2
00098e88  str     r2, [sp]
00098e8a  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00098e8e  ldr     r3, [sp, #0xb0]
00098e90  ldr     r2, [sp, #0x24]
00098e92  ldr     r1, [sp]
00098e94  sub.w   r0, r3, #0xc
00098e98  cmp     r2, r0
00098e9a  str     r1, [sp, #0x18]
00098e9c  bne     #0x98eac
00098e9e  ldr     r0, [sp, #0x18]
00098ea0  str     r0, [sp]
00098ea2  b       #0x98e4c
00098ea4  ldr     r0, [sp, #8]
00098ea6  blx     #0xdd5a8 ; -> ZdlPv
00098eaa  b       #0x98e4c
00098eac  subs    r2, r3, #4
00098eae  ldr     r3, [r3, #-0x4]
00098eb2  subs    r1, r3, #1
00098eb4  dmb     ish
00098eb8  mov     ip, r3
00098eba  ldrex   r4, [r2]
00098ebe  cmp     r4, r3
00098ec0  beq     #0x98f0e
00098ec2  cmp     r4, ip
00098ec4  mov     r3, r4
00098ec6  bne     #0x98eb2
00098ec8  cmp     r4, #0
00098eca  bgt     #0x98e9e
00098ecc  add.w   r1, sp, #0xba
00098ed0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00098ed4  b       #0x98e9e
00098ed6  subs    r2, r3, #4
00098ed8  ldr     r3, [r3, #-0x4]
00098edc  subs    r1, r3, #1
00098ede  dmb     ish
00098ee2  mov     ip, r3
00098ee4  ldrex   r4, [r2]
00098ee8  cmp     r4, r3
00098eea  beq     #0x98efe
00098eec  cmp     r4, ip
00098eee  mov     r3, r4
00098ef0  bne     #0x98edc
00098ef2  cmp     r4, #0
00098ef4  bgt     #0x98e6a
00098ef6  add     r1, sp, #0xb8
00098ef8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00098efc  b       #0x98e6a
00098efe  strex   lr, r1, [r2]
00098f02  cmp.w   lr, #0
00098f06  bne     #0x98ee4
00098f08  dmb     ish
00098f0c  b       #0x98eec
00098f0e  strex   lr, r1, [r2]
00098f12  cmp.w   lr, #0
00098f16  bne     #0x98eba
00098f18  dmb     ish
00098f1c  b       #0x98ec2
00098f1e  nop     
00098f20  add     r0, sp, #0x3b0
00098f22  movs    r5, r0
00098f24  ldrh    r2, [r7, r0]
00098f26  movs    r5, r0
00098f28  lsls    r2, r5, #0xa
00098f2a  movs    r0, r0
00098f2c  adr     r7, #0x3b0
00098f2e  movs    r5, r0
00098f30  ldm     r3!, {r1, r4, r5}
00098f32  movs    r4, r0
00098f34  ldm     r3!, {r1, r4, r5, r6, r7}
00098f36  movs    r5, r1
00098f38  ldm     r4!, {r2, r5, r6}
00098f3a  movs    r5, r1
