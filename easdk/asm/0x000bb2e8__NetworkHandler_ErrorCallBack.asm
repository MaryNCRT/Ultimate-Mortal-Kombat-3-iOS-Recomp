========================================================================
NetworkHandler_ErrorCallBack  0x000bb2e8  600 bytes   EAMTX_Main.mm
========================================================================

000bb2e8  push    {r4, r5, r6, r7, lr}
000bb2ea  add     r7, sp, #0xc
000bb2ec  str     r8, [sp, #-0x4]!
000bb2f0  mov     r5, r3
000bb2f2  sub.w   r3, r0, #0x20
000bb2f6  cmp     r3, #0x10
000bb2f8  mov     r4, r0
000bb2fa  mov     r6, r1
000bb2fc  bhi     #0xbb302
000bb2fe  movs    r0, #0x37
000bb300  b       #0xbb4dc
000bb302  subs    r3, r0, #1
000bb304  cmp     r3, #0x35
000bb306  bhi.w   #0xbb4da
000bb30a  tbh     [pc, r3, lsl #1]
000bb30e  movs    r7, r6
000bb310  lsls    r6, r4, #3
000bb312  lsls    r5, r0, #1
000bb314  lsls    r6, r4, #3
000bb316  lsls    r6, r4, #3
000bb318  lsls    r5, r0, #1
000bb31a  lsls    r6, r4, #3
000bb31c  lsls    r6, r4, #3
000bb31e  lsls    r5, r5, #3
000bb320  lsls    r6, r4, #3
000bb322  lsls    r6, r4, #3
000bb324  lsls    r6, r4, #3
000bb326  lsls    r6, r4, #3
000bb328  lsls    r6, r4, #3
000bb32a  lsls    r6, r4, #3
000bb32c  lsls    r3, r1, #2
000bb32e  lsls    r6, r4, #3
000bb330  lsls    r6, r4, #3
000bb332  lsls    r6, r4, #3
000bb334  lsls    r5, r5, #3
000bb336  lsls    r3, r1, #2
000bb338  lsls    r5, r5, #3
000bb33a  lsls    r7, r4, #2
000bb33c  lsls    r6, r4, #3
000bb33e  lsls    r6, r4, #3
000bb340  lsls    r6, r4, #3
000bb342  lsls    r6, r4, #3
000bb344  lsls    r6, r4, #3
000bb346  lsls    r6, r4, #3
000bb348  lsls    r6, r4, #3
000bb34a  lsls    r6, r4, #3
000bb34c  lsls    r6, r4, #3
000bb34e  lsls    r6, r4, #3
000bb350  lsls    r6, r4, #3
000bb352  lsls    r6, r4, #3
000bb354  lsls    r6, r4, #3
000bb356  lsls    r6, r4, #3
000bb358  lsls    r6, r4, #3
000bb35a  lsls    r6, r4, #3
000bb35c  lsls    r6, r4, #3
000bb35e  lsls    r6, r4, #3
000bb360  lsls    r6, r4, #3
000bb362  lsls    r6, r4, #3
000bb364  lsls    r6, r4, #3
000bb366  lsls    r6, r4, #3
000bb368  lsls    r6, r4, #3
000bb36a  lsls    r6, r4, #3
000bb36c  lsls    r6, r4, #3
000bb36e  lsls    r6, r4, #3
000bb370  lsls    r6, r4, #3
000bb372  lsls    r6, r4, #3
000bb374  lsls    r6, r4, #3
000bb376  lsls    r6, r4, #3
000bb378  lsls    r4, r1, #3
000bb37a  lsls    r6, r4, #3
000bb37c  ldr     r4, [pc, #0x170]
000bb37e  add     r4, pc ; -> 0x0038c1a9  m_bDebugEnabled
000bb380  ldrb    r3, [r4]
000bb382  cmp     r3, #0
000bb384  beq.w   #0xbb4e8
000bb388  movs    r0, #0x24
000bb38a  mov     r1, r6
000bb38c  movs    r2, #0
000bb38e  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb392  movs    r3, #0
000bb394  strb    r3, [r4]
000bb396  b       #0xbb4e8
000bb398  ldr     r1, [pc, #0x158]
000bb39a  ldr.w   r5, [pc, #0x15c]
000bb39e  add     r1, pc ; -> 0x000fd4f8  
000bb3a0  add     r5, pc ; -> 0x0038c0e4  mtxController
000bb3a2  ldr.w   r8, [r1]
000bb3a6  ldr     r0, [r5]
000bb3a8  mov     r1, r8
000bb3aa  blx     #0xddbfc ; -> objc_msgSend
000bb3ae  cmp     r0, #0xe
000bb3b0  beq     #0xbb3d8
000bb3b2  ldr     r0, [r5]
000bb3b4  mov     r1, r8
000bb3b6  blx     #0xddbfc ; -> objc_msgSend
000bb3ba  cmp     r0, #0x18
000bb3bc  beq     #0xbb3d8
000bb3be  ldr     r0, [r5]
000bb3c0  mov     r1, r8
000bb3c2  blx     #0xddbfc ; -> objc_msgSend
000bb3c6  cmp     r0, #0x1c
000bb3c8  beq     #0xbb3d8
000bb3ca  ldr     r0, [r5]
000bb3cc  mov     r1, r8
000bb3ce  blx     #0xddbfc ; -> objc_msgSend
000bb3d2  cmp     r0, #0x1d
000bb3d4  bne.w   #0xbb4e2
000bb3d8  movs    r0, #0x24
000bb3da  movs    r2, #0
000bb3dc  mov     r1, r6
000bb3de  b       #0xbb3f6
000bb3e0  ldr.w   r0, [pc, #0x118]
000bb3e4  mov     r1, r8
000bb3e6  add     r0, pc ; -> 0x0038c0e4  mtxController
000bb3e8  ldr     r0, [r0]
000bb3ea  blx     #0xddbfc ; -> objc_msgSend
000bb3ee  mov     r2, r0
000bb3f0  cbnz    r0, #0xbb3fa
000bb3f2  movs    r0, #0x24
000bb3f4  mov     r1, r6
000bb3f6  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb3fa  ldr     r3, [pc, #0x104]
000bb3fc  add     r3, pc ; -> 0x0038c1ba  bWaitingForLoginButton
000bb3fe  ldrsb.w r3, [r3]
000bb402  cbnz    r3, #0xbb412
000bb404  ldr.w   r3, [pc, #0xfc]
000bb408  add     r3, pc ; -> 0x0038c1bb  bWaitingForLoginButton
000bb40a  ldrsb.w r3, [r3]
000bb40e  cmp     r3, #0
000bb410  beq     #0xbb4e8
000bb412  ldr     r3, [pc, #0xf4]
000bb414  movs    r0, #0x37
000bb416  movs    r2, #0
000bb418  add     r3, pc ; -> 0x0038c1ba  bWaitingForLoginButton
000bb41a  strb    r2, [r3]
000bb41c  mov     r1, r6
000bb41e  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb422  b       #0xbb4e8
000bb424  ldr     r4, [pc, #0xe4]
000bb426  ldr     r1, [pc, #0xe8]
000bb428  add     r4, pc ; -> 0x0038c0e4  mtxController
000bb42a  add     r1, pc ; -> 0x000fd4f8  
000bb42c  ldr     r0, [r4]
000bb42e  ldr     r1, [r1]
000bb430  blx     #0xddbfc ; -> objc_msgSend
000bb434  cmp     r0, #0xe
000bb436  bne     #0xbb4e8
000bb438  ldr     r1, [pc, #0xd8]
000bb43a  movs    r2, #0
000bb43c  ldr     r0, [r4]
000bb43e  add     r1, pc ; -> 0x000fd6b4  
000bb440  ldr     r1, [r1]
000bb442  blx     #0xddbfc ; -> objc_msgSend
000bb446  ldr     r0, [pc, #0xd0]
000bb448  ldr     r1, [pc, #0xd0]
000bb44a  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bb44c  add     r1, pc ; -> 0x000fd674  
000bb44e  ldr     r0, [r0]
000bb450  ldr     r1, [r1]
000bb452  blx     #0xddbfc ; -> objc_msgSend
000bb456  mov     r2, r0
000bb458  movs    r0, #7
000bb45a  b       #0xbb41c
000bb45c  ldr     r1, [pc, #0xc0]
000bb45e  ldr     r4, [pc, #0xc4]
000bb460  add     r1, pc ; -> 0x000fd450  
000bb462  add     r4, pc ; -> 0x0038c0e4  mtxController
000bb464  ldr     r5, [r1]
000bb466  ldr     r0, [r4]
000bb468  mov     r1, r5
000bb46a  blx     #0xddbfc ; -> objc_msgSend
000bb46e  ldr     r1, [pc, #0xb8]
000bb470  add     r1, pc ; -> 0x000fd604  
000bb472  ldr     r1, [r1]
000bb474  mov     r2, r0
000bb476  ldr     r0, [r4]
000bb478  subs    r2, #1
000bb47a  blx     #0xddbfc ; -> objc_msgSend
000bb47e  ldr     r0, [r4]
000bb480  mov     r1, r5
000bb482  blx     #0xddbfc ; -> objc_msgSend
000bb486  cmp     r0, #0
000bb488  bne     #0xbb4e8
000bb48a  ldr     r4, [pc, #0xa0]
000bb48c  adds    r0, #0x13
000bb48e  mov     r1, r6
000bb490  add     r4, pc ; -> 0x0038c0c8  restoredItems
000bb492  ldr     r2, [r4]
000bb494  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb498  ldr     r1, [pc, #0x94]
000bb49a  ldr     r0, [r4]
000bb49c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bb49e  ldr     r1, [r1]
000bb4a0  blx     #0xddbfc ; -> objc_msgSend
000bb4a4  b       #0xbb4e8
000bb4a6  tst.w   r2, #0x10000
000bb4aa  beq     #0xbb4e8
000bb4ac  ldr     r0, [pc, #0x84]
000bb4ae  ldr     r1, [pc, #0x88]
000bb4b0  uxth    r2, r2
000bb4b2  add     r0, pc ; -> 0x0017cf10  m_ModulesArray
000bb4b4  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bb4b6  ldr     r0, [r0]
000bb4b8  ldr     r1, [r1]
000bb4ba  blx     #0xddbfc ; -> objc_msgSend
000bb4be  ldr     r1, [pc, #0x7c]
000bb4c0  add     r1, pc ; -> 0x000fd648  
000bb4c2  ldr     r1, [r1]
000bb4c4  blx     #0xddbfc ; -> objc_msgSend
000bb4c8  cbz     r0, #0xbb4e8
000bb4ca  ldr     r3, [r0]
000bb4cc  mov     r1, r6
000bb4ce  mov     r2, r5
000bb4d0  ldr.w   ip, [r3, #0x10]
000bb4d4  movs    r3, #0
000bb4d6  blx     ip
000bb4d8  b       #0xbb4e8
000bb4da  movs    r0, #0x24
000bb4dc  movs    r2, #0
000bb4de  mov     r1, r6
000bb4e0  b       #0xbb41e
000bb4e2  cmp     r4, #3
000bb4e4  bne     #0xbb3fa
000bb4e6  b       #0xbb3e0
000bb4e8  ldr     r8, [sp], #4
000bb4ec  pop     {r4, r5, r6, r7, pc}
000bb4ee  nop     
000bb4f0  lsrs    r7, r4, #0x18
000bb4f2  movs    r5, r5
000bb4f4  movs    r1, #0x56
000bb4f6  movs    r4, r0
000bb4f8  lsrs    r0, r0, #0x15
000bb4fa  movs    r5, r5
000bb4fc  lsrs    r2, r7, #0x13
000bb4fe  movs    r5, r5
000bb500  lsrs    r2, r7, #0x16
000bb502  movs    r5, r5
000bb504  lsrs    r7, r5, #0x16
000bb506  movs    r5, r5
000bb508  lsrs    r6, r3, #0x16
000bb50a  movs    r5, r5
000bb50c  lsrs    r0, r7, #0x12
000bb50e  movs    r5, r5
000bb510  movs    r0, #0xca
000bb512  movs    r4, r0
000bb514  movs    r2, #0x72
000bb516  movs    r4, r0
000bb518  lsrs    r6, r5, #0x11
000bb51a  movs    r5, r5
000bb51c  movs    r2, #0x24
000bb51e  movs    r4, r0
000bb520  subs    r4, r5, #7
000bb522  movs    r4, r0
000bb524  lsrs    r6, r7, #0x11
000bb526  movs    r5, r5
000bb528  movs    r1, #0x90
000bb52a  movs    r4, r0
000bb52c  lsrs    r4, r6, #0x10
000bb52e  movs    r5, r5
000bb530  asrs    r4, r3, #0x13
000bb532  movs    r4, r0
000bb534  subs    r2, r3, r1
000bb536  movs    r4, r1
000bb538  asrs    r4, r0, #0x17
000bb53a  movs    r4, r0
000bb53c  movs    r1, #0x84
000bb53e  movs    r4, r0
