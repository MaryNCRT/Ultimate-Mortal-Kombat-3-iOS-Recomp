========================================================================
ZN6Mayhem18GetStatListRequestD2Ev  0x00098f50  1036 bytes   Mayhem.mm
========================================================================

00098f50  push    {r4, r5, r6, r7, lr}
00098f52  add     r7, sp, #0xc
00098f54  push.w  {r8, sl, fp}
00098f58  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00098f5c  sub     sp, #0x94
00098f5e  ldr     r3, [pc, #0x3dc]
00098f60  str     r0, [sp, #4]
00098f62  add     r0, sp, #0x58
00098f64  add     r3, pc ; -> 0x000f3438  0x0
00098f66  str     r7, [sp, #0x78]
00098f68  ldr     r3, [r3]
00098f6a  str.w   sp, [sp, #0x80]
00098f6e  str     r3, [sp, #0x70]
00098f70  ldr     r3, [pc, #0x3cc]
00098f72  add     r3, pc ; -> 0x000ee5a2  GCC_except_table108
00098f74  str     r3, [sp, #0x74]
00098f76  ldr     r3, [pc, #0x3cc]
00098f78  add     r3, pc ; -> 0x00099148  
00098f7a  orr     r3, r3, #1
00098f7e  str     r3, [sp, #0x7c]
00098f80  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00098f84  ldr     r3, [pc, #0x3c0]
00098f86  ldr     r2, [sp, #4]
00098f88  add     r3, pc ; -> 0x0017da64  ZTVN6Mayhem18GetStatListRequestE
00098f8a  adds    r3, #8
00098f8c  str     r3, [r2]
00098f8e  ldr     r0, [sp, #4]
00098f90  movs    r3, #3
00098f92  str     r3, [sp, #0x5c]
00098f94  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
00098f98  ldr     r3, [sp, #4]
00098f9a  ldr     r2, [r3, #0x7c]
00098f9c  ldr     r3, [pc, #0x3ac]
00098f9e  sub.w   r0, r2, #0xc
00098fa2  add     r3, pc ; -> 0x000f3370  0x0
00098fa4  ldr     r3, [r3]
00098fa6  cmp     r0, r3
00098fa8  str     r3, [sp, #0x1c]
00098faa  bne     #0x9909a
00098fac  ldr     r3, [sp, #4]
00098fae  ldr     r2, [sp, #4]
00098fb0  ldr     r4, [sp, #4]
00098fb2  adds    r2, #0x68
00098fb4  str     r2, [sp, #0x2c]
00098fb6  ldr     r3, [r3, #0x68]
00098fb8  str     r3, [sp, #0x34]
00098fba  ldr     r4, [r4, #0x6c]
00098fbc  cmp     r3, r4
00098fbe  str     r4, [sp, #0x30]
00098fc0  beq     #0x98fda
00098fc2  ldr     r4, [sp, #0x34]
00098fc4  ldr     r3, [r4]
00098fc6  mov     r0, r4
00098fc8  ldr     r2, [r3]
00098fca  movs    r3, #1
00098fcc  str     r3, [sp, #0x5c]
00098fce  blx     r2
00098fd0  ldr     r2, [sp, #0x30]
00098fd2  adds    r4, #8
00098fd4  str     r4, [sp, #0x34]
00098fd6  cmp     r2, r4
00098fd8  bne     #0x98fc2
00098fda  ldr     r2, [sp, #0x2c]
00098fdc  ldr     r0, [r2]
00098fde  cbz     r0, #0x98fe4
00098fe0  blx     #0xdd5a8 ; -> ZdlPv
00098fe4  ldr     r4, [sp, #4]
00098fe6  ldr     r3, [sp, #4]
00098fe8  adds    r3, #0x5c
00098fea  str     r3, [sp, #0x40]
00098fec  ldr     r3, [r4, #0x5c]
00098fee  ldr.w   lr, [r4, #0x60]
00098ff2  cmp     r3, lr
00098ff4  str.w   lr, [sp, #0x44]
00098ff8  it      ne
00098ffa  strne   r3, [sp, #0x54]
00098ffc  beq     #0x99018
00098ffe  ldr     r2, [sp, #0x54]
00099000  ldr     r4, [sp, #0x1c]
00099002  ldr     r3, [r2]
00099004  sub.w   r0, r3, #0xc
00099008  cmp     r4, r0
0009900a  bne     #0x99062
0009900c  ldr     r2, [sp, #0x54]
0009900e  ldr     r3, [sp, #0x44]
00099010  adds    r2, #4
00099012  cmp     r3, r2
00099014  str     r2, [sp, #0x54]
00099016  bne     #0x98ffe
00099018  ldr     r4, [sp, #0x40]
0009901a  ldr     r0, [r4]
0009901c  cbz     r0, #0x99022
0009901e  blx     #0xdd5a8 ; -> ZdlPv
00099022  ldr     r2, [sp, #4]
00099024  ldr     r4, [sp, #0x1c]
00099026  ldr     r3, [r2, #0x54]
00099028  sub.w   r0, r3, #0xc
0009902c  cmp     r4, r0
0009902e  bne     #0x990ee
00099030  ldr     r2, [sp, #4]
00099032  ldr     r4, [sp, #0x1c]
00099034  ldr     r3, [r2, #0x50]
00099036  sub.w   r0, r3, #0xc
0009903a  cmp     r4, r0
0009903c  bne     #0x990c6
0009903e  ldr     r0, [sp, #4]
00099040  mov.w   r3, #-1
00099044  str     r3, [sp, #0x5c]
00099046  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0009904a  add     r0, sp, #0x58
0009904c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00099050  sub.w   sp, r7, #0x58
00099054  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00099058  sub.w   sp, r7, #0x18
0009905c  pop.w   {r8, sl, fp}
00099060  pop     {r4, r5, r6, r7, pc}
00099062  subs    r2, r3, #4
00099064  ldr     r3, [r3, #-0x4]
00099068  subs    r1, r3, #1
0009906a  dmb     ish
0009906e  mov     ip, r3
00099070  ldrex   lr, [r2]
00099074  cmp     lr, r3
00099076  beq     #0x9908c
00099078  cmp     lr, ip
0009907a  mov     r3, lr
0009907c  bne     #0x99068
0009907e  cmp.w   lr, #0
00099082  bgt     #0x9900c
00099084  add     r1, sp, #0x90
00099086  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009908a  b       #0x9900c
0009908c  strex   r4, r1, [r2]
00099090  cmp     r4, #0
00099092  bne     #0x99070
00099094  dmb     ish
00099098  b       #0x99078
0009909a  ldr     r3, [r2, #-0x4]
0009909e  subs    r1, r2, #4
000990a0  subs    r2, r3, #1
000990a2  dmb     ish
000990a6  mov     ip, r3
000990a8  ldrex   r4, [r1]
000990ac  cmp     r4, r3
000990ae  beq     #0x99138
000990b0  cmp     r4, ip
000990b2  mov     r3, r4
000990b4  bne     #0x990a0
000990b6  cmp     r4, #0
000990b8  bgt.w   #0x98fac
000990bc  add.w   r1, sp, #0x92
000990c0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000990c4  b       #0x98fac
000990c6  subs    r2, r3, #4
000990c8  ldr     r3, [r3, #-0x4]
000990cc  subs    r1, r3, #1
000990ce  dmb     ish
000990d2  mov     ip, r3
000990d4  ldrex   r4, [r2]
000990d8  cmp     r4, r3
000990da  beq     #0x99128
000990dc  cmp     r4, ip
000990de  mov     r3, r4
000990e0  bne     #0x990cc
000990e2  cmp     r4, #0
000990e4  bgt     #0x9903e
000990e6  add     r1, sp, #0x8c
000990e8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000990ec  b       #0x9903e
000990ee  subs    r2, r3, #4
000990f0  ldr     r3, [r3, #-0x4]
000990f4  subs    r1, r3, #1
000990f6  dmb     ish
000990fa  mov     ip, r3
000990fc  ldrex   r4, [r2]
00099100  cmp     r4, r3
00099102  beq     #0x99118
00099104  cmp     r4, ip
00099106  mov     r3, r4
00099108  bne     #0x990f4
0009910a  cmp     r4, #0
0009910c  bgt     #0x99030
0009910e  add.w   r1, sp, #0x8e
00099112  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099116  b       #0x99030
00099118  strex   lr, r1, [r2]
0009911c  cmp.w   lr, #0
00099120  bne     #0x990fc
00099122  dmb     ish
00099126  b       #0x99104
00099128  strex   lr, r1, [r2]
0009912c  cmp.w   lr, #0
00099130  bne     #0x990d4
00099132  dmb     ish
00099136  b       #0x990dc
00099138  strex   lr, r2, [r1]
0009913c  cmp.w   lr, #0
00099140  bne     #0x990a8
00099142  dmb     ish
00099146  b       #0x990b0
00099148  ldr     r3, [sp, #0x5c]
0009914a  ldr     r4, [sp, #0x60]
0009914c  cmp     r3, #1
0009914e  str     r4, [sp]
00099150  beq     #0x99242
00099152  cmp     r3, #2
00099154  beq     #0x991ea
00099156  ldr     r3, [sp, #0x2c]
00099158  ldr     r0, [r3]
0009915a  cbz     r0, #0x99160
0009915c  blx     #0xdd5a8 ; -> ZdlPv
00099160  ldr     r4, [sp]
00099162  ldr     r3, [sp, #4]
00099164  ldr     r2, [sp, #4]
00099166  str     r4, [sp, #0x10]
00099168  adds    r2, #0x5c
0009916a  str     r2, [sp, #0x38]
0009916c  ldr     r2, [r3, #0x5c]
0009916e  ldr     r4, [r3, #0x60]
00099170  cmp     r2, r4
00099172  str     r4, [sp, #0x3c]
00099174  beq     #0x9919a
00099176  ldr     r3, [pc, #0x1d8]
00099178  str     r2, [sp, #0x50]
0009917a  add     r3, pc ; -> 0x000f3370  0x0
0009917c  ldr     r3, [r3]
0009917e  str     r3, [sp, #0x4c]
00099180  ldr     r2, [sp, #0x50]
00099182  ldr     r4, [sp, #0x4c]
00099184  ldr     r3, [r2]
00099186  sub.w   r0, r3, #0xc
0009918a  cmp     r0, r4
0009918c  bne     #0x99278
0009918e  ldr     r2, [sp, #0x50]
00099190  ldr     r3, [sp, #0x3c]
00099192  adds    r2, #4
00099194  cmp     r3, r2
00099196  str     r2, [sp, #0x50]
00099198  bne     #0x99180
0009919a  ldr     r4, [sp, #0x38]
0009919c  ldr     r0, [r4]
0009919e  cbz     r0, #0x991a4
000991a0  blx     #0xdd5a8 ; -> ZdlPv
000991a4  ldr     r3, [sp, #4]
000991a6  ldr     r2, [sp, #0x10]
000991a8  str     r2, [sp, #0x14]
000991aa  ldr     r1, [r3, #0x54]
000991ac  ldr     r3, [pc, #0x1a4]
000991ae  sub.w   r0, r1, #0xc
000991b2  add     r3, pc ; -> 0x000f3370  0x0
000991b4  ldr     r3, [r3]
000991b6  cmp     r0, r3
000991b8  str     r3, [sp, #0x48]
000991ba  bne.w   #0x992ee
000991be  ldr     r2, [sp, #0x14]
000991c0  ldr     r4, [sp, #4]
000991c2  str     r2, [sp, #0x18]
000991c4  ldr     r3, [r4, #0x50]
000991c6  ldr     r2, [sp, #0x48]
000991c8  sub.w   r0, r3, #0xc
000991cc  cmp     r2, r0
000991ce  bne     #0x992c2
000991d0  ldr     r2, [sp, #0x18]
000991d2  ldr     r0, [sp, #4]
000991d4  movs    r3, #0
000991d6  str     r3, [sp, #0x5c]
000991d8  str     r2, [sp]
000991da  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
000991de  ldr     r0, [sp]
000991e0  mov.w   r3, #-1
000991e4  str     r3, [sp, #0x5c]
000991e6  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000991ea  ldr     r3, [sp]
000991ec  ldr     r4, [sp, #4]
000991ee  str     r3, [sp, #8]
000991f0  ldr     r3, [pc, #0x164]
000991f2  ldr     r1, [r4, #0x7c]
000991f4  add     r3, pc ; -> 0x000f3370  0x0
000991f6  sub.w   r0, r1, #0xc
000991fa  ldr     r3, [r3]
000991fc  cmp     r0, r3
000991fe  bne     #0x9924c
00099200  ldr     r2, [sp, #8]
00099202  ldr     r4, [sp, #4]
00099204  ldr     r3, [sp, #4]
00099206  str     r2, [sp, #0xc]
00099208  adds    r3, #0x68
0009920a  ldr     r2, [sp, #4]
0009920c  str     r3, [sp, #0x20]
0009920e  ldr     r4, [r4, #0x68]
00099210  str     r4, [sp, #0x28]
00099212  ldr     r2, [r2, #0x6c]
00099214  cmp     r4, r2
00099216  str     r2, [sp, #0x24]
00099218  beq     #0x99232
0009921a  ldr     r4, [sp, #0x28]
0009921c  ldr     r3, [r4]
0009921e  mov     r0, r4
00099220  ldr     r2, [r3]
00099222  movs    r3, #2
00099224  str     r3, [sp, #0x5c]
00099226  blx     r2
00099228  ldr     r2, [sp, #0x24]
0009922a  adds    r4, #8
0009922c  str     r4, [sp, #0x28]
0009922e  cmp     r2, r4
00099230  bne     #0x9921a
00099232  ldr     r3, [sp, #0x20]
00099234  ldr     r0, [r3]
00099236  cbz     r0, #0x9923c
00099238  blx     #0xdd5a8 ; -> ZdlPv
0009923c  ldr     r4, [sp, #0xc]
0009923e  str     r4, [sp]
00099240  b       #0x99160
00099242  ldr     r2, [sp, #0x20]
00099244  ldr     r0, [r2]
00099246  cmp     r0, #0
00099248  bne     #0x9915c
0009924a  b       #0x99160
0009924c  ldr     r3, [r1, #-0x4]
00099250  subs    r2, r1, #4
00099252  subs    r1, r3, #1
00099254  dmb     ish
00099258  mov     ip, r3
0009925a  ldrex   lr, [r2]
0009925e  cmp     lr, r3
00099260  beq     #0x992b4
00099262  cmp     lr, ip
00099264  mov     r3, lr
00099266  bne     #0x99252
00099268  cmp.w   lr, #0
0009926c  bgt     #0x99200
0009926e  add.w   r1, sp, #0x93
00099272  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099276  b       #0x99200
00099278  subs    r2, r3, #4
0009927a  ldr     r3, [r3, #-0x4]
0009927e  subs    r1, r3, #1
00099280  dmb     ish
00099284  mov     ip, r3
00099286  ldrex   lr, [r2]
0009928a  cmp     lr, r3
0009928c  beq     #0x992a6
0009928e  cmp     lr, ip
00099290  mov     r3, lr
00099292  bne     #0x9927e
00099294  cmp.w   lr, #0
00099298  bgt.w   #0x9918e
0009929c  add.w   r1, sp, #0x91
000992a0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000992a4  b       #0x9918e
000992a6  strex   r4, r1, [r2]
000992aa  cmp     r4, #0
000992ac  bne     #0x99286
000992ae  dmb     ish
000992b2  b       #0x9928e
000992b4  strex   r4, r1, [r2]
000992b8  cmp     r4, #0
000992ba  bne     #0x9925a
000992bc  dmb     ish
000992c0  b       #0x99262
000992c2  subs    r2, r3, #4
000992c4  ldr     r3, [r3, #-0x4]
000992c8  subs    r1, r3, #1
000992ca  dmb     ish
000992ce  mov     ip, r3
000992d0  ldrex   r4, [r2]
000992d4  cmp     r4, r3
000992d6  beq     #0x9931a
000992d8  cmp     r4, ip
000992da  mov     r3, r4
000992dc  bne     #0x992c8
000992de  cmp     r4, #0
000992e0  bgt.w   #0x991d0
000992e4  add.w   r1, sp, #0x8d
000992e8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000992ec  b       #0x991d0
000992ee  ldr     r3, [r1, #-0x4]
000992f2  subs    r2, r1, #4
000992f4  subs    r1, r3, #1
000992f6  dmb     ish
000992fa  mov     ip, r3
000992fc  ldrex   r4, [r2]
00099300  cmp     r4, r3
00099302  beq     #0x9932a
00099304  cmp     r4, ip
00099306  mov     r3, r4
00099308  bne     #0x992f4
0009930a  cmp     r4, #0
0009930c  bgt.w   #0x991be
00099310  add.w   r1, sp, #0x8f
00099314  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00099318  b       #0x991be
0009931a  strex   lr, r1, [r2]
0009931e  cmp.w   lr, #0
00099322  bne     #0x992d0
00099324  dmb     ish
00099328  b       #0x992d8
0009932a  strex   lr, r1, [r2]
0009932e  cmp.w   lr, #0
00099332  bne     #0x992fc
00099334  dmb     ish
00099338  b       #0x99304
0009933a  nop     
0009933c  adr     r4, #0x340
0009933e  movs    r5, r0
00099340  ldrsb   r4, [r5, r0]
00099342  movs    r5, r0
00099344  lsls    r4, r1, #7
00099346  movs    r0, r0
00099348  ldr     r2, [pc, #0x360]
0009934a  movs    r6, r1
0009934c  adr     r3, #0x328
0009934e  movs    r5, r0
00099350  adr     r1, #0x3c8
00099352  movs    r5, r0
00099354  adr     r1, #0x2e8
00099356  movs    r5, r0
00099358  adr     r1, #0x1e0
0009935a  movs    r5, r0
