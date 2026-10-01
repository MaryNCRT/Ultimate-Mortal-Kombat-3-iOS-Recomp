========================================================================
-[EAMTX_Controller stringURLEncode  0x000cc204  1000 bytes   EAMTX_Controller.mm
========================================================================

000cc204  push    {r4, r5, r6, r7, lr}
000cc206  add     r7, sp, #0xc
000cc208  push.w  {r8, sl, fp}
000cc20c  sub     sp, #0x78
000cc20e  ldr     r1, [pc, #0x340]
000cc210  mov     r0, r2
000cc212  movs    r2, #4
000cc214  add     r1, pc ; -> 0x000fcd20  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a8
000cc216  ldr.w   fp, [pc, #0x33c]
000cc21a  ldr     r1, [r1]
000cc21c  blx     #0xddbfc ; -> objc_msgSend
000cc220  ldr     r1, [pc, #0x334]
000cc222  ldr.w   r8, [pc, #0x338]
000cc226  add     fp, pc ; -> 0x00180b34  
000cc228  add     r1, pc ; -> 0x000fcb24  '\x1c=\x0e'
000cc22a  add     r8, pc ; -> 0x00181804  
000cc22c  ldr     r1, [r1]
000cc22e  movs    r5, #0
000cc230  mov     r2, r0
000cc232  ldr     r0, [pc, #0x32c]
000cc234  add     r0, pc ; -> 0x000fdbf8  
000cc236  ldr     r0, [r0]
000cc238  blx     #0xddbfc ; -> objc_msgSend
000cc23c  ldr     r1, [pc, #0x324]
000cc23e  add     r1, pc ; -> 0x000fd778  '\x1c\x06\x0f'
000cc240  ldr     r1, [r1]
000cc242  str     r1, [sp, #0xc]
000cc244  ldr     r1, [pc, #0x320]
000cc246  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000cc248  ldr.w   sl, [r1]
000cc24c  mov     r1, sl
000cc24e  mov     r4, r0
000cc250  blx     #0xddbfc ; -> objc_msgSend
000cc254  mov     r3, r8
000cc256  movs    r2, #1
000cc258  ldr     r1, [sp, #0xc]
000cc25a  str     r2, [sp]
000cc25c  mov     r2, fp
000cc25e  ldr.w   r8, [pc, #0x30c]
000cc262  ldr.w   fp, [pc, #0x30c]
000cc266  add     r8, pc ; -> 0x00181814  
000cc268  add     fp, pc ; -> 0x0017e8a4  
000cc26a  mov     r6, r0
000cc26c  mov     r0, r4
000cc26e  str     r5, [sp, #4]
000cc270  str     r6, [sp, #8]
000cc272  blx     #0xddbfc ; -> objc_msgSend
000cc276  mov     r1, sl
000cc278  mov     r0, r4
000cc27a  blx     #0xddbfc ; -> objc_msgSend
000cc27e  mov     r2, fp
000cc280  movs    r3, #1
000cc282  ldr     r1, [sp, #0xc]
000cc284  str     r3, [sp]
000cc286  mov     r3, r8
000cc288  ldr.w   fp, [pc, #0x2e8]
000cc28c  ldr.w   r8, [pc, #0x2e8]
000cc290  add     fp, pc ; -> 0x00181824  
000cc292  add     r8, pc ; -> 0x00181834  
000cc294  mov     r6, r0
000cc296  mov     r0, r4
000cc298  str     r5, [sp, #4]
000cc29a  str     r6, [sp, #8]
000cc29c  blx     #0xddbfc ; -> objc_msgSend
000cc2a0  mov     r1, sl
000cc2a2  mov     r0, r4
000cc2a4  blx     #0xddbfc ; -> objc_msgSend
000cc2a8  mov     r3, r8
000cc2aa  movs    r2, #1
000cc2ac  ldr     r1, [sp, #0xc]
000cc2ae  str     r2, [sp]
000cc2b0  mov     r2, fp
000cc2b2  mov     r6, r0
000cc2b4  mov     r0, r4
000cc2b6  str     r5, [sp, #4]
000cc2b8  str     r6, [sp, #8]
000cc2ba  blx     #0xddbfc ; -> objc_msgSend
000cc2be  mov     r1, sl
000cc2c0  mov     r0, r4
000cc2c2  blx     #0xddbfc ; -> objc_msgSend
000cc2c6  ldr     r6, [pc, #0x2b4]
000cc2c8  movs    r3, #0
000cc2ca  ldr     r5, [pc, #0x2b4]
000cc2cc  str     r3, [sp, #0x10]
000cc2ce  movs    r2, #1
000cc2d0  str     r2, [sp]
000cc2d2  add     r6, pc ; -> 0x0017fe54  
000cc2d4  add     r5, pc ; -> 0x00181844  
000cc2d6  ldr     r1, [sp, #0xc]
000cc2d8  str     r0, [sp, #0x14]
000cc2da  add     r2, sp, #0x10
000cc2dc  ldm     r2, {r2, r3}
000cc2de  mov     r0, r4
000cc2e0  str     r2, [sp, #4]
000cc2e2  str     r3, [sp, #8]
000cc2e4  mov     r2, r6
000cc2e6  mov     r3, r5
000cc2e8  blx     #0xddbfc ; -> objc_msgSend
000cc2ec  mov     r1, sl
000cc2ee  mov     r0, r4
000cc2f0  blx     #0xddbfc ; -> objc_msgSend
000cc2f4  ldr     r6, [pc, #0x28c]
000cc2f6  movs    r3, #0
000cc2f8  ldr     r5, [pc, #0x28c]
000cc2fa  str     r3, [sp, #0x18]
000cc2fc  movs    r2, #1
000cc2fe  str     r2, [sp]
000cc300  add     r6, pc ; -> 0x0017e794  
000cc302  add     r5, pc ; -> 0x00181854  
000cc304  ldr     r1, [sp, #0xc]
000cc306  str     r0, [sp, #0x1c]
000cc308  add     r2, sp, #0x18
000cc30a  ldm     r2, {r2, r3}
000cc30c  mov     r0, r4
000cc30e  str     r2, [sp, #4]
000cc310  str     r3, [sp, #8]
000cc312  mov     r2, r6
000cc314  mov     r3, r5
000cc316  blx     #0xddbfc ; -> objc_msgSend
000cc31a  mov     r1, sl
000cc31c  mov     r0, r4
000cc31e  blx     #0xddbfc ; -> objc_msgSend
000cc322  ldr     r6, [pc, #0x268]
000cc324  movs    r3, #0
000cc326  ldr     r5, [pc, #0x268]
000cc328  str     r3, [sp, #0x20]
000cc32a  movs    r2, #1
000cc32c  str     r2, [sp]
000cc32e  add     r6, pc ; -> 0x001809d4  
000cc330  add     r5, pc ; -> 0x00181864  
000cc332  ldr     r1, [sp, #0xc]
000cc334  str     r0, [sp, #0x24]
000cc336  add     r2, sp, #0x20
000cc338  ldm     r2, {r2, r3}
000cc33a  mov     r0, r4
000cc33c  str     r2, [sp, #4]
000cc33e  str     r3, [sp, #8]
000cc340  mov     r2, r6
000cc342  mov     r3, r5
000cc344  blx     #0xddbfc ; -> objc_msgSend
000cc348  mov     r1, sl
000cc34a  mov     r0, r4
000cc34c  blx     #0xddbfc ; -> objc_msgSend
000cc350  ldr     r6, [pc, #0x240]
000cc352  movs    r3, #0
000cc354  ldr     r5, [pc, #0x240]
000cc356  str     r3, [sp, #0x28]
000cc358  movs    r2, #1
000cc35a  str     r2, [sp]
000cc35c  add     r6, pc ; -> 0x0017f444  
000cc35e  add     r5, pc ; -> 0x00181874  
000cc360  ldr     r1, [sp, #0xc]
000cc362  str     r0, [sp, #0x2c]
000cc364  add     r2, sp, #0x28
000cc366  ldm     r2, {r2, r3}
000cc368  mov     r0, r4
000cc36a  str     r2, [sp, #4]
000cc36c  str     r3, [sp, #8]
000cc36e  mov     r2, r6
000cc370  mov     r3, r5
000cc372  blx     #0xddbfc ; -> objc_msgSend
000cc376  mov     r1, sl
000cc378  mov     r0, r4
000cc37a  blx     #0xddbfc ; -> objc_msgSend
000cc37e  ldr     r6, [pc, #0x21c]
000cc380  movs    r3, #0
000cc382  ldr     r5, [pc, #0x21c]
000cc384  str     r3, [sp, #0x30]
000cc386  movs    r2, #1
000cc388  str     r2, [sp]
000cc38a  add     r6, pc ; -> 0x0017ec04  
000cc38c  add     r5, pc ; -> 0x00181884  
000cc38e  ldr     r1, [sp, #0xc]
000cc390  str     r0, [sp, #0x34]
000cc392  add     r2, sp, #0x30
000cc394  ldm     r2, {r2, r3}
000cc396  mov     r0, r4
000cc398  str     r2, [sp, #4]
000cc39a  str     r3, [sp, #8]
000cc39c  mov     r2, r6
000cc39e  mov     r3, r5
000cc3a0  blx     #0xddbfc ; -> objc_msgSend
000cc3a4  mov     r1, sl
000cc3a6  mov     r0, r4
000cc3a8  blx     #0xddbfc ; -> objc_msgSend
000cc3ac  ldr     r6, [pc, #0x1f4]
000cc3ae  movs    r3, #0
000cc3b0  ldr     r5, [pc, #0x1f4]
000cc3b2  str     r3, [sp, #0x38]
000cc3b4  movs    r2, #1
000cc3b6  str     r2, [sp]
000cc3b8  add     r6, pc ; -> 0x0017ec14  
000cc3ba  add     r5, pc ; -> 0x00181894  
000cc3bc  ldr     r1, [sp, #0xc]
000cc3be  str     r0, [sp, #0x3c]
000cc3c0  add     r2, sp, #0x38
000cc3c2  ldm     r2, {r2, r3}
000cc3c4  mov     r0, r4
000cc3c6  str     r2, [sp, #4]
000cc3c8  str     r3, [sp, #8]
000cc3ca  mov     r2, r6
000cc3cc  mov     r3, r5
000cc3ce  blx     #0xddbfc ; -> objc_msgSend
000cc3d2  mov     r1, sl
000cc3d4  mov     r0, r4
000cc3d6  blx     #0xddbfc ; -> objc_msgSend
000cc3da  ldr     r6, [pc, #0x1d0]
000cc3dc  movs    r3, #0
000cc3de  ldr     r5, [pc, #0x1d0]
000cc3e0  str     r3, [sp, #0x40]
000cc3e2  movs    r2, #1
000cc3e4  str     r2, [sp]
000cc3e6  add     r6, pc ; -> 0x001818a4  
000cc3e8  add     r5, pc ; -> 0x001818b4  
000cc3ea  ldr     r1, [sp, #0xc]
000cc3ec  str     r0, [sp, #0x44]
000cc3ee  add     r2, sp, #0x40
000cc3f0  ldm     r2, {r2, r3}
000cc3f2  mov     r0, r4
000cc3f4  str     r2, [sp, #4]
000cc3f6  str     r3, [sp, #8]
000cc3f8  mov     r2, r6
000cc3fa  mov     r3, r5
000cc3fc  blx     #0xddbfc ; -> objc_msgSend
000cc400  mov     r1, sl
000cc402  mov     r0, r4
000cc404  blx     #0xddbfc ; -> objc_msgSend
000cc408  ldr     r6, [pc, #0x1a8]
000cc40a  movs    r3, #0
000cc40c  ldr     r5, [pc, #0x1a8]
000cc40e  str     r3, [sp, #0x48]
000cc410  movs    r2, #1
000cc412  str     r2, [sp]
000cc414  add     r6, pc ; -> 0x0017ffa4  
000cc416  add     r5, pc ; -> 0x001818c4  
000cc418  ldr     r1, [sp, #0xc]
000cc41a  str     r0, [sp, #0x4c]
000cc41c  add     r2, sp, #0x48
000cc41e  ldm     r2, {r2, r3}
000cc420  mov     r0, r4
000cc422  str     r2, [sp, #4]
000cc424  str     r3, [sp, #8]
000cc426  mov     r2, r6
000cc428  mov     r3, r5
000cc42a  blx     #0xddbfc ; -> objc_msgSend
000cc42e  mov     r1, sl
000cc430  mov     r0, r4
000cc432  blx     #0xddbfc ; -> objc_msgSend
000cc436  ldr     r6, [pc, #0x184]
000cc438  movs    r3, #0
000cc43a  ldr     r5, [pc, #0x184]
000cc43c  str     r3, [sp, #0x50]
000cc43e  movs    r2, #1
000cc440  str     r2, [sp]
000cc442  add     r6, pc ; -> 0x001818d4  
000cc444  add     r5, pc ; -> 0x001818e4  
000cc446  ldr     r1, [sp, #0xc]
000cc448  str     r0, [sp, #0x54]
000cc44a  add     r2, sp, #0x50
000cc44c  ldm     r2, {r2, r3}
000cc44e  mov     r0, r4
000cc450  str     r2, [sp, #4]
000cc452  str     r3, [sp, #8]
000cc454  mov     r2, r6
000cc456  mov     r3, r5
000cc458  blx     #0xddbfc ; -> objc_msgSend
000cc45c  mov     r1, sl
000cc45e  mov     r0, r4
000cc460  blx     #0xddbfc ; -> objc_msgSend
000cc464  ldr     r6, [pc, #0x15c]
000cc466  movs    r3, #0
000cc468  ldr     r5, [pc, #0x15c]
000cc46a  str     r3, [sp, #0x58]
000cc46c  movs    r2, #1
000cc46e  str     r2, [sp]
000cc470  add     r6, pc ; -> 0x001818f4  
000cc472  add     r5, pc ; -> 0x00181904  
000cc474  ldr     r1, [sp, #0xc]
000cc476  str     r0, [sp, #0x5c]
000cc478  add     r2, sp, #0x58
000cc47a  ldm     r2, {r2, r3}
000cc47c  mov     r0, r4
000cc47e  str     r2, [sp, #4]
000cc480  str     r3, [sp, #8]
000cc482  mov     r2, r6
000cc484  mov     r3, r5
000cc486  blx     #0xddbfc ; -> objc_msgSend
000cc48a  mov     r1, sl
000cc48c  mov     r0, r4
000cc48e  blx     #0xddbfc ; -> objc_msgSend
000cc492  ldr     r6, [pc, #0x138]
000cc494  movs    r3, #0
000cc496  ldr     r5, [pc, #0x138]
000cc498  str     r3, [sp, #0x60]
000cc49a  movs    r2, #1
000cc49c  str     r2, [sp]
000cc49e  add     r6, pc ; -> 0x0017ffb4  
000cc4a0  add     r5, pc ; -> 0x00181914  
000cc4a2  ldr     r1, [sp, #0xc]
000cc4a4  str     r0, [sp, #0x64]
000cc4a6  add     r2, sp, #0x60
000cc4a8  ldm     r2, {r2, r3}
000cc4aa  mov     r0, r4
000cc4ac  str     r2, [sp, #4]
000cc4ae  str     r3, [sp, #8]
000cc4b0  mov     r2, r6
000cc4b2  mov     r3, r5
000cc4b4  blx     #0xddbfc ; -> objc_msgSend
000cc4b8  mov     r1, sl
000cc4ba  mov     r0, r4
000cc4bc  blx     #0xddbfc ; -> objc_msgSend
000cc4c0  ldr     r6, [pc, #0x110]
000cc4c2  movs    r3, #0
000cc4c4  ldr     r5, [pc, #0x110]
000cc4c6  str     r3, [sp, #0x68]
000cc4c8  movs    r2, #1
000cc4ca  str     r2, [sp]
000cc4cc  add     r6, pc ; -> 0x0017ffc4  
000cc4ce  add     r5, pc ; -> 0x00181924  
000cc4d0  ldr     r1, [sp, #0xc]
000cc4d2  str     r0, [sp, #0x6c]
000cc4d4  add     r2, sp, #0x68
000cc4d6  ldm     r2, {r2, r3}
000cc4d8  mov     r0, r4
000cc4da  str     r2, [sp, #4]
000cc4dc  str     r3, [sp, #8]
000cc4de  mov     r2, r6
000cc4e0  mov     r3, r5
000cc4e2  blx     #0xddbfc ; -> objc_msgSend
000cc4e6  mov     r1, sl
000cc4e8  mov     r0, r4
000cc4ea  blx     #0xddbfc ; -> objc_msgSend
000cc4ee  ldr     r6, [pc, #0xec]
000cc4f0  movs    r3, #0
000cc4f2  ldr     r5, [pc, #0xec]
000cc4f4  str     r3, [sp, #0x70]
000cc4f6  movs    r2, #1
000cc4f8  str     r2, [sp]
000cc4fa  add     r6, pc ; -> 0x00181934  
000cc4fc  add     r5, pc ; -> 0x00181944  
000cc4fe  ldr     r1, [sp, #0xc]
000cc500  str     r0, [sp, #0x74]
000cc502  add     r2, sp, #0x70
000cc504  ldm     r2, {r2, r3}
000cc506  mov     r0, r4
000cc508  str     r2, [sp, #4]
000cc50a  str     r3, [sp, #8]
000cc50c  mov     r2, r6
000cc50e  mov     r3, r5
000cc510  blx     #0xddbfc ; -> objc_msgSend
000cc514  mov     r1, sl
000cc516  mov     r0, r4
000cc518  blx     #0xddbfc ; -> objc_msgSend
000cc51c  ldr     r6, [pc, #0xc4]
000cc51e  ldr     r5, [pc, #0xc8]
000cc520  movs    r3, #1
000cc522  add     r6, pc ; -> 0x00181954  
000cc524  add     r5, pc ; -> 0x00181964  
000cc526  str     r3, [sp]
000cc528  ldr     r1, [sp, #0xc]
000cc52a  mov     r2, r6
000cc52c  mov     r3, r5
000cc52e  mov.w   sl, #0
000cc532  mov     fp, r0
000cc534  mov     r0, r4
000cc536  str.w   sl, [sp, #4]
000cc53a  str.w   fp, [sp, #8]
000cc53e  blx     #0xddbfc ; -> objc_msgSend
000cc542  mov     r0, r4
000cc544  sub.w   sp, r7, #0x18
000cc548  pop.w   {r8, sl, fp}
000cc54c  pop     {r4, r5, r6, r7, pc}
000cc54e  nop     
000cc550  lsrs    r0, r1, #0xc
000cc552  movs    r3, r0
000cc554  ldr     r1, [pc, #0x28]
000cc556  movs    r3, r1
000cc558  lsrs    r0, r7, #3
000cc55a  movs    r3, r0
000cc55c  strb    r6, [r2, r7]
000cc55e  movs    r3, r1
000cc560  adds    r0, r0, r7
000cc562  movs    r3, r0
000cc564  asrs    r6, r6, #0x14
000cc566  movs    r3, r0
000cc568  lsrs    r6, r5, #0x20
000cc56a  movs    r3, r0
000cc56c  strb    r2, [r5, r6]
000cc56e  movs    r3, r1
000cc570  movs    r6, #0x38
000cc572  movs    r3, r1
000cc574  strb    r0, [r2, r6]
000cc576  movs    r3, r1
000cc578  strb    r6, [r3, r6]
000cc57a  movs    r3, r1
000cc57c  subs    r3, #0x7e
000cc57e  movs    r3, r1
000cc580  strb    r4, [r5, r5]
000cc582  movs    r3, r1
000cc584  movs    r4, #0x90
000cc586  movs    r3, r1
000cc588  strb    r6, [r1, r5]
000cc58a  movs    r3, r1
000cc58c  mov     sl, r4
000cc58e  movs    r3, r1
000cc590  strb    r0, [r6, r4]
000cc592  movs    r3, r1
000cc594  adds    r0, #0xe4
000cc596  movs    r3, r1
000cc598  strb    r2, [r2, r4]
000cc59a  movs    r3, r1
000cc59c  cmp     r0, #0x76
000cc59e  movs    r3, r1
000cc5a0  strb    r4, [r6, r3]
000cc5a2  movs    r3, r1
000cc5a4  cmp     r0, #0x58
000cc5a6  movs    r3, r1
000cc5a8  strb    r6, [r2, r3]
000cc5aa  movs    r3, r1
000cc5ac  strb    r2, [r7, r2]
000cc5ae  movs    r3, r1
000cc5b0  strb    r0, [r1, r3]
000cc5b2  movs    r3, r1
000cc5b4  subs    r3, #0x8c
000cc5b6  movs    r3, r1
000cc5b8  strb    r2, [r5, r2]
000cc5ba  movs    r3, r1
000cc5bc  strb    r6, [r1, r2]
000cc5be  movs    r3, r1
000cc5c0  strb    r4, [r3, r2]
000cc5c2  movs    r3, r1
000cc5c4  strb    r0, [r0, r2]
000cc5c6  movs    r3, r1
000cc5c8  strb    r6, [r1, r2]
000cc5ca  movs    r3, r1
000cc5cc  subs    r3, #0x12
000cc5ce  movs    r3, r1
000cc5d0  strb    r0, [r6, r1]
000cc5d2  movs    r3, r1
000cc5d4  subs    r2, #0xf4
000cc5d6  movs    r3, r1
000cc5d8  strb    r2, [r2, r1]
000cc5da  movs    r3, r1
000cc5dc  strb    r6, [r6, r0]
000cc5de  movs    r3, r1
000cc5e0  strb    r4, [r0, r1]
000cc5e2  movs    r3, r1
000cc5e4  strb    r6, [r5, r0]
000cc5e6  movs    r3, r1
000cc5e8  strb    r4, [r7, r0]
000cc5ea  movs    r3, r1
