========================================================================
ZN4midp6System11getPropertyEPNS_6StringE  0x0009d590  564 bytes   SystemIPhone.mm
========================================================================

0009d590  push    {r4, r5, r6, r7, lr}
0009d592  add     r7, sp, #0xc
0009d594  push.w  {r8, sl, fp}
0009d598  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009d59c  sub     sp, #0x60
0009d59e  ldr     r3, [pc, #0x1e0]
0009d5a0  str     r0, [sp, #4]
0009d5a2  add     r0, sp, #0x2c
0009d5a4  add     r3, pc ; -> 0x000f301c  0x0
0009d5a6  str     r7, [sp, #0x4c]
0009d5a8  ldr     r3, [r3]
0009d5aa  str.w   sp, [sp, #0x54]
0009d5ae  str     r3, [sp, #0x44]
0009d5b0  ldr     r3, [pc, #0x1d0]
0009d5b2  add     r3, pc ; -> 0x000ee5ee  GCC_except_table0
0009d5b4  str     r3, [sp, #0x48]
0009d5b6  ldr     r3, [pc, #0x1d0]
0009d5b8  add     r3, pc ; -> 0x0009d76a  
0009d5ba  orr     r3, r3, #1
0009d5be  str     r3, [sp, #0x50]
0009d5c0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009d5c4  ldr     r2, [sp, #4]
0009d5c6  cmp     r2, #0
0009d5c8  beq.w   #0x9d72c
0009d5cc  ldr     r3, [sp, #4]
0009d5ce  mov.w   r2, #-1
0009d5d2  str     r3, [sp, #0x28]
0009d5d4  ldr     r3, [r3]
0009d5d6  ldr     r0, [sp, #0x28]
0009d5d8  ldr     r3, [r3, #0xc]
0009d5da  str     r2, [sp, #0x30]
0009d5dc  blx     r3
0009d5de  ldr     r1, [pc, #0x1ac]
0009d5e0  ldr     r0, [sp, #0x28]
0009d5e2  add     r1, pc ; -> 0x001760b0  'microedition.locale'
0009d5e4  bl      #0x9da40 ; -> ZNK4midp6String6equalsEPKc
0009d5e8  cmp     r0, #0
0009d5ea  bne     #0x9d676
0009d5ec  ldr.w   r0, [pc, #0x1a0]
0009d5f0  ldr     r1, [pc, #0x1a0]
0009d5f2  mov.w   r3, #-1
0009d5f6  add     r0, pc ; -> 0x000fdb60  
0009d5f8  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
0009d5fa  ldr     r0, [r0]
0009d5fc  ldr     r1, [r1]
0009d5fe  str     r3, [sp, #0x30]
0009d600  blx     #0xddbfc ; -> objc_msgSend
0009d604  cmp     r0, #0
0009d606  beq.w   #0x9d742
0009d60a  ldr     r3, [sp, #0x28]
0009d60c  ldr     r2, [r3, #8]
0009d60e  cmp     r2, #0
0009d610  beq.w   #0x9d754
0009d614  ldr     r1, [pc, #0x180]
0009d616  mov.w   r3, #-1
0009d61a  str     r3, [sp, #0x30]
0009d61c  add     r1, pc ; -> 0x000fd00c  'LZ\x0e'
0009d61e  ldr     r1, [r1]
0009d620  blx     #0xddbfc ; -> objc_msgSend
0009d624  str     r0, [sp, #0x18]
0009d626  cmp     r0, #0
0009d628  beq     #0x9d718
0009d62a  blx     #0xdd158 ; -> CFRetain
0009d62e  movs    r0, #0x14
0009d630  blx     #0xdd5c0 ; -> Znwm
0009d634  movs    r3, #1
0009d636  ldr     r1, [sp, #0x18]
0009d638  str     r3, [sp, #0x30]
0009d63a  str     r0, [sp, #0x1c]
0009d63c  bl      #0x9d9b8 ; -> ZN4midp6StringC1EPK10__CFString
0009d640  ldr     r2, [sp, #0x28]
0009d642  ldr     r0, [sp, #0x28]
0009d644  ldr     r3, [r2]
0009d646  ldr     r2, [r3, #8]
0009d648  mov.w   r3, #-1
0009d64c  str     r3, [sp, #0x30]
0009d64e  blx     r2
0009d650  cbz     r0, #0x9d65c
0009d652  ldr     r2, [sp, #0x28]
0009d654  ldr     r3, [r2]
0009d656  mov     r0, r2
0009d658  ldr     r3, [r3, #4]
0009d65a  blx     r3
0009d65c  add     r0, sp, #0x2c
0009d65e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009d662  ldr     r0, [sp, #0x1c]
0009d664  sub.w   sp, r7, #0x58
0009d668  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009d66c  sub.w   sp, r7, #0x18
0009d670  pop.w   {r8, sl, fp}
0009d674  pop     {r4, r5, r6, r7, pc}
0009d676  blx     #0xdd134 ; -> CFLocaleCopyPreferredLanguages
0009d67a  str     r0, [sp, #0x20]
0009d67c  cbz     r0, #0x9d6ba
0009d67e  blx     #0xdd0ec ; -> CFArrayGetCount
0009d682  cmp     r0, #0
0009d684  ble     #0x9d71e
0009d686  movs    r1, #0
0009d688  ldr     r0, [sp, #0x20]
0009d68a  blx     #0xdd0f8 ; -> CFArrayGetValueAtIndex
0009d68e  str     r0, [sp, #8]
0009d690  blx     #0xdd158 ; -> CFRetain
0009d694  movs    r0, #0x14
0009d696  blx     #0xdd5c0 ; -> Znwm
0009d69a  movs    r3, #4
0009d69c  ldr     r1, [sp, #8]
0009d69e  str     r3, [sp, #0x30]
0009d6a0  str     r0, [sp, #0x1c]
0009d6a2  str     r0, [sp, #0xc]
0009d6a4  bl      #0x9d9b8 ; -> ZN4midp6StringC1EPK10__CFString
0009d6a8  ldr     r0, [sp, #0x20]
0009d6aa  mov.w   r3, #-1
0009d6ae  str     r3, [sp, #0x30]
0009d6b0  blx     #0xdd14c ; -> CFRelease
0009d6b4  ldr     r3, [sp, #0xc]
0009d6b6  cmp     r3, #0
0009d6b8  bne     #0x9d640
0009d6ba  mov.w   r3, #-1
0009d6be  str     r3, [sp, #0x30]
0009d6c0  blx     #0xdd128 ; -> CFLocaleCopyCurrent
0009d6c4  str     r0, [sp, #0x24]
0009d6c6  cbz     r0, #0x9d700
0009d6c8  ldr     r1, [pc, #0xd0]
0009d6ca  add     r1, pc ; -> 0x000f3440  0x0
0009d6cc  ldr     r1, [r1]
0009d6ce  ldr     r1, [r1]
0009d6d0  blx     #0xdd140 ; -> CFLocaleGetValue
0009d6d4  str     r0, [sp, #0x10]
0009d6d6  blx     #0xdd158 ; -> CFRetain
0009d6da  movs    r0, #0x14
0009d6dc  blx     #0xdd5c0 ; -> Znwm
0009d6e0  movs    r3, #3
0009d6e2  ldr     r1, [sp, #0x10]
0009d6e4  str     r3, [sp, #0x30]
0009d6e6  str     r0, [sp, #0x1c]
0009d6e8  str     r0, [sp, #0x14]
0009d6ea  bl      #0x9d9b8 ; -> ZN4midp6StringC1EPK10__CFString
0009d6ee  ldr     r0, [sp, #0x24]
0009d6f0  mov.w   r3, #-1
0009d6f4  str     r3, [sp, #0x30]
0009d6f6  blx     #0xdd14c ; -> CFRelease
0009d6fa  ldr     r2, [sp, #0x14]
0009d6fc  cmp     r2, #0
0009d6fe  bne     #0x9d640
0009d700  movs    r0, #0x14
0009d702  mov.w   r3, #-1
0009d706  str     r3, [sp, #0x30]
0009d708  blx     #0xdd5c0 ; -> Znwm
0009d70c  movs    r3, #2
0009d70e  str     r3, [sp, #0x30]
0009d710  str     r0, [sp, #0x1c]
0009d712  bl      #0x9d9e4 ; -> ZN4midp6StringC1Ev
0009d716  b       #0x9d640
0009d718  ldr     r3, [sp, #0x18]
0009d71a  str     r3, [sp, #0x1c]
0009d71c  b       #0x9d640
0009d71e  ldr     r0, [sp, #0x20]
0009d720  mov.w   r3, #-1
0009d724  str     r3, [sp, #0x30]
0009d726  blx     #0xdd14c ; -> CFRelease
0009d72a  b       #0x9d6ba
0009d72c  ldr     r0, [pc, #0x70]
0009d72e  ldr     r1, [pc, #0x74]
0009d730  ldr     r3, [pc, #0x74]
0009d732  subs    r2, #1
0009d734  add     r0, pc ; -> 0x000e5a68  ZZN4midp6System11getPropertyEPNS_6StringEE8__func__
0009d736  str     r2, [sp, #0x30]
0009d738  add     r1, pc ; -> 0x0017602c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/iphone/SystemIPhone.mm'
0009d73a  add     r3, pc ; -> 0x001760a4  'key != null'
0009d73c  adds    r2, #0x60
0009d73e  blx     #0xdd5cc ; -> assert_rtn
0009d742  ldr     r0, [pc, #0x68]
0009d744  ldr     r1, [pc, #0x68]
0009d746  ldr     r3, [pc, #0x6c]
0009d748  add     r0, pc ; -> 0x000e5a68  ZZN4midp6System11getPropertyEPNS_6StringEE8__func__
0009d74a  add     r1, pc ; -> 0x001760c4  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/iphone/SystemIPhone.mm'
0009d74c  add     r3, pc ; -> 0x0017613c  'mainBundle != null'
0009d74e  movs    r2, #0x8b
0009d750  blx     #0xdd5cc ; -> assert_rtn
0009d754  ldr     r0, [pc, #0x60]
0009d756  ldr     r1, [pc, #0x64]
0009d758  ldr     r3, [pc, #0x64]
0009d75a  subs    r2, #1
0009d75c  add     r0, pc ; -> 0x000e5a68  ZZN4midp6System11getPropertyEPNS_6StringEE8__func__
0009d75e  str     r2, [sp, #0x30]
0009d760  add     r1, pc ; -> 0x00176150  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/iphone/SystemIPhone.mm'
0009d762  add     r3, pc ; -> 0x001761c8  'keyRef != null'
0009d764  adds    r2, #0x8e
0009d766  blx     #0xdd5cc ; -> assert_rtn
0009d76a  ldr     r2, [sp, #0x34]
0009d76c  ldr     r0, [sp, #0x1c]
0009d76e  str     r2, [sp]
0009d770  blx     #0xdd5a8 ; -> ZdlPv
0009d774  ldr     r0, [sp]
0009d776  mov.w   r3, #-1
0009d77a  str     r3, [sp, #0x30]
0009d77c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009d780  ldrh    r4, [r6, r1]
0009d782  movs    r5, r0
0009d784  asrs    r0, r7, #0x20
0009d786  movs    r5, r0
0009d788  lsls    r6, r5, #6
0009d78a  movs    r0, r0
0009d78c  ldrh    r2, [r1, #0x16]
0009d78e  movs    r5, r1
0009d790  lsls    r6, r4, #0x15
0009d792  movs    r6, r0
0009d794  bic     r0, r0, #0x850000
0009d798  vld1.8  {d16[0]}, [ip], r5
0009d79c  ldrb    r2, [r6, r5]
0009d79e  movs    r5, r0
0009d7a0  strh    r0, [r6, #0x18]
0009d7a2  movs    r4, r0
0009d7a4  ldrh    r0, [r6, #6]
0009d7a6  movs    r5, r1
0009d7a8  ldrh    r6, [r4, #0xa]
0009d7aa  movs    r5, r1
0009d7ac  strh    r4, [r3, #0x18]
0009d7ae  movs    r4, r0
0009d7b0  ldrh    r6, [r6, #0xa]
0009d7b2  movs    r5, r1
0009d7b4  ldrh    r4, [r5, #0xe]
0009d7b6  movs    r5, r1
0009d7b8  strh    r0, [r1, #0x18]
0009d7ba  movs    r4, r0
0009d7bc  ldrh    r4, [r5, #0xe]
0009d7be  movs    r5, r1
0009d7c0  ldrh    r2, [r4, #0x12]
0009d7c2  movs    r5, r1
