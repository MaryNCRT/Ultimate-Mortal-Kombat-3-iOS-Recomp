========================================================================
ZN6Mayhem18GetUserListRequest13DirectRequestEv  0x000946a4  2724 bytes   Mayhem.mm
========================================================================

000946a4  push    {r4, r5, r6, r7, lr}
000946a6  add     r7, sp, #0xc
000946a8  push.w  {r8, sl, fp}
000946ac  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000946b0  sub     sp, #0x144
000946b2  ldr.w   r3, [pc, #0x9f4]
000946b6  str     r0, [sp, #8]
000946b8  add     r0, sp, #0xb0
000946ba  add     r3, pc ; -> 0x000f3438  0x0
000946bc  str     r7, [sp, #0xd0]
000946be  ldr     r3, [r3]
000946c0  str.w   sp, [sp, #0xd8]
000946c4  str     r3, [sp, #0xc8]
000946c6  ldr.w   r3, [pc, #0x9e4]
000946ca  add     r3, pc ; -> 0x000ee4b2  GCC_except_table90
000946cc  str     r3, [sp, #0xcc]
000946ce  ldr.w   r3, [pc, #0x9e0]
000946d2  add     r3, pc ; -> 0x00094d72  
000946d4  orr     r3, r3, #1
000946d8  str     r3, [sp, #0xd4]
000946da  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000946de  ldr.w   r3, [pc, #0x9d4]
000946e2  ldr.w   r1, [pc, #0x9d4]
000946e6  add     r0, sp, #0x12c
000946e8  add     r3, pc ; -> 0x000fdb5c  
000946ea  add     r1, pc ; -> 0x0017f364  
000946ec  ldr     r3, [r3]
000946ee  str     r1, [sp, #4]
000946f0  str     r3, [sp, #0xc]
000946f2  ldr.w   r3, [pc, #0x9c8]
000946f6  add     r3, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000946f8  ldr     r3, [r3]
000946fa  str     r3, [sp, #0x10]
000946fc  mov.w   r3, #-1
00094700  str     r3, [sp, #0xb4]
00094702  bl      #0x8bb28 ; -> ZN6Mayhem12getMayhemURLEv
00094706  ldr     r2, [sp, #0x12c]
00094708  movs    r3, #0xc
0009470a  ldr     r0, [sp, #0xc]
0009470c  str     r3, [sp, #0xb4]
0009470e  str     r2, [sp, #0x94]
00094710  ldr     r1, [sp, #0x10]
00094712  ldr     r2, [sp, #4]
00094714  ldr     r3, [sp, #0x94]
00094716  blx     #0xddbfc ; -> objc_msgSend
0009471a  ldr     r3, [sp, #0x94]
0009471c  str     r0, [sp, #0x14]
0009471e  sub.w   r0, r3, #0xc
00094722  ldr.w   r3, [pc, #0x99c]
00094726  add     r3, pc ; -> 0x000f3370  0x0
00094728  ldr     r3, [r3]
0009472a  cmp     r0, r3
0009472c  str     r3, [sp, #0xa4]
0009472e  bne.w   #0x94be0
00094732  ldr.w   r3, [pc, #0x990]
00094736  ldr     r0, [sp, #0xc]
00094738  add     r3, pc ; -> 0x000fcf68  
0009473a  ldr     r3, [r3]
0009473c  str     r3, [sp, #0x18]
0009473e  ldr.w   r3, [pc, #0x988]
00094742  add     r3, pc ; -> 0x000fcf58  
00094744  ldr     r3, [r3]
00094746  str     r3, [sp, #0x1c]
00094748  ldr     r1, [sp, #0x1c]
0009474a  mov.w   r3, #-1
0009474e  str     r3, [sp, #0xb4]
00094750  blx     #0xddbfc ; -> objc_msgSend
00094754  ldr     r1, [sp, #0x18]
00094756  mov     r2, r0
00094758  ldr     r0, [sp, #0x14]
0009475a  blx     #0xddbfc ; -> objc_msgSend
0009475e  add     r2, sp, #0x140
00094760  movs    r3, #0xb
00094762  adds    r2, #3
00094764  str     r3, [sp, #0xb4]
00094766  mov     r1, r0
00094768  add     r0, sp, #0x128
0009476a  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009476e  movs    r3, #0xa
00094770  add     r0, sp, #0xe4
00094772  str     r3, [sp, #0xb4]
00094774  add     r1, sp, #0x128
00094776  bl      #0x8b474 ; -> ZN6Mayhem11HTTPRequestC1ERKSs
0009477a  ldr     r3, [sp, #0x128]
0009477c  ldr     r2, [sp, #0xa4]
0009477e  sub.w   r0, r3, #0xc
00094782  cmp     r2, r0
00094784  bne.w   #0x94bb2
00094788  ldr.w   r1, [pc, #0x940]
0009478c  movs    r3, #9
0009478e  add     r0, sp, #0x124
00094790  add     r1, pc ; -> 0x00175e64  'POST'
00094792  str     r3, [sp, #0xb4]
00094794  add.w   r2, sp, #0x142
00094798  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009479c  movs    r3, #8
0009479e  add     r0, sp, #0xe4
000947a0  str     r3, [sp, #0xb4]
000947a2  add     r1, sp, #0x124
000947a4  bl      #0x8b3e8 ; -> ZN6Mayhem11HTTPRequest9SetMethodERKSs
000947a8  ldr     r3, [sp, #0x124]
000947aa  ldr     r2, [sp, #0xa4]
000947ac  sub.w   r0, r3, #0xc
000947b0  cmp     r2, r0
000947b2  bne.w   #0x94c94
000947b6  ldr     r3, [sp, #8]
000947b8  ldr     r1, [sp, #0xa4]
000947ba  adds    r1, #0xc
000947bc  str     r1, [sp, #0x98]
000947be  str     r1, [sp, #0x120]
000947c0  ldr     r2, [r3, #0x70]
000947c2  ldr     r3, [r3, #0x6c]
000947c4  rsb     r3, r3, r2
000947c8  lsrs    r3, r3, #2
000947ca  beq     #0x94852
000947cc  movs    r4, #0
000947ce  str     r4, [sp, #0x68]
000947d0  str     r4, [sp, #0x60]
000947d2  str     r4, [sp, #0x20]
000947d4  ldr     r1, [sp, #8]
000947d6  ldr     r4, [sp, #0x20]
000947d8  ldr     r2, [r1, #4]
000947da  lsls    r3, r4, #3
000947dc  movs    r1, #7
000947de  add.w   r0, r2, r3
000947e2  ldr     r3, [r2, r3]
000947e4  ldr     r3, [r3, #0xc]
000947e6  str     r1, [sp, #0xb4]
000947e8  blx     r3
000947ea  cbnz    r0, #0x94836
000947ec  ldr     r2, [sp, #8]
000947ee  ldr     r1, [sp, #0x20]
000947f0  lsls    r4, r4, #2
000947f2  ldr     r3, [r2, #0x6c]
000947f4  str     r4, [sp, #0x9c]
000947f6  ldr.w   r3, [r3, r1, lsl #2]
000947fa  ldr     r3, [r3, #-0xc]
000947fe  cbz     r3, #0x94836
00094800  ldr     r2, [sp, #0x60]
00094802  cbz     r2, #0x94812
00094804  ldr.w   r1, [pc, #0x8c8]
00094808  add     r0, sp, #0x120
0009480a  movs    r2, #1
0009480c  add     r1, pc ; -> 0x00175e6c  ','
0009480e  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
00094812  ldr     r4, [sp, #8]
00094814  ldr     r2, [sp, #0x9c]
00094816  ldr     r3, [r4, #0x6c]
00094818  add.w   r1, r2, r3
0009481c  ldr     r3, [r2, r3]
0009481e  ldr     r3, [r3, #-0xc]
00094822  cmp     r3, #0
00094824  beq.w   #0x94b58
00094828  movs    r2, #7
0009482a  add     r0, sp, #0x120
0009482c  str     r2, [sp, #0xb4]
0009482e  blx     #0xdd500 ; -> ZNSs6appendERKSs
00094832  movs    r3, #1
00094834  str     r3, [sp, #0x60]
00094836  ldr     r3, [sp, #8]
00094838  ldr     r4, [sp, #0x68]
0009483a  ldr     r1, [sp, #0x68]
0009483c  adds    r4, #1
0009483e  adds    r1, #1
00094840  str     r4, [sp, #0x20]
00094842  str     r1, [sp, #0x68]
00094844  ldr     r2, [r3, #0x70]
00094846  ldr     r3, [r3, #0x6c]
00094848  rsb     r3, r3, r2
0009484c  cmp.w   r4, r3, asr #2
00094850  blo     #0x947d4
00094852  ldr     r4, [sp, #0x98]
00094854  ldr.w   r1, [pc, #0x87c]
00094858  movs    r3, #6
0009485a  add     r0, sp, #0x11c
0009485c  str     r4, [sp, #0x11c]
0009485e  add     r1, pc ; -> 0x00175ef0  'application=iphone\n'
00094860  str     r3, [sp, #0xb4]
00094862  movs    r2, #0x13
00094864  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
00094868  ldr.w   r1, [pc, #0x86c]
0009486c  add     r0, sp, #0x118
0009486e  add     r2, sp, #0x120
00094870  add     r1, pc ; -> 0x00175f04  'userIds='
00094872  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
00094876  movs    r3, #5
00094878  add     r0, sp, #0x114
0009487a  str     r3, [sp, #0xb4]
0009487c  add     r1, sp, #0x118
0009487e  blx     #0xdd53c ; -> ZNSsC1ERKSs
00094882  ldr.w   r1, [pc, #0x858]
00094886  movs    r2, #1
00094888  add     r0, sp, #0x114
0009488a  add     r1, pc ; -> 0x00175f10  '\n'
0009488c  str     r2, [sp, #0xb4]
0009488e  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
00094892  movs    r3, #4
00094894  add     r0, sp, #0x11c
00094896  str     r3, [sp, #0xb4]
00094898  add     r1, sp, #0x114
0009489a  blx     #0xdd500 ; -> ZNSs6appendERKSs
0009489e  ldr     r3, [sp, #0x114]
000948a0  ldr     r2, [sp, #0xa4]
000948a2  sub.w   r0, r3, #0xc
000948a6  cmp     r2, r0
000948a8  bne.w   #0x94c68
000948ac  ldr     r3, [sp, #0x118]
000948ae  ldr     r1, [sp, #0xa4]
000948b0  sub.w   r0, r3, #0xc
000948b4  cmp     r1, r0
000948b6  bne.w   #0x94cc0
000948ba  movs    r3, #6
000948bc  add     r0, sp, #0xe4
000948be  str     r3, [sp, #0xb4]
000948c0  add     r1, sp, #0x11c
000948c2  bl      #0x8b3dc ; -> ZN6Mayhem11HTTPRequest7SetBodyERKSs
000948c6  add     r0, sp, #0xe4
000948c8  bl      #0x8f6f0 ; -> ZN6Mayhem11HTTPRequest9DoRequestEv
000948cc  ldr.w   r3, [pc, #0x810]
000948d0  str     r0, [sp, #0x24]
000948d2  ldr     r0, [sp, #0xc]
000948d4  add     r3, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000948d6  ldr     r3, [r3]
000948d8  str     r3, [sp, #0x28]
000948da  mov     r1, r3
000948dc  blx     #0xddbfc ; -> objc_msgSend
000948e0  ldr.w   r3, [pc, #0x800]
000948e4  str     r0, [sp, #0x2c]
000948e6  ldr     r1, [sp, #0x1c]
000948e8  add     r3, pc ; -> 0x000fcfb4  '_U\x0e'
000948ea  ldr     r0, [sp, #0xc]
000948ec  ldr     r3, [r3]
000948ee  str     r3, [sp, #0x30]
000948f0  blx     #0xddbfc ; -> objc_msgSend
000948f4  mov     r3, r0
000948f6  ldr     r1, [sp, #0x30]
000948f8  ldr     r0, [sp, #0x2c]
000948fa  ldr     r2, [sp, #0x24]
000948fc  blx     #0xddbfc ; -> objc_msgSend
00094900  ldr.w   r3, [pc, #0x7e4]
00094904  add     r3, pc ; -> 0x000fca58  '\x14\t\x0e'
00094906  ldr     r3, [r3]
00094908  str     r3, [sp, #0x34]
0009490a  mov     r1, r3
0009490c  blx     #0xddbfc ; -> objc_msgSend
00094910  ldr.w   r1, [pc, #0x7d8]
00094914  mov     r2, r0
00094916  ldr     r0, [sp, #0xc]
00094918  add     r1, pc ; -> 0x000fcf94  
0009491a  ldr     r1, [r1]
0009491c  blx     #0xddbfc ; -> objc_msgSend
00094920  ldr.w   r1, [pc, #0x7cc]
00094924  movs    r2, #4
00094926  add     r1, pc ; -> 0x000fcd10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x398
00094928  ldr     r1, [r1]
0009492a  blx     #0xddbfc ; -> objc_msgSend
0009492e  str     r0, [sp, #0x64]
00094930  ldr.w   r0, [pc, #0x7c0]
00094934  ldr     r1, [sp, #0x28]
00094936  add     r0, pc ; -> 0x000fdc00  
00094938  ldr     r0, [r0]
0009493a  blx     #0xddbfc ; -> objc_msgSend
0009493e  ldr.w   r1, [pc, #0x7b8]
00094942  ldr     r2, [sp, #0x64]
00094944  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
00094946  ldr     r1, [r1]
00094948  blx     #0xddbfc ; -> objc_msgSend
0009494c  ldr     r1, [sp, #0x34]
0009494e  blx     #0xddbfc ; -> objc_msgSend
00094952  ldr     r1, [sp, #8]
00094954  str     r0, [sp, #0x38]
00094956  ldr     r1, [r1, #0x20]
00094958  str     r1, [sp, #0x3c]
0009495a  ldr.w   r1, [pc, #0x7a0]
0009495e  ldr     r0, [sp, #0x3c]
00094960  add     r1, pc ; -> 0x000fcfa4  
00094962  ldr     r1, [r1]
00094964  blx     #0xddbfc ; -> objc_msgSend
00094968  ldr.w   r1, [pc, #0x794]
0009496c  ldr     r0, [sp, #0x38]
0009496e  ldr     r2, [sp, #0x3c]
00094970  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
00094972  ldr     r1, [r1]
00094974  blx     #0xddbfc ; -> objc_msgSend
00094978  ldr.w   r1, [pc, #0x788]
0009497c  ldr     r0, [sp, #0x38]
0009497e  add     r1, pc ; -> 0x000fce60  '8U\x0e'
00094980  ldr     r1, [r1]
00094982  blx     #0xddbfc ; -> objc_msgSend
00094986  tst.w   r0, #0xff
0009498a  bne     #0x94a02
0009498c  ldr.w   r0, [pc, #0x778]
00094990  movs    r3, #6
00094992  str     r3, [sp, #0xb4]
00094994  add     r0, pc ; -> 0x0017f394  
00094996  blx     #0xdd3e0 ; -> NSLog
0009499a  ldr.w   r1, [pc, #0x770]
0009499e  ldr     r4, [sp, #8]
000949a0  movs    r3, #6
000949a2  add     r1, pc ; -> 0x000fcf9c  
000949a4  adds    r4, #0x10
000949a6  ldr     r1, [r1]
000949a8  str     r4, [sp, #0xac]
000949aa  str     r3, [sp, #0xb4]
000949ac  ldr     r0, [sp, #0x3c]
000949ae  blx     #0xddbfc ; -> objc_msgSend
000949b2  mov     r1, r0
000949b4  ldr     r0, [sp, #0xac]
000949b6  bl      #0x8b870 ; -> ZN6Mayhem7Request11HandleErrorEPv
000949ba  ldr     r0, [sp, #0xac]
000949bc  movs    r1, #2
000949be  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
000949c2  ldr     r3, [sp, #0x11c]
000949c4  ldr     r2, [sp, #0xa4]
000949c6  sub.w   r0, r3, #0xc
000949ca  cmp     r2, r0
000949cc  bne.w   #0x94c3c
000949d0  ldr     r3, [sp, #0x120]
000949d2  ldr     r1, [sp, #0xa4]
000949d4  sub.w   r0, r3, #0xc
000949d8  cmp     r1, r0
000949da  bne.w   #0x94c10
000949de  add     r0, sp, #0xe4
000949e0  mov.w   r3, #-1
000949e4  str     r3, [sp, #0xb4]
000949e6  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
000949ea  add     r0, sp, #0xb0
000949ec  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
000949f0  sub.w   sp, r7, #0x58
000949f4  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
000949f8  sub.w   sp, r7, #0x18
000949fc  pop.w   {r8, sl, fp}
00094a00  pop     {r4, r5, r6, r7, pc}
00094a02  ldr.w   r3, [pc, #0x70c]
00094a06  ldr     r0, [sp, #0x3c]
00094a08  add     r3, pc ; -> 0x000fcf9c  
00094a0a  ldr     r3, [r3]
00094a0c  str     r3, [sp, #0x40]
00094a0e  mov     r1, r3
00094a10  blx     #0xddbfc ; -> objc_msgSend
00094a14  ldr.w   r3, [pc, #0x6fc]
00094a18  ldr.w   r2, [pc, #0x6fc]
00094a1c  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00094a1e  add     r2, pc ; -> 0x0017f374  
00094a20  ldr     r3, [r3]
00094a22  str     r3, [sp, #0x44]
00094a24  mov     r1, r3
00094a26  blx     #0xddbfc ; -> objc_msgSend
00094a2a  str     r0, [sp, #0x48]
00094a2c  cmp     r0, #0
00094a2e  bne     #0x9498c
00094a30  ldr     r0, [sp, #0x3c]
00094a32  ldr     r1, [sp, #0x40]
00094a34  blx     #0xddbfc ; -> objc_msgSend
00094a38  ldr.w   r2, [pc, #0x6e0]
00094a3c  ldr     r1, [sp, #0x44]
00094a3e  add     r2, pc ; -> 0x0017f384  
00094a40  blx     #0xddbfc ; -> objc_msgSend
00094a44  ldr.w   r3, [pc, #0x6d8]
00094a48  ldr     r2, [sp, #0x48]
00094a4a  add     r3, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00094a4c  ldr     r3, [r3]
00094a4e  str     r3, [sp, #0x4c]
00094a50  mov     r1, r3
00094a52  blx     #0xddbfc ; -> objc_msgSend
00094a56  ldr.w   r1, [pc, #0x6cc]
00094a5a  add     r1, pc ; -> 0x000fcfa0  
00094a5c  ldr     r1, [r1]
00094a5e  blx     #0xddbfc ; -> objc_msgSend
00094a62  ldr.w   r2, [pc, #0x6c4]
00094a66  ldr     r1, [sp, #0x44]
00094a68  add     r2, pc ; -> 0x0017f244  
00094a6a  blx     #0xddbfc ; -> objc_msgSend
00094a6e  ldr.w   r3, [pc, #0x6bc]
00094a72  movs    r2, #0
00094a74  str     r0, [sp, #0x50]
00094a76  add     r3, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
00094a78  str     r2, [sp, #0x6c]
00094a7a  ldr     r3, [r3]
00094a7c  str     r3, [sp, #0x54]
00094a7e  b       #0x94aca
00094a80  add     r0, sp, #0x108
00094a82  bl      #0x8ac54 ; -> ZN6Mayhem4UserC1Ev
00094a86  movs    r2, #6
00094a88  ldr     r0, [sp, #0x50]
00094a8a  str     r2, [sp, #0xb4]
00094a8c  ldr     r1, [sp, #0x4c]
00094a8e  ldr     r2, [sp, #0x6c]
00094a90  blx     #0xddbfc ; -> objc_msgSend
00094a94  ldr.w   r1, [pc, #0x698]
00094a98  add     r2, sp, #0x140
00094a9a  str     r0, [sp, #0x58]
00094a9c  movs    r3, #3
00094a9e  add     r1, pc ; -> 0x000e122c  
00094aa0  str     r3, [sp, #0xb4]
00094aa2  add     r0, sp, #0x110
00094aa4  adds    r2, #1
00094aa6  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00094aaa  movs    r3, #2
00094aac  add     r0, sp, #0x108
00094aae  str     r3, [sp, #0xb4]
00094ab0  ldr     r1, [sp, #0x58]
00094ab2  add     r2, sp, #0x110
00094ab4  bl      #0x929d8 ; -> ZN6Mayhem4User11FillFromXMLEPvRKSs
00094ab8  ldr     r3, [sp, #0x110]
00094aba  ldr     r2, [sp, #0xa4]
00094abc  sub.w   r0, r3, #0xc
00094ac0  cmp     r2, r0
00094ac2  bne     #0x94b88
00094ac4  ldr     r1, [sp, #0x6c]
00094ac6  adds    r1, #1
00094ac8  str     r1, [sp, #0x6c]
00094aca  movs    r3, #6
00094acc  ldr     r0, [sp, #0x50]
00094ace  str     r3, [sp, #0xb4]
00094ad0  ldr     r1, [sp, #0x54]
00094ad2  blx     #0xddbfc ; -> objc_msgSend
00094ad6  ldr     r4, [sp, #0x6c]
00094ad8  cmp     r0, r4
00094ada  bhi     #0x94a80
00094adc  ldr     r1, [sp, #8]
00094ade  ldr     r2, [r1, #0x70]
00094ae0  ldr     r3, [r1, #0x6c]
00094ae2  rsb     r3, r3, r2
00094ae6  lsrs    r3, r3, #2
00094ae8  beq     #0x94b76
00094aea  movs    r2, #0
00094aec  str     r2, [sp, #0x5c]
00094aee  str     r2, [sp, #0x70]
00094af0  b       #0x94b0e
00094af2  ldr     r1, [sp, #8]
00094af4  ldr     r3, [sp, #0x70]
00094af6  ldr     r4, [sp, #0x70]
00094af8  adds    r3, #1
00094afa  adds    r4, #1
00094afc  str     r3, [sp, #0x5c]
00094afe  str     r4, [sp, #0x70]
00094b00  ldr     r2, [r1, #0x70]
00094b02  ldr     r3, [r1, #0x6c]
00094b04  rsb     r3, r3, r2
00094b08  cmp.w   r4, r3, asr #2
00094b0c  bhs     #0x94b76
00094b0e  ldr     r4, [sp, #8]
00094b10  ldr     r1, [sp, #0x5c]
00094b12  ldr     r3, [r4, #4]
00094b14  lsls    r1, r1, #3
00094b16  str     r1, [sp, #0xa0]
00094b18  add.w   r0, r3, r1
00094b1c  ldr     r3, [r3, r1]
00094b1e  ldr     r2, [r3, #0xc]
00094b20  movs    r3, #6
00094b22  str     r3, [sp, #0xb4]
00094b24  blx     r2
00094b26  cmp     r0, #0
00094b28  bne     #0x94af2
00094b2a  ldr     r2, [r4, #0x6c]
00094b2c  ldr     r4, [sp, #0x5c]
00094b2e  lsls    r3, r4, #2
00094b30  add.w   r1, r2, r3
00094b34  ldr     r3, [r2, r3]
00094b36  ldr     r3, [r3, #-0xc]
00094b3a  cmp     r3, #0
00094b3c  beq     #0x94af2
00094b3e  ldr.w   r0, [pc, #0x5f4]
00094b42  add     r0, pc ; -> 0x00379be4  ZN6Mayhem4User14s_userDatabaseE
00094b44  bl      #0x8f3dc ; -> ZN6Mayhem12UserDatabase11GetUserInfoERKSs
00094b48  cmp     r0, #0
00094b4a  beq     #0x94af2
00094b4c  ldr     r1, [sp, #8]
00094b4e  ldr     r2, [sp, #0xa0]
00094b50  ldr     r3, [r1, #4]
00094b52  add     r3, r2
00094b54  str     r0, [r3, #4]
00094b56  b       #0x94af2
00094b58  ldr.w   r0, [pc, #0x5dc]
00094b5c  ldr.w   r1, [pc, #0x5dc]
00094b60  ldr.w   r3, [pc, #0x5dc]
00094b64  movs    r4, #7
00094b66  add     r0, pc ; -> 0x000e5938  ZZN6Mayhem18GetUserListRequest13DirectRequestEvE8__func__
00094b68  add     r1, pc ; -> 0x00175e70  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/Mayhem.mm'
00094b6a  add     r3, pc ; -> 0x00175ecc  'm_requestedIDList[i].length() > 0'
00094b6c  str     r4, [sp, #0xb4]
00094b6e  movw    r2, #0x512
00094b72  blx     #0xdd5cc ; -> assert_rtn
00094b76  ldr     r3, [sp, #8]
00094b78  movs    r1, #1
00094b7a  add.w   r0, r3, #0x10
00094b7e  movs    r3, #6
00094b80  str     r3, [sp, #0xb4]
00094b82  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00094b86  b       #0x949c2
00094b88  subs    r2, r3, #4
00094b8a  ldr     r3, [r3, #-0x4]
00094b8e  subs    r1, r3, #1
00094b90  dmb     ish
00094b94  mov     ip, r3
00094b96  ldrex   r4, [r2]
00094b9a  cmp     r4, r3
00094b9c  beq.w   #0x94d60
00094ba0  cmp     r4, ip
00094ba2  mov     r3, r4
00094ba4  bne     #0x94b8e
00094ba6  cmp     r4, #0
00094ba8  bgt     #0x94ac4
00094baa  add     r1, sp, #0x134
00094bac  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094bb0  b       #0x94ac4
00094bb2  subs    r2, r3, #4
00094bb4  ldr     r3, [r3, #-0x4]
00094bb8  subs    r1, r3, #1
00094bba  dmb     ish
00094bbe  mov     ip, r3
00094bc0  ldrex   r4, [r2]
00094bc4  cmp     r4, r3
00094bc6  beq.w   #0x94d4e
00094bca  cmp     r4, ip
00094bcc  mov     r3, r4
00094bce  bne     #0x94bb8
00094bd0  cmp     r4, #0
00094bd2  bgt.w   #0x94788
00094bd6  add     r1, sp, #0x13c
00094bd8  adds    r1, #1
00094bda  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094bde  b       #0x94788
00094be0  ldr     r4, [sp, #0x94]
00094be2  subs    r2, r4, #4
00094be4  ldr     r3, [r4, #-0x4]
00094be8  subs    r1, r3, #1
00094bea  dmb     ish
00094bee  mov     ip, r3
00094bf0  ldrex   lr, [r2]
00094bf4  cmp     lr, r3
00094bf6  beq.w   #0x94d3e
00094bfa  cmp     lr, ip
00094bfc  mov     r3, lr
00094bfe  bne     #0x94be8
00094c00  cmp.w   lr, #0
00094c04  bgt.w   #0x94732
00094c08  add     r1, sp, #0x140
00094c0a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094c0e  b       #0x94732
00094c10  subs    r2, r3, #4
00094c12  ldr     r3, [r3, #-0x4]
00094c16  subs    r1, r3, #1
00094c18  dmb     ish
00094c1c  mov     ip, r3
00094c1e  ldrex   r4, [r2]
00094c22  cmp     r4, r3
00094c24  beq.w   #0x94d2c
00094c28  cmp     r4, ip
00094c2a  mov     r3, r4
00094c2c  bne     #0x94c16
00094c2e  cmp     r4, #0
00094c30  bgt.w   #0x949de
00094c34  add     r1, sp, #0x130
00094c36  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094c3a  b       #0x949de
00094c3c  subs    r2, r3, #4
00094c3e  ldr     r3, [r3, #-0x4]
00094c42  subs    r1, r3, #1
00094c44  dmb     ish
00094c48  mov     ip, r3
00094c4a  ldrex   r4, [r2]
00094c4e  cmp     r4, r3
00094c50  beq     #0x94d1c
00094c52  cmp     r4, ip
00094c54  mov     r3, r4
00094c56  bne     #0x94c42
00094c58  cmp     r4, #0
00094c5a  bgt.w   #0x949d0
00094c5e  add.w   r1, sp, #0x132
00094c62  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094c66  b       #0x949d0
00094c68  subs    r2, r3, #4
00094c6a  ldr     r3, [r3, #-0x4]
00094c6e  subs    r1, r3, #1
00094c70  dmb     ish
00094c74  mov     ip, r3
00094c76  ldrex   r4, [r2]
00094c7a  cmp     r4, r3
00094c7c  beq     #0x94d0c
00094c7e  cmp     r4, ip
00094c80  mov     r3, r4
00094c82  bne     #0x94c6e
00094c84  cmp     r4, #0
00094c86  bgt.w   #0x948ac
00094c8a  add     r1, sp, #0x138
00094c8c  adds    r1, #1
00094c8e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094c92  b       #0x948ac
00094c94  subs    r2, r3, #4
00094c96  ldr     r3, [r3, #-0x4]
00094c9a  subs    r1, r3, #1
00094c9c  dmb     ish
00094ca0  mov     ip, r3
00094ca2  ldrex   r4, [r2]
00094ca6  cmp     r4, r3
00094ca8  beq     #0x94cfc
00094caa  cmp     r4, ip
00094cac  mov     r3, r4
00094cae  bne     #0x94c9a
00094cb0  cmp     r4, #0
00094cb2  bgt.w   #0x947b6
00094cb6  add     r1, sp, #0x138
00094cb8  adds    r1, #3
00094cba  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094cbe  b       #0x947b6
00094cc0  subs    r2, r3, #4
00094cc2  ldr     r3, [r3, #-0x4]
00094cc6  subs    r1, r3, #1
00094cc8  dmb     ish
00094ccc  mov     ip, r3
00094cce  ldrex   r4, [r2]
00094cd2  cmp     r4, r3
00094cd4  beq     #0x94cec
00094cd6  cmp     r4, ip
00094cd8  mov     r3, r4
00094cda  bne     #0x94cc6
00094cdc  cmp     r4, #0
00094cde  bgt.w   #0x948ba
00094ce2  add.w   r1, sp, #0x136
00094ce6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094cea  b       #0x948ba
00094cec  strex   lr, r1, [r2]
00094cf0  cmp.w   lr, #0
00094cf4  bne     #0x94cce
00094cf6  dmb     ish
00094cfa  b       #0x94cd6
00094cfc  strex   lr, r1, [r2]
00094d00  cmp.w   lr, #0
00094d04  bne     #0x94ca2
00094d06  dmb     ish
00094d0a  b       #0x94caa
00094d0c  strex   lr, r1, [r2]
00094d10  cmp.w   lr, #0
00094d14  bne     #0x94c76
00094d16  dmb     ish
00094d1a  b       #0x94c7e
00094d1c  strex   lr, r1, [r2]
00094d20  cmp.w   lr, #0
00094d24  bne     #0x94c4a
00094d26  dmb     ish
00094d2a  b       #0x94c52
00094d2c  strex   lr, r1, [r2]
00094d30  cmp.w   lr, #0
00094d34  bne.w   #0x94c1e
00094d38  dmb     ish
00094d3c  b       #0x94c28
00094d3e  strex   r4, r1, [r2]
00094d42  cmp     r4, #0
00094d44  bne.w   #0x94bf0
00094d48  dmb     ish
00094d4c  b       #0x94bfa
00094d4e  strex   lr, r1, [r2]
00094d52  cmp.w   lr, #0
00094d56  bne.w   #0x94bc0
00094d5a  dmb     ish
00094d5e  b       #0x94bca
00094d60  strex   lr, r1, [r2]
00094d64  cmp.w   lr, #0
00094d68  bne.w   #0x94b96
00094d6c  dmb     ish
00094d70  b       #0x94ba0
00094d72  ldr     r3, [sp, #0xb4]
00094d74  ldr.w   lr, [sp, #0xb8]
00094d78  cmp     r3, #1
00094d7a  str.w   lr, [sp]
00094d7e  beq.w   #0x94f0a
00094d82  cmp     r3, #2
00094d84  beq     #0x94ddc
00094d86  cmp     r3, #3
00094d88  beq.w   #0x94eaa
00094d8c  cmp     r3, #4
00094d8e  beq     #0x94dc8
00094d90  cmp     r3, #5
00094d92  beq     #0x94ddc
00094d94  cmp     r3, #6
00094d96  beq     #0x94df0
00094d98  cmp     r3, #7
00094d9a  beq.w   #0x94f36
00094d9e  cmp     r3, #8
00094da0  beq     #0x94e04
00094da2  cmp     r3, #9
00094da4  beq.w   #0x94f20
00094da8  cmp     r3, #0xa
00094daa  beq     #0x94e0e
00094dac  cmp     r3, #0xb
00094dae  beq.w   #0x94fdc
00094db2  ldr     r3, [sp, #0x114]
00094db4  ldr     r2, [sp, #0xa4]
00094db6  str.w   lr, [sp, #0xa8]
00094dba  sub.w   r0, r3, #0xc
00094dbe  cmp     r2, r0
00094dc0  bne.w   #0x95000
00094dc4  ldr     r1, [sp, #0xa8]
00094dc6  str     r1, [sp]
00094dc8  ldr     r3, [sp, #0x118]
00094dca  ldr     r4, [sp, #0xa4]
00094dcc  ldr     r2, [sp]
00094dce  sub.w   r0, r3, #0xc
00094dd2  cmp     r4, r0
00094dd4  str     r2, [sp, #0x84]
00094dd6  bne     #0x94e7e
00094dd8  ldr     r1, [sp, #0x84]
00094dda  str     r1, [sp]
00094ddc  ldr     r3, [sp, #0x11c]
00094dde  ldr     r2, [sp, #0xa4]
00094de0  ldr     r1, [sp]
00094de2  sub.w   r0, r3, #0xc
00094de6  cmp     r2, r0
00094de8  str     r1, [sp, #0x8c]
00094dea  bne     #0x94e46
00094dec  ldr     r1, [sp, #0x8c]
00094dee  str     r1, [sp]
00094df0  ldr     r3, [sp, #0x120]
00094df2  ldr     r4, [sp, #0xa4]
00094df4  ldr     r2, [sp]
00094df6  sub.w   r0, r3, #0xc
00094dfa  cmp     r4, r0
00094dfc  str     r2, [sp, #0x90]
00094dfe  bne     #0x94e1a
00094e00  ldr     r1, [sp, #0x90]
00094e02  str     r1, [sp]
00094e04  add     r0, sp, #0xe4
00094e06  movs    r3, #0
00094e08  str     r3, [sp, #0xb4]
00094e0a  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
00094e0e  ldr     r0, [sp]
00094e10  mov.w   r3, #-1
00094e14  str     r3, [sp, #0xb4]
00094e16  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00094e1a  subs    r2, r3, #4
00094e1c  ldr     r3, [r3, #-0x4]
00094e20  subs    r1, r3, #1
00094e22  dmb     ish
00094e26  mov     ip, r3
00094e28  ldrex   lr, [r2]
00094e2c  cmp     lr, r3
00094e2e  beq     #0x94e70
00094e30  cmp     lr, ip
00094e32  mov     r3, lr
00094e34  bne     #0x94e20
00094e36  cmp.w   lr, #0
00094e3a  bgt     #0x94e00
00094e3c  add     r1, sp, #0x130
00094e3e  adds    r1, #1
00094e40  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094e44  b       #0x94e00
00094e46  subs    r2, r3, #4
00094e48  ldr     r3, [r3, #-0x4]
00094e4c  subs    r1, r3, #1
00094e4e  dmb     ish
00094e52  mov     ip, r3
00094e54  ldrex   r4, [r2]
00094e58  cmp     r4, r3
00094e5a  beq     #0x94ec0
00094e5c  cmp     r4, ip
00094e5e  mov     r3, r4
00094e60  bne     #0x94e4c
00094e62  cmp     r4, #0
00094e64  bgt     #0x94dec
00094e66  add     r1, sp, #0x130
00094e68  adds    r1, #3
00094e6a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094e6e  b       #0x94dec
00094e70  strex   r4, r1, [r2]
00094e74  cmp     r4, #0
00094e76  bne     #0x94e28
00094e78  dmb     ish
00094e7c  b       #0x94e30
00094e7e  subs    r2, r3, #4
00094e80  ldr     r3, [r3, #-0x4]
00094e84  subs    r1, r3, #1
00094e86  dmb     ish
00094e8a  mov     ip, r3
00094e8c  ldrex   lr, [r2]
00094e90  cmp     lr, r3
00094e92  beq     #0x94ed0
00094e94  cmp     lr, ip
00094e96  mov     r3, lr
00094e98  bne     #0x94e84
00094e9a  cmp.w   lr, #0
00094e9e  bgt     #0x94dd8
00094ea0  add     r1, sp, #0x134
00094ea2  adds    r1, #3
00094ea4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094ea8  b       #0x94dd8
00094eaa  ldr     r3, [sp, #0x114]
00094eac  ldr     r4, [sp, #0xa4]
00094eae  ldr     r2, [sp]
00094eb0  sub.w   r0, r3, #0xc
00094eb4  cmp     r4, r0
00094eb6  str     r2, [sp, #0x80]
00094eb8  bne     #0x94ede
00094eba  ldr     r1, [sp, #0x80]
00094ebc  str     r1, [sp]
00094ebe  b       #0x94dc8
00094ec0  strex   lr, r1, [r2]
00094ec4  cmp.w   lr, #0
00094ec8  bne     #0x94e54
00094eca  dmb     ish
00094ece  b       #0x94e5c
00094ed0  strex   r4, r1, [r2]
00094ed4  cmp     r4, #0
00094ed6  bne     #0x94e8c
00094ed8  dmb     ish
00094edc  b       #0x94e94
00094ede  subs    r2, r3, #4
00094ee0  ldr     r3, [r3, #-0x4]
00094ee4  subs    r1, r3, #1
00094ee6  dmb     ish
00094eea  mov     ip, r3
00094eec  ldrex   lr, [r2]
00094ef0  cmp     lr, r3
00094ef2  beq.w   #0x9508a
00094ef6  cmp     lr, ip
00094ef8  mov     r3, lr
00094efa  bne     #0x94ee4
00094efc  cmp.w   lr, #0
00094f00  bgt     #0x94eba
00094f02  add     r1, sp, #0x138
00094f04  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094f08  b       #0x94eba
00094f0a  ldr     r3, [sp]
00094f0c  ldr     r4, [sp, #0xa4]
00094f0e  str     r3, [sp, #0x88]
00094f10  ldr     r3, [sp, #0x110]
00094f12  sub.w   r0, r3, #0xc
00094f16  cmp     r4, r0
00094f18  bne     #0x94f4c
00094f1a  ldr     r1, [sp, #0x88]
00094f1c  str     r1, [sp]
00094f1e  b       #0x94ddc
00094f20  ldr     r3, [sp, #0x128]
00094f22  ldr     r4, [sp, #0xa4]
00094f24  ldr     r2, [sp]
00094f26  sub.w   r0, r3, #0xc
00094f2a  cmp     r4, r0
00094f2c  str     r2, [sp, #0x78]
00094f2e  bne     #0x94f7a
00094f30  ldr     r1, [sp, #0x78]
00094f32  str     r1, [sp]
00094f34  b       #0x94e0e
00094f36  ldr     r3, [sp, #0x124]
00094f38  ldr     r2, [sp, #0xa4]
00094f3a  ldr     r1, [sp]
00094f3c  sub.w   r0, r3, #0xc
00094f40  cmp     r2, r0
00094f42  str     r1, [sp, #0x7c]
00094f44  bne     #0x94fa6
00094f46  ldr     r1, [sp, #0x7c]
00094f48  str     r1, [sp]
00094f4a  b       #0x94e04
00094f4c  subs    r2, r3, #4
00094f4e  ldr     r3, [r3, #-0x4]
00094f52  subs    r1, r3, #1
00094f54  dmb     ish
00094f58  mov     ip, r3
00094f5a  ldrex   lr, [r2]
00094f5e  cmp     lr, r3
00094f60  beq.w   #0x9506a
00094f64  cmp     lr, ip
00094f66  mov     r3, lr
00094f68  bne     #0x94f52
00094f6a  cmp.w   lr, #0
00094f6e  bgt     #0x94f1a
00094f70  add     r1, sp, #0x134
00094f72  adds    r1, #1
00094f74  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094f78  b       #0x94f1a
00094f7a  subs    r2, r3, #4
00094f7c  ldr     r3, [r3, #-0x4]
00094f80  subs    r1, r3, #1
00094f82  dmb     ish
00094f86  mov     ip, r3
00094f88  ldrex   lr, [r2]
00094f8c  cmp     lr, r3
00094f8e  beq     #0x94fce
00094f90  cmp     lr, ip
00094f92  mov     r3, lr
00094f94  bne     #0x94f80
00094f96  cmp.w   lr, #0
00094f9a  bgt     #0x94f30
00094f9c  add.w   r1, sp, #0x13e
00094fa0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094fa4  b       #0x94f30
00094fa6  subs    r2, r3, #4
00094fa8  ldr     r3, [r3, #-0x4]
00094fac  subs    r1, r3, #1
00094fae  dmb     ish
00094fb2  mov     ip, r3
00094fb4  ldrex   r4, [r2]
00094fb8  cmp     r4, r3
00094fba  beq     #0x9507a
00094fbc  cmp     r4, ip
00094fbe  mov     r3, r4
00094fc0  bne     #0x94fac
00094fc2  cmp     r4, #0
00094fc4  bgt     #0x94f46
00094fc6  add     r1, sp, #0x13c
00094fc8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094fcc  b       #0x94f46
00094fce  strex   r4, r1, [r2]
00094fd2  cmp     r4, #0
00094fd4  bne     #0x94f88
00094fd6  dmb     ish
00094fda  b       #0x94f90
00094fdc  ldr     r3, [pc, #0x164]
00094fde  ldr     r2, [sp, #0x94]
00094fe0  ldr     r1, [sp]
00094fe2  add     r3, pc ; -> 0x000f3370  0x0
00094fe4  sub.w   r0, r2, #0xc
00094fe8  ldr     r3, [r3]
00094fea  str     r1, [sp, #0x74]
00094fec  cmp     r0, r3
00094fee  bne     #0x9502c
00094ff0  ldr     r1, [sp, #0x74]
00094ff2  mov.w   r3, #-1
00094ff6  str     r3, [sp, #0xb4]
00094ff8  mov     r0, r1
00094ffa  str     r1, [sp]
00094ffc  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00095000  subs    r2, r3, #4
00095002  ldr     r3, [r3, #-0x4]
00095006  subs    r1, r3, #1
00095008  dmb     ish
0009500c  mov     ip, r3
0009500e  ldrex   r4, [r2]
00095012  cmp     r4, r3
00095014  beq     #0x9505a
00095016  cmp     r4, ip
00095018  mov     r3, r4
0009501a  bne     #0x95006
0009501c  cmp     r4, #0
0009501e  bgt.w   #0x94dc4
00095022  add.w   r1, sp, #0x13a
00095026  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009502a  b       #0x94dc4
0009502c  ldr     r4, [sp, #0x94]
0009502e  subs    r2, #4
00095030  ldr     r3, [r4, #-0x4]
00095034  subs    r1, r3, #1
00095036  dmb     ish
0009503a  mov     ip, r3
0009503c  ldrex   lr, [r2]
00095040  cmp     lr, r3
00095042  beq     #0x9509a
00095044  cmp     lr, ip
00095046  mov     r3, lr
00095048  bne     #0x95034
0009504a  cmp.w   lr, #0
0009504e  bgt     #0x94ff0
00095050  add     r1, sp, #0x13c
00095052  adds    r1, #3
00095054  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00095058  b       #0x94ff0
0009505a  strex   lr, r1, [r2]
0009505e  cmp.w   lr, #0
00095062  bne     #0x9500e
00095064  dmb     ish
00095068  b       #0x95016
0009506a  strex   r4, r1, [r2]
0009506e  cmp     r4, #0
00095070  bne.w   #0x94f5a
00095074  dmb     ish
00095078  b       #0x94f64
0009507a  strex   lr, r1, [r2]
0009507e  cmp.w   lr, #0
00095082  bne     #0x94fb4
00095084  dmb     ish
00095088  b       #0x94fbc
0009508a  strex   r4, r1, [r2]
0009508e  cmp     r4, #0
00095090  bne.w   #0x94eec
00095094  dmb     ish
00095098  b       #0x94ef6
0009509a  strex   r4, r1, [r2]
0009509e  cmp     r4, #0
000950a0  bne     #0x9503c
000950a2  dmb     ish
000950a6  b       #0x95044
000950a8  ldcl    p0, c0, [sl, #-0x14]!
000950ac  ldr     r5, [sp, #0x390]
000950ae  movs    r5, r0
000950b0  lsls    r4, r3, #0x1a
000950b2  movs    r0, r0
000950b4  str     r4, [sp, #0x1c0]
000950b6  movs    r6, r0
000950b8  add     r4, sp, #0x1d8
000950ba  movs    r6, r1
000950bc  strh    r6, [r4, #0x1c]
000950be  movs    r6, r0
000950c0  mcrr    p0, #0, r0, r6, c5
000950c4  ldrh    r4, [r5]
000950c6  movs    r6, r0
000950c8  ldrh    r2, [r2]
000950ca  movs    r6, r0
000950cc  asrs    r0, r2, #0x1b
000950ce  movs    r6, r1
000950d0  asrs    r4, r3, #0x19
000950d2  movs    r6, r1
000950d4  asrs    r6, r1, #0x1a
000950d6  movs    r6, r1
000950d8  asrs    r0, r2, #0x1a
000950da  movs    r6, r1
000950dc  asrs    r2, r0, #0x1a
000950de  movs    r6, r1
000950e0  strh    r4, [r5, #4]
000950e2  movs    r6, r0
000950e4  strh    r0, [r1, #0x36]
000950e6  movs    r6, r0
000950e8  strh    r0, [r2, #0xa]
000950ea  movs    r6, r0
000950ec  strh    r0, [r7, #0x32]
000950ee  movs    r6, r0
000950f0  strh    r6, [r4, #0x1e]
000950f2  movs    r6, r0
000950f4  str     r2, [sp, #0x318]
000950f6  movs    r6, r0
000950f8  strh    r4, [r3, #0x28]
000950fa  movs    r6, r0
000950fc  strh    r0, [r0, #0x32]
000950fe  movs    r6, r0
00095100  strh    r4, [r0, #0x18]
00095102  movs    r6, r0
00095104  strh    r6, [r3, #0x26]
00095106  movs    r6, r0
00095108  add     r1, sp, #0x3f0
0009510a  movs    r6, r1
0009510c  strh    r6, [r6, #0x2e]
0009510e  movs    r6, r0
00095110  strh    r0, [r2, #0x2c]
00095112  movs    r6, r0
00095114  strh    r4, [r6, #4]
00095116  movs    r6, r0
00095118  add     r1, sp, #0x148
0009511a  movs    r6, r1
0009511c  add     r1, sp, #0x108
0009511e  movs    r6, r1
00095120  strh    r6, [r5]
00095122  movs    r6, r0
00095124  strh    r2, [r0, #0x2a]
00095126  movs    r6, r0
00095128  adr     r7, #0x360
0009512a  movs    r6, r1
0009512c  strh    r6, [r0]
0009512e  movs    r6, r0
00095130  stm     r7!, {r1, r3, r7}
00095132  movs    r4, r0
00095134  str     r6, [r3, r2]
00095136  movs    r6, r5
00095138  lsrs    r6, r1, #0x17
0009513a  movs    r5, r0
0009513c  asrs    r4, r0, #0xc
0009513e  movs    r6, r1
00095140  asrs    r6, r3, #0xd
00095142  movs    r6, r1
00095144  b       #0x9585c
00095146  movs    r5, r0
