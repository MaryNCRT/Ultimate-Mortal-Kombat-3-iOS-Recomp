========================================================================
-[FBConnectionImpl request  0x00088f48  2556 bytes   FBConnection.mm
========================================================================

00088f48  push    {r4, r5, r6, r7, lr}
00088f4a  add     r7, sp, #0xc
00088f4c  push.w  {r8, sl, fp}
00088f50  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00088f54  sub.w   sp, sp, #0x214
00088f58  str     r3, [sp, #0x1c]
00088f5a  ldr.w   r3, [pc, #0x908]
00088f5e  str     r2, [sp, #0x20]
00088f60  str     r0, [sp, #0x24]
00088f62  add     r3, pc ; -> 0x000f301c  0x0
00088f64  add     r0, sp, #0xf0
00088f66  ldr     r2, [r3]
00088f68  add     r3, sp, #0x108
00088f6a  str     r2, [r3]
00088f6c  ldr.w   r2, [pc, #0x8f8]
00088f70  add     r3, sp, #0x10c
00088f72  add     r2, pc ; -> 0x000ee1a8  GCC_except_table3
00088f74  str     r2, [r3]
00088f76  ldr.w   r3, [pc, #0x8f4]
00088f7a  add     r2, sp, #0x110
00088f7c  add     r3, pc ; -> 0x0008967e  
00088f7e  orr     r3, r3, #1
00088f82  str     r7, [r2]
00088f84  str.w   sp, [sp, #0x118]
00088f88  str     r3, [r2, #4]
00088f8a  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00088f8e  ldr.w   r0, [pc, #0x8e0]
00088f92  add     r1, sp, #0xf4
00088f94  mov.w   r2, #-1
00088f98  add     r0, pc ; -> 0x0017eee4  
00088f9a  str     r1, [sp, #0x18]
00088f9c  str     r2, [r1]
00088f9e  blx     #0xdd3e0 ; -> NSLog
00088fa2  ldr.w   r3, [pc, #0x8d0]
00088fa6  ldr     r0, [sp, #0x20]
00088fa8  add     r3, pc ; -> 0x000fcf54  '\x1c7\x0e'
00088faa  ldr     r3, [r3]
00088fac  mov     r1, r3
00088fae  str     r3, [sp, #0x28]
00088fb0  blx     #0xddbfc ; -> objc_msgSend
00088fb4  ldr.w   r3, [pc, #0x8c0]
00088fb8  ldr.w   r2, [pc, #0x8c0]
00088fbc  add     r3, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
00088fbe  add     r2, pc ; -> 0x0017eed4  
00088fc0  ldr     r3, [r3]
00088fc2  mov     r1, r3
00088fc4  str     r3, [sp, #0x2c]
00088fc6  blx     #0xddbfc ; -> objc_msgSend
00088fca  tst.w   r0, #0xff
00088fce  beq     #0x89046
00088fd0  ldr.w   r1, [pc, #0x8ac]
00088fd4  movs    r2, #0
00088fd6  ldr     r0, [sp, #0x1c]
00088fd8  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00088fda  ldr     r1, [r1]
00088fdc  blx     #0xddbfc ; -> objc_msgSend
00088fe0  ldr.w   r1, [pc, #0x8a0]
00088fe4  ldr.w   r2, [pc, #0x8a0]
00088fe8  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00088fea  add     r2, pc ; -> 0x0017eef4  
00088fec  ldr     r1, [r1]
00088fee  blx     #0xddbfc ; -> objc_msgSend
00088ff2  ldr.w   r3, [pc, #0x898]
00088ff6  ldr.w   r1, [pc, #0x898]
00088ffa  movs    r2, #4
00088ffc  add     r3, pc ; -> 0x00379bd0  m_connection
00088ffe  add     r1, pc ; -> 0x000fcf68  
00089000  ldr     r3, [r3]
00089002  ldr     r1, [r1]
00089004  str     r3, [sp, #0x34]
00089006  str     r0, [sp, #0x30]
00089008  blx     #0xddbfc ; -> objc_msgSend
0008900c  ldr     r3, [sp, #0x34]
0008900e  adds    r3, #0x10
00089010  str     r3, [sp, #0xb4]
00089012  str     r0, [sp, #0xb8]
00089014  blx     #0xdde0c ; -> strlen
00089018  ldr     r1, [sp, #0xb8]
0008901a  mov     r2, r0
0008901c  ldr     r0, [sp, #0xb4]
0008901e  blx     #0xdd50c ; -> ZNSs6assignEPKcm
00089022  ldr.w   r0, [pc, #0x870]
00089026  ldr     r1, [sp, #0x30]
00089028  add     r0, pc ; -> 0x0017ef04  
0008902a  blx     #0xdd3e0 ; -> NSLog
0008902e  add     r0, sp, #0xf0
00089030  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00089034  sub.w   sp, r7, #0x58
00089038  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008903c  sub.w   sp, r7, #0x18
00089040  pop.w   {r8, sl, fp}
00089044  pop     {r4, r5, r6, r7, pc}
00089046  ldr     r4, [sp, #0x18]
00089048  mov.w   r1, #-1
0008904c  str     r1, [r4]
0008904e  ldr     r1, [sp, #0x28]
00089050  ldr     r0, [sp, #0x20]
00089052  blx     #0xddbfc ; -> objc_msgSend
00089056  ldr.w   r2, [pc, #0x840]
0008905a  ldr     r1, [sp, #0x2c]
0008905c  add     r2, pc ; -> 0x0017ef14  
0008905e  blx     #0xddbfc ; -> objc_msgSend
00089062  tst.w   r0, #0xff
00089066  bne     #0x8902e
00089068  ldr     r1, [sp, #0x28]
0008906a  ldr     r0, [sp, #0x20]
0008906c  blx     #0xddbfc ; -> objc_msgSend
00089070  ldr.w   r2, [pc, #0x828]
00089074  ldr     r1, [sp, #0x2c]
00089076  add     r2, pc ; -> 0x0017ef24  
00089078  blx     #0xddbfc ; -> objc_msgSend
0008907c  uxtb    r0, r0
0008907e  str     r0, [sp, #0x38]
00089080  cmp     r0, #0
00089082  bne     #0x8902e
00089084  ldr     r1, [sp, #0x28]
00089086  ldr     r0, [sp, #0x20]
00089088  blx     #0xddbfc ; -> objc_msgSend
0008908c  ldr.w   r2, [pc, #0x810]
00089090  ldr     r1, [sp, #0x2c]
00089092  add     r2, pc ; -> 0x0017ee84  
00089094  blx     #0xddbfc ; -> objc_msgSend
00089098  uxtb    r0, r0
0008909a  str     r0, [sp, #0x3c]
0008909c  cmp     r0, #0
0008909e  beq     #0x89196
000890a0  ldr.w   r3, [pc, #0x800]
000890a4  ldr     r2, [sp, #0x38]
000890a6  ldr     r0, [sp, #0x1c]
000890a8  add     r3, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000890aa  ldr     r3, [r3]
000890ac  str     r2, [sp, #0x1c4]
000890ae  str     r2, [sp, #0x1c8]
000890b0  str     r2, [sp, #0x1cc]
000890b2  str     r3, [sp, #0x40]
000890b4  str     r2, [sp, #0x1d0]
000890b6  movs    r3, #0x10
000890b8  str     r2, [sp, #0x1d4]
000890ba  str     r2, [sp, #0x1d8]
000890bc  str     r2, [sp, #0x1dc]
000890be  str     r2, [sp, #0x1e0]
000890c0  str     r3, [sp]
000890c2  ldr     r1, [sp, #0x40]
000890c4  add     r2, sp, #0x1c4
000890c6  add     r3, sp, #0x164
000890c8  blx     #0xddbfc ; -> objc_msgSend
000890cc  cmp     r0, #0
000890ce  beq.w   #0x8943c
000890d2  ldr.w   r2, [pc, #0x7d4]
000890d6  ldr     r3, [sp, #0x1cc]
000890d8  ldr.w   lr, [pc, #0x7d0]
000890dc  add     r2, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000890de  ldr     r2, [r2]
000890e0  ldr     r4, [r3]
000890e2  mov     r1, lr
000890e4  str     r0, [sp, #0x80]
000890e6  str     r2, [sp, #0xe4]
000890e8  ldr.w   r2, [pc, #0x7c4]
000890ec  add     r1, pc
000890ee  str     r4, [sp, #0x84]
000890f0  add     r2, pc ; -> 0x000fcdb4  
000890f2  str     r1, [sp, #0xc4]
000890f4  ldr     r2, [r2]
000890f6  str     r2, [sp, #0x44]
000890f8  ldr.w   r2, [pc, #0x7b8]
000890fc  add     r2, pc ; -> 0x000fdb5c  
000890fe  ldr     r2, [r2]
00089100  str     r2, [sp, #0x48]
00089102  ldr.w   r2, [pc, #0x7b4]
00089106  add     r2, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00089108  ldr     r2, [r2]
0008910a  str     r2, [sp, #0x4c]
0008910c  ldr     r2, [sp, #0x38]
0008910e  str     r2, [sp, #0x7c]
00089110  movs    r4, #0
00089112  str     r4, [sp, #0xc8]
00089114  b       #0x89144
00089116  ldr     r3, [sp, #0x14]
00089118  ldr.w   r2, [pc, #0x7a0]
0008911c  stm.w   sp, {r0, r1}
00089120  mov.w   r4, #-1
00089124  str     r4, [r3]
00089126  add     r2, pc ; -> 0x0017ef44  
00089128  ldr     r0, [sp, #0x48]
0008912a  ldr     r1, [sp, #0x4c]
0008912c  ldr     r3, [sp, #0x7c]
0008912e  blx     #0xddbfc ; -> objc_msgSend
00089132  str     r0, [sp, #0x7c]
00089134  ldr     r1, [sp, #0xc8]
00089136  ldr     r2, [sp, #0x80]
00089138  adds    r1, #1
0008913a  cmp     r2, r1
0008913c  str     r1, [sp, #0xc8]
0008913e  bls.w   #0x894f4
00089142  ldr     r3, [sp, #0x1cc]
00089144  ldr     r3, [r3]
00089146  ldr     r1, [sp, #0x84]
00089148  cmp     r3, r1
0008914a  beq     #0x8915a
0008914c  add     r3, sp, #0xf4
0008914e  mov.w   r2, #-1
00089152  str     r2, [r3]
00089154  ldr     r0, [sp, #0x1c]
00089156  blx     #0xddbe4 ; -> objc_enumerationMutation
0008915a  ldr     r3, [sp, #0x1c8]
0008915c  ldr     r2, [sp, #0xc8]
0008915e  mov.w   r4, #-1
00089162  ldr.w   r0, [r3, r2, lsl #2]
00089166  add     r3, sp, #0xf4
00089168  str     r3, [sp, #0x14]
0008916a  str     r4, [r3]
0008916c  ldr     r2, [sp, #0xc4]
0008916e  ldr     r1, [sp, #0xe4]
00089170  blx     #0xddbfc ; -> objc_msgSend
00089174  ldr     r1, [sp, #0x44]
00089176  blx     #0xddbfc ; -> objc_msgSend
0008917a  ldr     r2, [sp, #0x7c]
0008917c  cmp     r2, #0
0008917e  bne     #0x89116
00089180  ldr.w   r2, [pc, #0x73c]
00089184  str     r1, [sp]
00089186  mov     r3, r0
00089188  add     r2, pc ; -> 0x0017ede4  
0008918a  ldr     r0, [sp, #0x48]
0008918c  ldr     r1, [sp, #0x4c]
0008918e  blx     #0xddbfc ; -> objc_msgSend
00089192  str     r0, [sp, #0x7c]
00089194  b       #0x89134
00089196  ldr     r1, [sp, #0x18]
00089198  mov.w   r2, #-1
0008919c  str     r2, [r1]
0008919e  ldr     r1, [sp, #0x28]
000891a0  ldr     r0, [sp, #0x20]
000891a2  blx     #0xddbfc ; -> objc_msgSend
000891a6  ldr.w   r2, [pc, #0x71c]
000891aa  ldr     r1, [sp, #0x2c]
000891ac  add     r2, pc ; -> 0x0017ee04  
000891ae  blx     #0xddbfc ; -> objc_msgSend
000891b2  tst.w   r0, #0xff
000891b6  beq.w   #0x8902e
000891ba  ldr     r3, [sp, #0x3c]
000891bc  ldr     r0, [sp, #0x1c]
000891be  add     r2, sp, #0x1a4
000891c0  str     r3, [sp, #0x1a4]
000891c2  str     r3, [sp, #0x1a8]
000891c4  str     r3, [sp, #0x1ac]
000891c6  str     r3, [sp, #0x1b0]
000891c8  str     r3, [sp, #0x1b4]
000891ca  str     r3, [sp, #0x1b8]
000891cc  str     r3, [sp, #0x1bc]
000891ce  str     r3, [sp, #0x1c0]
000891d0  ldr.w   r3, [pc, #0x6f4]
000891d4  add     r3, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000891d6  ldr     r3, [r3]
000891d8  str     r3, [sp, #0xec]
000891da  ldr     r1, [sp, #0xec]
000891dc  movs    r3, #0x10
000891de  str     r3, [sp]
000891e0  add     r3, sp, #0x124
000891e2  blx     #0xddbfc ; -> objc_msgSend
000891e6  cmp     r0, #0
000891e8  beq.w   #0x8902e
000891ec  ldr     r3, [sp, #0x1ac]
000891ee  ldr.w   r2, [pc, #0x6dc]
000891f2  ldr.w   lr, [pc, #0x6dc]
000891f6  ldr     r4, [r3]
000891f8  add     r2, pc ; -> 0x0017eef4  
000891fa  str     r2, [sp, #0xd4]
000891fc  ldr.w   r2, [pc, #0x6d4]
00089200  mov     r1, lr
00089202  add     r1, pc
00089204  add     r2, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00089206  str     r1, [sp, #0xc0]
00089208  ldr     r2, [r2]
0008920a  ldr     r1, [sp, #0x3c]
0008920c  str     r4, [sp, #0x9c]
0008920e  ldr.w   r4, [pc, #0x6c8]
00089212  str     r2, [sp, #0xe8]
00089214  ldr.w   r2, [pc, #0x6c4]
00089218  add     r4, pc ; -> 0x0017ef74  
0008921a  str     r0, [sp, #0x90]
0008921c  add     r2, pc ; -> 0x000fcdb4  
0008921e  str     r4, [sp, #0xd0]
00089220  ldr     r2, [r2]
00089222  str     r1, [sp, #0x88]
00089224  str     r2, [sp, #0xe0]
00089226  ldr.w   r2, [pc, #0x6b8]
0008922a  add     r2, pc ; -> 0x000fcf68  
0008922c  ldr     r2, [r2]
0008922e  str     r2, [sp, #0xdc]
00089230  ldr.w   r2, [pc, #0x6b0]
00089234  add     r2, pc ; -> 0x000fce80  '0\t\x0e'
00089236  ldr     r2, [r2]
00089238  str     r2, [sp, #0x68]
0008923a  ldr.w   r2, [pc, #0x6ac]
0008923e  add     r2, pc ; -> 0x000fdc0c  
00089240  ldr     r2, [r2]
00089242  str     r2, [sp, #0x6c]
00089244  ldr.w   r2, [pc, #0x6a4]
00089248  add     r2, pc ; -> 0x000fca0c  '@\t\x0e'
0008924a  ldr     r2, [r2]
0008924c  str     r2, [sp, #0x70]
0008924e  ldr.w   r2, [pc, #0x6a0]
00089252  add     r2, pc ; -> 0x000fdb5c  
00089254  ldr     r2, [r2]
00089256  str     r2, [sp, #0x74]
00089258  ldr.w   r2, [pc, #0x698]
0008925c  add     r2, pc ; -> 0x000fcf58  
0008925e  ldr     r2, [r2]
00089260  str     r2, [sp, #0x78]
00089262  movs    r2, #0
00089264  str     r2, [sp, #0xcc]
00089266  b       #0x89322
00089268  ldr     r4, [sp, #0xc]
0008926a  ldr.w   r1, [pc, #0x68c]
0008926e  add     r2, sp, #0x210
00089270  movs    r3, #5
00089272  add     r1, pc ; -> 0x001759b8  kBorderBlack+0xb0
00089274  str     r3, [r4]
00089276  add     r0, sp, #0x1f8
00089278  adds    r2, #2
0008927a  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008927e  movs    r3, #4
00089280  add     r0, sp, #0x1fc
00089282  str     r3, [r4]
00089284  add     r1, sp, #0x1f8
00089286  blx     #0xdd518 ; -> ZNSs6assignERKSs
0008928a  ldr     r3, [sp, #0x1f8]
0008928c  ldr     r1, [sp, #0xbc]
0008928e  sub.w   r0, r3, #0xc
00089292  cmp     r1, r0
00089294  bne.w   #0x895f0
00089298  add     r1, sp, #0xf4
0008929a  add     r3, sp, #0x1fc
0008929c  str     r1, [sp, #8]
0008929e  str     r3, [sp]
000892a0  movs    r3, #6
000892a2  str     r3, [r1]
000892a4  add     r0, sp, #0x1e4
000892a6  add     r1, sp, #0x94
000892a8  ldm     r1, {r1, r2}
000892aa  add     r3, sp, #0x200
000892ac  bl      #0x88d54 ; -> ZN8FBFriendC1ExRKSsS1_
000892b0  ldr.w   r0, [pc, #0x648]
000892b4  ldr     r2, [sp, #8]
000892b6  movs    r3, #1
000892b8  add     r0, pc ; -> 0x00379bd0  m_connection
000892ba  add     r1, sp, #0x1e4
000892bc  ldr     r0, [r0]
000892be  str     r3, [r2]
000892c0  bl      #0x88e34 ; -> ZN12FBConnection9AddFriendERK8FBFriend
000892c4  ldr.w   r0, [pc, #0x638]
000892c8  ldr     r3, [sp, #0x88]
000892ca  ldr     r1, [sp, #0x88]
000892cc  add     r0, pc ; -> 0x0017ef84  
000892ce  adds    r3, #1
000892d0  str     r3, [sp, #0xd8]
000892d2  blx     #0xdd3e0 ; -> NSLog
000892d6  ldr     r3, [sp, #0x1f0]
000892d8  ldr     r1, [sp, #0xbc]
000892da  sub.w   r0, r3, #0xc
000892de  cmp     r1, r0
000892e0  bne.w   #0x895c4
000892e4  ldr     r3, [sp, #0x1ec]
000892e6  ldr     r1, [sp, #0xbc]
000892e8  sub.w   r0, r3, #0xc
000892ec  cmp     r1, r0
000892ee  bne.w   #0x89598
000892f2  ldr     r3, [sp, #0x1fc]
000892f4  ldr     r1, [sp, #0xbc]
000892f6  sub.w   r0, r3, #0xc
000892fa  cmp     r1, r0
000892fc  bne.w   #0x8956c
00089300  ldr     r3, [sp, #0x200]
00089302  ldr     r1, [sp, #0xbc]
00089304  sub.w   r0, r3, #0xc
00089308  cmp     r1, r0
0008930a  bne.w   #0x8953e
0008930e  ldr     r1, [sp, #0xcc]
00089310  ldr     r2, [sp, #0x90]
00089312  adds    r1, #1
00089314  cmp     r2, r1
00089316  str     r1, [sp, #0xcc]
00089318  bls.w   #0x89516
0008931c  ldr     r4, [sp, #0xd8]
0008931e  ldr     r3, [sp, #0x1ac]
00089320  str     r4, [sp, #0x88]
00089322  ldr     r3, [r3]
00089324  ldr     r4, [sp, #0x9c]
00089326  cmp     r3, r4
00089328  beq     #0x89338
0008932a  add     r3, sp, #0xf4
0008932c  mov.w   r2, #-1
00089330  str     r2, [r3]
00089332  ldr     r0, [sp, #0x1c]
00089334  blx     #0xddbe4 ; -> objc_enumerationMutation
00089338  ldr     r1, [sp, #0xcc]
0008933a  ldr     r3, [sp, #0x1a8]
0008933c  add     r2, sp, #0xf4
0008933e  ldr.w   r3, [r3, r1, lsl #2]
00089342  str     r2, [sp, #0x10]
00089344  str     r3, [sp, #0x8c]
00089346  mov.w   r3, #-1
0008934a  str     r3, [r2]
0008934c  ldr     r2, [sp, #0xc0]
0008934e  ldr     r1, [sp, #0xe8]
00089350  ldr     r0, [sp, #0x8c]
00089352  blx     #0xddbfc ; -> objc_msgSend
00089356  ldr     r1, [sp, #0xe0]
00089358  blx     #0xddbfc ; -> objc_msgSend
0008935c  ldr     r2, [sp, #0xd4]
0008935e  str     r0, [sp, #0x94]
00089360  str     r1, [sp, #0x98]
00089362  ldr     r1, [sp, #0xe8]
00089364  ldr     r0, [sp, #0x8c]
00089366  blx     #0xddbfc ; -> objc_msgSend
0008936a  ldr     r1, [sp, #0xe8]
0008936c  ldr     r2, [sp, #0xd0]
0008936e  str     r0, [sp, #0x60]
00089370  ldr     r0, [sp, #0x8c]
00089372  blx     #0xddbfc ; -> objc_msgSend
00089376  ldr     r1, [sp, #0xdc]
00089378  movs    r2, #4
0008937a  str     r0, [sp, #0x64]
0008937c  ldr     r0, [sp, #0x60]
0008937e  blx     #0xddbfc ; -> objc_msgSend
00089382  ldr     r4, [sp, #0x10]
00089384  add     r2, sp, #0x210
00089386  movs    r3, #7
00089388  adds    r2, #3
0008938a  str     r3, [r4]
0008938c  mov     r1, r0
0008938e  add     r0, sp, #0x200
00089390  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00089394  ldr.w   r3, [pc, #0x56c]
00089398  add.w   lr, sp, #0xf4
0008939c  movs    r2, #6
0008939e  add     r3, pc ; -> 0x000f3370  0x0
000893a0  str.w   lr, [sp, #0xc]
000893a4  ldr     r3, [r3]
000893a6  str     r3, [sp, #0xbc]
000893a8  adds    r3, #0xc
000893aa  str     r3, [sp, #0x1fc]
000893ac  str.w   r2, [lr]
000893b0  ldr     r0, [sp, #0x6c]
000893b2  ldr     r1, [sp, #0x70]
000893b4  blx     #0xddbfc ; -> objc_msgSend
000893b8  mov     r2, r0
000893ba  ldr     r1, [sp, #0x68]
000893bc  ldr     r0, [sp, #0x64]
000893be  blx     #0xddbfc ; -> objc_msgSend
000893c2  tst.w   r0, #0xff
000893c6  bne.w   #0x89268
000893ca  ldr     r1, [sp, #0xc]
000893cc  movs    r2, #6
000893ce  str     r2, [r1]
000893d0  ldr     r0, [sp, #0x74]
000893d2  ldr     r1, [sp, #0x78]
000893d4  blx     #0xddbfc ; -> objc_msgSend
000893d8  mov     r2, r0
000893da  ldr     r1, [sp, #0xdc]
000893dc  ldr     r0, [sp, #0x64]
000893de  blx     #0xddbfc ; -> objc_msgSend
000893e2  ldr     r4, [sp, #0xc]
000893e4  add     r2, sp, #0x210
000893e6  mov     r1, r0
000893e8  movs    r3, #3
000893ea  add     r0, sp, #0x1f4
000893ec  str     r3, [r4]
000893ee  adds    r2, #1
000893f0  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000893f4  movs    r3, #2
000893f6  add     r0, sp, #0x1fc
000893f8  str     r3, [r4]
000893fa  add     r1, sp, #0x1f4
000893fc  blx     #0xdd518 ; -> ZNSs6assignERKSs
00089400  ldr     r3, [sp, #0x1f4]
00089402  ldr     r1, [sp, #0xbc]
00089404  sub.w   r0, r3, #0xc
00089408  cmp     r1, r0
0008940a  beq.w   #0x89298
0008940e  subs    r2, r3, #4
00089410  ldr     r3, [r3, #-0x4]
00089414  subs    r1, r3, #1
00089416  dmb     ish
0008941a  mov     ip, r3
0008941c  ldrex   r4, [r2]
00089420  cmp     r4, r3
00089422  beq.w   #0x8966c
00089426  cmp     r4, ip
00089428  mov     r3, r4
0008942a  bne     #0x89414
0008942c  cmp     r4, #0
0008942e  bgt.w   #0x89298
00089432  add     r1, sp, #0x208
00089434  adds    r1, #5
00089436  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008943a  b       #0x89298
0008943c  str     r0, [sp, #0x7c]
0008943e  ldr.w   r3, [pc, #0x4c8]
00089442  add     r1, sp, #0xf4
00089444  ldr.w   r2, [pc, #0x4c4]
00089448  add     r3, pc ; -> 0x000fdc14  
0008944a  movs    r4, #0
0008944c  ldr     r3, [r3]
0008944e  str     r4, [sp]
00089450  mov.w   r0, #-1
00089454  add     r2, pc ; -> 0x0017edc4  
00089456  str     r3, [sp, #0x50]
00089458  ldr.w   r3, [pc, #0x4b4]
0008945c  add     r3, pc ; -> 0x000fcf60  
0008945e  ldr     r3, [r3]
00089460  str     r3, [sp, #0x54]
00089462  ldr.w   r3, [pc, #0x4b0]
00089466  str     r0, [r1]
00089468  ldr     r1, [sp, #0x54]
0008946a  add     r3, pc ; -> 0x0017edd4  
0008946c  ldr     r0, [sp, #0x50]
0008946e  blx     #0xddbfc ; -> objc_msgSend
00089472  ldr.w   r1, [pc, #0x4a4]
00089476  ldr.w   r2, [pc, #0x4a4]
0008947a  ldr     r3, [sp, #0x7c]
0008947c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
0008947e  add     r2, pc ; -> 0x0017ef54  
00089480  ldr     r1, [r1]
00089482  str     r0, [sp, #0x58]
00089484  ldr.w   r0, [pc, #0x498]
00089488  add     r0, pc ; -> 0x000fdb5c  
0008948a  ldr     r0, [r0]
0008948c  blx     #0xddbfc ; -> objc_msgSend
00089490  ldr.w   r3, [pc, #0x490]
00089494  ldr     r1, [sp, #0x54]
00089496  str     r4, [sp]
00089498  add     r3, pc ; -> 0x0017ef64  
0008949a  mov     r2, r0
0008949c  ldr     r0, [sp, #0x50]
0008949e  blx     #0xddbfc ; -> objc_msgSend
000894a2  ldr.w   r1, [pc, #0x484]
000894a6  ldr     r3, [sp, #0x58]
000894a8  add     r1, pc ; -> 0x000fcf5c  
000894aa  ldr     r1, [r1]
000894ac  mov     r2, r0
000894ae  ldr.w   r0, [pc, #0x47c]
000894b2  add     r0, pc ; -> 0x000fdb44  
000894b4  ldr     r0, [r0]
000894b6  blx     #0xddbfc ; -> objc_msgSend
000894ba  ldr.w   r1, [pc, #0x474]
000894be  ldr     r2, [sp, #0x24]
000894c0  add     r1, pc ; -> 0x000fcf70  
000894c2  ldr     r1, [r1]
000894c4  str     r0, [sp, #0x5c]
000894c6  ldr.w   r0, [pc, #0x46c]
000894ca  add     r0, pc ; -> 0x000fdbf0  
000894cc  ldr     r0, [r0]
000894ce  blx     #0xddbfc ; -> objc_msgSend
000894d2  ldr.w   r1, [pc, #0x464]
000894d6  ldr.w   r2, [pc, #0x464]
000894da  ldr     r3, [sp, #0x5c]
000894dc  add     r1, pc ; -> 0x000fcde4  '\x0c5\x0e'
000894de  add     r2, pc ; -> 0x0017ee04  
000894e0  ldr     r1, [r1]
000894e2  blx     #0xddbfc ; -> objc_msgSend
000894e6  ldr.w   r0, [pc, #0x458]
000894ea  add     r0, pc ; -> 0x00379bd0  m_connection
000894ec  ldr     r0, [r0]
000894ee  bl      #0x88d6c ; -> ZN12FBConnection12ClearFriendsEv
000894f2  b       #0x8902e
000894f4  movs    r3, #0x10
000894f6  str     r3, [sp]
000894f8  add     r3, sp, #0xf4
000894fa  mov.w   r2, #-1
000894fe  str     r2, [r3]
00089500  ldr     r0, [sp, #0x1c]
00089502  ldr     r1, [sp, #0x40]
00089504  add     r2, sp, #0x1c4
00089506  add     r3, sp, #0x164
00089508  blx     #0xddbfc ; -> objc_msgSend
0008950c  cmp     r0, #0
0008950e  beq     #0x8943e
00089510  ldr     r3, [sp, #0x1cc]
00089512  str     r0, [sp, #0x80]
00089514  b       #0x89110
00089516  movs    r3, #0x10
00089518  str     r3, [sp]
0008951a  add     r3, sp, #0xf4
0008951c  mov.w   r2, #-1
00089520  str     r2, [r3]
00089522  ldr     r0, [sp, #0x1c]
00089524  ldr     r1, [sp, #0xec]
00089526  add     r2, sp, #0x1a4
00089528  add     r3, sp, #0x124
0008952a  blx     #0xddbfc ; -> objc_msgSend
0008952e  cmp     r0, #0
00089530  beq.w   #0x8902e
00089534  ldr     r1, [sp, #0xd8]
00089536  ldr     r3, [sp, #0x1ac]
00089538  str     r0, [sp, #0x90]
0008953a  str     r1, [sp, #0x88]
0008953c  b       #0x89262
0008953e  subs    r2, r3, #4
00089540  ldr     r3, [r3, #-0x4]
00089544  subs    r1, r3, #1
00089546  dmb     ish
0008954a  mov     ip, r3
0008954c  ldrex   lr, [r2]
00089550  cmp     lr, r3
00089552  beq     #0x8964c
00089554  cmp     lr, ip
00089556  mov     r3, lr
00089558  bne     #0x89544
0008955a  cmp.w   lr, #0
0008955e  bgt.w   #0x8930e
00089562  add     r1, sp, #0x200
00089564  adds    r1, #5
00089566  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008956a  b       #0x8930e
0008956c  subs    r2, r3, #4
0008956e  ldr     r3, [r3, #-0x4]
00089572  subs    r1, r3, #1
00089574  dmb     ish
00089578  mov     ip, r3
0008957a  ldrex   r4, [r2]
0008957e  cmp     r4, r3
00089580  beq     #0x8963c
00089582  cmp     r4, ip
00089584  mov     r3, r4
00089586  bne     #0x89572
00089588  cmp     r4, #0
0008958a  bgt.w   #0x89300
0008958e  add     r1, sp, #0x200
00089590  adds    r1, #7
00089592  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089596  b       #0x89300
00089598  subs    r2, r3, #4
0008959a  ldr     r3, [r3, #-0x4]
0008959e  subs    r1, r3, #1
000895a0  dmb     ish
000895a4  mov     ip, r3
000895a6  ldrex   r4, [r2]
000895aa  cmp     r4, r3
000895ac  beq     #0x8962c
000895ae  cmp     r4, ip
000895b0  mov     r3, r4
000895b2  bne     #0x8959e
000895b4  cmp     r4, #0
000895b6  bgt.w   #0x892f2
000895ba  add     r1, sp, #0x208
000895bc  adds    r1, #1
000895be  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000895c2  b       #0x892f2
000895c4  subs    r2, r3, #4
000895c6  ldr     r3, [r3, #-0x4]
000895ca  subs    r1, r3, #1
000895cc  dmb     ish
000895d0  mov     ip, r3
000895d2  ldrex   r4, [r2]
000895d6  cmp     r4, r3
000895d8  beq     #0x8961c
000895da  cmp     r4, ip
000895dc  mov     r3, r4
000895de  bne     #0x895ca
000895e0  cmp     r4, #0
000895e2  bgt.w   #0x892e4
000895e6  add     r1, sp, #0x208
000895e8  adds    r1, #2
000895ea  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000895ee  b       #0x892e4
000895f0  subs    r2, r3, #4
000895f2  ldr     r3, [r3, #-0x4]
000895f6  subs    r1, r3, #1
000895f8  dmb     ish
000895fc  mov     ip, r3
000895fe  ldrex   r4, [r2]
00089602  cmp     r4, r3
00089604  beq     #0x8965c
00089606  cmp     r4, ip
00089608  mov     r3, r4
0008960a  bne     #0x895f6
0008960c  cmp     r4, #0
0008960e  bgt.w   #0x89298
00089612  add     r1, sp, #0x208
00089614  adds    r1, #7
00089616  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008961a  b       #0x89298
0008961c  strex   lr, r1, [r2]
00089620  cmp.w   lr, #0
00089624  bne     #0x895d2
00089626  dmb     ish
0008962a  b       #0x895da
0008962c  strex   lr, r1, [r2]
00089630  cmp.w   lr, #0
00089634  bne     #0x895a6
00089636  dmb     ish
0008963a  b       #0x895ae
0008963c  strex   lr, r1, [r2]
00089640  cmp.w   lr, #0
00089644  bne     #0x8957a
00089646  dmb     ish
0008964a  b       #0x89582
0008964c  strex   r4, r1, [r2]
00089650  cmp     r4, #0
00089652  bne.w   #0x8954c
00089656  dmb     ish
0008965a  b       #0x89554
0008965c  strex   lr, r1, [r2]
00089660  cmp.w   lr, #0
00089664  bne     #0x895fe
00089666  dmb     ish
0008966a  b       #0x89606
0008966c  strex   lr, r1, [r2]
00089670  cmp.w   lr, #0
00089674  bne.w   #0x8941c
00089678  dmb     ish
0008967c  b       #0x89426
0008967e  add     r3, sp, #0xf4
00089680  add     r0, sp, #0xf8
00089682  ldr     r3, [r3]
00089684  ldr     r0, [r0]
00089686  cmp     r3, #1
00089688  beq.w   #0x897c0
0008968c  cmp     r3, #2
0008968e  beq     #0x896be
00089690  cmp     r3, #3
00089692  beq.w   #0x897d2
00089696  cmp     r3, #4
00089698  beq     #0x896be
0008969a  cmp     r3, #5
0008969c  beq     #0x896be
0008969e  cmp     r3, #6
000896a0  beq     #0x896de
000896a2  ldr     r3, [sp, #0x1f0]
000896a4  ldr     r4, [sp, #0xbc]
000896a6  str     r0, [sp, #0xa8]
000896a8  sub.w   r0, r3, #0xc
000896ac  cmp     r4, r0
000896ae  bne     #0x89786
000896b0  ldr     r3, [sp, #0x1ec]
000896b2  ldr     r1, [sp, #0xbc]
000896b4  sub.w   r0, r3, #0xc
000896b8  cmp     r1, r0
000896ba  bne     #0x8975c
000896bc  ldr     r0, [sp, #0xa8]
000896be  ldr     r3, [sp, #0x1fc]
000896c0  ldr     r2, [sp, #0xbc]
000896c2  str     r0, [sp, #0xac]
000896c4  sub.w   r0, r3, #0xc
000896c8  cmp     r2, r0
000896ca  bne     #0x89716
000896cc  ldr     r3, [sp, #0x200]
000896ce  ldr     r4, [sp, #0xbc]
000896d0  ldr     r2, [sp, #0xac]
000896d2  sub.w   r0, r3, #0xc
000896d6  cmp     r4, r0
000896d8  str     r2, [sp, #0xb0]
000896da  bne     #0x896ea
000896dc  ldr     r0, [sp, #0xb0]
000896de  add     r3, sp, #0xf4
000896e0  mov.w   r2, #-1
000896e4  str     r2, [r3]
000896e6  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000896ea  subs    r2, r3, #4
000896ec  ldr     r3, [r3, #-0x4]
000896f0  subs    r1, r3, #1
000896f2  dmb     ish
000896f6  mov     ip, r3
000896f8  ldrex   lr, [r2]
000896fc  cmp     lr, r3
000896fe  beq     #0x8973e
00089700  cmp     lr, ip
00089702  mov     r3, lr
00089704  bne     #0x896f0
00089706  cmp.w   lr, #0
0008970a  bgt     #0x896dc
0008970c  add     r1, sp, #0x200
0008970e  adds    r1, #6
00089710  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089714  b       #0x896dc
00089716  subs    r2, r3, #4
00089718  ldr     r3, [r3, #-0x4]
0008971c  subs    r1, r3, #1
0008971e  dmb     ish
00089722  mov     ip, r3
00089724  ldrex   r4, [r2]
00089728  cmp     r4, r3
0008972a  beq     #0x8974c
0008972c  cmp     r4, ip
0008972e  mov     r3, r4
00089730  bne     #0x8971c
00089732  cmp     r4, #0
00089734  bgt     #0x896cc
00089736  add     r1, sp, #0x208
00089738  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008973c  b       #0x896cc
0008973e  strex   r4, r1, [r2]
00089742  cmp     r4, #0
00089744  bne     #0x896f8
00089746  dmb     ish
0008974a  b       #0x89700
0008974c  strex   lr, r1, [r2]
00089750  cmp.w   lr, #0
00089754  bne     #0x89724
00089756  dmb     ish
0008975a  b       #0x8972c
0008975c  subs    r2, r3, #4
0008975e  ldr     r3, [r3, #-0x4]
00089762  subs    r1, r3, #1
00089764  dmb     ish
00089768  mov     ip, r3
0008976a  ldrex   r4, [r2]
0008976e  cmp     r4, r3
00089770  beq     #0x897b0
00089772  cmp     r4, ip
00089774  mov     r3, r4
00089776  bne     #0x89762
00089778  cmp     r4, #0
0008977a  bgt     #0x896bc
0008977c  add     r1, sp, #0x208
0008977e  adds    r1, #3
00089780  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089784  b       #0x896bc
00089786  subs    r2, r3, #4
00089788  ldr     r3, [r3, #-0x4]
0008978c  subs    r1, r3, #1
0008978e  dmb     ish
00089792  mov     ip, r3
00089794  ldrex   lr, [r2]
00089798  cmp     lr, r3
0008979a  beq     #0x89846
0008979c  cmp     lr, ip
0008979e  mov     r3, lr
000897a0  bne     #0x8978c
000897a2  cmp.w   lr, #0
000897a6  bgt     #0x896b0
000897a8  add     r1, sp, #0x20c
000897aa  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000897ae  b       #0x896b0
000897b0  strex   lr, r1, [r2]
000897b4  cmp.w   lr, #0
000897b8  bne     #0x8976a
000897ba  dmb     ish
000897be  b       #0x89772
000897c0  ldr     r3, [sp, #0x1f4]
000897c2  ldr     r2, [sp, #0xbc]
000897c4  str     r0, [sp, #0xa4]
000897c6  sub.w   r0, r3, #0xc
000897ca  cmp     r2, r0
000897cc  bne     #0x897e4
000897ce  ldr     r0, [sp, #0xa4]
000897d0  b       #0x896be
000897d2  ldr     r3, [sp, #0x1f8]
000897d4  ldr     r2, [sp, #0xbc]
000897d6  str     r0, [sp, #0xa0]
000897d8  sub.w   r0, r3, #0xc
000897dc  cmp     r2, r0
000897de  bne     #0x8980e
000897e0  ldr     r0, [sp, #0xa0]
000897e2  b       #0x896be
000897e4  subs    r2, r3, #4
000897e6  ldr     r3, [r3, #-0x4]
000897ea  subs    r1, r3, #1
000897ec  dmb     ish
000897f0  mov     ip, r3
000897f2  ldrex   r4, [r2]
000897f6  cmp     r4, r3
000897f8  beq     #0x89836
000897fa  cmp     r4, ip
000897fc  mov     r3, r4
000897fe  bne     #0x897ea
00089800  cmp     r4, #0
00089802  bgt     #0x897ce
00089804  add     r1, sp, #0x208
00089806  adds    r1, #6
00089808  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008980c  b       #0x897ce
0008980e  subs    r2, r3, #4
00089810  ldr     r3, [r3, #-0x4]
00089814  subs    r1, r3, #1
00089816  dmb     ish
0008981a  mov     ip, r3
0008981c  ldrex   r4, [r2]
00089820  cmp     r4, r3
00089822  beq     #0x89854
00089824  cmp     r4, ip
00089826  mov     r3, r4
00089828  bne     #0x89814
0008982a  cmp     r4, #0
0008982c  bgt     #0x897e0
0008982e  add     r1, sp, #0x210
00089830  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00089834  b       #0x897e0
00089836  strex   lr, r1, [r2]
0008983a  cmp.w   lr, #0
0008983e  bne     #0x897f2
00089840  dmb     ish
00089844  b       #0x897fa
00089846  strex   r4, r1, [r2]
0008984a  cmp     r4, #0
0008984c  bne     #0x89794
0008984e  dmb     ish
00089852  b       #0x8979c
00089854  strex   lr, r1, [r2]
00089858  cmp.w   lr, #0
0008985c  bne     #0x8981c
0008985e  dmb     ish
00089862  b       #0x89824
00089864  adr     r0, #0x2d8
00089866  movs    r6, r0
00089868  strh    r2, [r6, r0]
0008986a  movs    r6, r0
0008986c  lsls    r6, r7, #0x1b
0008986e  movs    r0, r0
00089870  ldrsh   r0, [r1, r5]
00089872  movs    r7, r1
00089874  subs    r7, #0xa8
00089876  movs    r7, r0
00089878  subs    r3, #0x48
0008987a  movs    r7, r0
0008987c  ldrsh   r2, [r2, r4]
0008987e  movs    r7, r1
00089880  subs    r2, #0xa0
00089882  movs    r7, r0
00089884  subs    r2, #0xe8
00089886  movs    r7, r0
00089888  ldrsh   r6, [r0, r4]
0008988a  movs    r7, r1
0008988c  lsrs    r0, r2, #0xf
0008988e  movs    r7, r5
00089890  subs    r7, #0x66
00089892  movs    r7, r0
00089894  ldrsh   r0, [r3, r3]
00089896  movs    r7, r1
00089898  ldrsh   r4, [r6, r2]
0008989a  movs    r7, r1
0008989c  ldrsh   r2, [r5, r2]
0008989e  movs    r7, r1
000898a0  ldrb    r6, [r5, r7]
000898a2  movs    r7, r1
000898a4  subs    r0, #0xec
000898a6  movs    r7, r0
000898a8  subs    r1, #0xf4
000898aa  movs    r7, r0
000898ac  ldrsh   r4, [r0, r1]
000898ae  movs    r7, r1
000898b0  subs    r4, #0xc0
000898b2  movs    r7, r0
000898b4  ldr     r2, [pc, #0x170]
000898b6  movs    r7, r0
000898b8  subs    r1, #0x96
000898ba  movs    r7, r0
000898bc  ldrsh   r2, [r3, r0]
000898be  movs    r7, r1
000898c0  ldrb    r0, [r3, r1]
000898c2  movs    r7, r1
000898c4  ldrb    r4, [r2, r1]
000898c6  movs    r7, r1
000898c8  adds    r7, #0xc0
000898ca  movs    r7, r0
000898cc  ldrb    r0, [r7, r3]
000898ce  movs    r7, r1
000898d0  ldrsb   r6, [r5, r5]
000898d2  movs    r7, r1
000898d4  subs    r0, #0xcc
000898d6  movs    r7, r0
000898d8  ldrb    r0, [r3, r5]
000898da  movs    r7, r1
000898dc  subs    r3, #0x94
000898de  movs    r7, r0
000898e0  subs    r5, #0x3a
000898e2  movs    r7, r0
000898e4  subs    r4, #0x48
000898e6  movs    r7, r0
000898e8  ldr     r1, [pc, #0x328]
000898ea  movs    r7, r0
000898ec  adds    r7, #0xc0
000898ee  movs    r7, r0
000898f0  ldr     r1, [pc, #0x18]
000898f2  movs    r7, r0
000898f4  subs    r4, #0xf8
000898f6  movs    r7, r0
000898f8  stm     r7!, {r1, r6}
000898fa  movs    r6, r1
000898fc  lsrs    r4, r2, #4
000898fe  movs    r7, r5
00089900  ldrb    r4, [r6, r2]
00089902  movs    r7, r1
00089904  ldr     r7, [sp, #0x338]
00089906  movs    r6, r0
00089908  blx     sb
0008990a  movs    r7, r0
0008990c  ldr     r4, [r5, r5]
0008990e  movs    r7, r1
00089910  subs    r3, #0
00089912  movs    r7, r0
00089914  ldr     r6, [r4, r5]
00089916  movs    r7, r1
00089918  adds    r6, #0x20
0008991a  movs    r7, r0
0008991c  ldrh    r2, [r2, r3]
0008991e  movs    r7, r1
00089920  mov     r8, sl
00089922  movs    r7, r0
00089924  ldrh    r0, [r1, r3]
00089926  movs    r7, r1
00089928  subs    r2, #0xb0
0008992a  movs    r7, r0
0008992c  mov     lr, r1
0008992e  movs    r7, r0
00089930  subs    r2, #0xac
00089932  movs    r7, r0
00089934  bx      r4
00089936  movs    r7, r0
00089938  subs    r1, #4
0008993a  movs    r7, r0
0008993c  ldr     r2, [r4, r4]
0008993e  movs    r7, r1
00089940  lsls    r2, r4, #0x1b
00089942  movs    r7, r5
