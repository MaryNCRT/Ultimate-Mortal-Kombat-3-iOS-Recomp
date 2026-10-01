========================================================================
ZN6Mayhem11HTTPRequest9DoRequestEv  0x0008f6f0  1920 bytes   Mayhem.mm
========================================================================

0008f6f0  push    {r4, r5, r6, r7, lr}
0008f6f2  add     r7, sp, #0xc
0008f6f4  push.w  {r8, sl, fp}
0008f6f8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008f6fc  sub     sp, #0xfc
0008f6fe  ldr.w   r3, [pc, #0x6e8]
0008f702  str     r0, [sp, #4]
0008f704  add     r0, sp, #0x98
0008f706  add     r3, pc ; -> 0x000f3438  0x0
0008f708  str     r7, [sp, #0xb8]
0008f70a  ldr     r3, [r3]
0008f70c  str.w   sp, [sp, #0xc0]
0008f710  str     r3, [sp, #0xb0]
0008f712  ldr.w   r3, [pc, #0x6d8]
0008f716  add     r3, pc ; -> 0x000ee3bc  GCC_except_table67
0008f718  str     r3, [sp, #0xb4]
0008f71a  ldr.w   r3, [pc, #0x6d4]
0008f71e  add     r3, pc ; -> 0x0008fbfe  
0008f720  orr     r3, r3, #1
0008f724  str     r3, [sp, #0xbc]
0008f726  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008f72a  ldr     r0, [sp, #4]
0008f72c  ldr     r0, [r0]
0008f72e  str     r0, [sp, #0x54]
0008f730  ldr     r3, [r0, #-0xc]
0008f734  cmp     r3, #0
0008f736  beq.w   #0x8faf6
0008f73a  ldr     r2, [sp, #4]
0008f73c  ldr     r3, [r2, #4]
0008f73e  ldr     r3, [r3, #-0xc]
0008f742  cmp     r3, #0
0008f744  beq.w   #0x8fb3c
0008f748  ldr.w   r3, [pc, #0x6a8]
0008f74c  add     r3, pc ; -> 0x000fdb5c  
0008f74e  ldr     r3, [r3]
0008f750  str     r3, [sp, #8]
0008f752  ldr.w   r3, [pc, #0x6a4]
0008f756  ldr     r0, [sp, #8]
0008f758  add     r3, pc ; -> 0x000fcfc4  
0008f75a  ldr     r3, [r3]
0008f75c  str     r3, [sp, #0xc]
0008f75e  ldr.w   r3, [pc, #0x69c]
0008f762  add     r3, pc ; -> 0x000fcf58  
0008f764  ldr     r3, [r3]
0008f766  str     r3, [sp, #0x10]
0008f768  ldr     r1, [sp, #0x10]
0008f76a  mov.w   r3, #-1
0008f76e  str     r3, [sp, #0x9c]
0008f770  blx     #0xddbfc ; -> objc_msgSend
0008f774  ldr     r2, [sp, #0x54]
0008f776  ldr     r1, [sp, #0xc]
0008f778  mov     r3, r0
0008f77a  ldr     r0, [sp, #8]
0008f77c  blx     #0xddbfc ; -> objc_msgSend
0008f780  ldr     r3, [sp, #4]
0008f782  ldr     r1, [sp, #0x10]
0008f784  str     r0, [sp, #0x14]
0008f786  ldr     r3, [r3, #4]
0008f788  ldr     r0, [sp, #8]
0008f78a  str     r3, [sp, #0x58]
0008f78c  blx     #0xddbfc ; -> objc_msgSend
0008f790  ldr     r2, [sp, #0x58]
0008f792  ldr     r1, [sp, #0xc]
0008f794  mov     r3, r0
0008f796  ldr     r0, [sp, #8]
0008f798  blx     #0xddbfc ; -> objc_msgSend
0008f79c  ldr.w   r1, [pc, #0x660]
0008f7a0  add     r1, pc ; -> 0x000fcfe8  
0008f7a2  ldr     r1, [r1]
0008f7a4  str     r0, [sp, #0x18]
0008f7a6  ldr.w   r0, [pc, #0x65c]
0008f7aa  add     r0, pc ; -> 0x000fdbe4  
0008f7ac  ldr     r0, [r0]
0008f7ae  blx     #0xddbfc ; -> objc_msgSend
0008f7b2  ldr.w   r3, [pc, #0x654]
0008f7b6  add     r3, pc ; -> 0x000fca58  '\x14\t\x0e'
0008f7b8  ldr     r3, [r3]
0008f7ba  mov     r1, r3
0008f7bc  str     r3, [sp, #0x1c]
0008f7be  blx     #0xddbfc ; -> objc_msgSend
0008f7c2  ldr.w   r3, [pc, #0x648]
0008f7c6  ldr.w   r1, [pc, #0x648]
0008f7ca  ldr     r2, [sp, #0x14]
0008f7cc  add     r3, pc ; -> 0x000fcfc0  
0008f7ce  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
0008f7d0  ldr     r3, [r3]
0008f7d2  ldr     r1, [r1]
0008f7d4  str     r3, [sp, #0x24]
0008f7d6  str     r0, [sp, #0x44]
0008f7d8  str     r0, [sp, #0x20]
0008f7da  ldr.w   r0, [pc, #0x638]
0008f7de  add     r0, pc ; -> 0x000fdb64  
0008f7e0  ldr     r0, [r0]
0008f7e2  blx     #0xddbfc ; -> objc_msgSend
0008f7e6  ldr     r1, [sp, #0x24]
0008f7e8  mov     r2, r0
0008f7ea  ldr     r0, [sp, #0x44]
0008f7ec  blx     #0xddbfc ; -> objc_msgSend
0008f7f0  ldr.w   r1, [pc, #0x624]
0008f7f4  ldr     r0, [sp, #0x44]
0008f7f6  ldr     r2, [sp, #0x18]
0008f7f8  add     r1, pc ; -> 0x000fcbe0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x268
0008f7fa  ldr     r1, [r1]
0008f7fc  blx     #0xddbfc ; -> objc_msgSend
0008f800  ldr.w   r1, [pc, #0x618]
0008f804  movs    r3, #6
0008f806  add     r0, sp, #0xec
0008f808  add     r1, pc ; -> 0x00175ddc  'mh_client_version'
0008f80a  str     r3, [sp, #0x9c]
0008f80c  add.w   r2, sp, #0xfb
0008f810  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008f814  ldr     r4, [sp, #4]
0008f816  add     r1, sp, #0xec
0008f818  add.w   r0, r4, #8
0008f81c  bl      #0x9b59c ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE11lower_boundERS1_
0008f820  add.w   r3, r4, #0xc
0008f824  cmp     r0, r3
0008f826  str     r0, [sp, #0x88]
0008f828  beq.w   #0x8fa08
0008f82c  ldr     r3, [sp, #0xec]
0008f82e  str     r0, [sp, #0x8c]
0008f830  add.w   r1, r0, #0x10
0008f834  ldr     r3, [r3, #-0xc]
0008f838  str     r3, [sp, #0xd8]
0008f83a  ldr     r2, [r0, #0x10]
0008f83c  ldr     r0, [sp, #0xec]
0008f83e  ldr     r2, [r2, #-0xc]
0008f842  str     r3, [sp, #0x74]
0008f844  cmp     r2, r3
0008f846  str     r2, [sp, #0x70]
0008f848  str     r2, [sp, #0xd4]
0008f84a  ite     lo
0008f84c  addlo   r2, sp, #0xd4
0008f84e  addhs   r2, sp, #0xd8
0008f850  ldr     r1, [r1]
0008f852  ldr     r2, [r2]
0008f854  blx     #0xddb90 ; -> memcmp
0008f858  cbnz    r0, #0x8f866
0008f85a  ldr     r2, [sp, #0x70]
0008f85c  ldr     r3, [sp, #0x74]
0008f85e  cmp     r2, r3
0008f860  bhs.w   #0x8faa6
0008f864  adds    r0, #1
0008f866  cmp     r0, #0
0008f868  blt.w   #0x8fa08
0008f86c  movs    r3, #5
0008f86e  add     r0, sp, #0xe8
0008f870  str     r3, [sp, #0x9c]
0008f872  bl      #0x8d4c8 ; -> ZN6Mayhem22getMayhemVersionStringEv
0008f876  ldr     r3, [sp, #0x8c]
0008f878  add     r1, sp, #0xe8
0008f87a  add.w   r0, r3, #0x14
0008f87e  movs    r3, #4
0008f880  str     r3, [sp, #0x9c]
0008f882  blx     #0xdd518 ; -> ZNSs6assignERKSs
0008f886  ldr.w   r3, [pc, #0x598]
0008f88a  ldr     r2, [sp, #0xe8]
0008f88c  add     r3, pc ; -> 0x000f3370  0x0
0008f88e  sub.w   r0, r2, #0xc
0008f892  ldr     r3, [r3]
0008f894  cmp     r0, r3
0008f896  str     r3, [sp, #0x7c]
0008f898  bne.w   #0x8faca
0008f89c  ldr     r3, [sp, #0xec]
0008f89e  ldr     r2, [sp, #0x7c]
0008f8a0  sub.w   r0, r3, #0xc
0008f8a4  cmp     r2, r0
0008f8a6  bne.w   #0x8fb12
0008f8aa  ldr     r2, [sp, #4]
0008f8ac  ldr     r0, [sp, #4]
0008f8ae  adds    r0, #0xc
0008f8b0  str     r0, [sp, #0x80]
0008f8b2  ldr     r2, [r2, #0x14]
0008f8b4  cmp     r2, r0
0008f8b6  str     r2, [sp, #0x84]
0008f8b8  beq     #0x8f922
0008f8ba  ldr.w   r3, [pc, #0x568]
0008f8be  add     r3, pc ; -> 0x000fcfbc  
0008f8c0  ldr     r3, [r3]
0008f8c2  str     r3, [sp, #0x2c]
0008f8c4  ldr     r3, [sp, #0x84]
0008f8c6  str     r3, [sp, #0x90]
0008f8c8  b       #0x8f8cc
0008f8ca  str     r0, [sp, #0x90]
0008f8cc  ldr     r4, [sp, #0x90]
0008f8ce  ldr     r1, [sp, #0x10]
0008f8d0  ldr     r0, [sp, #8]
0008f8d2  mov.w   r3, #-1
0008f8d6  ldr     r4, [r4, #0x10]
0008f8d8  str     r3, [sp, #0x9c]
0008f8da  str     r4, [sp, #0x5c]
0008f8dc  blx     #0xddbfc ; -> objc_msgSend
0008f8e0  ldr     r2, [sp, #0x5c]
0008f8e2  ldr     r1, [sp, #0xc]
0008f8e4  mov     r3, r0
0008f8e6  ldr     r0, [sp, #8]
0008f8e8  blx     #0xddbfc ; -> objc_msgSend
0008f8ec  ldr     r1, [sp, #0x10]
0008f8ee  str     r0, [sp, #0x28]
0008f8f0  ldr     r0, [sp, #0x90]
0008f8f2  ldr     r0, [r0, #0x14]
0008f8f4  str     r0, [sp, #0x60]
0008f8f6  ldr     r0, [sp, #8]
0008f8f8  blx     #0xddbfc ; -> objc_msgSend
0008f8fc  ldr     r1, [sp, #0xc]
0008f8fe  ldr     r2, [sp, #0x60]
0008f900  mov     r3, r0
0008f902  ldr     r0, [sp, #8]
0008f904  blx     #0xddbfc ; -> objc_msgSend
0008f908  ldr     r1, [sp, #0x2c]
0008f90a  ldr     r3, [sp, #0x28]
0008f90c  mov     r2, r0
0008f90e  ldr     r0, [sp, #0x20]
0008f910  blx     #0xddbfc ; -> objc_msgSend
0008f914  ldr     r0, [sp, #0x84]
0008f916  blx     #0xdd56c ; -> ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base
0008f91a  ldr     r2, [sp, #0x80]
0008f91c  cmp     r0, r2
0008f91e  str     r0, [sp, #0x84]
0008f920  bne     #0x8f8ca
0008f922  ldr     r3, [sp, #4]
0008f924  ldr     r1, [sp, #0xc]
0008f926  ldr     r0, [sp, #8]
0008f928  ldr     r2, [r3, #0x20]
0008f92a  mov.w   r3, #-1
0008f92e  str     r3, [sp, #0x9c]
0008f930  adds    r3, #5
0008f932  blx     #0xddbfc ; -> objc_msgSend
0008f936  ldr.w   r1, [pc, #0x4f0]
0008f93a  movs    r2, #4
0008f93c  add     r1, pc ; -> 0x000fcd10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x398
0008f93e  ldr     r1, [r1]
0008f940  blx     #0xddbfc ; -> objc_msgSend
0008f944  ldr.w   r1, [pc, #0x4e4]
0008f948  add     r1, pc ; -> 0x000fcbd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x25c
0008f94a  ldr     r1, [r1]
0008f94c  mov     r2, r0
0008f94e  ldr     r0, [sp, #0x20]
0008f950  blx     #0xddbfc ; -> objc_msgSend
0008f954  movs    r3, #0
0008f956  str     r3, [sp, #0xe4]
0008f958  ldr.w   r3, [pc, #0x4d4]
0008f95c  ldr.w   r0, [pc, #0x4d4]
0008f960  add     r3, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008f962  add     r0, pc ; -> 0x000fdc04  
0008f964  ldr     r3, [r3]
0008f966  ldr     r0, [r0]
0008f968  mov     r1, r3
0008f96a  str     r3, [sp, #0x30]
0008f96c  blx     #0xddbfc ; -> objc_msgSend
0008f970  ldr.w   r1, [pc, #0x4c4]
0008f974  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0008f976  ldr     r1, [r1]
0008f978  blx     #0xddbfc ; -> objc_msgSend
0008f97c  ldr     r1, [sp, #0x1c]
0008f97e  blx     #0xddbfc ; -> objc_msgSend
0008f982  ldr.w   r1, [pc, #0x4b8]
0008f986  ldr     r2, [sp, #0x44]
0008f988  add     r3, sp, #0xe0
0008f98a  add     r1, pc ; -> 0x000fcfb8  'vU\x0e'
0008f98c  str     r3, [sp]
0008f98e  ldr     r1, [r1]
0008f990  add     r3, sp, #0xe4
0008f992  str     r0, [sp, #0xe0]
0008f994  ldr.w   r0, [pc, #0x4a8]
0008f998  add     r0, pc ; -> 0x000fdc08  
0008f99a  ldr     r0, [r0]
0008f99c  blx     #0xddbfc ; -> objc_msgSend
0008f9a0  ldr     r1, [sp, #0x30]
0008f9a2  str     r0, [sp, #0x48]
0008f9a4  ldr     r0, [sp, #8]
0008f9a6  blx     #0xddbfc ; -> objc_msgSend
0008f9aa  ldr.w   r3, [pc, #0x498]
0008f9ae  ldr     r1, [sp, #0x10]
0008f9b0  add     r3, pc ; -> 0x000fcfb4  '_U\x0e'
0008f9b2  ldr     r3, [r3]
0008f9b4  str     r3, [sp, #0x38]
0008f9b6  str     r0, [sp, #0x34]
0008f9b8  ldr     r0, [sp, #8]
0008f9ba  blx     #0xddbfc ; -> objc_msgSend
0008f9be  ldr     r2, [sp, #0x48]
0008f9c0  ldr     r1, [sp, #0x38]
0008f9c2  mov     r3, r0
0008f9c4  ldr     r0, [sp, #0x34]
0008f9c6  blx     #0xddbfc ; -> objc_msgSend
0008f9ca  ldr     r1, [sp, #0x1c]
0008f9cc  blx     #0xddbfc ; -> objc_msgSend
0008f9d0  ldr.w   r3, [pc, #0x474]
0008f9d4  ldr     r0, [sp, #0xe4]
0008f9d6  add     r3, pc ; -> 0x000fcfb0  'TU\x0e'
0008f9d8  ldr     r3, [r3]
0008f9da  mov     r1, r3
0008f9dc  str     r3, [sp, #0x3c]
0008f9de  blx     #0xddbfc ; -> objc_msgSend
0008f9e2  cmp     r0, #0xc7
0008f9e4  bgt     #0x8fab4
0008f9e6  mov.w   lr, #0
0008f9ea  str.w   lr, [sp, #0x40]
0008f9ee  add     r0, sp, #0x98
0008f9f0  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008f9f4  ldr     r0, [sp, #0x40]
0008f9f6  sub.w   sp, r7, #0x58
0008f9fa  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008f9fe  sub.w   sp, r7, #0x18
0008fa02  pop.w   {r8, sl, fp}
0008fa06  pop     {r4, r5, r6, r7, pc}
0008fa08  ldr.w   r3, [pc, #0x440]
0008fa0c  add     r0, sp, #0xcc
0008fa0e  add     r1, sp, #0xec
0008fa10  add     r3, pc ; -> 0x000f3370  0x0
0008fa12  ldr     r3, [r3]
0008fa14  str     r3, [sp, #0x64]
0008fa16  adds    r3, #0xc
0008fa18  str     r3, [sp, #0xdc]
0008fa1a  movs    r3, #3
0008fa1c  str     r3, [sp, #0x9c]
0008fa1e  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008fa22  movs    r3, #1
0008fa24  add     r0, sp, #0xd0
0008fa26  str     r3, [sp, #0x9c]
0008fa28  add     r1, sp, #0xdc
0008fa2a  blx     #0xdd53c ; -> ZNSsC1ERKSs
0008fa2e  ldr     r2, [sp, #4]
0008fa30  movs    r3, #2
0008fa32  ldr     r1, [sp, #0x88]
0008fa34  add.w   r0, r2, #8
0008fa38  str     r3, [sp, #0x9c]
0008fa3a  add     r2, sp, #0xcc
0008fa3c  bl      #0x9bdcc ; -> ZNSt8_Rb_treeISsSt4pairIKSsSsESt10_Select1stIS2_ESt4lessISsESaIS2_EE16_M_insert_uniqueESt17_Rb_tree_iteratorIS2_ERKS2_
0008fa40  ldr     r3, [sp, #0xd0]
0008fa42  ldr     r4, [sp, #0x64]
0008fa44  str     r0, [sp, #0x94]
0008fa46  sub.w   r0, r3, #0xc
0008fa4a  cmp     r4, r0
0008fa4c  bne.w   #0x8fb80
0008fa50  ldr     r3, [sp, #0xcc]
0008fa52  ldr     r2, [sp, #0x64]
0008fa54  sub.w   r0, r3, #0xc
0008fa58  cmp     r2, r0
0008fa5a  bne     #0x8fb56
0008fa5c  ldr     r3, [sp, #0xdc]
0008fa5e  ldr     r2, [sp, #0x64]
0008fa60  sub.w   r0, r3, #0xc
0008fa64  cmp     r2, r0
0008fa66  itt     eq
0008fa68  ldreq   r3, [sp, #0x94]
0008fa6a  streq   r3, [sp, #0x8c]
0008fa6c  beq.w   #0x8f86c
0008fa70  subs    r2, r3, #4
0008fa72  ldr     r3, [r3, #-0x4]
0008fa76  subs    r1, r3, #1
0008fa78  dmb     ish
0008fa7c  mov     ip, r3
0008fa7e  ldrex   r4, [r2]
0008fa82  cmp     r4, r3
0008fa84  beq.w   #0x8fbde
0008fa88  cmp     r4, ip
0008fa8a  mov     r3, r4
0008fa8c  bne     #0x8fa76
0008fa8e  cmp     r4, #0
0008fa90  itt     gt
0008fa92  ldrgt   r0, [sp, #0x94]
0008fa94  strgt   r0, [sp, #0x8c]
0008fa96  bgt.w   #0x8f86c
0008fa9a  add     r1, sp, #0xf4
0008fa9c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008faa0  ldr     r2, [sp, #0x94]
0008faa2  str     r2, [sp, #0x8c]
0008faa4  b       #0x8f86c
0008faa6  it      hi
0008faa8  movhi.w r0, #-1
0008faac  cmp     r0, #0
0008faae  bge.w   #0x8f86c
0008fab2  b       #0x8fa08
0008fab4  ldr     r0, [sp, #0xe4]
0008fab6  ldr     r1, [sp, #0x3c]
0008fab8  blx     #0xddbfc ; -> objc_msgSend
0008fabc  cmp.w   r0, #0x12c
0008fac0  itt     lt
0008fac2  ldrlt   r4, [sp, #0x48]
0008fac4  strlt   r4, [sp, #0x40]
0008fac6  blt     #0x8f9ee
0008fac8  b       #0x8f9e6
0008faca  ldr     r3, [r2, #-0x4]
0008face  subs    r1, r2, #4
0008fad0  subs    r2, r3, #1
0008fad2  dmb     ish
0008fad6  mov     ip, r3
0008fad8  ldrex   r4, [r1]
0008fadc  cmp     r4, r3
0008fade  beq     #0x8fbbe
0008fae0  cmp     r4, ip
0008fae2  mov     r3, r4
0008fae4  bne     #0x8fad0
0008fae6  cmp     r4, #0
0008fae8  bgt.w   #0x8f89c
0008faec  add.w   r1, sp, #0xf3
0008faf0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008faf4  b       #0x8f89c
0008faf6  ldr     r0, [pc, #0x358]
0008faf8  ldr.w   r1, [pc, #0x358]
0008fafc  ldr     r3, [pc, #0x358]
0008fafe  mov.w   r2, #-1
0008fb02  add     r0, pc ; -> 0x000e5954  ZZN6Mayhem11HTTPRequest9DoRequestEvE8__func__
0008fb04  str     r2, [sp, #0x9c]
0008fb06  add     r1, pc ; -> 0x00175c90  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/Mayhem.mm'
0008fb08  add     r3, pc ; -> 0x00175cec  'm_url.length() != 0 && "URL is empty. Is that even possible?"'
0008fb0a  add.w   r2, r2, #0x154
0008fb0e  blx     #0xdd5cc ; -> assert_rtn
0008fb12  subs    r2, r3, #4
0008fb14  ldr     r3, [r3, #-0x4]
0008fb18  subs    r1, r3, #1
0008fb1a  dmb     ish
0008fb1e  mov     ip, r3
0008fb20  ldrex   r4, [r2]
0008fb24  cmp     r4, r3
0008fb26  beq     #0x8fbae
0008fb28  cmp     r4, ip
0008fb2a  mov     r3, r4
0008fb2c  bne     #0x8fb18
0008fb2e  cmp     r4, #0
0008fb30  bgt.w   #0x8f8aa
0008fb34  add     r1, sp, #0xf0
0008fb36  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fb3a  b       #0x8f8aa
0008fb3c  ldr     r0, [pc, #0x31c]
0008fb3e  ldr     r1, [pc, #0x320]
0008fb40  ldr     r3, [pc, #0x320]
0008fb42  mov.w   r2, #-1
0008fb46  add     r0, pc ; -> 0x000e5954  ZZN6Mayhem11HTTPRequest9DoRequestEvE8__func__
0008fb48  str     r2, [sp, #0x9c]
0008fb4a  add     r1, pc ; -> 0x00175d2c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/Mayhem.mm'
0008fb4c  add     r3, pc ; -> 0x00175d88  'm_method.length() != 0 && "Did you forget to set the method? Should be GET or POST"'
0008fb4e  mov.w   r2, #0x154
0008fb52  blx     #0xdd5cc ; -> assert_rtn
0008fb56  subs    r2, r3, #4
0008fb58  ldr     r3, [r3, #-0x4]
0008fb5c  subs    r1, r3, #1
0008fb5e  dmb     ish
0008fb62  mov     ip, r3
0008fb64  ldrex   r4, [r2]
0008fb68  cmp     r4, r3
0008fb6a  beq     #0x8fbce
0008fb6c  cmp     r4, ip
0008fb6e  mov     r3, r4
0008fb70  bne     #0x8fb5c
0008fb72  cmp     r4, #0
0008fb74  bgt.w   #0x8fa5c
0008fb78  add     r1, sp, #0xf8
0008fb7a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fb7e  b       #0x8fa5c
0008fb80  subs    r2, r3, #4
0008fb82  ldr     r3, [r3, #-0x4]
0008fb86  subs    r1, r3, #1
0008fb88  dmb     ish
0008fb8c  mov     ip, r3
0008fb8e  ldrex   lr, [r2]
0008fb92  cmp     lr, r3
0008fb94  beq     #0x8fbf0
0008fb96  cmp     lr, ip
0008fb98  mov     r3, lr
0008fb9a  bne     #0x8fb86
0008fb9c  cmp.w   lr, #0
0008fba0  bgt.w   #0x8fa50
0008fba4  add.w   r1, sp, #0xf9
0008fba8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fbac  b       #0x8fa50
0008fbae  strex   lr, r1, [r2]
0008fbb2  cmp.w   lr, #0
0008fbb6  bne     #0x8fb20
0008fbb8  dmb     ish
0008fbbc  b       #0x8fb28
0008fbbe  strex   lr, r2, [r1]
0008fbc2  cmp.w   lr, #0
0008fbc6  bne     #0x8fad8
0008fbc8  dmb     ish
0008fbcc  b       #0x8fae0
0008fbce  strex   lr, r1, [r2]
0008fbd2  cmp.w   lr, #0
0008fbd6  bne     #0x8fb64
0008fbd8  dmb     ish
0008fbdc  b       #0x8fb6c
0008fbde  strex   lr, r1, [r2]
0008fbe2  cmp.w   lr, #0
0008fbe6  bne.w   #0x8fa7e
0008fbea  dmb     ish
0008fbee  b       #0x8fa88
0008fbf0  strex   r4, r1, [r2]
0008fbf4  cmp     r4, #0
0008fbf6  bne     #0x8fb8e
0008fbf8  dmb     ish
0008fbfc  b       #0x8fb96
0008fbfe  ldr     r3, [sp, #0x9c]
0008fc00  ldr     r0, [sp, #0xa0]
0008fc02  cmp     r3, #1
0008fc04  beq     #0x8fcf8
0008fc06  cmp     r3, #2
0008fc08  beq     #0x8fc28
0008fc0a  cmp     r3, #3
0008fc0c  beq.w   #0x8fd16
0008fc10  cmp     r3, #4
0008fc12  beq     #0x8fc38
0008fc14  cmp     r3, #5
0008fc16  beq     #0x8fc4e
0008fc18  ldr     r3, [sp, #0xcc]
0008fc1a  ldr     r4, [sp, #0x64]
0008fc1c  str     r0, [sp, #0x78]
0008fc1e  sub.w   r0, r3, #0xc
0008fc22  cmp     r4, r0
0008fc24  bne     #0x8fcbc
0008fc26  ldr     r0, [sp, #0x78]
0008fc28  ldr     r3, [sp, #0xdc]
0008fc2a  ldr     r2, [sp, #0x64]
0008fc2c  str     r0, [sp, #0x68]
0008fc2e  sub.w   r0, r3, #0xc
0008fc32  cmp     r2, r0
0008fc34  bne     #0x8fc82
0008fc36  ldr     r0, [sp, #0x68]
0008fc38  ldr.w   r3, [pc, #0x22c]
0008fc3c  ldr     r1, [sp, #0xec]
0008fc3e  str     r0, [sp, #0x50]
0008fc40  add     r3, pc ; -> 0x000f3370  0x0
0008fc42  sub.w   r0, r1, #0xc
0008fc46  ldr     r3, [r3]
0008fc48  cmp     r0, r3
0008fc4a  bne     #0x8fc58
0008fc4c  ldr     r0, [sp, #0x50]
0008fc4e  mov.w   r3, #-1
0008fc52  str     r3, [sp, #0x9c]
0008fc54  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008fc58  ldr     r3, [r1, #-0x4]
0008fc5c  subs    r2, r1, #4
0008fc5e  subs    r1, r3, #1
0008fc60  dmb     ish
0008fc64  mov     ip, r3
0008fc66  ldrex   r4, [r2]
0008fc6a  cmp     r4, r3
0008fc6c  beq     #0x8fcac
0008fc6e  cmp     r4, ip
0008fc70  mov     r3, r4
0008fc72  bne     #0x8fc5e
0008fc74  cmp     r4, #0
0008fc76  bgt     #0x8fc4c
0008fc78  add.w   r1, sp, #0xf1
0008fc7c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fc80  b       #0x8fc4c
0008fc82  subs    r2, r3, #4
0008fc84  ldr     r3, [r3, #-0x4]
0008fc88  subs    r1, r3, #1
0008fc8a  dmb     ish
0008fc8e  mov     ip, r3
0008fc90  ldrex   r4, [r2]
0008fc94  cmp     r4, r3
0008fc96  beq     #0x8fce8
0008fc98  cmp     r4, ip
0008fc9a  mov     r3, r4
0008fc9c  bne     #0x8fc88
0008fc9e  cmp     r4, #0
0008fca0  bgt     #0x8fc36
0008fca2  add.w   r1, sp, #0xf5
0008fca6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fcaa  b       #0x8fc36
0008fcac  strex   lr, r1, [r2]
0008fcb0  cmp.w   lr, #0
0008fcb4  bne     #0x8fc66
0008fcb6  dmb     ish
0008fcba  b       #0x8fc6e
0008fcbc  subs    r2, r3, #4
0008fcbe  ldr     r3, [r3, #-0x4]
0008fcc2  subs    r1, r3, #1
0008fcc4  dmb     ish
0008fcc8  mov     ip, r3
0008fcca  ldrex   lr, [r2]
0008fcce  cmp     lr, r3
0008fcd0  beq     #0x8fd56
0008fcd2  cmp     lr, ip
0008fcd4  mov     r3, lr
0008fcd6  bne     #0x8fcc2
0008fcd8  cmp.w   lr, #0
0008fcdc  bgt     #0x8fc26
0008fcde  add.w   r1, sp, #0xfa
0008fce2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fce6  b       #0x8fc26
0008fce8  strex   lr, r1, [r2]
0008fcec  cmp.w   lr, #0
0008fcf0  bne     #0x8fc90
0008fcf2  dmb     ish
0008fcf6  b       #0x8fc98
0008fcf8  ldr     r3, [sp, #0xd0]
0008fcfa  ldr     r4, [sp, #0x64]
0008fcfc  str     r0, [sp, #0x6c]
0008fcfe  sub.w   r0, r3, #0xc
0008fd02  cmp     r4, r0
0008fd04  bne     #0x8fd64
0008fd06  ldr     r3, [sp, #0xcc]
0008fd08  ldr     r2, [sp, #0x64]
0008fd0a  sub.w   r0, r3, #0xc
0008fd0e  cmp     r2, r0
0008fd10  bne     #0x8fd2c
0008fd12  ldr     r0, [sp, #0x6c]
0008fd14  b       #0x8fc28
0008fd16  ldr     r3, [pc, #0x154]
0008fd18  ldr     r1, [sp, #0xe8]
0008fd1a  str     r0, [sp, #0x4c]
0008fd1c  add     r3, pc ; -> 0x000f3370  0x0
0008fd1e  sub.w   r0, r1, #0xc
0008fd22  ldr     r3, [r3]
0008fd24  cmp     r0, r3
0008fd26  bne     #0x8fd90
0008fd28  ldr     r0, [sp, #0x4c]
0008fd2a  b       #0x8fc38
0008fd2c  subs    r2, r3, #4
0008fd2e  ldr     r3, [r3, #-0x4]
0008fd32  subs    r1, r3, #1
0008fd34  dmb     ish
0008fd38  mov     ip, r3
0008fd3a  ldrex   r4, [r2]
0008fd3e  cmp     r4, r3
0008fd40  beq     #0x8fdc8
0008fd42  cmp     r4, ip
0008fd44  mov     r3, r4
0008fd46  bne     #0x8fd32
0008fd48  cmp     r4, #0
0008fd4a  bgt     #0x8fd12
0008fd4c  add.w   r1, sp, #0xf6
0008fd50  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fd54  b       #0x8fd12
0008fd56  strex   r4, r1, [r2]
0008fd5a  cmp     r4, #0
0008fd5c  bne     #0x8fcca
0008fd5e  dmb     ish
0008fd62  b       #0x8fcd2
0008fd64  subs    r2, r3, #4
0008fd66  ldr     r3, [r3, #-0x4]
0008fd6a  subs    r1, r3, #1
0008fd6c  dmb     ish
0008fd70  mov     ip, r3
0008fd72  ldrex   lr, [r2]
0008fd76  cmp     lr, r3
0008fd78  beq     #0x8fdba
0008fd7a  cmp     lr, ip
0008fd7c  mov     r3, lr
0008fd7e  bne     #0x8fd6a
0008fd80  cmp.w   lr, #0
0008fd84  bgt     #0x8fd06
0008fd86  add.w   r1, sp, #0xf7
0008fd8a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fd8e  b       #0x8fd06
0008fd90  ldr     r3, [r1, #-0x4]
0008fd94  subs    r2, r1, #4
0008fd96  subs    r1, r3, #1
0008fd98  dmb     ish
0008fd9c  mov     ip, r3
0008fd9e  ldrex   r4, [r2]
0008fda2  cmp     r4, r3
0008fda4  beq     #0x8fdd8
0008fda6  cmp     r4, ip
0008fda8  mov     r3, r4
0008fdaa  bne     #0x8fd96
0008fdac  cmp     r4, #0
0008fdae  bgt     #0x8fd28
0008fdb0  add.w   r1, sp, #0xf2
0008fdb4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008fdb8  b       #0x8fd28
0008fdba  strex   r4, r1, [r2]
0008fdbe  cmp     r4, #0
0008fdc0  bne     #0x8fd72
0008fdc2  dmb     ish
0008fdc6  b       #0x8fd7a
0008fdc8  strex   lr, r1, [r2]
0008fdcc  cmp.w   lr, #0
0008fdd0  bne     #0x8fd3a
0008fdd2  dmb     ish
0008fdd6  b       #0x8fd42
0008fdd8  strex   lr, r1, [r2]
0008fddc  cmp.w   lr, #0
0008fde0  bne     #0x8fd9e
0008fde2  dmb     ish
0008fde6  b       #0x8fda6
0008fde8  subs    r5, #0x2e
0008fdea  movs    r6, r0
0008fdec  stc     p0, c0, [r2], #0x14
0008fdf0  lsls    r4, r3, #0x13
0008fdf2  movs    r0, r0
0008fdf4  b       #0x8f610
0008fdf6  movs    r6, r0
0008fdf8  bhi     #0x8fecc
0008fdfa  movs    r6, r0
0008fdfc  bvc     #0x8fde4
0008fdfe  movs    r6, r0
0008fe00  bhi     #0x8fe8c
0008fe02  movs    r6, r0
0008fe04  b       #0x8f674
0008fe06  movs    r6, r0
0008fe08  bhs     #0x8fd48
0008fe0a  movs    r6, r0
0008fe0c  bvc     #0x8fdf0
0008fe0e  movs    r6, r0
0008fe10  blo     #0x8fdd0
0008fe12  movs    r6, r0
0008fe14  b       #0x9051c
0008fe16  movs    r6, r0
0008fe18  blo     #0x8fde4
0008fe1a  movs    r6, r0
0008fe1c  str     r0, [r2, #0x5c]
0008fe1e  movs    r6, r1
0008fe20  subs    r2, #0xe0
0008fe22  movs    r6, r0
0008fe24  bvs     #0x8fe1c
0008fe26  movs    r6, r0
0008fe28  blo     #0x8fdcc
0008fe2a  movs    r6, r0
0008fe2c  bhs     #0x8fd40
0008fe2e  movs    r6, r0
0008fe30  beq     #0x8fe74
0008fe32  movs    r6, r0
0008fe34  b       #0x90374
0008fe36  movs    r6, r0
0008fe38  beq     #0x8fe4c
0008fe3a  movs    r6, r0
0008fe3c  bvs     #0x8fe94
0008fe3e  movs    r6, r0
0008fe40  b       #0x9031c
0008fe42  movs    r6, r0
0008fe44  bvs     #0x8fe48
0008fe46  movs    r6, r0
0008fe48  bpl     #0x8fdf8
0008fe4a  movs    r6, r0
0008fe4c  subs    r1, #0x5c
0008fe4e  movs    r6, r0
0008fe50  ldrsh   r6, [r1, r1]
0008fe52  movs    r5, r0
0008fe54  str     r6, [r0, #0x18]
0008fe56  movs    r6, r1
0008fe58  str     r0, [r4, #0x1c]
0008fe5a  movs    r6, r1
0008fe5c  ldrsh   r2, [r1, r0]
0008fe5e  movs    r5, r0
0008fe60  str     r6, [r3, #0x1c]
0008fe62  movs    r6, r1
0008fe64  str     r0, [r7, #0x20]
0008fe66  movs    r6, r1
0008fe68  adds    r7, #0x2c
0008fe6a  movs    r6, r0
0008fe6c  adds    r6, #0x50
0008fe6e  movs    r6, r0
