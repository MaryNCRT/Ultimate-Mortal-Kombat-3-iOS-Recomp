========================================================================
-[EAMTX_Controller Run  0x000cae64  1052 bytes   EAMTX_Controller.mm
========================================================================

000cae64  push    {r4, r5, r6, r7, lr}
000cae66  add     r7, sp, #0xc
000cae68  push.w  {r8, sl}
000cae6c  ldr     r3, [pc, #0x328]
000cae6e  mov     sl, r2
000cae70  movs    r2, #1
000cae72  add     r3, pc ; -> 0x000f9154  OBJC_IVAR_$_EAMTX_Controller.bProcessStarted
000cae74  mov     r4, r0
000cae76  ldr     r3, [r3]
000cae78  strb    r2, [r0, r3]
000cae7a  ldr     r3, [pc, #0x320]
000cae7c  add     r3, pc ; -> 0x000f3280  bRequiredToShowAlert
000cae7e  ldr     r3, [r3]
000cae80  ldrb    r3, [r3]
000cae82  cmp     r3, #0
000cae84  bne.w   #0xcb188
000cae88  ldr     r3, [pc, #0x314]
000cae8a  add     r3, pc ; -> 0x000f9134  OBJC_IVAR_$_EAMTX_Controller.bRequestInPending
000cae8c  ldr     r2, [r3]
000cae8e  ldrb    r5, [r0, r2]
000cae90  cmp     r5, #0
000cae92  bne     #0xcaf1a
000cae94  ldr.w   r8, [pc, #0x30c]
000cae98  ldr.w   r1, [pc, #0x30c]
000cae9c  add     r8, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000cae9e  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000caea0  ldr.w   r3, [r8]
000caea4  ldr     r1, [r1]
000caea6  ldr     r0, [r0, r3]
000caea8  blx     #0xddbfc ; -> objc_msgSend
000caeac  cmp     r0, #0
000caeae  beq     #0xcaf1a
000caeb0  ldr     r3, [pc, #0x2f8]
000caeb2  add     r3, pc ; -> 0x000f9158  OBJC_IVAR_$_EAMTX_Controller.mFreeSpace
000caeb4  ldr     r1, [r3]
000caeb6  add.w   r3, r4, r1
000caeba  ldr     r6, [r4, r1]
000caebc  ldr     r3, [r3, #4]
000caebe  orrs    r6, r3
000caec0  bne     #0xcaef0
000caec2  ldr     r0, [pc, #0x2ec]
000caec4  ldr     r1, [pc, #0x2ec]
000caec6  ldr     r2, [pc, #0x2f0]
000caec8  add     r0, pc ; -> 0x000fdb5c  
000caeca  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000caecc  add     r2, pc ; -> 0x0017e5c4  
000caece  ldr     r1, [r1]
000caed0  ldr     r3, [pc, #0x2e8]
000caed2  ldr     r0, [r0]
000caed4  blx     #0xddbfc ; -> objc_msgSend
000caed8  mov     r1, r6
000caeda  mov     r2, r0
000caedc  movs    r0, #0x36
000caede  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000caee2  ldr     r1, [pc, #0x2dc]
000caee4  ldr.w   r0, [r8]
000caee8  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000caeea  ldr     r0, [r4, r0]
000caeec  ldr     r1, [r1]
000caeee  b       #0xcb184
000caef0  ldr     r6, [pc, #0x2d0]
000caef2  ldr     r1, [pc, #0x2d4]
000caef4  mov     r2, r5
000caef6  add     r6, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000caef8  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000caefa  ldr     r3, [r6]
000caefc  ldr     r1, [r1]
000caefe  ldr     r0, [r4, r3]
000caf00  blx     #0xddbfc ; -> objc_msgSend
000caf04  bl      #0xbc990 ; -> Z17SendQueuedRequestP19NSMutableDictionary
000caf08  cbz     r0, #0xcaf1a
000caf0a  ldr     r1, [pc, #0x2c0]
000caf0c  ldr     r3, [r6]
000caf0e  mov     r2, r5
000caf10  add     r1, pc ; -> 0x000fced4  
000caf12  ldr     r0, [r4, r3]
000caf14  ldr     r1, [r1]
000caf16  blx     #0xddbfc ; -> objc_msgSend
000caf1a  ldr     r3, [pc, #0x2b4]
000caf1c  add     r3, pc ; -> 0x000f9138  OBJC_IVAR_$_EAMTX_Controller.bResponseInPending
000caf1e  ldr     r2, [r3]
000caf20  ldrb    r5, [r4, r2]
000caf22  cbnz    r5, #0xcaf5e
000caf24  ldr     r6, [pc, #0x2ac]
000caf26  ldr     r1, [pc, #0x2b0]
000caf28  add     r6, pc ; -> 0x000f8c18  OBJC_IVAR_$_EAMTX_Controller.responseQ
000caf2a  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000caf2c  ldr     r3, [r6]
000caf2e  ldr     r1, [r1]
000caf30  ldr     r0, [r4, r3]
000caf32  blx     #0xddbfc ; -> objc_msgSend
000caf36  cbz     r0, #0xcaf5e
000caf38  ldr     r1, [pc, #0x2a0]
000caf3a  ldr     r3, [r6]
000caf3c  mov     r2, r5
000caf3e  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000caf40  ldr     r0, [r4, r3]
000caf42  ldr     r1, [r1]
000caf44  blx     #0xddbfc ; -> objc_msgSend
000caf48  bl      #0xc24a4 ; -> Z18SendQueuedResponseP19NSMutableDictionary
000caf4c  cbz     r0, #0xcaf5e
000caf4e  ldr     r1, [pc, #0x290]
000caf50  ldr     r3, [r6]
000caf52  mov     r2, r5
000caf54  add     r1, pc ; -> 0x000fced4  
000caf56  ldr     r0, [r4, r3]
000caf58  ldr     r1, [r1]
000caf5a  blx     #0xddbfc ; -> objc_msgSend
000caf5e  ldr     r3, [pc, #0x284]
000caf60  add     r3, pc ; -> 0x000f914c  OBJC_IVAR_$_EAMTX_Controller.bForcePostEventsData
000caf62  ldr     r3, [r3]
000caf64  ldrb    r3, [r4, r3]
000caf66  cmp     r3, #0
000caf68  bne     #0xcaffa
000caf6a  ldr     r5, [pc, #0x27c]
000caf6c  add     r5, pc ; -> 0x000f9144  OBJC_IVAR_$_EAMTX_Controller.dEventsSendStartTime
000caf6e  ldr     r3, [r5]
000caf70  add     r3, r4
000caf72  vldr    d7, [r3]
000caf76  vcmp.f64 d7, #0
000caf7a  vmrs    apsr_nzcv, fpscr
000caf7e  ble     #0xcafaa
000caf80  ldr     r0, [pc, #0x268]
000caf82  ldr     r1, [pc, #0x26c]
000caf84  add     r0, pc ; -> 0x0038c1dc  appStartTime
000caf86  add     r1, pc ; -> 0x000fcef4  
000caf88  ldr     r0, [r0]
000caf8a  ldr     r1, [r1]
000caf8c  blx     #0xddbfc ; -> objc_msgSend
000caf90  ldr     r3, [r5]
000caf92  add     r3, r4
000caf94  vldr    d7, [r3]
000caf98  vneg.f64 d7, d7
000caf9c  vmov    d6, r0, r1
000cafa0  vcmpe.f64 d6, d7
000cafa4  vmrs    apsr_nzcv, fpscr
000cafa8  bmi     #0xcaffa
000cafaa  vmov.f64 d6, #-1.000000e+00
000cafae  ldr     r5, [pc, #0x244]
000cafb0  add     r5, pc ; -> 0x000f913c  OBJC_IVAR_$_EAMTX_Controller.dTimeIntervalForEventsSending
000cafb2  ldr     r3, [r5]
000cafb4  add     r3, r4
000cafb6  vldr    d7, [r3]
000cafba  vcmp.f64 d7, d6
000cafbe  vmrs    apsr_nzcv, fpscr
000cafc2  beq.w   #0xcb122
000cafc6  ldr     r0, [pc, #0x230]
000cafc8  add     r0, pc ; -> 0x0038c1d8  lastEventsSentTime
000cafca  ldr     r0, [r0]
000cafcc  cmp     r0, #0
000cafce  beq.w   #0xcb122
000cafd2  ldr.w   r1, [pc, #0x228]
000cafd6  add     r1, pc ; -> 0x000fcef4  
000cafd8  ldr     r1, [r1]
000cafda  blx     #0xddbfc ; -> objc_msgSend
000cafde  ldr     r3, [r5]
000cafe0  add     r3, r4
000cafe2  vldr    d7, [r3]
000cafe6  vneg.f64 d7, d7
000cafea  vmov    d6, r0, r1
000cafee  vcmpe.f64 d6, d7
000caff2  vmrs    apsr_nzcv, fpscr
000caff6  bpl.w   #0xcb122
000caffa  ldr.w   r0, [pc, #0x204]
000caffe  ldr.w   r1, [pc, #0x204]
000cb002  add     r0, pc ; -> 0x000f3324  mtxUserInfo
000cb004  add     r1, pc ; -> 0x000fd65c  
000cb006  ldr     r6, [r0]
000cb008  ldr     r5, [r1]
000cb00a  ldr     r0, [r6]
000cb00c  mov     r1, r5
000cb00e  blx     #0xddbfc ; -> objc_msgSend
000cb012  ldr     r1, [pc, #0x1f4]
000cb014  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000cb016  ldr     r1, [r1]
000cb018  blx     #0xddbfc ; -> objc_msgSend
000cb01c  cbz     r0, #0xcb068
000cb01e  ldr     r1, [pc, #0x1ec]
000cb020  ldr     r0, [r6]
000cb022  add     r1, pc ; -> 0x000fd670  
000cb024  ldr.w   r8, [r1]
000cb028  mov     r1, r5
000cb02a  blx     #0xddbfc ; -> objc_msgSend
000cb02e  ldr     r1, [pc, #0x1e0]
000cb030  add     r1, pc ; -> 0x000fd674  
000cb032  ldr     r1, [r1]
000cb034  blx     #0xddbfc ; -> objc_msgSend
000cb038  mov     r1, r8
000cb03a  mov     r2, r0
000cb03c  mov     r0, r4
000cb03e  blx     #0xddbfc ; -> objc_msgSend
000cb042  mov     r1, r5
000cb044  ldr     r0, [r6]
000cb046  blx     #0xddbfc ; -> objc_msgSend
000cb04a  ldr     r1, [pc, #0x1c8]
000cb04c  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000cb04e  ldr     r5, [r1]
000cb050  mov     r1, r5
000cb052  blx     #0xddbfc ; -> objc_msgSend
000cb056  ldr     r1, [pc, #0x1c0]
000cb058  ldr     r0, [r6]
000cb05a  add     r1, pc ; -> 0x000fd66c  
000cb05c  ldr     r1, [r1]
000cb05e  blx     #0xddbfc ; -> objc_msgSend
000cb062  mov     r1, r5
000cb064  blx     #0xddbfc ; -> objc_msgSend
000cb068  ldr     r3, [pc, #0x1b0]
000cb06a  add     r3, pc ; -> 0x000f914c  OBJC_IVAR_$_EAMTX_Controller.bForcePostEventsData
000cb06c  ldr     r3, [r3]
000cb06e  ldrb    r3, [r4, r3]
000cb070  cbnz    r3, #0xcb0a4
000cb072  ldr     r3, [pc, #0x1ac]
000cb074  add     r3, pc ; -> 0x000f332c  connectionType
000cb076  ldr     r3, [r3]
000cb078  ldr     r2, [r3]
000cb07a  ldr     r3, [pc, #0x1a8]
000cb07c  add     r3, pc ; -> 0x001809f4  
000cb07e  cmp     r2, r3
000cb080  bne     #0xcb088
000cb082  ldr     r3, [pc, #0x1a4]
000cb084  add     r3, pc ; -> 0x000f3328  eventsToPost
000cb086  b       #0xcb094
000cb088  ldr     r3, [pc, #0x1a0]
000cb08a  add     r3, pc ; -> 0x00180a04  
000cb08c  cmp     r2, r3
000cb08e  bne     #0xcb09a
000cb090  ldr     r3, [pc, #0x19c]
000cb092  add     r3, pc ; -> 0x000f3328  eventsToPost
000cb094  ldr     r2, [r3]
000cb096  movs    r3, #0xc8
000cb098  b       #0xcb0a2
000cb09a  ldr     r3, [pc, #0x198]
000cb09c  add     r3, pc ; -> 0x000f3328  eventsToPost
000cb09e  ldr     r2, [r3]
000cb0a0  movs    r3, #0x64
000cb0a2  str     r3, [r2]
000cb0a4  ldr     r3, [pc, #0x190]
000cb0a6  movs    r5, #0
000cb0a8  ldr     r0, [pc, #0x190]
000cb0aa  add     r3, pc ; -> 0x000f914c  OBJC_IVAR_$_EAMTX_Controller.bForcePostEventsData
000cb0ac  ldr     r2, [pc, #0x190]
000cb0ae  ldr     r3, [r3]
000cb0b0  add     r0, pc ; -> 0x0038c1d8  lastEventsSentTime
000cb0b2  movs    r1, #0
000cb0b4  strb    r5, [r4, r3]
000cb0b6  ldr     r3, [pc, #0x18c]
000cb0b8  add     r3, pc ; -> 0x000f9144  OBJC_IVAR_$_EAMTX_Controller.dEventsSendStartTime
000cb0ba  ldr     r3, [r3]
000cb0bc  add     r3, r4
000cb0be  stm.w   r3, {r1, r2}
000cb0c2  ldr     r0, [r0]
000cb0c4  cbz     r0, #0xcb0d0
000cb0c6  ldr     r1, [pc, #0x180]
000cb0c8  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cb0ca  ldr     r1, [r1]
000cb0cc  blx     #0xddbfc ; -> objc_msgSend
000cb0d0  ldr     r0, [pc, #0x178]
000cb0d2  ldr     r1, [pc, #0x17c]
000cb0d4  add     r0, pc ; -> 0x000fdbb4  
000cb0d6  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000cb0d8  ldr     r0, [r0]
000cb0da  ldr     r1, [r1]
000cb0dc  blx     #0xddbfc ; -> objc_msgSend
000cb0e0  ldr     r1, [pc, #0x170]
000cb0e2  ldr     r3, [pc, #0x174]
000cb0e4  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000cb0e6  add     r3, pc ; -> 0x0038c1d8  lastEventsSentTime
000cb0e8  ldr     r1, [r1]
000cb0ea  str     r0, [r3]
000cb0ec  blx     #0xddbfc ; -> objc_msgSend
000cb0f0  ldr     r1, [pc, #0x168]
000cb0f2  mov     r0, r4
000cb0f4  add     r1, pc ; -> 0x000fd788  
000cb0f6  ldr     r1, [r1]
000cb0f8  blx     #0xddbfc ; -> objc_msgSend
000cb0fc  cmp     r0, #0
000cb0fe  ble     #0xcb122
000cb100  ldr     r3, [pc, #0x15c]
000cb102  add     r3, pc ; -> 0x000f9158  OBJC_IVAR_$_EAMTX_Controller.mFreeSpace
000cb104  ldr     r3, [r3]
000cb106  add.w   r2, r4, r3
000cb10a  ldr     r1, [r4, r3]
000cb10c  ldr     r3, [r2, #4]
000cb10e  orrs    r1, r3
000cb110  beq     #0xcb122
000cb112  ldr     r1, [pc, #0x150]
000cb114  mov     r0, r4
000cb116  movs    r2, #1
000cb118  add     r1, pc ; -> 0x000fd6d4  
000cb11a  mov     r3, r5
000cb11c  ldr     r1, [r1]
000cb11e  blx     #0xddbfc ; -> objc_msgSend
000cb122  ldr     r3, [pc, #0x144]
000cb124  add     r3, pc ; -> 0x000f912c  OBJC_IVAR_$_EAMTX_Controller.iCurrState
000cb126  ldr     r3, [r3]
000cb128  ldr     r3, [r4, r3]
000cb12a  cmp     r3, #2
000cb12c  beq     #0xcb134
000cb12e  cmp     r3, #5
000cb130  beq     #0xcb174
000cb132  cbnz    r3, #0xcb188
000cb134  ldr     r5, [pc, #0x134]
000cb136  add     r5, pc ; -> 0x000f9150  OBJC_IVAR_$_EAMTX_Controller.bReceivedResponse
000cb138  ldr     r1, [r5]
000cb13a  ldrb    r6, [r4, r1]
000cb13c  cbnz    r6, #0xcb188
000cb13e  ldr     r3, [pc, #0x130]
000cb140  ldr     r1, [pc, #0x130]
000cb142  add     r3, pc ; -> 0x000f8c24  OBJC_IVAR_$_EAMTX_Controller.requestStartTime
000cb144  add     r1, pc ; -> 0x000fcef4  
000cb146  ldr     r3, [r3]
000cb148  ldr     r1, [r1]
000cb14a  ldr     r0, [r4, r3]
000cb14c  blx     #0xddbfc ; -> objc_msgSend
000cb150  vldr    d6, [pc, #0x3c]
000cb154  vmov    d7, r0, r1
000cb158  vcmp.f64 d7, d6
000cb15c  vmrs    apsr_nzcv, fpscr
000cb160  bpl     #0xcb188
000cb162  ldr     r3, [r5]
000cb164  movs    r2, #1
000cb166  movs    r0, #0x24
000cb168  mov     r1, r6
000cb16a  strb    r2, [r4, r3]
000cb16c  mov     r2, r6
000cb16e  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000cb172  b       #0xcb188
000cb174  ldr     r0, [pc, #0x100]
000cb176  add     r0, pc ; -> 0x00181664  
000cb178  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb17c  ldr     r1, [pc, #0xfc]
000cb17e  mov     r0, sl
000cb180  add     r1, pc ; -> 0x000fc9b0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x38
000cb182  ldr     r1, [r1]
000cb184  blx     #0xddbfc ; -> objc_msgSend
000cb188  pop.w   {r8, sl}
000cb18c  pop     {r4, r5, r6, r7, pc}
000cb18e  nop     
000cb190  movs    r0, r0
000cb192  movs    r0, r0
000cb194  movs    r0, r0
000cb196  stm     r0!, {r2, r6}
000cb198  b       #0xcb758
000cb19a  movs    r2, r0
000cb19c  strh    r0, [r0, #0x20]
000cb19e  movs    r2, r0
000cb1a0  b       #0xcb6f0
000cb1a2  movs    r2, r0
000cb1a4  ble     #0xcb290
000cb1a6  movs    r2, r0
000cb1a8  subs    r6, r3, r7
000cb1aa  movs    r3, r0
000cb1ac  b       #0xcb6f4
000cb1ae  movs    r2, r0
000cb1b0  cmp     r4, #0x90
000cb1b2  movs    r3, r0
000cb1b4  subs    r2, r2, r7
000cb1b6  movs    r3, r0
000cb1b8  adds    r6, #0xf4
000cb1ba  movs    r3, r1
000cb1bc  ble     #0xcb250
000cb1be  vtbl.8  d17, {d31, fpinst2, mvfr0, mvfr1}, d16
000cb1c2  movs    r3, r0
000cb1c4  ble     #0xcb1fc
000cb1c6  movs    r2, r0
000cb1c8  subs    r0, r0, r6
000cb1ca  movs    r3, r0
000cb1cc  subs    r0, r0, #7
000cb1ce  movs    r3, r0
000cb1d0  b       #0xcb604
000cb1d2  movs    r2, r0
000cb1d4  bgt     #0xcb1b0
000cb1d6  movs    r2, r0
000cb1d8  subs    r2, r2, r5
000cb1da  movs    r3, r0
000cb1dc  subs    r2, r7, r4
000cb1de  movs    r3, r0
000cb1e0  subs    r4, r7, #5
000cb1e2  movs    r3, r0
000cb1e4  b       #0xcb5b8
000cb1e6  movs    r2, r0
000cb1e8  b       #0xcb594
000cb1ea  movs    r2, r0
000cb1ec  asrs    r4, r2, #9
000cb1ee  movs    r4, r5
000cb1f0  subs    r2, r5, #5
000cb1f2  movs    r3, r0
000cb1f4  b       #0xcb508
000cb1f6  movs    r2, r0
000cb1f8  asrs    r4, r1, #8
000cb1fa  movs    r4, r5
000cb1fc  subs    r2, r3, #4
000cb1fe  movs    r3, r0
000cb200  strh    r6, [r3, #0x18]
000cb202  movs    r2, r0
000cb204  movs    r6, #0x54
000cb206  movs    r3, r0
000cb208  subs    r0, r5, r1
000cb20a  movs    r3, r0
000cb20c  movs    r6, #0x4a
000cb20e  movs    r3, r0
000cb210  movs    r6, #0x40
000cb212  movs    r3, r0
000cb214  subs    r4, r7, r0
000cb216  movs    r3, r0
000cb218  movs    r6, #0xe
000cb21a  movs    r3, r0
000cb21c  b       #0xcb3dc
000cb21e  movs    r2, r0
000cb220  strh    r4, [r6, #0x14]
000cb222  movs    r2, r0
000cb224  ldr     r4, [r6, r5]
000cb226  movs    r3, r1
000cb228  strh    r0, [r4, #0x14]
000cb22a  movs    r2, r0
000cb22c  ldr     r6, [r6, r5]
000cb22e  movs    r3, r1
000cb230  strh    r2, [r2, #0x14]
000cb232  movs    r2, r0
000cb234  strh    r0, [r1, #0x14]
000cb236  movs    r2, r0
000cb238  b       #0xcb378
000cb23a  movs    r2, r0
000cb23c  asrs    r4, r4, #4
000cb23e  movs    r4, r5
000cb240  movs    r0, r0
000cb242  hint    #0xf
000cb244  b       #0xcb358
000cb246  movs    r2, r0
000cb248  adds    r0, r6, r2
000cb24a  movs    r3, r0
000cb24c  cmp     r2, #0xdc
000cb24e  movs    r3, r0
000cb250  subs    r6, r5, r3
000cb252  movs    r3, r0
000cb254  subs    r0, r5, r7
000cb256  movs    r3, r0
000cb258  asrs    r6, r5, #3
000cb25a  movs    r4, r5
000cb25c  movs    r6, #0x90
000cb25e  movs    r3, r0
000cb260  b       #0xcb308
000cb262  movs    r2, r0
000cb264  movs    r5, #0xb8
000cb266  movs    r3, r0
000cb268  b       #0xcb274
000cb26a  movs    r2, r0
000cb26c  b       #0xcb29c
000cb26e  movs    r2, r0
000cb270  bge     #0xcb230
000cb272  movs    r2, r0
000cb274  adds    r4, r5, #6
000cb276  movs    r3, r0
000cb278  str     r2, [r5, #0x4c]
000cb27a  movs    r3, r1
000cb27c  adds    r4, r5, r0
000cb27e  movs    r3, r0
