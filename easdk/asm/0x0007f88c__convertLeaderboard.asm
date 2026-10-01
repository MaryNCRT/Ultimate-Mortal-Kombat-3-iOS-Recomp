========================================================================
convertLeaderboard  0x0007f88c  576 bytes   EASDK_Handler.mm
========================================================================

0007f88c  push    {r4, r5, r6, r7, lr}
0007f88e  add     r7, sp, #0xc
0007f890  push.w  {r8, sl}
0007f894  sub     sp, #0x4c
0007f896  ldr     r3, [pc, #0x1b8]
0007f898  lsls    r5, r0, #2
0007f89a  add     r3, pc ; -> 0x00379b34  m_leaderboards
0007f89c  ldr     r3, [r3]
0007f89e  ldr.w   r3, [r3, r0, lsl #2]
0007f8a2  cmp     r3, #0
0007f8a4  beq.w   #0x7fa3c
0007f8a8  ldr     r2, [pc, #0x1a8]
0007f8aa  ldr.w   r0, [r3, #0x80]
0007f8ae  ldr     r1, [r3, #0x7c]
0007f8b0  add     r2, pc ; -> 0x00175888  leaderboardMonthlyNum
0007f8b2  ldr     r2, [r2]
0007f8b4  cmp     r2, #0xf9
0007f8b6  bgt.w   #0x7f9e2
0007f8ba  rsb     r2, r1, r0
0007f8be  asr.w   r8, r2, #3
0007f8c2  cmp.w   r8, #0
0007f8c6  ble     #0x7f988
0007f8c8  ldr.w   sl, [pc, #0x18c]
0007f8cc  movs    r6, #0
0007f8ce  b       #0x7f8f0
0007f8d0  ldr.w   r3, [pc, #0x188]
0007f8d4  add     r3, pc ; -> 0x00175888  leaderboardMonthlyNum
0007f8d6  ldr     r3, [r3]
0007f8d8  cmp     r3, #0xf9
0007f8da  bgt.w   #0x7f9e2
0007f8de  adds    r6, #1
0007f8e0  cmp     r6, r8
0007f8e2  beq     #0x7f988
0007f8e4  ldr     r3, [pc, #0x178]
0007f8e6  add     r3, pc ; -> 0x00379b34  m_leaderboards
0007f8e8  ldr     r3, [r3]
0007f8ea  ldr     r3, [r5, r3]
0007f8ec  cmp     r3, #0
0007f8ee  beq     #0x7f9ec
0007f8f0  ldr     r3, [r3, #0x70]
0007f8f2  lsls    r4, r6, #2
0007f8f4  ldr.w   r3, [r3, r6, lsl #2]
0007f8f8  ldr     r0, [r3, #4]
0007f8fa  bl      #0x8ad64 ; -> ZNK6Mayhem4Stat7GetRankEv
0007f8fe  mov     r3, sl
0007f900  add     r3, pc
0007f902  ldr     r3, [r3]
0007f904  str     r0, [sp, #4]
0007f906  ldr     r3, [r5, r3]
0007f908  cmp     r3, #0
0007f90a  beq     #0x7fa00
0007f90c  ldr     r3, [r3, #0x70]
0007f90e  ldr     r3, [r3, r4]
0007f910  ldr     r0, [r3, #4]
0007f912  bl      #0x8ad5c ; -> ZNK6Mayhem4Stat8GetValueEv
0007f916  ldr.w   r3, [pc, #0x14c]
0007f91a  add     r3, pc ; -> 0x00379b34  m_leaderboards
0007f91c  ldr     r3, [r3]
0007f91e  str     r0, [sp, #8]
0007f920  ldr     r3, [r5, r3]
0007f922  cmp     r3, #0
0007f924  beq     #0x7fa14
0007f926  ldr     r0, [r3, #0x70]
0007f928  ldr     r0, [r0, r4]
0007f92a  ldr     r0, [r0]
0007f92c  bl      #0x8ac98 ; -> ZNK6Mayhem4User14GetDisplayNameEv
0007f930  movs    r2, #0x20
0007f932  ldr     r1, [r0]
0007f934  add     r0, sp, #0xc
0007f936  blx     #0xdde00 ; -> strlcpy
0007f93a  ldr     r3, [pc, #0x12c]
0007f93c  add     r3, pc ; -> 0x00379b34  m_leaderboards
0007f93e  ldr     r3, [r3]
0007f940  ldr     r3, [r5, r3]
0007f942  cmp     r3, #0
0007f944  beq     #0x7fa28
0007f946  ldr     r0, [r3, #0x70]
0007f948  ldr     r0, [r0, r4]
0007f94a  ldr     r0, [r0]
0007f94c  ldr     r3, [r0]
0007f94e  ldr     r3, [r3, #8]
0007f950  blx     r3
0007f952  movs    r2, #0x20
0007f954  ldr     r1, [r0]
0007f956  add     r0, sp, #0x2c
0007f958  blx     #0xdde00 ; -> strlcpy
0007f95c  add     r0, sp, #4
0007f95e  bl      #0x7f69c ; -> Z26findIfAlreadyInLeaderboardR17LEADERBOARD_ENTRY
0007f962  cmp     r0, #0
0007f964  bne     #0x7f8d0
0007f966  ldr     r4, [pc, #0x104]
0007f968  add     r1, sp, #4
0007f96a  movs    r2, #0x48
0007f96c  add     r4, pc ; -> 0x00175888  leaderboardMonthlyNum
0007f96e  ldr     r3, [r4]
0007f970  lsls    r0, r3, #3
0007f972  lsls    r3, r3, #6
0007f974  adds    r0, r0, r3
0007f976  ldr     r3, [pc, #0xf8]
0007f978  add     r3, pc ; -> 0x003714e4  leaderboardMonthly
0007f97a  adds    r0, r0, r3
0007f97c  blx     #0xddb9c ; -> memcpy
0007f980  ldr     r3, [r4]
0007f982  adds    r3, #1
0007f984  str     r3, [r4]
0007f986  b       #0x7f8d0
0007f988  ldr     r0, [pc, #0xe8]
0007f98a  add     r0, pc ; -> 0x0017d994  '=========================='
0007f98c  blx     #0xddcb0 ; -> puts
0007f990  ldr     r3, [pc, #0xe4]
0007f992  add     r3, pc ; -> 0x00175888  leaderboardMonthlyNum
0007f994  ldr     r3, [r3]
0007f996  cmp     r3, #0
0007f998  ble     #0x7f9da
0007f99a  ldr     r5, [pc, #0xe0]
0007f99c  ldr.w   sl, [pc, #0xe0]
0007f9a0  ldr.w   r8, [pc, #0xe0]
0007f9a4  ldr     r6, [pc, #0xe0]
0007f9a6  add     r5, pc ; -> 0x003714e4  leaderboardMonthly
0007f9a8  movs    r3, #0
0007f9aa  b       #0x7f9ae
0007f9ac  mov     r3, r4
0007f9ae  ldr     r1, [r5, #4]
0007f9b0  adds    r4, r3, #1
0007f9b2  lsls    r2, r3, #3
0007f9b4  lsls    r3, r3, #6
0007f9b6  adds    r2, r2, r3
0007f9b8  adds    r2, #8
0007f9ba  mov     r3, r8
0007f9bc  add     r3, pc
0007f9be  adds    r2, r2, r3
0007f9c0  mov     r0, sl
0007f9c2  ldr     r3, [r5]
0007f9c4  add     r0, pc
0007f9c6  str     r1, [sp]
0007f9c8  mov     r1, r4
0007f9ca  blx     #0xddc38 ; -> printf
0007f9ce  mov     r3, r6
0007f9d0  add     r3, pc
0007f9d2  adds    r5, #0x48
0007f9d4  ldr     r3, [r3]
0007f9d6  cmp     r3, r4
0007f9d8  bgt     #0x7f9ac
0007f9da  ldr     r0, [pc, #0xb0]
0007f9dc  add     r0, pc ; -> 0x0017d9b0  '=========================='
0007f9de  blx     #0xddcb0 ; -> puts
0007f9e2  sub.w   sp, r7, #0x14
0007f9e6  pop.w   {r8, sl}
0007f9ea  pop     {r4, r5, r6, r7, pc}
0007f9ec  ldr     r0, [pc, #0xa0]
0007f9ee  ldr     r1, [pc, #0xa4]
0007f9f0  ldr     r3, [pc, #0xa4]
0007f9f2  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
0007f9f4  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0007f9f6  add     r3, pc ; -> 0x00175710  'm_obj'
0007f9f8  movw    r2, #0x109
0007f9fc  blx     #0xdd5cc ; -> assert_rtn
0007fa00  ldr     r0, [pc, #0x98]
0007fa02  ldr     r1, [pc, #0x9c]
0007fa04  ldr     r3, [pc, #0x9c]
0007fa06  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
0007fa08  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0007fa0a  add     r3, pc ; -> 0x00175710  'm_obj'
0007fa0c  movw    r2, #0x109
0007fa10  blx     #0xdd5cc ; -> assert_rtn
0007fa14  ldr     r0, [pc, #0x90]
0007fa16  ldr     r1, [pc, #0x94]
0007fa18  ldr     r3, [pc, #0x94]
0007fa1a  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
0007fa1c  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0007fa1e  add     r3, pc ; -> 0x00175710  'm_obj'
0007fa20  movw    r2, #0x109
0007fa24  blx     #0xdd5cc ; -> assert_rtn
0007fa28  ldr     r0, [pc, #0x88]
0007fa2a  ldr     r1, [pc, #0x8c]
0007fa2c  ldr     r3, [pc, #0x8c]
0007fa2e  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
0007fa30  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0007fa32  add     r3, pc ; -> 0x00175710  'm_obj'
0007fa34  movw    r2, #0x109
0007fa38  blx     #0xdd5cc ; -> assert_rtn
0007fa3c  ldr     r0, [pc, #0x80]
0007fa3e  ldr     r1, [pc, #0x84]
0007fa40  ldr     r3, [pc, #0x84]
0007fa42  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
0007fa44  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0007fa46  add     r3, pc ; -> 0x00175710  'm_obj'
0007fa48  movw    r2, #0x109
0007fa4c  blx     #0xdd5cc ; -> assert_rtn
0007fa50  adr     r2, #0x258
0007fa52  movs    r7, r5
0007fa54  ldrsh   r4, [r2, r7]
0007fa56  movs    r7, r1
0007fa58  adr     r2, #0xc0
0007fa5a  movs    r7, r5
0007fa5c  ldrsh   r0, [r6, r6]
0007fa5e  movs    r7, r1
0007fa60  adr     r2, #0x128
0007fa62  movs    r7, r5
0007fa64  adr     r2, #0x58
0007fa66  movs    r7, r5
0007fa68  adr     r1, #0x3d0
0007fa6a  movs    r7, r5
0007fa6c  ldrsh   r0, [r3, r4]
0007fa6e  movs    r7, r1
0007fa70  subs    r0, r5, r5
0007fa72  movs    r7, r5
0007fa74  b       #0x7fa84
0007fa76  movs    r7, r1
0007fa78  ldrsh   r2, [r6, r3]
0007fa7a  movs    r7, r1
0007fa7c  subs    r2, r7, r4
0007fa7e  movs    r7, r5
0007fa80  ldrsh   r4, [r1, r0]
0007fa82  movs    r7, r1
0007fa84  subs    r4, r4, r4
0007fa86  movs    r7, r5
0007fa88  ldrsh   r4, [r6, r2]
0007fa8a  movs    r7, r1
0007fa8c  svc     #0xd0
0007fa8e  movs    r7, r1
0007fa90  cmp     r1, #0xd2
0007fa92  movs    r6, r0
0007fa94  ldrb    r4, [r4, r2]
0007fa96  movs    r7, r1
0007fa98  ldrb    r6, [r2, r4]
0007fa9a  movs    r7, r1
0007fa9c  cmp     r1, #0xbe
0007fa9e  movs    r6, r0
0007faa0  ldrb    r0, [r2, r2]
0007faa2  movs    r7, r1
0007faa4  ldrb    r2, [r0, r4]
0007faa6  movs    r7, r1
0007faa8  cmp     r1, #0xaa
0007faaa  movs    r6, r0
0007faac  ldrb    r4, [r7, r1]
0007faae  movs    r7, r1
0007fab0  ldrb    r6, [r5, r3]
0007fab2  movs    r7, r1
0007fab4  cmp     r1, #0x96
0007fab6  movs    r6, r0
0007fab8  ldrb    r0, [r5, r1]
0007faba  movs    r7, r1
0007fabc  ldrb    r2, [r3, r3]
0007fabe  movs    r7, r1
0007fac0  cmp     r1, #0x82
0007fac2  movs    r6, r0
0007fac4  ldrb    r4, [r2, r1]
0007fac6  movs    r7, r1
0007fac8  ldrb    r6, [r0, r3]
0007faca  movs    r7, r1
