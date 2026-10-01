========================================================================
-[FBRequest generateSig]  0x0008652c  584 bytes   FBRequest.m
========================================================================

0008652c  push    {r4, r5, r6, r7, lr}
0008652e  add     r7, sp, #0xc
00086530  push.w  {r8, sl, fp}
00086534  sub     sp, #0x90
00086536  ldr     r1, [pc, #0x1d4]
00086538  mov     fp, r0
0008653a  ldr     r0, [pc, #0x1d4]
0008653c  add     r1, pc ; -> 0x000fce90  
0008653e  add     r0, pc ; -> 0x000fdbf8  
00086540  ldr     r1, [r1]
00086542  ldr     r0, [r0]
00086544  blx     #0xddbfc ; -> objc_msgSend
00086548  ldr     r3, [pc, #0x1c8]
0008654a  ldr     r1, [pc, #0x1cc]
0008654c  add     r3, pc ; -> 0x000f59d0  OBJC_IVAR_$_FBRequest._params
0008654e  add     r1, pc ; -> 0x000fce70  'F=\x0e'
00086550  ldr     r3, [r3]
00086552  ldr     r1, [r1]
00086554  str     r0, [sp, #8]
00086556  ldr.w   r0, [fp, r3]
0008655a  blx     #0xddbfc ; -> objc_msgSend
0008655e  ldr     r1, [pc, #0x1bc]
00086560  ldr     r2, [pc, #0x1bc]
00086562  add     r1, pc ; -> 0x000fce88  'o=\x0e'
00086564  add     r2, pc ; -> 0x000fce8c  
00086566  ldr     r1, [r1]
00086568  ldr     r2, [r2]
0008656a  blx     #0xddbfc ; -> objc_msgSend
0008656e  ldr     r1, [pc, #0x1b4]
00086570  movs    r3, #0
00086572  str     r3, [sp, #0x70]
00086574  add     r1, pc ; -> 0x000fce84  '^=\x0e'
00086576  str     r3, [sp, #0x74]
00086578  ldr     r1, [r1]
0008657a  str     r3, [sp, #0x78]
0008657c  str     r3, [sp, #0x7c]
0008657e  str     r3, [sp, #0x80]
00086580  str     r3, [sp, #0x84]
00086582  str     r3, [sp, #0x88]
00086584  str     r3, [sp, #0x8c]
00086586  str     r1, [sp, #0xc]
00086588  str     r0, [sp, #0x28]
0008658a  blx     #0xddbfc ; -> objc_msgSend
0008658e  ldr     r1, [pc, #0x198]
00086590  movs    r3, #0x10
00086592  add     r2, sp, #0x70
00086594  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
00086596  str     r3, [sp]
00086598  ldr     r1, [r1]
0008659a  add     r3, sp, #0x30
0008659c  str     r1, [sp, #0x14]
0008659e  str     r0, [sp, #0x10]
000865a0  blx     #0xddbfc ; -> objc_msgSend
000865a4  cmp     r0, #0
000865a6  beq     #0x86670
000865a8  ldr     r1, [pc, #0x180]
000865aa  ldr     r3, [sp, #0x78]
000865ac  ldr     r2, [pc, #0x180]
000865ae  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000865b0  mov     sl, r0
000865b2  ldr     r1, [r1]
000865b4  ldr     r3, [r3]
000865b6  str     r2, [sp, #4]
000865b8  str     r1, [sp, #0x18]
000865ba  ldr     r1, [pc, #0x178]
000865bc  str     r3, [sp, #0x2c]
000865be  ldr     r3, [pc, #0x178]
000865c0  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000865c2  ldr     r1, [r1]
000865c4  add     r3, pc ; -> 0x000fdb5c  
000865c6  ldr     r3, [r3]
000865c8  str     r1, [sp, #0x1c]
000865ca  ldr     r1, [pc, #0x170]
000865cc  str     r3, [sp, #0x20]
000865ce  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000865d0  ldr     r3, [sp, #0x2c]
000865d2  ldr     r1, [r1]
000865d4  str     r1, [sp, #0x24]
000865d6  ldr     r1, [pc, #0x168]
000865d8  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000865da  ldr.w   r8, [r1]
000865de  movs    r6, #0
000865e0  b       #0x865ec
000865e2  adds    r6, #1
000865e4  cmp     sl, r6
000865e6  bls     #0x86656
000865e8  ldr     r3, [sp, #0x78]
000865ea  ldr     r3, [r3]
000865ec  ldr     r2, [sp, #0x2c]
000865ee  cmp     r2, r3
000865f0  beq     #0x865fe
000865f2  ldr     r1, [sp, #0xc]
000865f4  ldr     r0, [sp, #0x28]
000865f6  blx     #0xddbfc ; -> objc_msgSend
000865fa  blx     #0xddbe4 ; -> objc_enumerationMutation
000865fe  ldr     r3, [sp, #4]
00086600  ldr     r2, [sp, #0x74]
00086602  ldr     r1, [sp, #0x18]
00086604  add     r3, pc
00086606  ldr.w   r4, [r2, r6, lsl #2]
0008660a  ldr     r3, [r3]
0008660c  mov     r2, r4
0008660e  ldr.w   r0, [fp, r3]
00086612  blx     #0xddbfc ; -> objc_msgSend
00086616  ldr     r1, [sp, #0x24]
00086618  mov     r5, r0
0008661a  ldr     r0, [sp, #0x20]
0008661c  blx     #0xddbfc ; -> objc_msgSend
00086620  ldr     r1, [sp, #0x1c]
00086622  mov     r2, r0
00086624  mov     r0, r5
00086626  blx     #0xddbfc ; -> objc_msgSend
0008662a  tst.w   r0, #0xff
0008662e  beq     #0x865e2
00086630  ldr     r0, [sp, #8]
00086632  mov     r1, r8
00086634  mov     r2, r4
00086636  blx     #0xddbfc ; -> objc_msgSend
0008663a  ldr     r2, [pc, #0x108]
0008663c  ldr     r0, [sp, #8]
0008663e  mov     r1, r8
00086640  add     r2, pc ; -> 0x0017ec04  
00086642  blx     #0xddbfc ; -> objc_msgSend
00086646  adds    r6, #1
00086648  ldr     r0, [sp, #8]
0008664a  mov     r1, r8
0008664c  mov     r2, r5
0008664e  blx     #0xddbfc ; -> objc_msgSend
00086652  cmp     sl, r6
00086654  bhi     #0x865e8
00086656  movs    r3, #0x10
00086658  ldr     r0, [sp, #0x10]
0008665a  str     r3, [sp]
0008665c  ldr     r1, [sp, #0x14]
0008665e  add     r2, sp, #0x70
00086660  add     r3, sp, #0x30
00086662  blx     #0xddbfc ; -> objc_msgSend
00086666  cbz     r0, #0x86670
00086668  ldr     r3, [sp, #0x78]
0008666a  mov     sl, r0
0008666c  ldr     r3, [r3]
0008666e  b       #0x865de
00086670  ldr     r1, [pc, #0xd4]
00086672  mov     r0, fp
00086674  add     r1, pc ; -> 0x000fce78  'F;\x0e'
00086676  ldr     r1, [r1]
00086678  blx     #0xddbfc ; -> objc_msgSend
0008667c  tst.w   r0, #0xff
00086680  beq     #0x866a0
00086682  ldr     r4, [pc, #0xc8]
00086684  ldr     r1, [pc, #0xc8]
00086686  add     r4, pc ; -> 0x000f59c0  OBJC_IVAR_$_FBRequest._session
00086688  add     r1, pc ; -> 0x000fcde0  '<=\x0e'
0008668a  ldr     r3, [r4]
0008668c  ldr     r5, [r1]
0008668e  ldr.w   r0, [fp, r3]
00086692  mov     r1, r5
00086694  blx     #0xddbfc ; -> objc_msgSend
00086698  cbz     r0, #0x866d4
0008669a  ldr     r1, [pc, #0xb8]
0008669c  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
0008669e  b       #0x866bc
000866a0  ldr     r4, [pc, #0xb4]
000866a2  ldr     r1, [pc, #0xb8]
000866a4  add     r4, pc ; -> 0x000f59c0  OBJC_IVAR_$_FBRequest._session
000866a6  add     r1, pc ; -> 0x000fce6c  '.=\x0e'
000866a8  ldr     r3, [r4]
000866aa  ldr     r5, [r1]
000866ac  ldr.w   r0, [fp, r3]
000866b0  mov     r1, r5
000866b2  blx     #0xddbfc ; -> objc_msgSend
000866b6  cbz     r0, #0x866ec
000866b8  ldr     r1, [pc, #0xa4]
000866ba  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000866bc  ldr     r3, [r4]
000866be  ldr     r6, [r1]
000866c0  mov     r1, r5
000866c2  ldr.w   r0, [fp, r3]
000866c6  blx     #0xddbfc ; -> objc_msgSend
000866ca  mov     r1, r6
000866cc  mov     r2, r0
000866ce  ldr     r0, [sp, #8]
000866d0  blx     #0xddbfc ; -> objc_msgSend
000866d4  ldr     r1, [pc, #0x8c]
000866d6  mov     r0, fp
000866d8  ldr     r2, [sp, #8]
000866da  add     r1, pc ; -> 0x000fce74  'V;\x0e'
000866dc  ldr     r1, [r1]
000866de  blx     #0xddbfc ; -> objc_msgSend
000866e2  sub.w   sp, r7, #0x18
000866e6  pop.w   {r8, sl, fp}
000866ea  pop     {r4, r5, r6, r7, pc}
000866ec  ldr     r4, [pc, #0x78]
000866ee  ldr     r1, [pc, #0x7c]
000866f0  add     r4, pc ; -> 0x000f59c0  OBJC_IVAR_$_FBRequest._session
000866f2  add     r1, pc ; -> 0x000fcde0  '<=\x0e'
000866f4  ldr     r3, [r4]
000866f6  ldr     r5, [r1]
000866f8  ldr.w   r0, [fp, r3]
000866fc  mov     r1, r5
000866fe  blx     #0xddbfc ; -> objc_msgSend
00086702  cmp     r0, #0
00086704  beq     #0x866d4
00086706  ldr     r1, [pc, #0x68]
00086708  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
0008670a  b       #0x866bc
0008670c  ldr     r0, [r2, #0x14]
0008670e  movs    r7, r0
00086710  strb    r6, [r6, #0x1a]
00086712  movs    r7, r0
00086714  eor     r0, r0, #0x860000
00086718  ldr     r6, [r3, #0x10]
0008671a  movs    r7, r0
0008671c  ldr     r2, [r4, #0x10]
0008671e  movs    r7, r0
00086720  ldr     r4, [r4, #0x10]
00086722  movs    r7, r0
00086724  ldr     r4, [r1, #0x10]
00086726  movs    r7, r0
00086728  str     r0, [r0, #0x40]
0008672a  movs    r7, r0
0008672c  str     r6, [r7, #0x50]
0008672e  movs    r7, r0
00086730  ubfx    r0, r8, #0, #7
00086734  ldr     r4, [r7, #8]
00086736  movs    r7, r0
00086738  strb    r4, [r2, #0x16]
0008673a  movs    r7, r0
0008673c  str     r2, [r7, #0x40]
0008673e  movs    r7, r0
00086740  ldr     r0, [r4, #8]
00086742  movs    r7, r0
00086744  strh    r0, [r0, #0x2e]
00086746  movs    r7, r1
00086748  ldr     r0, [r0]
0008674a  movs    r7, r0
